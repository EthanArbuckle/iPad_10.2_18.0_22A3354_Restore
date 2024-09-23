void MSNMonitorStartingCamera()
{
  NSObject *v0;
  uint8_t v1[16];

  MSNLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D416F000, v0, OS_LOG_TYPE_INFO, "Starting cam.", v1, 2u);
  }

}

void MSNMonitorSetCameraState(char a1)
{
  NSObject *v2;
  _QWORD block[4];
  char v4;

  if ((MediaSafetyNetIsLocalMonitor() & 1) != 0)
  {
    if (MediaSafetyNetActive())
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __MSNMonitorSetCameraState_block_invoke;
      block[3] = &__block_descriptor_33_e5_v8__0l;
      v4 = a1;
      dispatch_sync((dispatch_queue_t)s_mediaSafetyNetQueue, block);
    }
  }
  else
  {
    MSNLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      MSNMonitorSetCameraState_cold_1();

  }
}

void MSNMonitorSetLastCameraClient(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  if ((MediaSafetyNetIsLocalMonitor() & 1) != 0)
  {
    if (MediaSafetyNetActive())
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __MSNMonitorSetLastCameraClient_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      dispatch_sync((dispatch_queue_t)s_mediaSafetyNetQueue, block);
    }
  }
  else
  {
    MSNLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      MSNMonitorSetCameraState_cold_1();

  }
}

void MSNMonitorSetCameraNonStandardCameraClient(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  if ((MediaSafetyNetIsLocalMonitor() & 1) != 0)
  {
    if (MediaSafetyNetActive())
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __MSNMonitorSetCameraNonStandardCameraClient_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      dispatch_sync((dispatch_queue_t)s_mediaSafetyNetQueue, block);
    }
  }
  else
  {
    MSNLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      MSNMonitorSetCameraState_cold_1();

  }
}

uint64_t MediaSafetyNetIsLocalMonitor()
{
  return (s_mediaSafetyNetQueue != 0) | s_mediaSafetyNetDisabledOnThisHardware & 1u;
}

BOOL MediaSafetyNetActive()
{
  return s_mediaSafetyNetQueue != 0;
}

