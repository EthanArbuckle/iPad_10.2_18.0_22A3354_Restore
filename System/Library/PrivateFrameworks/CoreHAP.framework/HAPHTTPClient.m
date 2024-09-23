@implementation HAPHTTPClient

- (HAPHTTPClient)initWithDNSName:(id)a3 queue:(id)a4
{
  return -[HAPHTTPClient initWithDNSName:port:eventsEnabled:queue:](self, "initWithDNSName:port:eventsEnabled:queue:", a3, 0, 1, a4);
}

- (HAPHTTPClient)initWithDNSName:(id)a3 port:(int64_t)a4 eventsEnabled:(BOOL)a5 queue:(id)a6
{
  return -[HAPHTTPClient initWithDNSName:port:eventsEnabled:queue:wakeAddress:](self, "initWithDNSName:port:eventsEnabled:queue:wakeAddress:", a3, a4, a5, a6, 0);
}

- (HAPHTTPClient)initWithDNSName:(id)a3 port:(int64_t)a4 eventsEnabled:(BOOL)a5 queue:(id)a6 wakeAddress:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  HAPHTTPClientDependencyFactory *v15;
  HAPHTTPClient *v16;

  v8 = a5;
  v12 = a7;
  v13 = a6;
  v14 = a3;
  v15 = objc_alloc_init(HAPHTTPClientDependencyFactory);
  v16 = -[HAPHTTPClient initWithDNSName:port:eventsEnabled:queue:wakeAddress:dependencyFactory:](self, "initWithDNSName:port:eventsEnabled:queue:wakeAddress:dependencyFactory:", v14, a4, v8, v13, v12, v15);

  return v16;
}

- (HAPHTTPClient)initWithDNSName:(id)a3 port:(int64_t)a4 eventsEnabled:(BOOL)a5 queue:(id)a6 wakeAddress:(id)a7 dependencyFactory:(id)a8
{
  _BOOL8 v11;
  NSObject *v13;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  HAPHTTPClient *v19;
  HAPHTTPClient *v20;
  dispatch_queue_t v21;
  NSError *invalidateReason;
  int v23;
  HAPHTTPClient *v24;
  objc_super v26;

  v11 = a5;
  v13 = a3;
  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HAPHTTPClient;
  v19 = -[HAPHTTPClient init](&v26, sel_init);
  v20 = v19;
  if (!v19)
    goto LABEL_7;
  objc_storeStrong((id *)&v19->_dnsName, v13);
  v20->_port = a4;
  v21 = v16;
  if (!v16)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.HAPHTTPClient", v13);
  }
  objc_storeStrong((id *)&v20->_queue, v21);
  if (!v16)
  {

  }
  v20->_invalidated = 0;
  objc_storeStrong((id *)&v20->_wakeAddress, a7);
  invalidateReason = v20->_invalidateReason;
  v20->_invalidateReason = 0;

  v23 = -[HAPHTTPClient _initializeCoreUtilsHTTPClientWithPort:withEventsEnabled:factory:](v20, "_initializeCoreUtilsHTTPClientWithPort:withEventsEnabled:factory:", a4, v11, v18);
  v24 = 0;
  if (!v23)
LABEL_7:
    v24 = v20;

  return v24;
}

- (HAPHTTPClient)initWithSocketInfo:(id)a3 dnsName:(id)a4 eventsEnabled:(BOOL)a5 queue:(id)a6 wakeAddress:(id)a7 dependencyFactory:(id)a8
{
  NSObject *v8;
  _BOOL8 v12;
  HAPSocketInfo *v15;
  NSString *v16;
  NSObject *v17;
  NSString *v18;
  id v19;
  dispatch_queue_t v20;
  void *v21;
  NSString *wakeAddress;
  NSString *v23;
  NSError *invalidateReason;
  HAPSocketInfo *pendingConnectionSocketInfo;
  HAPSocketInfo *v26;
  NSString *dnsName;
  int v28;
  HAPHTTPClient *v29;

  v12 = a5;
  v15 = (HAPSocketInfo *)a3;
  v16 = (NSString *)a4;
  v17 = a6;
  v18 = (NSString *)a7;
  v19 = a8;
  v20 = v17;
  if (!v17)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.HAPHTTPClient", v8);
  }
  objc_storeStrong((id *)&self->_queue, v20);
  if (!v17)
  {

  }
  self->_invalidated = 0;
  -[HAPSocketInfo port](v15, "port");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  self->_port = (int)objc_msgSend(v21, "intValue");

  wakeAddress = self->_wakeAddress;
  self->_wakeAddress = v18;
  v23 = v18;

  invalidateReason = self->_invalidateReason;
  self->_invalidateReason = 0;

  pendingConnectionSocketInfo = self->_pendingConnectionSocketInfo;
  self->_pendingConnectionSocketInfo = v15;
  v26 = v15;

  dnsName = self->_dnsName;
  self->_dnsName = v16;

  v28 = -[HAPHTTPClient _initializeCoreUtilsHTTPClientWithPort:withEventsEnabled:factory:](self, "_initializeCoreUtilsHTTPClientWithPort:withEventsEnabled:factory:", self->_port, v12, v19);
  v29 = 0;
  if (!v28)
    v29 = self;

  return v29;
}

