@implementation NRPreferWiFi

- (NRPreferWiFi)init
{
  NRPreferWiFi *v2;
  NRPreferWiFi *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  objc_super v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)NRPreferWiFi;
  v2 = -[NRPreferWiFi init](&v30, sel_init);
  if (!v2)
  {
    v8 = nrCopyLogObj_68();
    v9 = v8;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

      if (!v10)
      {
LABEL_17:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v20 = _os_log_pack_fill();
        *(_DWORD *)v20 = 136446210;
        *(_QWORD *)(v20 + 4) = "-[NRPreferWiFi init]";
        v21 = nrCopyLogObj_68();
        _NRLogAbortWithPack(v21);
      }
    }
    v14 = nrCopyLogObj_68();
    _NRLogWithArgs((uint64_t)v14, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v15, v16, v17, v18, v19, (uint64_t)");

    goto LABEL_17;
  }
  v3 = v2;
  if (_NRShouldDebugAutoRelease_onceToken != -1)
    dispatch_once(&_NRShouldDebugAutoRelease_onceToken, &__block_literal_global_30);
  if ((_NRShouldDebugAutoRelease_debugAutoRelease & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = dispatch_queue_create("com.apple.networkrelay.preferWiFi", v4);

  if (!v5)
  {
    v11 = nrCopyLogObj_68();
    v12 = v11;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v13 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (!v13)
      {
LABEL_20:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v28 = _os_log_pack_fill();
        *(_DWORD *)v28 = 136446466;
        *(_QWORD *)(v28 + 4) = "nr_dispatch_queue_create";
        *(_WORD *)(v28 + 12) = 2080;
        *(_QWORD *)(v28 + 14) = "com.apple.networkrelay.preferWiFi";
        v29 = nrCopyLogObj_68();
        _NRLogAbortWithPack(v29);
      }
    }
    v22 = nrCopyLogObj_68();
    _NRLogWithArgs((uint64_t)v22, 16, (uint64_t)"%s%.30s:%-4d ABORTING: dispatch_queue_create(%s) failed", v23, v24, v25, v26, v27, (uint64_t)");

    goto LABEL_20;
  }
  queue = v3->_queue;
  v3->_queue = (OS_dispatch_queue *)v5;

  return v3;
}

- (void)dealloc
{
  OS_nw_path *path;
  OS_nw_path_evaluator *evaluator;
  objc_super v5;

  if (self)
  {
    path = self->_path;
    self->_path = 0;

    if (self->_evaluator)
    {
      nw_path_evaluator_cancel();
      evaluator = self->_evaluator;
      self->_evaluator = 0;

    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NRPreferWiFi;
  -[NRPreferWiFi dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_agentUUID, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __30__NRPreferWiFi_sharedInstance__block_invoke()
{
  NRPreferWiFi *v0;
  void *v1;

  v0 = objc_alloc_init(NRPreferWiFi);
  v1 = (void *)sharedInstance_gPreferWiFiInstance;
  sharedInstance_gPreferWiFiInstance = (uint64_t)v0;

}

void __36__NRPreferWiFi_sharedInstanceForP2P__block_invoke()
{
  NRPreferWiFi *v0;
  void *v1;

  v0 = objc_alloc_init(NRPreferWiFi);
  v1 = (void *)sharedInstanceForP2P_gPreferP2PWiFiInstance;
  sharedInstanceForP2P_gPreferP2PWiFiInstance = (uint64_t)v0;

  if (sharedInstanceForP2P_gPreferP2PWiFiInstance)
    *(_BYTE *)(sharedInstanceForP2P_gPreferP2PWiFiInstance + 9) = 1;
}

void __45__NRPreferWiFi_sharedInstanceForP2PImmediate__block_invoke()
{
  NRPreferWiFi *v0;
  void *v1;

  v0 = objc_alloc_init(NRPreferWiFi);
  v1 = (void *)sharedInstanceForP2PImmediate_gPreferP2PImmediatelyInstance;
  sharedInstanceForP2PImmediate_gPreferP2PImmediatelyInstance = (uint64_t)v0;

  if (sharedInstanceForP2PImmediate_gPreferP2PImmediatelyInstance)
    *(_WORD *)(sharedInstanceForP2PImmediate_gPreferP2PImmediatelyInstance + 9) = 257;
}

- (void)resetInner
{
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;

  if (!a1)
    return;
  if (nrCopyLogObj_onceToken_76 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
  if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_77, OS_LOG_TYPE_INFO))
    && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_77, 1, (uint64_t)"%s%.30s:%-4d Resetting state", a4, a5, a6, a7, a8, (uint64_t)"), nrCopyLogObj_onceToken_76 != -1))
  {
    dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
    if (sNRCopyLogToStdErr)
      goto LABEL_9;
  }
  else if (sNRCopyLogToStdErr)
  {
LABEL_9:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_77, 1, (uint64_t)"%s%.30s:%-4d Setting prefer Wi-Fi assert count: %ld -> %ld", a4, a5, a6, a7, a8, (uint64_t)");
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_77, OS_LOG_TYPE_INFO))
    goto LABEL_9;
LABEL_10:
  v9 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 8) = 0;

  v10 = *(NSObject **)(a1 + 56);
  if (v10)
  {
    dispatch_source_cancel(v10);
    v11 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = 0;

  }
  v12 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;

  if (*(_QWORD *)(a1 + 32))
  {
    nw_path_evaluator_cancel();
    v13 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

  }
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
    v3 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    if (v16)
    {
      v9 = nw_path_copy_netagent_dictionary();
      v15 = (void *)v9;
      if (v9 && MEMORY[0x1DF0BA7A8](v9) == MEMORY[0x1E0C812F8])
      {
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = __32__NRPreferWiFi_updateAgentUUID___block_invoke;
        applier[3] = &unk_1EA3F7148;
        applier[4] = a1;
        xpc_dictionary_apply(v15, applier);
      }
      else
      {
        if (nrCopyLogObj_onceToken_76 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_77, OS_LOG_TYPE_ERROR))
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_77, 16, (uint64_t)"%s%.30s:%-4d No netagents to retrieve agent UUID", v10, v11, v12, v13, v14, (uint64_t)");
      }

    }
    else
    {
      if (nrCopyLogObj_onceToken_76 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_77, OS_LOG_TYPE_ERROR))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_77, 16, (uint64_t)"%s%.30s:%-4d No path to update agent UUID", v4, v5, v6, v7, v8, (uint64_t)");
    }
  }

}

