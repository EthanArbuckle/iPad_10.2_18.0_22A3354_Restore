@implementation HMMAccessoryGroupSpecifier

- (HMMAccessoryGroupSpecifier)initWithAccessoryUUID:(id)a3 homeUUID:(id)a4 groupName:(id)a5
{
  id v9;
  HMMAccessoryGroupSpecifier *v10;
  HMMAccessoryGroupSpecifier *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMMAccessoryGroupSpecifier;
  v10 = -[HMMHomeGroupSpecifier initWithHomeUUID:groupName:](&v13, sel_initWithHomeUUID_groupName_, a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_accessoryUUID, a3);

  return v11;
}

- (id)descriptor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("accessoryGroup");
  v10[0] = HMMGroupDescriptorGroupType;
  v10[1] = HMMGroupDescriptorGroupName;
  -[HMMNamedGroupSpecifier groupName](self, "groupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  v10[2] = HMMGroupDescriptorHomeUUID;
  -[HMMHomeGroupSpecifier homeUUID](self, "homeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = HMMGroupDescriptorAccessoryUUID;
  -[HMMAccessoryGroupSpecifier accessoryUUID](self, "accessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)coreDataGroupUsingContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  HMMCoreDataAccessoryGroup *v13;
  void *v14;
  HMMAccessoryGroupSpecifier *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMMAccessoryGroupSpecifier *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AccessoryGroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  -[HMMNamedGroupSpecifier groupName](self, "groupName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMHomeGroupSpecifier homeUUID](self, "homeUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMAccessoryGroupSpecifier accessoryUUID](self, "accessoryUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("(name == %@) && (homeUUID == %@) && (accessoryUUID == %@)"), v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v10);

  objc_msgSend(v5, "setIncludesSubentities:", 0);
  v28 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v5, &v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v28;
  if (objc_msgSend(v11, "count"))
  {
    if (objc_msgSend(v11, "count") == 1)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v13 = (HMMCoreDataAccessoryGroup *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = (void *)MEMORY[0x1D17B78FC]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMNamedGroupSpecifier groupName](v23, "groupName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v25;
        v31 = 2114;
        v32 = v26;
        _os_log_impl(&dword_1CD029000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unexpected extra accessory groups returned for group %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      v13 = 0;
    }
  }
  else
  {
    if (v12)
    {
      v14 = (void *)MEMORY[0x1D17B78FC]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMNamedGroupSpecifier groupName](v15, "groupName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v17;
        v31 = 2114;
        v32 = v18;
        v33 = 2114;
        v34 = v12;
        _os_log_impl(&dword_1CD029000, v16, OS_LOG_TYPE_ERROR, "%{public}@Error getting accessory group %{public}@: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
    }
    v13 = -[HMMCoreDataAccessoryGroup initWithContext:]([HMMCoreDataAccessoryGroup alloc], "initWithContext:", v4);
    -[HMMNamedGroupSpecifier groupName](self, "groupName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMCoreDataAccessoryGroup setName:](v13, "setName:", v19);

    -[HMMHomeGroupSpecifier homeUUID](self, "homeUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMCoreDataAccessoryGroup setHomeUUID:](v13, "setHomeUUID:", v20);

    -[HMMAccessoryGroupSpecifier accessoryUUID](self, "accessoryUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMCoreDataAccessoryGroup setAccessoryUUID:](v13, "setAccessoryUUID:", v21);

  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  HMMAccessoryGroupSpecifier *v4;
  BOOL v5;

  v4 = (HMMAccessoryGroupSpecifier *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[HMMAccessoryGroupSpecifier isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[HMMAccessoryGroupSpecifier isEqualToAccessoryGroupSpecifier:](self, "isEqualToAccessoryGroupSpecifier:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToAccessoryGroupSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[HMMNamedGroupSpecifier groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[HMMHomeGroupSpecifier homeUUID](self, "homeUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMMAccessoryGroupSpecifier accessoryUUID](self, "accessoryUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessoryUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMMNamedGroupSpecifier groupName](self, "groupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 3 * objc_msgSend(v3, "hash");
  -[HMMHomeGroupSpecifier homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 5 * objc_msgSend(v5, "hash") + v4;
  -[HMMAccessoryGroupSpecifier accessoryUUID](self, "accessoryUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + objc_msgSend(v7, "hash");

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMMNamedGroupSpecifier groupName](self, "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMHomeGroupSpecifier homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMAccessoryGroupSpecifier accessoryUUID](self, "accessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@/%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

+ (id)type
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((id)objc_opt_class() != a1)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99768];
    v6 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v8, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v9);
  }
  return CFSTR("accessoryGroup");
}

@end
