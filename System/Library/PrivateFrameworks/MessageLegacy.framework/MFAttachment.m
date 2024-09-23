@implementation MFAttachment

- (MFAttachment)initWithURL:(id)a3 attachmentManager:(id)a4
{
  MFAttachment *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFAttachment;
  v6 = -[MFAttachment init](&v8, sel_init);
  if (v6)
  {
    v6->_url = (NSURL *)a3;
    v6->_attachmentManager = (MFAttachmentManager *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFAttachment;
  -[MFAttachment dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> url=%@, path=%@, contentID=%@, mimeType=%@, mimePart=%@, isMailDrop=%d"), objc_opt_class(), self, -[MFAttachment url](self, "url"), -[MFAttachment path](self, "path"), -[MFAttachment contentID](self, "contentID"), -[MFAttachment mimeType](self, "mimeType"), -[MFAttachment part](self, "part"), -[MFAttachment isMailDrop](self, "isMailDrop"));
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[NSString isEqualToString:](-[MFAttachment contentID](self, "contentID"), "isEqualToString:", objc_msgSend(a3, "contentID"));
}

- (unint64_t)hash
{
  return -[NSString hash](-[MFAttachment contentID](self, "contentID"), "hash");
}

- (id)metadataValueForKey:(id)a3
{
  return -[MFAttachmentManager metadataForAttachment:forKey:](self->_attachmentManager, "metadataForAttachment:forKey:", self, a3);
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4
{
  -[MFAttachmentManager setMetadataForAttachment:toValue:forKey:](self->_attachmentManager, "setMetadataForAttachment:toValue:forKey:", self, a3, a4);
}

- (id)decodeFilterWithDataConsumer:(id)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int v15;
  MFAttachment *v16;
  __int16 v17;
  _BYTE v18[10];
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  MFMimePart *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[MFMimePart contentTransferEncoding](-[MFAttachment part](self, "part"), "contentTransferEncoding");
  if (-[MFAttachment isMailDrop](self, "isMailDrop") && !-[MFAttachment part](self, "part"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0D46058], "filterWithConsumer:", a3);
    v12 = MFLogGeneral();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      return v6;
    v15 = 138413570;
    v16 = self;
    v17 = 1024;
    *(_DWORD *)v18 = -[MFAttachment isDataAvailableLocally](self, "isDataAvailableLocally");
    *(_WORD *)&v18[4] = 1024;
    *(_DWORD *)&v18[6] = -[MFAttachment isContainedInRFC822](self, "isContainedInRFC822");
    v19 = 1024;
    v20 = -[MFAttachment isMailDrop](self, "isMailDrop");
    v21 = 2048;
    v22 = -[MFAttachment part](self, "part");
    v23 = 2114;
    v24 = v5;
    v8 = "#Attachments %@ performing no conversion (isDataAvailableLocally=%d, isContainedInRFC822=%d, isMailDrop=%d, par"
         "t=%p, contentTransferEncoding=%{public}@)";
    v9 = v12;
    v10 = 50;
    goto LABEL_10;
  }
  if (v5
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("7bit")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("8bit")) & 1) == 0
    && !objc_msgSend(v5, "isEqualToString:", CFSTR("binary")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("quoted-printable")))
    {
      v13 = (void *)objc_msgSend(MEMORY[0x1E0D46128], "filterWithConsumer:", a3);
      v6 = (void *)objc_msgSend(MEMORY[0x1E0D460A0], "filterWithConsumer:", v13);
      objc_msgSend(v13, "setForTextPart:", objc_msgSend((id)-[MFMimePart type](-[MFAttachment part](self, "part"), "type"), "isEqualToString:", CFSTR("text")));
      v14 = MFLogGeneral();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        return v6;
      v15 = 138412290;
      v16 = self;
      v8 = "#Attachments %@ quoted-printable";
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("base64")))
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0D46048], "filterWithConsumer:", a3);
      v14 = MFLogGeneral();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        return v6;
      v15 = 138412290;
      v16 = self;
      v8 = "#Attachments %@ base64";
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("x-uuencode")))
      {
        v6 = (void *)objc_msgSend(MEMORY[0x1E0D46058], "filterWithConsumer:", a3);
        v7 = MFLogGeneral();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          return v6;
        v15 = 138412546;
        v16 = self;
        v17 = 2114;
        *(_QWORD *)v18 = v5;
        v8 = "#Attachments %@ unknown encoding (contentTransferEncoding=%{public}@)";
        goto LABEL_9;
      }
      v6 = (void *)objc_msgSend(MEMORY[0x1E0D46150], "filterWithConsumer:", a3);
      v14 = MFLogGeneral();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        return v6;
      v15 = 138412290;
      v16 = self;
      v8 = "#Attachments %@ uuencode";
    }
    v9 = v14;
    v10 = 12;
    goto LABEL_10;
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0D460A0], "filterWithConsumer:", a3);
  v7 = MFLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = self;
    v17 = 2114;
    *(_QWORD *)v18 = v5;
    v8 = "#Attachments %@ stripping line endings (contentTransferEncoding=%{public}@)";
