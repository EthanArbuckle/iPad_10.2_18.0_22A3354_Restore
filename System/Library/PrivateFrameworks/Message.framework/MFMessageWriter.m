@implementation MFMessageWriter

void ___ef_log_MFMessageWriter_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "MFMessageWriter");
  v1 = (void *)_ef_log_MFMessageWriter_log;
  _ef_log_MFMessageWriter_log = (uint64_t)v0;

}

- (MFMessageWriter)init
{
  return -[MFMessageWriter initWithCompositionSpecification:](self, "initWithCompositionSpecification:", 0);
}

- (MFMessageWriter)initWithCompositionSpecification:(id)a3
{
  id v4;
  MFMessageWriter *v5;
  MFMessageWriter *v6;
  uint64_t v7;
  NSDictionary *compositionSpecification;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFMessageWriter;
  v5 = -[MFMessageWriter init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MFMessageWriter setAllowsQuotedPrintable:](v5, "setAllowsQuotedPrintable:", 1);
    v6->_messageClassToInstantiate = (Class)objc_opt_class();
    v7 = objc_msgSend(v4, "copy");
    compositionSpecification = v6->_compositionSpecification;
    v6->_compositionSpecification = (NSDictionary *)v7;

  }
  return v6;
}

- (void)appendDataForMimePart:(id)a3 toData:(id)a4 withPartData:(id)a5
{
  id v8;
  const __CFDictionary *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  id key;

  key = a3;
  v8 = a4;
  v9 = (const __CFDictionary *)a5;
  objc_msgSend(key, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(CFSTR("multipart"), "isEqualToString:", v10);

  v12 = objc_alloc_init(MEMORY[0x1E0D46068]);
  if ((v11 & 1) != 0 || CFDictionaryGetValue(v9, key) || (objc_msgSend(key, "range"), !v14))
  {
    _appendPartDataToConsumer(self, key, v12, v9, 1);
  }
  else
  {
    objc_msgSend(v8, "setLength:", objc_msgSend(v8, "length") - 1);
    _appendPartHeadersToConsumer(self, key, v9, v12);
  }
  objc_msgSend(v12, "done");
  objc_msgSend(v12, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendData:", v13);

}

- (id)createMessageWithString:(id)a3 headers:(id)a4
{
  id v6;
  id v7;
  __CFDictionary *Mutable;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  _createPartAndDataForString(self, v6, 0, CFSTR("plain"), Mutable);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _createOutgoingMessageFromTopLevelMimePart(self, v9, v7, Mutable);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CFRelease(Mutable);
  return v10;
}

- (id)createMessageWithPlainTextDocumentsAndAttachments:(id)a3 headers:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  MFMessageWriter *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  id v25;
  unint64_t v26;
  id obj;
  __CFDictionary *cf;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25 = a4;
  v24 = v6;
  cf = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  v26 = objc_msgSend(v6, "count");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v7)
  {

    v22 = 0;
    v8 = 0;
    goto LABEL_32;
  }
  v8 = 0;
  v9 = *(_QWORD *)v30;
  do
  {
    v10 = 0;
    v11 = v8;
    do
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        _createPlainTextPart(self, v12, cf);
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v14 = (id)v13;
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_21;
        _createPartForMFAttachment(self, v12, 0, cf);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      v15 = self;
      v16 = v12;
      if (objc_msgSend(v16, "isPlaceholder"))
      {
        objc_msgSend(v16, "mimePart");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fileWrapperForcingDownload:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "fileWrapperForcingDownload:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "contentID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setContentID:", v20);

        if (v18)
          goto LABEL_13;
      }
      objc_msgSend(v16, "fileWrapperForcingDownload:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
LABEL_13:
        _createPartForFileWrapper(v15, v18, cf);
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }

LABEL_18:
      if (!v14)
      {
LABEL_21:

        v14 = 0;
        v8 = 0;
        goto LABEL_22;
      }
      if (v11)
      {
        objc_msgSend(v11, "addSubpart:", v14);
        v8 = v11;
      }
      else if (v26 < 2)
      {
        v14 = v14;
        v8 = v14;
      }
      else
      {
        v8 = objc_alloc_init(MEMORY[0x1E0D460F0]);
        objc_msgSend(v8, "setType:", CFSTR("multipart"));
        objc_msgSend(v8, "setSubtype:", CFSTR("mixed"));
        objc_msgSend(v8, "addSubpart:", v14);
      }
LABEL_22:

      ++v10;
      v11 = v8;
    }
    while (v7 != v10);
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v7 = v21;
  }
  while (v21);

  if (v8)
  {
    _createOutgoingMessageFromTopLevelMimePart(self, v8, v25, cf);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
LABEL_32:
  CFRelease(cf);

  return v22;
}

