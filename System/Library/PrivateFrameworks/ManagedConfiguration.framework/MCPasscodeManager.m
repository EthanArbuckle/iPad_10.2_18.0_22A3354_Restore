@implementation MCPasscodeManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_46);
  return (id)sharedManager_obj_0;
}

- (BOOL)isPasscodeSet
{
  return MKBGetDeviceLockState() != 3;
}

void __34__MCPasscodeManager_sharedManager__block_invoke()
{
  objc_class *v0;
  id v1;
  void *v2;

  v0 = NSClassFromString(CFSTR("MCPasscodeManagerWriter"));
  if (!v0)
    v0 = (objc_class *)MCPasscodeManager;
  v1 = objc_alloc_init(v0);
  v2 = (void *)sharedManager_obj_0;
  sharedManager_obj_0 = (uint64_t)v1;

}

+ (BOOL)isDeviceUnlocked
{
  int v2;

  v2 = MKBGetDeviceLockState();
  return v2 == 3 || v2 == 0;
}

+ (id)deviceLockedError
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArrayByDevice(CFSTR("PASSCODE_ERROR_DEVICE_CPLOCKED"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPasscodeErrorDomain"), 5010, v9, CFSTR("MCFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_currentPublicPasscodeDict
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCPasscodeManager _publicPasscodeDictForUser:](self, "_publicPasscodeDictForUser:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_publicPasscodeDictForUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "userMode") == 1)
    v7 = objc_msgSend(v5, "isSharedIPad");
  else
    v7 = 0;

  v17 = 0;
  objc_msgSend(v5, "keybagOpaqueDataForUser:withError:", v4, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (v9)
  {
    v10 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v9;
      _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_ERROR, "Cannot read public passcode metadata for current user: %{public}@", buf, 0xCu);
    }
  }
  if (!objc_msgSend(v8, "length") || (-[MCPasscodeManager isPasscodeSet](self, "isPasscodeSet") | v7) != 1)
  {
    v11 = 0;
    if (!v7)
      goto LABEL_17;
    goto LABEL_15;
  }
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v8, 0, 0, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  if (v12)
  {
    v13 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v12;
      _os_log_impl(&dword_19ECC4000, v13, OS_LOG_TYPE_ERROR, "Cannot read public passcode metadata: %{public}@", buf, 0xCu);
    }
  }

  if (v7)
  {
LABEL_15:
    if (!objc_msgSend(v11, "count"))
    {
      +[MCPasscodeUtilities defaultPublicDictionaryForUMUserPasscodeType:](MCPasscodeUtilities, "defaultPublicDictionaryForUMUserPasscodeType:", objc_msgSend(v4, "passcodeType"));
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v14;
    }
  }
LABEL_17:

  return v11;
}

- (id)_filterPublicPasscodeDict:(id)a3 forGeneration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "userMode") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSharedIPad") ^ 1;

  }
  else
  {
    v10 = 1;
  }

  if (MCGestaltHasSEP() && (v10 & 1) != 0)
  {
    if (v7)
    {
      objc_msgSend(v7, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (id)v12;
      if (v6 && !v12)
      {
        v14 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          v17 = 138543362;
          v18 = v7;
          _os_log_impl(&dword_19ECC4000, v14, OS_LOG_TYPE_ERROR, "Missing data for passcode generation %{public}@. Attempting to recover data", (uint8_t *)&v17, 0xCu);
        }
        -[MCPasscodeManager _fixUpPublicPasscodeDict:](self, "_fixUpPublicPasscodeDict:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v11);
        v13 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = v6;
  }

  return v13;
}

- (id)_fixUpPublicPasscodeDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  uint8_t buf[16];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[5];

  v54[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && -[MCPasscodeManager isPasscodeSet](self, "isPasscodeSet"))
  {
    objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userMode") == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isSharedIPad");

      v8 = v7 ^ 1;
    }
    else
    {
      v8 = 1;
    }

    v10 = MCGestaltHasSEP() & v8;
    MCKeybagCurrentPasscodeGeneration();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 == 1 && !v11)
    {
      v13 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19ECC4000, v13, OS_LOG_TYPE_ERROR, "Unable to determine current passcode generation", buf, 2u);
      }
      v9 = v4;
      goto LABEL_37;
    }
    objc_msgSend(v11, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v9 = v4;
LABEL_36:

LABEL_37:
      goto LABEL_38;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyboardType"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = &unk_1E4212B08;
    if (v16)
      v18 = (void *)v16;
    v19 = v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("simpleType"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = &unk_1E4212B20;
    if (v20)
      v22 = (void *)v20;
    v23 = v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("creationDate"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      -[MCPasscodeManager _privatePasscodeDictWithOutError:](self, "_privatePasscodeDictWithOutError:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = v25;
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("characteristics"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = v27;
          objc_msgSend(v27, "objectForKeyedSubscript:", v14);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v23;
          v31 = v29;
          if (!v29)
            v29 = v28;
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("timestamp"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = v30;
          if (v24)
            goto LABEL_27;
        }
        else
        {

        }
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_27:
    v9 = (id)objc_opt_new();
    v53[0] = CFSTR("keyboardType");
    v53[1] = CFSTR("simpleType");
    v54[0] = v19;
    v54[1] = v23;
    v49 = v23;
    v53[2] = CFSTR("creationDate");
    v54[2] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v32, v14);
      MCKeybagMementoPasscodeGeneration();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v34)
      {
        objc_msgSend(v34, "stringValue");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recoveryKeyboardType"));
        v36 = objc_claimAutoreleasedReturnValue();
        v48 = v19;
        v37 = (void *)v36;
        v38 = &unk_1E4212B08;
        if (v36)
          v38 = (void *)v36;
        v45 = v38;

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recoverySimpleType"));
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v39;
        v41 = &unk_1E4212B20;
        if (v39)
          v41 = (void *)v39;
        v42 = v41;

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = CFSTR("keyboardType");
        v51[1] = CFSTR("simpleType");
        v52[0] = v45;
        v52[1] = v42;
        v51[2] = CFSTR("creationDate");
        v52[2] = v46;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "setObject:forKeyedSubscript:", v43, v47);
        v19 = v48;

      }
    }
    else
    {
      v35 = v9;
      v9 = (id)objc_msgSend(v32, "mutableCopy");
    }

    goto LABEL_36;
  }
  v9 = 0;