LABEL_9:
    v9 = v7;
    v10 = 22;
LABEL_10:
    _os_log_impl(&dword_1C8839000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, v10);
  }
  return v6;
}

- (void)fetchData
{
  -[MFAttachmentManager fetchDataForAttachment:](self->_attachmentManager, "fetchDataForAttachment:", self);
  -[NSProgress resume](-[MFAttachment downloadProgress](self, "downloadProgress"), "resume");
}

- (id)fetchLocalData
{
  return -[MFAttachment fetchLocalData:stripPrivateMetadata:](self, "fetchLocalData:stripPrivateMetadata:", 0, 0);
}

- (id)fetchLocalData:(id *)a3 stripPrivateMetadata:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  const __CFData *v10;
  const __CFData *v11;
  char *v12;
  _QWORD v14[6];

  v4 = a4;
  if (-[MFAttachment isContainedInRFC822](self, "isContainedInRFC822", a3)
    || -[MFAttachment isContainedInCompose](self, "isContainedInCompose"))
  {
    if (!self->_attachmentManager)
      self->_attachmentManager = (MFAttachmentManager *)+[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager");
    v6 = (void *)objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v7 = objc_alloc_init(MEMORY[0x1E0D46068]);
    v8 = objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -1);
    v9 = -[MFAttachment _dataProvider](self, "_dataProvider");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __EFPromiseAttachmentDataHandler_block_invoke;
    v14[3] = &unk_1E81CAB98;
    v14[4] = v7;
    v14[5] = v6;
    objc_msgSend(v9, "fetchDataForAttachment:consumer:progress:completion:", self, v7, v8, (id)objc_msgSend(v14, "copy"));
    v10 = (const __CFData *)objc_msgSend((id)objc_msgSend(v6, "future"), "result:", 0);
  }
  else
  {
    v10 = -[MFAttachment readFromDisk](self, "readFromDisk");
  }
  v11 = v10;
  if (-[__CFData length](v10, "length"))
  {
    if (v4 && -[MFAttachment isImageFile](self, "isImageFile"))
      v11 = _stripPrivateFileMetadata(v11);
    return -[MFAttachment filterData:](self, "filterData:", v11);
  }
  else
  {
    v12 = (char *)MFLogGeneral();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      -[MFAttachment fetchLocalData:stripPrivateMetadata:].cold.1(self, v12);
  }
  return v11;
}

- (id)fetchDataSynchronously:(id *)a3
{
  return -[MFAttachment fetchDataSynchronously:stripPrivateMetadata:](self, "fetchDataSynchronously:stripPrivateMetadata:", a3, 0);
}

- (id)fetchDataSynchronously:(id *)a3 stripPrivateMetadata:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  const __CFData *v8;
  void *v9;
  id v10;
  const __CFData *v11;
  id v12;
  id v13;
  NSObject *v14;
  _QWORD v16[7];
  void *v17;

  v4 = a4;
  v17 = 0;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[MFAttachment fetchDataSynchronously:stripPrivateMetadata:].cold.2(v7);
    v8 = -[MFAttachment fetchLocalData:stripPrivateMetadata:](self, "fetchLocalData:stripPrivateMetadata:", &v17, 0);
  }
  else
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v10 = -[MFAttachment fetchCompletionBlock](self, "fetchCompletionBlock");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__MFAttachment_fetchDataSynchronously_stripPrivateMetadata___block_invoke;
    v16[3] = &unk_1E81CAB70;
    v16[5] = v9;
    v16[6] = v10;
    v16[4] = self;
    -[MFAttachment setFetchCompletionBlock:](self, "setFetchCompletionBlock:", v16);
    -[MFAttachmentManager fetchDataSynchronouslyForAttachment:](self->_attachmentManager, "fetchDataSynchronouslyForAttachment:", self);
    v8 = (const __CFData *)objc_msgSend((id)objc_msgSend(v9, "future"), "result:", &v17);
  }
  v11 = v8;
  if (-[__CFData length](v8, "length"))
  {
    if (+[MFAttachmentPlaceholder isPlaceholderSerializedRepresentation:](MFAttachmentPlaceholder, "isPlaceholderSerializedRepresentation:", v11))
    {
      v12 = +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:](MFAttachmentPlaceholder, "placeholderFromSerializedRepresentation:", v11);
      if (v12)
      {
        v13 = v12;
        v11 = +[MFAttachmentPlaceholder dataForPlaceholder:](MFAttachmentPlaceholder, "dataForPlaceholder:", v12);
        -[MFAttachment setPlaceholder:](self, "setPlaceholder:", v13);
      }
    }
    if (v4 && -[MFAttachment isImageFile](self, "isImageFile"))
    {
      v11 = _stripPrivateFileMetadata(v11);
      if (!a3)
        return v11;
      goto LABEL_16;
    }
  }
  else
  {
    v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[MFAttachment fetchDataSynchronously:stripPrivateMetadata:].cold.1(self, (const char *)&v17);
      if (!a3)
        return v11;
      goto LABEL_16;
    }
  }
  if (a3)
