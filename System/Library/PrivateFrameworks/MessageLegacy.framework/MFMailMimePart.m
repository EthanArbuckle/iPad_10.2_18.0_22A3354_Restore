@implementation MFMailMimePart

- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6 isComplete:(BOOL *)a7
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  MFWebMessageDocument *v14;
  MFWebMessageDocument *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)MFMailMimePart;
  v8 = -[MFMailMimePart contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:](&v21, sel_contentToOffset_resultOffset_downloadIfNecessary_asHTML_isComplete_, a3, a4, a5, a6, a7);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v8)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v8);
          v14 = *(MFWebMessageDocument **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = -[MFWebMessageDocument initWithMimePart:htmlData:encoding:]([MFWebMessageDocument alloc], "initWithMimePart:htmlData:encoding:", self, -[MFWebMessageDocument dataUsingEncoding:](v14, "dataUsingEncoding:", 4), 134217984);
            v15 = v14;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v14 = -[MFContentErrorDocument initWithMimePart:]([MFContentErrorDocument alloc], "initWithMimePart:", self);
          }
          if (v14)
            objc_msgSend(v9, "addObject:", v14);
        }
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v11);
    }
  }
  else if (-[MFMailMimePart _shouldContinueDecodingProcess](self, "_shouldContinueDecodingProcess"))
  {
    objc_msgSend(v9, "addObject:", -[MFContentErrorDocument initWithMimePart:]([MFContentErrorDocument alloc], "initWithMimePart:", self));
  }
  return v9;
}

- (id)decodeTextRichtext
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = _MFDecodeText();
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary");
  v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D45F68]), "BOOLValue");
  return -[MFWebMessageDocument initWithMimePart:htmlData:encoding:]([MFWebMessageDocument alloc], "initWithMimePart:htmlData:encoding:", self, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringFromMimeRichTextString:asHTML:", v3, v5), "dataUsingEncoding:", 4), 134217984);
}

- (id)decodeTextEnriched
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = _MFDecodeText();
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary");
  v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D45F68]), "BOOLValue");
  return -[MFWebMessageDocument initWithMimePart:htmlData:encoding:]([MFWebMessageDocument alloc], "initWithMimePart:htmlData:encoding:", self, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringFromMimeEnrichedString:asHTML:", v3, v5), "dataUsingEncoding:", 4), 134217984);
}

- (id)decodeTextHtml
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v11;
  uint64_t v12;

  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary");
  v4 = _MFOffsetFromThreadDictionary();
  v5 = objc_msgSend((id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D45F78]), "BOOLValue");
  v12 = 0;
  v11 = 0;
  v6 = (void *)-[MFMailMimePart copyBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:](self, "copyBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:", v4, &v12, v5, &v11);
  v7 = (id)objc_msgSend(objc_allocWithZone((Class)MFWebMessageDocument), "initWithMimePart:htmlData:encoding:", self, v6, -[MFMailMimePart textEncoding](self, "textEncoding"));

  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  objc_msgSend(v3, "setObject:forKey:", v8, *MEMORY[0x1E0D45F90]);
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  objc_msgSend(v3, "setObject:forKey:", v9, *MEMORY[0x1E0D45F80]);
  return v7;
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
  int v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  unsigned __int8 v11;
  int v12;

  v12 = 0;
  v3 = (void *)_MFCopyDecodeText();
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary");
  v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D45F68]), "BOOLValue");
  v11 = 0;
  v6 = _formatFlowedOptions(self);
  if (v5)
    v7 = 12;
  else
    v7 = 4;
  v8 = (void *)objc_msgSend(v3, "mf_convertFromFlowedText:visuallyEmpty:", v6 | v7, &v11);

  v9 = (void *)objc_msgSend(objc_allocWithZone((Class)MFWebMessageDocument), "initWithMimePart:htmlData:encoding:", self, objc_msgSend(v8, "mf_dataUsingEncoding:", 4), 134217984);
  objc_msgSend(v9, "setVisuallyEmpty:", v11);
  return v9;
}

- (id)decodeMultipartAppledouble
{
  return (id)objc_msgSend((id)objc_msgSend((id)-[MFMailMimePart firstChildPart](self, "firstChildPart"), "nextSiblingPart"), "fileWrapperForcingDownload:", 0);
}

- (id)fileWrapperForcingDownload:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v3 = a3;
  v5 = (void *)objc_msgSend((id)-[MFMailMimePart mimeBody](self, "mimeBody"), "message");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_5;
  v6 = (void *)objc_msgSend(v5, "performSelector:", sel__attachmentStorageLocation);
  if (!v6
    || (v7 = (void *)objc_msgSend(v6, "stringByAppendingPathComponent:", -[MFMailMimePart partNumber](self, "partNumber")), (v8 = -[MFMailMimePart attachmentFilename](self, "attachmentFilename")) == 0)|| (v9 = v8, v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D460C0]), "initWithPath:", objc_msgSend(v7, "stringByAppendingPathComponent:", v8)), objc_msgSend(v10, "setPreferredFilename:", v9), objc_msgSend(v10, "setFilename:", objc_msgSend(v10, "preferredFilename")), -[MFMailMimePart configureFileWrapper:](self, "configureFileWrapper:", v10), !v10))
  {
LABEL_5:
    v12.receiver = self;
    v12.super_class = (Class)MFMailMimePart;
    return -[MFMailMimePart fileWrapperForcingDownload:](&v12, sel_fileWrapperForcingDownload_, v3);
  }
  return v10;
}

