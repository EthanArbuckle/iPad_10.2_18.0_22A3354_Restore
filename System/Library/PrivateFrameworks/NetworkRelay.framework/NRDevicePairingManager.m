@implementation NRDevicePairingManager

- (NRDevicePairingManager)initWithIdentifier:(id)a3 pairingCriteria:(id)a4 metadata:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NRDevicePairingManagerMux *WeakRetained;
  NRDevicePairingManagerMux *v16;
  NRDevicePairingManager *v17;
  id *p_isa;
  NRDevicePairingManagerInfo *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NRDevicePairingManager *v24;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  _BOOL4 v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  _BOOL4 v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BOOL4 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _BOOL4 v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  objc_super v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v11)
  {
    v26 = nrCopyLogObj_1090();
    v27 = v26;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v43 = os_log_type_enabled(v26, OS_LOG_TYPE_FAULT);

      if (!v43)
        goto LABEL_29;
    }
    v44 = nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)v44, 17, (uint64_t)"%s called with null pairingCriteria", v45, v46, v47, v48, v49, (uint64_t)"-[NRDevicePairingManager initWithIdentifier:pairingCriteria:metadata:queue:]");
LABEL_28:

    v24 = 0;
    goto LABEL_11;
  }
  if (!v13)
  {
    v28 = nrCopyLogObj_1090();
    v29 = v28;
    if (sNRCopyLogToStdErr)
    {

LABEL_27:
      v44 = nrCopyLogObj_1090();
      _NRLogWithArgs((uint64_t)v44, 17, (uint64_t)"%s called with null queue", v51, v52, v53, v54, v55, (uint64_t)"-[NRDevicePairingManager initWithIdentifier:pairingCriteria:metadata:queue:]");
      goto LABEL_28;
    }
    v50 = os_log_type_enabled(v28, OS_LOG_TYPE_FAULT);

    if (v50)
      goto LABEL_27;
LABEL_29:
    v24 = 0;
    goto LABEL_11;
  }
  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&copySharedInstance_gSharedInstanceLock);
  WeakRetained = (NRDevicePairingManagerMux *)objc_loadWeakRetained(&copySharedInstance_gSharedInstance);
  if (WeakRetained)
  {
    v16 = WeakRetained;
    os_unfair_lock_unlock((os_unfair_lock_t)&copySharedInstance_gSharedInstanceLock);
    goto LABEL_6;
  }
  v16 = objc_alloc_init(NRDevicePairingManagerMux);
  objc_storeWeak(&copySharedInstance_gSharedInstance, v16);
  os_unfair_lock_unlock((os_unfair_lock_t)&copySharedInstance_gSharedInstanceLock);
  if (v16)
  {
LABEL_6:
    v63.receiver = self;
    v63.super_class = (Class)NRDevicePairingManager;
    v17 = -[NRDevicePairingManager init](&v63, sel_init);
    if (v17)
    {
      p_isa = (id *)&v17->super.isa;
      v19 = objc_alloc_init(NRDevicePairingManagerInfo);
      v20 = p_isa[11];
      p_isa[11] = v19;

      v21 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(p_isa[11], "setIdentifier:", v21);

      v22 = (void *)objc_msgSend(v11, "copy");
      objc_msgSend(p_isa[11], "setPairingCriteria:", v22);

      v23 = (void *)objc_msgSend(v12, "copy");
      objc_msgSend(p_isa[11], "setMetadata:", v23);

      objc_storeStrong(p_isa + 7, a6);
      if (nrXPCCopyQueue_onceToken != -1)
        dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2127);
      objc_storeStrong(p_isa + 8, (id)nrXPCCopyQueue_nrXPCQueue);
      -[NRDevicePairingManager setInternalManagerState:](p_isa, 1);
      objc_msgSend(p_isa, "setManagerState:", 1);
      objc_storeStrong(p_isa + 9, v16);
      self = p_isa;
      v24 = self;
      goto LABEL_10;
    }
    v30 = nrCopyLogObj_1090();
    v31 = v30;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v32 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);

      if (!v32)
      {
LABEL_23:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v41 = _os_log_pack_fill();
        *(_DWORD *)v41 = 136446210;
        *(_QWORD *)(v41 + 4) = "-[NRDevicePairingManager initWithIdentifier:pairingCriteria:metadata:queue:]";
        v42 = nrCopyLogObj_1090();
        _NRLogAbortWithPack(v42);
      }
    }
    v35 = nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)v35, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v36, v37, v38, v39, v40, (uint64_t)");

    goto LABEL_23;
  }
  v33 = nrCopyLogObj_1090();
  v34 = v33;
  if (sNRCopyLogToStdErr)
  {

LABEL_31:
    v57 = nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)v57, 17, (uint64_t)"%s called with null pairingManagerMux", v58, v59, v60, v61, v62, (uint64_t)"-[NRDevicePairingManager initWithIdentifier:pairingCriteria:metadata:queue:]");

    goto LABEL_32;
  }
  v56 = os_log_type_enabled(v33, OS_LOG_TYPE_FAULT);

  if (v56)
    goto LABEL_31;
