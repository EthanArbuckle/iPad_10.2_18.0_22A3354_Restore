@implementation HMFAssertion

+ (id)logCategory
{
  if (qword_1ED013180 != -1)
    dispatch_once(&qword_1ED013180, &__block_literal_global_9);
  return (id)qword_1ED013188;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

void __27__HMFAssertion_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Assertion"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED013188;
  qword_1ED013188 = v0;

}

- (void)invalidate
{
  void *v3;
  HMFAssertion *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[HMFAssertion isValid](self, "isValid"))
  {
    v3 = (void *)MEMORY[0x1A1AC355C]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Invalidating", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v4->_valid = 0;
  }
}

- (BOOL)isValid
{
  return self->_valid;
}

void __32__HMFAssertion_bundleIdentifier__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1A1AC355C]();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_63;
  _MergedGlobals_63 = v2;

  objc_autoreleasePoolPop(v0);
}

- (HMFAssertion)initWithName:(id)a3
{
  id v4;
  HMFAssertion *v5;
  uint64_t v6;
  NSString *name;
  HMFAssertion *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)HMFAssertion;
    v5 = -[HMFAssertion init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      name = v5->_name;
      v5->_name = (NSString *)v6;

      v5->_valid = 1;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)uniqueDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[HMFAssertion bundleIdentifier](HMFAssertion, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFAssertion name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

+ (id)bundleIdentifier
{
  if (qword_1ED013178 != -1)
    dispatch_once(&qword_1ED013178, &__block_literal_global_21);
  return (id)_MergedGlobals_63;
}

- (void)dealloc
{
  void *v3;
  HMFAssertion *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_valid)
  {
    v3 = (void *)MEMORY[0x1A1AC355C]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_INFO, "%{public}@Invalidating during deallocation", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMFAssertion invalidate](v4, "invalidate");
  }
  v7.receiver = self;
  v7.super_class = (Class)HMFAssertion;
  -[HMFAssertion dealloc](&v7, sel_dealloc);
}

- (HMFAssertion)init
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

- (BOOL)acquire:(id *)a3
{
  void *v4;
  HMFAssertion *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[HMFAssertion isValid](self, "isValid", a3))
  {
    v4 = (void *)MEMORY[0x1A1AC355C]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Acquiring", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v5->_valid = 1;
  }
  return 1;
}

- (id)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  HMFAttributeDescription *v5;
  HMFAttributeDescription *v6;
  void *v7;
  HMFAttributeDescription *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  -[HMFAssertion name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Name"), v4);
  v11[0] = v5;
  v6 = [HMFAttributeDescription alloc];
  HMFBooleanToString(-[HMFAssertion isValid](self, "isValid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMFAttributeDescription initWithName:value:](v6, "initWithName:value:", CFSTR("Valid"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
