@implementation DMFSecurityInformation

- (DMFSecurityInformation)initWithSupportsBlockLevelEncryption:(BOOL)a3 supportsFileLevelEncryption:(BOOL)a4 passcodeIsSet:(BOOL)a5 passcodeIsCompliantWithGlobalRestrictions:(BOOL)a6 passcodeIsCompliantWithProfileRestrictions:(BOOL)a7 passcodeLockGracePeriodEnforced:(unint64_t)a8 passcodeLockGracePeriod:(unint64_t)a9
{
  DMFSecurityInformation *result;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)DMFSecurityInformation;
  result = -[DMFSecurityInformation init](&v16, sel_init);
  if (result)
  {
    result->_supportsBlockLevelEncryption = a3;
    result->_supportsFileLevelEncryption = a4;
    result->_passcodeIsSet = a5;
    result->_passcodeIsCompliantWithGlobalRestrictions = a6;
    result->_passcodeIsCompliantWithProfileRestrictions = a7;
    result->_passcodeLockGracePeriod = a9;
    result->_passcodeLockGracePeriodEnforced = a8;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSupportsBlockLevelEncryption:supportsFileLevelEncryption:passcodeIsSet:passcodeIsCompliantWithGlobalRestrictions:passcodeIsCompliantWithProfileRestrictions:passcodeLockGracePeriodEnforced:passcodeLockGracePeriod:", -[DMFSecurityInformation supportsBlockLevelEncryption](self, "supportsBlockLevelEncryption"), -[DMFSecurityInformation supportsFileLevelEncryption](self, "supportsFileLevelEncryption"), -[DMFSecurityInformation passcodeIsSet](self, "passcodeIsSet"), -[DMFSecurityInformation passcodeIsCompliantWithGlobalRestrictions](self, "passcodeIsCompliantWithGlobalRestrictions"), -[DMFSecurityInformation passcodeIsCompliantWithProfileRestrictions](self, "passcodeIsCompliantWithProfileRestrictions"), -[DMFSecurityInformation passcodeLockGracePeriodEnforced](self, "passcodeLockGracePeriodEnforced"), -[DMFSecurityInformation passcodeLockGracePeriod](self, "passcodeLockGracePeriod"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSecurityInformation)initWithCoder:(id)a3
{
  id v4;
  DMFSecurityInformation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DMFSecurityInformation;
  v5 = -[DMFSecurityInformation init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsBlockLevelEncryption"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsBlockLevelEncryption = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsFileLevelEncryption"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsFileLevelEncryption = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passcodeIsSet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_passcodeIsSet = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passcodeIsCompliantWithGlobalRestrictions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_passcodeIsCompliantWithGlobalRestrictions = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passcodeIsCompliantWithProfileRestrictions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_passcodeIsCompliantWithProfileRestrictions = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passcodeLockGracePeriodEnforced"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_passcodeLockGracePeriodEnforced = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passcodeLockGracePeriod"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_passcodeLockGracePeriod = objc_msgSend(v12, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[DMFSecurityInformation supportsBlockLevelEncryption](self, "supportsBlockLevelEncryption"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("supportsBlockLevelEncryption"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFSecurityInformation supportsFileLevelEncryption](self, "supportsFileLevelEncryption"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("supportsFileLevelEncryption"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFSecurityInformation passcodeIsSet](self, "passcodeIsSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("passcodeIsSet"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFSecurityInformation passcodeIsCompliantWithGlobalRestrictions](self, "passcodeIsCompliantWithGlobalRestrictions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("passcodeIsCompliantWithGlobalRestrictions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFSecurityInformation passcodeIsCompliantWithProfileRestrictions](self, "passcodeIsCompliantWithProfileRestrictions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("passcodeIsCompliantWithProfileRestrictions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFSecurityInformation passcodeLockGracePeriodEnforced](self, "passcodeLockGracePeriodEnforced"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("passcodeLockGracePeriodEnforced"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFSecurityInformation passcodeLockGracePeriod](self, "passcodeLockGracePeriod"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("passcodeLockGracePeriod"));

}

- (unint64_t)hash
{
  _BOOL4 v3;
  int v4;
  _BOOL4 v5;
  int v6;
  uint64_t v7;
  unint64_t v8;

  v3 = -[DMFSecurityInformation supportsBlockLevelEncryption](self, "supportsBlockLevelEncryption");
  v4 = v3 ^ -[DMFSecurityInformation supportsFileLevelEncryption](self, "supportsFileLevelEncryption");
  v5 = -[DMFSecurityInformation passcodeIsSet](self, "passcodeIsSet");
  v6 = v5 ^ -[DMFSecurityInformation passcodeIsCompliantWithGlobalRestrictions](self, "passcodeIsCompliantWithGlobalRestrictions") ^ v4;
  v7 = -[DMFSecurityInformation passcodeIsCompliantWithProfileRestrictions](self, "passcodeIsCompliantWithProfileRestrictions") ^ v6 ^ 1;
  v8 = -[DMFSecurityInformation passcodeLockGracePeriodEnforced](self, "passcodeLockGracePeriodEnforced");
  return v8 ^ -[DMFSecurityInformation passcodeLockGracePeriod](self, "passcodeLockGracePeriod") ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  DMFSecurityInformation *v4;
  DMFSecurityInformation *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;

  v4 = (DMFSecurityInformation *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[DMFSecurityInformation supportsBlockLevelEncryption](self, "supportsBlockLevelEncryption");
      if (v6 == -[DMFSecurityInformation supportsBlockLevelEncryption](v5, "supportsBlockLevelEncryption")
        && (v7 = -[DMFSecurityInformation supportsFileLevelEncryption](self, "supportsFileLevelEncryption"),
            v7 == -[DMFSecurityInformation supportsFileLevelEncryption](v5, "supportsFileLevelEncryption"))
        && (v8 = -[DMFSecurityInformation passcodeIsSet](self, "passcodeIsSet"),
            v8 == -[DMFSecurityInformation passcodeIsSet](v5, "passcodeIsSet"))
        && (v9 = -[DMFSecurityInformation passcodeIsCompliantWithGlobalRestrictions](self, "passcodeIsCompliantWithGlobalRestrictions"), v9 == -[DMFSecurityInformation passcodeIsCompliantWithGlobalRestrictions](v5, "passcodeIsCompliantWithGlobalRestrictions"))&& (v10 = -[DMFSecurityInformation passcodeIsCompliantWithProfileRestrictions](self, "passcodeIsCompliantWithProfileRestrictions"), v10 == -[DMFSecurityInformation passcodeIsCompliantWithProfileRestrictions](v5, "passcodeIsCompliantWithProfileRestrictions"))&& (v11 = -[DMFSecurityInformation passcodeLockGracePeriodEnforced](self, "passcodeLockGracePeriodEnforced"), v11 == -[DMFSecurityInformation passcodeLockGracePeriodEnforced](v5, "passcodeLockGracePeriodEnforced")))
      {
        v12 = -[DMFSecurityInformation passcodeLockGracePeriod](self, "passcodeLockGracePeriod");
        v13 = v12 == -[DMFSecurityInformation passcodeLockGracePeriod](v5, "passcodeLockGracePeriod");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  void *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p {\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__DMFSecurityInformation_description__block_invoke;
  v8[3] = &unk_1E6ED8A30;
  v9 = v3;
  v4 = v3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCB7F34](v8);
  ((void (**)(_QWORD, const __CFString *, BOOL))v5)[2](v5, CFSTR("Supports Block Level Encryption                "), -[DMFSecurityInformation supportsBlockLevelEncryption](self, "supportsBlockLevelEncryption"));
  ((void (**)(_QWORD, const __CFString *, BOOL))v5)[2](v5, CFSTR("Supports File Level Encryption                 "), -[DMFSecurityInformation supportsFileLevelEncryption](self, "supportsFileLevelEncryption"));
  ((void (**)(_QWORD, const __CFString *, BOOL))v5)[2](v5, CFSTR("Passcode Is Set                                "), -[DMFSecurityInformation passcodeIsSet](self, "passcodeIsSet"));
  ((void (**)(_QWORD, const __CFString *, BOOL))v5)[2](v5, CFSTR("Passcode is Compliant With Global Restrictions "), -[DMFSecurityInformation passcodeIsCompliantWithGlobalRestrictions](self, "passcodeIsCompliantWithGlobalRestrictions"));
  ((void (**)(_QWORD, const __CFString *, BOOL))v5)[2](v5, CFSTR("Passcode is Compliant With Profile Restrictions"), -[DMFSecurityInformation passcodeIsCompliantWithProfileRestrictions](self, "passcodeIsCompliantWithProfileRestrictions"));
  objc_msgSend(v4, "appendFormat:", CFSTR("Passcode Lock Grace Period Enforced             : %lu\n"), -[DMFSecurityInformation passcodeLockGracePeriodEnforced](self, "passcodeLockGracePeriodEnforced"));
  objc_msgSend(v4, "appendFormat:", CFSTR("Passcode Lock Grace Period                      : %lu\n"), -[DMFSecurityInformation passcodeLockGracePeriod](self, "passcodeLockGracePeriod"));
  objc_msgSend(v4, "appendString:", CFSTR("}>"));
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

uint64_t __37__DMFSecurityInformation_description__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v3;
  const __CFString *v4;

  v3 = *(void **)(a1 + 32);
  v4 = CFSTR("NO");
  if (a3)
    v4 = CFSTR("YES");
  return objc_msgSend(v3, "appendFormat:", CFSTR("\t%@ : %@\n"), a2, v4);
}

- (BOOL)supportsBlockLevelEncryption
{
  return self->_supportsBlockLevelEncryption;
}

- (BOOL)supportsFileLevelEncryption
{
  return self->_supportsFileLevelEncryption;
}

- (BOOL)passcodeIsSet
{
  return self->_passcodeIsSet;
}

- (BOOL)passcodeIsCompliantWithGlobalRestrictions
{
  return self->_passcodeIsCompliantWithGlobalRestrictions;
}

- (BOOL)passcodeIsCompliantWithProfileRestrictions
{
  return self->_passcodeIsCompliantWithProfileRestrictions;
}

- (unint64_t)passcodeLockGracePeriod
{
  return self->_passcodeLockGracePeriod;
}

- (unint64_t)passcodeLockGracePeriodEnforced
{
  return self->_passcodeLockGracePeriodEnforced;
}

@end