void MSNValidateState()
{
  void *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  int v4;
  BOOL v5;
  NSObject *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  const char *v19;
  BOOL v21;
  NSObject *v23;
  int v24;
  int *v25;
  void *v26;
  unsigned int v27;
  int v28;
  int v29;
  int v30;
  const char *v31;
  int v33;
  void *v34;
  void *v35;
  char v36;
  uint64_t v37;
  void *v38;
  _BOOL4 v39;
  BOOL v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  const char *v52;
  const char *v53;
  NSObject *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  const char *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  char *v86;
  char *v87;
  char *v88;
  char *v89;
  char *v90;
  const char *v91;
  const char *v92;
  const char *v93;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  const char *v101;
  const char *v102;
  const char *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  NSObject *v119;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  const char *v129;
  const char *v130;
  const char *v131;
  void *v132;
  _BYTE buf[12];
  __int16 v134;
  char *v135;
  __int16 v136;
  char *v137;
  __int16 v138;
  const char *v139;
  __int16 v140;
  const char *v141;
  __int16 v142;
  char *v143;
  __int16 v144;
  const char *v145;
  __int16 v146;
  const char *v147;
  __int16 v148;
  char *v149;
  __int16 v150;
  char *v151;
  __int16 v152;
  const char *v153;
  __int16 v154;
  const char *v155;
  __int16 v156;
  int v157;
  _QWORD v158[7];
  _QWORD v159[9];

  v159[7] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1D8258E3C]();
  if ((s_lockPill & 1) != 0)
  {
    if ((os_variant_allows_internal_security_policies() & 1) == 0)
      MSNValidateState_cold_44();
    MSNLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D416F000, v1, OS_LOG_TYPE_INFO, "Overriding pill state. This is not a production configuration.", buf, 2u);
    }

  }
  else if (g_microphoneState == 1)
  {
    v2 = (void *)s_pillDataSource;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", g_microphoneClient);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fetchPillRegistrationForProcess:withCompletion:", v3, &__block_literal_global_74);

  }
  else
  {
    g_pillState = 0;
  }
  v4 = g_microphoneState;
  if (g_uiState)
    v5 = g_microphoneState == 0;
  else
    v5 = 1;
  if (v5 || g_cameraState == 0 || g_keyboardState == 0)
  {
    MSNLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = "";
      if (g_production)
        v10 = "";
      else
        v10 = "Testing: ";
      if (g_uiState >= 4)
      {
        qword_1EFE381E8 = (uint64_t)"Unknown state";
        MSNLog();
        v119 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
          goto LABEL_282;
        goto LABEL_281;
      }
      if (g_cameraState >= 4)
      {
        qword_1EFE381E8 = (uint64_t)"Unknown state";
        MSNLog();
        v119 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
          goto LABEL_282;
        goto LABEL_281;
      }
      v11 = ":";
      v12 = (const char *)g_cameraClient;
      if (g_cameraClient)
        v13 = ":";
      else
        v13 = "";
      if (!g_cameraClient)
        v12 = "";
      if (g_microphoneState >= 4)
      {
        qword_1EFE381E8 = (uint64_t)"Unknown state";
        MSNLog();
        v119 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
          goto LABEL_282;
        goto LABEL_281;
      }
      if (g_microphoneClient)
        v9 = (const char *)g_microphoneClient;
      else
        v11 = "";
      if (g_pillState >= 3)
      {
        qword_1EFE381E8 = (uint64_t)"Unknown state";
        MSNLog();
        v119 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
          goto LABEL_282;
        goto LABEL_281;
      }
      if (g_keyboardState >= 3)
      {
        qword_1EFE381E8 = (uint64_t)"Unknown state";
        MSNLog();
        v119 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
          goto LABEL_282;
        goto LABEL_281;
      }
      v14 = off_1E97762F8[g_uiState];
      v15 = off_1E9776318[g_cameraState];
      v16 = off_1E9776318[g_microphoneState];
      v17 = off_1E9776338[g_pillState];
      v18 = off_1E97762E0[g_keyboardState];
      v19 = (const char *)g_cameraExceptionState;
      *(_DWORD *)buf = 136317698;
      if (!g_cameraExceptionState)
        v19 = "None";
      *(_QWORD *)&buf[4] = v10;
      v134 = 2080;
      v135 = v14;
      v136 = 2080;
      v137 = v15;
      v138 = 2080;
      v139 = v13;
      v140 = 2080;
      v141 = v12;
      v142 = 2080;
      v143 = v16;
      v144 = 2080;
      v145 = v11;
      v146 = 2080;
      v147 = v9;
      v148 = 2080;
      v149 = v17;
      v150 = 2080;
      v151 = v18;
      v152 = 2080;
      v153 = v19;
      _os_log_impl(&dword_1D416F000, v8, OS_LOG_TYPE_INFO, "MediaSafetyNet state: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s) unknown.", buf, 0x70u);
    }
    goto LABEL_40;
  }
  v21 = (g_cameraState & 0xFFFFFFFE) == 2 && (g_microphoneState & 0xFFFFFFFE) == 2;
  if (g_uiState == 3 || v21)
    goto LABEL_59;
  if (g_microphoneState != 1 && g_cameraState != 1)
  {
    qword_1EFE381E8 = (uint64_t)"Expected at least one hot sensor.";
    MSNLog();
    v119 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
      MSNValidateState_cold_43(v119, v121, v122, v123, v124, v125, v126, v127);
    goto LABEL_282;
  }
  if (g_cameraState == 1)
  {
    if (!HotCameraAllowed())
    {
LABEL_70:
      v27 = ++s_inconsistentCount;
      if (MSNValidateState_inconsistencyDuration != -1)
        ++MSNValidateState_inconsistencyDuration;
      if (v27 >= 0xA)
      {
        if (qword_1ED52D0D0 != -1)
          dispatch_once(&qword_1ED52D0D0, &__block_literal_global_55);
        v28 = _MergedGlobals;
        while (2)
        {
          switch(v28)
          {
            case 1:
              MSNLog();
              v54 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                goto LABEL_163;
              v55 = "";
              if (g_production)
                v56 = "";
              else
                v56 = "Testing: ";
              if (g_uiState >= 4)
              {
                qword_1EFE381E8 = (uint64_t)"Unknown state";
                MSNLog();
                v119 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                  goto LABEL_282;
              }
              else if (g_cameraState >= 4)
              {
                qword_1EFE381E8 = (uint64_t)"Unknown state";
                MSNLog();
                v119 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                  goto LABEL_282;
              }
              else
              {
                v57 = ":";
                v58 = (const char *)g_cameraClient;
                if (g_cameraClient)
                  v59 = ":";
                else
                  v59 = "";
                if (!g_cameraClient)
                  v58 = "";
                if (g_microphoneState >= 4)
                {
                  qword_1EFE381E8 = (uint64_t)"Unknown state";
                  MSNLog();
                  v119 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                    goto LABEL_282;
                }
                else
                {
                  if (g_microphoneClient)
                    v55 = (const char *)g_microphoneClient;
                  else
                    v57 = "";
                  if (g_pillState >= 3)
                  {
                    qword_1EFE381E8 = (uint64_t)"Unknown state";
                    MSNLog();
                    v119 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                      goto LABEL_282;
                  }
                  else
                  {
                    if (g_keyboardState < 3)
                    {
                      v60 = off_1E97762F8[g_uiState];
                      v61 = off_1E9776318[g_cameraState];
                      v62 = off_1E9776318[g_microphoneState];
                      v63 = off_1E9776338[g_pillState];
                      v64 = off_1E97762E0[g_keyboardState];
                      v65 = (const char *)g_cameraExceptionState;
                      *(_DWORD *)buf = 136317698;
                      if (!g_cameraExceptionState)
                        v65 = "None";
                      goto LABEL_260;
                    }
                    qword_1EFE381E8 = (uint64_t)"Unknown state";
                    MSNLog();
                    v119 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                      goto LABEL_282;
                  }
                }
              }
              goto LABEL_281;
            case 2:
              if (MSNStateFailureWithMode_once != -1)
                dispatch_once(&MSNStateFailureWithMode_once, &__block_literal_global_106);
              MSNLog();
              v54 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                goto LABEL_163;
              v55 = "";
              if (g_production)
                v56 = "";
              else
                v56 = "Testing: ";
              if (g_uiState >= 4)
              {
                qword_1EFE381E8 = (uint64_t)"Unknown state";
                MSNLog();
                v119 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                  goto LABEL_282;
              }
              else if (g_cameraState >= 4)
              {
                qword_1EFE381E8 = (uint64_t)"Unknown state";
                MSNLog();
                v119 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                  goto LABEL_282;
              }
              else
              {
                v57 = ":";
                v58 = (const char *)g_cameraClient;
                if (g_cameraClient)
                  v59 = ":";
                else
                  v59 = "";
                if (!g_cameraClient)
                  v58 = "";
                if (g_microphoneState >= 4)
                {
                  qword_1EFE381E8 = (uint64_t)"Unknown state";
                  MSNLog();
                  v119 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                    goto LABEL_282;
                }
                else
                {
                  if (g_microphoneClient)
                    v55 = (const char *)g_microphoneClient;
                  else
                    v57 = "";
                  if (g_pillState >= 3)
                  {
                    qword_1EFE381E8 = (uint64_t)"Unknown state";
                    MSNLog();
                    v119 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                      goto LABEL_282;
                  }
                  else
                  {
                    if (g_keyboardState < 3)
                    {
                      v60 = off_1E97762F8[g_uiState];
                      v61 = off_1E9776318[g_cameraState];
                      v62 = off_1E9776318[g_microphoneState];
                      v63 = off_1E9776338[g_pillState];
                      v64 = off_1E97762E0[g_keyboardState];
                      v65 = (const char *)g_cameraExceptionState;
                      *(_DWORD *)buf = 136317698;
                      if (!g_cameraExceptionState)
                        v65 = "None";
LABEL_260:
                      *(_QWORD *)&buf[4] = v56;
                      v134 = 2080;
                      v135 = v60;
                      v136 = 2080;
                      v137 = v61;
                      v138 = 2080;
                      v139 = v59;
                      v140 = 2080;
                      v141 = v58;
                      v142 = 2080;
                      v143 = v62;
                      v144 = 2080;
                      v145 = v57;
                      v146 = 2080;
                      v147 = v55;
                      v148 = 2080;
                      v149 = v63;
                      v150 = 2080;
                      v151 = v64;
                      v152 = 2080;
                      v153 = v65;
                      _os_log_error_impl(&dword_1D416F000, v54, OS_LOG_TYPE_ERROR, "MediaSafetyNet failure with states: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s)", buf, 0x70u);
LABEL_163:

LABEL_164:
                      v24 = 1;
                      v25 = &s_inconsistentCount;
                      goto LABEL_64;
                    }
                    qword_1EFE381E8 = (uint64_t)"Unknown state";
                    MSNLog();
                    v119 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                      goto LABEL_282;
                  }
                }
              }
              goto LABEL_281;
            case 3:
              if (!g_production)
                goto LABEL_178;
              v158[0] = CFSTR("Mic");
              if (g_microphoneState >= 4)
              {
                qword_1EFE381E8 = (uint64_t)"Unknown state";
                MSNLog();
                v119 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                  goto LABEL_282;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", off_1E9776318[g_microphoneState]);
                v66 = objc_claimAutoreleasedReturnValue();
                v159[0] = v66;
                v158[1] = CFSTR("Cam");
                if (g_cameraState >= 4)
                {
                  qword_1EFE381E8 = (uint64_t)"Unknown state";
                  MSNLog();
                  v119 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                    goto LABEL_282;
                }
                else
                {
                  v67 = (void *)v66;
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", off_1E9776318[g_cameraState]);
                  v68 = objc_claimAutoreleasedReturnValue();
                  v159[1] = v68;
                  v158[2] = CFSTR("MicClient");
                  if (g_microphoneClient)
                    v69 = (const char *)g_microphoneClient;
                  else
                    v69 = "None";
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v69);
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  v159[2] = v70;
                  v158[3] = CFSTR("CamClient");
                  if (g_cameraClient)
                    v71 = (const char *)g_cameraClient;
                  else
                    v71 = "None";
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v71);
                  v72 = objc_claimAutoreleasedReturnValue();
                  v159[3] = v72;
                  v158[4] = CFSTR("Pill");
                  if (g_pillState >= 3)
                  {
                    qword_1EFE381E8 = (uint64_t)"Unknown state";
                    MSNLog();
                    v119 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                      goto LABEL_282;
                  }
                  else
                  {
                    v73 = (void *)v72;
                    v132 = (void *)v68;
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", off_1E9776338[g_pillState]);
                    v74 = objc_claimAutoreleasedReturnValue();
                    v159[4] = v74;
                    v158[5] = CFSTR("UI");
                    if (g_uiState >= 4)
                    {
                      qword_1EFE381E8 = (uint64_t)"Unknown state";
                      MSNLog();
                      v119 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                        goto LABEL_282;
                    }
                    else
                    {
                      v75 = (void *)v74;
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", off_1E97762F8[g_uiState]);
                      v76 = objc_claimAutoreleasedReturnValue();
                      v159[5] = v76;
                      v158[6] = CFSTR("Kbd");
                      if (g_keyboardState >= 3)
                      {
                        qword_1EFE381E8 = (uint64_t)"Unknown state";
                        MSNLog();
                        v119 = objc_claimAutoreleasedReturnValue();
                        if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                          goto LABEL_282;
                      }
                      else
                      {
                        v77 = (void *)v76;
                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", off_1E97762E0[g_keyboardState]);
                        v78 = (void *)objc_claimAutoreleasedReturnValue();
                        v159[6] = v78;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v159, v158, 7);
                        v79 = (void *)objc_claimAutoreleasedReturnValue();
                        AnalyticsSendEvent();

LABEL_178:
                        MSNLog();
                        v80 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                        {
                          v81 = "";
                          if (g_production)
                            v82 = "";
                          else
                            v82 = "Testing: ";
                          if (g_uiState >= 4)
                          {
                            qword_1EFE381E8 = (uint64_t)"Unknown state";
                            MSNLog();
                            v119 = objc_claimAutoreleasedReturnValue();
                            if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                              goto LABEL_282;
                            goto LABEL_281;
                          }
                          if (g_cameraState >= 4)
                          {
                            qword_1EFE381E8 = (uint64_t)"Unknown state";
                            MSNLog();
                            v119 = objc_claimAutoreleasedReturnValue();
                            if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                              goto LABEL_282;
                            goto LABEL_281;
                          }
                          v83 = ":";
                          v84 = (const char *)g_cameraClient;
                          if (g_cameraClient)
                            v85 = ":";
                          else
                            v85 = "";
                          if (!g_cameraClient)
                            v84 = "";
                          if (g_microphoneState >= 4)
                          {
                            qword_1EFE381E8 = (uint64_t)"Unknown state";
                            MSNLog();
                            v119 = objc_claimAutoreleasedReturnValue();
                            if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                              goto LABEL_282;
                            goto LABEL_281;
                          }
                          if (g_microphoneClient)
                            v81 = (const char *)g_microphoneClient;
                          else
                            v83 = "";
                          if (g_pillState >= 3)
                          {
                            qword_1EFE381E8 = (uint64_t)"Unknown state";
                            MSNLog();
                            v119 = objc_claimAutoreleasedReturnValue();
                            if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                              goto LABEL_282;
                            goto LABEL_281;
                          }
                          if (g_keyboardState >= 3)
                          {
                            qword_1EFE381E8 = (uint64_t)"Unknown state";
                            MSNLog();
                            v119 = objc_claimAutoreleasedReturnValue();
                            if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                              goto LABEL_282;
                            goto LABEL_281;
                          }
                          v86 = off_1E97762F8[g_uiState];
                          v87 = off_1E9776318[g_cameraState];
                          v88 = off_1E9776318[g_microphoneState];
                          v89 = off_1E9776338[g_pillState];
                          v90 = off_1E97762E0[g_keyboardState];
                          v91 = (const char *)g_cameraExceptionState;
                          *(_DWORD *)buf = 136317698;
                          if (!g_cameraExceptionState)
                            v91 = "None";
                          *(_QWORD *)&buf[4] = v82;
                          v134 = 2080;
                          v135 = v86;
                          v136 = 2080;
                          v137 = v87;
                          v138 = 2080;
                          v139 = v85;
                          v140 = 2080;
                          v141 = v84;
                          v142 = 2080;
                          v143 = v88;
                          v144 = 2080;
                          v145 = v83;
                          v146 = 2080;
                          v147 = v81;
                          v148 = 2080;
                          v149 = v89;
                          v150 = 2080;
                          v151 = v90;
                          v152 = 2080;
                          v153 = v91;
                          _os_log_error_impl(&dword_1D416F000, v80, OS_LOG_TYPE_ERROR, "MediaSafetyNet failure with states: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s)", buf, 0x70u);
                        }

                        *(_QWORD *)buf = 0;
                        if (g_production)
                          v92 = "";
                        else
                          v92 = "Testing: ";
                        if (g_uiState >= 4)
                        {
                          qword_1EFE381E8 = (uint64_t)"Unknown state";
                          MSNLog();
                          v119 = objc_claimAutoreleasedReturnValue();
                          if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                            goto LABEL_282;
                        }
                        else if (g_cameraState >= 4)
                        {
                          qword_1EFE381E8 = (uint64_t)"Unknown state";
                          MSNLog();
                          v119 = objc_claimAutoreleasedReturnValue();
                          if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                            goto LABEL_282;
                        }
                        else
                        {
                          v93 = (const char *)g_cameraClient;
                          if (g_cameraClient)
                            v94 = ":";
                          else
                            v94 = "";
                          if (!g_cameraClient)
                            v93 = "";
                          if (g_microphoneState >= 4)
                          {
                            qword_1EFE381E8 = (uint64_t)"Unknown state";
                            MSNLog();
                            v119 = objc_claimAutoreleasedReturnValue();
                            if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                              goto LABEL_282;
                          }
                          else
                          {
                            v95 = (const char *)g_microphoneClient;
                            if (g_microphoneClient)
                              v96 = ":";
                            else
                              v96 = "";
                            if (!g_microphoneClient)
                              v95 = "";
                            if (g_pillState >= 3)
                            {
                              qword_1EFE381E8 = (uint64_t)"Unknown state";
                              MSNLog();
                              v119 = objc_claimAutoreleasedReturnValue();
                              if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                                goto LABEL_282;
                            }
                            else if (g_keyboardState >= 3)
                            {
                              qword_1EFE381E8 = (uint64_t)"Unknown state";
                              MSNLog();
                              v119 = objc_claimAutoreleasedReturnValue();
                              if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                                goto LABEL_282;
                            }
                            else
                            {
                              v97 = (const char *)g_cameraExceptionState;
                              if (!g_cameraExceptionState)
                                v97 = "None";
                              if (asprintf((char **)buf, "MediaSafetyNet failure with states: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s)", v92, off_1E97762F8[g_uiState], off_1E9776318[g_cameraState], v94, v93, off_1E9776318[g_microphoneState], v96, v95, off_1E9776338[g_pillState], off_1E97762E0[g_keyboardState], v97) < 0)*(_QWORD *)buf = 0;
                              if (g_production)
                                v98 = "";
                              else
                                v98 = "Testing: ";
                              if (g_uiState >= 4)
                              {
                                qword_1EFE381E8 = (uint64_t)"Unknown state";
                                MSNLog();
                                v119 = objc_claimAutoreleasedReturnValue();
                                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                                  goto LABEL_282;
                              }
                              else if (g_cameraState >= 4)
                              {
                                qword_1EFE381E8 = (uint64_t)"Unknown state";
                                MSNLog();
                                v119 = objc_claimAutoreleasedReturnValue();
                                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                                  goto LABEL_282;
                              }
                              else
                              {
                                v99 = (const char *)g_cameraClient;
                                if (g_cameraClient)
                                  v100 = ":";
                                else
                                  v100 = "";
                                if (!g_cameraClient)
                                  v99 = "";
                                if (g_microphoneState >= 4)
                                {
                                  qword_1EFE381E8 = (uint64_t)"Unknown state";
                                  MSNLog();
                                  v119 = objc_claimAutoreleasedReturnValue();
                                  if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                                    goto LABEL_282;
                                }
                                else
                                {
                                  v101 = (const char *)g_microphoneClient;
                                  if (g_microphoneClient)
                                    v102 = ":";
                                  else
                                    v102 = "";
                                  if (!g_microphoneClient)
                                    v101 = "";
                                  if (g_pillState >= 3)
                                  {
                                    qword_1EFE381E8 = (uint64_t)"Unknown state";
                                    MSNLog();
                                    v119 = objc_claimAutoreleasedReturnValue();
                                    if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                                      goto LABEL_282;
                                  }
                                  else
                                  {
                                    if (g_keyboardState < 3)
                                    {
                                      v103 = (const char *)g_cameraExceptionState;
                                      if (!g_cameraExceptionState)
                                        v103 = "None";
                                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MediaSafetyNet: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s)"), v98, off_1E97762F8[g_uiState], off_1E9776318[g_cameraState], v100, v99, off_1E9776318[g_microphoneState], v102, v101, off_1E9776338[g_pillState], off_1E97762E0[g_keyboardState], v103);
                                      v104 = (void *)objc_claimAutoreleasedReturnValue();
                                      CFPreferencesSetAppValue(CFSTR("MediaSafetyNetWaitingTTR"), v104, CFSTR("com.apple.mediaserverd"));

                                      objc_msgSend(MEMORY[0x1E0C99D68], "date");
                                      v105 = (void *)objc_claimAutoreleasedReturnValue();
                                      CFPreferencesSetAppValue(CFSTR("MediaSafetyNetWaitingTTRDate"), v105, CFSTR("com.apple.mediaserverd"));

                                      CFPreferencesAppSynchronize(CFSTR("com.apple.mediaserverd"));
                                      qword_1EFE381E8 = *(_QWORD *)buf;
                                      MSNLog();
                                      v119 = objc_claimAutoreleasedReturnValue();
                                      if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                                        MSNValidateState_cold_17((uint64_t)buf, v119, v106, v107, v108, v109, v110, v111);
LABEL_282:

                                      abort();
                                    }
                                    qword_1EFE381E8 = (uint64_t)"Unknown state";
                                    MSNLog();
                                    v119 = objc_claimAutoreleasedReturnValue();
                                    if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                                      goto LABEL_282;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
LABEL_281:
              __MSNMonitorStartServerMode_block_invoke_cold_1(v119, v112, v113, v114, v115, v116, v117, v118);
              goto LABEL_282;
            case 4:
              v29 = os_variant_allows_internal_security_policies();
              v30 = g_microphoneState;
              v31 = (const char *)g_microphoneClient;
              v39 = g_microphoneState == 1
                 && g_microphoneClient != 0
                 && strcmp((const char *)g_microphoneClient, "corespeechd") == 0;
              v40 = v30 != 1 || g_pillState == 2;
              if (!v40 && !strcmp(v31, "callservicesd"))
              {
                v28 = 3;
              }
              else if (g_cameraState == 1)
              {
                if (!strcmp((const char *)g_cameraClient, "com.apple.callservicesd"))
                  v28 = 3;
                else
                  v28 = 2;
              }
              else
              {
                v28 = 2;
              }
              if (!(v29 ^ 1 | v39))
                v28 = 3;
              continue;
            case 5:
              if (g_cameraState == 1)
              {
                v33 = 0;
                if ((HotCameraAllowed() & 1) == 0 && g_cameraClient)
                {
                  if (MSNStateFailureWithMode_onceToken != -1)
                    dispatch_once(&MSNStateFailureWithMode_onceToken, &__block_literal_global_134);
                  v34 = (void *)MSNStateFailureWithMode_terminatingProcesses;
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", g_cameraClient);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = objc_msgSend(v34, "containsObject:", v35);

                }
              }
              else
              {
                v33 = 0;
              }
              if ((v33 & 1) != 0 || g_microphoneState != 1)
              {
                v28 = 2;
                if (!v33)
                  continue;
LABEL_99:
                v28 = 3;
                continue;
              }
              v36 = HotMicAllowed();
              v28 = 2;
              if ((v36 & 1) == 0 && g_microphoneClient)
              {
                if (MSNStateFailureWithMode_onceToken_141 != -1)
                  dispatch_once(&MSNStateFailureWithMode_onceToken_141, &__block_literal_global_142);
                v37 = MSNStateFailureWithMode_terminatingProcesses_140;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", g_microphoneClient);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v37) = objc_msgSend((id)v37, "containsObject:", v38);

                v28 = 2;
                if ((v37 & 1) != 0)
                  goto LABEL_99;
              }
              continue;
            default:
              goto LABEL_164;
          }
        }
      }
      if (!v27)
      {
        v24 = 1;
        goto LABEL_65;
      }
      MSNLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        if (g_production)
          v41 = "";
        else
          v41 = "Testing: ";
        if (g_uiState >= 4)
        {
          qword_1EFE381E8 = (uint64_t)"Unknown state";
          MSNLog();
          v119 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
            goto LABEL_282;
          goto LABEL_281;
        }
        if (g_cameraState >= 4)
        {
          qword_1EFE381E8 = (uint64_t)"Unknown state";
          MSNLog();
          v119 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
            goto LABEL_282;
          goto LABEL_281;
        }
        if (g_cameraClient)
          v42 = ":";
        else
          v42 = "";
        if (g_cameraClient)
          v43 = (const char *)g_cameraClient;
        else
          v43 = "";
        if (g_microphoneState >= 4)
        {
          qword_1EFE381E8 = (uint64_t)"Unknown state";
          MSNLog();
          v119 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
            goto LABEL_282;
          goto LABEL_281;
        }
        if (g_microphoneClient)
          v44 = ":";
        else
          v44 = "";
        if (g_microphoneClient)
          v45 = (const char *)g_microphoneClient;
        else
          v45 = "";
        if (g_pillState >= 3)
        {
          qword_1EFE381E8 = (uint64_t)"Unknown state";
          MSNLog();
          v119 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
            goto LABEL_282;
          goto LABEL_281;
        }
        v128 = v44;
        v129 = v45;
        v130 = v42;
        v131 = v43;
        if (g_keyboardState >= 3)
        {
          qword_1EFE381E8 = (uint64_t)"Unknown state";
          MSNLog();
          v119 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
            goto LABEL_282;
          goto LABEL_281;
        }
        v46 = v41;
        v47 = off_1E97762F8[g_uiState];
        v48 = off_1E9776318[g_cameraState];
        v49 = off_1E9776318[g_microphoneState];
        v50 = off_1E9776338[g_pillState];
        v51 = off_1E97762E0[g_keyboardState];
        if (g_cameraExceptionState)
          v52 = (const char *)g_cameraExceptionState;
        else
          v52 = "None";
        v53 = ConsistencyDescription(1);
        *(_DWORD *)buf = 136318210;
        *(_QWORD *)&buf[4] = v46;
        v134 = 2080;
        v135 = v47;
        v136 = 2080;
        v137 = v48;
        v138 = 2080;
        v139 = v130;
        v140 = 2080;
        v141 = v131;
        v142 = 2080;
        v143 = v49;
        v144 = 2080;
        v145 = v128;
        v146 = 2080;
        v147 = v129;
        v148 = 2080;
        v149 = v50;
        v150 = 2080;
        v151 = v51;
        v152 = 2080;
        v153 = v52;
        v154 = 2080;
        v155 = v53;
        v156 = 1024;
        v157 = s_inconsistentCount;
        _os_log_error_impl(&dword_1D416F000, v8, OS_LOG_TYPE_ERROR, "MediaSafetyNet temporarily inconsistent state: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s) consistency: %s inconsistentCount: %i", buf, 0x80u);
      }
LABEL_40:

      goto LABEL_69;
    }
    v4 = g_microphoneState;
  }
  if (v4 == 1 && (HotMicAllowed() & 1) == 0)
    goto LABEL_70;
LABEL_59:
  if (MSNValidateState_inconsistencyDuration)
  {
    MSNLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = MSNValidateState_inconsistencyDuration;
      _os_log_impl(&dword_1D416F000, v23, OS_LOG_TYPE_INFO, "MediaSafetyNet inconsistency ended after: %u", buf, 8u);
    }

  }
  s_inconsistentCount = 0;
  v24 = 2;
  v25 = &MSNValidateState_inconsistencyDuration;
LABEL_64:
  *v25 = 0;
LABEL_65:
  if (MSNPeriodicLog_once != -1)
    dispatch_once(&MSNPeriodicLog_once, &__block_literal_global_147);
  v26 = (void *)MSNPeriodicLog_log;
  if (os_log_type_enabled((os_log_t)MSNPeriodicLog_log, OS_LOG_TYPE_DEBUG))
    MSNValidateState_cold_6(v26, v24);
LABEL_69:
  objc_autoreleasePoolPop(v0);
}

id MSNLog()
{
  if (MSNLog_once != -1)
    dispatch_once(&MSNLog_once, &__block_literal_global);
  return (id)MSNLog_log;
}

void MSNMonitorSetXCTestExceptionState(int a1)
{
  if (a1)
    MSNMonitorSetCameraNonStandardCameraClient((uint64_t)"xctest");
  else
    MSNMonitorSetCameraNonStandardCameraClient(0);
}

void MSNMonitorStartingMicrophone()
{
  NSObject *v0;
  uint8_t v1[16];

  MSNLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D416F000, v0, OS_LOG_TYPE_INFO, "Starting mic.", v1, 2u);
  }

}

void MSNMonitorSetMicrophoneState(char a1)
{
  NSObject *v2;
  _QWORD block[4];
  char v4;

  if ((MediaSafetyNetIsLocalMonitor() & 1) != 0)
  {
    if (MediaSafetyNetActive())
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __MSNMonitorSetMicrophoneState_block_invoke;
      block[3] = &__block_descriptor_33_e5_v8__0l;
      v4 = a1;
      dispatch_sync((dispatch_queue_t)s_mediaSafetyNetQueue, block);
    }
  }
  else
  {
    MSNLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      MSNMonitorSetCameraState_cold_1();

  }
}

void MSNMonitorSetLastMicrophoneClient(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  if ((MediaSafetyNetIsLocalMonitor() & 1) != 0)
  {
    if (MediaSafetyNetActive())
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __MSNMonitorSetLastMicrophoneClient_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      dispatch_sync((dispatch_queue_t)s_mediaSafetyNetQueue, block);
    }
  }
  else
  {
    MSNLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      MSNMonitorSetCameraState_cold_1();

  }
}

