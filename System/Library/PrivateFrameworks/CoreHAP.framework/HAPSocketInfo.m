@implementation HAPSocketInfo

- (HAPSocketInfo)initWithSocket:(const sockaddr_storage *)a3
{
  int ss_family;
  int v6;
  int v7;
  void *v8;
  void *v9;
  HAPSocketInfo *v10;
  NSObject *v11;
  void *v13;
  HAPSocketInfo *v14;
  uint64_t Port;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  int v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  ss_family = a3->ss_family;
  if (ss_family == 2 || ss_family == 30)
  {
    v6 = SockAddrToString();
    if (!v6)
    {
      Port = SockAddrGetPort();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buf);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", Port);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HAPSocketInfo initWithIPAddressString:port:](self, "initWithIPAddressString:port:", v16, v17);

      v14 = v10;
      goto LABEL_13;
    }
    v7 = v6;
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v8;
      v21 = 1024;
      v22 = v7;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to initialize HAPSocketInfo: failed to obtain socket address string: %d", (uint8_t *)&v19, 0x12u);

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B7244](self, a2);
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v13;
      v25 = 1024;
      v26 = ss_family;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to initialize HAPSocketInfo: invalid socket address family: %d", buf, 0x12u);

    }
  }

  objc_autoreleasePoolPop(v9);
  v14 = 0;
LABEL_13:

  return v14;
}

- (HAPSocketInfo)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  HAPSocketInfo *v10;
  HAPSocketInfo *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("HAPSocketInfoIPAddressString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("HAPSocketInfoPort"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    +[HAPSocketInfo ipAddressRemoveScopeWithAddress:](HAPSocketInfo, "ipAddressRemoveScopeWithAddress:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HAPSocketInfo ipAddressAddScopeWithAddress:](HAPSocketInfo, "ipAddressAddScopeWithAddress:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HAPSocketInfo initWithIPAddressString:port:](self, "initWithIPAddressString:port:", v9, v7);

    v11 = v10;
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize socket info from dictionary: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (HAPSocketInfo)initWithIPAddressString:(id)a3 port:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HAPSocketInfo *v9;
  id v10;
  HAPSocketInfo *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v19[2];
  int v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v20 = 0;
    v10 = objc_retainAutorelease(v6);
    if (inet_pton(2, (const char *)objc_msgSend(v10, "UTF8String"), &v20) == 1)
    {
      v11 = self;
      v12 = v10;
      v13 = 1;
LABEL_5:
      self = -[HAPSocketInfo initWithIPAddressString:ipAddressType:port:](v11, "initWithIPAddressString:ipAddressType:port:", v12, v13, v8);
      v9 = self;
      goto LABEL_16;
    }
    v19[0] = 0;
    v19[1] = 0;
    v14 = objc_retainAutorelease(v10);
    if (inet_pton(30, (const char *)objc_msgSend(v14, "UTF8String"), v19) == 1)
    {
      if (LOBYTE(v19[0]) == 255)
      {
        if ((BYTE1(v19[0]) & 0xF) == 0xE)
        {
          v11 = self;
          v12 = v14;
          v13 = 3;
          goto LABEL_5;
        }
      }
      else if (LOBYTE(v19[0]) == 254 && (BYTE1(v19[0]) & 0xC0) == 0x80)
      {
        v11 = self;
        v12 = v14;
        v13 = 2;
        goto LABEL_5;
      }
    }
    v15 = (void *)MEMORY[0x1D17B7244]();
    self = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not determine IP address type from string: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v9 = 0;
  }
LABEL_16:

  return v9;
}

- (HAPSocketInfo)initWithIPAddressString:(id)a3 ipAddressType:(int64_t)a4 port:(id)a5
{
  id v9;
  id v10;
  HAPSocketInfo *v11;
  HAPSocketInfo *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HAPSocketInfo;
  v11 = -[HAPSocketInfo init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_ipAddressString, a3);
    v12->_ipAddressType = a4;
    objc_storeStrong((id *)&v12->_port, a5);
  }

  return v12;
}

- (NSString)ipAddressStringWithScope
{
  char *v3;

  v3 = -[HAPSocketInfo ipAddressType](self, "ipAddressType");
  if ((unint64_t)(v3 - 1) <= 2)
  {
    -[HAPSocketInfo ipAddressString](self, "ipAddressString");
    v3 = (char *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[HAPSocketInfo ipAddressString](self, "ipAddressString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HAPSocketInfo ipAddressRemoveScopeWithAddress:](HAPSocketInfo, "ipAddressRemoveScopeWithAddress:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = CFSTR("HAPSocketInfoIPAddressString");
  v8[1] = CFSTR("HAPSocketInfoPort");
  v9[0] = v4;
  -[HAPSocketInfo port](self, "port");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *ipAddressString;
  NSNumber *port;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((ipAddressString = self->_ipAddressString, !((unint64_t)ipAddressString | v4[1]))
     || -[NSString isEqualToString:](ipAddressString, "isEqualToString:")))
  {
    port = self->_port;
    if ((unint64_t)port | v4[2])
      v7 = -[NSNumber isEqual:](port, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_ipAddressString, "hash");
  return -[NSNumber hash](self->_port, "hash") ^ v3;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@/%@"), objc_opt_class(), self->_ipAddressString, self->_port);
}

- (NSString)ipAddressString
{
  return self->_ipAddressString;
}

- (NSNumber)port
{
  return self->_port;
}

- (int64_t)ipAddressType
{
  return self->_ipAddressType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_ipAddressString, 0);
}

+ (id)ipAddressRemoveScopeWithAddress:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v9[3];
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9[2] = 0;
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v9[0] = 0;
    v9[1] = 0;
    v5 = objc_retainAutorelease(v3);
    if (inet_pton(30, (const char *)objc_msgSend(v5, "UTF8String"), v9) == 1
      && LOBYTE(v9[0]) == 254
      && (BYTE1(v9[0]) & 0xC0) == 0x80)
    {
      v5 = objc_retainAutorelease(v5);
      objc_msgSend(v5, "UTF8String");
      if (!StringToSockAddr())
      {
        SockAddrToString();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
        v6 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v6;
      }
    }
    v7 = v5;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)ipAddressAddScopeWithAddress:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[2];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v10[0] = 0;
    v10[1] = 0;
    v5 = objc_retainAutorelease(v3);
    if (inet_pton(30, (const char *)objc_msgSend(v5, "UTF8String"), v10) == 1
      && LOBYTE(v10[0]) == 254
      && (BYTE1(v10[0]) & 0xC0) == 0x80)
    {
      +[HAPInterfaceConfig activeWifiOrEthernetInterfaceName](HAPInterfaceConfig, "activeWifiOrEthernetInterfaceName");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6)
      {
        objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("%%%@"), v6);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = v5;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
