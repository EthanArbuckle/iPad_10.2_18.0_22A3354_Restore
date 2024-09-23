void __powerBatteryInterest(uint64_t a1, io_registry_entry_t a2, int a3)
{
  if (a3 == -536723200)
    __powerUpdateBatteryState(a2);
}

void __powerUpdateBatteryState(io_registry_entry_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  _QWORD block[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  _BYTE v26[18];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  properties = 0;
  if (!IORegistryEntryCreateCFProperties(a1, &properties, 0, 0))
  {
    v1 = byte_1ED931B04;
    v2 = objc_msgSend((id)-[__CFDictionary objectForKey:](properties, "objectForKey:", CFSTR("ExternalConnected")), "BOOLValue");
    byte_1ED931B04 = v2;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend((id)gUserLdcmParams, "enableHalogenMitigationsAndUI");
      *(_DWORD *)buf = 67109632;
      v24 = v1;
      v25 = 1024;
      *(_DWORD *)v26 = v2;
      *(_WORD *)&v26[4] = 2048;
      *(_QWORD *)&v26[6] = v3;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "handle battery state update: isExtChg=%u->%u, enableHalogenMitigationsAndUI %llu", buf, 0x18u);
    }
    if (objc_msgSend((id)gUserLdcmParams, "enableHalogenMitigationsAndUI") == 1
      && byte_1ED931B04 != v1
      && byte_1ED931B04 != 0)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v5 = (void *)objc_msgSend((id)gHalogenMeasurements, "allKeys");
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      if (v6)
      {
        v8 = v6;
        v9 = MEMORY[0x1E0C81028];
        v10 = *(_QWORD *)v19;
        *(_QWORD *)&v7 = 67109634;
        v16 = v7;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v5);
            v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
            v13 = (void *)objc_msgSend((id)gHalogenMeasurements, "objectForKey:", v12, v16);
            v14 = v13;
            if (v13 && objc_msgSend(v13, "attachDelayTimerRunning"))
            {
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v16;
                v24 = byte_1ED931B04;
                v25 = 2112;
                *(_QWORD *)v26 = v12;
                *(_WORD *)&v26[8] = 2112;
                *(_QWORD *)&v26[10] = v14;
                _os_log_impl(&dword_1D13BF000, v9, OS_LOG_TYPE_DEFAULT, "handle battery state update: isExtChg=%u, stop (delay) timer and perform measurement, key %@, halogenWrapper %@", buf, 0x1Cu);
              }
              dispatch_source_set_timer((dispatch_source_t)objc_msgSend(v14, "timer"), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
              objc_msgSend(v14, "setAttachDelayTimerRunning:", 0);
              v15 = objc_msgSend(v14, "halogenMeasurementDispatchQueue");
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = ____powerUpdateBatteryState_block_invoke;
              block[3] = &unk_1E9214120;
              block[4] = v14;
              dispatch_async(v15, block);
            }
            else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v16;
              v24 = byte_1ED931B04;
              v25 = 2112;
              *(_QWORD *)v26 = v12;
              *(_WORD *)&v26[8] = 2112;
              *(_QWORD *)&v26[10] = v14;
              _os_log_impl(&dword_1D13BF000, v9, OS_LOG_TYPE_DEFAULT, "handle battery state update: isExtChg=%u, (delay) timer not running, don't perform measurement, key %@, halogenWrapper %@", buf, 0x1Cu);
            }
          }
          v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
        }
        while (v8);
      }
    }
    CFRelease(properties);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void systemPowerCallback(void *a1, uint64_t a2, int a3, intptr_t a4)
{
  void *v5;
  uint64_t v6;
  dispatch_time_t v7;
  NSObject *global_queue;
  _QWORD block[5];

  if (a3 > -536870145)
  {
    if (a3 != -536870144)
    {
      if (a3 != -536870112)
        return;
      objc_msgSend((id)objc_msgSend(a1, "powerStateCond"), "lock");
      v5 = a1;
      v6 = 1;
      goto LABEL_8;
    }
    v7 = dispatch_walltime(0, 100000000);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __systemPowerCallback_block_invoke;
    block[3] = &unk_1E9214120;
    block[4] = a1;
    dispatch_after(v7, global_queue, block);
  }
  else
  {
    if (a3 != -536870288)
    {
      if (a3 != -536870272)
        return;
      IOAllowPowerChange(objc_msgSend(a1, "systemPowerPort"), a4);
      objc_msgSend((id)objc_msgSend(a1, "powerStateCond"), "lock");
      v5 = a1;
      v6 = 0;
LABEL_8:
      objc_msgSend(v5, "setPowerState:", v6);
      objc_msgSend((id)objc_msgSend(a1, "powerStateCond"), "signal");
      objc_msgSend((id)objc_msgSend(a1, "powerStateCond"), "unlock");
      return;
    }
    IOAllowPowerChange(objc_msgSend(a1, "systemPowerPort"), a4);
  }
}

uint64_t __systemPowerCallback_block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "powerStateCond"), "lock");
  objc_msgSend(*(id *)(a1 + 32), "setPowerState:", 2);
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "powerStateCond"), "signal");
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "powerStateCond"), "unlock");
}

uint64_t recordCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend((id)objc_msgSend(a1, "halogenUnitDelegate"), "recordCallBackFunc:AudioTimeStamp:busNum:numFrames:AudioBufferList:", a2, a3, a4, a5, a6);
}

uint64_t playbackCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend((id)objc_msgSend(a1, "halogenUnitDelegate"), "playbackCallBackFunc:AudioTimeStamp:busNum:numFrames:AudioBufferList:", a2, a3, a4, a5, a6);
}

void IOAccessoryNotifyWet(uint64_t a1, _BYTE *a2, int a3)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  CFAbsoluteTime Current;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  const __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  const __CFAllocator *v33;
  __CFUserNotification *v34;
  __CFRunLoopSource *RunLoopSource;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  int v41;
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "LDCM - Popping up a wet notification!!!", buf, 2u);
  }
  v6 = 0;
  if (!a1)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_38;
  }
  v41 = a3;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  if (a2)
  {
    if (!*a2 || *(_BYTE *)a1)
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
LABEL_8:
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      goto LABEL_38;
    }
    Current = CFAbsoluteTimeGetCurrent();
    *(_BYTE *)(a1 + 16) = Current - *(double *)(a1 + 8) < 480.0;
    *(CFAbsoluteTime *)(a1 + 8) = Current;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    v10 = v16;
    if (!v16
      || ((v17 = MEMORY[0x1E0C9AAB0], *(_BYTE *)(a1 + 16)) ? (v18 = MEMORY[0x1E0C9AAB0]) : (v18 = MEMORY[0x1E0C9AAA0]),
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("reinsertion")),
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("typeC")),
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("chargerConnected")),
          (v19 = objc_alloc_init(MEMORY[0x1E0CB35E8])) == 0))
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      goto LABEL_8;
    }
    v20 = v19;
    objc_msgSend(v19, "setUserInfo:", v10);
    v21 = (void *)MEMORY[0x1E0CB36F8];
    v40 = v20;
    v47[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(v21, "archivedDataWithRootObject:requiringSecureCoding:error:", v22, 1, &v42);
    v23 = objc_claimAutoreleasedReturnValue();
    v9 = v42;

    v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = v24;
    v39 = (void *)v23;
    if (v24)
    {
      objc_msgSend(v24, "setObject:forKeyedSubscript:", CFSTR("com.apple.IOAccessoryManagerFramework.WetNotification"), *MEMORY[0x1E0DABBB8]);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0DABBC0]);
      v25 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C9B820]);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0DABB98]);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0DABBB0]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.IOAccessoryManagerFramework"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v26;
      if (v26)
      {
        objc_msgSend(v26, "pathForResource:ofType:", CFSTR("PlugIns/WetNotification.appex/Assets.car"), &stru_1E92146F8);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "IOAccessoryNotifyWet";
          v45 = 2112;
          v46 = (uint64_t)v27;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Setting asset path for LDCM wet icon:%@", buf, 0x16u);
        }
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0DABC00], v23);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("lockScreenLiquidDetection"), *MEMORY[0x1E0DABBF8]);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("YES"), *MEMORY[0x1E0DABBF0]);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0DABBD8]);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("lockScreenLiquidDetection"), *MEMORY[0x1E0DABBD0]);
        objc_msgSend(v6, "resourceURL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0C9B860]);

        objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("WETMSG_DIALOG_BODY_LOCKSCREEN_TYPEC"));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v29 = CFSTR("WETMSG_BUTTON_DISMISS");
        v30 = CFSTR("WETMSG_DIALOG_HEADER_LOCKSCREEN_TYPEC");
      }
      else
      {
        v29 = CFSTR("Dismiss");
        v30 = CFSTR("Liquid Detected");
        v12 = CFSTR("Disconnect cable from charger and device. Unplug charger and allow all connectors to dry. This may take several hours.");
      }
      if (*(_BYTE *)(a1 + 16))
      {
        v31 = CFSTR("WETMSG_BUTTON_EMERGENCY_OVERRIDE");
        if (!v6)
          v31 = CFSTR("Emergency Override");
        v13 = v31;
      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0DABC18], v39);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0DABC28]);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0C9B838]);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0C9B868]);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E9220108, *MEMORY[0x1E0DABC68]);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E9220120, *MEMORY[0x1E0DABC90]);
      if (v41)
      {
        v32 = CFSTR("WETMSG_BUTTON_RADAR");
        if (!v6)
          v32 = CFSTR("Radar");
        v14 = v32;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C9B830]);
      }
      else
      {
        v14 = 0;
      }
      *(_BYTE *)a1 = 1;
      v33 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v34 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, 0, (CFDictionaryRef)v11);
      *(_QWORD *)(a1 + 24) = v34;
      gLdcmNotificationContext = a1;
      RunLoopSource = CFUserNotificationCreateRunLoopSource(v33, v34, (CFUserNotificationCallBack)IOAccessoryNotifyWetCallback, 0);
      *(_QWORD *)(a1 + 32) = RunLoopSource;
      if (RunLoopSource)
        CFRunLoopAddSource(*(CFRunLoopRef *)(a1 + 40), RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    }
    else
    {
      v6 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
    }
    v8 = v40;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "localizedDescription");
        v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v37 = objc_msgSend(v36, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v44 = "IOAccessoryNotifyWet";
        v45 = 2080;
        v46 = v37;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s err: %s", buf, 0x16u);

      }
      v7 = v39;
      v8 = v40;
    }
    else
    {
      v7 = v39;
    }
  }
LABEL_38:
  v38 = v8;

}

void IOAccessoryNotifyWetCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = gLdcmNotificationContext;
  if (gLdcmNotificationContext)
  {
    if (*(_BYTE *)gLdcmNotificationContext)
    {
      *(_BYTE *)gLdcmNotificationContext = 0;
      IOAccessoryNotifyWetHandler(v2, a2);
    }
  }
}

void IOAccessoryNotifyWetHandler(uint64_t a1, uint64_t a2)
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1)
  {
    v5 = llround(CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 8));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("notificationDuration"));

    if (*(_BYTE *)(a1 + 16) && a2 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("notificationUserAction"));

      IOAccessoryNotifyWetHandlerEmergencyOverride(a1);
    }
    else if (a2 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("notificationUserAction"));

      IOAccessoryFileRadarLDCMV4();
    }
    else if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("notificationUserAction"));

      IOAccessoryNotifyWetHandlerDismiss();
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v10 = 134217984;
      v11 = v5;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "LDCM UI Notification Duration: %ld\n", (uint8_t *)&v10, 0xCu);
    }
    AnalyticsSendEvent();
    CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 40), *(CFRunLoopSourceRef *)(a1 + 32), (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(*(CFTypeRef *)(a1 + 32));
    CFRelease(*(CFTypeRef *)(a1 + 24));
  }

}

void IOAccessoryNotifyWetHandlerDismiss()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "LDCM UI Dismiss!!!\n", v0, 2u);
  }
}

uint64_t IOAccessoryNotifyWetHandlerEmergencyOverride(uint64_t a1)
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "LDCM UI Emergency Override!!!\n", v3, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 48), "setOverride:", 1);
}

void IOAccessoryNotifyWetCancel()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint8_t v4[16];

  v0 = gLdcmNotificationContext;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "LDCM UI Cancel!!!\n", v4, 2u);
  }
  if (v0)
  {
    if (*(_BYTE *)v0)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", llround(CFAbsoluteTimeGetCurrent() - *(double *)(v0 + 8)));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "setObject:forKey:", v2, CFSTR("notificationDuration"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "setObject:forKey:", v3, CFSTR("notificationUserAction"));

      AnalyticsSendEvent();
      CFUserNotificationCancel(*(CFUserNotificationRef *)(v0 + 24));
      *(_BYTE *)v0 = 0;
      CFRunLoopRemoveSource(*(CFRunLoopRef *)(v0 + 40), *(CFRunLoopSourceRef *)(v0 + 32), (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
      CFRelease(*(CFTypeRef *)(v0 + 32));
      CFRelease(*(CFTypeRef *)(v0 + 24));

    }
  }
}

void IOAccessoryFileRadarLDCMV4()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithUTF8String:", "LIQUID DETECTION REPORT (detected via HalogenTypeC)\n\n");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "appendString:", CFSTR("Has your device or charging cable been near liquid in the past 5 hours? \n\n"));
  objc_msgSend(v29, "appendString:", CFSTR("If yes:\n\n"));
  objc_msgSend(v29, "appendString:", CFSTR("- Cable or device?\n\n"));
  objc_msgSend(v29, "appendString:", CFSTR("- What kind of liquid? (e.g. tap water, rain, sweat, soda, beer, etc.)\n\n"));
  objc_msgSend(v29, "appendString:", CFSTR("- What kind of exposure? (e.g. submersion, splash, droplet, sitting in puddle, using device with wet/sweaty hands, etc)\n\n"));
  objc_msgSend(v29, "appendString:", CFSTR("- If the exposure was limited to a certain part of the device, where was it?\n\n"));
  objc_msgSend(v29, "appendString:", CFSTR("- How long was the exposure?\n\n"));
  objc_msgSend(v29, "appendString:", CFSTR("- Time since exposure\n"));
  objc_msgSend(v29, "appendString:", CFSTR("\n\nIf no:\n\n"));
  objc_msgSend(v29, "appendString:", CFSTR("Please describe what happened just before seeing the dialog. For example… Did you just connect an accessory? Did you drop your device? Are you in a humid environment?\n\n\n"));
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("tap-to-radar://new?ComponentName=LDCM&ComponentVersion=AutofilledBugs&ComponentID=750390&Classification=Other Bug&Reproducibility=Not Applicable&"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentsOfDirectoryAtPath:error:", CFSTR("/var/logs/ldcm/"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self BEGINSWITH[cd] 'internalMeasurementData'"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self BEGINSWITH[cd] 'internalWaveformData'"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)v6;
  v27 = v4;
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v25);
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    v9 = 1;
    do
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "objectAtIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@"), CFSTR("/var/logs/ldcm/"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v8, v12);
      v8 = v9;
    }
    while (objc_msgSend(v7, "count") > (unint64_t)v9++);
  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "appendFormat:", CFSTR("Attachments=%@"), v14);

  }
  objc_msgSend(v0, "appendString:", CFSTR("&"));
  objc_msgSend(v0, "appendFormat:", CFSTR("Description=%@"), v29);
  v15 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAddingPercentEncodingWithAllowedCharacters:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!_FBSOpenApplicationOptionKeyPromptUnlockDevice)
  {
    v19 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 4);
    if (v19)
    {
      _FBSOpenApplicationOptionKeyPromptUnlockDevice = (uint64_t)dlsym(v19, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
      if (_FBSOpenApplicationOptionKeyPromptUnlockDevice)
        goto LABEL_9;
LABEL_14:
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "openURL:configuration:completionHandler:", v18, 0, &__block_literal_global);
      goto LABEL_11;
    }
    if (!_FBSOpenApplicationOptionKeyPromptUnlockDevice)
      goto LABEL_14;
  }
LABEL_9:
  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  v21 = objc_msgSend(v20, "initWithBytes:length:encoding:", _FBSOpenApplicationOptionKeyPromptUnlockDevice, 8, 1);
  if (v21)
  {
    v22 = (void *)v21;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKey:", v23, v22);

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "openSensitiveURL:withOptions:", v18, v28);

LABEL_11:
  }

}

void IOPortLDCMFeatureInterestCallback(void *a1, io_registry_entry_t a2, int a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  id v9;
  void *CFProperty;
  void *v11;
  uint64_t v12;
  id v13;
  _BYTE v14[18];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case -469794613:
      v9 = a1;
      CFProperty = (void *)IORegistryEntryCreateCFProperty(a2, CFSTR("MitigationsStatus"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      v11 = CFProperty;
      if (v9 && CFProperty)
      {
        v12 = objc_msgSend(CFProperty, "intValue");
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v14 = 136315394;
          *(_QWORD *)&v14[4] = "IOPortLDCMFeatureInterestCallback";
          *(_WORD *)&v14[12] = 1024;
          *(_DWORD *)&v14[14] = v12;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s kIOPortFeatureLDCMMessageTypeMitigationsStatusChange: %d\n", v14, 0x12u);
        }
        objc_msgSend(v9, "handleLDCMMitigationsStatusChange:", v12);
      }

      break;
    case -469794614:
      v13 = a1;
      if (v13)
      {
        v5 = v13;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v14 = 136315138;
          *(_QWORD *)&v14[4] = "IOPortLDCMFeatureInterestCallback";
          v6 = MEMORY[0x1E0C81028];
          v7 = "%s kIOPortFeatureLDCMMessageTypeMeasurementStatusChange\n";
          goto LABEL_16;
        }
LABEL_17:
        objc_msgSend(v5, "handleLDCMInterrupt", *(_OWORD *)v14);
      }
      break;
    case -469794616:
      v4 = a1;
      if (v4)
      {
        v5 = v4;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v14 = 136315138;
          *(_QWORD *)&v14[4] = "IOPortLDCMFeatureInterestCallback";
          v6 = MEMORY[0x1E0C81028];
          v7 = "%s kIOPortFeatureLDCMMessageTypeLiquidDetectedChange\n";
LABEL_16:
          _os_log_impl(&dword_1D13BF000, v6, OS_LOG_TYPE_DEFAULT, v7, v14, 0xCu);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
      break;
    default:
      return;
  }

}

void IOPortLDCMPortInterestCallback(void *a1, io_registry_entry_t entry, int a3)
{
  void *CFProperty;
  id v5;
  int v6;
  _BOOL4 v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 == -469794615)
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(entry, CFSTR("ConnectionActive"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (CFProperty)
    {
      v5 = a1;
      if (v5)
      {
        v6 = objc_msgSend(CFProperty, "BOOLValue");
        v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
        if (v6)
        {
          if (v7)
          {
            v8 = 136315138;
            v9 = "IOPortLDCMPortInterestCallback";
            _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s kIOPort_Message_ConnectionStateChange attach\n", (uint8_t *)&v8, 0xCu);
          }
          objc_msgSend(v5, "handleAttachEvent");
        }
        else
        {
          if (v7)
          {
            v8 = 136315138;
            v9 = "IOPortLDCMPortInterestCallback";
            _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s kIOPort_Message_ConnectionStateChange detach \n", (uint8_t *)&v8, 0xCu);
          }
          objc_msgSend(v5, "handleDetachEvent");
        }
      }

    }
  }
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t performEisMeasurement(void *a1)
{
  void *v2;
  int v3;
  unint64_t v4;
  int v5;
  char v6;
  io_service_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned int v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  unsigned int v20;
  NSObject *v21;
  unsigned int v22;
  NSObject *v23;
  char *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  _BOOL4 v59;
  char *v60;
  void *v61;
  int v62;
  int v63;
  double v64;
  double v65;
  double v66;
  int v67;
  const __CFString *v68;
  char v69;
  int v70;
  int v71;
  int v72;
  BOOL v73;
  int v74;
  NSObject *v76;
  const char *v77;
  uint32_t v78;
  unsigned int v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  unsigned int v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unsigned int v93;
  unint64_t v94;
  unint64_t v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  unsigned int v99;
  double v100;
  double v101;
  uint64_t v102;
  unsigned int v103;
  unint64_t v104;
  uint64_t v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  NSObject *v111;
  dispatch_time_t v112;
  uint64_t result;
  uint64_t v114;
  uint64_t v115;
  char updated;
  unint64_t v117;
  int v118;
  unsigned int v119;
  unint64_t v120;
  io_connect_t connect;
  int v122;
  __int16 v123;
  uint8_t buf[4];
  _BYTE v125[26];
  uint64_t v126;
  _BYTE v127[10];
  __int16 v128;
  uint64_t v129;
  __int16 v130;
  uint64_t v131;
  __int16 v132;
  uint64_t v133;
  __int16 v134;
  uint64_t v135;
  __int16 v136;
  uint64_t v137;
  __int16 v138;
  uint64_t v139;
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v123 = -21846;
  connect = 0;
  v122 = -1431655766;
  v120 = 0xAAAAAAAAAAAAAAAALL;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v125 = "performEisMeasurement";
    *(_WORD *)&v125[8] = 2048;
    *(_QWORD *)&v125[10] = a1;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s performEisMeasurement entry wrapper = %p\n", buf, 0x16u);
  }
  if (!a1)
    goto LABEL_198;
  if (!objc_msgSend(a1, "isMeasurementEnabled"))
    goto LABEL_197;
  objc_msgSend((id)objc_msgSend(a1, "cond"), "lock");
  objc_msgSend(a1, "setIsMeasurementActive:", 1);
  objc_msgSend((id)objc_msgSend(a1, "cond"), "unlock");
  v2 = (void *)objc_msgSend(a1, "halogenMeasurement");
  v3 = objc_msgSend(a1, "portID");
  if (objc_msgSend(a1, "isReceptacleEmpty"))
  {
    v4 = objc_msgSend(a1, "eventBasedDigitalID");
    v5 = objc_msgSend(a1, "eventBasedOrientation");
    if (objc_msgSend(a1, "justDetached"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v125 = "performEisMeasurement";
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s skipping measurement just after detach.\n", buf, 0xCu);
      }
      objc_msgSend(a1, "setJustDetached:", 0);
LABEL_14:
      v6 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    v4 = objc_msgSend(a1, "connectedAccessoryDigitalID");
    v5 = objc_msgSend(a1, "connectedAccessoryOrientation");
    if (objc_msgSend(a1, "justAttachedCase"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v125 = "performEisMeasurement";
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s skipping measurement just after attach of case.\n", buf, 0xCu);
      }
      objc_msgSend(a1, "setJustAttachedCase:", 0);
      goto LABEL_14;
    }
  }
  v6 = 0;
LABEL_16:
  if (!digitalIdNumPinsFree(v4, (uint64_t)&v122))
    goto LABEL_197;
  v7 = objc_msgSend(a1, "service");
  if (IOServiceOpen(v7, *MEMORY[0x1E0C83DA0], 0, &connect))
    goto LABEL_197;
  if (!_holdPowerAssertion(1, a1))
  {
    LODWORD(v9) = 7;
    goto LABEL_185;
  }
  v8 = 0x1ED931000;
  if ((v6 & 1) != 0)
  {
    LODWORD(v9) = 7;
    goto LABEL_178;
  }
  v10 = 0;
  updated = 0;
  LODWORD(v9) = 7;
  v11 = 1000.0;
  v117 = v4;
  while (!IOAccessoryManagerGetFreePinMask())
  {
    v119 = v10;
    v12 = v120;
    if (v4 == 0x18FE81000000)
    {
      v12 = v120 & 0xFFFFFFFFFFFFFFFBLL;
      v120 &= ~4uLL;
    }
    v13 = 0;
    while (1)
    {
      v14 = dword_1D13E7F00[v13];
      if ((v12 & (1 << v14)) != 0)
      {
        v15 = v14 + 2;
        if (v5 != 2)
          v15 = dword_1D13E7F00[v13];
        if (*((_BYTE *)&v122 + v15))
          break;
      }
      if (++v13 == 4)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v125 = v3;
          *(_WORD *)&v125[4] = 2048;
          *(_QWORD *)&v125[6] = v12;
          v76 = MEMORY[0x1E0C81028];
          v77 = "(%d) Dynamic free pins have been consumed. Cannot take Halogen LDCM measurment freePinMask = 0x%llx";
          v78 = 18;
          goto LABEL_96;
        }
        goto LABEL_97;
      }
    }
    v118 = v3;
    objc_msgSend(a1, "setPinID:", v14);
    v9 = objc_msgSend(a1, "isReceptacleEmpty");
    v16 = objc_msgSend(a1, "isWet");
    objc_msgSend((id)gUserLdcmParams, "wetTransitionCapacitanceThreshold");
    v18 = v17;
    objc_msgSend((id)gUserLdcmParams, "dryTransitionCapacitanceThreshold");
    v20 = objc_msgSend(v2, "doMeasurement:onPin:isReceptacleEmpty:isReceptacleWet:withWetTransitionThreshold:withDryTransitionThreshold:", 1, v14, v9, v16, v18, v19);
    LODWORD(v9) = v20;
    if (!v20)
    {
      v23 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v24 = IOAccessoryGetPinStrForIndex_pinStr[(int)v14];
        v25 = objc_msgSend(v2, "halogenResult");
        v26 = objc_msgSend(v2, "getResultString");
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v125 = v118;
        *(_WORD *)&v125[4] = 1024;
        *(_DWORD *)&v125[6] = v119;
        *(_WORD *)&v125[10] = 1024;
        *(_DWORD *)&v125[12] = v14;
        *(_WORD *)&v125[16] = 2082;
        *(_QWORD *)&v125[18] = v24;
        LOWORD(v126) = 1024;
        *(_DWORD *)((char *)&v126 + 2) = v25;
        v23 = MEMORY[0x1E0C81028];
        HIWORD(v126) = 2114;
        *(_QWORD *)v127 = v26;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) EIS measurement #%d on %d (%{public}s) returned %d (%{public}@)", buf, 0x2Eu);
      }
      if (gIsInternalBuild)
        objc_msgSend(v2, "saveAsWav:", CFSTR("/tmp/halogen.wav"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v2, "voltageGainCorrection");
        v115 = v27;
        objc_msgSend(v2, "currentGainCorrection");
        v114 = v28;
        objc_msgSend(v2, "currentPhaseCompensation");
        v30 = v29;
        objc_msgSend(v2, "goertzelImpedance");
        v32 = v31;
        objc_msgSend(v2, "goertzelPhase");
        v34 = v33;
        objc_msgSend(v2, "compensatedImpedance");
        v36 = v35;
        objc_msgSend(v2, "compensatedPhase");
        v37 = v11;
        v39 = v38;
        objc_msgSend(v2, "clippingScore");
        v41 = v40;
        objc_msgSend(v2, "resistanceInOhms");
        v43 = v42;
        objc_msgSend(v2, "capacitanceInNanoF");
        *(_DWORD *)buf = 67111680;
        *(_DWORD *)v125 = v118;
        *(_WORD *)&v125[4] = 2048;
        *(_QWORD *)&v125[6] = v115;
        *(_WORD *)&v125[14] = 2048;
        *(_QWORD *)&v125[16] = v114;
        *(_WORD *)&v125[24] = 2048;
        v126 = v30;
        *(_WORD *)v127 = 2048;
        *(_QWORD *)&v127[2] = v32;
        v128 = 2048;
        v129 = v34;
        v130 = 2048;
        v131 = v36;
        v132 = 2048;
        v133 = v39;
        v11 = v37;
        v134 = 2048;
        v135 = v41;
        v136 = 2048;
        v137 = v43;
        v138 = 2048;
        v139 = v44;
        _os_log_impl(&dword_1D13BF000, v23, OS_LOG_TYPE_DEFAULT, "(%d) halogen measurement = [%.13f, %.13f, %.13f, %.13f, %.13f, %.13f, %.13f, %.13f, %.13f, %.13f]", buf, 0x6Cu);
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v2, "precalVoltageSNR");
        v46 = v45;
        objc_msgSend(v2, "precalCurrentSNR");
        v48 = v47;
        objc_msgSend(v2, "calVoltageSNR");
        v50 = v49;
        objc_msgSend(v2, "calCurrentSNR");
        v52 = v51;
        objc_msgSend(v2, "measurementVoltageSNR");
        v54 = v53;
        objc_msgSend(v2, "measurementCurrentSNR");
        v56 = v55;
        objc_msgSend(v2, "measurementCondetSNR");
        *(_DWORD *)buf = 67110912;
        *(_DWORD *)v125 = v118;
        *(_WORD *)&v125[4] = 2048;
        *(_QWORD *)&v125[6] = v46;
        *(_WORD *)&v125[14] = 2048;
        *(_QWORD *)&v125[16] = v48;
        *(_WORD *)&v125[24] = 2048;
        v126 = v50;
        *(_WORD *)v127 = 2048;
        *(_QWORD *)&v127[2] = v52;
        v128 = 2048;
        v129 = v54;
        v130 = 2048;
        v131 = v56;
        v132 = 2048;
        v133 = v57;
        _os_log_impl(&dword_1D13BF000, v23, OS_LOG_TYPE_DEFAULT, "(%d) halogen SNR = [precal: %.13f, %.13f cal: %.13f, %.13f measurement: %.13f, %.13f condet: %.13f]", buf, 0x4Eu);
      }
      v58 = objc_msgSend(v2, "halogenResult");
      v22 = v119;
      if (v58 > 8)
        goto LABEL_55;
      if (((1 << v58) & 7) != 0)
      {
        v59 = 1;
        goto LABEL_56;
      }
      if (((1 << v58) & 0x160) != 0)
      {
        v59 = 0;
        if (gEnableTapToRadarPopup && gGiveUserRadarOption && gIsInternalBuild)
          v59 = objc_msgSend((id)gUserLdcmParams, "enableHalogenSnrTtr") != 0;
      }
      else
      {
LABEL_55:
        v59 = 0;
      }
LABEL_56:
      v61 = (void *)objc_msgSend(a1, "halogenMeasurement");
      v62 = objc_msgSend(v61, "halogenResult");
      v63 = v62;
      if (!v59)
      {
        v68 = CFSTR("com.apple.ioaccessorymanager.ldcm.eis.clipping");
        if (v63 != 3)
        {
          if (objc_msgSend(v61, "halogenResult") == 4)
          {
            if (objc_msgSend(v61, "isBoundViolation_currentGainCorrection"))
              IOAccessoryAggDPostScalarPrefixKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.currentgaincorrection.outofrange"), a1);
            v69 = objc_msgSend(v61, "isBoundViolation_currentPhaseCompensation");
            v68 = CFSTR("com.apple.ioaccessorymanager.ldcm.eis.currentphasecompensation.outofrange");
            if ((v69 & 1) == 0)
              goto LABEL_80;
          }
          else
          {
            v70 = objc_msgSend(v61, "halogenResult");
            v68 = CFSTR("com.apple.ioaccessorymanager.ldcm.eis.calibration.bad.snr");
            if (v70 != 5)
            {
              v71 = objc_msgSend(v61, "halogenResult");
              v68 = CFSTR("com.apple.ioaccessorymanager.ldcm.eis.calibration.bad.snr");
              if (v71 != 6)
              {
                v72 = objc_msgSend(v61, "halogenResult");
                v68 = CFSTR("com.apple.ioaccessorymanager.ldcm.eis.measurement.bad.snr");
                if (v72 != 8)
                  goto LABEL_80;
              }
            }
          }
        }
LABEL_79:
        IOAccessoryAggDPostScalarPrefixKey(v68, a1);
        goto LABEL_81;
      }
      if (!v62
        || objc_msgSend(v61, "halogenResult") == 1
        || objc_msgSend(v61, "halogenResult") == 2)
      {
        objc_msgSend(v61, "capacitanceInNanoF");
        IOAccessoryAggDPostHistogramKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.capacitance.histogram"), a1, v64);
        objc_msgSend(v61, "goertzelImpedance");
        IOAccessoryAggDPostHistogramKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.impedance.histogram"), a1, v65 / v11);
        objc_msgSend(v61, "goertzelPhase");
        IOAccessoryAggDPostHistogramKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.phase.histogram"), a1, v66);
        if (objc_msgSend(v61, "isLowerBoundViolation_goertzelImpedance"))
          IOAccessoryAggDPostScalarPrefixKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.impedance.low"), a1);
        if (objc_msgSend(v61, "isUpperBoundViolation_goertzelImpedance"))
          IOAccessoryAggDPostScalarPrefixKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.impedance.high"), a1);
        if (objc_msgSend(v61, "isLowerBoundViolation_goertzelPhase"))
          IOAccessoryAggDPostScalarPrefixKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.phase.low"), a1);
        if (objc_msgSend(v61, "isUpperBoundViolation_goertzelPhase"))
          IOAccessoryAggDPostScalarPrefixKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.phase.high"), a1);
        v67 = objc_msgSend(v61, "isBoundViolation_measurementCondetSNR");
        v68 = CFSTR("com.apple.ioaccessorymanager.ldcm.eis.digitalnoise.fault");
        if (v67)
          goto LABEL_79;
      }