LABEL_16:
    *a3 = v17;
  return v11;
}

uint64_t __60__MFAttachment_fetchDataSynchronously_stripPrivateMetadata___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, a3);
  if (a2)
    v7 = objc_msgSend(*(id *)(a1 + 32), "filterData:", a2);
  else
    v7 = 0;
  return objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v7, a3);
}

- (void)cancel
{
  -[MFAttachmentManager cancelFetchForAttachment:](self->_attachmentManager, "cancelFetchForAttachment:", self);
}

- (id)fetchDataToURL:(id *)a3
{
  id result;
  id v5;
  id v6;
  uint64_t v7;

  v7 = 0;
  if (-[MFAttachment isPlaceholder](self, "isPlaceholder", a3))
    return -[MFAttachmentPlaceholder fileURL](-[MFAttachment placeholder](self, "placeholder"), "fileURL");
  v5 = -[MFAttachment fetchDataSynchronously:](self, "fetchDataSynchronously:", &v7);
  result = +[MFAttachmentUtilities temporaryFileURLWithFileName:](MFAttachmentUtilities, "temporaryFileURLWithFileName:", -[MFAttachment fileName](self, "fileName"));
  if (result)
  {
    v6 = result;
    if (objc_msgSend(v5, "writeToURL:options:error:", result, 0, &v7))
      return v6;
    else
      return 0;
  }
  return result;
}

- (BOOL)isMailDrop
{
  return 0;
}

- (BOOL)isMailDropPhotoArchive
{
  return 0;
}

- (id)fetchPlaceholderData
{
  MFAttachmentPlaceholder *placeholder;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  char *v14;
  _QWORD v15[6];

  placeholder = self->_placeholder;
  if (placeholder)
    return -[MFAttachmentPlaceholder serializedRepresentation](placeholder, "serializedRepresentation");
  v5 = -[MFAttachment _dataProvider](self, "_dataProvider");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(-[MFAttachment _dataProvider](self, "_dataProvider"), "rawDataForContentID:", -[MFAttachment contentID](self, "contentID"));
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D46068]);
    v8 = objc_msgSend(MEMORY[0x1E0D46138], "rangedFilterWithConsumer:range:", v7, 0, 2100);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v10 = objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -1);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __EFPromiseAttachmentDataHandler_block_invoke;
    v15[3] = &unk_1E81CAB98;
    v15[4] = v7;
    v15[5] = v9;
    objc_msgSend(v5, "fetchDataForAttachment:consumer:progress:completion:", self, v8, v10, (id)objc_msgSend(v15, "copy"));
    v6 = objc_msgSend((id)objc_msgSend(v9, "future"), "result:", 0);
  }
  v11 = (void *)v6;
  if (v6)
  {
    v12 = +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:](MFAttachmentPlaceholder, "placeholderFromSerializedRepresentation:", v6);
    if (v12)
    {
      v13 = v12;

      self->_placeholder = (MFAttachmentPlaceholder *)v13;
    }
  }
  else
  {
    v14 = (char *)MFLogGeneral();
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
      -[MFAttachment fetchPlaceholderData].cold.1(self, v14);
    return 0;
  }
  return v11;
}

- (MFAttachmentPlaceholder)placeholder
{
  MFAttachmentPlaceholder *result;

  result = self->_placeholder;
  if (!result)
  {
    -[MFAttachment fetchPlaceholderData](self, "fetchPlaceholderData");
    return self->_placeholder;
  }
  return result;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("MFAttachmentIsPlaceholder"));
}

- (BOOL)isPlaceholder
{
  id v3;

  v3 = -[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentIsPlaceholder"));
  if (v3)
    return objc_msgSend(v3, "BOOLValue");
  else
    return -[MFAttachment placeholder](self, "placeholder") != 0;
}

- (NSProgress)downloadProgress
{
  NSProgress *result;
  unint64_t v4;
  uint64_t v5;
  void *v6;

  result = self->_downloadProgress;
  if (!result)
  {
    v4 = -[MFAttachment encodedFileSize](self, "encodedFileSize");
    if (v4)
      v5 = v4;
    else
      v5 = -1;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v5);
    if (-[MFAttachment isDataAvailableLocally](self, "isDataAvailableLocally"))
      objc_msgSend(v6, "setCompletedUnitCount:", v5);
    else
      objc_msgSend(v6, "pause");
    -[MFAttachment setDownloadProgress:](self, "setDownloadProgress:", v6);
    return self->_downloadProgress;
  }
  return result;
}

