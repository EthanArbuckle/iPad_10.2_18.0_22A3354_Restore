@implementation FigCaptureClientApplicationStateMonitor

- (FigCaptureClientApplicationStateMonitor)initWithClientAuditToken:(id *)a3 mediaEnvironment:(id)a4 forThirdPartyTorch:(BOOL)a5 applicationAndLayoutStateHandler:(id)a6
{
  _BOOL8 v7;
  FigCaptureClientApplicationStateMonitorClient *v11;
  __int128 v12;
  FigCaptureClientApplicationStateMonitorClient *v13;
  char *v14;
  _OWORD v16[2];

  v7 = a5;
  v11 = [FigCaptureClientApplicationStateMonitorClient alloc];
  v12 = *(_OWORD *)&a3->var0[4];
  v16[0] = *(_OWORD *)a3->var0;
  v16[1] = v12;
  v13 = -[FigCaptureClientApplicationStateMonitorClient initWithAuditToken:mediaEnvironment:forThirdPartyTorch:applicationAndLayoutStateHandler:](v11, "initWithAuditToken:mediaEnvironment:forThirdPartyTorch:applicationAndLayoutStateHandler:", v16, a4, v7, a6);
  v14 = -[FigCaptureClientApplicationStateMonitor _initWithClient:](self, v13);

  return (FigCaptureClientApplicationStateMonitor *)v14;
}

- (char)_initWithClient:(void *)a1
{
  char *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  char v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  os_log_type_t type;
  int v28;
  objc_super v29;
  _OWORD v30[8];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v29.receiver = a1;
  v29.super_class = (Class)FigCaptureClientApplicationStateMonitor;
  v3 = (char *)objc_msgSendSuper2(&v29, sel_init);
  if (!v3)
    return v3;
  *((_QWORD *)v3 + 1) = a2;
  if (dword_1ECFE97F0)
  {
    v28 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  *((_QWORD *)v3 + 2) = FigSimpleMutexCreate();
  v3[80] = objc_msgSend(*((id *)v3 + 1), "clientType") != 5;
  v3[96] = objc_msgSend(*((id *)v3 + 1), "isForThirdPartyTorch", v21, v22) ^ 1;
  if ((objc_msgSend(*((id *)v3 + 1), "isForThirdPartyTorch") & 1) != 0)
    v5 = 0;
  else
    v5 = MGGetBoolAnswer();
  v3[105] = v5;
  v6 = (void *)*((_QWORD *)v3 + 1);
  v7 = BWDeviceIsiPhone();
  v3[113] = v7 & ~objc_msgSend(v6, "isForThirdPartyTorch");
  v8 = (void *)*((_QWORD *)v3 + 1);
  if (v8)
  {
    objc_msgSend(v8, "auditToken");
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }
  v30[0] = v25;
  v30[1] = v26;
  v3[152] = FigCaptureClientIsFacemetricsd(v30);
  *((_DWORD *)v3 + 21) = 0;
  v3[88] = 0;
  *((_DWORD *)v3 + 23) = 0;
  v9 = objc_msgSend(*((id *)v3 + 1), "mediaEnvironment");
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v11 = (void *)objc_msgSend(*((id *)v3 + 1), "processHandle");
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __59__FigCaptureClientApplicationStateMonitor__initWithClient___block_invoke;
    v24[3] = &unk_1E4920F68;
    v24[4] = v3;
    *((_QWORD *)v3 + 7) = (id)objc_msgSend(v11, "rbsProcessMonitorForEndowmentNamespace:serviceClass:updateHandler:", 0x1E495D738, 33, v24);
    -[FigCaptureClientApplicationStateMonitor _updateMediaEnvironmentWithEndowmentInfos:evaluateLayout:]((uint64_t)v3, (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*((id *)v3 + 1), "pid")), 0), "endowmentInfoForHandle"), 0);
  }
  if (v3[80])
  {
    if (FigCaptureAudiomxdSupportEnabled()
       ? -[FigCaptureClientApplicationStateMonitor _createAndObserveAVAudioSessionForBKSApplicationStateMonitoring]((uint64_t)v3)
       : -[FigCaptureClientApplicationStateMonitor _createAndObserveCMSessionForBKSApplicationStateMonitoring]((uint64_t)v3))
    {
      FigDebugAssert3();

      return 0;
    }
  }
  *((_DWORD *)v3 + 31) = 0;
  *((_DWORD *)v3 + 25) = 0;
  v3[104] = 0;
  if (v3[96])
  {
    v13 = +[FigCaptureDisplayLayoutMonitor sharedDisplayLayoutMonitor](FigCaptureDisplayLayoutMonitor, "sharedDisplayLayoutMonitor");
    *((_QWORD *)v3 + 16) = v13;
    objc_msgSend(v13, "addLayoutObserver:", v3);
  }
  *((_DWORD *)v3 + 27) = 0;
  v3[112] = 0;
  if (v3[105])
  {
    v14 = +[FigCaptureDisplayLayoutMonitor sharedExternalDisplayLayoutMonitor](FigCaptureDisplayLayoutMonitor, "sharedExternalDisplayLayoutMonitor");
    *((_QWORD *)v3 + 17) = v14;
    objc_msgSend(v14, "addLayoutObserver:", v3);
  }
  *((_DWORD *)v3 + 29) = 0;
  v3[120] = 0;
  if (v3[113])
  {
    v15 = +[FigCaptureDisplayLayoutMonitor sharedContinuityDisplayLayoutMonitor](FigCaptureDisplayLayoutMonitor, "sharedContinuityDisplayLayoutMonitor");
    *((_QWORD *)v3 + 18) = v15;
    objc_msgSend(v15, "addLayoutObserver:", v3);
  }
  if ((objc_msgSend((id)objc_msgSend(*((id *)v3 + 1), "applicationID"), "isEqualToString:", CFSTR("com.apple.StickerKit.StickerPickerService")) & 1) != 0|| (objc_msgSend((id)objc_msgSend(*((id *)v3 + 1), "applicationID"), "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) != 0)
  {
    v3[64] = 1;
LABEL_27:
    v16 = (void *)objc_msgSend(*((id *)v3 + 1), "processHandle");
    v17 = *MEMORY[0x1E0D22E58];
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __59__FigCaptureClientApplicationStateMonitor__initWithClient___block_invoke_2;
    v23[3] = &unk_1E4920F68;
    v23[4] = v3;
    *((_QWORD *)v3 + 9) = (id)objc_msgSend(v16, "rbsProcessMonitorForEndowmentNamespace:serviceClass:updateHandler:", v17, 33, v23);
    goto LABEL_28;
  }
  v20 = objc_msgSend((id)objc_msgSend(*((id *)v3 + 1), "applicationID"), "isEqualToString:", CFSTR("com.apple.PassbookUIService"));
  v3[64] = v20;
  if ((v20 & 1) != 0)
    goto LABEL_27;
LABEL_28:
  *(_WORD *)(v3 + 153) = 0;
  if (v3[152])
  {
    v18 = +[FigCaptureDeviceLockStateMonitor sharedDeviceLockStateMonitor](FigCaptureDeviceLockStateMonitor, "sharedDeviceLockStateMonitor");
    *((_QWORD *)v3 + 20) = v18;
    objc_msgSend(v18, "addDeviceLockStateObserver:", v3);
  }
  return v3;
}

- (void)layoutMonitor:(id)a3 didUpdateLayout:(id)a4
{
  if (!self->_invalid)
    -[FigCaptureClientApplicationStateMonitor _handleLayout:]((uint64_t)self, a4);
}

- (uint64_t)_resolveApplicationState
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  FigWeakReference *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (!a1)
    return 0;
  FigSimpleMutexCheckIsLockedOnThisThread();
  if (*(_BYTE *)(a1 + 80))
    v2 = +[FigCaptureClientApplicationStateMonitor _applicationStateForBKSApplicationState:clientType:backgroundCameraAccess:]((uint64_t)FigCaptureClientApplicationStateMonitor, *(_DWORD *)(a1 + 84), objc_msgSend(*(id *)(a1 + 8), "clientType"), objc_msgSend(*(id *)(a1 + 8), "hasBackgroundCameraAccess"));
  else
    v2 = 2;
  if (!*(_BYTE *)(a1 + 96) && !*(_BYTE *)(a1 + 105))
  {
    if (!*(_BYTE *)(a1 + 113) || (_DWORD)v2 != 2)
    {
LABEL_9:
      if (*(_BYTE *)(a1 + 152) && (_DWORD)v2 == 2)
      {
        if (*(_BYTE *)(a1 + 153))
          v2 = 1;
        else
          v2 = 2;
      }
      goto LABEL_15;
    }
LABEL_8:
    v3 = -[FigCaptureClientApplicationStateMonitor _resolveAggregateLayoutState](a1);
    v2 = +[FigCaptureClientApplicationStateMonitor _applicationStateForClientLayoutState:clientType:backgroundCameraAccess:]((uint64_t)FigCaptureClientApplicationStateMonitor, v3, objc_msgSend(*(id *)(a1 + 8), "clientType"), objc_msgSend(*(id *)(a1 + 8), "hasBackgroundCameraAccess"));
    goto LABEL_9;
  }
  if ((_DWORD)v2 == 2)
    goto LABEL_8;
  v2 = 1;
LABEL_15:
  if (objc_msgSend(*(id *)(a1 + 8), "clientType") == 3)
  {
    pthread_mutex_lock((pthread_mutex_t *)sLatestForegroundedXPCServiceLock);
    v4 = objc_msgSend((id)objc_msgSend((id)sLatestForegroundXPCServiceApplicationStateMonitorsByHostApplicationID, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 8), "xpcServiceRootHostApplicationID")), "referencedObject");
    v5 = v4;
    if ((_DWORD)v2 == 2)
    {
      if (!v4
        || (v6 = objc_msgSend(*(id *)(v4 + 8), "pid"), v6 == objc_msgSend(*(id *)(a1 + 8), "pid"))
        || (objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "applicationID"), "isEqualToString:", 0x1E493D5D8) & 1) != 0
        || (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "applicationID"), "isEqualToString:", 0x1E493D5D8) & 1) != 0
        || (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "applicationID"), "isEqualToString:", 0x1E493D838) & 1) != 0)
      {
        v7 = -[FigWeakReference initWithReferencedObject:]([FigWeakReference alloc], "initWithReferencedObject:", a1);
        objc_msgSend((id)sLatestForegroundXPCServiceApplicationStateMonitorsByHostApplicationID, "setObject:forKeyedSubscript:", v7, objc_msgSend(*(id *)(a1 + 8), "xpcServiceRootHostApplicationID"));

        v2 = 2;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 8), "xpcServiceRootHostApplicationID");
        objc_msgSend(*(id *)(a1 + 8), "applicationID");
        objc_msgSend(*(id *)(a1 + 8), "pid");
        objc_msgSend(*(id *)(v5 + 8), "applicationID");
        objc_msgSend(*(id *)(v5 + 8), "pid");
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        v2 = 1;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      if (v4 == a1)
        objc_msgSend((id)sLatestForegroundXPCServiceApplicationStateMonitorsByHostApplicationID, "setObject:forKeyedSubscript:", 0, objc_msgSend(*(id *)(a1 + 8), "xpcServiceRootHostApplicationID"));
      v2 = 1;
    }
    pthread_mutex_unlock((pthread_mutex_t *)sLatestForegroundedXPCServiceLock);
  }
  return v2;
}

