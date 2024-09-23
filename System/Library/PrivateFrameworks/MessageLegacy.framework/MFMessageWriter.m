@implementation MFMessageWriter

- (MFMessageWriter)init
{
  return -[MFMessageWriter initWithCompositionSpecification:](self, "initWithCompositionSpecification:", 0);
}

- (MFMessageWriter)initWithCompositionSpecification:(id)a3
{
  MFMessageWriter *v4;
  MFMessageWriter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMessageWriter;
  v4 = -[MFMessageWriter init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[MFMessageWriter setAllowsQuotedPrintable:](v4, "setAllowsQuotedPrintable:", 1);
    v5->_messageClassToInstantiate = (Class)objc_opt_class();
    v5->_compositionSpecification = (NSDictionary *)objc_msgSend(a3, "copy");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMessageWriter;
  -[MFMessageWriter dealloc](&v3, sel_dealloc);
}

- (void)appendDataForMimePart:(id)a3 toData:(id)a4 withPartData:(id)a5
{
  char v9;
  id v10;
  const void *Value;
  uint64_t v12;
  id v13;

  v9 = objc_msgSend(CFSTR("multipart"), "isEqualToString:", objc_msgSend(a3, "type"));
  v10 = objc_alloc_init(MEMORY[0x1E0D46068]);
  v13 = v10;
  if ((v9 & 1) != 0
    || (Value = CFDictionaryGetValue((CFDictionaryRef)a5, a3), v10 = v13, Value)
    || (objc_msgSend(a3, "range", v13), v10 = v13, !v12))
  {
    _appendPartDataToConsumer((uint64_t)self, a3, (uint64_t)v10, (const __CFDictionary *)a5, 1);
  }
  else
  {
    objc_msgSend(a4, "setLength:", objc_msgSend(a4, "length", v13) - 1);
    _appendPartHeadersToConsumer((uint64_t)self, a3, (const __CFDictionary *)a5);
  }
  objc_msgSend(v13, "done");
  objc_msgSend(a4, "appendData:", objc_msgSend(v13, "data"));

}

- (id)createMessageWithString:(id)a3 headers:(id)a4
{
  __CFDictionary *Mutable;
  id PartAndDataForString;
  id OutgoingMessageFromTopLevelMimePart;

  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  PartAndDataForString = _createPartAndDataForString(a3, 0, CFSTR("plain"), Mutable);
  OutgoingMessageFromTopLevelMimePart = _createOutgoingMessageFromTopLevelMimePart((uint64_t)self, PartAndDataForString, a4, Mutable);

  CFRelease(Mutable);
  return OutgoingMessageFromTopLevelMimePart;
}

- (id)createMessageWithPlainTextDocumentsAndAttachments:(id)a3 headers:(id)a4
{
  __CFDictionary *Mutable;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id PlainTextPart;
  void *v14;
  void *v15;
  id OutgoingMessageFromTopLevelMimePart;
  id v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  v19 = objc_msgSend(a3, "count");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v8)
    goto LABEL_27;
  v18 = a4;
  v9 = 0;
  v10 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v21 != v10)
        objc_enumerationMutation(a3);
      v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        PlainTextPart = _createPlainTextPart(v12, Mutable);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!objc_msgSend(v12, "isPlaceholder", v18)
            || (v14 = (void *)objc_msgSend((id)objc_msgSend(v12, "mimePart"), "fileWrapperForcingDownload:", 1),
                objc_msgSend(v14, "setContentID:", objc_msgSend((id)objc_msgSend(v12, "fileWrapperForcingDownload:", 0), "contentID")), !v14))
          {
            v14 = (void *)objc_msgSend(v12, "fileWrapperForcingDownload:", 1);
            if (!v14)
            {
LABEL_18:

              v9 = 0;
              continue;
            }
          }
          PlainTextPart = _createPartForFileWrapper((uint64_t)self, v14, Mutable);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_18;
          PlainTextPart = _createPartForMFAttachment(self, v12, 0, Mutable);
        }
      }
      v15 = PlainTextPart;
      if (!PlainTextPart)
        goto LABEL_18;
      if (v9)
      {
        objc_msgSend(v9, "addSubpart:", PlainTextPart);
      }
      else if (v19 < 2)
      {
        v9 = PlainTextPart;
      }
      else
      {
        v9 = objc_alloc_init(MEMORY[0x1E0D460F0]);
        objc_msgSend(v9, "setType:", CFSTR("multipart"));
        objc_msgSend(v9, "setSubtype:", CFSTR("mixed"));
        objc_msgSend(v9, "addSubpart:", v15);
      }

    }
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v8);
  if (!v9)
  {
LABEL_27:
    OutgoingMessageFromTopLevelMimePart = 0;
    goto LABEL_28;
  }
  OutgoingMessageFromTopLevelMimePart = _createOutgoingMessageFromTopLevelMimePart((uint64_t)self, v9, v18, Mutable);

