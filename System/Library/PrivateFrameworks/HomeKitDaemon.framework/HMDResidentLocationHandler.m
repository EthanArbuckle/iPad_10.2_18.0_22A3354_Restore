@implementation HMDResidentLocationHandler

- (HMDResidentLocationHandler)initWithHome:(id)a3 queue:(id)a4 messageDispatcher:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDResidentLocationProvider *v11;
  HMDResidentLocationHandler *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(HMDResidentLocationProvider);
  v12 = -[HMDResidentLocationHandler initWithHome:queue:messageDispatcher:locationProvider:](self, "initWithHome:queue:messageDispatcher:locationProvider:", v10, v9, v8, v11);

  return v12;
}

- (HMDResidentLocationHandler)initWithHome:(id)a3 queue:(id)a4 messageDispatcher:(id)a5 locationProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDResidentLocationHandler *v14;
  HMDResidentLocationHandler *v15;
  NSNumber *residentLocationRawValue;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDResidentLocationHandler;
  v14 = -[HMDResidentLocationHandler init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_home, v10);
    objc_storeStrong((id *)&v15->_workQueue, a4);
    objc_storeStrong((id *)&v15->_messageDispatcher, a5);
    residentLocationRawValue = v15->_residentLocationRawValue;
    v15->_residentLocationRawValue = (NSNumber *)&unk_24E96CBA8;

    objc_storeStrong((id *)&v15->_residentLocationProvider, a6);
  }

  return v15;
}

- (void)configure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  +[HMDRemoteMessagePolicy defaultPolicy](HMDMutableRemoteMessagePolicy, "defaultPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequiresSecureMessage:", 1);
  objc_msgSend(v3, "setRoles:", objc_msgSend(v3, "roles") | 4);
  v4 = (void *)objc_msgSend(v3, "copy");
  -[HMDResidentLocationHandler home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v5, 3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDResidentLocationHandler messageDispatcher](self, "messageDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerForMessage:receiver:policies:selector:", CFSTR("HMDDetermineResidentDeviceLocationMessage"), self, v8, sel__handleDetermineResidentLocationMessage_);

  -[HMDResidentLocationHandler _cachedResidentLocationRawValue](self, "_cachedResidentLocationRawValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "unsignedIntegerValue") != 100)
    -[HMDResidentLocationHandler setResidentLocationRawValue:](self, "setResidentLocationRawValue:", v9);

}

- (void)requestResidentLocation
{
  id v2;

  -[HMDResidentLocationHandler residentLocationProvider](self, "residentLocationProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestResidentLocation");

}

- (void)determineHomeOrAwayUsingElector:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  HMDResidentLocationHandler *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x24BE3F168]);
    -[HMDResidentLocationHandler workQueue](self, "workQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithQueue:", v9);

    -[HMDResidentLocationHandler residentLocationProvider](self, "residentLocationProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locationUpdatedFuture");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __77__HMDResidentLocationHandler_determineHomeOrAwayUsingElector_withCompletion___block_invoke;
    v22[3] = &unk_24E790890;
    v22[4] = self;
    v24 = v7;
    v23 = v6;
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __77__HMDResidentLocationHandler_determineHomeOrAwayUsingElector_withCompletion___block_invoke_97;
    v20[3] = &unk_24E795380;
    v20[4] = self;
    v21 = v24;
    v14 = (id)objc_msgSend(v12, "inContext:then:orRecover:", v10, v22, v20);

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@No elector, defaulting to unknown", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDResidentLocationHandler _updateToUnknownIfNoCachedLocation](v16, "_updateToUnknownIfNoCachedLocation");
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = _Block_copy(v7);
    v12 = v19;
    if (v19)
      (*((void (**)(void *, void *))v19 + 2))(v19, v10);
  }

}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDResidentLocationHandler home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDResidentLocationHandler home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_cachedResidentLocationRawValue
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  HMDResidentLocationHandler *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[HMDResidentLocationHandler cachedResidentLocationPath](HMDResidentLocationHandler, "cachedResidentLocationPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v3, 4, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_alloc_init(MEMORY[0x24BDD16F0]);
      objc_msgSend(v5, "numberFromString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v10;
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Loaded cached resident location: %@", (uint8_t *)&v12, 0x16u);

      }
      objc_autoreleasePoolPop(v7);

    }
    else
    {
      v6 = &unk_24E96CBA8;
    }

  }
  else
  {
    v6 = &unk_24E96CBA8;
  }

  return v6;
}

- (void)_cacheResidentLocationRawValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDResidentLocationHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[HMDResidentLocationHandler cachedResidentLocationPath](HMDResidentLocationHandler, "cachedResidentLocationPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v6, "writeToFile:atomically:encoding:error:", v5, 1, 4, &v13);
    v7 = v13;
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v15 = v11;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Caching resident location: %@ succeeded: %@ with error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);

  }
}