LABEL_69:
      v59 = 1;
      goto LABEL_81;
    }
    v21 = MEMORY[0x1E0C81028];
    if (v20 <= 6 && ((1 << v20) & 0x58) != 0)
    {
      v22 = v119;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v125 = v118;
        *(_WORD *)&v125[4] = 1024;
        *(_DWORD *)&v125[6] = v119;
        _os_log_impl(&dword_1D13BF000, v21, OS_LOG_TYPE_DEFAULT, "(%d) EIS measurement #%d triggered abort due to sleep / failed arbitration / audio failure", buf, 0xEu);
      }
      goto LABEL_69;
    }
    v59 = 0;
    v22 = v119;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v60 = IOAccessoryGetPinStrForIndex_pinStr[(int)v14];
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v125 = v118;
      *(_WORD *)&v125[4] = 1024;
      *(_DWORD *)&v125[6] = v119;
      *(_WORD *)&v125[10] = 1024;
      *(_DWORD *)&v125[12] = v14;
      *(_WORD *)&v125[16] = 2082;
      *(_QWORD *)&v125[18] = v60;
      LOWORD(v126) = 1024;
      *(_DWORD *)((char *)&v126 + 2) = v9;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) EIS measurement #%d on %d (%{public}s) returned %#x", buf, 0x24u);
LABEL_80:
      v59 = 0;
    }
LABEL_81:
    if (objc_msgSend(a1, "isWet"))
    {
      v4 = v117;
      if ((objc_msgSend(a1, "isReceptacleEmpty") & 1) == 0 && (objc_msgSend(a1, "isHeadsetConnected") & 1) == 0)
      {
        if (!(((_DWORD)v9 != 0) | updated & 1))
          updated = updateAccyHalogenHealthDictionary(a1);
        _generateUIAnalyticEvents(a1, v118);
      }
    }
    else
    {
      v4 = v117;
    }
    if (v59)
    {
      v3 = v118;
      goto LABEL_97;
    }
    usleep(0x186A0u);
    v73 = v22 > 3;
    v10 = v22 + 1;
    v74 = v73 || v59;
    v3 = v118;
    if (v74 == 1)
      goto LABEL_97;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v125 = v3;
    v76 = MEMORY[0x1E0C81028];
    v77 = "(%d) IOAccessoryManagerGetFreePinMask() failed so abort measurement";
    v78 = 8;
LABEL_96:
    _os_log_impl(&dword_1D13BF000, v76, OS_LOG_TYPE_DEFAULT, v77, buf, v78);
  }
LABEL_97:
  v8 = 0x1ED931000uLL;
  if ((_DWORD)v9)
    goto LABEL_178;
  if ((updated & 1) == 0)
    updateAccyHalogenHealthDictionary(a1);
  v79 = objc_msgSend(v2, "halogenResult");
  LODWORD(v9) = 0;
  if (v79 > 8)
    goto LABEL_178;
  if (((1 << v79) & 0x160) != 0)
  {
    LODWORD(v9) = 0;
    if (!objc_msgSend((id)gUserLdcmParams, "enableHalogenSnrTtr")
      || !gEnableTapToRadarPopup
      || !gGiveUserRadarOption
      || !gIsInternalBuild)
    {
      goto LABEL_178;
    }
    if ((objc_msgSend(a1, "isTapToRadarPending") & 1) == 0)
    {
      objc_msgSend(a1, "setIsTapToRadarPending:", 1);
      IOAccessoryGiveUserRadarOption(a1, 1);
    }
LABEL_177:
    LODWORD(v9) = 0;
    goto LABEL_178;
  }
  if (((1 << v79) & 3) == 0)
  {
    if (v79 != 2)
      goto LABEL_178;
    if (objc_msgSend(a1, "dryCnt"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v83 = objc_msgSend(a1, "dryCnt");
        v84 = objc_msgSend(a1, "minDryReadings");
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v125 = v3;
        *(_WORD *)&v125[4] = 2048;
        *(_QWORD *)&v125[6] = v83;
        *(_WORD *)&v125[14] = 2048;
        *(_QWORD *)&v125[16] = v84;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) dryCnt=%llu didn't reach the minimum threshold of %llu before reading wet again", buf, 0x1Cu);
      }
      objc_msgSend(a1, "setDryCnt:", 0);
    }
    if ((objc_msgSend(a1, "isWet") & 1) == 0)
    {
      objc_msgSend(a1, "setEventBasedPDigitalID:", (id)objc_msgSend(a1, "connectedAccessoryPDigitalID"));
      objc_msgSend(a1, "setEventBasedDigitalID:", objc_msgSend(a1, "connectedAccessoryDigitalID"));
      objc_msgSend(a1, "setEventBasedOrientation:", objc_msgSend(a1, "connectedAccessoryOrientation"));
      v85 = mach_continuous_time();
      if (objc_msgSend(a1, "isTimestampValid"))
      {
        v86 = v2;
        v87 = objc_msgSend(a1, "wetDryTransitionTimestamp");
        v88 = v87;
        if (dword_1EFC5BAC4)
        {
          v89 = dword_1EFC5BAC4;
          v90 = v87 * (unint64_t)sTimebaseInfo / dword_1EFC5BAC4;
        }
        else
        {
          mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
          v89 = dword_1EFC5BAC4;
          v90 = v88 * (unint64_t)sTimebaseInfo / dword_1EFC5BAC4;
          if (!dword_1EFC5BAC4)
          {
            mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
            v89 = dword_1EFC5BAC4;
          }
        }
        v2 = v86;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v125 = v3;
          *(_WORD *)&v125[4] = 2048;
          *(_QWORD *)&v125[6] = (v85 * sTimebaseInfo / v89 - v90) / 0x3B9ACA00;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) EIS measurement dry interval = %lld seconds", buf, 0x12u);
        }
      }
      IOAccessoryAggDPostScalarKey((uint64_t)CFSTR("com.apple.ioaccessorymanager.voltage.count"), (uint64_t)a1);
      objc_msgSend(v2, "capacitanceInNanoF");
      IOAccessoryAggDPostHistogramKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.initial.wet.capacitance.histogram"), a1, v100);
      objc_msgSend(v2, "goertzelImpedance");
      IOAccessoryAggDPostHistogramKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.initial.wet.impedance.histogram"), a1, v101 / v11);
      if ((objc_msgSend(a1, "isReceptacleEmpty") & 1) == 0 && (objc_msgSend(a1, "isHeadsetConnected") & 1) == 0)
        _generateUIAnalyticEvents(a1, v3);
      objc_msgSend(a1, "setWetDryTransitionTimestamp:", v85);
      objc_msgSend(a1, "setIsTimestampValid:", 1);
      objc_msgSend(a1, "setIsWet:", 1);
      reportEisMeasurementStateChange(a1);
    }
    if (objc_msgSend((id)gUserLdcmParams, "enableHalogenMitigationsAndUI") != 1
      && gEnableTapToRadarPopup
      && gGiveUserRadarOption
      && gIsInternalBuild)
    {
      if ((objc_msgSend(a1, "wasTapToRadarShown") & 1) != 0 || (objc_msgSend(a1, "isTapToRadarPending") & 1) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v125 = v3;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) Suppress TapToRadar as it was already shown on this insertion", buf, 8u);
        }
      }
      else
      {
        objc_msgSend(a1, "setWasTapToRadarShown:", 1);
        objc_msgSend(a1, "setIsTapToRadarPending:", 1);
        IOAccessoryGiveUserRadarOption(a1, 0);
      }
    }
    if (objc_msgSend(a1, "isTimestampValid") && (objc_msgSend(a1, "isHeadsetConnected") & 1) == 0)
    {
      v102 = objc_msgSend(a1, "wetDryTransitionTimestamp");
      v103 = dword_1EFC5BAC4;
      if (!dword_1EFC5BAC4)
      {
        mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
        v103 = dword_1EFC5BAC4;
      }
      v104 = v102 * (unint64_t)sTimebaseInfo / v103;
      v105 = mach_continuous_time();
      v106 = dword_1EFC5BAC4;
      if (!dword_1EFC5BAC4)
      {
        mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
        v106 = dword_1EFC5BAC4;
      }
      v107 = v105 * sTimebaseInfo / v106 - v104;
      if (v107 / 0x3B9ACA00 >= objc_msgSend((id)gUserLdcmParams, "maxVhiDurationSec")
        && (objc_msgSend(a1, "didWetTooLong") & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v125 = v3;
          *(_WORD *)&v125[4] = 2048;
          *(_QWORD *)&v125[6] = v107 / 0x3B9ACA00;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) wet too long = %lld seconds", buf, 0x12u);
        }
        IOAccessoryAggDPostHistogramKey(CFSTR("com.apple.ioaccessorymanager.ldcm.notification.wettoolong"), a1, (double)(v107 / 0x3B9ACA00));
        objc_msgSend(a1, "setDidWetTooLong:", 1);
      }
    }
    goto LABEL_177;
  }
  if (!objc_msgSend(a1, "isWet"))
    goto LABEL_177;
  v9 = objc_msgSend(a1, "dryCnt");
  objc_msgSend(a1, "setDryCnt:", objc_msgSend(a1, "dryCnt") + 1);
  v80 = mach_continuous_time();
  if (!v9)
  {
    objc_msgSend(a1, "setFirstDryTimestamp:", v80);
    goto LABEL_178;
  }
  v81 = objc_msgSend(a1, "dryCnt");
  if (v81 >= objc_msgSend(a1, "minDryReadings"))
  {
    if (objc_msgSend(a1, "isTimestampValid"))
    {
      v91 = objc_msgSend(a1, "firstDryTimestamp");
      v92 = v91 - objc_msgSend(a1, "wetDryTransitionTimestamp");
      v93 = dword_1EFC5BAC4;
      if (!dword_1EFC5BAC4)
      {
        mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
        v93 = dword_1EFC5BAC4;
      }
      v94 = v92 * (unint64_t)sTimebaseInfo / v93;
      v95 = v94 / 0x3B9ACA00;
      if (objc_msgSend(a1, "accessoryConnectedWhileWet"))
      {
        v96 = v3;
        v97 = objc_msgSend(a1, "firstDryTimestamp");
        v98 = v97 - objc_msgSend(a1, "wetAccessoryAttachTimestamp");
        v99 = dword_1EFC5BAC4;
        if (!dword_1EFC5BAC4)
        {
          mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
          v99 = dword_1EFC5BAC4;
        }
        v95 = v98 * (unint64_t)sTimebaseInfo / v99 / 0x3B9ACA00;
        v3 = v96;
        v8 = 0x1ED931000uLL;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v125 = v3;
        *(_WORD *)&v125[4] = 2048;
        *(_QWORD *)&v125[6] = v95;
        *(_WORD *)&v125[14] = 2048;
        *(_QWORD *)&v125[16] = v94 / 0x3B9ACA00;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) EIS measurement wet interval = %lld seconds, dryTime = %lld seconds", buf, 0x1Cu);
      }
      if (objc_msgSend(a1, "didConfidentNotify") && (objc_msgSend(a1, "didWetTooLong") & 1) == 0)
      {
        if (v95 >= objc_msgSend((id)gUserLdcmParams, "minVhiDurationSec")
          || (objc_msgSend(a1, "isReceptacleEmpty") & 1) != 0)
        {
          if ((objc_msgSend(a1, "didHighConfidentNotify") & 1) == 0)
          {
            IOAccessoryAggDPostScalarKey((uint64_t)CFSTR("com.apple.ioaccessorymanager.ldcm.notification.highconfidentcount"), (uint64_t)a1);
            objc_msgSend(a1, "setDidHighConfidentNotify:", 1);
          }
          if ((objc_msgSend(a1, "isReceptacleEmpty") & 1) == 0 && (objc_msgSend(a1, "didWetDuration") & 1) == 0)
          {
            IOAccessoryAggDPostHistogramKey(CFSTR("com.apple.ioaccessorymanager.ldcm.notification.wetduration"), a1, (double)v95);
            objc_msgSend(a1, "setDidWetDuration:", 1);
          }
        }
        else
        {
          IOAccessoryAggDPostHistogramKey(CFSTR("com.apple.ioaccessorymanager.ldcm.notification.drytooshort"), a1, (double)v95);
        }
      }
      IOAccessoryAggDPostHistogramKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.drytime.histogram"), a1, (double)(v94 / 0xDF8475800));
      IOAccessoryAggDPostHistogramKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.drytimeV2.histogram"), a1, (double)(v94 / 0xDF8475800));
    }
    reportEisMeasurementStateChange(a1);
    objc_msgSend(a1, "setWetDryTransitionTimestamp:", v80);
    objc_msgSend(a1, "setIsTimestampValid:", 1);
    objc_msgSend(a1, "setIsWet:", 0);
    objc_msgSend(a1, "setDryCnt:", 0);
    objc_msgSend(a1, "setDidConfidentNotify:", 0);
    objc_msgSend(a1, "setDidHighConfidentNotify:", 0);
    objc_msgSend(a1, "setDidNotify:", 0);
    objc_msgSend(a1, "setDidWetDuration:", 0);
    objc_msgSend(a1, "setDidWetTooLong:", 0);

    objc_msgSend(a1, "setEventBasedPDigitalID:", 0);
    objc_msgSend(a1, "setEventBasedDigitalID:", 0);
    objc_msgSend(a1, "setEventBasedOrientation:", 0);
    goto LABEL_177;
  }
  LODWORD(v9) = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v82 = objc_msgSend(a1, "dryCnt");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v125 = v3;
    *(_WORD *)&v125[4] = 2048;
    *(_QWORD *)&v125[6] = v82;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) dryCnt = %llu", buf, 0x12u);
    goto LABEL_177;
  }
LABEL_178:
  if ((objc_msgSend(*(id *)(v8 + 3080), "userBehaviorMask") & 0x10) == 0
    && objc_msgSend(a1, "isReceptacleEmpty")
    && (objc_msgSend(a1, "isWet") & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v125 = v3;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) Empty Receptacle Dry State. Disable measurements", buf, 8u);
    }
    halogenMeasurementCleanup(a1);
  }
  _holdPowerAssertion(0, a1);
LABEL_185:
  if (objc_msgSend(a1, "isMeasurementEnabled"))
  {
    if ((_DWORD)v9 == 8)
    {
      v109 = objc_msgSend(a1, "ldcmStartMeasurementsRetryNs");
      v110 = 1;
    }
    else
    {
      if ((_DWORD)v9 == 6)
      {
        v108 = objc_msgSend(a1, "ldcmArbiterRetryNs");
      }
      else if (objc_msgSend(a1, "isWet"))
      {
        v108 = objc_msgSend(a1, "wetPollingIntervalNs");
      }
      else
      {
        v108 = objc_msgSend(a1, "dryPollingIntervalNs");
      }
      v109 = v108;
      v110 = 0;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v125 = "performEisMeasurement";
      *(_WORD *)&v125[8] = 2048;
      *(_QWORD *)&v125[10] = v109 / 0xF4240;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s start measurement timer: %llu ms\n", buf, 0x16u);
    }
    v111 = objc_msgSend(a1, "timer");
    v112 = dispatch_walltime(0, v109);
    dispatch_source_set_timer(v111, v112, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_msgSend(a1, "setAttachDelayTimerRunning:", v110);
  }
LABEL_197:
  objc_msgSend((id)objc_msgSend(a1, "cond"), "lock");
  objc_msgSend(a1, "setIsMeasurementActive:", 0);
  objc_msgSend((id)objc_msgSend(a1, "cond"), "signal");
  objc_msgSend((id)objc_msgSend(a1, "cond"), "unlock");
LABEL_198:
  result = connect;
  if (connect)
    return IOServiceClose(connect);
  return result;
}

uint64_t isDeviceTypeC_V3()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  BOOL v2;
  io_registry_entry_t v3;
  io_object_t v4;
  const __CFAllocator *v5;
  const __CFNumber *CFProperty;
  const __CFNumber *v7;
  int v8;
  const __CFDictionary *v9;
  BOOL v10;
  io_registry_entry_t v11;
  const __CFNumber *v12;
  int v13;
  io_object_t v15;
  const __CFAllocator *v16;
  const __CFNumber *v17;
  int valuePtr;
  io_iterator_t existing[2];

  *(_QWORD *)existing = 0;
  v0 = *MEMORY[0x1E0CBBAA8];
  v1 = IOServiceMatching("IOPort");
  if (IOServiceGetMatchingServices(v0, v1, &existing[1]))
    v2 = 1;
  else
    v2 = existing[1] == 0;
  if (v2)
  {
    v3 = 0;
LABEL_12:
    v7 = 0;
    v8 = 0;
    goto LABEL_13;
  }
  v4 = IOIteratorNext(existing[1]);
  v3 = v4;
  if (!v4)
    goto LABEL_12;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  while (1)
  {
    valuePtr = 0;
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, CFSTR("PortType"), v5, 0);
    v7 = CFProperty;
    if (CFProperty)
    {
      CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
      if (valuePtr == 2)
        break;
    }
    IOObjectRelease(v3);
    CFRelease(v7);
    v3 = IOIteratorNext(existing[1]);
    if (!v3)
      goto LABEL_12;
  }
  v8 = 1;
LABEL_13:
  v9 = IOServiceMatching("IOPortFeatureLDCM");
  if (IOServiceGetMatchingServices(v0, v9, existing))
    v10 = 1;
  else
    v10 = existing[0] == 0;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
LABEL_19:
    v13 = 1;
    if (!v3)
      goto LABEL_21;
LABEL_20:
    IOObjectRelease(v3);
    goto LABEL_21;
  }
  v15 = IOIteratorNext(existing[0]);
  v11 = v15;
  if (v15)
  {
    v16 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      valuePtr = -1431655766;
      v17 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v11, CFSTR("ArchitectureVersion"), v16, 0);
      if (v17)
      {
        v12 = v17;
        CFNumberGetValue(v17, kCFNumberIntType, &valuePtr);
        if (valuePtr == 3)
          goto LABEL_19;
        IOObjectRelease(v11);
        CFRelease(v12);
      }
      v11 = IOIteratorNext(existing[0]);
    }
    while (v11);
  }
  v12 = 0;
  v13 = 0;
  if (v3)
    goto LABEL_20;
LABEL_21:
  if (existing[1])
    IOObjectRelease(existing[1]);
  if (v11)
    IOObjectRelease(v11);
  if (existing[0])
    IOObjectRelease(existing[0]);
  if (v7)
    CFRelease(v7);
  if (v12)
    CFRelease(v12);
  return v8 & v13;
}

uint64_t IOAccessoryStartVoltageEventMonitorLegacy(uint64_t result)
{
  __CFRunLoop *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const void *v6;
  const void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  int v23;
  IONotificationPort *v24;
  const __CFDictionary *v25;
  kern_return_t v26;
  const __CFDictionary *v27;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v29;
  __CFRunLoop *Main;
  IONotificationPort *v31;
  const __CFDictionary *v32;
  mach_port_t mainPort;
  void *v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (__CFRunLoop *)result;
    v2 = dlopen("/System/Library/PrivateFrameworks/AggregateDictionary.framework/AggregateDictionary", 4);
    if (v2)
    {
      v3 = v2;
      _ADClientAddValueForScalarKey = (uint64_t (*)(_QWORD, _QWORD))dlsym(v2, "ADClientAddValueForScalarKey");
      _ADClientClearDistributionKey = (uint64_t)dlsym(v3, "ADClientClearDistributionKey");
      _ADClientClearScalarKey = (uint64_t)dlsym(v3, "ADClientClearScalarKey");
      _ADClientPushValueForDistributionKey = (uint64_t (*)(_QWORD, double))dlsym(v3, "ADClientPushValueForDistributionKey");
      _ADClientSetValueForScalarKey = (uint64_t (*)(_QWORD))dlsym(v3, "ADClientSetValueForScalarKey");
    }
    v4 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 4);
    if (v4)
      _logEventForAppleCare = (uint64_t (*)(_QWORD))dlsym(v4, "logEventForAppleCare");
    v5 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 4);
    if (v5)
      _FBSOpenApplicationOptionKeyPromptUnlockDevice_0 = (uint64_t)dlsym(v5, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
    result = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3740]);
    gIOAMLogLock = result;
    if (result)
    {
      v6 = (const void *)MGCopyAnswer();
      if (v6)
      {
        v7 = v6;
        gIsInternalBuild = CFEqual(v6, CFSTR("Internal")) != 0;
        CFRelease(v7);
      }
      else
      {
        gIsInternalBuild = 0;
      }
      mainPort = *MEMORY[0x1E0CBBAB8];
      result = (uint64_t)IONotificationPortCreate(*MEMORY[0x1E0CBBAB8]);
      gIOnotify = result;
      if (result)
      {
        result = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
        gDockState = result;
        if (result)
        {
          v8 = (id)result;
          result = objc_alloc_init(IOAccessoryUserLdcmParamClass);
          gUserLdcmParams = result;
          if (result)
          {
            result = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
            gHalogenMeasurements = result;
            if (result)
            {
              v9 = (id)result;
              result = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              gDigitalIDTimeWetDict = result;
              if (result)
              {
                v10 = (id)result;
                result = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                gDigitalIDCountWetDict = result;
                if (result)
                {
                  v11 = (id)result;
                  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
                  if (!v12)
                    goto LABEL_42;
                  v13 = objc_msgSend(v12, "objectForKey:", CFSTR("accyHealthDict"));
                  if (!v13)
                    goto LABEL_42;
                  v14 = v13;
                  v34 = 0;
                  v15 = (void *)MEMORY[0x1E0CB3710];
                  v16 = (void *)MEMORY[0x1E0C99E60];
                  v17 = objc_opt_class();
                  v18 = objc_opt_class();
                  v19 = (void *)objc_msgSend(v15, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0), v14, &v34);
                  v20 = v34;
                  if (v34)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                    {
                      v21 = objc_msgSend((id)objc_msgSend(v20, "localizedDescription"), "UTF8String");
                      *(_DWORD *)buf = 136315394;
                      v36 = "retrievePersistentAccyHealthDictionary";
                      v37 = 2080;
                      v38 = v21;
                      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s err: %s", buf, 0x16u);
                      v20 = v34;
                    }

                  }
                  if (v19)
                  {
                    gAccyHealthDictionary = objc_msgSend(v19, "mutableCopy");
                    if (gAccyHealthDictionary)
                      goto LABEL_27;
                  }
                  else
                  {
LABEL_42:
                    if (gAccyHealthDictionary)
                    {
LABEL_27:
                      gAssetContext = 0;
                      byte_1ED931AF0 = 0;
                      v23 = isDeviceTypeC_V3();
                      v24 = (IONotificationPort *)gIOnotify;
                      if (v23)
                      {
                        v25 = IOServiceMatching("IOPort");
                        v26 = IOServiceAddMatchingNotification(v24, "IOServiceFirstPublish", v25, (IOServiceMatchingCallback)IOAccessoryServiceMatchingCallbackTypeC, (void *)gIOnotify, (io_iterator_t *)&gIOiter);
                        IOAccessoryServiceMatchingCallbackTypeC((IONotificationPort *)gIOnotify, gIOiter);
                      }
                      else
                      {
                        v27 = IOServiceMatching("AppleTriStarBuiltIn");
                        v26 = IOServiceAddMatchingNotification(v24, "IOServiceFirstPublish", v27, (IOServiceMatchingCallback)IOAccessoryServiceMatchingCallback, (void *)gIOnotify, (io_iterator_t *)&gIOiter);
                        IOAccessoryServiceMatchingCallback((IONotificationPort *)gIOnotify, gIOiter);
                      }
                      if (v26)
                        return 0;
                      result = (uint64_t)IONotificationPortGetRunLoopSource((IONotificationPortRef)gIOnotify);
                      if (result)
                      {
                        CFRunLoopAddSource(v1, (CFRunLoopSourceRef)result, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
                        if (objc_msgSend((id)gUserLdcmParams, "enableHalogenMitigationsAndUI") == 1)
                        {
                          qword_1ED931BD8 = 0;
                          qword_1ED931BF8 = (uint64_t)v1;
                          qword_1ED931C00 = 0;
                        }
                        if (!gBatteryStatusNotificationContext)
                        {
                          gBatteryStatusNotificationContext = (uint64_t)IONotificationPortCreate(mainPort);
                          RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)gBatteryStatusNotificationContext);
                          if (RunLoopSource)
                          {
                            v29 = RunLoopSource;
                            Main = CFRunLoopGetMain();
                            CFRunLoopAddSource(Main, v29, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
                            v31 = (IONotificationPort *)gBatteryStatusNotificationContext;
                            v32 = IOServiceMatching("IOPMPowerSource");
                            if (IOServiceAddMatchingNotification(v31, "IOServiceFirstMatch", v32, (IOServiceMatchingCallback)__powerBatteryMatch, &gBatteryStatusNotificationContext, (io_iterator_t *)&dword_1ED931B00))
                            {
                              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                                IOAccessoryStartVoltageEventMonitorLegacy_cold_1();
                            }
                            else
                            {
                              __powerBatteryMatch(&gBatteryStatusNotificationContext, dword_1ED931B00);
                            }
                          }
                        }
                        return 1;
                      }
                      return result;
                    }
                  }
                  gAccyHealthDictionary = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
                  v22 = (id)gAccyHealthDictionary;
                  goto LABEL_27;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void IOAccessoryServiceMatchingCallbackTypeC(IONotificationPort *a1, io_iterator_t a2)
{
  const __CFAllocator *v4;
  CFStringRef v5;
  io_object_t v6;
  io_registry_entry_t v7;
  IOAccessoryLDCMPortManagerTypeC *v8;
  const __CFArray *CFProperty;
  const __CFArray *v10;
  IOAccessoryLDCMPortManagerTypeC *v11;
  NSObject *v12;
  _QWORD v13[5];
  io_object_t notification;
  CFRange v15;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], "LDCM", 0x8000100u);
  v6 = IOIteratorNext(a2);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    while (1)
    {
      notification = -1431655766;
      CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(v7, CFSTR("FeaturesSupported"), v4, 0);
      if (CFProperty)
      {
        v10 = CFProperty;
        if (CFArrayGetCount(CFProperty) >= 1)
        {
          v15.length = CFArrayGetCount(v10);
          v15.location = 0;
          if (CFArrayContainsValue(v10, v15, v5))
          {
            v11 = -[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]([IOAccessoryLDCMPortManagerTypeC alloc], "initWithParams:dryPollingIntervalNs:", 60, 30);
            v8 = v11;
            if (v11 && -[IOAccessoryLDCMPortManagerTypeC typeC](v11, "typeC"))
            {
              v12 = -[IOAccessoryLDCMPortManagerTypeC halogenTypeCDispatchQueue](v8, "halogenTypeCDispatchQueue");
              v13[0] = MEMORY[0x1E0C809B0];
              v13[1] = 3221225472;
              v13[2] = __IOAccessoryServiceMatchingCallbackTypeC_block_invoke;
              v13[3] = &unk_1E9214120;
              v13[4] = v8;
              dispatch_async(v12, v13);
            }
            if (IOServiceAddInterestNotification(a1, v7, "IOGeneralInterest", (IOServiceInterestCallback)IOAccessoryInterestNotificationCallbackTypeC, v8, &notification))
            {
              IOObjectRelease(v7);
              if (!v5)
                goto LABEL_17;
LABEL_16:
              CFRelease(v5);
              goto LABEL_17;
            }
          }
        }
        IOObjectRelease(v7);
        CFRelease(v10);
      }
      else
      {
        IOObjectRelease(v7);
      }
      v7 = IOIteratorNext(a2);
      if (!v7)
        goto LABEL_15;
    }
  }
  v8 = 0;
LABEL_15:
  if (v5)
    goto LABEL_16;
LABEL_17:
  if (v8)

}

void IOAccessoryServiceMatchingCallback(IONotificationPort *a1, io_iterator_t iterator)
{
  uint64_t v2;
  HalogenWrapper *v3;
  unint64_t v4;
  NSObject *v5;
  int Type;
  _BOOL4 v7;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v9;
  int Value;
  uint64_t PrimaryPort;
  int v12;
  HalogenWrapper *v13;
  NSObject *v14;
  unint64_t v15;
  id v16;
  CFTimeZoneRef v17;
  CFTimeZoneRef v18;
  __CFCalendar *v19;
  __CFCalendar *v20;
  CFAbsoluteTime Current;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  NSObject *global_queue;
  kern_return_t v31;
  _DWORD *v32;
  _DWORD *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  HalogenWrapper *v41;
  HalogenMeasurement *v42;
  NSObject *v43;
  char v44;
  const __CFString *identifier;
  const __CFAllocator *allocator;
  int v49;
  _QWORD v50[5];
  _QWORD block[4];
  int v52;
  io_object_t notification;
  io_connect_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  io_connect_t connect[4];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v54 = 0;
  v2 = IOIteratorNext(iterator);
  v3 = 0;
  if (!(_DWORD)v2)
  {
LABEL_67:
    v44 = 1;
    goto LABEL_70;
  }
  v4 = 0x1ED931000uLL;
  identifier = (const __CFString *)*MEMORY[0x1E0C9B008];
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = MEMORY[0x1E0C81028];
  while (1)
  {
    notification = -1431655766;
    Type = IOAccessoryManagerGetType();
    v7 = (Type & 0x600) != 0 && (Type & 0xF0) == 0;
    if ((IOAccessoryManagerGetType() & 0xF0) != 0
      || (CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v2, CFSTR("SupportsEisAfe"), allocator, 0)) == 0)
    {
      PrimaryPort = IOAccessoryManagerGetPrimaryPort();
      v12 = 0;
      if (!v7)
        goto LABEL_47;
    }
    else
    {
      v9 = CFProperty;
      Value = CFBooleanGetValue(CFProperty);
      CFRelease(v9);
      PrimaryPort = IOAccessoryManagerGetPrimaryPort();
      if (Value)
      {
        if (objc_msgSend(*(id *)(v4 + 3080), "enableHalogenMitigationsAndUI") == 1)
          objc_msgSend(*(id *)(v4 + 3080), "setUserBehaviorMask:", 47);
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (!v7)
          goto LABEL_47;
      }
    }
    v49 = v12;
    v13 = v3;
    v14 = v5;
    v15 = v4;
    objc_msgSend((id)gIOAMLogLock, "lock");
    if (gIOAMLogFilepath)
    {

      gIOAMLogFilepath = 0;
    }
    gIOAMLogFilepath = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/"));
    v16 = (id)gIOAMLogFilepath;
    v59 = 0;
    *(_QWORD *)connect = 0;
    v57 = 0;
    v58 = 0;
    v55 = 0;
    v56 = 0;
    v17 = CFTimeZoneCopySystem();
    if (v17)
      break;
LABEL_26:
    objc_msgSend((id)gIOAMLogLock, "unlock");
    connect[0] = 0;
    if (IOServiceOpen(v2, *MEMORY[0x1E0C83DA0], 0, connect))
      v27 = 0;
    else
      v27 = IOAccessoryManagerGetLdcmParams() == 0;
    v4 = v15;
    v5 = v14;
    if (connect[0])
      IOServiceClose(connect[0]);
    v3 = v13;
    if (!v27)
      goto LABEL_69;
    if ((Type & 0x200) != 0)
      objc_msgSend(*(id *)(v4 + 3080), "setUserBehaviorMask:", objc_msgSend(*(id *)(v4 + 3080), "userBehaviorMask") & 0xFFFFFFFBLL);
    v12 = v49;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      connect[0] = 136315138;
      *(_QWORD *)&connect[1] = "retrievePersistentConfigDictParams";
      _os_log_impl(&dword_1D13BF000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)connect, 0xCu);
    }
    v28 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    if (v28)
    {
      v29 = (void *)objc_msgSend(v28, "objectForKey:", CFSTR("configDictionary"));
      if (v29)
      {
        if (v7)
          processLdcmBehaviorPlist(v29, Type);
      }
      else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        connect[0] = 136315138;
        *(_QWORD *)&connect[1] = "retrievePersistentConfigDictParams";
        _os_log_impl(&dword_1D13BF000, v5, OS_LOG_TYPE_DEFAULT, "%s: no persistent dictionary", (uint8_t *)connect, 0xCu);
      }
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __IOAccessoryServiceMatchingCallback_block_invoke;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    v52 = Type;
    dispatch_async(global_queue, block);
    if (IOServiceOpen(v2, *MEMORY[0x1E0C83DA0], 0, &v54))
      goto LABEL_69;
    if (IOAccessoryManagerSetVoltageDetected())
      goto LABEL_69;
    setDriverMitigationEnabled(PrimaryPort, v2, (objc_msgSend(*(id *)(v4 + 3080), "userBehaviorMask") >> 3) & 1);
    v31 = IOServiceClose(v54);
    v54 = 0;
    if (v31)
      goto LABEL_69;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(connect[0]) = 0;
      _os_log_impl(&dword_1D13BF000, v5, OS_LOG_TYPE_DEFAULT, ">>> showing initial accy health dictionary", (uint8_t *)connect, 2u);
    }
    dbgShowAccyHealthDictionary();
