@implementation MFAttachment

- (MFAttachment)initWithURL:(id)a3 attachmentManager:(id)a4
{
  id v7;
  id v8;
  MFAttachment *v9;
  MFAttachment *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFAttachment;
  v9 = -[MFAttachment init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_attachmentManager, a4);
  }

  return v10;
}

- (NSString)ef_publicDescription
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  const __CFString *v14;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  if (v4)
  {
    -[MFAttachment url](self, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachment path](self, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachment contentID](self, "contentID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachment mimeType](self, "mimeType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachment part](self, "part");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p> url=%@, path=%@, contentID=%@, mimeType=%@, mimePart=%@, isMailDrop=%d"), v6, self, v7, v8, v9, v10, v11, -[MFAttachment isMailDrop](self, "isMailDrop"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MFAttachment contentID](self, "contentID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachment mimeType](self, "mimeType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachment disposition](self, "disposition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MFAttachment isMailDrop](self, "isMailDrop");
    -[MFAttachment path](self, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v14 = CFSTR("Has path");
    else
      v14 = CFSTR("Does not have path");
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p> contentID=%@, mimeType=%@, disposition=%@, isMailDrop=%d %@"), v6, self, v7, v8, v9, v13, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v12;
}

- (BOOL)isEqual:(id)a3
{
  MFAttachment *v4;
  MFAttachment *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (MFAttachment *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MFAttachment contentID](self, "contentID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAttachment contentID](v5, "contentID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MFAttachment contentID](self, "contentID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)metadataValueForKey:(id)a3
{
  -[MFAttachmentManager metadataForAttachment:forKey:](self->_attachmentManager, "metadataForAttachment:forKey:", self, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4
{
  -[MFAttachmentManager setMetadataForAttachment:toValue:forKey:](self->_attachmentManager, "setMetadataForAttachment:toValue:forKey:", self, a3, a4);
}

- (id)decodeFilterWithDataConsumer:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  int v9;
  char v10;
  id v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  int v25;
  MFAttachment *v26;
  __int16 v27;
  _BYTE v28[10];
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[MFAttachment part](self, "part");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentTransferEncoding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MFAttachment isMailDrop](self, "isMailDrop");
  if (v8)
  {
    -[MFAttachment part](self, "part");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_13;
  }
  v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("binary"));
  v10 = v9;
  if (!v8)
  {
    if (!v9)
      goto LABEL_5;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0D46058], "filterWithConsumer:", v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    MFLogGeneral();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = -[MFAttachment isDataAvailableLocally](self, "isDataAvailableLocally");
      v17 = -[MFAttachment isContainedInRFC822](self, "isContainedInRFC822");
      v18 = -[MFAttachment isMailDrop](self, "isMailDrop");
      -[MFAttachment part](self, "part");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138413570;
      v26 = self;
      v27 = 1024;
      *(_DWORD *)v28 = v16;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v17;
      v29 = 1024;
      v30 = v18;
      v31 = 2048;
      v32 = v19;
      v33 = 2114;
      v34 = v7;
      _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_DEFAULT, "#Attachments %@ performing no conversion (isDataAvailableLocally=%d, isContainedInRFC822=%d, isMailDrop=%d, part=%p, contentTransferEncoding=%{public}@)", (uint8_t *)&v25, 0x32u);

    }
    goto LABEL_15;
  }

  if ((v10 & 1) != 0)
    goto LABEL_13;
LABEL_5:
  if (!v7
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("7bit")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("8bit")))
  {
    objc_msgSend(MEMORY[0x1E0D460A0], "filterWithConsumer:", v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    MFLogGeneral();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412546;
      v26 = self;
      v27 = 2114;
      *(_QWORD *)v28 = v7;
      v13 = "#Attachments %@ stripping line endings (contentTransferEncoding=%{public}@)";
LABEL_10:
      v14 = v12;
      v15 = 22;
LABEL_11:
      _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v25, v15);
    }
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("quoted-printable")))
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("base64")))
      {
        objc_msgSend(MEMORY[0x1E0D46048], "filterWithConsumer:", v5);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        MFLogGeneral();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        v25 = 138412290;
        v26 = self;
        v13 = "#Attachments %@ base64";
      }
      else
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("x-uuencode")))
        {
          objc_msgSend(MEMORY[0x1E0D46058], "filterWithConsumer:", v5);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          MFLogGeneral();
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            goto LABEL_15;
          v25 = 138412546;
          v26 = self;
          v27 = 2114;
          *(_QWORD *)v28 = v7;
          v13 = "#Attachments %@ unknown encoding (contentTransferEncoding=%{public}@)";
          goto LABEL_10;
        }
        objc_msgSend(MEMORY[0x1E0D46150], "filterWithConsumer:", v5);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        MFLogGeneral();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        v25 = 138412290;
        v26 = self;
        v13 = "#Attachments %@ uuencode";
      }
      v14 = v12;
      v15 = 12;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0D46128], "filterWithConsumer:", v5);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D460A0], "filterWithConsumer:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachment part](self, "part");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "type");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setForTextPart:](v12, "setForTextPart:", objc_msgSend(v23, "isEqualToString:", CFSTR("text")));

    v11 = v21;
    MFLogGeneral();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412290;
      v26 = self;
      _os_log_impl(&dword_1A4F90000, v24, OS_LOG_TYPE_DEFAULT, "#Attachments %@ quoted-printable", (uint8_t *)&v25, 0xCu);
    }

  }
