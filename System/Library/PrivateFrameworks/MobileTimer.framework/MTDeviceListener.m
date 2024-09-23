@implementation MTDeviceListener

+ (id)sharedDeviceListener
{
  if (sharedDeviceListener_onceToken != -1)
    dispatch_once(&sharedDeviceListener_onceToken, &__block_literal_global_44);
  return (id)sharedDeviceListener__sharedDeviceListener;
}

void __40__MTDeviceListener_sharedDeviceListener__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedDeviceListener__sharedDeviceListener;
  sharedDeviceListener__sharedDeviceListener = v0;

}

- (MTDeviceListener)init
{
  MTDeviceListener *v2;
  uint64_t v3;
  NAScheduler *workScheduler;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTDeviceListener;
  v2 = -[MTDeviceListener init](&v6, sel_init);
  if (v2)
  {
    +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTDeviceUtilities.work-queue"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v3 = objc_claimAutoreleasedReturnValue();
    workScheduler = v2->_workScheduler;
    v2->_workScheduler = (NAScheduler *)v3;

  }
  return v2;
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.mobile.keybagd.first_unlock"), a4);
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  void (**v6)(_QWORD);
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  MTDeviceListener *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a5;
  MTLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = self;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ received notification", buf, 0xCu);
  }

  -[MTDeviceListener workScheduler](self, "workScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__MTDeviceListener_handleNotification_ofType_completion___block_invoke;
  v9[3] = &unk_1E39CB858;
  v9[4] = self;
  objc_msgSend(v8, "performBlock:", v9);

  if (v6)
    v6[2](v6);

}

void __57__MTDeviceListener_handleNotification_ofType_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_opt_class(), "_latestKeyBagValueForHasBeenUnlockedSinceBoot");
  objc_msgSend(*(id *)(a1 + 32), "setInternalHasBeenUnlockedSinceBoot:", v2);
  MTLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v10 = v5;
      v6 = "%{public}@ device has been unlocked";
LABEL_6:
      _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  else if (v4)
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v10 = v7;
    v6 = "%{public}@ device hasn't been unlocked";
    goto LABEL_6;
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MTDeviceListener_handleNotification_ofType_completion___block_invoke_7;
  block[3] = &unk_1E39CB858;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __57__MTDeviceListener_handleNotification_ofType_completion___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ posting MTDeviceHasBeenUnlockedForFirstTime notification", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("MTDeviceHasBeenUnlockedForFirstTime"), 0);

}

+ (BOOL)hasBeenUnlockedSinceBoot
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedDeviceListener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasBeenUnlockedSinceBoot");

  return v3;
}

- (BOOL)_hasBeenUnlockedSinceBoot
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v7[5];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = dispatch_semaphore_create(0);
  -[MTDeviceListener workScheduler](self, "workScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__MTDeviceListener__hasBeenUnlockedSinceBoot__block_invoke;
  v7[3] = &unk_1E39CEAE8;
  v7[4] = self;
  v9 = &v10;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "performBlock:", v7);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v4) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

intptr_t __45__MTDeviceListener__hasBeenUnlockedSinceBoot__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "internalHasBeenUnlockedSinceBoot") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setInternalHasBeenUnlockedSinceBoot:", objc_msgSend((id)objc_opt_class(), "_latestKeyBagValueForHasBeenUnlockedSinceBoot"));
    MTLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(void **)(a1 + 32);
      v5 = 138543618;
      v6 = v3;
      v7 = 1024;
      v8 = objc_msgSend(v3, "internalHasBeenUnlockedSinceBoot");
      _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Found initial hasBeenUnlockedSinceBoot value of [%d]", (uint8_t *)&v5, 0x12u);
    }

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "internalHasBeenUnlockedSinceBoot");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (BOOL)_latestKeyBagValueForHasBeenUnlockedSinceBoot
{
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v2 = (uint64_t (*)(void))getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  v11 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke;
    v7[3] = &unk_1E39CB690;
    v7[4] = &v8;
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke((uint64_t)v7);
    v2 = (uint64_t (*)(void))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
    +[MTDeviceListener _latestKeyBagValueForHasBeenUnlockedSinceBoot].cold.1();
  v3 = v2();
  v4 = v3;
  if ((v3 & 0x80000000) == 0)
    return (_DWORD)v3 == 1;
  MTLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    +[MTDeviceListener _latestKeyBagValueForHasBeenUnlockedSinceBoot].cold.2(v4, v6);

  return 0;
}

- (void)printDiagnostics
{
  NSObject *v2;
  NSObject *v3;
  int v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(6);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5[0]) = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "-----MTDeviceListener-----", (uint8_t *)v5, 2u);
  }

  MTLogForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend((id)objc_opt_class(), "hasBeenUnlockedSinceBoot");
    v5[0] = 67240192;
    v5[1] = v4;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "Unlocked since boot: %{public}d", (uint8_t *)v5, 8u);
  }

}

- (id)gatherDiagnostics
{
  int v2;
  const __CFString *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("Unlocked since boot");
  v2 = objc_msgSend((id)objc_opt_class(), "hasBeenUnlockedSinceBoot");
  v3 = CFSTR("NO");
  if (v2)
    v3 = CFSTR("YES");
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NAScheduler)workScheduler
{
  return self->_workScheduler;
}

- (void)setWorkScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_workScheduler, a3);
}

- (BOOL)internalHasBeenUnlockedSinceBoot
{
  return self->_internalHasBeenUnlockedSinceBoot;
}

- (void)setInternalHasBeenUnlockedSinceBoot:(BOOL)a3
{
  self->_internalHasBeenUnlockedSinceBoot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workScheduler, 0);
}

+ (void)_latestKeyBagValueForHasBeenUnlockedSinceBoot
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_ERROR, "Received an error when calling MKBDeviceUnlockedSinceBoot().  Error code: [%@]", (uint8_t *)&v4, 0xCu);

}

@end