void MSNMonitorBeginException(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *context;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D8258E3C]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSNScopedExceptionsServer proxiesForException:](MSNScopedExceptionsServer, "proxiesForException:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
        MSNLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v17 = a1;
          v18 = 2112;
          v19 = v7;
          _os_log_debug_impl(&dword_1D416F000, v8, OS_LOG_TYPE_DEBUG, "Begin exception %s with proxy %@", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "beginException:", v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v4);
  }

  objc_autoreleasePoolPop(context);
}

void MSNMonitorEndException(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *context;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D8258E3C]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSNScopedExceptionsServer proxiesForException:](MSNScopedExceptionsServer, "proxiesForException:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
        MSNLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v17 = a1;
          v18 = 2112;
          v19 = v7;
          _os_log_debug_impl(&dword_1D416F000, v8, OS_LOG_TYPE_DEBUG, "End exception %s with proxy %@", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "endException:", v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v4);
  }

  objc_autoreleasePoolPop(context);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1D4173E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Block_object_dispose(&a21, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4174540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void __getSTDynamicActivityAttributionMonitorClass_block_invoke(uint64_t a1)
{
  SystemStatusLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("STDynamicActivityAttributionMonitor");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSTDynamicActivityAttributionMonitorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSTDynamicActivityAttributionMonitorClass_block_invoke_cold_1();
    SystemStatusLibrary();
  }
}

