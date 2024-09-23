@implementation HMDPrimaryElectionCoordinationAddOn

- (HMDPrimaryElectionCoordinationAddOn)initWithContext:(id)a3
{
  return -[HMDPrimaryElectionCoordinationAddOn initWithContext:meshController:dataSource:](self, "initWithContext:meshController:dataSource:", a3, 0, 0);
}

- (HMDPrimaryElectionCoordinationAddOn)initWithContext:(id)a3 meshController:(id)a4 dataSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  HMDCoordinationLocalElectionMeshController *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  objc_super v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)HMDPrimaryElectionCoordinationAddOn;
  v11 = -[HMDPrimaryElectionCoordinationAddOn init](&v32, sel_init);
  objc_storeWeak((id *)v11 + 10, v8);
  objc_msgSend(v8, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)*((_QWORD *)v11 + 2);
  *((_QWORD *)v11 + 2) = v12;

  v14 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F168]), "initWithQueue:", *((_QWORD *)v11 + 2));
  v15 = (void *)*((_QWORD *)v11 + 17);
  *((_QWORD *)v11 + 17) = v14;

  if (v9)
  {
    v16 = v9;
    v17 = (void *)*((_QWORD *)v11 + 1);
    *((_QWORD *)v11 + 1) = v16;
  }
  else
  {
    v18 = *((id *)v11 + 2);
    v19 = -[HMDCoordinationLocalElectionMeshController initWithQueue:]([HMDCoordinationLocalElectionMeshController alloc], "initWithQueue:", v18);

    v17 = (void *)*((_QWORD *)v11 + 1);
    *((_QWORD *)v11 + 1) = v19;
  }

  objc_msgSend(*((id *)v11 + 1), "setDelegate:", v11);
  objc_storeStrong((id *)v11 + 11, a5);
  -[HMDPrimaryElectionCoordinationAddOn _createDebounceTimerWithInterval:](v11, 5.0);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)*((_QWORD *)v11 + 6);
  *((_QWORD *)v11 + 6) = v20;

  objc_msgSend(*((id *)v11 + 6), "setDelegate:", v11);
  objc_msgSend(*((id *)v11 + 6), "setDelegateQueue:", *((_QWORD *)v11 + 2));
  objc_msgSend(v10, "remoteDeviceMonitor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v24 = v22;
    v25 = (void *)*((_QWORD *)v11 + 16);
    *((_QWORD *)v11 + 16) = v24;
  }
  else
  {
    objc_msgSend(v8, "messageDispatcher");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "secureRemoteTransport");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "deviceMonitor");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)*((_QWORD *)v11 + 16);
    *((_QWORD *)v11 + 16) = v27;

  }
  *((_QWORD *)v11 + 5) = 0;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)*((_QWORD *)v11 + 22);
  *((_QWORD *)v11 + 22) = v29;

  v11[24] = 0;
  *(_OWORD *)(v11 + 152) = xmmword_2226902F0;

  return (HMDPrimaryElectionCoordinationAddOn *)v11;
}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDPrimaryElectionCoordinationAddOn context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessagePolicy defaultPolicy](HMDMutableRemoteMessagePolicy, "defaultPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRequiresSecureMessage:", 1);
  objc_msgSend(v6, "setRequiresAccountMessage:", 1);
  v7 = (void *)objc_msgSend(v6, "copy");
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v5, 3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  v20[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("mesh.requestCapabilities"), self, v9, sel_handleDeviceCapabilitiesRequest_);

  v19[0] = v7;
  v19[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("mesh.requestCurrentPrimary"), self, v10, sel_handleCurrentPrimaryRequest_);

  v18[0] = v7;
  v18[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("mesh.currentPrimaryUpdate"), self, v11, sel_handleCurrentPrimaryNotification_);

  if (isInternalBuild())
  {
    v17[0] = v7;
    v17[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("mesh.setPreferredPrimary.debug"), self, v12, sel_handleSetPreferredPrimaryDebugRequest_);

  }
  +[HMDRemoteMessagePolicy defaultPolicy](HMDMutableRemoteMessagePolicy, "defaultPolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRequiresSecureMessage:", 1);
  objc_msgSend(v6, "setRequiresAccountMessage:", 1);
  objc_msgSend(v13, "setRoles:", objc_msgSend(v13, "roles") | 4);
  v14 = (void *)objc_msgSend(v13, "copy");
  v16[0] = v14;
  v16[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("mesh.meshInformationRequest"), self, v15, sel_handleMeshInformationRequest_);

}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDPrimaryElectionCoordinationAddOn *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDPrimaryElectionCoordinationAddOn context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.HomeKit.HH2"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLocalElectionMeshController debugDescriptionForControllerType](v9->_meshController, "debugDescriptionForControllerType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Starting mesh controller with type: %{public}@, name: %{public}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDLocalElectionMeshController startMeshWithName:](v9->_meshController, "startMeshWithName:", v7);

}

- (void)stop
{
  void *v3;
  HMDPrimaryElectionCoordinationAddOn *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)MEMORY[0x227676638]();
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLocalElectionMeshController debugDescriptionForControllerType](v4->_meshController, "debugDescriptionForControllerType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping mesh controller with type: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDPrimaryElectionCoordinationAddOn debounceTimer](v4, "debounceTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suspend");

  -[HMDPrimaryElectionCoordinationAddOn pingTimer](v4, "pingTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "suspend");

  -[HMDPrimaryElectionCoordinationAddOn _stopSecondaryMeshTimer]((dispatch_queue_t *)v4);
  -[HMDLocalElectionMeshController stop](v4->_meshController, "stop");
}

- (void)performElection
{
  void *v3;
  uint64_t v4;
  void *v5;
  HMDPrimaryElectionCoordinationAddOn *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  HMDPrimaryElectionCoordinationAddOn *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[HMDLocalElectionMeshController meshNodes](self->_meshController, "meshNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (-[HMDPrimaryElectionCoordinationAddOn residentCountDuringLastElection](self, "residentCountDuringLastElection") < 2
    || v4)
  {
    -[HMDPrimaryElectionCoordinationAddOn resumeDebounceWithInterval:](self, 5.0);
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v8;
      v20 = 2048;
      v21 = -[HMDPrimaryElectionCoordinationAddOn residentCountDuringLastElection](v6, "residentCountDuringLastElection");
      v22 = 2048;
      v23 = 0;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Rapportd might have died (%lu -> %lu visible devices)", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDPrimaryElectionCoordinationAddOn context](v6, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "primaryResidentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isCurrentDevice");

    v12 = (void *)MEMORY[0x227676638]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if ((v11 & 1) != 0)
    {
      if (v15)
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v16;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@We are the current primary resident, using the cautious debounce timeout", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      -[HMDPrimaryElectionCoordinationAddOn resumeDebounceWithInterval:](v13, 45.0);
    }
    else
    {
      if (v15)
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v17;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@We are not the current primary, going to pessimistic secondary mesh state", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      -[HMDPrimaryElectionCoordinationAddOn setState:](v13, "setState:", 4);
      -[HMDPrimaryElectionCoordinationAddOn setInPessimisticSecondaryMesh:](v13, "setInPessimisticSecondaryMesh:", 1);
      -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer]((dispatch_queue_t *)v13);
    }
  }
}

- (void)primaryResidentChanged:(id)a3 previousResidentDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMDPrimaryElectionCoordinationAddOn *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__HMDPrimaryElectionCoordinationAddOn_primaryResidentChanged_previousResidentDevice___block_invoke;
  block[3] = &unk_24E79BBD0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (BOOL)residentIsPartOfTheCurrentMesh:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[HMDPrimaryElectionCoordinationAddOn meshNodeForResident:]((uint64_t)self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  _BOOL4 v9;
  void *v10;
  HMDPrimaryElectionCoordinationAddOn *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDPrimaryElectionCoordinationAddOn context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryResidentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v9 = -[HMDPrimaryElectionCoordinationAddOn residentIsPartOfTheCurrentMesh:](self, "residentIsPartOfTheCurrentMesh:", v4);
    v8 = 1;
    if (-[HMDLocalElectionMeshController isLeader](self->_meshController, "isLeader") && v9)
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v13;
        v18 = 2114;
        v19 = v14;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Not allowing external update of primary resident to: %{public}@ because we are the leader and this resident is in our mesh.", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)state
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  unint64_t state;
  void *v6;
  HMDPrimaryElectionCoordinationAddOn *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMDPrimaryElectionCoordinationAddOn *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  HMDPrimaryElectionCoordinationAddOn *v20;
  _BYTE v21[22];
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  state = self->_state;
  if (state != a3)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (state > 5)
        v11 = CFSTR("<unknown state>");
      else
        v11 = off_24E797E00[state];
      if (a3 > 5)
        v12 = CFSTR("<unknown state>");
      else
        v12 = off_24E797E00[a3];
      *(_DWORD *)v21 = 138543874;
      *(_QWORD *)&v21[4] = v9;
      *(_WORD *)&v21[12] = 2114;
      *(_QWORD *)&v21[14] = v11;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Transitioning state from %{public}@ -> %{public}@", v21, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    self->_state = a3;
    if (state != 5)
    {
      if (state != 4)
      {
        if (state == 1)
        {
          dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
          -[HMDPrimaryElectionCoordinationAddOn findPrimaryMeshOperation](v7, "findPrimaryMeshOperation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDPrimaryElectionCoordinationAddOn setFindPrimaryMeshOperation:](v7, "setFindPrimaryMeshOperation:", 0);
          -[HMDPrimaryElectionCoordinationAddOn setFindPrimaryMeshFuture:](v7, "setFindPrimaryMeshFuture:", 0);
          objc_msgSend(v13, "cancel");

        }
        return;
      }
LABEL_24:
      -[HMDPrimaryElectionCoordinationAddOn _stopSecondaryMeshTimer]((dispatch_queue_t *)v7);
      return;
    }
    if (-[HMDPrimaryElectionCoordinationAddOn inPessimisticSecondaryMesh](v7, "inPessimisticSecondaryMesh") != 2)
      goto LABEL_24;
    v14 = -[HMDPrimaryElectionCoordinationAddOn state](v7, "state");
    if (v14 == 4)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v20 = v7;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v21 = 138543362;
        *(_QWORD *)&v21[4] = v18;
        v19 = "%{public}@Staying in secondary mesh state after being in pessimistic secondary mesh";
        goto LABEL_21;
      }
    }
    else
    {
      if (v14 != 2)
      {
LABEL_23:
        -[HMDPrimaryElectionCoordinationAddOn setInPessimisticSecondaryMesh:](v7, "setInPessimisticSecondaryMesh:", 0, *(_OWORD *)v21);
        goto LABEL_24;
      }
      v15 = (void *)MEMORY[0x227676638]();
      v16 = v7;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v21 = 138543362;
        *(_QWORD *)&v21[4] = v18;
        v19 = "%{public}@Becoming primary after pinging in pessimistic secondary mesh";
LABEL_21:
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, v19, v21, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v15);
    goto LABEL_23;
  }
}

- (id)residentsInMesh
{
  -[HMDPrimaryElectionCoordinationAddOn createMissingResidentDevicesFromMeshNodes:](self, self->_meshController);
  return -[HMDPrimaryElectionCoordinationAddOn _meshNodesToResidentDevices]((dispatch_queue_t *)self);
}

- (void)_findPrimaryMeshWithContext:(id)a3 otherResidents:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F168]), "initWithQueue:", self->_queue);
  objc_msgSend(v5, "cloudReady");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __82__HMDPrimaryElectionCoordinationAddOn__findPrimaryMeshWithContext_otherResidents___block_invoke;
  v10[3] = &unk_24E797BE8;
  v10[4] = self;
  v11 = v5;
  v8 = v5;
  v9 = (id)objc_msgSend(v7, "inContext:then:", v6, v10);

}

- (void)selectPrimaryResidentWithReason:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__HMDPrimaryElectionCoordinationAddOn_selectPrimaryResidentWithReason___block_invoke;
  v4[3] = &unk_24E797C10;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_selectPrimaryResidentWithReason:(unint64_t)a3
{
  void *v5;
  HMDPrimaryElectionCoordinationAddOn *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDPrimaryElectionCoordinationAddOn *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  HMDPrimaryElectionCoordinationAddOn *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  HMDPrimaryElectionCoordinationAddOn *v31;
  NSObject *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38[2];
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Electing a primary resident", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (a3 == 7)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = v6;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Calling _selectPrimaryResidentFromCandidates due to forced primary election from debug/tools", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  -[HMDPrimaryElectionCoordinationAddOn debounceTimer](v6, "debounceTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isRunning");

  if (v14)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v6;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Debounce timer active, deferring election", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }
  else
  {
    -[HMDPrimaryElectionCoordinationAddOn context](v6, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentResidentDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[HMDPrimaryElectionCoordinationAddOn setState:](v6, "setState:", 3);
      -[HMDPrimaryElectionCoordinationAddOn context](v6, "context");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x24BDBCF20];
      -[HMDLocalElectionMeshController meshNodes](v6->_meshController, "meshNodes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setWithArray:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDPrimaryElectionCoordinationAddOn _meshNodesToResidentDevices]((dispatch_queue_t *)v6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setByAddingObject:", v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, v6);
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __72__HMDPrimaryElectionCoordinationAddOn__selectPrimaryResidentWithReason___block_invoke;
      v34[3] = &unk_24E797C38;
      objc_copyWeak(v38, (id *)buf);
      v27 = v25;
      v35 = v27;
      v28 = v24;
      v36 = v28;
      v29 = v21;
      v37 = v29;
      v38[1] = (id)a3;
      -[HMDPrimaryElectionCoordinationAddOn _requestElectionParametersFromCandidates:completionHandler:]((dispatch_queue_t *)v6, v26, v34);

      objc_destroyWeak(v38);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = v6;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v33;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@No current resident device, bailing", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v30);
    }

  }
}

