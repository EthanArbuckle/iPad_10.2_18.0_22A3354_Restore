@implementation DEDSeedingUploadItem

+ (id)itemAtPath:(id)a3 enclosedFilename:(id)a4 extensionID:(id)a5
{
  id v7;
  id v8;
  id v9;
  DEDSeedingUploadItem *v10;
  DEDSeedingUploadItem *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(DEDSeedingUploadItem);
  v11 = v10;
  if (v10)
  {
    -[DEDAttachmentItem setDisplayName:](v10, "setDisplayName:", v8);
    -[DEDAttachmentItem setAttachedPath:](v11, "setAttachedPath:", v7);
    -[DEDSeedingUploadItem setExtensionID:](v11, "setExtensionID:", v9);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attributesOfItemAtPath:error:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "fileSize");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDAttachmentItem setFileSize:](v11, "setFileSize:", v16);

    -[DEDSeedingUploadItem setBytesUploaded:](v11, "setBytesUploaded:", 0);
    -[DEDSeedingUploadItem setCompleted:](v11, "setCompleted:", 0);
  }

  return v11;
}

- (id)publicDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[DEDAttachmentItem attachedPath](self, "attachedPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDAttachmentItem fileSize](self, "fileSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("path: [%@] size: [%lu]"), v5, objc_msgSend(v6, "longValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)DEDSeedingUploadItem;
  -[DEDAttachmentItem description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDSeedingUploadItem extensionID](self, "extensionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDAttachmentItem attachedPath](self, "attachedPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ - %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)extensionID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExtensionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)filePromiseUUID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFilePromiseUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (int64_t)bytesUploaded
{
  return self->_bytesUploaded;
}

- (void)setBytesUploaded:(int64_t)a3
{
  self->_bytesUploaded = a3;
}

- (int64_t)totalBytesExpectedToSend
{
  return self->_totalBytesExpectedToSend;
}

- (void)setTotalBytesExpectedToSend:(int64_t)a3
{
  self->_totalBytesExpectedToSend = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSURLSessionUploadTask)uploadTask
{
  return (NSURLSessionUploadTask *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUploadTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadTask, 0);
  objc_storeStrong((id *)&self->_filePromiseUUID, 0);
  objc_storeStrong((id *)&self->_extensionID, 0);
}

@end