void SystemStatusLibrary()
{
  void *v0;

  if (!SystemStatusLibraryCore_frameworkLibrary)
    SystemStatusLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SystemStatusLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

MSNPillDataSourceController *__getSTCallingStatusDomainClass_block_invoke(uint64_t a1)
{
  MSNPillDataSourceController *result;
  MSNPillDataSourceController *v3;
  SEL v4;
  id v5;

  SystemStatusLibrary();
  result = (MSNPillDataSourceController *)objc_getClass("STCallingStatusDomain");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSTCallingStatusDomainClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (MSNPillDataSourceController *)__getSTCallingStatusDomainClass_block_invoke_cold_1();
    return -[MSNPillDataSourceController initWithQueue:](v3, v4, v5);
  }
  return result;
}

void sub_1D4174E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void MSNMonitorStoppingCamera()
{
  NSObject *v0;
  uint8_t v1[16];

  MSNLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D416F000, v0, OS_LOG_TYPE_INFO, "Stopping cam.", v1, 2u);
  }

}

void MSNMonitorStoppingMicrophone()
{
  NSObject *v0;
  uint8_t v1[16];

  MSNLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D416F000, v0, OS_LOG_TYPE_INFO, "Stopping mic.", v1, 2u);
  }

}

void MSNMonitorStart()
{
  int v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    if ((_os_feature_enabled_impl() & 1) != 0 || (v0 = _os_feature_enabled_impl()) != 0)
    {
      if ((_os_feature_enabled_impl() & 1) != 0)
      {
        v0 = 2;
      }
      else
      {
        if ((_os_feature_enabled_impl() & 1) == 0)
        {
          qword_1EFE381E8 = (uint64_t)"Not reachable";
          MSNLog();
          v1 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
            MSNMonitorStart_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

          abort();
        }
        v0 = 1;
      }
    }
    MSNMonitorStartServerMode(v0);
  }
}