- (int)clientType
{
  return -[FigCaptureClientApplicationStateMonitorClient clientType](self->_client, "clientType");
}

+ (uint64_t)_applicationStateForClientLayoutState:(unsigned int)a3 clientType:(int)a4 backgroundCameraAccess:
{
  uint64_t result;
  int v8;
  unsigned int v9;

  objc_opt_self();
  result = 1;
  if (a3 <= 8)
  {
    if (((1 << a3) & 0x2E) != 0)
    {
      v8 = a2 - 2;
      if ((a2 - 2) < 5 && ((0x17u >> v8) & 1) != 0)
      {
        return dword_1A32B0E60[v8];
      }
      else if (a4)
      {
        return 2;
      }
      else
      {
        return 1;
      }
    }
    else
    {
      if (a2 == 6)
        v9 = 1;
      else
        v9 = 2;
      if (((1 << a3) & 0x140) != 0)
        return v9;
      else
        return 1;
    }
  }
  return result;
}

+ (uint64_t)_applicationStateForBKSApplicationState:(int)a3 clientType:(int)a4 backgroundCameraAccess:
{
  uint64_t result;

  objc_opt_self();
  result = 1;
  if (a2)
  {
    if (a2 == 4)
    {
      if (a4)
        return 2;
      else
        return 1;
    }
    else if (a2 == 8)
    {
      if ((a3 - 3) >= 5)
        return 2;
      else
        return dword_1A32B0E4C[a3 - 3];
    }
  }
  else if (((a3 - 6) & 0xFFFFFFFD) != 0)
  {
    return 1;
  }
  else
  {
    return 2;
  }
  return result;
}

