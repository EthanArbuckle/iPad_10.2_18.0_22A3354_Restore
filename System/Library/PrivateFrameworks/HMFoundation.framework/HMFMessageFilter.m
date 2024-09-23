@implementation HMFMessageFilter

+ (id)requiredPolicyOfClass:(Class)a3 fromPolicies:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  id v10;
  void *v12;
  void *v13;
  id v14;
  __CFString *v15;
  void *v16;

  objc_msgSend(a1, "policyOfClass:fromPolicies:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else if (a5)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (id)objc_opt_class();
    if (v14 == a1)
    {
      v15 = CFSTR("filter");
    }
    else
    {
      NSStringFromClass((Class)a1);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ required by %@ is missing"), a3, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hmfErrorWithCode:reason:", 2, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    if (v14 != a1)
  }

  return v9;
}

+ (id)policyOfClass:(Class)a3 fromPolicies:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8 && objc_msgSend(a1, "canInitWithMessage:", v8))
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessage:", v8);
    if (v10)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(a1, "policyClasses", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(a1, "requiredPolicyOfClass:fromPolicies:error:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v9, a5);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
            {

              v17 = -1;
              goto LABEL_18;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v13)
            continue;
          break;
        }
      }

      if (objc_msgSend(v10, "acceptWithPolicies:error:", v9, a5))
        v17 = 1;
      else
        v17 = -1;
    }
    else
    {
      v17 = 0;
    }
LABEL_18:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)logCategory
{
  if (_MergedGlobals_76 != -1)
    dispatch_once(&_MergedGlobals_76, &__block_literal_global_45);
  return (id)qword_1ED013270;
}

void __31__HMFMessageFilter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Messaging.Filter"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED013270;
  qword_1ED013270 = v0;

}

+ (BOOL)canInitWithMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (HMFMessageFilter)init
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

- (BOOL)acceptWithPolicies:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99768];
  v8 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ is unavailable"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

+ (NSSet)policyClasses
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (HMFMessageFilter)initWithMessage:(id)a3
{
  id v4;
  void *v5;
  HMFMessageFilter *v6;
  void *v7;
  uint64_t v8;
  HMFMessage *message;
  HMFMessageFilter *v10;
  HMFMessageFilter *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure(CFSTR("message"));
  v5 = v4;
  if ((objc_msgSend((id)objc_opt_class(), "canInitWithMessage:", v4) & 1) != 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)HMFMessageFilter;
    v6 = -[HMFMessageFilter init](&v17, sel_init);
    if (v6)
    {
      v7 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v7, "setName:", &stru_1E3B39EC0);
      objc_msgSend(v7, "setMessagePayload:", 0);
      objc_msgSend(v7, "setResponseHandler:", 0);
      v8 = objc_msgSend(v7, "copy");

      message = v6->_message;
      v6->_message = (HMFMessage *)v8;

    }
    v10 = v6;
    v11 = v10;
  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC355C]();
    v10 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_19B546000, v13, OS_LOG_TYPE_ERROR, "%{public}@Message is not supported: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (NSArray)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  HMFAttributeDescription *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  -[HMFMessageFilter message](self, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMFAttributeDescription initWithName:value:options:formatter:](v3, "initWithName:value:options:formatter:", CFSTR("Message"), v4, 1, 0);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMFMessageFilter message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMFMessage)message
{
  return (HMFMessage *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