- (void)updateProgressWithCurrentBytes:(unint64_t)a3
{
  -[NSProgress setCompletedUnitCount:](self->_downloadProgress, "setCompletedUnitCount:", a3);
}

- (void)resetProgress
{
  -[MFAttachment setDownloadProgress:](self, "setDownloadProgress:", 0);
}

- (id)fileURL
{
  id result;

  result = -[MFAttachment path](self, "path");
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", -[MFAttachment path](self, "path"), 0);
  return result;
}

- (id)filterData:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("DisableAttachmentFilters")) & 1) == 0&& objc_msgSend(a3, "length")&& -[MFAttachment contentTypeConformsToEventVCS](self, "contentTypeConformsToEventVCS"))
  {
    return -[MFAttachment filterVCSData:](self, "filterVCSData:", a3);
  }
  else
  {
    return a3;
  }
}

- (id)filterVCSData:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend(a3, "rangeOfData:options:range:", objc_msgSend(CFSTR("\nVERSION:1.0"), "dataUsingEncoding:", 4), 0, 0, objc_msgSend(a3, "length"));
  v6 = 0;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v4;
    v8 = v5;
    v6 = (id)objc_msgSend(a3, "mutableCopy");
    objc_msgSend(v6, "replaceBytesInRange:withBytes:length:", v7 + 1, v8 - 1, objc_msgSend(CFSTR("VERSION:2.0"), "UTF8String"), objc_msgSend(CFSTR("VERSION:2.0"), "length"));
  }
  if (v6)
    return v6;
  else
    return a3;
}

- (id)filterICSData:(id)a3
{
  return a3;
}

- (BOOL)isAvailable
{
  return 1;
}

- (id)_dataProvider
{
  id v3;
  NSObject *v4;
  uint64_t v6;

  if (!-[MFAttachment url](self, "url"))
    return 0;
  v6 = 0;
  v3 = -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self->_attachmentManager, "_dataProviderForAttachmentURL:error:", -[MFAttachment url](self, "url"), &v6);
  if (v6)
  {
    v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[MFAttachment _dataProvider].cold.1(self, (const char *)&v6);
  }
  return v3;
}

- (BOOL)isDataAvailableLocally
{
  id v3;

  if (-[MFAttachment isContainedInRFC822](self, "isContainedInRFC822")
    || -[MFAttachment isContainedInCompose](self, "isContainedInCompose"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[MFAttachment fileURL](self, "fileURL");
    if (v3)
      LOBYTE(v3) = -[MFAttachmentDataProvider exists](+[MFAttachmentDataProvider dataProviderWithURL:](MFAttachmentDataProvider, "dataProviderWithURL:", v3), "exists");
  }
  return (char)v3;
}

- (NSString)inferredMimeType
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringForMimeTypeFromFileName:", -[MFAttachment fileName](self, "fileName"));
}

- (BOOL)isContainedInRFC822
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[MFAttachment _dataProvider](self, "_dataProvider"), "messageForAttachment:", self), "messageURL"), "scheme"), "isEqualToString:", CFSTR("x-attach-RFC822")) & 1) == 0)
  {
    v3 = -[MFMimePart parentPart](-[MFAttachment part](self, "part"), "parentPart");
    if (!v3)
      return v3;
    v4 = (void *)v3;
    while (1)
    {
      v5 = objc_msgSend(v4, "type");
      v6 = objc_msgSend(v4, "subtype");
      v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v5, v6);
      if (v5)
      {
        v8 = v7;
        if (!objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("message/rfc822"))
          || !objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("message/delivery-status")))
        {
          break;
        }
      }
      v3 = objc_msgSend(v4, "parentPart");
      v4 = (void *)v3;
      if (!v3)
        return v3;
    }
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)isContainedInCompose
{
  return -[NSString isEqualToString:](-[NSURL scheme](self->_url, "scheme"), "isEqualToString:", CFSTR("x-attach-compose"));
}

- (BOOL)isImageFile
{
  MFAttachment *v3;
  BOOL v4;

  v3 = (MFAttachment *)objc_alloc_init(MEMORY[0x1E0D46148]);
  -[MFAttachment setPathExtension:](v3, "setPathExtension:", -[NSString pathExtension](-[MFAttachment fileName](self, "fileName"), "pathExtension"));
  -[MFAttachment setFilename:](v3, "setFilename:", -[MFAttachment fileName](self, "fileName"));
  if (!MFGetTypeInfo())
  {
    if (!-[MFAttachment mimeType](self, "mimeType"))
      goto LABEL_3;
LABEL_5:
    v4 = -[NSString rangeOfString:options:](-[MFAttachment mimeType](self, "mimeType"), "rangeOfString:options:", CFSTR("image/"), 9) != 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_6;
  }
  self = v3;
  if (-[MFAttachment mimeType](v3, "mimeType"))
    goto LABEL_5;
LABEL_3:
  v4 = 0;
LABEL_6:

  return v4;
}

