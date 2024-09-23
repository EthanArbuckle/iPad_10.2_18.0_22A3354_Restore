@implementation _HMFNetAddressHostname

- (_HMFNetAddressHostname)init
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

+ (id)normalizedHostname:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("."), 4);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (v6 = v4, v7 = v5, v4 != objc_msgSend(v3, "length") - 1))
  {
    v8 = objc_msgSend(v3, "copy");
  }
  else
  {
    objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v6, v7, &stru_1E3B39EC0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (_HMFNetAddressHostname)initWithHostname:(id)a3
{
  id v4;
  _HMFNetAddressHostname *v5;
  uint64_t v6;
  NSString *hostname;
  _HMFNetAddressHostname *v8;
  _HMFNetAddressHostname *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)_HMFNetAddressHostname;
    v5 = -[_HMFNetAddressHostname init](&v14, sel_init);
    if (v5)
    {
      +[_HMFNetAddressHostname normalizedHostname:](_HMFNetAddressHostname, "normalizedHostname:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      hostname = v5->_hostname;
      v5->_hostname = (NSString *)v6;

    }
    v8 = v5;
    v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC355C]();
    v8 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_ERROR, "%{public}@Invalid hostname", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_HMFNetAddressHostname hostname](self, "hostname");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _HMFNetAddressHostname *v4;
  _HMFNetAddressHostname *v5;
  _HMFNetAddressHostname *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (_HMFNetAddressHostname *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[_HMFNetAddressHostname hostname](self, "hostname");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMFNetAddressHostname hostname](v6, "hostname");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostname, 0);
}

@end