- (id)primarySortComparatorForCurrentPrimary:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__HMDPrimaryElectionCoordinationAddOn_primarySortComparatorForCurrentPrimary___block_invoke;
  aBlock[3] = &unk_24E797CC8;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDPrimaryElectionCoordinationAddOn context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v4;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (unint64_t)messageTransportRestriction
{
  return 14;
}

- (void)handleDeviceCapabilitiesRequest:(id)a3
{
  id v4;
  void *v5;
  HMDPrimaryElectionCoordinationAddOn *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteSourceDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received capabilities request from: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDPrimaryElectionCoordinationAddOn pingTimer](v6, "pingTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "kick");

  -[HMDPrimaryElectionCoordinationAddOn candidateRepresentation](v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "toMessagePayload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithPayload:", v12);

}

- (void)handleCurrentPrimaryRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  HMDPrimaryElectionCoordinationAddOn *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDPrimaryElectionCoordinationAddOn *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDPrimaryElectionCoordinationAddOn *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((-[HMDLocalElectionMeshController isLeader](self->_meshController, "isLeader") & 1) == 0)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Not responding to current primary request because we're not the leader", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = 91;
    goto LABEL_9;
  }
  -[HMDPrimaryElectionCoordinationAddOn debounceTimer](self, "debounceTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunning");

  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not responding to current primary request because we are debouncing an election", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = 15;
LABEL_9:
    objc_msgSend(v11, "hmErrorWithCode:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v17);
    goto LABEL_18;
  }
  -[HMDPrimaryElectionCoordinationAddOn context](self, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "primaryResidentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x227676638]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v17)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "remoteSourceDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v23;
      v34 = 2114;
      v35 = v24;
      v36 = 2114;
      v37 = v25;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Responding to current primary request from: %{public}@ with: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(v17, "identifier", CFSTR("uuid"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithPayload:", v28);

  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v29;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Not responding to current primary request because our primary resident is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v26);
  }

LABEL_18:
}

- (void)handleCurrentPrimaryNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  HMDPrimaryElectionCoordinationAddOn *v14;
  void *v15;
  void *v16;
  HMDPrimaryElectionCoordinationAddOn *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDPrimaryElectionCoordinationAddOn *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDPrimaryElectionCoordinationAddOn *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  HMDPrimaryElectionCoordinationAddOn *v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  HMDCoordinationPrimaryElectionLogEvent *v50;
  void *v51;
  void *v52;
  void *v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "respondWithSuccess");
  -[HMDPrimaryElectionCoordinationAddOn context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "messagePayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("uuid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[HMDPrimaryElectionCoordinationAddOn meshLeaderResidentDevice]((dispatch_queue_t *)self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8
        && (objc_msgSend(v4, "remoteSourceDevice"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v8, "device"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v9, "isEqual:", v10),
            v10,
            v9,
            (v11 & 1) == 0))
      {
        v20 = (void *)MEMORY[0x227676638]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "shortDescription");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "remoteSourceDevice");
          v52 = v20;
          v25 = v8;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "shortDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v55 = v23;
          v56 = 2114;
          v57 = v24;
          v58 = 2114;
          v59 = v27;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Received a current primary update from an unexpected device: Leader: %{public}@, Source: %{public}@", buf, 0x20u);

          v8 = v25;
          v20 = v52;

        }
        objc_autoreleasePoolPop(v20);
      }
      else
      {
        objc_msgSend(v5, "availableResidentDevices");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hmd_residentWithIdentifier:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = self;
          v15 = v13;
        }
        else
        {
          v28 = (void *)MEMORY[0x227676638]();
          v29 = self;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = v8;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v55 = v32;
            v56 = 2114;
            v57 = v7;
            _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to map %{public}@ to known resident", buf, 0x16u);

            v8 = v31;
          }

          objc_autoreleasePoolPop(v28);
          v14 = v29;
          v15 = 0;
        }
        if (-[HMDPrimaryElectionCoordinationAddOn _doesLocalMeshContainPrimaryResident:]((dispatch_queue_t *)v14, v15))v33 = 2;
        else
          v33 = 4;
        -[HMDPrimaryElectionCoordinationAddOn setState:](self, "setState:", v33);
        objc_msgSend(v5, "primaryResidentDevice");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "isEqual:", v7);

        v37 = (void *)MEMORY[0x227676638]();
        v38 = self;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
        if ((v36 & 1) != 0)
        {
          if (v40)
          {
            HMFGetLogIdentifier();
            v53 = v8;
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "primaryResidentDevice");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v55 = v41;
            v56 = 2112;
            v57 = v42;
            _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Broadcasted primary is current primary: %@", buf, 0x16u);

            v8 = v53;
          }

          objc_autoreleasePoolPop(v37);
        }
        else
        {
          if (v40)
          {
            HMFGetLogIdentifier();
            v43 = v8;
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v55 = v44;
            v56 = 2112;
            v57 = v13;
            _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Received update for current primary: %@", buf, 0x16u);

            v8 = v43;
          }

          objc_autoreleasePoolPop(v37);
          if (v13)
          {
            -[HMDPrimaryElectionCoordinationAddOn delegate](v38, "delegate");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "primaryElectionAddOn:didElectPrimaryResident:confirmed:electionLogEvent:", v38, v13, 1, 0);

          }
        }
        v46 = v36 ^ 1u;
        objc_msgSend(v5, "currentResidentDevice");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "identifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "isEqual:", v7);

        v50 = -[HMDCoordinationPrimaryElectionLogEvent initWithIsPrimary:didChangePrimary:]([HMDCoordinationPrimaryElectionLogEvent alloc], "initWithIsPrimary:didChangePrimary:", v49, v46);
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "submitLogEvent:", v50);

      }
    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v19;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Message did not contain a primary resident value", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
    }

  }
}

- (void)handleMeshInformationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDLocalElectionMeshController *meshController;
  void *v8;
  void *v9;
  void *v10;
  HMDPrimaryElectionCoordinationAddOn *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDPrimaryElectionCoordinationAddOn context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    meshController = self->_meshController;
    objc_msgSend(v5, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDPrimaryElectionMeshInformation meshInformationWithMeshController:home:](HMDPrimaryElectionMeshInformation, "meshInformationWithMeshController:home:", meshController, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v13)
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v14;
        v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling mesh information request and responding with: %@", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v9, "toMessagePayload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithPayload:", v15);
    }
    else
    {
      if (v13)
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling mesh information request and responding with error", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v15);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v9);
  }

}

- (void)handleSetPreferredPrimaryDebugRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  HMDPrimaryElectionCoordinationAddOn *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id *v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  const char *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", CFSTR("preferred.primary.identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "messagePayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hmf_BOOLForKey:", CFSTR("preferred.primary.one.time"));

  objc_msgSend(v4, "messagePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hmf_BOOLForKey:", CFSTR("preferred.primary.trigger.election"));

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543874;
      v32 = v15;
      v33 = 2112;
      v34 = v6;
      v35 = 2112;
      v36 = v16;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Received SetPreferredPrimaryDebugRequest with primary: %@ ...isOneTime: %@", (uint8_t *)&v31, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    setPrimaryPreference(v6, v8);
    if (!v10)
      goto LABEL_22;
LABEL_9:
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v12;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@SetPreferredPrimary - Triggering resident election", (uint8_t *)&v31, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    if ((objc_msgSend(v20[1], "isLeader") & 1) != 0)
    {
      v23 = objc_msgSend(v20, "state");
      v24 = (void *)MEMORY[0x227676638]();
      v25 = v20;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (v23 == 2)
      {
        if (v27)
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138543362;
          v32 = v28;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Handling force resident election request: This device is the leader. Starting election.", (uint8_t *)&v31, 0xCu);

        }
        objc_autoreleasePoolPop(v24);
        objc_msgSend(v25, "_selectPrimaryResidentWithReason:", 7);
        goto LABEL_22;
      }
      if (v27)
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543362;
        v32 = v29;
        v30 = "%{public}@Handling force resident election request: This device is not in the primary mesh. Discarding message.";
        goto LABEL_20;
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = v20;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543362;
        v32 = v29;
        v30 = "%{public}@Handling force resident election request: This device is not the leader. Discarding message.";
LABEL_20:
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v31, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v24);
    goto LABEL_22;
  }
  if (v14)
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543618;
    v32 = v17;
    v33 = 2112;
    v34 = v18;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Received SetPreferredPrimaryDebugRequest with nil primary, requireOneTime: %@", (uint8_t *)&v31, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  clearPrimaryPreference(v8);
  if (v10)
    goto LABEL_9;
LABEL_22:

}

- (void)meshController:(id)a3 didReceivePingFromLeaderWithPrimaryResidentUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDPrimaryElectionCoordinationAddOn *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDPrimaryElectionCoordinationAddOn pingTimer](self, "pingTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "kick");

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Received ping from leader. The leader is alive. Primary resident UUID sent by the leader is %{public}@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDPrimaryElectionCoordinationAddOn delegate](v10, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "primaryElectionAddOn:didReceivePrimaryResidentUUIDFromLeader:", v10, v7);

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Received ping from leader. The leader is alive.", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)meshControllerDidStartElection:(id)a3
{
  id v4;
  void *v5;
  HMDPrimaryElectionCoordinationAddOn *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Election started, suspending ping timer", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDPrimaryElectionCoordinationAddOn pingTimer](v6, "pingTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "suspend");

  -[HMDPrimaryElectionCoordinationAddOn setPingTimer:](v6, "setPingTimer:", 0);
  -[HMDPrimaryElectionCoordinationAddOn meshLeaderToPrimaryResidentPingResponseTimer](v6, "meshLeaderToPrimaryResidentPingResponseTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suspend");

  -[HMDPrimaryElectionCoordinationAddOn setMeshLeaderToPrimaryResidentPingResponseTimer:](v6, "setMeshLeaderToPrimaryResidentPingResponseTimer:", 0);
  -[HMDPrimaryElectionCoordinationAddOn _clearPessimisticMeshState](v6);
  -[HMDPrimaryElectionCoordinationAddOn _stopBeingLeader]((dispatch_queue_t *)v6);

}

- (void)meshControllerDidElectLeader:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  HMDPrimaryElectionCoordinationAddOn *v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  const __CFString *v13;
  __CFString *v14;
  void *v15;
  HMDPrimaryElectionCoordinationAddOn *v16;
  NSObject *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  HMDCoordinationPrimaryMeshLogEvent *v22;
  unint64_t v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDLocalElectionMeshController leaderNode](self->_meshController, "leaderNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPrimaryElectionCoordinationAddOn lastKnownLeaderNode](self, "lastKnownLeaderNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (objc_msgSend(v4, "isLeader"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HMDPrimaryElectionCoordinationAddOn state](v9, "state");
      if (v12 > 5)
        v13 = CFSTR("<unknown state>");
      else
        v13 = off_24E797E00[v12];
      v25 = 138543618;
      v26 = v11;
      v27 = 2114;
      v28 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@We are now the mesh leader in state: %{public}@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v19 = -[HMDPrimaryElectionCoordinationAddOn _currentStateRequiresElection]((uint64_t)v9);
    -[HMDPrimaryElectionCoordinationAddOn _didBecomeLeaderAndPerformElection:]((uint64_t)v9, v19);
  }
  else
  {
    -[HMDPrimaryElectionCoordinationAddOn meshLeaderResidentDevice]((dispatch_queue_t *)self);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v18;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Other device elected mesh leader: %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDPrimaryElectionCoordinationAddOn _anotherNodeBecameLeader]((dispatch_queue_t *)v16);

  }
  v20 = v7 ^ 1u;
  -[HMDLocalElectionMeshController meshNodes](self->_meshController, "meshNodes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPrimaryElectionCoordinationAddOn setResidentCountDuringLastElection:](self, "setResidentCountDuringLastElection:", objc_msgSend(v21, "count"));

  v22 = objc_alloc_init(HMDCoordinationPrimaryMeshLogEvent);
  -[HMDCoordinationPrimaryMeshLogEvent setIsLeader:](v22, "setIsLeader:", objc_msgSend(v4, "isLeader"));
  -[HMDCoordinationPrimaryMeshLogEvent setDidChangeLeader:](v22, "setDidChangeLeader:", v20);
  -[HMDCoordinationPrimaryMeshLogEvent setDidElectLeader:](v22, "setDidElectLeader:", 1);
  v23 = -[HMDPrimaryElectionCoordinationAddOn state](self, "state");
  -[HMDCoordinationPrimaryMeshLogEvent setIsInSecondaryMesh:](v22, "setIsInSecondaryMesh:", (v23 < 6) & (0x30u >> v23));
  -[HMDCoordinationPrimaryMeshLogEvent setDidCurrentDeviceLeavePrimaryMesh:](v22, "setDidCurrentDeviceLeavePrimaryMesh:", 0);
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "submitLogEvent:", v22);

  -[HMDPrimaryElectionCoordinationAddOn setLastKnownLeaderNode:](self, "setLastKnownLeaderNode:", v5);
  -[HMDPrimaryElectionCoordinationAddOn _maybeStartPingTimer]((uint64_t)self);

}