LABEL_15:

  return v11;
}

- (id)fetchData
{
  return -[MFAttachmentManager fetchDataForAttachment:](self->_attachmentManager, "fetchDataForAttachment:", self);
}

- (id)fetchLocalData
{
  return -[MFAttachment fetchLocalData:stripPrivateMetadata:](self, "fetchLocalData:stripPrivateMetadata:", 0, 0);
}

- (id)fetchLocalData:(id *)a3 stripPrivateMetadata:(BOOL)a4
{
  _BOOL4 v4;
  MFAttachmentManager *v6;
  MFAttachmentManager *attachmentManager;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v19;

  v4 = a4;
  if (-[MFAttachment isContainedInRFC822](self, "isContainedInRFC822", a3)
    || -[MFAttachment isContainedInCompose](self, "isContainedInCompose"))
  {
    if (!self->_attachmentManager)
    {
      +[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager");
      v6 = (MFAttachmentManager *)objc_claimAutoreleasedReturnValue();
      attachmentManager = self->_attachmentManager;
      self->_attachmentManager = v6;

    }
    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0D46068]);
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachment _dataProvider](self, "_dataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    EFPromiseAttachmentDataHandler(v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchDataForAttachment:consumer:progress:completion:", self, v9, v10, v12);

    objc_msgSend(v8, "future");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "result:", 0);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v14;
  }
  else
  {
    -[MFAttachment readFromDisk](self, "readFromDisk");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v15, "length"))
  {
    if (v4)
    {
      if (-[MFAttachment isImageFile](self, "isImageFile"))
      {
        _stripPrivateFileMetadata(v15);
        v16 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v16;
      }
    }
    -[MFAttachment filterData:](self, "filterData:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    return v17;
  }
  else
  {
    MFLogGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[MFAttachment fileURL](self, "fileURL");
      objc_claimAutoreleasedReturnValue();
      -[MFAttachment fetchLocalData:stripPrivateMetadata:].cold.1();
    }

    return v15;
  }
}

- (id)fetchDataSynchronously:(id *)a3
{
  return -[MFAttachment fetchDataSynchronously:stripPrivateMetadata:](self, "fetchDataSynchronously:stripPrivateMetadata:", a3, 0);
}

- (id)fetchDataSynchronously:(id *)a3 stripPrivateMetadata:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32[5];

  v4 = a4;
  v32[4] = *(id *)MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") || (EFIsRunningUnitTests() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachment fetchCompletionBlock](self, "fetchCompletionBlock");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __60__MFAttachment_fetchDataSynchronously_stripPrivateMetadata___block_invoke;
    v29[3] = &unk_1E4E8B800;
    v20 = v19;
    v31 = v20;
    v29[4] = self;
    v21 = v18;
    v30 = v21;
    -[MFAttachment setFetchCompletionBlock:](self, "setFetchCompletionBlock:", v29);
    -[MFAttachmentManager fetchDataSynchronouslyForAttachment:](self->_attachmentManager, "fetchDataSynchronouslyForAttachment:", self);
    objc_msgSend(v21, "future");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v22, "result:", &v28);
    v23 = objc_claimAutoreleasedReturnValue();
    v16 = v28;

    v17 = v23;
  }
  else
  {
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[MFAttachment fetchDataSynchronously:stripPrivateMetadata:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);

    v32[0] = 0;
    -[MFAttachment fetchLocalData:stripPrivateMetadata:](self, "fetchLocalData:stripPrivateMetadata:", v32, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v32[0];
    v17 = v15;
  }
  if (!-[NSObject length](v17, "length"))
  {
    MFLogGeneral();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      -[MFAttachment fileURL](self, "fileURL");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFAttachment fetchDataSynchronously:stripPrivateMetadata:].cold.1();
    }
    goto LABEL_17;
  }
  if (+[MFAttachmentPlaceholder isPlaceholderSerializedRepresentation:](MFAttachmentPlaceholder, "isPlaceholderSerializedRepresentation:", v17))
  {
    +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:](MFAttachmentPlaceholder, "placeholderFromSerializedRepresentation:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      +[MFAttachmentPlaceholder dataForPlaceholder:](MFAttachmentPlaceholder, "dataForPlaceholder:", v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v17 = v25;
      -[MFAttachment setPlaceholder:](self, "setPlaceholder:", v24);
    }

  }
  if (v4 && -[MFAttachment isImageFile](self, "isImageFile"))
  {
    _stripPrivateFileMetadata(v17);
    v26 = v17;
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_17:

  }
  if (a3)
    *a3 = objc_retainAutorelease(v16);

  return v17;
}

