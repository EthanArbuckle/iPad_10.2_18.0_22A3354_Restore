@implementation CSCarKitUtils

- (CSCarKitUtils)init
{
  CSCarKitUtils *v2;
  CSCarKitUtils *v3;
  CSCarKitUtils *v4;
  CSCarKitUtils *v5;
  CSCarKitUtils *v6;
  _QWORD block[4];
  CSCarKitUtils *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CSCarKitUtils;
  v2 = -[CSCarKitUtils init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __21__CSCarKitUtils_init__block_invoke;
    block[3] = &unk_1E6881138;
    v4 = v2;
    v5 = v4;
    v9 = v4;
    if (init_onceToken == -1)
    {
      v6 = v4;
    }
    else
    {
      dispatch_once(&init_onceToken, block);
      v6 = v9;
    }
    -[CSCarKitUtils _startObservingCarCapabilitiesNotfication:](v5, "_startObservingCarCapabilitiesNotfication:", CFSTR("CARSessionCarCapabilitiesReadyNotification"));
    -[CSCarKitUtils _startObservingCarCapabilitiesNotfication:](v5, "_startObservingCarCapabilitiesNotfication:", CFSTR("CARSessionCarCapabilitiesUpdatedNotification"));

  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSCarKitUtils dealloc]";
    _os_log_debug_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)CSCarKitUtils;
  -[CSCarKitUtils dealloc](&v5, sel_dealloc);
}

- (void)_startObservingCarCapabilitiesNotfication:(const __CFString *)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)CRSessionStatusCapabilitiesUpdatedNotificationCallback, a3, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)handleHeadUnitConnectedWithAsyncCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315138;
    v7 = "-[CSCarKitUtils handleHeadUnitConnectedWithAsyncCompletion:]";
    _os_log_debug_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  -[CSCarKitUtils _recacheCarPlayCapabilitiesWithCompletion:](self, "_recacheCarPlayCapabilitiesWithCompletion:", v4);

}

- (void)handleCarCapabilitiesUpdatedWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315138;
    v7 = "-[CSCarKitUtils handleCarCapabilitiesUpdatedWithCompletion:]";
    _os_log_debug_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  -[CSCarKitUtils _recacheCarPlayCapabilitiesWithCompletion:](self, "_recacheCarPlayCapabilitiesWithCompletion:", v4);

}

- (void)_fetchCarCapabilitiesInBackgroundWithCompletion:(id)a3
{
  id v4;
  dispatch_time_t v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = -[CSCarKitUtils _delayBecauseCarKitSendsNotificationBeforeCapabilitiesActuallyReady](self, "_delayBecauseCarKitSendsNotificationBeforeCapabilitiesActuallyReady");
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__CSCarKitUtils__fetchCarCapabilitiesInBackgroundWithCompletion___block_invoke;
  v8[3] = &unk_1E6881160;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_after(v5, queue, v8);

}

- (unint64_t)_delayBecauseCarKitSendsNotificationBeforeCapabilitiesActuallyReady
{
  return dispatch_time(0, 20000000);
}

- (void)_invalidateCachedCarPlayCapabilities
{
  NSObject *v3;
  NSDictionary *carPlayCapabilitiesDict;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[CSCarKitUtils _invalidateCachedCarPlayCapabilities]";
    _os_log_debug_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  os_unfair_lock_lock(&self->_carCapabilitiesLock);
  carPlayCapabilitiesDict = self->_carPlayCapabilitiesDict;
  self->_carPlayCapabilitiesDict = 0;

  os_unfair_lock_unlock(&self->_carCapabilitiesLock);
}

- (void)_recacheCarPlayCapabilitiesWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  -[CSCarKitUtils _invalidateCachedCarPlayCapabilities](self, "_invalidateCachedCarPlayCapabilities");
  -[CSCarKitUtils _fetchCarCapabilitiesInBackgroundWithCompletion:](self, "_fetchCarCapabilitiesInBackgroundWithCompletion:", v4);

}

- (BOOL)isCarPlayConnected
{
  void *v2;
  char v3;

  +[CSAudioRouteChangeMonitor sharedInstance](CSAudioRouteChangeMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "carPlayConnected");

  return v3;
}