- (void)meshControllerDidUpdatesNodes:(id)a3
{
  id v4;
  void *v5;
  HMDPrimaryElectionCoordinationAddOn *v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  OS_dispatch_queue *queue;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  HMDPrimaryElectionCoordinationAddOn *v26;
  NSObject *v27;
  void *v28;
  int v29;
  uint64_t v30;
  HMDCoordinationPrimaryMeshLogEvent *v31;
  unint64_t v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_msgSend(v4, "isEqual:", self->_meshController) & 1) == 0)
    _HMFPreconditionFailure();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138543362;
    v35 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Mesh nodes updated", (uint8_t *)&v34, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDPrimaryElectionCoordinationAddOn createMissingResidentDevicesFromMeshNodes:](v6, self->_meshController);
  -[HMDPrimaryElectionCoordinationAddOn _clearPessimisticMeshState](v6);
  v9 = -[HMDPrimaryElectionCoordinationAddOn state](v6, "state");
  -[HMDPrimaryElectionCoordinationAddOn context](v6, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "primaryResidentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDPrimaryElectionCoordinationAddOn _doesLocalMeshContainPrimaryResident:]((dispatch_queue_t *)v6, v11);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDPrimaryElectionCoordinationAddOn activeNodesUpdateDebounceTimer](v6, "activeNodesUpdateDebounceTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "suspend");

  -[HMDPrimaryElectionCoordinationAddOn dataSource](v6, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "createActiveNodesUpdateDebounceTimerWithInterval:options:", 0, 5.0);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 5.0);
  }
  v17 = (void *)v16;

  -[HMDPrimaryElectionCoordinationAddOn setActiveNodesUpdateDebounceTimer:](v6, "setActiveNodesUpdateDebounceTimer:", v17);
  -[HMDPrimaryElectionCoordinationAddOn activeNodesUpdateDebounceTimer](v6, "activeNodesUpdateDebounceTimer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", v6);

  queue = self->_queue;
  -[HMDPrimaryElectionCoordinationAddOn activeNodesUpdateDebounceTimer](v6, "activeNodesUpdateDebounceTimer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegateQueue:", queue);

  -[HMDPrimaryElectionCoordinationAddOn activeNodesUpdateDebounceTimer](v6, "activeNodesUpdateDebounceTimer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "resume");

  if ((-[HMDPrimaryElectionCoordinationAddOn state](v6, "state") & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    -[HMDPrimaryElectionCoordinationAddOn context](v6, "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "primaryResidentDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HMDPrimaryElectionCoordinationAddOn _doesLocalMeshContainPrimaryResident:]((dispatch_queue_t *)v6, v23);

    if (v24)
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = v6;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v28;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Primary resident is in our mesh", (uint8_t *)&v34, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      -[HMDPrimaryElectionCoordinationAddOn setState:](v26, "setState:", 2);
    }
  }
  if (objc_msgSend(v4, "isProcessing"))
  {
    if (objc_msgSend(v4, "isLeader"))
    {
      v29 = -[HMDPrimaryElectionCoordinationAddOn _currentStateRequiresElection]((uint64_t)v6);
      -[HMDPrimaryElectionCoordinationAddOn _didBecomeLeaderAndPerformElection:]((uint64_t)v6, v29);
    }
    else
    {
      -[HMDPrimaryElectionCoordinationAddOn _anotherNodeBecameLeader]((dispatch_queue_t *)v6);
    }
  }
  v30 = (v9 < 6) & (0xCu >> v9) & (v12 ^ 1);
  v31 = objc_alloc_init(HMDCoordinationPrimaryMeshLogEvent);
  -[HMDCoordinationPrimaryMeshLogEvent setIsLeader:](v31, "setIsLeader:", objc_msgSend(v4, "isLeader"));
  -[HMDCoordinationPrimaryMeshLogEvent setDidChangeLeader:](v31, "setDidChangeLeader:", 0);
  -[HMDCoordinationPrimaryMeshLogEvent setDidElectLeader:](v31, "setDidElectLeader:", 0);
  v32 = -[HMDPrimaryElectionCoordinationAddOn state](v6, "state");
  -[HMDCoordinationPrimaryMeshLogEvent setIsInSecondaryMesh:](v31, "setIsInSecondaryMesh:", (v32 < 6) & (0x30u >> v32));
  -[HMDCoordinationPrimaryMeshLogEvent setDidCurrentDeviceLeavePrimaryMesh:](v31, "setDidCurrentDeviceLeavePrimaryMesh:", v30);
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "submitLogEvent:", v31);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  HMDPrimaryElectionCoordinationAddOn *v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  void *v16;
  HMDPrimaryElectionCoordinationAddOn *v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  const __CFString *v21;
  void *v22;
  HMDPrimaryElectionCoordinationAddOn *v23;
  NSObject *v24;
  void *v25;
  unint64_t v26;
  const __CFString *v27;
  void *v28;
  HMDPrimaryElectionCoordinationAddOn *v29;
  NSObject *v30;
  void *v31;
  unint64_t v32;
  const __CFString *v33;
  void *v34;
  HMDPrimaryElectionCoordinationAddOn *v35;
  NSObject *v36;
  void *v37;
  unint64_t v38;
  const __CFString *v39;
  const char *v40;
  void *v41;
  HMDPrimaryElectionCoordinationAddOn *v42;
  NSObject *v43;
  void *v44;
  unint64_t v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  HMDPrimaryElectionCoordinationAddOn *v51;
  NSObject *v52;
  _BOOL4 v53;
  void *v54;
  unint64_t v55;
  const __CFString *v56;
  void *v57;
  HMDPrimaryElectionCoordinationAddOn *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  HMDPrimaryElectionCoordinationAddOn *v62;
  HMDLocalElectionMeshController *meshController;
  HMDPrimaryElectionCoordinationAddOn *v64;
  NSObject *v65;
  uint32_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  HMDPrimaryElectionCoordinationAddOn *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  HMDPrimaryElectionCoordinationAddOn *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  HMDPrimaryElectionCoordinationAddOn *v84;
  HMDLocalElectionMeshController *v85;
  void *v86;
  void *v87;
  int v88;
  uint64_t v89;
  HMDPrimaryElectionCoordinationAddOn *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  HMDPrimaryElectionCoordinationAddOn *v97;
  NSObject *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  OS_dispatch_queue *queue;
  void *v110;
  HMDPrimaryElectionCoordinationAddOn *v111;
  HMDLocalElectionMeshController *v112;
  HMDPrimaryElectionCoordinationAddOn *v113;
  id v114;
  void *v115;
  _QWORD v116[5];
  _BYTE buf[24];
  HMDPrimaryElectionCoordinationAddOn *v118;
  HMDPrimaryElectionCoordinationAddOn *v119;
  HMDPrimaryElectionCoordinationAddOn *v120;
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDPrimaryElectionCoordinationAddOn debounceTimer](self, "debounceTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HMDPrimaryElectionCoordinationAddOn state](v17, "state");
      if (v20 > 5)
        v21 = CFSTR("<unknown state>");
      else
        v21 = off_24E797E00[v20];
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Debounce expired, current state = %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    if ((-[HMDLocalElectionMeshController isLeader](v17->_meshController, "isLeader") & 1) != 0)
    {
      switch(-[HMDPrimaryElectionCoordinationAddOn state](v17, "state"))
      {
        case 0uLL:
          v64 = (HMDPrimaryElectionCoordinationAddOn *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F168]), "initWithQueue:", self->_queue);
          -[HMDPrimaryElectionCoordinationAddOn context](v17, "context");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "firstPrimaryResidentDiscoveryAttemptCompletionFuture");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v116[4] = v17;
          *(_QWORD *)buf = MEMORY[0x24BDAC760];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __101__HMDPrimaryElectionCoordinationAddOn__determineIfPrimaryMeshAfterWaitingForPrimaryResidentDiscovery__block_invoke;
          v118 = (HMDPrimaryElectionCoordinationAddOn *)&unk_24E7979F0;
          v119 = v17;
          v116[0] = MEMORY[0x24BDAC760];
          v116[1] = 3221225472;
          v116[2] = __101__HMDPrimaryElectionCoordinationAddOn__determineIfPrimaryMeshAfterWaitingForPrimaryResidentDiscovery__block_invoke_2;
          v116[3] = &unk_24E797A18;
          v69 = (id)objc_msgSend(v68, "inContext:then:orRecover:", v64, buf, v116);
          goto LABEL_75;
        case 1uLL:
        case 3uLL:
        case 5uLL:
          v34 = (void *)MEMORY[0x227676638]();
          v35 = v17;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            goto LABEL_68;
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[HMDPrimaryElectionCoordinationAddOn state](v35, "state");
          if (v38 > 5)
            v39 = CFSTR("<unknown state>");
          else
            v39 = off_24E797E00[v38];
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v39;
          v40 = "%{public}@Primary resident election or mesh change cannot be kicked off while in the state %{public}@";
          v65 = v36;
          v66 = 22;
          goto LABEL_67;
        case 2uLL:
          -[HMDPrimaryElectionCoordinationAddOn _selectPrimaryResidentWithReason:](v17, "_selectPrimaryResidentWithReason:", -[HMDPrimaryElectionCoordinationAddOn coordinationUpdateElectionTriggerReason](v17, "coordinationUpdateElectionTriggerReason"));
          goto LABEL_99;
        case 4uLL:
          dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
          -[HMDPrimaryElectionCoordinationAddOn _meshNodesToResidentDevices]((dispatch_queue_t *)v17);
          v64 = (HMDPrimaryElectionCoordinationAddOn *)objc_claimAutoreleasedReturnValue();
          -[HMDPrimaryElectionCoordinationAddOn context](v17, "context");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "primaryResidentDevice");
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          if (v64 && (-[HMDPrimaryElectionCoordinationAddOn hmf_isEmpty](v64, "hmf_isEmpty") & 1) == 0 && v67)
          {
            v71 = (void *)MEMORY[0x227676638]();
            v72 = v17;
            HMFGetOSLogHandle();
            v73 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v74;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v67;
              *(_WORD *)&buf[22] = 2114;
              v118 = v64;
              _os_log_impl(&dword_2218F0000, v73, OS_LOG_TYPE_INFO, "%{public}@Broadcasting the current primary %@ to nodes %{public}@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v71);
            -[HMDPrimaryElectionCoordinationAddOn sendNewPrimaryNotification:to:]((dispatch_queue_t *)v72, v67, v64);
          }
          goto LABEL_76;
        default:
          goto LABEL_99;
      }
    }
    v34 = (void *)MEMORY[0x227676638]();
    v35 = v17;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      goto LABEL_68;
    HMFGetLogIdentifier();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v37;
    v40 = "%{public}@Ignoring debounce timer fire because we're no longer leader";
    goto LABEL_45;
  }
  -[HMDPrimaryElectionCoordinationAddOn pingTimer](self, "pingTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[HMDPrimaryElectionCoordinationAddOn state](v23, "state");
      if (v26 > 5)
        v27 = CFSTR("<unknown state>");
      else
        v27 = off_24E797E00[v26];
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v27;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Ping timer fired, current state = %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (-[HMDPrimaryElectionCoordinationAddOn state](v23, "state") == 2
      || -[HMDPrimaryElectionCoordinationAddOn state](v23, "state") == 4)
    {
      if (!-[HMDLocalElectionMeshController isLeader](v23->_meshController, "isLeader"))
      {
        v57 = (void *)MEMORY[0x227676638]();
        v58 = v23;
        HMFGetOSLogHandle();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v60;
          _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_INFO, "%{public}@Ping timer expired and we haven't heard from the leader. Sending a ping command to the leader", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v57);
        -[HMDPrimaryElectionCoordinationAddOn pingTimer](v58, "pingTimer");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "suspend");

        -[HMDPrimaryElectionCoordinationAddOn pingTimer](v58, "pingTimer");
        v62 = (HMDPrimaryElectionCoordinationAddOn *)objc_claimAutoreleasedReturnValue();
        meshController = v23->_meshController;
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __68__HMDPrimaryElectionCoordinationAddOn__handlePingTimerExpiredAsNode__block_invoke;
        v118 = (HMDPrimaryElectionCoordinationAddOn *)&unk_24E79BCC8;
        v119 = v58;
        v120 = v62;
        v64 = v62;
        -[HMDLocalElectionMeshController sendPingCommandToLeaderWithCompletion:](meshController, "sendPingCommandToLeaderWithCompletion:", buf);

LABEL_77:
        goto LABEL_99;
      }
      -[HMDPrimaryElectionCoordinationAddOn context](v23, "context");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (!v47)
      {
LABEL_98:

        goto LABEL_99;
      }
      objc_msgSend(v47, "primaryResidentDevice");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)MEMORY[0x227676638]();
      v51 = v23;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = os_log_type_enabled(v52, OS_LOG_TYPE_INFO);
      if (v49)
      {
        if (v53)
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = -[HMDPrimaryElectionCoordinationAddOn state](v51, "state");
          v115 = v48;
          if (v55 > 5)
            v56 = CFSTR("<unknown state>");
          else
            v56 = off_24E797E00[v55];
          objc_msgSend(v49, "shortDescription");
          v83 = v49;
          v84 = (HMDPrimaryElectionCoordinationAddOn *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v54;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v56;
          *(_WORD *)&buf[22] = 2114;
          v118 = v84;
          _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_INFO, "%{public}@We are the leader in state: %{public}@. Sending periodic ping notification to followers with primary resident: %{public}@", buf, 0x20u);

          v49 = v83;
          v48 = v115;
        }

        objc_autoreleasePoolPop(v50);
        v85 = v23->_meshController;
        objc_msgSend(v49, "identifier");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDLocalElectionMeshController sendPingNotificationToFollowersWithPrimaryResident:](v85, "sendPingNotificationToFollowersWithPrimaryResident:", v86);

        if (-[HMDPrimaryElectionCoordinationAddOn state](v51, "state") != 2)
          goto LABEL_97;
        objc_msgSend(v48, "currentResidentDevice");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v49, "isEqual:", v87);

        if (!v88)
        {
          v93 = v49;
          v94 = v49;
          -[HMDPrimaryElectionCoordinationAddOn meshNodeForResident:]((uint64_t)v51, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = (void *)MEMORY[0x227676638]();
          v97 = v51;
          HMFGetOSLogHandle();
          v98 = objc_claimAutoreleasedReturnValue();
          v99 = v98;
          if (v95)
          {
            v114 = v94;
            if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v100;
              _os_log_impl(&dword_2218F0000, v99, OS_LOG_TYPE_INFO, "%{public}@We are the leader. Sending periodic ping request to the primary resident", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v96);
            -[HMDPrimaryElectionCoordinationAddOn meshLeaderToPrimaryResidentPingResponseTimer](v97, "meshLeaderToPrimaryResidentPingResponseTimer");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "suspend");

            -[HMDPrimaryElectionCoordinationAddOn dataSource](v97, "dataSource");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = v102;
            if (v102)
            {
              objc_msgSend(v102, "createPingResponseTimerWithInterval:options:", 0, 20.0);
              v104 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v104 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 20.0);
            }
            v107 = (void *)v104;

            -[HMDPrimaryElectionCoordinationAddOn setMeshLeaderToPrimaryResidentPingResponseTimer:](v97, "setMeshLeaderToPrimaryResidentPingResponseTimer:", v107);
            -[HMDPrimaryElectionCoordinationAddOn meshLeaderToPrimaryResidentPingResponseTimer](v97, "meshLeaderToPrimaryResidentPingResponseTimer");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "setDelegate:", v97);

            queue = self->_queue;
            -[HMDPrimaryElectionCoordinationAddOn meshLeaderToPrimaryResidentPingResponseTimer](v97, "meshLeaderToPrimaryResidentPingResponseTimer");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "setDelegateQueue:", queue);

            -[HMDPrimaryElectionCoordinationAddOn meshLeaderToPrimaryResidentPingResponseTimer](v97, "meshLeaderToPrimaryResidentPingResponseTimer");
            v111 = (HMDPrimaryElectionCoordinationAddOn *)objc_claimAutoreleasedReturnValue();
            -[HMDPrimaryElectionCoordinationAddOn resume](v111, "resume");
            v112 = v23->_meshController;
            *(_QWORD *)buf = MEMORY[0x24BDAC760];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __72__HMDPrimaryElectionCoordinationAddOn_sendPingRequestToPrimaryResident___block_invoke;
            v118 = (HMDPrimaryElectionCoordinationAddOn *)&unk_24E79BCC8;
            v119 = v111;
            v120 = v97;
            v113 = v111;
            -[HMDLocalElectionMeshController sendPingRequestToNode:withCompletion:](v112, "sendPingRequestToNode:withCompletion:", v95, buf);

            v94 = v114;
          }
          else
          {
            if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "shortDescription");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v105;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v106;
              _os_log_impl(&dword_2218F0000, v99, OS_LOG_TYPE_ERROR, "%{public}@Not sending the ping request. Unable to find the mesh node for primary resident %{public}@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v96);
          }

          v49 = v93;
          goto LABEL_97;
        }
        v89 = MEMORY[0x227676638]();
        v90 = v51;
        HMFGetOSLogHandle();
        v91 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v92;
          _os_log_impl(&dword_2218F0000, v91, OS_LOG_TYPE_INFO, "%{public}@Not sending the ping request. We are the primary resident.", buf, 0xCu);

        }
        v76 = (void *)v89;
      }
      else
      {
        if (v53)
        {
          HMFGetLogIdentifier();
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v75;
          _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_INFO, "%{public}@Not sending the periodic ping request to the primary and notification to the followers. Primary resident is nil.", buf, 0xCu);

        }
        v76 = v50;
      }
      objc_autoreleasePoolPop(v76);
