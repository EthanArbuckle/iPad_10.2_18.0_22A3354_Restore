@implementation HMDUserPresenceFeeder

- (HMDUserPresenceFeeder)init
{
  HMDUserPresenceFeeder *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDUserPresenceFeeder;
  result = -[HMDUserPresenceFeeder init](&v3, sel_init);
  if (result)
  {
    result->_presenceRegionStatus = 0;
    result->_ckAccountStatus = 0;
    result->_isAccountStatusFetchInProgress = 0;
  }
  return result;
}

- (void)configure:(id)a3 messageDispatcher:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *timerID;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMDUserPresenceFeeder;
  -[HMDHomePresenceBase configure:messageDispatcher:](&v11, sel_configure_messageDispatcher_, a3, a4);
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HMDHomePresenceBase presenceMonitorMessageTargetUUID](self, "presenceMonitorMessageTargetUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("presence.feeder/%@"), v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  timerID = self->_timerID;
  self->_timerID = v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handleResidentDeviceConfirmed_, CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), 0);

}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDUserPresenceFeeder;
  -[HMDHomePresenceBase _registerForMessages](&v6, sel__registerForMessages);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleLocationAuthorizationChangedNotification_, CFSTR("HMDLocationAuthorizationChangedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_accountAvailabilityChanged_, *MEMORY[0x1E0C94690], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_fmfStatusUpdateNotification_, CFSTR("HMDFMFStatusUpdateNotification"), 0);

}

