@implementation DCCredentialTrust

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DCCredentialTrust credentialKeyBlob](self, "credentialKeyBlob");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, 0x24C307748);

  -[DCCredentialTrust credentialBAACertificate](self, "credentialBAACertificate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, 0x24C307728);

  -[DCCredentialTrust credentialPairingID](self, "credentialPairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, 0x24C307768);

  objc_msgSend(v7, "encodeBool:forKey:", -[DCCredentialTrust credentialAccessibilityEnabled](self, "credentialAccessibilityEnabled"), 0x24C307788);
}

- (DCCredentialTrust)initWithCoder:(id)a3
{
  id v4;
  DCCredentialTrust *v5;
  uint64_t v6;
  NSData *credentialKeyBlob;
  uint64_t v8;
  NSData *credentialBAACertificate;
  uint64_t v10;
  NSString *credentialPairingID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DCCredentialTrust;
  v5 = -[DCCredentialTrust init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307748);
    v6 = objc_claimAutoreleasedReturnValue();
    credentialKeyBlob = v5->_credentialKeyBlob;
    v5->_credentialKeyBlob = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307728);
    v8 = objc_claimAutoreleasedReturnValue();
    credentialBAACertificate = v5->_credentialBAACertificate;
    v5->_credentialBAACertificate = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307768);
    v10 = objc_claimAutoreleasedReturnValue();
    credentialPairingID = v5->_credentialPairingID;
    v5->_credentialPairingID = (NSString *)v10;

    v5->_credentialAccessibilityEnabled = objc_msgSend(v4, "decodeBoolForKey:", 0x24C307788);
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DCCredentialTrust credentialBAACertificate = %@, credentialKeyBlob = %@, credentialPairingID = %@, credentialAccessibilityEnabled = %d"), self->_credentialBAACertificate, self->_credentialKeyBlob, self->_credentialPairingID, self->_credentialAccessibilityEnabled);
}

- (DCCredentialTrust)initWithCredentialKeyBlob:(id)a3 baaCertificate:(id)a4 pairingID:(id)a5 isAccessibilityEnabled:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  DCCredentialTrust *v13;
  uint64_t v14;
  NSData *credentialKeyBlob;
  uint64_t v16;
  NSData *credentialBAACertificate;
  uint64_t v18;
  NSString *credentialPairingID;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DCCredentialTrust;
  v13 = -[DCCredentialTrust init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    credentialKeyBlob = v13->_credentialKeyBlob;
    v13->_credentialKeyBlob = (NSData *)v14;

    v16 = objc_msgSend(v11, "copy");
    credentialBAACertificate = v13->_credentialBAACertificate;
    v13->_credentialBAACertificate = (NSData *)v16;

    v18 = objc_msgSend(v12, "copy");
    credentialPairingID = v13->_credentialPairingID;
    v13->_credentialPairingID = (NSString *)v18;

    v13->_credentialAccessibilityEnabled = a6;
  }

  return v13;
}

- (NSData)credentialBAACertificate
{
  return self->_credentialBAACertificate;
}

- (NSData)credentialKeyBlob
{
  return self->_credentialKeyBlob;
}

- (NSString)credentialPairingID
{
  return self->_credentialPairingID;
}

- (BOOL)credentialAccessibilityEnabled
{
  return self->_credentialAccessibilityEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialPairingID, 0);
  objc_storeStrong((id *)&self->_credentialKeyBlob, 0);
  objc_storeStrong((id *)&self->_credentialBAACertificate, 0);
}

@end