LABEL_47:
    v32 = malloc_type_calloc(1uLL, 0x88uLL, 0x10800406FDFDDCEuLL);
    if (!v32)
      goto LABEL_69;
    v33 = v32;
    *v32 = 2;
    *((_QWORD *)v32 + 13) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33[32] = 5000;
    *(_OWORD *)connect = *(_OWORD *)v33;
    v34 = *((_OWORD *)v33 + 1);
    v35 = *((_OWORD *)v33 + 2);
    v36 = *((_OWORD *)v33 + 4);
    v63 = *((_OWORD *)v33 + 3);
    v64 = v36;
    v61 = v34;
    v62 = v35;
    v37 = *((_OWORD *)v33 + 5);
    v38 = *((_OWORD *)v33 + 6);
    v39 = *((_OWORD *)v33 + 7);
    v68 = *((_QWORD *)v33 + 16);
    v66 = v38;
    v67 = v39;
    v65 = v37;
    v40 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithDockState:", connect);
    free(v33);
    objc_msgSend((id)gDockState, "setObject:forKey:", v40, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PrimaryPort));
    if (v12)
    {
      v41 = objc_alloc_init(HalogenWrapper);
      if (v41)
      {
        v3 = v41;
        objc_msgSend((id)gHalogenMeasurements, "setObject:forKey:", v41, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PrimaryPort));
        v42 = -[HalogenMeasurement initWithSize:onPort:]([HalogenMeasurement alloc], "initWithSize:onPort:", objc_msgSend(*(id *)(v4 + 3080), "numEisHalogenSamples"), PrimaryPort);
        if (v42)
        {
          -[HalogenWrapper setHalogenMeasurement:](v3, "setHalogenMeasurement:", v42);
          -[HalogenWrapper setService:](v3, "setService:", v2);
          -[HalogenWrapper setPortID:](v3, "setPortID:", PrimaryPort);
        }
        else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          connect[0] = 136315138;
          *(_QWORD *)&connect[1] = "IOAccessoryServiceMatchingCallback";
          _os_log_impl(&dword_1D13BF000, v5, OS_LOG_TYPE_DEFAULT, "%s failed to allocate HalogenMeasurement\n", (uint8_t *)connect, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          connect[0] = 136315138;
          *(_QWORD *)&connect[1] = "IOAccessoryServiceMatchingCallback";
          _os_log_impl(&dword_1D13BF000, v5, OS_LOG_TYPE_DEFAULT, "%s Failed to create halogenWrapper\n", (uint8_t *)connect, 0xCu);
        }
        v3 = 0;
      }
    }
    if (IOServiceAddInterestNotification(a1, v2, "IOGeneralInterest", (IOServiceInterestCallback)IOAccessoryInterestNotificationCallback, 0, &notification))
    {
      goto LABEL_69;
    }
    if (IOAccessoryManagerGetAccessoryID() == 91)
    {
      IOAccessoryHandleAttach(v2);
    }
    else if (v3 && (objc_msgSend(*(id *)(v4 + 3080), "userBehaviorMask") & 0x10) != 0)
    {
      -[HalogenWrapper setIsMeasurementEnabled:](v3, "setIsMeasurementEnabled:", 1);
      v43 = -[HalogenWrapper halogenMeasurementDispatchQueue](v3, "halogenMeasurementDispatchQueue");
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __IOAccessoryServiceMatchingCallback_block_invoke_498;
      v50[3] = &unk_1E9214120;
      v50[4] = v3;
      dispatch_async(v43, v50);
    }
    IOObjectRelease(v2);
    v2 = IOIteratorNext(iterator);
    if (!(_DWORD)v2)
      goto LABEL_67;
  }
  v18 = v17;
  v19 = CFCalendarCreateWithIdentifier(0, identifier);
  if (!v19)
  {
    CFRelease(v18);
    goto LABEL_26;
  }
  v20 = v19;
  CFCalendarSetTimeZone(v19, v18);
  Current = CFAbsoluteTimeGetCurrent();
  CFCalendarDecomposeAbsoluteTime(v20, Current, "MdyHms", connect, &v59, &v58, &v57, &v56, &v55);
  v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02d%02d%02d-%02d%02d"), *(_QWORD *)connect, v59, v58 % 0x64, v57, v56);
  CFRelease(v18);
  CFRelease(v20);
  if (!v22)
    goto LABEL_26;
  objc_msgSend((id)gIOAMLogFilepath, "appendString:", v22);
  objc_msgSend((id)gIOAMLogFilepath, "appendString:", CFSTR(".log"));
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", CFSTR("/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/")) & 1) != 0|| objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/"), 1, 0, 0))
  {
    v23 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    if ((objc_msgSend(v23, "fileExistsAtPath:", gIOAMLogFilepath) & 1) != 0
      || (v24 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          objc_msgSend(v24, "createFileAtPath:contents:attributes:", gIOAMLogFilepath, 0, 0)))
    {
      v25 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtPath:error:", CFSTR("/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/"), 0);
      if ((unint64_t)objc_msgSend(v25, "count") < 4)
        goto LABEL_26;
      v26 = objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(v25, "sortedArrayUsingComparator:", &__block_literal_global_0), "firstObject"));
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", v26, 0) & 1) != 0)
        goto LABEL_26;
    }
  }
  objc_msgSend((id)gIOAMLogLock, "unlock");
  v3 = v13;
LABEL_69:
  v44 = 0;
LABEL_70:
  if (v54)
    IOServiceClose(v54);
  if ((v44 & 1) == 0)
    IOObjectRelease(v2);
  if (v3)

}

uint64_t IOAccessoryVoltageEventMonitorMode(uint64_t result, char a2, char a3)
{
  enableVoltageEventMonitorModeAggD = result;
  enableVoltageEventMonitorModeAppleCareLogging = a2;
  enableVoltageEventMonitorModeConsole = a3;
  return result;
}

uint64_t IOAccessoryResetLifetimeDuration(io_registry_entry_t a1, int a2)
{
  CFNumberRef v3;
  CFNumberRef v4;
  uint64_t v5;
  int valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = IORegistryEntrySetCFProperty(a1, CFSTR("acc-mb-ld-lifetime"), v3);
  CFRelease(v4);
  return v5;
}

uint64_t IOAccessoryRequestResetLifetimeDuration(int a1)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  uint64_t MatchingServices;
  io_registry_entry_t v5;
  io_object_t v6;
  uint64_t v7;
  io_iterator_t existing;

  existing = 0;
  v2 = *MEMORY[0x1E0CBBAB8];
  v3 = IOServiceMatching("AppleTriStarBuiltIn");
  MatchingServices = IOServiceGetMatchingServices(v2, v3, &existing);
  if ((_DWORD)MatchingServices)
  {
    v7 = MatchingServices;
  }
  else
  {
    while (1)
    {
      v5 = IOIteratorNext(existing);
      if (!v5)
        break;
      v6 = v5;
      v7 = IOAccessoryResetLifetimeDuration(v5, a1);
      IOObjectRelease(v6);
      if ((_DWORD)v7)
        goto LABEL_6;
    }
    v7 = 0;
  }
LABEL_6:
  if (existing)
    IOObjectRelease(existing);
  return v7;
}

unint64_t absoluteToNanoseconds(uint64_t a1)
{
  unsigned int v2;

  v2 = dword_1EFC5BAC4;
  if (!dword_1EFC5BAC4)
  {
    mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
    v2 = dword_1EFC5BAC4;
  }
  return (unint64_t)sTimebaseInfo * a1 / v2;
}

void IOAccessoryInterestNotificationCallbackTypeC(void *a1, io_registry_entry_t entry, int a3)
{
  const __CFBoolean *CFProperty;
  const __CFBoolean *v5;
  int Value;
  _BOOL4 v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 == -469794615)
  {
    CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, CFSTR("ConnectionActive"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (CFProperty)
    {
      v5 = CFProperty;
      if (a1)
      {
        Value = CFBooleanGetValue(CFProperty);
        v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
        if (Value)
        {
          if (v7)
          {
            v8 = 136315138;
            v9 = "IOAccessoryInterestNotificationCallbackTypeC";
            _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s kIOPort_Message_ConnectionStateChange attach\n", (uint8_t *)&v8, 0xCu);
          }
          objc_msgSend(a1, "handleAttachEvent");
        }
        else
        {
          if (v7)
          {
            v8 = 136315138;
            v9 = "IOAccessoryInterestNotificationCallbackTypeC";
            _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s kIOPort_Message_ConnectionStateChange detach \n", (uint8_t *)&v8, 0xCu);
          }
          objc_msgSend(a1, "handleDetachEvent");
        }
      }
      CFRelease(v5);
    }
  }
}

void performAssetQuery(uint64_t a1, __int16 a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  const char *v21;
  int v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "performAssetQuery";
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
  }
  v29 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E028]), "initWithAssetType:", CFSTR("com.apple.MobileAsset.IOAccessoryManager"));
  objc_msgSend(v4, "setQueriesLocalAssetInformationOnly:", a1);
  v5 = objc_msgSend(v4, "runQueryAndReturnError:", &v29);
  v6 = v29;
  if (v29)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend((id)objc_msgSend(v6, "localizedDescription"), "UTF8String");
      *(_DWORD *)buf = 136315394;
      v32 = "performAssetQuery";
      v33 = 2080;
      v34 = v7;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: encountered error: %s\n", buf, 0x16u);
    }

    return;
  }
  v8 = (void *)v5;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
    *(_DWORD *)buf = 136315394;
    v32 = "performAssetQuery";
    v33 = 2080;
    v34 = v9;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: MobileAsset query results: %s\n", buf, 0x16u);
  }
  v10 = (void *)objc_msgSend(v8, "lastObject", v29);
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "getAsset";
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
    }
    if ((a1 & 1) == 0 && (objc_msgSend(v10, "state") != 1 || !objc_msgSend(v10, "localURL")))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
        *(_DWORD *)buf = 136315394;
        v32 = "getAsset";
        v33 = 2080;
        v34 = v11;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Asset not yet downloaded, fetching: %s", buf, 0x16u);
      }
      v30 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "downloadAssetWithError";
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
      }
      if ((objc_msgSend(v10, "requiredDiskSpaceIsAvailable:error:", 0, &v30) & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v25 = objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
          v26 = objc_msgSend((id)objc_msgSend(v30, "description"), "UTF8String");
          *(_DWORD *)buf = 136315650;
          v32 = "downloadAssetWithError";
          v33 = 2080;
          v34 = v25;
          v35 = 2080;
          v36 = v26;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Skipping download for uninstalled asset. Error in asset %s: %s\n", buf, 0x20u);
        }
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_48;
        *(_DWORD *)buf = 136315138;
        v32 = "getAsset";
        v23 = MEMORY[0x1E0C81028];
        v24 = "%s: failed\n";
        goto LABEL_47;
      }
      objc_msgSend(v10, "beginDownloadWithOptions:", 0);
    }
    if (!objc_msgSend(v10, "localURL"))
    {
LABEL_48:
      v22 = 0;
      goto LABEL_49;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "localURL"), "description"), "UTF8String");
      *(_DWORD *)buf = 136315394;
      v32 = "getAsset";
      v33 = 2080;
      v34 = v12;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Asset on disk, found at: %s\n", buf, 0x16u);
    }
    v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "localURL"), "URLByAppendingPathComponent:", CFSTR("IOAccessoryManagerLdcmBehavior.plist")), "absoluteString");
    v14 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v14);
    v16 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        *(_DWORD *)buf = 136315138;
        v32 = "load_dict";
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: dictionaryWithContentsOfURL succeeded\n", buf, 0xCu);
      }
      gLdcmBehaviorPlist = (uint64_t)v15;
      v17 = v15;
      v18 = (id)gLdcmBehaviorPlist;
      if (v18)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v32 = "commitPersistentConfigDictParams";
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
        }
        v19 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v20 = v19;
        if (v19)
          objc_msgSend(v19, "setObject:forKey:", gLdcmBehaviorPlist, CFSTR("configDictionary"));
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          if (v20)
            v21 = "true";
          else
            v21 = "false";
          *(_DWORD *)buf = 136315394;
          v32 = "getAsset";
          v33 = 2080;
          v34 = (uint64_t)v21;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: commitPersistentConfigDictParams: success=%s", buf, 0x16u);
        }
        v22 = processLdcmBehaviorPlist(v18, a2);
        goto LABEL_49;
      }
    }
    else if (v16)
    {
      *(_DWORD *)buf = 136315138;
      v32 = "load_dict";
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: dictionaryWithContentsOfURL failed\n", buf, 0xCu);
    }
    v22 = 0;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
LABEL_49:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        if (v22)
          v27 = "true";
        else
          v27 = "false";
        *(_DWORD *)buf = 136315394;
        v32 = "getAsset";
        v33 = 2080;
        v34 = (uint64_t)v27;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: success=%s\n", buf, 0x16u);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        if (v22)
          v28 = "true";
        else
          v28 = "false";
        *(_DWORD *)buf = 136315394;
        v32 = "performAssetQuery";
        v33 = 2080;
        v34 = (uint64_t)v28;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: getOrDownloadAsset: %s\n", buf, 0x16u);
      }
      return;
    }
    *(_DWORD *)buf = 136315138;
    v32 = "getAsset";
    v23 = MEMORY[0x1E0C81028];
    v24 = "%s: load_dict failed\n";
LABEL_47:
    _os_log_impl(&dword_1D13BF000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
    goto LABEL_48;
  }
}

void sub_1D13CE6D8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "performAssetQuery";
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: exception\n", (uint8_t *)&buf, 0xCu);
    }
    objc_end_catch();
    JUMPOUT(0x1D13CE050);
  }
  _Unwind_Resume(a1);
}

void setDriverMitigationEnabled(int a1, io_service_t service, int a3)
{
  _BOOL4 v5;
  io_connect_t connect;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  int v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  connect = 0;
  if (IOServiceOpen(service, *MEMORY[0x1E0C83DA0], 0, &connect))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend((id)gUserLdcmParams, "userBehaviorMask");
    objc_msgSend((id)gUserLdcmParams, "userBehaviorMask");
    v5 = IOAccessoryManagerConfigureGoldbondMode() == 0;
  }
  if (connect)
    IOServiceClose(connect);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v8 = a1;
    v9 = 1024;
    v10 = a3;
    v11 = 1024;
    v12 = v5;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) ~~~ setDriverMitigationEnabled [%d] returned %d", buf, 0x14u);
  }
}

void IOAccessoryInterestNotificationCallback(uint64_t a1, io_registry_entry_t a2, int a3, unsigned int *a4)
{
  unsigned int *v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  void *v9;
  unint64_t v10;
  const char *v11;
  unint64_t v12;
  const char *v13;
  const char *v14;
  const char *v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  unint64_t v19;
  const char *v20;
  double v21;
  char *v22;
  unsigned int v23;
  io_service_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t PrimaryPort;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  char v36;
  const __CFAllocator *v37;
  const __CFNumber *CFProperty;
  const __CFNumber *v39;
  int Value;
  const __CFBoolean *v41;
  const __CFBoolean *v42;
  int v43;
  BOOL v44;
  const __CFString *v45;
  __CFString *MutableCopy;
  char v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  _BOOL4 v55;
  int v56;
  id v57;
  void *v58;
  unint64_t v59;
  void *v60;
  __CFString *v61;
  unint64_t v62;
  uint64_t i;
  double v64;
  int v65;
  int v66;
  id v67;
  int v68;
  unsigned int v69;
  void *v70;
  __int128 v71;
  uint64_t v72;
  unint64_t v73;
  _BOOL4 v74;
  int v75;
  char v76;
  void *v77;
  int v78;
  char v79;
  char v80;
  char *v81;
  unsigned __int16 *v82;
  unsigned __int16 *v83;
  int v84;
  int v85;
  char v86;
  unsigned int v87;
  int v88;
  char v89;
  uint64_t v90;
  int v91;
  unsigned int v92;
  unsigned int v93;
  uint64_t v94;
  _BOOL4 v95;
  _BOOL4 v96;
  _BOOL4 v97;
  int v98;
  io_service_t v99;
  int v100;
  int v101;
  unsigned int v102;
  uint64_t v103;
  NSObject *v104;
  const char *v105;
  unsigned int v106;
  int v107;
  unsigned int v108;
  uint64_t v109;
  unsigned int v110;
  uint64_t v111;
  uint64_t v112;
  IOAccessoryLdcmHealthClass *v113;
  IOAccessoryLdcmHealthClass *v114;
  int v115;
  int v116;
  int v117;
  __int128 v118;
  io_service_t v119;
  _BOOL4 v120;
  int v121;
  int v122;
  uint64_t v123;
  int v124;
  uint64_t v125;
  unint64_t v126;
  int v127;
  int v128;
  int v129;
  void *v130;
  void *v131;
  unint64_t v132;
  uint64_t v133;
  unsigned int v134;
  uint64_t v135;
  uint64_t v136;
  unsigned int v137;
  uint64_t v138;
  const __CFString *v139;
  const __CFString *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  unint64_t v145;
  unint64_t v146;
  NSObject *v147;
  __int128 v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  BOOL v154;
  uint64_t j;
  __int16 v156;
  unsigned __int16 v157;
  unsigned __int16 v158;
  uint64_t v159;
  unint64_t v160;
  uint64_t v161;
  unint64_t v162;
  uint64_t v163;
  unint64_t v164;
  unint64_t v165;
  uint64_t v166;
  unsigned int v167;
  unsigned int v168;
  unint64_t v169;
  const __CFString *v170;
  const __CFString *v171;
  const __CFString *v172;
  unint64_t v173;
  const __CFString *v174;
  const __CFString *v175;
  int v176;
  kern_return_t v177;
  unsigned int v178;
  io_service_t v179;
  void *v180;
  _BYTE *v181;
  unsigned int *v182;
  _BYTE v183[32];
  _BYTE v184[29];
  io_connect_t connect;
  uint8_t v186[4];
  int v187;
  _OWORD v188[4];
  __int128 v189;
  _BYTE v190[48];
  __int128 v191;
  uint64_t valuePtr;
  int v193;
  _BYTE buf[32];
  _BYTE v195[32];
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  uint64_t v200;
  _BYTE v201[136];
  uint64_t v202;

  v202 = *MEMORY[0x1E0C80C00];
  if (a3 > -469794790)
  {
    if (a3 == -469794725)
    {
      IOAccessoryHandleAttach(a2);
      return;
    }
    if (a3 == -469794726)
      goto LABEL_33;
    if (a3 != -469794789)
      return;
    v5 = a4;
    if (!a4)
      return;
    if (!gDockState)
      return;
    v6 = *a4;
    if (!objc_msgSend((id)gDockState, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6)))
      return;
    v182 = v5;
    v179 = a2;
    if (enableVoltageEventMonitorModeConsole)
    {
      v7 = *((unsigned __int8 *)v5 + 12);
      if (v7 > 3)
        v8 = "Invalid";
      else
        v8 = IOAccessoryGetEventCodeForIndex_eventCodeStr[v7];
      v180 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR(" (%d) Event: %s, TimeStamp = %llu, Vhi = %d, CumulativeTimeVhi = %d sec,"), v6, v8, *(_QWORD *)(v5 + 1), *((unsigned __int8 *)v5 + 13), *(unsigned int *)((char *)v5 + 46));
      v9 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR(" (%d) Event: %s, Vhi = %d, CumulativeTimeVhi = %d sec,"), v6, v8, *((unsigned __int8 *)v5 + 13), *(unsigned int *)((char *)v5 + 46));
      v10 = *((unsigned __int8 *)v5 + 45);
      if (v10 > 6)
        v11 = "Invalid";
      else
        v11 = IOAccessoryGetPowerModeStrForIndex_pwrModeStr[v10];
      v12 = *((unsigned __int8 *)v5 + 51);
      if (v12 > 2)
        v13 = "Invalid";
      else
        v13 = IOAccessoryGetOrientStrForIndex_orientStr[v12];
      if (*((_BYTE *)v5 + 52))
        v14 = "Yes";
      else
        v14 = "No";
      objc_msgSend(v180, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" DigitalID = [%02x %02x %02x %02x %02x %02x], ORIENT = %s, PH = %s, ACC_PWR = %s"), *((unsigned __int8 *)v5 + 14), *((unsigned __int8 *)v5 + 15), *((unsigned __int8 *)v5 + 16), *((unsigned __int8 *)v5 + 17), *((unsigned __int8 *)v5 + 18), *((unsigned __int8 *)v5 + 19), v13, v14, v11));
      if (*((_BYTE *)v5 + 52))
        v15 = "Yes";
      else
        v15 = "No";
      objc_msgSend(v9, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" DigitalID = [%02x %02x %02x %02x %02x %02x], ORIENT = %s, PH = %s, ACC_PWR = %s"), *((unsigned __int8 *)v5 + 14), *((unsigned __int8 *)v5 + 15), *((unsigned __int8 *)v5 + 16), *((unsigned __int8 *)v5 + 17), *((unsigned __int8 *)v5 + 18), *((unsigned __int8 *)v5 + 19), v13, v15, v11));
      v17 = 0;
      v18 = v5 + 5;
      do
      {
        if (*((_BYTE *)v18 + v17))
        {
          v19 = *((unsigned __int8 *)v18 + v17 + 6);
          if (v19 > 1)
            v20 = "Invalid";
          else
            v20 = IOAccessoryGetMeasStrForIndex_measStr[v19];
          LOWORD(v16) = *((_WORD *)v18 + v17 + 6);
          v21 = (double)v16 / 1000.0;
          v22 = IOAccessoryGetPinStrForIndex_pinStr[v17];
          objc_msgSend(v180, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %s(%s) = %.3fV"), v20, v22, *(_QWORD *)&v21));
          objc_msgSend(v9, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %s(%s) = .3%fV"), v20, v22, *(_QWORD *)&v21));
          v5 = v182;
        }
        ++v17;
      }
      while (v17 != 4);
      if (os_log_type_enabled(0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v201 = 138412290;
        *(_QWORD *)&v201[4] = v180;
        _os_log_impl(&dword_1D13BF000, 0, OS_LOG_TYPE_DEFAULT, "%@", v201, 0xCu);
      }
    }
    else
    {
      v9 = 0;
    }
    if (gPrevLog)
    {

      gPrevLog = 0;
    }
    if (v9)
    {
      gPrevLog = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v9);
      v57 = (id)gPrevLog;
    }
    IOAccessoryManagerGetType();
    if (enableVoltageEventMonitorModeAppleCareLogging)
    {
      v58 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      if (enableVoltageEventMonitorModeAppleCareLogging)
      {
        v59 = *((char *)v5 + 12);
        if (v59 <= 2)
        {
          v60 = v58;
          v61 = off_1E9214400[v59];
          objc_msgSend(v58, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 100));
          objc_msgSend(v60, "addObject:", v61);
          for (i = 0; i != 4; ++i)
          {
            if (*((_BYTE *)v5 + i + 20))
            {
              LOWORD(v62) = *((_WORD *)v5 + i + 16);
              v64 = (double)v62 / 1000.0;
            }
            else
            {
              v64 = 0.0;
            }
            objc_msgSend(v60, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), IOAccessoryGetPinStrForIndex_pinStr[i]));
            objc_msgSend(v60, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v64));
          }
          objc_msgSend(v60, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02x %02x %02x %02x %02x %02x"), *((unsigned __int8 *)v5 + 14), *((unsigned __int8 *)v5 + 15), *((unsigned __int8 *)v5 + 16), *((unsigned __int8 *)v5 + 17), *((unsigned __int8 *)v5 + 18), *((unsigned __int8 *)v5 + 19)));
          objc_msgSend(v60, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), *v5));
          objc_msgSend(v60, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0));
          objc_msgSend(v60, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0));
          objc_msgSend(v60, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((_BYTE *)v5 + 44) != 0));
          if (gAppleCareLogArray)
          {
            v65 = objc_msgSend(v60, "isEqualToArray:");

            gAppleCareLogArray = 0;
            v66 = v65 ^ 1;
          }
          else
          {
            v66 = 1;
          }
          gAppleCareLogArray = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v60);
          v67 = (id)gAppleCareLogArray;
          if (_logEventForAppleCare)
          {
            if (v66)
              _logEventForAppleCare(v60);
          }
        }
      }
    }
    v68 = *((unsigned __int8 *)v5 + 12);
    if (v68 == 3)
    {
      if (!gDockState)
        return;
      v26 = *v5;
      v77 = (void *)objc_msgSend((id)gDockState, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v26));
      if (!v77)
        return;
      objc_msgSend(v77, "dockStateValue");
      *(_OWORD *)v195 = *(_OWORD *)&v201[36];
      *(_OWORD *)&v195[16] = *(_OWORD *)&v201[52];
      v78 = *(_DWORD *)v201;
      LODWORD(v196) = *(_DWORD *)&v201[68];
      *(_OWORD *)buf = *(_OWORD *)&v201[4];
      *(_OWORD *)&buf[16] = *(_OWORD *)&v201[20];
      v79 = v201[72];
      v80 = v201[73];
      *(_OWORD *)&v190[30] = *(_OWORD *)&v201[120];
      *(_OWORD *)v190 = *(_OWORD *)&v201[90];
      *(_OWORD *)&v190[16] = *(_OWORD *)&v201[106];
      v189 = *(_OWORD *)&v201[74];
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v201 = 67109632;
        *(_DWORD *)&v201[4] = v26;
        *(_WORD *)&v201[8] = 1024;
        *(_DWORD *)&v201[10] = v78;
        *(_WORD *)&v201[14] = 1024;
        *(_DWORD *)&v201[16] = v79 & 1;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) Event: GoldbondDisabledMbHeadset, CurrentVoltageState = %d, gPlug = %d", v201, 0x14u);
      }
      if ((v80 & 1) != 0)
        return;
      *(_OWORD *)&v201[20] = *(_OWORD *)&buf[16];
      *(_OWORD *)&v201[36] = *(_OWORD *)v195;
      *(_OWORD *)&v201[52] = *(_OWORD *)&v195[16];
      *(_OWORD *)&v201[4] = *(_OWORD *)buf;
      *(_OWORD *)&v201[120] = *(_OWORD *)&v190[30];
      *(_OWORD *)&v201[106] = *(_OWORD *)&v190[16];
      *(_OWORD *)&v201[90] = *(_OWORD *)v190;
      gGiveUserRadarOption = 1;
      *(_DWORD *)v201 = v78;
      *(_DWORD *)&v201[68] = v196;
      v201[72] = v79;
      v201[73] = 1;
      *(_OWORD *)&v201[74] = v189;
      v48 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithDockState:", v201);
      v49 = (void *)gDockState;
      v50 = (void *)MEMORY[0x1E0CB37E8];
