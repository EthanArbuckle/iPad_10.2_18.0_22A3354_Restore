@implementation DIDevice

- (DIDevice)init
{
  DIDevice *v2;
  DIDevice *v3;
  NSString *name;
  uint64_t v5;
  NSDate *stateExpiration;
  NSString *stateReason;
  uint64_t v8;
  NSRecursiveLock *lock;
  DIDeviceStateUpdateThrottler *v10;
  DIDeviceStateUpdateThrottler *stateUpdateThrottler;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DIDevice;
  v2 = -[DIDevice init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_250B97E20;

    v3->_state = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v5 = objc_claimAutoreleasedReturnValue();
    stateExpiration = v3->_stateExpiration;
    v3->_stateExpiration = (NSDate *)v5;

    stateReason = v3->_stateReason;
    v3->_stateReason = (NSString *)CFSTR("unknown");

    v3->_isCurrentDevice = 0;
    v8 = objc_opt_new();
    lock = v3->_lock;
    v3->_lock = (NSRecursiveLock *)v8;

    v10 = -[DIDeviceStateUpdateThrottler initWithThrottleTimeInterval:]([DIDeviceStateUpdateThrottler alloc], "initWithThrottleTimeInterval:", 10.0);
    stateUpdateThrottler = v3->_stateUpdateThrottler;
    v3->_stateUpdateThrottler = v10;

  }
  return v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  DILogHandleDevice();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = &stru_250B97E20;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_23A742000, v5, OS_LOG_TYPE_DEFAULT, "%@Delegate set to %@", (uint8_t *)&v6, 0x16u);
  }

}

- (BOOL)isEqual:(id)a3
{
  DIDevice *v4;
  DIDevice *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (DIDevice *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DIDevice homeKitIdentifier](self, "homeKitIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DIDevice homeKitIdentifier](v5, "homeKitIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);
      if ((v8 & 1) != 0)
        goto LABEL_4;
      -[DIDevice homeKitIdentifier](self, "homeKitIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v11 = 0;
LABEL_18:

        goto LABEL_19;
      }
      -[DIDevice homeKitIdentifier](v5, "homeKitIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
LABEL_4:
        -[DIDevice homeKitHomeIdentifier](self, "homeKitHomeIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[DIDevice homeKitHomeIdentifier](v5, "homeKitHomeIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqual:", v10) & 1) != 0)
        {

          v11 = 1;
          if ((v8 & 1) != 0)
            goto LABEL_19;
        }
        else
        {
          -[DIDevice homeKitHomeIdentifier](self, "homeKitHomeIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {

            v11 = 0;
            if ((v8 & 1) != 0)
              goto LABEL_19;
          }
          else
          {
            -[DIDevice homeKitHomeIdentifier](v5, "homeKitHomeIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v15 == 0;

            if ((v8 & 1) != 0)
            {
LABEL_19:

              goto LABEL_20;
            }
          }
        }
      }
      else
      {

        v11 = 0;
      }
      v12 = 0;
      goto LABEL_18;
    }
    v11 = 0;
  }
LABEL_20:

  return v11;
}