void __60__MFAttachment_fetchDataSynchronously_stripPrivateMetadata___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v11, v7, v8);
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "filterData:", v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v7, v8);

}

- (id)fetchDataToURL:(id *)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v12[7];

  v12[6] = *(id *)MEMORY[0x1E0C80C00];
  if (-[MFAttachment isPlaceholder](self, "isPlaceholder", a3))
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      -[MFAttachment fileName](self, "fileName");
      objc_claimAutoreleasedReturnValue();
      -[MFAttachment fetchDataToURL:].cold.1();
    }

    -[MFAttachment placeholder](self, "placeholder");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12[0] = 0;
    -[MFAttachment fetchDataSynchronously:](self, "fetchDataSynchronously:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v12[0];
    if (v7)
    {
      -[MFAttachment fileName](self, "fileName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFAttachmentUtilities writeData:toTemporaryFileURLWithFileName:](MFAttachmentUtilities, "writeData:toTemporaryFileURLWithFileName:", v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v9 = v9;
        v6 = v9;
      }
      else
      {
        MFLogGeneral();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v7, "length");
          -[MFAttachment fileName](self, "fileName");
          objc_claimAutoreleasedReturnValue();
          -[MFAttachment fetchDataToURL:].cold.3();
        }

        v6 = 0;
      }
    }
    else
    {
      MFLogGeneral();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        -[MFAttachment fileName](self, "fileName");
        objc_claimAutoreleasedReturnValue();
        -[MFAttachment fetchDataToURL:].cold.2();
      }
      v6 = 0;
    }

  }
  return v6;
}

- (id)fileWrapperUsingFetchedLocalData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3650]);
  -[MFAttachment fetchLocalData](self, "fetchLocalData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initRegularFileWithContents:", v4);

  -[MFAttachment fileName](self, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredFilename:", v6);

  return v5;
}

- (BOOL)isMailDrop
{
  void *v3;
  BOOL v4;
  void *v5;
  char v6;
  void *v7;

  -[NSURL scheme](self->_url, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("x-attach-maildrop")) & 1) != 0)
  {
    v4 = 1;
LABEL_6:

    return v4;
  }
  -[NSURL scheme](self->_url, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("x-attach-maildrop-image"));

  if ((v6 & 1) == 0)
  {
    -[MFAttachment mailDropMetadata](self, "mailDropMetadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "directUrl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7 != 0;

    goto LABEL_6;
  }
  return 1;
}

- (BOOL)isMailDropPhotoArchive
{
  void *v3;
  unint64_t v4;

  if (-[MFAttachment isMailDrop](self, "isMailDrop"))
  {
    -[MFAttachment mailDropMetadata](self, "mailDropMetadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = ((unint64_t)objc_msgSend(v3, "flags") >> 1) & 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)fetchPlaceholderData
{
  MFAttachmentPlaceholder *placeholder;
  MFAttachmentPlaceholder **p_placeholder;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  p_placeholder = &self->_placeholder;
  placeholder = self->_placeholder;
  if (placeholder)
  {
    -[MFAttachmentPlaceholder serializedRepresentation](placeholder, "serializedRepresentation");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MFAttachment _dataProvider](self, "_dataProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MFAttachment _dataProvider](self, "_dataProvider");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[MFAttachment contentID](self, "contentID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rawDataForContentID:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x1E0D46068]);
      objc_msgSend(MEMORY[0x1E0D46138], "rangedFilterWithConsumer:range:", v7, 0, 2100);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      EFPromiseAttachmentDataHandler(v10, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fetchDataForAttachment:consumer:progress:completion:", self, v8, v11, v12);

      objc_msgSend(v10, "future");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "result:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v9)
    {
      +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:](MFAttachmentPlaceholder, "placeholderFromSerializedRepresentation:", v9);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_storeStrong((id *)p_placeholder, v14);
    }
    else
    {
      MFLogGeneral();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[MFAttachment fileURL](self, "fileURL");
        objc_claimAutoreleasedReturnValue();
        -[MFAttachment fetchPlaceholderData].cold.1();
      }
    }

    return v9;
  }
}

- (MFAttachmentPlaceholder)placeholder
{
  void *v3;
  id v4;

  if (!self->_placeholder
    && +[MFAttachmentCapabilities placeholdersAvailable](MFAttachmentCapabilities, "placeholdersAvailable"))
  {
    -[NSURL scheme](self->_url, "scheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("x-attach-maildrop")) & 1) == 0)
      v4 = -[MFAttachment fetchPlaceholderData](self, "fetchPlaceholderData");

  }
  return self->_placeholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:");

}

- (BOOL)isPlaceholder
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentIsPlaceholder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    -[MFAttachment placeholder](self, "placeholder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (void)setMailDropMetadata:(id)a3
{
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", a3, CFSTR("MFAttachmentMailDropMetaData"));
}

- (EMMailDropMetadata)mailDropMetadata
{
  return (EMMailDropMetadata *)-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentMailDropMetaData"));
}

- (id)newDownloadProgress
{
  unint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = -[MFAttachment encodedFileSize](self, "encodedFileSize");
  if (v3)
    v4 = v3;
  else
    v4 = -1;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MFAttachment isDataAvailableLocally](self, "isDataAvailableLocally"))
    objc_msgSend(v5, "setCompletedUnitCount:", v4);
  return v5;
}