- (void)accountAvailabilityChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDHomePresenceBase workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HMDUserPresenceFeeder_accountAvailabilityChanged___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)fetchCKAccountStatusAndSendPresenceReport
{
  NSObject *v3;
  void *v4;
  HMDUserPresenceFeeder *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDHomePresenceBase workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDUserPresenceFeeder isAccountStatusFetchInProgress](self, "isAccountStatusFetchInProgress"))
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@CK Account fetch status already in progress. Not calling it again.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    -[HMDUserPresenceFeeder setIsAccountStatusFetchInProgress:](self, "setIsAccountStatusFetchInProgress:", 1);
    objc_initWeak((id *)buf, self);
    getCKContainer();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__HMDUserPresenceFeeder_fetchCKAccountStatusAndSendPresenceReport__block_invoke;
    v9[3] = &unk_1E89A8F08;
    objc_copyWeak(&v10, (id *)buf);
    objc_msgSend(v8, "accountStatusWithCompletionHandler:", v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

- (void)fmfStatusUpdateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDUserPresenceFeeder *v9;

  v4 = a3;
  -[HMDHomePresenceBase workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__HMDUserPresenceFeeder_fmfStatusUpdateNotification___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)homeDataProcessed
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHomePresenceBase workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__HMDUserPresenceFeeder_homeDataProcessed__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)handleHomeDataLoadedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDHomePresenceBase workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HMDUserPresenceFeeder_handleHomeDataLoadedNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_upgradePresenceAuth
{
  void *v3;
  HMDUserPresenceFeeder *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomeModel *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDHomeModel *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Updating presence authorization by writing HMUserPresenceAuthorizationStatusAuthorized to database", (uint8_t *)&v16, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDHomePresenceBase home](v4, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [HMDHomeModel alloc];
  objc_msgSend(v7, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v8, "initWithObjectChangeType:uuid:parentUUID:", 2, v9, v11);

  -[HMDHomeModel setPresenceAuthorizationStatus:](v12, "setPresenceAuthorizationStatus:", &unk_1E8B32CE8);
  objc_msgSend(v7, "backingStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transaction:options:", CFSTR("UpgradePresenceAuth"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "add:withMessage:", v12, 0);
  objc_msgSend(v15, "run");

}

- (void)setPresenceRegionStatus:(unint64_t)a3
{
  void *v5;
  HMDUserPresenceFeeder *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t presenceRegionStatus;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMDUserPresenceRegionStatusAsString(v6->_presenceRegionStatus);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMDUserPresenceRegionStatusAsString(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating presence status from %@ to %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  presenceRegionStatus = v6->_presenceRegionStatus;
  if (presenceRegionStatus == a3)
  {
    v12 = 3;
  }
  else
  {
    if (presenceRegionStatus)
      v12 = 2;
    else
      v12 = 3;
    v6->_presenceRegionStatus = a3;
  }
  +[HMDUserPresenceUpdateReason reasonWithValue:](HMDUserPresenceUpdateReason, "reasonWithValue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserPresenceFeeder _sendPresenceUpdateToResident:](v6, "_sendPresenceUpdateToResident:", v13);

}

- (void)_startRefreshTimer
{
  void *v3;
  void *v4;
  HMDUserPresenceFeeder *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  HMDUserPresenceFeeder *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[HMDUserPresenceFeeder timerID](self, "timerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v7;
    v24 = 2112;
    v25 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting the refresh timer with ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelTaskWithIdentifier:onObserver:", v3, v5);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "minute");
  objc_msgSend(v10, "setMinute:", presenceFeedRefreshInMinutes + v11);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateFromComponents:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v15 = objc_msgSend(v14, "scheduleTaskWithIdentifier:fireDate:onObserver:selector:error:", v3, v13, v5, sel_handleTimerFiredNotification_, &v21);
  v16 = v21;

  if ((v15 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v5;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v20;
      v24 = 2112;
      v25 = v3;
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to start timer %@ with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (void)handleTimerFiredNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("HMD.BGTM.NK"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDUserPresenceFeeder timerID](self, "timerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  if (v7)
  {
    -[HMDHomePresenceBase workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__HMDUserPresenceFeeder_handleTimerFiredNotification___block_invoke;
    v9[3] = &unk_1E89C2328;
    v9[4] = self;
    v10 = v5;
    dispatch_async(v8, v9);

  }
}

- (void)presenceAuthStatusChangedForUser:(id)a3 presenceAuthStatus:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDHomePresenceBase workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__HMDUserPresenceFeeder_presenceAuthStatusChangedForUser_presenceAuthStatus___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)presenceAuthChanged
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHomePresenceBase workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HMDUserPresenceFeeder_presenceAuthChanged__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)handleResidentDeviceConfirmed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HMDHomePresenceBase home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentDeviceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryResidentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[HMDUserPresenceFeeder residentChanged](self, "residentChanged");
}

- (void)residentChanged
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHomePresenceBase workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HMDUserPresenceFeeder_residentChanged__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_sendPresenceReport:(unint64_t)a3
{
  id v4;

  +[HMDUserPresenceUpdateReason reasonWithValue:](HMDUserPresenceUpdateReason, "reasonWithValue:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDUserPresenceFeeder _sendPresenceUpdateToResident:](self, "_sendPresenceUpdateToResident:", v4);

}

- (void)_sendPresenceUpdateToResident:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDHomePresenceBase home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentUser");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "presenceAuthStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserPresenceFeeder _sendPresenceUpdateToResidentForUser:presenceAuthStatus:authChanging:reason:](self, "_sendPresenceUpdateToResidentForUser:presenceAuthStatus:authChanging:reason:", v7, v6, 0, v4);

}

- (void)_sendPresenceUpdateToResidentForUser:(id)a3 presenceAuthStatus:(id)a4 authChanging:(BOOL)a5 reason:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDUserPresenceFeeder *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDUserPresenceFeeder *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  BOOL v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 138543874;
    v28 = v16;
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = v11;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Status update of presence for user: %@, auth: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  if (v10)
  {
    +[HMDFMFHandler sharedHandler](HMDFMFHandler, "sharedHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __101__HMDUserPresenceFeeder__sendPresenceUpdateToResidentForUser_presenceAuthStatus_authChanging_reason___block_invoke;
    v22[3] = &unk_1E89A8F30;
    v22[4] = v14;
    v23 = v10;
    v24 = v11;
    v26 = a5;
    v25 = v12;
    objc_msgSend(v17, "queryFMFStatusWithCompletion:", v22);

  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v14;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v21;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Cannot send the presence update as the user is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
  }

}

- (void)_sendPresenceUpdateToResidentForUser:(id)a3 presenceAuthStatus:(id)a4 authChanging:(BOOL)a5 reason:(id)a6 fmfStatus:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  void *v17;
  HMDUserPresenceFeeder *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDUserPresenceFeeder *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v9 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = -[HMDUserPresenceFeeder _updatePresenceToResidentForUser:presenceAuthStatus:authChanging:reason:fmfStatus:](self, "_updatePresenceToResidentForUser:presenceAuthStatus:authChanging:reason:fmfStatus:", v12, v13, v9, v14, v15);
  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v20;
    v28 = 2112;
    v29 = v21;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Presence update to resident ended in success: %@", (uint8_t *)&v26, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  if (!v16)
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = v18;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v25;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Resetting current feed session as the presence update to resident did not go through", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    -[HMDUserPresenceFeeder setCurrentFeedSession:](v23, "setCurrentFeedSession:", 0);
  }

}

- (BOOL)_updatePresenceToResidentForUser:(id)a3 presenceAuthStatus:(id)a4 authChanging:(BOOL)a5 reason:(id)a6 fmfStatus:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  HMDUserPresenceFeeder *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDUserPresenceFeeder *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  HMDUserPresenceFeeder *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  HMDUserPresenceFeeder *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  HMDUserPresenceFeeder *v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  HMDUserPresenceFeeder *v46;
  NSObject *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  HMDUserPresenceFeeder *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  BOOL v62;
  HMDUserPresenceFeeder *v63;
  NSObject *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  HMDUserPresenceFeeder *v72;
  NSObject *v73;
  id v74;
  id v75;
  void *v76;
  void *v78;
  HMDUserPresenceFeeder *v79;
  NSObject *v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  id v88;
  void *contexta;
  void *context;
  void *contextb;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  id v95;
  __int16 v96;
  id v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v9 = a5;
  v100 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if ((isPresenceAuthorizationValid() & 1) != 0)
  {
    switch(objc_msgSend(v15, "value"))
    {
      case 0:
        v16 = MEMORY[0x1D17BA0A0]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v93 = v19;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@FMF Device status is unknown, cannot send report", buf, 0xCu);

        }
        v20 = (void *)v16;
        goto LABEL_33;
      case 1:
        objc_msgSend(MEMORY[0x1E0CBA958], "computeWithValue:", 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        if (v9)
          goto LABEL_46;
        goto LABEL_43;
      case 2:
        if (objc_msgSend(v13, "value") == 1)
        {
          +[HMDLocation sharedManager](HMDLocation, "sharedManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "locationAuthorized");

          v29 = (void *)MEMORY[0x1D17BA0A0]();
          v30 = self;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            contexta = (void *)v28;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            HMDLocationAuthorizationAsString();
            v88 = v29;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v93 = v32;
            v94 = 2112;
            v95 = v33;
            _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Current Location Authorization : %@", buf, 0x16u);

            v29 = v88;
            v28 = (uint64_t)contexta;
          }

          objc_autoreleasePoolPop(v29);
          if (v28 == 1)
          {
            objc_msgSend(MEMORY[0x1E0CBA958], "computeWithValue:", 4);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDUserPresenceRegion regionWithValue:](HMDUserPresenceRegion, "regionWithValue:", -[HMDUserPresenceFeeder presenceRegionStatus](v30, "presenceRegionStatus"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_40;
          }
          if (!v28)
          {
            v34 = MEMORY[0x1D17BA0A0]();
            v35 = v30;
            HMFGetOSLogHandle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v93 = v37;
              _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@Looks like we are still waiting for location authorization status from Core Location. Till we determine that let's not send the presence update.", buf, 0xCu);

            }
            goto LABEL_32;
          }
          v56 = (void *)MEMORY[0x1E0CBA958];
          v57 = 2;
        }
        else
        {
          v52 = (void *)MEMORY[0x1D17BA0A0]();
          v53 = self;
          HMFGetOSLogHandle();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v93 = v55;
            _os_log_impl(&dword_1CD062000, v54, OS_LOG_TYPE_INFO, "%{public}@We do not have presence authorization for this user.", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v52);
          v56 = (void *)MEMORY[0x1E0CBA958];
          v57 = 1;
        }
        objc_msgSend(v56, "computeWithValue:", v57, v88);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
LABEL_40:
        context = (void *)MEMORY[0x1D17BA0A0]();
        v63 = self;
        HMFGetOSLogHandle();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v88 = v13;
          v65 = v25;
          v66 = v15;
          v67 = v12;
          v68 = v14;
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v93 = v69;
          v94 = 2112;
          v95 = v26;
          _os_log_impl(&dword_1CD062000, v64, OS_LOG_TYPE_INFO, "%{public}@This is the FMF device. Presence compute status : %@", buf, 0x16u);

          v14 = v68;
          v12 = v67;
          v15 = v66;
          v25 = v65;
          v13 = v88;
        }

        objc_autoreleasePoolPop(context);
        if (v9)
          goto LABEL_46;
LABEL_43:
        if (objc_msgSend(v13, "value", v88) != 1 || objc_msgSend(v26, "value") != 4 || objc_msgSend(v25, "value"))
          goto LABEL_46;
        v78 = (void *)MEMORY[0x1D17BA0A0]();
        v79 = self;
        HMFGetOSLogHandle();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v81 = v26;
          v82 = v13;
          v83 = v25;
          v84 = v15;
          v85 = v12;
          v86 = v14;
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v93 = v87;
          _os_log_impl(&dword_1CD062000, v80, OS_LOG_TYPE_INFO, "%{public}@Presence region status is still unknown, bailing out as a later update will be sent", buf, 0xCu);

          v14 = v86;
          v12 = v85;
          v15 = v84;
          v25 = v83;
          v13 = v82;
          v26 = v81;
        }

        objc_autoreleasePoolPop(v78);
        goto LABEL_34;
      case 3:
        v38 = (void *)MEMORY[0x1D17BA0A0]();
        v39 = self;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v41 = v15;
          v42 = v12;
          v43 = v14;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v93 = v44;
          _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_INFO, "%{public}@There is an FMF device, but this device is not the FMF device", buf, 0xCu);

          v14 = v43;
          v12 = v42;
          v15 = v41;
        }

        objc_autoreleasePoolPop(v38);
        if (!v9)
        {
          v34 = MEMORY[0x1D17BA0A0]();
          v35 = v39;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v58 = v15;
            v59 = v12;
            v60 = v14;
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v93 = v61;
            _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@There is an FMF device, but this device is not the FMF device. Presence-auth is authorized, the FMF device will send the message.", buf, 0xCu);

            v14 = v60;
            v12 = v59;
            v15 = v58;
          }
