@implementation ASTSealableFile

- (ASTSealableFile)initWithFileURL:(id)a3 signature:(id)a4
{
  id v7;
  id v8;
  ASTSealableFile *v9;
  ASTSealableFile *v10;
  uint64_t v11;
  NSString *base64Signature;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ASTSealableFile;
  v9 = -[ASTSealableFile init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileURL, a3);
    if (v8)
    {
      objc_storeStrong((id *)&v10->_signature, a4);
      objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      base64Signature = v10->_base64Signature;
      v10->_base64Signature = (NSString *)v11;

      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __45__ASTSealableFile_initWithFileURL_signature___block_invoke;
      v14[3] = &unk_24F96A258;
      v15 = v8;
      -[ASTSealableFile sealWithFileSigner:error:](v10, "sealWithFileSigner:error:", v14, 0);

    }
  }

  return v10;
}

id __45__ASTSealableFile_initWithFileURL_signature___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)sealWithFileSigner:(id)a3 error:(id *)a4
{
  void (**v6)(id, void *, id *);
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void (**)(id, void *, id *))a3;
  if (-[ASTSealableFile isSealed](self, "isSealed"))
  {
    v7 = 1;
  }
  else
  {
    -[ASTSealableFile fileURL](self, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (v6)
      {
        -[ASTSealableFile fileURL](self, "fileURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v9, a4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASTSealableFile setSignature:](self, "setSignature:", v10);

        -[ASTSealableFile signature](self, "signature");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASTSealableFile setBase64Signature:](self, "setBase64Signature:", v12);

      }
      v7 = 1;
      -[ASTSealableFile setSealed:](self, "setSealed:", 1);
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -4000, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

+ (id)sealedFileURL:(id)a3 signature:(id)a4
{
  id v5;
  id v6;
  ASTSealableFile *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ASTSealableFile initWithFileURL:signature:]([ASTSealableFile alloc], "initWithFileURL:signature:", v6, v5);

  -[ASTSealableFile sealWithFileSigner:error:](v7, "sealWithFileSigner:error:", 0, 0);
  return v7;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASTSealableFile)initWithCoder:(id)a3
{
  id v4;
  ASTSealableFile *v5;
  uint64_t v6;
  NSURL *fileURL;

  v4 = a3;
  v5 = -[ASTSealableFile init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

    v5->_sealed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sealed"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ASTSealableFile fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("fileURL"));

  objc_msgSend(v5, "encodeBool:forKey:", -[ASTSealableFile isSealed](self, "isSealed"), CFSTR("sealed"));
}

- (BOOL)isSealed
{
  return self->_sealed;
}

- (void)setSealed:(BOOL)a3
{
  self->_sealed = a3;
}

- (NSString)base64Signature
{
  return self->_base64Signature;
}

- (void)setBase64Signature:(id)a3
{
  objc_storeStrong((id *)&self->_base64Signature, a3);
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_base64Signature, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