- (id)fileURL
{
  void *v3;
  void *v4;
  void *v5;

  -[MFAttachment path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    -[MFAttachment path](self, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:isDirectory:", v5, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)filterData:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("DisableAttachmentFilters"));

  v7 = v4;
  if ((v6 & 1) == 0)
  {
    v7 = v4;
    if (objc_msgSend(v4, "length"))
    {
      v7 = v4;
      if (-[MFAttachment contentTypeConformsToEventVCS](self, "contentTypeConformsToEventVCS"))
      {
        -[MFAttachment filterVCSData:](self, "filterVCSData:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v7;
}

- (id)filterVCSData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = a3;
  objc_msgSend(CFSTR("\nVERSION:1.0"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rangeOfData:options:range:", v4, 0, 0, objc_msgSend(v3, "length"));
  v7 = v6;

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v8 = (id)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v8, "replaceBytesInRange:withBytes:length:", v5 + 1, v7 - 1, objc_msgSend(CFSTR("VERSION:2.0"), "UTF8String"), objc_msgSend(CFSTR("VERSION:2.0"), "length"));
    if (v8)
    {
      v8 = v8;

      v3 = v8;
    }
  }

  return v3;
}

- (id)filterICSData:(id)a3
{
  return a3;
}

- (BOOL)isAvailable
{
  void *v3;
  void *v4;
  char v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  if (!-[MFAttachment isMailDrop](self, "isMailDrop"))
    return 1;
  -[MFAttachment mailDropMetadata](self, "mailDropMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MFAttachment mailDropMetadata](self, "mailDropMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isInvalid");

    v6 = v5 ^ 1;
  }
  else
  {
    v6 = 0;
  }

  -[MFAttachment mailDropMetadata](self, "mailDropMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[MFAttachment mailDropMetadata](self, "mailDropMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isExpired") & 1) != 0)
    {
      v10 = -[MFAttachment isCached](self, "isCached");

      return v10 & v6;
    }
    else
    {

    }
  }
  return v6;
}

- (BOOL)isCalendarFile
{
  void *v2;
  char v3;

  -[MFAttachment mimeType](self, "mimeType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("text/calendar"));

  return v3;
}

- (NSString)eventID
{
  return (NSString *)-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("_MFEventUniqueID"));
}

- (void)setEventID:(id)a3
{
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", a3, CFSTR("_MFEventUniqueID"));
}

- (NSString)meetingStorePersistentID
{
  return (NSString *)-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("_MFMeetingStorePersistentID"));
}

- (void)setMeetingStorePersistentID:(id)a3
{
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", a3, CFSTR("_MFMeetingStorePersistentID"));
}

- (NSString)icsRepresentation
{
  return (NSString *)-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("_MFICSRepresentation"));
}

- (void)setIcsRepresentation:(id)a3
{
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", a3, CFSTR("_MFICSRepresentation"));
}

- (BOOL)hasCalendarMetadata
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[MFAttachment icsRepresentation](self, "icsRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[MFAttachment eventID](self, "eventID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[MFAttachment meetingStorePersistentID](self, "meetingStorePersistentID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  return v4;
}

- (id)_dataProvider
{
  void *v3;
  MFAttachmentManager *attachmentManager;
  void *v5;
  id v6;
  NSObject *v7;
  id v9[5];

  v9[4] = *(id *)MEMORY[0x1E0C80C00];
  -[MFAttachment url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    attachmentManager = self->_attachmentManager;
    -[MFAttachment url](self, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 0;
    -[MFAttachmentManager _dataProviderForAttachmentURL:error:](attachmentManager, "_dataProviderForAttachmentURL:error:", v5, v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9[0];

    if (v6)
    {
      MFLogGeneral();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        -[MFAttachment fileURL](self, "fileURL");
        objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[MFAttachment _dataProvider].cold.1();
      }

    }
  }
  return v3;
}

- (BOOL)isDataAvailableLocally
{
  int v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[MFAttachment isContainedInRFC822](self, "isContainedInRFC822")
    || -[MFAttachment isContainedInCompose](self, "isContainedInCompose"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    -[MFAttachment fileURL](self, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[MFAttachmentDataProvider dataProviderWithURL:](MFAttachmentDataProvider, "dataProviderWithURL:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "exists");

    }
    else
    {
      v3 = 0;
    }
    MFLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[MFAttachment mimePartNumber](self, "mimePartNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAttachment fileURL](self, "fileURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      v14 = 1024;
      v15 = v3;
      _os_log_debug_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEBUG, "#Attachments Attachment '%{public}@' '%{public}@' has data available locally: %{BOOL}d", (uint8_t *)&v10, 0x1Cu);

    }
  }
  return v3;
}

- (BOOL)shouldAutoDownload
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  if (-[MFAttachment isDataAvailableLocally](self, "isDataAvailableLocally"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    -[MFAttachment _dataProvider](self, "_dataProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageForAttachment:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "messageStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "fetchLimits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && ((v9 = -[MFAttachment encodedFileSize](self, "encodedFileSize"), v9 > objc_msgSend(v8, "fetchMaxBytes"))
       || v9 > +[MFAttachmentCapabilities currentDownloadLimit](MFAttachmentCapabilities, "currentDownloadLimit"))|| -[MFAttachment isMailDrop](self, "isMailDrop"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v3 = objc_msgSend(v7, "connectionsAreConstrained") ^ 1;
    }

  }
  return v3;
}

- (NSString)inferredMimeType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[MFAttachment fileName](self, "fileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mf_stringForMimeTypeFromFileName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isContainedInRFC822
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[MFAttachment _dataProvider](self, "_dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageForAttachment:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "messageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("x-attach-RFC822"));

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[MFAttachment part](self, "part");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parentPart");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v10 != 0;
    if (v10)
    {
      while (1)
      {
        objc_msgSend(v10, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "subtype");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v11)
        {
          if (!objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("message/rfc822"))
            || !objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("message/delivery-status")))
          {
            break;
          }
        }
        objc_msgSend(v10, "parentPart");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v15 != 0;
        v10 = v15;
        if (!v15)
          goto LABEL_11;
      }

    }
    v15 = v10;
LABEL_11:

  }
  return v8;
}

- (BOOL)isContainedInCompose
{
  void *v2;
  char v3;

  -[NSURL scheme](self->_url, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("x-attach-compose"));

  return v3;
}

- (BOOL)isRFC822
{
  void *v2;
  void *v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  -[MFAttachment mimeType](self, "mimeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MFAttachment mimeType](self, "mimeType");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("message/rfc822")))
    {
      v6 = 1;
      goto LABEL_8;
    }
    -[MFAttachment mimeType](self, "mimeType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("message/delivery-status")))
    {
      v6 = 1;
LABEL_6:

LABEL_8:
      goto LABEL_9;
    }
  }
  -[MFAttachment fileName](self, "fileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "isEqualToString:", CFSTR("eml"));

  if (v5)
    goto LABEL_6;
LABEL_9:

  return v6;
}

- (BOOL)isImageFile
{
  return -[MFAttachment conformsToType:](self, "conformsToType:", *MEMORY[0x1E0CEC520]);
}

- (BOOL)isVideoFile
{
  return -[MFAttachment conformsToType:](self, "conformsToType:", *MEMORY[0x1E0CEC568]);
}

- (BOOL)isMediaFile
{
  return -[MFAttachment isImageFile](self, "isImageFile") || -[MFAttachment isVideoFile](self, "isVideoFile");
}

- (BOOL)isPDFFile
{
  return -[MFAttachment conformsToType:](self, "conformsToType:", *MEMORY[0x1E0CEC570]);
}

- (id)fileNameByStrippingZipIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  -[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentFileNameKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("zip"));

    if (!v7)
    {
      objc_msgSend(v5, "stringByDeletingPathExtension");
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }
  }
  return v5;
}

- (NSString)fileName
{
  return (NSString *)-[MFAttachment fileNameByStrippingZipIfNeeded:](self, "fileNameByStrippingZipIfNeeded:", 0);
}

- (void)setFileName:(id)a3
{
  id v4;

  v4 = a3;
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:");
  if (v4)
    -[MFAttachment updatePath](self, "updatePath");

}

- (NSString)remoteImageFileName
{
  return (NSString *)-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentRemoteImageFileNameKey"));
}

- (void)setRemoteImageFileName:(id)a3
{
  id v4;

  v4 = a3;
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:");
  if (v4)
    -[MFAttachment updatePath](self, "updatePath");

}

- (NSString)path
{
  return (NSString *)-[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentPathKey"));
}

- (void)updatePath
{
  id v3;

  -[MFAttachmentManager _filePathForAttachment:](self->_attachmentManager, "_filePathForAttachment:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:");

}

- (void)updatePathIfNeeded
{
  void *v3;

  -[MFAttachment path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[MFAttachment updatePath](self, "updatePath");
}

- (id)_fileUTTypeForFileName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentUTTypeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)objc_opt_class();
    -[MFAttachment mimeType](self, "mimeType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileTypeForFilename:mimeType:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", v5, CFSTR("MFAttachmentUTTypeKey"));
    }
    else if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", v9, CFSTR("MFAttachmentUTTypeKey"));

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v10)
  {

    v5 = 0;
  }

  return v5;
}