LABEL_97:

      goto LABEL_98;
    }
    v34 = (void *)MEMORY[0x227676638]();
    v35 = v23;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
LABEL_68:

      objc_autoreleasePoolPop(v34);
      goto LABEL_99;
    }
    HMFGetLogIdentifier();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v37;
    v40 = "%{public}@Ignoring ping timer since we're not idle";
LABEL_45:
    v65 = v36;
    v66 = 12;
LABEL_67:
    _os_log_impl(&dword_2218F0000, v65, OS_LOG_TYPE_INFO, v40, buf, v66);

    goto LABEL_68;
  }
  -[HMDPrimaryElectionCoordinationAddOn secondaryMeshTimer](self, "secondaryMeshTimer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[HMDPrimaryElectionCoordinationAddOn state](v29, "state");
      if (v32 > 5)
        v33 = CFSTR("<unknown state>");
      else
        v33 = off_24E797E00[v32];
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v33;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Secondary mesh timer fired, current state = %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    if (-[HMDPrimaryElectionCoordinationAddOn state](v29, "state") == 4
      && -[HMDLocalElectionMeshController isLeader](v29->_meshController, "isLeader"))
    {
      -[HMDPrimaryElectionCoordinationAddOn _pingPrimaryResident]((dispatch_queue_t *)v29);
    }
  }
  else
  {
    -[HMDPrimaryElectionCoordinationAddOn meshLeaderToPrimaryResidentPingResponseTimer](self, "meshLeaderToPrimaryResidentPingResponseTimer");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v4)
    {
      v41 = (void *)MEMORY[0x227676638]();
      v42 = self;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = -[HMDPrimaryElectionCoordinationAddOn state](v42, "state");
        if (v45 > 5)
          v46 = CFSTR("<unknown state>");
        else
          v46 = off_24E797E00[v45];
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v46;
        _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Timer fired and the primary resident did not respond to ping request from the leader, current state = %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v41);
      -[HMDPrimaryElectionCoordinationAddOn _handlePrimaryResidentPingFailed]((uint64_t)v42);
      -[HMDPrimaryElectionCoordinationAddOn setMeshLeaderToPrimaryResidentPingResponseTimer:](v42, "setMeshLeaderToPrimaryResidentPingResponseTimer:", 0);
    }
    else
    {
      -[HMDPrimaryElectionCoordinationAddOn activeNodesUpdateDebounceTimer](self, "activeNodesUpdateDebounceTimer");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 == v4)
      {
        v10 = (void *)MEMORY[0x227676638]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[HMDPrimaryElectionCoordinationAddOn state](v11, "state");
          if (v14 > 5)
            v15 = CFSTR("<unknown state>");
          else
            v15 = off_24E797E00[v14];
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v15;
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Active nodes update timer fired, current state = %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        -[HMDPrimaryElectionCoordinationAddOn context](v11, "context");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "currentResidentDevice");
        v64 = (HMDPrimaryElectionCoordinationAddOn *)objc_claimAutoreleasedReturnValue();

        if (v64)
        {
          -[HMDPrimaryElectionCoordinationAddOn createMissingResidentDevicesFromMeshNodes:](v11, v11->_meshController);
          -[HMDPrimaryElectionCoordinationAddOn _meshNodesToResidentDevices]((dispatch_queue_t *)v11);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setByAddingObject:", v64);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = (void *)MEMORY[0x227676638]();
          v79 = v11;
          HMFGetOSLogHandle();
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v81;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v68;
            _os_log_impl(&dword_2218F0000, v80, OS_LOG_TYPE_DEBUG, "%{public}@Notifying delegate of active mesh nodes: %{public}@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v78);
          -[HMDPrimaryElectionCoordinationAddOn delegate](v79, "delegate");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "primaryElectionAddOn:didUpdateActiveNodes:", v79, v68);

LABEL_75:
LABEL_76:

        }
        goto LABEL_77;
      }
    }
  }
LABEL_99:

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDPrimaryElectionCoordinationAddOn context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dumpState
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__234105;
  v10 = __Block_byref_object_dispose__234106;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__HMDPrimaryElectionCoordinationAddOn_dumpState__block_invoke;
  v5[3] = &unk_24E79B698;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (HMDPrimaryResidentElectionAddOnDelegate)delegate
{
  return (HMDPrimaryResidentElectionAddOnDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMFTimer)debounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDebounceTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (HMFTimer)activeNodesUpdateDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setActiveNodesUpdateDebounceTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (HMFTimer)pingTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPingTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unint64_t)residentCountDuringLastElection
{
  return self->_residentCountDuringLastElection;
}

- (void)setResidentCountDuringLastElection:(unint64_t)a3
{
  self->_residentCountDuringLastElection = a3;
}

- (HMDResidentDeviceManagerContext)context
{
  return (HMDResidentDeviceManagerContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (HMDPrimaryElectionCoordinationAddOnDataSource)dataSource
{
  return (HMDPrimaryElectionCoordinationAddOnDataSource *)objc_getProperty(self, a2, 88, 1);
}

- (HMFTimer)secondaryMeshTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSecondaryMeshTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (HMFTimer)meshLeaderToPrimaryResidentPingResponseTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMeshLeaderToPrimaryResidentPingResponseTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (HMDPrimaryElectionFindPrimaryMeshOperation)findPrimaryMeshOperation
{
  return (HMDPrimaryElectionFindPrimaryMeshOperation *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFindPrimaryMeshOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (HMFFuture)findPrimaryMeshFuture
{
  return (HMFFuture *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFindPrimaryMeshFuture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (HMDRemoteDeviceMonitor)remoteDeviceMonitor
{
  return (HMDRemoteDeviceMonitor *)objc_getProperty(self, a2, 128, 1);
}

- (HMDLocalElectionMeshNode)lastKnownLeaderNode
{
  return (HMDLocalElectionMeshNode *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastKnownLeaderNode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (int64_t)inPessimisticSecondaryMesh
{
  return self->_inPessimisticSecondaryMesh;
}

- (void)setInPessimisticSecondaryMesh:(int64_t)a3
{
  self->_inPessimisticSecondaryMesh = a3;
}

- (unint64_t)coordinationUpdateElectionTriggerReason
{
  return self->_coordinationUpdateElectionTriggerReason;
}

- (void)setCoordinationUpdateElectionTriggerReason:(unint64_t)a3
{
  self->_coordinationUpdateElectionTriggerReason = a3;
}

- (__HMDPrimaryElectionCandidate)selectedPrimaryResidentCandidate
{
  return (__HMDPrimaryElectionCandidate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSelectedPrimaryResidentCandidate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSSet)lastEvaluatedMeshNodes
{
  return (NSSet *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLastEvaluatedMeshNodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (BOOL)electionGotAborted
{
  return self->_electionGotAborted;
}

- (void)setElectionGotAborted:(BOOL)a3
{
  self->_electionGotAborted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEvaluatedMeshNodes, 0);
  objc_storeStrong((id *)&self->_selectedPrimaryResidentCandidate, 0);
  objc_storeStrong((id *)&self->_lastKnownLeaderNode, 0);
  objc_storeStrong((id *)&self->_asyncContext, 0);
  objc_storeStrong((id *)&self->_remoteDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_findPrimaryMeshFuture, 0);
  objc_storeStrong((id *)&self->_findPrimaryMeshOperation, 0);
  objc_storeStrong((id *)&self->_meshLeaderToPrimaryResidentPingResponseTimer, 0);
  objc_storeStrong((id *)&self->_secondaryMeshTimer, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_pingTimer, 0);
  objc_storeStrong((id *)&self->_activeNodesUpdateDebounceTimer, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_meshController, 0);
}

void __48__HMDPrimaryElectionCoordinationAddOn_dumpState__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v17[0] = CFSTR("Leader");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "leaderNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("<no leader>");
  if (v3)
    v5 = (const __CFString *)v3;
  v18[0] = v5;
  v17[1] = CFSTR("Nodes");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "meshNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("<no nodes>");
  if (v7)
    v9 = (const __CFString *)v7;
  v18[1] = v9;
  v17[2] = CFSTR("Missing Residents");
  -[HMDPrimaryElectionCoordinationAddOn residentDevicesNotFoundInMesh](*(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_map:", &__block_literal_global_104_234112);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  v17[3] = CFSTR("State");
  v12 = objc_msgSend(*(id *)(a1 + 32), "state");
  if (v12 > 5)
    v13 = CFSTR("<unknown state>");
  else
    v13 = off_24E797E00[v12];
  v18[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

- (id)residentDevicesNotFoundInMesh
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  if (!a1)
    return 0;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  objc_msgSend((id)a1, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableResidentDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v2, "currentResidentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

  objc_msgSend(*(id *)(a1 + 8), "meshNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__HMDPrimaryElectionCoordinationAddOn_residentDevicesNotFoundInMesh__block_invoke;
  v13[3] = &unk_24E797A40;
  v14 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_map:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v7);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v8);
  objc_msgSend(v9, "hmf_removedObjectsFromSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __48__HMDPrimaryElectionCoordinationAddOn_dumpState__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

uint64_t __68__HMDPrimaryElectionCoordinationAddOn_residentDevicesNotFoundInMesh__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hmd_residentDeviceForMeshNode:", a2);
}

- (void)_pingPrimaryResident
{
  void *v2;
  void *v3;
  dispatch_queue_t *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SEL v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  dispatch_queue_t *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  dispatch_queue_t *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    -[dispatch_queue_t context](a1, "context");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      if (-[dispatch_queue_t inPessimisticSecondaryMesh](a1, "inPessimisticSecondaryMesh") == 1)
      {
        v3 = (void *)MEMORY[0x227676638]();
        v4 = a1;
        HMFGetOSLogHandle();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v30 = v6;
          _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Pessimistic secondary mesh state pinging over IDS", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v3);
        -[dispatch_queue_t setInPessimisticSecondaryMesh:](v4, "setInPessimisticSecondaryMesh:", 2);
      }
      -[dispatch_queue_t setState:](a1, "setState:", 5);
      objc_msgSend(v2, "primaryResidentDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[dispatch_queue_t remoteDeviceMonitor](a1, "remoteDeviceMonitor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isReachable") & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDPrimaryElectionCoordinationAddOn _retrievePrimaryMeshInformationWithContext:otherResidents:](a1, v2, v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_initWeak((id *)buf, a1);
          objc_initWeak(&location, v2);
          v12 = objc_getProperty(a1, v11, 136, 1);
          v13 = MEMORY[0x24BDAC760];
          v25[0] = MEMORY[0x24BDAC760];
          v25[1] = 3221225472;
          v25[2] = __59__HMDPrimaryElectionCoordinationAddOn__pingPrimaryResident__block_invoke;
          v25[3] = &unk_24E797AF8;
          objc_copyWeak(&v26, (id *)buf);
          objc_copyWeak(&v27, &location);
          v23[0] = v13;
          v23[1] = 3221225472;
          v23[2] = __59__HMDPrimaryElectionCoordinationAddOn__pingPrimaryResident__block_invoke_51;
          v23[3] = &unk_24E797B20;
          objc_copyWeak(&v24, (id *)buf);
          v14 = (id)objc_msgSend(v10, "inContext:then:orRecover:", v12, v25, v23);

          objc_destroyWeak(&v24);
          objc_destroyWeak(&v27);
          objc_destroyWeak(&v26);
          objc_destroyWeak(&location);
          objc_destroyWeak((id *)buf);

        }
        else
        {
          v19 = (void *)MEMORY[0x227676638]();
          v20 = a1;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v30 = v22;
            _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@We're not online, restarting ping timer", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v19);
          -[dispatch_queue_t setState:](v20, "setState:", 4);
          -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer](v20);
        }

      }
      else
      {
        v15 = (void *)MEMORY[0x227676638]();
        v16 = a1;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v30 = v18;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@No current primary resident, doing meta mesh election", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v15);
        -[dispatch_queue_t setState:](v16, "setState:", 2);
        -[HMDPrimaryElectionCoordinationAddOn _doMetaMeshElection](v16);
      }

    }
  }
}

- (uint64_t)_handlePrimaryResidentPingFailed
{
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = (void *)result;
    result = objc_msgSend(*(id *)(result + 8), "isLeader");
    if ((_DWORD)result)
    {
      result = objc_msgSend(v1, "state");
      if (result == 2)
      {
        v2 = (void *)MEMORY[0x227676638]();
        v3 = v1;
        HMFGetOSLogHandle();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = 138543362;
          v7 = v5;
          _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@The ping request to the primary resident failed. Starting an election", (uint8_t *)&v6, 0xCu);

        }
        objc_autoreleasePoolPop(v2);
        return objc_msgSend(v3, "_selectPrimaryResidentWithReason:", 0);
      }
    }
  }
  return result;
}

- (void)createMissingResidentDevicesFromMeshNodes:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(a1, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "availableResidentDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "idsAccountDevices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "devices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "meshNodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __81__HMDPrimaryElectionCoordinationAddOn_createMissingResidentDevicesFromMeshNodes___block_invoke;
    v21[3] = &unk_24E797B70;
    v14 = v5;
    v22 = v14;
    v15 = v8;
    v23 = v15;
    v24 = a1;
    v18 = v4;
    v25 = v18;
    v16 = v11;
    v26 = v16;
    objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);

    objc_msgSend(a1, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v19[0] = v13;
      v19[1] = 3221225472;
      v19[2] = __81__HMDPrimaryElectionCoordinationAddOn_createMissingResidentDevicesFromMeshNodes___block_invoke_57;
      v19[3] = &unk_24E797B98;
      v19[4] = a1;
      v20 = v17;
      objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v19, v18);

    }
  }
}

- (id)_meshNodesToResidentDevices
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v1 = (id *)a1;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    objc_msgSend(v1, "context");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "availableResidentDevices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1[1], "meshNodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66__HMDPrimaryElectionCoordinationAddOn__meshNodesToResidentDevices__block_invoke;
    v8[3] = &unk_24E797A40;
    v9 = v3;
    v5 = v3;
    objc_msgSend(v4, "na_map:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

uint64_t __66__HMDPrimaryElectionCoordinationAddOn__meshNodesToResidentDevices__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hmd_residentDeviceForMeshNode:", a2);
}

void __81__HMDPrimaryElectionCoordinationAddOn_createMissingResidentDevicesFromMeshNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDResidentDevice *v4;
  void *v5;
  id v6;
  void *v7;
  HMDResidentDevice *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "hmd_residentDeviceForMeshNode:", v3);
  v4 = (HMDResidentDevice *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = *(void **)(a1 + 40);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __81__HMDPrimaryElectionCoordinationAddOn_createMissingResidentDevicesFromMeshNodes___block_invoke_2;
    v14[3] = &unk_24E797B48;
    v6 = v3;
    v15 = v6;
    objc_msgSend(v5, "na_firstObjectPassingTest:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = [HMDResidentDevice alloc];
      objc_msgSend(*(id *)(a1 + 56), "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[HMDResidentDevice initWithDevice:home:](v8, "initWithDevice:home:", v7, v9);

      objc_msgSend(*(id *)(a1 + 64), "addObject:", v4);
    }
    else
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v13;
        v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find device matching node %@, skipping", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      v4 = 0;
    }

  }
}

void __81__HMDPrimaryElectionCoordinationAddOn_createMissingResidentDevicesFromMeshNodes___block_invoke_57(uint64_t a1, void *a2)
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

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating new resident %@ from mesh node", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "primaryElectionAddOn:didUpdateResidentDevice:", *(_QWORD *)(a1 + 32), v3);

}

uint64_t __81__HMDPrimaryElectionCoordinationAddOn_createMissingResidentDevicesFromMeshNodes___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "idsIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "idsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hmf_isEqualToUUIDString:", v4);

  return v5;
}

