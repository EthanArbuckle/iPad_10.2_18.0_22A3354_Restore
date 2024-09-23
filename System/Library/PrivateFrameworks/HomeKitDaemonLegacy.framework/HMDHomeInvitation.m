@implementation HMDHomeInvitation

- (HMDHomeInvitation)initWithInvitationData:(id)a3 forHome:(id)a4
{
  id v7;
  id v8;
  HMDHomeInvitation *v9;
  HMDHomeInvitation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHomeInvitation;
  v9 = -[HMDHomeInvitation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_invitationData, a3);
    objc_storeWeak((id *)&v10->_home, v8);
    -[HMDHomeInvitation _configureTimer](v10, "_configureTimer");
  }

  return v10;
}

- (BOOL)refreshDisplayName
{
  return 0;
}

- (HMDHomeInvitation)initWithCoder:(id)a3
{
  return -[HMDHomeInvitation initWithCoder:invitationData:](self, "initWithCoder:invitationData:", a3, 0);
}

- (HMDHomeInvitation)initWithCoder:(id)a3 invitationData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomeInvitation *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMDHomeInvitation initWithInvitationData:forHome:](self, "initWithInvitationData:forHome:", v6, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDHomeInvitation home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v5, CFSTR("home"));

  -[HMDHomeInvitation invitationData](self, "invitationData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.invitationData"));

}

