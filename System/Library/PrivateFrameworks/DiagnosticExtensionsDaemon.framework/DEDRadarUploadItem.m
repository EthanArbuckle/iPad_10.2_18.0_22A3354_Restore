@implementation DEDRadarUploadItem

- (DEDRadarUploadItem)initWithUploadTask:(id)a3 andAttachment:(id)a4
{
  id v6;
  id v7;
  DEDRadarUploadItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DEDRadarUploadItem;
  v8 = -[DEDRadarUploadItem init](&v14, sel_init);
  if (v8)
  {
    -[DEDRadarUploadItem setTaskIdentifier:](v8, "setTaskIdentifier:", objc_msgSend(v6, "taskIdentifier"));
    -[DEDAttachmentItem setAttachedPath:](v8, "setAttachedPath:", v7);
    -[DEDRadarUploadItem setTotalBytesSent:](v8, "setTotalBytesSent:", 0);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDAttachmentItem attachedPath](v8, "attachedPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributesOfItemAtPath:error:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDRadarUploadItem setTotalBytesExpectedToSend:](v8, "setTotalBytesExpectedToSend:", objc_msgSend(v12, "fileSize"));

    -[DEDRadarUploadItem setIsUploaded:](v8, "setIsUploaded:", 0);
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("taskIdentifier");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", -[DEDRadarUploadItem taskIdentifier](self, "taskIdentifier"));
  v15[0] = v3;
  v14[1] = CFSTR("attachedPath");
  -[DEDAttachmentItem attachedPath](self, "attachedPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  v14[2] = CFSTR("totalBytesSent");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", -[DEDRadarUploadItem totalBytesSent](self, "totalBytesSent"));
  v15[2] = v5;
  v14[3] = CFSTR("totalBytesExpectedToSend");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", -[DEDRadarUploadItem totalBytesExpectedToSend](self, "totalBytesExpectedToSend"));
  v15[3] = v6;
  v14[4] = CFSTR("isUploaded");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%d"), -[DEDRadarUploadItem isUploaded](self, "isUploaded"));
  v15[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: %@"), v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  self->_taskIdentifier = a3;
}

- (int64_t)totalBytesSent
{
  return self->_totalBytesSent;
}

- (void)setTotalBytesSent:(int64_t)a3
{
  self->_totalBytesSent = a3;
}

- (int64_t)totalBytesExpectedToSend
{
  return self->_totalBytesExpectedToSend;
}

- (void)setTotalBytesExpectedToSend:(int64_t)a3
{
  self->_totalBytesExpectedToSend = a3;
}

- (BOOL)isUploaded
{
  return self->_isUploaded;
}

- (void)setIsUploaded:(BOOL)a3
{
  self->_isUploaded = a3;
}

- (NSString)radarAttachmentName
{
  return self->_radarAttachmentName;
}

- (void)setRadarAttachmentName:(id)a3
{
  objc_storeStrong((id *)&self->_radarAttachmentName, a3);
}

- (NSURL)radarURL
{
  return self->_radarURL;
}

- (void)setRadarURL:(id)a3
{
  objc_storeStrong((id *)&self->_radarURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarURL, 0);
  objc_storeStrong((id *)&self->_radarAttachmentName, 0);
}

@end