LABEL_38:

  return v9;
}

- (id)_privatePasscodeDictWithOutError:(id *)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v20;

  v20 = 0;
  +[MCKeychain dataFromService:account:label:description:group:useSystemKeychain:outError:](MCKeychain, "dataFromService:account:label:description:group:useSystemKeychain:outError:", CFSTR("com.apple.managedconfiguration"), CFSTR("Private"), 0, 0, 0, 0, &v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v20;
  v14 = v6;
  if (a3 && v6)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("PASSCODE_ERROR_CANNOT_RETRIEVE_CHARACTERISTICS"), v7, v8, v9, v10, v11, v12, v13, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCPasscodeErrorDomain"), 5020, v16, v14, CFSTR("MCFatalError"));
    v17 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v5)
    {
      v17 = 0;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v5, 2, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && !-[MCPasscodeManager isPasscodeSet](self, "isPasscodeSet"))
      objc_msgSend(v18, "setObject:forKeyedSubscript:", 0, CFSTR("characteristics"));
    v16 = (id)objc_msgSend(v18, "copy");

    v17 = v16;
  }

LABEL_10:
  return v17;
}

- (id)_filterPasscodeCharacteristics:(id)a3 forGeneration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "userMode") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSharedIPad") ^ 1;

  }
  else
  {
    v10 = 1;
  }

  if (MCGestaltHasSEP() && v10)
  {
    if (v7)
    {
      objc_msgSend(v7, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (id)v12;
      if (v6 && !v12)
      {
        v14 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          v17 = 138543362;
          v18 = v7;
          _os_log_impl(&dword_19ECC4000, v14, OS_LOG_TYPE_ERROR, "Missing characteristics for passcode generation %{public}@. Attempting to recover data", (uint8_t *)&v17, 0xCu);
        }
        -[MCPasscodeManager _fixUpPasscodeCharacteristics:](self, "_fixUpPasscodeCharacteristics:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v11);
        v13 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = v6;
  }

  return v13;
}

- (id)_fixUpPasscodeCharacteristics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint8_t v17[8];
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && -[MCPasscodeManager isPasscodeSet](self, "isPasscodeSet"))
  {
    objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userMode") == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isSharedIPad") ^ 1;

    }
    else
    {
      v7 = 1;
    }

    if (MCGestaltHasSEP() && (v7 & 1) != 0)
    {
      MCKeybagCurrentPasscodeGeneration();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "stringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v8 = v4;
        }
        else
        {
          v16 = (void *)objc_msgSend(v4, "MCMutableDeepCopy");
          objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, CFSTR("timestamp"));
          v18 = v12;
          v19[0] = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
          v8 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v15 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_ERROR, "Unable to determine current passcode generation", v17, 2u);
        }
        v8 = v4;
      }

    }
    else
    {
      v14 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_19ECC4000, v14, OS_LOG_TYPE_DEFAULT, "Passcode generation not supported. Nothing to migrate", v17, 2u);
      }
      v8 = v4;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)lockDeviceImmediately:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = _MCLogObjects;
  v5 = os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEFAULT, "Locking device immediately.", buf, 2u);
    }
    MKBLockDeviceNow();
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEFAULT, "Locking device.", v6, 2u);
    }
    MKBLockDevice();
  }
}

- (void)lockDevice
{
  -[MCPasscodeManager lockDeviceImmediately:](self, "lockDeviceImmediately:", 0);
}

- (BOOL)isDeviceLocked
{
  return !+[MCPasscodeManager isDeviceUnlocked](MCPasscodeManager, "isDeviceUnlocked");
}

- (id)_wrongPasscodeError
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("PASSCODE_ERROR_WRONG_PASSCODE"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPasscodeErrorDomain"), 5011, v9, CFSTR("MCFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)unlockDeviceWithPasscode:(id)a3 outError:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  int v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  BOOL v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_INFO, "Unlocking device with passcode.", (uint8_t *)&v23, 2u);
  }
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (MKBGetDeviceLockState() == 3)
  {
    v9 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      v10 = "MobileKeyBag is disabled.";
      v11 = v9;
      v12 = OS_LOG_TYPE_ERROR;
LABEL_15:
      _os_log_impl(&dword_19ECC4000, v11, v12, v10, (uint8_t *)&v23, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  v13 = MKBUnlockDevice();
  v14 = _MCLogObjects;
  if (!v13)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      v10 = "Successfully unlocked device with passcode.";
      v11 = v14;
      v12 = OS_LOG_TYPE_INFO;
      goto LABEL_15;
    }
LABEL_16:

    v16 = 0;
LABEL_17:
    v21 = 1;
    goto LABEL_18;
  }
  v15 = v13;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v23 = 67109120;
    LODWORD(v24) = v15;
    _os_log_impl(&dword_19ECC4000, v14, OS_LOG_TYPE_ERROR, "Failed to unlock device with passcode with MKB status: %d", (uint8_t *)&v23, 8u);
  }
  -[MCPasscodeManager _wrongPasscodeError](self, "_wrongPasscodeError");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_17;
  v17 = objc_msgSend(v6, "length");
  v18 = _MCLogObjects;
  if (v17)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v19 = v18;
      objc_msgSend(v16, "MCVerboseDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v20;
      _os_log_impl(&dword_19ECC4000, v19, OS_LOG_TYPE_ERROR, "Could not unlock device. Error: %{public}@", (uint8_t *)&v23, 0xCu);

    }
  }
  else if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_19ECC4000, v18, OS_LOG_TYPE_INFO, "Device is locked with a passcode.", (uint8_t *)&v23, 2u);
  }
  if (a4)
  {
    v16 = objc_retainAutorelease(v16);
    v21 = 0;
    *a4 = v16;
  }
  else
  {
    v21 = 0;
  }