- (id)fileNameByStrippingZipIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = -[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentFileNameKey"));
  v5 = v4;
  if (v3 && !objc_msgSend((id)objc_msgSend(v4, "pathExtension"), "caseInsensitiveCompare:", CFSTR("zip")))
    return (id)objc_msgSend(v5, "stringByDeletingPathExtension");
  else
    return v5;
}

- (NSString)fileName
{
  return (NSString *)-[MFAttachment fileNameByStrippingZipIfNeeded:](self, "fileNameByStrippingZipIfNeeded:", 0);
}

- (void)setFileName:(id)a3
{
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", a3, CFSTR("MFAttachmentFileNameKey"));
  if (a3)
    -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", -[MFAttachmentManager _filePathForAttachment:](self->_attachmentManager, "_filePathForAttachment:", self), CFSTR("MFAttachmentPathKey"));
}

- (NSString)remoteImageFileName
{
  return (NSString *)-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentRemoteImageFileNameKey"));
}

- (void)setRemoteImageFileName:(id)a3
{
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", a3, CFSTR("MFAttachmentRemoteImageFileNameKey"));
  if (a3)
    -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", -[MFAttachmentManager _filePathForAttachment:](self->_attachmentManager, "_filePathForAttachment:", self), CFSTR("MFAttachmentPathKey"));
}

- (NSString)path
{
  return (NSString *)-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentPathKey"));
}

- (id)_fileUTTypeForFileName:(id)a3
{
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  const __CFString *PreferredIdentifierForTag;
  __CFString *v11;
  NSObject *v12;
  const __CFString *v13;
  __CFString *v14;
  NSObject *v15;
  NSObject *v17;
  NSObject *v18;
  NSString *v19;
  int v20;
  id v21;
  __int16 v22;
  NSString *p_isa;
  __int16 v24;
  __CFString *v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = -[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentUTTypeKey"));
  if (v5)
  {
    v6 = v5;
    v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[MFAttachment _fileUTTypeForFileName:].cold.2((uint64_t)v6, self);
    goto LABEL_21;
  }
  v8 = -[MFAttachment mimeType](self, "mimeType");
  v9 = (__CFString *)objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "lowercaseString");
  if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("application/zip"))
    && (!v9 || -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("zip"))))
  {
    v9 = (__CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "stringByDeletingPathExtension"), "pathExtension"), "lowercaseString");
    if (!-[__CFString length](v9, "length"))
      v9 = CFSTR("zip");
  }
  if (-[__CFString length](v9, "length"))
  {
    PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], v9, 0);
    if (PreferredIdentifierForTag)
    {
      v11 = (__CFString *)PreferredIdentifierForTag;
      if (UTTypeIsDynamic(PreferredIdentifierForTag))
      {
        CFRelease(v11);
      }
      else
      {
        -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", v11, CFSTR("MFAttachmentUTTypeKey"));
        v6 = v11;
        v18 = MFLogGeneral();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v20 = 138413058;
          v21 = v6;
          v22 = 2112;
          p_isa = -[MFAttachment fileName](self, "fileName");
          v24 = 2112;
          v25 = v9;
          v26 = 2112;
          v27 = v8;
          _os_log_debug_impl(&dword_1C8839000, v18, OS_LOG_TYPE_DEBUG, "UTType [%@] for filename:[%@] via extension:[%@] mimeType:[%@]", (uint8_t *)&v20, 0x2Au);
        }
        CFRelease(v11);
        if (v6)
          goto LABEL_21;
      }
    }
  }
  else
  {
    v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[MFAttachment _fileUTTypeForFileName:].cold.1(self);
  }
  v13 = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A90], v8, 0);
  if (!v13)
  {
LABEL_18:
    v15 = MFLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v20 = 138412802;
      v21 = a3;
      v22 = 2112;
      p_isa = &v9->isa;
      v24 = 2112;
      v25 = v8;
      _os_log_error_impl(&dword_1C8839000, v15, OS_LOG_TYPE_ERROR, "#Attachments UTType for filename:[%@] extension:[%@] mimeType:[%@] indeterminate", (uint8_t *)&v20, 0x20u);
    }
    -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("MFAttachmentUTTypeKey"));
    v6 = 0;
    goto LABEL_21;
  }
  v14 = (__CFString *)v13;
  if (UTTypeIsDynamic(v13))
  {
    CFRelease(v14);
    goto LABEL_18;
  }
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", v14, CFSTR("MFAttachmentUTTypeKey"));
  v6 = v14;
  v17 = MFLogGeneral();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v19 = -[MFAttachment fileName](self, "fileName");
    v20 = 138413058;
    v21 = v6;
    v22 = 2112;
    p_isa = v19;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v8;
    _os_log_debug_impl(&dword_1C8839000, v17, OS_LOG_TYPE_DEBUG, "UTType [%@] for filename:[%@] extension:[%@] via mimeType:[%@]", (uint8_t *)&v20, 0x2Au);
  }
  CFRelease(v14);
  if (!v6)
    goto LABEL_18;