- (void)setStateExpiration:(id)a3
{
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  DIOneshotTimer *v17;
  DIOneshotTimer *v18;
  _QWORD v19[5];
  id v20;
  id location;

  v5 = a3;
  objc_storeStrong((id *)&self->_stateExpiration, a3);
  -[DIDevice setTimer:](self, "setTimer:", 0);
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v9;

  if (v7 > v10)
  {
    objc_msgSend(v5, "timeIntervalSinceNow");
    v12 = v11;
    -[DIDevice homeKitIdentifier](self, "homeKitIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = (id)objc_opt_new();
    v16 = v15;

    objc_initWeak(&location, self);
    v17 = [DIOneshotTimer alloc];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __31__DIDevice_setStateExpiration___block_invoke;
    v19[3] = &unk_250B965B0;
    objc_copyWeak(&v20, &location);
    v19[4] = self;
    v18 = -[DIOneshotTimer initWithInterval:queue:identifier:label:handler:](v17, "initWithInterval:queue:identifier:label:handler:", 0, v16, CFSTR("DeviceExpiration"), v19, v12);
    -[DIDevice setTimer:](self, "setTimer:", v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
}

uint64_t __31__DIDevice_setStateExpiration___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v5[5];
  uint8_t buf[4];
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];

  DILogHandleDevice();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = &stru_250B97E20;
    _os_log_impl(&dword_23A742000, v2, OS_LOG_TYPE_DEFAULT, "%@Drop In availability expired: updating state to unavailable.", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__DIDevice_setStateExpiration___block_invoke_28;
  v5[3] = &unk_250B96588;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "di_synchronize:", v5);

  objc_msgSend(*(id *)(a1 + 32), "notifyDeviceDidChange");
  return objc_msgSend(*(id *)(a1 + 32), "notifyDidUpdateState");
}

uint64_t __31__DIDevice_setStateExpiration___block_invoke_28(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setStateReason:", CFSTR("Drop In Availability Expired"));
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[DIDevice homeKitIdentifier](self, "homeKitIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;

  v15 = (void *)MEMORY[0x24BDD17C8];
  v14 = objc_opt_class();
  -[DIDevice name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIDevice homeKitHomeIdentifier](self, "homeKitHomeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIDevice homeKitIdentifier](self, "homeKitIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DIDevice stringForDeviceState:](DIDevice, "stringForDeviceState:", -[DIDevice state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIDevice stateReason](self, "stateReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIDevice stateExpiration](self, "stateExpiration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[DIDevice isCurrentDevice](self, "isCurrentDevice");
  -[DIDevice connectionManager](self, "connectionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIDevice delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p> Nm = %@, HmID = %@, AccID = %@, St = %@, Rsn = %@, Exp: %@, IsCurrDev = %d, ConnMgr = %p, Delegate = %@"), v14, self, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  DIDevice *v11;

  v4 = (void *)objc_opt_new();
  -[DIDevice lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __25__DIDevice_copyWithZone___block_invoke;
  v9[3] = &unk_250B96438;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_msgSend(v5, "di_synchronize:", v9);

  v7 = v6;
  return v7;
}

void __25__DIDevice_copyWithZone___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", v2);

  objc_msgSend(*(id *)(a1 + 40), "connectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setConnectionManager:", v3);

  objc_msgSend(*(id *)(a1 + 40), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setName:", v4);

  objc_msgSend(*(id *)(a1 + 40), "homeKitIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHomeKitIdentifier:", v5);

  objc_msgSend(*(id *)(a1 + 40), "homeKitHomeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHomeKitHomeIdentifier:", v6);

  objc_msgSend(*(id *)(a1 + 40), "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setIdsIdentifier:", v7);

  objc_msgSend(*(id *)(a1 + 32), "setIsCurrentDevice:", objc_msgSend(*(id *)(a1 + 40), "isCurrentDevice"));
  objc_msgSend(*(id *)(a1 + 32), "setState:", objc_msgSend(*(id *)(a1 + 40), "state"));
  objc_msgSend(*(id *)(a1 + 40), "stateReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStateReason:", v8);

  objc_msgSend(*(id *)(a1 + 40), "stateExpiration");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 72);
  *(_QWORD *)(v10 + 72) = v9;

}

+ (id)stringForDeviceState:(int64_t)a3
{
  const __CFString *v3;

  if ((unint64_t)(a3 - 1) > 2)
    v3 = CFSTR("Drop In State Unknown");
  else
    v3 = off_250B96668[a3 - 1];
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%lu) %@"), a3, v3);
}

- (void)updateState:(int64_t)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  DIDevice *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  DILogHandleDevice();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = _Block_copy(v9);
    *(_DWORD *)buf = 138413058;
    v27 = &stru_250B97E20;
    v28 = 2048;
    v29 = a3;
    v30 = 2112;
    v31 = v11;
    v32 = 2112;
    v33 = self;
    _os_log_impl(&dword_23A742000, v10, OS_LOG_TYPE_DEBUG, "%@Requesting state update to %ld. Handler = %@, Device = %@", buf, 0x2Au);

  }
  if (-[DIDevice isCurrentDevice](self, "isCurrentDevice"))
  {
    -[DIDevice stateUpdateThrottler](self, "stateUpdateThrottler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __49__DIDevice_updateState_reason_completionHandler___block_invoke_2;
    v21[3] = &unk_250B96600;
    v21[4] = self;
    v22 = v9;
    v13 = v9;
    objc_msgSend(v12, "handleState:reason:handler:", a3, v8, v21);

    v14 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.dropin"), 2, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    DILogHandleDevice();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v27 = &stru_250B97E20;
      v28 = 2112;
      v29 = (int64_t)v15;
      _os_log_impl(&dword_23A742000, v16, OS_LOG_TYPE_ERROR, "%@Attempting to update state for non-current device %@", buf, 0x16u);
    }

    -[DIDevice connectionManager](self, "connectionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "manager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "clientQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __49__DIDevice_updateState_reason_completionHandler___block_invoke;
    v23[3] = &unk_250B962E8;
    v24 = v15;
    v25 = v9;
    v14 = v15;
    v20 = v9;
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v19, v23);

  }
}

uint64_t __49__DIDevice_updateState_reason_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __49__DIDevice_updateState_reason_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  DILogHandleDevice();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = _Block_copy(*(const void **)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      v30 = &stru_250B97E20;
      v31 = 2112;
      v32 = v10;
      _os_log_impl(&dword_23A742000, v9, OS_LOG_TYPE_DEBUG, "%@Throttled State Update Request. Handler = %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "connectionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "manager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __49__DIDevice_updateState_reason_completionHandler___block_invoke_46;
    v27[3] = &unk_250B965D8;
    v28 = *(id *)(a1 + 40);
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v13, v27);

    v14 = v28;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = _Block_copy(*(const void **)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      v30 = &stru_250B97E20;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_23A742000, v9, OS_LOG_TYPE_DEFAULT, "%@Allowing State Update Request. Handler = %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "connectionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "manager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "connection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __49__DIDevice_updateState_reason_completionHandler___block_invoke_47;
    v25[3] = &unk_250B96310;
    v20 = *(void **)(a1 + 40);
    v25[4] = *(_QWORD *)(a1 + 32);
    v26 = v20;
    objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = __49__DIDevice_updateState_reason_completionHandler___block_invoke_2_50;
    v23[3] = &unk_250B96310;
    v22 = *(void **)(a1 + 40);
    v23[4] = *(_QWORD *)(a1 + 32);
    v24 = v22;
    objc_msgSend(v21, "updateState:reason:completionHandler:", a2, v7, v23);

    v14 = v26;
  }

}

uint64_t __49__DIDevice_updateState_reason_completionHandler___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__DIDevice_updateState_reason_completionHandler___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  DILogHandleDevice();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v14 = &stru_250B97E20;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_23A742000, v4, OS_LOG_TYPE_ERROR, "%@Failed to update state %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "connectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__DIDevice_updateState_reason_completionHandler___block_invoke_48;
  v10[3] = &unk_250B962E8;
  v8 = *(id *)(a1 + 40);
  v11 = v3;
  v12 = v8;
  v9 = v3;
  +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v7, v10);

}

