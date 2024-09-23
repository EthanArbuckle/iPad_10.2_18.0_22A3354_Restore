@implementation DEDCloudKitAttachmentModel

- (DEDCloudKitAttachmentModel)initWithURL:(id)a3 withQueueItem:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  DEDCloudKitAttachmentModel *v10;
  DEDCloudKitAttachmentModel *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)DEDCloudKitAttachmentModel;
  v10 = -[DEDCloudKitBaseModel initModelWithDictionary:](&v27, sel_initModelWithDictionary_, a5);
  v11 = v10;
  if (v10)
  {
    -[DEDCloudKitAttachmentModel setUrl:](v10, "setUrl:", v8);
    -[DEDCloudKitAttachmentModel setQueueItem:](v11, "setQueueItem:", v9);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attributesOfItemAtPath:error:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "fileSize");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDCloudKitAttachmentModel setFileSize:](v11, "setFileSize:", v16);

    v17 = objc_alloc(MEMORY[0x24BDB9010]);
    -[DEDCloudKitAttachmentModel url](v11, "url");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithFileURL:", v18);

    -[DEDCloudKitBaseModel cloudKitModel](v11, "cloudKitModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("asset"));

    -[DEDCloudKitAttachmentModel url](v11, "url");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastPathComponent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDCloudKitBaseModel cloudKitModel](v11, "cloudKitModel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("fileName"));

    -[DEDCloudKitAttachmentModel queueItem](v11, "queueItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDCloudKitBaseModel cloudKitModel](v11, "cloudKitModel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("queueItem"));

  }
  return v11;
}

- (id)modelName
{
  return CFSTR("Attachment");
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)fileSize
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFileSize:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)queueItem
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQueueItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueItem, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