void MSNMonitorStartServerMode(int a1)
{
  void *v2;
  NSObject *v3;
  BOOL v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  MSNScopedExceptionsServer *v21;
  uint64_t v22;
  void *v23;
  MSNPillDataSourceServer *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  dispatch_source_t v29;
  void *v30;
  NSObject *v31;
  dispatch_time_t v32;
  NSObject *v33;
  NSObject *v34;
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
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int token[4];
  uint8_t buf[8];
  int v51;
  int out_token;

  v2 = (void *)MEMORY[0x1D8258E3C]();
  g_serverMode = a1;
  MSNLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    MSNMonitorStartServerMode_cold_7(v3);

  if (s_mediaSafetyNetQueue)
    v4 = 0;
  else
    v4 = s_mediaSafetyNetDisabledOnThisHardware == 0;
  if (!v4)
  {
    MSNLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D416F000, v5, OS_LOG_TYPE_INFO, "MediaSafetyNet already initialized.", buf, 2u);
    }
    goto LABEL_48;
  }
  if (os_variant_has_factory_content())
  {
    MSNLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v7 = "Not using MediaSafetyNet on NonUI.";
LABEL_51:
      _os_log_impl(&dword_1D416F000, v6, OS_LOG_TYPE_INFO, v7, buf, 2u);
    }
  }
  else
  {
    v8 = (void *)MGCopyAnswer();
    v9 = objc_msgSend(v8, "intValue");
    if (v8)
      CFRelease(v8);
    if (v9 == 1)
      goto LABEL_19;
    if (v9 != 2)
    {
      MSNLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v7 = "Not using MediaSafetyNet on devices of this type (not an iPhone/iPod).";
        goto LABEL_51;
      }
      goto LABEL_52;
    }
    if (MGGetProductType() != 3460419847)
    {
LABEL_19:
      MSNLog();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

      if (v11)
      {
        MSNLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          MSNMonitorStartServerMode_cold_6(v12);

      }
      out_token = 0;
      notify_register_check("com.apple.MediaSafetyNet.connectionrequest", &out_token);
      notify_set_state(out_token, 1uLL);
      notify_post("com.apple.MediaSafetyNet.connectionrequest");
      v13 = dispatch_queue_create("MediaSafetyNet", 0);
      v14 = (void *)s_mediaSafetyNetQueue;
      s_mediaSafetyNetQueue = (uint64_t)v13;

      if (s_mediaSafetyNetQueue)
      {
        g_uiState = 0;
        if (a1 == 1)
          v15 = 3;
        else
          v15 = 2;
        g_cameraState = v15;
        if (a1 == 2)
          v16 = 3;
        else
          v16 = 2;
        g_microphoneState = v16;
        g_pillState = 0;
        g_keyboardState = 0;
        v51 = -1;
        if (!notify_register_dispatch("com.apple.keyboard.isOnScreen", &v51, (dispatch_queue_t)s_mediaSafetyNetQueue, &__block_literal_global_12))__MSNMonitorStartServerMode_block_invoke(0, v51);
        objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
        v5 = objc_claimAutoreleasedReturnValue();
        -[NSObject setNeedsUserInteractivePriority:](v5, "setNeedsUserInteractivePriority:", 1);
        -[NSObject setTransitionHandler:](v5, "setTransitionHandler:", &__block_literal_global_16);
        objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v5);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)s_monitor;
        s_monitor = v17;

        if (g_serverMode <= 1)
        {
          v19 = objc_opt_new();
          v20 = (void *)s_carplay;
          s_carplay = v19;

        }
        v21 = [MSNScopedExceptionsServer alloc];
        v22 = -[MSNScopedExceptionsServer initWithQueue:](v21, "initWithQueue:", s_mediaSafetyNetQueue);
        v23 = (void *)s_exceptions;
        s_exceptions = v22;

        v24 = [MSNPillDataSourceServer alloc];
        v25 = -[MSNPillDataSourceServer initWithQueue:](v24, "initWithQueue:", s_mediaSafetyNetQueue);
        v26 = (void *)s_pillDataSource;
        s_pillDataSource = v25;

        if (os_variant_allows_internal_security_policies())
        {
          *(_QWORD *)buf = 0;
          if (g_microphoneState != 3)
          {
            MSNLog();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              LOWORD(token[0]) = 0;
              _os_log_impl(&dword_1D416F000, v27, OS_LOG_TYPE_INFO, "Installing internal microphone override", (uint8_t *)token, 2u);
            }

            token[0] = -1;
            if (notify_register_dispatch("com.apple.mediasafetynet.simulate_microphone", token, (dispatch_queue_t)s_mediaSafetyNetQueue, &__block_literal_global_30))
            {
              MSNMonitorStartServerMode_cold_5();
            }
            notify_get_state(token[0], (uint64_t *)buf);
          }
          if (g_cameraState != 3)
          {
            MSNLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              LOWORD(token[0]) = 0;
              _os_log_impl(&dword_1D416F000, v28, OS_LOG_TYPE_INFO, "Installing internal camera override", (uint8_t *)token, 2u);
            }

            token[0] = -1;
            if (notify_register_dispatch("com.apple.mediasafetynet.simulate_camera", token, (dispatch_queue_t)s_mediaSafetyNetQueue, &__block_literal_global_35))
            {
              MSNMonitorStartServerMode_cold_4();
            }
            notify_get_state(token[0], (uint64_t *)buf);
          }
          token[0] = -1;
          if (notify_register_dispatch("com.apple.mediasafetynet.pill_state", token, (dispatch_queue_t)s_mediaSafetyNetQueue, &__block_literal_global_38))
          {
            MSNMonitorStartServerMode_cold_3();
          }
        }
        v29 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)s_mediaSafetyNetQueue);
        v30 = (void *)s_timer;
        s_timer = (uint64_t)v29;

        v31 = s_timer;
        if (s_timer)
        {
          v32 = dispatch_time(0, 1000000000);
          dispatch_source_set_timer(v31, v32, 0x3B9ACA00uLL, 0x5F5E100uLL);
          dispatch_source_set_event_handler((dispatch_source_t)s_timer, &__block_literal_global_42);
          dispatch_resume((dispatch_object_t)s_timer);
LABEL_48:

          goto LABEL_55;
        }
        qword_1EFE381E8 = (uint64_t)"Failed to create timer";
        MSNLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          MSNMonitorStartServerMode_cold_2(v34, v42, v43, v44, v45, v46, v47, v48);
      }
      else
      {
        qword_1EFE381E8 = (uint64_t)"Unexpected NULL dispatch queue.";
        MSNLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          MSNMonitorStartServerMode_cold_1(v34, v35, v36, v37, v38, v39, v40, v41);
      }

      abort();
    }
    MSNLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v7 = "Not using MediaSafetyNet on specific devices.";
      goto LABEL_51;
    }
  }
