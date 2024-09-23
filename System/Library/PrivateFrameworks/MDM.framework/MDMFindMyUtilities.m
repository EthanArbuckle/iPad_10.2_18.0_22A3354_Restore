@implementation MDMFindMyUtilities

+ (void)lockDevice
{
  SBSSpringBoardServerPort();
  JUMPOUT(0x22767C6E4);
}

+ (id)lockDeviceWithMessage:(id)a3 phoneNumber:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  const __CFString *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  objc_msgSend(a1, "lockDevice");
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isMultiUser");

  if ((v9 & 1) != 0 || !(v6 | v7))
  {
    v16 = CFSTR("Success");
  }
  else
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setMessage:", v6);
    objc_msgSend(v10, "setPhoneNumber:", v7);
    objc_msgSend(v10, "setLostModeEnabled:", 1);
    objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enableLostModeWithInfo:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = v13;
        objc_msgSend(v12, "DMCVerboseDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v15;
        _os_log_impl(&dword_222CB9000, v14, OS_LOG_TYPE_ERROR, "MDMFindMyUtilities failed to set lock screen message with error: %{public}@", (uint8_t *)&v18, 0xCu);

      }
      if (objc_msgSend(v12, "code") == 7)
      {
        v16 = CFSTR("NoPasscodeSet");
      }
      else if (objc_msgSend(v12, "code") == 8)
      {
        v16 = CFSTR("DeviceInLostMode");
      }
      else
      {
        v16 = CFSTR("Unknown");
      }
    }
    else
    {
      v16 = CFSTR("Success");
    }

  }
  return (id)v16;
}

+ (BOOL)isManagedLostModeActive
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isManagedLostModeActive");

  return v3;
}

+ (void)enableManagedLostModeWithMessage:(id)a3 phoneNumber:(id)a4 footnoteText:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(id, _QWORD);
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t v20[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x24BE31CC0];
  v14 = (void (**)(id, _QWORD))a6;
  objc_msgSend(v13, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isManagedLostModeActive");

  if (v16)
  {
    v17 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_222CB9000, v17, OS_LOG_TYPE_DEFAULT, "MDMFindMyUtilities ignoring MDM Lost Mode request because Lost Mode is already enabled", v20, 2u);
    }
    v14[2](v14, 0);

  }
  else
  {
    objc_msgSend(a1, "lockDevice");
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "setLostModeEnabled:", 1);
    objc_msgSend(v18, "setMessage:", v10);
    objc_msgSend(v18, "setPhoneNumber:", v11);
    objc_msgSend(v18, "setFootnoteText:", v12);
    objc_msgSend(v18, "setDisableSlideToUnlock:", 1);
    objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "enableManagedLostModeWithInfo:completion:", v18, v14);

  }
}

+ (BOOL)isActivationLockOn
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v6[4];
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v2 = dispatch_semaphore_create(0);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__MDMFindMyUtilities_isActivationLockOn__block_invoke;
  v6[3] = &unk_24EB682F0;
  v8 = &v9;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "isActivationLockedWithCompletion:", v6);

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __40__MDMFindMyUtilities_isActivationLockOn__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_ERROR, "MDMFindMyUtilities failed to get activation lock state with error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (void)enableActivationLockWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__MDMFindMyUtilities_enableActivationLockWithCompletion___block_invoke;
  v6[3] = &unk_24EB68340;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "fmipStateWithCompletion:", v6);

}

void __57__MDMFindMyUtilities_enableActivationLockWithCompletion___block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void (*v7)(void);
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v5;
      _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_ERROR, "Could not get device locator state. Error: %{public}@", buf, 0xCu);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_10:
    v7();
    goto LABEL_11;
  }
  if (a2 >= 2)
  {
    v9 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_ERROR, "FindMy is off. returning...", buf, 2u);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__MDMFindMyUtilities_enableActivationLockWithCompletion___block_invoke_10;
  v10[3] = &unk_24EB680F8;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v8, "isActivationLockedWithCompletion:", v10);

LABEL_11:
}

void __57__MDMFindMyUtilities_enableActivationLockWithCompletion___block_invoke_10(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void (*v7)(void);
  _BOOL4 v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(NSObject **)(DMCLogObjects() + 8);
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v5;
      _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_ERROR, "Could not get activation lock state. Error: %{public}@", buf, 0xCu);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_9:
    v7();
    goto LABEL_10;
  }
  v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_DEFAULT, "Device is activation locked already. Returning...", buf, 2u);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_9;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_DEFAULT, "Enabling activation lock...", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__MDMFindMyUtilities_enableActivationLockWithCompletion___block_invoke_11;
  v10[3] = &unk_24EB68318;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v9, "enableActivationLockWithCompletion:", v10);

LABEL_10:
}

void __57__MDMFindMyUtilities_enableActivationLockWithCompletion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_ERROR, "Could not enable activation lock. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_DEFAULT, "Activation lock enabled.", (uint8_t *)&v6, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
