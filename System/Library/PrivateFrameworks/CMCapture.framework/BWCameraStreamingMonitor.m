@implementation BWCameraStreamingMonitor

+ (id)sharedCameraStreamingMonitor
{
  if (sharedCameraStreamingMonitor_sOnceToken != -1)
    dispatch_once(&sharedCameraStreamingMonitor_sOnceToken, &__block_literal_global_89);
  return (id)sharedCameraStreamingMonitor_sSharedBWCameraStreamingMonitor;
}

- (void)setStreaming:(BOOL)a3 deviceType:(int)a4 streamUniqueID:(id)a5 clientAuditToken:(id *)a6 tccIdentity:(id)a7 mediaEnvironment:(id)a8 completionHandler:(id)a9
{
  __int128 v9;
  NSObject *cameraStreamingMonitorQueue;
  _QWORD v11[9];
  __int128 v12;
  __int128 v13;
  int v14;
  BOOL v15;

  v11[1] = 3221225472;
  v9 = *(_OWORD *)&a6->var0[4];
  v12 = *(_OWORD *)a6->var0;
  cameraStreamingMonitorQueue = self->_cameraStreamingMonitorQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __131__BWCameraStreamingMonitor_setStreaming_deviceType_streamUniqueID_clientAuditToken_tccIdentity_mediaEnvironment_completionHandler___block_invoke;
  v11[3] = &unk_1E4925628;
  v13 = v9;
  v15 = a3;
  v14 = a4;
  v11[4] = self;
  v11[5] = a5;
  v11[6] = a7;
  v11[7] = a8;
  v11[8] = a9;
  dispatch_async(cameraStreamingMonitorQueue, v11);
}

- (void)setCameraAccess:(BOOL)a3 deviceType:(int)a4 clientAuditToken:(id *)a5 tccIdentity:(id)a6 mediaEnvironment:(id)a7 completionHandler:(id)a8
{
  NSObject *cameraStreamingMonitorQueue;
  __int128 v9;
  _QWORD block[8];
  __int128 v11;
  __int128 v12;
  int v13;
  BOOL v14;

  cameraStreamingMonitorQueue = self->_cameraStreamingMonitorQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119__BWCameraStreamingMonitor_setCameraAccess_deviceType_clientAuditToken_tccIdentity_mediaEnvironment_completionHandler___block_invoke;
  block[3] = &unk_1E4925650;
  v14 = a3;
  v9 = *(_OWORD *)&a5->var0[4];
  v11 = *(_OWORD *)a5->var0;
  v12 = v9;
  block[4] = self;
  block[5] = a6;
  v13 = a4;
  block[6] = a7;
  block[7] = a8;
  dispatch_async(cameraStreamingMonitorQueue, block);
}

uint64_t __131__BWCameraStreamingMonitor_setStreaming_deviceType_streamUniqueID_clientAuditToken_tccIdentity_mediaEnvironment_completionHandler___block_invoke(uint64_t a1)
{
  __int128 v2;
  uint64_t PIDFromAuditToken;
  void *v4;
  __int128 *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t result;
  __int128 v20;
  __int128 v21;

  v2 = *(_OWORD *)(a1 + 88);
  v20 = *(_OWORD *)(a1 + 72);
  v21 = v2;
  PIDFromAuditToken = FigCaptureGetPIDFromAuditToken(&v20);
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PIDFromAuditToken));
  if (!v4)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v4, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PIDFromAuditToken));
  }
  v5 = (__int128 *)(a1 + 72);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v4);
  v7 = *(_DWORD *)(a1 + 104);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 108))
  {
    -[BWCameraStreamingMonitor _updateSpeakerInterferenceMitigationRequirementIfNeededWithIsStreaming:deviceType:streamUniqueID:clientAuditToken:](v8, 1u, v7, v9);
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));
    if (objc_msgSend(v6, "count") || !objc_msgSend(v4, "count"))
      goto LABEL_7;
    goto LABEL_6;
  }
  -[BWCameraStreamingMonitor _updateSpeakerInterferenceMitigationRequirementIfNeededWithIsStreaming:deviceType:streamUniqueID:clientAuditToken:](v8, 0, v7, v9);
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(v4, "count"))
  {
LABEL_6:
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_BYTE *)(a1 + 108);
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(_OWORD *)(a1 + 88);
    v20 = *v5;
    v21 = v13;
    -[BWCameraStreamingMonitor _updateCameraStreamingMonitorInfoWithStreaming:cameraAccessGranted:clientAuditToken:tccIdentity:updateStreamingStatus:updateAccessStatus:](v10, v11, 0, &v20, v12, 1, 0);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_DWORD *)(a1 + 104);
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 56);
    v18 = *(_OWORD *)(a1 + 88);
    v20 = *v5;
    v21 = v18;
    -[BWCameraStreamingMonitor _informInternalFrameworksFromSetStreaming:deviceType:clientAuditToken:tccIdentity:mediaEnvironment:](v14, 1, v15, &v20, v16, v17);
  }