LABEL_32:

          v20 = (void *)v34;
LABEL_33:
          objc_autoreleasePoolPop(v20);
          goto LABEL_34;
        }
        if (objc_msgSend(v13, "value") == 1)
        {
          v45 = (void *)MEMORY[0x1D17BA0A0]();
          v46 = v39;
          HMFGetOSLogHandle();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v48 = v15;
            v49 = v12;
            v50 = v14;
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v93 = v51;
            _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_INFO, "%{public}@Presence-auth is changing to authorized", buf, 0xCu);

            v14 = v50;
            v12 = v49;
            v15 = v48;
          }

          objc_autoreleasePoolPop(v45);
          v26 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CBA958], "computeWithValue:", 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v25 = 0;
LABEL_46:
        -[HMDUserPresenceFeeder _sendPresenceAuthStatusForUser:presenceAuthStatus:presenceRegionStatus:presenceComputeStatus:reason:](self, "_sendPresenceAuthStatusForUser:presenceAuthStatus:presenceRegionStatus:presenceComputeStatus:reason:", v12, v13, v25, v26, v14, v88);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          -[HMDUserPresenceFeeder _updatePresenceComputeStatus:](self, "_updatePresenceComputeStatus:", v26);
        v71 = (void *)MEMORY[0x1D17BA0A0]();
        v72 = self;
        HMFGetOSLogHandle();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          contextb = v25;
          v74 = v15;
          v75 = v14;
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v93 = v76;
          v94 = 2112;
          v95 = v12;
          v96 = 2112;
          v97 = v13;
          v98 = 2112;
          v99 = v70;
          _os_log_impl(&dword_1CD062000, v73, OS_LOG_TYPE_INFO, "%{public}@Sending status update of presence for user: %@, auth: %@ resulted in %@", buf, 0x2Au);

          v14 = v75;
          v15 = v74;
          v25 = contextb;
        }

        objc_autoreleasePoolPop(v71);
        v62 = v70 == 0;

        break;
      default:
        v25 = 0;
        v26 = 0;
        if (v9)
          goto LABEL_46;
        goto LABEL_43;
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v93 = v24;
      v94 = 2112;
      v95 = v13;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Presence authorization is %@, upgrading it to Authorized and will retry again", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    -[HMDUserPresenceFeeder _upgradePresenceAuth](v22, "_upgradePresenceAuth");