LABEL_52:

  MSNLog();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D416F000, v33, OS_LOG_TYPE_INFO, "Not using MediaSafetyNet on this device.", buf, 2u);
  }

  s_mediaSafetyNetDisabledOnThisHardware = 1;
LABEL_55:
  objc_autoreleasePoolPop(v2);
}

void MSNMonitorStartCam()
{
  MSNMonitorStartServerMode(2);
}

void MSNMonitorStartMic()
{
  MSNMonitorStartServerMode(1);
}

char *ServerModeDescription(unsigned int a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 >= 3)
  {
    qword_1EFE381E8 = (uint64_t)"Unknown mode";
    MSNLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      ServerModeDescription_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

    abort();
  }
  return off_1E9776298[a1];
}

char *FailureModeDescription(unsigned int a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 >= 6)
  {
    qword_1EFE381E8 = (uint64_t)"Unknown mode";
    MSNLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      ServerModeDescription_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

    abort();
  }
  return off_1E97762B0[a1];
}

char *KeyboardStateDescription(unsigned int a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 >= 3)
  {
    qword_1EFE381E8 = (uint64_t)"Unknown state";
    MSNLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __MSNMonitorStartServerMode_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

    abort();
  }
  return off_1E97762E0[a1];
}

char *UIStateDescription(unsigned int a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 >= 4)
  {
    qword_1EFE381E8 = (uint64_t)"Unknown state";
    MSNLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __MSNMonitorStartServerMode_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

    abort();
  }
  return off_1E97762F8[a1];
}

