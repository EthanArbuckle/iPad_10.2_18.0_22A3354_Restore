@implementation _HMFNetAddressIPV4

- (_HMFNetAddressIPV4)init
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

- (_HMFNetAddressIPV4)initWithSocketAddress:(const sockaddr *)a3
{
  char *v5;
  _HMFNetAddressIPV4 *v6;
  _HMFNetAddressIPV4 *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3->sa_family == 2)
  {
    v12.receiver = self;
    v12.super_class = (Class)_HMFNetAddressIPV4;
    v5 = -[_HMFNetAddressIPV4 init](&v12, sel_init);
    if (v5)
      *(sockaddr *)(v5 + 24) = *a3;
    v6 = v5;
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC355C](self, a2);
    v6 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_ERROR, "%{public}@Invalid sockaddr, must be AF_INET", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_in.sin_addr.s_addr ^ self->_in.sin_port;
}

- (BOOL)isEqual:(id)a3
{
  _HMFNetAddressIPV4 *v4;
  _HMFNetAddressIPV4 *v5;
  _HMFNetAddressIPV4 *v6;
  BOOL v7;

  v4 = (_HMFNetAddressIPV4 *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6 && self->_in.sin_addr.s_addr == v6->_in.sin_addr.s_addr && self->_in.sin_port == v6->_in.sin_port;

  }
  return v7;
}

- (unint64_t)addressFamily
{
  return 1;
}

- (id)addressString
{
  in_addr v2;

  v2.s_addr = self->_in.sin_addr.s_addr;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", inet_ntoa(v2));
}

- (id)dataUsingEncoding:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_in, 16, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