LABEL_28:
  CFRelease(Mutable);
  return OutgoingMessageFromTopLevelMimePart;
}

- (id)createMessageWithHtmlString:(id)a3 plainTextAlternative:(id)a4 otherHtmlStringsAndAttachments:(id)a5 headers:(id)a6
{
  return -[MFMessageWriter createMessageWithHtmlString:plainTextAlternative:otherHtmlStringsAndAttachments:charsets:headers:](self, "createMessageWithHtmlString:plainTextAlternative:otherHtmlStringsAndAttachments:charsets:headers:", a3, a4, a5, 0, a6);
}

- (id)createMessageWithHtmlString:(id)a3 plainTextAlternative:(id)a4 otherHtmlStringsAndAttachments:(id)a5 charsets:(id)a6 headers:(id)a7
{
  __CFDictionary *Mutable;
  uint64_t v11;
  id PartAndDataForString;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  void *v28;
  id PartForMFAttachment;
  BOOL v30;
  int v31;
  int v32;
  void *v33;
  BOOL v34;
  id v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _BOOL4 v41;
  char v42;
  void *v43;
  id v44;
  id v45;
  char v46;
  id v47;
  __CFDictionary *v48;
  id v49;
  void *v50;
  char v51;
  id OutgoingMessageFromTopLevelMimePart;
  void *v53;
  id v54;
  id v55;
  id v57;
  unint64_t v59;
  id v61;
  void *v62;
  __CFDictionary *cf;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  v61 = a3;
  if (a3)
  {
    if (objc_msgSend(a6, "count"))
      v11 = objc_msgSend(a6, "objectAtIndex:", 0);
    else
      v11 = 0;
    if (v11 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
      v13 = 0;
    else
      v13 = (void *)v11;
    PartAndDataForString = _createPartAndDataForString(v61, v13, CFSTR("html"), Mutable);
  }
  else
  {
    PartAndDataForString = 0;
  }
  v59 = objc_msgSend(a5, "count");
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v14 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (!v14)
  {
    v40 = 0;
    v16 = 0;
    v41 = 1;
LABEL_76:
    v44 = PartAndDataForString;
    if (a4)
    {
LABEL_77:
      v45 = _createPlainTextPart(a4, Mutable);
      if (v45)
        v46 = v16;
      else
        v46 = 1;
      if ((v46 & 1) == 0)
      {
        v47 = v45;
        if (v44)
        {
          v48 = Mutable;
          v49 = objc_alloc_init(MEMORY[0x1E0D460F0]);
          objc_msgSend(v49, "setType:", CFSTR("multipart"));
          objc_msgSend(v49, "setSubtype:", CFSTR("alternative"));
          objc_msgSend(v49, "addSubpart:", v47);
          objc_msgSend(v49, "addSubpart:", v44);
          v50 = v49;
          Mutable = v48;
          v44 = v50;
        }
        else
        {
          v44 = v45;
        }
      }
    }
    goto LABEL_84;
  }
  v15 = v14;
  v57 = a4;
  cf = Mutable;
  v62 = 0;
  v16 = 0;
  v17 = 0;
  v18 = *(_QWORD *)v66;
  while (2)
  {
    v19 = 0;
    do
    {
      if (*(_QWORD *)v66 != v18)
        objc_enumerationMutation(a5);
      if ((v16 & 1) != 0)
      {
        v40 = v62;
        v41 = v62 == 0;
        v16 = 1;
        goto LABEL_72;
      }
      v20 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v19);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v17 + v19 + 1 >= (unint64_t)objc_msgSend(a6, "count"))
          v21 = 0;
        else
          v21 = objc_msgSend(a6, "objectAtIndex:", v17 + v19 + 1);
        if (v21 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
          v28 = 0;
        else
          v28 = (void *)v21;
        PartForMFAttachment = _createPartAndDataForString(v20, v28, CFSTR("html"), cf);
        goto LABEL_38;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = MFLogGeneral();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v24 = objc_msgSend(MEMORY[0x1E0CB3978], "callStackReturnAddresses");
          *(_DWORD *)buf = 138412802;
          v70 = (uint64_t)v20;
          v71 = 2112;
          v72 = v23;
          v73 = 2112;
          v74 = v24;
          v25 = v22;
          v26 = "*** BAD!!! Used old attachments for %@\n\n%@\n\n%@";
          v27 = 32;
LABEL_57:
          _os_log_impl(&dword_1C8839000, v25, OS_LOG_TYPE_INFO, v26, buf, v27);
          goto LABEL_58;
        }
        goto LABEL_58;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v37 = MFLogGeneral();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v70 = v38;
          v71 = 2048;
          v72 = (uint64_t)v20;
          v25 = v37;
          v26 = "*** Unexpected object <%@:%p>";
          v27 = 22;
          goto LABEL_57;
        }
LABEL_58:
        v16 = 0;
        goto LABEL_59;
      }
      if (v61)
        v30 = PartAndDataForString == 0;
      else
        v30 = 1;
      v31 = !v30;
      if (v62)
        v32 = 1;
      else
        v32 = v31;
      PartForMFAttachment = _createPartForMFAttachment(self, v20, v32, cf);