- (HAPHTTPClient)initWithSocketInfo:(id)a3 dnsName:(id)a4 eventsEnabled:(BOOL)a5 queue:(id)a6 wakeAddress:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  HAPHTTPClient *v16;
  HAPHTTPClient *v17;
  HAPHTTPClientDependencyFactory *v18;
  HAPHTTPClient *v19;
  objc_super v21;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HAPHTTPClient;
  v16 = -[HAPHTTPClient init](&v21, sel_init);
  if (v16)
  {
    v17 = v16;
    v18 = objc_alloc_init(HAPHTTPClientDependencyFactory);
    v19 = -[HAPHTTPClient initWithSocketInfo:dnsName:eventsEnabled:queue:wakeAddress:dependencyFactory:](v17, "initWithSocketInfo:dnsName:eventsEnabled:queue:wakeAddress:dependencyFactory:", v12, v13, v9, v14, v15, v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSString *dnsName;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_httpClient)
  {
    v3 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      dnsName = self->_dnsName;
      *(_DWORD *)buf = 138543618;
      v9 = v5;
      v10 = 2112;
      v11 = dnsName;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@[IP Accessory Server HTTP Client %@] HTTPClient not invalidated - invalidating....", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    -[HAPHTTPClient invalidate](self, "invalidate");
  }
  v7.receiver = self;
  v7.super_class = (Class)HAPHTTPClient;
  -[HAPHTTPClient dealloc](&v7, sel_dealloc);
}

- (int)getHttpClientPeerAddress:(sockaddr_storage *)a3
{
  __int128 v3;

  *(_QWORD *)&v3 = 0xDEDEDEDEDEDEDEDELL;
  *((_QWORD *)&v3 + 1) = 0xDEDEDEDEDEDEDEDELL;
  *(_OWORD *)&a3->__ss_pad2[80] = v3;
  *(_OWORD *)&a3->__ss_pad2[96] = v3;
  *(_OWORD *)&a3->__ss_pad2[48] = v3;
  *(_OWORD *)&a3->__ss_pad2[64] = v3;
  *(_OWORD *)&a3->__ss_pad2[16] = v3;
  *(_OWORD *)&a3->__ss_pad2[32] = v3;
  *(_OWORD *)&a3->ss_len = v3;
  *(_OWORD *)a3->__ss_pad2 = v3;
  return -[HAPCoreUtilsHTTPClient getPeerAddress:maxLength:outLength:](self->_httpClient, "getPeerAddress:maxLength:outLength:");
}

- (HMFNetAddress)peerAddressEx
{
  int v3;
  int v4;
  void *v5;
  HAPHTTPClient *v6;
  NSObject *v7;
  void *v8;
  HAPCoreUtilsHTTPClient *httpClient;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  HAPCoreUtilsHTTPClient *v16;
  _OWORD v17[8];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  memset(v17, 0, sizeof(v17));
  v3 = -[HAPHTTPClient getHttpClientPeerAddress:](self, "getHttpClientPeerAddress:", v17);
  if (!v3)
    return (HMFNetAddress *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28600]), "initWithSocketAddress:", v17);
  v4 = v3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    httpClient = v6->_httpClient;
    v11 = 138543874;
    v12 = v8;
    v13 = 1024;
    v14 = v4;
    v15 = 2048;
    v16 = httpClient;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%{public}@[IP Accessory Server HTTP Client] Failed to get peer address %d client ref %p", (uint8_t *)&v11, 0x1Cu);

  }
  objc_autoreleasePoolPop(v5);
  return (HMFNetAddress *)0;
}

