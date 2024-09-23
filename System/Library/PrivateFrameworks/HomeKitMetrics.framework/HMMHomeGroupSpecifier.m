@implementation HMMHomeGroupSpecifier

- (HMMHomeGroupSpecifier)initWithHomeUUID:(id)a3 groupName:(id)a4
{
  id v7;
  HMMHomeGroupSpecifier *v8;
  HMMHomeGroupSpecifier *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMMHomeGroupSpecifier;
  v8 = -[HMMNamedGroupSpecifier initWithGroupName:](&v11, sel_initWithGroupName_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_homeUUID, a3);

  return v9;
}

- (id)descriptor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("homeGroup");
  v8[0] = HMMGroupDescriptorGroupType;
  v8[1] = HMMGroupDescriptorGroupName;
  -[HMMNamedGroupSpecifier groupName](self, "groupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = HMMGroupDescriptorHomeUUID;
  -[HMMHomeGroupSpecifier homeUUID](self, "homeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  id v11;
  HMMCoreDataHomeGroup *v12;
  void *v13;
  HMMHomeGroupSpecifier *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMMHomeGroupSpecifier *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("HomeGroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  -[HMMNamedGroupSpecifier groupName](self, "groupName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMHomeGroupSpecifier homeUUID](self, "homeUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("(name == %@) && (homeUUID == %@)"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v9);

  objc_msgSend(v5, "setIncludesSubentities:", 0);
  v26 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v5, &v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v26;
  if (objc_msgSend(v10, "count"))
  {
    if (objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v12 = (HMMCoreDataHomeGroup *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = (void *)MEMORY[0x1D17B78FC]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMNamedGroupSpecifier groupName](v21, "groupName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v23;
        v29 = 2114;
        v30 = v24;
        _os_log_impl(&dword_1CD029000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unexpected extra groups returned for group %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      v12 = 0;
    }
  }
  else
  {
    if (v11)
    {
      v13 = (void *)MEMORY[0x1D17B78FC]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMNamedGroupSpecifier groupName](v14, "groupName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v28 = v16;
        v29 = 2114;
        v30 = v17;
        v31 = 2114;
        v32 = v11;
        _os_log_impl(&dword_1CD029000, v15, OS_LOG_TYPE_ERROR, "%{public}@Error getting group %{public}@: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
    }
    v12 = -[HMMCoreDataHomeGroup initWithContext:]([HMMCoreDataHomeGroup alloc], "initWithContext:", v4);
    -[HMMNamedGroupSpecifier groupName](self, "groupName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMCoreDataHomeGroup setName:](v12, "setName:", v18);

    -[HMMHomeGroupSpecifier homeUUID](self, "homeUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMCoreDataHomeGroup setHomeUUID:](v12, "setHomeUUID:", v19);

  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  HMMHomeGroupSpecifier *v4;
  BOOL v5;

  v4 = (HMMHomeGroupSpecifier *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[HMMHomeGroupSpecifier isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[HMMHomeGroupSpecifier isEqualToHomeGroupSpecifier:](self, "isEqualToHomeGroupSpecifier:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToHomeGroupSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

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
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMMNamedGroupSpecifier groupName](self, "groupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 3 * objc_msgSend(v3, "hash");
  -[HMMHomeGroupSpecifier homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMMNamedGroupSpecifier groupName](self, "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMHomeGroupSpecifier homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
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
  return CFSTR("homeGroup");
}

@end