LABEL_38:
      v33 = PartForMFAttachment;
      if (v20)
        v34 = PartForMFAttachment == 0;
      else
        v34 = 0;
      v16 = v34;
      if (PartForMFAttachment)
      {
        if (PartAndDataForString)
        {
          if (v61)
          {
            v35 = v62;
            if (!v62)
            {
              v35 = objc_alloc_init(MEMORY[0x1E0D460F0]);
              objc_msgSend(v35, "setType:", CFSTR("multipart"));
              objc_msgSend(v35, "setSubtype:", CFSTR("related"));
              objc_msgSend(v35, "addSubpart:", PartAndDataForString);
            }
            v62 = v35;
            v36 = v35;
LABEL_53:
            objc_msgSend(v36, "addSubpart:", v33);
LABEL_54:

            goto LABEL_59;
          }
        }
        else
        {
          if (v59 < 2)
          {
            PartAndDataForString = PartForMFAttachment;
            goto LABEL_54;
          }
          PartAndDataForString = objc_alloc_init(MEMORY[0x1E0D460F0]);
          objc_msgSend(PartAndDataForString, "setType:", CFSTR("multipart"));
          objc_msgSend(PartAndDataForString, "setSubtype:", CFSTR("mixed"));
        }
        v36 = PartAndDataForString;
        goto LABEL_53;
      }
LABEL_59:
      ++v19;
    }
    while (v15 != v19);
    v39 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    v15 = v39;
    v17 += v19;
    if (v39)
      continue;
    break;
  }
  v40 = v62;
  v41 = v62 == 0;
  if (v62)
    v42 = v16;
  else
    v42 = 1;
  if ((v42 & 1) == 0)
  {
    v43 = (void *)objc_msgSend(v62, "firstChildPart");
    Mutable = cf;
    if (v43)
      objc_msgSend(v62, "setBodyParameter:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), objc_msgSend(v43, "type"), objc_msgSend(v43, "subtype")), CFSTR("type"));
    v16 = 0;
    v41 = 0;
    v44 = v62;
    a4 = v57;
    if (v57)
      goto LABEL_77;
    goto LABEL_84;
  }
LABEL_72:
  v44 = v40;
  Mutable = cf;
  a4 = v57;
  if (!v40)
    goto LABEL_76;
  if (v57)
    goto LABEL_77;
LABEL_84:
  if (v44)
    v51 = v16;
  else
    v51 = 1;
  if ((v51 & 1) != 0)
  {
    OutgoingMessageFromTopLevelMimePart = 0;
    if (!Mutable)
      goto LABEL_101;
LABEL_100:
    CFRelease(Mutable);
  }
  else
  {
    if (v41)
    {
      v53 = v40;
      v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v54, "addObject:", v44);
      while (objc_msgSend(v54, "count"))
      {
        v55 = (id)objc_msgSend(v54, "lastObject");
        objc_msgSend(v54, "removeLastObject");
        if (objc_msgSend((id)objc_msgSend(v55, "type"), "isEqualToString:", CFSTR("multipart")))
        {
          objc_msgSend(v54, "addObjectsFromArray:", objc_msgSend(v55, "subparts"));
        }
        else if ((objc_msgSend((id)objc_msgSend(v55, "disposition"), "isEqualToString:", CFSTR("attachment")) & 1) != 0
               || objc_msgSend((id)objc_msgSend(v55, "disposition"), "isEqualToString:", CFSTR("inline")))
        {
          objc_msgSend(v55, "setContentID:", 0);
        }

      }
      v40 = v53;
    }
    OutgoingMessageFromTopLevelMimePart = _createOutgoingMessageFromTopLevelMimePart((uint64_t)self, v44, a7, Mutable);
    if (Mutable)
      goto LABEL_100;
  }
