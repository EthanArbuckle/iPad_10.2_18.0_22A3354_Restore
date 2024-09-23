@implementation DisplayOpen

void __DisplayOpen_block_invoke(uint64_t a1, int a2)
{
  float v2;
  float v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  float v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v31;
  uint8_t v33[7];
  os_log_type_t v34;
  os_log_t v35;
  uint8_t v36[7];
  os_log_type_t v37;
  os_log_t v38;
  uint8_t v39[15];
  os_log_type_t v40;
  os_log_t v41;
  int v42;
  os_log_type_t v43;
  os_log_t oslog;
  char v45;
  BOOL v46;
  char v47;
  BOOL v48;
  os_log_type_t v49;
  os_log_t v50;
  float v51;
  float v52;
  float v53[3];
  os_log_type_t v54;
  os_log_t v55;
  float v56;
  int v57;
  uint8_t v58[7];
  os_log_type_t v59;
  NSObject *v60;
  uint8_t v61[15];
  os_log_type_t v62;
  NSObject *v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint8_t v67[32];
  uint8_t v68[32];
  uint8_t v69[56];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v66 = a1;
  v65 = a2;
  v64 = a1;
  if (a2 == 1)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 64) + 12600) = 2;
    v63 = 0;
    if (_logHandle)
    {
      v31 = _logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v31 = inited;
    }
    v63 = v31;
    v62 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      log = v63;
      type = v62;
      __os_log_helper_16_0_0(v61);
      _os_log_impl(&dword_1B5291000, log, type, "Received kEDRNotificationEDREnabled\n", v61, 2u);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 64) + 12081) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 64) + 12082) = 0;
    __DisplayStartAPLCPMSTimer(*(dispatch_object_t **)(a1 + 64), 1.0);
  }
  else if (a2 == 2)
  {
    v60 = 0;
    if (_logHandle)
    {
      v27 = _logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v26 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v26 = init_default_corebrightness_log();
      v27 = v26;
    }
    v60 = v27;
    v59 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v60;
      v25 = v59;
      __os_log_helper_16_0_0(v58);
      _os_log_impl(&dword_1B5291000, v24, v25, "Received kEDRNotificationEDRDisabled, process brightness until headroom 1.0\n", v58, 2u);
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 64) + 12600) = 1;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 64) + 12112))
    {
      __DisplayProcessHDRStatusForCoreAnalytics(*(_QWORD *)(a1 + 64));
      dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 64) + 12112));
      *(_QWORD *)(*(_QWORD *)(a1 + 64) + 12112) = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 64) + 12088) = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 64) + 12096) = 0;
    }
  }
  else if (a2 == 3
         && (*(_BYTE *)(*(_QWORD *)(a1 + 64) + 12548) & 1) == 0
         && (*(_DWORD *)(*(_QWORD *)(a1 + 64) + 12600) == 2 || *(_DWORD *)(*(_QWORD *)(a1 + 64) + 12600) == 1))
  {
    v57 = 0;
    CBEDRServerGetCurrentDisplayPropertiesForDisplay(*(_DWORD *)(*(_QWORD *)(a1 + 64) + 12592), (float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), (float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), (float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), (float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), (float *)&v57);
    v56 = 0.0;
    if (*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0.0)
      v23 = 0.0;
    else
      v23 = 1.0 / *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v56 = v23;
    v55 = 0;
    if (_logHandle)
    {
      v22 = _logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v21 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v21 = init_default_corebrightness_log();
      v22 = v21;
    }
    v55 = v22;
    v54 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v69, COERCE__INT64(*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)), COERCE__INT64(v56), COERCE__INT64(*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)), COERCE__INT64(*(float *)(*(_QWORD *)(a1 + 64) + 1140)));
      _os_log_debug_impl(&dword_1B5291000, v55, v54, "EDR Notification: BL brightness: %f, headroom: %f, lux: %f (gl sc: %f)\n", v69, 0x2Au);
    }
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = fminf(*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 24), *(float *)(*(_QWORD *)(a1 + 64) + 1544));
    LODWORD(v53[0]) = 3;
    v53[1] = v56;
    __DisplayUpdateAAPStateInternal(*(_QWORD *)(a1 + 64), (uint64_t)v53, 0);
    v52 = 0.0;
    v2 = (float)*(int *)(*(_QWORD *)(a1 + 64) + 1128) / 65536.0;
    v52 = v2;
    v51 = 0.0;
    v3 = (float)*(int *)(*(_QWORD *)(a1 + 64) + 1132) / 65536.0;
    v51 = v3;
    v50 = 0;
    if (_logHandle)
    {
      v20 = _logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v19 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v19 = init_default_corebrightness_log();
      v20 = v19;
    }
    v50 = v20;
    v49 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v68, COERCE__INT64(v52), COERCE__INT64(v51), COERCE__INT64(*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)));
      _os_log_impl(&dword_1B5291000, v50, v49, "EDR caps when enabling: currentNitsCap=%f, nitsCapEDR=%f (backlightBrightness %f)", v68, 0x20u);
    }
    v48 = 0;
    v48 = *(float *)(*(_QWORD *)(a1 + 64) + 12208) == *(float *)(*(_QWORD *)(a1 + 64) + 12212);
    v47 = 1;
    v46 = 0;
    v18 = (*(_BYTE *)(*(_QWORD *)(a1 + 64) + 1517) & 1) != 0
       || *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) <= v51;
    v46 = v18;
    v45 = 0;
    if (*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= v52 && v46 && v48)
    {
      oslog = 0;
      if (_logHandle)
      {
        v17 = _logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v16 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v16 = init_default_corebrightness_log();
        v17 = v16;
      }
      oslog = v17;
      v43 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v67, COERCE__INT64(*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)), COERCE__INT64(v52), COERCE__INT64(v51));
        _os_log_debug_impl(&dword_1B5291000, oslog, v43, "Changing BL cap to %f (currentNitsCap was %f, nitsCapEDR was %f)\n", v67, 0x20u);
      }
      v42 = 0;
      v42 = (int)(*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) * 65536.0);
      v41 = 0;
      if (_logHandle)
      {
        v15 = _logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v14 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v14 = init_default_corebrightness_log();
        v15 = v14;
      }
      v41 = v15;
      v40 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v12 = v41;
        v13 = v40;
        __os_log_helper_16_0_0(v39);
        _os_log_impl(&dword_1B5291000, v12, v13, "SetBLDriverNitsCap for edrNotificationBrightness EDR_ENABLED/EDR_DISABLED_RAMP_PENDING", v39, 2u);
      }
      SetBLDriverNitsCapIfNotInLPM(*(_QWORD *)(a1 + 64), v42);
      v45 = 1;
    }
    __DisplaySetLogicalBrightnessInternal(*(const void **)(a1 + 64), 0x8000, *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    if (*(_DWORD *)(*(_QWORD *)(a1 + 64) + 12600) == 1 && v56 == 1.0)
    {
      v38 = 0;
      if (_logHandle)
      {
        v11 = _logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v10 = init_default_corebrightness_log();
        v11 = v10;
      }
      v38 = v11;
      v37 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v8 = v38;
        v9 = v37;
        __os_log_helper_16_0_0(v36);
        _os_log_impl(&dword_1B5291000, v8, v9, "SetBLDriverNitsCap for edrNotificationBrightness EDR_DISABLED_RAMP_PENDING, headroom=1", v36, 2u);
      }
      SetBLDriverNitsCapIfNotInLPM(*(_QWORD *)(a1 + 64), *(_DWORD *)(*(_QWORD *)(a1 + 64) + 1128));
      *(_DWORD *)(*(_QWORD *)(a1 + 64) + 12600) = 0;
      v35 = 0;
      if (_logHandle)
      {
        v7 = _logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v6 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v6 = init_default_corebrightness_log();
        v7 = v6;
      }
      v35 = v7;
      v34 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v4 = v35;
        v5 = v34;
        __os_log_helper_16_0_0(v33);
        _os_log_debug_impl(&dword_1B5291000, v4, v5, "EDR disabled\n", v33, 2u);
      }
      v45 = 1;
    }
    if ((v45 & 1) == 0 && (*(_BYTE *)(*(_QWORD *)(a1 + 64) + 1517) & 1) == 0)
      SetBLDriverNitsCapIfNotInLPM(*(_QWORD *)(a1 + 64), *(_DWORD *)(*(_QWORD *)(a1 + 64) + 1128));
  }
}

@end
