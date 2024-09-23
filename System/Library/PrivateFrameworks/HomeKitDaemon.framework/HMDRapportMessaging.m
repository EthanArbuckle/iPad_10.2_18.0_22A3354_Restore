@implementation HMDRapportMessaging

- (HMDRapportMessaging)initWithClientFactory:(id)a3
{
  id v5;
  HMDRapportMessaging *v6;
  HMDRapportMessaging *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *workQueue;
  NSMutableArray *v13;
  NSMutableArray *requestQueue;
  NSMutableDictionary *v15;
  NSMutableDictionary *deviceClients;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMDRapportMessaging;
  v6 = -[HMDRapportMessaging init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    HMDispatchQueueNameString();
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(v9, v10);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v7->_clientFactory, a3);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    requestQueue = v7->_requestQueue;
    v7->_requestQueue = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    deviceClients = v7->_deviceClients;
    v7->_deviceClients = v15;

  }
  return v7;
}

- (void)configureDiscoveryClientWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__HMDRapportMessaging_configureDiscoveryClientWithCompletion___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)registerRequestHandler:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__HMDRapportMessaging_registerRequestHandler___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)registerHMMMRequestHandler:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__HMDRapportMessaging_registerHMMMRequestHandler___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)registerHMMMEnergyRequestHandler:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__HMDRapportMessaging_registerHMMMEnergyRequestHandler___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)sendRequest:(id)a3 requestID:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *workQueue;
  __CFString *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __CFString *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  __CFString *v27;
  id v28;
  id v29;
  id v30;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v25[0] = MEMORY[0x24BDAC760];
  if (a4)
    v18 = (__CFString *)a4;
  else
    v18 = CFSTR("com.apple.home.hh2.messaging.rid");
  v25[1] = 3221225472;
  v25[2] = __83__HMDRapportMessaging_sendRequest_requestID_destinationID_options_responseHandler___block_invoke;
  v25[3] = &unk_24E799C60;
  v25[4] = self;
  v26 = v13;
  v27 = v18;
  v28 = v12;
  v29 = v14;
  v30 = v15;
  v19 = v14;
  v20 = v12;
  v21 = v16;
  v22 = v13;
  v23 = v18;
  v24 = a4;
  dispatch_async(workQueue, v25);

}