- (id)potentiallyAddHWLatencyToOption:(id)a3 streamHandle:(unint64_t)a4 voiceController:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _BOOL4 v11;
  NSObject *v12;
  const char *v13;
  id v14;
  void *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  int v20;
  float v21;
  double v22;
  void *v23;
  char v24;
  NSObject *v25;
  _BOOL4 v26;
  const char *v27;
  const char *v28;
  _BYTE v29[22];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!+[CSUtils supportEarconRemoval](CSUtils, "supportEarconRemoval"))
  {
    v12 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
      goto LABEL_15;
    *(_DWORD *)v29 = 136315138;
    *(_QWORD *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
    v13 = "%s Earcon removal feature flag disabled. Not adjusting latency from CS layer.";
LABEL_14:
    _os_log_debug_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEBUG, v13, v29, 0xCu);
    goto LABEL_15;
  }
  if (!-[CSCarKitUtils isCarPlayConnected](self, "isCarPlayConnected"))
  {
    v12 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
      goto LABEL_15;
    *(_DWORD *)v29 = 136315138;
    *(_QWORD *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
    v13 = "%s Not CarPlay. Not adjusting latency from CS layer.";
    goto LABEL_14;
  }
  v10 = objc_msgSend(v8, "startAlertBehavior");
  if (+[CSUtils supportStateFeedback](CSUtils, "supportStateFeedback"))
  {
    v11 = objc_msgSend(v8, "startAlertBehavior") != 1;
    if (!v10)
    {
LABEL_17:
      -[CSCarKitUtils _latencyCorrectionSecondsForHeadUnit](self, "_latencyCorrectionSecondsForHeadUnit");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v29 = 136315394;
        *(_QWORD *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
        *(_WORD *)&v29[12] = 2112;
        *(_QWORD *)&v29[14] = v16;
        _os_log_debug_impl(&dword_1B502E000, v17, OS_LOG_TYPE_DEBUG, "%s CarCapabilities latencyCorrectionSeconds: %@", v29, 0x16u);
        v17 = CSLogContextFacilityCoreSpeech;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v29 = 136315394;
        *(_QWORD *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
        *(_WORD *)&v29[12] = 1024;
        *(_DWORD *)&v29[14] = v16 != 0;
        _os_log_debug_impl(&dword_1B502E000, v17, OS_LOG_TYPE_DEBUG, "%s trackedHeadUnit: %d", v29, 0x12u);
      }
      v14 = (id)objc_msgSend(v8, "copy");
      if (v16 && -[CSCarKitUtils _isValidLatencyCorrectionValue:](self, "_isValidLatencyCorrectionValue:", v16))
        v18 = objc_msgSend(v16, "isEqualToNumber:", &unk_1E68A16D8) ^ 1;
      else
        v18 = 0;
      v19 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v29 = 136315394;
        *(_QWORD *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
        *(_WORD *)&v29[12] = 1024;
        *(_DWORD *)&v29[14] = v18;
        _os_log_debug_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEBUG, "%s correctableHeadUnit: %d", v29, 0x12u);
      }
      if (v16)
        v20 = v18;
      else
        v20 = 1;
      if (v20 == 1)
      {
        objc_msgSend(v16, "floatValue");
        v22 = v21;
        +[CSHardwareLatencyHelper sharedInstance](CSHardwareLatencyHelper, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "addHWLatencyToOption:withCorrection:streamHandle:voiceController:", v8, a4, v9, v22);

        if ((v24 & 1) != 0)
        {
LABEL_39:

          goto LABEL_16;
        }
        v25 = CSLogContextFacilityCoreSpeech;
        v26 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
        if (!v18)
        {
          if (v16)
          {
            if (!v26)
              goto LABEL_39;
            *(_DWORD *)v29 = 136315138;
            *(_QWORD *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
            v28 = "%s HeadUnit is recognized as having problematic latencies, but didn't have a correction, and also fail"
                  "ed to add AVF latencies";
          }
          else
          {
            if (!v26)
              goto LABEL_39;
            *(_DWORD *)v29 = 136315138;
            *(_QWORD *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
            v28 = "%s HeadUnit is not recognized as having problematic latencies, but we failed to add AVF latencies";
          }
          _os_log_impl(&dword_1B502E000, v25, OS_LOG_TYPE_DEFAULT, v28, v29, 0xCu);
          goto LABEL_39;
        }
        if (v26)
        {
          *(_DWORD *)v29 = 136315138;
          *(_QWORD *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
          v27 = "%s HeadUnit is recognized as having problematic latencies, correction is available but failed to add AVF"
                " latencies. Adding earcon.";
LABEL_37:
          _os_log_impl(&dword_1B502E000, v25, OS_LOG_TYPE_DEFAULT, v27, v29, 0xCu);
        }
      }
      else
      {
        v25 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v29 = 136315138;
          *(_QWORD *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
          v27 = "%s HeadUnit is recognized as having problematic latencies, but no correction available. Adding earcon.";
          goto LABEL_37;
        }
      }
      objc_msgSend(v14, "setStartAlertBehavior:", 2, *(_OWORD *)v29);
      goto LABEL_39;
    }
  }
  else
  {
    v11 = 1;
    if (!v10)
      goto LABEL_17;
  }
  if (!v11)
    goto LABEL_17;
  v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v29 = 136315138;
    *(_QWORD *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
    v13 = "%s Alert behavior is either not Muted or is not Haptic with State Feedback enabled. Not adjusting latency from CS layer.";
    goto LABEL_14;
  }
LABEL_15:
  v14 = v8;
LABEL_16:

  return v14;
}

- (BOOL)_isValidLatencyCorrectionValue:(id)a3
{
  id v3;
  char isKindOfClass;

  if (a3)
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)_updateCarPlayCapabilitiesDict
{
  os_unfair_lock_s *p_carCapabilitiesLock;
  NSDictionary *v4;
  NSObject *v5;
  NSDictionary *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSDictionary *carPlayCapabilitiesDict;
  NSDictionary *v10;
  int v11;
  const char *v12;
  __int16 v13;
  NSDictionary *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_carCapabilitiesLock = &self->_carCapabilitiesLock;
  os_unfair_lock_lock(&self->_carCapabilitiesLock);
  v4 = self->_carPlayCapabilitiesDict;
  os_unfair_lock_unlock(p_carCapabilitiesLock);
  if (v4)
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315394;
      v12 = "-[CSCarKitUtils _updateCarPlayCapabilitiesDict]";
      v13 = 2112;
      v14 = v4;
      _os_log_debug_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEBUG, "%s Using cached CarPlayCapabilities: %@", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    -[CSCarKitUtils _fetchCarCapabilitiesDict](self, "_fetchCarCapabilitiesDict");
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = CSLogContextFacilityCoreSpeech;
    v8 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v8)
      {
        v11 = 136315394;
        v12 = "-[CSCarKitUtils _updateCarPlayCapabilitiesDict]";
        v13 = 2112;
        v14 = v6;
        _os_log_debug_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEBUG, "%s Caching CarPlayCapabilities dictionary: %@", (uint8_t *)&v11, 0x16u);
      }
      os_unfair_lock_lock(p_carCapabilitiesLock);
      carPlayCapabilitiesDict = self->_carPlayCapabilitiesDict;
      self->_carPlayCapabilitiesDict = v6;
      v10 = v6;

      os_unfair_lock_unlock(p_carCapabilitiesLock);
    }
    else if (v8)
    {
      v11 = 136315138;
      v12 = "-[CSCarKitUtils _updateCarPlayCapabilitiesDict]";
      _os_log_debug_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEBUG, "%s CRFetchCarPlayCapabilities returned nil", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (id)_latencyCorrectionSecondsForHeadUnit
{
  return -[CSCarKitUtils _userInfoValueForKey:](self, "_userInfoValueForKey:", CFSTR("latencyCorrectionSeconds"));
}

- (BOOL)isBargeInDisabledForConnectedVehicle
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[CSCarKitUtils isCarPlayConnected](self, "isCarPlayConnected");
  if (v3)
  {
    -[CSCarKitUtils _userInfoValueForKey:](self, "_userInfoValueForKey:", CFSTR("disableBargeInRequest"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      -[CSCarKitUtils _userInfoValueForKey:](self, "_userInfoValueForKey:", CFSTR("disableFlexibleFollowup"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = objc_msgSend(v4, "BOOLValue");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)_userInfoValueForKey:(id)a3
{
  id v4;
  os_unfair_lock_s *p_carCapabilitiesLock;
  NSDictionary *v6;
  NSDictionary *carPlayCapabilitiesDict;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _BYTE buf[24];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_carCapabilitiesLock = &self->_carCapabilitiesLock;
  os_unfair_lock_lock(&self->_carCapabilitiesLock);
  v6 = self->_carPlayCapabilitiesDict;
  os_unfair_lock_unlock(&self->_carCapabilitiesLock);
  if (v6)
  {
    os_unfair_lock_lock(&self->_carCapabilitiesLock);
    carPlayCapabilitiesDict = self->_carPlayCapabilitiesDict;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v8 = (id *)getCRCapabilitiesUserInfoKeySymbolLoc_ptr;
    v18 = getCRCapabilitiesUserInfoKeySymbolLoc_ptr;
    if (!getCRCapabilitiesUserInfoKeySymbolLoc_ptr)
    {
      v9 = (void *)CarKitLibrary();
      v8 = (id *)dlsym(v9, "CRCapabilitiesUserInfoKey");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v8;
      getCRCapabilitiesUserInfoKeySymbolLoc_ptr = (uint64_t)v8;
    }
    _Block_object_dispose(buf, 8);
    if (!v8)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
    v10 = *v8;
    -[NSDictionary objectForKey:](carPlayCapabilitiesDict, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_carCapabilitiesLock);
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v11, "objectForKey:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[CSCarKitUtils _userInfoValueForKey:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        v18 = (uint64_t)v4;
        _os_log_debug_impl(&dword_1B502E000, v13, OS_LOG_TYPE_DEBUG, "%s returning %@ for key=%@.", buf, 0x20u);
      }
    }
    else
    {
      v14 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[CSCarKitUtils _userInfoValueForKey:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2112;
        v18 = (uint64_t)v4;
        _os_log_debug_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEBUG, "%s CarPlayCapabilities userInfo returned bad value: %@; returning nil for key=%@.",
          buf,
          0x20u);
      }
      v12 = 0;
    }

  }
  else
  {
    v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSCarKitUtils _userInfoValueForKey:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      _os_log_debug_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEBUG, "%s carPlayCapabilitiesDict is nil, background fetching and returning nil immediately for key=%@.", buf, 0x16u);
    }
    -[CSCarKitUtils _fetchCarCapabilitiesInBackgroundWithCompletion:](self, "_fetchCarCapabilitiesInBackgroundWithCompletion:", 0);
    v12 = 0;
  }

  return v12;
}

- (id)_fetchCarCapabilitiesDict
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1245;
  v9 = __Block_byref_object_dispose__1246;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__CSCarKitUtils__fetchCarCapabilitiesDict__block_invoke;
  v4[3] = &unk_1E6880290;
  v4[4] = &v5;
  +[CSUtils withElapsedTimeLogging:execute:](CSUtils, "withElapsedTimeLogging:execute:", CFSTR("CRFetchCarPlayCapabilities"), v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (NSDictionary)carPlayCapabilitiesDict
{
  return self->_carPlayCapabilitiesDict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carPlayCapabilitiesDict, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __42__CSCarKitUtils__fetchCarCapabilitiesDict__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t v11;
  __int128 buf;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__CSCarKitUtils__fetchCarCapabilitiesDict__block_invoke_2;
  v9[3] = &unk_1E687EA80;
  v11 = *(_QWORD *)(a1 + 32);
  v3 = v2;
  v10 = v3;
  v4 = v9;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v13 = 0x2020000000;
  v5 = getCRFetchCarPlayCapabilitiesSymbolLoc_ptr;
  v14 = getCRFetchCarPlayCapabilitiesSymbolLoc_ptr;
  if (!getCRFetchCarPlayCapabilitiesSymbolLoc_ptr)
  {
    v6 = (void *)CarKitLibrary();
    v5 = dlsym(v6, "CRFetchCarPlayCapabilities");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v5;
    getCRFetchCarPlayCapabilitiesSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&buf, 8);
  if (!v5)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  ((void (*)(_QWORD *))v5)(v4);

  v7 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v3, v7))
  {
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[CSCarKitUtils _fetchCarCapabilitiesDict]_block_invoke";
      _os_log_error_impl(&dword_1B502E000, v8, OS_LOG_TYPE_ERROR, "%s CarKit CRFetchCarPlayCapabilities timed out", (uint8_t *)&buf, 0xCu);
    }
  }

}

void __42__CSCarKitUtils__fetchCarCapabilitiesDict__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[CSCarKitUtils _fetchCarCapabilitiesDict]_block_invoke_2";
      v13 = 2112;
      v14 = v6;
      _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s Error in CRFetchCarPlayCapabilities: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __65__CSCarKitUtils__fetchCarCapabilitiesInBackgroundWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateCarPlayCapabilitiesDict");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __21__CSCarKitUtils_init__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  uint64_t v3;
  void *v4;

  v2 = dispatch_queue_create("com.apple.CoreSpeech.CSCarKitUtilsQueue", 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1278 != -1)
    dispatch_once(&sharedInstance_onceToken_1278, &__block_literal_global_1279);
  return (id)sharedInstance_singleton;
}

void __31__CSCarKitUtils_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = v0;

  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315394;
    v4 = "+[CSCarKitUtils sharedInstance]_block_invoke";
    v5 = 2112;
    v6 = sharedInstance_singleton;
    _os_log_debug_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEBUG, "%s Created shared instance: %@", (uint8_t *)&v3, 0x16u);
  }
}

@end
