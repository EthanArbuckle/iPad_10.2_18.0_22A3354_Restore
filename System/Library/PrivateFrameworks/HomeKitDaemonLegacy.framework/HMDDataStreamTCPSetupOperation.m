@implementation HMDDataStreamTCPSetupOperation

- (HMDDataStreamTCPSetupOperation)initWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6
{
  HMDDataStreamTCPSetupOperation *v6;
  uint64_t v7;
  NSData *controllerKeySalt;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMDDataStreamTCPSetupOperation;
  v6 = -[HMDDataStreamSetupOperation initWithAccessory:queue:logIdentifier:transferManagementService:](&v10, sel_initWithAccessory_queue_logIdentifier_transferManagementService_, a3, a4, a5, a6);
  if (v6)
  {
    HMFRandomDataWithLength();
    v7 = objc_claimAutoreleasedReturnValue();
    controllerKeySalt = v6->_controllerKeySalt;
    v6->_controllerKeySalt = (NSData *)v7;

  }
  return v6;
}

- (BOOL)_isComplete
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HMDDataStreamTCPSetupOperation remoteNetAddress](self, "remoteNetAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[HMDDataStreamTCPSetupOperation remoteTcpPort](self, "remoteTcpPort"))
  {
    -[HMDDataStreamTCPSetupOperation sessionEncryption](self, "sessionEncryption");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_fullKeySalt
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDDataStreamTCPSetupOperation controllerKeySalt](self, "controllerKeySalt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDDataStreamTCPSetupOperation accessoryKeySalt](self, "accessoryKeySalt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendData:", v5);

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (void)startSetup
{
  void *v3;
  void *v4;
  void *v5;
  HMDDataStreamTCPSetupOperation *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDDataStreamTCPSetupOperation *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[HMDDataStreamSetupOperation accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyIPServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Creating new DataStream using TCP", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDDataStreamTCPSetupOperation controllerKeySalt](v6, "controllerKeySalt");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D164A0]), "initWithValue:", 0);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D164B0]), "initWithValue:", 0);
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D164B8]), "initWithCommand:transportType:controllerKeySalt:", v11, v12, v10);

    v30 = 0;
    objc_msgSend(v26, "serializeWithError:", &v30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v30;
    if (v13)
    {
      -[HMDDataStreamSetupOperation transferManagementService](v6, "transferManagementService");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "findCharacteristicWithType:", CFSTR("00000131-0000-1000-8000-0026BB765291"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v16, v13, 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, v6);
      -[HMDDataStreamSetupOperation accessory](v6, "accessory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamSetupOperation queue](v6, "queue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __44__HMDDataStreamTCPSetupOperation_startSetup__block_invoke;
      v27[3] = &unk_1E89C18A8;
      objc_copyWeak(&v29, (id *)buf);
      v28 = v4;
      objc_msgSend(v18, "writeCharacteristicValues:source:queue:completionHandler:", v19, 7, v20, v27);

      -[HMDDataStreamTCPSetupOperation _finishStreamTransport](v6, "_finishStreamTransport");
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = v6;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v25;
        v34 = 2112;
        v35 = v14;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new DataStream; cannot serialize request (%@)",
          buf,
          0x16u);

      }
      objc_autoreleasePoolPop(v22);
      -[HMDDataStreamSetupOperation postDidFailWithError:](v23, "postDidFailWithError:", v14);
    }

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v21;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new DataStream; does not appear to be IP-connected",
        buf,
        0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamSetupOperation postDidFailWithError:](v6, "postDidFailWithError:", v14);
  }

}

- (void)processTransportSetupResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDDataStreamTCPSetupOperation *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "accessoryKeySalt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v19;
      v20 = "%{public}@[Start Stream] The setup transfer write reply did not contain key information";
LABEL_10:
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v22, 0xCu);

    }
LABEL_11:

    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 50);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamSetupOperation postDidFailWithError:](v9, "postDidFailWithError:", v21);

    goto LABEL_12;
  }
  objc_msgSend(v4, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tcpListeningPort");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v19;
      v20 = "%{public}@[Start Stream] The setup transfer write reply did not contain a TCP port";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tcpListeningPort");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v12;
    v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@[Start Stream] The setup transfer succeeded; will use port %@",
      (uint8_t *)&v22,
      0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v4, "parameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tcpListeningPort");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "value");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamTCPSetupOperation setRemoteTcpPort:](v9, "setRemoteTcpPort:", objc_msgSend(v17, "integerValue"));

  objc_msgSend(v4, "accessoryKeySalt");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamTCPSetupOperation setAccessoryKeySalt:](v9, "setAccessoryKeySalt:", v18);

  -[HMDDataStreamTCPSetupOperation _generateStreamKeys](v9, "_generateStreamKeys");
LABEL_12:

}

- (void)_generateStreamKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDDataStreamTCPSetupOperation *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  -[HMDDataStreamSetupOperation accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyIPServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_initWeak(location, self);
    -[HMDDataStreamTCPSetupOperation _fullKeySalt](self, "_fullKeySalt");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__HMDDataStreamTCPSetupOperation__generateStreamKeys__block_invoke;
    v11[3] = &unk_1E89A65E8;
    objc_copyWeak(&v12, location);
    objc_msgSend(v4, "createKeysForDataStreamWithKeySalt:completionHandler:", v5, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(location);
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new DataStream; device appears to have lost IP-connectivity",
        (uint8_t *)location,
        0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamSetupOperation postDidFailWithError:](v7, "postDidFailWithError:", v10);

  }
}

