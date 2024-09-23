@implementation HKProfileIdentifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKProfileIdentifier)initWithCoder:(id)a3
{
  id v4;
  HKProfileIdentifier *v5;
  uint64_t v6;
  NSUUID *identifier;

  v4 = a3;
  v5 = -[HKProfileIdentifier _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pident"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ptype"));
  }

  return v5;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKProfileIdentifier;
  return -[HKProfileIdentifier init](&v3, sel_init);
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSUUID *identifier;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    identifier = self->_identifier;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSUUID isEqual:](identifier, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)isValidProfileType:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 4 || a3 == 100;
}

+ (BOOL)isValidSecondaryProfileType:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 3 || a3 == 100;
}

- (HKProfileIdentifier)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (id)primaryProfile
{
  if (primaryProfile_onceToken != -1)
    dispatch_once(&primaryProfile_onceToken, &__block_literal_global_104);
  return (id)primaryProfile_primaryProfile;
}

void __37__HKProfileIdentifier_primaryProfile__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = -[HKProfileIdentifier _init]([HKProfileIdentifier alloc], "_init");
  v1 = (void *)primaryProfile_primaryProfile;
  primaryProfile_primaryProfile = (uint64_t)v0;

  *(_QWORD *)(primaryProfile_primaryProfile + 16) = 1;
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  v3 = *(void **)(primaryProfile_primaryProfile + 8);
  *(_QWORD *)(primaryProfile_primaryProfile + 8) = v2;

}

+ (id)_profileWithUUID:(id)a3 type:(int64_t)a4
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = -[HKProfileIdentifier _init]([HKProfileIdentifier alloc], "_init");
  v7 = objc_msgSend(v5, "copy");

  v8 = (void *)v6[1];
  v6[1] = v7;

  v6[2] = a4;
  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKStringFromProfileType(self->_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ %@>"), v5, v6, self->_identifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("pident"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("ptype"));

}

- (int64_t)type
{
  return self->_type;
}

@end