LABEL_126:
      objc_msgSend(v49, "setObject:forKey:", v48, objc_msgSend(v50, "numberWithInt:", v26));
      return;
    }
    if (v68 != 2)
      return;
    if (!gDockState)
      return;
    v69 = *v182;
    v70 = (void *)objc_msgSend((id)gDockState, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v182));
    if (!v70)
      return;
    *(_OWORD *)&v201[80] = unk_1D13E8038;
    memset(&v201[96], 170, 40);
    memset(v201, 170, 80);
    objc_msgSend(v70, "dockStateValue");
    *(_OWORD *)&v201[96] = v198;
    *(_OWORD *)&v201[112] = v199;
    *(_QWORD *)&v201[128] = v200;
    *(_OWORD *)&v201[32] = *(_OWORD *)v195;
    *(_OWORD *)&v201[48] = *(_OWORD *)&v195[16];
    *(_OWORD *)&v201[64] = v196;
    *(_OWORD *)&v201[80] = v197;
    *(_OWORD *)v201 = *(_OWORD *)buf;
    *(_OWORD *)&v201[16] = *(_OWORD *)&buf[16];
    connect = 0;
    *(_QWORD *)&v71 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v71 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v184[13] = v71;
    *(_OWORD *)&v183[16] = v71;
    *(_OWORD *)v184 = v71;
    *(_OWORD *)v183 = v71;
    if (HIDWORD(v199))
      *(_DWORD *)&v201[124] = HIDWORD(v199) - 1;
    v72 = (uint64_t)v182;
    v181 = (char *)v182 + 14;
    v73 = 0x1ED931000;
    v177 = IOServiceOpen(v179, *MEMORY[0x1E0C83DA0], 0, &connect);
    v178 = v69;
    if (v177)
    {
      v176 = 0;
      v129 = 0;
LABEL_220:
      if (*(_DWORD *)&v201[124] && !v176)
        IOAccessoryManagerRequestLdcmMeasurement();
      if (connect)
        IOServiceClose(connect);
      if (v201[112])
      {
        if (!v201[132] && *(_QWORD *)&v201[40])
        {
          v130 = (void *)objc_msgSend(*(id *)(v73 + 2784), "objectForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%012llx_%1d_%012llx"), *(_QWORD *)&v201[40], v201[48], *(_QWORD *)&v201[56]));
          if (v130 && (v131 = v130, v132 = *(_QWORD *)&v201[64], v132 <= objc_msgSend(v130, "overVoltageTimestamp")))
          {
            v133 = *(_QWORD *)&v201[64];
            v134 = dword_1EFC5BAC4;
            if (!dword_1EFC5BAC4)
            {
              mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
              v134 = dword_1EFC5BAC4;
            }
            v135 = sTimebaseInfo;
            v136 = objc_msgSend(v131, "overVoltageTimestamp");
            v137 = dword_1EFC5BAC4;
            if (!dword_1EFC5BAC4)
            {
              mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
              v137 = dword_1EFC5BAC4;
            }
            v138 = sTimebaseInfo;
            v139 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR(".%012llx.%1d"), *(_QWORD *)&v201[40], v201[48]);
            if (v139)
            {
              v140 = v139;
              IOAccessoryAggDCollectDataWithInterval(CFSTR("com.apple.ioaccessorymanager.ldcm.notification.overvoltage"), v139, (v136 * v138 / (unint64_t)v137 - v133 * v135 / (unint64_t)v134) / 0x3B9ACA00);
              v201[132] = 1;
              CFRelease(v140);
            }
          }
          else
          {
            v193 = 0;
            valuePtr = 0;
            if (objc_msgSend(*(id *)(v73 + 2784), "objectForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%012llx_%1d_%012llx"), *(_QWORD *)&v201[40], v201[48], *(_QWORD *)&v201[56])))
            {
              *(_QWORD *)&v148 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v148 + 1) = 0xAAAAAAAAAAAAAAAALL;
              *(_OWORD *)&v190[32] = v148;
              v191 = v148;
              *(_OWORD *)v190 = v148;
              *(_OWORD *)&v190[16] = v148;
              v189 = v148;
              v149 = (void *)objc_msgSend(*(id *)&v201[104], "reverseObjectEnumerator");
              memset(v188, 0, sizeof(v188));
              v150 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", v188, buf, 16);
              if (v150)
              {
                v151 = v150;
                v152 = **(_QWORD **)&v188[1];
LABEL_271:
                v153 = 0;
                while (2)
                {
                  if (**(_QWORD **)&v188[1] != v152)
                    objc_enumerationMutation(v149);
                  objc_msgSend(*(id *)(*((_QWORD *)&v188[0] + 1) + 8 * v153), "getBytes:length:", &v189, 80);
                  v154 = *(_QWORD *)&v201[56] == *(_QWORD *)&v190[37] && BYTE12(v189) == 2;
                  if (v154 && (!isChargingCableAttached(v181) || v190[36]))
                  {
                    for (j = 0; j != 4; ++j)
                    {
                      if (v190[j + 4])
                      {
                        v156 = *(_WORD *)&v190[2 * j + 16];
                        v157 = *((_WORD *)&valuePtr + j) - v156;
                        *((_WORD *)&valuePtr + j) = v156;
                        if ((v157 & 0x8000) == 0)
                        {
                          v158 = v157;
                          if (objc_msgSend((id)gUserLdcmParams, "maxUpFluctuationMv") <= (unint64_t)v157)
                          {
                            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)v186 = 67109120;
                              v187 = v158;
                              _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[fluctuation] diffAdcMv %d", v186, 8u);
                            }
                            v165 = *(_QWORD *)(v182 + 1);
                            v166 = *(_QWORD *)&v201[64];
                            if (*(_QWORD *)&v201[64] <= v165)
                            {
                              if (dword_1EFC5BAC4)
                              {
                                v167 = sTimebaseInfo;
                                v168 = dword_1EFC5BAC4;
                                v169 = *(_QWORD *)&v201[64]
                                     * (unint64_t)sTimebaseInfo
                                     / dword_1EFC5BAC4;
                              }
                              else
                              {
                                mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
                                v167 = sTimebaseInfo;
                                v168 = dword_1EFC5BAC4;
                                v169 = v166
                                     * (unint64_t)sTimebaseInfo
                                     / dword_1EFC5BAC4;
                                if (!dword_1EFC5BAC4)
                                {
                                  mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
                                  v167 = sTimebaseInfo;
                                  v168 = dword_1EFC5BAC4;
                                }
                              }
                              v170 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR(".%012llx.%1d"), *(_QWORD *)&v201[40], v201[48]);
                              if (v170)
                              {
                                v171 = v170;
                                IOAccessoryAggDCollectDataWithInterval(CFSTR("com.apple.ioaccessorymanager.ldcm.notification.voltagefluctuation"), v170, (v165 * v167 / v168 - v169) / 0x3B9ACA00);
                                v172 = v171;
                                goto LABEL_311;
                              }
                            }
                            goto LABEL_238;
                          }
                        }
                      }
                    }
                    if (++v153 != v151)
                      continue;
                    v151 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", v188, buf, 16);
                    if (v151)
                      goto LABEL_271;
                  }
                  break;
                }
              }
            }
            v159 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%012llx_%1d_%012llx"), *(_QWORD *)&v201[40], v201[48], *(_QWORD *)&v201[56]);
            if (objc_msgSend((id)gAccyHealthDictionary, "objectForKey:", v159))
            {
              v160 = *(_QWORD *)(v182 + 1);
              v161 = *(_QWORD *)&v201[64];
              if (*(_QWORD *)&v201[64] <= v160)
              {
                v162 = dword_1EFC5BAC4;
                if (dword_1EFC5BAC4)
                {
                  v163 = sTimebaseInfo;
                  v164 = *(_QWORD *)&v201[64]
                       * (unint64_t)sTimebaseInfo
                       / dword_1EFC5BAC4;
                }
                else
                {
                  mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
                  v163 = sTimebaseInfo;
                  v162 = dword_1EFC5BAC4;
                  v164 = v161 * (unint64_t)sTimebaseInfo / dword_1EFC5BAC4;
                  if (!dword_1EFC5BAC4)
                  {
                    mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
                    v163 = sTimebaseInfo;
                    v162 = dword_1EFC5BAC4;
                  }
                }
                v173 = (v163 * v160 / v162 - v164) / 0x3B9ACA00;
                if (v173 >= objc_msgSend((id)gUserLdcmParams, "maxVhiDurationSec"))
                {
                  v174 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR(".%012llx.%1d"), *(_QWORD *)&v201[40], v201[48]);
                  if (v174)
                  {
                    v175 = v174;
                    IOAccessoryAggDCollectDataWithInterval(CFSTR("com.apple.ioaccessorymanager.ldcm.notification.wettoolong"), v174, v173);
                    v172 = v175;
LABEL_311:
                    CFRelease(v172);
                    v201[132] = 1;
                  }
                }
              }
            }
          }
        }
      }
      else if (v129)
      {
        evaluateFalseDetectPreventionDry((uint64_t)v201, v72);
      }
LABEL_238:
      if (!v177)
      {
        v198 = *(_OWORD *)&v201[96];
        v199 = *(_OWORD *)&v201[112];
        v200 = *(_QWORD *)&v201[128];
        *(_OWORD *)v195 = *(_OWORD *)&v201[32];
        *(_OWORD *)&v195[16] = *(_OWORD *)&v201[48];
        v196 = *(_OWORD *)&v201[64];
        v197 = *(_OWORD *)&v201[80];
        *(_OWORD *)buf = *(_OWORD *)v201;
        *(_OWORD *)&buf[16] = *(_OWORD *)&v201[16];
        v141 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithDockState:", buf);
        objc_msgSend((id)gDockState, "setObject:forKey:", v141, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v178));
        IOAccessoryAggDCollectData(CFSTR("histogramVoltage"), (uint64_t)v182);
        IOAccessoryAggDCollectData(CFSTR("com.apple.ioaccessorymanager.voltage.cumulativetime"), (uint64_t)v182);
      }
      return;
    }
    BYTE2(v189) = -86;
    v74 = (*(unsigned int *)((char *)v182 + 14) | *((unsigned __int16 *)v182 + 9)) != 0;
    v75 = *((unsigned __int8 *)v182 + 44);
    if (*((_BYTE *)v182 + 44))
      v76 = 2 * (*((_BYTE *)v182 + 51) == 2);
    else
      v76 = 0;
    if (*(unsigned int *)((char *)v182 + 14) | *((unsigned __int16 *)v182 + 9))
    {
      v81 = (char *)&gLdcmParams + 12 * !isChargingCableAttached(v181);
      v82 = (unsigned __int16 *)(v81 + 24);
      v83 = (unsigned __int16 *)(v81 + 48);
    }
    else
    {
      v82 = (unsigned __int16 *)&unk_1ED931BA4;
      v81 = (char *)&unk_1ED931B98;
      v83 = (unsigned __int16 *)&unk_1ED931BB0;
    }
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = (unsigned __int16)word_1ED931BBC;
    v88 = v201[112];
    LOWORD(v189) = 257;
    v89 = 1;
    v90 = 16;
    v91 = 1;
    do
    {
      v92 = v90 - 16;
      if (*((_BYTE *)v182 + v90 + 4))
      {
        v93 = *((unsigned __int16 *)v182 + v90);
        v94 = (v76 + (_BYTE)v90 - 16) & 3;
        v95 = v93 < v82[v94];
        if (v93 >= *(unsigned __int16 *)&v81[2 * v94])
          v86 = 1;
        else
          v190[(v92 >> 1) - 16] = 0;
        ++v85;
        v91 &= v95;
        v89 &= v93 < v87;
        if (v93 >= v83[v94])
          ++v84;
      }
      else
      {
        v190[(v92 >> 1) - 16] = 0;
      }
      ++v90;
    }
    while (v90 != 20);
    if (!v85)
    {
      v176 = 0;
      v99 = v179;
      goto LABEL_187;
    }
    if (v74)
    {
      v96 = isChargingCableAttached(v181);
      v97 = 1;
      if (!v75 && v96)
        v97 = *((_BYTE *)v182 + 52) != 0;
    }
    else
    {
      v97 = 1;
    }
    v98 = (v85 == 1) & v86;
    v99 = v179;
    if (v88 || !v97)
    {
      if (v88 && ((v91 ^ 1) & 1) == 0)
      {
        v106 = *(_DWORD *)&v201[116] + 1;
        *(_QWORD *)&v201[116] = (*(_DWORD *)&v201[116] + 1);
        if (v106 >= unk_1ED931BC2)
        {
          v176 = 0;
          v201[112] = 0;
          goto LABEL_164;
        }
        if (!IOAccessoryManagerRequestLdcmMeasurement())
        {
          v107 = unk_1ED931BCA;
          v176 = unk_1ED931BCA;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            v108 = *v182;
            v109 = *(_QWORD *)((char *)v182 + 53);
            *(_DWORD *)buf = 67109888;
            *(_DWORD *)&buf[4] = v108;
            *(_WORD *)&buf[8] = 2048;
            *(_QWORD *)&buf[10] = v109;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = *(_DWORD *)&v201[116];
            *(_WORD *)&buf[24] = 1024;
            *(_DWORD *)&buf[26] = v107;
            v104 = MEMORY[0x1E0C81028];
            v105 = "(%d) ~~~ [%012llx] LDCM consecutiveVoltageNotDetected %d / rearm %d";
            goto LABEL_162;
          }
LABEL_164:
          if (v189 | BYTE1(v189))
            v110 = 1;
          else
            v110 = v98;
          if (*(_QWORD *)((char *)v182 + 53) == -1)
          {
            *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
            if (IOAccessoryManagerCopyDeviceInfo())
              goto LABEL_187;
            CFNumberGetValue(*(CFNumberRef *)buf, kCFNumberSInt64Type, (char *)v182 + 53);
            CFRelease(*(CFTypeRef *)buf);
          }
          if (gAccyHealthDictionary)
          {
            v111 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%012llx_%1d_%012llx"), ((unint64_t)*((unsigned __int8 *)v182 + 14) << 40) | ((unint64_t)*((unsigned __int8 *)v182 + 15) << 32) | ((unint64_t)*((unsigned __int8 *)v182 + 16) << 24) | ((unint64_t)*((unsigned __int8 *)v182 + 17) << 16) | ((unint64_t)*((unsigned __int8 *)v182 + 18) << 8) | *((unsigned __int8 *)v182 + 19), *((unsigned __int8 *)v182 + 51), *(_QWORD *)((char *)v182 + 53));
            v112 = objc_msgSend((id)gAccyHealthDictionary, "objectForKey:", v111);
            v113 = (IOAccessoryLdcmHealthClass *)v112;
            if (!v112)
            {
              v113 = objc_alloc_init(IOAccessoryLdcmHealthClass);
              v114 = v113;
              trimAccyHealthDictionary();
            }
            -[IOAccessoryLdcmHealthClass setLastSeenTimestamp:](v113, "setLastSeenTimestamp:", *(_QWORD *)(v182 + 1));
            -[IOAccessoryLdcmHealthClass setLeakagePassedCount:](v113, "setLeakagePassedCount:", -[IOAccessoryLdcmHealthClass leakagePassedCount](v113, "leakagePassedCount") + (v89 & 1));
            -[IOAccessoryLdcmHealthClass setDryCount:](v113, "setDryCount:", -[IOAccessoryLdcmHealthClass dryCount](v113, "dryCount") + (v91 & 1));
            -[IOAccessoryLdcmHealthClass setWetCount:](v113, "setWetCount:", -[IOAccessoryLdcmHealthClass wetCount](v113, "wetCount") + v110);
            -[IOAccessoryLdcmHealthClass setOverVoltageCount:](v113, "setOverVoltageCount:", -[IOAccessoryLdcmHealthClass overVoltageCount](v113, "overVoltageCount") + v84);
            v115 = -[IOAccessoryLdcmHealthClass isHealthy](v113, "isHealthy");
            if ((objc_msgSend((id)gUserLdcmParams, "fdpBehaviorMask") & 1) == 0)
              -[IOAccessoryLdcmHealthClass setIsHealthy:](v113, "setIsHealthy:", 1);
            if ((objc_msgSend((id)gUserLdcmParams, "fdpBehaviorMask") & 1) != 0
              && (objc_msgSend((id)gUserLdcmParams, "fdpBehaviorMask") & 2) != 0)
            {
              -[IOAccessoryLdcmHealthClass setIsHealthy:](v113, "setIsHealthy:", -[IOAccessoryLdcmHealthClass leakagePassedCount](v113, "leakagePassedCount") != 0);
            }
            if (v84)
            {
              -[IOAccessoryLdcmHealthClass setOverVoltageTimestamp:](v113, "setOverVoltageTimestamp:", -[IOAccessoryLdcmHealthClass lastSeenTimestamp](v113, "lastSeenTimestamp"));
              if ((objc_msgSend((id)gUserLdcmParams, "fdpBehaviorMask") & 1) != 0
                && (objc_msgSend((id)gUserLdcmParams, "fdpBehaviorMask") & 4) != 0)
              {
                -[IOAccessoryLdcmHealthClass setIsHealthy:](v113, "setIsHealthy:", 0);
                -[IOAccessoryLdcmHealthClass setLeakagePassedCount:](v113, "setLeakagePassedCount:", 0);
              }
            }
            objc_msgSend((id)gAccyHealthDictionary, "setObject:forKey:", v113, v111);
            v116 = -[IOAccessoryLdcmHealthClass isHealthy](v113, "isHealthy");
            if (!v112 || v115 != v116)
            {
              commitPersistentAccyHealthDictionary();
              if (!-[IOAccessoryLdcmHealthClass isHealthy](v113, "isHealthy"))
                IOAccessoryAggDCollectData(CFSTR("com.apple.ioaccessorymanager.ldcm.notification.badaccessorycount"), (uint64_t)v182);
              dbgShowAccyHealthDictionary();
            }
          }
LABEL_187:
          v117 = v201[112];
          appendEventToHistory(*(void **)&v201[104], (uint64_t)v182);
          if (v117 == v88)
          {
            v129 = 0;
            v72 = (uint64_t)v182;
            goto LABEL_219;
          }
          IOAccessoryManagerSetVoltageDetected();
          v118 = *((_OWORD *)v182 + 1);
          *(_OWORD *)v183 = *(_OWORD *)v182;
          *(_OWORD *)&v183[16] = v118;
          *(_OWORD *)v184 = *((_OWORD *)v182 + 2);
          *(_OWORD *)&v184[13] = *(_OWORD *)((char *)v182 + 45);
          v183[12] = v201[112] ^ 1;
          v183[13] = v201[112];
          appendEventToHistory(*(void **)&v201[104], (uint64_t)v183);
          v72 = (uint64_t)v182;
          if (!v201[112])
          {
            v127 = *(_DWORD *)v183;
            v128 = *(_DWORD *)v201;
            if (*(_DWORD *)v201 != 1)
            {
              *(_DWORD *)&v201[124] = 0;
              *(_DWORD *)v201 = 1;
              ++dword_1EFC5BA84;
              *(_QWORD *)&v201[12] = *(_QWORD *)&v183[4];
              *(_QWORD *)&v201[80] = CFAbsoluteTimeGetCurrent();
              IOAccessoryAggDCollectData(CFSTR("com.apple.ioaccessorymanager.voltage.averagetime"), (uint64_t)v183);
              if (gEnableTimeToDryPopup)
              {
                if (gIsInternalBuild)
                  CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, (CFStringRef)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Time To Dry\n %02llu:%02llu:%02llu"), (unint64_t)(*(double *)&v201[80] - *(double *)&v201[88]) / 0xE10, (unint64_t)(*(double *)&v201[80] - *(double *)&v201[88]) / 0x3C- 60* ((unint64_t)(((unint64_t)(*(double *)&v201[80] - *(double *)&v201[88])/ 0x3C* (unsigned __int128)0x888888888888889uLL) >> 64) >> 1), (unint64_t)(*(double *)&v201[80] - *(double *)&v201[88]) % 0x3C), 0, CFSTR("Ok"), 0,
                    0,
                    0);
              }
            }
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109888;
              *(_DWORD *)&buf[4] = v127;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v128;
              *(_WORD *)&buf[14] = 1024;
              *(_DWORD *)&buf[16] = *(_DWORD *)v201;
              *(_WORD *)&buf[20] = 1024;
              *(_DWORD *)&buf[22] = v201[72];
              _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) Event: Vlo, VoltageState: %d -> %d, gPlug: %d", buf, 0x1Au);
            }
            dbgShowAccyHealthDictionary();
            goto LABEL_218;
          }
          IOAccessoryManagerGetType();
          if (*v181 != 4 || *((unsigned __int8 *)v182 + 15) != 241 || *((_BYTE *)v182 + 16) || *((_BYTE *)v182 + 17))
          {
            v119 = v99;
          }
          else
          {
            if (!*((_BYTE *)v182 + 18))
            {
              v119 = v99;
              v120 = *((_BYTE *)v182 + 19) == 0;
LABEL_195:
              v121 = *(_DWORD *)v183;
              v122 = *(_DWORD *)v201;
              if (*(_DWORD *)v201)
              {
                v123 = v183[14];
                if (v184[18])
                  v124 = !v120;
                else
                  v124 = 1;
                *(_DWORD *)&v201[124] = 11;
                *(_DWORD *)v201 = 0;
                ++stats;
                v125 = *(_QWORD *)&v183[4];
                *(_QWORD *)&v201[4] = *(_QWORD *)&v183[4];
                *(_QWORD *)&v201[88] = CFAbsoluteTimeGetCurrent();
                IOAccessoryAggDCollectData(CFSTR("com.apple.ioaccessorymanager.voltage.count"), (uint64_t)v183);
                v126 = (v123 << 40) | ((unint64_t)v183[15] << 32) | ((unint64_t)v183[16] << 24) | ((unint64_t)v183[17] << 16) | ((unint64_t)v183[18] << 8) | v183[19];
                *(_QWORD *)&v201[24] = v126;
                *(_DWORD *)&v201[32] = *(_DWORD *)&v183[14];
                *(_WORD *)&v201[36] = *(_WORD *)&v183[18];
                if (v120)
                {
                  IOAccessoryAggDCollectData(CFSTR("com.apple.ioaccessorymanager.voltage.headset"), (uint64_t)v183);
                  v126 = *(_QWORD *)&v201[24];
                }
                v72 = (uint64_t)v182;
                if ((v120 & v124 & 1) == 0 && (v123 & 0x20) == 0 && v126)
                {
                  IOAccessoryAggDCollectData(CFSTR("com.apple.ioaccessorymanager.ldcm.notification.count"), (uint64_t)v183);
                  if (evaluateAccyHealthDictionary(*(unint64_t *)&v201[24], (uint64_t)v183))
                  {
                    *(_QWORD *)&v201[40] = *(_QWORD *)&v201[24];
                    v201[48] = v184[19];
                    *(_QWORD *)&v201[56] = *(_QWORD *)&v184[21];
                    *(_QWORD *)&v201[64] = v125;
                  }
                  else
                  {
                    setDriverMitigationEnabled(v121, v119, 0);
                  }
                  if (!v201[73])
                  {
                    v201[73] = 1;
                    gGiveUserRadarOption = 1;
                  }
                }
              }
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67111936;
                *(_DWORD *)&buf[4] = v121;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v122;
                *(_WORD *)&buf[14] = 1024;
                *(_DWORD *)&buf[16] = *(_DWORD *)v201;
                *(_WORD *)&buf[20] = 1024;
                *(_DWORD *)&buf[22] = v201[72];
                *(_WORD *)&buf[26] = 1024;
                *(_DWORD *)&buf[28] = stats;
                *(_WORD *)v195 = 1024;
                *(_DWORD *)&v195[2] = v183[14];
                *(_WORD *)&v195[6] = 1024;
                *(_DWORD *)&v195[8] = v183[15];
                *(_WORD *)&v195[12] = 1024;
                *(_DWORD *)&v195[14] = v183[16];
                *(_WORD *)&v195[18] = 1024;
                *(_DWORD *)&v195[20] = v183[17];
                *(_WORD *)&v195[24] = 1024;
                *(_DWORD *)&v195[26] = v183[18];
                *(_WORD *)&v195[30] = 1024;
                LODWORD(v196) = v183[19];
                WORD2(v196) = 1024;
                *(_DWORD *)((char *)&v196 + 6) = v184[18];
                _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) Event: Vhi, VoltageState: %d -> %d, gPlug: %d, VhiCount: %d, DigitalID: %02x %02x %02x %02x %02x %02x, CumulativeLifetimeExceeded: %d", buf, 0x4Au);
              }
LABEL_218:
              v129 = 1;
LABEL_219:
              v73 = 0x1ED931000uLL;
              goto LABEL_220;
            }
            v119 = v99;
          }
          v120 = 0;
          goto LABEL_195;
        }
LABEL_301:
        v176 = 0;
        goto LABEL_187;
      }
    }
    else
    {
      if (v189 | BYTE1(v189))
        v100 = 1;
      else
        v100 = v98;
      if (v100 == 1)
      {
        *(_DWORD *)&v201[116] = 0;
        if (++*(_DWORD *)&v201[120] >= unk_1ED931BBE)
        {
          v176 = 0;
          v201[112] = 1;
          goto LABEL_164;
        }
        if (!IOAccessoryManagerRequestLdcmMeasurement())
        {
          v101 = unk_1ED931BC6;
          v176 = unk_1ED931BC6;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            v102 = *v182;
            v103 = *(_QWORD *)((char *)v182 + 53);
            *(_DWORD *)buf = 67109888;
            *(_DWORD *)&buf[4] = v102;
            *(_WORD *)&buf[8] = 2048;
            *(_QWORD *)&buf[10] = v103;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = *(_DWORD *)&v201[120];
            *(_WORD *)&buf[24] = 1024;
            *(_DWORD *)&buf[26] = v101;
            v104 = MEMORY[0x1E0C81028];
            v105 = "(%d) ~~~ [%012llx] LDCM consecutiveVoltageDetected %d / rearm %d";
LABEL_162:
            _os_log_impl(&dword_1D13BF000, v104, OS_LOG_TYPE_DEFAULT, v105, buf, 0x1Eu);
            goto LABEL_164;
          }
          goto LABEL_164;
        }
        goto LABEL_301;
      }
    }
    v176 = 0;
    *(_QWORD *)&v201[116] = 0;
    goto LABEL_164;
  }
  if (a3 == -536870896)
  {
    if (gDockState)
    {
      PrimaryPort = IOAccessoryManagerGetPrimaryPort();
      if ((_DWORD)PrimaryPort)
      {
        v31 = PrimaryPort;
        v32 = (void *)objc_msgSend((id)gDockState, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PrimaryPort));
        if (v32)
        {
          objc_msgSend(v32, "dockStateValue");
          v33 = *(void **)&v201[104];
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v201 = 67109120;
            *(_DWORD *)&v201[4] = v31;
            _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) Event: Terminated", v201, 8u);
          }

          objc_msgSend((id)gDockState, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v31));
          objc_msgSend((id)gHalogenMeasurements, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v31));
        }
      }
    }
    return;
  }
  if (a3 == -536870608)
  {
    memset(v183, 170, 6);
    if (!gDockState)
      return;
    v34 = IOAccessoryManagerGetPrimaryPort();
    if (!(_DWORD)v34)
      return;
    v26 = v34;
    v35 = (void *)objc_msgSend((id)gDockState, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v34));
    if (!v35)
      return;
    LODWORD(valuePtr) = -1431655766;
    objc_msgSend(v35, "dockStateValue");
    *(_OWORD *)v195 = *(_OWORD *)&v201[32];
    *(_OWORD *)&v195[16] = *(_OWORD *)&v201[48];
    *(_QWORD *)&v196 = *(_QWORD *)&v201[64];
    *(_OWORD *)buf = *(_OWORD *)v201;
    *(_OWORD *)&buf[16] = *(_OWORD *)&v201[16];
    v36 = v201[72];
    v188[0] = *(_OWORD *)&v201[73];
    *(_QWORD *)((char *)v188 + 15) = *(_QWORD *)&v201[88];
    *(_QWORD *)&v190[14] = *(_QWORD *)&v201[128];
    v189 = *(_OWORD *)&v201[98];
    *(_OWORD *)v190 = *(_OWORD *)&v201[114];
    if ((v201[72] & 1) == 0)
      return;
    if (((v201[96] | v201[97]) & 1) != 0)
      return;
    if (IOAccessoryManagerGetDigitalID())
      return;
    v37 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryOrientation"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (!CFProperty)
      return;
    v39 = CFProperty;
    Value = CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
    CFRelease(v39);
    if (!Value)
      return;
    v41 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryPowerHandshake"), v37, 0);
    if (!v41)
      return;
    v42 = v41;
    v43 = CFBooleanGetValue(v41);
    CFRelease(v42);
    v44 = v43 == 1;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v201 = 67109632;
      *(_DWORD *)&v201[4] = v26;
      *(_WORD *)&v201[8] = 1024;
      *(_DWORD *)&v201[10] = v43 == 0;
      *(_WORD *)&v201[14] = 1024;
      *(_DWORD *)&v201[16] = v43 == 1;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) Event: PH update, failed = %d, success = %d", v201, 0x14u);
    }
    if (v43)
    {
      v47 = 0;
    }
    else
    {
      v45 = CFStringCreateWithFormat(v37, 0, CFSTR(".%02x%02x%02x%02x%02x%02x%d"), v183[0], v183[1], v183[2], v183[3], v183[4], v183[5], valuePtr);
      MutableCopy = CFStringCreateMutableCopy(v37, 0, CFSTR("com.apple.ioaccessorymanager.powerhandshakefail"));
      CFStringAppend(MutableCopy, v45);
      if (_ADClientAddValueForScalarKey)
        _ADClientAddValueForScalarKey(MutableCopy, 1);
      CFRelease(MutableCopy);
      CFRelease(v45);
      v47 = 1;
    }
    *(_OWORD *)&v201[32] = *(_OWORD *)v195;
    *(_OWORD *)&v201[48] = *(_OWORD *)&v195[16];
    *(_OWORD *)v201 = *(_OWORD *)buf;
    *(_OWORD *)&v201[16] = *(_OWORD *)&buf[16];
    *(_OWORD *)&v201[73] = v188[0];
    *(_QWORD *)&v201[128] = *(_QWORD *)&v190[14];
    *(_OWORD *)&v201[114] = *(_OWORD *)v190;
    *(_QWORD *)&v201[64] = v196;
    v201[72] = v36;
    *(_QWORD *)&v201[88] = *(_QWORD *)((char *)v188 + 15);
    v201[96] = v47;
    v201[97] = v44;
    *(_OWORD *)&v201[98] = v189;
    v48 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithDockState:", v201);
    v49 = (void *)gDockState;
    v50 = (void *)MEMORY[0x1E0CB37E8];
    goto LABEL_126;
  }
  if (a3 != -469794799)
    return;