- (id)_createTCPTransport
{
  void *v3;
  void *v4;
  void *v5;
  HMDDataStreamTCPSetupOperation *v6;
  NSObject *v7;
  void *v8;
  HMDDataStreamTCPTransport *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HMDDataStreamTCPTransport *v15;
  int64_t v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HMDDataStreamSetupOperation accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriEndpointProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@[Start Stream] Accessory is a Siri endpoint, creating transport with elevated scheduling mode", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v9 = [HMDDataStreamTCPTransport alloc];
    -[HMDDataStreamTCPSetupOperation remoteNetAddress](v6, "remoteNetAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDDataStreamTCPSetupOperation remoteTcpPort](v6, "remoteTcpPort");
    -[HMDDataStreamSetupOperation queue](v6, "queue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamSetupOperation logIdentifier](v6, "logIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMDDataStreamTCPTransport initWithAddress:port:targetQueue:logIdentifier:](v9, "initWithAddress:port:targetQueue:logIdentifier:", v10, v11, v12, v13);
  }
  else
  {
    v15 = [HMDDataStreamTCPTransport alloc];
    -[HMDDataStreamTCPSetupOperation remoteNetAddress](self, "remoteNetAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMDDataStreamTCPSetupOperation remoteTcpPort](self, "remoteTcpPort");
    -[HMDDataStreamSetupOperation queue](self, "queue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamSetupOperation logIdentifier](self, "logIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMDDataStreamTCPTransport initWithAddress:port:workQueue:logIdentifier:](v15, "initWithAddress:port:workQueue:logIdentifier:", v10, v16, v12, v13);
  }
  v17 = (void *)v14;

  return v17;
}

- (void)_finishStreamTransport
{
  BOOL v3;
  void *v4;
  HMDDataStreamTCPSetupOperation *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = -[HMDDataStreamTCPSetupOperation _isComplete](self, "_isComplete");
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@[Start Stream] DataStream configuration valid; starting stream",
        (uint8_t *)&v15,
        0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDDataStreamTCPSetupOperation _createTCPTransport](v5, "_createTCPTransport");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamTCPSetupOperation sessionEncryption](v5, "sessionEncryption");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamSetupOperation postDidSucceedWithTransport:sessionEncryption:](v5, "postDidSucceedWithTransport:sessionEncryption:", v9, v10);

  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HMDDataStreamTCPSetupOperation remoteTcpPort](v5, "remoteTcpPort") != 0;
      -[HMDDataStreamTCPSetupOperation remoteNetAddress](v5, "remoteNetAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamTCPSetupOperation sessionEncryption](v5, "sessionEncryption");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v11;
      v17 = 1024;
      v18 = v12;
      v19 = 1024;
      v20 = v13 != 0;
      v21 = 1024;
      v22 = v14 != 0;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@[Start Stream] Setup still in progress (hasPort=%d, hasHostname=%d, hasEnc=%d)", (uint8_t *)&v15, 0x1Eu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (HMFNetAddress)remoteNetAddress
{
  return self->_remoteNetAddress;
}

- (void)setRemoteNetAddress:(id)a3
{
  objc_storeStrong((id *)&self->_remoteNetAddress, a3);
}

- (NSData)controllerKeySalt
{
  return self->_controllerKeySalt;
}

- (NSData)accessoryKeySalt
{
  return self->_accessoryKeySalt;
}

- (void)setAccessoryKeySalt:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryKeySalt, a3);
}

- (int64_t)remoteTcpPort
{
  return self->_remoteTcpPort;
}

- (void)setRemoteTcpPort:(int64_t)a3
{
  self->_remoteTcpPort = a3;
}

- (HAPSecuritySessionEncryption)sessionEncryption
{
  return self->_sessionEncryption;
}

- (void)setSessionEncryption:(id)a3
{
  objc_storeStrong((id *)&self->_sessionEncryption, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEncryption, 0);
  objc_storeStrong((id *)&self->_accessoryKeySalt, 0);
  objc_storeStrong((id *)&self->_controllerKeySalt, 0);
  objc_storeStrong((id *)&self->_remoteNetAddress, 0);
}

void __53__HMDDataStreamTCPSetupOperation__generateStreamKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v5 || v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v13;
        v16 = 2112;
        v17 = v6;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create secure session for the accessory (%@)", (uint8_t *)&v14, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "postDidFailWithError:", v6);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v12;
        v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@[Start Stream] Key creation succeeded; will use session encryption %@",
          (uint8_t *)&v14,
          0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(v9, "setSessionEncryption:", v5);
      objc_msgSend(v9, "_finishStreamTransport");
      v6 = 0;
    }
  }

}

void __44__HMDDataStreamTCPSetupOperation_startSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "peerAddressEx");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setRemoteNetAddress:", v5);

    objc_msgSend(WeakRetained, "remoteNetAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(WeakRetained, "continueStreamSetupWithResponse:", v3);
    }
    else
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = WeakRetained;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v10;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new DataStream; invalid IP address",
          (uint8_t *)&v13,
          0xCu);

      }
      objc_autoreleasePoolPop(v7);
      v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 54, 0);
      objc_msgSend(v8, "postDidFailWithError:", v12);

    }
  }

}

@end