- (id)createMessageWithHtmlString:(id)a3 plainTextAlternative:(id)a4 otherHtmlStringsAndAttachments:(id)a5 headers:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v12, "ef_map:", &__block_literal_global_16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1E700], "mf_utf8HTMLStringWithString:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MFMessageWriter createMessageWithHTMLStringAndMIMECharset:plainTextAlternative:otherHtmlStringsAndAttachments:headers:](self, "createMessageWithHTMLStringAndMIMECharset:plainTextAlternative:otherHtmlStringsAndAttachments:headers:", v15, v11, v14, v13);

  return v16;
}

id __107__MFMessageWriter_createMessageWithHtmlString_plainTextAlternative_otherHtmlStringsAndAttachments_headers___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D1E700], "mf_utf8HTMLStringWithString:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

- (id)createMessageWithHTMLStringAndMIMECharset:(id)a3 plainTextAlternative:(id)a4 otherHtmlStringsAndAttachments:(id)a5 headers:(id)a6
{
  id v9;
  id v10;
  __CFDictionary *Mutable;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  BOOL v29;
  int v30;
  int v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  _BOOL4 v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  char v50;
  id v51;
  char v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  id v62;
  BOOL v64;
  id v65;
  id v66;
  unint64_t v67;
  void *v68;
  id obj;
  __CFDictionary *cf;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  id v79;
  __int16 v80;
  void *v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v66 = a4;
  v10 = a5;
  v65 = a6;
  v68 = v9;
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  if (v9)
  {
    objc_msgSend(v9, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "charset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _createPartAndDataForString(self, v12, v13, CFSTR("html"), Mutable);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  v67 = objc_msgSend(v10, "count");
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v10;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
  cf = Mutable;
  v64 = v15 != 0;
  if (v15)
  {
    v16 = 0;
    v17 = 0;
    v18 = *(_QWORD *)v73;
LABEL_6:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v73 != v18)
        objc_enumerationMutation(obj);
      if (v16)
        goto LABEL_61;
      v20 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v19);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        _ef_log_MFMessageWriter();
        v25 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v26 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackReturnAddresses");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v77 = v20;
          v78 = 2112;
          v79 = v26;
          v80 = 2112;
          v81 = v27;
          _os_log_impl(&dword_1A4F90000, v25, OS_LOG_TYPE_DEFAULT, "*** BAD!!! Used old attachments for %@\n\n%@\n\n%@", buf, 0x20u);

        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v28 = v20;
          if (v68)
            v29 = v14 == 0;
          else
            v29 = 1;
          v30 = !v29;
          if (v17)
            v31 = 1;
          else
            v31 = v30;
          _createPartForMFAttachment(self, v28, v31, cf);
          v32 = objc_claimAutoreleasedReturnValue();
LABEL_29:
          v24 = (id)v32;
LABEL_30:
          if (v24)
            v16 = 0;
          else
            v16 = v20 != 0;

          if (v24)
          {
            if (v14)
            {
              if (v68)
              {
                if (!v17)
                {
                  v33 = objc_alloc_init(MEMORY[0x1E0D460F0]);
                  objc_msgSend(v33, "setType:", CFSTR("multipart"));
                  objc_msgSend(v33, "setSubtype:", CFSTR("related"));
                  v17 = v33;
                  objc_msgSend(v33, "addSubpart:", v14);
                }
                objc_msgSend(v17, "addSubpart:", v24);
              }
              else
              {
                objc_msgSend(v14, "addSubpart:", v24);
              }
            }
            else if (v67 < 2)
            {
              v24 = v24;
              v14 = v24;
            }
            else
            {
              v34 = objc_alloc_init(MEMORY[0x1E0D460F0]);
              objc_msgSend(v34, "setType:", CFSTR("multipart"));
              objc_msgSend(v34, "setSubtype:", CFSTR("mixed"));
              v14 = v34;
              objc_msgSend(v34, "addSubpart:", v24);
            }
          }
          else
          {
            v24 = 0;
          }
          goto LABEL_44;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          _createPartForFileWrapper(self, v20, cf);
          v32 = objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
        _ef_log_MFMessageWriter();
        v25 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v35 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v77 = v35;
          v78 = 2048;
          v79 = v20;
          v36 = v35;
          _os_log_impl(&dword_1A4F90000, v25, OS_LOG_TYPE_DEFAULT, "*** Unexpected object <%@:%p>", buf, 0x16u);

        }
      }

      v24 = 0;
      v16 = 0;
