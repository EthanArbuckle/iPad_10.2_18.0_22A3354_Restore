@implementation ASCPublicKeyCredentialDescriptor

+ (NSSet)cableTransports
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("cable"), CFSTR("hybrid"), 0);
}

+ (NSData)magicCredentialID
{
  return (NSData *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", CFSTR("QVbUFRZmiAZxElbC0CKP7zL/RGE="), 0);
}

- (ASCPublicKeyCredentialDescriptor)initWithCredentialID:(id)a3 transports:(id)a4
{
  id v6;
  id v7;
  ASCPublicKeyCredentialDescriptor *v8;
  uint64_t v9;
  NSData *credentialID;
  uint64_t v11;
  NSArray *transports;
  ASCPublicKeyCredentialDescriptor *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ASCPublicKeyCredentialDescriptor;
  v8 = -[ASCPublicKeyCredentialDescriptor init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    credentialID = v8->_credentialID;
    v8->_credentialID = (NSData *)v9;

    v11 = objc_msgSend(v7, "copy");
    transports = v8->_transports;
    v8->_transports = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[ASCPublicKeyCredentialDescriptor credentialID](self, "credentialID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCPublicKeyCredentialDescriptor transports](self, "transports");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithCredentialID:transports:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[ASCPublicKeyCredentialDescriptor credentialID](self, "credentialID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "credentialID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqualToData:", v6),
        v6,
        v5,
        v7))
  {
    -[ASCPublicKeyCredentialDescriptor transports](self, "transports");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transports");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = WBSIsEqual();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasInternalTransport
{
  return -[NSArray containsObject:](self->_transports, "containsObject:", CFSTR("internal"));
}

- (BOOL)hasCABLETransport
{
  NSUInteger v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[NSArray count](self->_transports, "count");
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", self->_transports);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "cableTransports");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "intersectsSet:", v5);

    LOBYTE(v3) = v6;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCPublicKeyCredentialDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ASCPublicKeyCredentialDescriptor *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("transports"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ASCPublicKeyCredentialDescriptor initWithCredentialID:transports:](self, "initWithCredentialID:transports:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ASCPublicKeyCredentialDescriptor credentialID](self, "credentialID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("credentialID"));

  -[ASCPublicKeyCredentialDescriptor transports](self, "transports");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("transports"));

}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (NSArray)transports
{
  return self->_transports;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transports, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
}

@end