LABEL_7:
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateSpeakerInterferenceMitigationRequirementIfNeededWithIsStreaming:(uint64_t)a1 deviceType:(unsigned int)a2 streamUniqueID:(int)a3 clientAuditToken:(void *)a4
{
  int v7;

  if (a1)
  {
    if (FigCaptureSpeakerInterferenceMitigationIsSupported())
    {
      v7 = objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.avfoundation.avcapturedevice.built-in_video:1"));
      if ((a3 - 21) <= 0xFFFFFFFB)
      {
        if (v7)
          FigCaptureSpeakerSetInterferenceMitigationIsRequired(a2, 0);
      }
    }
  }
}

uint64_t __119__BWCameraStreamingMonitor_setCameraAccess_deviceType_clientAuditToken_tccIdentity_mediaEnvironment_completionHandler___block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t result;
  __int128 v12;
  __int128 v13;

  v2 = *(_BYTE *)(a1 + 100);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 80);
  v12 = *(_OWORD *)(a1 + 64);
  v13 = v5;
  -[BWCameraStreamingMonitor _updateCameraStreamingMonitorInfoWithStreaming:cameraAccessGranted:clientAuditToken:tccIdentity:updateStreamingStatus:updateAccessStatus:](v3, 0, v2, &v12, v4, 0, 1);
  if (*(_BYTE *)(a1 + 100))
  {
    v6 = *(_DWORD *)(a1 + 96);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_OWORD *)(a1 + 80);
    v12 = *(_OWORD *)(a1 + 64);
    v13 = v10;
    -[BWCameraStreamingMonitor _informInternalFrameworksFromSetStreaming:deviceType:clientAuditToken:tccIdentity:mediaEnvironment:](v7, 0, v6, &v12, v8, v9);
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (uint64_t)_updateCameraStreamingMonitorInfoWithStreaming:(char)a3 cameraAccessGranted:(__int128 *)a4 clientAuditToken:(uint64_t)a5 tccIdentity:(int)a6 updateStreamingStatus:(int)a7 updateAccessStatus:
{
  uint64_t v7;
  uint64_t v14;
  __int128 v15;
  uint64_t PIDFromAuditToken;
  __int128 v17;
  int PIDVersionFromAuditToken;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  __int128 v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD v29[2];
  _QWORD v30[5];
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  if (!result)
    return result;
  v14 = result;
  if (!_FigIsCurrentDispatchQueue())
  {
    v28 = v7;
    LODWORD(v27) = 0;
    FigDebugAssert3();
  }
  v34 = 0;
  v15 = a4[1];
  v32 = *a4;
  v33 = v15;
  PIDFromAuditToken = FigCaptureGetPIDFromAuditToken(&v32);
  v17 = a4[1];
  v32 = *a4;
  v33 = v17;
  PIDVersionFromAuditToken = FigCaptureGetPIDVersionFromAuditToken(&v32);
  v19 = (void *)objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", objc_msgSend(MEMORY[0x1E0D87D70], "identifierWithPid:", PIDFromAuditToken), &v34);
  if (!a5)
  {
    v24 = objc_msgSend(*(id *)(v14 + 40), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PIDFromAuditToken));
    if (v24)
    {
      v21 = (_QWORD *)v24;
      v25 = a4[1];
      v32 = *a4;
      v33 = v25;
      result = FigCaptureAuditTokenIsValid((uint64_t)&v32);
      if ((_DWORD)result)
      {
        v26 = (void *)v21[2];
        if (v26)
          objc_msgSend(v26, "auditToken");
        else
          memset(v29, 0, sizeof(v29));
        result = FigCaptureGetPIDVersionFromAuditToken(v29);
        if (PIDVersionFromAuditToken != (_DWORD)result)
          return result;
      }
      goto LABEL_17;
    }
    v21 = -[BWCameraStreamingMonitorClientInfo initWithProcessHandle:]([BWCameraStreamingMonitorClientInfo alloc], v19);
    objc_msgSend(*(id *)(v14 + 40), "setObject:forKeyedSubscript:", v21, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PIDFromAuditToken));
    if (v21)
      v22 = (void *)v21[2];
    else
      v22 = 0;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __165__BWCameraStreamingMonitor__updateCameraStreamingMonitorInfoWithStreaming_cameraAccessGranted_clientAuditToken_tccIdentity_updateStreamingStatus_updateAccessStatus___block_invoke_3;
    v30[3] = &unk_1E4925600;
    v30[4] = v14;
    v23 = v30;
    goto LABEL_16;
  }
  v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", tcc_identity_get_identifier());
  result = objc_msgSend(*(id *)(v14 + 48), "objectForKeyedSubscript:", v20);
  v21 = (_QWORD *)result;
  if (!result)
  {
    v21 = -[BWCameraStreamingMonitorClientInfo initWithProcessHandle:]([BWCameraStreamingMonitorClientInfo alloc], v19);
    objc_msgSend(*(id *)(v14 + 48), "setObject:forKeyedSubscript:", v21, v20);
    if (v21)
      v22 = (void *)v21[2];
    else
      v22 = 0;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __165__BWCameraStreamingMonitor__updateCameraStreamingMonitorInfoWithStreaming_cameraAccessGranted_clientAuditToken_tccIdentity_updateStreamingStatus_updateAccessStatus___block_invoke;
    v31[3] = &unk_1E4925600;
    v31[4] = v14;
    v23 = v31;
LABEL_16:
    result = objc_msgSend(v22, "monitorForDeath:", v23, v27, v28);
  }