- (BOOL)isRapportDeviceDiscoveredWithIdentifier:(id)a3
{
  const char *v4;
  id v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  HMDRapportMessaging *v12;
  NSObject *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (self && objc_getProperty(self, v4, 40, 1))
  {
    objc_msgSend(objc_getProperty(self, v6, 40, 1), "activeDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __63__HMDRapportMessaging_isRapportDeviceDiscoveredWithIdentifier___block_invoke;
    v16[3] = &unk_24E7897A0;
    v17 = v5;
    objc_msgSend(v8, "na_firstObjectPassingTest:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Discovery client is not configured", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (void)_configureDiscoveryClientWithCompletion:(id)a3
{
  id v4;
  id v5;
  SEL v6;
  SEL v7;
  SEL v8;
  OS_dispatch_queue *v9;
  SEL v10;
  id Property;
  uint64_t v12;
  const char *v13;
  id v14;
  id v15;
  const char *v16;
  id v17;
  id v18;
  const char *v19;
  id v20;
  id v21;
  const char *v22;
  id v23;
  id v24;
  const char *v25;
  id v26;
  id v27;
  const char *v28;
  id v29;
  id v30;
  const char *v31;
  id v32;
  id v33;
  const char *v34;
  id v35;
  id v36;
  const char *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id *v43;
  id *v44;
  id *v45;
  id *v46;
  id *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  id location[2];

  v4 = a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    v5 = -[HMDRapportMessagingClientFactory newCompanionLinkClient](self->_clientFactory, "newCompanionLinkClient");
    objc_setProperty_atomic(self, v6, v5, 40);

    objc_msgSend(objc_getProperty(self, v7, 40, 1), "setControlFlags:", 4196356);
    objc_msgSend(objc_getProperty(self, v8, 40, 1), "setServiceType:", CFSTR("com.apple.home.messaging"));
    v9 = self->_workQueue;
    Property = objc_getProperty(self, v10, 40, 1);
  }
  else
  {
    dispatch_assert_queue_V2(0);

    objc_msgSend(0, "setControlFlags:", 4196356);
    objc_msgSend(0, "setServiceType:", CFSTR("com.apple.home.messaging"));
    v9 = 0;
    Property = 0;
  }
  objc_msgSend(Property, "setDispatchQueue:", v9);

  objc_initWeak(location, self);
  v12 = MEMORY[0x24BDAC760];
  v67[0] = MEMORY[0x24BDAC760];
  v67[1] = 3221225472;
  v67[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke;
  v67[3] = &unk_24E797318;
  v47 = &v68;
  objc_copyWeak(&v68, location);
  if (self)
    v14 = objc_getProperty(self, v13, 40, 1);
  else
    v14 = 0;
  v15 = v14;
  objc_msgSend(v15, "setInterruptionHandler:", v67);

  v65[0] = v12;
  v65[1] = 3221225472;
  v65[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_73;
  v65[3] = &unk_24E797318;
  v46 = &v66;
  objc_copyWeak(&v66, location);
  if (self)
    v17 = objc_getProperty(self, v16, 40, 1);
  else
    v17 = 0;
  v18 = v17;
  objc_msgSend(v18, "setInvalidationHandler:", v65);

  v63[0] = v12;
  v63[1] = 3221225472;
  v63[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_74;
  v63[3] = &unk_24E789AE8;
  v45 = &v64;
  objc_copyWeak(&v64, location);
  if (self)
    v20 = objc_getProperty(self, v19, 40, 1);
  else
    v20 = 0;
  v21 = v20;
  objc_msgSend(v21, "setDeviceLostHandler:", v63);

  v61[0] = v12;
  v61[1] = 3221225472;
  v61[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_76;
  v61[3] = &unk_24E789AE8;
  v44 = &v62;
  objc_copyWeak(&v62, location);
  if (self)
    v23 = objc_getProperty(self, v22, 40, 1);
  else
    v23 = 0;
  v24 = v23;
  objc_msgSend(v24, "setDeviceFoundHandler:", v61);

  v59[0] = v12;
  v59[1] = 3221225472;
  v59[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_77;
  v59[3] = &unk_24E789B10;
  v43 = &v60;
  objc_copyWeak(&v60, location);
  if (self)
    v26 = objc_getProperty(self, v25, 40, 1);
  else
    v26 = 0;
  v27 = v26;
  objc_msgSend(v27, "setDeviceChangedHandler:", v59);

  v57[0] = v12;
  v57[1] = 3221225472;
  v57[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_79;
  v57[3] = &unk_24E797318;
  objc_copyWeak(&v58, location);
  if (self)
    v29 = objc_getProperty(self, v28, 40, 1);
  else
    v29 = 0;
  v30 = v29;
  objc_msgSend(v30, "setErrorFlagsChangedHandler:", v57);

  if (self)
    v32 = objc_getProperty(self, v31, 40, 1);
  else
    v32 = 0;
  v33 = v32;
  v55[0] = v12;
  v55[1] = 3221225472;
  v55[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_80;
  v55[3] = &unk_24E78CCA8;
  objc_copyWeak(&v56, location);
  objc_msgSend(v33, "registerRequestID:options:handler:", CFSTR("com.apple.home.hh2.messaging.rid"), 0, v55);

  if (_os_feature_enabled_impl())
  {
    if (self)
      v35 = objc_getProperty(self, v34, 40, 1);
    else
      v35 = 0;
    v36 = v35;
    v53[0] = v12;
    v53[1] = 3221225472;
    v53[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_2;
    v53[3] = &unk_24E78CCA8;
    objc_copyWeak(&v54, location);
    objc_msgSend(v36, "registerRequestID:options:handler:", CFSTR("com.apple.home.hh2.hmmm.rid"), 0, v53, &v60, &v62, &v64, &v66, &v68);

    if (self)
      v38 = objc_getProperty(self, v37, 40, 1);
    else
      v38 = 0;
    v39 = v38;
    v51[0] = v12;
    v51[1] = 3221225472;
    v51[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_3;
    v51[3] = &unk_24E78CCA8;
    objc_copyWeak(&v52, location);
    objc_msgSend(v39, "registerRequestID:options:handler:", CFSTR("hmmm.client.rid.prefix_com.apple.private.alloy.energykit"), 0, v51);

    objc_destroyWeak(&v52);
    objc_destroyWeak(&v54);
  }
  if (self)
    v40 = objc_getProperty(self, v34, 40, 1);
  else
    v40 = 0;
  v41 = v40;
  v48[0] = v12;
  v48[1] = 3221225472;
  v48[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_4;
  v48[3] = &unk_24E797698;
  objc_copyWeak(&v50, location);
  v42 = v4;
  v49 = v42;
  objc_msgSend(v41, "activateWithCompletion:", v48);

  objc_destroyWeak(&v50);
  objc_destroyWeak(&v56);
  objc_destroyWeak(&v58);
  objc_destroyWeak(v43);
  objc_destroyWeak(v44);
  objc_destroyWeak(v45);
  objc_destroyWeak(v46);
  objc_destroyWeak(v47);
  objc_destroyWeak(location);

}

- (void)_handleRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  SEL v10;
  const char *v11;
  void (**Property)(id, id, id, id);
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  if (!self)
  {
    dispatch_assert_queue_V2(0);
    goto LABEL_5;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!objc_getProperty(self, v10, 48, 1))
  {
LABEL_5:
    -[HMDRapportMessaging _queueRequest:options:responseHandler:](self, "_queueRequest:options:responseHandler:", v13, v8, v9);
    goto LABEL_6;
  }
  Property = (void (**)(id, id, id, id))objc_getProperty(self, v11, 48, 1);
  Property[2](Property, v13, v8, v9);
LABEL_6:

}

- (void)_handleHMMMRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  SEL v10;
  const char *v11;
  void (**Property)(id, id, id, id);
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  if (!self)
  {
    dispatch_assert_queue_V2(0);
    goto LABEL_5;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!objc_getProperty(self, v10, 56, 1))
  {
LABEL_5:
    -[HMDRapportMessaging _queueHMMMRequest:options:responseHandler:](self, "_queueHMMMRequest:options:responseHandler:", v13, v8, v9);
    goto LABEL_6;
  }
  Property = (void (**)(id, id, id, id))objc_getProperty(self, v11, 56, 1);
  Property[2](Property, v13, v8, v9);
LABEL_6:

}

- (void)_handleHMMMEnergyRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  SEL v10;
  const char *v11;
  void (**Property)(id, id, id, id);
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  if (!self)
  {
    dispatch_assert_queue_V2(0);
    goto LABEL_5;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!objc_getProperty(self, v10, 64, 1))
  {
LABEL_5:
    -[HMDRapportMessaging _queueHMMMEnergyRequest:options:responseHandler:](self, "_queueHMMMEnergyRequest:options:responseHandler:", v13, v8, v9);
    goto LABEL_6;
  }
  Property = (void (**)(id, id, id, id))objc_getProperty(self, v11, 64, 1);
  Property[2](Property, v13, v8, v9);
LABEL_6:

}

- (void)_queueRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *requestQueue;
  NSMutableArray *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    objc_initWeak(&location, self);
    requestQueue = self->_requestQueue;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    requestQueue = 0;
    location = 0;
  }
  v12 = requestQueue;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HMDRapportMessaging__queueRequest_options_responseHandler___block_invoke;
  aBlock[3] = &unk_24E798B60;
  objc_copyWeak(&v21, &location);
  v13 = v10;
  v20 = v13;
  v14 = v8;
  v18 = v14;
  v15 = v9;
  v19 = v15;
  v16 = _Block_copy(aBlock);
  -[NSMutableArray addObject:](v12, "addObject:", v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)_queueHMMMRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *hmmmRequestQueue;
  NSMutableArray *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    objc_initWeak(&location, self);
    hmmmRequestQueue = self->_hmmmRequestQueue;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    hmmmRequestQueue = 0;
    location = 0;
  }
  v12 = hmmmRequestQueue;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HMDRapportMessaging__queueHMMMRequest_options_responseHandler___block_invoke;
  aBlock[3] = &unk_24E798B60;
  objc_copyWeak(&v21, &location);
  v13 = v10;
  v20 = v13;
  v14 = v8;
  v18 = v14;
  v15 = v9;
  v19 = v15;
  v16 = _Block_copy(aBlock);
  -[NSMutableArray addObject:](v12, "addObject:", v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)_queueHMMMEnergyRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *hmmmEnergyRequestQueue;
  NSMutableArray *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    objc_initWeak(&location, self);
    hmmmEnergyRequestQueue = self->_hmmmEnergyRequestQueue;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    hmmmEnergyRequestQueue = 0;
    location = 0;
  }
  v12 = hmmmEnergyRequestQueue;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__HMDRapportMessaging__queueHMMMEnergyRequest_options_responseHandler___block_invoke;
  aBlock[3] = &unk_24E798B60;
  objc_copyWeak(&v21, &location);
  v13 = v10;
  v20 = v13;
  v14 = v8;
  v18 = v14;
  v15 = v9;
  v19 = v15;
  v16 = _Block_copy(aBlock);
  -[NSMutableArray addObject:](v12, "addObject:", v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)_completeQueuedRequests
{
  NSMutableArray *requestQueue;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    requestQueue = self->_requestQueue;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    requestQueue = 0;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
  }
  v4 = requestQueue;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x227676638](v5);
        (*(void (**)(uint64_t))(v9 + 16))(v9);
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = v5;
    }
    while (v5);
  }

  if (self)
    v11 = self->_requestQueue;
  else
    v11 = 0;
  -[NSMutableArray removeAllObjects](v11, "removeAllObjects", (_QWORD)v12);
}

- (void)_completeQueuedHMMMRequests
{
  NSMutableArray *hmmmRequestQueue;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    hmmmRequestQueue = self->_hmmmRequestQueue;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    hmmmRequestQueue = 0;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
  }
  v4 = hmmmRequestQueue;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x227676638](v5);
        (*(void (**)(uint64_t))(v9 + 16))(v9);
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = v5;
    }
    while (v5);
  }

  if (self)
    v11 = self->_hmmmRequestQueue;
  else
    v11 = 0;
  -[NSMutableArray removeAllObjects](v11, "removeAllObjects", (_QWORD)v12);
}

