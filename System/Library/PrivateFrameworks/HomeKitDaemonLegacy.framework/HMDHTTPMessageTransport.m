@implementation HMDHTTPMessageTransport

- (HMDHTTPMessageTransport)initWithAccountRegistry:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  HMDHTTPMessageTransport *v7;

  v4 = (objc_class *)MEMORY[0x1E0D28620];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithDomain:serviceType:", CFSTR("local."), CFSTR("_homekit._tcp."));
  v7 = -[HMDHTTPMessageTransport initWithAccountRegistry:clientBrowser:](self, "initWithAccountRegistry:clientBrowser:", v5, v6);

  return v7;
}

- (HMDHTTPMessageTransport)initWithAccountRegistry:(id)a3 clientBrowser:(id)a4
{
  id v7;
  HMDHTTPMessageTransport *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  NSMutableArray *clientTransports;
  uint64_t v16;
  NSMutableDictionary *txtRecord;
  objc_super v19;

  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HMDHTTPMessageTransport;
  v8 = -[HMDRemoteMessageTransport initWithAccountRegistry:](&v19, sel_initWithAccountRegistry_, a3);
  if (v8)
  {
    HMDispatchQueueNameString();
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    clientTransports = v8->_clientTransports;
    v8->_clientTransports = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    txtRecord = v8->_txtRecord;
    v8->_txtRecord = (NSMutableDictionary *)v16;

    objc_storeStrong((id *)&v8->_clientBrowser, a4);
    -[HMFNetServiceBrowser setDelegate:](v8->_clientBrowser, "setDelegate:", v8);
    -[HMFNetServiceBrowser setShouldCache:](v8->_clientBrowser, "setShouldCache:", 1);
  }

  return v8;
}

- (id)shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDHTTPMessageTransport logIdentifier](self, "logIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "shortDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "shortDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)descriptionWithPointer:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHTTPMessageTransport currentDevice](self, "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %@, Identifier = %@>"), v6, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %@, Identifier = %@>"), v6, v9, &stru_1E89C3E38);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (NSString)debugDescription
{
  return (NSString *)-[HMDHTTPMessageTransport descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[HMDHTTPMessageTransport descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (int)transportType
{
  return 3;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;

  -[HMDHTTPMessageTransport currentDevice](self, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("Unknown");
  }

  return v5;
}

- (int64_t)qualityOfService
{
  return 1;
}

- (BOOL)isDeviceConnected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDHTTPMessageTransport *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  void *v11;
  HMDHTTPMessageTransport *v12;
  void *v13;
  void *v14;
  int v15;
  HMDHTTPMessageTransport *v16;
  BOOL v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHTTPMessageTransport clientTransportForDevice:](self, "clientTransportForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isReachable"))
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v9;
      v10 = "%{public}@Can send, client is reachable";
LABEL_10:
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v19, 0xCu);

    }
  }
  else
  {
    -[HMDHTTPMessageTransport _serviceForDevice:](self, "_serviceForDevice:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v9;
        v10 = "%{public}@Can send, device is advertising";
        goto LABEL_10;
      }
    }
    else
    {
      -[HMDHTTPMessageTransport serverTransport](self, "serverTransport");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "devices");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", v4);

      if (!v15)
      {
        v17 = 0;
        goto LABEL_12;
      }
      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v9;
        v10 = "%{public}@Can send, device is connected";
        goto LABEL_10;
      }
    }
  }

  objc_autoreleasePoolPop(v6);
  v17 = 1;
LABEL_12:

  return v17;
}