LABEL_32:
  v16 = 0;
  v24 = 0;
LABEL_10:

LABEL_11:
  return v24;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  if (nrCopyLogObj_onceToken_1095 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_1095, &__block_literal_global_1096);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1097, OS_LOG_TYPE_DEFAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1097, 0, (uint64_t)"%s%.30s:%-4d Dealloc %@", v2, v3, v4, v5, v6, (uint64_t)");
  v8.receiver = self;
  v8.super_class = (Class)NRDevicePairingManager;
  -[NRDevicePairingManager dealloc](&v8, sel_dealloc);
}

- (id)description
{
  if (self)
    self = (NRDevicePairingManager *)self->_managerInfo;
  return -[NRDevicePairingManager description](self, "description");
}

- (NSString)fullDescription
{
  NRDevicePairingManager *v2;
  void *v3;
  void *v4;

  v2 = self;
  if (self)
    self = (NRDevicePairingManager *)self->_managerInfo;
  -[NRDevicePairingManager fullDescription](self, "fullDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR(" State %zu"), -[NRDevicePairingManager managerState](v2, "managerState"));
  return (NSString *)v4;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NRDevicePairingManager *v5;
  unint64_t internalManagerState;
  NSObject *operationQueue;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD block[5];
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v11 = nrCopyLogObj_1090();
    v12 = v11;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v13 = os_log_type_enabled(v11, OS_LOG_TYPE_FAULT);

      if (!v13)
        goto LABEL_6;
    }
    v14 = nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)v14, 17, (uint64_t)"%s called with null completionBlock", v15, v16, v17, v18, v19, (uint64_t)"-[NRDevicePairingManager activateWithCompletion:]");

    goto LABEL_6;
  }
  if (self
    && (v5 = self,
        objc_sync_enter(v5),
        internalManagerState = v5->_internalManagerState,
        objc_sync_exit(v5),
        v5,
        internalManagerState == 1))
  {
    -[NRDevicePairingManager setInternalManagerState:](v5, 2);
    operationQueue = v5->_operationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__NRDevicePairingManager_activateWithCompletion___block_invoke;
    block[3] = &unk_1EA3F7278;
    block[4] = v5;
    v21 = v4;
    dispatch_async(operationQueue, block);

  }
  else
  {
    objc_opt_self();
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = CFSTR("Manager is in invalid state for this operation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -3001, v9);

    -[NRDevicePairingManager callCompletionBlock:withError:]((uint64_t)self, v4, v10);
  }
LABEL_6:

}

- (void)startDiscoveryWithCompletion:(id)a3
{
  id v4;
  NRDevicePairingManager *v5;
  unint64_t internalManagerState;
  NSObject *operationQueue;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD block[5];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v11 = nrCopyLogObj_1090();
    v12 = v11;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v13 = os_log_type_enabled(v11, OS_LOG_TYPE_FAULT);

      if (!v13)
        goto LABEL_6;
    }
    v14 = nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)v14, 17, (uint64_t)"%s called with null completionBlock", v15, v16, v17, v18, v19, (uint64_t)"-[NRDevicePairingManager startDiscoveryWithCompletion:]");

    goto LABEL_6;
  }
  if (self
    && (v5 = self,
        objc_sync_enter(v5),
        internalManagerState = v5->_internalManagerState,
        objc_sync_exit(v5),
        v5,
        internalManagerState == 3))
  {
    -[NRDevicePairingManager setInternalManagerState:](v5, 4);
    operationQueue = v5->_operationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__NRDevicePairingManager_startDiscoveryWithCompletion___block_invoke;
    block[3] = &unk_1EA3F72A0;
    block[4] = v5;
    dispatch_async(operationQueue, block);
  }
  else
  {
    objc_opt_self();
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = CFSTR("Manager is in invalid state for this operation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -3001, v9);

    -[NRDevicePairingManager callCompletionBlock:withError:]((uint64_t)self, v4, v10);
  }
LABEL_6:

}

- (void)cancelDiscovery
{
  NRDevicePairingManager *v2;
  unint64_t internalManagerState;
  NSObject *operationQueue;
  _QWORD block[5];

  if (self)
  {
    v2 = self;
    objc_sync_enter(v2);
    internalManagerState = v2->_internalManagerState;
    objc_sync_exit(v2);

    if (internalManagerState == 5)
    {
      -[NRDevicePairingManager setInternalManagerState:](v2, 6);
      operationQueue = v2->_operationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__NRDevicePairingManager_cancelDiscovery__block_invoke;
      block[3] = &unk_1EA3F72A0;
      block[4] = v2;
      dispatch_async(operationQueue, block);
    }
  }
}