char *MicrophoneStateDescription(unsigned int a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 >= 4)
  {
    qword_1EFE381E8 = (uint64_t)"Unknown state";
    MSNLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __MSNMonitorStartServerMode_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

    abort();
  }
  return off_1E9776318[a1];
}

char *PillStateDescription(unsigned int a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 >= 3)
  {
    qword_1EFE381E8 = (uint64_t)"Unknown state";
    MSNLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __MSNMonitorStartServerMode_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

    abort();
  }
  return off_1E9776338[a1];
}

const char *ConsistencyDescription(int a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 == 1)
    return "Inconsistent";
  if (a1 != 2)
  {
    qword_1EFE381E8 = (uint64_t)"Unknown state";
    MSNLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __MSNMonitorStartServerMode_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

    abort();
  }
  return "Consistent";
}

uint64_t HotCameraAllowed()
{
  NSObject *v0;
  uint8_t v2[16];

  if (_AXSSwitchControlEnabledAndNeedsCameraOnLockScreen())
  {
    MSNLog();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_1D416F000, v0, OS_LOG_TYPE_INFO, "Switch Control enabled.", v2, 2u);
    }

    return 1;
  }
  if (g_cameraExceptionState
    || (objc_msgSend((id)s_exceptions, "isExceptionInEffect:", 0x1E9776880) & 1) != 0
    || (objc_msgSend((id)s_exceptions, "isExceptionInEffect:", 0x1E9776940) & 1) != 0
    || (objc_msgSend((id)s_exceptions, "isExceptionInEffect:", 0x1E97769C0) & 1) != 0
    || (objc_msgSend((id)s_exceptions, "isExceptionInEffect:", 0x1E97769E0) & 1) != 0)
  {
    return 1;
  }
  return objc_msgSend((id)s_exceptions, "isExceptionInEffect:", 0x1E9776980);
}

uint64_t HotMicAllowed()
{
  NSObject *v0;
  const char *v1;
  uint8_t *v2;
  uint64_t result;
  char v4;
  const char *v5;
  __int16 v6;
  __int16 v7;
  uint8_t buf[2];
  __int16 v9;

  if ((g_pillState & 0xFFFFFFFD) == 0)
    return 1;
  if (_AXSCommandAndControlEnabled())
  {
    MSNLog();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      v6 = 0;
      v1 = "Command and Control enabled.";
      v2 = (uint8_t *)&v6;
LABEL_11:
      _os_log_impl(&dword_1D416F000, v0, OS_LOG_TYPE_INFO, v1, v2, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (_AXSSoundDetectionRunning())
  {
    MSNLog();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      v7 = 0;
      v1 = "Sound Detection enabled.";
      v2 = (uint8_t *)&v7;
      goto LABEL_11;
    }
LABEL_12:

    return 1;
  }
  if (_AXSSwitchControlEnabledAndNeedsMicrophoneOnLockScreen())
  {
    MSNLog();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v1 = "Switch Control sound triggers enabled.";
      v2 = buf;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (_AXSLiveTranscriptionEnabled() && _AXSLiveTranscriptionMicOn())
  {
    MSNLog();
    v0 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    v9 = 0;
    v1 = "LiveTranscription enabled.";
    v2 = (uint8_t *)&v9;
    goto LABEL_11;
  }
  v4 = objc_msgSend((id)s_carplay, "carplayConnected");
  result = 1;
  if ((v4 & 1) == 0 && g_keyboardState != 2)
  {
    if ((objc_msgSend((id)s_exceptions, "isExceptionInEffect:", 0x1E9776920) & 1) == 0
      && (objc_msgSend((id)s_exceptions, "isExceptionInEffect:", 0x1E9776860) & 1) == 0
      && (objc_msgSend((id)s_exceptions, "isExceptionInEffect:", 0x1E9776880) & 1) == 0
      && (objc_msgSend((id)s_exceptions, "isExceptionInEffect:", 0x1E97768A0) & 1) == 0
      && (objc_msgSend((id)s_exceptions, "isExceptionInEffect:", 0x1E97768C0) & 1) == 0
      && (objc_msgSend((id)s_exceptions, "isExceptionInEffect:", 0x1E97768E0) & 1) == 0
      && (objc_msgSend((id)s_exceptions, "isExceptionInEffect:", 0x1E9776900) & 1) == 0
      && (objc_msgSend((id)s_exceptions, "isExceptionInEffect:", 0x1E9776960) & 1) == 0
      && (objc_msgSend((id)s_exceptions, "isExceptionInEffect:", 0x1E9776980) & 1) == 0)
    {
      if (!os_variant_allows_internal_security_policies())
        return 0;
      v5 = (const char *)g_microphoneClient;
      if (!g_microphoneClient
        || strcmp((const char *)g_microphoneClient, "qrecord")
        && strcmp(v5, "auriotest")
        && strcmp(v5, "minilab")
        && strcmp(v5, "xctest")
        && strcmp(v5, "avcapture")
        && strcmp(v5, "halperformancemetrics")
        && strcmp(v5, "avvctest")
        && strcmp(v5, "audioloopback")
        && strcmp(v5, "algen")
        && strcmp(v5, "austriptool")
        && strcmp(v5, "dspprocess")
        && strcmp(v5, "auprocess")
        && strcmp(v5, "ssplay")
        && strcmp(v5, "vpiotest")
        && strcmp(v5, "multiroutetest")
        && strcmp(v5, "afinfo")
        && strcmp(v5, "afconvert")
        && strcmp(v5, "audiodetect")
        && strcmp(v5, "avrecord")
        && strcmp(v5, "qplay")
        && strcmp(v5, "auval")
        && strcmp(v5, "auvaltool")
        && strcmp(v5, "sounddiff")
        && strcmp(v5, "afmetadata")
        && strcmp(v5, "audioperftest")
        && strcmp(v5, "attentiond")
        && strcmp(v5, "audiotest")
        && strcmp(v5, "AVAudioDeviceTes")
        && strcmp(v5, "CoreContextAmbie"))
      {
        return 0;
      }
    }
    return 1;
  }
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void CarPlayNotificationCallback(int a1, uint64_t a2, int a3, int a4, CFTypeRef cf)
{
  CFTypeID v7;
  const __CFBoolean *Value;
  NSObject *v9;
  CFTypeID v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[6];
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = CFGetTypeID(cf);
  if (v7 != CFDictionaryGetTypeID())
  {
    qword_1EFE381E8 = (uint64_t)"Unexpected notification payload type";
    MSNLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      CarPlayNotificationCallback_cold_1(v11, v19, v20, v21, v22, v23, v24, v25);
LABEL_11:

    abort();
  }
  Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x1E0D485E8]);
  MSNLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v28 = CFBooleanGetValue(Value);
    _os_log_impl(&dword_1D416F000, v9, OS_LOG_TYPE_INFO, "Received notification of CarPlay status: %{BOOL}d", buf, 8u);
  }

  if (!Value || (v10 = CFGetTypeID(Value), v10 != CFBooleanGetTypeID()))
  {
    qword_1EFE381E8 = (uint64_t)"Unexpected notification payload type";
    MSNLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      CarPlayNotificationCallback_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_11;
  }
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __CarPlayNotificationCallback_block_invoke;
  v26[3] = &__block_descriptor_48_e5_v8__0l;
  v26[4] = a2;
  v26[5] = Value;
  dispatch_async((dispatch_queue_t)s_mediaSafetyNetQueue, v26);
}

