@implementation LNUnlockService

- (LNUnlockService)initWithQueue:(id)a3
{
  id v5;
  LNUnlockService *v6;
  LNUnlockService *v7;
  SBSLockScreenService *v8;
  SBSLockScreenService *service;
  LNUnlockService *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LNUnlockService;
  v6 = -[LNUnlockService init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (SBSLockScreenService *)objc_alloc_init(MEMORY[0x1E0DAAF00]);
    service = v7->_service;
    v7->_service = v8;

    v10 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[LNUnlockService service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)LNUnlockService;
  -[LNUnlockService dealloc](&v4, sel_dealloc);
}

- (void)requestUnlockIfNeeded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[4];
  id v21;
  uint8_t buf[8];
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getLNLogCategoryConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_INFO, "Device unlock requested", buf, 2u);
  }

  v23 = CFSTR("ExtendedDeviceLockState");
  v24[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MKBGetDeviceLockState();
  if (v7)
  {
    if (v7 != 3)
    {
      if (v7 == 6)
      {
        getLNLogCategoryConnection();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v9 = "Requesting passcode unlock UI: device in assert delay";
LABEL_16:
          _os_log_impl(&dword_1A18F6000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
        }
      }
      else
      {
        getLNLogCategoryConnection();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v9 = "Requesting passcode unlock UI";
          goto LABEL_16;
        }
      }

      -[LNUnlockService service](self, "service");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_opt_new();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __41__LNUnlockService_requestUnlockIfNeeded___block_invoke_6;
      v18[3] = &unk_1E45DDA58;
      v18[4] = self;
      v19 = v4;
      v17 = v4;
      objc_msgSend(v15, "requestPasscodeUnlockUIWithOptions:withCompletion:", v16, v18);

      v14 = v19;
      goto LABEL_18;
    }
    getLNLogCategoryConnection();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v11 = "Unlocking device is not required: key bag is disabled";
      goto LABEL_12;
    }
  }
  else
  {
    getLNLogCategoryConnection();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v11 = "Unlocking device is not required: device is unlocked";
LABEL_12:
      _os_log_impl(&dword_1A18F6000, v10, OS_LOG_TYPE_INFO, v11, buf, 2u);
    }
  }

  -[LNUnlockService queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__LNUnlockService_requestUnlockIfNeeded___block_invoke;
  block[3] = &unk_1E45DDA08;
  v21 = v4;
  v13 = v4;
  dispatch_async(v12, block);

  v14 = v21;
LABEL_18:

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (SBSLockScreenService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __41__LNUnlockService_requestUnlockIfNeeded___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __41__LNUnlockService_requestUnlockIfNeeded___block_invoke_6(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  char v10;
  uint8_t buf[16];

  getLNLogCategoryConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      v6 = "Successfully unlocked";
LABEL_6:
      _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_INFO, v6, buf, 2u);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    v6 = "Failed to unlock device";
    goto LABEL_6;
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__LNUnlockService_requestUnlockIfNeeded___block_invoke_7;
  v8[3] = &unk_1E45DDA30;
  v9 = *(id *)(a1 + 40);
  v10 = a2;
  dispatch_async(v7, v8);

}

uint64_t __41__LNUnlockService_requestUnlockIfNeeded___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

+ (BOOL)isDeviceLocked
{
  return MKBGetDeviceLockState() - 1 < 2;
}

@end
