@implementation NRDevicePreferencesQuickRelay

- (NRDevicePreferencesQuickRelay)initWithNRUUID:(id)a3
{
  NSUUID *v4;
  NSUUID *v5;
  NRDevicePreferencesQuickRelay *v6;
  NRDevicePreferencesQuickRelay *v7;
  NSUUID *nrUUID;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  objc_super v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (NSUUID *)a3;
  if (!v4)
  {
    v10 = nrCopyLogObj_852();
    v11 = v10;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v12 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (!v12)
        goto LABEL_14;
    }
    v16 = nrCopyLogObj_852();
    _NRLogWithArgs((uint64_t)v16, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL nrUUID", v17, v18, v19, v20, v21, (uint64_t)");

LABEL_14:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v22 = _os_log_pack_fill();
    *(_DWORD *)v22 = 136446466;
    *(_QWORD *)(v22 + 4) = "-[NRDevicePreferencesQuickRelay initWithNRUUID:]";
    *(_WORD *)(v22 + 12) = 2080;
    *(_QWORD *)(v22 + 14) = "-[NRDevicePreferencesQuickRelay initWithNRUUID:]";
    goto LABEL_18;
  }
  v5 = v4;
  v31.receiver = self;
  v31.super_class = (Class)NRDevicePreferencesQuickRelay;
  v6 = -[NRDevicePreferencesQuickRelay init](&v31, sel_init);
  if (!v6)
  {
    v13 = nrCopyLogObj_852();
    v14 = v13;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v15 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

      if (!v15)
        goto LABEL_17;
    }
    v23 = nrCopyLogObj_852();
    _NRLogWithArgs((uint64_t)v23, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v24, v25, v26, v27, v28, (uint64_t)");

LABEL_17:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v29 = _os_log_pack_fill();
    *(_DWORD *)v29 = 136446210;
    *(_QWORD *)(v29 + 4) = "-[NRDevicePreferencesQuickRelay initWithNRUUID:]";
LABEL_18:
    v30 = nrCopyLogObj_852();
    _NRLogAbortWithPack(v30);
  }
  v7 = v6;
  if (nrXPCCopyQueue_onceToken != -1)
    dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2127);
  objc_storeStrong((id *)&v7->_queue, (id)nrXPCCopyQueue_nrXPCQueue);
  nrUUID = v7->_nrUUID;
  v7->_nrUUID = v5;

  return v7;
}

- (void)dealloc
{
  OS_nw_path *path;
  OS_nw_path_evaluator *pathEvaluator;
  objc_super v5;

  if (self)
  {
    path = self->_path;
    self->_path = 0;

    if (self->_pathEvaluator)
    {
      nw_path_evaluator_cancel();
      pathEvaluator = self->_pathEvaluator;
      self->_pathEvaluator = 0;

    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NRDevicePreferencesQuickRelay;
  -[NRDevicePreferencesQuickRelay dealloc](&v5, sel_dealloc);
}

- (void)addQuickRelayRequest
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__NRDevicePreferencesQuickRelay_addQuickRelayRequest__block_invoke;
  block[3] = &unk_1EA3F72A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)removeQuickRelayRequest
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__NRDevicePreferencesQuickRelay_removeQuickRelayRequest__block_invoke;
  block[3] = &unk_1EA3F72A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)removeAllQuickRelayRequests
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__NRDevicePreferencesQuickRelay_removeAllQuickRelayRequests__block_invoke;
  block[3] = &unk_1EA3F72A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_agentUUID, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __60__NRDevicePreferencesQuickRelay_removeAllQuickRelayRequests__block_invoke(uint64_t a1)
{
  -[NRDevicePreferencesQuickRelay resetInner](*(_QWORD *)(a1 + 32));
}

- (void)resetInner
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (nrCopyLogObj_onceToken_833 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_835, OS_LOG_TYPE_INFO))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_835, 1, (uint64_t)"%s%.30s:%-4d Resetting state", v2, v3, v4, v5, v6, (uint64_t)");
    -[NRDevicePreferencesQuickRelay setAssertCount:](a1, 0);
    *(_BYTE *)(a1 + 8) = 0;
    v7 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    v8 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;

    if (*(_QWORD *)(a1 + 48))
    {
      nw_path_evaluator_cancel();
      v9 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

    }
  }
}

- (void)setAssertCount:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (nrCopyLogObj_onceToken_833 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_835, OS_LOG_TYPE_INFO))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_835, 1, (uint64_t)"%s%.30s:%-4d Setting quick relay assert count: %ld -> %ld", v4, v5, v6, v7, v8, (uint64_t)");
    *(_QWORD *)(a1 + 56) = a2;
  }
}