uint64_t __32__NRPreferWiFi_updateAgentUUID___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
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
    if (!strcmp(data + 16, "com.apple.networkrelay") && !strcmp(data + 48, "PreferWiFi"))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", data);
      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
        objc_storeStrong((id *)(v7 + 48), v6);

      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void __30__NRPreferWiFi_submitRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  void *v25;
  void *evaluator_for_endpoint;
  NSObject *v27;
  nw_path_status_t status;
  nw_path_status_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  _QWORD v62[3];

  v62[2] = *MEMORY[0x1E0C80C00];
  v9 = *(id *)(a1 + 32);
  if (v9)
    v10 = *((_QWORD *)v9 + 5);
  else
    v10 = 0;
  if (*(_BYTE *)(a1 + 40) != (v10 != 0))
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v21 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
      objc_msgSend(v21, "requireNetworkAgentWithDomain:type:", CFSTR("com.apple.networkrelay"), CFSTR("PreferWiFi"));
      v22 = *(_QWORD *)(a1 + 32);
      if (v22)
        v23 = *(unsigned __int8 *)(v22 + 9) != 0;
      else
        v23 = 0;
      objc_msgSend(v21, "setUseP2P:", v23);
      v24 = *(_QWORD *)(a1 + 32);
      if (v24 && *(_BYTE *)(v24 + 9) && *(_BYTE *)(v24 + 10))
        objc_msgSend(v21, "setTrafficClass:", 300);
      v25 = (void *)objc_msgSend(v21, "copyCParameters");
      evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
      nw_path_evaluator_set_update_handler();
      v27 = nw_path_evaluator_copy_path();
      status = nw_path_get_status(v27);
      v29 = status;
      if (status <= nw_path_status_satisfiable && status != nw_path_status_satisfied)
      {
        v30 = *(_QWORD *)(a1 + 32);
        if (v30)
          *(_BYTE *)(v30 + 8) = 1;
      }
      -[NRPreferWiFi updateAgentUUID:](*(_QWORD *)(a1 + 32), v27);
      v36 = *(_QWORD *)(a1 + 32);
      if (v36 && (*(_QWORD *)(v36 + 48) || *(_BYTE *)(v36 + 8)))
      {
        objc_storeStrong((id *)(v36 + 32), evaluator_for_endpoint);
        v37 = *(_QWORD *)(a1 + 32);
        if (v37)
        {
          objc_storeStrong((id *)(v37 + 24), v27);
          v43 = *(_QWORD *)(a1 + 32);
          if (v43)
          {
            v44 = *(_QWORD *)(v43 + 40) + 1;
            if (nrCopyLogObj_onceToken_76 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_77, OS_LOG_TYPE_INFO))
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_77, 1, (uint64_t)"%s%.30s:%-4d Setting prefer Wi-Fi assert count: %ld -> %ld", v38, v39, v40, v41, v42, (uint64_t)");
            *(_QWORD *)(v43 + 40) = v44;
            v45 = *(_QWORD *)(a1 + 32);
            if (v45)
            {
              if (v29 == nw_path_status_satisfied)
              {
                v46 = *(void **)(v45 + 48);
                if (v46)
                {
                  v62[0] = 0;
                  v62[1] = 0;
                  objc_msgSend(v46, "getUUIDBytes:", v62);
                  nw_path_assert_agent();
                }
              }
            }
          }
        }
      }
      else
      {
        if (nrCopyLogObj_onceToken_76 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_77, OS_LOG_TYPE_ERROR))
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_77, 16, (uint64_t)"%s%.30s:%-4d Failed to get agent UUID", v31, v32, v33, v34, v35, (uint64_t)");
      }

      return;
    }
    if (!v9 || (v47 = *((_QWORD *)v9 + 5)) == 0)
    {
      if (nrCopyLogObj_onceToken_76 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_77, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_77, 17, (uint64_t)"No prefer Wi-Fi request to disable", a4, a5, a6, a7, a8, v60);
      goto LABEL_69;
    }
    if (nrCopyLogObj_onceToken_76 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_77, OS_LOG_TYPE_INFO))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_77, 1, (uint64_t)"%s%.30s:%-4d Setting prefer Wi-Fi assert count: %ld -> %ld", a4, a5, a6, a7, a8, (uint64_t)");
    *((_QWORD *)v9 + 5) = v47 - 1;
    v48 = *(_QWORD *)(a1 + 32);
    if (v48 && *(_QWORD *)(v48 + 40))
      return;
    if (nrCopyLogObj_onceToken_76 == -1)
    {
      if (sNRCopyLogToStdErr)
        goto LABEL_54;
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
      if (sNRCopyLogToStdErr)
        goto LABEL_54;
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_77, OS_LOG_TYPE_INFO))
    {
LABEL_69:
      -[NRPreferWiFi resetInner](*(_QWORD *)(a1 + 32), v49, v50, a4, a5, a6, a7, a8);
      return;
    }