- (NSString)fileUTType
{
  void *v3;
  void *v4;

  -[MFAttachment fileName](self, "fileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachment _fileUTTypeForFileName:](self, "_fileUTTypeForFileName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)attachmentContentTypeForFileName:(id)a3
{
  void *v3;

  -[MFAttachment _fileUTTypeForFileName:](self, "_fileUTTypeForFileName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC528], "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
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
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentMimetypeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentIsPlaceholder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    -[MFAttachment placeholder](self, "placeholder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mimeType");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = v3;
    v10 = v9;

    v3 = v10;
  }
  return (NSString *)v3;
}

- (void)setMimeType:(id)a3
{
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", a3, CFSTR("MFAttachmentMimetypeKey"));
}

+ (BOOL)isSinglePagePDF:(id)a3
{
  const __CFData *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGDataProvider *v12;
  CGPDFDocument *v13;
  CGPDFDocument *v14;
  BOOL v15;

  v3 = (const __CFData *)a3;
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "em_lockdownModeEnabled"))
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[MFAttachment isSinglePagePDF:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    goto LABEL_10;
  }
  if (!v3)
  {
LABEL_10:
    v15 = 0;
    goto LABEL_15;
  }
  v12 = CGDataProviderCreateWithCFData(v3);
  v13 = CGPDFDocumentCreateWithProvider(v12);
  v14 = v13;
  if (v13)
  {
    v15 = CGPDFDocumentIsUnlocked(v13)
       && CGPDFDocumentGetNumberOfPages(v14) == 1
       && CGPDFDocumentGetPage(v14, 1uLL) != 0;
    CGPDFDocumentRelease(v14);
  }
  else
  {
    v15 = 0;
  }
  CGDataProviderRelease(v12);