- (void)requestAuthMethodForDevice:(id)a3 authMethod:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NRDevicePairingManager *v11;
  unint64_t internalManagerState;
  NRDevicePairingManager *v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *operationQueue;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD block[5];
  id v37;
  id v38;
  unint64_t v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    v19 = nrCopyLogObj_1090();
    v20 = v19;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v23 = os_log_type_enabled(v19, OS_LOG_TYPE_FAULT);

      if (!v23)
        goto LABEL_8;
    }
    v24 = nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)v24, 17, (uint64_t)"%s called with null device", v25, v26, v27, v28, v29, (uint64_t)"-[NRDevicePairingManager requestAuthMethodForDevice:authMethod:withCompletion:]");
LABEL_17:

    goto LABEL_8;
  }
  if (!v9)
  {
    v21 = nrCopyLogObj_1090();
    v22 = v21;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v30 = os_log_type_enabled(v21, OS_LOG_TYPE_FAULT);

      if (!v30)
        goto LABEL_8;
    }
    v24 = nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)v24, 17, (uint64_t)"%s called with null completionBlock", v31, v32, v33, v34, v35, (uint64_t)"-[NRDevicePairingManager requestAuthMethodForDevice:authMethod:withCompletion:]");
    goto LABEL_17;
  }
  if (!self)
    goto LABEL_6;
  v11 = self;
  objc_sync_enter(v11);
  internalManagerState = v11->_internalManagerState;
  objc_sync_exit(v11);

  if (internalManagerState < 3)
    goto LABEL_6;
  v13 = v11;
  objc_sync_enter(v13);
  v14 = v11->_internalManagerState;
  objc_sync_exit(v13);

  if (v14 < 7)
  {
    operationQueue = v13->_operationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__NRDevicePairingManager_requestAuthMethodForDevice_authMethod_withCompletion___block_invoke;
    block[3] = &unk_1EA3F7318;
    block[4] = v13;
    v37 = v8;
    v39 = a4;
    v38 = v10;
    dispatch_async(operationQueue, block);

  }
  else
  {
LABEL_6:
    objc_opt_self();
    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v40 = *MEMORY[0x1E0CB2D50];
    v41[0] = CFSTR("Manager is in invalid state for this operation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -3001, v16);

    -[NRDevicePairingManager callCompletionBlock:withError:]((uint64_t)self, v10, v17);
  }
LABEL_8:

}

- (void)getDataForAuthMethod:(unint64_t)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;

  v5 = a4;
  v6 = v5;
  if (!v5)
  {
    v7 = nrCopyLogObj_1090();
    v8 = v7;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v9 = os_log_type_enabled(v7, OS_LOG_TYPE_FAULT);

      if (!v9)
        goto LABEL_5;
    }
    v10 = nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)v10, 17, (uint64_t)"%s called with null completionBlock", v11, v12, v13, v14, v15, (uint64_t)"-[NRDevicePairingManager getDataForAuthMethod:withCompletion:]");

    goto LABEL_5;
  }
  if (self)
    self = (NRDevicePairingManager *)self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__NRDevicePairingManager_getDataForAuthMethod_withCompletion___block_invoke;
  block[3] = &unk_1EA3F7A20;
  v17 = v5;
  dispatch_async(&self->super, block);

LABEL_5:
}

- (void)startPairingDevice:(id)a3 withCompletion:(id)a4 resultBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NRDevicePairingManager *v12;
  unint64_t internalManagerState;
  NRDevicePairingManager *v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  SEL v19;
  NSObject *operationQueue;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  _BOOL4 v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD block[5];
  id v39;
  id v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    v21 = nrCopyLogObj_1090();
    v22 = v21;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v25 = os_log_type_enabled(v21, OS_LOG_TYPE_FAULT);

      if (!v25)
        goto LABEL_9;
    }
    v26 = nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)v26, 17, (uint64_t)"%s called with null completionBlock", v27, v28, v29, v30, v31, (uint64_t)"-[NRDevicePairingManager startPairingDevice:withCompletion:resultBlock:]");
