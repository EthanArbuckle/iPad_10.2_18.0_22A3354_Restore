@implementation HMDRemoteEventRouterPrimaryResidentClient

- (unint64_t)messageTransportRestriction
{
  HMDRemoteEventRouterPrimaryResidentClient *v2;
  void *v3;

  v2 = self;
  -[HMDRemoteEventRouterClient dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v3, "routerClientShouldRestrictMessagingToLocalOnly:", v2);

  if ((_DWORD)v2)
    return 8;
  else
    return -1;
}

- (void)handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDRemoteEventRouterPrimaryResidentClient *v9;

  v4 = a3;
  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __110__HMDRemoteEventRouterPrimaryResidentClient_handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)_clientIsEnabled:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  _BOOL4 v9;

  v4 = a3;
  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDRemoteEventRouterClient dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "clientIsEnabled:", self);

  if (v7
    && (-[HMDRemoteEventRouterClient eventRouterClient](self, "eventRouterClient"),
        v8 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v8 == v4))
  {
    v9 = !-[HMDRemoteEventRouterClient isPrimaryResident](self, "isPrimaryResident");
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)dumpStateDescription
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v6.receiver = self;
  v6.super_class = (Class)HMDRemoteEventRouterPrimaryResidentClient;
  -[HMDRemoteEventRouterClient dumpStateDescription](&v6, sel_dumpStateDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[HMDRemoteEventRouterPrimaryResidentClient: %@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryResidentIdentifier, 0);
}

void __110__HMDRemoteEventRouterPrimaryResidentClient_handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  id Property;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v15.receiver = *(id *)(a1 + 40);
  v15.super_class = (Class)HMDRemoteEventRouterPrimaryResidentClient;
  objc_msgSendSuper2(&v15, sel_handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification_, v2);
  objc_msgSend(*(id *)(a1 + 40), "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routerClientPrimaryResidentDeviceIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && ((v6 = *(void **)(a1 + 40)) == 0 ? (Property = 0) : (Property = objc_getProperty(v6, v5, 112, 1)),
        (objc_msgSend(v4, "hmf_isEqualToUUID:", Property) & 1) == 0))
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating primary resident identifier to: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v14 = *(void **)(a1 + 40);
    if (v14)
    {
      objc_setProperty_atomic_copy(v14, v13, v4, 112);
      v14 = *(void **)(a1 + 40);
    }
    objc_msgSend(v14, "eventRouterClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serverDidChangeWithServerIdentifier:", v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "eventRouterClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "connectionCapabilityDidChange");
  }

}

@end
