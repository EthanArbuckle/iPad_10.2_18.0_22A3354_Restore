@implementation HMDRemoteMessageDestination

- (id)remoteDestinationString
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)allRemoteDestinationStrings
{
  void *v3;
  void *v4;
  void *v5;
  HMDRemoteMessageDestination *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  HMDRemoteMessageDestination *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDRemoteMessageDestination remoteDestinationString](self, "remoteDestinationString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@This destination is not addressable: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

+ (id)allMessageDestinations
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (HMDRemoteMessageDestination)allocWithZone:(_NSZone *)a3
{
  HMDRemoteAccountMessageDestination *v6;
  SEL v7;
  id v8;
  objc_super v9;

  if ((id)objc_opt_class() == a1)
  {
    v6 = (HMDRemoteAccountMessageDestination *)_HMFPreconditionFailure();
    -[HMDRemoteAccountMessageDestination initWithTarget:](v6, v7, v8);
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___HMDRemoteMessageDestination;
  return (HMDRemoteMessageDestination *)objc_msgSendSuper2(&v9, sel_allocWithZone_, a3);
}

@end