- (void)_completeQueuedHMMMEnergyRequests
{
  NSMutableArray *hmmmEnergyRequestQueue;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    hmmmEnergyRequestQueue = self->_hmmmEnergyRequestQueue;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    hmmmEnergyRequestQueue = 0;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
  }
  v4 = hmmmEnergyRequestQueue;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x227676638](v5);
        (*(void (**)(uint64_t))(v9 + 16))(v9);
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = v5;
    }
    while (v5);
  }

  if (self)
    v11 = self->_hmmmEnergyRequestQueue;
  else
    v11 = 0;
  -[NSMutableArray removeAllObjects](v11, "removeAllObjects", (_QWORD)v12);
}

- (id)_clientForIDSIdentifier:(id)a3 withDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *deviceClients;
  NSMutableDictionary *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  HMDRapportMessagingClientFactory *clientFactory;
  HMDRapportMessagingClientFactory *v18;
  HMDRapportMessagingClientFactory *v19;
  HMDRapportMessagingClientFactory *v20;
  void *v21;
  id v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *v24;
  _QWORD v26[5];
  id v27;
  id v28;

  v6 = a3;
  v7 = a4;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  dispatch_assert_queue_V2(workQueue);
  v9 = v7;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    deviceClients = self->_deviceClients;
  else
    deviceClients = 0;
  v12 = deviceClients;
  -[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = v13;
    os_unfair_lock_unlock(p_lock);
    v15 = v9;
  }
  else
  {
    v16 = v9;
    if (!v9)
    {
      if (self)
        clientFactory = self->_clientFactory;
      else
        clientFactory = 0;
      v18 = clientFactory;
      v16 = -[HMDRapportMessagingClientFactory newCompanionLinkDevice](v18, "newCompanionLinkDevice");

      objc_msgSend(v16, "setIdentifier:", v6);
    }
    if (self)
      v19 = self->_clientFactory;
    else
      v19 = 0;
    v20 = v19;
    -[HMDRapportMessaging _createRapportClientForDevice:](self, "_createRapportClientForDevice:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HMDRapportMessagingClientFactory newRapportDeviceClientWrapperWithClient:](v20, "newRapportDeviceClientWrapperWithClient:", v21);

    if (self)
      v23 = self->_deviceClients;
    else
      v23 = 0;
    v24 = v23;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v22, v6);

    os_unfair_lock_unlock(&self->_lock);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __58__HMDRapportMessaging__clientForIDSIdentifier_withDevice___block_invoke;
    v26[3] = &unk_24E799FD0;
    v26[4] = self;
    v15 = v16;
    v27 = v15;
    v28 = v6;
    objc_msgSend(v22, "activateWithCompletion:", v26);
    v14 = v22;

  }
  return v14;
}

