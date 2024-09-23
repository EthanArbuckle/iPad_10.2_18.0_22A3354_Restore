@implementation HMMNamedGroupSpecifier

- (HMMNamedGroupSpecifier)initWithGroupName:(id)a3
{
  id v5;
  HMMNamedGroupSpecifier *v6;
  HMMNamedGroupSpecifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMNamedGroupSpecifier;
  v6 = -[HMMNamedGroupSpecifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_groupName, a3);

  return v7;
}

- (NSDictionary)descriptor
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = HMMGroupDescriptorGroupType;
  v5[1] = HMMGroupDescriptorGroupName;
  v6[0] = CFSTR("namedGroup");
  -[HMMNamedGroupSpecifier groupName](self, "groupName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)coreDataGroupUsingContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  HMMCoreDataNamedGroup *v11;
  void *v12;
  HMMNamedGroupSpecifier *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMMNamedGroupSpecifier *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("NamedGroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  -[HMMNamedGroupSpecifier groupName](self, "groupName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("name == %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  objc_msgSend(v5, "setIncludesSubentities:", 0);
  v24 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v5, &v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v24;
  if (objc_msgSend(v9, "count"))
  {
    if (objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v11 = (HMMCoreDataNamedGroup *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = (void *)MEMORY[0x1D17B78FC]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMNamedGroupSpecifier groupName](v19, "groupName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v21;
        v27 = 2114;
        v28 = v22;
        _os_log_impl(&dword_1CD029000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unexpected extra groups returned for group %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v11 = 0;
    }
  }
  else
  {
    if (v10)
    {
      v12 = (void *)MEMORY[0x1D17B78FC]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMNamedGroupSpecifier groupName](v13, "groupName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v15;
        v27 = 2114;
        v28 = v16;
        v29 = 2114;
        v30 = v10;
        _os_log_impl(&dword_1CD029000, v14, OS_LOG_TYPE_ERROR, "%{public}@Error getting group %{public}@: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
    }
    v11 = -[HMMCoreDataNamedGroup initWithContext:]([HMMCoreDataNamedGroup alloc], "initWithContext:", v4);
    -[HMMNamedGroupSpecifier groupName](self, "groupName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMCoreDataNamedGroup setName:](v11, "setName:", v17);

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HMMNamedGroupSpecifier *v4;
  BOOL v5;

  v4 = (HMMNamedGroupSpecifier *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[HMMNamedGroupSpecifier isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[HMMNamedGroupSpecifier isEqualToGroupNameSpecifier:](self, "isEqualToGroupNameSpecifier:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToGroupNameSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMMNamedGroupSpecifier groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMMNamedGroupSpecifier groupName](self, "groupName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[HMMNamedGroupSpecifier groupName](self, "groupName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
}

+ (NSString)type
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
  return (NSString *)CFSTR("namedGroup");
}

@end