- (uint64_t)_createAndObserveAVAudioSessionForBKSApplicationStateMonitoring
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _OWORD v25[2];
  os_log_type_t type;
  unsigned int v27;
  int v28;
  const char *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if ((FigCaptureAudiomxdSupportEnabled() & 1) == 0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return 4294954514;
    }
    v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FigCaptureClient-%d"), objc_msgSend(*(id *)(v1 + 8), "pid"));
    v3 = objc_alloc(MEMORY[0x1E0CFF1C8]);
    v4 = *(void **)(v1 + 8);
    if (v4)
      objc_msgSend(v4, "auditToken");
    else
      memset(v25, 0, sizeof(v25));
    v5 = objc_msgSend(v3, "initSiblingSession:auditToken:clientIdentifier:autoReconnect:", 0xFFFFFFFFLL, v25, v2, 1);
    *(_QWORD *)(v1 + 24) = v5;
    if (!v5)
    {
      FigDebugAssert3();
      return 4294954510;
    }
    v6 = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", v1);
    v7 = *(void **)(v1 + 24);
    v8 = MEMORY[0x1E0C809B0];
    v9 = *MEMORY[0x1E0D49368];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __106__FigCaptureClientApplicationStateMonitor__createAndObserveAVAudioSessionForBKSApplicationStateMonitoring__block_invoke;
    v24[3] = &unk_1E491EAC8;
    v24[4] = v6;
    v10 = (void *)objc_msgSend(v7, "addObserverForType:name:block:", 2, v9, v24);
    if (v10)
    {
      *(_QWORD *)(v1 + 40) = v10;
      v11 = *(void **)(v1 + 24);
      v12 = *MEMORY[0x1E0CFF070];
      v23[0] = v8;
      v23[1] = 3221225472;
      v23[2] = __106__FigCaptureClientApplicationStateMonitor__createAndObserveAVAudioSessionForBKSApplicationStateMonitoring__block_invoke_263;
      v23[3] = &unk_1E491EAC8;
      v23[4] = v6;
      v13 = (void *)objc_msgSend(v11, "addObserverForType:name:block:", 1, v12, v23);
      if (v13)
      {
        *(_QWORD *)(v1 + 48) = v13;
        -[FigCaptureClientApplicationStateMonitor _updateBKSApplicationStateFromAVAudioSession](v1);
        return 0;
      }
      v27 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v20 = v27;
      if (os_log_type_enabled(v19, type))
        v21 = v20;
      else
        v21 = v20 & 0xFFFFFFFE;
      if (!v21)
        goto LABEL_24;
      v22 = -[FigCaptureClientApplicationStateMonitor loggingPrefix](v1);
      v28 = 136315394;
      v29 = "-[FigCaptureClientApplicationStateMonitor _createAndObserveAVAudioSessionForBKSApplicationStateMonitoring]";
      v30 = 2114;
      v31 = v22;
    }
    else
    {
      v27 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v16 = v27;
      if (os_log_type_enabled(v15, type))
        v17 = v16;
      else
        v17 = v16 & 0xFFFFFFFE;
      if (!v17)
        goto LABEL_24;
      v18 = -[FigCaptureClientApplicationStateMonitor loggingPrefix](v1);
      v28 = 136315394;
      v29 = "-[FigCaptureClientApplicationStateMonitor _createAndObserveAVAudioSessionForBKSApplicationStateMonitoring]";
      v30 = 2114;
      v31 = v18;
    }
    _os_log_send_and_compose_impl();
LABEL_24:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 4294954510;
  }
  return result;
}

- (uint64_t)_handleLayout:(uint64_t)result
{
  uint64_t v2;
  __CFString *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v2 = result;
  if (*(_BYTE *)(result + 168))
    return result;
  pthread_mutex_lock(*(pthread_mutex_t **)(result + 16));
  v4 = -[FigCaptureClientApplicationStateMonitor _resolveApplicationIDForLayoutMonitoring](v2);
  if (dword_1ECFE97F0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((objc_msgSend(a2, "isPaymentServiceVisible", v11, v12) & 1) != 0)
  {
    v6 = 6;
    goto LABEL_24;
  }
  if (objc_msgSend(*(id *)(v2 + 8), "clientType") == 5)
  {
    v7 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(*(id *)(v2 + 8), "avconferenceClientApplicationIDs"));
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(a2, "foregroundApps"));
    objc_msgSend(v8, "intersectSet:", v7);
    if (objc_msgSend(v8, "count"))
    {
      if ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "foregroundApps"), "count") <= 1)
        v6 = 2;
      else
        v6 = 3;
    }
    else
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(a2, "pipApps"));
      objc_msgSend(v9, "intersectSet:", v7);
      v6 = 4 * (objc_msgSend(v9, "count") != 0);
    }
    goto LABEL_24;
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(v2 + 8), "applicationID"), "isEqualToString:", 0x1E493D5D8))
  {
    if (objc_msgSend(*(id *)(v2 + 128), "isOnLockScreen")
      && !objc_msgSend((id)objc_msgSend(*(id *)(v2 + 8), "xpcServiceRootHostApplicationID"), "isEqualToString:", 0x1E493D878))
    {
      v6 = 0;
      goto LABEL_24;
    }
LABEL_23:
    v6 = 2;
    goto LABEL_24;
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(v2 + 8), "applicationID"), "isEqualToString:", 0x1E493D858))
  {
    if (objc_msgSend(a2, "isSiriVisible"))
      v6 = 2;
    else
      v6 = 0;
  }
  else if (objc_msgSend((id)objc_msgSend(a2, "foregroundApps"), "containsObject:", v4))
  {
    if (objc_msgSend((id)objc_msgSend(a2, "foregroundApps"), "count") == 1)
      goto LABEL_23;
    if ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "foregroundApps"), "count") <= 1)
      v6 = 0;
    else
      v6 = 3;
  }
  else if ((objc_msgSend((id)objc_msgSend(a2, "obscuredApps"), "containsObject:", v4) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend((id)objc_msgSend(a2, "pipApps"), "containsObject:", v4) & 1) != 0)
  {
    v6 = 4;
  }
  else
  {
    v6 = objc_msgSend((id)objc_msgSend(a2, "foregroundApps"), "count") != 0;
  }
LABEL_24:
  v10 = objc_msgSend(a2, "displayType");
  if (v10 <= 2)
    -[FigCaptureClientApplicationStateMonitor _updateClientStateCondition:newValue:](v2, (_DWORD *)(v2 + 8 * v10 + 100), (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6));
  return pthread_mutex_unlock(*(pthread_mutex_t **)(v2 + 16));
}

- (NSString)applicationID
{
  return -[FigCaptureClientApplicationStateMonitorClient applicationID](self->_client, "applicationID");
}