LABEL_15:

  return v15;
}

- (BOOL)_isSinglePagePDFFileFetchLocalData:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  -[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentIsSinglePagePDFKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = objc_msgSend(v5, "BOOLValue");
    goto LABEL_13;
  }
  v8 = -[MFAttachment isPDFFile](self, "isPDFFile");
  v9 = -[MFAttachment isDataAvailableLocally](self, "isDataAvailableLocally");
  -[MFAttachment disposition](self, "disposition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (v8 && (v9 || v3))
      goto LABEL_6;
LABEL_8:
    v7 = 0;
    goto LABEL_11;
  }
  -[MFAttachment disposition](self, "disposition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("attachment")))
  {

    v7 = 0;
    goto LABEL_10;
  }

  if (!v8 || !v9 && !v3)
    goto LABEL_8;
LABEL_6:
  v12 = (void *)objc_opt_class();
  -[MFAttachment fetchLocalData](self, "fetchLocalData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v12, "isSinglePagePDF:", v10);
LABEL_10:

LABEL_11:
  if (v9 || !v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", v13, CFSTR("MFAttachmentIsSinglePagePDFKey"));

  }
LABEL_13:

  return v7;
}

- (BOOL)isSinglePagePDFFile
{
  return -[MFAttachment _isSinglePagePDFFileFetchLocalData:](self, "_isSinglePagePDFFileFetchLocalData:", 0);
}

- (unint64_t)decodedFileSize
{
  void *v3;
  unint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  -[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentDecodedFileSizeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  -[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentIsPlaceholder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    -[MFAttachment placeholder](self, "placeholder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fileSize");
    if (v8)
      v4 = v8;

  }
  return v4;
}

- (void)setDecodedFileSize:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:");

}

- (unint64_t)encodedFileSize
{
  void *v3;
  unint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  -[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentEncodedFileSizeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  -[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MFAttachmentIsPlaceholder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    -[MFAttachment placeholder](self, "placeholder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fileSize");
    if (v8)
      v4 = v8;

  }
  return v4;
}

- (void)setEncodedFileSize:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:");

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
  void *v5;
  unint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachment part](self, "part");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bodyParameterForKey:", CFSTR("x-unix-mode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = strtoul((const char *)objc_msgSend(objc_retainAutorelease(v5), "ef_lossyDefaultCStringBytes"), 0, 8) & 0x1FF;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x1E0CB2AA8]);

    }
  }

  return v3;
}

- (unint64_t)sizeOnDisk
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachment path](self, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "attributesOfItemAtPath:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "valueForKey:", *MEMORY[0x1E0CB2AF0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "unsignedIntegerValue");

  }
  return v7;
}