LABEL_18:

    goto LABEL_9;
  }
  if (!v10)
  {
    v23 = nrCopyLogObj_1090();
    v24 = v23;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v32 = os_log_type_enabled(v23, OS_LOG_TYPE_FAULT);

      if (!v32)
        goto LABEL_9;
    }
    v26 = nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)v26, 17, (uint64_t)"%s called with null resultBlock", v33, v34, v35, v36, v37, (uint64_t)"-[NRDevicePairingManager startPairingDevice:withCompletion:resultBlock:]");
    goto LABEL_18;
  }
  if (!self)
  {
    operationQueue = 0;
    goto LABEL_8;
  }
  v12 = self;
  objc_sync_enter(v12);
  internalManagerState = v12->_internalManagerState;
  objc_sync_exit(v12);

  if (internalManagerState != 1)
  {
    v14 = v12;
    objc_sync_enter(v14);
    v15 = v12->_internalManagerState;
    objc_sync_exit(v14);

    if (v15 != 10)
    {
      -[NRDevicePairingManager setInternalManagerState:](v14, 7);
      objc_setProperty_atomic_copy(v14, v19, v11, 80);
      operationQueue = v14->_operationQueue;
LABEL_8:
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__NRDevicePairingManager_startPairingDevice_withCompletion_resultBlock___block_invoke;
      block[3] = &unk_1EA3F73B8;
      block[4] = self;
      v39 = v8;
      v40 = v9;
      dispatch_async(operationQueue, block);

      goto LABEL_9;
    }
  }
  objc_opt_self();
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v41 = *MEMORY[0x1E0CB2D50];
  v42[0] = CFSTR("Manager is in invalid state for this operation");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -3001, v17);

  -[NRDevicePairingManager callCompletionBlock:withError:]((uint64_t)v12, v9, v18);
LABEL_9:

}

- (void)cancelPairing
{
  NRDevicePairingManager *v2;
  unint64_t internalManagerState;
  NSObject *operationQueue;
  _QWORD block[5];

  if (self)
  {
    v2 = self;
    objc_sync_enter(v2);
    internalManagerState = v2->_internalManagerState;
    objc_sync_exit(v2);

    if (internalManagerState == 8)
    {
      -[NRDevicePairingManager setInternalManagerState:](v2, 9);
      operationQueue = v2->_operationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__NRDevicePairingManager_cancelPairing__block_invoke;
      block[3] = &unk_1EA3F72A0;
      block[4] = v2;
      dispatch_async(operationQueue, block);
    }
  }
}

- (void)invalidate
{
  NRDevicePairingManager *v2;
  NRDevicePairingManager *v3;
  unint64_t internalManagerState;
  _QWORD block[5];

  v2 = self;
  if (self)
  {
    v3 = self;
    objc_sync_enter(v3);
    internalManagerState = v3->_internalManagerState;
    objc_sync_exit(v3);

    if (internalManagerState == 10)
      return;
    -[NRDevicePairingManager setInternalManagerState:](v3, 10);
    self = (NRDevicePairingManager *)v3->_operationQueue;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__NRDevicePairingManager_invalidate__block_invoke;
  block[3] = &unk_1EA3F72A0;
  block[4] = v2;
  dispatch_async(&self->super, block);
}

- (id)candidateDiscoveredHandler
{
  return self->_candidateDiscoveredHandler;
}

- (void)setCandidateDiscoveredHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)candidateLostHandler
{
  return self->_candidateLostHandler;
}

- (void)setCandidateLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)authRequestHandler
{
  return self->_authRequestHandler;
}

- (void)setAuthRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)managerState
{
  return self->_managerState;
}

- (void)setManagerState:(unint64_t)a3
{
  self->_managerState = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managerInfo, 0);
  objc_storeStrong(&self->_pairingResultBlock, 0);
  objc_storeStrong((id *)&self->_pairingManagerMux, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_authRequestHandler, 0);
  objc_storeStrong(&self->_candidateLostHandler, 0);
  objc_storeStrong(&self->_candidateDiscoveredHandler, 0);
}

- (void)setInternalManagerState:(void *)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *obj;

  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    if (obj[1] == a2)
    {
      objc_sync_exit(obj);

    }
    else
    {
      obj[1] = a2;
      objc_sync_exit(obj);

      if (nrCopyLogObj_onceToken_1095 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1095, &__block_literal_global_1096);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1097, OS_LOG_TYPE_DEFAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1097, 0, (uint64_t)"%s%.30s:%-4d Manager state change: %zu -> %zu", v3, v4, v5, v6, v7, (uint64_t)");
    }
  }
}

void __36__NRDevicePairingManager_invalidate__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[9];
  v3 = v2;
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__NRDevicePairingManager_invalidate__block_invoke_2;
  v5[3] = &unk_1EA3F72C8;
  objc_copyWeak(&v6, &location);
  -[NRDevicePairingManagerMux unregisterPairingManager:withCompletion:](v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __36__NRDevicePairingManager_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[4];
  _QWORD *v14;
  id v15;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)WeakRetained[9];
    WeakRetained[9] = 0;

    if (v3)
    {
      if (nrCopyLogObj_onceToken_1095 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1095, &__block_literal_global_1096);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1097, OS_LOG_TYPE_ERROR))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1097, 16, (uint64_t)"%s%.30s:%-4d Unregistering pairing manager failed: %@", v7, v8, v9, v10, v11, (uint64_t)");
    }
    v12 = v5[7];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__NRDevicePairingManager_invalidate__block_invoke_3;
    block[3] = &unk_1EA3F7368;
    v14 = v5;
    v15 = v3;
    dispatch_async(v12, block);

  }
}