LABEL_18:

  return v21;
}

+ (id)generateSalt
{
  uint32_t v3;

  v3 = arc4random();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int)defaultNewPasscodeEntrySimplePasscodeType
{
  return 0;
}

- (int)currentUnlockScreenType
{
  MCPasscodeManager *v2;
  void *v3;

  v2 = self;
  -[MCPasscodeManager _currentPublicPasscodeDict](self, "_currentPublicPasscodeDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = -[MCPasscodeManager unlockScreenTypeWithPublicPasscodeDict:isRecovery:](v2, "unlockScreenTypeWithPublicPasscodeDict:isRecovery:", v3, 0);

  return (int)v2;
}

- (int)recoveryPasscodeUnlockScreenType
{
  MCPasscodeManager *v2;
  void *v3;

  v2 = self;
  -[MCPasscodeManager _currentPublicPasscodeDict](self, "_currentPublicPasscodeDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = -[MCPasscodeManager unlockScreenTypeWithPublicPasscodeDict:isRecovery:](v2, "unlockScreenTypeWithPublicPasscodeDict:isRecovery:", v3, 1);

  return (int)v2;
}

- (int)unlockScreenTypeForUser:(id)a3
{
  MCPasscodeManager *v3;
  void *v4;

  v3 = self;
  -[MCPasscodeManager _publicPasscodeDictForUser:](self, "_publicPasscodeDictForUser:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = -[MCPasscodeManager unlockScreenTypeWithPublicPasscodeDict:isRecovery:](v3, "unlockScreenTypeWithPublicPasscodeDict:isRecovery:", v4, 0);

  return (int)v3;
}

- (int)unlockScreenTypeWithPublicPasscodeDict:(id)a3 isRecovery:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  v6 = a3;
  if (a4)
    MCKeybagMementoPasscodeGeneration();
  else
    MCKeybagCurrentPasscodeGeneration();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCPasscodeManager _filterPublicPasscodeDict:forGeneration:](self, "_filterPublicPasscodeDict:forGeneration:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("keyboardType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = objc_msgSend(v9, "intValue");
  else
    v11 = 2;

  return v11;
}

- (int)currentUnlockSimplePasscodeType
{
  MCPasscodeManager *v2;
  void *v3;

  v2 = self;
  -[MCPasscodeManager _currentPublicPasscodeDict](self, "_currentPublicPasscodeDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = -[MCPasscodeManager unlockSimplePasscodeTypeWithPublicPasscodeDict:isRecovery:](v2, "unlockSimplePasscodeTypeWithPublicPasscodeDict:isRecovery:", v3, 0);

  return (int)v2;
}

- (int)unlockSimplePasscodeTypeForUser:(id)a3
{
  MCPasscodeManager *v3;
  void *v4;

  v3 = self;
  -[MCPasscodeManager _publicPasscodeDictForUser:](self, "_publicPasscodeDictForUser:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = -[MCPasscodeManager unlockSimplePasscodeTypeWithPublicPasscodeDict:isRecovery:](v3, "unlockSimplePasscodeTypeWithPublicPasscodeDict:isRecovery:", v4, 0);

  return (int)v3;
}

- (int)recoveryPasscodeUnlockSimplePasscodeType
{
  MCPasscodeManager *v2;
  void *v3;

  v2 = self;
  -[MCPasscodeManager _currentPublicPasscodeDict](self, "_currentPublicPasscodeDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = -[MCPasscodeManager unlockSimplePasscodeTypeWithPublicPasscodeDict:isRecovery:](v2, "unlockSimplePasscodeTypeWithPublicPasscodeDict:isRecovery:", v3, 1);

  return (int)v2;
}

- (int)unlockSimplePasscodeTypeWithPublicPasscodeDict:(id)a3 isRecovery:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  v4 = a4;
  v6 = a3;
  if (v4)
    MCKeybagMementoPasscodeGeneration();
  else
    MCKeybagCurrentPasscodeGeneration();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCPasscodeManager _filterPublicPasscodeDict:forGeneration:](self, "_filterPublicPasscodeDict:forGeneration:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("simpleType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "intValue");
  }
  else if (-[MCPasscodeManager unlockScreenTypeWithPublicPasscodeDict:isRecovery:](self, "unlockScreenTypeWithPublicPasscodeDict:isRecovery:", v6, v4))
  {
    v11 = -1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int)newPasscodeEntryScreenType
{
  return -[MCPasscodeManager _minimumPasscodeEntryScreenTypeWithOutSimplePasscodeType:](self, "_minimumPasscodeEntryScreenTypeWithOutSimplePasscodeType:", 0);
}

- (int)newPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3
{
  return -[MCPasscodeManager _newPasscodeEntryScreenTypeWithOutSimplePasscodeType:shouldBeMinimum:](self, "_newPasscodeEntryScreenTypeWithOutSimplePasscodeType:shouldBeMinimum:", a3, 1);
}

- (int)defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3
{
  return -[MCPasscodeManager _newPasscodeEntryScreenTypeWithOutSimplePasscodeType:shouldBeMinimum:](self, "_newPasscodeEntryScreenTypeWithOutSimplePasscodeType:shouldBeMinimum:", a3, 0);
}

- (int)_newPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3 shouldBeMinimum:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v7;
  int v8;
  int v9;
  int HasBiometricCapability;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  int v19;

  v4 = a4;
  v19 = -1;
  v7 = -[MCPasscodeManager _minimumPasscodeEntryScreenTypeWithOutSimplePasscodeType:](self, "_minimumPasscodeEntryScreenTypeWithOutSimplePasscodeType:", &v19);
  if (v7)
  {
    if (v4)
      goto LABEL_18;
  }
  else
  {
    if (v4)
    {
      v8 = v19;
      if (v8 <= +[MCPasscodeManager defaultNewPasscodeEntrySimplePasscodeType](MCPasscodeManager, "defaultNewPasscodeEntrySimplePasscodeType"))v9 = +[MCPasscodeManager defaultNewPasscodeEntrySimplePasscodeType](MCPasscodeManager, "defaultNewPasscodeEntrySimplePasscodeType");
      else
        v9 = v19;
      v7 = 0;
      v19 = v9;
      goto LABEL_18;
    }
    HasBiometricCapability = MCGestaltHasBiometricCapability();
    v11 = v19;
    if (HasBiometricCapability)
    {
      if (v19 <= 1)
        v11 = 1;
    }
    else
    {
      v11 = v19 & ~(v19 >> 31);
    }
    v19 = v11;
  }
  MCKeybagCurrentPasscodeGeneration();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCPasscodeManager _currentPublicPasscodeDict](self, "_currentPublicPasscodeDict");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCPasscodeManager _filterPublicPasscodeDict:forGeneration:](self, "_filterPublicPasscodeDict:forGeneration:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("keyboardType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = objc_msgSend(v15, "intValue");
    if (v7 <= v17)
      v7 = v17;
  }

LABEL_18:
  if (a3)
    *a3 = v19;
  return v7;
}