void __56__NRDevicePreferencesQuickRelay_removeQuickRelayRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  int v14;
  const char *v15;

  v9 = *(_QWORD *)(a1 + 32);
  if (!v9 || (v10 = *(_QWORD *)(v9 + 56)) == 0)
  {
    if (nrCopyLogObj_onceToken_833 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_835, OS_LOG_TYPE_FAULT))
      goto LABEL_17;
    v12 = nrCopyLogObj_sNRLogObj_835;
    v13 = "No quick relay request to disable";
    v14 = 17;
    goto LABEL_16;
  }
  -[NRDevicePreferencesQuickRelay setAssertCount:](v9, v10 - 1);
  v11 = *(_QWORD *)(a1 + 32);
  if (!v11 || !*(_QWORD *)(v11 + 56))
  {
    if (nrCopyLogObj_onceToken_833 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_835, OS_LOG_TYPE_INFO))
      goto LABEL_17;
    v12 = nrCopyLogObj_sNRLogObj_835;
    v15 = "";
    v13 = "%s%.30s:%-4d All clients of quick relay went away";
    v14 = 1;
LABEL_16:
    _NRLogWithArgs(v12, v14, (uint64_t)v13, a4, a5, a6, a7, a8, (uint64_t)v15);
LABEL_17:
    -[NRDevicePreferencesQuickRelay resetInner](*(_QWORD *)(a1 + 32));
  }
}

void __53__NRDevicePreferencesQuickRelay_addQuickRelayRequest__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *evaluator_for_endpoint;
  NSObject *v17;
  nw_path_status_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  BOOL v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  nw_path_status_t status;
  char v50;
  id v51;
  _QWORD applier[5];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_QWORD *)(v2 + 48))
  {
    -[NRDevicePreferencesQuickRelay setAssertCount:](v2, *(_QWORD *)(v2 + 56) + 1);
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      v4 = *(NSObject **)(v3 + 40);
    else
      v4 = 0;
    if (nw_path_get_status(v4) != nw_path_status_satisfied)
      return;
    v5 = *(_QWORD *)(a1 + 32);
    if (!v5)
    {
      v31 = 0;
      v32 = *(_QWORD *)(a1 + 32);
      if (v32)
        goto LABEL_49;
      goto LABEL_58;
    }
    v53 = 0;
    v54 = &v53;
    v55 = 0x2020000000;
    v56 = 0;
    v6 = *(id *)(v5 + 16);
    dispatch_assert_queue_V2(v6);

    v7 = *(void **)(v5 + 40);
    if (v7)
    {
      v8 = v7;
      v9 = (id)nw_path_copy_netagent_dictionary();

      if (v9 && MEMORY[0x1DF0BA7A8](v9) == MEMORY[0x1E0C812F8])
      {
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = __50__NRDevicePreferencesQuickRelay_shouldAssertAgent__block_invoke;
        applier[3] = &unk_1EA3F7170;
        applier[4] = &v53;
        xpc_dictionary_apply(v9, applier);
      }
      else
      {
        if (nrCopyLogObj_onceToken_833 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
        v10 = (id)nrCopyLogObj_sNRLogObj_835;
        v11 = v10;
        if (sNRCopyLogToStdErr)
        {

LABEL_33:
          if (nrCopyLogObj_onceToken_833 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
          v36 = (id)nrCopyLogObj_sNRLogObj_835;
          _NRLogWithArgs((uint64_t)v36, 1, (uint64_t)"%s%.30s:%-4d No netagents to retrieve agent UUID", v37, v38, v39, v40, v41, (uint64_t)");

          goto LABEL_47;
        }
        v35 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);

        if (v35)
          goto LABEL_33;
      }
    }
    else
    {
      if (nrCopyLogObj_onceToken_833 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
      v33 = (id)nrCopyLogObj_sNRLogObj_835;
      v34 = v33;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v42 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);

        if (!v42)
          goto LABEL_48;
      }
      if (nrCopyLogObj_onceToken_833 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
      v9 = (id)nrCopyLogObj_sNRLogObj_835;
      _NRLogWithArgs((uint64_t)v9, 16, (uint64_t)"%s%.30s:%-4d No path to retrieve agent data", v43, v44, v45, v46, v47, (uint64_t)");
    }
LABEL_47:

LABEL_48:
    v31 = *((_BYTE *)v54 + 24) != 0;
    _Block_object_dispose(&v53, 8);
    v32 = *(_QWORD *)(a1 + 32);
    if (v32)
    {
LABEL_49:
      v48 = *(NSObject **)(v32 + 40);
LABEL_50:
      status = nw_path_get_status(v48);
      v50 = !v31;
      if (status != nw_path_status_satisfied)
        v50 = 1;
      if ((v50 & 1) == 0)
        -[NRDevicePreferencesQuickRelay assertAgent](*(_QWORD *)(a1 + 32));
      return;
    }
LABEL_58:
    v48 = 0;
    goto LABEL_50;
  }
  v51 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    v13 = *(void **)(v12 + 24);
  else
    v13 = 0;
  v14 = nrCopyAccountIdentifierForNRUUID(v13);
  objc_msgSend(v51, "setAccount:", v14);

  objc_msgSend(v51, "requireNetworkAgentWithDomain:type:", CFSTR("com.apple.networkrelay"), CFSTR("QuickRelayAgent"));
  v15 = (void *)objc_msgSend(v51, "copyCParameters");
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v17 = nw_path_evaluator_copy_path();
  v18 = nw_path_get_status(v17);
  v19 = *(_QWORD *)(a1 + 32);
  if (v18 != nw_path_status_satisfied && v19)
  {
    *(_BYTE *)(v19 + 8) = 1;
    v19 = *(_QWORD *)(a1 + 32);
  }
  -[NRDevicePreferencesQuickRelay updateAgentUUID:](v19, v17);
  v25 = *(_QWORD *)(a1 + 32);
  if (v25 && (*(_QWORD *)(v25 + 32) || *(_BYTE *)(v25 + 8)))
  {
    v26 = evaluator_for_endpoint;
    nw_path_evaluator_set_update_handler();
    v27 = *(_QWORD *)(a1 + 32);
    if (v27 && (objc_storeStrong((id *)(v27 + 48), evaluator_for_endpoint), (v28 = *(_QWORD *)(a1 + 32)) != 0))
    {
      objc_storeStrong((id *)(v28 + 40), v17);
      v29 = *(_QWORD *)(a1 + 32);
      if (v29)
        v30 = *(_QWORD *)(v29 + 56) + 1;
      else
        v30 = 1;
    }
    else
    {
      v29 = 0;
      v30 = 1;
    }
    -[NRDevicePreferencesQuickRelay setAssertCount:](v29, v30);

    v31 = 1;
    v32 = *(_QWORD *)(a1 + 32);
    if (v32)
      goto LABEL_49;
    goto LABEL_58;
  }
  if (nrCopyLogObj_onceToken_833 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_835, OS_LOG_TYPE_ERROR))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_835, 16, (uint64_t)"%s%.30s:%-4d Failed to get agent UUID", v20, v21, v22, v23, v24, (uint64_t)");

}

- (void)updateAgentUUID:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD applier[5];

  v16 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v3 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    if (v16)
    {
      v9 = nw_path_copy_netagent_dictionary();
      v15 = (void *)v9;
      if (v9 && MEMORY[0x1DF0BA7A8](v9) == MEMORY[0x1E0C812F8])
      {
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = __49__NRDevicePreferencesQuickRelay_updateAgentUUID___block_invoke;
        applier[3] = &unk_1EA3F7148;
        applier[4] = a1;
        xpc_dictionary_apply(v15, applier);
      }
      else
      {
        if (nrCopyLogObj_onceToken_833 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_835, OS_LOG_TYPE_INFO))
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_835, 1, (uint64_t)"%s%.30s:%-4d No netagents to retrieve agent UUID", v10, v11, v12, v13, v14, (uint64_t)");
      }

    }
    else
    {
      if (nrCopyLogObj_onceToken_833 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_835, OS_LOG_TYPE_INFO))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_835, 1, (uint64_t)"%s%.30s:%-4d No path to retrieve agent UUID", v4, v5, v6, v7, v8, (uint64_t)");
    }
  }

}

