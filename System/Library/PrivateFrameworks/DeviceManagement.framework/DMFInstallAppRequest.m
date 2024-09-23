@implementation DMFInstallAppRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4A90;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFInstallAppRequest)initWithCoder:(id)a3
{
  id v4;
  DMFInstallAppRequest *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFInstallAppRequest;
  v5 = -[DMFAppRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("licenseType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_licenseType = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowFreePurchases"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowFreePurchases = objc_msgSend(v7, "BOOLValue");

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
  v7.super_class = (Class)DMFInstallAppRequest;
  v4 = a3;
  -[DMFAppRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFInstallAppRequest licenseType](self, "licenseType", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("licenseType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFInstallAppRequest allowFreePurchases](self, "allowFreePurchases"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("allowFreePurchases"));

}

- (unint64_t)licenseType
{
  return self->_licenseType;
}

- (void)setLicenseType:(unint64_t)a3
{
  self->_licenseType = a3;
}

- (BOOL)allowFreePurchases
{
  return self->_allowFreePurchases;
}

- (void)setAllowFreePurchases:(BOOL)a3
{
  self->_allowFreePurchases = a3;
}

@end