- (id)readFromDisk
{
  void *v3;
  BOOL v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11[5];

  v11[4] = *(id *)MEMORY[0x1E0C80C00];
  -[MFAttachment path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = -[MFAttachment isContainedInRFC822](self, "isContainedInRFC822");

  if (v4)
    return 0;
  v6 = (void *)MEMORY[0x1E0C99D50];
  -[MFAttachment fileURL](self, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = 0;
  objc_msgSend(v6, "dataWithContentsOfURL:options:error:", v7, 3, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11[0];

  if (!v8)
  {
    MFLogGeneral();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[MFAttachment fileURL](self, "fileURL");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFAttachment readFromDisk].cold.1();
    }

    v8 = 0;
  }

  return v8;
}

- (id)textEncodingNameForData:(id)a3 mimeType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  const __CFAllocator *Default;
  const __CFAllocator *v15;
  id v16;
  CFStringRef v17;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
    goto LABEL_9;
  v9 = objc_retainAutorelease(v7);
  if (!strcmp("text/html", (const char *)objc_msgSend(v9, "UTF8String")))
  {
    Default = CFAllocatorGetDefault();
    v15 = (const __CFAllocator *)MFGetMappedAllocator();
    CFAllocatorSetDefault(v15);
    v16 = objc_retainAutorelease(v6);
    v17 = CFStringCreateWithBytes(v15, (const UInt8 *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"), 0x8000100u, 0);
    CFAllocatorSetDefault(Default);
    if (v17)
    {
      CFRelease(v17);
      v13 = CFSTR("UTF-8");
      goto LABEL_10;
    }
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v9, "hasPrefix:", CFSTR("text/")))
    goto LABEL_9;
  -[MFAttachment textEncodingGuessWithData:](self, "textEncodingGuessWithData:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("UTF-8");
  if (v10)
    v12 = (__CFString *)v10;
  v13 = v12;

LABEL_10:
  return v13;
}

- (id)textEncodingGuessWithData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  CFStringEncoding v8;

  v4 = a3;
  -[MFAttachment metadataValueForKey:](self, "metadataValueForKey:", CFSTR("_MFAttachmentEncodingKey"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && !v5)
  {
    v7 = objc_retainAutorelease(v4);
    objc_msgSend(v7, "bytes");
    objc_msgSend(v7, "length");
    v8 = MFGuessEncodingForBytes();
    if (v8 == -1)
    {
      v6 = 0;
    }
    else
    {
      CFStringConvertEncodingToIANACharSetName(v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAttachment setMetadataValue:forKey:](self, "setMetadataValue:forKey:", v6, CFSTR("_MFAttachmentEncodingKey"));
    }
  }

  return v6;
}

- (BOOL)conformsToType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MFAttachment fileUTType](self, "fileUTType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CEC3F8];
    -[MFAttachment fileUTType](self, "fileUTType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "typeWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v5) = 0;
    if (v4 && v8)
      LOBYTE(v5) = objc_msgSend(v8, "conformsToType:", v4);
  }
  else
  {
    v8 = 0;
  }

  return (char)v5;
}

- (BOOL)conformsToTypeIdentifier:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MFAttachment conformsToType:](self, "conformsToType:", v4);

  return (char)self;
}

- (BOOL)contentTypeConformsToVCard
{
  return -[MFAttachment conformsToType:](self, "conformsToType:", *MEMORY[0x1E0CEC638]);
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
  return -[MFAttachment conformsToTypeIdentifier:](self, "conformsToTypeIdentifier:", CFSTR("com.apple.ical.vcs"));
}

- (BOOL)contentTypeConformsToEventICS
{
  return -[MFAttachment conformsToTypeIdentifier:](self, "conformsToTypeIdentifier:", CFSTR("com.apple.ical.ics"));
}

- (BOOL)contentTypeConformsToProvisionment
{
  return -[MFAttachment conformsToTypeIdentifier:](self, "conformsToTypeIdentifier:", CFSTR("com.apple.mobileconfig"))
      || -[MFAttachment conformsToTypeIdentifier:](self, "conformsToTypeIdentifier:", CFSTR("com.apple.mobileprovision"))|| -[MFAttachment conformsToType:](self, "conformsToType:", *MEMORY[0x1E0CEC578])|| -[MFAttachment conformsToType:](self, "conformsToType:", *MEMORY[0x1E0CEC660]);
}

- (BOOL)contentTypeConformsToMarkup
{
  return -[MFAttachment conformsToType:](self, "conformsToType:", *MEMORY[0x1E0CEC520])
      || -[MFAttachment conformsToType:](self, "conformsToType:", *MEMORY[0x1E0CEC570]);
}

- (BOOL)contentTypeConformsToPassbook
{
  return -[MFAttachment conformsToType:](self, "conformsToType:", *MEMORY[0x1E0CEC6A8])
      || -[MFAttachment conformsToType:](self, "conformsToType:", *MEMORY[0x1E0CEC6A0]);
}

- (BOOL)contentTypeConformsToIWork
{
  void *v2;
  char v3;

  -[MFAttachment fileUTType](self, "fileUTType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple.iwork"));

  return v3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (MFMimePart)part
{
  return self->_part;
}

- (void)setPart:(id)a3
{
  objc_storeStrong((id *)&self->_part, a3);
}

- (NSString)mimePartNumber
{
  return self->_mimePartNumber;
}

- (void)setMimePartNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)disposition
{
  return self->_disposition;
}