LABEL_17:
  if (a6)
  {
    if (!v21)
      return result;
    *((_BYTE *)v21 + 8) = a2;
  }
  if (a7)
  {
    if (v21)
      *((_BYTE *)v21 + 9) = a3;
  }
  return result;
}

- (void)_informInternalFrameworksFromSetStreaming:(int)a3 deviceType:(__int128 *)a4 clientAuditToken:(uint64_t)a5 tccIdentity:(uint64_t)a6 mediaEnvironment:
{
  uint64_t v6;
  __int128 v13;
  uint64_t PIDFromAuditToken;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  BOOL v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v38 = v6;
      LODWORD(v37) = 0;
      FigDebugAssert3();
    }
    v13 = a4[1];
    v39 = *a4;
    v40 = v13;
    PIDFromAuditToken = FigCaptureGetPIDFromAuditToken(&v39);
    if (a5)
    {
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", tcc_identity_get_identifier());
      v16 = *(void **)(a1 + 48);
    }
    else
    {
      v17 = *(void **)(a1 + 40);
      v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PIDFromAuditToken);
      v16 = v17;
    }
    v18 = objc_msgSend(v16, "objectForKeyedSubscript:", v15, v37, v38);
    v19 = v18;
    if (v18)
    {
      v20 = *(unsigned __int8 *)(v18 + 8);
      if (*(_BYTE *)(v18 + 9))
        v21 = v20 == 0;
      else
        v21 = 1;
      if (v21)
      {
        if (*(_BYTE *)(v18 + 9))
          v22 = v20 == 0;
        else
          v22 = 0;
        if (v22 && a2 != 0)
        {
          if ((a3 - 17) >= 4)
          {
            v24 = a4[1];
            v39 = *a4;
            v40 = v24;
            -[BWCameraStreamingMonitor _informSystemStatusWithIsStreaming:clientAuditToken:mediaEnvironment:](a1, 0, &v39, a6);
            v25 = a4[1];
            v39 = *a4;
            v40 = v25;
            -[BWCameraStreamingMonitor _informPrivacyAccountingWithIsStreaming:clientInfo:clientAuditToken:tccIdentity:](a1, 0, v19, &v39, a5);
          }
          v26 = a4[1];
          v39 = *a4;
          v40 = v26;
          -[BWCameraStreamingMonitor _informMediaSafetyNetWithIsStreaming:clientAuditToken:](a1, 0, &v39);
          if (a5)
          {
            v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", tcc_identity_get_identifier());
            v28 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v27);
            if (!v28 || !*(_BYTE *)(v28 + 10))
              return;
            v29 = *(void **)(a1 + 48);
            v30 = v27;
          }
          else
          {
            v34 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PIDFromAuditToken));
            if (!v34 || !*(_BYTE *)(v34 + 10))
              return;
            v35 = *(void **)(a1 + 40);
            v30 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PIDFromAuditToken);
            v29 = v35;
          }
          objc_msgSend(v29, "removeObjectForKey:", v30);
        }
      }
      else
      {
        if ((a3 - 17) > 3)
        {
          v32 = a4[1];
          v39 = *a4;
          v40 = v32;
          -[BWCameraStreamingMonitor _informSystemStatusWithIsStreaming:clientAuditToken:mediaEnvironment:](a1, 1, &v39, a6);
          v33 = a4[1];
          v39 = *a4;
          v40 = v33;
          -[BWCameraStreamingMonitor _informPrivacyAccountingWithIsStreaming:clientInfo:clientAuditToken:tccIdentity:](a1, 1, v19, &v39, a5);
        }
        else if (dword_1ECFE93D0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v36 = a4[1];
        v39 = *a4;
        v40 = v36;
        -[BWCameraStreamingMonitor _informMediaSafetyNetWithIsStreaming:clientAuditToken:](a1, 1, &v39);
      }
    }
  }
}