- (uint64_t)_updateClientStateCondition:(void *)a3 newValue:
{
  uint64_t v3;
  NSObject *v6;
  int v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  char v16;
  NSObject *v17;
  int v18;
  int v19;
  _BOOL4 v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if (!*(_BYTE *)(result + 168))
    {
      FigSimpleMutexCheckIsLockedOnThisThread();
      if ((_DWORD *)(v3 + 84) == a2)
      {
        result = objc_msgSend(a3, "unsignedIntValue");
        v7 = result;
        if ((*a2 != (_DWORD)result || !*(_BYTE *)(v3 + 88)) && dword_1ECFE97F0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          result = fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        *a2 = v7;
        v15 = 88;
      }
      else if ((_DWORD *)(v3 + 100) == a2)
      {
        result = objc_msgSend(a3, "intValue");
        v9 = result;
        if ((*a2 != (_DWORD)result || !*(_BYTE *)(v3 + 104)) && dword_1ECFE97F0)
        {
          v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
          result = fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        *a2 = v9;
        v15 = 104;
      }
      else if ((_DWORD *)(v3 + 108) == a2)
      {
        result = objc_msgSend(a3, "intValue");
        v11 = result;
        if ((*a2 != (_DWORD)result || !*(_BYTE *)(v3 + 112)) && dword_1ECFE97F0)
        {
          v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
          result = fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        *a2 = v11;
        v15 = 112;
      }
      else if ((_DWORD *)(v3 + 116) == a2)
      {
        result = objc_msgSend(a3, "intValue");
        v13 = result;
        if ((*a2 != (_DWORD)result || !*(_BYTE *)(v3 + 120)) && dword_1ECFE97F0)
        {
          v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
          result = fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        *a2 = v13;
        v15 = 120;
      }
      else
      {
        if ((_DWORD *)(v3 + 153) != a2)
        {
          v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
          return fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        result = objc_msgSend(a3, "BOOLValue");
        v16 = result;
        if ((*(unsigned __int8 *)a2 != (_DWORD)result || !*(_BYTE *)(v3 + 154)) && dword_1ECFE97F0)
        {
          v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
          result = fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        *(_BYTE *)a2 = v16;
        v15 = 154;
      }
      *(_BYTE *)(v3 + v15) = 1;
      if ((!*(_BYTE *)(v3 + 80) || *(_BYTE *)(v3 + 88))
        && (!*(_BYTE *)(v3 + 96) || *(_BYTE *)(v3 + 104))
        && (!*(_BYTE *)(v3 + 105) || *(_BYTE *)(v3 + 112))
        && (!*(_BYTE *)(v3 + 113) || *(_BYTE *)(v3 + 120))
        && (!*(_BYTE *)(v3 + 152) || *(_BYTE *)(v3 + 154)))
      {
        v18 = -[FigCaptureClientApplicationStateMonitor _resolveApplicationState](v3);
        result = -[FigCaptureClientApplicationStateMonitor _resolveAggregateLayoutState](v3);
        v19 = *(_DWORD *)(v3 + 92);
        v20 = v19 == 2 && *(_DWORD *)(v3 + 124) != (_DWORD)result;
        if (v19 != v18 || v20)
        {
          *(_DWORD *)(v3 + 92) = v18;
          *(_DWORD *)(v3 + 124) = result;
          if (dword_1ECFE97F0)
          {
            v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v22 = objc_msgSend(*(id *)(v3 + 8), "applicationAndLayoutStateHandler", v23, v24);
          return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v22 + 16))(v22, objc_msgSend(*(id *)(v3 + 8), "pid"), *(unsigned int *)(v3 + 92), *(unsigned int *)(v3 + 124));
        }
      }
    }
  }
  return result;
}

- (uint64_t)loggingPrefix
{
  if (result)
    return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p[%d][%@]>"), result, objc_msgSend(*(id *)(result + 8), "pid"), objc_msgSend(*(id *)(result + 8), "applicationID"));
  return result;
}

- (uint64_t)_resolveAggregateLayoutState
{
  _DWORD *v1;
  int v2;
  int v3;
  int v4;

  if (result)
  {
    v1 = (_DWORD *)result;
    FigSimpleMutexCheckIsLockedOnThisThread();
    v2 = v1[25];
    if (v2 == 6)
      return 6;
    v3 = v1[27];
    if (v3 == 6)
      return 6;
    v4 = v1[29];
    if (v4 == 6)
    {
      return 6;
    }
    else
    {
      result = 5;
      if (v2 != 5 && v3 != 5 && v4 != 5)
      {
        result = 4;
        if (v2 != 4 && v3 != 4 && v4 != 4)
        {
          result = 3;
          if (v2 != 3 && v3 != 3 && v4 != 3)
          {
            if (v2 == 2 || v3 == 2 || v4 == 2)
            {
              if (v2 != 1 && v3 != 1)
              {
                if (v4 == 1)
                  return 3;
                else
                  return 2;
              }
            }
            else
            {
              return v3 == 1 && v4 == 1 && v2 == 1;
            }
          }
        }
      }
    }
  }
  return result;
}

- (__CFString)_resolveApplicationIDForLayoutMonitoring
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  void *v17;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[25];

  v22[24] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  FigSimpleMutexCheckIsLockedOnThisThread();
  if (objc_msgSend(*(id *)(a1 + 8), "isSwiftPlaygroundsDevelopmentApp"))
    return CFSTR("com.apple.Playgrounds");
  v4 = objc_msgSend(*(id *)(a1 + 8), "mediaEnvironment");
  v5 = *(void **)(a1 + 8);
  if (!v4)
  {
    if (objc_msgSend(v5, "clientType") == 3)
    {
      v6 = objc_msgSend(*(id *)(a1 + 8), "isSecureCaptureExtension");
      v7 = *(void **)(a1 + 8);
      if ((v6 & 1) == 0)
      {
        v8 = objc_msgSend(v7, "xpcServiceRootHostApplicationID");
        goto LABEL_13;
      }
    }
    else
    {
      v7 = *(void **)(a1 + 8);
      if (*(_BYTE *)(a1 + 64))
      {
        v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "processHandle"), "nonRootSourceProcessHandleForVisibilityEndowment"), "bundleIdentifier");
        goto LABEL_13;
      }
    }
    v8 = objc_msgSend(v7, "applicationID");
LABEL_13:
    v2 = v8;
    v22[0] = 0;
    if (FigCaptureAudiomxdSupportEnabled())
    {
      if (!*(_BYTE *)(a1 + 80))
        goto LABEL_27;
      v9 = (void *)objc_msgSend(*(id *)(a1 + 24), "getMXSessionProperty:error:", *MEMORY[0x1E0D499F0], v22);
      if (v22[0])
      {
LABEL_39:
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        goto LABEL_34;
      }
      v10 = objc_msgSend(v9, "intValue");
      if (!(_DWORD)v10)
      {
LABEL_27:
        if (objc_msgSend(*(id *)(a1 + 8), "applicationIDToInheritAppStateFrom"))
        {
          if (dword_1ECFE97F0)
          {
            v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          objc_msgSend(*(id *)(a1 + 8), "setApplicationIDToInheritAppStateFrom:", 0, v20, v21);
          objc_msgSend(*(id *)(a1 + 8), "setPidToInheritAppStateFrom:", 0);
        }
        return (__CFString *)v2;
      }
    }
    else
    {
      if (!*(_BYTE *)(a1 + 80))
        goto LABEL_27;
      if (CMSessionCopyProperty())
      {
        v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
LABEL_34:
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        return (__CFString *)v2;
      }
      v10 = objc_msgSend(0, "intValue");

      if (!(_DWORD)v10)
        goto LABEL_27;
    }
    if ((_DWORD)v10 == objc_msgSend(*(id *)(a1 + 8), "pidToInheritAppStateFrom"))
    {
LABEL_31:
      if (dword_1ECFE97F0)
      {
        v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "applicationIDToInheritAppStateFrom", v20, v21), "isEqualToString:", 0x1E493D878);
      v17 = *(void **)(a1 + 8);
      if (v16)
        return (__CFString *)objc_msgSend(v17, "applicationID");
      else
        return (__CFString *)objc_msgSend(v17, "applicationIDToInheritAppStateFrom");
    }
    v12 = (void *)objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10), v22);
    if (!v22[0])
    {
      v13 = v12;
      while (objc_msgSend(v12, "hostProcess"))
      {
        v12 = (void *)objc_msgSend(v13, "hostProcess");
        v13 = v12;
      }
      objc_msgSend(*(id *)(a1 + 8), "setPidToInheritAppStateFrom:", objc_msgSend(v13, "pid"));
      objc_msgSend(*(id *)(a1 + 8), "setApplicationIDToInheritAppStateFrom:", objc_msgSend((id)objc_msgSend(v13, "bundle"), "identifier"));
      goto LABEL_31;
    }
    goto LABEL_39;
  }
  return (__CFString *)objc_msgSend(v5, "mediaEnvironmentBundleID");
}

