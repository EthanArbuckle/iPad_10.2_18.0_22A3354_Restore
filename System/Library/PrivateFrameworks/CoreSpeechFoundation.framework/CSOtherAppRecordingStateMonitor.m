@implementation CSOtherAppRecordingStateMonitor

- (CSOtherAppRecordingStateMonitor)init
{
  CSOtherAppRecordingStateMonitor *v3;
  objc_super v5;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSOtherAppRecordingStateMonitor;
    self = -[CSEventMonitor init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  -[CSOtherAppRecordingStateMonitor _startObservingSystemControllerLifecycle](self, "_startObservingSystemControllerLifecycle", a3);
  -[CSOtherAppRecordingStateMonitor _startObservingOtherAppRecordingState](self, "_startObservingOtherAppRecordingState");
}

- (void)_stopMonitoring
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)handleOtherAppRecordingStateChange:(id)a3
{
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[CSOtherAppRecordingStateMonitor isOtherNonEligibleAppRecording](self, "isOtherNonEligibleAppRecording", a3))
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSOtherAppRecordingStateMonitor handleOtherAppRecordingStateChange:]";
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Another non eligible app is recording", buf, 0xCu);
    }
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__CSOtherAppRecordingStateMonitor_handleOtherAppRecordingStateChange___block_invoke;
  v5[3] = &unk_1E68810D0;
  v5[4] = self;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v5);
}

- (BOOL)isOtherNonEligibleAppRecording
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  pid_t v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  _BOOL4 v19;
  BOOL v20;
  void *v22;
  void *v23;
  char v25;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  audit_token_t atoken;
  audit_token_t buf;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", *MEMORY[0x1E0D480A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v22 = v3;
    v23 = v2;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v3;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v4)
    {
      v5 = v4;
      v25 = 0;
      v6 = *(_QWORD *)v29;
      v7 = (_QWORD *)MEMORY[0x1E0D480A8];
      v8 = (_QWORD *)MEMORY[0x1E0D48098];
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v29 != v6)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKey:", *v7, v22, v23);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", *v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            buf.val[0] = 136315650;
            *(_QWORD *)&buf.val[1] = "-[CSOtherAppRecordingStateMonitor isOtherNonEligibleAppRecording]";
            LOWORD(buf.val[3]) = 2112;
            *(_QWORD *)((char *)&buf.val[3] + 2) = v11;
            HIWORD(buf.val[5]) = 2112;
            *(_QWORD *)&buf.val[6] = v12;
            _os_log_impl(&dword_1B502E000, v13, OS_LOG_TYPE_DEFAULT, "%s SessionId: %@ AuditToken: %@", (uint8_t *)&buf, 0x20u);
          }
          if (v12)
          {
            memset(&buf, 0, sizeof(buf));
            +[CSUtils getTokenFromDictionary:withTokenKey:](CSUtils, "getTokenFromDictionary:withTokenKey:", v10, *v8);
            atoken = buf;
            v14 = audit_token_to_pid(&atoken);
            if (+[CSUtils processIdentifier](CSUtils, "processIdentifier") == v14)
            {
              v15 = CSLogContextFacilityCoreSpeech;
              if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
              {
                atoken.val[0] = 136315138;
                *(_QWORD *)&atoken.val[1] = "-[CSOtherAppRecordingStateMonitor isOtherNonEligibleAppRecording]";
                _os_log_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEFAULT, "%s Skip checking entitled as it is corespeechd pid", (uint8_t *)&atoken, 0xCu);
              }
            }
            else
            {
              v26 = v14;
              atoken = buf;
              v17 = -[CSOtherAppRecordingStateMonitor _isEntitledWithDecodedAuditToken:](self, "_isEntitledWithDecodedAuditToken:", &atoken);
              v18 = CSLogContextFacilityCoreSpeech;
              v19 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
              if (!v17)
              {
                if (v19)
                {
                  atoken.val[0] = 136315394;
                  *(_QWORD *)&atoken.val[1] = "-[CSOtherAppRecordingStateMonitor isOtherNonEligibleAppRecording]";
                  LOWORD(atoken.val[3]) = 2048;
                  *(_QWORD *)((char *)&atoken.val[3] + 2) = v26;
                  _os_log_impl(&dword_1B502E000, v18, OS_LOG_TYPE_DEFAULT, "%s Process %ld is not entitled!", (uint8_t *)&atoken, 0x16u);
                }

                v20 = 1;
                goto LABEL_28;
              }
              if (v19)
              {
                atoken.val[0] = 136315394;
                *(_QWORD *)&atoken.val[1] = "-[CSOtherAppRecordingStateMonitor isOtherNonEligibleAppRecording]";
                LOWORD(atoken.val[3]) = 2048;
                *(_QWORD *)((char *)&atoken.val[3] + 2) = v26;
                _os_log_impl(&dword_1B502E000, v18, OS_LOG_TYPE_DEFAULT, "%s Process %ld is entitled", (uint8_t *)&atoken, 0x16u);
              }
            }
          }
          else
          {
            v16 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              buf.val[0] = 136315138;
              *(_QWORD *)&buf.val[1] = "-[CSOtherAppRecordingStateMonitor isOtherNonEligibleAppRecording]";
              _os_log_impl(&dword_1B502E000, v16, OS_LOG_TYPE_DEFAULT, "%s There was no audit token", (uint8_t *)&buf, 0xCu);
            }
            v25 = 1;
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v5)
          continue;
        break;
      }
    }
    else
    {
      v25 = 0;
    }

    v20 = v25 & 1;