- (uint64_t)_informSystemStatusWithIsStreaming:(__int128 *)a3 clientAuditToken:(uint64_t)a4 mediaEnvironment:
{
  uint64_t v4;
  uint64_t v5;
  __int128 v9;
  __int128 v10;
  id v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v13;
  __int128 v14;
  _QWORD *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[6];
  __int128 v21;
  __int128 v22;
  os_log_type_t type;
  int v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    if (*(_BYTE *)(result + 33))
    {
      if (_FigIsCurrentDispatchQueue())
      {
        if (a2)
        {
LABEL_5:
          v9 = a3[1];
          v25 = *a3;
          v26 = v9;
          if (FigCaptureAuditTokenIsValid((uint64_t)&v25))
          {
            v10 = a3[1];
            v25 = *a3;
            v26 = v10;
            v11 = +[FigCaptureProcessHandle handleForAuditToken:error:](FigCaptureProcessHandle, "handleForAuditToken:error:", &v25, 0);
            if (!v11)
            {
              v24 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              return fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
          else
          {
            v11 = 0;
          }
          v13 = *(void **)(v5 + 16);
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __97__BWCameraStreamingMonitor__informSystemStatusWithIsStreaming_clientAuditToken_mediaEnvironment___block_invoke;
          v20[3] = &unk_1E49255B8;
          v20[4] = a4;
          v20[5] = v11;
          v14 = a3[1];
          v21 = *a3;
          v22 = v14;
          v15 = v20;
          v16 = v13;
          return objc_msgSend(v16, "updateVolatileDataWithBlock:", v15, v18, v19);
        }
      }
      else
      {
        v19 = v4;
        LODWORD(v18) = 0;
        FigDebugAssert3();
        if (a2)
          goto LABEL_5;
      }
      if (dword_1ECFE93D0)
      {
        v24 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v16 = *(void **)(v5 + 16);
      v15 = &__block_literal_global_31;
      return objc_msgSend(v16, "updateVolatileDataWithBlock:", v15, v18, v19);
    }
  }
  return result;
}

- (void)_informMediaSafetyNetWithIsStreaming:(__int128 *)a3 clientAuditToken:
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  const __CFString *v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1 && *(_BYTE *)(a1 + 32))
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    v5 = a3[1];
    v15 = *a3;
    v16 = v5;
    FigCaptureGetPIDFromAuditToken(&v15);
    if (a2)
    {
      v6 = a3[1];
      v15 = *a3;
      v16 = v6;
      if (FigCaptureAuditTokenIsValid((uint64_t)&v15))
      {
        v7 = a3[1];
        v15 = *a3;
        v16 = v7;
        v8 = FigCaptureCopyClientCodeSigningIdentifier(&v15);
      }
      else
      {
        v8 = (const __CFString *)CFRetain(CFSTR("com.apple.camera"));
      }
      v10 = v8;
      if (dword_1ECFE93D0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      MSNMonitorSetCameraState();
      v12 = a3[1];
      v15 = *a3;
      v16 = v12;
      if (FigCaptureClientIsRunningInXCTest(&v15))
      {
        MSNMonitorSetXCTestExceptionState();
        if (!v10)
          return;
        goto LABEL_16;
      }
      v13 = a3[1];
      v15 = *a3;
      v16 = v13;
      if (FigCaptureClientIsNonStandard(&v15)
        && (v14 = a3[1], v15 = *a3, v16 = v14, !FigCaptureClientIsAVConferenced(&v15)))
      {
        CFStringGetCStringPtr(v10, 0x600u);
      }
      else
      {
        MSNMonitorSetXCTestExceptionState();
      }
      MSNMonitorSetCameraNonStandardCameraClient();
      if (v10)
      {
LABEL_16:
        CFStringGetCStringPtr(v10, 0x600u);
        MSNMonitorSetLastCameraClient();
        CFRelease(v10);
      }
    }
    else
    {
      if (dword_1ECFE93D0)
      {
        v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      MSNMonitorSetCameraState();
      MSNMonitorSetXCTestExceptionState();
      MSNMonitorSetCameraNonStandardCameraClient();
    }
  }
}

void __97__BWCameraStreamingMonitor__informSystemStatusWithIsStreaming_clientAuditToken_mediaEnvironment___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  __int128 *v12;
  __int128 v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  void *v20;
  void *v21;
  __int128 v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  __int128 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v37;
  void *STActivityAttributionClass;
  __int128 v39;
  __int128 v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    v11 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "extensionPointIdentifier"), "isEqualToString:", 0x1E493D958);
    v12 = (__int128 *)(a1 + 48);
    v13 = *(_OWORD *)(a1 + 64);
    v54 = *(_OWORD *)(a1 + 48);
    v55 = v13;
    if (!FigCaptureAuditTokenIsValid((uint64_t)&v54) || (v11 & 1) != 0)
    {
      if (v11)
      {
        v29 = objc_alloc((Class)getSTExecutableIdentityClass());
        v30 = *(_OWORD *)(a1 + 64);
        v54 = *v12;
        v55 = v30;
        v31 = (void *)objc_msgSend(v29, "initWithAuditToken:", &v54);
        v32 = (void *)objc_msgSend(objc_alloc((Class)getSTAttributedEntityClass()), "initWithExecutableIdentity:", v31);
        v33 = (void *)objc_msgSend(objc_alloc((Class)getSTExecutableIdentityClass()), "initWithApplicationBundleIdentifier:", objc_msgSend(*(id *)(a1 + 40), "extensionContainingAppBundleIdentifier"));
        v34 = (void *)objc_msgSend(objc_alloc((Class)getSTAttributedEntityClass()), "initWithExecutableIdentity:", v33);
        v35 = (void *)objc_msgSend(objc_alloc((Class)getSTActivityAttributionClass()), "initWithAttributedEntity:activeEntity:", v34, v32);
        if (dword_1ECFE93D0)
        {
          LODWORD(v47) = 0;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        objc_msgSend(a2, "setCameraCaptureAttributions:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v35, v45, v46));

      }
      else
      {
        v41 = (void *)objc_msgSend(objc_alloc((Class)getSTExecutableIdentityClass()), "initWithApplicationBundleIdentifier:", 0x1E493D4D8);
        v42 = (void *)objc_msgSend(objc_alloc((Class)getSTAttributedEntityClass()), "initWithExecutableIdentity:", v41);
        v43 = (void *)objc_msgSend(objc_alloc((Class)getSTActivityAttributionClass()), "initWithAttributedEntity:", v42);
        if (dword_1ECFE93D0)
        {
          v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        objc_msgSend(a2, "setCameraCaptureAttributions:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v43, v45, v46));

      }
      return;
    }
    if (dword_1ECFE93D0)
    {
      LODWORD(v47) = 0;
      v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v37 = (void *)MEMORY[0x1E0C99E60];
    STActivityAttributionClass = (void *)getSTActivityAttributionClass();
    v39 = *v12;
    v40 = *(_OWORD *)(a1 + 64);
LABEL_30:
    v54 = v39;
    v55 = v40;
    objc_msgSend(a2, "setCameraCaptureAttributions:", objc_msgSend(v37, "setWithObject:", objc_msgSend(STActivityAttributionClass, "attributionWithAuditToken:", &v54, v45, v46)));
    return;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v4 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "rbsProcessHandle"), "endowmentInfoForHandle");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (!v5)
  {
LABEL_20:
    if (dword_1ECFE93D0)
    {
      LODWORD(v47) = 0;
      v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v37 = (void *)MEMORY[0x1E0C99E60];
    STActivityAttributionClass = (void *)getSTActivityAttributionClass();
    v39 = *(_OWORD *)(a1 + 48);
    v40 = *(_OWORD *)(a1 + 64);
    goto LABEL_30;
  }
  v6 = v5;
  v7 = *(_QWORD *)v50;
LABEL_4:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v50 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "endowmentNamespace"), "isEqualToString:", 0x1E495D738))
    {
      if (objc_msgSend((id)objc_msgSend(v9, "environment"), "isEqualToString:", *(_QWORD *)(a1 + 32)))
      {
        v10 = (void *)objc_msgSend(v9, "endowment");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
      }
    }
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v6)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  v15 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D49F48]);
  v16 = objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D49F58]);
  if (!v15)
    goto LABEL_20;
  v17 = v16;
  v18 = objc_alloc((Class)getSTExecutableIdentityClass());
  v19 = *(_OWORD *)(a1 + 64);
  v54 = *(_OWORD *)(a1 + 48);
  v55 = v19;
  v20 = (void *)objc_msgSend(v18, "initWithAuditToken:", &v54);
  v21 = (void *)objc_msgSend(objc_alloc((Class)getSTAttributedEntityClass()), "initWithExecutableIdentity:", v20);
  *(_QWORD *)&v22 = -1;
  *((_QWORD *)&v22 + 1) = -1;
  v47 = v22;
  v48 = v22;
  objc_msgSend(v15, "getBytes:length:", &v47, 32);
  v54 = v47;
  v55 = v48;
  FigCaptureGetPIDFromAuditToken(&v54);
  v23 = objc_alloc((Class)getSTExecutableIdentityClass());
  v54 = v47;
  v55 = v48;
  v24 = (void *)objc_msgSend(v23, "initWithAuditToken:", &v54);
  v25 = (void *)objc_msgSend(objc_alloc((Class)getSTAttributedEntityClass()), "initWithExecutableIdentity:website:", v24, v17);
  v26 = (void *)objc_msgSend(objc_alloc((Class)getSTActivityAttributionClass()), "initWithAttributedEntity:activeEntity:", v25, v21);
  if (dword_1ECFE93D0)
  {
    v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "setCameraCaptureAttributions:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v26, v45, v46));

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

void __56__BWCameraStreamingMonitor_sharedCameraStreamingMonitor__block_invoke()
{
  _BOOL8 v0;
  BOOL v1;
  unsigned int v2;
  BOOL v3;
  uint64_t v4;
  id v5;

  if (!SystemStatusLibraryCore_frameworkLibrary)
    SystemStatusLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = SystemStatusLibraryCore_frameworkLibrary
    && getSTActivityAttributionClass()
    && getSTMediaStatusDomainPublisherClass() != 0;
  if (MEMORY[0x1E0D4CDF0])
    v1 = MEMORY[0x1E0D4CDF8] == 0;
  else
    v1 = 1;
  v2 = !v1;
  if (MEMORY[0x1E0D4CE08])
    v3 = MEMORY[0x1E0D4CE10] == 0;
  else
    v3 = 1;
  if (v3)
    v4 = 0;
  else
    v4 = v2;
  if ((v4 & 1) != 0 || v0)
  {
    if (v0)
      v5 = (id)objc_msgSend(objc_alloc((Class)getSTMediaStatusDomainPublisherClass()), "init");
    else
      v5 = 0;
    sharedCameraStreamingMonitor_sSharedBWCameraStreamingMonitor = -[BWCameraStreamingMonitor initWithMediaStatusDomainPublisher:msnReportingEnabled:systemStatusReportingEnabled:privacyAccountingAccessLogger:]([BWCameraStreamingMonitor alloc], "initWithMediaStatusDomainPublisher:msnReportingEnabled:systemStatusReportingEnabled:privacyAccountingAccessLogger:", v5, v4, v0, objc_msgSend((id)getPAAccessLoggerClass(), "sharedInstance"));
  }
}

- (BWCameraStreamingMonitor)initWithMediaStatusDomainPublisher:(id)a3 msnReportingEnabled:(BOOL)a4 systemStatusReportingEnabled:(BOOL)a5 privacyAccountingAccessLogger:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  BWCameraStreamingMonitor *v10;
  BWCameraStreamingMonitor *v11;
  void *v12;
  objc_super v14[2];
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;

  v7 = a5;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BWCameraStreamingMonitor;
  v10 = -[BWCameraStreamingMonitor init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    if (v7)
    {
      v10->_systemStatusReportingEnabled = v7;
      v10->_mediaStatusDomainPublisher = (STMediaStatusDomainPublisher *)a3;
      FigCaptureGetCurrentProcessAuditToken(v14);
      if (FigCaptureClientHasEntitlement(v14, CFSTR("com.apple.systemstatus.activityattribution")))
      {
        v17 = 0;
        v18 = &v17;
        v19 = 0x3052000000;
        v20 = __Block_byref_object_copy__32;
        v21 = __Block_byref_object_dispose__32;
        v12 = (void *)getSTDynamicActivityAttributionPublisherClass_softClass;
        v22 = getSTDynamicActivityAttributionPublisherClass_softClass;
        if (!getSTDynamicActivityAttributionPublisherClass_softClass)
        {
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __getSTDynamicActivityAttributionPublisherClass_block_invoke;
          v16[3] = &unk_1E491EC40;
          v16[4] = &v17;
          __getSTDynamicActivityAttributionPublisherClass_block_invoke((uint64_t)v16);
          v12 = (void *)v18[5];
        }
        _Block_object_dispose(&v17, 8);
        objc_msgSend(v12, "setCurrentAttributionKey:andApp:", 0, 0x1E493D718);
      }
    }
    if (v8)
      v11->_msnReportingEnabled = v8;
    v11->_activeStreamUniqueIDsByClientPID = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    v11->_cameraStreamingMonitorQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v11->_clientInfoByPID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11->_managedClientInfoByBundleID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11->_privacyAccountingAccessLogger = (PAAccessLogger *)a6;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWCameraStreamingMonitor;
  -[BWCameraStreamingMonitor dealloc](&v3, sel_dealloc);
}

- (uint64_t)_handleClientDeath:(uint64_t)result
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  id *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (result)
  {
    v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v13 = v2;
      LODWORD(v12) = 0;
      FigDebugAssert3();
    }
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a2, "pid", v12, v13));
    v6 = objc_msgSend((id)objc_msgSend(a2, "bundle"), "identifier");
    v7 = (id *)(v4 + 48);
    if (!objc_msgSend(*(id *)(v4 + 48), "objectForKeyedSubscript:", v6))
    {
      v10 = *(void **)(v4 + 40);
      v9 = (id *)(v4 + 40);
      v11 = objc_msgSend(v10, "objectForKeyedSubscript:", v5);
      if (v11)
        *(_BYTE *)(v11 + 10) = 1;
      result = objc_msgSend(*v9, "objectForKeyedSubscript:", v5);
      if (result)
      {
        v7 = v9;
        v6 = v5;
        if (*(_BYTE *)(result + 8))
          return result;
      }
      else
      {
        v7 = v9;
        v6 = v5;
      }
      return objc_msgSend(*v7, "removeObjectForKey:", v6);
    }
    v8 = objc_msgSend(*v7, "objectForKeyedSubscript:", v6);
    if (v8)
      *(_BYTE *)(v8 + 10) = 1;
    result = objc_msgSend(*v7, "objectForKeyedSubscript:", v6);
    if (!result || !*(_BYTE *)(result + 8))
      return objc_msgSend(*v7, "removeObjectForKey:", v6);
  }
  return result;
}