LABEL_54:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_77, 1, (uint64_t)"%s%.30s:%-4d All clients of prefer Wi-Fi went away", a4, a5, a6, a7, a8, (uint64_t)");
    goto LABEL_69;
  }
  if (v10)
  {
    if (v9)
    {
      v11 = *((id *)v9 + 3);
      v12 = *(_QWORD *)(a1 + 32);
      if (v11)
      {
        v9 = v11;
        if (!v12)
          goto LABEL_84;
      }
      else
      {
        if (!v12)
        {
          v9 = 0;
          goto LABEL_84;
        }
        if (*(_QWORD *)(v12 + 40))
          goto LABEL_57;
        v9 = 0;
      }
      v13 = *(id *)(v12 + 24);
      if (v13)
      {
        v14 = *(_QWORD *)(a1 + 32);
        if (v14)
        {
          v15 = *(_QWORD *)(v14 + 40);

          if (!v15)
            goto LABEL_57;
          goto LABEL_85;
        }

LABEL_57:
        if (nrCopyLogObj_onceToken_76 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_77, OS_LOG_TYPE_FAULT))
        {
          v51 = *(_QWORD *)(a1 + 32);
          if (v51)
            v52 = *(_QWORD *)(v51 + 24);
          else
            v52 = 0;
          v61 = (id)nrCopyLogObj_sNRLogObj_77;
          _NRLogWithArgs((uint64_t)v61, 17, (uint64_t)"Something went wrong <path: %@, assert count: %ld>", v53, v54, v55, v56, v57, v52);

        }
        return;
      }
    }
