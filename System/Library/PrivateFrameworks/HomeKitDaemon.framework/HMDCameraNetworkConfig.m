@implementation HMDCameraNetworkConfig

- (HMDCameraNetworkConfig)init
{
  HMDCameraNetworkConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDCameraNetworkConfig;
  result = -[HMDCameraNetworkConfig init](&v3, sel_init);
  if (result)
    result->_ipv6 = 0;
  return result;
}

- (HMDCameraNetworkConfig)initWithAddress:(id)a3 ipv6:(BOOL)a4 rtpPort:(id)a5
{
  id v9;
  id v10;
  HMDCameraNetworkConfig *v11;
  HMDCameraNetworkConfig *v12;

  v9 = a3;
  v10 = a5;
  v11 = -[HMDCameraNetworkConfig init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_ipAddress, a3);
    v12->_ipv6 = a4;
    objc_storeStrong((id *)&v12->_rtpPort, a5);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDCameraNetworkConfig *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  sockaddr sa;
  sockaddr v10;

  v4 = +[HMDCameraNetworkConfig allocWithZone:](HMDCameraNetworkConfig, "allocWithZone:", a3);
  -[HMDCameraNetworkConfig ipAddress](self, "ipAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDCameraNetworkConfig ipv6](self, "ipv6");
  -[HMDCameraNetworkConfig rtpPort](self, "rtpPort");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDCameraNetworkConfig initWithAddress:ipv6:rtpPort:](v4, "initWithAddress:ipv6:rtpPort:", v5, v6, v7);

  sa = self->_ipv4SockAddress.sa;
  *(in6_addr *)(v8 + 20) = *(in6_addr *)((char *)&self->_ipv4SockAddress.v6.sin6_addr + 4);
  *(sockaddr *)(v8 + 8) = sa;
  v10 = self->_ipv6SockAddress.sa;
  *(in6_addr *)(v8 + 48) = *(in6_addr *)((char *)&self->_ipv6SockAddress.v6.sin6_addr + 4);
  *(sockaddr *)(v8 + 36) = v10;
  return (id)v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDCameraNetworkConfig ipAddress](self, "ipAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraNetworkConfig ipv6](self, "ipv6");
  HMFBooleanToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraNetworkConfig rtpPort](self, "rtpPort");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, v6:%@ %@>"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)ipAddress
{
  return self->_ipAddress;
}

- (void)setIpAddress:(id)a3
{
  objc_storeStrong((id *)&self->_ipAddress, a3);
}

- (BOOL)ipv6
{
  return self->_ipv6;
}

- (void)setIpv6:(BOOL)a3
{
  self->_ipv6 = a3;
}

- (NSNumber)rtpPort
{
  return self->_rtpPort;
}

- (void)setRtpPort:(id)a3
{
  objc_storeStrong((id *)&self->_rtpPort, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtpPort, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
}

+ (id)localIPAddress
{
  HMDCameraNetworkConfig *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  HMDCameraNetworkConfig *v6;
  __uint32_t *p_s_addr;
  unsigned int v8;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  HMDCameraNetworkConfig *v22;
  uint8_t buf[16];
  _WORD v24[15];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(HMDCameraNetworkConfig);
  if (!GetPrimaryIPAddress())
  {
    p_s_addr = &v2->_ipv4SockAddress.v4.sin_addr.s_addr;
    v8 = bswap32(v2->_ipv4SockAddress.v4.sin_addr.s_addr);
    if (HIWORD(v8) != 43518 && (v8 & 0xFFFFFF00) != -536870912)
    {
      *(_OWORD *)buf = 0u;
      memset(v24, 0, sizeof(v24));
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", inet_ntop(2, p_s_addr, (char *)buf, 0x2Eu));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraNetworkConfig setIpAddress:](v2, "setIpAddress:", v13);

      v6 = v2;
      v14 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        goto LABEL_19;
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v11;
      v21 = 2112;
      v22 = v6;
      v12 = "%{public}@Found IPv4 address: %@";
      goto LABEL_18;
    }
    if (v2->_ipv6SockAddress.v6.sin6_addr.__u6_addr8[0] == 254 && (v2->_ipv6SockAddress.sa.sa_data[7] & 0xC0) == 0x80)
    {
      *(_OWORD *)buf = 0u;
      memset(v24, 0, sizeof(v24));
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", inet_ntop(2, p_s_addr, (char *)buf, 0x2Eu));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraNetworkConfig setIpAddress:](v2, "setIpAddress:", v10);

      v6 = v2;
      v14 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v11;
        v21 = 2112;
        v22 = v6;
        v12 = "%{public}@Did not non-link-local IPv4 or IPv6, defaulting to IPv4: %@";
LABEL_18:
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v19, 0x16u);

      }
    }
    else
    {
      *(_OWORD *)buf = 0u;
      memset(v24, 0, sizeof(v24));
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", inet_ntop(30, &v2->_ipv6SockAddress.v6.sin6_addr, (char *)buf, 0x2Eu));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraNetworkConfig setIpAddress:](v2, "setIpAddress:", v17);

      -[HMDCameraNetworkConfig setIpv6:](v2, "setIpv6:", 1);
      v6 = v2;
      v14 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v11;
        v21 = 2112;
        v22 = v6;
        v12 = "%{public}@Found IPv6 address: %@";
        goto LABEL_18;
      }
    }
LABEL_19:

    objc_autoreleasePoolPop(v14);
    goto LABEL_20;
  }
  v3 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Failed to get Primary IP Address", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v6 = 0;
LABEL_20:

  return v6;
}

@end