uint64_t __97__BWCameraStreamingMonitor__informSystemStatusWithIsStreaming_clientAuditToken_mediaEnvironment___block_invoke_30(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCameraCaptureAttributions:", objc_msgSend(MEMORY[0x1E0C99E60], "set"));
}

- (void)_informPrivacyAccountingWithIsStreaming:(uint64_t)a3 clientInfo:(__int128 *)a4 clientAuditToken:(uint64_t)a5 tccIdentity:
{
  __int128 v10;
  void *v11;
  SEL v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  __int128 v29;
  NSObject *v30;
  void *PATCCAccessClass;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  os_log_type_t type;
  int v41;
  _OWORD v42[2];
  _OWORD v43[2];
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = a4[1];
    v44 = *a4;
    v45 = v10;
    FigCaptureGetPIDFromAuditToken(&v44);
    if (a2)
    {
      if (!a3)
        goto LABEL_12;
      v11 = *(void **)(a3 + 24);
      if (v11)
      {
        objc_msgSend(v11, "end");
        objc_setProperty_nonatomic((id)a3, v12, 0, 24);
      }
      v13 = *(void **)(a3 + 16);
      if (v13)
      {
        objc_msgSend(v13, "auditToken");
        if (FigCaptureClientIsRunningInMediaserverd(v43))
          goto LABEL_23;
      }
      else
      {
LABEL_12:
        memset(v43, 0, sizeof(v43));
        if (FigCaptureClientIsRunningInMediaserverd(v43))
          goto LABEL_23;
        if (!a3)
          goto LABEL_21;
      }
      v15 = *(void **)(a3 + 16);
      if (v15)
      {
        objc_msgSend(v15, "auditToken");
        goto LABEL_22;
      }
LABEL_21:
      memset(v42, 0, sizeof(v42));
LABEL_22:
      if (!FigCaptureClientIsAVConferenced(v42))
      {
        if (!a5)
        {
          v29 = a4[1];
          v44 = *a4;
          v45 = v29;
          if (!FigCaptureAuditTokenIsValid((uint64_t)&v44))
          {
            PATCCAccessClass = (void *)getPATCCAccessClass();
            v26 = objc_msgSend(PATCCAccessClass, "accessWithAccessor:forService:", (id)objc_msgSend(objc_alloc((Class)getPAApplicationClass()), "initWithBundleID:", 0x1E493D4D8), *MEMORY[0x1E0DB10F0]);
            if (dword_1ECFE93D0)
            {
              v41 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            goto LABEL_28;
          }
          if (dword_1ECFE93D0)
          {
            v41 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v34 = (void *)getPATCCAccessClass();
          if (a3 && (v35 = *(void **)(a3 + 16)) != 0)
          {
            objc_msgSend(v35, "auditToken");
          }
          else
          {
            v38 = 0u;
            v39 = 0u;
          }
          v25 = objc_msgSend(v34, "accessWithAuditToken:forService:", &v38, *MEMORY[0x1E0DB10F0], v36, v37);
LABEL_27:
          v26 = v25;
LABEL_28:
          v27 = objc_msgSend(*(id *)(a1 + 56), "beginIntervalForAccess:", v26, v36, v37, v38, v39);
          if (!a3)
            return;
          v19 = (void *)v27;
          v18 = (void *)a3;
          goto LABEL_30;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", tcc_identity_get_identifier());
        if (dword_1ECFE93D0)
        {
          v41 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v33 = getPATCCAccessClass();
        v22 = (id)objc_msgSend(objc_alloc((Class)getPAApplicationClass()), "initWithTCCIdentity:", a5);
        v23 = *MEMORY[0x1E0DB10F0];
        v24 = (void *)v33;
LABEL_26:
        v25 = objc_msgSend(v24, "accessWithAccessor:forService:", v22, v23, v36, v37);
        goto LABEL_27;
      }
LABEL_23:
      if (dword_1ECFE93D0)
      {
        v41 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v21 = getPATCCAccessClass();
      v22 = (id)objc_msgSend((id)getPAApplicationClass(), "applicationWithType:identifier:", 0, 0x1E493D718);
      v23 = *MEMORY[0x1E0DB10F0];
      v24 = (void *)v21;
      goto LABEL_26;
    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", tcc_identity_get_identifier());
      if (dword_1ECFE93D0)
      {
        v41 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
LABEL_18:
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else if (dword_1ECFE93D0)
    {
      v41 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      goto LABEL_18;
    }
    if (!a3)
    {
      objc_msgSend(0, "end");
      return;
    }
    objc_msgSend(*(id *)(a3 + 24), "end");
    v18 = (void *)a3;
    v19 = 0;
LABEL_30:
    objc_setProperty_nonatomic(v18, v17, v19, 24);
  }
}

void __165__BWCameraStreamingMonitor__updateCameraStreamingMonitorInfoWithStreaming_cameraAccessGranted_clientAuditToken_tccIdentity_updateStreamingStatus_updateAccessStatus___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __165__BWCameraStreamingMonitor__updateCameraStreamingMonitorInfoWithStreaming_cameraAccessGranted_clientAuditToken_tccIdentity_updateStreamingStatus_updateAccessStatus___block_invoke_2;
  v4[3] = &unk_1E491E748;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

uint64_t __165__BWCameraStreamingMonitor__updateCameraStreamingMonitorInfoWithStreaming_cameraAccessGranted_clientAuditToken_tccIdentity_updateStreamingStatus_updateAccessStatus___block_invoke_2(uint64_t a1)
{
  return -[BWCameraStreamingMonitor _handleClientDeath:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __165__BWCameraStreamingMonitor__updateCameraStreamingMonitorInfoWithStreaming_cameraAccessGranted_clientAuditToken_tccIdentity_updateStreamingStatus_updateAccessStatus___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __165__BWCameraStreamingMonitor__updateCameraStreamingMonitorInfoWithStreaming_cameraAccessGranted_clientAuditToken_tccIdentity_updateStreamingStatus_updateAccessStatus___block_invoke_4;
  v4[3] = &unk_1E491E748;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

uint64_t __165__BWCameraStreamingMonitor__updateCameraStreamingMonitorInfoWithStreaming_cameraAccessGranted_clientAuditToken_tccIdentity_updateStreamingStatus_updateAccessStatus___block_invoke_4(uint64_t a1)
{
  return -[BWCameraStreamingMonitor _handleClientDeath:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

@end
