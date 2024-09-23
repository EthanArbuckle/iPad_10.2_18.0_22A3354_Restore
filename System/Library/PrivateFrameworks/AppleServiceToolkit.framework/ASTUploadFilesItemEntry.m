@implementation ASTUploadFilesItemEntry

- (ASTUploadFilesItemEntry)initWithId:(id)a3 andName:(id)a4 andSig:(id)a5 andPubKeyDigest:(id)a6 andStatus:(id)a7 andSize:(id)a8 andUploadUrl:(id)a9
{
  id v16;
  id v17;
  ASTUploadFilesItemEntry *v18;
  ASTUploadFilesItemEntry *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)ASTUploadFilesItemEntry;
  v18 = -[ASTUploadFilesItemEntry init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uploadId, a3);
    objc_storeStrong((id *)&v19->_name, a4);
    objc_storeStrong((id *)&v19->_sig, a5);
    objc_storeStrong((id *)&v19->_pubKeyDigest, a6);
    objc_storeStrong((id *)&v19->_status, a7);
    objc_storeStrong((id *)&v19->_size, a8);
    objc_storeStrong((id *)&v19->_uploadUrl, a9);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASTUploadFilesItemEntry)initWithCoder:(id)a3
{
  id v4;
  ASTUploadFilesItemEntry *v5;
  uint64_t v6;
  NSString *uploadId;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *sig;
  uint64_t v12;
  NSString *pubKeyDigest;
  uint64_t v14;
  NSString *status;
  uint64_t v16;
  NSNumber *size;
  uint64_t v18;
  NSString *uploadUrl;

  v4 = a3;
  v5 = -[ASTUploadFilesItemEntry init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uploadId"));
    v6 = objc_claimAutoreleasedReturnValue();
    uploadId = v5->_uploadId;
    v5->_uploadId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sig"));
    v10 = objc_claimAutoreleasedReturnValue();
    sig = v5->_sig;
    v5->_sig = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pubKeyDigest"));
    v12 = objc_claimAutoreleasedReturnValue();
    pubKeyDigest = v5->_pubKeyDigest;
    v5->_pubKeyDigest = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v14 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
    v16 = objc_claimAutoreleasedReturnValue();
    size = v5->_size;
    v5->_size = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uploadUrl"));
    v18 = objc_claimAutoreleasedReturnValue();
    uploadUrl = v5->_uploadUrl;
    v5->_uploadUrl = (NSString *)v18;

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
  void *v10;
  id v11;

  v4 = a3;
  -[ASTUploadFilesItemEntry uploadId](self, "uploadId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uploadId"));

  -[ASTUploadFilesItemEntry name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

  -[ASTUploadFilesItemEntry sig](self, "sig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sig"));

  -[ASTUploadFilesItemEntry pubKeyDigest](self, "pubKeyDigest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("pubKeyDigest"));

  -[ASTUploadFilesItemEntry status](self, "status");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("status"));

  -[ASTUploadFilesItemEntry size](self, "size");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("size"));

  -[ASTUploadFilesItemEntry uploadUrl](self, "uploadUrl");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("uploadUrl"));

}

- (NSString)uploadId
{
  return self->_uploadId;
}

- (void)setUploadId:(id)a3
{
  objc_storeStrong((id *)&self->_uploadId, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)sig
{
  return self->_sig;
}

- (void)setSig:(id)a3
{
  objc_storeStrong((id *)&self->_sig, a3);
}

- (NSString)pubKeyDigest
{
  return self->_pubKeyDigest;
}

- (void)setPubKeyDigest:(id)a3
{
  objc_storeStrong((id *)&self->_pubKeyDigest, a3);
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (NSNumber)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
  objc_storeStrong((id *)&self->_size, a3);
}

- (NSString)uploadUrl
{
  return self->_uploadUrl;
}

- (void)setUploadUrl:(id)a3
{
  objc_storeStrong((id *)&self->_uploadUrl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadUrl, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_pubKeyDigest, 0);
  objc_storeStrong((id *)&self->_sig, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uploadId, 0);
}

@end