LABEL_101:

  return OutgoingMessageFromTopLevelMimePart;
}

- (id)createMessageWithHtmlString:(id)a3 attachments:(id)a4 headers:(id)a5
{
  __CFDictionary *Mutable;
  id PartAndDataForString;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *PartForFileWrapper;
  id OutgoingMessageFromTopLevelMimePart;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  PartAndDataForString = _createPartAndDataForString(a3, 0, CFSTR("html"), Mutable);
  if (objc_msgSend(a4, "count"))
  {
    v11 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D460F0]), "init");
    objc_msgSend(v11, "setType:", CFSTR("multipart"));
    objc_msgSend(v11, "setSubtype:", CFSTR("mixed"));
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(a4);
          PartForFileWrapper = _createPartForFileWrapper((uint64_t)self, *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14), Mutable);
          if (PartForFileWrapper)
          {
            objc_msgSend(v11, "addSubpart:", PartForFileWrapper);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }
    objc_msgSend(v11, "addSubpart:", PartAndDataForString);

    if (v11)
    {
LABEL_12:
      OutgoingMessageFromTopLevelMimePart = _createOutgoingMessageFromTopLevelMimePart((uint64_t)self, v11, a5, Mutable);

      if (!Mutable)
        return OutgoingMessageFromTopLevelMimePart;
      goto LABEL_16;
    }
  }
  else
  {
    v11 = PartAndDataForString;
    if (PartAndDataForString)
      goto LABEL_12;
  }
  OutgoingMessageFromTopLevelMimePart = 0;
  if (Mutable)
LABEL_16:
    CFRelease(Mutable);
  return OutgoingMessageFromTopLevelMimePart;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (BOOL)allows8BitMimeParts
{
  return *((_BYTE *)self + 16) & 1;
}

- (void)setAllows8BitMimeParts:(BOOL)a3
{
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFE | a3;
}

- (BOOL)allowsBinaryMimeParts
{
  return (*((unsigned __int8 *)self + 16) >> 1) & 1;
}

- (void)setAllowsBinaryMimeParts:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFD | v3;
}

- (BOOL)allowsQuotedPrintable
{
  return (*((unsigned __int8 *)self + 16) >> 3) & 1;
}

- (void)setAllowsQuotedPrintable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xF7 | v3;
}

- (void)setWriteSizeDispositionParameter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFB | v3;
}

- (void)setMessageClassToInstantiate:(Class)a3
{
  if (self->_messageClassToInstantiate != a3)
  {
    if (!-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
      -[MFMessageWriter setMessageClassToInstantiate:].cold.1((uint64_t)a3);
    self->_messageClassToInstantiate = a3;
  }
}

- (id)delegate
{
  return self->_delegate;
}

- (NSDictionary)compositionSpecification
{
  return self->_compositionSpecification;
}

- (BOOL)shouldWriteAttachmentPlaceholders
{
  return self->_shouldWriteAttachmentPlaceholders;
}

- (void)setShouldWriteAttachmentPlaceholders:(BOOL)a3
{
  self->_shouldWriteAttachmentPlaceholders = a3;
}

- (void)setMessageClassToInstantiate:(uint64_t)a1 .cold.1(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = a1;
    _os_log_impl(&dword_1C8839000, v2, OS_LOG_TYPE_DEFAULT, "#Warning Must be called with a subclass of MFOutgoingMessage.  You provided %@", (uint8_t *)&v3, 0xCu);
  }
  __assert_rtn("-[MFMessageWriter setMessageClassToInstantiate:]", "MessageWriter.m", 1511, "0");
}

@end