- (int)_minimumPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectiveValueForSetting:", CFSTR("passcodeKeyboardComplexity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "currentRestrictions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[MCPasscodeManager unlockScreenTypeForRestrictions:outSimplePasscodeType:](MCPasscodeManager, "unlockScreenTypeForRestrictions:outSimplePasscodeType:", v7, a3);

  if (v6 > v8)
    v8 = v6;

  return v8;
}

+ (int)unlockScreenTypeForPasscodeCharacteristics:(id)a3
{
  return +[MCPasscodeManager unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:](MCPasscodeManager, "unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:", a3, 0);
}

+ (int)unlockScreenTypeForPasscodeCharacteristics:(id)a3 outSimplePasscodeType:(int *)a4
{
  id v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;

  v5 = a3;
  v6 = +[MCPasscodeManager defaultNewPasscodeEntrySimplePasscodeType](MCPasscodeManager, "defaultNewPasscodeEntrySimplePasscodeType");
  objc_msgSend(v5, "objectForKey:", CFSTR("length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  if (v8)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("allDigits"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
    {
      if (v8 == 4)
      {
        v6 = 0;
        v8 = 0;
        goto LABEL_10;
      }
      if (v8 == 6)
      {
        v8 = 0;
        v6 = 1;
        goto LABEL_10;
      }
      v8 = 1;
    }
    else
    {
      v8 = 2;
    }
    v6 = -1;
  }
LABEL_10:
  if (a4)
    *a4 = v6;

  return v8;
}

+ (int)unlockScreenTypeForRestrictions:(id)a3
{
  return +[MCPasscodeManager unlockScreenTypeForRestrictions:outSimplePasscodeType:](MCPasscodeManager, "unlockScreenTypeForRestrictions:outSimplePasscodeType:", a3, 0);
}

+ (int)unlockScreenTypeForRestrictions:(id)a3 outSimplePasscodeType:(int *)a4
{
  id v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v11;
  int v12;
  int v13;

  v5 = a3;
  v6 = +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("requireAlphanumeric"), v5);
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("minComplexChars"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("minLength"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == 1 || v8 != 0)
  {
    v11 = 2;
LABEL_6:
    v12 = -1;
    goto LABEL_12;
  }
  if (!v9 || (v13 = objc_msgSend(v9, "unsignedIntValue"), v13 == 4))
  {
    v12 = 0;
    v11 = 0;
  }
  else
  {
    if (v13 != 6)
    {
      v11 = 1;
      goto LABEL_6;
    }
    v11 = 0;
    v12 = 1;
  }
LABEL_12:
  if (a4)
    *a4 = v12;

  return v11;
}

- (id)localizedDescriptionOfPasscodePolicy
{
  void *v2;
  void *v3;
  void *v4;

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRestrictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCPasscodeManager localizedDescriptionOfPasscodePolicyFromRestrictions:](MCPasscodeManager, "localizedDescriptionOfPasscodePolicyFromRestrictions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedDescriptionOfDefaultNewPasscodePolicy
{
  void *v2;
  void *v3;
  void *v4;

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRestrictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCPasscodeManager localizedDescriptionOfDefaultNewPasscodePolicyFromRestrictions:](MCPasscodeManager, "localizedDescriptionOfDefaultNewPasscodePolicyFromRestrictions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)localizedDescriptionOfPasscodePolicyFromRestrictions:(id)a3
{
  return (id)objc_msgSend(a1, "_localizedDescriptionOfPasscodePolicyFromRestrictions:shouldBeDefault:", a3, 0);
}

+ (id)localizedDescriptionOfDefaultNewPasscodePolicyFromRestrictions:(id)a3
{
  return (id)objc_msgSend(a1, "_localizedDescriptionOfPasscodePolicyFromRestrictions:shouldBeDefault:", a3, 1);
}

+ (id)_localizedDescriptionOfPasscodePolicyFromRestrictions:(id)a3 shouldBeDefault:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __CFString *v32;
  uint64_t v33;
  void *v35;
  int v36;

  v4 = a4;
  v5 = a3;
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("minLength"), v5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "unsignedIntValue");
  +[MCRestrictionManager defaultValueForSetting:](MCRestrictionManager, "defaultValueForSetting:", CFSTR("minLength"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unsignedIntValue");

  +[MCRestrictionManager minimumValueForSetting:](MCRestrictionManager, "minimumValueForSetting:", CFSTR("minLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unsignedIntValue");

  v8 = +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowSimple"), v5);
  v9 = +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("requireAlphanumeric"), v5);
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("minComplexChars"), v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v18 = objc_msgSend(v10, "unsignedIntValue");
  else
    v18 = 0;
  if (v9 == 1)
  {
    if (v8 == 2)
      MCLocalizedFormat(CFSTR("PASSCODE_CHARACTERS_STRONG"), v11, v12, v13, v14, v15, v16, v17, v18);
    else
      MCLocalizedFormat(CFSTR("PASSCODE_CHARACTERS"), v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_10;
  }
  if (v8 != 2)
  {
    v36 = 0;
    +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v4)
      v23 = objc_msgSend(v21, "defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", &v36);
    else
      v23 = objc_msgSend(v21, "minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", &v36);
    v24 = v23;
    v20 = v35;

    if (!(v18 | v24))
    {
      if (!v36)
      {
        v32 = CFSTR("PASSCODE_4_DIGIT");
        goto LABEL_20;
      }
      if (v36 == 1)
      {
        v32 = CFSTR("PASSCODE_6_DIGIT");
LABEL_20:
        MCLocalizedString(v32);
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
    }
    MCLocalizedFormat(CFSTR("PASSCODE_DIGITS"), v25, v26, v27, v28, v29, v30, v31, v18);
    v33 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v19 = (void *)v33;
    goto LABEL_22;
  }
  MCLocalizedFormat(CFSTR("PASSCODE_DIGITS_STRONG"), v11, v12, v13, v14, v15, v16, v17, v18);
LABEL_10:
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v35;
LABEL_22:

  return v19;
}

+ (BOOL)restrictionsEnforcePasscodePolicy:(id)a3
{
  id v3;
  BOOL v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowSimple"), v3) == 2|| +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("forcePIN"), v3) == 2|| +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("requireAlphanumeric"), v3) == 2)
  {
    v4 = 1;
  }
  else
  {
    +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("minLength"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)objc_msgSend(v6, "intValue") <= 4)
    {
      +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("pinHistory"), v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v4 = 1;
      }
      else
      {
        +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("maxFailedAttempts"), v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v4 = 1;
        }
        else
        {
          +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("minComplexChars"), v3);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v4 = 1;
          }
          else
          {
            +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("maxPINAgeInDays"), v3);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = v10 != 0;

          }
        }

      }
    }
    else
    {
      v4 = 1;
    }

  }
  return v4;
}