- (void)_doMetaMeshElection
{
  void *v2;
  void *v3;
  void *v4;
  SEL v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id from;
  id location;

  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    -[dispatch_queue_t setState:](a1, "setState:", 5);
    -[dispatch_queue_t context](a1, "context");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPrimaryElectionCoordinationAddOn residentDevicesNotFoundInMesh]((uint64_t)a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPrimaryElectionCoordinationAddOn _retrievePrimaryMeshInformationWithContext:otherResidents:](a1, v2, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, a1);
    objc_initWeak(&from, v2);
    v6 = objc_getProperty(a1, v5, 136, 1);
    v7 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __58__HMDPrimaryElectionCoordinationAddOn__doMetaMeshElection__block_invoke;
    v11[3] = &unk_24E797AF8;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, &from);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __58__HMDPrimaryElectionCoordinationAddOn__doMetaMeshElection__block_invoke_50;
    v9[3] = &unk_24E797B20;
    objc_copyWeak(&v10, &location);
    v8 = (id)objc_msgSend(v4, "inContext:then:orRecover:", v6, v11, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

- (void)_startSecondaryMeshTimer
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  dispatch_queue_t *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  dispatch_queue_t *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  dispatch_queue_t *v18;
  void *v19;
  dispatch_queue_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return;
  dispatch_assert_queue_V2(a1[2]);
  -[dispatch_queue_t secondaryMeshTimer](a1, "secondaryMeshTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting secondary mesh timer", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[dispatch_queue_t dataSource](v11, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "createSecondaryMeshTimerWithInterval:options:", 9, 300.0);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 9, 300.0);
    }
    v19 = (void *)v16;

    -[dispatch_queue_t setSecondaryMeshTimer:](v11, "setSecondaryMeshTimer:", v19);
    v20 = a1[2];
    -[dispatch_queue_t secondaryMeshTimer](v11, "secondaryMeshTimer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegateQueue:", v20);

    -[dispatch_queue_t secondaryMeshTimer](v11, "secondaryMeshTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelegate:", v11);

    v18 = v11;
    goto LABEL_16;
  }
  -[dispatch_queue_t secondaryMeshTimer](a1, "secondaryMeshTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRunning");

  v5 = (void *)MEMORY[0x227676638]();
  v6 = a1;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (!v4)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v17;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Resuming secondary mesh timer", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v18 = v6;
LABEL_16:
    -[dispatch_queue_t secondaryMeshTimer](v18, "secondaryMeshTimer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "resume");

    return;
  }
  if (v8)
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543362;
    v25 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Secondary mesh timer is already running", (uint8_t *)&v24, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
}

- (id)_retrievePrimaryMeshInformationWithContext:(void *)a3 otherResidents:
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  HMDPrimaryElectionFindPrimaryMeshOperation *v11;
  HMDPrimaryElectionFindPrimaryMeshOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SEL v17;
  id v18;
  HMDPrimaryElectionFindPrimaryMeshOperation *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  HMDPrimaryElectionFindPrimaryMeshOperation *v26;
  id v27;
  id v28;
  id from;
  id location;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(a1[2]);
  v7 = v5;
  v8 = v6;
  -[dispatch_queue_t dataSource](a1, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "createFindPrimaryMeshOperationWithContext:otherResidents:", v7, v8);
    v11 = (HMDPrimaryElectionFindPrimaryMeshOperation *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = -[HMDPrimaryElectionFindPrimaryMeshOperation initWithContext:otherResidents:]([HMDPrimaryElectionFindPrimaryMeshOperation alloc], "initWithContext:otherResidents:", v7, v8);
  }
  v12 = v11;

  -[dispatch_queue_t setFindPrimaryMeshOperation:](a1, "setFindPrimaryMeshOperation:", v12);
  v13 = (void *)MEMORY[0x24BE3F180];
  -[dispatch_queue_t findPrimaryMeshOperation](a1, "findPrimaryMeshOperation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "futureForOperation:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[dispatch_queue_t setFindPrimaryMeshFuture:](a1, "setFindPrimaryMeshFuture:", v15);

  objc_initWeak(&location, a1);
  objc_initWeak(&from, v7);
  -[dispatch_queue_t findPrimaryMeshFuture](a1, "findPrimaryMeshFuture");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_getProperty(a1, v17, 136, 1);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __97__HMDPrimaryElectionCoordinationAddOn__retrievePrimaryMeshInformationWithContext_otherResidents___block_invoke;
  v25[3] = &unk_24E797BC0;
  objc_copyWeak(&v27, &location);
  objc_copyWeak(&v28, &from);
  v19 = v12;
  v26 = v19;
  objc_msgSend(v16, "inContext:then:", v18, v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE3F268], "defaultScheduler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[dispatch_queue_t findPrimaryMeshOperation](a1, "findPrimaryMeshOperation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v21, "performOperation:", v22);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v20;
}

uint64_t __59__HMDPrimaryElectionCoordinationAddOn__pingPrimaryResident__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  _QWORD *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  void *v31;
  void *v32;
  char v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (WeakRetained
    && v5
    && -[HMDPrimaryElectionCoordinationAddOn _expectState:action:](WeakRetained, 5, CFSTR("pinging primary")))
  {
    if (objc_msgSend(v3, "count"))
    {
      v7 = WeakRetained[1];
      objc_msgSend(v6, "home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDPrimaryElectionMeshInformation meshInformationWithMeshController:home:](HMDPrimaryElectionMeshInformation, "meshInformationWithMeshController:home:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend(WeakRetained, "setState:", 4);
        -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer]((dispatch_queue_t *)WeakRetained);
LABEL_29:

        goto LABEL_30;
      }
      v10 = (void *)MEMORY[0x227676638]();
      v11 = WeakRetained;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v13;
        v44 = 2112;
        v45 = v9;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Our mesh info: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v3, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v9, "reachableIPAccessories");
      v16 = objc_msgSend(v14, "reachableIPAccessories");
      if (v15 && !v16)
      {
        v17 = (void *)MEMORY[0x227676638]();
        v18 = v11;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v9, "reachableIPAccessories");
          *(_DWORD *)buf = 138543618;
          v43 = v20;
          v44 = 1024;
          LODWORD(v45) = v21;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@The current primary mesh has 0 reachable IP accessories and we have %d, taking over the primary mesh", buf, 0x12u);

        }
LABEL_27:

        objc_autoreleasePoolPop(v17);
        objc_msgSend(v18, "setState:", 2);
        objc_msgSend(v18, "_selectPrimaryResidentWithReason:", 2);
        goto LABEL_28;
      }
      if (v15 || !v16)
      {
        objc_msgSend(v14, "primary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "responder");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v31, "isEqual:", v32);

        v17 = (void *)MEMORY[0x227676638]();
        v18 = v11;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        v34 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
        if ((v33 & 1) == 0)
        {
          if (v34)
          {
            HMFGetLogIdentifier();
            v41 = v17;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "primary");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "identifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "primary");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "name");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v43 = v35;
            v44 = 2114;
            v45 = v36;
            v46 = 2112;
            v47 = v37;
            _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@The current primary thinks the primary is another resident %{public}@ (%@), taking over the primary mesh", buf, 0x20u);

            v17 = v41;
          }
          goto LABEL_27;
        }
        if (v34)
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v26;
          v28 = "%{public}@The current primary responded and we are not better than it, staying in secondary mesh and res"
                "tarting ping timer";
          v29 = v19;
          v30 = 12;
          goto LABEL_23;
        }
      }
      else
      {
        v17 = (void *)MEMORY[0x227676638]();
        v18 = v11;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v14, "reachableIPAccessories");
          *(_DWORD *)buf = 138543618;
          v43 = v26;
          v44 = 1024;
          LODWORD(v45) = v27;
          v28 = "%{public}@The current primary has reachable %d IP accessories (we have 0), staying in secondary mesh and"
                " restarting ping timer";
          v29 = v19;
          v30 = 18;
LABEL_23:
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, v28, buf, v30);

        }
      }

      objc_autoreleasePoolPop(v17);
      objc_msgSend(v18, "setState:", 4);
      -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer]((dispatch_queue_t *)v18);
LABEL_28:

      goto LABEL_29;
    }
    v22 = (void *)MEMORY[0x227676638]();
    v23 = WeakRetained;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Primary resident didn't respond, doing meta mesh election", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(v23, "setState:", 2);
    -[HMDPrimaryElectionCoordinationAddOn _doMetaMeshElection]((dispatch_queue_t *)v23);
  }
LABEL_30:

  return 1;
}

uint64_t __59__HMDPrimaryElectionCoordinationAddOn__pingPrimaryResident__block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (!objc_msgSend(v3, "isHMError") || objc_msgSend(v3, "code") != 23))
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Ping operation completed with error: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "setState:", 4);
    -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer]((dispatch_queue_t *)v6);
  }

  return 1;
}

- (uint64_t)_expectState:(void *)a3 action:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  const __CFString *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!a1)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  v6 = objc_msgSend(a1, "state");
  if (v6 != a2)
  {
    v8 = v6;
    v9 = (void *)MEMORY[0x227676638]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = off_24E797E00[a2];
      if (v8 > 5)
        v15 = CFSTR("<unknown state>");
      else
        v15 = off_24E797E00[v8];
      v17 = 138544130;
      v18 = v12;
      v19 = 2114;
      v20 = v14;
      v21 = 2114;
      v22 = v15;
      v23 = 2114;
      v24 = v5;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Expecting state %{public}@, got %{public}@ - action: %{public}@", (uint8_t *)&v17, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
    goto LABEL_10;
  }
  v7 = 1;