void sub_1D41785B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MSNTTRUserNotificationCallback(uint64_t a1, uint64_t a2)
{
  id v3;

  +[MSNTTR sharedInstance](MSNTTR, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleCallback:", a2);

}

void sub_1D4178914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *__getSBUserNotificationDismissOnLockSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
  }
  else
  {
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
    if (!SpringBoardServicesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "SBUserNotificationDismissOnLock");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSBUserNotificationDismissOnLockSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getLSApplicationWorkspaceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MobileCoreServicesLibraryCore_frameworkLibrary)
  {
    MobileCoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MobileCoreServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("LSApplicationWorkspace");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getLSApplicationWorkspaceClass_block_invoke_cold_1();
    free(v3);
  }
  getLSApplicationWorkspaceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void MSNMonitorSetCameraState_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D416F000, v0, v1, "MSN state set outside of mediaserverd or before MSN was initialized.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __getSTDynamicActivityAttributionMonitorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSTCallingStatusDomainClass_block_invoke_cold_1(v0);
}

uint64_t __getSTCallingStatusDomainClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return MSNMonitorStart_cold_1(v0);
}

void MSNMonitorStart_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D416F000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void MSNMonitorStartServerMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D416F000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void MSNMonitorStartServerMode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D416F000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void MSNMonitorStartServerMode_cold_3()
{
  __assert_rtn("MSNMonitorStartServerMode", "MSNServer.m", 654, "0 == err");
}

void MSNMonitorStartServerMode_cold_4()
{
  __assert_rtn("MSNMonitorStartServerMode", "MSNServer.m", 633, "0 == err");
}

void MSNMonitorStartServerMode_cold_5()
{
  __assert_rtn("MSNMonitorStartServerMode", "MSNServer.m", 614, "0 == err");
}

void MSNMonitorStartServerMode_cold_6(NSObject *a1)
{
  char *v2;
  int v3;
  char *v4;
  __int16 v5;
  char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = ServerModeDescription(g_serverMode);
  if (qword_1ED52D0D0 != -1)
    dispatch_once(&qword_1ED52D0D0, &__block_literal_global_55);
  v3 = 136315394;
  v4 = v2;
  v5 = 2080;
  v6 = FailureModeDescription(_MergedGlobals);
  _os_log_debug_impl(&dword_1D416F000, a1, OS_LOG_TYPE_DEBUG, "Starting MediaSafetyNet in server mode: %s failure mode: %s", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_3_0();
}

void MSNMonitorStartServerMode_cold_7(NSObject *a1)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = _os_feature_enabled_impl();
  v3 = 1024;
  v4 = _os_feature_enabled_impl();
  _os_log_debug_impl(&dword_1D416F000, a1, OS_LOG_TYPE_DEBUG, "Separate Cam: %i Separate Mic: %i", (uint8_t *)v2, 0xEu);
  OUTLINED_FUNCTION_3_0();
}

void ServerModeDescription_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D416F000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void MSNValidateState_cold_6(void *a1, int a2)
{
  const char *v2;
  unsigned int v3;
  char *v4;
  char *v5;
  const char *v6;
  const char *v7;
  char *v8;
  const char *v9;
  const char *v10;
  char *v11;
  char *v12;
  const char *v13;
  const char *v14;
  NSObject *log;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  char *v34;
  __int16 v35;
  char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (g_production)
    v2 = "";
  else
    v2 = "Testing: ";
  v14 = v2;
  v3 = g_uiState;
  log = a1;
  v4 = UIStateDescription(v3);
  v5 = MicrophoneStateDescription(g_cameraState);
  if (g_cameraClient)
    v6 = ":";
  else
    v6 = "";
  if (g_cameraClient)
    v7 = (const char *)g_cameraClient;
  else
    v7 = "";
  v8 = MicrophoneStateDescription(g_microphoneState);
  if (g_microphoneClient)
    v9 = ":";
  else
    v9 = "";
  if (g_microphoneClient)
    v10 = (const char *)g_microphoneClient;
  else
    v10 = "";
  v11 = PillStateDescription(g_pillState);
  v12 = KeyboardStateDescription(g_keyboardState);
  if (g_cameraExceptionState)
    v13 = (const char *)g_cameraExceptionState;
  else
    v13 = "None";
  *(_DWORD *)buf = 136317954;
  v18 = v14;
  v19 = 2080;
  v20 = v4;
  v21 = 2080;
  v22 = v5;
  v23 = 2080;
  v24 = v6;
  v25 = 2080;
  v26 = v7;
  v27 = 2080;
  v28 = v8;
  v29 = 2080;
  v30 = v9;
  v31 = 2080;
  v32 = v10;
  v33 = 2080;
  v34 = v11;
  v35 = 2080;
  v36 = v12;
  v37 = 2080;
  v38 = v13;
  v39 = 2080;
  v40 = ConsistencyDescription(a2);
  _os_log_debug_impl(&dword_1D416F000, log, OS_LOG_TYPE_DEBUG, "MediaSafetyNet state: %sUI(%s) Cam(%s%s%s) Mic(%s%s%s) Pill(%s) Kbd(%s) CameraException(%s) consistency: %s", buf, 0x7Au);

}

void MSNValidateState_cold_17(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D416F000, a2, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void MSNValidateState_cold_43(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D416F000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void MSNValidateState_cold_44()
{
  __assert_rtn("MSNPollStates", "MSNServer.m", 389, "os_variant_allows_internal_security_policies(\"com.apple.MediaSafetyNet\")");
}

void CarPlayNotificationCallback_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D416F000, a1, a3, "%s", a5, a6, a7, a8, 2u);
}

uint64_t __getLSApplicationWorkspaceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[MSNScopedExceptionsServer initWithQueue:].cold.1(v0);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C995B8](allocator, userNotification, callout, order);
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x1E0C9EEB8]();
}

uint64_t CMSessionGetNotificationCenter()
{
  return MEMORY[0x1E0D48360]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x1E0DDD6A0]();
}

uint64_t _AXSLiveTranscriptionEnabled()
{
  return MEMORY[0x1E0DDDA20]();
}

uint64_t _AXSLiveTranscriptionMicOn()
{
  return MEMORY[0x1E0DDDA28]();
}

uint64_t _AXSSoundDetectionRunning()
{
  return MEMORY[0x1E0DDDCF8]();
}

uint64_t _AXSSwitchControlEnabledAndNeedsCameraOnLockScreen()
{
  return MEMORY[0x1E0DDDD18]();
}

uint64_t _AXSSwitchControlEnabledAndNeedsMicrophoneOnLockScreen()
{
  return MEMORY[0x1E0DDDD20]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

uint64_t os_variant_has_factory_content()
{
  return MEMORY[0x1E0C849E8]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