LABEL_34:
    v62 = 0;
  }

  return v62;
}

- (id)_sendPresenceAuthStatusForUser:(id)a3 presenceAuthStatus:(id)a4 presenceRegionStatus:(id)a5 presenceComputeStatus:(id)a6 reason:(id)a7
{
  NSObject *v12;
  HMDUserPresenceFeed *v13;
  HMDUserPresenceFeed *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  HMDUserPresenceFeeder *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  HMDUserPresenceFeeder *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  HMDUserPresenceFeed *v37;
  void *v38;
  void *v39;
  HMDUserPresenceFeeder *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  HMDUserPresenceFeed *v47;
  void *v48;
  void *v49;
  void *v50;
  HMDUserPresenceFeeder *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  HMDUserPresenceFeeder *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  HMDUserPresenceFeeder *v66;
  NSObject *v67;
  HMDUserPresenceFeed *v68;
  void *v69;
  HMDUserPresenceFeed *v70;
  void *v71;
  int v72;
  void *v73;
  HMDUserPresenceFeeder *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  HMDUserPresenceFeedSession *v78;
  HMDUserPresenceFeed *v79;
  void *v80;
  uint64_t v81;
  HMDUserPresenceFeed *v82;
  void *v83;
  HMDUserPresenceFeedSession *v84;
  NSObject *v85;
  HMDUserPresenceFeeder *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  void *v95;
  HMDUserPresenceFeed *v96;
  os_log_t log;
  os_log_t loga;
  NSObject *logb;
  os_log_t logc;
  HMDUserPresenceFeed *v101;
  HMDUserPresenceFeed *v102;
  id v103;
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  id v107;
  __int16 v108;
  HMDUserPresenceFeed *v109;
  __int16 v110;
  void *v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v103 = a4;
  v13 = (HMDUserPresenceFeed *)a5;
  v14 = (HMDUserPresenceFeed *)a6;
  v15 = a7;
  -[HMDHomePresenceBase home](self, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "homeManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "messageDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "residentDeviceManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "primaryResidentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "device");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v101 = v13;
    v30 = v12;
    v31 = (void *)MEMORY[0x1D17BA0A0]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = v20;
      v35 = v18;
      v36 = v15;
      v37 = v14;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v105 = v38;
      v106 = 2112;
      v107 = 0;
      _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Primary resident device %@ is not set, not notifying", buf, 0x16u);

      v14 = v37;
      v15 = v36;
      v18 = v35;
      v20 = v34;
      v21 = 0;
    }

    objc_autoreleasePoolPop(v31);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 91);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v30;
    goto LABEL_10;
  }
  if ((objc_msgSend(v20, "supportsSharedEventTriggerActivation") & 1) != 0)
  {
    v96 = v14;
    +[HMDLostModeManager sharedManager](HMDLostModeManager, "sharedManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isLost");

    v101 = v13;
    if (v23)
    {
      v24 = v12;
      v25 = (void *)MEMORY[0x1D17BA0A0]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v105 = v28;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Device Lost. Not sending presence feed", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v24;
      v14 = v96;
LABEL_10:
      v13 = v101;
      goto LABEL_36;
    }
    -[HMDUserPresenceFeeder currentFeedSession](self, "currentFeedSession");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v95 = v21;
    if (v49)
    {
      loga = v12;
      v50 = (void *)MEMORY[0x1D17BA0A0]();
      v51 = self;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v91 = v50;
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserPresenceFeeder currentFeedSession](v51, "currentFeedSession");
        v54 = v21;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v105 = v53;
        v106 = 2112;
        v107 = v55;
        _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_INFO, "%{public}@There is currently %@ active", buf, 0x16u);

        v21 = v54;
        v13 = v101;

        v50 = v91;
      }

      objc_autoreleasePoolPop(v50);
      -[HMDUserPresenceFeeder currentFeedSession](v51, "currentFeedSession");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "presenceAuthStatus");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if ((HMFEqualObjects() & 1) != 0)
      {
        -[HMDUserPresenceFeeder currentFeedSession](v51, "currentFeedSession");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "presenceRegionStatus");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = HMFEqualObjects();

        v21 = v95;
        v13 = v101;

        if (v92)
        {
          v60 = (void *)MEMORY[0x1D17BA0A0]();
          v61 = v51;
          HMFGetOSLogHandle();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDUserPresenceFeeder currentFeedSession](v61, "currentFeedSession");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v105 = v63;
            v106 = 2112;
            v107 = v64;
            _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_INFO, "%{public}@Current feed session %@ already contains same auth and region status, ignoring", buf, 0x16u);

            v21 = v95;
            v13 = v101;
          }

          objc_autoreleasePoolPop(v60);
          v29 = 0;
          v14 = v96;
          v12 = loga;
          goto LABEL_36;
        }
      }
      else
      {

      }
      v65 = (void *)MEMORY[0x1D17BA0A0]();
      v66 = v51;
      HMFGetOSLogHandle();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v93 = v65;
        v68 = v13;
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v105 = v69;
        v106 = 2112;
        v107 = v103;
        v108 = 2112;
        v109 = v68;
        v110 = 2112;
        v111 = v21;
        _os_log_impl(&dword_1CD062000, v67, OS_LOG_TYPE_INFO, "%{public}@Current feed session is different than newer one. [presenceAuth = %@], [presenceRegion : %@], [resident: %@]", buf, 0x2Au);

        v13 = v68;
        v65 = v93;
      }

      objc_autoreleasePoolPop(v65);
      v12 = loga;
    }
    v14 = v96;
    if (objc_msgSend(v15, "value") == 11)
    {
      v70 = -[HMDUserPresenceFeed initWithUser:presenceAuthStatus:presenceComputeStatus:presenceRegion:reason:]([HMDUserPresenceFeed alloc], "initWithUser:presenceAuthStatus:presenceComputeStatus:presenceRegion:reason:", v12, v103, v96, v13, v15);
      -[HMDUserPresenceFeeder lastSentFeed](self, "lastSentFeed");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "isEqual:", v70);

      if (v72)
      {
        v73 = (void *)MEMORY[0x1D17BA0A0]();
        v74 = self;
        HMFGetOSLogHandle();
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v94 = v73;
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDUserPresenceFeeder lastSentFeed](v74, "lastSentFeed");
          logb = v75;
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v105 = v76;
          v106 = 2112;
          v107 = v77;
          v108 = 2112;
          v109 = v70;
          _os_log_impl(&dword_1CD062000, logb, OS_LOG_TYPE_INFO, "%{public}@Last feed %@ is same as the new feed %@", buf, 0x20u);

          v75 = logb;
          v73 = v94;
        }

        objc_autoreleasePoolPop(v73);