uint64_t __49__DIDevice_updateState_reason_completionHandler___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __49__DIDevice_updateState_reason_completionHandler___block_invoke_2_50(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    DILogHandleDevice();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = &stru_250B97E20;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_23A742000, v4, OS_LOG_TYPE_ERROR, "%@Failed to update state %@", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "connectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__DIDevice_updateState_reason_completionHandler___block_invoke_51;
  v10[3] = &unk_250B962E8;
  v8 = *(id *)(a1 + 40);
  v11 = v3;
  v12 = v8;
  v9 = v3;
  +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v7, v10);

}

uint64_t __49__DIDevice_updateState_reason_completionHandler___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)notifyDeviceDidChange
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[DIDevice delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[DIDevice connectionManager](self, "connectionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __33__DIDevice_notifyDeviceDidChange__block_invoke;
    v8[3] = &unk_250B96588;
    v8[4] = self;
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v7, v8);

  }
}

void __33__DIDevice_notifyDeviceDidChange__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceDidChange:", *(_QWORD *)(a1 + 32));

  DILogHandleDevice();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412546;
    v6 = &stru_250B97E20;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_23A742000, v3, OS_LOG_TYPE_DEFAULT, "%@Call delegate device did change %@", (uint8_t *)&v5, 0x16u);
  }

}

- (void)notifyDidUpdateState
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[DIDevice delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[DIDevice connectionManager](self, "connectionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __32__DIDevice_notifyDidUpdateState__block_invoke;
    v8[3] = &unk_250B96588;
    v8[4] = self;
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v7, v8);

  }
}

