@implementation CRKASMConcreteTrustedUser

- (CRKASMConcreteTrustedUser)initWithBackingPerson:(id)a3 certificateVendor:(id)a4
{
  id v7;
  CRKASMConcreteTrustedUser *v8;
  CRKASMConcreteTrustedUser *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRKASMConcreteTrustedUser;
  v8 = -[CRKASMConcreteUser initWithBackingPerson:](&v11, sel_initWithBackingPerson_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_certificateVendor, a4);

  return v9;
}

- (NSSet)certificates
{
  void *v3;
  void *v4;
  void *v5;

  -[CRKASMConcreteTrustedUser certificateVendor](self, "certificateVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteUser identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "certificatesForUserIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (BOOL)isEqualToConcreteTrustedUser:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  if (-[CRKASMConcreteUser isEqualToConcreteUser:](self, "isEqualToConcreteUser:", v5))
  {
    -[CRKASMConcreteTrustedUser certificateVendor](self, "certificateVendor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 || (objc_msgSend(v5, "certificateVendor"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CRKASMConcreteTrustedUser certificateVendor](self, "certificateVendor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "certificateVendor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

      if (v6)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v9 = 1;
    }

    goto LABEL_9;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKASMConcreteTrustedUser;
  v3 = -[CRKASMConcreteUser hash](&v7, sel_hash);
  -[CRKASMConcreteTrustedUser certificateVendor](self, "certificateVendor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CRKASMConcreteTrustedUser *v4;
  BOOL v5;

  v4 = (CRKASMConcreteTrustedUser *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else if (-[CRKASMConcreteTrustedUser isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[CRKASMConcreteTrustedUser isEqualToConcreteTrustedUser:](self, "isEqualToConcreteTrustedUser:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v9.receiver = self;
  v9.super_class = (Class)CRKASMConcreteTrustedUser;
  -[CRKASMConcreteUser description](&v9, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteTrustedUser certificateVendor](self, "certificateVendor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { super = %@, certificateVendor = %@ }>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (CRKASMCertificateVendor)certificateVendor
{
  return self->_certificateVendor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateVendor, 0);
}

@end
