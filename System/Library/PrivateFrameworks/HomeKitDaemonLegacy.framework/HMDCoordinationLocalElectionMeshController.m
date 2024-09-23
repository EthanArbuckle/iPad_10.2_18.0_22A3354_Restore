@implementation HMDCoordinationLocalElectionMeshController

- (HMDCoordinationLocalElectionMeshController)initWithQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HMDCoordinationLocalElectionMeshController *v9;
  HMDCoordinationLocalElectionMeshController *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferenceForKey:", CFSTR("meshElectionConstituentType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "unsignedLongLongValue");
  else
    v8 = 4096;
  v12.receiver = self;
  v12.super_class = (Class)HMDCoordinationLocalElectionMeshController;
  v9 = -[COMeshController initWithConstituentType:](&v12, sel_initWithConstituentType_, v8);
  v10 = v9;
  if (v9)
  {
    -[COMeshController setDispatchQueue:](v9, "setDispatchQueue:", v4);
    -[HMDCoordinationLocalElectionMeshController _setupMessageRegistrations](v10, "_setupMessageRegistrations");
  }

  return v10;
}

- (void)_setupMessageRegistrations
{
  uint64_t v3;
  HMDCoordinationAddOnImpl *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[COMeshController registerHandler:forCommandClass:](self, "registerHandler:forCommandClass:", &__block_literal_global_124411, objc_opt_class());
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__HMDCoordinationLocalElectionMeshController__setupMessageRegistrations__block_invoke_2;
  v7[3] = &unk_1E89B56B8;
  objc_copyWeak(&v8, &location);
  -[COMeshController registerHandler:forNotificationClass:](self, "registerHandler:forNotificationClass:", v7, objc_opt_class());
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __72__HMDCoordinationLocalElectionMeshController__setupMessageRegistrations__block_invoke_3;
  v5[3] = &unk_1E89B56E0;
  objc_copyWeak(&v6, &location);
  -[COMeshController registerHandler:forRequestClass:](self, "registerHandler:forRequestClass:", v5, objc_opt_class());
  v4 = objc_alloc_init(HMDCoordinationAddOnImpl);
  -[HMDCoordinationAddOnImpl setDelegate:](v4, "setDelegate:", self);
  -[COMeshController addAddOn:](self, "addAddOn:", v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)startMeshWithName:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[COMeshController setMeshName:](self, "setMeshName:", v4);
  -[COMeshController start](self, "start");
}

- (void)stop
{
  NSObject *v3;
  objc_super v4;

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4.receiver = self;
  v4.super_class = (Class)HMDCoordinationLocalElectionMeshController;
  -[COMeshController stop](&v4, sel_stop);
}

- (void)sendPingCommandToLeaderWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  HMDCoordinationPingCommand *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc_init(HMDCoordinationPingCommand);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__HMDCoordinationLocalElectionMeshController_sendPingCommandToLeaderWithCompletion___block_invoke;
  v8[3] = &unk_1E89B5708;
  v9 = v4;
  v7 = v4;
  -[COMeshController sendCommand:withCompletionHandler:](self, "sendCommand:withCompletionHandler:", v6, v8);

}

- (void)sendPingNotificationToFollowersWithPrimaryResident:(id)a3
{
  id v4;
  NSObject *v5;
  HMDCoordinationPingNotification *v6;

  v4 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[HMDCoordinationPingNotification initWithPrimaryResidentUUID:]([HMDCoordinationPingNotification alloc], "initWithPrimaryResidentUUID:", v4);
  -[COMeshController sendNotification:](self, "sendNotification:", v6);

}

