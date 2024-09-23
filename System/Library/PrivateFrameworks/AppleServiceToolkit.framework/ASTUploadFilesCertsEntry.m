@implementation ASTUploadFilesCertsEntry

- (ASTUploadFilesCertsEntry)initWithCert:(id)a3 andPubKeyDigest:(id)a4 andSigAlgo:(id)a5
{
  id v9;
  id v10;
  id v11;
  ASTUploadFilesCertsEntry *v12;
  ASTUploadFilesCertsEntry *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASTUploadFilesCertsEntry;
  v12 = -[ASTUploadFilesCertsEntry init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_certString, a3);
    objc_storeStrong((id *)&v13->_pubKeyDigest, a4);
    objc_storeStrong((id *)&v13->_sigAlgo, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASTUploadFilesCertsEntry)initWithCoder:(id)a3
{
  id v4;
  ASTUploadFilesCertsEntry *v5;
  uint64_t v6;
  NSString *certString;
  uint64_t v8;
  NSString *pubKeyDigest;
  uint64_t v10;
  NSString *sigAlgo;

  v4 = a3;
  v5 = -[ASTUploadFilesCertsEntry init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("certString"));
    v6 = objc_claimAutoreleasedReturnValue();
    certString = v5->_certString;
    v5->_certString = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pubKeyDigest"));
    v8 = objc_claimAutoreleasedReturnValue();
    pubKeyDigest = v5->_pubKeyDigest;
    v5->_pubKeyDigest = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sigAlgo"));
    v10 = objc_claimAutoreleasedReturnValue();
    sigAlgo = v5->_sigAlgo;
    v5->_sigAlgo = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ASTUploadFilesCertsEntry certString](self, "certString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("certString"));

  -[ASTUploadFilesCertsEntry pubKeyDigest](self, "pubKeyDigest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("pubKeyDigest"));

  -[ASTUploadFilesCertsEntry sigAlgo](self, "sigAlgo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sigAlgo"));

}

- (NSString)certString
{
  return self->_certString;
}

- (void)setCertString:(id)a3
{
  objc_storeStrong((id *)&self->_certString, a3);
}

- (NSString)pubKeyDigest
{
  return self->_pubKeyDigest;
}

- (void)setPubKeyDigest:(id)a3
{
  objc_storeStrong((id *)&self->_pubKeyDigest, a3);
}

- (NSString)sigAlgo
{
  return self->_sigAlgo;
}

- (void)setSigAlgo:(id)a3
{
  objc_storeStrong((id *)&self->_sigAlgo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigAlgo, 0);
  objc_storeStrong((id *)&self->_pubKeyDigest, 0);
  objc_storeStrong((id *)&self->_certString, 0);
}

@end
