@implementation HMAccessoryProfile

- (void)handleRuntimeStateUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleRuntimeStateUpdate:", v4);

}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Wrapping %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (HMAccessory)accessory
{
  void *v2;
  void *v3;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMAccessory *)v3;
}

- (NSUUID)uniqueIdentifier
{
  void *v2;
  void *v3;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessoryProfile *v4;
  HMAccessoryProfile *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HMAccessoryProfile *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessoryProfile accessoryProfile](v5, "accessoryProfile");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSArray)services
{
  void *v2;
  void *v3;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (_HMAccessoryProfile)accessoryProfile
{
  return self->_accessoryProfile;
}

- (HMAccessoryProfile)initWithAccessoryProfile:(id)a3
{
  id v5;
  HMAccessoryProfile *v6;
  HMAccessoryProfile *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessoryProfile;
  v6 = -[HMAccessoryProfile init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accessoryProfile, a3);

  return v7;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  return 0;
}

- (NSUUID)profileUniqueIdentifier
{
  void *v2;
  void *v3;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profileUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)recomputeAssistantIdentifier
{
  id v2;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recomputeAssistantIdentifier");

}

- (id)assistantIdentifier
{
  void *v2;
  void *v3;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assistantIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)refreshStateWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  HMAccessoryProfile *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (!v4)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@nil completion handler", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide a completion handler"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  if (v8)
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v9;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Refreshing state is not supported on this accessory profile", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryProfile, 0);
}

@end