- (HAPSocketInfo)peerSocketInfo
{
  _OWORD v3[8];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset(v3, 0, sizeof(v3));
  if (-[HAPHTTPClient getHttpClientPeerAddress:](self, "getHttpClientPeerAddress:", v3))
    return (HAPSocketInfo *)0;
  else
    return -[HAPSocketInfo initWithSocket:]([HAPSocketInfo alloc], "initWithSocket:", v3);
}

- (NSString)peerEndpointDescription
{
  int v2;
  void *v3;
  _QWORD v5[3];
  int v6;
  _BYTE v7[128];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(v5, 0, sizeof(v5));
  v6 = 0;
  v2 = -[HAPCoreUtilsHTTPClient getPeerAddress:maxLength:outLength:](self->_httpClient, "getPeerAddress:maxLength:outLength:", v5, 28, 0);
  v3 = 0;
  if (!v2)
  {
    if (SockAddrToString())
      return (NSString *)0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;

  v6 = a4;
  -[HAPHTTPClient setDelegate:](self, "setDelegate:", a3);
  -[HAPHTTPClient setDelegateQueue:](self, "setDelegateQueue:", v6);

}

- (void)setDebugDelegate:(id)a3 queue:(id)a4
{
  id v6;
  _QWORD v7[3];

  v6 = a4;
  -[HAPHTTPClient setDebugDelegate:](self, "setDebugDelegate:", a3);
  -[HAPHTTPClient setDebugDelegateQueue:](self, "setDebugDelegateQueue:", v6);

  v7[0] = self;
  v7[1] = _HandleWillSendMessage_f;
  v7[2] = _HandleDidReceiveMessage_f;
  -[HAPCoreUtilsHTTPClient setDebugDelegate:](self->_httpClient, "setDebugDelegate:", v7);
}

- (int)_initializeCoreUtilsHTTPClientWithPort:(int64_t)a3 withEventsEnabled:(BOOL)a4 factory:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  HAPCoreUtilsHTTPClient *v11;
  HAPCoreUtilsHTTPClient *httpClient;
  HAPCoreUtilsHTTPClient *v13;
  uint64_t v14;
  void *v15;
  HAPHTTPClient *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  _QWORD v24[5];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v5 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[HAPHTTPClient _connectionDestination](self, "_connectionDestination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_15;
  if (self->_httpClient)
  {
LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  -[HAPHTTPClient queue](self, "queue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createHTTPClientWithQueue:", v10);
  v11 = (HAPCoreUtilsHTTPClient *)objc_claimAutoreleasedReturnValue();
  httpClient = self->_httpClient;
  self->_httpClient = v11;

  v13 = self->_httpClient;
  if (!v13)
  {
LABEL_15:
    v20 = -6718;
    goto LABEL_14;
  }
  -[HAPCoreUtilsHTTPClient setProperty:value:](v13, "setProperty:value:", CFSTR("ipv6DelayNanos"), &unk_1E8989590);
  if (v5)
    v14 = 24592;
  else
    v14 = 24576;
  -[HAPCoreUtilsHTTPClient setFlags:mask:](self->_httpClient, "setFlags:mask:", v14, v14);
  v15 = (void *)MEMORY[0x1D17B7244](-[HAPCoreUtilsHTTPClient setTimeoutInSeconds:](self->_httpClient, "setTimeoutInSeconds:", 30));
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v18;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v19;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[HAP HTTP Client] Setting destination to %@:%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v15);
  v20 = -[HAPCoreUtilsHTTPClient setDestination:port:](self->_httpClient, "setDestination:port:", objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), a3);
  if (!v20)
  {
    v24[2] = 0;
    objc_msgSend(MEMORY[0x1E0D286B8], "systemInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "productVariant");

    if (v22 == 3)
      -[HAPHTTPClient setDebugDelegate:queue:](v16, "setDebugDelegate:queue:", v16, v16->_queue);
    v24[0] = v16;
    v24[1] = _Invalidated_f;
    v24[3] = _HandleEvent_f;
    v24[4] = _HandleSocketEvent_f;
    -[HAPCoreUtilsHTTPClient setDelegate:](self->_httpClient, "setDelegate:", v24);
    goto LABEL_13;
  }
LABEL_14:

  return v20;
}

- (id)_connectionDestination
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HAPHTTPClient *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HAPHTTPClient dnsName](self, "dnsName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPHTTPClient wakeAddress](self, "wakeAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wake://%@%s%@"), v4, "\x1E", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HAPHTTPClient pendingConnectionSocketInfo](self, "pendingConnectionSocketInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ipAddressStringWithScope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v3;
    if (v7)
    {
      v9 = (void *)MEMORY[0x1D17B7244]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v15 = v12;
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Creating socket connection using address with scope %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v8 = v7;
    }
    v5 = v8;

  }
  return v5;
}

