@implementation _HMDIDSProxyLinkPreferenceAssertion

- (_HMDIDSProxyLinkPreferenceAssertion)initWithIDSProxyService:(id)a3
{
  id v5;
  _HMDIDSProxyLinkPreferenceAssertion *v6;
  _HMDIDSProxyLinkPreferenceAssertion *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _HMDIDSProxyLinkPreferenceAssertion *v16;
  NSObject *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_HMDIDSProxyLinkPreferenceAssertion;
  v6 = -[_HMDIDSProxyLinkPreferenceAssertion init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_proxyService, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 150);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE4FA08]);

    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("forceBTClassic"), *MEMORY[0x24BE4F9F8]);
    v10 = isWatch();
    if (v10)
      v11 = 6250;
    else
      v11 = 37500;
    if (v10)
      v12 = 37500;
    else
      v12 = 6250;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE4F9F0]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE4FA00]);

    v15 = (void *)MEMORY[0x227676638]();
    v16 = v7;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v18;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Setting the link preference for proxy service with %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDIDSService setLinkPreferences:](v7->_proxyService, "setLinkPreferences:", v8);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  _HMDIDSProxyLinkPreferenceAssertion *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the link preference for proxy service", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[_HMDIDSProxyLinkPreferenceAssertion proxyService](v4, "proxyService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLinkPreferences:", MEMORY[0x24BDBD1B8]);

  v8.receiver = v4;
  v8.super_class = (Class)_HMDIDSProxyLinkPreferenceAssertion;
  -[_HMDIDSProxyLinkPreferenceAssertion dealloc](&v8, sel_dealloc);
}

- (HMDIDSService)proxyService
{
  return self->_proxyService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyService, 0);
}

@end