void __36__NRDevicePairingManager_invalidate__block_invoke_3(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "setManagerState:", 5);
  objc_msgSend(*(id *)(a1 + 32), "invalidationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidationHandler");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
}

void __39__NRDevicePairingManager_cancelPairing__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[9];
  v3 = v2;
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__NRDevicePairingManager_cancelPairing__block_invoke_2;
  v5[3] = &unk_1EA3F72C8;
  objc_copyWeak(&v6, &location);
  -[NRDevicePairingManagerMux stopPairingForPairingManager:withCompletion:](v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __39__NRDevicePairingManager_cancelPairing__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  int v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  SEL v26;
  NSObject *v27;
  _QWORD block[4];
  _QWORD *v29;
  id v30;
  id v31;
  char v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (!WeakRetained)
  {
    v13 = v3;
    goto LABEL_25;
  }
  if (v3)
  {
    if (nrCopyLogObj_onceToken_1095 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1095, &__block_literal_global_1096);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1097, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1097, 16, (uint64_t)"%s%.30s:%-4d Stopping pairing failed: %@", v5, v6, v7, v8, v9, (uint64_t)");
    v12 = 0;
    v13 = v3;
  }
  else
  {
    v14 = WeakRetained;
    objc_sync_enter(v14);
    v15 = v14[1];
    objc_sync_exit(v14);

    if (v15 == 9)
    {
      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v33 = *MEMORY[0x1E0CB2D50];
      v34 = CFSTR("Pairing operation was cancelled");
      v12 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -3002, v22);

    }
    else
    {
      if (nrCopyLogObj_onceToken_1095 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1095, &__block_literal_global_1096);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1097, OS_LOG_TYPE_ERROR))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1097, 16, (uint64_t)"%s%.30s:%-4d State changed while stopping pairing", v16, v17, v18, v19, v20, (uint64_t)");
      objc_opt_self();
      v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v35 = *MEMORY[0x1E0CB2D50];
      v36[0] = CFSTR("Manager is in invalid state for this operation");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v23, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -3001, v24);

      v12 = 0;
    }
  }
  v25 = objc_getProperty(v10, v11, 80, 1);
  objc_setProperty_atomic_copy(v10, v26, 0, 80);
  if (v12)
  {
    -[NRDevicePairingManager setInternalManagerState:](v10, 3);
LABEL_21:
    v27 = v10[7];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__NRDevicePairingManager_cancelPairing__block_invoke_3;
    block[3] = &unk_1EA3F7228;
    v32 = v12;
    v29 = v10;
    v31 = v25;
    v30 = v13;
    dispatch_async(v27, block);

    goto LABEL_22;
  }
  if (v25)
    goto LABEL_21;
LABEL_22:
  if (v3)
    -[NRDevicePairingManager invalidateWithError:](v10, v13);

LABEL_25:
}

uint64_t __39__NRDevicePairingManager_cancelPairing__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "setManagerState:", 9);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40), 0);
  return result;
}

- (void)invalidateWithError:(void *)a1
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  if (a1)
  {
    v4 = a1;
    objc_sync_enter(v4);
    v5 = v4[1];
    objc_sync_exit(v4);

    if (v5 != 10)
    {
      -[NRDevicePairingManager setInternalManagerState:](v4, 10);
      v6 = (void *)v4[9];
      v4[9] = 0;

      v7 = v4[7];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __46__NRDevicePairingManager_invalidateWithError___block_invoke;
      v8[3] = &unk_1EA3F7368;
      v8[4] = v4;
      v9 = v3;
      dispatch_async(v7, v8);

    }
  }

}

void __46__NRDevicePairingManager_invalidateWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "setManagerState:", 5);
  objc_msgSend(*(id *)(a1 + 32), "invalidationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidationHandler");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
}

- (void)callCompletionBlock:(void *)a3 withError:
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = *(NSObject **)(a1 + 56);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__NRDevicePairingManager_callCompletionBlock_withError___block_invoke;
    v8[3] = &unk_1EA3F7278;
    v10 = v5;
    v9 = v6;
    dispatch_async(v7, v8);

  }
}

