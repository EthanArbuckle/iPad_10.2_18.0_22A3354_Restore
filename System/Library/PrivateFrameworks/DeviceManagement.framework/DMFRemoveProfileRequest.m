@implementation DMFRemoveProfileRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4CB8;
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

- (DMFRemoveProfileRequest)initWithCoder:(id)a3
{
  id v4;
  DMFRemoveProfileRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *profileIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFRemoveProfileRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("profileIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    profileIdentifier = v5->_profileIdentifier;
    v5->_profileIdentifier = (NSString *)v8;

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
  v7.super_class = (Class)DMFRemoveProfileRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFRemoveProfileRequest type](self, "type", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("type"));

  -[DMFRemoveProfileRequest profileIdentifier](self, "profileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("profileIdentifier"));

}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
}

@end