LABEL_35:

        v29 = 0;
        v13 = v101;
        v21 = v95;
        goto LABEL_36;
      }

      v13 = v101;
    }
    v78 = [HMDUserPresenceFeedSession alloc];
    -[HMDHomePresenceBase workQueue](self, "workQueue");
    v79 = v13;
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomePresenceBase presenceMonitorMessageTargetUUID](self, "presenceMonitorMessageTargetUUID");
    v81 = objc_claimAutoreleasedReturnValue();
    v82 = v79;
    v83 = (void *)v81;
    v84 = -[HMDUserPresenceFeedSession initWithDelegate:workQueue:targetUUID:messageDispatcher:user:presenceAuthStatus:presenceComputeStatus:presenceRegionStatus:reason:](v78, "initWithDelegate:workQueue:targetUUID:messageDispatcher:user:presenceAuthStatus:presenceComputeStatus:presenceRegionStatus:reason:", self, v80, v81, v18, v12, v103, v96, v82, v15);
    -[HMDUserPresenceFeeder setCurrentFeedSession:](self, "setCurrentFeedSession:", v84);

    v85 = MEMORY[0x1D17BA0A0]();
    v86 = self;
    HMFGetOSLogHandle();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      logc = v85;
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserPresenceFeeder currentFeedSession](v86, "currentFeedSession");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v105 = v88;
      v106 = 2112;
      v107 = v89;
      v108 = 2112;
      v109 = v96;
      _os_log_impl(&dword_1CD062000, v87, OS_LOG_TYPE_INFO, "%{public}@Created new feed session %@ with new computed status : %@", buf, 0x20u);

      v85 = logc;
    }

    objc_autoreleasePoolPop(v85);
    -[HMDUserPresenceFeeder currentFeedSession](v86, "currentFeedSession");
    v70 = (HMDUserPresenceFeed *)objc_claimAutoreleasedReturnValue();
    -[HMDUserPresenceFeed send](v70, "send");
    goto LABEL_35;
  }
  log = v12;
  v39 = (void *)MEMORY[0x1D17BA0A0]();
  v40 = self;
  HMFGetOSLogHandle();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v102 = v13;
    v42 = v16;
    v43 = v21;
    v44 = v20;
    v45 = v18;
    v46 = v15;
    v47 = v14;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v105 = v48;
    v106 = 2112;
    v107 = v43;
    _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_INFO, "%{public}@Primary resident device %@ is not capable of presence status, not notifying", buf, 0x16u);

    v14 = v47;
    v15 = v46;
    v18 = v45;
    v20 = v44;
    v21 = v43;
    v16 = v42;
    v13 = v102;
  }

  objc_autoreleasePoolPop(v39);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 92);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = log;