void __53__NRDevicePreferencesQuickRelay_addQuickRelayRequest__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  int v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  nw_path_status_t status;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  _BOOL4 v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL4 v43;
  const char *v44;
  id v45;

  v4 = a2;
  v10 = *(_QWORD *)(a1 + 32);
  v45 = v4;
  if (v10)
  {
    if (*(_QWORD *)(v10 + 48) != *(_QWORD *)(a1 + 40))
      goto LABEL_3;
    if (*(_QWORD *)(v10 + 56))
    {
      objc_storeStrong((id *)(v10 + 40), a2);
      if (nrCopyLogObj_onceToken_833 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_835, OS_LOG_TYPE_INFO))
      {
        v20 = (id)nrCopyLogObj_sNRLogObj_835;
        _NRLogWithArgs((uint64_t)v20, 1, (uint64_t)"%s%.30s:%-4d Received path: %@", v21, v22, v23, v24, v25, (uint64_t)");

      }
      v26 = *(_QWORD *)(a1 + 32);
      if (v26)
      {
        -[NRDevicePreferencesQuickRelay updateAgentUUID:](v26, *(void **)(v26 + 40));
        v27 = *(_QWORD *)(a1 + 32);
        if (v27)
        {
LABEL_18:
          v28 = *(NSObject **)(v27 + 40);
          goto LABEL_19;
        }
      }
      else
      {
        v27 = *(_QWORD *)(a1 + 32);
        if (v27)
          goto LABEL_18;
      }
      v28 = 0;
LABEL_19:
      status = nw_path_get_status(v28);
      if ((status & 0xFFFFFFFE) == 2)
      {
        v30 = *(_QWORD *)(a1 + 32);
        if (v30 && *(_QWORD *)(v30 + 56))
          *(_BYTE *)(v30 + 8) = 1;
        goto LABEL_9;
      }
      if (status != nw_path_status_satisfied)
        goto LABEL_9;
      v31 = *(_QWORD *)(a1 + 32);
      if (!v31 || !*(_QWORD *)(v31 + 56) || !*(_BYTE *)(v31 + 8))
        goto LABEL_9;
      v32 = *(_QWORD *)(v31 + 32);
      if (nrCopyLogObj_onceToken_833 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
      v33 = (id)nrCopyLogObj_sNRLogObj_835;
      v34 = v33;
      if (!v32)
      {
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v43 = os_log_type_enabled(v33, OS_LOG_TYPE_FAULT);

          if (!v43)
            goto LABEL_9;
        }
        v11 = nrCopyLogObj_852();
        v17 = v11;
        v18 = "No agent UUID while path is satisfied";
        v19 = 17;
        goto LABEL_8;
      }
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v35 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);

        if (!v35)
          goto LABEL_36;
      }
      v36 = nrCopyLogObj_852();
      _NRLogWithArgs((uint64_t)v36, 1, (uint64_t)"%s%.30s:%-4d Reasserting the agent", v37, v38, v39, v40, v41, (uint64_t)");

LABEL_36:
      -[NRDevicePreferencesQuickRelay assertAgent](*(_QWORD *)(a1 + 32));
      v42 = *(_QWORD *)(a1 + 32);
      if (v42)
        *(_BYTE *)(v42 + 8) = 0;
      goto LABEL_9;
    }
