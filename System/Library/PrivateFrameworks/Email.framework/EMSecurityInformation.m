@implementation EMSecurityInformation

- (EMSecurityInformation)initWithSigners:(id)a3 isEncrypted:(BOOL)a4 hasEncryptedDescendantPart:(BOOL)a5 smimeError:(id)a6
{
  id v11;
  id v12;
  EMSecurityInformation *v13;
  EMSecurityInformation *v14;
  objc_super v16;

  v11 = a3;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)EMSecurityInformation;
  v13 = -[EMSecurityInformation init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_signers, a3);
    v14->_isEncrypted = a4;
    v14->_hasEncryptedDescendantPart = a5;
    objc_storeStrong((id *)&v14->_smimeError, a6);
  }

  return v14;
}

- (BOOL)isSigned
{
  void *v2;
  BOOL v3;

  -[EMSecurityInformation signers](self, "signers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)reevaluateTrustWithNetworkAccessAllowed
{
  void *v2;
  id v3;

  -[EMSecurityInformation signers](self, "signers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "reevaluateTrustWithNetworkAccessAllowed");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMSecurityInformation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  EMSecurityInformation *v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("EFPropertyKey_signers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_isEncrypted"));
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_hasEncryptedDescendantPart"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_smimeError"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EMSecurityInformation initWithSigners:isEncrypted:hasEncryptedDescendantPart:smimeError:](self, "initWithSigners:isEncrypted:hasEncryptedDescendantPart:smimeError:", v8, v9, v10, v11);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EMSecurityInformation signers](self, "signers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_signers"));

  objc_msgSend(v6, "encodeBool:forKey:", -[EMSecurityInformation isEncrypted](self, "isEncrypted"), CFSTR("EFPropertyKey_isEncrypted"));
  objc_msgSend(v6, "encodeBool:forKey:", -[EMSecurityInformation hasEncryptedDescendantPart](self, "hasEncryptedDescendantPart"), CFSTR("EFPropertyKey_hasEncryptedDescendantPart"));
  -[EMSecurityInformation smimeError](self, "smimeError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_smimeError"));

}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[EMSecurityInformation isEncrypted](self, "isEncrypted");
  NSStringFromBOOL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSecurityInformation signers](self, "signers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[EMSecurityInformation smimeError](self, "smimeError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Encrypted: %@, Signers %lu, hasSMIMEError: %@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (NSArray)signers
{
  return self->_signers;
}

- (BOOL)hasEncryptedDescendantPart
{
  return self->_hasEncryptedDescendantPart;
}

- (NSError)smimeError
{
  return self->_smimeError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smimeError, 0);
  objc_storeStrong((id *)&self->_signers, 0);
}

@end