- (uint64_t)_updateBKSApplicationStateFromAVAudioSession
{
  uint64_t v1;
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;
  _QWORD v5[25];

  v5[24] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if ((FigCaptureAudiomxdSupportEnabled() & 1) != 0)
    {
      pthread_mutex_lock(*(pthread_mutex_t **)(v1 + 16));
      v5[0] = 0;
      v2 = (void *)objc_msgSend(*(id *)(v1 + 24), "getMXSessionProperty:error:", *MEMORY[0x1E0D494E8], v5);
      if (v5[0])
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        -[FigCaptureClientApplicationStateMonitor _handleBKSApplicationStateChange:](v1, objc_msgSend(v2, "intValue"));
      }
      return pthread_mutex_unlock(*(pthread_mutex_t **)(v1 + 16));
    }
    else
    {
      v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

- (uint64_t)_handleBKSApplicationStateChange:(uint64_t)result
{
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (result)
  {
    v3 = result;
    FigSimpleMutexCheckIsLockedOnThisThread();
    if (*(_BYTE *)(v3 + 80))
    {
      return -[FigCaptureClientApplicationStateMonitor _updateClientStateCondition:newValue:](v3, (_DWORD *)(v3 + 84), (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2));
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

void __77__FigCaptureClientApplicationStateMonitor_startPrewarmingMonitorWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  void *v7;

  objc_msgSend((id)objc_msgSend(a3, "bundle"), "identifier");
  if (objc_msgSend((id)objc_msgSend(a4, "state"), "taskState") == 4)
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend(a4, "state"), "endowmentNamespaces");
    if (objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0D22E58]))
    {
      if (*(_QWORD *)(a1 + 32))
      {
        if (*(_BYTE *)(a1 + 40))
        {
          v7 = (void *)MEMORY[0x1A858DD40]();
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
          objc_autoreleasePoolPop(v7);
        }
      }
    }
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
  if (initialize_sLayoutMonitorOnceToken != -1)
    dispatch_once(&initialize_sLayoutMonitorOnceToken, &__block_literal_global_227);
}

uint64_t __53__FigCaptureClientApplicationStateMonitor_initialize__block_invoke()
{
  uint64_t result;

  sLatestForegroundXPCServiceApplicationStateMonitorsByHostApplicationID = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  result = FigSimpleMutexCreate();
  sLatestForegroundedXPCServiceLock = result;
  return result;
}

uint64_t __59__FigCaptureClientApplicationStateMonitor__initWithClient___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return -[FigCaptureClientApplicationStateMonitor _handleMediaEndowmentUpdate:](*(_QWORD *)(a1 + 32), a4);
}

- (uint64_t)_handleMediaEndowmentUpdate:(uint64_t)result
{
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if (dword_1ECFE97F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return -[FigCaptureClientApplicationStateMonitor _updateMediaEnvironmentWithEndowmentInfos:evaluateLayout:](v3, (void *)objc_msgSend((id)objc_msgSend(a2, "state", v5, v6), "endowmentInfos"), 1);
  }
  return result;
}

- (uint64_t)_updateMediaEnvironmentWithEndowmentInfos:(int)a3 evaluateLayout:
{
  uint64_t v5;
  _DWORD *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  os_log_type_t type;
  unsigned int v29;
  int v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    v6 = &unk_1ECFE9000;
    if (dword_1ECFE97F0)
    {
      v29 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v24, v38, 16, v20, v22);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(a2);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v12, "endowmentNamespace"), "isEqualToString:", 0x1E495D738))
          {
            if (objc_msgSend((id)objc_msgSend(v12, "environment"), "isEqualToString:", objc_msgSend(*(id *)(v5 + 8), "mediaEnvironment")))
            {
              v13 = (void *)objc_msgSend(v12, "endowment");
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D49F50]);
                goto LABEL_16;
              }
            }
          }
        }
        v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
        if (v9)
          continue;
        break;
      }
      v14 = 0;