- (id)_createRapportClientForDevice:(id)a3
{
  id v4;
  void *v5;
  HMDRapportMessaging *v6;
  NSObject *v7;
  void *v8;
  HMDRapportMessagingClientFactory *clientFactory;
  id v10;
  OS_dispatch_queue *workQueue;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v8;
    v31 = 2112;
    v32 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Creating Rapport client for device: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (v6)
    clientFactory = v6->_clientFactory;
  else
    clientFactory = 0;
  v10 = -[HMDRapportMessagingClientFactory newCompanionLinkClient](clientFactory, "newCompanionLinkClient");
  objc_msgSend(v10, "setDestinationDevice:", v4);
  objc_msgSend(v10, "setControlFlags:", 0x20000400800);
  objc_msgSend(v10, "setServiceType:", CFSTR("com.apple.home.messaging"));
  if (v6)
    workQueue = v6->_workQueue;
  else
    workQueue = 0;
  objc_msgSend(v10, "setDispatchQueue:", workQueue);
  objc_msgSend(v4, "idsDeviceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, v6);
  v13 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __53__HMDRapportMessaging__createRapportClientForDevice___block_invoke;
  v25[3] = &unk_24E7965D0;
  objc_copyWeak(&v28, (id *)buf);
  v14 = v12;
  v26 = v14;
  v15 = v4;
  v27 = v15;
  objc_msgSend(v10, "setDisconnectHandler:", v25);
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __53__HMDRapportMessaging__createRapportClientForDevice___block_invoke_95;
  v22[3] = &unk_24E7972B0;
  objc_copyWeak(&v24, (id *)buf);
  v16 = v15;
  v23 = v16;
  objc_msgSend(v10, "setInterruptionHandler:", v22);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __53__HMDRapportMessaging__createRapportClientForDevice___block_invoke_2;
  v19[3] = &unk_24E7972B0;
  objc_copyWeak(&v21, (id *)buf);
  v17 = v16;
  v20 = v17;
  objc_msgSend(v10, "setInvalidationHandler:", v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);

  return v10;
}

- (void)_invalidateDestinationDeviceWithIDSIdentifier:(id)a3
{
  id v4;
  NSObject *workQueue;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *deviceClients;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  HMDRapportMessaging *v11;
  NSObject *v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  dispatch_assert_queue_V2(workQueue);
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    deviceClients = self->_deviceClients;
  else
    deviceClients = 0;
  v8 = deviceClients;
  -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Invalidating Rapport client for device: %{public}@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    if (self)
      v14 = v11->_deviceClients;
    else
      v14 = 0;
    v15 = v14;
    -[NSMutableDictionary removeObjectForKey:](v15, "removeObjectForKey:", v4);

  }
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v9, "invalidate");

}