- (BOOL)_supportsWoL
{
  void *v2;
  BOOL v3;

  -[HAPHTTPClient wakeAddress](self, "wakeAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)enableUAPSessionSecurityWithReadKey:(unsigned __int8)a3[32] writeKey:(unsigned __int8)a4[32] error:(id *)a5
{
  uint64_t v7;
  _OWORD v9[2];
  uint64_t v10;

  v10 = 0;
  memset(v9, 0, sizeof(v9));
  v7 = NetTransportChaCha20Poly1305Configure();
  if (!(_DWORD)v7)
  {
    -[HAPCoreUtilsHTTPClient setTransportDelegate:](self->_httpClient, "setTransportDelegate:", v9);
    if (!a5)
      return (_DWORD)v7 == 0;
    goto LABEL_3;
  }
  if (a5)
  {
LABEL_3:
    HMErrorFromOSStatus(v7);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (_DWORD)v7 == 0;
}

- (void)invalidateWithError:(id)a3
{
  id v4;
  HAPCoreUtilsHTTPClient *httpClient;

  v4 = a3;
  -[HAPHTTPClient setInvalidateRequested:](self, "setInvalidateRequested:", 1);
  -[HAPHTTPClient setInvalidateReason:](self, "setInvalidateReason:", v4);

  -[HAPCoreUtilsHTTPClient invalidate](self->_httpClient, "invalidate");
  httpClient = self->_httpClient;
  self->_httpClient = 0;

}

- (void)invalidate
{
  -[HAPHTTPClient invalidateWithError:](self, "invalidateWithError:", 0);
}

- (void)sendGETRequestToURL:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a5;
  v11 = objc_alloc(MEMORY[0x1E0D28540]);
  v12 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17B692C](self, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@, %s:%ld"), v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/HAPHTTPClient.m", 443);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithName:", v14);

  -[HAPHTTPClient _sendHTTPRequestToURL:withMethod:requestObject:serializationType:timeout:activity:completionHandler:](self, "_sendHTTPRequestToURL:withMethod:requestObject:serializationType:timeout:activity:completionHandler:", v9, 1, 0, 0, v15, v10, a4);
  __HMFActivityScopeLeave();

}

- (void)sendPUTRequestToURL:(id)a3 withRequestObject:(id)a4 serializationType:(unint64_t)a5 timeout:(double)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = objc_alloc(MEMORY[0x1E0D28540]);
  v17 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17B692C](self, a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@, %s:%ld"), v18, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/HAPHTTPClient.m", 464);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithName:", v19);

  -[HAPHTTPClient _sendHTTPRequestToURL:withMethod:requestObject:serializationType:timeout:activity:completionHandler:](self, "_sendHTTPRequestToURL:withMethod:requestObject:serializationType:timeout:activity:completionHandler:", v13, 3, v14, a5, v20, v15, a6);
  __HMFActivityScopeLeave();

}

- (void)sendPOSTRequestToURL:(id)a3 withRequestObject:(id)a4 serializationType:(unint64_t)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = objc_alloc(MEMORY[0x1E0D28540]);
  v15 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17B692C](self, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@, %s:%ld"), v16, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/HAPHTTPClient.m", 484);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithName:", v17);

  -[HAPHTTPClient _sendHTTPRequestToURL:withMethod:requestObject:serializationType:timeout:activity:completionHandler:](self, "_sendHTTPRequestToURL:withMethod:requestObject:serializationType:timeout:activity:completionHandler:", v11, 2, v12, a5, v18, v13, 0.0);
  __HMFActivityScopeLeave();

}