LABEL_36:

  return v29;
}

- (void)_updatePresenceComputeStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  HMDUserPresenceFeeder *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDHomeModel *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDHomeModel *v17;
  void *v18;
  HMDUserPresenceFeeder *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomePresenceBase home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presenceComputeStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  if ((v7 & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "presenceComputeStatus");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v11;
      v31 = 2112;
      v32 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Presence compute status is not changing from %@", (uint8_t *)&v29, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v13 = [HMDHomeModel alloc];
    objc_msgSend(v5, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v13, "initWithObjectChangeType:uuid:parentUUID:", 2, v14, v16);

    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "presenceComputeStatus");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543874;
      v30 = v21;
      v31 = 2112;
      v32 = v22;
      v33 = 2112;
      v34 = v4;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Presence compute status is changing from %@ to %@", (uint8_t *)&v29, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(v4, "number");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeModel setPresenceComputeStatus:](v17, "setPresenceComputeStatus:", v23);

    objc_msgSend(MEMORY[0x1E0D285D0], "messageWithName:messagePayload:", CFSTR("kPresenceComputeStatusUpdate"), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backingStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "transaction:options:", v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "add:withMessage:", v17, v24);
    objc_msgSend(v28, "run");

  }
}

- (void)_handleLocationAuthorizationChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDUserPresenceFeeder *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDUserPresenceFeeder *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_numberForKey:", CFSTR("HMDLocationAuthorizationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "integerValue");
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMDLocationAuthorizationAsString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Latest Location Authorization is %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDUserPresenceFeeder _sendPresenceReport:](v8, "_sendPresenceReport:", 5);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@No location authorization key in the message", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)didEndFeedSession:(id)a3
{
  id v4;
  id v5;
  void *v6;
  HMDUserPresenceFeeder *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDUserPresenceFeed *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDUserPresenceFeed *v18;
  void *v19;
  HMDUserPresenceFeeder *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUserPresenceFeeder currentFeedSession](self, "currentFeedSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 == v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v11;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@%@ is complete", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDUserPresenceFeeder setCurrentFeedSession:](v7, "setCurrentFeedSession:", 0);
    v12 = [HMDUserPresenceFeed alloc];
    objc_msgSend(v4, "user");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presenceAuthStatus");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presenceComputeStatus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presenceRegionStatus");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reason");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HMDUserPresenceFeed initWithUser:presenceAuthStatus:presenceComputeStatus:presenceRegion:reason:](v12, "initWithUser:presenceAuthStatus:presenceComputeStatus:presenceRegion:reason:", v13, v14, v15, v16, v17);
    -[HMDUserPresenceFeeder setLastSentFeed:](v7, "setLastSentFeed:", v18);

    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v7;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserPresenceFeeder lastSentFeed](v20, "lastSentFeed");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v22;
      v26 = 2112;
      v27 = v23;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating last sent feed to %@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    -[HMDUserPresenceFeeder _startRefreshTimer](v20, "_startRefreshTimer");
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v10;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@%@ is not tracked", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)notifyDidArriveHome
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHomePresenceBase workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HMDUserPresenceFeeder_notifyDidArriveHome__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)notifyDidLeaveHome
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHomePresenceBase workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HMDUserPresenceFeeder_notifyDidLeaveHome__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)notifyDidEnterHomeRegion
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHomePresenceBase workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HMDUserPresenceFeeder_notifyDidEnterHomeRegion__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)notifyDidLeaveHomeRegion
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHomePresenceBase workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HMDUserPresenceFeeder_notifyDidLeaveHomeRegion__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (NSString)timerID
{
  return self->_timerID;
}