- (BOOL)canSendMessage:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  HMDHTTPDevice *v10;
  void *v11;
  HMDHTTPDevice *v12;
  BOOL v13;

  v4 = a3;
  objc_msgSend(v4, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && (objc_msgSend(v4, "restriction") & 2) != 0
    && (-[HMDHTTPMessageTransport currentDevice](self, "currentDevice"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    objc_msgSend(v4, "destination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = [HMDHTTPDevice alloc];
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMDHTTPDevice initWithIdentifier:](v10, "initWithIdentifier:", v11);

    v13 = -[HMDHTTPMessageTransport isDeviceConnected:](self, "isDeviceConnected:", v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMDHTTPMessageTransport *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HMDHTTPMessageTransport_sendMessage_completionHandler___block_invoke;
  block[3] = &unk_1E89C1B48;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_sendMessage:(id)a3 destination:(id)a4 timeout:(double)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDHTTPMessageTransport *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  int v21;
  void *v22;
  HMDHTTPMessageTransport *v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  HMDHTTPMessageTransport *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  HMDHTTPMessageTransport *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  id v51;
  double v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v55 = v16;
    v56 = 2112;
    v57 = v17;
    v58 = 2112;
    v59 = v11;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending message, %@, to %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDHTTPMessageTransport _serviceForDevice:](v14, "_serviceForDevice:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHTTPMessageTransport clientTransportForDevice:](v14, "clientTransportForDevice:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    v20 = 1;
  else
    v20 = v18 == 0;
  v21 = !v20;
  if (!v20)
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = v14;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v46 = v11;
      v25 = v18;
      v26 = v10;
      v27 = v12;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v28;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Not currently tracking client, starting to track client", buf, 0xCu);

      v12 = v27;
      v10 = v26;
      v18 = v25;
      v11 = v46;
    }

    objc_autoreleasePoolPop(v22);
  }
  if (objc_msgSend(v19, "isRunning", v46))
  {
    objc_msgSend(v19, "sendMessage:timeout:completionHandler:", v10, v12, a5);
    goto LABEL_28;
  }
  if ((v21 | objc_msgSend(v19, "isReachable")) == 1)
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = v14;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v32;
      v56 = 2112;
      v57 = v11;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Not currently connected to device, %@, so attempting to connect and send message.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __76__HMDHTTPMessageTransport__sendMessage_destination_timeout_responseHandler___block_invoke;
    v47[3] = &unk_1E89A5CE0;
    v47[4] = v30;
    v48 = v11;
    v49 = v18;
    v51 = v12;
    v50 = v10;
    v52 = a5;
    -[HMDHTTPMessageTransport _connectToDevice:completionHandler:](v30, "_connectToDevice:completionHandler:", v48, v47);

    goto LABEL_28;
  }
  -[HMDHTTPMessageTransport serverTransport](v14, "serverTransport");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "devices");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "containsObject:", v11);

  v36 = (void *)MEMORY[0x1D17BA0A0]();
  v37 = v14;
  HMFGetOSLogHandle();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v35)
  {
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v40;
      _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@Unable to send via client, falling back to sending message via the server", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v36);
    -[HMDHTTPMessageTransport serverTransport](v37, "serverTransport");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)MEMORY[0x1E0C99E60];
    v53 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setWithArray:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "sendMessage:toDevices:timeout:completionHandler:", v10, v44, v12, a5);

    goto LABEL_27;
  }
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v55 = v45;
    v56 = 2112;
    v57 = v11;
    _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unable to send message to destination: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v36);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 54, CFSTR("Communication error."), CFSTR("No valid connection for destination"), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v41);
LABEL_27:

  }
LABEL_28:

}

- (void)_handleReceivedRequestMessage:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHTTPMessageTransport *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDRemoteDeviceMessageDestination *v17;
  void *v18;
  void *v19;
  HMDRemoteDeviceMessageDestination *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  NSObject *queue;
  void *v29;
  HMDHTTPMessageTransport *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDHTTPMessageTransport *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  _QWORD block[4];
  id v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  char v63;
  id v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v66 = v14;
    v67 = 2112;
    v68 = v15;
    v69 = 2112;
    v70 = v9;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Received incoming message, %@, from: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v64 = 0;
  +[HMDRemoteMessageSerialization remoteMessageWithDictionary:error:](HMDRemoteMessageSerialization, "remoteMessageWithDictionary:error:", v8, &v64);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v64;
  if (v16)
  {
    objc_msgSend(v16, "setRestriction:", objc_msgSend((id)objc_opt_class(), "restriction"));
    -[HMDHTTPMessageTransport deviceForHTTPDevice:](v12, "deviceForHTTPDevice:", v9);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      v17 = [HMDRemoteDeviceMessageDestination alloc];
      objc_msgSend(v16, "destination");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "target");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v17, "initWithTarget:device:", v19, v52);

      objc_msgSend(v16, "setDestination:", v20);
      objc_msgSend(v16, "messagePayload");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "mutableCopy");

      -[HMDRemoteDeviceMessageDestination device](v20, "device");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "remoteDestinationString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("kIDSMessageSourceIDKey"));

      objc_msgSend(v16, "setMessagePayload:", v22);
      objc_initWeak((id *)buf, v12);
      if (objc_msgSend(v16, "type"))
      {
        objc_msgSend(v16, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = MEMORY[0x1E0C809B0];
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __86__HMDHTTPMessageTransport__handleReceivedRequestMessage_fromDevice_completionHandler___block_invoke_3;
        v55[3] = &unk_1E89BFD00;
        v55[4] = v12;
        v27 = v25;
        v56 = v27;
        objc_msgSend(v16, "setResponseHandler:", v55);
        if (v10)
        {
          queue = v12->_queue;
          block[0] = v26;
          block[1] = 3221225472;
          block[2] = __86__HMDHTTPMessageTransport__handleReceivedRequestMessage_fromDevice_completionHandler___block_invoke_67;
          block[3] = &unk_1E89C0870;
          v54 = v10;
          dispatch_async(queue, block);

        }
      }
      else
      {
        objc_msgSend(v16, "name");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "destination");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v16, "isSecure");
        objc_msgSend(v16, "transactionIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __86__HMDHTTPMessageTransport__handleReceivedRequestMessage_fromDevice_completionHandler___block_invoke;
        v57[3] = &unk_1E89A5D08;
        objc_copyWeak(&v62, (id *)buf);
        v61 = v10;
        v27 = v38;
        v58 = v27;
        v42 = v39;
        v59 = v42;
        v63 = v40;
        v43 = v41;
        v60 = v43;
        objc_msgSend(v16, "setInternalResponseHandler:", v57);

        objc_destroyWeak(&v62);
      }

      if ((objc_msgSend(v16, "isSecure") & 1) != 0
        || !+[HMDSecureRemoteSession isSecureRemoteSessionMessage:](HMDSecureRemoteSession, "isSecureRemoteSessionMessage:", v16))
      {
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter", v51);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDRemoteMessageLogEvent receivedRemoteMessage:transportType:](HMDRemoteMessageLogEvent, "receivedRemoteMessage:transportType:", v16, -[HMDHTTPMessageTransport transportType](v12, "transportType"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "submitLogEvent:", v45);

      }
      objc_msgSend(v16, "userInfo", v51);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend(v46, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDHTTPMessageTransport transportType](v12, "transportType"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setObject:forKeyedSubscript:", v48, CFSTR("kRemoteMessageTransportAttributionKey"));

      objc_msgSend(v16, "internal");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setUserInfo:", v47);

      -[HMFMessageTransport delegate](v12, "delegate");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "messageTransport:didReceiveMessage:", v12, v16);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      v33 = (void *)MEMORY[0x1D17BA0A0]();
      v34 = v12;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v66 = v36;
        v67 = 2112;
        v68 = v8;
        v69 = 2112;
        v70 = v9;
        _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Received message, %@, from unknown device: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v33);
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmd_HTTPMessageTransportErrorWithCode:", 100);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v37);

      }
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = v12;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v32;
      v67 = 2112;
      v68 = v8;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Received invalid HTTP message payload, dropping it: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    if (v10)
      (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v51);
  }

}