- (void)sendDELETERequestToURL:(id)a3 withRequestObject:(id)a4 serializationType:(unint64_t)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = objc_alloc(MEMORY[0x1E0D28540]);
  v15 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17B692C](self, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@, %s:%ld"), v16, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/HAPHTTPClient.m", 504);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithName:", v17);

  -[HAPHTTPClient _sendHTTPRequestToURL:withMethod:requestObject:serializationType:timeout:activity:completionHandler:](self, "_sendHTTPRequestToURL:withMethod:requestObject:serializationType:timeout:activity:completionHandler:", v11, 4, v12, a5, v18, v13, 0.0);
  __HMFActivityScopeLeave();

}

- (void)_sendHTTPRequestToURL:(id)a3 withMethod:(int)a4 requestObject:(id)a5 serializationType:(unint64_t)a6 timeout:(double)a7 activity:(id)a8 completionHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t inited;
  id v26;
  uint64_t v27;
  double v28;
  unsigned __int16 v29;
  int v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  dispatch_block_t v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  _DWORD v49[2];
  _QWORD v50[4];
  id v51;
  _QWORD *v52;
  _QWORD block[4];
  id v54;
  HAPHTTPClient *v55;
  id v56;
  _QWORD *v57;
  _QWORD v58[4];
  uint64_t v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v46 = a5;
  v17 = a8;
  v18 = a9;
  v59 = 0;
  -[HAPHTTPClient delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v45 = v20;

  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v58[3] = 0;
  v21 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__HAPHTTPClient__sendHTTPRequestToURL_withMethod_requestObject_serializationType_timeout_activity_completionHandler___block_invoke;
  block[3] = &unk_1E894BA98;
  v22 = v17;
  v54 = v22;
  v55 = self;
  v57 = v58;
  v23 = v18;
  v56 = v23;
  v50[0] = v21;
  v50[1] = 3221225472;
  v50[2] = __117__HAPHTTPClient__sendHTTPRequestToURL_withMethod_requestObject_serializationType_timeout_activity_completionHandler___block_invoke_2;
  v50[3] = &unk_1E894BAC0;
  v52 = v58;
  v44 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  v51 = v44;
  v47 = (void *)MEMORY[0x1D17B7400](v50);
  v24 = 0;
  inited = 4294960591;
  v26 = 0;
  if (!v16 || !v23)
    goto LABEL_20;
  inited = HTTPMessageCreate();
  if ((_DWORD)inited)
  {
LABEL_19:
    v24 = 0;
    v26 = 0;
    goto LABEL_20;
  }
  HTTPMessageSetCompletionBlock();
  v27 = v59;
  *(_DWORD *)(v59 + 9640) = 15;
  v28 = 30.0;
  if (a7 > 0.0)
    v28 = a7;
  *(_DWORD *)(v27 + 9644) = (int)v28;
  switch(a4)
  {
    case 1:
      *(_DWORD *)((char *)v49 + 3) = 0;
      v29 = 17735;
      goto LABEL_12;
    case 2:
      *(_DWORD *)((char *)v49 + 3) = 84;
      v30 = 1414745936;
      goto LABEL_18;
    case 3:
      *(_DWORD *)((char *)v49 + 3) = 0;
      v29 = 21840;
LABEL_12:
      v30 = v29 | 0x540000;
      goto LABEL_18;
    case 4:
      *(_DWORD *)((char *)v49 + 3) = 4543557;
      v30 = 1162626372;
LABEL_18:
      v49[0] = v30;
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      inited = HTTPHeader_InitRequest();
      if ((_DWORD)inited)
        goto LABEL_19;
      -[HAPHTTPClient dnsName](self, "dnsName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "rangeOfString:options:", CFSTR(".%"), 4);

      -[HAPHTTPClient dnsName](self, "dnsName");
      if (v38 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "substringWithRange:", 0, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v24 = objc_retainAutorelease(v39);
      v43 = objc_msgSend(v24, "UTF8String");
      HTTPHeader_SetField();
      if (!v46 || a6 != 1)
      {
        if (v46 && a6 == 2)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
LABEL_42:
            v42 = objc_retainAutorelease(v46);
            objc_msgSend(v42, "bytes", v43);
            objc_msgSend(v42, "length");
            inited = HTTPMessageSetBody();
            v26 = 0;
            if ((_DWORD)inited)
              goto LABEL_20;
LABEL_45:
            objc_msgSend(v22, "markWithReason:", CFSTR("Sending request"), v43);
            inited = -[HAPCoreUtilsHTTPClient sendMessage:](self->_httpClient, "sendMessage:", v59);
            if (!(_DWORD)inited)
            {
              objc_msgSend(v45, "incrementHAPIPHTTPRequestsCount");
              v32 = 0;
              goto LABEL_26;
            }
            goto LABEL_20;
          }
        }
        else
        {
          if (!v46 || a6 != 3)
          {
            v26 = 0;
            if (!v46)
              goto LABEL_45;
LABEL_16:
            inited = 4294960591;
            goto LABEL_20;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_42;
        }
LABEL_15:
        v26 = 0;
        goto LABEL_16;
      }
      v48 = 0;
      -[HAPHTTPClient _serializeUAPJSONObject:error:](self, "_serializeUAPJSONObject:error:", v46, &v48, v43);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v41 = v48;
      if (v41)
      {
        v31 = v41;
        v32 = v31;
        goto LABEL_21;
      }
      v26 = objc_retainAutorelease(v26);
      objc_msgSend(v26, "bytes");
      objc_msgSend(v26, "length");
      inited = HTTPMessageSetBody();
      if (!(_DWORD)inited)
        goto LABEL_45;
LABEL_20:
      HMErrorFromOSStatus(inited);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v32 = 0;
LABEL_21:
      if (-[HAPHTTPClient _supportsWoL](self, "_supportsWoL", v43))
      {
        v33 = v22;
        objc_msgSend(v31, "domain");

        objc_msgSend(v31, "code");
      }
      v34 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v35 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v36;
        v62 = 2112;
        v63 = v31;
        v64 = 2112;
        v65 = v16;
        _os_log_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_ERROR, "%{public}@[HAP HTTP Client] Encountered error %@ for sending HTTP request to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v34);
      (*((void (**)(id, _QWORD, uint64_t, uint64_t, id))v23 + 2))(v23, 0, 4, 1000, v31);
      objc_msgSend(v22, "end");
      objc_msgSend(v22, "invalidate");

LABEL_26:
      _Block_object_dispose(v58, 8);

      return;
    default:
      v24 = 0;
      goto LABEL_15;
  }
}

- (void)_handleHTTPResponseForMessage:(HTTPMessagePrivate *)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, uint64_t, uint64_t, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t var21;
  void *v12;
  uint64_t var12;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = (void (**)(id, _QWORD, uint64_t, uint64_t, void *))a4;
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "markWithReason:", CFSTR("Received response"));
  -[HAPHTTPClient delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
    objc_msgSend(v10, "incrementHAPIPHTTPResponsesCount");
  var21 = a3->var21;
  if ((_DWORD)var21)
  {
    v12 = 0;
    var12 = 1000;
  }
  else
  {
    var12 = a3->var2.var12;
    if ((var12 - 200) >= 0x64)
    {
      v12 = 0;
      var21 = (var12 + 200000);
    }
    else if (a3->var7)
    {
      if (a3->var6)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = HTTPGetHeaderField();
        if ((_DWORD)v15)
          var21 = v15;
        else
          var21 = 4294960569;
      }
      else
      {
        v12 = 0;
        var21 = 4294960559;
      }
    }
    else
    {
      v12 = 0;
      var21 = 0;
    }
  }
  CFRelease(a3);
  HMErrorFromOSStatus(var21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "markWithReason:", CFSTR("Completed request"), v16);
  if (-[HAPHTTPClient _supportsWoL](self, "_supportsWoL"))
  {
    objc_msgSend(v14, "domain");

    objc_msgSend(v14, "code");
  }
  v6[2](v6, 0, 4, var12, v14);

}