LABEL_33:
  *(_OWORD *)&v201[80] = unk_1D13E8038;
  memset(&v201[96], 170, 40);
  memset(v201, 170, 80);
  v23 = objc_msgSend((id)gUserLdcmParams, "userBehaviorMask");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "IOAccessoryHandleDetach";
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s IOAccessoryHandleDetach entry\n", buf, 0xCu);
  }
  v24 = a2;
  v25 = IOAccessoryManagerGetPrimaryPort();
  if (!(_DWORD)v25)
    return;
  v26 = v25;
  if (!objc_msgSend((id)gHalogenMeasurements, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v25)))
  {
    if (!gDockState)
      return;
    v51 = (void *)objc_msgSend((id)gDockState, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v26));
    if (!v51)
      return;
    objc_msgSend(v51, "dockStateValue");
    v52 = v201[72];
    if (v201[72] && enableVoltageEventMonitorModeAppleCareLogging)
    {
      if ((IOAccessoryManagerGetType() & 0x600) != 0)
        IOAccessoryAppleCareLoggingForNonVoltageEvents((uint64_t)"accessoryUnplug", &v201[32], v26);
    }
    else if (!v201[72])
    {
LABEL_92:
      *(_WORD *)&v201[72] = 0;
      *(_WORD *)&v201[96] = 0;
      v198 = *(_OWORD *)&v201[96];
      v199 = *(_OWORD *)&v201[112];
      v200 = *(_QWORD *)&v201[128];
      *(_OWORD *)v195 = *(_OWORD *)&v201[32];
      *(_OWORD *)&v195[16] = *(_OWORD *)&v201[48];
      v196 = *(_OWORD *)&v201[64];
      v197 = *(_OWORD *)&v201[80];
      *(_OWORD *)buf = *(_OWORD *)v201;
      *(_OWORD *)&buf[16] = *(_OWORD *)&v201[16];
      v48 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithDockState:", buf);
      v49 = (void *)gDockState;
      v50 = (void *)MEMORY[0x1E0CB37E8];
      goto LABEL_126;
    }
    v55 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    v56 = *(_DWORD *)v201;
    if (v55)
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = v26;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = *(_DWORD *)v201;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v52;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) Event: Detach, CurrentVoltageState = %d, gPlug = %d", buf, 0x14u);
    }
    if (!v56)
      evaluateFalseDetectPreventionDry((uint64_t)v201, 0);
    setDriverMitigationEnabled(v26, v24, (v23 >> 3) & 1);
    goto LABEL_92;
  }
  v27 = (void *)objc_msgSend((id)gHalogenMeasurements, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v26));
  v28 = v27;
  if (v27)
  {
    if ((objc_msgSend(v27, "isReceptacleEmpty") & 1) != 0)
      goto LABEL_39;
    setDriverMitigationEnabled(v26, a2, (v23 >> 3) & 1);
    objc_msgSend(v28, "setIsReceptacleEmpty:", 1);
    objc_msgSend(v28, "setJustDetached:", 1);
    objc_msgSend(v28, "setJustAttachedCase:", 0);
    if ((objc_msgSend((id)gUserLdcmParams, "userBehaviorMask") & 0x10) == 0
      && !objc_msgSend(v28, "isWet"))
    {
      goto LABEL_39;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v26;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) Detach: Empty Receptacle State. Keep measuring.", buf, 8u);
    }
    if (!digitalIdNumPinsFree(objc_msgSend(v28, "connectedAccessoryDigitalID"), (uint64_t)buf)
      || (objc_msgSend(v28, "isDebugAccessoryConnected") & 1) != 0
      || objc_msgSend(v28, "isBlacklistedAccessoryConnected"))
    {
      v29 = 1;
      objc_msgSend(v28, "setIsMeasurementEnabled:", 1);

      objc_msgSend(v28, "setConnectedAccessoryPDigitalID:", (id)objc_msgSend(v28, "eventBasedPDigitalID"));
      objc_msgSend(v28, "setConnectedAccessoryDigitalID:", objc_msgSend(v28, "eventBasedDigitalID"));
      objc_msgSend(v28, "setConnectedAccessoryOrientation:", objc_msgSend(v28, "eventBasedOrientation"));
    }
    else
    {
LABEL_39:
      v29 = 0;
    }
    if (objc_msgSend(v28, "isTimestampValid")
      && objc_msgSend(v28, "isMeasurementEnabled")
      && objc_msgSend(v28, "didConfidentNotify"))
    {
      v53 = mach_continuous_time();
      if (objc_msgSend(v28, "accessoryConnectedWhileWet"))
        v54 = objc_msgSend(v28, "wetAccessoryAttachTimestamp");
      else
        v54 = objc_msgSend(v28, "wetDryTransitionTimestamp");
      v142 = v54;
      if (dword_1EFC5BAC4)
      {
        v143 = sTimebaseInfo;
        v144 = dword_1EFC5BAC4;
        v145 = v54 * (unint64_t)sTimebaseInfo / dword_1EFC5BAC4;
      }
      else
      {
        mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
        v143 = sTimebaseInfo;
        v144 = dword_1EFC5BAC4;
        v145 = v142 * (unint64_t)sTimebaseInfo / dword_1EFC5BAC4;
        if (!dword_1EFC5BAC4)
        {
          mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
          v143 = sTimebaseInfo;
          v144 = dword_1EFC5BAC4;
        }
      }
      v146 = (v53 * v143 / v144 - v145) / 0x3B9ACA00;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v26;
        *(_WORD *)&buf[8] = 2048;
        *(_QWORD *)&buf[10] = v146;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) wet duration interval = %lld seconds", buf, 0x12u);
      }
      if ((objc_msgSend(v28, "didHighConfidentNotify") & 1) == 0)
      {
        IOAccessoryAggDPostScalarKey((uint64_t)CFSTR("com.apple.ioaccessorymanager.ldcm.notification.highconfidentcount"), (uint64_t)v28);
        objc_msgSend(v28, "setDidHighConfidentNotify:", 1);
      }
      if ((objc_msgSend(v28, "didWetDuration") & 1) == 0)
      {
        IOAccessoryAggDPostHistogramKey(CFSTR("com.apple.ioaccessorymanager.ldcm.notification.wetduration"), v28, (double)v146);
        objc_msgSend(v28, "setDidWetDuration:", 1);
      }
    }
  }
  else
  {
    v29 = 0;
  }
  objc_msgSend(v28, "setWetAccessoryAttachTimestamp:", mach_continuous_time());
  objc_msgSend(v28, "setIsHeadsetConnected:", 0);
  objc_msgSend(v28, "setIsDebugAccessoryConnected:", 0);
  objc_msgSend(v28, "setIsBlacklistedAccessoryConnected:", 0);
  if (objc_msgSend((id)gUserLdcmParams, "enableHalogenMitigationsAndUI") == 1 && gLiquidNotificationContext)
  {
    CFUserNotificationCancel((CFUserNotificationRef)qword_1ED931BE8);
    gLiquidNotificationContext = 0;
    qword_1ED931C00 = 0;
    CFRunLoopRemoveSource((CFRunLoopRef)qword_1ED931BF8, (CFRunLoopSourceRef)qword_1ED931BF0, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease((CFTypeRef)qword_1ED931BF0);
    CFRelease((CFTypeRef)qword_1ED931BE8);
    if ((v29 & 1) == 0)
      return;
  }
  else if (!v29)
  {
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v26;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) Restarting Measurements", buf, 8u);
  }
  v147 = objc_msgSend(v28, "halogenMeasurementDispatchQueue");
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __IOAccessoryHandleDetach_block_invoke;
  *(_QWORD *)&buf[24] = &unk_1E9214120;
  *(_QWORD *)v195 = v28;
  dispatch_async(v147, buf);
}

void IOAccessoryHandleAttach(io_registry_entry_t a1)
{
  uint64_t PrimaryPort;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  const __CFNumber *CFProperty;
  const __CFNumber *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char v13;
  _BOOL4 v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  char v18;
  int v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  __int128 v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  int Type;
  NSObject *global_queue;
  uint64_t v30;
  BOOL v31;
  int v32;
  const __CFString *v33;
  unint64_t v34;
  NSObject *v35;
  dispatch_time_t v36;
  unsigned int v37;
  uint64_t v38;
  unsigned int v39;
  unint64_t v40;
  _QWORD v41[5];
  _QWORD block[4];
  int v43;
  io_connect_t connect;
  unint64_t valuePtr;
  CFNumberRef number;
  _DWORD v47[2];
  int v48;
  __int16 v49;
  uint8_t buf[4];
  _BYTE v51[32];
  _BYTE v52[28];
  uint64_t v53;
  char v54;
  char v55;
  __int128 v56;
  __int128 v57;
  _OWORD v58[2];
  __int128 v59;
  __int128 v60;
  _QWORD v61[12];

  v61[9] = *MEMORY[0x1E0C80C00];
  v49 = -21846;
  v48 = -1431655766;
  memset(&v61[4], 170, 36);
  v47[0] = -1431655766;
  *(_DWORD *)((char *)v47 + 3) = -1431655766;
  v59 = *(__int128 *)((char *)&xmmword_1D13E8028 + 10);
  v60 = unk_1D13E8042;
  memset(v61, 170, 30);
  valuePtr = 0xAAAAAAAAAAAAAAAALL;
  number = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
  connect = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v51 = "IOAccessoryHandleAttach";
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s IOAccessoryHandleAttach entry\n", buf, 0xCu);
  }
  PrimaryPort = IOAccessoryManagerGetPrimaryPort();
  if ((_DWORD)PrimaryPort)
  {
    v3 = PrimaryPort;
    v4 = (void *)objc_msgSend((id)gHalogenMeasurements, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PrimaryPort));
    if (!IOAccessoryManagerGetDigitalID())
    {
      v5 = ((unint64_t)v48 << 40) | ((unint64_t)BYTE1(v48) << 32) | ((unint64_t)BYTE2(v48) << 24) | ((unint64_t)HIBYTE(v48) << 16) | ((unint64_t)v49 << 8);
      v6 = v5 | HIBYTE(v49);
      if (v6)
      {
        v7 = digitalIdNumPinsFree(v5 | HIBYTE(v49), (uint64_t)buf);
        *(_DWORD *)buf = 0;
        CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryOrientation"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
        if (CFProperty)
        {
          v9 = CFProperty;
          CFNumberGetValue(CFProperty, kCFNumberIntType, buf);
          CFRelease(v9);
          v10 = *(unsigned int *)buf;
        }
        else
        {
          v10 = 0;
        }
        if (v4)
        {
          v11 = objc_msgSend(v4, "isWet");
          v39 = objc_msgSend(v4, "isTimestampValid");
          objc_msgSend(v4, "setIsReceptacleEmpty:", 0);
          objc_msgSend(v4, "setJustDetached:", 0);
          objc_msgSend(v4, "setWetAccessoryAttachTimestamp:", mach_continuous_time());
          v38 = objc_msgSend(v4, "halogenMeasurement");
          if (objc_msgSend(v4, "isMeasurementEnabled"))
          {
            v37 = v10;
            objc_msgSend((id)objc_msgSend(v4, "cond"), "lock");
            v12 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0);
            if (objc_msgSend(v4, "isMeasurementActive"))
            {
              do
                v13 = objc_msgSend((id)objc_msgSend(v4, "cond"), "waitUntilDate:", v12);
              while (objc_msgSend(v4, "isMeasurementActive") && (v13 & 1) != 0);
              if ((v13 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "halogenMeasurementCleanup() TIMEOUT... cleanup anyway", buf, 2u);
              }
            }
            halogenMeasurementCleanup(v4);
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)v51 = "halogenMeasurementCleanupSafe";
              _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s stop measurement timer.\n", buf, 0xCu);
            }
            dispatch_source_set_timer((dispatch_source_t)objc_msgSend(v4, "timer"), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
            objc_msgSend(v4, "setAttachDelayTimerRunning:", 0);
            objc_msgSend((id)objc_msgSend(v4, "cond"), "unlock");
            v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
            v10 = v37;
            if (v7)
            {
              if (v14)
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v51 = v3;
                v15 = MEMORY[0x1E0C81028];
                v16 = "(%d) IOAccessoryHandleAttach() Stop empty receptacle measurements for previous attachment";
LABEL_39:
                _os_log_impl(&dword_1D13BF000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 8u);
              }
            }
            else if (v14)
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v51 = v3;
              v15 = MEMORY[0x1E0C81028];
              v16 = "(%d) IOAccessoryHandleAttach() Pause empty receptacle measurements, attached accessory has no free pins";
              goto LABEL_39;
            }
          }
          if (IOServiceOpen(a1, *MEMORY[0x1E0C83DA0], 0, &connect))
            return;
          IOAccessoryManagerSetVoltageDetected();
          objc_msgSend(v4, "setIsHeadsetConnected:", 0);
          IOServiceClose(connect);
          connect = 0;
          Type = IOAccessoryManagerGetType();
          global_queue = dispatch_get_global_queue(0, 0);
          v30 = MEMORY[0x1E0C809B0];
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __IOAccessoryHandleAttach_block_invoke;
          block[3] = &__block_descriptor_36_e5_v8__0l;
          v43 = Type;
          dispatch_async(global_queue, block);
          objc_msgSend(v4, "setIsDebugAccessoryConnected:", (v48 >> 5) & 1);
          if ((objc_msgSend(v4, "isDebugAccessoryConnected") & 1) != 0)
            return;
          objc_msgSend(v4, "setIsBlacklistedAccessoryConnected:", v6 == 0x18F281000000);
          if ((objc_msgSend(v4, "isBlacklistedAccessoryConnected") & 1) != 0)
            return;
          if (v38)
            v31 = v7 == 0;
          else
            v31 = 1;
          v32 = !v31;
          if (v31)
            objc_msgSend(v4, "setWasTapToRadarShown:", 1);
          else
            objc_msgSend(v4, "setIsMeasurementEnabled:", 1);
          if (v11)
          {
            objc_msgSend(v4, "setIsWet:", 1);
            objc_msgSend(v4, "setAccessoryConnectedWhileWet:", 1);
            objc_msgSend(v4, "setIsMeasurementActive:", 0);
            objc_msgSend(v4, "setIsTimestampValid:", v39);
            objc_msgSend(v4, "setConnectedAccessoryPDigitalID:", (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v48, 6));
            objc_msgSend(v4, "setConnectedAccessoryDigitalID:", ((unint64_t)v48 << 40) | ((unint64_t)BYTE1(v48) << 32) | ((unint64_t)BYTE2(v48) << 24) | ((unint64_t)HIBYTE(v48) << 16) | ((unint64_t)v49 << 8) | HIBYTE(v49));
            objc_msgSend(v4, "setConnectedAccessoryOrientation:", v10);
            if (v7)
            {
              v33 = CFSTR("com.apple.ioaccessorymanager.ldcm.eis.accessory.connection");
              goto LABEL_61;
            }
            _generateUIAnalyticEvents(v4, v3);
            IOAccessoryAggDPostScalarPrefixKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.accessory.connection"), v4);
          }
          else
          {
            objc_msgSend(v4, "setIsMeasurementActive:", 0);
            objc_msgSend(v4, "setIsTimestampValid:", v39);
            objc_msgSend(v4, "setConnectedAccessoryPDigitalID:", (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v48, 6));
            objc_msgSend(v4, "setConnectedAccessoryDigitalID:", ((unint64_t)v48 << 40) | ((unint64_t)BYTE1(v48) << 32) | ((unint64_t)BYTE2(v48) << 24) | ((unint64_t)HIBYTE(v48) << 16) | ((unint64_t)v49 << 8) | HIBYTE(v49));
            objc_msgSend(v4, "setConnectedAccessoryOrientation:", v10);
            IOAccessoryAggDPostScalarPrefixKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.accessory.connection"), v4);
            if (v7)
            {
              if (!v32)
                return;
LABEL_62:
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v51 = v3;
                _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) Attach: Start Measurements", buf, 8u);
              }
              if (v6 == 0x4F100000000)
                goto LABEL_80;
              if (v6 == 0x18FE81000000)
                objc_msgSend(v4, "setJustAttachedCase:", 1);
              if ((objc_msgSend((id)gUserLdcmParams, "userBehaviorMask") & 0x20) != 0)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  v34 = objc_msgSend(v4, "ldcmStartMeasurementsDelayNs");
                  *(_DWORD *)buf = 136315650;
                  *(_QWORD *)v51 = "IOAccessoryHandleAttach";
                  *(_WORD *)&v51[8] = 2048;
                  *(_QWORD *)&v51[10] = v6;
                  *(_WORD *)&v51[18] = 2048;
                  *(_QWORD *)&v51[20] = v34 / 0xF4240;
                  _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: digitalID(0x%08llx), start measurement after %llums.\n", buf, 0x20u);
                }
                v35 = objc_msgSend(v4, "timer");
                v36 = dispatch_walltime(0, objc_msgSend(v4, "ldcmStartMeasurementsDelayNs"));
                dispatch_source_set_timer(v35, v36, 0xFFFFFFFFFFFFFFFFLL, 0);
                objc_msgSend(v4, "setAttachDelayTimerRunning:", 1);
              }
              else
              {
LABEL_80:
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)v51 = "IOAccessoryHandleAttach";
                  *(_WORD *)&v51[8] = 2048;
                  *(_QWORD *)&v51[10] = v6;
                  _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: digitalID(0x%08llx) indicates no charging or Not DisableStartDelay behavior, perform measurement now.\n", buf, 0x16u);
                }
                v41[0] = v30;
                v41[1] = 3221225472;
                v41[2] = __IOAccessoryHandleAttach_block_invoke_652;
                v41[3] = &unk_1E9214120;
                v41[4] = v4;
                dispatch_async((dispatch_queue_t)objc_msgSend(v4, "halogenMeasurementDispatchQueue"), v41);
              }
              return;
            }
          }
          v33 = CFSTR("com.apple.ioaccessorymanager.ldcm.eis.accessory.nofreepins");
LABEL_61:
          IOAccessoryAggDPostScalarPrefixKey(v33, v4);
          if ((v32 & 1) == 0)
            return;
          goto LABEL_62;
        }
        if (!gDockState)
          return;
        v17 = (void *)objc_msgSend((id)gDockState, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3));
        if (!v17)
          return;
        v18 = v10;
        objc_msgSend(v17, "dockStateValue");
        v19 = *(_DWORD *)buf;
        *(_OWORD *)&v61[4] = *(_OWORD *)v51;
        *(_OWORD *)&v61[6] = *(_OWORD *)&v51[16];
        LODWORD(v61[8]) = *(_DWORD *)v52;
        v40 = *(_QWORD *)&v52[4];
        v20 = v52[12];
        v47[0] = *(_DWORD *)&v52[13];
        *(_DWORD *)((char *)v47 + 3) = *(_DWORD *)&v52[16];
        v22 = *(_QWORD *)&v52[20];
        v21 = v53;
        v23 = v55;
        *(_OWORD *)((char *)&v61[1] + 6) = *(_OWORD *)((char *)v58 + 14);
        v60 = v57;
        *(_OWORD *)v61 = v58[0];
        v59 = v56;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v51 = v3;
          *(_WORD *)&v51[4] = 1024;
          *(_DWORD *)&v51[6] = v19;
          *(_WORD *)&v51[10] = 1024;
          *(_DWORD *)&v51[12] = 1;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%d) Event: Attach, CurrentVoltageState = %d, gPlug = %d", buf, 0x14u);
        }
        if (enableVoltageEventMonitorModeAppleCareLogging && (IOAccessoryManagerGetType() & 0x600) != 0)
          IOAccessoryAppleCareLoggingForNonVoltageEvents((uint64_t)"accessoryPlug", (unsigned __int8 *)&v48, v3);
        if (!IOServiceOpen(a1, *MEMORY[0x1E0C83DA0], 0, &connect))
        {
          IOAccessoryManagerSetVoltageDetected();
          IOServiceClose(connect);
          connect = 0;
          if ((v48 & 0x20) == 0 && !(v19 | v23 & 1))
          {
            if (!_retrieveDeviceInterfaceSerialNumber())
            {
              CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
              CFRelease(number);
              *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
              *(_OWORD *)v52 = v24;
              v52[16] = -86;
              *(_OWORD *)&v51[16] = v24;
              *(_OWORD *)v51 = v24;
              *(_DWORD *)buf = v3;
              v52[15] = v18;
              *(_QWORD *)&v52[17] = valuePtr;
              IOAccessoryAggDCollectData(CFSTR("com.apple.ioaccessorymanager.ldcm.notification.count"), (uint64_t)buf);
              if (evaluateAccyHealthDictionary(((unint64_t)v48 << 40) | ((unint64_t)BYTE1(v48) << 32) | ((unint64_t)BYTE2(v48) << 24) | ((unint64_t)HIBYTE(v48) << 16) | ((unint64_t)v49 << 8) | HIBYTE(v49), (uint64_t)buf))
              {
                v25 = ((unint64_t)v48 << 40) | ((unint64_t)BYTE1(v48) << 32) | ((unint64_t)BYTE2(v48) << 24) | ((unint64_t)HIBYTE(v48) << 16) | ((unint64_t)v49 << 8) | HIBYTE(v49);
                v22 = valuePtr;
                v21 = mach_continuous_time();
                v20 = v18;
                v26 = 0x1ED931000;
              }
              else
              {
                setDriverMitigationEnabled(v3, a1, 0);
                v26 = 0x1ED931000uLL;
                v25 = v40;
              }
              v19 = 0;
              v23 = 1;
              gGiveUserRadarOption = 1;
              goto LABEL_36;
            }
            v19 = 0;
          }
        }
        v26 = 0x1ED931000;
        v25 = v40;
LABEL_36:
        *(_OWORD *)v51 = *(_OWORD *)&v61[4];
        *(_OWORD *)&v51[16] = *(_OWORD *)&v61[6];
        v56 = v59;
        *(_DWORD *)buf = v19;
        *(_DWORD *)v52 = v61[8];
        *(_QWORD *)&v52[4] = v25;
        v52[12] = v20;
        *(_DWORD *)&v52[13] = v47[0];
        *(_DWORD *)&v52[16] = *(_DWORD *)((char *)v47 + 3);
        *(_QWORD *)&v52[20] = v22;
        v53 = v21;
        v54 = 1;
        v55 = v23;
        v57 = v60;
        v58[0] = *(_OWORD *)v61;
        *(_OWORD *)((char *)v58 + 14) = *(_OWORD *)((char *)&v61[1] + 6);
        v27 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithDockState:", buf);
        objc_msgSend(*(id *)(v26 + 2840), "setObject:forKey:", v27, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3));
      }
    }
  }
}

uint64_t processLdcmBehaviorPlist(void *a1, __int16 a2)
{
  __CFString **v4;
  __CFString *v5;
  uint64_t result;
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  NSObject *v19;
  const char *v20;
  uint32_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  int v29;
  const char *v30;
  __int16 v31;
  _BYTE v32[10];
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, (const char *)&unk_1D13EAD6A, (uint8_t *)&v29, 2u);
  }
  if ((a2 & 0xF0) != 0)
    return 0;
  v4 = kIOAMLDCMBehaviorPlistLegacySubKey;
  if ((a2 & 0x400) != 0)
    v4 = kIOAMLDCMBehaviorPlistDeviceGen1SubKey;
  v5 = *v4;
  result = objc_msgSend(a1, "objectForKey:", kIOAMLDCMBehaviorPlistVersionKey);
  if (!result)
    return result;
  v7 = objc_msgSend((id)result, "unsignedIntValue");
  v8 = v7 - 1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v29 = 136315650;
    v30 = "processLdcmBehaviorPlist";
    v31 = 1024;
    *(_DWORD *)v32 = v7;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v8 < 2;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: LDCM behavior plist version: %u, supported %d\n", (uint8_t *)&v29, 0x18u);
  }
  if (v8 > 1)
    return 0;
  if (v7 != 2)
  {
    if (v7 == 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, (const char *)&unk_1D13EAD6A, (uint8_t *)&v29, 2u);
      }
      result = objc_msgSend(a1, "objectForKey:", kIOAMLDCMBehaviorPlistBehaviorBitmaskKey);
      if (result)
      {
        result = objc_msgSend((id)result, "objectForKey:", v5);
        if (result)
        {
          v9 = objc_msgSend((id)result, "unsignedIntValue");
          objc_msgSend((id)gUserLdcmParams, "setUserBehaviorMask:", v9);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            v29 = 136315394;
            v30 = "processLdcmBehaviorPlistForVersion1";
            v31 = 1024;
            *(_DWORD *)v32 = v9;
            _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: userBehaviorMask : %#x\n", (uint8_t *)&v29, 0x12u);
          }
          result = objc_msgSend(a1, "objectForKey:", kIOAMLDCMBehaviorPlistFdpBitmaskKey);
          if (result)
          {
            result = objc_msgSend((id)result, "objectForKey:", v5);
            if (result)
            {
              v10 = objc_msgSend((id)result, "unsignedIntValue");
              objc_msgSend((id)gUserLdcmParams, "setFdpBehaviorMask:", v10);
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                v29 = 136315394;
                v30 = "processLdcmBehaviorPlistForVersion1";
                v31 = 1024;
                *(_DWORD *)v32 = v10;
                _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: fdpBehaviorMask : %#x\n", (uint8_t *)&v29, 0x12u);
              }
              result = objc_msgSend(a1, "objectForKey:", kIOAMLDCMBehaviorPlistConsecutiveDetectedThresh);
              if (result)
              {
                v11 = objc_msgSend((id)result, "unsignedIntValue");
                if (v11)
                {
                  v12 = v11;
                  unk_1ED931BBE = v11;
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  {
                    v29 = 136315394;
                    v30 = "processLdcmBehaviorPlistForVersion1";
                    v31 = 1024;
                    *(_DWORD *)v32 = v12;
                    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: consecutive detected thresh : %u\n", (uint8_t *)&v29, 0x12u);
                  }
                }
                result = objc_msgSend(a1, "objectForKey:", kIOAMLDCMBehaviorPlistConsecutiveNotDetectedThresh);
                if (result)
                {
                  v13 = objc_msgSend((id)result, "unsignedIntValue");
                  if (v13)
                  {
                    v14 = v13;
                    unk_1ED931BC2 = v13;
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                    {
                      v29 = 136315394;
                      v30 = "processLdcmBehaviorPlistForVersion1";
                      v31 = 1024;
                      *(_DWORD *)v32 = v14;
                      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: consecutive not detected thresh : %u\n", (uint8_t *)&v29, 0x12u);
                    }
                  }
                  result = objc_msgSend(a1, "objectForKey:", kIOAMLDCMBehaviorPlistConsecutiveDetectedInterval);
                  if (result)
                  {
                    v15 = objc_msgSend((id)result, "unsignedIntValue");
                    if (v15)
                    {
                      v16 = v15;
                      unk_1ED931BC6 = v15;
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                      {
                        v29 = 136315394;
                        v30 = "processLdcmBehaviorPlistForVersion1";
                        v31 = 1024;
                        *(_DWORD *)v32 = v16;
                        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: consecutive detected interval : %u\n", (uint8_t *)&v29, 0x12u);
                      }
                    }
                    result = objc_msgSend(a1, "objectForKey:", kIOAMLDCMBehaviorPlistConsecutiveNotDetectedInterval);
                    if (result)
                    {
                      v17 = objc_msgSend((id)result, "unsignedIntValue");
                      if (!v17)
                        return 1;
                      v18 = v17;
                      unk_1ED931BCA = v17;
                      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                        return 1;
                      v29 = 136315394;
                      v30 = "processLdcmBehaviorPlistForVersion1";
                      v31 = 1024;
                      *(_DWORD *)v32 = v18;
                      v19 = MEMORY[0x1E0C81028];
                      v20 = "%s: consecutive not detected interval : %u\n";
                      v21 = 18;
                      goto LABEL_50;
                    }
                  }
                }
              }
            }
          }
        }
      }
      return result;
    }
    return 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v29 = 136315138;
    v30 = "processLdcmBehaviorPlistForVersion2";
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s\n", (uint8_t *)&v29, 0xCu);
  }
  result = MGGetStringAnswer();
  if (result)
  {
    v22 = result;
    result = objc_msgSend(a1, "objectForKey:", kIOAMLDCMBehaviorWetThresholdDictionaryKey);
    if (result)
    {
      v23 = (void *)result;
      result = objc_msgSend((id)result, "objectForKey:", v22);
      if (result || (result = objc_msgSend(v23, "objectForKey:", kIOAMLDCMBehaviorThresholdDefaultKey)) != 0)
      {
        objc_msgSend((id)result, "doubleValue");
        v25 = v24;
        result = objc_msgSend(a1, "objectForKey:", kIOAMLDCMBehaviorDryThresholdDictionarykey);
        if (result)
        {
          v26 = (void *)result;
          result = objc_msgSend((id)result, "objectForKey:", v22);
          if (result || (result = objc_msgSend(v26, "objectForKey:", kIOAMLDCMBehaviorThresholdDefaultKey)) != 0)
          {
            objc_msgSend((id)result, "doubleValue");
            v28 = v27;
            objc_msgSend((id)gUserLdcmParams, "setWetTransitionCapacitanceThreshold:", v25);
            objc_msgSend((id)gUserLdcmParams, "setDryTransitionCapacitanceThreshold:", v28);
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              return 1;
            v29 = 136315650;
            v30 = "processLdcmBehaviorPlistForVersion2";
            v31 = 2048;
            *(double *)v32 = v25;
            *(_WORD *)&v32[8] = 2048;
            v33 = v28;
            v19 = MEMORY[0x1E0C81028];
            v20 = "%s: wet threshold: %f dry threshold: %f\n";
            v21 = 32;
LABEL_50:
            _os_log_impl(&dword_1D13BF000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v29, v21);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

uint64_t dbgShowAccyHealthDictionary()
{
  unint64_t v0;
  uint64_t result;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  id obj;
  int v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v0 = 0x1ED931000uLL;
  obj = (id)gAccyHealthDictionary;
  result = objc_msgSend((id)gAccyHealthDictionary, "countByEnumeratingWithState:objects:count:", &v21, v39, 16);
  if (result)
  {
    v3 = result;
    v19 = 0;
    v4 = *(_QWORD *)v22;
    v5 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v2 = 67110658;
    v17 = v2;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v22 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v6);
        v8 = (void *)objc_msgSend(*(id *)(v0 + 2784), "objectForKey:", v7, v17);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v20 = objc_msgSend(v7, "UTF8String");
          v9 = objc_msgSend(v8, "lastSeenTimestamp");
          v10 = objc_msgSend(v8, "isHealthy");
          v11 = objc_msgSend(v8, "leakagePassedCount");
          v12 = v5;
          v13 = v3;
          v14 = v4;
          v15 = objc_msgSend(v8, "dryCount");
          v16 = objc_msgSend(v8, "wetCount");
          *(_DWORD *)buf = v17;
          v26 = v19 + v6;
          v0 = 0x1ED931000;
          v27 = 2082;
          v28 = v20;
          v29 = 2048;
          v30 = v9;
          v31 = 1024;
          v32 = v10;
          v33 = 2048;
          v34 = v11;
          v35 = 2048;
          v36 = v15;
          v4 = v14;
          v3 = v13;
          v5 = v12;
          v37 = 2048;
          v38 = v16;
          _os_log_impl(&dword_1D13BF000, v12, OS_LOG_TYPE_DEFAULT, "[health %d] <%{public}s> : %llu, isHealthy %d, leakagePassedCount %llu, dryCount %llu, wetCount %llu", buf, 0x40u);
        }
        ++v6;
      }
      while (v3 != v6);
      result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v39, 16);
      v3 = result;
      v19 += v6;
    }
    while (result);
  }
  return result;
}