- (void)_updateDevice:(id)a3 reachable:(BOOL)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[4];
  id v10;
  HMDRapportMessaging *v11;
  BOOL v12;

  v6 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__HMDRapportMessaging__updateDevice_reachable___block_invoke;
  block[3] = &unk_24E799CF0;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(workQueue, block);

}

- (HMDRapportMessagingReachabilityDelegate)reachabilityDelegate
{
  return (HMDRapportMessagingReachabilityDelegate *)objc_loadWeakRetained((id *)&self->_reachabilityDelegate);
}

- (void)setReachabilityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_reachabilityDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceClients, 0);
  objc_storeStrong((id *)&self->_hmmmEnergyRequestQueue, 0);
  objc_storeStrong((id *)&self->_hmmmRequestQueue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong(&self->_hmmmEnergyRequestHandler, 0);
  objc_storeStrong(&self->_hmmmRequestHandler, 0);
  objc_storeStrong(&self->_requestHandler, 0);
  objc_storeStrong((id *)&self->_discoveryClient, 0);
  objc_storeStrong((id *)&self->_clientFactory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_reachabilityDelegate);
}

void __47__HMDRapportMessaging__updateDevice_reachable___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(*(id *)(a1 + 32), "idsDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "initWithUUIDString:", v3);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "reachabilityDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rapportMessaging:idsIdentifier:didAppearReachable:", *(_QWORD *)(a1 + 40), v5, *(unsigned __int8 *)(a1 + 48));

  }
}

