@implementation _HMFNetAddressIPV6

- (_HMFNetAddressIPV6)init
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

- (_HMFNetAddressIPV6)initWithSocketAddress:(const sockaddr *)a3
{
  char *v5;
  __int128 v6;
  _HMFNetAddressIPV6 *v7;
  _HMFNetAddressIPV6 *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3->sa_family == 30)
  {
    v13.receiver = self;
    v13.super_class = (Class)_HMFNetAddressIPV6;
    v5 = -[_HMFNetAddressIPV6 init](&v13, sel_init);
    if (v5)
    {
      v6 = *(_OWORD *)&a3->sa_data[10];
      *(sockaddr *)(v5 + 24) = *a3;
      *(_OWORD *)(v5 + 36) = v6;
    }
    v7 = v5;
    v8 = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC355C](self, a2);
    v7 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_ERROR, "%{public}@Invalid sockaddr, must be AF_INET6", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return CFHashBytes() ^ self->_in6.sin6_port ^ self->_in6.sin6_scope_id;
}

- (BOOL)isEqual:(id)a3
{
  _HMFNetAddressIPV6 *v4;
  _HMFNetAddressIPV6 *v5;
  _HMFNetAddressIPV6 *v6;
  BOOL v7;
  BOOL v8;

  v4 = (_HMFNetAddressIPV6 *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v8 = v6
      && (*(_QWORD *)self->_in6.sin6_addr.__u6_addr8 == *(_QWORD *)v6->_in6.sin6_addr.__u6_addr8
        ? (v7 = *(_QWORD *)&self->_in6.sin6_addr.__u6_addr32[2] == *(_QWORD *)&v6->_in6.sin6_addr.__u6_addr32[2])
        : (v7 = 0),
          v7 && self->_in6.sin6_port == v6->_in6.sin6_port)
      && self->_in6.sin6_scope_id == v6->_in6.sin6_scope_id;

  }
  return v8;
}

- (unint64_t)addressFamily
{
  return 2;
}

- (id)addressString
{
  sockaddr_in6 *p_in6;
  uint64_t sin6_scope_id;
  void *v5;
  NSObject *v6;
  void *v7;
  int *v8;
  char *v9;
  int v10;
  void *v11;
  void *v12;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  char v23[46];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_in6 = &self->_in6;
  if (inet_ntop(30, &self->_in6.sin6_addr, v23, 0x2Eu))
  {
    sin6_scope_id = p_in6->sin6_scope_id;
    if ((_DWORD)sin6_scope_id)
    {
      if (if_indextoname(sin6_scope_id, (char *)buf))
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s%%%s"), v23, buf);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s%%%u"), v23, sin6_scope_id);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    return v14;
  }
  else
  {
    v5 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = __error();
      v9 = strerror(*v8);
      v10 = *__error();
      -[_HMFNetAddressIPV6 dataUsingEncoding:](self, "dataUsingEncoding:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmf_hexadecimalRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v16 = v7;
      v17 = 2080;
      v18 = v9;
      v19 = 1024;
      v20 = v10;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_ERROR, "%{public}@inet_ntop() failed  with '%s' (%d) for sockaddr_in6: %@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v5);
    return 0;
  }
}

- (id)dataUsingEncoding:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_in6, 28, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