void __32__DIDevice_notifyDidUpdateState__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device:didUpdateState:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "state"));

  DILogHandleDevice();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "state");
    v5 = 138412546;
    v6 = &stru_250B97E20;
    v7 = 2048;
    v8 = v4;
    _os_log_impl(&dword_23A742000, v3, OS_LOG_TYPE_DEFAULT, "%@Call delegate did update state %ld", (uint8_t *)&v5, 0x16u);
  }

}

- (void)updateWithDevice:(id)a3 updateState:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  DIDevice *v15;
  id v16;
  _BYTE *v17;
  BOOL v18;
  _BYTE buf[24];
  id v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  DILogHandleDevice();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = &stru_250B97E20;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    v20 = v6;
    _os_log_impl(&dword_23A742000, v7, OS_LOG_TYPE_DEFAULT, "%@Update device:\n%@\n\nWith other device:\n%@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v20 = 0;
  -[DIDevice lock](self, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __41__DIDevice_updateWithDevice_updateState___block_invoke;
  v14 = &unk_250B96628;
  v15 = self;
  v9 = v6;
  v18 = v4;
  v16 = v9;
  v17 = buf;
  objc_msgSend(v8, "di_synchronize:", &v11);

  -[DIDevice notifyDeviceDidChange](self, "notifyDeviceDidChange", v11, v12, v13, v14, v15);
  if (v4)
  {
    v10 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
    if (v10 != -[DIDevice state](self, "state"))
      -[DIDevice notifyDidUpdateState](self, "notifyDidUpdateState");
  }

  _Block_object_dispose(buf, 8);
}

void __41__DIDevice_updateWithDevice_updateState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 40), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setName:", v2);

  objc_msgSend(*(id *)(a1 + 40), "homeKitIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHomeKitIdentifier:", v3);

  objc_msgSend(*(id *)(a1 + 40), "homeKitHomeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHomeKitHomeIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 40), "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setIdsIdentifier:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setIsCurrentDevice:", objc_msgSend(*(id *)(a1 + 40), "isCurrentDevice"));
  if (*(_BYTE *)(a1 + 56))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "state");
    objc_msgSend(*(id *)(a1 + 32), "setState:", objc_msgSend(*(id *)(a1 + 40), "state"));
    objc_msgSend(*(id *)(a1 + 40), "stateReason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setStateReason:", v6);

    objc_msgSend(*(id *)(a1 + 40), "stateExpiration");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setStateExpiration:", v7);

  }
}

- (void)refreshStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  -[DIDevice connectionManager](self, "connectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__DIDevice_refreshStateWithCompletionHandler___block_invoke;
  v14[3] = &unk_250B96310;
  v14[4] = self;
  v9 = v4;
  v15 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __46__DIDevice_refreshStateWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_250B96310;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "requestStateForDevice:completionHandler:", self, v12);

}

void __46__DIDevice_refreshStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  DILogHandleDevice();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v15 = &stru_250B97E20;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v3;
    _os_log_impl(&dword_23A742000, v4, OS_LOG_TYPE_ERROR, "%@Failed to request state for device %@, error = %@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "connectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46__DIDevice_refreshStateWithCompletionHandler___block_invoke_57;
  v11[3] = &unk_250B962E8;
  v9 = *(id *)(a1 + 40);
  v12 = v3;
  v13 = v9;
  v10 = v3;
  +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v8, v11);

}

uint64_t __46__DIDevice_refreshStateWithCompletionHandler___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __46__DIDevice_refreshStateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  DILogHandleDevice();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v21 = &stru_250B97E20;
      v22 = 2112;
      v23 = v3;
      v24 = 2112;
      v25 = v6;
      v7 = "%@Failed to refresh state for device. Error = %@, Device = %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 32;
LABEL_6:
      _os_log_impl(&dword_23A742000, v8, v9, v7, buf, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v21 = &stru_250B97E20;
    v22 = 2112;
    v23 = v11;
    v7 = "%@Refreshed state for device %@";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 22;
    goto LABEL_6;
  }

  objc_msgSend(*(id *)(a1 + 32), "connectionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "manager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __46__DIDevice_refreshStateWithCompletionHandler___block_invoke_58;
  v17[3] = &unk_250B962E8;
  v15 = *(id *)(a1 + 40);
  v18 = v3;
  v19 = v15;
  v16 = v3;
  +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v14, v17);

}