- (void)setDisposition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isAutoArchive
{
  return self->_isAutoArchive;
}

- (void)setPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->_placeholder, a3);
}

- (NSItemProvider)attachmentDataProvider
{
  return self->_attachmentDataProvider;
}

- (void)setAttachmentDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentDataProvider, a3);
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
  objc_storeStrong((id *)&self->_customConsumer, a3);
}

- (BOOL)wantsCompletionBlockOffMainThread
{
  return self->_wantsCompletionBlockOffMainThread;
}

- (void)setWantsCompletionBlockOffMainThread:(BOOL)a3
{
  self->_wantsCompletionBlockOffMainThread = a3;
}

- (CGSize)imageDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_imageDimensions.width;
  height = self->_imageDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageDimensions:(CGSize)a3
{
  self->_imageDimensions = a3;
}

- (NSNumber)fileHasSynapseAttributes
{
  return self->_fileHasSynapseAttributes;
}

- (void)setFileHasSynapseAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_fileHasSynapseAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHasSynapseAttributes, 0);
  objc_storeStrong((id *)&self->_customConsumer, 0);
  objc_storeStrong(&self->_fetchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_attachmentDataProvider, 0);
  objc_storeStrong((id *)&self->_disposition, 0);
  objc_storeStrong((id *)&self->_mimePartNumber, 0);
  objc_storeStrong((id *)&self->_part, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_attachmentManager, 0);
}

+ (id)fileTypeForFilename:(id)a3 mimeType:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;

  v13 = a1;
  v19 = a3;
  v17 = a4;
  swift_getObjCClassMetadata();
  v12 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE7A4060) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v20 = (char *)&v9 - v12;
  v4 = (id)MEMORY[0x1E0C80A78](v19);
  v5 = v17;
  v15 = sub_1A594B40C();
  v18 = v6;
  v14 = sub_1A594B40C();
  v16 = v7;
  swift_getObjCClassMetadata();
  sub_1A5331098(v15, v18, v14, v16, v20);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v21 = sub_1A594A5B4();
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v22 + 48))(v20, 1) == 1)
  {
    v11 = 0;
  }
  else
  {
    v10 = (void *)sub_1A594A4D0();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v20, v21);
    v11 = v10;
  }
  return v11;
}

- (void)fetchLocalData:stripPrivateMetadata:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  *(_DWORD *)v1 = 138412290;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v1, v3, "#Attachments Failed to fetch data for attachment [%@]", v4);

  OUTLINED_FUNCTION_1();
}

- (void)fetchDataSynchronously:stripPrivateMetadata:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_2_0(&dword_1A4F90000, "#Attachments Failed to fetch data for attachment [%@] due to %{public}@", v5, v6);

  OUTLINED_FUNCTION_1();
}

- (void)fetchDataSynchronously:(uint64_t)a3 stripPrivateMetadata:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A4F90000, a1, a3, "FIXME: calls that come from the main thread should use fetchLocalData", a5, a6, a7, a8, 0);
}

- (void)fetchDataToURL:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(v1, v2, 7.2225e-34);
  _os_log_debug_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEBUG, "#Attachments Using placeholder file for '%{mask.hash}@'.", v4, 0x16u);

  OUTLINED_FUNCTION_1();
}

- (void)fetchDataToURL:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(v1, v2, 7.2225e-34);
  _os_log_fault_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_FAULT, "#Attachments Failed to get attachment data for '%{mask.hash}@'.", v4, 0x16u);

  OUTLINED_FUNCTION_1();
}

- (void)fetchDataToURL:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  os_log_t v5;

  OUTLINED_FUNCTION_2();
  *(_DWORD *)v1 = 134218498;
  *(_QWORD *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2160;
  *(_QWORD *)(v1 + 14) = 1752392040;
  *(_WORD *)(v1 + 22) = 2112;
  *(_QWORD *)(v1 + 24) = v3;
  _os_log_fault_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_FAULT, "#Attachments Unable to create temp file for data (%{bytes}llu) for '%{mask.hash}@'.", v4, 0x20u);

  OUTLINED_FUNCTION_1();
}

- (void)fetchPlaceholderData
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  *(_DWORD *)v1 = 138412290;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v1, v3, "#Attachments Failed to fetch candidate placeholder contents for attachment [%@]", v4);

  OUTLINED_FUNCTION_1();
}

- (void)_dataProvider
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_2_0(&dword_1A4F90000, "#Attachments Unable to obtain data provider for attachemnt [%@] due to %{public}@", v5, v6);

  OUTLINED_FUNCTION_1();
}

+ (void)isSinglePagePDF:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A4F90000, a1, a3, "Lockdown Mode detected, disabling PDF parsing", a5, a6, a7, a8, 0);
}

- (void)readFromDisk
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_2_0(&dword_1A4F90000, "#Attachments Unable to read file URL [%@] due to error: %{public}@", v5, v6);

  OUTLINED_FUNCTION_1();
}

@end