LABEL_21:
  if (v6 == (__CFString *)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
    return 0;
  else
    return v6;
}

- (NSString)fileUTType
{
  return (NSString *)-[MFAttachment _fileUTTypeForFileName:](self, "_fileUTTypeForFileName:", -[MFAttachment fileName](self, "fileName"));
}

- (id)attachmentContentTypeForFileName:(id)a3
{
  id result;

  result = -[MFAttachment _fileUTTypeForFileName:](self, "_fileUTTypeForFileName:", a3);
  if (!result)
    return (id)*MEMORY[0x1E0CA5BA0];
  return result;
}

- (NSString)contentID
{
  return (NSString *)-[MFAttachmentManager _contentIDForAttachment:](self->_attachmentManager, "_contentIDForAttachment:", self);
}

- (void)setContentID:(id)a3
{
  -[MFAttachmentManager setContentID:forAttachment:](self->_attachmentManager, "setContentID:forAttachment:", a3, self);
}

- (NSString)mimeType
{
  NSString *v3;
  NSString *v4;

  v3 = -[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentMimetypeKey"));
  if (objc_msgSend(-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentIsPlaceholder")), "BOOLValue"))
  {
    v4 = -[MFAttachmentPlaceholder mimeType](-[MFAttachment placeholder](self, "placeholder"), "mimeType");
    if (v4)
      return v4;
  }
  return v3;
}

- (void)setMimeType:(id)a3
{
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", a3, CFSTR("MFAttachmentMimetypeKey"));
}

- (unint64_t)decodedFileSize
{
  unint64_t v3;
  unint64_t v4;

  v3 = objc_msgSend(-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentDecodedFileSizeKey")), "unsignedIntegerValue");
  if (objc_msgSend(-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentIsPlaceholder")), "BOOLValue"))
  {
    v4 = -[MFAttachmentPlaceholder fileSize](-[MFAttachment placeholder](self, "placeholder"), "fileSize");
    if (v4)
      return v4;
  }
  return v3;
}

- (void)setDecodedFileSize:(unint64_t)a3
{
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3), CFSTR("MFAttachmentDecodedFileSizeKey"));
}

- (unint64_t)encodedFileSize
{
  unint64_t v3;
  unint64_t v4;

  v3 = objc_msgSend(-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentEncodedFileSizeKey")), "unsignedIntegerValue");
  if (objc_msgSend(-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentIsPlaceholder")), "BOOLValue"))
  {
    v4 = -[MFAttachmentPlaceholder fileSize](-[MFAttachment placeholder](self, "placeholder"), "fileSize");
    if (v4)
      return v4;
  }
  return v3;
}

- (void)setEncodedFileSize:(unint64_t)a3
{
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:"), CFSTR("MFAttachmentEncodedFileSizeKey"));
  -[NSProgress setTotalUnitCount:](-[MFAttachment downloadProgress](self, "downloadProgress"), "setTotalUnitCount:", a3);
}

- (BOOL)isCached
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;

  v3 = -[MFAttachment sizeOnDisk](self, "sizeOnDisk");
  v4 = -[MFAttachment decodedFileSize](self, "decodedFileSize");
  v5 = -[MFAttachment encodedFileSize](self, "encodedFileSize");
  if (v3)
    v6 = v3 >= v4;
  else
    v6 = 0;
  return v6 && v3 <= v5;
}

- (id)fileAttributes
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v4 = (void *)-[MFMimePart bodyParameterForKey:](-[MFAttachment part](self, "part"), "bodyParameterForKey:", CFSTR("x-unix-mode"));
  if (v4)
  {
    v5 = strtoul((const char *)objc_msgSend(v4, "ef_lossyDefaultCStringBytes"), 0, 8) & 0x1FF;
    if (v5)
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v5);
      objc_msgSend(v3, "setObject:forKey:", v6, *MEMORY[0x1E0CB2AA8]);
    }
  }
  return v3;
}

- (unint64_t)sizeOnDisk
{
  void *v2;
  unint64_t v3;
  uint64_t v5;

  v5 = 0;
  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", -[MFAttachment path](self, "path"), &v5);
  v3 = 0;
  if (!v5)
    return objc_msgSend((id)objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E0CB2AF0]), "unsignedIntegerValue");
  return v3;
}

- (void)writeToDiskWithData:(id)a3
{
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  NSObject *v17;
  MFAttachment *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  MFAttachment *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = -[MFAttachment path](self, "path");
  if (a3 && v5)
  {
    v6 = (void *)-[NSString copy](-[MFAttachment path](self, "path"), "copy");
    v7 = objc_msgSend(v6, "stringByDeletingLastPathComponent");
    if (v7)
    {
      v8 = v7;
      v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = 0;
      if (objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v20))
      {
        v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[MFAttachment fileAttributes](self, "fileAttributes"));
        objc_msgSend(v10, "setObject:forKey:", *MEMORY[0x1E0CB2AB8], *MEMORY[0x1E0CB2AD8]);
        if ((objc_msgSend(v9, "createFileAtPath:contents:attributes:", v6, a3, v10) & 1) != 0)
          goto LABEL_9;
        v11 = MFLogGeneral();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          goto LABEL_9;
        v12 = -[MFAttachment fileURL](self, "fileURL");
        v13 = objc_msgSend(v20, "ef_publicDescription");
        *(_DWORD *)buf = 138413058;
        v22 = (uint64_t)v6;
        v23 = 2048;
        v24 = self;
        v25 = 2112;
        v26 = (uint64_t)v12;
        v27 = 2114;
        v28 = v13;
        v14 = "#Attachments Failed to create path %@ for attachment [%p, %@]: %{public}@";
        v15 = v11;
        v16 = 42;
        goto LABEL_12;
      }
      v17 = MFLogGeneral();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = -[MFAttachment fileURL](self, "fileURL");
        v19 = objc_msgSend(v20, "ef_publicDescription");
        *(_DWORD *)buf = 138412802;
        v22 = v8;
        v23 = 2112;
        v24 = v18;
        v25 = 2114;
        v26 = v19;
        v14 = "#Attachments Failed to create directory %@ for attachment [%@]: %{public}@";
        v15 = v17;
        v16 = 32;
LABEL_12:
        _os_log_error_impl(&dword_1C8839000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
      }
    }
LABEL_9:

  }
}