- (unint64_t)presenceRegionStatus
{
  return self->_presenceRegionStatus;
}

- (HMDUserPresenceFeedSession)currentFeedSession
{
  return self->_currentFeedSession;
}

- (void)setCurrentFeedSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentFeedSession, a3);
}

- (HMDUserPresenceFeed)lastSentFeed
{
  return self->_lastSentFeed;
}

- (void)setLastSentFeed:(id)a3
{
  objc_storeStrong((id *)&self->_lastSentFeed, a3);
}

- (int64_t)ckAccountStatus
{
  return self->_ckAccountStatus;
}

- (void)setCkAccountStatus:(int64_t)a3
{
  self->_ckAccountStatus = a3;
}

- (BOOL)isAccountStatusFetchInProgress
{
  return self->_isAccountStatusFetchInProgress;
}

- (void)setIsAccountStatusFetchInProgress:(BOOL)a3
{
  self->_isAccountStatusFetchInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSentFeed, 0);
  objc_storeStrong((id *)&self->_currentFeedSession, 0);
  objc_storeStrong((id *)&self->_timerID, 0);
}

void __49__HMDUserPresenceFeeder_notifyDidLeaveHomeRegion__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Did leave home region", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("HMDHomeRegionExitedNotificationKey"), v7);

}