void __72__NRDevicePairingManager_startPairingDevice_withCompletion_resultBlock___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[9];
  v3 = v2;
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__NRDevicePairingManager_startPairingDevice_withCompletion_resultBlock___block_invoke_2;
  v6[3] = &unk_1EA3F7250;
  objc_copyWeak(&v8, &location);
  v7 = *(id *)(a1 + 48);
  -[NRDevicePairingManagerMux startPairingForPairingManager:pairingTarget:withCompletion:](v3, v4, v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __72__NRDevicePairingManager_startPairingDevice_withCompletion_resultBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  char v12;
  void *v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  SEL v24;
  NSObject *v25;
  _QWORD *v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  char v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      if (nrCopyLogObj_onceToken_1095 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1095, &__block_literal_global_1096);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1097, OS_LOG_TYPE_ERROR))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1097, 16, (uint64_t)"%s%.30s:%-4d Starting pairing failed: %@", v5, v6, v7, v8, v9, (uint64_t)");
      objc_setProperty_atomic_copy(v10, v11, 0, 80);
      v12 = 0;
      v13 = v3;
    }
    else
    {
      v15 = WeakRetained;
      objc_sync_enter(v15);
      v16 = v15[1];
      objc_sync_exit(v15);

      if (v16 == 7)
      {
        -[NRDevicePairingManager setInternalManagerState:](v15, 8);
        v13 = 0;
        v12 = 1;
      }
      else
      {
        if (nrCopyLogObj_onceToken_1095 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1095, &__block_literal_global_1096);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1097, OS_LOG_TYPE_ERROR))
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1097, 16, (uint64_t)"%s%.30s:%-4d State changed while starting pairing", v17, v18, v19, v20, v21, (uint64_t)");
        objc_opt_self();
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v32 = *MEMORY[0x1E0CB2D50];
        v33[0] = CFSTR("Manager is in invalid state for this operation");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -3001, v23);

        objc_setProperty_atomic_copy(v15, v24, 0, 80);
        v12 = 0;
      }
    }
    v25 = v10[7];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__NRDevicePairingManager_startPairingDevice_withCompletion_resultBlock___block_invoke_3;
    block[3] = &unk_1EA3F7228;
    v31 = v12;
    v26 = v10;
    v28 = v26;
    v30 = *(id *)(a1 + 32);
    v14 = v13;
    v29 = v14;
    dispatch_async(v25, block);
    if (v3)
      -[NRDevicePairingManager invalidateWithError:](v26, v14);

  }
  else
  {
    v14 = v3;
  }

}

uint64_t __72__NRDevicePairingManager_startPairingDevice_withCompletion_resultBlock___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "setManagerState:", 4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __56__NRDevicePairingManager_callCompletionBlock_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __62__NRDevicePairingManager_getDataForAuthMethod_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  objc_opt_self();
  v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v5 = *MEMORY[0x1E0CB2D50];
  v6[0] = CFSTR("Unimplemented method");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -9999, v3);

  (*(void (**)(uint64_t, void *, _QWORD))(v1 + 16))(v1, v4, 0);
}

void __79__NRDevicePairingManager_requestAuthMethodForDevice_authMethod_withCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10[2];
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[9];
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__NRDevicePairingManager_requestAuthMethodForDevice_authMethod_withCompletion___block_invoke_2;
  v7[3] = &unk_1EA3F72F0;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  -[NRDevicePairingManagerMux sendAuthMethodRequestForDevice:authMethod:pairingManager:withCompletion:]((uint64_t)v3, v5, v4, v6, v7);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __79__NRDevicePairingManager_requestAuthMethodForDevice_authMethod_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *WeakRetained;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      if (nrCopyLogObj_onceToken_1095 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1095, &__block_literal_global_1096);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1097, OS_LOG_TYPE_ERROR))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1097, 16, (uint64_t)"%s%.30s:%-4d Requesting auth method %zu for %@ failed: %@", v4, v5, v6, v7, v8, (uint64_t)");
    }
    else
    {
      if (nrCopyLogObj_onceToken_1095 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1095, &__block_literal_global_1096);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1097, OS_LOG_TYPE_INFO))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1097, 1, (uint64_t)"%s%.30s:%-4d Requesting auth method %zu for %@ succeeded", v4, v5, v6, v7, v8, (uint64_t)");
    }
    v10 = WeakRetained[7];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__NRDevicePairingManager_requestAuthMethodForDevice_authMethod_withCompletion___block_invoke_3;
    block[3] = &unk_1EA3F7278;
    v13 = *(id *)(a1 + 40);
    v12 = v3;
    dispatch_async(v10, block);

  }
}

