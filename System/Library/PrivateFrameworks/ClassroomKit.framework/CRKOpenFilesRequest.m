@implementation CRKOpenFilesRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKOpenFilesRequest)initWithCoder:(id)a3
{
  id v4;
  CRKOpenFilesRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *fileItems;
  void *v11;
  uint64_t v12;
  NSString *senderName;
  void *v14;
  uint64_t v15;
  NSData *previewImageData;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *sourceBundleIdentifier;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRKOpenFilesRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("fileItems"));
    v9 = objc_claimAutoreleasedReturnValue();
    fileItems = v5->_fileItems;
    v5->_fileItems = (NSSet *)v9;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("senderName"));
    v12 = objc_claimAutoreleasedReturnValue();
    senderName = v5->_senderName;
    v5->_senderName = (NSString *)v12;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("previewImageData"));
    v15 = objc_claimAutoreleasedReturnValue();
    previewImageData = v5->_previewImageData;
    v5->_previewImageData = (NSData *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autoAccept"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoAccept = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("sourceBundleIdentifier"));
    v19 = objc_claimAutoreleasedReturnValue();
    sourceBundleIdentifier = v5->_sourceBundleIdentifier;
    v5->_sourceBundleIdentifier = (NSString *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRKOpenFilesRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[CRKOpenFilesRequest fileItems](self, "fileItems", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fileItems"));

  -[CRKOpenFilesRequest senderName](self, "senderName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("senderName"));

  -[CRKOpenFilesRequest previewImageData](self, "previewImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("previewImageData"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKOpenFilesRequest autoAccept](self, "autoAccept"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("autoAccept"));

  -[CRKOpenFilesRequest sourceBundleIdentifier](self, "sourceBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("sourceBundleIdentifier"));

}

- (NSSet)fileItems
{
  return self->_fileItems;
}

- (void)setFileItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)senderName
{
  return self->_senderName;
}

- (void)setSenderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)previewImageData
{
  return self->_previewImageData;
}

- (void)setPreviewImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)autoAccept
{
  return self->_autoAccept;
}

- (void)setAutoAccept:(BOOL)a3
{
  self->_autoAccept = a3;
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (void)setSourceBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_previewImageData, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_fileItems, 0);
}

@end