- (id)fileWrapperForDecodedObject:(id)a3 withFileData:(id *)a4
{
  objc_super v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(a3, "fileWrapper");
  v8.receiver = self;
  v8.super_class = (Class)MFMailMimePart;
  return -[MFMailMimePart fileWrapperForDecodedObject:withFileData:](&v8, sel_fileWrapperForDecodedObject_withFileData_, a3, a4);
}

- (void)configureFileWrapper:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MFMailMimePart;
  -[MFMailMimePart configureFileWrapper:](&v13, sel_configureFileWrapper_);
  if (a3)
  {
    v5 = -[MFMailMimePart bodyParameterForKey:](self, "bodyParameterForKey:", *MEMORY[0x1E0D45F28]);
    if (v5
      || (v12 = (void *)objc_msgSend((id)objc_msgSend((id)-[MFMailMimePart mimeBody](self, "mimeBody"), "message"), "URL")) != 0&& (v5 = objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("&aid=%@"), -[MFMailMimePart partNumber](self, "partNumber"))) != 0)
    {
      objc_msgSend(a3, "setURL:", v5);
    }
  }
  if ((objc_msgSend(a3, "isPlaceholder") & 1) == 0)
  {
    v6 = (void *)objc_msgSend((id)-[MFMailMimePart mimeBody](self, "mimeBody"), "message");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_msgSend(v6, "performSelector:", sel__attachmentStorageLocation);
      if (v8)
      {
        v9 = (void *)objc_msgSend(v8, "stringByAppendingPathComponent:", -[MFMailMimePart partNumber](self, "partNumber"));
        if ((objc_msgSend(v7, "fileExistsAtPath:", v9) & 1) == 0)
          objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, 0);
        v10 = objc_msgSend(a3, "preferredFilename");
        if (v10)
        {
          v11 = objc_msgSend(v9, "stringByAppendingPathComponent:", v10);
          if ((objc_msgSend(v7, "fileExistsAtPath:", v11) & 1) == 0)
          {
            objc_msgSend(v7, "createFileAtPath:contents:attributes:", v11, objc_msgSend(a3, "regularFileContents"), objc_msgSend(a3, "fileAttributes"));
            objc_msgSend(a3, "setPath:", v11);
          }
        }
      }
    }
  }
}

- (id)storeData:(id)a3 inMessage:(id)a4 isComplete:(BOOL)a5
{
  return (id)objc_msgSend((id)objc_msgSend(a4, "messageStore"), "storeData:forMimePart:isComplete:", a3, self, a5);
}

- (BOOL)_shouldContinueDecodingProcess
{
  return objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "error") == 0;
}

+ (BOOL)isRecognizedClassForContent:(id)a3
{
  objc_super v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MFMailMimePart;
  return objc_msgSendSuper2(&v6, sel_isRecognizedClassForContent_, a3);
}

+ (Class)attachmentClass
{
  return (Class)objc_opt_class();
}

- (id)decodeMessageRfc822
{
  void *v3;
  MFMailMessage *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  MFRFC822AttachmentDataProvider *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unsigned __int8 v13;

  v3 = (void *)-[MFMailMimePart bodyData](self, "bodyData");
  if (v3)
  {
    v4 = +[MFMessage messageWithRFC822Data:withParentPart:](MFMailMessage, "messageWithRFC822Data:withParentPart:", v3, self);
    v5 = (void *)-[MFMailMimePart mimeBody](self, "mimeBody");
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend((id)objc_msgSend(v5, "message"), "messageURL");
      -[MFMailMessage setMessageURL:](v4, "setMessageURL:", v7);
      v8 = -[MFRFC822AttachmentDataProvider initWithMessageData:parentPart:]([MFRFC822AttachmentDataProvider alloc], "initWithMessageData:parentPart:", v3, objc_msgSend(v6, "topLevelPart"));
      objc_msgSend((id)objc_msgSend(+[MFAttachmentManager allManagers](MFAttachmentManager, "allManagers"), "anyObject"), "addProvider:forBaseURL:", v8, v7);

    }
    v13 = 0;
    v9 = (void *)-[MFMailMessage messageBody](v4, "messageBody");
    if (-[MFMailMimePart isGenerated](self, "isGenerated"))
      v3 = (void *)objc_msgSend(v9, "contentToOffset:resultOffset:asHTML:isComplete:", 0x7FFFFFFFFFFFFFFFLL, 0, 1, &v13);
    else
      v13 = 1;
    v10 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary");
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
    objc_msgSend(v10, "setObject:forKey:", v11, *MEMORY[0x1E0D45F80]);
    if (v9 && objc_msgSend((id)objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D45F70]), "BOOLValue"))
      objc_msgSend(v10, "setObject:forKey:", v9, *MEMORY[0x1E0D45F88]);
  }
  return v3;
}

- (id)decodeMessagePartial
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Partial message, part %@ of %@\nTo read this message, select all of the parts of the message and select the Message --> MIME --> Combine Messages menu item.\n"), -[MFMailMimePart bodyParameterForKey:](self, "bodyParameterForKey:", CFSTR("number")), -[MFMailMimePart bodyParameterForKey:](self, "bodyParameterForKey:", CFSTR("total")));
}

@end