uint64_t __79__NRDevicePairingManager_requestAuthMethodForDevice_authMethod_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __41__NRDevicePairingManager_cancelDiscovery__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[9];
  v3 = v2;
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__NRDevicePairingManager_cancelDiscovery__block_invoke_2;
  v5[3] = &unk_1EA3F72C8;
  objc_copyWeak(&v6, &location);
  -[NRDevicePairingManagerMux stopDiscoveryForPairingManager:withCompletion:](v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __41__NRDevicePairingManager_cancelDiscovery__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD block[4];
  _QWORD *v20;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      if (nrCopyLogObj_onceToken_1095 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1095, &__block_literal_global_1096);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1097, OS_LOG_TYPE_ERROR))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1097, 16, (uint64_t)"%s%.30s:%-4d Stopping pairing discovery failed: %@", v5, v6, v7, v8, v9, (uint64_t)");
      -[NRDevicePairingManager invalidateWithError:](v10, v3);
    }
    else
    {
      v11 = WeakRetained;
      objc_sync_enter(v11);
      v12 = v11[1];
      objc_sync_exit(v11);

      if (v12 == 6)
      {
        -[NRDevicePairingManager setInternalManagerState:](v11, 3);
        v18 = v11[7];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __41__NRDevicePairingManager_cancelDiscovery__block_invoke_3;
        block[3] = &unk_1EA3F72A0;
        v20 = v11;
        dispatch_async(v18, block);

      }
      else
      {
        if (nrCopyLogObj_onceToken_1095 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1095, &__block_literal_global_1096);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1097, OS_LOG_TYPE_ERROR))
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1097, 16, (uint64_t)"%s%.30s:%-4d State changed while stopping pairing discovery", v13, v14, v15, v16, v17, (uint64_t)");
      }
    }
  }

}

uint64_t __41__NRDevicePairingManager_cancelDiscovery__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setManagerState:", 2);
}

void __55__NRDevicePairingManager_startDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[9];
  v3 = v2;
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__NRDevicePairingManager_startDiscoveryWithCompletion___block_invoke_2;
  v5[3] = &unk_1EA3F72C8;
  objc_copyWeak(&v6, &location);
  -[NRDevicePairingManagerMux startDiscoveryForPairingManager:withCompletion:](v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__NRDevicePairingManager_startDiscoveryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  _QWORD block[4];
  _QWORD *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      if (nrCopyLogObj_onceToken_1095 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1095, &__block_literal_global_1096);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1097, OS_LOG_TYPE_ERROR))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1097, 16, (uint64_t)"%s%.30s:%-4d Starting pairing discovery failed: %@", v5, v6, v7, v8, v9, (uint64_t)");
      -[NRDevicePairingManager invalidateWithError:](v10, v3);
    }
    else
    {
      v11 = WeakRetained;
      objc_sync_enter(v11);
      v12 = v11[1];
      objc_sync_exit(v11);

      if (v12 == 4)
      {
        -[NRDevicePairingManager setInternalManagerState:](v11, 5);
        v18 = v11[7];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __55__NRDevicePairingManager_startDiscoveryWithCompletion___block_invoke_3;
        block[3] = &unk_1EA3F72A0;
        v22 = v11;
        dispatch_async(v18, block);

        v3 = 0;
      }
      else
      {
        if (nrCopyLogObj_onceToken_1095 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1095, &__block_literal_global_1096);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1097, OS_LOG_TYPE_ERROR))
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1097, 16, (uint64_t)"%s%.30s:%-4d State changed while starting pairing discovery", v13, v14, v15, v16, v17, (uint64_t)");
        objc_opt_self();
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = *MEMORY[0x1E0CB2D50];
        v24[0] = CFSTR("Manager is in invalid state for this operation");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -3001, v20);

      }
    }
  }

}

uint64_t __55__NRDevicePairingManager_startDiscoveryWithCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setManagerState:", 3);
}

void __49__NRDevicePairingManager_activateWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[9];
  v3 = v2;
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__NRDevicePairingManager_activateWithCompletion___block_invoke_2;
  v5[3] = &unk_1EA3F7250;
  objc_copyWeak(&v7, &location);
  v6 = *(id *)(a1 + 40);
  -[NRDevicePairingManagerMux registerPairingManager:withCompletion:]((uint64_t)v3, v4, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __49__NRDevicePairingManager_activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char v11;
  void *v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  NSObject *v23;
  _QWORD *v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  char v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      if (nrCopyLogObj_onceToken_1095 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1095, &__block_literal_global_1096);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1097, OS_LOG_TYPE_ERROR))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1097, 16, (uint64_t)"%s%.30s:%-4d Registering pairing manager failed: %@", v5, v6, v7, v8, v9, (uint64_t)");
      v11 = 0;
      v12 = v3;
    }
    else
    {
      v14 = WeakRetained;
      objc_sync_enter(v14);
      v15 = v14[1];
      objc_sync_exit(v14);

      if (v15 == 2)
      {
        -[NRDevicePairingManager setInternalManagerState:](v14, 3);
        v12 = 0;
        v11 = 1;
      }
      else
      {
        if (nrCopyLogObj_onceToken_1095 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1095, &__block_literal_global_1096);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1097, OS_LOG_TYPE_ERROR))
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1097, 16, (uint64_t)"%s%.30s:%-4d State changed while registering pairing manager", v16, v17, v18, v19, v20, (uint64_t)");
        objc_opt_self();
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = *MEMORY[0x1E0CB2D50];
        v31[0] = CFSTR("Manager is in invalid state for this operation");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -3001, v22);

        v11 = 0;
      }
    }
    v23 = v10[7];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__NRDevicePairingManager_activateWithCompletion___block_invoke_3;
    block[3] = &unk_1EA3F7228;
    v29 = v11;
    v24 = v10;
    v26 = v24;
    v28 = *(id *)(a1 + 32);
    v13 = v12;
    v27 = v13;
    dispatch_async(v23, block);
    if (v3)
      -[NRDevicePairingManager invalidateWithError:](v24, v13);

  }
  else
  {
    v13 = v3;
  }

}