- (id)readFromDisk
{
  void *v3;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!-[MFAttachment path](self, "path") || -[MFAttachment isContainedInRFC822](self, "isContainedInRFC822"))
    return 0;
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "isReadableFileAtPath:", objc_msgSend(-[MFAttachment fileURL](self, "fileURL"), "path")))
  {
    v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v7 = 138412290;
      *(_QWORD *)&v7[4] = -[MFAttachment fileURL](self, "fileURL");
      _os_log_impl(&dword_1C8839000, v6, OS_LOG_TYPE_INFO, "#Attachments Unable to read file URL [%@]", v7, 0xCu);
    }
    return 0;
  }
  *(_QWORD *)v7 = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", -[MFAttachment fileURL](self, "fileURL"), 3, v7);
  if (*(_QWORD *)v7)
  {
    v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[MFAttachment readFromDisk].cold.1(self, (const char *)v7);
  }
  return v3;
}

- (id)textEncodingNameForData:(id)a3 mimeType:(id)a4
{
  id result;
  const __CFAllocator *Default;
  const __CFAllocator *v9;
  CFStringRef v10;

  if (!a4)
    return 0;
  if (!strcmp("text/html", (const char *)objc_msgSend(a4, "UTF8String")))
  {
    Default = CFAllocatorGetDefault();
    v9 = (const __CFAllocator *)MFGetMappedAllocator();
    CFAllocatorSetDefault(v9);
    v10 = CFStringCreateWithBytes(v9, (const UInt8 *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0x8000100u, 0);
    CFAllocatorSetDefault(Default);
    if (v10)
    {
      CFRelease(v10);
      return CFSTR("UTF-8");
    }
    return 0;
  }
  if (!objc_msgSend(a4, "hasPrefix:", CFSTR("text/")))
    return 0;
  result = -[MFAttachment textEncodingGuessWithData:](self, "textEncodingGuessWithData:", a3);
  if (!result)
    return CFSTR("UTF-8");
  return result;
}

- (id)textEncodingGuessWithData:(id)a3
{
  const __CFString *v5;
  CFStringRef v6;
  CFStringEncoding v7;

  v5 = -[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("_MFAttachmentEncodingKey"));
  v6 = v5;
  if (a3 && !v5)
  {
    objc_msgSend(a3, "bytes");
    objc_msgSend(a3, "length");
    v7 = MFGuessEncodingForBytes();
    if (v7 == -1)
    {
      return 0;
    }
    else
    {
      v6 = CFStringConvertEncodingToIANACharSetName(v7);
      -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", v6, CFSTR("_MFAttachmentEncodingKey"));
    }
  }
  return (id)v6;
}

- (BOOL)conformsToType:(id)a3
{
  const __CFString *v4;

  v4 = -[MFAttachment fileUTType](self, "fileUTType");
  if (v4)
    LOBYTE(v4) = UTTypeConformsTo(v4, (CFStringRef)a3) != 0;
  return (char)v4;
}

- (BOOL)contentTypeConformsToVCard
{
  const __CFString *v2;

  v2 = -[MFAttachment fileUTType](self, "fileUTType");
  if (v2)
    LOBYTE(v2) = UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5CB0]) != 0;
  return (char)v2;
}