LABEL_41:
    if (nrCopyLogObj_onceToken_833 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_835, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_835, 17, (uint64_t)"Received path update when we have no requests", v5, v6, v7, v8, v9, (uint64_t)v44);
    goto LABEL_9;
  }
  if (!*(_QWORD *)(a1 + 40))
    goto LABEL_41;
LABEL_3:
  if (nrCopyLogObj_onceToken_833 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_835, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (id)nrCopyLogObj_sNRLogObj_835;
    v17 = v11;
    v44 = "";
    v18 = "%s%.30s:%-4d Ignoring path evaluator update for a stale evaluator: old: %@, new: %@";
    v19 = 0;
LABEL_8:
    _NRLogWithArgs((uint64_t)v11, v19, (uint64_t)v18, v12, v13, v14, v15, v16, (uint64_t)v44);

  }
LABEL_9:

}

- (uint64_t)assertAgent
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 16));
    v7[0] = 0;
    v7[1] = 0;
    objc_msgSend(*(id *)(v1 + 32), "getUUIDBytes:", v7);
    if (nrCopyLogObj_onceToken_833 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_835, OS_LOG_TYPE_DEFAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_835, 0, (uint64_t)"%s%.30s:%-4d adding quick relay request (count is now %ld)", v2, v3, v4, v5, v6, (uint64_t)");
    return nw_path_assert_agent();
  }
  return result;
}

uint64_t __49__NRDevicePreferencesQuickRelay_updateAgentUUID___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  const char *data;
  uint64_t result;
  void *v6;
  uint64_t v7;
  size_t length;

  length = 0;
  data = (const char *)xpc_dictionary_get_data(xdict, "data", &length);
  result = 1;
  if (data && length >= 0xD8 && length == *((unsigned int *)data + 53) + 216)
  {
    if (!strcmp(data + 16, "com.apple.networkrelay") && !strcmp(data + 48, "QuickRelayAgent"))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", data);
      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
        objc_storeStrong((id *)(v7 + 32), v6);

      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t __50__NRDevicePreferencesQuickRelay_shouldAssertAgent__block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  const char *data;
  uint64_t result;
  uint64_t v6;
  int v7;
  BOOL v8;
  size_t length;

  length = 0;
  data = (const char *)xpc_dictionary_get_data(xdict, "data", &length);
  result = 1;
  if (data)
  {
    if (length >= 0xD8)
    {
      v6 = *((unsigned int *)data + 53);
      if (length == v6 + 216)
      {
        if (!strcmp(data + 16, "com.apple.networkrelay")
          && ((v7 = strcmp(data + 48, "QuickRelayAgent"), (_DWORD)v6 == 1) ? (v8 = v7 == 0) : (v8 = 0), v8))
        {
          __memcpy_chk();
          result = 0;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
        }
        else
        {
          return 1;
        }
      }
    }
  }
  return result;
}

@end
