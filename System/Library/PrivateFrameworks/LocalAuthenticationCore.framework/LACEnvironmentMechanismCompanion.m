@implementation LACEnvironmentMechanismCompanion

- (LACEnvironmentMechanismCompanion)initWithAvailabilityError:(id)a3 companionType:(int64_t)a4 stateHash:(id)a5
{
  id v9;
  id v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  LACEnvironmentMechanismCompanion *v14;
  objc_super v16;

  v9 = a5;
  v10 = a3;
  NSStringFromLACCompanionType(a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 2)
    v12 = CFSTR("macbook");
  else
    v12 = CFSTR("questionmark");
  if (a4 == 1)
    v13 = CFSTR("applewatch");
  else
    v13 = v12;
  v16.receiver = self;
  v16.super_class = (Class)LACEnvironmentMechanismCompanion;
  v14 = -[LACEnvironmentMechanism initWithAvailabilityError:localizedName:iconSystemName:](&v16, sel_initWithAvailabilityError_localizedName_iconSystemName_, v10, v11, v13);

  if (v14)
  {
    v14->_companionType = a4;
    objc_storeStrong((id *)&v14->_stateHash, a5);
  }

  return v14;
}

+ (id)companionForUser:(unsigned int)a3 type:(int64_t)a4 error:(id *)a5
{
  int v6;
  void *v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v6 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("companions not supported"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LACLogEnvironment();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11[0] = 67109634;
    v11[1] = a3;
    v12 = 1024;
    v13 = v6;
    v14 = 2114;
    v15 = v8;
    _os_log_error_impl(&dword_2409DC000, v9, OS_LOG_TYPE_ERROR, "companionForUser:%u type:%d -> %{public}@", (uint8_t *)v11, 0x18u);
  }

  if (a5)
    *a5 = objc_retainAutorelease(v8);

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LACEnvironmentMechanismCompanion;
  v4 = a3;
  -[LACEnvironmentMechanism encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  v5 = -[LACEnvironmentMechanismCompanion companionType](self, "companionType", v9.receiver, v9.super_class);
  NSStringFromSelector(sel_companionType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  -[LACEnvironmentMechanismCompanion stateHash](self, "stateHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_stateHash);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

}

- (LACEnvironmentMechanismCompanion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  LACEnvironmentMechanismCompanion *v11;

  v4 = a3;
  NSStringFromSelector(sel_availabilityError);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_companionType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", v7);
  NSStringFromSelector(sel_stateHash);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[LACEnvironmentMechanismCompanion initWithAvailabilityError:companionType:stateHash:](self, "initWithAvailabilityError:companionType:stateHash:", v6, v8, v10);
  return v11;
}

- (id)descriptionDetails
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("companionType: %d"), -[LACEnvironmentMechanismCompanion companionType](self, "companionType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[LACEnvironmentMechanismCompanion stateHash](self, "stateHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    -[LACEnvironmentMechanismCompanion stateHash](self, "stateHash");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("stateHash: %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LACEnvironmentMechanismCompanion *v4;
  LACEnvironmentMechanismCompanion *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = (LACEnvironmentMechanismCompanion *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)LACEnvironmentMechanismCompanion;
    if (-[LACEnvironmentMechanism isEqual:](&v14, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = -[LACEnvironmentMechanismCompanion companionType](self, "companionType");
      if (v6 == -[LACEnvironmentMechanismCompanion companionType](v5, "companionType"))
      {
        -[LACEnvironmentMechanismCompanion stateHash](self, "stateHash");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACEnvironmentMechanismCompanion stateHash](v5, "stateHash");
        v8 = objc_claimAutoreleasedReturnValue();
        if (v7 == (void *)v8)
        {
          v12 = 1;
          v9 = v7;
        }
        else
        {
          v9 = (void *)v8;
          -[LACEnvironmentMechanismCompanion stateHash](self, "stateHash");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[LACEnvironmentMechanismCompanion stateHash](v5, "stateHash");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqualToData:", v11);

        }
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (int64_t)companionType
{
  return self->_companionType;
}

- (NSData)stateHash
{
  return self->_stateHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateHash, 0);
}

@end