void IOAccessoryAggDCollectData(const void *a1, uint64_t a2)
{
  void *v4;
  void (*v5)(const __CFString *, uint64_t);
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  _OWORD v10[5];
  __int128 v11;
  _OWORD v12[3];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (enableVoltageEventMonitorModeAggD)
  {
    v11 = unk_1D13E8038;
    memset(v12, 170, 40);
    memset(v10, 170, sizeof(v10));
    if (_ADClientAddValueForScalarKey)
    {
      if (gDockState)
      {
        v4 = (void *)objc_msgSend((id)gDockState, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1, v10[0], v10[1], v10[2], v10[3], v10[4], v11, v12[0], v12[1], *(_QWORD *)&v12[2]));
        if (v4)
        {
          objc_msgSend(v4, "dockStateValue");
          if (CFEqual(a1, CFSTR("com.apple.ioaccessorymanager.voltage.count")) == 1)
          {
            v5 = (void (*)(const __CFString *, uint64_t))_ADClientAddValueForScalarKey;
            if (!_ADClientAddValueForScalarKey)
              return;
            v6 = CFSTR("com.apple.ioaccessorymanager.voltage.count");
            goto LABEL_14;
          }
          if (CFEqual(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.count")) == 1)
          {
            v5 = (void (*)(const __CFString *, uint64_t))_ADClientAddValueForScalarKey;
            v6 = CFSTR("com.apple.ioaccessorymanager.ldcm.notification.count");
LABEL_14:
            v7 = 1;
LABEL_15:
            v5(v6, v7);
            return;
          }
          if (CFEqual(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.suppress.phone")) == 1)
          {
            v5 = (void (*)(const __CFString *, uint64_t))_ADClientAddValueForScalarKey;
            v6 = CFSTR("com.apple.ioaccessorymanager.ldcm.notification.suppress.phone");
            goto LABEL_14;
          }
          if (CFEqual(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.suppress.accessory")) == 1)
          {
            v5 = (void (*)(const __CFString *, uint64_t))_ADClientAddValueForScalarKey;
            v6 = CFSTR("com.apple.ioaccessorymanager.ldcm.notification.suppress.accessory");
            goto LABEL_14;
          }
          if (CFEqual(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.confidentcount")) == 1)
          {
            _ADClientAddValueForScalarKey(CFSTR("com.apple.ioaccessorymanager.ldcm.notification.confidentcount"), 1);
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v14 = (const char *)a1;
              v8 = MEMORY[0x1E0C81028];
              v9 = "(!) Event: AggD key %{public}@ increment";
LABEL_23:
              _os_log_impl(&dword_1D13BF000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
            }
          }
          else if (CFEqual(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.highconfidentcount")) == 1)
          {
            _ADClientAddValueForScalarKey(CFSTR("com.apple.ioaccessorymanager.ldcm.notification.highconfidentcount"), 1);
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v14 = (const char *)a1;
              v8 = MEMORY[0x1E0C81028];
              v9 = "(!) Event: AggD key %{public}@ increment";
              goto LABEL_23;
            }
          }
          else
          {
            if (CFEqual(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.badaccessorycount")) == 1)
            {
              IOAccessoryAggDBadAccyEventData((unsigned __int8 *)a2);
              return;
            }
            if (CFEqual(a1, CFSTR("com.apple.ioaccessorymanager.voltage.cumulativetime")) == 1)
            {
              v7 = *(unsigned int *)(a2 + 46);
              qword_1EFC5BA90 = v7;
              v5 = (void (*)(const __CFString *, uint64_t))_ADClientSetValueForScalarKey;
              if (_ADClientSetValueForScalarKey)
              {
                v6 = CFSTR("com.apple.ioaccessorymanager.voltage.cumulativetime");
                goto LABEL_15;
              }
            }
            else
            {
              if (CFEqual(a1, CFSTR("com.apple.ioaccessorymanager.voltage.averagetime")) == 1)
              {
                IOAccessoryAggDAverageVhiTimeData((uint64_t)v10, a2);
                return;
              }
              if (CFEqual(a1, CFSTR("histogramVoltage")) == 1)
              {
                IOAccessoryAggDVoltageData((unsigned __int8 *)a2);
                return;
              }
              if (CFEqual(a1, CFSTR("com.apple.ioaccessorymanager.voltage.headset")) == 1)
              {
                _ADClientAddValueForScalarKey(CFSTR("com.apple.ioaccessorymanager.voltage.headset"), 1);
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v14 = (const char *)a1;
                  v8 = MEMORY[0x1E0C81028];
                  v9 = "(!) Event: AggD key %{public}@ increment";
                  goto LABEL_23;
                }
              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v14 = "IOAccessoryAggDCollectData";
                v8 = MEMORY[0x1E0C81028];
                v9 = "%s Invalid AggD key\n";
                goto LABEL_23;
              }
            }
          }
        }
      }
    }
  }
}

unint64_t appendEventToHistory(void *a1, uint64_t a2)
{
  __int128 v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  __int128 v9;
  __int128 v10;
  unint64_t result;
  uint64_t v12;
  _BYTE v13[32];
  _BYTE v14[48];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v14[16] = v4;
  *(_OWORD *)&v14[32] = v4;
  *(_OWORD *)&v13[16] = v4;
  *(_OWORD *)v14 = v4;
  if (objc_msgSend(a1, "count", v4)
    && (objc_msgSend((id)objc_msgSend(a1, "lastObject"), "getBytes:length:", v13, 80),
        *(unsigned __int8 *)(a2 + 12) == v13[12])
    && (*(_DWORD *)(a2 + 14) == *(_DWORD *)&v13[14]
      ? (v5 = *(unsigned __int16 *)(a2 + 18) == *(unsigned __int16 *)&v13[18])
      : (v5 = 0),
        v5
     && *(unsigned __int8 *)(a2 + 51) == v14[19]
     && (*(_DWORD *)(a2 + 26) == *(_DWORD *)&v13[26]
       ? (v6 = *(unsigned __int16 *)(a2 + 30) == *(unsigned __int16 *)&v13[30])
       : (v6 = 0),
         v6
      && (*(_DWORD *)(a2 + 20) == *(_DWORD *)&v13[20]
        ? (v7 = *(unsigned __int16 *)(a2 + 24) == *(unsigned __int16 *)&v13[24])
        : (v7 = 0),
          v7
       && (*(_QWORD *)(a2 + 32) == *(_QWORD *)v14
         ? (v8 = *(unsigned int *)(a2 + 40) == (unint64_t)*(unsigned int *)&v14[8])
         : (v8 = 0),
           v8)))))
  {
    ++*(_DWORD *)&v14[37];
    *(_QWORD *)&v14[29] = *(_QWORD *)(a2 + 4);
    v12 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v13, 80);
    objc_msgSend(a1, "removeLastObject");
    return objc_msgSend(a1, "addObject:", v12);
  }
  else
  {
    v9 = *(_OWORD *)(a2 + 16);
    v10 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)v13 = *(_OWORD *)a2;
    *(_OWORD *)&v13[16] = v9;
    *(_OWORD *)v14 = v10;
    *(_OWORD *)&v14[13] = *(_OWORD *)(a2 + 45);
    *(_DWORD *)&v14[37] = 1;
    *(_QWORD *)&v14[29] = *(_QWORD *)(a2 + 4);
    objc_msgSend(a1, "addObject:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v13, 80));
    result = objc_msgSend(a1, "count");
    if (result >= 3)
      return objc_msgSend(a1, "removeObjectAtIndex:", 0);
  }
  return result;
}

void evaluateFalseDetectPreventionDry(uint64_t a1, uint64_t a2)
{
  CFStringRef v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;

  if (!*(_BYTE *)(a1 + 132))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR(".%012llx.%1d"), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
      if (v4)
      {
        v5 = v4;
        v6 = mach_continuous_time();
        if (a2)
        {
          v7 = *(_QWORD *)(a2 + 4);
          v8 = *(_QWORD *)(a1 + 64);
          v9 = dword_1EFC5BAC4;
          if (dword_1EFC5BAC4)
          {
            v10 = sTimebaseInfo;
            v11 = v8 * (unint64_t)sTimebaseInfo / dword_1EFC5BAC4;
          }
          else
          {
            mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
            v10 = sTimebaseInfo;
            v9 = dword_1EFC5BAC4;
            v11 = v8 * (unint64_t)sTimebaseInfo / dword_1EFC5BAC4;
            if (!dword_1EFC5BAC4)
            {
              mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
              v10 = sTimebaseInfo;
              v9 = dword_1EFC5BAC4;
            }
          }
          v12 = (v7 * v10 / v9 - v11) / 0x3B9ACA00;
          if (v12 < objc_msgSend((id)gUserLdcmParams, "minVhiDurationSec"))
          {
            v13 = CFSTR("com.apple.ioaccessorymanager.ldcm.notification.drytooshort");
            v14 = v5;
            v15 = v12;
LABEL_11:
            IOAccessoryAggDCollectDataWithInterval(v13, v14, v15);
            CFRelease(v5);
            goto LABEL_12;
          }
        }
        else
        {
          v7 = v6;
        }
        IOAccessoryAggDCollectData(CFSTR("com.apple.ioaccessorymanager.ldcm.notification.highconfidentcount"), 0);
        v16 = *(_QWORD *)(a1 + 64);
        v17 = dword_1EFC5BAC4;
        if (dword_1EFC5BAC4)
        {
          v18 = sTimebaseInfo;
          v19 = v16 * (unint64_t)sTimebaseInfo / dword_1EFC5BAC4;
        }
        else
        {
          mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
          v18 = sTimebaseInfo;
          v17 = dword_1EFC5BAC4;
          v19 = v16 * (unint64_t)sTimebaseInfo / dword_1EFC5BAC4;
          if (!dword_1EFC5BAC4)
          {
            mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
            v18 = sTimebaseInfo;
            v17 = dword_1EFC5BAC4;
          }
        }
        v15 = (v7 * v18 / v17 - v19) / 0x3B9ACA00;
        v13 = CFSTR("com.apple.ioaccessorymanager.ldcm.notification.wetduration");
        v14 = v5;
        goto LABEL_11;
      }
    }
  }
LABEL_12:
  *(_BYTE *)(a1 + 132) = 0;
  *(_QWORD *)(a1 + 40) = 0;
}

BOOL isChargingCableAttached(_BYTE *a1)
{
  if (*a1 != 16)
    return 0;
  if ((a1[1] & 3) != 1)
    return (a1[1] & 3) == 0 && !a1[2] && !a1[3] && !a1[4] && !a1[5];
  if ((a1[2] & 8) == 0 || a1[3] || a1[4])
    return 0;
  return a1[5] == 0;
}

void trimAccyHealthDictionary()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  unint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)objc_msgSend((id)gAccyHealthDictionary, "count") >= 0x20)
  {
    v0 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%012llx_%1d_%012llx"), 0, 0, 0);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v1 = (void *)gAccyHealthDictionary;
    v2 = objc_msgSend((id)gAccyHealthDictionary, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    if (v2)
    {
      v3 = v2;
      v4 = 0;
      v5 = *(_QWORD *)v12;
      v6 = -1;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v1);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((objc_msgSend(v8, "isEqualToString:", v0) & 1) == 0)
          {
            v9 = (void *)objc_msgSend((id)gAccyHealthDictionary, "objectForKey:", v8);
            if (objc_msgSend(v9, "lastSeenTimestamp") < v6)
            {
              if (v4)

              v4 = v8;
              v6 = objc_msgSend(v9, "lastSeenTimestamp");
            }
          }
        }
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
      }
      while (v3);
      if (v4)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v10 = objc_msgSend(v4, "UTF8String");
          *(_DWORD *)buf = 136446466;
          v16 = v10;
          v17 = 2048;
          v18 = v6;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[trim] <%{public}s> : %llu", buf, 0x16u);
        }
        objc_msgSend((id)gAccyHealthDictionary, "removeObjectForKey:", v4);

      }
    }
  }
}

void commitPersistentAccyHealthDictionary()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v0 = objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  if (v0)
  {
    v1 = (void *)v0;
    v5 = 0;
    v2 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", gAccyHealthDictionary, 1, &v5);
    v3 = v5;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v4 = objc_msgSend((id)objc_msgSend(v3, "localizedDescription"), "UTF8String");
        *(_DWORD *)buf = 136315394;
        v7 = "commitPersistentAccyHealthDictionary";
        v8 = 2080;
        v9 = v4;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s err: %s", buf, 0x16u);
        v3 = v5;
      }

    }
    if (v2)
      objc_msgSend(v1, "setObject:forKey:", v2, CFSTR("accyHealthDict"));
  }
}

uint64_t evaluateAccyHealthDictionary(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  uint8_t buf[4];
  unint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (gAccyHealthDictionary
    && (v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%012llx_%1d_%012llx"), 0, 0, 0),
        (v5 = (void *)objc_msgSend((id)gAccyHealthDictionary, "objectForKey:", v4)) != 0)
    && objc_msgSend(v5, "isHealthy"))
  {
    if (!digitalIdNumPinsFree(a1, (uint64_t)buf))
    {
      v8 = 0;
      v9 = 0;
      goto LABEL_7;
    }
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%012llx_%1d_%012llx"), a1, *(unsigned __int8 *)(a2 + 51), *(_QWORD *)(a2 + 53));
    v7 = (void *)objc_msgSend((id)gAccyHealthDictionary, "objectForKey:", v6);
    if (v7)
    {
      v8 = 0;
      v9 = objc_msgSend(v7, "isHealthy") ^ 1;
      goto LABEL_7;
    }
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  v9 = 1;
LABEL_7:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(unsigned __int8 *)(a2 + 51);
    v11 = *(_QWORD *)(a2 + 53);
    *(_DWORD *)buf = 134219008;
    v16 = a1;
    v17 = 1024;
    v18 = v10;
    v19 = 2048;
    v20 = v11;
    v21 = 1024;
    v22 = v8;
    v23 = 1024;
    v24 = v9;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[eval] <%012llx_%1d_%012llx> : emptyFail %d, accyFail %d", buf, 0x28u);
  }
  v12 = CFSTR("com.apple.ioaccessorymanager.ldcm.notification.confidentcount");
  if (v9)
    v12 = CFSTR("com.apple.ioaccessorymanager.ldcm.notification.suppress.accessory");
  if (v8)
    v13 = CFSTR("com.apple.ioaccessorymanager.ldcm.notification.suppress.phone");
  else
    v13 = v12;
  IOAccessoryAggDCollectData(v13, a2);
  return (v8 | v9) ^ 1u;
}

uint64_t digitalIdNumPinsFree(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  _BOOL4 v7;
  _BYTE *v8;
  _BYTE *v9;
  unsigned int v10;
  BOOL v11;
  BOOL *v12;
  unsigned int v13;
  unsigned int v14;

  v2 = (a1 >> 40) & 4;
  v3 = (a1 >> 40) & 3;
  *(_WORD *)(a2 + 4) = 257;
  *(_DWORD *)a2 = 16843009;
  v4 = (a1 >> 40) & 0x18;
  if (((a1 >> 40) & 0x18) != 0)
  {
    *(_WORD *)a2 = 0;
    v5 = 2;
    if (!(_DWORD)v3)
      goto LABEL_7;
  }
  else
  {
    v5 = 0;
    if (!(_DWORD)v3)
      goto LABEL_7;
  }
  v6 = (_DWORD)v4 == 0;
  v7 = v4 != 0;
  v5 += 2;
  v8 = (_BYTE *)(a2 + 3);
  if (v6)
    v8 = (_BYTE *)(a2 + 1);
  *v8 = 0;
  *(_BYTE *)(a2 + 2 * v7) = 0;
LABEL_7:
  if ((_DWORD)v2)
  {
    v5 += 2;
    v9 = (_BYTE *)(a2 + 3);
    if ((a1 & 0x1B0000000000) == 0)
      v9 = (_BYTE *)(a2 + 1);
    *v9 = 0;
    *(_BYTE *)(a2 + 2 * ((a1 & 0x1B0000000000) != 0)) = 0;
  }
  if ((a1 & 0x8000000) != 0)
  {
    v10 = BYTE3(a1) & 1;
    v5 += v10 + 1;
    v11 = v10 == 0;
    v12 = (BOOL *)(a2 + 3);
    if ((a1 & 0x1F0000000000) == 0)
      v12 = (BOOL *)(a2 + 1);
    *v12 = v11;
    v13 = v2 >> 1;
    if ((a1 & 0x1B0000000000) != 0)
      v14 = 2;
    else
      v14 = v13;
    *(_BYTE *)(a2 + v14) = 0;
  }
  if (v5 <= 4)
    return 4 - v5;
  else
    return 0;
}

void IOAccessoryAggDCollectDataWithInterval(const __CFString *a1, const __CFString *a2, unint64_t a3)
{
  BOOL v3;
  __CFString *MutableCopy;
  __CFString *v8;
  int v9;
  __CFString *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (enableVoltageEventMonitorModeAggD)
    v3 = _ADClientPushValueForDistributionKey == 0;
  else
    v3 = 1;
  if (!v3
    && (CFEqual(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.overvoltage"))
     || CFEqual(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.drytooshort"))
     || CFEqual(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.voltagefluctuation"))
     || CFEqual(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.wettoolong"))
     || CFEqual(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.wetduration"))))
  {
    MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, a1);
    v8 = MutableCopy;
    if (a2)
      CFStringAppend(MutableCopy, a2);
    if (v8)
    {
      _ADClientPushValueForDistributionKey(v8, (double)a3);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543618;
        v10 = v8;
        v11 = 2048;
        v12 = a3;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(!) Event: AggD key %{public}@ with value %llu", (uint8_t *)&v9, 0x16u);
      }
      CFRelease(v8);
    }
  }
}

void IOAccessoryAggDBadAccyEventData(unsigned __int8 *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  const __CFAllocator *v4;
  CFStringRef v5;
  const __CFString *v6;
  __CFString *MutableCopy;
  __CFString *v8;

  if (_ADClientAddValueForScalarKey)
  {
    v1 = 0;
    v2 = ((unint64_t)a1[14] << 40) | ((unint64_t)a1[15] << 32) | ((unint64_t)a1[16] << 24) | ((unint64_t)a1[17] << 16) | ((unint64_t)a1[18] << 8) | a1[19];
    while (kAggDKnownDigitalID[v1] != v2)
    {
      if (++v1 == 6)
      {
        v2 = 0xFFFFFFFFFFFFLL;
        break;
      }
    }
    if (a1[51] <= 1u)
      v3 = 1;
    else
      v3 = a1[51];
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR(".%012llx.%1d"), v2, v3);
    if (v5)
    {
      v6 = v5;
      MutableCopy = CFStringCreateMutableCopy(v4, 0, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.badaccessorycount"));
      if (MutableCopy)
      {
        v8 = MutableCopy;
        CFStringAppend(MutableCopy, v6);
        _ADClientAddValueForScalarKey(v8, 1);
        CFRelease(v8);
      }
      CFRelease(v6);
    }
  }
}

uint64_t IOAccessoryAggDAverageVhiTimeData(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if (result)
  {
    if (dword_1EFC5BA84 == stats)
    {
      v2 = *(_QWORD *)(a2 + 4);
      v3 = *(_QWORD *)(result + 4);
      if (v3 < v2)
      {
        v4 = dword_1EFC5BAC4;
        if (dword_1EFC5BAC4)
        {
          v5 = sTimebaseInfo;
          v6 = v2 * sTimebaseInfo / dword_1EFC5BAC4;
        }
        else
        {
          result = mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
          v5 = sTimebaseInfo;
          v4 = dword_1EFC5BAC4;
          v6 = v2 * sTimebaseInfo / dword_1EFC5BAC4;
          if (!dword_1EFC5BAC4)
          {
            result = mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
            v5 = sTimebaseInfo;
            v4 = dword_1EFC5BAC4;
          }
        }
        v7 = v6 - v5 * v3 / v4;
        if (v7 >= 0x3B9ACA00)
        {
          qword_1EFC5BA88 = (v7 / 0x3B9ACA00 + qword_1EFC5BA88 * (stats - 1)) / stats;
          if (_ADClientSetValueForScalarKey)
            return _ADClientSetValueForScalarKey(CFSTR("com.apple.ioaccessorymanager.voltage.averagetime"));
        }
      }
    }
  }
  return result;
}

void IOAccessoryAggDVoltageData(unsigned __int8 *a1)
{
  const __CFAllocator *v2;
  const __CFString *v3;
  unint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  double v7;
  __CFString *MutableCopy;

  if (_ADClientPushValueForDistributionKey)
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR(".%02x%02x%02x%02x%02x%02x"), a1[14], a1[15], a1[16], a1[17], a1[18], a1[19]);
    v5 = 0;
    v6 = a1 + 20;
    do
    {
      if (v6[v5])
      {
        LOWORD(v4) = *(_WORD *)&v6[2 * v5 + 12];
        v7 = (double)v4 / 1000.0;
        MutableCopy = CFStringCreateMutableCopy(v2, 0, off_1E92143B8[v5]);
        CFStringAppend(MutableCopy, v3);
        _ADClientPushValueForDistributionKey(MutableCopy, v7);
        CFRelease(MutableCopy);
      }
      ++v5;
    }
    while (v5 != 4);
    if (v3)
      CFRelease(v3);
  }
}

void *IOAccessoryAppleCareLoggingForNonVoltageEvents(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  void *result;
  void *v7;

  result = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (enableVoltageEventMonitorModeAppleCareLogging)
  {
    v7 = result;
    objc_msgSend(result, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 100));
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), a1));
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02x %02x %02x %02x %02x %02x"), *a2, a2[1], a2[2], a2[3], a2[4], a2[5]));
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), a3));
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0));
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0));
    result = (void *)objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0));
    if (_logEventForAppleCare)
      return (void *)_logEventForAppleCare(v7);
  }
  return result;
}

uint64_t IOAccessoryAggDPostScalarKey(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2)
    {
      v2 = (uint64_t (*)(uint64_t, uint64_t))_ADClientAddValueForScalarKey;
      if (_ADClientAddValueForScalarKey)
      {
        v3 = result;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v4 = 138543362;
          v5 = v3;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Incrementing aggd key: %{public}@", (uint8_t *)&v4, 0xCu);
          v2 = (uint64_t (*)(uint64_t, uint64_t))_ADClientAddValueForScalarKey;
        }
        return v2(v3, 1);
      }
    }
  }
  return result;
}

void IOAccessoryAggDPostHistogramKey(const __CFString *a1, void *a2, double a3)
{
  _BOOL4 ShouldKeyUseEventBasedData;
  const __CFAllocator *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  CFStringRef v13;
  const __CFString *v14;
  __CFString *MutableCopy;
  __CFString *v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1 && a2 && _ADClientPushValueForDistributionKey)
  {
    if (CFStringCompare(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.wetduration"), 1uLL)
      && CFStringCompare(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.wettoolong"), 1uLL)
      && CFStringCompare(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.drytooshort"), 1uLL))
    {
      ShouldKeyUseEventBasedData = IOAccessoryShouldKeyUseEventBasedData(a1);
      v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      if (ShouldKeyUseEventBasedData)
      {
        v8 = objc_msgSend(a2, "eventBasedDigitalID");
        v9 = objc_msgSend(a2, "eventBasedOrientation");
      }
      else
      {
        v8 = objc_msgSend(a2, "connectedAccessoryDigitalID");
        v9 = objc_msgSend(a2, "connectedAccessoryOrientation");
      }
      v13 = CFStringCreateWithFormat(v7, 0, CFSTR("_%012llx_%1d"), v8, v9);
    }
    else
    {
      v10 = IOAccessoryShouldKeyUseEventBasedData(a1);
      v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      if (v10)
      {
        v11 = objc_msgSend(a2, "eventBasedDigitalID");
        v12 = objc_msgSend(a2, "eventBasedOrientation");
      }
      else
      {
        v11 = objc_msgSend(a2, "connectedAccessoryDigitalID");
        v12 = objc_msgSend(a2, "connectedAccessoryOrientation");
      }
      v13 = CFStringCreateWithFormat(v7, 0, CFSTR(".%012llx.%1d"), v11, v12);
    }
    v14 = v13;
    if (v13)
    {
      MutableCopy = CFStringCreateMutableCopy(v7, 0, a1);
      if (MutableCopy)
      {
        v16 = MutableCopy;
        CFStringAppend(MutableCopy, v14);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v18 = v16;
          v19 = 2048;
          v20 = a3;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Logging aggd key: %{public}@ value: %f", buf, 0x16u);
        }
        _ADClientPushValueForDistributionKey(v16, a3);
        CFRelease(v16);
        CFRelease(v14);
      }
    }
  }
}

BOOL IOAccessoryShouldKeyUseEventBasedData(const __CFString *a1)
{
  return CFStringCompare(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.eis.drytime.histogram"), 1uLL) == kCFCompareEqualTo
      || CFStringCompare(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.eis.drytimeV2.histogram"), 1uLL) == kCFCompareEqualTo;
}

uint64_t _retrieveDeviceInterfaceSerialNumber()
{
  int v0;
  uint64_t v1;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = 4;
  while (1)
  {
    v1 = IOAccessoryManagerCopyDeviceInfo();
    if (!(_DWORD)v1)
      break;
    usleep(0x186A0u);
    if (!--v0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v3 = 136315394;
        v4 = "_retrieveDeviceInterfaceSerialNumber";
        v5 = 1024;
        v6 = v1;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s IOAccessoryManagerCopyDeviceInfo returned %x\n", (uint8_t *)&v3, 0x12u);
      }
      return v1;
    }
  }
  return v1;
}

void _generateUIAnalyticEvents(void *a1, int a2)
{
  int v4;
  uint64_t v5;
  void *v6;
  int DeviceInterfaceSerialNumber;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  double Current;
  char v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFAllocator *v40;
  __CFRunLoopSource *RunLoopSource;
  CFNumberRef v42;
  uint64_t v43;
  CFNumberRef number;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  _QWORD v48[2];
  _QWORD valuePtr[2];

  valuePtr[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "didNotify") & 1) != 0)
    return;
  IOAccessoryAggDPostScalarKey((uint64_t)CFSTR("com.apple.ioaccessorymanager.ldcm.notification.count"), (uint64_t)a1);
  objc_msgSend(a1, "setDidNotify:", 1);
  if ((objc_msgSend(a1, "didConfidentNotify") & 1) != 0)
  {
LABEL_17:
    setDriverMitigationEnabled(a2, objc_msgSend(a1, "service"), 0);
    return;
  }
  v4 = -1431655766;
  number = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
  valuePtr[0] = 0;
  if (!gAccyHealthDictionary)
  {
    v5 = 0;
LABEL_86:
    v12 = 1;
LABEL_90:
    v13 = 1;
    goto LABEL_10;
  }
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%012llx_%1d_%012llx"), 0, 0, 0);
  v6 = (void *)objc_msgSend((id)gAccyHealthDictionary, "objectForKey:", v5);
  if (!v6 || !objc_msgSend(v6, "isHealthy"))
    goto LABEL_86;
  if (!digitalIdNumPinsFree(objc_msgSend(a1, "connectedAccessoryDigitalID"), (uint64_t)buf))
  {
    v12 = 0;
    v13 = 0;
    goto LABEL_10;
  }
  objc_msgSend(a1, "service");
  DeviceInterfaceSerialNumber = _retrieveDeviceInterfaceSerialNumber();
  if (DeviceInterfaceSerialNumber)
  {
    v4 = DeviceInterfaceSerialNumber;
    v12 = 0;
    goto LABEL_90;
  }
  CFNumberGetValue(number, kCFNumberSInt64Type, valuePtr);
  CFRelease(number);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = objc_msgSend(a1, "connectedAccessoryDigitalID");
  v10 = objc_msgSend(a1, "connectedAccessoryOrientation");
  v5 = objc_msgSend(v8, "stringWithFormat:", CFSTR("%012llx_%1d_%012llx"), v9, v10, valuePtr[0]);
  v11 = (void *)objc_msgSend((id)gAccyHealthDictionary, "objectForKey:", v5);
  if (!v11)
  {
    v12 = 0;
    v4 = 0;
    goto LABEL_90;
  }
  v12 = 0;
  v4 = 0;
  v13 = objc_msgSend(v11, "isHealthy") ^ 1;
LABEL_10:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v46 = (const char *)v5;
    v47 = 1024;
    LODWORD(v48[0]) = v12;
    WORD2(v48[0]) = 1024;
    *(_DWORD *)((char *)v48 + 6) = v13;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[eval] <%{public}@> : emptyFail %d, accyFail %d", buf, 0x18u);
  }
  if (v12)
  {
    IOAccessoryAggDPostScalarKey((uint64_t)CFSTR("com.apple.ioaccessorymanager.ldcm.notification.suppress.phone"), (uint64_t)a1);
    goto LABEL_17;
  }
  if (v13)
  {
    IOAccessoryAggDPostScalarKey((uint64_t)CFSTR("com.apple.ioaccessorymanager.ldcm.notification.suppress.accessory"), (uint64_t)a1);
    IOAccessoryAggDPostScalarPrefixKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.suppress.accessory"), a1);
    if (v4)
      IOAccessoryAggDPostScalarPrefixKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.error.suppress.accessory"), a1);
    goto LABEL_17;
  }
  IOAccessoryAggDPostScalarKey((uint64_t)CFSTR("com.apple.ioaccessorymanager.ldcm.notification.confidentcount"), (uint64_t)a1);
  objc_msgSend(a1, "setDidConfidentNotify:", 1);
  if (objc_msgSend((id)gUserLdcmParams, "enableHalogenMitigationsAndUI") == 1)
  {
    number = 0;
    if ((objc_msgSend((id)gUserLdcmParams, "userBehaviorMask") & 2) != 0 && !gLiquidNotificationContext)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - *(double *)&qword_1ED931BD8 >= 480.0)
      {
        v15 = 0;
        qword_1ED931BD8 = *(_QWORD *)&Current;
      }
      else
      {
        v15 = 1;
      }
      byte_1ED931BE0 = v15;
      v16 = objc_msgSend((id)gUserLdcmParams, "userBehaviorMask");
      if ((v16 & 4) == 0)
      {
        byte_1ED931BE0 = 0;
        qword_1ED931BD8 = *(_QWORD *)&Current;
      }
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
      if (v17)
      {
        v18 = v17;
        v19 = MEMORY[0x1E0C9AAA0];
        v20 = MEMORY[0x1E0C9AAB0];
        if ((v16 & 4) != 0)
          v21 = MEMORY[0x1E0C9AAA0];
        else
          v21 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("legacy"));
        if (byte_1ED931B04)
          v22 = v20;
        else
          v22 = v19;
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("chargerConnected"));
        if (byte_1ED931BE0)
          v23 = v20;
        else
          v23 = v19;
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("reinsertion"));
        v24 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
        if (v24)
        {
          v25 = v24;
          objc_msgSend(v24, "setUserInfo:", v18);
          valuePtr[0] = v25;
          v26 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", valuePtr, 1), 1, &number);
          v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          if (v27)
          {
            v28 = v27;
            objc_msgSend(v27, "setObject:forKeyedSubscript:", CFSTR("com.apple.IOAccessoryManagerFramework.WetNotification"), *MEMORY[0x1E0DABBB8]);
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0DABBC0]);
            v29 = MEMORY[0x1E0C9AAB0];
            objc_msgSend(v28, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C9B820]);
            objc_msgSend(v28, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0DABB98]);
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0DABBB0]);
            v30 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.IOAccessoryManagerFramework"));
            v31 = v30;
            if (v30)
            {
              v32 = objc_msgSend(v30, "pathForResource:ofType:", CFSTR("PlugIns/WetNotification.appex/Assets.car"), &stru_1E92146F8);
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v46 = "IOAccessoryNotifyWet";
                v47 = 2112;
                v48[0] = v32;
                _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Setting asset path for LDCM wet icon:%@", buf, 0x16u);
              }
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0DABC00]);
              objc_msgSend(v28, "setObject:forKeyedSubscript:", CFSTR("lockScreenLiquidDetection"), *MEMORY[0x1E0DABBF8]);
              objc_msgSend(v28, "setObject:forKeyedSubscript:", CFSTR("YES"), *MEMORY[0x1E0DABBF0]);
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0DABBD8]);
              objc_msgSend(v28, "setObject:forKeyedSubscript:", CFSTR("lockScreenLiquidDetection"), *MEMORY[0x1E0DABBD0]);
              v33 = objc_msgSend(v31, "resourceURL");
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0C9B860]);
            }
            if ((v16 & 4) != 0)
            {
              if (v31)
                v35 = CFSTR("WETMSG_DIALOG_HEADER_LOCKSCREEN");
              else
                v35 = CFSTR("LIQUID DETECTED");
              if (v31)
                v36 = CFSTR("WETMSG_DIALOG_BODY_LOCKSCREEN");
              else
                v36 = CFSTR("Charging is not available because liquid has been detected in the Lightning connector. Disconnect to allow the connector to dry.");
              if (v31)
                v37 = CFSTR("WETMSG_BUTTON_DISMISS");
              else
                v37 = CFSTR("Dismiss");
              v38 = CFSTR("WETMSG_BUTTON_EMERGENCY_OVERRIDE");
              if (!v31)
                v38 = CFSTR("Emergency Override");
              if (byte_1ED931BE0)
                v34 = v38;
              else
                v34 = 0;
            }
            else
            {
              v34 = 0;
              if (v31)
                v35 = CFSTR("WETMSG_DIALOG_HEADER_LOCKSCREEN_LEGACY");
              else
                v35 = CFSTR("LIQUID DETECTED");
              if (v31)
                v36 = CFSTR("WETMSG_DIALOG_BODY_LOCKSCREEN_LEGACY");
              else
                v36 = CFSTR("Liquid has been detected in the Lightning connector. Disconnect to allow the connector to dry. Charging now may damage your iPhone.");
              if (v31)
                v37 = CFSTR("WETMSG_BUTTON_CLOSE");
              else
                v37 = CFSTR("Close");
            }
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0DABC18]);
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0DABC28]);
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0C9B838]);
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0C9B868]);
            if (gEnableTapToRadarPopup && gGiveUserRadarOption && gIsInternalBuild)
            {
              if (v31)
                v39 = CFSTR("WETMSG_BUTTON_RADAR");
              else
                v39 = CFSTR("Radar");
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0C9B830]);
            }
            gLiquidNotificationContext = 1;
            if (a1)
              qword_1ED931C00 = (uint64_t)a1;
            v40 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            qword_1ED931BE8 = (uint64_t)CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, 0, (CFDictionaryRef)v28);
            RunLoopSource = CFUserNotificationCreateRunLoopSource(v40, (CFUserNotificationRef)qword_1ED931BE8, (CFUserNotificationCallBack)IOAccessoryNotifyWetCallback_0, 0);
            qword_1ED931BF0 = (uint64_t)RunLoopSource;
            if (RunLoopSource)
              CFRunLoopAddSource((CFRunLoopRef)qword_1ED931BF8, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);

            v25 = v18;
            v18 = v28;
          }

        }
      }
      v42 = number;
      if (number)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v43 = objc_msgSend((id)-[__CFNumber localizedDescription](v42, "localizedDescription"), "UTF8String");
          *(_DWORD *)buf = 136315394;
          v46 = "IOAccessoryNotifyWet";
          v47 = 2080;
          v48[0] = v43;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s err: %s", buf, 0x16u);
          v42 = number;
        }

      }
    }
  }
}