- (BOOL)isServerEnabled
{
  HMDHTTPMessageTransport *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_serverEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setServerEnabled:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  HMDHTTPMessageTransport *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v3
    && !+[HMDHTTPMessageTransport shouldHostMessageServer](HMDHTTPMessageTransport, "shouldHostMessageServer"))
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Enabling server is not supported on this device", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
  else if (self->_serverEnabled != v3)
  {
    self->_serverEnabled = v3;
    -[HMDHTTPMessageTransport handleServerEnabled:](self, "handleServerEnabled:", v3);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)handleServerEnabled:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__HMDHTTPMessageTransport_handleServerEnabled___block_invoke;
  v4[3] = &unk_1E89C2758;
  v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (NSDictionary)TXTRecord
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableDictionary copy](self->_txtRecord, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (void)setTXTRecordValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary setValue:forKey:](self->_txtRecord, "setValue:forKey:", v7, v6);
  -[HMDHTTPServerMessageTransport setTXTRecordValue:forKey:](self->_serverTransport, "setTXTRecordValue:forKey:", v7, v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeTXTRecordValueForKey:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeObjectForKey:](self->_txtRecord, "removeObjectForKey:", v4);
  -[HMDHTTPServerMessageTransport removeTXTRecordValueForKey:](self->_serverTransport, "removeTXTRecordValueForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (HMDHTTPDevice)currentDevice
{
  os_unfair_lock_s *p_lock;
  HMDHTTPDevice *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_currentDevice;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCurrentDevice:(id)a3
{
  HMDHTTPDevice *v4;
  HMDHTTPDevice *currentDevice;

  v4 = (HMDHTTPDevice *)a3;
  os_unfair_lock_lock_with_options();
  currentDevice = self->_currentDevice;
  self->_currentDevice = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDHTTPServerMessageTransport)serverTransport
{
  os_unfair_lock_s *p_lock;
  HMDHTTPServerMessageTransport *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_serverTransport;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setServerTransport:(id)a3
{
  HMDHTTPServerMessageTransport *v4;
  HMDHTTPServerMessageTransport *serverTransport;

  v4 = (HMDHTTPServerMessageTransport *)a3;
  os_unfair_lock_lock_with_options();
  serverTransport = self->_serverTransport;
  self->_serverTransport = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)deviceForHTTPDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[HMDRemoteMessageTransport accountRegistry](self, "accountRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v22)
  {
    v7 = *(_QWORD *)v29;
    v23 = v6;
    v21 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v9, "devices");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v25;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v25 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
              objc_msgSend(v15, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "identifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v16, "isEqual:", v17);

              if ((v18 & 1) != 0)
              {
                v19 = v15;

                v6 = v23;
                goto LABEL_19;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v12)
              continue;
            break;
          }
        }

        v6 = v23;
        v7 = v21;
      }
      v19 = 0;
      v22 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v22);
  }
  else
  {
    v19 = 0;
  }
LABEL_19:

  return v19;
}

- (NSArray)clientTransports
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_clientTransports, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)clientTransportForDevice:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_clientTransports;
  v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "remoteDevice", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)clientTransportForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDHTTPMessageTransport *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __httpDeviceForNetService(v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDHTTPMessageTransport clientTransportForDevice:](self, "clientTransportForDevice:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Unable to create device from net service name %@, so ignoring", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v6 = 0;
  }

  return v6;
}

