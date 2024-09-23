@implementation MSNStateFailureWithMode

void __MSNStateFailureWithMode_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  void *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  const char *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
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
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  char *v68;
  __int16 v69;
  char *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  char *v76;
  __int16 v77;
  const char *v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  char *v82;
  __int16 v83;
  char *v84;
  __int16 v85;
  const char *v86;
  _QWORD v87[7];
  _QWORD v88[9];

  v88[7] = *MEMORY[0x1E0C80C00];
  if (g_production)
  {
    v87[0] = CFSTR("Mic");
    if (g_microphoneState >= 4)
    {
      qword_1EFE381E8 = (uint64_t)"Unknown state";
      MSNLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        goto LABEL_85;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", off_1E9776318[g_microphoneState]);
      v0 = objc_claimAutoreleasedReturnValue();
      v88[0] = v0;
      v87[1] = CFSTR("Cam");
      if (g_cameraState >= 4)
      {
        qword_1EFE381E8 = (uint64_t)"Unknown state";
        MSNLog();
        v43 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          goto LABEL_85;
      }
      else
      {
        v1 = (void *)v0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", off_1E9776318[g_cameraState]);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v88[1] = v2;
        v87[2] = CFSTR("MicClient");
        if (g_microphoneClient)
          v3 = (const char *)g_microphoneClient;
        else
          v3 = "None";
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v88[2] = v4;
        v87[3] = CFSTR("CamClient");
        if (g_cameraClient)
          v5 = (const char *)g_cameraClient;
        else
          v5 = "None";
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
        v6 = objc_claimAutoreleasedReturnValue();
        v88[3] = v6;
        v87[4] = CFSTR("Pill");
        if (g_pillState >= 3)
        {
          qword_1EFE381E8 = (uint64_t)"Unknown state";
          MSNLog();
          v43 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            goto LABEL_85;
        }
        else
        {
          v7 = (void *)v6;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", off_1E9776338[g_pillState]);
          v8 = objc_claimAutoreleasedReturnValue();
          v88[4] = v8;
          v87[5] = CFSTR("UI");
          if (g_uiState >= 4)
          {
            qword_1EFE381E8 = (uint64_t)"Unknown state";
            MSNLog();
            v43 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              goto LABEL_85;
          }
          else
          {
            v9 = (void *)v8;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", off_1E97762F8[g_uiState]);
            v10 = objc_claimAutoreleasedReturnValue();
            v88[5] = v10;
            v87[6] = CFSTR("Kbd");
            if (g_keyboardState < 3)
            {
              v11 = (void *)v10;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", off_1E97762E0[g_keyboardState]);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v88[6] = v12;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 7);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              AnalyticsSendEvent();

              goto LABEL_14;
            }
            qword_1EFE381E8 = (uint64_t)"Unknown state";
            MSNLog();
            v43 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              goto LABEL_85;
          }
        }
      }
    }
    __MSNMonitorStartServerMode_block_invoke_cold_1(v43, v58, v59, v60, v61, v62, v63, v64);
    goto LABEL_85;
  }
LABEL_14:
  MSNLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    __MSNStateFailureWithMode_block_invoke_cold_11(v14, v15, v16, v17, v18, v19, v20, v21);

  MSNLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    if (g_production)
      v32 = "";
    else
      v32 = "Testing: ";
    if (g_uiState >= 4)
    {
      qword_1EFE381E8 = (uint64_t)"Unknown state";
      MSNLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        goto LABEL_85;
      goto LABEL_74;
    }
    if (g_cameraState >= 4)
    {
      qword_1EFE381E8 = (uint64_t)"Unknown state";
      MSNLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        goto LABEL_85;
      goto LABEL_74;
    }
    v33 = (const char *)g_cameraClient;
    if (g_cameraClient)
      v34 = ":";
    else
      v34 = "";
    if (!g_cameraClient)
      v33 = "";
    if (g_microphoneState >= 4)
    {
      qword_1EFE381E8 = (uint64_t)"Unknown state";
      MSNLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        goto LABEL_85;
      goto LABEL_74;
    }
    v35 = (const char *)g_microphoneClient;
    if (g_microphoneClient)
      v36 = ":";
    else
      v36 = "";
    if (!g_microphoneClient)
      v35 = "";
    if (g_pillState >= 3)
    {
      qword_1EFE381E8 = (uint64_t)"Unknown state";
      MSNLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        goto LABEL_85;
      goto LABEL_74;
    }
    if (g_keyboardState < 3)
    {
      v37 = off_1E97762F8[g_uiState];
      v38 = off_1E9776318[g_cameraState];
      v39 = off_1E9776318[g_microphoneState];
      v40 = off_1E9776338[g_pillState];
      v41 = off_1E97762E0[g_keyboardState];
      v42 = (const char *)g_cameraExceptionState;
      if (!g_cameraExceptionState)
        v42 = "None";
      *(_DWORD *)buf = 136317698;
      v66 = v32;
      v67 = 2080;
      v68 = v37;
      v69 = 2080;
      v70 = v38;
      v71 = 2080;
      v72 = v34;
      v73 = 2080;
      v74 = v33;
      v75 = 2080;
      v76 = v39;
      v77 = 2080;
      v78 = v36;
      v79 = 2080;
      v80 = v35;
      v81 = 2080;
      v82 = v40;
      v83 = 2080;
      v84 = v41;
      v85 = 2080;
      v86 = v42;
      _os_log_fault_impl(&dword_1D416F000, v22, OS_LOG_TYPE_FAULT, "MediaSafetyNet failure with states: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s)", buf, 0x70u);
      goto LABEL_17;
    }
    qword_1EFE381E8 = (uint64_t)"Unknown state";
    MSNLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