void IOAccessoryAggDPostScalarPrefixKey(const __CFString *a1, void *a2)
{
  CFComparisonResult v4;
  const __CFAllocator *v5;
  uint64_t v6;
  uint64_t v7;
  CFStringRef v8;
  const __CFString *v9;
  __CFString *MutableCopy;
  __CFString *v11;
  uint8_t buf[4];
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1 && a2 && _ADClientAddValueForScalarKey)
  {
    v4 = CFStringCompare(a1, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.badaccessorycount"), 1uLL);
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v6 = objc_msgSend(a2, "connectedAccessoryDigitalID");
    v7 = objc_msgSend(a2, "connectedAccessoryOrientation");
    v8 = v4
       ? CFStringCreateWithFormat(v5, 0, CFSTR("_%012llx_%1d"), v6, v7)
       : CFStringCreateWithFormat(v5, 0, CFSTR(".%012llx.%1d"), v6, v7);
    if (v8)
    {
      v9 = v8;
      MutableCopy = CFStringCreateMutableCopy(v5, 0, a1);
      if (MutableCopy)
      {
        v11 = MutableCopy;
        CFStringAppend(MutableCopy, v9);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v13 = v11;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Incrementing aggd key: %{public}@", buf, 0xCu);
        }
        _ADClientAddValueForScalarKey(v11, 1);
        CFRelease(v11);
        CFRelease(v9);
      }
    }
  }
}

uint64_t halogenMeasurementCleanup(void *a1)
{

  objc_msgSend(a1, "setConnectedAccessoryPDigitalID:", 0);
  objc_msgSend(a1, "setIsTimestampValid:", 0);
  objc_msgSend(a1, "setIsWet:", 0);
  objc_msgSend(a1, "setWasTapToRadarShown:", 0);
  objc_msgSend(a1, "setIsMeasurementEnabled:", 0);
  objc_msgSend(a1, "setDidNotify:", 0);
  objc_msgSend(a1, "setDidConfidentNotify:", 0);
  objc_msgSend(a1, "setDidHighConfidentNotify:", 0);
  objc_msgSend(a1, "setDidWetDuration:", 0);
  objc_msgSend(a1, "setAccessoryConnectedWhileWet:", 0);
  objc_msgSend(a1, "setDidWetTooLong:", 0);
  objc_msgSend(a1, "setIsHeadsetConnected:", 0);
  objc_msgSend(a1, "setIsDebugAccessoryConnected:", 0);
  return objc_msgSend(a1, "setIsBlacklistedAccessoryConnected:", 0);
}

void IOAccessoryNotifyWetCallback_0(uint64_t a1, uint64_t a2)
{
  io_service_t ServiceWithPrimaryPort;
  uint8_t v3[16];

  if (gLiquidNotificationContext)
  {
    gLiquidNotificationContext = 0;
    if (qword_1ED931C00)
    {
      if (byte_1ED931BE0)
      {
        switch(a2)
        {
          case 2:
            ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
            if (ServiceWithPrimaryPort)
            {
              setDriverMitigationEnabled(1, ServiceWithPrimaryPort, 0);
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v3 = 0;
                _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "UI Emergency Override!!!\n", v3, 2u);
              }
              if (qword_1ED931C00)
                IOAccessoryAggDPostScalarPrefixKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.mitigation.override"), (void *)qword_1ED931C00);
            }
            break;
          case 1:
            IOAccessoryGiveUserRadarOption((void *)qword_1ED931C00, 0);
            break;
          case 0:
            IOAccessoryNotifyWetHandlerDismiss_0();
            break;
        }
        IOAccessoryAggDPostScalarPrefixKey(CFSTR("com.apple.ioaccessorymanager.ldcm.eis.mitigation.override.seen"), (void *)qword_1ED931C00);
      }
      else if (a2 == 1)
      {
        IOAccessoryGiveUserRadarOption((void *)qword_1ED931C00, 0);
      }
      else if (!a2)
      {
        IOAccessoryNotifyWetHandlerDismiss_0();
      }
      CFRunLoopRemoveSource((CFRunLoopRef)qword_1ED931BF8, (CFRunLoopSourceRef)qword_1ED931BF0, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
      CFRelease((CFTypeRef)qword_1ED931BF0);
      CFRelease((CFTypeRef)qword_1ED931BE8);
    }
  }
}

void IOAccessoryNotifyWetHandlerDismiss_0()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "UI Dismiss!!!\n", v0, 2u);
  }
}

void IOAccessoryGiveUserRadarOption(void *a1, int a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  const char *v36;
  NSObject *v37;
  _QWORD block[6];
  int v39;

  v4 = (void *)objc_msgSend(a1, "halogenMeasurement");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "copyItemAtPath:toPath:error:", CFSTR("/tmp/halogen.wav"), CFSTR("/tmp/halogen_ttr.wav"), 0);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Halogen Measurements:\n\n"));
  objc_msgSend(v5, "appendFormat:", CFSTR("precalibrationSampleOffsetInFrames -> %d\n"), objc_msgSend(v4, "precalibrationSampleOffsetInFrames"));
  objc_msgSend(v5, "appendFormat:", CFSTR("calibrationSampleOffsetInFrames -> %d\n"), objc_msgSend(v4, "calibrationSampleOffsetInFrames"));
  objc_msgSend(v5, "appendFormat:", CFSTR("measurementSampleOffsetInFrames -> %d\n"), objc_msgSend(v4, "measurementSampleOffsetInFrames"));
  objc_msgSend(v4, "voltageGainCorrection");
  objc_msgSend(v5, "appendFormat:", CFSTR("voltageGainCorrection -> %.13f\n"), v6);
  objc_msgSend(v4, "currentGainCorrection");
  objc_msgSend(v5, "appendFormat:", CFSTR("currentGainCorrection -> %.13f\n"), v7);
  objc_msgSend(v4, "currentPhaseCompensation");
  objc_msgSend(v5, "appendFormat:", CFSTR("currentPhaseCompensation -> %.13f\n"), v8);
  objc_msgSend(v4, "goertzelImpedance");
  objc_msgSend(v5, "appendFormat:", CFSTR("goertzelImpedance -> %.13f\n"), v9);
  objc_msgSend(v4, "goertzelPhase");
  objc_msgSend(v5, "appendFormat:", CFSTR("goertzelPhase -> %.13f\n"), v10);
  objc_msgSend(v4, "compensatedImpedance");
  objc_msgSend(v5, "appendFormat:", CFSTR("compensatedImpedance -> %.13f\n"), v11);
  objc_msgSend(v4, "compensatedPhase");
  objc_msgSend(v5, "appendFormat:", CFSTR("compensatedPhase -> %.13f\n"), v12);
  objc_msgSend(v4, "clippingScore");
  objc_msgSend(v5, "appendFormat:", CFSTR("clippingScore -> %.13f\n"), v13);
  objc_msgSend(v4, "resistanceInOhms");
  objc_msgSend(v5, "appendFormat:", CFSTR("Resistance in Ohms -> %.13f\n"), v14);
  objc_msgSend(v4, "capacitanceInNanoF");
  objc_msgSend(v5, "appendFormat:", CFSTR("Capacitance in nF -> %.13f\n"), v15);
  objc_msgSend(v4, "precalVoltageSignalLevel");
  objc_msgSend(v5, "appendFormat:", CFSTR("precalVoltageSignalLevel -> %.13f\n"), v16);
  objc_msgSend(v4, "precalVoltageNoiseLevel");
  objc_msgSend(v5, "appendFormat:", CFSTR("precalVoltageNoiseLevel -> %.13f\n"), v17);
  objc_msgSend(v4, "precalVoltageSNR");
  objc_msgSend(v5, "appendFormat:", CFSTR("precalVoltageSNR -> %.13f\n"), v18);
  objc_msgSend(v4, "precalCurrentSignalLevel");
  objc_msgSend(v5, "appendFormat:", CFSTR("precalCurrentSignalLevel -> %.13f\n"), v19);
  objc_msgSend(v4, "precalCurrentNoiseLevel");
  objc_msgSend(v5, "appendFormat:", CFSTR("precalCurrentNoiseLevel -> %.13f\n"), v20);
  objc_msgSend(v4, "precalCurrentSNR");
  objc_msgSend(v5, "appendFormat:", CFSTR("precalCurrentSNR -> %.13f\n"), v21);
  objc_msgSend(v4, "calVoltageSignalLevel");
  objc_msgSend(v5, "appendFormat:", CFSTR("calVoltageSignalLevel -> %.13f\n"), v22);
  objc_msgSend(v4, "calVoltageNoiseLevel");
  objc_msgSend(v5, "appendFormat:", CFSTR("calVoltageNoiseLevel -> %.13f\n"), v23);
  objc_msgSend(v4, "calVoltageSNR");
  objc_msgSend(v5, "appendFormat:", CFSTR("calVoltageSNR -> %.13f\n"), v24);
  objc_msgSend(v4, "calCurrentSignalLevel");
  objc_msgSend(v5, "appendFormat:", CFSTR("calCurrentSignalLevel -> %.13f\n"), v25);
  objc_msgSend(v4, "calCurrentNoiseLevel");
  objc_msgSend(v5, "appendFormat:", CFSTR("calCurrentNoiseLevel -> %.13f\n"), v26);
  objc_msgSend(v4, "calCurrentSNR");
  objc_msgSend(v5, "appendFormat:", CFSTR("calCurrentSNR -> %.13f\n"), v27);
  objc_msgSend(v4, "measurementVoltageSignalLevel");
  objc_msgSend(v5, "appendFormat:", CFSTR("measurementVoltageSignalLevel -> %.13f\n"), v28);
  objc_msgSend(v4, "measurementVoltageNoiseLevel");
  objc_msgSend(v5, "appendFormat:", CFSTR("measurementVoltageNoiseLevel -> %.13f\n"), v29);
  objc_msgSend(v4, "measurementVoltageSNR");
  objc_msgSend(v5, "appendFormat:", CFSTR("measurementVoltageSNR -> %.13f\n"), v30);
  objc_msgSend(v4, "measurementCurrentSignalLevel");
  objc_msgSend(v5, "appendFormat:", CFSTR("measurementCurrentSignalLevel -> %.13f\n"), v31);
  objc_msgSend(v4, "measurementCurrentNoiseLevel");
  objc_msgSend(v5, "appendFormat:", CFSTR("measurementCurrentNoiseLevel -> %.13f\n"), v32);
  objc_msgSend(v4, "measurementCurrentSNR");
  objc_msgSend(v5, "appendFormat:", CFSTR("measurementCurrentSNR -> %.13f\n"), v33);
  objc_msgSend(v4, "measurementCondetSNR");
  objc_msgSend(v5, "appendFormat:", CFSTR("measurementCondetSNR -> %.13f\n"), v34);
  objc_msgSend(v5, "appendFormat:", CFSTR("Measurement Result -> %@\n\n"), objc_msgSend(v4, "getResultString"));
  objc_msgSend(v5, "appendFormat:", CFSTR("event based DigitalID -> 0x%012llx\n"), objc_msgSend(a1, "eventBasedDigitalID"));
  objc_msgSend(v5, "appendFormat:", CFSTR("connected accessory DigitalID -> 0x%012llx\n"), objc_msgSend(a1, "connectedAccessoryDigitalID"));
  objc_msgSend(v5, "appendFormat:", CFSTR("event based orientation -> %d\n"), objc_msgSend(a1, "eventBasedOrientation"));
  objc_msgSend(v5, "appendFormat:", CFSTR("connected accessory orientation -> %d\n"), objc_msgSend(a1, "connectedAccessoryOrientation"));
  v35 = objc_msgSend(a1, "pinID");
  if (v35 > 3)
    v36 = "Invalid";
  else
    v36 = IOAccessoryGetPinStrForIndex_pinStr[v35];
  objc_msgSend(v5, "appendFormat:", CFSTR("pin -> %s\n"), v36);
  v37 = objc_msgSend(a1, "halogenTtrDispatchQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __IOAccessoryGiveUserRadarOption_block_invoke;
  block[3] = &unk_1E92143E0;
  v39 = a2;
  block[4] = v5;
  block[5] = a1;
  dispatch_async(v37, block);
}

void IOAccessoryFileRadarHalogen(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v25 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3860], "pipe");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3860], "pipe");
  v7 = objc_alloc_init(MEMORY[0x1E0CB3958]);
  objc_msgSend(v7, "setLaunchPath:", CFSTR("/usr/local/bin/aggregatectl"));
  objc_msgSend(v7, "setArguments:", &unk_1E9220188);
  objc_msgSend(v7, "setStandardOutput:", v5);
  objc_msgSend(v7, "setStandardError:", v6);
  v8 = (void *)objc_msgSend(v5, "fileHandleForReading");
  v9 = (void *)objc_msgSend(v6, "fileHandleForReading");
  objc_msgSend(v7, "launch");
  do
  {
    v10 = (void *)objc_msgSend(v8, "readDataOfLength:", 1024);
    objc_msgSend(v4, "appendString:", objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, 4));
  }
  while (objc_msgSend(v10, "length"));
  objc_msgSend(v7, "waitUntilExit");
  v11 = objc_msgSend(v9, "readDataToEndOfFile");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "IOAccessoryGenerateAggregatectlLog";
    v33 = 2112;
    v34 = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s:\n%@", buf, 0x16u);
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createFileAtPath:contents:attributes:", CFSTR("/tmp/ioam_aggregatectl.log"), objc_msgSend(v4, "dataUsingEncoding:", 4), 0) & 1) == 0&& os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "IOAccessoryGenerateAggregatectlLog";
    v33 = 2112;
    v34 = CFSTR("/tmp/ioam_aggregatectl.log");
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s Unable to create file at '%@'", buf, 0x16u);
  }
  if (a2)
    v12 = "SNR Failure\n\n";
  else
    v12 = "LIQUID DETECTION REPORT (detected via Halogen)\n\n";
  v13 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithUTF8String:", v12);
  objc_msgSend(v13, "appendString:", CFSTR("Has your phone or charging cable been near liquid in the past 5 hours? \n\n"));
  objc_msgSend(v13, "appendString:", CFSTR("If yes:\n\n"));
  objc_msgSend(v13, "appendString:", CFSTR("- Cable or Phone?\n\n"));
  objc_msgSend(v13, "appendString:", CFSTR("- What kind of liquid? (e.g. tap water, rain, sweat, soda, beer, etc.)\n\n"));
  objc_msgSend(v13, "appendString:", CFSTR("- What kind of exposure? (e.g. submersion, splash, droplet, sitting in puddle, using device with wet/sweaty hands, etc)\n\n"));
  objc_msgSend(v13, "appendString:", CFSTR("- If the exposure was limited to a certain part of the device, where was it?\n\n"));
  objc_msgSend(v13, "appendString:", CFSTR("- How long was the exposure?\n\n"));
  objc_msgSend(v13, "appendString:", CFSTR("- Time since exposure\n"));
  objc_msgSend(v13, "appendString:", CFSTR("\n\nIf no:\n\n"));
  objc_msgSend(v13, "appendString:", CFSTR("Please describe what happened just before seeing the dialog. For example… Did you just connect an accessory? Did you drop your device? Are you in a humid environment?\n\n\n"));
  objc_msgSend(v13, "appendString:", a1);
  v14 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("tap-to-radar://new?ComponentName=LDCM&ComponentVersion=AutofilledBugs&ComponentID=750390&Classification=Other Bug&Reproducibility=Not Applicable&"));
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", CFSTR("/tmp/halogen_ttr.wav")))objc_msgSend(v14, "appendFormat:", CFSTR("Attachments=%@"), CFSTR("/tmp/halogen_ttr.wav"));
  objc_msgSend(v14, "appendString:", CFSTR(","));
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", CFSTR("/tmp/ioam_aggregatectl.log")))objc_msgSend(v14, "appendFormat:", CFSTR("%@"), CFSTR("/tmp/ioam_aggregatectl.log"));
  v15 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtPath:error:", CFSTR("/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/"), 0);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v14, "appendString:", CFSTR(","));
        objc_msgSend(v14, "appendString:", objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/"), "stringByAppendingPathComponent:", v20));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v17);
  }
  objc_msgSend(v14, "appendString:", CFSTR("&"));
  objc_msgSend(v14, "appendFormat:", CFSTR("Description=%@"), v13);
  v21 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet")));
  if (_FBSOpenApplicationOptionKeyPromptUnlockDevice_0)
  {
    v22 = objc_alloc(MEMORY[0x1E0CB3940]);
    v23 = objc_msgSend(v22, "initWithBytes:length:encoding:", _FBSOpenApplicationOptionKeyPromptUnlockDevice_0, 8, 1);
    if (v23)
    {
      v24 = (void *)v23;
      objc_msgSend(v25, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), v23);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace"), "openSensitiveURL:withOptions:", v21, v25);

    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace"), "openURL:", v21);
  }
}

uint64_t _holdPowerAssertion(int a1, void *a2)
{
  int v4;
  uint64_t v5;
  const __CFDictionary *v6;
  void *v7;
  uint64_t v8;
  IOPMAssertionID AssertionID;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a2, "isPowerAssertionHeld");
  if (a1)
  {
    if ((v4 & 1) == 0)
    {
      v11[0] = CFSTR("AssertType");
      v11[1] = CFSTR("AssertLevel");
      v12[0] = CFSTR("NoIdleSleepAssertion");
      v12[1] = &unk_1E9220138;
      v11[2] = CFSTR("AssertName");
      v11[3] = CFSTR("AllowsDeviceRestart");
      v5 = *MEMORY[0x1E0C9AE50];
      v12[2] = CFSTR("com.apple.ioaccessorymanager.halogen");
      v12[3] = v5;
      v6 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
      AssertionID = objc_msgSend(a2, "sleepAssertionID");
      if (IOPMAssertionCreateWithProperties(v6, &AssertionID))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          _holdPowerAssertion_cold_2();
        return objc_msgSend(a2, "isPowerAssertionHeld") ^ a1 ^ 1;
      }
      objc_msgSend(a2, "setSleepAssertionID:", AssertionID);
      v7 = a2;
      v8 = 1;
LABEL_14:
      objc_msgSend(v7, "setIsPowerAssertionHeld:", v8);
      return objc_msgSend(a2, "isPowerAssertionHeld") ^ a1 ^ 1;
    }
    goto LABEL_10;
  }
  if (!v4)
  {
LABEL_10:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      _holdPowerAssertion_cold_1(a2);
    return objc_msgSend(a2, "isPowerAssertionHeld") ^ a1 ^ 1;
  }
  if (!IOPMAssertionRelease(objc_msgSend(a2, "sleepAssertionID")))
  {
    v7 = a2;
    v8 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    _holdPowerAssertion_cold_3();
  return objc_msgSend(a2, "isPowerAssertionHeld") ^ a1 ^ 1;
}

uint64_t updateAccyHalogenHealthDictionary(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  IOAccessoryLdcmHealthClass *v4;
  IOAccessoryLdcmHealthClass *v5;
  int v6;
  int v7;
  const __CFAllocator *v8;
  CFStringRef v9;
  const __CFString *v10;
  __CFString *MutableCopy;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  IOAccessoryLdcmHealthClass *v18;
  IOAccessoryLdcmHealthClass *v19;
  int v20;
  int v21;
  uint64_t valuePtr;
  CFNumberRef number;
  uint8_t buf[4];
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  valuePtr = 0;
  if (!gAccyHealthDictionary
    || objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult") > 2)
  {
    return 0;
  }
  number = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
  if (gAccyHealthDictionary
    && objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult") <= 2)
  {
    v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%012llx_%1d_%012llx"), 0, 0, 0);
    v3 = objc_msgSend((id)gAccyHealthDictionary, "objectForKey:", v2);
    v4 = (IOAccessoryLdcmHealthClass *)v3;
    if (!v3)
    {
      v4 = objc_alloc_init(IOAccessoryLdcmHealthClass);
      v5 = v4;
      -[IOAccessoryLdcmHealthClass setIsHealthy:](v4, "setIsHealthy:", 0);
      trimAccyHealthDictionary();
    }
    if (objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult")
      && objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult") != 1)
    {
      if (objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult") == 2)
        -[IOAccessoryLdcmHealthClass setWetCount:](v4, "setWetCount:", -[IOAccessoryLdcmHealthClass wetCount](v4, "wetCount") + 1);
    }
    else
    {
      -[IOAccessoryLdcmHealthClass setDryCount:](v4, "setDryCount:", -[IOAccessoryLdcmHealthClass dryCount](v4, "dryCount") + 1);
    }
    v6 = -[IOAccessoryLdcmHealthClass isHealthy](v4, "isHealthy");
    if (-[IOAccessoryLdcmHealthClass dryCount](v4, "dryCount"))
      -[IOAccessoryLdcmHealthClass setIsHealthy:](v4, "setIsHealthy:", 1);
    objc_msgSend((id)gAccyHealthDictionary, "setObject:forKey:", v4, v2);
    v7 = -[IOAccessoryLdcmHealthClass isHealthy](v4, "isHealthy");
    if (!v3 || v6 != v7)
    {
      commitPersistentAccyHealthDictionary();
      if (!-[IOAccessoryLdcmHealthClass isHealthy](v4, "isHealthy"))
      {
        if (a1)
        {
          if (_ADClientAddValueForScalarKey)
          {
            v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            v9 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR(".%012llx.%1d"), 0, 0);
            if (v9)
            {
              v10 = v9;
              MutableCopy = CFStringCreateMutableCopy(v8, 0, CFSTR("com.apple.ioaccessorymanager.ldcm.notification.badaccessorycount"));
              if (MutableCopy)
              {
                v12 = MutableCopy;
                CFStringAppend(MutableCopy, v10);
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v26 = v12;
                  _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Incrementing aggd key: %{public}@", buf, 0xCu);
                }
                _ADClientAddValueForScalarKey(v12, 1);
                CFRelease(v12);
                CFRelease(v10);
              }
            }
          }
        }
      }
      dbgShowAccyHealthDictionary();
    }
  }
  objc_msgSend(a1, "service");
  if (_retrieveDeviceInterfaceSerialNumber())
    return 0;
  CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
  CFRelease(number);
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_msgSend(a1, "connectedAccessoryDigitalID");
  v15 = objc_msgSend(a1, "connectedAccessoryOrientation");
  v16 = objc_msgSend(v13, "stringWithFormat:", CFSTR("%012llx_%1d_%012llx"), v14, v15, valuePtr);
  v17 = objc_msgSend((id)gAccyHealthDictionary, "objectForKey:", v16);
  v18 = (IOAccessoryLdcmHealthClass *)v17;
  if (!v17)
  {
    v18 = objc_alloc_init(IOAccessoryLdcmHealthClass);
    v19 = v18;
    -[IOAccessoryLdcmHealthClass setIsHealthy:](v18, "setIsHealthy:", 0);
    trimAccyHealthDictionary();
  }
  if (objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult")
    && objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult") != 1)
  {
    if (objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult") == 2)
      -[IOAccessoryLdcmHealthClass setWetCount:](v18, "setWetCount:", -[IOAccessoryLdcmHealthClass wetCount](v18, "wetCount") + 1);
  }
  else
  {
    -[IOAccessoryLdcmHealthClass setDryCount:](v18, "setDryCount:", -[IOAccessoryLdcmHealthClass dryCount](v18, "dryCount") + 1);
  }
  v20 = -[IOAccessoryLdcmHealthClass isHealthy](v18, "isHealthy");
  if (-[IOAccessoryLdcmHealthClass dryCount](v18, "dryCount"))
    -[IOAccessoryLdcmHealthClass setIsHealthy:](v18, "setIsHealthy:", 1);
  objc_msgSend((id)gAccyHealthDictionary, "setObject:forKey:", v18, v16);
  v21 = -[IOAccessoryLdcmHealthClass isHealthy](v18, "isHealthy");
  if (!v17 || v20 != v21)
  {
    commitPersistentAccyHealthDictionary();
    if (!-[IOAccessoryLdcmHealthClass isHealthy](v18, "isHealthy"))
      IOAccessoryAggDPostScalarPrefixKey(CFSTR("com.apple.ioaccessorymanager.ldcm.notification.badaccessorycount"), a1);
    dbgShowAccyHealthDictionary();
  }
  return 1;
}

uint64_t reportEisMeasurementStateChange(void *a1)
{
  io_service_t v2;
  uint64_t result;
  int v4;
  uint8x8_t v5;
  io_connect_t connect;
  uint8_t buf[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  connect = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "reportEisMeasurementStateChange";
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s handleEisMeasurement entry\n", buf, 0xCu);
  }
  v2 = objc_msgSend(a1, "service");
  result = IOServiceOpen(v2, *MEMORY[0x1E0C83DA0], 0, &connect);
  if (!(_DWORD)result)
  {
    memset(buf, 170, 6);
    objc_msgSend((id)objc_msgSend(a1, "connectedAccessoryPDigitalID"), "getBytes:length:", buf, 6);
    objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult");
    if (!IOAccessoryManagerSetVoltageDetected())
    {
      v4 = objc_msgSend((id)objc_msgSend(a1, "halogenMeasurement"), "halogenResult");
      v5.i32[0] = *(_DWORD *)buf;
      if (vmovn_s16((int16x8_t)vmovl_u8(v5)).u32[0] == 61700
        && !buf[4]
        && v4 == 2
        && !buf[5]
        && (objc_msgSend(a1, "isReceptacleEmpty") & 1) == 0)
      {
        IOAccessoryAggDPostScalarKey((uint64_t)CFSTR("com.apple.ioaccessorymanager.voltage.headset"), (uint64_t)a1);
      }
    }
    result = connect;
    if (connect)
      return IOServiceClose(connect);
  }
  return result;
}

uint64_t __powerBatteryMatch(void *a1, io_iterator_t iterator)
{
  uint64_t result;
  io_registry_entry_t v5;
  NSObject *v6;
  kern_return_t v7;
  kern_return_t v8;
  io_object_t notification;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  kern_return_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  notification = -1431655766;
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    v6 = MEMORY[0x1E0C81028];
    do
    {
      __powerUpdateBatteryState(v5);
      v7 = IOServiceAddInterestNotification((IONotificationPortRef)gBatteryStatusNotificationContext, v5, "IOGeneralInterest", (IOServiceInterestCallback)__powerBatteryInterest, a1, &notification);
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v11 = "__powerBatteryMatch";
          v12 = 1024;
          v13 = v8;
          _os_log_error_impl(&dword_1D13BF000, v6, OS_LOG_TYPE_ERROR, "%s IOServiceAddInterestNotification failed: %08x", buf, 0x12u);
        }
      }
      IOObjectRelease(v5);
      result = IOIteratorNext(iterator);
      v5 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

uint64_t ____powerUpdateBatteryState_block_invoke(uint64_t a1)
{
  return performEisMeasurement(*(void **)(a1 + 32));
}

void handleLDCMNotification(int a1, void *a2, CFStringRef theString1)
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD block[5];

  if (CFStringCompare(theString1, CFSTR("com.apple.CoreAccessories.LDCMPreferencesNotification"), 1uLL) == kCFCompareEqualTo)
    objc_msgSend(a2, "_processLDCMDefauts:", 0);
  if (CFStringCompare(theString1, CFSTR("com.apple.CoreAccessories.TestLDCMAnalyticsNotification"), 1uLL) == kCFCompareEqualTo)
  {
    v5 = objc_msgSend(a2, "halogenTypeCDispatchQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __handleLDCMNotification_block_invoke;
    block[3] = &unk_1E9214120;
    block[4] = a2;
    dispatch_async(v5, block);
  }
  if (CFStringCompare(theString1, CFSTR("com.apple.CoreAccessories.LDCMSettingsDidChangeNotification"), 1uLL) == kCFCompareEqualTo)
  {
    v6 = objc_msgSend(a2, "halogenTypeCDispatchQueue");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __handleLDCMNotification_block_invoke_2;
    v11[3] = &unk_1E9214120;
    v11[4] = a2;
    dispatch_async(v6, v11);
  }
  if (CFStringCompare(theString1, CFSTR("com.apple.CoreAccessories.LDCMMitigationsOverrideNotification"), 1uLL) == kCFCompareEqualTo)
  {
    v7 = objc_msgSend(a2, "halogenTypeCDispatchQueue");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __handleLDCMNotification_block_invoke_3;
    v10[3] = &unk_1E9214120;
    v10[4] = a2;
    dispatch_async(v7, v10);
  }
  if (CFStringCompare(theString1, CFSTR("com.apple.CoreAccessories.LDCMActiveMeasurementsDidChangeNotification"), 1uLL) == kCFCompareEqualTo)
  {
    v8 = objc_msgSend(a2, "halogenTypeCDispatchQueue");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __handleLDCMNotification_block_invoke_4;
    v9[3] = &unk_1E9214120;
    v9[4] = a2;
    dispatch_async(v8, v9);
  }
}

void handleUserRequestedRadarNotification(uint64_t a1, void *a2)
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_msgSend(a2, "halogenTypeCUserPromptDispatchQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __handleUserRequestedRadarNotification_block_invoke;
  block[3] = &unk_1E9214120;
  block[4] = a2;
  dispatch_async(v3, block);
}

void handleWetPromptResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[6];

  v3 = qword_1EFC5BAB0;
  v4 = objc_msgSend((id)qword_1EFC5BAB0, "halogenTypeCUserPromptDispatchQueue");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __handleWetPromptResponse_block_invoke;
  v5[3] = &unk_1E9214468;
  v5[4] = v3;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void clearNotificationContext()
{
  __CFRunLoop *Main;

  if (gWetNotificationContext)
    CFUserNotificationCancel((CFUserNotificationRef)gWetNotificationContext);
  if (qword_1EFC5BAA8)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, (CFRunLoopSourceRef)qword_1EFC5BAA8, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease((CFTypeRef)qword_1EFC5BAA8);
    qword_1EFC5BAA8 = 0;
  }
  if (gWetNotificationContext)
  {
    CFRelease((CFTypeRef)gWetNotificationContext);
    gWetNotificationContext = 0;
  }
}

uint64_t __handleLDCMNotification_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processLDCMAnalyticsDefauts");
}

uint64_t __handleLDCMNotification_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_manageLDCMSettings");
}

uint64_t __handleLDCMNotification_block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processMitigationsOverride");
}

uint64_t __handleLDCMNotification_block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_controlLDCMMeasurements");
}

uint64_t __handleUserRequestedRadarNotification_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fileRadarHalogenTypeC:TTRCategory:", objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Manual HalogenTypeC radar request.\n")), 1);
}

void __handleWetPromptResponse_block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  clearNotificationContext();
  objc_msgSend(*(id *)(a1 + 32), "setLastUserNotificationTimeNS:", clock_gettime_nsec_np(_CLOCK_UPTIME_RAW));
  if (*(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isInternalBuild") && *(_QWORD *)(a1 + 40) == 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v4 = 136315138;
        v5 = "handleWetPromptResponse_block_invoke";
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s alternate response", (uint8_t *)&v4, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "_fileRadarHalogenTypeC:TTRCategory:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "typeC"), "getVerboseMeasurementOutputString"), "mutableCopy"), 0);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "handleWetPromptResponse_block_invoke";
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s unexpected response", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "handleWetPromptResponse_block_invoke";
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s default response", (uint8_t *)&v4, 0xCu);
    }
    v2 = objc_msgSend(*(id *)(a1 + 32), "timerPortStateCheck");
    v3 = dispatch_walltime(0, 3600000000000);
    dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

