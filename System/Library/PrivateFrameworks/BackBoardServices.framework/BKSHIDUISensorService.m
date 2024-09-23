@implementation BKSHIDUISensorService

- (BKSHIDUISensorService)init
{
  BKSHIDUISensorService *v2;
  BKSHIDUISensorService *v3;
  void *v4;
  uint64_t v5;
  BKSHIDUISensorService *v6;
  uint64_t v7;
  BSCompoundAssertion *modeAssertion;
  void *v9;
  BKSHIDUISensorService *v10;
  uint64_t v11;
  BSCompoundAssertion *suppressionAssertion;
  _QWORD v14[4];
  BKSHIDUISensorService *v15;
  _QWORD v16[4];
  BKSHIDUISensorService *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BKSHIDUISensorService;
  v2 = -[BKSHIDUISensorService init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (void *)MEMORY[0x1E0D01718];
    v5 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __29__BKSHIDUISensorService_init__block_invoke;
    v16[3] = &unk_1E1EA0698;
    v6 = v2;
    v17 = v6;
    objc_msgSend(v4, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("BKSHIDUISensorMode mode requests"), v16);
    v7 = objc_claimAutoreleasedReturnValue();
    modeAssertion = v6->_modeAssertion;
    v6->_modeAssertion = (BSCompoundAssertion *)v7;

    v9 = (void *)MEMORY[0x1E0D01718];
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __29__BKSHIDUISensorService_init__block_invoke_2;
    v14[3] = &unk_1E1EA0698;
    v10 = v6;
    v15 = v10;
    objc_msgSend(v9, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("BKSHIDUISensorMode suppress mode changes"), v14);
    v11 = objc_claimAutoreleasedReturnValue();
    suppressionAssertion = v10->_suppressionAssertion;
    v10->_suppressionAssertion = (BSCompoundAssertion *)v11;

  }
  return v3;
}

- (id)suppressUISensorChangesForReason:(id)a3
{
  return (id)-[BSCompoundAssertion acquireForReason:](self->_suppressionAssertion, "acquireForReason:", a3);
}

- (id)requestUISensorMode:(id)a3
{
  BSCompoundAssertion *modeAssertion;
  id v4;
  void *v5;
  void *v6;

  modeAssertion = self->_modeAssertion;
  v4 = a3;
  objc_msgSend(v4, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCompoundAssertion acquireForReason:withContext:](modeAssertion, "acquireForReason:withContext:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BKSHIDUISensorCharacteristics)sensorCharacteristics
{
  if (sensorCharacteristics_onceToken != -1)
    dispatch_once(&sensorCharacteristics_onceToken, &__block_literal_global_6);
  return (BKSHIDUISensorCharacteristics *)(id)sensorCharacteristics_sCharacteristics;
}

- (void)_lock_pushCurrentModeToServer
{
  void *v3;
  void *v4;
  void *v5;
  BKSHIDUISensorMode **p_lock_prevailingMode;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  NSObject *v13;
  id v14;
  int v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((-[BSCompoundAssertion isActive](self->_suppressionAssertion, "isActive") & 1) == 0)
  {
    -[BSCompoundAssertion orderedContext](self->_modeAssertion, "orderedContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[BKSHIDUISensorMode _prevailingMode:](BKSHIDUISensorMode, "_prevailingMode:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    p_lock_prevailingMode = &self->_lock_prevailingMode;
    if ((BSEqualObjects() & 1) != 0)
    {
LABEL_19:

      return;
    }
    if ((unint64_t)objc_msgSend(v3, "count") < 2)
    {
      BKLogUISensor();
      v7 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (!v9)
          goto LABEL_12;
        *(_DWORD *)buf = 138543362;
        v18 = v5;
        v10 = "prevailing client request: %{public}@";
        v11 = v7;
        v12 = 12;
      }
      else
      {
        if (!v9)
          goto LABEL_12;
        *(_WORD *)buf = 0;
        v10 = "prevailing client request: none!";
        v11 = v7;
        v12 = 2;
      }
      _os_log_impl(&dword_18A0F0000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
    else
    {
      BKLogUISensor();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v5;
        v19 = 2114;
        v20 = v8;
        _os_log_impl(&dword_18A0F0000, v7, OS_LOG_TYPE_DEFAULT, "prevailing client request: %{public}@ all modes:%{public}@", buf, 0x16u);

      }
    }
LABEL_12:

    objc_storeStrong((id *)p_lock_prevailingMode, v5);
    if (v5)
    {
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0D01838], "encodeObject:error:", v5, &v16);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v16;
      if (!v13)
      {
        BKLogUISensor();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v18 = v14;
          v19 = 2114;
          v20 = v5;
          _os_log_error_impl(&dword_18A0F0000, v13, OS_LOG_TYPE_ERROR, "error encoding BKSHIDUISensorMode: %{public}@ : %{public}@", buf, 0x16u);
        }
        goto LABEL_18;
      }
    }
    else
    {
      v14 = 0;
      v13 = 0;
    }
    v15 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    _BKSHIDRequestUISensorMode(v15, -[NSObject bs_bytesForMIG](v13, "bs_bytesForMIG"), -[NSObject bs_lengthForMIG](v13, "bs_lengthForMIG"));
LABEL_18:

    goto LABEL_19;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_prevailingMode, 0);
  objc_storeStrong((id *)&self->_suppressionAssertion, 0);
  objc_storeStrong((id *)&self->_modeAssertion, 0);
}

void __46__BKSHIDUISensorService_sensorCharacteristics__block_invoke()
{
  int v0;
  int v1;
  int v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v9 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  v1 = _BKSHIDGetUISensorCharacteristics(v0, &v10, &v9);
  if (v1)
  {
    v2 = v1;
    BKLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v12) = v2;
      _os_log_error_impl(&dword_18A0F0000, v3, OS_LOG_TYPE_ERROR, "Mach IPC error getting UI sensor characteristics: 0x%x", buf, 8u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "bs_dataWithVMAllocatedBytes:length:", v10, v9);
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v8 = 0;
      objc_msgSend(MEMORY[0x1E0D01838], "decodeObjectOfClass:fromData:error:", objc_opt_class(), v3, &v8);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v8;
      v6 = (void *)sensorCharacteristics_sCharacteristics;
      sensorCharacteristics_sCharacteristics = v4;

      if (!sensorCharacteristics_sCharacteristics)
      {
        BKLogCommon();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v12 = v5;
          _os_log_error_impl(&dword_18A0F0000, v7, OS_LOG_TYPE_ERROR, "decoding characteristics failed: %{public}@", buf, 0xCu);
        }

      }
    }
  }

}

void __29__BKSHIDUISensorService_init__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_lock_pushCurrentModeToServer");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
}

void __29__BKSHIDUISensorService_init__block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_lock_pushCurrentModeToServer");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_157 != -1)
    dispatch_once(&sharedInstance_onceToken_157, &__block_literal_global_158);
  return (id)sharedInstance_service_159;
}

void __39__BKSHIDUISensorService_sharedInstance__block_invoke()
{
  BKSHIDUISensorService *v0;
  void *v1;

  v0 = objc_alloc_init(BKSHIDUISensorService);
  v1 = (void *)sharedInstance_service_159;
  sharedInstance_service_159 = (uint64_t)v0;

}

@end
