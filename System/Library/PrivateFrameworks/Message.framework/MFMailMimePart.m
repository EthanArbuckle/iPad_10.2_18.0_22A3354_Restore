@implementation MFMailMimePart

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__MFMailMimePart_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_8 != -1)
    dispatch_once(&log_onceToken_8, block);
  return (id)log_log_8;
}

void __21__MFMailMimePart_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_8;
  log_log_8 = (uint64_t)v1;

}

- (id)decodeTextRichtext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  MFWebMessageDocument *v9;
  void *v10;
  MFWebMessageDocument *v11;

  _MFDecodeText();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D45F68]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringFromMimeRichTextString:asHTML:", v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [MFWebMessageDocument alloc];
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MFWebMessageDocument initWithMimePart:htmlData:encoding:](v9, "initWithMimePart:htmlData:encoding:", self, v10, 134217984);

  return v11;
}

- (id)decodeTextEnriched
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  MFWebMessageDocument *v9;
  void *v10;
  MFWebMessageDocument *v11;

  _MFDecodeText();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D45F68]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringFromMimeEnrichedString:asHTML:", v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [MFWebMessageDocument alloc];
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MFWebMessageDocument initWithMimePart:htmlData:encoding:](v9, "initWithMimePart:htmlData:encoding:", self, v10, 134217984);

  return v11;
}

- (id)decodeTextHtml
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  MFWebMessageDocument *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  unsigned __int8 v16;
  unint64_t v17;

  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordTransportType:", 1);

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = _MFOffsetFromThreadDictionary();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D45F78]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v17 = 0xAAAAAAAAAAAAAAAALL;
  v16 = 0;
  v9 = (void *)-[MFMailMimePart copyBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:](self, "copyBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:", v6, &v17, v8, &v16);
  if (v9)
  {
    v10 = -[MFWebMessageDocument initWithMimePart:htmlData:encoding:]([MFWebMessageDocument alloc], "initWithMimePart:htmlData:encoding:", self, v9, -[MFMailMimePart textEncoding](self, "textEncoding"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, *MEMORY[0x1E0D45F90]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v12, *MEMORY[0x1E0D45F80]);
  }
  else
  {
    +[MFMailMimePart log](MFMailMimePart, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MFMailMimePart decodeTextHtml].cold.1(v13);

    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1039, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setError:", v14);

    v10 = 0;
  }

  return v10;
}

- (id)htmlContentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5
{
  return -[MFMailMimePart contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:](self, "contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", a3, a4, a5, 1, 0);
}

- (id)htmlContentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4
{
  return -[MFMailMimePart htmlContentToOffset:resultOffset:downloadIfNecessary:](self, "htmlContentToOffset:resultOffset:downloadIfNecessary:", a3, a4, 1);
}

- (id)htmlContent
{
  return -[MFMailMimePart htmlContentToOffset:resultOffset:downloadIfNecessary:](self, "htmlContentToOffset:resultOffset:downloadIfNecessary:", 0x7FFFFFFFFFFFFFFFLL, 0, 1);
}

- (id)decodeTextPlain
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v13;
  int v14;

  v14 = -1431655766;
  v3 = (void *)_MFCopyDecodeText();
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D45F68]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  v13 = 0;
  if (v7)
    v8 = -[MFMimePart formatFlowedOptions](self, "formatFlowedOptions") | 0xC;
  else
    v8 = -[MFMimePart formatFlowedOptions](self, "formatFlowedOptions") | 4;
  objc_msgSend(v3, "mf_convertFromFlowedText:visuallyEmpty:", v8, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mf_dataUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_allocWithZone((Class)MFWebMessageDocument), "initWithMimePart:htmlData:encoding:", self, v10, 134217984);
  objc_msgSend(v11, "setVisuallyEmpty:", v13);

  return v11;
}