void __49__HMDUserPresenceFeeder_notifyDidEnterHomeRegion__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Did enter home region", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("HMDHomeRegionEnteredNotificationKey"), v7);

}

uint64_t __43__HMDUserPresenceFeeder_notifyDidLeaveHome__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Did leave home", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("HMDHomeDidLeaveHomeNotificationKey"), v7);

  return objc_msgSend(*(id *)(a1 + 32), "setPresenceRegionStatus:", 2);
}

uint64_t __44__HMDUserPresenceFeeder_notifyDidArriveHome__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Did arrive home", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("HMDHomeDidArriveHomeNotificationKey"), v7);

  return objc_msgSend(*(id *)(a1 + 32), "setPresenceRegionStatus:", 1);
}

void __101__HMDUserPresenceFeeder__sendPresenceUpdateToResidentForUser_presenceAuthStatus_authChanging_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __101__HMDUserPresenceFeeder__sendPresenceUpdateToResidentForUser_presenceAuthStatus_authChanging_reason___block_invoke_2;
  v7[3] = &unk_1E89B6E60;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v12 = *(_BYTE *)(a1 + 64);
  v11 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __101__HMDUserPresenceFeeder__sendPresenceUpdateToResidentForUser_presenceAuthStatus_authChanging_reason___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@FMF Device Status is %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_sendPresenceUpdateToResidentForUser:presenceAuthStatus:authChanging:reason:fmfStatus:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
}

uint64_t __40__HMDUserPresenceFeeder_residentChanged__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Trying to send report after resident changed", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_sendPresenceReport:", 8);
}

uint64_t __44__HMDUserPresenceFeeder_presenceAuthChanged__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Trying to send report after presence auth changed", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_sendPresenceReport:", 9);
}

void __77__HMDUserPresenceFeeder_presenceAuthStatusChangedForUser_presenceAuthStatus___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  +[HMDUserPresenceUpdateReason reasonWithValue:](HMDUserPresenceUpdateReason, "reasonWithValue:", 9);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_sendPresenceUpdateToResidentForUser:presenceAuthStatus:authChanging:reason:", v2, v3, 1, v4);

}

uint64_t __54__HMDUserPresenceFeeder_handleTimerFiredNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Timer fired with ID: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_sendPresenceReport:", 7);
}

uint64_t __58__HMDUserPresenceFeeder_handleHomeDataLoadedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Received home data loaded notification, sending presence report", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_sendPresenceReport:", 3);
}

uint64_t __42__HMDUserPresenceFeeder_homeDataProcessed__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Home data has been processed, trying to send presence report", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_sendPresenceReport:", 11);
}

void __53__HMDUserPresenceFeeder_fmfStatusUpdateNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDFMF fmfStatusWithDict:](HMDFMF, "fmfStatusWithDict:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 40);
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
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Received FMF status update notification with %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "_sendPresenceReport:", 4);

}

void __66__HMDUserPresenceFeeder_fetchCKAccountStatusAndSendPresenceReport__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = WeakRetained;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543874;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@CK accountStatus completed with %@, %@", (uint8_t *)&v22, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (v8)
  {
    v12 = objc_msgSend(v8, "setIsAccountStatusFetchInProgress:", 0);
    if (v5)
    {
      v13 = (void *)MEMORY[0x1D17BA0A0](v12);
      v14 = v8;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v16;
        v24 = 2112;
        v25 = v5;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@CK accountStatus failed with error: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
    }
    else if (objc_msgSend(v8, "ckAccountStatus") != a2)
    {
      v17 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v8, "setCkAccountStatus:", a2));
      v18 = v8;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "ckAccountStatus"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v20;
        v24 = 2112;
        v25 = v21;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating the CK account status to %@. Sending the presence report", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(v18, "_sendPresenceReport:", 10);
    }
  }

}

uint64_t __52__HMDUserPresenceFeeder_accountAvailabilityChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchCKAccountStatusAndSendPresenceReport");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t45 != -1)
    dispatch_once(&logCategory__hmf_once_t45, &__block_literal_global_34044);
  return (id)logCategory__hmf_once_v46;
}

void __36__HMDUserPresenceFeeder_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v46;
  logCategory__hmf_once_v46 = v0;

}

@end