- (void)addClientTransport:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    -[NSMutableArray addObject:](self->_clientTransports, "addObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (void)removeClientTransport:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    -[NSMutableArray removeObject:](self->_clientTransports, "removeObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (void)removeAllClientTransports
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeAllObjects](self->_clientTransports, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (id)_serviceForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMDHTTPMessageTransport clientBrowser](self, "clientBrowser", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedNetServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v10, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);

        objc_msgSend(v4, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if ((v15 & 1) != 0)
        {
          v7 = v10;

          goto LABEL_11;
        }

      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)configureWithDevice:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__HMDHTTPMessageTransport_configureWithDevice___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_startServerWithDevice:(id)a3
{
  id v4;
  void *v5;
  HMDHTTPMessageTransport *v6;
  NSObject *v7;
  void *v8;
  HMDHTTPServerMessageTransport *v9;
  void *v10;
  HMDHTTPServerMessageTransport *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting server", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = [HMDHTTPServerMessageTransport alloc];
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDHTTPServerMessageTransport initWithServerIdentifier:](v9, "initWithServerIdentifier:", v10);
  -[HMDHTTPMessageTransport setServerTransport:](v6, "setServerTransport:", v11);

  -[HMDHTTPMessageTransport serverTransport](v6, "serverTransport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", v6);

  -[HMDHTTPMessageTransport serverTransport](v6, "serverTransport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__HMDHTTPMessageTransport__startServerWithDevice___block_invoke;
  v14[3] = &unk_1E89C2350;
  v14[4] = v6;
  objc_msgSend(v13, "startWithCompletionHandler:", v14);

}

- (void)_stopServer
{
  void *v3;
  void *v4;
  HMDHTTPMessageTransport *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HMDHTTPMessageTransport serverTransport](self, "serverTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Stopping server", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDHTTPMessageTransport serverTransport](v5, "serverTransport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stop");

    -[HMDHTTPMessageTransport setServerTransport:](v5, "setServerTransport:", 0);
  }
}

- (void)_connectToDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  HMDHTTPClientMessageTransport *v11;
  void *v12;
  void *v13;
  HMDHTTPClientMessageTransport *v14;
  uint64_t v15;
  void *v16;
  HMDHTTPMessageTransport *v17;
  NSObject *v18;
  void *v19;
  HMDHTTPClientMessageTransport *v20;
  void *v21;
  _QWORD v22[4];
  HMDHTTPClientMessageTransport *v23;
  void (**v24)(id, void *, _QWORD);
  id v25;
  _QWORD v26[4];
  id v27;
  void (**v28)(id, void *, _QWORD);
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  -[HMDHTTPMessageTransport clientTransportForDevice:](self, "clientTransportForDevice:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "isRunning"))
    {
      if (v7)
        v7[2](v7, v9, 0);
    }
    else
    {
      objc_initWeak((id *)buf, self);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __62__HMDHTTPMessageTransport__connectToDevice_completionHandler___block_invoke;
      v26[3] = &unk_1E89C0650;
      objc_copyWeak(&v29, (id *)buf);
      v28 = v7;
      v27 = v9;
      objc_msgSend(v27, "startWithCompletionHandler:", v26);

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    -[HMDHTTPMessageTransport _serviceForDevice:](self, "_serviceForDevice:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_11;
    v11 = [HMDHTTPClientMessageTransport alloc];
    -[HMDHTTPMessageTransport currentDevice](self, "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMDHTTPClientMessageTransport initWithIdentifier:netService:](v11, "initWithIdentifier:netService:", v13, v10);

    v15 = -[HMDHTTPClientMessageTransport setDelegate:](v14, "setDelegate:", self);
    if (v14)
    {
      v16 = (void *)MEMORY[0x1D17BA0A0](v15);
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v19;
        v32 = 2112;
        v33 = v6;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Created a new messaging client for %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      -[HMDHTTPMessageTransport addClientTransport:](v17, "addClientTransport:", v14);
      objc_initWeak((id *)buf, v17);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __62__HMDHTTPMessageTransport__connectToDevice_completionHandler___block_invoke_79;
      v22[3] = &unk_1E89C0650;
      objc_copyWeak(&v25, (id *)buf);
      v24 = v7;
      v20 = v14;
      v23 = v20;
      -[HMDHTTPClientMessageTransport startWithCompletionHandler:](v20, "startWithCompletionHandler:", v22);

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);

    }
    else
    {
LABEL_11:
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Not found."), CFSTR("Unable to find device."), 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, void *))v7)[2](v7, 0, v21);

      }
    }

  }
}