LABEL_28:
    v3 = v22;
    v2 = v23;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)_startObservingOtherAppRecordingState
{
  void *v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t *)MEMORY[0x1E0D480B8];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D480B8], 0);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:error:", v9, *MEMORY[0x1E0D48288], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *v4;
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleOtherAppRecordingStateChange_, v7, v8);

}

- (void)_systemControllerDied:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSOtherAppRecordingStateMonitor _systemControllerDied:]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[CSOtherAppRecordingStateMonitor _startObservingSystemControllerLifecycle](self, "_startObservingSystemControllerLifecycle");
  -[CSOtherAppRecordingStateMonitor _startObservingOtherAppRecordingState](self, "_startObservingOtherAppRecordingState");
  -[CSOtherAppRecordingStateMonitor handleOtherAppRecordingStateChange:](self, "handleOtherAppRecordingStateChange:", 0);

}

- (void)_startObservingSystemControllerLifecycle
{
  void *v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t *)MEMORY[0x1E0D48208];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D48208], 0);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:error:", v9, *MEMORY[0x1E0D48288], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *v4;
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__systemControllerDied_, v7, v8);

}

- (BOOL)_isEntitledWithDecodedAuditToken:(id *)a3
{
  __int128 v4;
  _BOOL4 v5;
  __int128 v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  _BYTE v12[32];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v12 = *(_OWORD *)a3->var0;
  *(_OWORD *)&v12[16] = v4;
  v5 = +[CSUtils checkEntitlementForToken:withEntitlement:](CSUtils, "checkEntitlementForToken:withEntitlement:", v12, CFSTR("com.apple.corespeech.supportheysiriwhenrecord"));
  v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v12 = *(_OWORD *)a3->var0;
  *(_OWORD *)&v12[16] = v6;
  if (+[CSUtils checkEntitlementForToken:withEntitlement:](CSUtils, "checkEntitlementForToken:withEntitlement:", v12, CFSTR("com.apple.corespeech.supportheysiriwhenrecord.sae")))
  {
    v7 = AFDeviceSupportsSystemAssistantExperience();
  }
  else
  {
    v7 = 0;
  }
  v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    *(_QWORD *)&v12[4] = "-[CSOtherAppRecordingStateMonitor _isEntitledWithDecodedAuditToken:]";
    if (v5)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    *(_DWORD *)v12 = 136315650;
    *(_QWORD *)&v12[14] = v10;
    *(_WORD *)&v12[12] = 2112;
    if (v7)
      v9 = CFSTR("YES");
    *(_WORD *)&v12[22] = 2112;
    *(_QWORD *)&v12[24] = v9;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s isGeneralEntilementEntiled: %@, isSAEEntitlementEntiledOnSAEDevice: %@", v12, 0x20u);
  }
  return v5 | v7;
}

uint64_t __70__CSOtherAppRecordingStateMonitor_handleOtherAppRecordingStateChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", a2);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11776 != -1)
    dispatch_once(&sharedInstance_onceToken_11776, &__block_literal_global_11777);
  return (id)sharedInstance_sharedInstance_11778;
}

void __49__CSOtherAppRecordingStateMonitor_sharedInstance__block_invoke()
{
  CSOtherAppRecordingStateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSOtherAppRecordingStateMonitor);
  v1 = (void *)sharedInstance_sharedInstance_11778;
  sharedInstance_sharedInstance_11778 = (uint64_t)v0;

}

@end