LABEL_11:

  return v7;
}

uint64_t __97__HMDPrimaryElectionCoordinationAddOn__retrievePrimaryMeshInformationWithContext_otherResidents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained
    && (objc_msgSend(WeakRetained, "findPrimaryMeshOperation"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = *(void **)(a1 + 32),
        v6,
        v6 == v7))
  {
    objc_msgSend(WeakRetained, "setFindPrimaryMeshOperation:", 0);
    v18 = objc_msgSend(WeakRetained, "setFindPrimaryMeshFuture:", 0);
    if (v5)
    {
      objc_msgSend(v3, "results");
      objc_claimAutoreleasedReturnValue();
      v16 = 1;
      goto LABEL_10;
    }
    v8 = (void *)MEMORY[0x227676638](v18);
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v11;
      v12 = "%{public}@No context, bailing";
      goto LABEL_5;
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v11;
      v12 = "%{public}@Ignoring stale find primary mesh operation";
LABEL_5:
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v19, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  v16 = 2;
LABEL_10:

  return v16;
}

uint64_t __58__HMDPrimaryElectionCoordinationAddOn__doMetaMeshElection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  int v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  dispatch_queue_t *v34;
  NSObject *v35;
  void *v36;
  int v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  _QWORD v42[4];
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (WeakRetained
    && v5
    && -[HMDPrimaryElectionCoordinationAddOn _expectState:action:](WeakRetained, 5, CFSTR("pinging primary")))
  {
    objc_msgSend(WeakRetained, "remoteDeviceMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isReachable");

    if ((v8 & 1) != 0)
    {
      if (objc_msgSend(v3, "count"))
      {
        objc_msgSend(v6, "primaryResidentDevice");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          v42[0] = MEMORY[0x24BDAC760];
          v42[1] = 3221225472;
          v42[2] = __58__HMDPrimaryElectionCoordinationAddOn__doMetaMeshElection__block_invoke_46;
          v42[3] = &unk_24E797A90;
          v43 = v9;
          objc_msgSend(v3, "na_firstObjectPassingTest:", v42);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v11 = 0;
        }
        v20 = WeakRetained[1];
        objc_msgSend(v6, "home");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDPrimaryElectionMeshInformation meshInformationWithMeshController:home:](HMDPrimaryElectionMeshInformation, "meshInformationWithMeshController:home:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          objc_msgSend(WeakRetained, "setState:", 4);
          v34 = (dispatch_queue_t *)WeakRetained;
LABEL_32:
          -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer](v34);
LABEL_33:

          goto LABEL_34;
        }
        v23 = objc_msgSend(v3, "na_any:", &__block_literal_global_234180);
        if (objc_msgSend(v22, "reachableIPAccessories"))
        {
          v24 = objc_msgSend(v11, "reachableIPAccessories");
          v25 = (void *)MEMORY[0x227676638]();
          v26 = WeakRetained;
          HMFGetOSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v24)
          {
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v11, "reachableIPAccessories");
              *(_DWORD *)buf = 138543618;
              v45 = v29;
              v46 = 1024;
              v47 = v30;
              v31 = "%{public}@The current primary responded and has %d accessories, staying secondary";
              v32 = v28;
              v33 = 18;
LABEL_30:
              _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, v31, buf, v33);

            }
LABEL_31:

            objc_autoreleasePoolPop(v25);
            objc_msgSend(v26, "setState:", 4);
            v34 = (dispatch_queue_t *)v26;
            goto LABEL_32;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v22, "reachableIPAccessories");
            *(_DWORD *)buf = 138543618;
            v45 = v36;
            v46 = 1024;
            v47 = v37;
            v38 = "%{public}@We have %d reachable accessories trying to become primary";
            v39 = v28;
            v40 = 18;
LABEL_37:
            _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_DEFAULT, v38, buf, v40);

            goto LABEL_38;
          }
          goto LABEL_38;
        }
        v25 = (void *)MEMORY[0x227676638]();
        v26 = WeakRetained;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        v28 = v35;
        if (v11)
        {
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            goto LABEL_31;
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v45 = v29;
          v31 = "%{public}@The primary responded, staying secondary";
        }
        else
        {
          if ((v23 & 1) == 0)
          {
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v45 = v36;
              v38 = "%{public}@Nobody has reachable IP accessories, becoming primary";
              v39 = v28;
              v40 = 12;
              goto LABEL_37;
            }
LABEL_38:

            objc_autoreleasePoolPop(v25);
            objc_msgSend(v26, "setState:", 2);
            objc_msgSend(v26, "_selectPrimaryResidentWithReason:", 2);
            goto LABEL_33;
          }
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            goto LABEL_31;
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v45 = v29;
          v31 = "%{public}@Another mesh has accessories and we don't, staying secondary";
        }
        v32 = v28;
        v33 = 12;
        goto LABEL_30;
      }
      v16 = (void *)MEMORY[0x227676638]();
      v17 = WeakRetained;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v45 = v19;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@No other residents responded to us, becoming primary", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(v17, "setState:", 2);
      objc_msgSend(v17, "_selectPrimaryResidentWithReason:", 2);
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = WeakRetained;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v45 = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@We're not online, going to secondary state and resuming pinging", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v13, "setState:", 4);
      -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer]((dispatch_queue_t *)v13);
    }
  }
LABEL_34:

  return 1;
}

uint64_t __58__HMDPrimaryElectionCoordinationAddOn__doMetaMeshElection__block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (!objc_msgSend(v3, "isHMError") || objc_msgSend(v3, "code") != 23))
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Ping operation completed with error: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "setState:", 4);
    -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer]((dispatch_queue_t *)v6);
  }

  return 1;
}

uint64_t __58__HMDPrimaryElectionCoordinationAddOn__doMetaMeshElection__block_invoke_46(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "responder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

BOOL __58__HMDPrimaryElectionCoordinationAddOn__doMetaMeshElection__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reachableIPAccessories") != 0;
}

void __68__HMDPrimaryElectionCoordinationAddOn__handlePingTimerExpiredAsNode__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = v8;
    v31 = 2112;
    v32 = v3;
    v9 = "%{public}@Ping command to leader failed with error: %@.";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543362;
    v30 = v8;
    v9 = "%{public}@Ping command to leader succeeded";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
  }
  _os_log_impl(&dword_2218F0000, v10, v11, v9, (uint8_t *)&v29, v12);

LABEL_7:
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "pingTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 != *(void **)(a1 + 40))
  {

LABEL_13:
    v25 = (void *)MEMORY[0x227676638](v15, v16, v17, v18);
    v26 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Not resuming ping timer", (uint8_t *)&v29, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    goto LABEL_16;
  }
  v19 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isProcessing");

  if (!v19)
    goto LABEL_13;
  v20 = (void *)MEMORY[0x227676638](v15, v16, v17, v18);
  v21 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543362;
    v30 = v23;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Resuming ping timer", (uint8_t *)&v29, 0xCu);

  }
  objc_autoreleasePoolPop(v20);
  objc_msgSend(*(id *)(a1 + 32), "pingTimer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "resume");

LABEL_16:
}

- (id)meshNodeForResident:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    objc_msgSend(v3, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 8), "leaderNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "idsIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "hmf_isEqualToUUIDString:", v7);

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 8), "leaderNode");
      a1 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "device");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "idsIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 8), "meshNodes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __59__HMDPrimaryElectionCoordinationAddOn_meshNodeForResident___block_invoke;
      v14[3] = &unk_24E797A68;
      v15 = v10;
      v12 = v10;
      objc_msgSend(v11, "na_firstObjectPassingTest:", v14);
      a1 = objc_claimAutoreleasedReturnValue();

    }
  }

  return (id)a1;
}

void __72__HMDPrimaryElectionCoordinationAddOn_sendPingRequestToPrimaryResident___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "meshLeaderToPrimaryResidentPingResponseTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "meshLeaderToPrimaryResidentPingResponseTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "suspend");

    v11 = objc_msgSend(*(id *)(a1 + 40), "setMeshLeaderToPrimaryResidentPingResponseTimer:", 0);
    if (v3)
    {
      v12 = (void *)MEMORY[0x227676638](v11);
      v13 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v15;
        v18 = 2112;
        v19 = v3;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Ping request to the primary resident failed with error: %@.", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      -[HMDPrimaryElectionCoordinationAddOn _handlePrimaryResidentPingFailed](*(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v9;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Ignoring the error response to the ping request from the primary resident since the response timer has changed. Error: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

uint64_t __59__HMDPrimaryElectionCoordinationAddOn_meshNodeForResident___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "idsIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hmf_isEqualToUUIDString:", v3);

  return v4;
}

- (void)sendNewPrimaryNotification:(void *)a3 to:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  HMDRemoteDeviceMessageDestination *v12;
  void *v13;
  void *v14;
  HMDRemoteDeviceMessageDestination *v15;
  HMDRemoteMessage *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDRemoteMessage *v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  const __CFString *v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(a1[2]);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        v12 = [HMDRemoteDeviceMessageDestination alloc];
        -[dispatch_queue_t messageTargetUUID](a1, "messageTargetUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v12, "initWithTarget:device:", v13, v14);

        v16 = [HMDRemoteMessage alloc];
        v28 = CFSTR("uuid");
        objc_msgSend(v5, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "UUIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:](v16, "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:", CFSTR("mesh.currentPrimaryUpdate"), 17, v15, v19, 3, 1, 0.0, -[dispatch_queue_t messageTransportRestriction](a1, "messageTransportRestriction"));

        -[dispatch_queue_t context](a1, "context");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "messageDispatcher");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sendMessage:", v20);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v8);
  }

}

uint64_t __101__HMDPrimaryElectionCoordinationAddOn__determineIfPrimaryMeshAfterWaitingForPrimaryResidentDiscovery__block_invoke(uint64_t a1)
{
  -[HMDPrimaryElectionCoordinationAddOn _determineIfPrimaryMesh](*(dispatch_queue_t **)(a1 + 32));
  return 1;
}

uint64_t __101__HMDPrimaryElectionCoordinationAddOn__determineIfPrimaryMeshAfterWaitingForPrimaryResidentDiscovery__block_invoke_2(uint64_t a1)
{
  -[HMDPrimaryElectionCoordinationAddOn _determineIfPrimaryMesh](*(dispatch_queue_t **)(a1 + 32));
  return 1;
}

- (void)_determineIfPrimaryMesh
{
  void *v2;
  dispatch_queue_t *v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  id *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return;
  dispatch_assert_queue_V2(a1[2]);
  if (!-[dispatch_queue_t state](a1, "state"))
  {
    v8 = (void *)MEMORY[0x227676638](-[dispatch_queue_t setState:](a1, "setState:", 1));
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Determining if we're in the primary mesh", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if ((objc_msgSend(v9[1], "isLeader") & 1) != 0)
      {
        -[HMDPrimaryElectionCoordinationAddOn _meshNodesToResidentDevices]((dispatch_queue_t *)v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend(v9[1], "meshNodes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setWithArray:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __62__HMDPrimaryElectionCoordinationAddOn__determineIfPrimaryMesh__block_invoke;
        v26[3] = &unk_24E79AC80;
        v26[4] = v9;
        v27 = v12;
        v28 = v13;
        v29 = v16;
        v17 = v16;
        v18 = v13;
        -[HMDPrimaryElectionCoordinationAddOn _requestElectionParametersFromCandidates:completionHandler:]((dispatch_queue_t *)v9, v18, v26);

LABEL_20:
        return;
      }
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v9;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v22;
        v23 = "%{public}@No longer leader, waiting for broadcast from the leader";
        v24 = v21;
        v25 = OS_LOG_TYPE_INFO;
        goto LABEL_18;
      }
    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v9;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v22;
        v23 = "%{public}@Nil context in determineIfPrimaryMesh";
        v24 = v21;
        v25 = OS_LOG_TYPE_ERROR;
LABEL_18:
        _os_log_impl(&dword_2218F0000, v24, v25, v23, buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v19);
    objc_msgSend(v20, "setState:", 0);
    goto LABEL_20;
  }
  v2 = (void *)MEMORY[0x227676638]();
  v3 = a1;
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[dispatch_queue_t state](v3, "state");
    if (v6 > 5)
      v7 = CFSTR("<unknown state>");
    else
      v7 = off_24E797E00[v6];
    *(_DWORD *)buf = 138543618;
    v31 = v5;
    v32 = 2112;
    v33 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Not determining if we are in the primary mesh due to current state: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
}

void __62__HMDPrimaryElectionCoordinationAddOn__determineIfPrimaryMesh__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (-[HMDPrimaryElectionCoordinationAddOn _expectState:action:](*(void **)(a1 + 32), 1, CFSTR("aborting determining primary mesh")))
  {
    -[HMDPrimaryElectionCoordinationAddOn _consensusPrimaryFromResidentCandidates:](*(_QWORD *)(a1 + 32), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "availableResidentDevices");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hmd_residentWithIdentifier:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        if ((-[HMDPrimaryElectionCoordinationAddOn _doesLocalMeshContainPrimaryResident:meshCandidates:](*(void **)(a1 + 32), v6, *(void **)(a1 + 48)) & 1) != 0)goto LABEL_17;
        goto LABEL_10;
      }
      v7 = (void *)MEMORY[0x227676638]();
      v8 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v10;
        v20 = 2114;
        v21 = v4;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unknown resident %{public}@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
    }
    v6 = 0;
