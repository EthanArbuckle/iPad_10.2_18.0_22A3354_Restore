@implementation HMDPrimaryElectionFindPrimaryMeshOperation

- (HMDPrimaryElectionFindPrimaryMeshOperation)initWithContext:(id)a3 otherResidents:(id)a4
{
  NSSet *v6;
  id v7;
  HMDPrimaryElectionFindPrimaryMeshOperation *v8;
  NSSet *otherResidents;
  objc_super v11;

  v6 = (NSSet *)a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDPrimaryElectionFindPrimaryMeshOperation;
  v7 = a3;
  v8 = -[HMFOperation initWithTimeout:](&v11, sel_initWithTimeout_, 0.0);
  objc_storeWeak((id *)&v8->_context, v7);

  otherResidents = v8->_otherResidents;
  v8->_otherResidents = v6;

  return v8;
}

- (void)main
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDPrimaryElectionFindPrimaryMeshOperation *v8;
  NSObject *v9;
  void *v10;
  NSSet *otherResidents;
  void *v12;
  NSSet *v13;
  void *v14;
  NSSet *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMFFuture *messagesFuture;
  HMFFuture *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;
  _QWORD v31[4];
  id v32;
  id v33;
  HMDPrimaryElectionFindPrimaryMeshOperation *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[HMDPrimaryElectionFindPrimaryMeshOperation context]((id *)&self->super.super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[HMDPrimaryElectionFindPrimaryMeshOperation isCancelled](self, "isCancelled") & 1) == 0 && v3)
  {
    v4 = objc_alloc(MEMORY[0x24BE3F168]);
    -[HMFOperation underlyingQueue](self, "underlyingQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithQueue:", v5);

    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Querying residents to see if we're in the primary mesh", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    if (v8)
      otherResidents = v8->_otherResidents;
    else
      otherResidents = 0;
    v12 = (void *)MEMORY[0x24BDBCEB8];
    v13 = otherResidents;
    objc_msgSend(v12, "arrayWithCapacity:", -[NSSet count](v13, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v15 = v8->_otherResidents;
    else
      v15 = 0;
    v16 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke;
    v31[3] = &unk_24E789E48;
    v17 = v3;
    v32 = v17;
    v18 = v6;
    v33 = v18;
    v34 = v8;
    v19 = v14;
    v35 = v19;
    -[NSSet hmf_enumerateWithAutoreleasePoolUsingBlock:](v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v31);
    v20 = (void *)MEMORY[0x24BE3F180];
    v21 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v20, "allSettled:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_messagesFuture, v22);

      objc_initWeak((id *)buf, v8);
      objc_initWeak(&location, v17);
      messagesFuture = v8->_messagesFuture;
    }
    else
    {

      objc_initWeak((id *)buf, 0);
      objc_initWeak(&location, v17);
      messagesFuture = 0;
    }
    v25 = messagesFuture;
    v27[0] = v16;
    v27[1] = 3221225472;
    v27[2] = __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke_55;
    v27[3] = &unk_24E797AF8;
    objc_copyWeak(&v28, (id *)buf);
    objc_copyWeak(&v29, &location);
    v26 = (id)-[HMFFuture inContext:then:](v25, "inContext:then:", v18, v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  -[HMDPrimaryElectionFindPrimaryMeshOperation context]((id *)&self->super.super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E79DB48;
  v7 = v5;

  return v7;
}

- (NSArray)results
{
  return self->_results;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesFuture, 0);
  objc_storeStrong((id *)&self->_otherResidents, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_results, 0);
}

- (id)context
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 40);
  return WeakRetained;
}

void __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDRemoteDeviceMessageDestination *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDRemoteDeviceMessageDestination *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDRemoteDeviceMessageDestination *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = [HMDRemoteDeviceMessageDestination alloc];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v4, "initWithTarget:device:", v6, v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F1D0]), "initWithName:destination:payload:", CFSTR("mesh.meshInformationRequest"), v8, 0);
  objc_msgSend(v9, "setTimeout:", 15.0);
  objc_msgSend(v9, "setSecureRemote:", 1);
  objc_msgSend(v9, "setRemoteRestriction:", 9);
  objc_msgSend(*(id *)(a1 + 32), "messageDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v10, "sendMessageExpectingResponse:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke_2;
  v26[3] = &unk_24E78A3B0;
  v14 = *(_QWORD *)(a1 + 40);
  v26[4] = *(_QWORD *)(a1 + 48);
  v27 = v3;
  v28 = *(id *)(a1 + 32);
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke_51;
  v24[3] = &unk_24E79B210;
  v24[4] = *(_QWORD *)(a1 + 48);
  v15 = v27;
  v25 = v15;
  objc_msgSend(v12, "inContext:then:orRecover:", v14, v26, v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x227676638]();
  v18 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = v8;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v20;
    v31 = 2114;
    v32 = v21;
    v33 = 2114;
    v34 = v22;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Querying resident %{public}@ with message %{public}@", buf, 0x20u);

    v8 = v23;
  }

  objc_autoreleasePoolPop(v17);
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v16);

}

uint64_t __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke_55(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (WeakRetained && v5)
  {
    objc_msgSend(v3, "na_map:", &__block_literal_global_58);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)WeakRetained[39];
    WeakRetained[39] = v7;

    v9 = (void *)MEMORY[0x227676638]();
    v10 = WeakRetained;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "results");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Got results: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v10, "finish");
  }
  else
  {
    objc_msgSend(WeakRetained, "cancel");
  }

  return 1;
}

id __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke_2_56(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    v7 = v2;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(a1[6], "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDPrimaryElectionMeshInformation meshInformationFromMessagePayload:home:](HMDPrimaryElectionMeshInformation, "meshInformationFromMessagePayload:home:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v5;
    }
    else
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = a1[4];
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "shortDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543874;
        v18 = v14;
        v19 = 2114;
        v20 = v15;
        v21 = 2112;
        v22 = v3;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to parse message payload for resident %{public}@: %@", (uint8_t *)&v17, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
    }

  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1[4];
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v9;
      v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@nil result for resident: %{public}@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

  return 1;
}

uint64_t __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Got error result for resident %{public}@: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_152708 != -1)
    dispatch_once(&logCategory__hmf_once_t14_152708, &__block_literal_global_61_152709);
  return (id)logCategory__hmf_once_v15_152710;
}

void __57__HMDPrimaryElectionFindPrimaryMeshOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v15_152710;
  logCategory__hmf_once_v15_152710 = v0;

}

@end
