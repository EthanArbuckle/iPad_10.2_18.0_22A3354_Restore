@implementation HMFHTTPRequestHandler

- (HMFHTTPRequestHandler)init
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

+ (BOOL)_isValidMethodPrediate:(id)a3
{
  return 1;
}

+ (BOOL)_isValidURLPredicate:(id)a3
{
  return 1;
}

- (HMFHTTPRequestHandler)initWithMethodPredicate:(id)a3 URLPredicate:(id)a4 matchBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMFHTTPRequestHandler *v11;
  uint64_t v12;
  NSPredicate *methodPredicate;
  uint64_t v14;
  NSPredicate *URLPredicate;
  uint64_t v16;
  id matchBlock;
  HMFHTTPRequestHandler *v18;
  HMFHTTPRequestHandler *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    v20 = (void *)MEMORY[0x1A1AC355C]();
    v18 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    HMFGetLogIdentifier(v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v22;
    v23 = "%{public}@Parameter is requred: 'methodPredicate'";
LABEL_16:
    _os_log_impl(&dword_19B546000, v21, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);

    goto LABEL_17;
  }
  if (!+[HMFHTTPRequestHandler _isValidMethodPrediate:](HMFHTTPRequestHandler, "_isValidMethodPrediate:", v8))
  {
    v20 = (void *)MEMORY[0x1A1AC355C]();
    v18 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    HMFGetLogIdentifier(v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v22;
    v23 = "%{public}@Invalid method predicate";
    goto LABEL_16;
  }
  if (!v9)
  {
    v20 = (void *)MEMORY[0x1A1AC355C]();
    v18 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    HMFGetLogIdentifier(v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v22;
    v23 = "%{public}@Parameter is requred: 'URLPredicate'";
    goto LABEL_16;
  }
  if (!+[HMFHTTPRequestHandler _isValidURLPredicate:](HMFHTTPRequestHandler, "_isValidURLPredicate:", v9))
  {
    v20 = (void *)MEMORY[0x1A1AC355C]();
    v18 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      v23 = "%{public}@Invalid URL predicate";
      goto LABEL_16;
    }
LABEL_17:

    objc_autoreleasePoolPop(v20);
    v19 = 0;
    goto LABEL_18;
  }
  v25.receiver = self;
  v25.super_class = (Class)HMFHTTPRequestHandler;
  v11 = -[HMFHTTPRequestHandler init](&v25, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    methodPredicate = v11->_methodPredicate;
    v11->_methodPredicate = (NSPredicate *)v12;

    v14 = objc_msgSend(v9, "copy");
    URLPredicate = v11->_URLPredicate;
    v11->_URLPredicate = (NSPredicate *)v14;

    v16 = objc_msgSend(v10, "copy");
    matchBlock = v11->_matchBlock;
    v11->_matchBlock = (id)v16;

  }
  v18 = v11;
  v19 = v18;
LABEL_18:

  return v19;
}

- (NSPredicate)methodPredicate
{
  return self->_methodPredicate;
}

- (NSPredicate)URLPredicate
{
  return self->_URLPredicate;
}

- (id)matchBlock
{
  return self->_matchBlock;
}

- (id)requestBlock
{
  return self->_requestBlock;
}

- (void)setRequestBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestBlock, 0);
  objc_storeStrong(&self->_matchBlock, 0);
  objc_storeStrong((id *)&self->_URLPredicate, 0);
  objc_storeStrong((id *)&self->_methodPredicate, 0);
}

@end