LABEL_16:
      v6 = (_DWORD *)&unk_1ECFE9000;
    }
    else
    {
      v14 = 0;
    }
    pthread_mutex_lock(*(pthread_mutex_t **)(v5 + 16));
    if (objc_msgSend(*(id *)(v5 + 8), "mediaEnvironmentBundleID") == v14
      || (objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "mediaEnvironmentBundleID"), "isEqualToString:", v14) & 1) != 0)
    {
      LOBYTE(v14) = 1;
    }
    else
    {
      if (v6[508])
      {
        v29 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v16 = v29;
        if (os_log_type_enabled(v15, type))
          v17 = v16;
        else
          v17 = v16 & 0xFFFFFFFE;
        if (v17)
        {
          v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p[%d][%@]>"), v5, objc_msgSend(*(id *)(v5 + 8), "pid"), objc_msgSend(*(id *)(v5 + 8), "applicationID"));
          v19 = objc_msgSend(*(id *)(v5 + 8), "mediaEnvironmentBundleID");
          v30 = 136315906;
          v31 = "-[FigCaptureClientApplicationStateMonitor _updateMediaEnvironmentWithEndowmentInfos:evaluateLayout:]";
          v32 = 2114;
          v33 = v18;
          v34 = 2114;
          v35 = v19;
          v36 = 2114;
          v37 = v14;
          LODWORD(v23) = 42;
          v21 = &v30;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(*(id *)(v5 + 8), "setMediaEnvironmentBundleID:", v14, v21, v23);
      if (v14)
      {
        objc_msgSend((id)v14, "UTF8String");
        v14 = tcc_identity_create();
        objc_msgSend(*(id *)(v5 + 8), "setMediaEnvironmentTCCIdentity:", v14);

        LOBYTE(v14) = 0;
      }
      else
      {
        objc_msgSend(*(id *)(v5 + 8), "setMediaEnvironmentTCCIdentity:", 0);
      }
    }
    result = pthread_mutex_unlock(*(pthread_mutex_t **)(v5 + 16));
    if ((v14 & 1) == 0)
    {
      if (a3)
        return -[FigCaptureClientApplicationStateMonitor _handleLayout:](v5, (void *)objc_msgSend(*(id *)(v5 + 128), "currentLayout"));
    }
  }
  return result;
}

- (uint64_t)_createAndObserveCMSessionForBKSApplicationStateMonitoring
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  const void *v20;
  _QWORD v21[5];
  _OWORD v22[2];
  os_log_type_t type;
  unsigned int v24;
  int v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (FigCaptureAudiomxdSupportEnabled())
  {
    v24 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v10 = 4294954514;
  }
  else
  {
    v2 = CMSessionCreate();
    if ((_DWORD)v2)
    {
      v10 = v2;
      FigDebugAssert3();
      v24 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FigCaptureClient-%d"), objc_msgSend(*(id *)(a1 + 8), "pid"));
      v3 = CMSessionSetProperty();
      if ((_DWORD)v3
        || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 8), "pid")),
            v3 = CMSessionSetProperty(),
            (_DWORD)v3))
      {
        v10 = v3;
        v24 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      }
      else
      {
        memset(v22, 0, sizeof(v22));
        v4 = *(void **)(a1 + 8);
        if (v4)
          objc_msgSend(v4, "auditToken");
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v22, 32);
        v5 = CMSessionSetProperty();
        if (!(_DWORD)v5)
        {
          v6 = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", a1);
          v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v8 = *MEMORY[0x1E0D49368];
          v9 = *(_QWORD *)(a1 + 32);
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __101__FigCaptureClientApplicationStateMonitor__createAndObserveCMSessionForBKSApplicationStateMonitoring__block_invoke;
          v21[3] = &unk_1E491EAC8;
          v21[4] = v6;
          *(_QWORD *)(a1 + 40) = (id)objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v8, v9, 0, v21);
          -[FigCaptureClientApplicationStateMonitor _updateBKSApplicationStateFromCMSession](a1);
          return 0;
        }
        v10 = v5;
        v24 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v16 = v24;
        if (os_log_type_enabled(v15, type))
          v17 = v16;
        else
          v17 = v16 & 0xFFFFFFFE;
        if (v17)
        {
          v18 = -[FigCaptureClientApplicationStateMonitor loggingPrefix](a1);
          v19 = *(_QWORD *)(a1 + 32);
          v25 = 136315906;
          v26 = "-[FigCaptureClientApplicationStateMonitor _createAndObserveCMSessionForBKSApplicationStateMonitoring]";
          v27 = 2114;
          v28 = v18;
          v29 = 2112;
          v30 = v19;
          v31 = 1024;
          v32 = v10;
          _os_log_send_and_compose_impl();
        }
      }
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v20 = *(const void **)(a1 + 32);
  if (v20)
  {
    CFRelease(v20);
    *(_QWORD *)(a1 + 32) = 0;
  }
  return v10;
}

