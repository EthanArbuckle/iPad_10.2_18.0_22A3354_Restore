@implementation IXPromisedAppReferenceSeed

- (IXPromisedAppReferenceSeed)initWithCoder:(id)a3
{
  id v4;
  IXPromisedAppReferenceSeed *v5;
  void *v6;
  uint64_t v7;
  IXApplicationIdentity *identity;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IXPromisedAppReferenceSeed;
  v5 = -[IXOwnedDataPromiseSeed initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installationDomain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_installationDomain = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identity"));
    v7 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (IXApplicationIdentity *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IXPromisedAppReferenceSeed;
  v4 = a3;
  -[IXOwnedDataPromiseSeed encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IXPromisedAppReferenceSeed installationDomain](self, "installationDomain", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("installationDomain"));

  -[IXPromisedAppReferenceSeed identity](self, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identity"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IXPromisedAppReferenceSeed;
  v4 = -[IXOwnedDataPromiseSeed copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setInstallationDomain:", -[IXPromisedAppReferenceSeed installationDomain](self, "installationDomain"));
  -[IXPromisedAppReferenceSeed identity](self, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIdentity:", v6);

  return v4;
}

- (Class)clientPromiseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)installationDomain
{
  return self->_installationDomain;
}

- (void)setInstallationDomain:(unint64_t)a3
{
  self->_installationDomain = a3;
}

- (IXApplicationIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