- (BOOL)contentTypeConformsToEvent
{
  _BOOL4 v3;

  if (-[MFAttachment contentTypeConformsToEventICS](self, "contentTypeConformsToEventICS")
    || (v3 = -[MFAttachment contentTypeConformsToEventVCS](self, "contentTypeConformsToEventVCS")))
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)contentTypeConformsToEventVCS
{
  return -[MFAttachment conformsToType:](self, "conformsToType:", CFSTR("com.apple.ical.vcs"));
}

- (BOOL)contentTypeConformsToEventICS
{
  return -[MFAttachment conformsToType:](self, "conformsToType:", CFSTR("com.apple.ical.ics"));
}

- (BOOL)contentTypeConformsToProvisionment
{
  const __CFString *v2;
  int v3;

  v2 = -[MFAttachment fileUTType](self, "fileUTType");
  if (UTTypeConformsTo(v2, CFSTR("com.apple.mobileconfig"))
    || UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5C08])
    || UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5CD0])
    || (v3 = UTTypeConformsTo(v2, CFSTR("com.apple.mobileprovision"))) != 0)
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)contentTypeConformsToMarkup
{
  const __CFString *v2;
  int v3;

  v2 = -[MFAttachment fileUTType](self, "fileUTType");
  if (UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5B90])
    || (v3 = UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5C00])) != 0)
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)contentTypeConformsToPassbook
{
  const __CFString *v2;
  int v3;

  v2 = -[MFAttachment fileUTType](self, "fileUTType");
  if (UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5A60])
    || (v3 = UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5A58])) != 0)
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)contentTypeConformsToIWork
{
  return -[NSString hasPrefix:](-[MFAttachment fileUTType](self, "fileUTType"), "hasPrefix:", CFSTR("com.apple.iwork"));
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (MFMimePart)part
{
  return self->_part;
}

- (void)setPart:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)disposition
{
  return self->_disposition;
}

- (void)setDisposition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isAutoArchive
{
  return self->_isAutoArchive;
}

- (void)setPlaceholder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setDownloadProgress:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (id)fetchCompletionBlock
{
  return self->_fetchCompletionBlock;
}

- (void)setFetchCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (MFDataConsumer)customConsumer
{
  return self->_customConsumer;
}

- (void)setCustomConsumer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (BOOL)wantsCompletionBlockOffMainThread
{
  return self->_wantsCompletionBlockOffMainThread;
}

- (void)setWantsCompletionBlockOffMainThread:(BOOL)a3
{
  self->_wantsCompletionBlockOffMainThread = a3;
}

- (MFAttachmentManager)attachmentManager
{
  return self->_attachmentManager;
}

- (void)setAttachmentManager:(id)a3
{
  self->_attachmentManager = (MFAttachmentManager *)a3;
}

- (unint64_t)lastProgressBytes
{
  return self->_lastProgressBytes;
}

- (void)setLastProgressBytes:(unint64_t)a3
{
  self->_lastProgressBytes = a3;
}

- (double)lastProgressTime
{
  return self->_lastProgressTime;
}

- (void)setLastProgressTime:(double)a3
{
  self->_lastProgressTime = a3;
}

- (void)fetchLocalData:(void *)a1 stripPrivateMetadata:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_7_0(a1, a2);
  OUTLINED_FUNCTION_4_0(&dword_1C8839000, v2, v3, "#Attachments Failed to fetch data for attachment [%@]", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_2_1();
}

- (void)fetchDataSynchronously:(void *)a1 stripPrivateMetadata:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_7_0(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1C8839000, v2, v3, "#Attachments Failed to fetch data for attachment [%@] due to %{public}@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_1();
}

- (void)fetchDataSynchronously:(os_log_t)log stripPrivateMetadata:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C8839000, log, OS_LOG_TYPE_DEBUG, "FIXME: calls that come from the main thread should use fetchLocalData", v1, 2u);
}

- (void)fetchPlaceholderData
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_7_0(a1, a2);
  OUTLINED_FUNCTION_4_0(&dword_1C8839000, v2, v3, "#Attachments Failed to fetch candidate placeholder contents for attachment [%@]", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_2_1();
}

- (void)_dataProvider
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_7_0(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1C8839000, v2, v3, "#Attachments Unable to obtain data provider for attachemnt [%@] due to %{public}@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_1();
}

- (void)_fileUTTypeForFileName:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "fileName");
  OUTLINED_FUNCTION_5_0(&dword_1C8839000, v1, v2, "UTType [%@] for filename:[%@] could not derive extension", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2_1();
}

- (void)_fileUTTypeForFileName:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a2, "fileName");
  OUTLINED_FUNCTION_5_0(&dword_1C8839000, v2, v3, "UTType [%@] for filename:[%@] via cache", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_2_1();
}

- (void)readFromDisk
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_7_0(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1C8839000, v2, v3, "#Attachments Unable to read file URL [%@] due to error: %{public}@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_1();
}

@end