LABEL_44:

      if (v15 == ++v19)
      {
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
        v15 = v37;
        if (v37)
          goto LABEL_6;

        v38 = v17 == 0;
        if (v17)
          v39 = v16;
        else
          v39 = 1;
        if (v17)
          v40 = v17;
        else
          v40 = v14;
        if ((v39 & 1) == 0)
        {
          objc_msgSend(v17, "firstChildPart");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v41;
          if (v41)
          {
            v43 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v41, "type");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "subtype");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringWithFormat:", CFSTR("%@/%@"), v44, v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setBodyParameter:forKey:", v46, CFSTR("type"));

          }
          v38 = 0;
          v16 = 0;
          v40 = v17;
        }
        goto LABEL_65;
      }
    }
    v21 = v20;
    objc_msgSend(v21, "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "charset");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _createPartAndDataForString(self, v22, v23, CFSTR("html"), cf);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_30;
  }
  v17 = 0;
LABEL_61:

  v38 = v17 == 0;
  if (v17)
    v40 = v17;
  else
    v40 = v14;
  v16 = v64;
LABEL_65:
  v47 = v40;
  if (v66)
  {
    _createPlainTextPart(self, v66, cf);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v48)
      v50 = v16;
    else
      v50 = 1;
    if ((v50 & 1) == 0)
    {
      if (v47)
      {
        v51 = objc_alloc_init(MEMORY[0x1E0D460F0]);
        objc_msgSend(v51, "setType:", CFSTR("multipart"));
        objc_msgSend(v51, "setSubtype:", CFSTR("alternative"));
        objc_msgSend(v51, "addSubpart:", v49);
        objc_msgSend(v51, "addSubpart:", v47);

        v47 = v51;
      }
      else
      {
        v49 = v48;
        v47 = v49;
      }
    }
  }
  else
  {
    v49 = 0;
  }
  if (v47)
    v52 = v16;
  else
    v52 = 1;
  if ((v52 & 1) != 0)
  {
    v53 = 0;
    goto LABEL_91;
  }
  if (!v38)
    goto LABEL_90;
  v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v54, "addObject:", v47);
  while (objc_msgSend(v54, "count"))
  {
    objc_msgSend(v54, "lastObject");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "removeLastObject");
    objc_msgSend(v55, "type");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "isEqualToString:", CFSTR("multipart"));

    if (v57)
    {
      objc_msgSend(v55, "subparts");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "addObjectsFromArray:", v58);

      goto LABEL_88;
    }
    objc_msgSend(v55, "disposition");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v59, "isEqualToString:", CFSTR("attachment")))
    {

    }
    else
    {
      objc_msgSend(v55, "disposition");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "isEqualToString:", CFSTR("inline"));

      if (!v61)
        goto LABEL_88;
    }
    objc_msgSend(v55, "setContentID:", 0);
