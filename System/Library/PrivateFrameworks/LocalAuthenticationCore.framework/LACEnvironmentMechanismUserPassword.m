@implementation LACEnvironmentMechanismUserPassword

- (LACEnvironmentMechanismUserPassword)initWithAvailabilityError:(id)a3 set:(BOOL)a4
{
  LACEnvironmentMechanismUserPassword *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LACEnvironmentMechanismUserPassword;
  result = -[LACEnvironmentMechanism initWithAvailabilityError:localizedName:iconSystemName:](&v6, sel_initWithAvailabilityError_localizedName_iconSystemName_, a3, CFSTR("Passcode"), CFSTR("lock.shield"));
  if (result)
    result->_set = a4;
  return result;
}

+ (id)environmentMechanismForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  LACEnvironmentMechanismUserPassword *v11;
  LACEnvironmentMechanismUserPassword *v12;
  LACEnvironmentMechanismUserPassword *v13;
  void *v14;
  id v16;

  v7 = *(_QWORD *)&a3;
  objc_msgSend(a5, "passcodeHelper", *(_QWORD *)&a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v9 = objc_msgSend(v8, "isPasscodeSetForUser:error:", v7, &v16);
  v10 = v16;

  if (a6)
    *a6 = objc_retainAutorelease(v10);
  v11 = [LACEnvironmentMechanismUserPassword alloc];
  v12 = v11;
  if (v10)
  {
    v13 = -[LACEnvironmentMechanismUserPassword initWithAvailabilityError:set:](v11, "initWithAvailabilityError:set:", v10, v9);
  }
  else
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1004, CFSTR("User interaction is required"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[LACEnvironmentMechanismUserPassword initWithAvailabilityError:set:](v12, "initWithAvailabilityError:set:", v14, v9);

  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LACEnvironmentMechanismUserPassword;
  v4 = a3;
  -[LACEnvironmentMechanism encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = -[LACEnvironmentMechanismUserPassword set](self, "set", v7.receiver, v7.super_class);
  NSStringFromSelector("set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

}

- (LACEnvironmentMechanismUserPassword)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  LACEnvironmentMechanismUserPassword *v9;

  v4 = a3;
  NSStringFromSelector(sel_availabilityError);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector("set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeBoolForKey:", v7);

  v9 = -[LACEnvironmentMechanismUserPassword initWithAvailabilityError:set:](self, "initWithAvailabilityError:set:", v6, v8);
  return v9;
}

- (id)descriptionDetails
{
  _BOOL4 v2;
  const __CFString *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = -[LACEnvironmentMechanismUserPassword set](self, "set");
  v3 = CFSTR("not set");
  if (v2)
    v3 = CFSTR("set");
  v5[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  LACEnvironmentMechanismUserPassword *v4;
  LACEnvironmentMechanismUserPassword *v5;
  BOOL v6;
  BOOL v7;
  char v8;
  objc_super v10;

  v4 = (LACEnvironmentMechanismUserPassword *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)LACEnvironmentMechanismUserPassword;
    if (-[LACEnvironmentMechanism isEqual:](&v10, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = -[LACEnvironmentMechanismUserPassword set](self, "set");
      v7 = -[LACEnvironmentMechanismUserPassword set](v5, "set");

      v8 = v6 ^ v7 ^ 1;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)set
{
  return self->_set;
}

@end