- (id)meshNodeFor:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v12.receiver = self;
  v12.super_class = (Class)HMDCoordinationLocalElectionMeshController;
  -[COMeshController nodes](&v12, sel_nodes);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__HMDCoordinationLocalElectionMeshController_meshNodeFor___block_invoke;
  v10[3] = &unk_1E89B5730;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)sendPingRequestToNode:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDCoordinationPingRequest *v10;
  void *v11;
  HMDCoordinationLocalElectionMeshController *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDCoordinationLocalElectionMeshController meshNodeFor:](self, "meshNodeFor:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc_init(HMDCoordinationPingRequest);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __83__HMDCoordinationLocalElectionMeshController_sendPingRequestToNode_withCompletion___block_invoke;
    v15[3] = &unk_1E89B5758;
    v16 = v7;
    -[COMeshController sendRequest:toPeer:withCompletionHandler:](self, "sendRequest:toPeer:withCompletionHandler:", v10, v9, v15);

  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not find the destination node to send the ping request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (BOOL)isLeader
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[COMeshController leader](self, "leader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshController me](self, "me");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (BOOL)isProcessing
{
  NSObject *v3;

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return -[COMeshController state](self, "state") == 3;
}

- (HMDLocalElectionMeshNode)leaderNode
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDCoordinationLocalElectionMeshNode *v6;
  _QWORD v8[5];
  objc_super v9;

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v9.receiver = self;
  v9.super_class = (Class)HMDCoordinationLocalElectionMeshController;
  -[COMeshController nodes](&v9, sel_nodes);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__HMDCoordinationLocalElectionMeshController_leaderNode__block_invoke;
  v8[3] = &unk_1E89B5730;
  v8[4] = self;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMDCoordinationLocalElectionMeshNode initWithMeshNode:]([HMDCoordinationLocalElectionMeshNode alloc], "initWithMeshNode:", v5);
  return (HMDLocalElectionMeshNode *)v6;
}

- (NSArray)meshNodes
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v7.receiver = self;
  v7.super_class = (Class)HMDCoordinationLocalElectionMeshController;
  -[COMeshController nodes](&v7, sel_nodes);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_20_124347);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (id)debugDescriptionForControllerType
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[COMeshController me](self, "me");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  switch(v5)
  {
    case 61440:
      v6 = CFSTR("LongLived");
      break;
    case 4096:
      v6 = CFSTR("Permanent");
      break;
    case -1:
      v6 = CFSTR("Ephemeral");
      break;
    default:
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[COMeshController me](self, "me");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Unknown(%llu)"), objc_msgSend(v8, "type"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
  }
  return v6;
}

- (id)debugDescriptionForMeshState
{
  NSObject *v3;
  unint64_t v4;
  __CFString *v5;

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[COMeshController state](self, "state");
  if (v4 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%d)"), -[COMeshController state](self, "state"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E89B57D8[v4];
  }
  return v5;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[COMeshController meshName](self, "meshName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)meshControllerDidElectLeader
{
  NSObject *v3;
  id v4;

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCoordinationLocalElectionMeshController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meshControllerDidElectLeader:", self);

}

- (void)meshControllerDidStartElection
{
  NSObject *v3;
  id v4;

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCoordinationLocalElectionMeshController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meshControllerDidStartElection:", self);

}

- (void)meshControllerDidUpdatesNodes
{
  NSObject *v3;
  id v4;

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCoordinationLocalElectionMeshController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meshControllerDidUpdatesNodes:", self);

}

- (HMDLocalElectionMeshControllerDelegate)delegate
{
  return (HMDLocalElectionMeshControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
}

HMDCoordinationLocalElectionMeshNode *__55__HMDCoordinationLocalElectionMeshController_meshNodes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDCoordinationLocalElectionMeshNode *v3;

  v2 = a2;
  v3 = -[HMDCoordinationLocalElectionMeshNode initWithMeshNode:]([HMDCoordinationLocalElectionMeshNode alloc], "initWithMeshNode:", v2);

  return v3;
}

uint64_t __56__HMDCoordinationLocalElectionMeshController_leaderNode__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "leader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqual:", v5);
  return v6;
}

uint64_t __83__HMDCoordinationLocalElectionMeshController_sendPingRequestToNode_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__HMDCoordinationLocalElectionMeshController_meshNodeFor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "idsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "IDSIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqual:", v5);
  return v6;
}

uint64_t __84__HMDCoordinationLocalElectionMeshController_sendPingCommandToLeaderWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__HMDCoordinationLocalElectionMeshController__setupMessageRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    objc_msgSend(WeakRetained, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryResidentUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "meshController:didReceivePingFromLeaderWithPrimaryResidentUUID:", WeakRetained, v8);
  }

}

void __72__HMDCoordinationLocalElectionMeshController__setupMessageRegistrations__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, HMDCoordinationPingResponse *, _QWORD);
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  HMDCoordinationPingResponse *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Responding to ping request", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v12 = objc_alloc_init(HMDCoordinationPingResponse);
    v6[2](v6, v12, 0);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_124434 != -1)
    dispatch_once(&logCategory__hmf_once_t3_124434, &__block_literal_global_45_124435);
  return (id)logCategory__hmf_once_v4_124436;
}

void __57__HMDCoordinationLocalElectionMeshController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_124436;
  logCategory__hmf_once_v4_124436 = v0;

}

@end