- (void)_updateToUnknownIfNoCachedLocation
{
  void *v3;
  void *v4;
  HMDResidentLocationHandler *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentLocationHandler _cachedResidentLocationRawValue](self, "_cachedResidentLocationRawValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "unsignedIntegerValue") == 100)
  {
    -[HMDResidentLocationHandler setResidentLocationRawValue:](self, "setResidentLocationRawValue:", &unk_24E96CBA8);
  }
  else
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Not updating to unknown, cached location exists: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

- (unint64_t)_residentLocationFromHomeLocation:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  unint64_t v11;
  void *v12;
  HMDResidentLocationHandler *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "distanceFromLocation:", v7);
  v10 = v9;
  if (v9 >= 1000.0 && fabs(v9 + -1000.0) >= 2.22044605e-16)
    v11 = 200;
  else
    v11 = 300;
  v12 = (void *)MEMORY[0x227676638](v8);
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    StringFromHMDResidentLocation(v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544386;
    v19 = v15;
    v20 = 2112;
    v21 = v16;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    v26 = 2048;
    v27 = v10;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Resident is: %@ homeLocation: %@ location: %@ distance: %f", (uint8_t *)&v18, 0x34u);

  }
  objc_autoreleasePoolPop(v12);

  return v11;
}

- (void)_determineHomeOrAwayUsingElector:(id)a3 location:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDResidentLocationHandler *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  HMDResidentLocationHandler *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDResidentLocationHandler *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDResidentLocationHandler workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v15;
    v41 = 2112;
    v42 = v16;
    v43 = 2112;
    v44 = v9;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Determining resident home/away using elector: %@ location: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  if (objc_msgSend(v8, "isCurrentDevice"))
  {
    -[HMDResidentLocationHandler home](v13, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "homeLocationHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "location");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = -[HMDResidentLocationHandler _residentLocationFromHomeLocation:location:](v13, "_residentLocationFromHomeLocation:location:", v19, v9);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentLocationHandler setResidentLocationRawValue:](v13, "setResidentLocationRawValue:", v21);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentLocationHandler _cacheResidentLocationRawValue:](v13, "_cacheResidentLocationRawValue:", v22);

      v23 = (void *)MEMORY[0x227676638]();
      v24 = v13;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        StringFromHMDResidentLocation(v20);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v26;
        v41 = 2112;
        v42 = v27;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@We are the elector, determined we are: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      v28 = _Block_copy(v10);
      v29 = v28;
      if (v28)
        (*((void (**)(void *, _QWORD))v28 + 2))(v28, 0);
    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = v13;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v33;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@We are the elector, home location is nil, defaulting to unknown", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v30);
      -[HMDResidentLocationHandler _updateToUnknownIfNoCachedLocation](v31, "_updateToUnknownIfNoCachedLocation");
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = _Block_copy(v10);
      v35 = v34;
      if (v34)
        (*((void (**)(void *, void *))v34 + 2))(v34, v29);

    }
  }
  else
  {
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __87__HMDResidentLocationHandler__determineHomeOrAwayUsingElector_location_withCompletion___block_invoke;
    v36[3] = &unk_24E7908D8;
    v36[4] = v13;
    v37 = v8;
    v38 = v10;
    -[HMDResidentLocationHandler _sendResidentLocationMessageToElector:location:completion:](v13, "_sendResidentLocationMessageToElector:location:completion:", v37, v9, v36);

  }
}

- (void)_sendResidentLocationMessageToElector:(id)a3 location:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  HMDRemoteDeviceMessageDestination *v11;
  void *v12;
  void *v13;
  HMDRemoteDeviceMessageDestination *v14;
  HMDRemoteMessage *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a3;
  encodeRootObject();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = CFSTR("drl.el");
  v21[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [HMDRemoteDeviceMessageDestination alloc];
  -[HMDResidentLocationHandler messageTargetUUID](self, "messageTargetUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v11, "initWithTarget:device:", v12, v13);
  v15 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:]([HMDRemoteMessage alloc], "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:", CFSTR("HMDDetermineResidentDeviceLocationMessage"), 25, v14, v10, 0, 1, 30.0, -1);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __88__HMDResidentLocationHandler__sendResidentLocationMessageToElector_location_completion___block_invoke;
  v18[3] = &unk_24E790900;
  v19 = v7;
  v16 = v7;
  -[HMDRemoteMessage setResponseHandler:](v15, "setResponseHandler:", v18);
  -[HMDResidentLocationHandler messageDispatcher](self, "messageDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:completionHandler:", v15, 0);

}

- (void)_handleDetermineResidentLocationMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMDResidentLocationHandler *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDResidentLocationHandler *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDResidentLocationHandler *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDResidentLocationHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "messagePayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hm_locationFromDataForKey:", CFSTR("drl.el"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMDResidentLocationHandler home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeLocationHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = -[HMDResidentLocationHandler _residentLocationFromHomeLocation:location:](self, "_residentLocationFromHomeLocation:location:", v10, v7);
      objc_msgSend(v4, "remoteSourceDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        StringFromHMDResidentLocation(v11);
        v29 = v13;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "shortDescription");
        v30 = v11;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v16;
        v35 = 2112;
        v36 = v17;
        v37 = 2112;
        v38 = v18;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@We are the elector, determined location of: %@ for resident device: %@", buf, 0x20u);

        v11 = v30;
        v13 = v29;

      }
      objc_autoreleasePoolPop(v13);
      v31 = CFSTR("drl.dl");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithPayload:", v20);

    }
    else
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v28;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Home location is nil when handling determine resident location message", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      v39 = CFSTR("drl.dl");
      v40 = &unk_24E96CBA8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithPayload:", v12);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v24;
      v35 = 2112;
      v36 = v6;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Determine resident location message payload: %@ did not contain resident location", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v41 = CFSTR("drl.dl");
    v42[0] = &unk_24E96CBA8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithPayload:", v10);
  }

}

- (NSNumber)residentLocationRawValue
{
  return self->_residentLocationRawValue;
}

- (void)setResidentLocationRawValue:(id)a3
{
  objc_storeStrong((id *)&self->_residentLocationRawValue, a3);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (void)setMessageDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_messageDispatcher, a3);
}

- (HMDResidentLocationProvider)residentLocationProvider
{
  return self->_residentLocationProvider;
}

- (void)setResidentLocationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_residentLocationProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residentLocationProvider, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_residentLocationRawValue, 0);
}

void __88__HMDResidentLocationHandler__sendResidentLocationMessageToElector_location_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "hmf_numberForKey:", CFSTR("drl.dl"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __87__HMDResidentLocationHandler__determineHomeOrAwayUsingElector_location_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__HMDResidentLocationHandler__determineHomeOrAwayUsingElector_location_withCompletion___block_invoke_2;
  block[3] = &unk_24E799A68;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v14 = v5;
  v15 = v8;
  v16 = v9;
  v10 = *(id *)(a1 + 48);
  v17 = v6;
  v18 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

void __87__HMDResidentLocationHandler__determineHomeOrAwayUsingElector_location_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    v5 = objc_msgSend(v4, "unsignedIntegerValue");
    v6 = *(void **)(a1 + 40);
    if (v5 != 100)
    {
      objc_msgSend(v6, "setResidentLocationRawValue:", v4);
      objc_msgSend(*(id *)(a1 + 40), "_cacheResidentLocationRawValue:", v4);
      goto LABEL_11;
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Did not receive a determined resident location back from elector: %@, defaulting to unknown", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v6 = *(void **)(a1 + 40);
  }
  objc_msgSend(v6, "_updateToUnknownIfNoCachedLocation");
LABEL_11:
  v12 = _Block_copy(*(const void **)(a1 + 64));
  v13 = v12;
  if (v12)
    (*((void (**)(void *, _QWORD))v12 + 2))(v12, *(_QWORD *)(a1 + 56));

}

uint64_t __77__HMDResidentLocationHandler_determineHomeOrAwayUsingElector_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void (**v14)(void *, void *);
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Resident location request resolved", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "residentLocationProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_determineHomeOrAwayUsingElector:location:withCompletion:", *(_QWORD *)(a1 + 40), v9, *(_QWORD *)(a1 + 48));
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Resident location is nil, defaulting to Unknown", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 32), "_updateToUnknownIfNoCachedLocation");
    v14 = (void (**)(void *, void *))_Block_copy(*(const void **)(a1 + 48));
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, v15);

    }
  }

  return 1;
}

uint64_t __77__HMDResidentLocationHandler_determineHomeOrAwayUsingElector_withCompletion___block_invoke_97(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Resident location request encountered error: %@, defaulting to Unknown", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "_updateToUnknownIfNoCachedLocation");
  v8 = _Block_copy(*(const void **)(a1 + 40));
  v9 = v8;
  if (v8)
    (*((void (**)(void *, id))v8 + 2))(v8, v3);

  return 1;
}

+ (id)cachedResidentLocationPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  determineHomeKitDaemonRootStorePath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("lastDeterminedResidentLocation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to get HomeKit daemon root store path!", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v4 = 0;
  }

  return v4;
}

+ (void)deleteCachedResidentLocation
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  +[HMDResidentLocationHandler cachedResidentLocationPath](HMDResidentLocationHandler, "cachedResidentLocationPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v3, "removeItemAtPath:error:", v2, &v9);
    v4 = v9;

    v5 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v11 = v7;
      v12 = 2112;
      v13 = v2;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Removing cache file: %@ succeeded: %@ with error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v5);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_198833 != -1)
    dispatch_once(&logCategory__hmf_once_t11_198833, &__block_literal_global_198834);
  return (id)logCategory__hmf_once_v12_198835;
}

void __41__HMDResidentLocationHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v12_198835;
  logCategory__hmf_once_v12_198835 = v0;

}

@end