- (void)startObservingIsPublishingForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *queue;
  void *v9;
  HMDHTTPMessageTransport *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHTTPMessageTransport *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __httpDeviceForNetService(v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDHTTPMessageTransport deviceForHTTPDevice:](self, "deviceForHTTPDevice:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      queue = self->_queue;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __64__HMDHTTPMessageTransport_startObservingIsPublishingForService___block_invoke;
      v19[3] = &unk_1E89C2328;
      v20 = v6;
      v21 = v4;
      dispatch_async(queue, v19);

    }
    else
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v23 = v17;
        v24 = 2112;
        v25 = v5;
        v26 = 2112;
        v27 = v18;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Unable to find device with UUID %@, from net service name %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Unable to create http device from net service name %@, ignoring", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)client:(id)a3 didStopWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHTTPMessageTransport *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDHTTPMessageTransport *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v11;
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Client, %@, did stop with error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDHTTPMessageTransport serverTransport](v9, "serverTransport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "devices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if (v15)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v9;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "remoteDevice");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v19;
      v29 = 2112;
      v30 = v20;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Starting server confirmation for device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_initWeak((id *)buf, v17);
    objc_initWeak(&location, v6);
    -[HMDHTTPMessageTransport serverTransport](v17, "serverTransport");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __51__HMDHTTPMessageTransport_client_didStopWithError___block_invoke;
    v23[3] = &unk_1E89A5D58;
    objc_copyWeak(&v24, (id *)buf);
    objc_copyWeak(&v25, &location);
    objc_msgSend(v21, "confirmDevice:completionHandler:", v22, v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

}

- (void)client:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__HMDHTTPMessageTransport_client_didReceiveMessage_completionHandler___block_invoke;
  v15[3] = &unk_1E89C0448;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)server:(id)a3 didStopWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHTTPMessageTransport *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Server stopped with error: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)server:(id)a3 didAddDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHTTPMessageTransport *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@New device added: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)server:(id)a3 didRemoveDevice:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__HMDHTTPMessageTransport_server_didRemoveDevice___block_invoke;
  v8[3] = &unk_1E89C2328;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)server:(id)a3 didReceiveMessage:(id)a4 fromDevice:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__HMDHTTPMessageTransport_server_didReceiveMessage_fromDevice_completionHandler___block_invoke;
  v16[3] = &unk_1E89C0448;
  v16[4] = self;
  v17 = v10;
  v18 = v9;
  v19 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  dispatch_async(queue, v16);

}

- (void)netServiceBrowser:(id)a3 didStopBrowsingWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHTTPMessageTransport *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Client browser stopped with error: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)netServiceBrowser:(id)a3 didAddService:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  HMDHTTPMessageTransport *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHTTPMessageTransport *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHTTPMessageTransport clientBrowser](self, "clientBrowser");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Discovered new client: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDHTTPMessageTransport clientTransportForService:](v10, "clientTransportForService:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = v10;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = v17;
        v23 = 2112;
        v24 = v7;
        v25 = 2112;
        v26 = v13;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Added service, %@, for existing client: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __59__HMDHTTPMessageTransport_netServiceBrowser_didAddService___block_invoke;
      v18[3] = &unk_1E89C0DA8;
      v18[4] = v15;
      v19 = v7;
      v20 = v13;
      objc_msgSend(v19, "confirmWithTimeout:completionHandler:", v18, 0.0);

    }
    -[HMDHTTPMessageTransport startObservingIsPublishingForService:](v10, "startObservingIsPublishingForService:", v7);

  }
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMDHTTPMessageTransport *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__HMDHTTPMessageTransport_netServiceBrowser_didRemoveService___block_invoke;
  block[3] = &unk_1E89C20C8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHTTPMessageTransport debugDescription](self, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D27EE0]);

  -[HMDHTTPMessageTransport clientTransports](self, "clientTransports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dumpState", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clientTransports"));
  -[HMDHTTPMessageTransport serverTransport](self, "serverTransport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[HMDHTTPMessageTransport serverTransport](self, "serverTransport");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dumpState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("serverTransport"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("No server transport"), CFSTR("serverTransport"));
  }

  return v3;
}

- (HMFNetServiceBrowser)clientBrowser
{
  return self->_clientBrowser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBrowser, 0);
  objc_storeStrong((id *)&self->_serverTransport, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_clientTransports, 0);
  objc_storeStrong((id *)&self->_txtRecord, 0);
  objc_storeStrong((id *)&self->_transientDevices, 0);
  objc_storeStrong((id *)&self->_residentDevices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __62__HMDHTTPMessageTransport_netServiceBrowser_didRemoveService___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "clientBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Client is no longer advertising: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
}

void __59__HMDHTTPMessageTransport_netServiceBrowser_didAddService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    v18 = 138543874;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Resolved service, %@, for existing client: %@", (uint8_t *)&v18, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "netService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v10, "isEqual:", v11);

  if ((v10 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "netService");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing client, added service, %@, does not match existing client service: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(*(id *)(a1 + 48), "stop");
    objc_msgSend(*(id *)(a1 + 32), "removeClientTransport:", *(_QWORD *)(a1 + 48));
  }

}

uint64_t __81__HMDHTTPMessageTransport_server_didReceiveMessage_fromDevice_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Received message for device, %@, : %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_handleReceivedRequestMessage:fromDevice:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
}