uint64_t __59__FigCaptureClientApplicationStateMonitor__initWithClient___block_invoke_2(uint64_t a1)
{
  return -[FigCaptureClientApplicationStateMonitor _handleVisibilityEndowmentUpdate:](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_handleVisibilityEndowmentUpdate:(uint64_t)result
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (result)
  {
    v1 = result;
    if (dword_1ECFE97F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (*(_BYTE *)(v1 + 96))
      result = -[FigCaptureClientApplicationStateMonitor _handleLayout:](v1, (void *)objc_msgSend(*(id *)(v1 + 128), "currentLayout"));
    if (*(_BYTE *)(v1 + 105))
      result = -[FigCaptureClientApplicationStateMonitor _handleLayout:](v1, (void *)objc_msgSend(*(id *)(v1 + 136), "currentLayout"));
    if (*(_BYTE *)(v1 + 113))
      return -[FigCaptureClientApplicationStateMonitor _handleLayout:](v1, (void *)objc_msgSend(*(id *)(v1 + 144), "currentLayout"));
  }
  return result;
}

- (void)invalidate
{
  OpaqueFigSimpleMutex *stateChangeLock;
  FigCaptureClientApplicationStateMonitor *v4;

  stateChangeLock = self->_stateChangeLock;
  if (stateChangeLock)
  {
    pthread_mutex_lock((pthread_mutex_t *)stateChangeLock);
    self->_invalid = 1;
    pthread_mutex_unlock((pthread_mutex_t *)self->_stateChangeLock);
  }
  if (-[FigCaptureClientApplicationStateMonitorClient xpcServiceRootHostApplicationID](self->_client, "xpcServiceRootHostApplicationID"))
  {
    pthread_mutex_lock((pthread_mutex_t *)sLatestForegroundedXPCServiceLock);
    v4 = (FigCaptureClientApplicationStateMonitor *)objc_msgSend((id)objc_msgSend((id)sLatestForegroundXPCServiceApplicationStateMonitorsByHostApplicationID, "objectForKeyedSubscript:", -[FigCaptureClientApplicationStateMonitorClient xpcServiceRootHostApplicationID](self->_client, "xpcServiceRootHostApplicationID")), "referencedObject");
    if (v4 == self || v4 == 0)
      objc_msgSend((id)sLatestForegroundXPCServiceApplicationStateMonitorsByHostApplicationID, "setObject:forKeyedSubscript:", 0, -[FigCaptureClientApplicationStateMonitorClient xpcServiceRootHostApplicationID](self->_client, "xpcServiceRootHostApplicationID"));
    pthread_mutex_unlock((pthread_mutex_t *)sLatestForegroundedXPCServiceLock);
  }
  if (FigCaptureAudiomxdSupportEnabled())
    -[FigCaptureClientApplicationStateMonitor _deregisterAndReleaseAVAudioSession]((uint64_t)self);
  else
    -[FigCaptureClientApplicationStateMonitor _deregisterAndReleaseCMSession]((uint64_t)self);
  -[FigCaptureClientApplicationStateMonitorClient invalidate](self->_client, "invalidate");
  -[RBSProcessMonitor invalidate](self->_mediaEndowmentMonitor, "invalidate");

  self->_mediaEndowmentMonitor = 0;
  -[RBSProcessMonitor invalidate](self->_visibilityEndowmentMonitor, "invalidate");

  self->_visibilityEndowmentMonitor = 0;
  -[FigCaptureDisplayLayoutMonitor removeLayoutObserver:](self->_displayLayoutMonitor, "removeLayoutObserver:", self);

  self->_displayLayoutMonitor = 0;
  -[FigCaptureDisplayLayoutMonitor removeLayoutObserver:](self->_externalDisplayLayoutMonitor, "removeLayoutObserver:", self);

  self->_externalDisplayLayoutMonitor = 0;
}

- (void)_deregisterAndReleaseAVAudioSession
{
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (a1)
  {
    if ((FigCaptureAudiomxdSupportEnabled() & 1) != 0)
    {
      v2 = *(void **)(a1 + 24);
      if (v2)
      {
        if (*(_BYTE *)(a1 + 80))
        {
          objc_msgSend(v2, "removeObserverForType:observer:name:", 2, *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D49368]);

          *(_QWORD *)(a1 + 40) = 0;
          objc_msgSend(*(id *)(a1 + 24), "removeObserverForType:observer:name:", 1, *(_QWORD *)(a1 + 48), *MEMORY[0x1E0CFF070]);

          *(_QWORD *)(a1 + 48) = 0;
          v2 = *(void **)(a1 + 24);
        }

        *(_QWORD *)(a1 + 24) = 0;
      }
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (void)_deregisterAndReleaseCMSession
{
  const void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (a1)
  {
    if (FigCaptureAudiomxdSupportEnabled())
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      v2 = *(const void **)(a1 + 32);
      if (v2)
      {
        if (!*(_BYTE *)(a1 + 80)
          || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", *(_QWORD *)(a1 + 40)), *(id *)(a1 + 40), *(_QWORD *)(a1 + 40) = 0, (v2 = *(const void **)(a1 + 32)) != 0))
        {
          CFRelease(v2);
          *(_QWORD *)(a1 + 32) = 0;
        }
      }
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[FigCaptureClientApplicationStateMonitor invalidate](self, "invalidate");

  if (self->_stateChangeLock)
  {
    FigSimpleMutexDestroy();
    self->_stateChangeLock = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureClientApplicationStateMonitor;
  -[FigCaptureClientApplicationStateMonitor dealloc](&v3, sel_dealloc);
}

- (int)applicationState
{
  return self->_applicationState;
}

- (NSString)mediaEnvironment
{
  return -[FigCaptureClientApplicationStateMonitorClient mediaEnvironment](self->_client, "mediaEnvironment");
}

- (OS_tcc_identity)mediaEnvironmentTCCIdentity
{
  return -[FigCaptureClientApplicationStateMonitorClient mediaEnvironmentTCCIdentity](self->_client, "mediaEnvironmentTCCIdentity");
}

- (NSString)debugDescription
{
  void *v3;
  id v4;
  int applicationState;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t aggregateLayoutState;
  const __CFString *v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = -[FigCaptureClientApplicationStateMonitorClient debugDescription](self->_client, "debugDescription");
  applicationState = self->_applicationState;
  v6 = CFSTR("--- Undefined application state ---");
  if (applicationState == 2)
    v6 = CFSTR("Foregrounded");
  if (applicationState == 1)
    v7 = CFSTR("Backgrounded");
  else
    v7 = v6;
  v8 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, state: %@"), v4, v7);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (self->_isBKSApplicationStateMonitoringRequiredForClient)
    objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bksAppState: %@"), FigCaptureBKSApplicationStateToString(self->_bksApplicationState)));
  if (self->_isLayoutMonitoringRequiredForClient || self->_isExternalDisplayLayoutMonitoringRequiredForClient)
  {
    aggregateLayoutState = self->_aggregateLayoutState;
    if (aggregateLayoutState > 6)
      v11 = CFSTR("--- Undefined layout state ---");
    else
      v11 = *(&off_1E4921068 + aggregateLayoutState);
    objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("layout: %@"), v11));
  }
  if (self->_isDeviceLockStateMonitoringRequiredForClient)
    objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("device locked: %d"), self->_deviceIsLocked));
  objc_msgSend(v8, "appendFormat:", CFSTR(" (%@)"), objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", ")));
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v8);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[FigCaptureClientApplicationStateMonitor debugDescription](self, "debugDescription"));
}

void __106__FigCaptureClientApplicationStateMonitor__createAndObserveAVAudioSessionForBKSApplicationStateMonitoring__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1A858DD40]();
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  -[FigCaptureClientApplicationStateMonitor _handleAVAudioSessionApplicationStateDidChangeNotification:]((uint64_t)v5, a2);

  objc_autoreleasePoolPop(v4);
}

- (uint64_t)_handleAVAudioSessionApplicationStateDidChangeNotification:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = result;
  v4 = (void *)objc_msgSend(a2, "name");
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49368]) & 1) == 0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (dword_1ECFE97F0)
  {
    v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6 = (void *)objc_msgSend(a2, "userInfo", v11, v12);
  v7 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D492C0]);
  if (!v7)
  {
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v8 = (void *)v7;
  pthread_mutex_lock(*(pthread_mutex_t **)(v3 + 16));
  if (!*(_BYTE *)(v3 + 168))
    -[FigCaptureClientApplicationStateMonitor _handleBKSApplicationStateChange:](v3, objc_msgSend(v8, "intValue"));
  return pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 16));
}

void __106__FigCaptureClientApplicationStateMonitor__createAndObserveAVAudioSessionForBKSApplicationStateMonitoring__block_invoke_263(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1A858DD40]();
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  -[FigCaptureClientApplicationStateMonitor _handleAVAudioSessionMediaServicesWereResetNotification:]((uint64_t)v5, a2);

  objc_autoreleasePoolPop(v4);
}

- (uint64_t)_handleAVAudioSessionMediaServicesWereResetNotification:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v5;

  if (result)
  {
    v2 = result;
    v3 = (void *)objc_msgSend(a2, "name");
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CFF070]) & 1) != 0)
    {
      if (dword_1ECFE97F0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return -[FigCaptureClientApplicationStateMonitor _updateBKSApplicationStateFromAVAudioSession](v2);
    }
    else
    {
      v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

void __101__FigCaptureClientApplicationStateMonitor__createAndObserveCMSessionForBKSApplicationStateMonitoring__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1A858DD40]();
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  -[FigCaptureClientApplicationStateMonitor _handleCMSessionApplicationStateDidChangeNotification:]((uint64_t)v5, a2);

  objc_autoreleasePoolPop(v4);
}