uint64_t __46__DIDevice_refreshStateWithCompletionHandler___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  DIDevice *v9;

  v4 = a3;
  -[DIDevice lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __28__DIDevice_encodeWithCoder___block_invoke;
  v7[3] = &unk_250B96438;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "di_synchronize:", v7);

}

void __28__DIDevice_encodeWithCoder___block_invoke(uint64_t a1)
{
  void *v2;
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
  id v13;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "encodeObject:forKey:", v3, CFSTR("Name"));

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "homeKitIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HomeKitIdentifier"));

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "homeKitHomeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("HomeKitHomeIdentifier"));

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "idsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v9, CFSTR("IDSIdentifier"));

  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", objc_msgSend(*(id *)(a1 + 40), "isCurrentDevice"), CFSTR("IsCurrentDevice"));
  objc_msgSend(*(id *)(a1 + 32), "encodeInteger:forKey:", objc_msgSend(*(id *)(a1 + 40), "state"), CFSTR("State"));
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "stateReason");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v11, CFSTR("StateReason"));

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "stateExpiration");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v13, CFSTR("StateExpiration"));

}

- (DIDevice)initWithCoder:(id)a3
{
  id v4;
  DIDevice *v5;
  DIDevice *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *stateReason;
  NSString *v11;
  uint64_t v12;
  NSUUID *homeKitIdentifier;
  uint64_t v14;
  NSUUID *homeKitHomeIdentifier;
  uint64_t v16;
  NSUUID *idsIdentifier;

  v4 = a3;
  v5 = -[DIDevice init](self, "init");
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Name"));
  v6 = (DIDevice *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_storeStrong((id *)&v5->_name, v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StateExpiration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      objc_storeStrong((id *)&v5->_stateExpiration, v7);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StateReason"));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        stateReason = v5->_stateReason;
        v5->_stateReason = v9;
        v11 = v9;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HomeKitIdentifier"));
        v12 = objc_claimAutoreleasedReturnValue();
        homeKitIdentifier = v5->_homeKitIdentifier;
        v5->_homeKitIdentifier = (NSUUID *)v12;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HomeKitHomeIdentifier"));
        v14 = objc_claimAutoreleasedReturnValue();
        homeKitHomeIdentifier = v5->_homeKitHomeIdentifier;
        v5->_homeKitHomeIdentifier = (NSUUID *)v14;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IDSIdentifier"));
        v16 = objc_claimAutoreleasedReturnValue();
        idsIdentifier = v5->_idsIdentifier;
        v5->_idsIdentifier = (NSUUID *)v16;

        v5->_isCurrentDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsCurrentDevice"));
        v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("State"));

LABEL_6:
        v6 = v5;
        goto LABEL_9;
      }

    }
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (DIDeviceDelegate)delegate
{
  return (DIDeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)homeKitIdentifier
{
  return self->_homeKitIdentifier;
}

- (void)setHomeKitIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSUUID)homeKitHomeIdentifier
{
  return self->_homeKitHomeIdentifier;
}

- (void)setHomeKitHomeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSUUID)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)stateReason
{
  return self->_stateReason;
}

- (void)setStateReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)stateExpiration
{
  return self->_stateExpiration;
}

- (BOOL)isCurrentDevice
{
  return self->_isCurrentDevice;
}

- (void)setIsCurrentDevice:(BOOL)a3
{
  self->_isCurrentDevice = a3;
}

- (DIXPCConnectionManager)connectionManager
{
  return (DIXPCConnectionManager *)objc_loadWeakRetained((id *)&self->_connectionManager);
}

- (void)setConnectionManager:(id)a3
{
  objc_storeWeak((id *)&self->_connectionManager, a3);
}

- (DIOneshotTimer)timer
{
  return (DIOneshotTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (DIDeviceStateUpdateThrottler)stateUpdateThrottler
{
  return self->_stateUpdateThrottler;
}

- (NSRecursiveLock)lock
{
  return (NSRecursiveLock *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_stateUpdateThrottler, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_connectionManager);
  objc_storeStrong((id *)&self->_stateExpiration, 0);
  objc_storeStrong((id *)&self->_stateReason, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitHomeIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