void __53__HMDRapportMessaging__createRapportClientForDevice___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)MEMORY[0x227676638]();
  v4 = WeakRetained;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Rapport client disconnected for device: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 40), "idsDeviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_invalidateDestinationDeviceWithIDSIdentifier:", v8);

}

void __53__HMDRapportMessaging__createRapportClientForDevice___block_invoke_95(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "idsDeviceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_invalidateDestinationDeviceWithIDSIdentifier:", v2);

}

void __53__HMDRapportMessaging__createRapportClientForDevice___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)MEMORY[0x227676638]();
  v4 = WeakRetained;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "idsDeviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Rapport client invalidated for device: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v3);

}

void __58__HMDRapportMessaging__clientForIDSIdentifier_withDevice___block_invoke(uint64_t a1, void *a2)
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

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to activate Rapport client for device: %@, error: %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "_invalidateDestinationDeviceWithIDSIdentifier:", *(_QWORD *)(a1 + 48));
  }

}

void __71__HMDRapportMessaging__queueHMMMEnergyRequest_options_responseHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  void *v4;
  const char *v5;
  const char *v6;
  id Property;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  HMDAssertionLogEvent *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!objc_getProperty(WeakRetained, v3, 64, 1))
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = v4;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Request handler is nil", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      v14 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Request handler is nil"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "submitLogEvent:", v14);

    }
    if (objc_getProperty(v4, v5, 64, 1))
    {
      Property = objc_getProperty(v4, v6, 64, 1);
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))Property + 2))(Property, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", -1, CFSTR("Unexpected error."), CFSTR("HMDRapportMessaging has been deallocated."), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v8 + 16))(v8, 0, 0, v9);

  }
}

void __65__HMDRapportMessaging__queueHMMMRequest_options_responseHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  void *v4;
  const char *v5;
  const char *v6;
  id Property;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  HMDAssertionLogEvent *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!objc_getProperty(WeakRetained, v3, 56, 1))
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = v4;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Request handler is nil", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      v14 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Request handler is nil"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "submitLogEvent:", v14);

    }
    if (objc_getProperty(v4, v5, 56, 1))
    {
      Property = objc_getProperty(v4, v6, 56, 1);
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))Property + 2))(Property, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", -1, CFSTR("Unexpected error."), CFSTR("HMDRapportMessaging has been deallocated."), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v8 + 16))(v8, 0, 0, v9);

  }
}