LABEL_74:
      __MSNMonitorStartServerMode_block_invoke_cold_1(v43, v51, v52, v53, v54, v55, v56, v57);
LABEL_85:

    abort();
  }
LABEL_17:

  +[MSNTTR sharedInstance](MSNTTR, "sharedInstance");
  v23 = objc_claimAutoreleasedReturnValue();
  if (g_uiState >= 4)
  {
    qword_1EFE381E8 = (uint64_t)"Unknown state";
    MSNLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      goto LABEL_85;
LABEL_64:
    __MSNMonitorStartServerMode_block_invoke_cold_1(v43, v44, v45, v46, v47, v48, v49, v50);
    goto LABEL_85;
  }
  if (g_cameraState >= 4)
  {
    qword_1EFE381E8 = (uint64_t)"Unknown state";
    MSNLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      goto LABEL_85;
    goto LABEL_64;
  }
  if (g_microphoneState >= 4)
  {
    qword_1EFE381E8 = (uint64_t)"Unknown state";
    MSNLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      goto LABEL_85;
    goto LABEL_64;
  }
  if (g_pillState >= 3)
  {
    qword_1EFE381E8 = (uint64_t)"Unknown state";
    MSNLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      goto LABEL_85;
    goto LABEL_64;
  }
  if (g_keyboardState >= 3)
  {
    qword_1EFE381E8 = (uint64_t)"Unknown state";
    MSNLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      goto LABEL_85;
    goto LABEL_64;
  }
  v24 = (void *)v23;
  v25 = (const char *)g_cameraClient;
  v26 = (const char *)g_microphoneClient;
  if (g_microphoneClient)
  {
    v27 = ":";
  }
  else
  {
    v26 = "";
    v27 = "";
  }
  if (g_cameraClient)
  {
    v28 = ":";
  }
  else
  {
    v25 = "";
    v28 = "";
  }
  if (g_production)
    v29 = "";
  else
    v29 = "Testing: ";
  v30 = (const char *)g_cameraExceptionState;
  if (!g_cameraExceptionState)
    v30 = "None";
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MediaSafetyNet: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s)"), v29, off_1E97762F8[g_uiState], off_1E9776318[g_cameraState], v28, v25, off_1E9776318[g_microphoneState], v27, v26, off_1E9776338[g_pillState], off_1E97762E0[g_keyboardState], v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "beginTTRWithTitle:", v31);

}

void __MSNStateFailureWithMode_block_invoke_133()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(CFSTR("com.apple.mediaserverd|com.apple.callservicesd|com.apple.telephonyd|com.apple.CommCenter"), "componentsSeparatedByString:", CFSTR("|"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)MSNStateFailureWithMode_terminatingProcesses;
  MSNStateFailureWithMode_terminatingProcesses = v1;

}

void __MSNStateFailureWithMode_block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(CFSTR("callservicesd|mediaserverd|telephonyd|CommCenter"), "componentsSeparatedByString:", CFSTR("|"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)MSNStateFailureWithMode_terminatingProcesses_140;
  MSNStateFailureWithMode_terminatingProcesses_140 = v1;

}

void __MSNStateFailureWithMode_block_invoke_cold_11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D416F000, a1, a3, "MediaSafetyNet generating fault", a5, a6, a7, a8, 0);
}

@end