- (id)_serializeUAPJSONObject:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  if (!objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v5))
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Object is not valid JSON: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
LABEL_8:
    HMErrorFromOSStatus(4294960540);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (!a4)
      goto LABEL_10;
    goto LABEL_9;
  }
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (a4)
LABEL_9:
    *a4 = objc_retainAutorelease(v7);
LABEL_10:
  if (v7)
    v11 = 0;
  else
    v11 = v6;
  v12 = v11;

  return v12;
}

- (id)_deserializeUAPJSONData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  if (v7)
  {
    v8 = v7;
    v9 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse JSON response with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = 0;
      if (!a4)
        goto LABEL_13;
      goto LABEL_12;
    }
    v12 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      v16 = v15;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "%{public}@Request did not return a dictionary and instead returned a %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    HMErrorFromOSStatus(4294960540);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v6 = 0;
  if (a4)
LABEL_12:
    *a4 = objc_retainAutorelease(v8);
LABEL_13:

  return v6;
}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HAPHTTPClient delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HAPHTTPClient delegateQueue](self, "delegateQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HAPHTTPClient delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (BOOL)_debugDelegateRespondsToSelector:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HAPHTTPClient debugDelegate](self, "debugDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HAPHTTPClient debugDelegateQueue](self, "debugDelegateQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HAPHTTPClient debugDelegate](self, "debugDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (void)httpClient:(id)a3 didReceiveHTTPMessageWithHeaders:(id)a4 body:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HAPHTTPClient *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HAPHTTPClient *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "length"))
  {
    v11 = (void *)MEMORY[0x1D17B7244]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v14;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Received headers: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  if (objc_msgSend(v10, "length"))
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v18;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Received body: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)httpClient:(id)a3 willSendHTTPMessageWithHeaders:(id)a4 body:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HAPHTTPClient *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HAPHTTPClient *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "length"))
  {
    v11 = (void *)MEMORY[0x1D17B7244]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v14;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Sending headers: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  if (objc_msgSend(v10, "length"))
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v18;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Sending body: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;

  -[HAPHTTPClient dnsName](self, "dnsName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v3)
  {
    -[HAPHTTPClient dnsName](self, "dnsName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HAPHTTPClient port](self, "port");
    -[HAPHTTPClient delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("dns:%@(%tu)%@"), v5, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HAPHTTPClient pendingConnectionSocketInfo](self, "pendingConnectionSocketInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ipAddressString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HAPHTTPClient port](self, "port");
    -[HAPHTTPClient delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("ip:%@(%tu)%@"), v7, v10, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (NSString)dnsName
{
  return self->_dnsName;
}

- (void)setDnsName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)port
{
  return self->_port;
}

- (HMFNetAddress)peerAddress
{
  return self->_peerAddress;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSError)invalidateReason
{
  return self->_invalidateReason;
}

- (void)setInvalidateReason:(id)a3
{
  objc_storeStrong((id *)&self->_invalidateReason, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (HAPHTTPClientDelegate)delegate
{
  return (HAPHTTPClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_delegateQueue);
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeWeak((id *)&self->_delegateQueue, a3);
}

- (HAPHTTPClientDebugDelegate)debugDelegate
{
  return (HAPHTTPClientDebugDelegate *)objc_loadWeakRetained((id *)&self->_debugDelegate);
}

- (void)setDebugDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_debugDelegate, a3);
}

- (OS_dispatch_queue)debugDelegateQueue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_debugDelegateQueue);
}

- (void)setDebugDelegateQueue:(id)a3
{
  objc_storeWeak((id *)&self->_debugDelegateQueue, a3);
}

- (BOOL)invalidateRequested
{
  return self->_invalidateRequested;
}

- (void)setInvalidateRequested:(BOOL)a3
{
  self->_invalidateRequested = a3;
}

- (NSString)wakeAddress
{
  return self->_wakeAddress;
}

- (void)setWakeAddress:(id)a3
{
  objc_storeStrong((id *)&self->_wakeAddress, a3);
}

- (HAPSocketInfo)pendingConnectionSocketInfo
{
  return self->_pendingConnectionSocketInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingConnectionSocketInfo, 0);
  objc_storeStrong((id *)&self->_wakeAddress, 0);
  objc_destroyWeak((id *)&self->_debugDelegateQueue);
  objc_destroyWeak((id *)&self->_debugDelegate);
  objc_destroyWeak((id *)&self->_delegateQueue);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_invalidateReason, 0);
  objc_storeStrong((id *)&self->_peerAddress, 0);
  objc_storeStrong((id *)&self->_dnsName, 0);
  objc_storeStrong((id *)&self->_httpClient, 0);
}

uint64_t __117__HAPHTTPClient__sendHTTPRequestToURL_withMethod_requestObject_serializationType_timeout_activity_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "begin");
  objc_msgSend(*(id *)(a1 + 40), "_handleHTTPResponseForMessage:completionHandler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "end");
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __117__HAPHTTPClient__sendHTTPRequestToURL_withMethod_requestObject_serializationType_timeout_activity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t22 != -1)
    dispatch_once(&logCategory__hmf_once_t22, &__block_literal_global_12510);
  return (id)logCategory__hmf_once_v23;
}

void __28__HAPHTTPClient_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v23;
  logCategory__hmf_once_v23 = v0;

}

@end