LABEL_84:

LABEL_85:
    v58 = *(_QWORD *)(a1 + 32);
    if (v58)
    {
      v59 = *(_QWORD *)(v58 + 40) + 1;
      if (nrCopyLogObj_onceToken_76 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_77, OS_LOG_TYPE_INFO))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_77, 1, (uint64_t)"%s%.30s:%-4d Setting prefer Wi-Fi assert count: %ld -> %ld", v16, v17, v18, v19, v20, (uint64_t)");
      *(_QWORD *)(v58 + 40) = v59;
    }
    return;
  }
  if (nrCopyLogObj_onceToken_76 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_77, OS_LOG_TYPE_INFO))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_77, 1, (uint64_t)"%s%.30s:%-4d Ignoring setting prefer Wi-Fi to %d", a4, a5, a6, a7, a8, (uint64_t)");
}

void __30__NRPreferWiFi_submitRequest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  nw_path_status_t status;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = *(_QWORD *)(a1 + 32);
  if (v10 && *(_QWORD *)(v10 + 40))
  {
    objc_storeStrong((id *)(v10 + 24), a2);
    if (nrCopyLogObj_onceToken_76 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_77, OS_LOG_TYPE_INFO))
    {
      v11 = (id)nrCopyLogObj_sNRLogObj_77;
      _NRLogWithArgs((uint64_t)v11, 1, (uint64_t)"%s%.30s:%-4d Received path: %@", v12, v13, v14, v15, v16, (uint64_t)");

    }
    v17 = *(_QWORD *)(a1 + 32);
    if (v17)
    {
      -[NRPreferWiFi updateAgentUUID:](v17, *(void **)(v17 + 24));
      v18 = *(_QWORD *)(a1 + 32);
      if (v18)
      {
LABEL_10:
        v19 = *(NSObject **)(v18 + 24);
        goto LABEL_11;
      }
    }
    else
    {
      v18 = *(_QWORD *)(a1 + 32);
      if (v18)
        goto LABEL_10;
    }
    v19 = 0;
LABEL_11:
    status = nw_path_get_status(v19);
    if ((status & 0xFFFFFFFE) == 2)
    {
      v26 = *(_QWORD *)(a1 + 32);
      if (v26 && *(_QWORD *)(v26 + 40))
        *(_BYTE *)(v26 + 8) = 1;
      goto LABEL_39;
    }
    if (status != nw_path_status_satisfied)
      goto LABEL_39;
    v27 = *(_QWORD *)(a1 + 32);
    if (!v27 || !*(_QWORD *)(v27 + 40) || !*(_BYTE *)(v27 + 8))
      goto LABEL_39;
    if (*(_QWORD *)(v27 + 48))
    {
      if (nrCopyLogObj_onceToken_76 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_77, OS_LOG_TYPE_INFO))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_77, 1, (uint64_t)"%s%.30s:%-4d Reasserting the agent", v21, v22, v23, v24, v25, (uint64_t)");
      v38[0] = 0;
      v38[1] = 0;
      v28 = *(_QWORD *)(a1 + 32);
      if (v28)
        v29 = *(void **)(v28 + 48);
      else
        v29 = 0;
      objc_msgSend(v29, "getUUIDBytes:", v38);
      nw_path_assert_agent();
      v30 = *(_QWORD *)(a1 + 32);
      if (v30)
        *(_BYTE *)(v30 + 8) = 0;
      goto LABEL_39;
    }
    if (nrCopyLogObj_onceToken_76 == -1)
    {
      if (sNRCopyLogToStdErr)
        goto LABEL_38;
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
      if (sNRCopyLogToStdErr)
        goto LABEL_38;
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_77, OS_LOG_TYPE_FAULT))
      goto LABEL_39;
LABEL_38:
    v31 = nrCopyLogObj_68();
    _NRLogWithArgs((uint64_t)v31, 17, (uint64_t)"No agent UUID while path is satisfied", v32, v33, v34, v35, v36, v37);

    goto LABEL_39;
  }
  if (nrCopyLogObj_onceToken_76 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_77, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_77, 17, (uint64_t)"Received path update when we have no requests", v4, v5, v6, v7, v8, v37);
LABEL_39:

}

@end