LABEL_88:

  }
LABEL_90:
  _createOutgoingMessageFromTopLevelMimePart(self, v47, v65, cf);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_91:
  if (cf)
    CFRelease(cf);
  v62 = v53;

  return v62;
}

- (id)createMessageWithHtmlString:(id)a3 attachments:(id)a4 headers:(id)a5
{
  id v8;
  id v9;
  __CFDictionary *Mutable;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v21 = a5;
  v20 = v8;
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  _createPartAndDataForString(self, v8, 0, CFSTR("html"), Mutable);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v12 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D460F0]), "init", v8, v21);
    objc_msgSend(v12, "setType:", CFSTR("multipart"));
    objc_msgSend(v12, "setSubtype:", CFSTR("mixed"));
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v13);
          _createPartForFileWrapper(self, *(void **)(*((_QWORD *)&v22 + 1) + 8 * i), Mutable);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v12, "addSubpart:", v17);

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

    objc_msgSend(v12, "addSubpart:", v11);
    if (v12)
    {
LABEL_12:
      _createOutgoingMessageFromTopLevelMimePart(self, v12, v21, Mutable);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!Mutable)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else
  {
    v12 = v11;
    if (v12)
      goto LABEL_12;
  }
  v18 = 0;
  if (Mutable)
LABEL_16:
    CFRelease(Mutable);
LABEL_17:

  return v18;
}

- (void)appendHeadersForMimePart:(id)a3 toHeaders:(id)a4
{
  appendHeadersToMessageHeaders(self, a3, a4);
}

- (id)newDataForMimePart:(id)a3 withPartData:(id)a4
{
  return -[MFMessageWriter _newDataForMimePart:withPartData:andHeaders:](self, "_newDataForMimePart:withPartData:andHeaders:", a3, a4, 0);
}

- (id)_mimePartWithType:(id)a3 subtype:(id)a4 bodyData:(id)a5 partMap:(__CFDictionary *)a6 subparts:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setType:", v11);
  objc_msgSend(v15, "setSubtype:", v12);
  objc_msgSend(v15, "setSubparts:", v14);
  if (v13)
    CFDictionarySetValue(a6, v15, v13);

  return v15;
}

- (id)_newDataForMimePart:(id)a3 withPartData:(id)a4 andHeaders:(id)a5
{
  id v8;
  const __CFDictionary *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = (const __CFDictionary *)a4;
  v10 = a5;
  _makeOutgoingMessageBody(self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "message");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    v10 = (id)objc_opt_new();
  objc_msgSend(v12, "setMutableHeaders:", v10);
  if (_makeMimeHeadersConsistent(self, v8, v9) && (objc_msgSend(v13, "shouldCancel") & 1) == 0)
  {
    appendHeadersToMessageHeaders(self, v8, v10);
    _appendPartDataToConsumer(self, v8, v11, v9, 0);
    objc_msgSend(v11, "done");
    objc_msgSend(v12, "messageData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v12, "setMessageBody:", 0);

  return v14;
}

- (void)setDelegate:(id)a3
{
  id *p_delegate;
  id obj;

  p_delegate = &self->_delegate;
  obj = a3;
  objc_storeWeak(p_delegate, 0);
  objc_storeWeak(p_delegate, obj);

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
  return objc_loadWeakRetained(&self->_delegate);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositionSpecification, 0);
  objc_destroyWeak(&self->_delegate);
}

- (void)setMessageClassToInstantiate:(uint64_t)a1 .cold.1(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  _ef_log_MFMessageWriter();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = a1;
    _os_log_impl(&dword_1A4F90000, v2, OS_LOG_TYPE_DEFAULT, "#Warning Must be called with a subclass of MFOutgoingMessage.  You provided %@", (uint8_t *)&v3, 0xCu);
  }

  __assert_rtn("-[MFMessageWriter setMessageClassToInstantiate:]", "MessageWriter.m", 1473, "0");
}

@end