- (NSUUID)identifier
{
  void *v2;
  void *v3;

  -[HMDHomeInvitation invitationData](self, "invitationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSDate)startDate
{
  void *v2;
  void *v3;

  -[HMDHomeInvitation invitationData](self, "invitationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;

  -[HMDHomeInvitation invitationData](self, "invitationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setEndDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDHomeInvitation invitationData](self, "invitationData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEndDate:", v4);

}

- (int64_t)invitationState
{
  void *v2;
  int64_t v3;

  -[HMDHomeInvitation invitationData](self, "invitationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "invitationState");

  return v3;
}

- (BOOL)isExpired
{
  return -[HMDHomeInvitation invitationState](self, "invitationState") == 6;
}

- (BOOL)isPending
{
  return -[HMDHomeInvitation invitationState](self, "invitationState") == 2
      || -[HMDHomeInvitation invitationState](self, "invitationState") == 5;
}

- (BOOL)isAccepted
{
  return -[HMDHomeInvitation invitationState](self, "invitationState") == 3
      || -[HMDHomeInvitation invitationState](self, "invitationState") == 5;
}

- (BOOL)isDeclined
{
  return -[HMDHomeInvitation invitationState](self, "invitationState") == 4;
}

- (void)updateInvitationState:(int64_t)a3
{
  id v4;

  -[HMDHomeInvitation invitationData](self, "invitationData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInvitationState:", a3);

}

- (void)updateTimer:(unint64_t)a3 clientQueue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  -[HMDHomeInvitation resolutionHandler](self, "resolutionHandler");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDHomeInvitation expirationHandler](self, "expirationHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeInvitation _clearTimer](self, "_clearTimer");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeInvitation setEndDate:](self, "setEndDate:", v8);

  -[HMDHomeInvitation _configureTimer](self, "_configureTimer");
  -[HMDHomeInvitation setClientQueue:](self, "setClientQueue:", v6);

  -[HMDHomeInvitation setResolutionHandler:](self, "setResolutionHandler:", v9);
  -[HMDHomeInvitation setExpirationHandler:](self, "setExpirationHandler:", v7);

}

- (void)accept
{
  -[HMDHomeInvitation _resolve:](self, "_resolve:", 1);
}

- (void)decline
{
  -[HMDHomeInvitation _resolve:](self, "_resolve:", 0);
}

- (void)expire
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _BYTE location[12];
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[HMDHomeInvitation isPending](self, "isPending"))
  {
    -[HMDHomeInvitation updateInvitationState:](self, "updateInvitationState:", 6);
    -[HMDHomeInvitation clientQueue](self, "clientQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_initWeak((id *)location, self);
      -[HMDHomeInvitation clientQueue](self, "clientQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __27__HMDHomeInvitation_expire__block_invoke;
      v9[3] = &unk_1E89BE218;
      objc_copyWeak(&v10, (id *)location);
      v9[4] = self;
      dispatch_async(v4, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v5 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeInvitation identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v7;
        v12 = 2112;
        v13 = v8;
        _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Not calling invitation (%@) expiration handler, no client queue set", location, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
      -[HMDHomeInvitation _clearTimer](self, "_clearTimer");
    }
  }
}

- (void)_configureTimer
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  -[HMDHomeInvitation endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  if (v6 <= 3.0)
  {
    -[HMDHomeInvitation expire](self, "expire");
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, v6);
    -[HMDHomeInvitation setTimer:](self, "setTimer:", v7);

    -[HMDHomeInvitation timer](self, "timer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

    -[HMDHomeInvitation timer](self, "timer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resume");

  }
}

- (void)_clearTimer
{
  void *v3;
  void *v4;

  -[HMDHomeInvitation timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDHomeInvitation timer](self, "timer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suspend");

    -[HMDHomeInvitation setTimer:](self, "setTimer:", 0);
  }
  -[HMDHomeInvitation setClientQueue:](self, "setClientQueue:", 0);
  -[HMDHomeInvitation setResolutionHandler:](self, "setResolutionHandler:", 0);
  -[HMDHomeInvitation setExpirationHandler:](self, "setExpirationHandler:", 0);
}

- (void)_resolve:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  id v13;
  BOOL v14;
  _BYTE location[12];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  if (-[HMDHomeInvitation isPending](self, "isPending"))
  {
    if (v3)
      v5 = 3;
    else
      v5 = 4;
    -[HMDHomeInvitation updateInvitationState:](self, "updateInvitationState:", v5);
    -[HMDHomeInvitation clientQueue](self, "clientQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_initWeak((id *)location, self);
      -[HMDHomeInvitation clientQueue](self, "clientQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __30__HMDHomeInvitation__resolve___block_invoke;
      block[3] = &unk_1E89B90E8;
      objc_copyWeak(&v13, (id *)location);
      v14 = v3;
      block[4] = self;
      dispatch_async(v7, block);

      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeInvitation identifier](self, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v10;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Not calling invitation (%@) resolution handler, no client queue set", location, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      -[HMDHomeInvitation _clearTimer](self, "_clearTimer");
    }
  }
}

- (id)describeWithFormat
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDHomeInvitation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeInvitation startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeInvitation endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA548], "homeInvitationStateDescription:", -[HMDHomeInvitation invitationState](self, "invitationState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeInvitation home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(IV), identifier = %@, startDate = %@, endDate = %@, state = %@, home = %@  "), v5, v6, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setInvitationState:(int64_t)a3
{
  self->_invitationState = a3;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (HMHomeInvitationData)invitationData
{
  return self->_invitationData;
}

- (void)setInvitationData:(id)a3
{
  objc_storeStrong((id *)&self->_invitationData, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (id)resolutionHandler
{
  return self->_resolutionHandler;
}

- (void)setResolutionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)expirationHandler
{
  return self->_expirationHandler;
}

- (void)setExpirationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (HMFTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (NSArray)operations
{
  return self->_operations;
}

- (void)setOperations:(id)a3
{
  objc_storeStrong((id *)&self->_operations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_expirationHandler, 0);
  objc_storeStrong(&self->_resolutionHandler, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_invitationData, 0);
  objc_destroyWeak((id *)&self->_home);
}

void __30__HMDHomeInvitation__resolve___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "resolutionHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v5;
    if (v3)
    {
      objc_msgSend(v5, "resolutionHandler");
      v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v4[2](v4, *(unsigned __int8 *)(a1 + 48));

      objc_msgSend(*(id *)(a1 + 32), "_clearTimer");
      WeakRetained = v5;
    }
  }

}

void __27__HMDHomeInvitation_expire__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained
    && (objc_msgSend(WeakRetained, "expirationHandler"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Calling invitation (%@) expiration handler", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v3, "expirationHandler");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Not calling invitation (%@) expiration handler, not set", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  objc_msgSend(*(id *)(a1 + 32), "_clearTimer");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
