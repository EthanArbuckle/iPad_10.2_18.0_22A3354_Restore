@implementation HMFNetAddress

+ (id)localAddress
{
  if (qword_1ED013230 != -1)
    dispatch_once(&qword_1ED013230, &__block_literal_global_41);
  return (id)_MergedGlobals_73;
}

void __29__HMFNetAddress_localAddress__block_invoke()
{
  HMFNetAddress *v0;
  void *v1;
  __int128 v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2 = xmmword_19B5C6A30;
  v0 = -[HMFNetAddress initWithSocketAddress:]([HMFNetAddress alloc], "initWithSocketAddress:", &v2);
  v1 = (void *)_MergedGlobals_73;
  _MergedGlobals_73 = (uint64_t)v0;

}

- (HMFNetAddress)init
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

- (HMFNetAddress)initWithSocketAddress:(const sockaddr *)a3
{
  int sa_family;
  __objc2_class **v6;
  uint64_t v7;
  void *v8;
  HMFNetAddress *v9;
  HMFNetAddress *v10;
  HMFNetAddress *v11;
  HMFNetAddress *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  sa_family = a3->sa_family;
  if (sa_family == 2)
  {
    v6 = off_1E3B35BD0;
  }
  else
  {
    if (sa_family != 30)
      goto LABEL_9;
    v6 = off_1E3B35BD8;
  }
  v7 = objc_msgSend(objc_alloc(*v6), "initWithSocketAddress:", a3);
  if (v7)
  {
    v8 = (void *)v7;
    v18.receiver = self;
    v18.super_class = (Class)HMFNetAddress;
    v9 = -[HMFNetAddress init](&v18, sel_init);
    v10 = v9;
    if (v9)
      objc_storeStrong((id *)&v9->_internal, v8);
    v11 = v10;

    v12 = v11;
    goto LABEL_12;
  }
LABEL_9:
  v13 = (void *)MEMORY[0x1A1AC355C]();
  v11 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier(v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = a3->sa_family;
    *(_DWORD *)buf = 138543618;
    v20 = v15;
    v21 = 1024;
    v22 = v16;
    _os_log_impl(&dword_19B546000, v14, OS_LOG_TYPE_ERROR, "%{public}@Invalid socket address family: 0x%02x", buf, 0x12u);

  }
  objc_autoreleasePoolPop(v13);
  v12 = 0;
LABEL_12:

  return v12;
}

- (HMFNetAddress)initWithHostname:(id)a3
{
  id v4;
  HMFNetAddress *v5;
  _HMFNetAddressHostname *v6;
  HMFNetAddressInternal *internal;
  HMFNetAddress *v8;
  HMFNetAddress *v9;
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
    v14.super_class = (Class)HMFNetAddress;
    v5 = -[HMFNetAddress init](&v14, sel_init);
    if (v5)
    {
      v6 = -[_HMFNetAddressHostname initWithHostname:]([_HMFNetAddressHostname alloc], "initWithHostname:", v4);
      internal = v5->_internal;
      v5->_internal = &v6->super;

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

  -[HMFNetAddress internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMFNetAddress *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HMFNetAddress *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HMFNetAddress internal](self, "internal");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFNetAddress internal](v4, "internal");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  HMFAttributeDescription *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  -[HMFNetAddress addressString](self, "addressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Address"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)addressFamily
{
  void *v2;
  unint64_t v3;

  -[HMFNetAddress internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "addressFamily");

  return v3;
}

- (NSString)addressString
{
  void *v2;
  void *v3;

  -[HMFNetAddress internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)dataUsingEncoding:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[HMFNetAddress internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HMFNetAddressInternal)internal
{
  return self->_internal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
