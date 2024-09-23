@implementation DMFFetchRestrictionsRequest

- (DMFFetchRestrictionsRequest)init
{
  DMFFetchRestrictionsRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DMFFetchRestrictionsRequest;
  result = -[CATTaskRequest init](&v3, sel_init);
  if (result)
    result->_profileFilterFlags = 0;
  return result;
}

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1E6EF4A18;
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

- (DMFFetchRestrictionsRequest)initWithCoder:(id)a3
{
  id v4;
  DMFFetchRestrictionsRequest *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchRestrictionsRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("includeProfileRestrictions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_includeProfileRestrictions = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("profileFilterFlags"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_profileFilterFlags = objc_msgSend(v7, "unsignedIntegerValue");

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
  v7.super_class = (Class)DMFFetchRestrictionsRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFFetchRestrictionsRequest includeProfileRestrictions](self, "includeProfileRestrictions", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("includeProfileRestrictions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFFetchRestrictionsRequest profileFilterFlags](self, "profileFilterFlags"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("profileFilterFlags"));

}

- (BOOL)includeProfileRestrictions
{
  return self->_includeProfileRestrictions;
}

- (void)setIncludeProfileRestrictions:(BOOL)a3
{
  self->_includeProfileRestrictions = a3;
}

- (unint64_t)profileFilterFlags
{
  return self->_profileFilterFlags;
}

- (void)setProfileFilterFlags:(unint64_t)a3
{
  self->_profileFilterFlags = a3;
}

@end