void __50__HMDHTTPMessageTransport_server_didRemoveDevice___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Server removed device: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "_serviceForDevice:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting client confirmation for device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__HMDHTTPMessageTransport_server_didRemoveDevice___block_invoke_81;
    v13[3] = &unk_1E89BF250;
    objc_copyWeak(&v15, (id *)buf);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v7, "confirmWithTimeout:completionHandler:", v13, 0.0);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }

}

void __50__HMDHTTPMessageTransport_server_didRemoveDevice___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543874;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Completed client confirmation for device, %@, with error: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v5);

}

void __70__HMDHTTPMessageTransport_client_didReceiveMessage_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "remoteDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v11 = 138543874;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Received message for device, %@, : %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "remoteDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_handleReceivedRequestMessage:fromDevice:completionHandler:", v8, v10, *(_QWORD *)(a1 + 56));

}

void __51__HMDHTTPMessageTransport_client_didStopWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = WeakRetained;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Completed server confirmation for device, %@, with error: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v6);

}

uint64_t __64__HMDHTTPMessageTransport_startObservingIsPublishingForService___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startObservingIsPublishingForService:", *(_QWORD *)(a1 + 40));
}

void __62__HMDHTTPMessageTransport__connectToDevice_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  _QWORD *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to start messaging client with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  if (WeakRetained)
  {
    v9 = *(void **)(a1 + 40);
    if (v9)
    {
      v10 = WeakRetained[10];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__HMDHTTPMessageTransport__connectToDevice_completionHandler___block_invoke_77;
      block[3] = &unk_1E89C1B48;
      v14 = v9;
      v12 = v3;
      v13 = *(id *)(a1 + 32);
      dispatch_async(v10, block);

    }
  }

}

void __62__HMDHTTPMessageTransport__connectToDevice_completionHandler___block_invoke_79(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  _QWORD *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to start messaging client with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  if (WeakRetained)
  {
    v9 = *(void **)(a1 + 40);
    if (v9)
    {
      v10 = WeakRetained[10];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__HMDHTTPMessageTransport__connectToDevice_completionHandler___block_invoke_80;
      block[3] = &unk_1E89C1B48;
      v14 = v9;
      v12 = v3;
      v13 = *(id *)(a1 + 32);
      dispatch_async(v10, block);

    }
  }

}

uint64_t __62__HMDHTTPMessageTransport__connectToDevice_completionHandler___block_invoke_80(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[6];
  if (a1[4])
    v3 = 0;
  else
    v3 = a1[5];
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

uint64_t __62__HMDHTTPMessageTransport__connectToDevice_completionHandler___block_invoke_77(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[6];
  if (a1[4])
    v3 = 0;
  else
    v3 = a1[5];
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __50__HMDHTTPMessageTransport__startServerWithDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start message server with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "TXTRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__HMDHTTPMessageTransport__startServerWithDevice___block_invoke_74;
    v9[3] = &unk_1E89A5D30;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
}

void __50__HMDHTTPMessageTransport__startServerWithDevice___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v12;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@injecting TXT record %@: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "serverTransport");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTXTRecordValue:forKey:", v8, v5);

  }
}

void __47__HMDHTTPMessageTransport_configureWithDevice___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v22 = v7;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Configuring with device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "setCurrentDevice:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_stopServer");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "clientTransports");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13++), "stop");
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    objc_msgSend(*(id *)(a1 + 32), "removeAllClientTransports");
    if (*(_QWORD *)(a1 + 40))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "isServerEnabled"))
        objc_msgSend(*(id *)(a1 + 32), "_startServerWithDevice:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "clientBrowser");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __47__HMDHTTPMessageTransport_configureWithDevice___block_invoke_72;
      v15[3] = &unk_1E89C2350;
      v15[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v14, "startBrowsingWithCompletionHandler:", v15);

    }
  }
}

void __47__HMDHTTPMessageTransport_configureWithDevice___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start browseing for clients with error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __47__HMDHTTPMessageTransport_handleServerEnabled___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Server was enabled", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v9, "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_startServerWithDevice:", v10);

    }
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Server was disabled", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "_stopServer");
  }
}

void __86__HMDHTTPMessageTransport__handleReceivedRequestMessage_fromDevice_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  v8 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 56))
  {
    v9 = WeakRetained[10];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__HMDHTTPMessageTransport__handleReceivedRequestMessage_fromDevice_completionHandler___block_invoke_2;
    block[3] = &unk_1E89BD8E8;
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v13 = v6;
    v17 = *(_BYTE *)(a1 + 72);
    v14 = *(id *)(a1 + 48);
    v15 = v5;
    v16 = *(id *)(a1 + 56);
    dispatch_async(v9, block);

  }
}

void __86__HMDHTTPMessageTransport__handleReceivedRequestMessage_fromDevice_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138543874;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Command %@ completed with error: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v7);

}