- (uint64_t)_handleCMSessionApplicationStateDidChangeNotification:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = result;
  v4 = (void *)objc_msgSend(a2, "name");
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49368]) & 1) == 0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (dword_1ECFE97F0)
  {
    v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6 = (void *)objc_msgSend(a2, "userInfo", v11, v12);
  v7 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D492C0]);
  if (!v7)
  {
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v8 = (void *)v7;
  pthread_mutex_lock(*(pthread_mutex_t **)(v3 + 16));
  if (!*(_BYTE *)(v3 + 168))
    -[FigCaptureClientApplicationStateMonitor _handleBKSApplicationStateChange:](v3, objc_msgSend(v8, "intValue"));
  return pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 16));
}

- (uint64_t)_updateBKSApplicationStateFromCMSession
{
  uint64_t v1;
  NSObject *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (result)
  {
    v1 = result;
    if (FigCaptureAudiomxdSupportEnabled())
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      pthread_mutex_lock(*(pthread_mutex_t **)(v1 + 16));
      if (CMSessionCopyProperty())
      {
        v2 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        -[FigCaptureClientApplicationStateMonitor _handleBKSApplicationStateChange:](v1, objc_msgSend(0, "intValue"));
      }

      return pthread_mutex_unlock(*(pthread_mutex_t **)(v1 + 16));
    }
  }
  return result;
}

+ (uint64_t)_mapRBSProcessStateToFigCaptureBKSApplicationState:(uint64_t)a1
{
  void *v3;
  uint64_t result;

  objc_opt_self();
  switch(objc_msgSend(a2, "taskState"))
  {
    case 1u:
      result = 1;
      break;
    case 2u:
    case 4u:
      v3 = (void *)objc_msgSend(a2, "endowmentNamespaces");
      if (objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0D22E58]))
        result = 8;
      else
        result = 4;
      break;
    case 3u:
      result = 2;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)_updateBKSApplicationStateFromRBSState
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (uint64_t)result;
    v2 = objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingIdentifier:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(result[1], "pid")));
    v3 = (void *)objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
    v8[0] = *MEMORY[0x1E0D22E58];
    objc_msgSend(v3, "setEndowmentNamespaces:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1));
    v4 = (void *)objc_msgSend(MEMORY[0x1E0D87DB8], "statesForPredicate:withDescriptor:error:", v2, v3, 0);
    result = (id *)objc_msgSend(v4, "count");
    if (result == (id *)1)
    {
      result = (id *)objc_msgSend(v4, "firstObject");
      if (result)
      {
        v5 = +[FigCaptureClientApplicationStateMonitor _mapRBSProcessStateToFigCaptureBKSApplicationState:]((uint64_t)FigCaptureClientApplicationStateMonitor, result);
        pthread_mutex_lock(*(pthread_mutex_t **)(v1 + 16));
        if (dword_1ECFE97F0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[FigCaptureClientApplicationStateMonitor _handleBKSApplicationStateChange:](v1, v5);
        if (dword_1ECFE97F0)
        {
          v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        return (id *)pthread_mutex_unlock(*(pthread_mutex_t **)(v1 + 16));
      }
    }
  }
  return result;
}

- (void)updateApplicationState
{
  if (!self->_invalid)
    -[FigCaptureClientApplicationStateMonitor _updateBKSApplicationStateFromRBSState]((id *)&self->super.isa);
}

- (void)deviceLockStateMonitor:(id)a3 didUpdateDeviceLockState:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  pthread_mutex_lock((pthread_mutex_t *)self->_stateChangeLock);
  -[FigCaptureClientApplicationStateMonitor _updateClientStateCondition:newValue:]((uint64_t)self, &self->_deviceIsLocked, (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4));
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateChangeLock);
}

+ (void)startPrewarmingMonitorWithHandler:(id)a3
{
  id v4;
  _QWORD v5[6];
  char v6;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", 0x1E493D4D8, 0x1E493D5F8, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__FigCaptureClientApplicationStateMonitor_startPrewarmingMonitorWithHandler___block_invoke;
  v5[3] = &unk_1E4920FB8;
  v5[4] = v4;
  v5[5] = a3;
  v6 = 1;
  sPrewarmingProcessMonitor = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0D87D90], "monitorWithConfiguration:", v5);

}

uint64_t __77__FigCaptureClientApplicationStateMonitor_startPrewarmingMonitorWithHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v6[5];
  char v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  objc_msgSend(v4, "setValues:", 1);
  v9[0] = *MEMORY[0x1E0D22E58];
  objc_msgSend(v4, "setEndowmentNamespaces:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1));
  objc_msgSend(a2, "setStateDescriptor:", v4);
  v8 = objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifiers:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(a2, "setPredicates:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__FigCaptureClientApplicationStateMonitor_startPrewarmingMonitorWithHandler___block_invoke_2;
  v6[3] = &unk_1E4920F90;
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = *(_BYTE *)(a1 + 48);
  return objc_msgSend(a2, "setUpdateHandler:", v6);
}

+ (void)stopPrewarmingMonitor
{
  objc_msgSend((id)sPrewarmingProcessMonitor, "invalidate");

  sPrewarmingProcessMonitor = 0;
}

+ (void)startContinuityCaptureTerminationMonitorWithHandler:(id)a3
{
  _QWORD v3[5];

  if (!sContinuityCaptureProcessTerminationMonitor)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __95__FigCaptureClientApplicationStateMonitor_startContinuityCaptureTerminationMonitorWithHandler___block_invoke;
    v3[3] = &unk_1E4921008;
    v3[4] = a3;
    sContinuityCaptureProcessTerminationMonitor = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0D87D90], "monitorWithConfiguration:", v3);
  }
}

uint64_t __95__FigCaptureClientApplicationStateMonitor_startContinuityCaptureTerminationMonitorWithHandler___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v5[5];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor"), "setValues:", 1);
  objc_msgSend(a2, "setEvents:", 1);
  v6[0] = objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", 0x1E493D838);
  v6[1] = objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingJobLabel:", 0x1E493D538);
  objc_msgSend(a2, "setPredicates:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __95__FigCaptureClientApplicationStateMonitor_startContinuityCaptureTerminationMonitorWithHandler___block_invoke_2;
  v5[3] = &unk_1E4920FE0;
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "setUpdateHandler:", v5);
}

void __95__FigCaptureClientApplicationStateMonitor_startContinuityCaptureTerminationMonitorWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "exitEvent"), "process"), "pid");
  v7 = v5;
  if (dword_1ECFE97F0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    v5 = fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v9 = (void *)MEMORY[0x1A858DD40](v5, v6);
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7);
    objc_autoreleasePoolPop(v9);
  }
}

@end