LABEL_10:
    -[HMDPrimaryElectionCoordinationAddOn residentDevicesNotFoundInMesh](*(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v15;
        v20 = 2114;
        v21 = v11;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Found other residents that could be in a primary mesh, checking if they are: %{public}@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      if (v6)
        -[HMDPrimaryElectionCoordinationAddOn _maybeNotifyDelegateUpdatedPrimary:currentPrimary:](*(void **)(a1 + 32), v6, 0);
      objc_msgSend(*(id *)(a1 + 32), "_findPrimaryMeshWithContext:otherResidents:", *(_QWORD *)(a1 + 40), v11);
      goto LABEL_18;
    }

LABEL_17:
    -[HMDPrimaryElectionCoordinationAddOn candidateRepresentation](*(void **)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "currentResidentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setResidentDevice:", v16);

    objc_msgSend(v3, "arrayByAddingObject:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
    -[HMDPrimaryElectionCoordinationAddOn _selectPrimaryResidentFromCandidates:meshCandidates:meshCandidateNodes:context:electionTriggerReason:](*(dispatch_queue_t **)(a1 + 32), v17, *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 40), 3);
    v3 = v17;
LABEL_18:

  }
}

- (void)_requestElectionParametersFromCandidates:(void *)a3 completionHandler:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  dispatch_queue_t *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  HMDRemoteDeviceMessageDestination *v17;
  void *v18;
  HMDRemoteMessage *v19;
  HMDRemoteDeviceMessageDestination *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SEL v25;
  id Property;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id obj;
  void *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[6];
  _QWORD v38[6];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    -[dispatch_queue_t context](a1, "context");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v31 = v6;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x227676638]();
      v9 = a1;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v11;
        v46 = 2114;
        v47 = v5;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Requesting election parameters from candidates: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v32 = v5;
      obj = v5;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v40 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            if (objc_msgSend(v16, "isCurrentDevice"))
            {
              -[HMDPrimaryElectionCoordinationAddOn candidateRepresentation](v9);
              v17 = (HMDRemoteDeviceMessageDestination *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "currentResidentDevice");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDRemoteDeviceMessageDestination setResidentDevice:](v17, "setResidentDevice:", v18);

              objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", v17);
              v19 = (HMDRemoteMessage *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v19);
            }
            else
            {
              v20 = [HMDRemoteDeviceMessageDestination alloc];
              -[dispatch_queue_t messageTargetUUID](v9, "messageTargetUUID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "device");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v20, "initWithTarget:device:", v21, v22);

              v19 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:]([HMDRemoteMessage alloc], "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:", CFSTR("mesh.requestCapabilities"), 17, v17, 0, 0, 1, 15.0, -[dispatch_queue_t messageTransportRestriction](v9, "messageTransportRestriction"));
              objc_msgSend(v34, "messageDispatcher");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "sendMessageExpectingResponse:", v19);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              Property = objc_getProperty(v9, v25, 136, 1);
              v37[5] = v16;
              v38[0] = MEMORY[0x24BDAC760];
              v38[1] = 3221225472;
              v38[2] = __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke;
              v38[3] = &unk_24E797CF0;
              v38[4] = v16;
              v38[5] = v9;
              v37[0] = MEMORY[0x24BDAC760];
              v37[1] = 3221225472;
              v37[2] = __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke_81;
              v37[3] = &unk_24E79B210;
              v37[4] = v9;
              objc_msgSend(v24, "inContext:then:orRecover:", Property, v38, v37);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v27);

            }
          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v13);
      }

      v28 = (void *)MEMORY[0x24BE3F180];
      v29 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v28, "allSettled:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke_82;
      v35[3] = &unk_24E797D58;
      v35[4] = v9;
      v6 = v31;
      v36 = v31;
      objc_msgSend(v30, "getResultWithCompletion:", v35);

      v5 = v32;
    }
    else
    {
      (*((void (**)(id, _QWORD))v6 + 2))(v6, MEMORY[0x24BDBD1A8]);
    }

  }
}

- (__HMDPrimaryElectionCandidate)candidateRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *default_evaluator;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __HMDPrimaryElectionCandidate *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __HMDPrimaryElectionCandidate *v22;
  uint64_t v24;
  void *v25;

  if (a1)
  {
    objc_msgSend(a1, "context");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentResidentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(a1, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "homeKitVersion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(a1, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(a1, "dataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "pcsEnabled");
    }
    else
    {
      objc_msgSend(v2, "home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "homeManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "pcsEnabled");

    }
    objc_msgSend(a1, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(a1, "dataSource");
      default_evaluator = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(default_evaluator, "connectionType");
    }
    else
    {
      default_evaluator = (void *)nw_path_create_default_evaluator();
      v14 = nw_path_evaluator_copy_path();
      v13 = nw_path_uses_interface_type(v14, nw_interface_type_wired);

    }
    objc_msgSend(v4, "productInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "softwareVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = [__HMDPrimaryElectionCandidate alloc];
    objc_msgSend(v4, "idsIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "primaryResidentDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v24) = v9;
    v22 = -[__HMDPrimaryElectionCandidate initWithVersion:deviceIdentifier:name:currentPrimaryIdentifier:enabledAsResident:supportsPingRequest:connectionType:pcsEnabled:swVersion:](v17, "initWithVersion:deviceIdentifier:name:currentPrimaryIdentifier:enabledAsResident:supportsPingRequest:connectionType:pcsEnabled:swVersion:", v25, v18, v19, v21, objc_msgSend(v2, "isCurrentDeviceAvailableResident"), 1, v13, v24, v16);

  }
  else
  {
    v22 = 0;
  }
  return v22;
}

uint64_t __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[__HMDPrimaryElectionCandidate fromMessagePayload:](__HMDPrimaryElectionCandidate, "fromMessagePayload:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x227676638](objc_msgSend(v4, "setResidentDevice:", *(_QWORD *)(a1 + 32)));
    v7 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v9;
      v24 = 2114;
      v25 = v11;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Adding election candidate %{public}@: %@", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    v5;
    v12 = 1;
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(void **)(a1 + 32);
      v22 = 138543874;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v3;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Candidate %@ responded with invalid payload: %@", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v12 = 2;
  }

  return v12;
}

uint64_t __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Candidate %@ responded with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

void __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke_82(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke_2;
  v7[3] = &unk_24E79C2B8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "na_filter:", &__block_literal_global_83);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_consensusPrimaryFromResidentCandidates:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  _QWORD v14[4];
  id v15;

  if (!a1)
    return 0;
  v2 = (void *)MEMORY[0x24BDD14E0];
  objc_msgSend(a2, "na_map:", &__block_literal_global_73_234343);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "anyObject");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "allObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __74__HMDPrimaryElectionCoordinationAddOn__consensusPrimaryFromResidentUUIDs___block_invoke;
      v14[3] = &unk_24E797CA0;
      v8 = v5;
      v15 = v8;
      objc_msgSend(v7, "sortedArrayUsingComparator:", v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "countForObject:", v10);
      if (v12 <= objc_msgSend(v8, "countForObject:", v11))
        v6 = 0;
      else
        v6 = v10;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)_doesLocalMeshContainPrimaryResident:(void *)a3 meshCandidates:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  int v16;
  id v17;
  _BOOL4 v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!a1)
  {
    v13 = 0;
    goto LABEL_14;
  }
  objc_msgSend(a1, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentResidentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if (!v9)
  {
    v16 = objc_msgSend(v6, "containsObject:", v5);
    v10 = (void *)MEMORY[0x227676638]();
    v17 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (!v16)
    {
      if (v18)
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v19;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@We are not the current primary and it isn't in our mesh", (uint8_t *)&v21, 0xCu);

      }
      v13 = 0;
      goto LABEL_13;
    }
    if (!v18)
    {
      v13 = 1;
      goto LABEL_13;
    }
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v14;
    v15 = "%{public}@The current primary resident is in our mesh, we are in the primary mesh";
    v13 = 1;
    goto LABEL_8;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = a1;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = 1;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v14;
    v15 = "%{public}@We are the current primary resident, we are in the primary mesh";
LABEL_8:
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v21, 0xCu);

  }
LABEL_13:

  objc_autoreleasePoolPop(v10);
LABEL_14:

  return v13;
}

- (uint64_t)_maybeNotifyDelegateUpdatedPrimary:(void *)a3 currentPrimary:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if ((objc_msgSend(v5, "isEqual:", v6) & 1) == 0)
    {
      objc_msgSend(a1, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 1;
      objc_msgSend(v14, "primaryElectionAddOn:didElectPrimaryResident:confirmed:electionLogEvent:", a1, v5, 1, 0);

      goto LABEL_8;
    }
    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "primaryResidentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Selected primary is current primary: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (void)_selectPrimaryResidentFromCandidates:(void *)a3 meshCandidates:(void *)a4 meshCandidateNodes:(void *)a5 context:(uint64_t)a6 electionTriggerReason:
{
  __CFString *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  id *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id *v26;
  NSObject *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  HMDCoordinationPrimaryElectionDetailedLogEvent *v39;
  HMDCoordinationPrimaryElectionDetailedLogEvent *v40;
  void *v41;
  void *v42;
  id *v43;
  NSObject *v44;
  void *v45;
  __CFString *v46;
  void *v47;
  id *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  unint64_t v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  __CFString *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v58 = a3;
  v12 = a4;
  v13 = a5;
  v56 = v13;
  if (a1)
  {
    v14 = v13;
    dispatch_assert_queue_V2(a1[2]);
    if (!-[__CFString count](v11, "count"))
      _HMFPreconditionFailure();
    v51 = a6;
    -[HMDPrimaryElectionCoordinationAddOn _consensusPrimaryFromResidentCandidates:]((uint64_t)a1, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "availableResidentDevices");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hmd_residentWithIdentifier:", v15);
    v17 = objc_claimAutoreleasedReturnValue();

    v59 = (void *)v17;
    -[dispatch_queue_t primarySortComparatorForCurrentPrimary:](a1, "primarySortComparatorForCurrentPrimary:", v17);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString sortedArrayUsingComparator:](v11, "sortedArrayUsingComparator:");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x227676638]();
    v20 = a1;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v62 = v22;
      v63 = 2114;
      v64 = v18;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Sorted primary candidates: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    -[__CFString lastObject](v18, "lastObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSelectedPrimaryResidentCandidate:", v23);
    objc_msgSend(v23, "residentDevice");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    v55 = (void *)v15;
    if ((unint64_t)-[__CFString count](v18, "count") >= 2)
    {
      -[__CFString objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", -[__CFString count](v18, "count") - 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x227676638](objc_msgSend(v23, "compare:currentPrimary:outCriteria:", v24, v59, &v60));
      v26 = v20;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v25;
        if (v60 > 0x11)
          v29 = CFSTR("unknown reason");
        else
          v29 = off_24E783C60[v60];
        v30 = v29;
        *(_DWORD *)buf = 138543618;
        v62 = v28;
        v63 = 2114;
        v64 = v30;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@The primary resident was chosen because of: %{public}@", buf, 0x16u);

        v25 = v53;
      }

      objc_autoreleasePoolPop(v25);
      v15 = (uint64_t)v55;
      v14 = v56;
    }
    objc_msgSend(v20, "setElectionGotAborted:", 0, v51);
    objc_msgSend(v20, "setLastEvaluatedMeshNodes:", v12);
    objc_msgSend(v14, "primaryResidentDevice");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[HMDPrimaryElectionCoordinationAddOn _maybeNotifyDelegateUpdatedPrimary:currentPrimary:](v20, v57, v31);

    objc_msgSend(v14, "currentResidentDevice");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isEqual:", v15);

    v36 = -[__CFString count](v18, "count");
    v37 = v36 == objc_msgSend(v58, "count");
    v38 = objc_msgSend(v58, "containsObject:", v59);
    v39 = [HMDCoordinationPrimaryElectionDetailedLogEvent alloc];
    v40 = -[HMDCoordinationPrimaryElectionDetailedLogEvent initWithIsPrimary:didChangePrimary:electionTriggerReason:confirmationCriteria:meshAndPrimaryCandidateCountEqual:previousPrimaryInMesh:](v39, "initWithIsPrimary:didChangePrimary:electionTriggerReason:confirmationCriteria:meshAndPrimaryCandidateCountEqual:previousPrimaryInMesh:", v35, v32, v52, v60, v37, v38);
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "submitLogEvent:", v40);

    objc_msgSend(v20, "setState:", 2);
    -[HMDPrimaryElectionCoordinationAddOn sendNewPrimaryNotification:to:]((dispatch_queue_t *)v20, v57, v58);
    -[HMDPrimaryElectionCoordinationAddOn _maybeStartPingTimer]((uint64_t)v20);
    dispatch_assert_queue_V2(a1[2]);
    if (objc_msgSend(v20[1], "isLeader"))
    {
      v42 = (void *)MEMORY[0x227676638]();
      v43 = v20;
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v62 = v45;
        _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_DEBUG, "%{public}@Checking for split network", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v42);
      -[HMDPrimaryElectionCoordinationAddOn residentDevicesNotFoundInMesh]((uint64_t)v43);
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString count](v46, "count"))
      {
        v47 = (void *)MEMORY[0x227676638]();
        v48 = v43;
        HMFGetOSLogHandle();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v62 = v50;
          v63 = 2114;
          v64 = v46;
          _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@Expected resident devices not found in mesh, we have a split network: %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v47);
      }

    }
    v11 = v18;
  }

}