uint64_t __86__HMDHTTPMessageTransport__handleReceivedRequestMessage_fromDevice_completionHandler___block_invoke_67(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__HMDHTTPMessageTransport__handleReceivedRequestMessage_fromDevice_completionHandler___block_invoke_2(uint64_t a1)
{
  HMDRemoteMessage *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:destination:payload:type:timeout:secure:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, *(unsigned __int8 *)(a1 + 80), 0.0);
  -[HMDRemoteMessage setTransactionIdentifier:](v2, "setTransactionIdentifier:", *(_QWORD *)(a1 + 56));
  v8 = 0;
  +[HMDRemoteMessageSerialization dictionaryForMessage:error:](HMDRemoteMessageSerialization, "dictionaryForMessage:error:", v2, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  v6 = *(_QWORD *)(a1 + 64);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kIDSMessageResponseErrorDataKey"));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

void __76__HMDHTTPMessageTransport__sendMessage_destination_timeout_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to send message to destination: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __76__HMDHTTPMessageTransport__sendMessage_destination_timeout_responseHandler___block_invoke_56;
    v18 = &unk_1E89C21C0;
    v12 = *(void **)(a1 + 40);
    v13 = *(void **)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 32);
    v20 = v12;
    objc_msgSend(v13, "confirmWithTimeout:completionHandler:", &v15, 0.0);
    if (*(_QWORD *)(a1 + 64))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 54, CFSTR("Communication error."), CFSTR("No valid connection for destination"), 0, v15, v16, v17, v18, v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    }
  }
  else
  {
    objc_msgSend(v5, "sendMessage:timeout:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(double *)(a1 + 72));
  }

}

void __76__HMDHTTPMessageTransport__sendMessage_destination_timeout_responseHandler___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Completed confirmation for device, %@, with error: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

void __57__HMDHTTPMessageTransport_sendMessage_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  HMDHTTPDevice *v18;
  void *v19;
  void *v20;
  HMDHTTPDevice *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void (**v30)(id, id);
  void *v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void (**v39)(id, id);
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (!v4)
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = a1[5];
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "UUIDString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "destination");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = v26;
      v51 = 2112;
      v52 = v28;
      v53 = 2112;
      v54 = v29;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message, %@, invalid destination: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Invalid parameter."), CFSTR("Invalid destination."), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v30 = (void (**)(id, id))a1[6];
    if (v30)
      v30[2](v30, v7);
    objc_msgSend(a1[4], "responseHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(a1[4], "responseHandler");
      v32 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _QWORD))v32)[2](v32, v7, 0);

    }
    goto LABEL_31;
  }
  objc_msgSend(a1[5], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1[5], "remoteMessageFromMessage:", a1[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    +[HMDRemoteMessageSerialization dictionaryForMessage:error:](HMDRemoteMessageSerialization, "dictionaryForMessage:error:", v6, &v48);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v48;
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = a1[5];
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v41)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v12;
        v51 = 2112;
        v52 = v14;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Sending request message with identifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      v15 = 6.0;
      if (!objc_msgSend(v6, "type"))
      {
        objc_msgSend(v6, "timeout");
        if (v16 > 0.0)
        {
          objc_msgSend(v6, "timeout");
          v15 = v17;
        }
      }
      v18 = [HMDHTTPDevice alloc];
      objc_msgSend(v4, "device");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[HMDHTTPDevice initWithIdentifier:](v18, "initWithIdentifier:", v20);

      objc_initWeak((id *)buf, a1[5]);
      v22 = a1[5];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __57__HMDHTTPMessageTransport_sendMessage_completionHandler___block_invoke_45;
      v42[3] = &unk_1E89A5CB8;
      v46 = a1[6];
      objc_copyWeak(&v47, (id *)buf);
      v43 = a1[4];
      v44 = v6;
      v45 = v4;
      objc_msgSend(v22, "_sendMessage:destination:timeout:responseHandler:", v41, v21, v42, v15);

      objc_destroyWeak(&v47);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = a1[4];
        *(_DWORD *)buf = 138543874;
        v50 = v37;
        v51 = 2112;
        v52 = v38;
        v53 = 2112;
        v54 = v7;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize message, %@, with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      v39 = (void (**)(id, id))a1[6];
      if (v39)
        v39[2](v39, v7);
      objc_msgSend(a1[4], "responseHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v40)
        goto LABEL_30;
      objc_msgSend(a1[4], "responseHandler");
      v21 = (HMDHTTPDevice *)objc_claimAutoreleasedReturnValue();
      ((void (*)(HMDHTTPDevice *, id, _QWORD))v21[1].super.super.isa)(v21, v7, 0);
    }

LABEL_30:
    goto LABEL_31;
  }
  v33 = (void *)MEMORY[0x1D17BA0A0]();
  v34 = a1[5];
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v50 = v36;
    _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@No device for HTTP Client (currentDevice==nil). ", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v33);
  if (a1[6])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Not found."), CFSTR("Unable to find device."), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[6] + 2))();
LABEL_31:

  }
}