- (id)decodeMultipartAppledouble
{
  void *v2;
  void *v3;
  void *v4;

  -[MFMailMimePart firstChildPart](self, "firstChildPart");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextSiblingPart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileWrapperForcingDownload:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fileWrapperForDecodedObject:(id)a3 withFileData:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "fileWrapper");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MFMailMimePart;
    -[MFMailMimePart fileWrapperForDecodedObject:withFileData:](&v10, sel_fileWrapperForDecodedObject_withFileData_, v6, a4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (void)configureFileWrapper:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFMailMimePart;
  -[MFMailMimePart configureFileWrapper:](&v10, sel_configureFileWrapper_, v4);
  if (v4)
  {
    -[MFMailMimePart bodyParameterForKey:](self, "bodyParameterForKey:", *MEMORY[0x1E0D45F28]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_3;
    -[MFMailMimePart mimeBody](self, "mimeBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MFMailMimePart partNumber](self, "partNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("&aid=%@"), v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
      if (v9)
LABEL_3:
        objc_msgSend(v4, "setURL:", v5);
    }

  }
}

- (id)storeData:(id)a3 inMessage:(id)a4 isComplete:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  objc_msgSend(a4, "messageStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "storeData:forMimePart:isComplete:", v8, self, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_shouldContinueDecodingProcess
{
  void *v2;
  void *v3;
  BOOL v4;

  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

+ (BOOL)isRecognizedClassForContent:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___MFMailMimePart;
    v5 = objc_msgSendSuper2(&v7, sel_isRecognizedClassForContent_, v4);
  }

  return v5;
}

+ (Class)attachmentClass
{
  return (Class)objc_opt_class();
}

- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6 isComplete:(BOOL *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  void *v13;
  void *v14;
  MFContentErrorDocument *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  MFWebMessageDocument *v21;
  MFContentErrorDocument *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v8 = a6;
  v9 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recordTransportType:", 1);

  v29.receiver = self;
  v29.super_class = (Class)MFMailMimePart;
  -[MFMailMimePart contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:](&v29, sel_contentToOffset_resultOffset_downloadIfNecessary_asHTML_isComplete_, a3, a4, v9, v8, a7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = v24;
    v16 = -[MFContentErrorDocument countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (!v16)
      goto LABEL_20;
    v17 = *(_QWORD *)v26;
    while (1)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v19, "dataUsingEncoding:", 4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[MFWebMessageDocument initWithMimePart:htmlData:encoding:]([MFWebMessageDocument alloc], "initWithMimePart:htmlData:encoding:", self, v20, 134217984);

          if (v21)
            goto LABEL_14;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v22 = -[MFContentErrorDocument initWithMimePart:]([MFContentErrorDocument alloc], "initWithMimePart:", self);
          else
            v22 = v19;
          v21 = (MFWebMessageDocument *)v22;
          if (v22)
LABEL_14:
            objc_msgSend(v14, "addObject:", v21);
        }

      }
      v16 = -[MFContentErrorDocument countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (!v16)
      {
LABEL_20:

        goto LABEL_21;
      }
    }
  }
  if (-[MFMailMimePart _shouldContinueDecodingProcess](self, "_shouldContinueDecodingProcess"))
  {
    v15 = -[MFContentErrorDocument initWithMimePart:]([MFContentErrorDocument alloc], "initWithMimePart:", self);
    objc_msgSend(v14, "addObject:", v15);
    goto LABEL_20;
  }
LABEL_21:

  return v14;
}

- (id)decodeMessageRfc822
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MFRFC822AttachmentDataProvider *v9;
  void *v10;
  MFRFC822AttachmentDataProvider *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  unsigned __int8 v22;

  -[MFMailMimePart bodyData](self, "bodyData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[MFMessage messageWithRFC822Data:withParentPart:](MFMailMessage, "messageWithRFC822Data:withParentPart:", v3, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailMimePart mimeBody](self, "mimeBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "message");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setMessageURL:", v8);
      v9 = [MFRFC822AttachmentDataProvider alloc];
      objc_msgSend(v6, "topLevelPart");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[MFRFC822AttachmentDataProvider initWithMessageData:parentPart:](v9, "initWithMessageData:parentPart:", v3, v10);

      +[MFAttachmentManager allManagers](MFAttachmentManager, "allManagers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "anyObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addProvider:forBaseURL:", v11, v8);

    }
    v22 = 0;
    objc_msgSend(v4, "messageBody");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MFMailMimePart isGenerated](self, "isGenerated"))
    {
      objc_msgSend(v14, "contentToOffset:resultOffset:asHTML:isComplete:", 0x7FFFFFFFFFFFFFFFLL, 0, 1, &v22);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = v3;
      v22 = 1;
    }
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "threadDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v18, *MEMORY[0x1E0D45F80]);

    if (v14)
    {
      objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0D45F70]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLValue");

      if (v20)
        objc_msgSend(v17, "setObject:forKey:", v14, *MEMORY[0x1E0D45F88]);
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)decodeMessagePartial
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MFMailMimePart bodyParameterForKey:](self, "bodyParameterForKey:", CFSTR("number"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMimePart bodyParameterForKey:](self, "bodyParameterForKey:", CFSTR("total"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Partial message, part %@ of %@\nTo read this message, select all of the parts of the message and select the Message --> MIME --> Combine Messages menu item.\n"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)decodeTextHtml
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "Failed to decode text html due to missing data", v1, 2u);
}

@end
