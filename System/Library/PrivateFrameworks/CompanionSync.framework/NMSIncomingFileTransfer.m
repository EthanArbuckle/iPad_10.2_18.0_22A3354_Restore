@implementation NMSIncomingFileTransfer

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v11.receiver = self;
  v11.super_class = (Class)NMSIncomingFileTransfer;
  -[NMSIncomingFileTransfer description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NMSPriorityString(-[NMSIncomingFileTransfer priority](self, "priority"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSIncomingFileTransfer idsIdentifier](self, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSIncomingFileTransfer fileURL](self, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSIncomingFileTransfer metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {%@ priority, idsID=%@, URL=%@, metadata=%@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)CPObfuscatedDescriptionObject
{
  NMSObfuscatableDescription *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc_init(NMSObfuscatableDescription);
  v10.receiver = self;
  v10.super_class = (Class)NMSIncomingFileTransfer;
  -[NMSIncomingFileTransfer debugDescription](&v10, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription setPrefixString:](v3, "setPrefixString:", v4);

  NMSPriorityString(-[NMSIncomingFileTransfer priority](self, "priority"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v3, "addDescription:value:", CFSTR("Priority"), v5);

  -[NMSIncomingFileTransfer idsIdentifier](self, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v3, "addDescription:value:", CFSTR("IDS ID"), v6);

  -[NMSIncomingFileTransfer fileURL](self, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addDescription:value:](v3, "addDescription:value:", CFSTR("URL"), v7);

  -[NMSIncomingFileTransfer metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSObfuscatableDescription addObfuscatedDescription:value:](v3, "addObfuscatedDescription:value:", CFSTR("Metadata"), v8);

  return v3;
}

- (NSString)sourceDeviceID
{
  return self->sourceDeviceID;
}

- (void)setSourceDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->sourceDeviceID, a3);
}

- (NMSMessageCenter)messageCenter
{
  return (NMSMessageCenter *)objc_loadWeakRetained((id *)&self->_messageCenter);
}

- (void)setMessageCenter:(id)a3
{
  objc_storeWeak((id *)&self->_messageCenter, a3);
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)pbHeaderInfo
{
  return self->_pbHeaderInfo;
}

- (void)setPbHeaderInfo:(id)a3
{
  objc_storeStrong(&self->_pbHeaderInfo, a3);
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (IDSMessageContext)idsContext
{
  return self->_idsContext;
}

- (void)setIdsContext:(id)a3
{
  objc_storeStrong((id *)&self->_idsContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsContext, 0);
  objc_storeStrong(&self->_pbHeaderInfo, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_destroyWeak((id *)&self->_messageCenter);
  objc_storeStrong((id *)&self->sourceDeviceID, 0);
}

@end