- (void)_maybeStartPingTimer
{
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if ((objc_msgSend(*(id *)(a1 + 8), "isProcessing") & 1) != 0)
    {
      v2 = objc_msgSend(*(id *)(a1 + 8), "isLeader");
      v3 = (void *)MEMORY[0x227676638]();
      v4 = (id)a1;
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      if (v2)
      {
        if (v6)
        {
          HMFGetLogIdentifier();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543362;
          v26 = v7;
          _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting ping timer as a leader", (uint8_t *)&v25, 0xCu);

        }
        objc_autoreleasePoolPop(v3);
        v8 = 60.0;
        v9 = 5;
      }
      else
      {
        if (v6)
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543362;
          v26 = v15;
          _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting ping timer as a node", (uint8_t *)&v25, 0xCu);

        }
        objc_autoreleasePoolPop(v3);
        v9 = 0;
        v8 = (double)arc4random() * 2.32830644e-10 * 11.25 + 75.0;
      }
      objc_msgSend(v4, "pingTimer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "suspend");

      objc_msgSend(v4, "dataSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "createPingTimerWithInterval:options:", v9, v8);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", v9, v8);
      }
      v20 = (void *)v19;

      objc_msgSend(v4, "setPingTimer:", v20);
      objc_msgSend(v4, "pingTimer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDelegate:", v4);

      v22 = *(_QWORD *)(a1 + 16);
      objc_msgSend(v4, "pingTimer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setDelegateQueue:", v22);

      objc_msgSend(v4, "pingTimer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "resume");

    }
    else
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = (id)a1;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 8), "debugDescriptionForMeshState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v13;
        v27 = 2114;
        v28 = v14;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Not starting ping timer in state %{public}@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
    }
  }
}

uint64_t __74__HMDPrimaryElectionCoordinationAddOn__consensusPrimaryFromResidentUUIDs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "countForObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);

  if (v7 < v8)
    return -1;
  else
    return v7 > v8;
}

uint64_t __79__HMDPrimaryElectionCoordinationAddOn__consensusPrimaryFromResidentCandidates___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "currentPrimaryIdentifier");
}

- (void)_clearPessimisticMeshState
{
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  id v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = result;
    result = (void *)objc_msgSend(result, "inPessimisticSecondaryMesh");
    if (result)
    {
      if (result == (void *)2)
      {
        v2 = (void *)MEMORY[0x227676638]();
        v7 = v1;
        HMFGetOSLogHandle();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v8 = 138543362;
          *(_QWORD *)&v8[4] = v5;
          v6 = "%{public}@Pessimistic secondary mesh state terminated while performing an IDS ping";
          goto LABEL_9;
        }
      }
      else
      {
        if (result != (void *)1)
          return (void *)objc_msgSend(v1, "setInPessimisticSecondaryMesh:", 0, *(_OWORD *)v8);
        v2 = (void *)MEMORY[0x227676638]();
        v3 = v1;
        HMFGetOSLogHandle();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v8 = 138543362;
          *(_QWORD *)&v8[4] = v5;
          v6 = "%{public}@Pessimistic secondary mesh state terminated before an IDS ping";
LABEL_9:
          _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, v6, v8, 0xCu);

        }
      }

      objc_autoreleasePoolPop(v2);
      return (void *)objc_msgSend(v1, "setInPessimisticSecondaryMesh:", 0, *(_OWORD *)v8);
    }
  }
  return result;
}

- (dispatch_queue_t)_doesLocalMeshContainPrimaryResident:(dispatch_queue_t *)result
{
  dispatch_queue_t *v2;
  id v3;
  void *v4;
  uint64_t v5;

  if (result)
  {
    v2 = result;
    v3 = a2;
    -[HMDPrimaryElectionCoordinationAddOn _meshNodesToResidentDevices](v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[HMDPrimaryElectionCoordinationAddOn _doesLocalMeshContainPrimaryResident:meshCandidates:](v2, v3, v4);

    return (dispatch_queue_t *)v5;
  }
  return result;
}

- (uint64_t)_currentStateRequiresElection
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v27;
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  objc_msgSend(*(id *)(a1 + 8), "leaderNode");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "lastKnownLeaderNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v27, "isEqual:", v2);

  objc_msgSend((id)a1, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryResidentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v35 = objc_msgSend(v5, "isCurrentDevice") ^ 1;
  objc_msgSend(*(id *)(a1 + 8), "meshNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __68__HMDPrimaryElectionCoordinationAddOn__currentStateRequiresElection__block_invoke;
  v28[3] = &unk_24E797D80;
  v30 = &v36;
  v28[4] = a1;
  v31 = &v32;
  v9 = v7;
  v29 = v9;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v28);

  if (*((_BYTE *)v37 + 24))
    v10 = 1;
  else
    v10 = *((_BYTE *)v33 + 24) != 0;
  if (v3 && (v10 | objc_msgSend((id)a1, "electionGotAborted")) != 1)
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = (id)a1;
    HMFGetOSLogHandle();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@We don't need an election now. No major changes since the last election", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    v21 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = (id)a1;
    HMFGetOSLogHandle();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "electionGotAborted");
      HMFBooleanToString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v41 = v14;
      v42 = 2112;
      v43 = v15;
      v44 = 2112;
      v45 = v16;
      v46 = 2112;
      v47 = v17;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@We need an election, leader changed: %@, nodes changed: %@, previous election aborted: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    v18 = 4;
    if (!*((_BYTE *)v33 + 24))
      v18 = 1;
    v19 = 5;
    if (!*((_BYTE *)v37 + 24))
      v19 = v18;
    if (v3)
      v20 = v19;
    else
      v20 = 6;
    objc_msgSend(v12, "setCoordinationUpdateElectionTriggerReason:", v20);
    v21 = 1;
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v21;
}

- (void)_didBecomeLeaderAndPerformElection:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v4 = objc_msgSend((id)a1, "state");
    switch(v4)
    {
      case 4:
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
        -[HMDPrimaryElectionCoordinationAddOn resumeDebounceWithInterval:]((_QWORD *)a1, 5.0);
        -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer]((dispatch_queue_t *)a1);
        break;
      case 2:
        if (a2)
        {
          objc_msgSend((id)a1, "performElection");
        }
        else
        {
          v5 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(*(id *)(a1 + 8), "meshNodes");
          v8 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setWithArray:", v8);
          v6 = objc_claimAutoreleasedReturnValue();
          v7 = *(void **)(a1 + 176);
          *(_QWORD *)(a1 + 176) = v6;

        }
        break;
      case 0:
        -[HMDPrimaryElectionCoordinationAddOn resumeDebounceWithInterval:]((_QWORD *)a1, 5.0);
        break;
    }
  }
}

- (dispatch_queue_t)_anotherNodeBecameLeader
{
  dispatch_queue_t *v1;
  uint64_t v2;
  dispatch_queue_t v3;

  if (result)
  {
    v1 = result;
    -[HMDPrimaryElectionCoordinationAddOn _stopBeingLeader](result);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v1[22];
    v1[22] = (dispatch_queue_t)v2;

    return (dispatch_queue_t *)-[dispatch_queue_t setElectionGotAborted:](v1, "setElectionGotAborted:", 0);
  }
  return result;
}

- (void)_stopBeingLeader
{
  uint64_t v2;
  dispatch_queue_t *v3;
  uint64_t v4;

  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    v2 = -[dispatch_queue_t state](a1, "state");
    if (v2 != 5)
    {
      if (v2 == 3)
      {
        -[dispatch_queue_t setState:](a1, "setState:", 2);
        -[dispatch_queue_t setElectionGotAborted:](a1, "setElectionGotAborted:", 1);
      }
      else if (v2 == 1)
      {
        v3 = a1;
        v4 = 0;
LABEL_8:
        -[dispatch_queue_t setState:](v3, "setState:", v4);
      }
      -[HMDPrimaryElectionCoordinationAddOn _stopSecondaryMeshTimer](a1);
      return;
    }
    v3 = a1;
    v4 = 4;
    goto LABEL_8;
  }
}

- (void)_stopSecondaryMeshTimer
{
  void *v2;
  void *v3;
  dispatch_queue_t *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    -[dispatch_queue_t secondaryMeshTimer](a1, "secondaryMeshTimer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v3 = (void *)MEMORY[0x227676638]();
      v4 = a1;
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138543362;
        v9 = v6;
        _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping secondary mesh timer", (uint8_t *)&v8, 0xCu);

      }
      objc_autoreleasePoolPop(v3);
      -[dispatch_queue_t secondaryMeshTimer](v4, "secondaryMeshTimer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "suspend");

      -[dispatch_queue_t setSecondaryMeshTimer:](v4, "setSecondaryMeshTimer:", 0);
    }
  }
}

- (void)resumeDebounceWithInterval:(_QWORD *)a1
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  if (a1)
  {
    objc_msgSend(a1, "debounceTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeInterval");
    v6 = v5;

    if (v6 != a2)
    {
      objc_msgSend(a1, "debounceTimer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "suspend");

      -[HMDPrimaryElectionCoordinationAddOn _createDebounceTimerWithInterval:](a1, a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setDebounceTimer:", v8);

      v9 = a1[2];
      objc_msgSend(a1, "debounceTimer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDelegateQueue:", v9);

      objc_msgSend(a1, "debounceTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDelegate:", a1);

    }
    objc_msgSend(a1, "debounceTimer");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resume");

  }
}

- (id)_createDebounceTimerWithInterval:(void *)a1
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    objc_msgSend(a1, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "createDebounceTimerWithInterval:options:", 0, a2);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, a2);
    }
    v6 = (void *)v5;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

void __68__HMDPrimaryElectionCoordinationAddOn__currentStateRequiresElection__block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 176), "containsObject:") ^ 1;
  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v6 = (void *)a1[5];
    objc_msgSend(v8, "idsIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v6, "hmf_isEqualToUUIDString:", v7) ^ 1;

  }
  *a4 = *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24);

}

- (id)meshLeaderResidentDevice
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (id *)a1;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    objc_msgSend(v1[1], "leaderNode");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "availableResidentDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "hmd_residentDeviceForMeshNode:", v2);
    v1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

uint64_t __78__HMDPrimaryElectionCoordinationAddOn_primarySortComparatorForCurrentPrimary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:currentPrimary:outCriteria:", a3, *(_QWORD *)(a1 + 32), 0);
}

void __72__HMDPrimaryElectionCoordinationAddOn__selectPrimaryResidentWithReason___block_invoke(uint64_t a1, void *a2)
{
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v4;
  id v5;

  v5 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained
    && -[HMDPrimaryElectionCoordinationAddOn _expectState:action:](WeakRetained, 3, CFSTR("aborting election")))
  {
    -[HMDPrimaryElectionCoordinationAddOn _selectPrimaryResidentFromCandidates:meshCandidates:meshCandidateNodes:context:electionTriggerReason:](v4, v5, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 64));
    clearPrimaryPreference(1);
  }

}

void __71__HMDPrimaryElectionCoordinationAddOn_selectPrimaryResidentWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isLeader") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_selectPrimaryResidentWithReason:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Not running primary resident election because this device is not the leader", (uint8_t *)&v6, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
  }
}

uint64_t __82__HMDPrimaryElectionCoordinationAddOn__findPrimaryMeshWithContext_otherResidents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (-[HMDPrimaryElectionCoordinationAddOn _expectState:action:](*(void **)(a1 + 32), 1, CFSTR("deciding if we're in primary mesh")))
  {
    objc_msgSend(*(id *)(a1 + 40), "primaryResidentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (-[HMDPrimaryElectionCoordinationAddOn _doesLocalMeshContainPrimaryResident:](*(dispatch_queue_t **)(a1 + 32), v4))
      {
        objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
        objc_msgSend(*(id *)(a1 + 32), "_selectPrimaryResidentWithReason:", 2);
      }
      else
      {
        v9 = (void *)MEMORY[0x227676638]();
        v10 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138543362;
          v15 = v12;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Pinging primary resident", (uint8_t *)&v14, 0xCu);

        }
        objc_autoreleasePoolPop(v9);
        objc_msgSend(*(id *)(a1 + 32), "setState:", 4);
        -[HMDPrimaryElectionCoordinationAddOn _pingPrimaryResident](*(dispatch_queue_t **)(a1 + 32));
      }
    }
    else
    {
      v5 = (void *)MEMORY[0x227676638]();
      v6 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v8;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@No primary resident after cloud ready, doing a meta mesh election", (uint8_t *)&v14, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
      -[HMDPrimaryElectionCoordinationAddOn _doMetaMeshElection](*(dispatch_queue_t **)(a1 + 32));
    }

  }
  return 1;
}

void __85__HMDPrimaryElectionCoordinationAddOn_primaryResidentChanged_previousResidentDevice___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  const __CFString *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(id **)(a1 + 40);
  if (v3)
  {
    v4 = objc_msgSend(v2, "state");
    if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(a1 + 48)))
      v5 = v4 == 0;
    else
      v5 = 1;
    if (v5)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(const __CFString **)(a1 + 32);
        v22 = 138543618;
        v23 = v9;
        v24 = 2112;
        v25 = v10;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling new primary resident: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      if (-[HMDPrimaryElectionCoordinationAddOn _doesLocalMeshContainPrimaryResident:](*(dispatch_queue_t **)(a1 + 40), *(void **)(a1 + 32)))v11 = 2;
      else
        v11 = 4;
      if (v11 != v4)
      {
        objc_msgSend(*(id *)(a1 + 40), "setState:");
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "isLeader"))
        {
          v12 = (void *)MEMORY[0x227676638]();
          v13 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(*(id *)(a1 + 40), "state");
            if (v16 > 5)
              v17 = CFSTR("<unknown state>");
            else
              v17 = off_24E797E00[v16];
            v22 = 138543618;
            v23 = v15;
            v24 = 2112;
            v25 = v17;
            _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Received a primary resident change while we are the leader in state: %@.", (uint8_t *)&v22, 0x16u);

          }
          objc_autoreleasePoolPop(v12);
          -[HMDPrimaryElectionCoordinationAddOn _didBecomeLeaderAndPerformElection:](*(_QWORD *)(a1 + 40), 1);
        }
      }
    }
  }
  else if (objc_msgSend(v2[1], "isLeader") && objc_msgSend(*(id *)(a1 + 40), "state") == 2)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Primary resident was set to nil, calling an election", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(*(id *)(a1 + 40), "performElection");
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t125 != -1)
    dispatch_once(&logCategory__hmf_once_t125, &__block_literal_global_90_234420);
  return (id)logCategory__hmf_once_v126;
}

void __50__HMDPrimaryElectionCoordinationAddOn_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v126;
  logCategory__hmf_once_v126 = v0;

}

@end