void __57__HMDHTTPMessageTransport_sendMessage_completionHandler___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  _QWORD *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  HMDRemoteDeviceMessageDestination *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDRemoteDeviceMessageDestination *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  _QWORD *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  _QWORD *v48;
  HMDRemoteDeviceMessageDestination *v49;
  id v50;
  _QWORD block[4];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = WeakRetained;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v6)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "UUIDString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v58 = v13;
        v59 = 2112;
        v60 = v15;
        v61 = 2112;
        v62 = v6;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message, %@, with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "UUIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = v16;
        v59 = 2112;
        v60 = v18;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Successfully sent message with identifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDRemoteMessageLogEvent sentRemoteMessage:transportType:](HMDRemoteMessageLogEvent, "sentRemoteMessage:transportType:", *(_QWORD *)(a1 + 40), objc_msgSend(v10, "transportType"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "submitLogEvent:", v20);

    }
    v21 = objc_msgSend(*(id *)(a1 + 40), "type");
    v22 = 0;
    if (!v6 && !v21)
    {
      v56 = 0;
      +[HMDRemoteMessageSerialization remoteMessageWithDictionary:error:](HMDRemoteMessageSerialization, "remoteMessageWithDictionary:error:", v5, &v56);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v56;
      v25 = v24;
      if (v23)
      {
        v50 = v24;
        objc_msgSend(v23, "messagePayload");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v26, "mutableCopy");

        v27 = [HMDRemoteDeviceMessageDestination alloc];
        objc_msgSend(v23, "destination");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "target");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "device");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v27, "initWithTarget:device:", v29, v30);

        objc_msgSend(v23, "setDestination:", v31);
        v49 = v31;
        -[HMDRemoteDeviceMessageDestination device](v31, "device");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "remoteDestinationString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v33, CFSTR("kIDSMessageSourceIDKey"));

        objc_msgSend(v5, "hmf_dataForKey:", CFSTR("kIDSMessageResponseErrorDataKey"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v35 = (void *)MEMORY[0x1E0CB3710];
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = 0;
          objc_msgSend(v35, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v36, v34, &v55);
          v6 = (id)objc_claimAutoreleasedReturnValue();
          v37 = v55;

          if (!v6)
          {
            v38 = (void *)MEMORY[0x1D17BA0A0]();
            v48 = v10;
            HMFGetOSLogHandle();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v47 = v38;
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v58 = v40;
              v59 = 2112;
              v60 = v37;
              _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize error with error: %@", buf, 0x16u);

              v38 = v47;
            }

            objc_autoreleasePoolPop(v38);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 52, CFSTR("Generic error."), CFSTR("Failed to deserialize remote error."), 0, v37);
            v6 = (id)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v6, CFSTR("kIDSMessageResponseErrorDataKey"));

        }
        else
        {
          v6 = 0;
        }

        v25 = v50;
      }
      else
      {
        v41 = (void *)MEMORY[0x1D17BA0A0]();
        v42 = v10;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v58 = v44;
          v59 = 2112;
          v60 = v5;
          v61 = 2112;
          v62 = v25;
          _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize response, %@, with error: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v41);
        v6 = v25;
        v22 = 0;
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      v46 = v10[10];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__HMDHTTPMessageTransport_sendMessage_completionHandler___block_invoke_54;
      block[3] = &unk_1E89C20C8;
      v52 = *(id *)(a1 + 32);
      v53 = v6;
      v54 = v22;
      dispatch_async(v46, block);

    }
  }

}

void __57__HMDHTTPMessageTransport_sendMessage_completionHandler___block_invoke_54(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

+ (unint64_t)restriction
{
  return 2;
}

+ (HMFVersion)protocolVersion
{
  if (protocolVersion_onceToken != -1)
    dispatch_once(&protocolVersion_onceToken, &__block_literal_global_14347);
  return (HMFVersion *)(id)protocolVersion_protocolVersion;
}

+ (BOOL)shouldHostMessageServer
{
  void *v2;
  char v3;
  void *v4;

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isResidentCapable") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "supportsKeyTransferServer");

  }
  return v3;
}

+ (BOOL)protocolVersionSupportsExtendedMessages:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (v3)
  {
    if (protocolVersionSupportsExtendedMessages__onceToken != -1)
      dispatch_once(&protocolVersionSupportsExtendedMessages__onceToken, &__block_literal_global_15_14344);
    v4 = objc_msgSend(v3, "isAtLeastVersion:", protocolVersionSupportsExtendedMessages__extendedMessageProtocolVersion);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_14340 != -1)
    dispatch_once(&logCategory__hmf_once_t0_14340, &__block_literal_global_28);
  return (id)logCategory__hmf_once_v1_14341;
}

void __38__HMDHTTPMessageTransport_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_14341;
  logCategory__hmf_once_v1_14341 = v0;

}

void __67__HMDHTTPMessageTransport_protocolVersionSupportsExtendedMessages___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithMajorVersion:minorVersion:updateVersion:", 1, 1, 0);
  v1 = (void *)protocolVersionSupportsExtendedMessages__extendedMessageProtocolVersion;
  protocolVersionSupportsExtendedMessages__extendedMessageProtocolVersion = v0;

}

void __42__HMDHTTPMessageTransport_protocolVersion__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithMajorVersion:minorVersion:updateVersion:", 1, 1, 0);
  v1 = (void *)protocolVersion_protocolVersion;
  protocolVersion_protocolVersion = v0;

}

@end
