@implementation HMDDataStreamHAPSetupOperation

- (HMDDataStreamHAPSetupOperation)initWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6 maxControllerTransportMTU:(unint64_t)a7 setupOperationReadRequired:(BOOL)a8
{
  _BOOL4 v8;
  HMDDataStreamHAPSetupOperation *v10;
  HMDDataStreamHAPSetupOperation *v11;
  objc_super v13;

  v8 = a8;
  v13.receiver = self;
  v13.super_class = (Class)HMDDataStreamHAPSetupOperation;
  v10 = -[HMDDataStreamSetupOperation initWithAccessory:queue:logIdentifier:transferManagementService:](&v13, sel_initWithAccessory_queue_logIdentifier_transferManagementService_, a3, a4, a5, a6);
  v11 = v10;
  if (v10)
  {
    v10->_maxControllerTransportMTU = a7;
    if (v8)
      -[HMDDataStreamHAPSetupOperation _readRequiredTransportCharacteristics](v10, "_readRequiredTransportCharacteristics");
  }
  return v11;
}

- (void)setMaxControllerTransportMTU:(unint64_t)a3
{
  if (!self->_maxControllerTransportMTU)
    self->_maxControllerTransportMTU = a3;
}

- (void)_readRequiredTransportCharacteristics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  HMDDataStreamHAPSetupOperation *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *context;
  _QWORD v23[4];
  id v24;
  _QWORD block[5];
  _QWORD v26[2];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[HMDDataStreamSetupOperation transferManagementService](self, "transferManagementService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findCharacteristicWithType:", *MEMORY[0x24BDD5A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDDataStreamSetupOperation transferManagementService](self, "transferManagementService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "findCharacteristicWithType:", CFSTR("00000130-0000-1000-8000-0026BB765291"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    context = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamSetupOperation accessory](v8, "accessory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamSetupOperation accessory](v8, "accessory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v10;
      v29 = 2112;
      v30 = v12;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@HDS characteristic(s) not found configuration/version (%@/%@)", buf, 0x20u);

    }
    objc_autoreleasePoolPop(context);
    -[HMDDataStreamSetupOperation queue](v8, "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__HMDDataStreamHAPSetupOperation__readRequiredTransportCharacteristics__block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = v8;
    dispatch_async(v16, block);

  }
  else
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v17;
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    -[HMDDataStreamSetupOperation accessory](self, "accessory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamSetupOperation queue](self, "queue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __71__HMDDataStreamHAPSetupOperation__readRequiredTransportCharacteristics__block_invoke_2;
    v23[3] = &unk_24E79ADC0;
    objc_copyWeak(&v24, (id *)buf);
    objc_msgSend(v20, "readCharacteristicValues:source:queue:completionHandler:", v19, 7, v21, v23);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);

  }
}

- (void)startSetup
{
  void *v3;
  HMDDataStreamHAPSetupOperation *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDDataStreamHAPSetupOperation *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating new DataStream using HAP", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BA98]), "initWithValue:", 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BAA8]), "initWithValue:", 1);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BAB0]), "initWithCommand:transportType:controllerKeySalt:", v7, v8, 0);

  v24 = 0;
  objc_msgSend(v9, "serializeWithError:", &v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;
  if (v10)
  {
    -[HMDDataStreamSetupOperation transferManagementService](v4, "transferManagementService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "findCharacteristicWithType:", CFSTR("00000131-0000-1000-8000-0026BB765291"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:", v13, v10, 0, 0, 0, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, v4);
    -[HMDDataStreamSetupOperation accessory](v4, "accessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamSetupOperation queue](v4, "queue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __44__HMDDataStreamHAPSetupOperation_startSetup__block_invoke;
    v22[3] = &unk_24E79ADC0;
    objc_copyWeak(&v23, (id *)buf);
    objc_msgSend(v15, "writeCharacteristicValues:source:queue:completionHandler:", v16, 7, v17, v22);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v4;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new DataStream; cannot serialize request (%@)",
        buf,
        0x16u);

    }
    objc_autoreleasePoolPop(v18);
    -[HMDDataStreamSetupOperation postDidFailWithError:](v19, "postDidFailWithError:", v11);
  }

}

- (void)processTransportSetupResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDDataStreamHAPSetupOperation *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDDataStreamHAPSetupOperation *v18;
  NSObject *v19;
  void *v20;
  HMDDataStreamHAPTransport *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  HMDDataStreamHAPTransport *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "parameters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sessionIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v11;
      v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@[Start Stream] The setup transfer succeeded; will use session identifier %@",
        (uint8_t *)&v29,
        0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v4, "parameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sessionIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamHAPSetupOperation setSessionIdentifier:](v8, "setSessionIdentifier:", objc_msgSend(v16, "integerValue"));

    v17 = (void *)MEMORY[0x227676638]();
    v18 = v8;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@[Start Stream] DataStream configuration valid; starting stream",
        (uint8_t *)&v29,
        0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v21 = [HMDDataStreamHAPTransport alloc];
    -[HMDDataStreamSetupOperation accessory](v18, "accessory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HMDDataStreamHAPSetupOperation sessionIdentifier](v18, "sessionIdentifier");
    v24 = -[HMDDataStreamHAPSetupOperation maxControllerTransportMTU](v18, "maxControllerTransportMTU");
    -[HMDDataStreamSetupOperation queue](v18, "queue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamSetupOperation logIdentifier](v18, "logIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[HMDDataStreamHAPTransport initWithAccessory:sessionIdentifier:maxControllerTransportMTU:workQueue:logIdentifier:](v21, "initWithAccessory:sessionIdentifier:maxControllerTransportMTU:workQueue:logIdentifier:", v22, v23, v24, v25, v26);

    -[HMDDataStreamSetupOperation postDidSucceedWithTransport:sessionEncryption:](v18, "postDidSucceedWithTransport:sessionEncryption:", v27, 0);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v28;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply did not contain a session identifier", (uint8_t *)&v29, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 50);
    v27 = (HMDDataStreamHAPTransport *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamSetupOperation postDidFailWithError:](v8, "postDidFailWithError:", v27);
  }

}

- (unint64_t)maxControllerTransportMTU
{
  return self->_maxControllerTransportMTU;
}

- (int64_t)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(int64_t)a3
{
  self->_sessionIdentifier = a3;
}

void __44__HMDDataStreamHAPSetupOperation_startSetup__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "continueStreamSetupWithResponse:", v5);

}

void __71__HMDDataStreamHAPSetupOperation__readRequiredTransportCharacteristics__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_2557EE248))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(v2, "dataStreamInitializationSetupOperation:didCompleteSupportReadWithStatus:", *(_QWORD *)(a1 + 32), 0);

    }
  }
  else
  {

  }
}

void __71__HMDDataStreamHAPSetupOperation__readRequiredTransportCharacteristics__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "conformsToProtocol:", &unk_2557EE248))
    {
LABEL_5:

      v4 = v7;
      goto LABEL_6;
    }
    objc_msgSend(v7, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v7;
    if (v6)
    {
      objc_msgSend(v6, "dataStreamInitializationSetupOperation:didCompleteSupportReadWithStatus:", v7, a2 != 0);
      v5 = v6;
      goto LABEL_5;
    }
  }
LABEL_6:

}

@end