- (BOOL)passcode:(id)a3 compliesWithPolicyCheckHistory:(BOOL)a4 outError:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentRestrictions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = +[MCPasscodeManager passcode:compliesWithPolicyFromRestrictions:checkHistory:outError:](MCPasscodeManager, "passcode:compliesWithPolicyFromRestrictions:checkHistory:outError:", v7, v9, v6, a5);
  return (char)a5;
}

+ (BOOL)passcode:(id)a3 compliesWithPolicyFromRestrictions:(id)a4 checkHistory:(BOOL)a5 outError:(id *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  int v13;
  BOOL v14;
  void *v15;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  +[MCPasscodeManager characteristicsDictionaryFromPasscode:](MCPasscodeManager, "characteristicsDictionaryFromPasscode:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(a1, "_passcodeCharacteristics:creationDate:compliesWithPolicyFromRestrictions:outError:", v12, 0, v11, a6);
  if (v13)
    v14 = !v7;
  else
    v14 = 1;
  if (!v14)
  {
    +[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v15, "_checkPasscode:againstHistoryWithRestrictions:outError:", v10, v11, a6);

  }
  return v13;
}

- (BOOL)currentPasscodeCompliesWithPolicyFromRestrictions:(id)a3 outError:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t v21[16];
  id v22;
  id v23;

  v6 = a3;
  if (+[MCPasscodeManager isDeviceUnlocked](MCPasscodeManager, "isDeviceUnlocked")
    || (+[MCPasscodeManager deviceLockedError](MCPasscodeManager, "deviceLockedError"),
        (v7 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v23 = 0;
    -[MCPasscodeManager _privatePasscodeDictWithOutError:](self, "_privatePasscodeDictWithOutError:", &v23);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v23;
    if (v7
      || !+[MCPasscodeManager isDeviceUnlocked](MCPasscodeManager, "isDeviceUnlocked")
      && (+[MCPasscodeManager deviceLockedError](MCPasscodeManager, "deviceLockedError"),
          (v7 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      MCKeybagCurrentPasscodeGeneration();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("characteristics"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCPasscodeManager _filterPasscodeCharacteristics:forGeneration:](self, "_filterPasscodeCharacteristics:forGeneration:", v17, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCPasscodeManager passcodeCreationDate](self, "passcodeCreationDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      +[MCPasscodeManager _passcodeCharacteristics:creationDate:compliesWithPolicyFromRestrictions:outError:](MCPasscodeManager, "_passcodeCharacteristics:creationDate:compliesWithPolicyFromRestrictions:outError:", v18, v19, v6, &v22);
      v7 = v22;

      if (!v7)
        goto LABEL_22;
    }
  }
  if (a4)
    *a4 = objc_retainAutorelease(v7);
  objc_msgSend(v7, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("MCPasscodeErrorDomain")))
  {
    v10 = objc_msgSend(v7, "code");

    if (v10 == 5010)
    {
      v11 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        v12 = "Device was locked when passcode compliance check was attempted.";
LABEL_16:
        _os_log_impl(&dword_19ECC4000, v11, OS_LOG_TYPE_DEFAULT, v12, v21, 2u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
  else
  {

  }
  objc_msgSend(v7, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("MCPasscodeErrorDomain")))
  {
    v14 = objc_msgSend(v7, "code");

    if (v14 == 5020)
    {
      v11 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        v12 = "Unable to retrieve passcode characteristics when compliance check was attempted.";
        goto LABEL_16;
      }
LABEL_22:
      v15 = 1;
      goto LABEL_23;
    }
  }
  else
  {

  }
  v15 = 0;
LABEL_23:

  return v15;
}

- (BOOL)isCurrentPasscodeCompliantOutError:(id *)a3
{
  void *v5;
  void *v6;

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentRestrictions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = -[MCPasscodeManager currentPasscodeCompliesWithPolicyFromRestrictions:outError:](self, "currentPasscodeCompliesWithPolicyFromRestrictions:outError:", v6, a3);
  return (char)a3;
}

- (BOOL)isPasscodeCompliantWithNamedPolicy:(id)a3 outError:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  char v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v6;
    _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_DEFAULT, "Checking for passcode compliance against named policy: %@", buf, 0xCu);
  }
  if (+[MCPasscodeManager isDeviceUnlocked](MCPasscodeManager, "isDeviceUnlocked")
    || (+[MCPasscodeManager deviceLockedError](MCPasscodeManager, "deviceLockedError"),
        (v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v28 = 0;
    -[MCPasscodeManager _privatePasscodeDictWithOutError:](self, "_privatePasscodeDictWithOutError:", &v28);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v28;
    if (!v8)
    {
      if (+[MCPasscodeManager isDeviceUnlocked](MCPasscodeManager, "isDeviceUnlocked")
        || (+[MCPasscodeManager deviceLockedError](MCPasscodeManager, "deviceLockedError"),
            (v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
        MCKeybagCurrentPasscodeGeneration();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("characteristics"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCPasscodeManager _filterPasscodeCharacteristics:forGeneration:](self, "_filterPasscodeCharacteristics:forGeneration:", v14, v13);
        v8 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("ApplePayChinaPasscodePolicy")))
        {
          objc_msgSend(v15, "MCSetBoolRestriction:value:", CFSTR("allowSimple"), 0);
        }
        else if (!objc_msgSend(v6, "isEqualToString:", CFSTR("AutoUnlockPasscodePolicy")))
        {
          v18 = _MCLogObjects;
          if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v30 = v6;
            _os_log_impl(&dword_19ECC4000, v18, OS_LOG_TYPE_ERROR, "Unknown passcode compliance policy: %{public}@", buf, 0xCu);
          }
          if (a4)
          {
            v26 = (void *)MEMORY[0x1E0CB35C8];
            MCErrorArray(CFSTR("PASSCODE_ERROR_UNKNOWN_POLICY_P_POLICY"), v19, v20, v21, v22, v23, v24, v25, v6);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPasscodeErrorDomain"), 5019, v27, CFSTR("MCFatalError"));
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_19;
        }
        objc_msgSend(v15, "MCSetValueRestriction:value:", CFSTR("minLength"), &unk_1E4212B38);
LABEL_19:
        if (objc_msgSend(v15, "count"))
        {
          v16 = (void *)objc_opt_class();
          -[MCPasscodeManager passcodeCreationDate](self, "passcodeCreationDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v16, "_passcodeCharacteristics:creationDate:compliesWithPolicyFromRestrictions:outError:", v8, v17, v15, 0);

        }
        else
        {
          v11 = 0;
        }

        goto LABEL_12;
      }
    }

  }
  if (a4)
    *a4 = objc_retainAutorelease(v8);
  v10 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v30 = v6;
    v31 = 2114;
    v32 = v8;
    _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_ERROR, "Unable to check passcode compliance with named policy %{public}@: %{public}@", buf, 0x16u);
  }
  v11 = 0;
LABEL_12:

  return v11;
}

+ (BOOL)_passcodeCharacteristics:(id)a3 creationDate:(id)a4 compliesWithPolicyFromRestrictions:(id)a5 outError:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  int v13;
  int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  BOOL v33;
  unsigned int v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id *v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  char v50;
  void *v51;
  unsigned int v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v69;
  void *v70;
  char v71;
  char v72;
  int v73;
  int v74;
  unsigned int v75;
  id v77;
  uint8_t buf[4];
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v77 = a4;
  v8 = a5;
  v9 = a3;
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("minComplexChars"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v10, "unsignedIntValue");

  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("minLength"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntValue");

  v74 = +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("requireAlphanumeric"), v8);
  v13 = +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("forcePIN"), v8);
  v14 = +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowSimple"), v8);
  objc_msgSend(v9, "objectForKey:", CFSTR("length"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("hasRepeatingCharacters"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("hasAscendingDescendingCharacters"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("hasAlpha"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v20, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("hasNumber"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v21, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("complexCharactersCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "unsignedIntValue");
  if ((v13 == 1 || v12 || v75 || v74 == 1 || v14 == 2) && !v16)
    goto LABEL_19;
  +[MCRestrictionManager minimumValueForSetting:](MCRestrictionManager, "minimumValueForSetting:", CFSTR("minLength"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "unsignedIntValue");

  if (v12)
    v33 = 0;
  else
    v33 = v13 == 1;
  if (v33)
    v34 = v32;
  else
    v34 = v12;
  if (v34 < v32 && v16 != 0)
    v34 = v32;
  if (v16 < v34)
  {
LABEL_19:
    v36 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("PASSCODE_QUALITY_SHORT"), v24, v25, v26, v27, v28, v29, v30, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPasscodeErrorDomain"), 5000, v37, CFSTR("MCFatalError"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = a6;
    v39 = v77;
    goto LABEL_44;
  }
  if (v14 == 2)
    v41 = v18;
  else
    v41 = 0;
  v39 = v77;
  if (v41 == 1)
  {
    v42 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("PASSCODE_QUALITY_REPEAT"), v24, v25, v26, v27, v28, v29, v30, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    v44 = 5003;
LABEL_29:
    objc_msgSend(v43, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPasscodeErrorDomain"), v44, v37, CFSTR("MCFatalError"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = a6;
    goto LABEL_44;
  }
  v45 = v73;
  if (v14 != 2)
    v45 = 0;
  if (v45 == 1)
  {
    v46 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("PASSCODE_QUALITY_ASCENDING_DESCENDING"), v24, v25, v26, v27, v28, v29, v30, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v46;
    v44 = 5004;
    goto LABEL_29;
  }
  v40 = a6;
  if (v23 < v75)
  {
    v47 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("PASSCODE_QUALITY_COMPLEX"), v24, v25, v26, v27, v28, v29, v30, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    v49 = 5002;
LABEL_43:
    objc_msgSend(v48, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPasscodeErrorDomain"), v49, v37, CFSTR("MCFatalError"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  v50 = v72;
  if (v74 != 1)
    v50 = 1;
  if ((v50 & 1) == 0)
  {
    v63 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("PASSCODE_QUALITY_ALPHA"), v24, v25, v26, v27, v28, v29, v30, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v63;
    v49 = 5006;
    goto LABEL_43;
  }
  if (!((v74 != 1) | v71 & 1))
  {
    v64 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("PASSCODE_QUALITY_NUMBER"), v24, v25, v26, v27, v28, v29, v30, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v64;
    v49 = 5005;
    goto LABEL_43;
  }
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("maxPINAgeInDays"), v8);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v51;
  v38 = 0;
  if (v77 && v51)
  {
    v52 = objc_msgSend(v51, "unsignedIntValue");
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "components:fromDate:toDate:options:", 16, v77, v54, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v55, "day") < 0 || v52 > (unint64_t)objc_msgSend(v55, "day"))
    {
      v38 = 0;
    }
    else
    {
      v69 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(CFSTR("PASSCODE_QUALITY_EXPIRED"), v56, v57, v58, v59, v60, v61, v62, 0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPasscodeErrorDomain"), 5007, v70, CFSTR("MCFatalError"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_44:

  if (v38)
  {
    v65 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      v66 = v65;
      objc_msgSend(v38, "MCVerboseDescription");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v67;
      _os_log_impl(&dword_19ECC4000, v66, OS_LOG_TYPE_DEFAULT, "Passcode does not meet criteria. Error: %{public}@", buf, 0xCu);

    }
    if (v40)
      *v40 = objc_retainAutorelease(v38);
  }

  return v38 == 0;
}

- (BOOL)_checkPasscode:(id)a3 againstHistoryWithRestrictions:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  id *v52;
  id v53;
  id v54;
  unint64_t v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  uint8_t buf[2];
  __int16 v61;
  id v62;

  v8 = a3;
  v9 = a4;
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("pinHistory"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");
  if (!v11)
  {

    v14 = 0;
    goto LABEL_45;
  }
  LODWORD(v12) = v11;
  if (!+[MCPasscodeManager isDeviceUnlocked](MCPasscodeManager, "isDeviceUnlocked"))
  {
    +[MCPasscodeManager deviceLockedError](MCPasscodeManager, "deviceLockedError");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (id)v13;
LABEL_7:

      goto LABEL_8;
    }
  }
  v62 = 0;
  -[MCPasscodeManager _privatePasscodeDictWithOutError:](self, "_privatePasscodeDictWithOutError:", &v62);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v62;
  if (v14
    || !+[MCPasscodeManager isDeviceUnlocked](MCPasscodeManager, "isDeviceUnlocked")
    && (+[MCPasscodeManager deviceLockedError](MCPasscodeManager, "deviceLockedError"),
        (v14 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_7;
  }
  objc_msgSend(v15, "objectForKey:", CFSTR("history"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {
    v12 = v12;
    if (objc_msgSend(v24, "count") < (unint64_t)v12)
      v12 = objc_msgSend(v24, "count");
    if (v12)
    {
      v54 = v8;
      v55 = v12;
      v50 = v15;
      v51 = v10;
      v52 = a5;
      v53 = v9;
      v25 = 0;
      v58 = 0;
      v59 = 0;
      v26 = 0;
      v57 = -1;
      v27 = 1;
      v56 = v24;
      do
      {
        objc_msgSend(v24, "objectAtIndex:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKey:", CFSTR("hash"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKey:", CFSTR("salt"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKey:", CFSTR("iterations"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKey:", CFSTR("hashMethod"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "intValue");

        if (objc_msgSend(v58, "isEqualToData:", v30)
          && v57 == (_DWORD)v33
          && (objc_msgSend(v59, "isEqualToNumber:", v31) & 1) != 0)
        {
          v34 = v26;
        }
        else
        {
          +[MCPasscodeManager hashForPasscode:usingMethod:salt:customIterations:](MCPasscodeManager, "hashForPasscode:usingMethod:salt:customIterations:", v54, v33, v30, objc_msgSend(v31, "intValue"));
          v35 = objc_claimAutoreleasedReturnValue();

          v36 = v30;
          v37 = v31;

          v34 = (void *)v35;
          v58 = v36;
          v59 = v37;
          v57 = v33;
        }
        v26 = v34;
        v38 = objc_msgSend(v34, "isEqualToData:", v29);

        v24 = v56;
        if (v38)
          break;
        v27 = ++v25 < v55;
      }
      while (v55 != v25);
      a5 = v52;
      v9 = v53;
      v15 = v50;
      v10 = v51;
      if (v27)
      {
        v46 = (void *)MEMORY[0x1E0CB35C8];
        MCErrorArray(CFSTR("PASSCODE_QUALITY_TOORECENT"), v39, v40, v41, v42, v43, v44, v45, 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v56;
        objc_msgSend(v46, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPasscodeErrorDomain"), 5008, v47, CFSTR("MCFatalError"));
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }
      v12 = (uint64_t)v58;
      v48 = v59;
      v8 = v54;
    }
    else
    {
      v48 = 0;
      v26 = 0;
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  if (!v14)
    goto LABEL_45;
LABEL_8:
  if (a5)
    *a5 = objc_retainAutorelease(v14);
  objc_msgSend(v14, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("MCPasscodeErrorDomain")))
  {
    v17 = objc_msgSend(v14, "code");

    if (v17 == 5010)
    {
      v18 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        v61 = 0;
        v19 = "Device was locked when passcode history check was attempted.";
        v20 = (uint8_t *)&v61;
LABEL_20:
        _os_log_impl(&dword_19ECC4000, v18, OS_LOG_TYPE_DEFAULT, v19, v20, 2u);
        goto LABEL_45;
      }
      goto LABEL_45;
    }
  }
  else
  {

  }
  objc_msgSend(v14, "domain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isEqualToString:", CFSTR("MCPasscodeErrorDomain")))
  {
    v22 = objc_msgSend(v14, "code");

    if (v22 == 5020)
    {
      v18 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v19 = "Unable to retrieve passcode characteristics when compliance check was attempted.";
        v20 = buf;
        goto LABEL_20;
      }
LABEL_45:
      v23 = 1;
      goto LABEL_46;
    }
  }
  else
  {

  }
  v23 = 0;
LABEL_46:

  return v23;
}

- (id)passcodeCreationDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  MCKeybagCurrentPasscodeGeneration();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCPasscodeManager _currentPublicPasscodeDict](self, "_currentPublicPasscodeDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCPasscodeManager _filterPublicPasscodeDict:forGeneration:](self, "_filterPublicPasscodeDict:forGeneration:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("creationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)passcodeExpiryDate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v3 = 0;
  if (MKBGetDeviceLockState() != 3)
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForFeature:", CFSTR("maxPINAgeInDays"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "doubleValue");
      v7 = v6 * 86400.0;
      -[MCPasscodeManager passcodeCreationDate](self, "passcodeCreationDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v8, v7);

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (id)recoveryPasscodeExpiryDate
{
  void *v3;
  void *v4;

  if (MCKeybagMementoBlobExists())
  {
    -[MCPasscodeManager passcodeCreationDate](self, "passcodeCreationDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v3, 259200.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)characteristicsDictionaryFromPasscode:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned __int16 v9;
  int v10;
  BOOL v11;
  char v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  char v24;
  int v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  char v39;
  uint64_t v40;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "length");
    v6 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 48, 10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v5;
    if (v5)
    {
      v7 = 0;
      v9 = 0;
      v10 = 0;
      v40 = 0;
      v39 = 0;
      v36 = 0;
      v37 = v4;
      v11 = 0;
      v12 = 0;
      v13 = 1;
      LODWORD(v14) = 1;
      while (1)
      {
        v15 = objc_msgSend(v4, "characterAtIndex:", v7);
        v16 = v15;
        if (v13 != 1)
        {
          if ((_DWORD)v15 == v9)
            v12 |= v10++ > 0;
          else
            v10 = 0;
          if (v11)
          {
            LODWORD(v36) = 0;
            v11 = 1;
          }
          else
          {
            objc_msgSend(*(id *)(v6 + 1280), "alphanumericCharacterSet");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v17, "characterIsMember:", v16) & 1) != 0)
            {
              v18 = v6;
              v19 = v8;
              objc_msgSend(*(id *)(v18 + 1280), "alphanumericCharacterSet");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v20, "characterIsMember:", v9) & 1) != 0)
              {

                if (v9 - 1 == (_DWORD)v16 || v9 + 1 == (_DWORD)v16)
                {
                  v11 = (int)v36 > 0;
                  LODWORD(v36) = v36 + 1;
LABEL_18:
                  v8 = v19;
                  v6 = 0x1E0CB3000uLL;
                  goto LABEL_19;
                }
              }
              else
              {

              }
              LODWORD(v36) = 0;
              v11 = 0;
              goto LABEL_18;
            }

            LODWORD(v36) = 0;
            v11 = 0;
          }
        }
LABEL_19:
        v21 = objc_msgSend(v8, "characterIsMember:", v16);
        objc_msgSend(*(id *)(v6 + 1280), "letterCharacterSet");
        v22 = v8;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "characterIsMember:", v16);

        if ((v24 & 1) != 0)
        {
          BYTE4(v36) = 1;
        }
        else
        {
          v25 = objc_msgSend(v22, "characterIsMember:", v16);
          v39 |= v25;
          v40 += v25 ^ 1u;
        }
        v8 = v22;
        v14 = v21 & v14;
        v7 = v13;
        v4 = v37;
        v26 = v38 > v13++;
        v9 = v16;
        v6 = 0x1E0CB3000;
        if (!v26)
          goto LABEL_26;
      }
    }
    v12 = 0;
    v11 = 0;
    BYTE4(v36) = 0;
    v39 = 0;
    v40 = 0;
    v14 = 1;
LABEL_26:
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v28, CFSTR("length"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12 & 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v29, CFSTR("hasRepeatingCharacters"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v30, CFSTR("hasAscendingDescendingCharacters"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE4(v36) & 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v31, CFSTR("hasAlpha"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v39 & 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v32, CFSTR("hasNumber"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v40);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v33, CFSTR("complexCharactersCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v34, CFSTR("allDigits"));

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (id)hashForPasscode:(id)a3 usingMethod:(int)a4 salt:(id)a5 customIterations:(unsigned int)a6
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v8 = a3;
  v9 = a5;
  switch(a4)
  {
    case 0:
      v15 = objc_msgSend(v8, "hash");
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v15, 8);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 1:
      objc_msgSend(v8, "MCSHA256DigestWithPasscodeSalt");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v11 = (void *)v10;
      break;
    case 2:
      objc_msgSend(v8, "dataUsingEncoding:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SecKeyFromPassphraseDataHMACSHA1();

      break;
    case 3:
      objc_msgSend(v8, "dataUsingEncoding:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SecKeyFromPassphraseDataHMACSHA256();

      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

@end