void __61__HMDRapportMessaging__queueRequest_options_responseHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  void *v4;
  const char *v5;
  const char *v6;
  id Property;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  HMDAssertionLogEvent *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!objc_getProperty(WeakRetained, v3, 48, 1))
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = v4;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Request handler is nil", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      v14 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Request handler is nil"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "submitLogEvent:", v14);

    }
    if (objc_getProperty(v4, v5, 48, 1))
    {
      Property = objc_getProperty(v4, v6, 48, 1);
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))Property + 2))(Property, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", -1, CFSTR("Unexpected error."), CFSTR("HMDRapportMessaging has been deallocated."), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v8 + 16))(v8, 0, 0, v9);

  }
}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x227676638]();
  v3 = WeakRetained;
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Discovery client interrupted", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v2);

}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_73(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x227676638]();
  v3 = WeakRetained;
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Discovery client invalidated", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v2);

}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_74(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Discovery client lost device: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v3, "idsDeviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_invalidateDestinationDeviceWithIDSIdentifier:", v9);

}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_76(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Discovery client found device: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v6, "_updateDevice:reachable:", v3, 1);

}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_77(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Discovery client device changed: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_79(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  id Property;
  void *v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x227676638]();
  v3 = WeakRetained;
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      Property = objc_getProperty(v3, v5, 40, 1);
    else
      Property = 0;
    objc_msgSend(Property, "errorFlags");
    NSPrintF();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v10 = v6;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Discovery client error flag changed: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);

}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_80(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_handleRequest:options:responseHandler:", v12, v7, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", -1, CFSTR("Unexpected error."), CFSTR("HMDRapportMessaging has been deallocated"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v11);

  }
}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_handleHMMMRequest:options:responseHandler:", v12, v7, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", -1, CFSTR("Unexpected error."), CFSTR("HMDRapportMessaging has been deallocated"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v11);

  }
}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_handleHMMMEnergyRequest:options:responseHandler:", v12, v7, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", -1, CFSTR("Unexpected error."), CFSTR("HMDRapportMessaging has been deallocated"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v11);

  }
}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_4(uint64_t a1, void *a2)
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
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Activated Rapport client with error: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

uint64_t __63__HMDRapportMessaging_isRapportDeviceDiscoveredWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "idsDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __83__HMDRapportMessaging_sendRequest_requestID_destinationID_options_responseHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_clientForIDSIdentifier:withDevice:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v2;
  if (v2)
  {
    objc_msgSend(v2, "sendRequestID:request:options:responseHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Not found."), CFSTR("Could not create a device matching the destination"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v3 + 16))(v3, 0, 0, v4);

  }
}

uint64_t __56__HMDRapportMessaging_registerHMMMEnergyRequestHandler___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_atomic_copy(v3, a2, *(id *)(a1 + 40), 64);
    v3 = *(void **)(a1 + 32);
  }
  return objc_msgSend(v3, "_completeQueuedHMMMEnergyRequests");
}

uint64_t __50__HMDRapportMessaging_registerHMMMRequestHandler___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_atomic_copy(v3, a2, *(id *)(a1 + 40), 56);
    v3 = *(void **)(a1 + 32);
  }
  return objc_msgSend(v3, "_completeQueuedHMMMRequests");
}

uint64_t __46__HMDRapportMessaging_registerRequestHandler___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_atomic_copy(v3, a2, *(id *)(a1 + 40), 48);
    v3 = *(void **)(a1 + 32);
  }
  return objc_msgSend(v3, "_completeQueuedRequests");
}

uint64_t __62__HMDRapportMessaging_configureDiscoveryClientWithCompletion___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  uint64_t result;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    return objc_msgSend(v3, "_configureDiscoveryClientWithCompletion:", *(_QWORD *)(a1 + 40));
  if (!objc_getProperty(v3, a2, 40, 1))
  {
    v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_configureDiscoveryClientWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_67038 != -1)
    dispatch_once(&sharedInstance_onceToken_67038, &__block_literal_global_67039);
  return (id)sharedInstance_sharedInstance;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_67033 != -1)
    dispatch_once(&logCategory__hmf_once_t18_67033, &__block_literal_global_97_67034);
  return (id)logCategory__hmf_once_v19_67035;
}

void __34__HMDRapportMessaging_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v19_67035;
  logCategory__hmf_once_v19_67035 = v0;

}

void __37__HMDRapportMessaging_sharedInstance__block_invoke()
{
  HMDRapportMessaging *v0;
  uint64_t v1;
  void *v2;
  HMDRapportMessagingClientFactory *v3;

  v0 = [HMDRapportMessaging alloc];
  v3 = objc_alloc_init(HMDRapportMessagingClientFactory);
  v1 = -[HMDRapportMessaging initWithClientFactory:](v0, "initWithClientFactory:", v3);
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v1;

}

@end