uint64_t compare(double *a1, double *a2)
{
  unsigned int v2;

  if (*a1 >= *a2)
    v2 = 0;
  else
    v2 = -1;
  if (*a1 > *a2)
    return 1;
  else
    return v2;
}

uint64_t recordCallback_0(void *a1, AudioUnitRenderActionFlags *a2, const AudioTimeStamp *a3, UInt32 a4, UInt32 a5)
{
  signed int v10;
  int v11;
  uint64_t v12;
  OSStatus v13;
  OSStatus v14;
  signed int v15;
  int v16;
  UInt32 v17;
  UInt32 v18;
  signed int v19;
  int v20;
  _QWORD v22[4];
  uint8_t buf[4];
  UInt32 v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = objc_msgSend(a1, "inputFrameSizeInBytes") * a5;
  memset(v22, 170, 24);
  v11 = objc_msgSend(a1, "pcmInputDataMaxSzInBytes");
  if ((int)(v11 - objc_msgSend(a1, "pcmInputDataIndexInBytes")) < v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      v24 = a5;
      v25 = 1024;
      v26 = objc_msgSend(a1, "pcmInputDataMaxSzInBytes");
      v27 = 1024;
      v28 = objc_msgSend(a1, "pcmInputDataIndexInBytes");
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:recordCallback() insufficient space in pcmInputData buffer to render %d frames.  bufsize = %d idx=%d", buf, 0x14u);
    }
  }
  else if ((objc_msgSend(a1, "isMeasurementDone") & 1) == 0)
  {
    LODWORD(v22[1]) = 1;
    v12 = objc_msgSend((id)objc_msgSend(a1, "pcmInputData"), "bytes");
    v22[3] = v12 + (int)objc_msgSend(a1, "pcmInputDataIndexInBytes");
    HIDWORD(v22[2]) = v10;
    v13 = AudioUnitRender((AudioUnit)objc_msgSend(a1, "audioComponentInst"), a2, a3, a4, a5, (AudioBufferList *)&v22[1]);
    if (v13)
    {
      v14 = v13;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v24 = v14;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:render failed osstatus=0x%x", buf, 8u);
      }
    }
    objc_msgSend(a1, "setPcmInputDataIndexInBytes:", objc_msgSend(a1, "pcmInputDataIndexInBytes") + v10);
    objc_msgSend(a1, "setPcmInputDataSampleCnt:", objc_msgSend(a1, "pcmInputDataSampleCnt") + a5);
    v15 = objc_msgSend(a1, "pcmInputDataSampleCnt");
    v16 = objc_msgSend(a1, "calibrationSampleOffsetInFrames");
    if (v15 >= (int)(objc_msgSend(a1, "nMeasurementSamples") + v16))
    {
      if ((objc_msgSend(a1, "isCalibrationDone") & 1) == 0)
      {
        objc_msgSend(a1, "setIsCalibrationDone:", 1);
        objc_msgSend(a1, "setMeasurementSampleOffsetInFrames:", objc_msgSend(a1, "nHydraSettlingSamples")+ objc_msgSend(a1, "pcmInputDataSampleCnt"));
        objc_msgSend(a1, "connect");
        objc_msgSend(a1, "pinToMeasure");
        v17 = IOAccessoryManagerSelectEisPin();
        if (v17)
        {
          v18 = v17;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            v24 = v18;
            _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:IOAccessoryManagerSelectEisPin failed to set the pin ret = 0x%x", buf, 8u);
          }
        }
        else
        {
          objc_msgSend(a1, "setEisPinToken2:", v22[0]);
        }
      }
      v19 = objc_msgSend(a1, "pcmInputDataSampleCnt");
      v20 = objc_msgSend(a1, "measurementSampleOffsetInFrames");
      if (v19 >= (int)(objc_msgSend(a1, "nMeasurementSamples") + v20))
      {
        objc_msgSend(a1, "setIsMeasurementDone:", 1);
        objc_msgSend((id)objc_msgSend(a1, "audioTimeoutCond"), "signal");
      }
    }
  }
  return 0;
}

uint64_t playbackCallback_0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  void **v14;
  unsigned int v15;
  size_t v16;

  v8 = objc_msgSend((id)objc_msgSend(a1, "pcmOutputData"), "bytes");
  v9 = objc_msgSend(a1, "pcmOutputDataIndexInBytes");
  v10 = objc_msgSend(a1, "pcmOutputDataMaxSzInBytes");
  v11 = *a6;
  if ((_DWORD)v11)
  {
    v12 = v10;
    v13 = 0;
    v14 = (void **)(a6 + 4);
    do
    {
      v15 = *((_DWORD *)v14 - 1);
      if (v12 - (int)v9 >= v15)
        v16 = v15;
      else
        v16 = (v12 - v9);
      if ((_DWORD)v16)
      {
        memcpy(*v14, (const void *)(v8 + (int)objc_msgSend(a1, "pcmOutputDataIndexInBytes")), v16);
        v9 = (v16 + v9);
        v11 = *a6;
      }
      v14 += 2;
      ++v13;
    }
    while (v13 < v11);
  }
  objc_msgSend(a1, "setPcmOutputDataIndexInBytes:", v9);
  return 0;
}

void systemPowerCallback_0(void *a1, uint64_t a2, int a3, intptr_t a4)
{
  void *v5;
  uint64_t v6;
  dispatch_time_t v7;
  NSObject *global_queue;
  _QWORD block[5];

  if (a3 > -536870145)
  {
    if (a3 != -536870144)
    {
      if (a3 != -536870112)
        return;
      objc_msgSend((id)objc_msgSend(a1, "powerStateCond"), "lock");
      v5 = a1;
      v6 = 1;
      goto LABEL_8;
    }
    v7 = dispatch_walltime(0, 100000000);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __systemPowerCallback_block_invoke_0;
    block[3] = &unk_1E9214120;
    block[4] = a1;
    dispatch_after(v7, global_queue, block);
  }
  else
  {
    if (a3 != -536870288)
    {
      if (a3 != -536870272)
        return;
      IOAllowPowerChange(objc_msgSend(a1, "systemPowerPort"), a4);
      objc_msgSend((id)objc_msgSend(a1, "powerStateCond"), "lock");
      v5 = a1;
      v6 = 0;
LABEL_8:
      objc_msgSend(v5, "setPowerState:", v6);
      objc_msgSend((id)objc_msgSend(a1, "powerStateCond"), "signal");
      objc_msgSend((id)objc_msgSend(a1, "powerStateCond"), "unlock");
      return;
    }
    IOAllowPowerChange(objc_msgSend(a1, "systemPowerPort"), a4);
  }
}

uint64_t __systemPowerCallback_block_invoke_0(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "powerStateCond"), "lock");
  objc_msgSend(*(id *)(a1 + 32), "setPowerState:", 2);
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "powerStateCond"), "signal");
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "powerStateCond"), "unlock");
}

BOOL IOAccessoryStartSystemStateMonitor()
{
  IOAccessorySystemStateMonitor *v0;
  void *v1;

  if (*(_QWORD *)monitor)
    return 0;
  v0 = objc_alloc_init(IOAccessorySystemStateMonitor);
  v1 = *(void **)monitor;
  *(_QWORD *)monitor = v0;

  return *(_QWORD *)monitor != 0;
}

void IOAccessoryStopSystemStateMonitor()
{
  void *v0;

  v0 = *(void **)monitor;
  *(_QWORD *)monitor = 0;

}

uint64_t ProcessPublishedEndpoints(void *a1, io_iterator_t iterator)
{
  uint64_t result;
  __int128 v5;
  uint64_t v6;
  NSObject *v7;
  __int128 v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v6 = result;
    v7 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v5 = 136315138;
    v8 = v5;
    do
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v8;
        v10 = "ProcessPublishedEndpoints";
        _os_log_impl(&dword_1D13BF000, v7, OS_LOG_TYPE_INFO, "%s adding endpoint", buf, 0xCu);
      }
      objc_msgSend(a1, "addEndpointForService:", v6, v8);
      IOObjectRelease(v6);
      result = IOIteratorNext(iterator);
      v6 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

uint64_t ProcessTerminatedEndpoints(void *a1, io_iterator_t iterator)
{
  uint64_t result;
  __int128 v5;
  uint64_t v6;
  NSObject *v7;
  __int128 v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v6 = result;
    v7 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v5 = 136315138;
    v8 = v5;
    do
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v8;
        v10 = "ProcessTerminatedEndpoints";
        _os_log_impl(&dword_1D13BF000, v7, OS_LOG_TYPE_INFO, "%s removing endpoint", buf, 0xCu);
      }
      objc_msgSend(a1, "removeEndpointForService:", v6, v8);
      IOObjectRelease(v6);
      result = IOIteratorNext(iterator);
      v6 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

char *OUTLINED_FUNCTION_4@<X0>(mach_error_t error_value@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 8) = a2;
  return mach_error_string(error_value);
}

BOOL IOAccessoryStartLDCM(__CFRunLoop *a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int started;
  _BOOL8 v9;
  IONotificationPort *v10;
  const __CFDictionary *v11;
  BOOL v12;
  __CFRunLoopSource *RunLoopSource;
  io_iterator_t notification;
  IONotificationPort *refCon;
  unint64_t v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  refCon = (IONotificationPort *)0xAAAAAAAAAAAAAAAALL;
  v17 = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("LDCMDiscoveryDisabled"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Starting LDCM Now", buf, 2u);
  }
  if (!ldcmManagerStore)
  {
    v4 = objc_opt_new();
    v5 = (void *)ldcmManagerStore;
    ldcmManagerStore = v4;

  }
  if (!ldcmMobileAssetDistributor)
  {
    v6 = objc_opt_new();
    v7 = (void *)ldcmMobileAssetDistributor;
    ldcmMobileAssetDistributor = v6;

  }
  started = IOAccessoryStartVoltageEventMonitorLegacy((uint64_t)a1);
  v9 = started != 0;
  notification = -1431655766;
  v10 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v19 = v3;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - LDCM Discovery disabled? default setting: %d", buf, 8u);
  }
  if ((v3 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM Discovery is enabled.", buf, 2u);
    }
    refCon = v10;
    v17 = (unint64_t)a1;
    v11 = IOServiceMatching("IOPortFeatureLDCM");
    if (IOServiceAddMatchingNotification(v10, "IOServiceFirstPublish", v11, (IOServiceMatchingCallback)IOPortLDCMServiceMatchingCallback, &refCon, &notification))
    {
      v12 = started == 0;
    }
    else
    {
      v12 = 0;
    }
    v9 = !v12;
    IOPortLDCMServiceMatchingCallback((uint64_t *)&refCon, notification);
  }
  RunLoopSource = IONotificationPortGetRunLoopSource(v10);
  if (RunLoopSource)
    CFRunLoopAddSource(a1, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  else
    v9 = 0;

  return v9;
}

void IOPortLDCMServiceMatchingCallback(uint64_t *a1, io_iterator_t iterator)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  IOPortLDCMManagerV4 *v6;
  const __CFAllocator *v7;
  void *CFProperty;
  void *v9;
  IOPortLDCMManagerV4 *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v3 = *a1;
  v4 = a1[1];
  v5 = IOIteratorNext(iterator);
  if ((_DWORD)v5)
  {
    v6 = 0;
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    while (1)
    {
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v5, CFSTR("ArchitectureVersion"), v7, 0);
      v9 = CFProperty;
      if (!CFProperty)
        break;
      if (objc_msgSend(CFProperty, "intValue") == 4)
      {
        v10 = -[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]([IOPortLDCMManagerV4 alloc], "initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:", 64000000000, 32000000000, v5, v3, v4);

        if (!v10)
        {
          v22 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v22)
            IOPortLDCMServiceMatchingCallback_cold_2(v22, v23, v24, v25, v26, v27, v28, v29);
          v6 = 0;
          goto LABEL_21;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)ldcmManagerStore, "setObject:forKey:", v10, v11);
        if (!ldcmMobileAssetManager)
        {
          v12 = objc_opt_new();
          v13 = (void *)ldcmMobileAssetManager;
          ldcmMobileAssetManager = v12;

          objc_msgSend((id)ldcmMobileAssetManager, "setDelegate:", ldcmMobileAssetDistributor);
        }

        v6 = v10;
      }
      IOObjectRelease(v5);

      v5 = IOIteratorNext(iterator);
      if (!(_DWORD)v5)
        goto LABEL_10;
    }
    v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v14)
      IOPortLDCMServiceMatchingCallback_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
LABEL_21:

LABEL_10:
  }
  if (iterator)
    IOObjectRelease(iterator);
  if ((_DWORD)v5)
    IOObjectRelease(v5);
}

double __divdc3(double a1, double a2, double a3, double a4)
{
  double v4;
  uint64_t v5;
  int v6;
  double v7;
  double v8;
  int v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  BOOL v15;
  unint64_t v16;
  double v17;
  double v18;
  int v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  int v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v37;
  int v38;

  v4 = fmax(fabs(a3), fabs(a4));
  v5 = (*(_QWORD *)&v4 >> 52) & 0x7FFLL;
  v6 = __clz(*(_QWORD *)&v4 & 0x7FFFFFFFFFFFFFFFLL);
  v7 = (double)(int)(((*(_QWORD *)&v4 << (v6 - 11) >> 52) & 0x7FF) - v6 - 1012);
  if ((_DWORD)v5)
    v7 = (double)((int)v5 - 1023);
  if (v4 == 0.0)
    v7 = -INFINITY;
  if (*(uint64_t *)&v4 <= -1)
    v4 = -v4;
  if ((_DWORD)v5 == 2047)
    v8 = v4;
  else
    v8 = v7;
  if ((*(_QWORD *)&v8 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
  {
    v9 = 0;
    goto LABEL_22;
  }
  v9 = (int)v8;
  v10 = -(int)v8;
  if (a3 == 0.0 || (v11 = (*(_QWORD *)&a3 >> 52) & 0x7FFLL, (_DWORD)v11 == 2047))
  {
LABEL_36:
    if (a4 == 0.0)
      goto LABEL_22;
    goto LABEL_37;
  }
  v12 = *(_QWORD *)&a3 & 0xFFFFFFFFFFFFFLL;
  if (!(_DWORD)v11)
  {
    v13 = __clz(v12);
    v14 = v12 << (v13 - 11);
    LODWORD(v11) = 12 - v13;
    v12 = v14 & 0xFFEFFFFFFFFFFFFFLL;
  }
  v15 = __OFADD__((_DWORD)v11, v10);
  LODWORD(v11) = v11 - (int)v8;
  if (v15)
    v11 = ((int)v11 >> 31) ^ 0x80000000;
  else
    v11 = v11;
  v16 = *(_QWORD *)&a3 & 0x8000000000000000;
  if ((int)v11 < 2047)
  {
    if ((int)v11 <= 0)
    {
      v37 = v12 | v16 | 0x10000000000000;
      if ((int)v11 <= -1021)
        v38 = -1021;
      else
        v38 = v11;
      a3 = *(double *)&v37 * COERCE_DOUBLE((unint64_t)(v38 + 1022) << 52);
      if (a4 == 0.0)
        goto LABEL_22;
      goto LABEL_37;
    }
    *(_QWORD *)&a3 = v16 | (v11 << 52) | v12;
    goto LABEL_36;
  }
  a3 = COERCE_DOUBLE(v16 | 0x7FE0000000000000) + COERCE_DOUBLE(v16 | 0x7FE0000000000000);
  if (a4 == 0.0)
    goto LABEL_22;
LABEL_37:
  v28 = (*(_QWORD *)&a4 >> 52) & 0x7FFLL;
  if ((_DWORD)v28 != 2047)
  {
    v29 = *(_QWORD *)&a4 & 0xFFFFFFFFFFFFFLL;
    if (!(_DWORD)v28)
    {
      v30 = __clz(v29);
      v31 = v29 << (v30 - 11);
      LODWORD(v28) = 12 - v30;
      v29 = v31 & 0xFFEFFFFFFFFFFFFFLL;
    }
    v15 = __OFADD__((_DWORD)v28, v10);
    LODWORD(v32) = v28 - (int)v8;
    if (v15)
      v32 = ((int)v32 >> 31) ^ 0x80000000;
    else
      v32 = v32;
    v33 = *(_QWORD *)&a4 & 0x8000000000000000;
    if ((int)v32 < 2047)
    {
      if ((int)v32 <= 0)
      {
        if ((int)v32 <= -1021)
          LODWORD(v32) = -1021;
        a4 = COERCE_DOUBLE(v29 | v33 | 0x10000000000000)
           * COERCE_DOUBLE((unint64_t)(v32 + 1022) << 52);
      }
      else
      {
        *(_QWORD *)&a4 = v33 | (v32 << 52) | v29;
      }
    }
    else
    {
      a4 = COERCE_DOUBLE(v33 | 0x7FE0000000000000) + COERCE_DOUBLE(v33 | 0x7FE0000000000000);
    }
  }
LABEL_22:
  v17 = a4 * a4 + a3 * a3;
  v18 = (a4 * a2 + a1 * a3) / v17;
  v19 = -v9;
  if (v18 != 0.0)
  {
    v20 = (a4 * a2 + a1 * a3) / v17;
    v21 = (*(_QWORD *)&v18 >> 52) & 0x7FFLL;
    if ((_DWORD)v21 != 2047)
    {
      v22 = *(_QWORD *)&v20 & 0xFFFFFFFFFFFFFLL;
      v23 = __clz(*(_QWORD *)&v20 & 0xFFFFFFFFFFFFFLL);
      v24 = (*(_QWORD *)&v20 & 0xFFFFFFFFFFFFFLL) << (v23 - 11);
      v25 = 12 - v23;
      v26 = v24 & 0xFFEFFFFFFFFFFFFFLL;
      if (!(_DWORD)v21)
      {
        v22 = v26;
        LODWORD(v21) = v25;
      }
      v15 = __OFADD__((_DWORD)v21, v19);
      LODWORD(v21) = v21 + v19;
      if (v15)
        v21 = ((int)v21 >> 31) ^ 0x80000000;
      else
        v21 = v21;
      v27 = *(_QWORD *)&v18 & 0x8000000000000000;
      if ((int)v21 < 2047)
      {
        if ((int)v21 <= 0)
        {
          v34 = v22 | v27 | 0x10000000000000;
          if ((int)v21 <= -1021)
            v35 = -1021;
          else
            v35 = v21;
          return *(double *)&v34 * COERCE_DOUBLE((unint64_t)(v35 + 1022) << 52);
        }
        else
        {
          *(_QWORD *)&v18 = v27 | (v21 << 52) | v22;
        }
      }
      else
      {
        return COERCE_DOUBLE(v27 | 0x7FE0000000000000) + COERCE_DOUBLE(v27 | 0x7FE0000000000000);
      }
    }
  }
  return v18;
}

float __divsc3(float a1, float a2, float a3, float a4)
{
  float v4;
  int v5;
  unsigned int v6;
  float v7;
  float v8;
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  BOOL v15;
  signed int v16;
  unsigned int v17;
  float v18;
  unsigned int v19;
  int v20;
  float v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  signed int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  signed int v34;
  unsigned int v35;
  int v36;
  int v37;
  int v39;
  int v40;

  v4 = fmaxf(fabsf(a3), fabsf(a4));
  v5 = (LODWORD(v4) >> 23);
  v6 = __clz(LODWORD(v4) & 0x7FFFFFFF);
  v7 = (float)(int)((LODWORD(v4) << (v6 - 8) >> 23) - v6 - 119);
  if ((LODWORD(v4) >> 23))
    v7 = (float)(v5 - 127);
  if (v4 == 0.0)
    v7 = -INFINITY;
  if (SLODWORD(v4) <= -1)
    v4 = -v4;
  if (v5 == 255)
    v8 = v4;
  else
    v8 = v7;
  if ((LODWORD(v8) & 0x7FFFFFFFu) > 0x7F7FFFFF)
  {
    v9 = 0;
    goto LABEL_21;
  }
  v9 = (int)v8;
  v10 = -(int)v8;
  if (a3 == 0.0 || (v11 = (LODWORD(a3) >> 23), v11 == 255))
  {
LABEL_34:
    if (a4 == 0.0)
      goto LABEL_21;
    goto LABEL_35;
  }
  v12 = LODWORD(a3) & 0x7FFFFF;
  if (!(LODWORD(a3) >> 23))
  {
    v13 = __clz(v12);
    v14 = v12 << (v13 - 8);
    v11 = 9 - v13;
    v12 = v14 & 0xFF7FFFFF;
  }
  v15 = __OFADD__(v11, v10);
  v16 = v11 - (int)v8;
  if (v15)
    v16 = (v16 >> 31) ^ 0x80000000;
  v17 = LODWORD(a3) & 0x80000000;
  if (v16 < 255)
  {
    if (v16 <= 0)
    {
      v39 = v12 | v17 | 0x800000;
      if (v16 <= -125)
        v40 = -125;
      else
        v40 = v16;
      a3 = *(float *)&v39 * COERCE_FLOAT((v40 << 23) + 1056964608);
      if (a4 == 0.0)
        goto LABEL_21;
      goto LABEL_35;
    }
    LODWORD(a3) = v17 | (v16 << 23) | v12;
    goto LABEL_34;
  }
  a3 = COERCE_FLOAT(v17 | 0x7F000000) + COERCE_FLOAT(v17 | 0x7F000000);
  if (a4 == 0.0)
    goto LABEL_21;
LABEL_35:
  v30 = (LODWORD(a4) >> 23);
  if (v30 != 255)
  {
    v31 = LODWORD(a4) & 0x7FFFFF;
    if (!(LODWORD(a4) >> 23))
    {
      v32 = __clz(v31);
      v33 = v31 << (v32 - 8);
      v30 = 9 - v32;
      v31 = v33 & 0xFF7FFFFF;
    }
    v15 = __OFADD__(v30, v10);
    v34 = v30 - (int)v8;
    if (v15)
      v34 = (v34 >> 31) ^ 0x80000000;
    v35 = LODWORD(a4) & 0x80000000;
    if (v34 < 255)
    {
      if (v34 <= 0)
      {
        if (v34 <= -125)
          v34 = -125;
        a4 = COERCE_FLOAT(v31 | v35 | 0x800000) * COERCE_FLOAT((v34 << 23) + 1056964608);
      }
      else
      {
        LODWORD(a4) = v35 | (v34 << 23) | v31;
      }
    }
    else
    {
      a4 = COERCE_FLOAT(v35 | 0x7F000000) + COERCE_FLOAT(v35 | 0x7F000000);
    }
  }
LABEL_21:
  v18 = (float)(a4 * a4) + (float)(a3 * a3);
  *(float *)&v19 = (float)((float)(a4 * a2) + (float)(a1 * a3)) / v18;
  v20 = -v9;
  if (*(float *)&v19 != 0.0)
  {
    v21 = (float)((float)(a4 * a2) + (float)(a1 * a3)) / v18;
    v22 = (v19 >> 23);
    if (v22 != 255)
    {
      v23 = LODWORD(v21) & 0x7FFFFF;
      v24 = __clz(LODWORD(v21) & 0x7FFFFF);
      v25 = (LODWORD(v21) & 0x7FFFFF) << (v24 - 8);
      v26 = 9 - v24;
      v27 = v25 & 0xFF7FFFFF;
      if (!(v19 >> 23))
      {
        v23 = v27;
        v22 = v26;
      }
      v15 = __OFADD__(v22, v20);
      v28 = v22 + v20;
      if (v15)
        v28 = (v28 >> 31) ^ 0x80000000;
      v29 = v19 & 0x80000000;
      if (v28 < 255)
      {
        if (v28 <= 0)
        {
          v36 = v23 | v29 | 0x800000;
          if (v28 <= -125)
            v37 = -125;
          else
            v37 = v28;
          *(float *)&v19 = *(float *)&v36 * COERCE_FLOAT((v37 << 23) + 1056964608);
        }
        else
        {
          v19 = v29 | (v28 << 23) | v23;
        }
      }
      else
      {
        *(float *)&v19 = COERCE_FLOAT(v29 | 0x7F000000) + COERCE_FLOAT(v29 | 0x7F000000);
      }
    }
  }
  return *(float *)&v19;
}

void IOAccessoryStartVoltageEventMonitorLegacy_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D13BF000, MEMORY[0x1E0C81028], v0, "%s IOServiceAddMatchingNotification falied: %08x", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3();
}

void _holdPowerAssertion_cold_1(void *a1)
{
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "isPowerAssertionHeld");
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s halogen power assertion already in the correct state: %d.\n", (uint8_t *)v1, 0x12u);
  OUTLINED_FUNCTION_3();
}

void _holdPowerAssertion_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D13BF000, MEMORY[0x1E0C81028], v0, "%s failed to acquire power assertion. Error 0x%x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3();
}

void _holdPowerAssertion_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D13BF000, MEMORY[0x1E0C81028], v0, "%s failed to release power assertion. Error 0x%x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3();
}

void IOPortLDCMServiceMatchingCallback_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1D13BF000, MEMORY[0x1E0C81028], a3, "LDCM - Failed to read LDCM architecture version!!!", a5, a6, a7, a8, 0);
}

void IOPortLDCMServiceMatchingCallback_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1D13BF000, MEMORY[0x1E0C81028], a3, "LDCM - Failed to instantiate IOPortLDCMManagerV4!!!", a5, a6, a7, a8, 0);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

AudioComponent AudioComponentFindNext(AudioComponent inComponent, const AudioComponentDescription *inDesc)
{
  return (AudioComponent)MEMORY[0x1E0CFF3E8](inComponent, inDesc);
}

OSStatus AudioComponentInstanceDispose(AudioComponentInstance inInstance)
{
  return MEMORY[0x1E0CFF408](inInstance);
}

OSStatus AudioComponentInstanceNew(AudioComponent inComponent, AudioComponentInstance *outInstance)
{
  return MEMORY[0x1E0CFF418](inComponent, outInstance);
}

OSStatus AudioOutputUnitStart(AudioUnit ci)
{
  return MEMORY[0x1E0CFF530](ci);
}

OSStatus AudioOutputUnitStop(AudioUnit ci)
{
  return MEMORY[0x1E0CFF538](ci);
}

OSStatus AudioUnitInitialize(AudioUnit inUnit)
{
  return MEMORY[0x1E0CFF5B8](inUnit);
}

OSStatus AudioUnitRender(AudioUnit inUnit, AudioUnitRenderActionFlags *ioActionFlags, const AudioTimeStamp *inTimeStamp, UInt32 inOutputBusNumber, UInt32 inNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x1E0CFF5E0](inUnit, ioActionFlags, inTimeStamp, *(_QWORD *)&inOutputBusNumber, *(_QWORD *)&inNumberFrames, ioData);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x1E0CFF600](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, inData, *(_QWORD *)&inDataSize);
}

OSStatus AudioUnitUninitialize(AudioUnit inUnit)
{
  return MEMORY[0x1E0CFF608](inUnit);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x1E0C98240](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, componentDesc);
  v3 = va_arg(va, _QWORD);
  return MEMORY[0x1E0C98248](calendar, v3, at);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
  MEMORY[0x1E0C98298](calendar, tz);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
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

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x1E0C99280]();
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C993C8](allocator, buffer, bufLen, isDirectory);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1E0C995A0](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C995B8](allocator, userNotification, callout, order);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995C8](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995E8](userNotification, responseFlags, timeout);
}

OSStatus ExtAudioFileCreateWithURL(CFURLRef inURL, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inStreamDesc, const AudioChannelLayout *inChannelLayout, UInt32 inFlags, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x1E0CFF630](inURL, *(_QWORD *)&inFileType, inStreamDesc, inChannelLayout, *(_QWORD *)&inFlags, outExtAudioFile);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x1E0CFF638](inExtAudioFile);
}

OSStatus ExtAudioFileWrite(ExtAudioFileRef inExtAudioFile, UInt32 inNumberFrames, const AudioBufferList *ioData)
{
  return MEMORY[0x1E0CFF680](inExtAudioFile, *(_QWORD *)&inNumberFrames, ioData);
}

uint64_t IOAccessoryManagerConfigureGoldbondMode()
{
  return MEMORY[0x1E0DE01D8]();
}

uint64_t IOAccessoryManagerCopyDeviceInfo()
{
  return MEMORY[0x1E0DE01E8]();
}

uint64_t IOAccessoryManagerGetAccessoryID()
{
  return MEMORY[0x1E0DE01F0]();
}

uint64_t IOAccessoryManagerGetDigitalID()
{
  return MEMORY[0x1E0DE01F8]();
}

uint64_t IOAccessoryManagerGetFreePinMask()
{
  return MEMORY[0x1E0DE0200]();
}

uint64_t IOAccessoryManagerGetLdcmParams()
{
  return MEMORY[0x1E0DE0208]();
}

uint64_t IOAccessoryManagerGetPrimaryPort()
{
  return MEMORY[0x1E0DE0210]();
}

uint64_t IOAccessoryManagerGetServiceWithPrimaryPort()
{
  return MEMORY[0x1E0DE0218]();
}

uint64_t IOAccessoryManagerGetServiceWithSupportedFeature()
{
  return MEMORY[0x1E0DE0220]();
}

uint64_t IOAccessoryManagerGetType()
{
  return MEMORY[0x1E0DE0228]();
}

uint64_t IOAccessoryManagerLDCMEnableMitigations()
{
  return MEMORY[0x1E0DE0230]();
}

uint64_t IOAccessoryManagerLDCMGetMeasurementStatus()
{
  return MEMORY[0x1E0DE0238]();
}

uint64_t IOAccessoryManagerLDCMSetLiquidDetected()
{
  return MEMORY[0x1E0DE0240]();
}

uint64_t IOAccessoryManagerRequestLdcmMeasurement()
{
  return MEMORY[0x1E0DE0248]();
}

uint64_t IOAccessoryManagerSelectEisPin()
{
  return MEMORY[0x1E0DE0250]();
}

uint64_t IOAccessoryManagerSetLDCM()
{
  return MEMORY[0x1E0DE0258]();
}

uint64_t IOAccessoryManagerSetVoltageDetected()
{
  return MEMORY[0x1E0DE0260]();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1E0CBAD20](*(_QWORD *)&kernelPort, notificationID);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD80](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD90](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1E0CBAE38](notifier);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0CBB6B0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x1E0CBB6C8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1E0CBB6F8](*(_QWORD *)&object);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB718](AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

uint64_t IOPMScheduleUserActivityLevelNotificationWithTimeout()
{
  return MEMORY[0x1E0CBB808]();
}

uint64_t IOPMUnregisterNotification()
{
  return MEMORY[0x1E0CBB840]();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1E0CBB8D8](refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x1E0CBB8F0](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1E0CBB958](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x1E0CBB988](*(_QWORD *)&entry, entryID);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x1E0CBB9B0](*(_QWORD *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1E0CBB9C0](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x1E0CBB9C8](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

double cabs(__complex_double a1)
{
  double result;

  MEMORY[0x1E0C81768]((__n128)a1, *(__n128 *)((char *)&a1 + 8));
  return result;
}

double carg(__complex_double a1)
{
  double result;

  MEMORY[0x1E0C81830]((__n128)a1, *(__n128 *)((char *)&a1 + 8));
  return result;
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
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

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

FFTSetupD vDSP_create_fftsetupD(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetupD)MEMORY[0x1E0C8C068](__Log2n, *(_QWORD *)&__Radix);
}

void vDSP_destroy_fftsetupD(FFTSetupD __setup)
{
  MEMORY[0x1E0C8C0A8](__setup);
}

void vDSP_fft_zripD(FFTSetupD __Setup, const DSPDoubleSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
  MEMORY[0x1E0C8C138](__Setup, __C, __IC, __Log2N, *(_QWORD *)&__Direction);
}