uint64_t __49__NRDevicePairingManager_activateWithCompletion___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "setManagerState:", 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (void)unpairDevice:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NRDevicePairingManagerMux *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_opt_self();
    os_unfair_lock_lock((os_unfair_lock_t)&copySharedInstance_gSharedInstanceLock);
    WeakRetained = (NRDevicePairingManagerMux *)objc_loadWeakRetained(&copySharedInstance_gSharedInstance);
    if (!WeakRetained)
    {
      WeakRetained = objc_alloc_init(NRDevicePairingManagerMux);
      objc_storeWeak(&copySharedInstance_gSharedInstance, WeakRetained);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&copySharedInstance_gSharedInstanceLock);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __54__NRDevicePairingManager_unpairDevice_withCompletion___block_invoke;
    v16[3] = &unk_1EA3F7340;
    v17 = v5;
    v18 = v6;
    -[NRDevicePairingManagerMux unpairDevice:withCompletion:]((uint64_t)WeakRetained, v17, v16);

  }
  else
  {
    v8 = nrCopyLogObj_1090();
    v9 = v8;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v10 = os_log_type_enabled(v8, OS_LOG_TYPE_FAULT);

      if (!v10)
        goto LABEL_6;
    }
    WeakRetained = (NRDevicePairingManagerMux *)nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)WeakRetained, 17, (uint64_t)"%s called with null nrDeviceIdentifier", v11, v12, v13, v14, v15, (uint64_t)"+[NRDevicePairingManager unpairDevice:withCompletion:]");
  }

LABEL_6:
}

void __54__NRDevicePairingManager_unpairDevice_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  os_log_t v4;
  os_log_t v5;
  _BOOL4 v6;
  void *v7;
  os_log_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "nrDeviceIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = _NRCopyLogObjectForNRUUID(v3);
    v5 = v4;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

      if (!v6)
        goto LABEL_6;
    }
    objc_msgSend(*(id *)(a1 + 32), "nrDeviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = _NRCopyLogObjectForNRUUID(v7);
    _NRLogWithArgs((uint64_t)v8, 16, (uint64_t)"%s%.30s:%-4d unpairing failed: %@", v9, v10, v11, v12, v13, (uint64_t)");

  }
LABEL_6:
  v14 = *(_QWORD *)(a1 + 40);
  v15 = v16;
  if (v14)
  {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v16);
    v15 = v16;
  }

}

+ (uint64_t)copyXPCError
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v0 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v4 = *MEMORY[0x1E0CB2D50];
  v5[0] = CFSTR("An XPC connection error occurred");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v1);

  return v2;
}

+ (uint64_t)copyErrorForCode:(uint64_t)a1
{
  objc_opt_self();
  return objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), a2, 0);
}

void __46__NRDevicePairingManager_discoveredCandidate___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "candidateDiscoveredHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

void __40__NRDevicePairingManager_lostCandidate___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "candidateLostHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

void __64__NRDevicePairingManager_receivedRequestForAuthMethod_authData___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "authRequestHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

uint64_t __59__NRDevicePairingManager_pairingSucceededWithPairedDevice___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setManagerState:", 2);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)pairingFailedWithError:(void *)a1
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  SEL v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v3 = a2;
  if (a1)
  {
    v4 = a1;
    objc_sync_enter(v4);
    v5 = v4[1];
    objc_sync_exit(v4);

    if (v5 == 8)
    {
      v7 = objc_getProperty(v4, v6, 80, 1);
      objc_setProperty_atomic_copy(v4, v8, 0, 80);
      -[NRDevicePairingManager setInternalManagerState:](v4, 3);
      v9 = v4[7];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__NRDevicePairingManager_pairingFailedWithError___block_invoke;
      block[3] = &unk_1EA3F73B8;
      block[4] = v4;
      v13 = v7;
      v12 = v3;
      v10 = v7;
      dispatch_async(v9, block);

    }
  }

}

uint64_t __49__NRDevicePairingManager_pairingFailedWithError___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setManagerState:", 2);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40), 0);
  return result;
}

@end
