@implementation AVCaptureDevice

uint64_t __62__AVCaptureDevice__devicesWithDeviceTypes_mediaType_position___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

+ (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v14;
  objc_super v15;
  os_log_type_t v16;
  os_log_type_t type[4];
  CFTypeRef cf;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setupKVOLoggingOnce");
  if (sDetailedKVOOverrideLogging)
  {
    if (dword_1ECFED700)
    {
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    cf = 0;
    if (FigCopyBacktrace() >= 1 && cf != 0 && dword_1ECFED700 != 0)
    {
      *(_DWORD *)type = 0;
      v16 = OS_LOG_TYPE_DEFAULT;
      v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___AVCaptureDevice;
  objc_msgSendSuper2(&v15, sel_addObserver_forKeyPath_options_context_, a3, a4, a5, a6);
}

+ (void)setupKVOLoggingOnce
{
  if (setupKVOLoggingOnce_onceToken != -1)
    dispatch_once(&setupKVOLoggingOnce_onceToken, &__block_literal_global_9);
}

- (id)initSubclass
{
  AVCaptureDevice *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureDevice;
  v2 = -[AVCaptureDevice init](&v4, sel_init);
  if (v2)
  {
    v2->_internal = objc_alloc_init(AVCaptureDeviceInternal);
    if ((AVCaptureIsRunningInMediaserverd() & 1) == 0)
      +[AVCaptureDevice _registerOnceForServerConnectionDiedNotification](AVCaptureDevice, "_registerOnceForServerConnectionDiedNotification");
    +[AVCaptureDevice setUpReactionEffectsStateOnce](AVCaptureDevice, "setUpReactionEffectsStateOnce");
  }
  return v2;
}

+ (void)setUpReactionEffectsStateOnce
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVCaptureDevice_setUpReactionEffectsStateOnce__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = a1;
  if (setUpReactionEffectsStateOnce_onceToken != -1)
    dispatch_once(&setUpReactionEffectsStateOnce_onceToken, block);
}

+ (void)_registerOnceForServerConnectionDiedNotification
{
  JUMPOUT(0x1A1AF12B0);
}

uint64_t __78__AVCaptureDevice__filterConnectedDevices_withDeviceTypes_mediaType_position___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "isConnected")
    && (!*(_QWORD *)(a1 + 48) || objc_msgSend(a2, "position") == *(_QWORD *)(a1 + 48))
    && (!*(_QWORD *)(a1 + 32) || objc_msgSend(a2, "hasMediaType:")))
  {
    return objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(a2, "deviceType"));
  }
  else
  {
    return 0;
  }
}

- (AVCaptureDevicePosition)position
{
  return 0;
}

- (BOOL)isSoonToBeDisconnected
{
  return 0;
}

- (BOOL)wideAngleCameraSourcesFromUltraWide
{
  return 0;
}

+ (AVCaptureDevice)defaultDeviceWithMediaType:(AVMediaType)mediaType
{
  uint64_t v5;

  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
    return (AVCaptureDevice *)(id)objc_msgSend((id)objc_msgSend(a1, "_legacyDevicesWithMediaType:", mediaType), "firstObject");
  else
    return 0;
}

+ (id)_devicesWithDeviceTypes:(id)a3 mediaType:(id)a4 position:(int64_t)a5
{
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v9 = objc_opt_class();
  if (v9 != objc_opt_class())
    return (id)MEMORY[0x1E0C9AA60];
  v11 = +[AVCaptureDeviceDiscoverySession allDeviceTypes](AVCaptureDeviceDiscoverySession, "allDeviceTypes");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__AVCaptureDevice__devicesWithDeviceTypes_mediaType_position___block_invoke;
  v15[3] = &unk_1E4216F58;
  v15[4] = v11;
  v12 = (void *)objc_msgSend(a3, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v15));
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", +[AVCaptureDeviceDiscoverySession allVideoDeviceTypes](AVCaptureDeviceDiscoverySession, "allVideoDeviceTypes"));
  objc_msgSend(v13, "addObject:", CFSTR("AVCaptureDeviceTypeBuiltInTimeOfFlightCamera"));
  objc_msgSend(v13, "addObjectsFromArray:", +[AVCaptureDeviceDiscoverySession allMetadataCameraDeviceTypes](AVCaptureDeviceDiscoverySession, "allMetadataCameraDeviceTypes"));
  if (objc_msgSend(v13, "intersectsSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12)))
  {
    -[objc_class _setUpCameraHistoryOnce](NSClassFromString(CFSTR("AVCaptureFigVideoDevice")), "_setUpCameraHistoryOnce");
    _registerVideoDevicesOnce();
  }
  if (objc_msgSend(v12, "containsObject:", CFSTR("AVCaptureDeviceTypeMicrophone")))
    _registerAudioDevicesOnce();
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  os_unfair_lock_lock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
  objc_msgSend(v10, "addObjectsFromArray:", sRegisteredVideoDevices);
  os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
  os_unfair_lock_lock((os_unfair_lock_t)&sRegisterAudioDevicesLock);
  objc_msgSend(v10, "addObjectsFromArray:", sRegisteredAudioDevices);
  os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterAudioDevicesLock);
  objc_msgSend(a1, "_filterConnectedDevices:withDeviceTypes:mediaType:position:", v10, v12, a4, a5);
  return v10;
}

+ (void)_filterConnectedDevices:(id)a3 withDeviceTypes:(id)a4 mediaType:(id)a5 position:(int64_t)a6
{
  int BoolAnswer;
  uint64_t v11;
  _QWORD v12[5];
  char v13;
  _QWORD v14[7];

  BoolAnswer = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureDevicesShouldBeSortedByDeviceType"));
  v11 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__AVCaptureDevice__filterConnectedDevices_withDeviceTypes_mediaType_position___block_invoke;
  v14[3] = &unk_1E4216F08;
  v14[5] = a4;
  v14[6] = a6;
  v14[4] = a5;
  objc_msgSend(a3, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v14));
  if (BoolAnswer)
  {
    v12[0] = v11;
    v12[1] = 3221225472;
    v12[2] = __78__AVCaptureDevice__filterConnectedDevices_withDeviceTypes_mediaType_position___block_invoke_2;
    v12[3] = &unk_1E4216F30;
    v13 = 1;
    v12[4] = a4;
    objc_msgSend(a3, "sortUsingComparator:", v12);
  }
}

+ (id)_legacyDevicesWithMediaType:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t *v7;
  os_unfair_lock_s *v8;

  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (objc_msgSend(a3, "isEqual:", *MEMORY[0x1E0CF2B90]))
    {
      -[objc_class _setUpCameraHistoryOnce](NSClassFromString(CFSTR("AVCaptureFigVideoDevice")), "_setUpCameraHistoryOnce");
      _registerVideoDevicesOnce();
      v7 = &sRegisteredVideoDevices;
      v8 = (os_unfair_lock_s *)&sRegisterVideoDevicesLock;
    }
    else
    {
      if (!objc_msgSend(a3, "isEqual:", *MEMORY[0x1E0CF2B68]))
      {
        v6 = 0;
        goto LABEL_9;
      }
      _registerAudioDevicesOnce();
      v7 = &sRegisteredAudioDevices;
      v8 = (os_unfair_lock_s *)&sRegisterAudioDevicesLock;
    }
    os_unfair_lock_lock(v8);
    v6 = (id)objc_msgSend((id)*v7, "mutableCopy");
    os_unfair_lock_unlock(v8);
LABEL_9:
    objc_msgSend(a1, "_filterConnectedLegacyDevices:", v6);
    return v6;
  }
  return (id)MEMORY[0x1E0C9AA60];
}

+ (void)_filterConnectedLegacyDevices:(id)a3
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera");
  v3[1] = CFSTR("AVCaptureDeviceTypeMicrophone");
  objc_msgSend(a1, "_filterConnectedDevices:withDeviceTypes:mediaType:position:", a3, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2), 0, 0);
}

- (BOOL)isLockedForConfiguration
{
  return self->_internal->configLockRefCount > 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVCaptureDevice debugDescription](self, "debugDescription"));
}

- (id)debugDescription
{
  const __CFString *v3;

  if (-[AVCaptureDevice isProxyDevice](self, "isProxyDevice"))
    v3 = CFSTR("(PROXY)");
  else
    v3 = &stru_1E421DB28;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@[%@][%@]"), v3, -[AVCaptureDevice localizedName](self, "localizedName"), -[AVCaptureDevice uniqueID](self, "uniqueID"));
}

+ (BOOL)isEligibleForStudioLighting
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AVCaptureDevice_isEligibleForStudioLighting__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = a1;
  if (isEligibleForStudioLighting_onceToken != -1)
    dispatch_once(&isEligibleForStudioLighting_onceToken, block);
  return isEligibleForStudioLighting_sIsEligibleForStudioLighting;
}

+ (BOOL)isEligibleForBackgroundBlur
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AVCaptureDevice_isEligibleForBackgroundBlur__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = a1;
  if (isEligibleForBackgroundBlur_onceToken != -1)
    dispatch_once(&isEligibleForBackgroundBlur_onceToken, block);
  return isEligibleForBackgroundBlur_sIsEligibleForBackgroundBlur;
}

uint64_t __78__AVCaptureDevice__filterConnectedDevices_withDeviceTypes_mediaType_position___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  uint64_t result;
  void *v8;

  if (!*(_BYTE *)(a1 + 40)
    || (v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", objc_msgSend(a2, "deviceType"))), (result = objc_msgSend(v6, "compare:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", objc_msgSend(a3, "deviceType"))))) == 0))
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "position"));
    return objc_msgSend(v8, "compare:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "position")));
  }
  return result;
}

+ (AVCaptureDevice)systemPreferredCamera
{
  return (AVCaptureDevice *)-[objc_class systemPreferredCamera](NSClassFromString(CFSTR("AVCaptureFigVideoDevice")), "systemPreferredCamera");
}

+ (void)willChangeValueForKey:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v8;
  objc_super v9;
  os_log_type_t v10;
  os_log_type_t type[4];
  CFTypeRef cf;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setupKVOLoggingOnce");
  if (sDetailedKVOOverrideLogging)
  {
    if (dword_1ECFED700)
    {
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    cf = 0;
    if (FigCopyBacktrace() >= 1 && cf != 0 && dword_1ECFED700 != 0)
    {
      *(_DWORD *)type = 0;
      v10 = OS_LOG_TYPE_DEFAULT;
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___AVCaptureDevice;
  objc_msgSendSuper2(&v9, sel_willChangeValueForKey_, a3);
}

+ (void)didChangeValueForKey:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v8;
  objc_super v9;
  os_log_type_t v10;
  os_log_type_t type[4];
  CFTypeRef cf;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setupKVOLoggingOnce");
  if (sDetailedKVOOverrideLogging)
  {
    if (dword_1ECFED700)
    {
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    cf = 0;
    if (FigCopyBacktrace() >= 1 && cf != 0 && dword_1ECFED700 != 0)
    {
      *(_DWORD *)type = 0;
      v10 = OS_LOG_TYPE_DEFAULT;
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___AVCaptureDevice;
  objc_msgSendSuper2(&v9, sel_didChangeValueForKey_, a3);
}

+ (id)devicesForDefaultDeviceSupport:(BOOL)a3 includeAudioDevices:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t v7;
  id v8;

  v4 = a4;
  v5 = a3;
  v7 = objc_opt_class();
  if (v7 != objc_opt_class())
    return (id)MEMORY[0x1E0C9AA60];
  -[objc_class _setUpCameraHistoryOnce](NSClassFromString(CFSTR("AVCaptureFigVideoDevice")), "_setUpCameraHistoryOnce");
  _registerVideoDevicesOnce();
  os_unfair_lock_lock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
  v8 = (id)objc_msgSend((id)sRegisteredVideoDevices, "mutableCopy");
  os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
  if (v4)
  {
    _registerAudioDevicesOnce();
    os_unfair_lock_lock((os_unfair_lock_t)&sRegisterAudioDevicesLock);
    objc_msgSend(v8, "addObjectsFromArray:", sRegisteredAudioDevices);
    os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterAudioDevicesLock);
  }
  if (v5)
    objc_msgSend(a1, "_filterConnectedLegacyDevices:", v8);
  return v8;
}

- (AVCaptureDeviceFormat)activeFormat
{
  return 0;
}

+ (AVAuthorizationStatus)authorizationStatusForMediaType:(AVMediaType)mediaType
{
  uint64_t v4;
  uint64_t *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v10;

  if (-[NSString isEqualToString:](mediaType, "isEqualToString:", *MEMORY[0x1E0CF2B68]))
  {
    v4 = 0;
    v5 = (uint64_t *)MEMORY[0x1E0DB1168];
LABEL_7:
    v7 = *v5;
    goto LABEL_8;
  }
  if (-[NSString isEqualToString:](mediaType, "isEqualToString:", *MEMORY[0x1E0CF2B90])
    || -[NSString isEqualToString:](mediaType, "isEqualToString:", CFSTR("pcld")))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    if (objc_msgSend(v6, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F88]) == 2)
      return 1;
    v4 = 0;
    v5 = (uint64_t *)MEMORY[0x1E0DB10F0];
    goto LABEL_7;
  }
  if (!-[NSString isEqualToString:](mediaType, "isEqualToString:", *MEMORY[0x1E0CF2B80]))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, mediaType);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v10);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v10);
    return 2;
  }
  v7 = 0;
  v4 = AVCaptureEntitlementMetadataCameras;
LABEL_8:
  if (!(v7 | v4))
    return 2;
  if (!v7)
  {
    if (!v4 || (AVCaptureClientHasEntitlement((void *)v4) & 1) == 0)
      goto LABEL_21;
    return 3;
  }
  FigCaptureGetTCCServer();
  v8 = FigCaptureTCCAccessPreflight();
  if (!v8)
    return 3;
  if (v8 != 1)
  {
    if (v8 == 2)
      return (unint64_t)(TCCAccessRestricted() != 0);
    goto LABEL_21;
  }
  if (TCCAccessRestricted())
    return 1;
LABEL_21:
  if (AVCaptureIsRunningInXCTest())
    return 3;
  else
    return 2;
}

- (BOOL)isVirtualDevice
{
  return objc_msgSend(+[AVCaptureDeviceDiscoverySession allVirtualDeviceTypes](AVCaptureDeviceDiscoverySession, "allVirtualDeviceTypes"), "containsObject:", -[AVCaptureDevice deviceType](self, "deviceType"));
}

+ (BOOL)reactionEffectsEnabled
{
  char v2;

  objc_msgSend(a1, "setUpReactionEffectsStateOnce");
  os_unfair_lock_lock(&sReactionsLock);
  v2 = sReactionsEnabled;
  os_unfair_lock_unlock(&sReactionsLock);
  return v2;
}

+ (BOOL)isStudioLightEnabled
{
  char v2;

  objc_msgSend(a1, "setUpStudioLightingStateOnce");
  os_unfair_lock_lock(&sBackgroundBlurLock);
  v2 = sStudioLightingEnabled;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  return v2;
}

+ (BOOL)isPortraitEffectEnabled
{
  char v2;

  objc_msgSend(a1, "setUpBackgroundBlurStateOnce");
  os_unfair_lock_lock(&sBackgroundBlurLock);
  v2 = sBackgroundBlurEnabled;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  return v2;
}

+ (BOOL)isEligibleForReactionEffects
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVCaptureDevice_isEligibleForReactionEffects__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = a1;
  if (isEligibleForReactionEffects_onceToken != -1)
    dispatch_once(&isEligibleForReactionEffects_onceToken, block);
  return isEligibleForReactionEffects_sIsEligibleForReactionEffects;
}

+ (BOOL)isCenterStageEnabled
{
  char v2;

  objc_msgSend(a1, "setUpCenterStageStateOnce");
  os_unfair_lock_lock(&sCenterStageLock);
  v2 = sCenterStageEnabled;
  os_unfair_lock_unlock(&sCenterStageLock);
  return v2;
}

uint64_t __48__AVCaptureDevice_setUpReactionEffectsStateOnce__block_invoke()
{
  __CFString *v0;
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  _BOOL8 v5;
  uint64_t v6;
  id v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __CFString *v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[11];

  v13[8] = *MEMORY[0x1E0C80C00];
  v13[0] = AVCaptureReactionTypeThumbsUp;
  v13[1] = AVCaptureReactionTypeThumbsDown;
  v13[2] = AVCaptureReactionTypeBalloons;
  v13[3] = AVCaptureReactionTypeHeart;
  v13[4] = AVCaptureReactionTypeFireworks;
  v13[5] = AVCaptureReactionTypeRain;
  v13[6] = AVCaptureReactionTypeConfetti;
  v13[7] = AVCaptureReactionTypeLasers;
  sAvailableReactions = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 8));
  v0 = AVCaptureClientPreferencesDomain();
  sReactionsEnabledKey = (uint64_t)(id)AVControlCenterVideoEffectsReactionsEnabledPreferenceKey(v0);
  v1 = AVCaptureClientPreferencesDomain();
  sGesturesEnabledKey = (uint64_t)(id)AVControlCenterVideoEffectsGesturesEnabledPreferenceKey(v1);
  v2 = AVCaptureClientPreferencesDomain();
  sReactionsUnavailableReasonsKey = (uint64_t)(id)AVControlCenterVideoEffectsReactionsUnavailableReasonsPreferenceKey(v2);
  v3 = AVCaptureClientPreferencesDomain();
  AVControlCenterVideoEffectsReactionsTriggeredPreferenceKey(v3);
  v4 = AVCaptureClientPreferencesDomain();
  AVControlCenterVideoEffectsReactionsInProgressPreferenceKey(v4);
  v5 = +[AVCaptureDevice reactionEffectsEnabledDefault](AVCaptureDevice, "reactionEffectsEnabledDefault");
  sReactionsEnabled = v5;
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v6, sReactionsEnabledKey);
  v7 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", sGesturesEnabledKey);
  sGesturesEnabled = +[AVCaptureDevice reactionEffectGesturesEnabledDefault](AVCaptureDevice, "reactionEffectGesturesEnabledDefault");
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (dword_1ECFED700)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    sGesturesEnabled = objc_msgSend(v7, "BOOLValue", v11, v12);
  }
  else
  {
    v9 = AVCaptureClientPreferencesDomain();
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", sGesturesEnabled), AVControlCenterVideoEffectsGesturesEnabledDefaultPreferenceKey(v9));
  }
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  return +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
}

+ (void)setControlCenterVideoEffectUnavailableReasonsForVideoEffect:(id)a3 reasons:(unint64_t)a4
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectCenterStage")))
  {
    objc_msgSend(a1, "setUpCenterStageStateOnce");
    v7 = &sCenterStageUnavailableReasonsKey;
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundBlur")))
  {
    objc_msgSend(a1, "setUpBackgroundBlurStateOnce");
    v7 = &sBackgroundBlurUnavailableReasonsKey;
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectStudioLighting")))
  {
    objc_msgSend(a1, "setUpStudioLightingStateOnce");
    v7 = &sStudioLightingUnavailableReasonsKey;
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectReactions"))
         || objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectGestures")))
  {
    objc_msgSend(a1, "setUpReactionEffectsStateOnce");
    v7 = &sReactionsUnavailableReasonsKey;
  }
  else
  {
    if (!objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundReplacement")))
      return;
    objc_msgSend(a1, "setUpBackgroundReplacementStateOnce");
    v7 = &sBackgroundReplacementUnavailableReasonsKey;
  }
  v8 = *v7;
  if (*v7
    && objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", *v7), "unsignedIntegerValue") != a4)
  {
    if (a4)
      v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    else
      v9 = 0;
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v9, v8);
  }
}

+ (void)setUpStudioLightingStateOnce
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVCaptureDevice_setUpStudioLightingStateOnce__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = a1;
  if (setUpStudioLightingStateOnce_onceToken != -1)
    dispatch_once(&setUpStudioLightingStateOnce_onceToken, block);
}

+ (void)setUpBackgroundBlurStateOnce
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVCaptureDevice_setUpBackgroundBlurStateOnce__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = a1;
  if (setUpBackgroundBlurStateOnce_onceToken != -1)
    dispatch_once(&setUpBackgroundBlurStateOnce_onceToken, block);
}

+ (void)setUpCenterStageStateOnce
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AVCaptureDevice_setUpCenterStageStateOnce__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = a1;
  if (setUpCenterStageStateOnce_onceToken != -1)
    dispatch_once(&setUpCenterStageStateOnce_onceToken, block);
}

+ (BOOL)reactionEffectGesturesEnabledDefault
{
  if (reactionEffectGesturesEnabledDefault_onceToken != -1)
    dispatch_once(&reactionEffectGesturesEnabledDefault_onceToken, &__block_literal_global_312);
  return reactionEffectGesturesEnabledDefault_gesturesEnabledDefault;
}

uint64_t __47__AVCaptureDevice_setUpBackgroundBlurStateOnce__block_invoke()
{
  __CFString *v0;
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  id v8;
  id v9;
  id v10;
  int v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v0 = AVCaptureClientPreferencesDomain();
  sBackgroundBlurControlModeKey = (uint64_t)(id)AVControlCenterVideoEffectsPortraitEffectControlModePreferenceKey(v0);
  v1 = AVCaptureClientPreferencesDomain();
  sBackgroundBlurEnabledKey = (uint64_t)(id)AVControlCenterVideoEffectsPortraitEffectEnabledPreferenceKey(v1);
  v2 = AVCaptureClientPreferencesDomain();
  sBackgroundBlurUnavailableReasonsKey = (uint64_t)(id)AVControlCenterVideoEffectsPortraitEffectUnavailableReasonsPreferenceKey(v2);
  v3 = AVCaptureClientPreferencesDomain();
  sBackgroundBlurApertureKey = (uint64_t)(id)AVControlCenterVideoEffectsPortraitEffectAperturePreferenceKey(v3);
  v4 = AVCaptureClientPreferencesDomain();
  v5 = AVControlCenterVideoEffectsPortraitEffectMigrationCompletePreferenceKey(v4);
  v13[0] = CFSTR("videoeffects-backgroundblur-controlmode");
  v13[1] = CFSTR("videoeffects-backgroundblur-enabled");
  v14[0] = sBackgroundBlurControlModeKey;
  v14[1] = sBackgroundBlurEnabledKey;
  v13[2] = CFSTR("videoeffects-backgroundblur-unavailablereasons");
  v14[2] = sBackgroundBlurUnavailableReasonsKey;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v7 = AVCaptureClientPreferencesDomain();
  AVControlCenterMigrateDefaultsForKeys(v7, v6, v5);
  if ((AVCaptureCurrentClientIsFaceTimeVariant() & 1) != 0
    || (AVCaptureIsRunningInXCTest() & 1) != 0
    || (AVCaptureClientIsInternalTestTool() & 1) != 0
    || AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254())
  {
    v8 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", sBackgroundBlurControlModeKey);
    if (v8)
      sBackgroundBlurControlMode = objc_msgSend(v8, "integerValue");
  }
  v9 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", sBackgroundBlurEnabledKey);
  if (v9)
    sBackgroundBlurEnabled = objc_msgSend(v9, "BOOLValue");
  v10 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", sBackgroundBlurApertureKey);
  if (v10)
  {
    objc_msgSend(v10, "floatValue");
    sBackgroundBlurAperture = v11;
  }
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  return +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
}

+ (BOOL)reactionEffectsEnabledDefault
{
  return +[AVCaptureDevice isEligibleForReactionEffects](AVCaptureDevice, "isEligibleForReactionEffects");
}

- (void)unlockForConfiguration
{
  AVCaptureDeviceInternal *internal;
  pid_t v4;
  AVCaptureDeviceInternal *v5;
  AVCaptureDeviceInternal *v6;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = getpid();
  v5 = self->_internal;
  if (v5->configLockPid == v4)
  {
    --v5->configLockRefCount;
    v6 = self->_internal;
    if (!v6->configLockRefCount)
      v6->configLockPid = 0;
  }
  objc_sync_exit(internal);
}

- (BOOL)lockForConfiguration:(NSError *)outError
{
  AVCaptureDeviceInternal *internal;
  pid_t v6;
  AVCaptureDeviceInternal *v7;
  int configLockPid;
  BOOL v9;
  BOOL v10;
  uint64_t v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  objc_sync_enter(internal);
  v6 = getpid();
  v7 = self->_internal;
  configLockPid = v7->configLockPid;
  if (configLockPid)
    v9 = configLockPid == v6;
  else
    v9 = 1;
  v10 = v9;
  if (v9)
  {
    v7->configLockPid = v6;
    ++self->_internal->configLockRefCount;
  }
  else if (outError)
  {
    v13[0] = *MEMORY[0x1E0CF2A80];
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v13[1] = *MEMORY[0x1E0CF2A68];
    v14[0] = v11;
    v14[1] = self;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    *outError = (NSError *)AVLocalizedError();
  }
  objc_sync_exit(internal);
  return v10;
}

uint64_t __38__AVCaptureDevice_setupKVOLoggingOnce__block_invoke()
{
  uint64_t result;

  result = FigGetCFPreferenceBooleanWithDefault();
  sDetailedKVOOverrideLogging = (_DWORD)result != 0;
  return result;
}

uint64_t __59__AVCaptureDevice_setUpGesturesDefaultDisabledNotification__block_invoke(uint64_t a1)
{
  __CFString *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  uint64_t v11;

  v2 = AVCaptureClientPreferencesDomain();
  sHaveShownGesturesDefaultDisabledNotificationKey = (uint64_t)(id)AVControlCenterVideoEffectsHaveShownGesturesDefaultDisabledNotificationPreferenceKey(v2);
  sRequestGesturesDefaultDisabledNotificationKey = (uint64_t)(id)AVControlCenterVideoEffectsRequestGesturesDefaultDisabledNotificationPreferenceKey();
  v3 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", sHaveShownGesturesDefaultDisabledNotificationKey);
  if (v3)
  {
    v4 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      sHaveShownGesturesDefaultDisabledNotification = objc_msgSend(v4, "BOOLValue");
  }
  v5 = *(_QWORD *)(a1 + 32);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __59__AVCaptureDevice_setUpGesturesDefaultDisabledNotification__block_invoke_2;
  v10 = &unk_1E4216450;
  v11 = v5;
  return +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
}

uint64_t __47__AVCaptureDevice_isEligibleForReactionEffects__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_checkEligiblityForEffect:", AVCaptureBundleCameraReactionEffectsEnabledKey);
  isEligibleForReactionEffects_sIsEligibleForReactionEffects = result;
  return result;
}

uint64_t __44__AVCaptureDevice_setUpCenterStageStateOnce__block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  id v9;
  id v10;
  char v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v2 = AVCaptureClientPreferencesDomain();
  sCenterStageControlModeKey = (uint64_t)(id)AVControlCenterVideoEffectsCenterStageControlModePreferenceKey(v2);
  v3 = AVCaptureClientPreferencesDomain();
  sCenterStageEnabledKey = (uint64_t)(id)AVControlCenterVideoEffectsCenterStageEnabledPreferenceKey(v3);
  v4 = AVCaptureClientPreferencesDomain();
  sCenterStageUnavailableReasonsKey = (uint64_t)(id)AVControlCenterVideoEffectsCenterStageUnavailableReasonsPreferenceKey(v4);
  v5 = AVCaptureClientPreferencesDomain();
  v6 = AVControlCenterVideoEffectsCenterStageMigrationCompletePreferenceKey(v5);
  v13[0] = CFSTR("videoeffects-cinematicframing-controlmode");
  v13[1] = CFSTR("videoeffects-cinematicframing-enabled");
  v14[0] = sCenterStageControlModeKey;
  v14[1] = sCenterStageEnabledKey;
  v13[2] = CFSTR("videoeffects-cinematicframing-unavailablereasons");
  v14[2] = sCenterStageUnavailableReasonsKey;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v8 = AVCaptureClientPreferencesDomain();
  AVControlCenterMigrateDefaultsForKeys(v8, v7, v6);
  v9 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", sCenterStageControlModeKey);
  if (v9)
    sCenterStageControlMode = objc_msgSend(v9, "integerValue");
  v10 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", sCenterStageEnabledKey);
  if (v10)
    v11 = objc_msgSend(v10, "BOOLValue");
  else
    v11 = objc_msgSend(*(id *)(a1 + 32), "_defaultCenterStageEnabled");
  sCenterStageEnabled = v11;
  return +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", MEMORY[0x1E0C809B0], 3221225472, __44__AVCaptureDevice_setUpCenterStageStateOnce__block_invoke_2, &unk_1E4216450, *(_QWORD *)(a1 + 32));
}

+ (BOOL)defaultCenterStageEnabledForBundleID:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a1, "_centerStageAllowList"), "containsObject:", a3);
}

+ (BOOL)_defaultCenterStageEnabled
{
  uint64_t v3;
  __CFString *v4;

  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  if (AVCaptureCurrentClientIsFaceTimeVariant())
    v4 = CFSTR("com.apple.facetime");
  else
    v4 = (__CFString *)v3;
  return objc_msgSend(a1, "defaultCenterStageEnabledForBundleID:", v4);
}

+ (BOOL)_checkEligiblityForEffect:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a1, "_listEligibleEffects"), "containsObject:", a3);
}

uint64_t __55__AVCaptureDevice_reactionEffectGesturesEnabledDefault__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v0 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess"), "infoDictionary");
  v1 = (void *)objc_msgSend(v0, "objectForKey:ofClass:", AVCaptureBundleCameraReactionEffectGesturesEnabledDefaultKey, objc_opt_class());
  if (v1)
  {
    result = objc_msgSend(v1, "BOOLValue");
    reactionEffectGesturesEnabledDefault_gesturesEnabledDefault = result;
    if (!dword_1ECFED700)
      return result;
  }
  else
  {
    result = FigGetCFPreferenceBooleanWithDefault();
    reactionEffectGesturesEnabledDefault_gesturesEnabledDefault = (_DWORD)result != 0;
    if (!dword_1ECFED700)
      return result;
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  return fig_log_call_emit_and_clean_up_after_send_and_compose();
}

uint64_t __47__AVCaptureDevice_setUpStudioLightingStateOnce__block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  id v6;
  id v7;
  id v8;
  int v9;
  uint64_t v10;

  v2 = AVCaptureClientPreferencesDomain();
  sStudioLightingControlModeKey = (uint64_t)(id)AVControlCenterVideoEffectsStudioLightingControlModePreferenceKey(v2);
  v3 = AVCaptureClientPreferencesDomain();
  sStudioLightingEnabledKey = (uint64_t)(id)AVControlCenterVideoEffectsStudioLightingEnabledPreferenceKey(v3);
  v4 = AVCaptureClientPreferencesDomain();
  sStudioLightingUnavailableReasonsKey = (uint64_t)(id)AVControlCenterVideoEffectsStudioLightingUnavailableReasonsPreferenceKey(v4);
  v5 = AVCaptureClientPreferencesDomain();
  sStudioLightingIntensityKey = (uint64_t)(id)AVControlCenterVideoEffectsStudioLightingIntensityPreferenceKey(v5);
  if ((AVCaptureIsRunningInXCTest() & 1) != 0 || AVCaptureClientIsInternalTestTool())
  {
    v6 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", sStudioLightingControlModeKey);
    if (v6)
      sStudioLightingControlMode = objc_msgSend(v6, "integerValue");
  }
  v7 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", sStudioLightingEnabledKey);
  if (v7)
    sStudioLightingEnabled = objc_msgSend(v7, "BOOLValue");
  v8 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", sStudioLightingIntensityKey);
  if (v8)
  {
    objc_msgSend(v8, "floatValue");
    sStudioLightingIntensity = v9;
  }
  v10 = MEMORY[0x1E0C809B0];
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  return +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", v10, 3221225472, __47__AVCaptureDevice_setUpStudioLightingStateOnce__block_invoke_3, &unk_1E4216450, *(_QWORD *)(a1 + 32));
}

+ (id)_centerStageAllowList
{
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E4221E08;
  v3[1] = CFSTR("com.webex.meeting");
  v3[2] = CFSTR("com.skype.SkypeForiPad");
  v3[3] = CFSTR("com.microsoft.skype.teams");
  v3[4] = CFSTR("com.logmein.joinme");
  v3[5] = CFSTR("us.zoom.videomeetings");
  v3[6] = CFSTR("com.logmein.gotomeeting");
  v3[7] = CFSTR("com.herzick.houseparty");
  v3[8] = CFSTR("com.google.hangouts");
  v3[9] = CFSTR("com.google.meetings");
  v3[10] = CFSTR("com.bluejeansnet.Blue-Jeans");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 11);
}

- (BOOL)isLowLightBoostSupported
{
  return 0;
}

+ (AVCaptureDevice)defaultDeviceWithDeviceType:(AVCaptureDeviceType)deviceType mediaType:(AVMediaType)mediaType position:(AVCaptureDevicePosition)position
{
  void *v6;

  if (deviceType)
    return (AVCaptureDevice *)objc_msgSend(a1, "_defaultDeviceWithDeviceType:mediaType:position:prefersUnsuspendedAndAllowsAnyPosition:", deviceType, mediaType, position, AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureDefaultDevicePrefersUnsuspendedAndAllowsAnyPosition")));
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v6);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  return 0;
}

+ (id)_defaultDeviceWithDeviceType:(id)a3 mediaType:(id)a4 position:(int64_t)a5 prefersUnsuspendedAndAllowsAnyPosition:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v11;
  void *v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[2];

  v6 = a6;
  v20[1] = *MEMORY[0x1E0C80C00];
  v11 = objc_opt_class();
  if (v11 != objc_opt_class())
    return 0;
  v20[0] = a3;
  v13 = (void *)objc_msgSend((id)objc_msgSend(a1, "_devicesWithDeviceTypes:mediaType:position:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1), a4, a5), "firstObject");
  if (!v6)
    goto LABEL_12;
  v14 = objc_msgSend(+[AVCaptureDeviceDiscoverySession allVideoDeviceTypes](AVCaptureDeviceDiscoverySession, "allVideoDeviceTypes"), "containsObject:", a3);
  if (!a5 || !v14)
    goto LABEL_12;
  v15 = objc_msgSend(v13, "isSuspended");
  if (v13 && !v15)
    goto LABEL_13;
  v19 = a3;
  v16 = (void *)objc_msgSend((id)objc_msgSend(a1, "_devicesWithDeviceTypes:mediaType:position:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1), a4, 0), "firstObject");
  if (v16)
  {
    v17 = v16;
    if (!objc_msgSend(v16, "isSuspended") || !v13)
      goto LABEL_15;
  }
  else
  {
LABEL_12:
    if (!v13)
    {
      v17 = 0;
LABEL_15:
      v18 = v17;
      return v18;
    }
  }
LABEL_13:
  v18 = v13;
  return v18;
}

- (NSArray)constituentDevices
{
  NSArray *v3;
  void *v4;
  const __CFString **v5;
  uint64_t v6;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((__CFString *)-[AVCaptureDevice deviceType](self, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInDualCamera"))
  {
    v15 = CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera");
    v16 = CFSTR("AVCaptureDeviceTypeBuiltInTelephotoCamera");
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = &v15;
LABEL_9:
    v6 = 2;
    goto LABEL_10;
  }
  if ((__CFString *)-[AVCaptureDevice deviceType](self, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInDualWideCamera"))
  {
    v13 = CFSTR("AVCaptureDeviceTypeBuiltInUltraWideCamera");
    v14 = CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera");
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = &v13;
    goto LABEL_9;
  }
  if ((__CFString *)-[AVCaptureDevice deviceType](self, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInTripleCamera"))
  {
    v10 = CFSTR("AVCaptureDeviceTypeBuiltInUltraWideCamera");
    v11 = CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera");
    v12 = CFSTR("AVCaptureDeviceTypeBuiltInTelephotoCamera");
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = &v10;
    v6 = 3;
  }
  else
  {
    if ((__CFString *)-[AVCaptureDevice deviceType](self, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInTrueDepthCamera"))
    {
      v9 = CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera");
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = &v9;
    }
    else
    {
      if ((__CFString *)-[AVCaptureDevice deviceType](self, "deviceType") != CFSTR("AVCaptureDeviceTypeBuiltInLiDARDepthCamera"))
      {
        v3 = (NSArray *)MEMORY[0x1E0C9AA60];
        goto LABEL_11;
      }
      v8 = CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera");
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = &v8;
    }
    v6 = 1;
  }
LABEL_10:
  v3 = (NSArray *)objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v8, v9, v10, v11, v12, v13, v14, v15, v16);
LABEL_11:
  if (-[NSArray count](v3, "count"))
    return -[AVCaptureDeviceDiscoverySession devices](+[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", v3, *MEMORY[0x1E0CF2B90], -[AVCaptureDevice position](self, "position")), "devices");
  return v3;
}

+ (int64_t)portraitEffectStudioLightQuality
{
  int64_t v2;

  os_unfair_lock_lock(&sBackgroundBlurLock);
  v2 = sPortraitEffectStudioLightQuality;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  return v2;
}

+ (float)studioLightingIntensity
{
  float v2;

  objc_msgSend(a1, "setUpStudioLightingStateOnce");
  os_unfair_lock_lock(&sBackgroundBlurLock);
  v2 = *(float *)&sStudioLightingIntensity;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  return v2;
}

+ (float)backgroundBlurAperture
{
  float v2;

  objc_msgSend(a1, "setUpBackgroundBlurStateOnce");
  os_unfair_lock_lock(&sBackgroundBlurLock);
  v2 = *(float *)&sBackgroundBlurAperture;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  return v2;
}

+ (BOOL)reactionEffectGesturesEnabled
{
  char v2;

  objc_msgSend(a1, "setUpReactionEffectsStateOnce");
  os_unfair_lock_lock(&sReactionsLock);
  v2 = sGesturesEnabled;
  os_unfair_lock_unlock(&sReactionsLock);
  return v2;
}

+ (BOOL)haveShownGesturesDefaultDisabledNotification
{
  char v2;

  objc_msgSend(a1, "setUpGesturesDefaultDisabledNotification");
  os_unfair_lock_lock(&sGesturesDefaultDisabledNotificationLock);
  v2 = sHaveShownGesturesDefaultDisabledNotification;
  os_unfair_lock_unlock(&sGesturesDefaultDisabledNotificationLock);
  return v2;
}

+ (void)setUpGesturesDefaultDisabledNotification
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AVCaptureDevice_setUpGesturesDefaultDisabledNotification__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = a1;
  if (setUpGesturesDefaultDisabledNotification_onceToken != -1)
    dispatch_once(&setUpGesturesDefaultDisabledNotification_onceToken, block);
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

- (NSArray)reactionEffectsInProgress
{
  NSArray *v3;

  +[AVCaptureDevice setUpReactionEffectsStateOnce](AVCaptureDevice, "setUpReactionEffectsStateOnce");
  os_unfair_lock_lock(&sReactionsLock);
  v3 = (NSArray *)(id)-[NSMutableArray copy](self->_internal->activeReactions, "copy");
  os_unfair_lock_unlock(&sReactionsLock);
  return v3;
}

+ (AVCaptureDevice)deviceWithUniqueID:(NSString *)deviceUniqueID
{
  void *v4;
  AVCaptureDevice *result;
  AVCaptureDevice *v6;
  uint64_t v7;
  AVCaptureDevice *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a1, "_devicesWithDeviceTypes:mediaType:position:", +[AVCaptureDeviceDiscoverySession allDeviceTypes](AVCaptureDeviceDiscoverySession, "allDeviceTypes"), 0, 0);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  result = (AVCaptureDevice *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8);
        if ((objc_msgSend((id)objc_msgSend(v9, "uniqueID"), "isEqualToString:", deviceUniqueID) & 1) != 0)
          return (AVCaptureDevice *)v9;
        v8 = (AVCaptureDevice *)((char *)v8 + 1);
      }
      while (v6 != v8);
      result = (AVCaptureDevice *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

+ (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v12;
  objc_super v13;
  os_log_type_t v14;
  os_log_type_t type[4];
  CFTypeRef cf;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setupKVOLoggingOnce");
  if (sDetailedKVOOverrideLogging)
  {
    if (dword_1ECFED700)
    {
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    cf = 0;
    if (FigCopyBacktrace() >= 1 && cf != 0 && dword_1ECFED700 != 0)
    {
      *(_DWORD *)type = 0;
      v14 = OS_LOG_TYPE_DEFAULT;
      v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___AVCaptureDevice;
  objc_msgSendSuper2(&v13, sel_removeObserver_forKeyPath_context_, a3, a4, a5);
}

+ (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v10;
  objc_super v11;
  os_log_type_t v12;
  os_log_type_t type[4];
  CFTypeRef cf;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setupKVOLoggingOnce");
  if (sDetailedKVOOverrideLogging)
  {
    if (dword_1ECFED700)
    {
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    cf = 0;
    if (FigCopyBacktrace() >= 1 && cf != 0 && dword_1ECFED700 != 0)
    {
      *(_DWORD *)type = 0;
      v12 = OS_LOG_TYPE_DEFAULT;
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___AVCaptureDevice;
  objc_msgSendSuper2(&v11, sel_removeObserver_forKeyPath_, a3, a4);
}

+ (id)valueForKey:(id)a3
{
  objc_super v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("backgroundReplacementPixelBuffer")))
    return (id)objc_msgSend(a1, "backgroundReplacementPixelBuffer");
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AVCaptureDevice;
  return objc_msgSendSuper2(&v6, sel_valueForKey_, a3);
}

+ (void)setValue:(id)a3 forKey:(id)a4
{
  objc_super v7;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("backgroundReplacementPixelBuffer")))
  {
    objc_msgSend(a1, "setBackgroundReplacementPixelBuffer:", a3);
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___AVCaptureDevice;
    objc_msgSendSuper2(&v7, sel_setValue_forKey_, a3, a4);
  }
}

+ (NSArray)devices
{
  return (NSArray *)+[AVCaptureDevice devicesForDefaultDeviceSupport:includeAudioDevices:](AVCaptureDevice, "devicesForDefaultDeviceSupport:includeAudioDevices:", 1, 1);
}

+ (AVCaptureDevice)userPreferredCamera
{
  return (AVCaptureDevice *)-[objc_class userPreferredCamera](NSClassFromString(CFSTR("AVCaptureFigVideoDevice")), "userPreferredCamera");
}

+ (void)setUserPreferredCamera:(AVCaptureDevice *)userPreferredCamera
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1ECFED700)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (setUserPreferredCamera__onceToken != -1)
    dispatch_once(&setUserPreferredCamera__onceToken, &__block_literal_global_131);
  if (sLogSetUserPreferredCameraBacktrace)
    FigCopyBacktrace();
  if (userPreferredCamera)
    -[objc_class setUserPreferredCamera:](NSClassFromString(CFSTR("AVCaptureFigVideoDevice")), "setUserPreferredCamera:", userPreferredCamera);
}

uint64_t __42__AVCaptureDevice_setUserPreferredCamera___block_invoke()
{
  uint64_t result;

  result = FigGetCFPreferenceBooleanWithDefault();
  sLogSetUserPreferredCameraBacktrace = (_DWORD)result != 0;
  return result;
}

+ (void)setUserPreferredCamera:(id)a3 forClientPreferenceDomain:(id)a4
{
  __CFString *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v8;

  v6 = AVCaptureClientPreferencesDomain();
  if (dword_1ECFED700)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (setUserPreferredCamera_forClientPreferenceDomain__onceToken != -1)
    dispatch_once(&setUserPreferredCamera_forClientPreferenceDomain__onceToken, &__block_literal_global_134);
  if (sLogSetUserPreferredCameraBacktraceForClientPreferenceDomain)
    FigCopyBacktrace();
  if (a3 && a4)
  {
    if ((-[__CFString isEqualToString:](v6, "isEqualToString:", a4) & 1) != 0
      || (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementSetAnyUserPreferredCamera) & 1) != 0)
    {
      -[objc_class setUserPreferredCamera:forClientPreferenceDomain:](NSClassFromString(CFSTR("AVCaptureFigVideoDevice")), "setUserPreferredCamera:forClientPreferenceDomain:", a3, a4);
    }
    else
    {
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v8);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
    }
  }
}

uint64_t __68__AVCaptureDevice_setUserPreferredCamera_forClientPreferenceDomain___block_invoke()
{
  uint64_t result;

  result = FigGetCFPreferenceBooleanWithDefault();
  sLogSetUserPreferredCameraBacktraceForClientPreferenceDomain = (_DWORD)result != 0;
  return result;
}

+ (void)updateUserPreferredCameraOverrideHistoryWithDevice:(id)a3 setOverride:(BOOL)a4
{
  -[objc_class updateUserPreferredCameraOverrideHistoryWithDevice:setOverride:](NSClassFromString(CFSTR("AVCaptureFigVideoDevice")), "updateUserPreferredCameraOverrideHistoryWithDevice:setOverride:", a3, a4);
}

+ (id)cameraInfoForCreatorID:(id)a3 uniqueID:(id)a4 specialDeviceType:(unsigned int)a5 centerStageSupported:(BOOL)a6
{
  return (id)-[objc_class cameraInfoForCreatorID:uniqueID:specialDeviceType:centerStageSupported:](NSClassFromString(CFSTR("AVCaptureFigVideoDevice")), "cameraInfoForCreatorID:uniqueID:specialDeviceType:centerStageSupported:", a3, a4, *(_QWORD *)&a5, a6);
}

+ (void)updateUserPreferredCameraOverride:(BOOL)a3 cameraInfo:(id)a4
{
  -[objc_class updateUserPreferredCameraOverride:cameraInfo:](NSClassFromString(CFSTR("AVCaptureFigVideoDevice")), "updateUserPreferredCameraOverride:cameraInfo:", a3, a4);
}

+ (BOOL)allowsSuspendedPreferredCameras
{
  Class v2;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = NSClassFromString(CFSTR("AVCaptureFigVideoDevice"));
  if (!v2)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99768];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This is not supported on the base AVCaptureDevice class."));
    v6 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector(), 0);
    objc_exception_throw(v6);
  }
  return -[objc_class allowsSuspendedPreferredCameras](v2, "allowsSuspendedPreferredCameras");
}

+ (void)setAllowsSuspendedPreferredCameras:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  Class v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  if (dword_1ECFED700)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v5 = NSClassFromString(CFSTR("AVCaptureFigVideoDevice"));
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99768];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This is not supported on the base AVCaptureDevice class."));
    v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithObjectAndSelector(), 0);
    objc_exception_throw(v8);
  }
  -[objc_class setAllowsSuspendedPreferredCameras:](v5, "setAllowsSuspendedPreferredCameras:", v3);
}

+ (id)_devices
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)_devicesWithPriorRegisteredDevices:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (void)_reconnectDevices:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This is not supported on the base AVCaptureDevice class."));
  v5 = (void *)objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  objc_exception_throw(v5);
}

+ (void)requestAccessForMediaType:(AVMediaType)mediaType completionHandler:(void *)handler
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  if (-[NSString isEqualToString:](mediaType, "isEqualToString:", *MEMORY[0x1E0CF2B68]))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__AVCaptureDevice_requestAccessForMediaType_completionHandler___block_invoke;
    v9[3] = &unk_1E4216F80;
    v9[4] = handler;
    objc_msgSend(v6, "requestRecordPermission:", v9);
  }
  else if (-[NSString isEqualToString:](mediaType, "isEqualToString:", *MEMORY[0x1E0CF2B90])
         || -[NSString isEqualToString:](mediaType, "isEqualToString:", CFSTR("pcld")))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    if (objc_msgSend(v7, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F88]) == 2)
    {
      if (handler)
        (*((void (**)(void *, _QWORD))handler + 2))(handler, 0);
    }
    else
    {
      FigCaptureGetTCCServer();
      FigCaptureTCCAccessRequest();
    }
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, mediaType);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

uint64_t __63__AVCaptureDevice_requestAccessForMediaType_completionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t IsRunningInXCTest;
  uint64_t result;

  if ((a2 & 1) != 0)
    IsRunningInXCTest = 1;
  else
    IsRunningInXCTest = AVCaptureIsRunningInXCTest();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, IsRunningInXCTest);
  return result;
}

uint64_t __63__AVCaptureDevice_requestAccessForMediaType_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t result;

  if (a2 || AVCaptureIsRunningInXCTest())
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
    v3 = (void *)objc_msgSend((id)sRegisteredVideoDevices, "firstObject");
    os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
    objc_msgSend(v3, "_checkTCCAccess");
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  return result;
}

- (id)initProxyDeviceWithUniqueID:(id)a3 targetClientAuditToken:(id *)a4
{
  id v6;
  __int128 v7;
  void *v9;
  _OWORD v10[2];

  if ((AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementProxyDevices) & 1) != 0)
  {
    if (FigCaptureSourceGetMediaTypeForUniqueID() == 1986618469)
    {
      v6 = objc_alloc(NSClassFromString(CFSTR("AVCaptureFigVideoDevice")));
      v7 = *(_OWORD *)&a4->var0[4];
      v10[0] = *(_OWORD *)a4->var0;
      v10[1] = v7;
      return (id)objc_msgSend(v6, "initProxyDeviceWithUniqueID:targetClientAuditToken:", a3, v10);
    }
  }
  else
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v9);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v9);
  }
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDevice;
  -[AVCaptureDevice dealloc](&v3, sel_dealloc);
}

- (NSString)uniqueID
{
  return (NSString *)&stru_1E421DB28;
}

- (NSString)modelID
{
  return (NSString *)&stru_1E421DB28;
}

- (NSString)localizedName
{
  return (NSString *)AVLocalizedStringFromTable();
}

- (AVCaptureDeviceType)deviceType
{
  return (AVCaptureDeviceType)&stru_1E421DB28;
}

- (BOOL)isProxyDevice
{
  return 0;
}

- (BOOL)hasMediaType:(AVMediaType)mediaType
{
  return 0;
}

- (BOOL)supportsAVCaptureSessionPreset:(AVCaptureSessionPreset)preset
{
  return 0;
}

+ (void)_releaseStaticResources
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1ECFED700)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
  if (sRegisteredVideoDevices)
  {

    sRegisteredVideoDevices = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sRegisterVideoDevicesLock);
}

- (BOOL)setValue:(id)a3 forCMIOExtensionProperty:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)copyValueForCMIOExtensionProperty:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)addCMIOExtensionPropertyValueChangeHandler:(id)a3
{
  return 0;
}

- (BOOL)isSubjectAreaChangeMonitoringEnabled
{
  return 0;
}

- (BOOL)isFaceDetectionSupported
{
  return 0;
}

- (BOOL)isFaceDetectionDuringVideoPreviewSupported
{
  return 0;
}

- (BOOL)isFaceDetectionDrivenImageProcessingEnabled
{
  return 0;
}

- (void)setFaceDetectionDrivenImageProcessingEnabled:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (CGRect)faceRectangle
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int)faceRectangleAngle
{
  return 0;
}

- (BOOL)providesStortorgetMetadata
{
  return 0;
}

- (void)setProvidesStortorgetMetadata:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)supportsMultiCamCaptureWithDevice:(id)a3
{
  return 0;
}

- (id)constituentDeviceWithDeviceType:(id)a3
{
  return 0;
}

- (int)powerConsumptionAt30FPSForOISMode:(int)a3
{
  return 0;
}

- (BOOL)isLowLightVideoCaptureEnabled
{
  return 0;
}

- (void)setLowLightVideoCaptureEnabled:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isVariableFrameRateVideoCaptureEnabled
{
  return 0;
}

- (void)setVariableFrameRateVideoCaptureEnabled:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isAutoVideoFrameRateEnabled
{
  return 0;
}

- (void)setAutoVideoFrameRateEnabled:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (int64_t)videoStabilizationStrength
{
  return 0;
}

- (void)setVideoStabilizationStrength:(int64_t)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (int64_t)digitalFlashMode
{
  return 0;
}

- (void)setDigitalFlashMode:(int64_t)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (int64_t)_digitalFlashStatus
{
  return 0;
}

- (id)_digitalFlashExposureTimes
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)digitalFlashSceneForPhotoOutput
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (void)_setPhotoSettingsForSceneMonitoring:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  objc_exception_throw(v3);
}

- (float)timeLapseCaptureRate
{
  return 0.0;
}

- (void)setTimeLapseCaptureRate:(float)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)ultraHighResolutionZeroShutterLagEnabled
{
  return 0;
}

- (void)setUltraHighResolutionZeroShutterLagEnabled:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (void)setCachesFigCaptureSourceConfigurationChanges:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  objc_exception_throw(v3);
}

- (BOOL)cachesFigCaptureSourceConfigurationChanges
{
  return 0;
}

- (void)_setVideoHDREnabled:(BOOL)a3 forceResetVideoHDRSuspended:(BOOL)a4
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  objc_exception_throw(v4);
}

- (void)_setStillImageStabilizationAutomaticallyEnabled:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  objc_exception_throw(v3);
}

- (BOOL)isLensStabilizationSupported
{
  return 0;
}

- (id)clientAudioClockDeviceUID
{
  return 0;
}

- (void)setClientAudioClockDeviceUID:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  objc_exception_throw(v3);
}

- (BOOL)isAudioCaptureModeSupported:(int64_t)a3
{
  return 0;
}

- (BOOL)isWindNoiseRemovalSupported
{
  return 0;
}

- (BOOL)shouldAudioCaptureModeTriggerGraphRebuildOnAudioRouteChange:(int64_t)a3
{
  return 0;
}

- (int64_t)fallbackAudioCaptureModeIfApplicableForCurrentRoute:(int64_t)a3
{
  return a3;
}

- (BOOL)isMachineReadableCodeDetectionSupported
{
  return 0;
}

- (BOOL)isConnected
{
  return 0;
}

- (BOOL)isSuspended
{
  return 0;
}

- (NSArray)formats
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)setActiveFormat:(AVCaptureDeviceFormat *)activeFormat
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (AVCaptureDeviceInputSource)activeInputSource
{
  -[AVCaptureDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setActiveInputSource:(AVCaptureDeviceInputSource *)activeInputSource
{
  -[AVCaptureDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (AVCaptureDeviceFormat)activeDepthDataFormat
{
  return 0;
}

- (void)setActiveDepthDataFormat:(AVCaptureDeviceFormat *)activeDepthDataFormat
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (CMTime)activeDepthDataMinFrameDuration
{
  *retstr = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- (void)setActiveDepthDataMinFrameDuration:(CMTime *)activeDepthDataMinFrameDuration
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (CMTime)activeVideoMinFrameDuration
{
  *retstr = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- (void)setActiveVideoMinFrameDuration:(CMTime *)activeVideoMinFrameDuration
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (CMTime)activeVideoMaxFrameDuration
{
  *retstr = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- (void)setActiveVideoMaxFrameDuration:(CMTime *)activeVideoMaxFrameDuration
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isActiveVideoMinFrameDurationSet
{
  return 0;
}

- (BOOL)isActiveVideoMaxFrameDurationSet
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeMaxExposureDurationClientOverride
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- (BOOL)appliesSessionPresetMaxIntegrationTimeOverrideToActiveFormat
{
  return 0;
}

- (OpaqueCMClock)deviceClock
{
  return 0;
}

- (BOOL)isOpen
{
  return self->_internal->openRefCount > 0;
}

- (BOOL)open:(id *)a3
{
  AVCaptureDeviceInternal *internal;
  unsigned int *p_openRefCount;
  unsigned int v7;
  BOOL v8;
  AVCaptureDeviceInternal *v9;
  unsigned int *v10;
  int v11;
  int openRefCount;
  unsigned int v13;

  if (a3)
    *a3 = 0;
  internal = self->_internal;
  if (!internal->openRefCount)
  {
    -[AVCaptureDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("open"));
    internal = self->_internal;
  }
  p_openRefCount = (unsigned int *)&internal->openRefCount;
  do
    v7 = __ldxr(p_openRefCount);
  while (__stxr(v7 + 1, p_openRefCount));
  if (v7)
    return 1;
  v8 = -[AVCaptureDevice _startUsingDevice:](self, "_startUsingDevice:", a3);
  if (!v8)
  {
    v9 = self->_internal;
    openRefCount = v9->openRefCount;
    v10 = (unsigned int *)&v9->openRefCount;
    v11 = openRefCount;
    while (1)
    {
      v13 = __ldxr(v10);
      if (v13 != v11)
        break;
      if (!__stxr(0, v10))
        goto LABEL_15;
    }
    __clrex();
  }
LABEL_15:
  -[AVCaptureDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("open"));
  return v8;
}

- (void)close
{
  AVCaptureDeviceInternal *internal;
  int openRefCount;
  unsigned int *p_openRefCount;
  unsigned int v6;
  unsigned int v7;

  internal = self->_internal;
  openRefCount = internal->openRefCount;
  if (openRefCount >= 1)
  {
    if (openRefCount == 1)
    {
      -[AVCaptureDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("open"));
      internal = self->_internal;
    }
    p_openRefCount = (unsigned int *)&internal->openRefCount;
    do
    {
      v6 = __ldxr(p_openRefCount);
      v7 = v6 - 1;
    }
    while (__stxr(v7, p_openRefCount));
    if (!v7)
    {
      -[AVCaptureDevice _stopUsingDevice](self, "_stopUsingDevice");
      -[AVCaptureDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("open"));
    }
  }
}

- (BOOL)_startUsingDevice:(id *)a3
{
  uint64_t v3;
  BOOL result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = 0;
  if (self->_internal->usingDevice || !-[AVCaptureDevice isOpen](self, "isOpen"))
    return 1;
  if (-[AVCaptureDevice isConnected](self, "isConnected"))
  {
    if (-[AVCaptureDevice startUsingDevice:](self, "startUsingDevice:", a3))
    {
      result = 1;
      self->_internal->usingDevice = 1;
      return result;
    }
    v8 = v3;
    LODWORD(v7) = 0;
  }
  else
  {
    if (a3)
    {
      v9 = *MEMORY[0x1E0CF2A68];
      v10[0] = self;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      *a3 = (id)AVLocalizedError();
    }
    v8 = v3;
    LODWORD(v7) = 0;
  }
  FigDebugAssert3();
  -[AVCaptureDevice _stopUsingDevice](self, "_stopUsingDevice", v7, v8);
  return 0;
}

- (void)_stopUsingDevice
{
  -[AVCaptureDevice stopUsingDevice](self, "stopUsingDevice");
  self->_internal->usingDevice = 0;
}

- (BOOL)startUsingDevice:(id *)a3
{
  return 1;
}

- (BOOL)hasFlash
{
  return 0;
}

- (BOOL)isFlashAvailable
{
  return 0;
}

- (BOOL)isFlashActive
{
  return 0;
}

- (BOOL)isFlashModeSupported:(AVCaptureFlashMode)flashMode
{
  return 0;
}

- (AVCaptureFlashMode)flashMode
{
  return 0;
}

- (void)setFlashMode:(AVCaptureFlashMode)flashMode
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)_isFlashScene
{
  return 0;
}

- (BOOL)isFlashSceneDetectedForPhotoOutput
{
  return 0;
}

- (BOOL)hasTorch
{
  return 0;
}

- (float)torchLevel
{
  return 0.0;
}

- (BOOL)isTorchModeSupported:(AVCaptureTorchMode)torchMode
{
  return 0;
}

- (BOOL)isTorchAvailable
{
  return 0;
}

- (BOOL)isTorchActive
{
  return 0;
}

- (AVCaptureTorchMode)torchMode
{
  return 0;
}

- (void)setTorchMode:(AVCaptureTorchMode)torchMode
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)setTorchModeOnWithLevel:(float)torchLevel error:(NSError *)outError
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v4);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  return 0;
}

- (unint64_t)degradedCaptureQualityFactors
{
  return 0;
}

- (BOOL)isHDRSceneDetectedForPhotoOutput
{
  return 0;
}

- (BOOL)isFocusModeSupported:(AVCaptureFocusMode)focusMode
{
  return 0;
}

- (AVCaptureFocusMode)focusMode
{
  return -1;
}

- (void)setFocusMode:(AVCaptureFocusMode)focusMode
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isFocusPointOfInterestSupported
{
  return 0;
}

- (CGPoint)focusPointOfInterest
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.5;
  v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)isAdjustingFocus
{
  return 0;
}

- (void)setFocusPointOfInterest:(CGPoint)focusPointOfInterest
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isAutoFocusRangeRestrictionSupported
{
  return 0;
}

- (AVCaptureAutoFocusRangeRestriction)autoFocusRangeRestriction
{
  return 0;
}

- (void)setAutoFocusRangeRestriction:(AVCaptureAutoFocusRangeRestriction)autoFocusRangeRestriction
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isSmoothAutoFocusSupported
{
  return 0;
}

- (BOOL)isSmoothAutoFocusEnabled
{
  return 0;
}

- (void)setSmoothAutoFocusEnabled:(BOOL)smoothAutoFocusEnabled
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)automaticallyAdjustsFaceDrivenAutoFocusEnabled
{
  return 0;
}

- (void)setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled:(BOOL)automaticallyAdjustsFaceDrivenAutoFocusEnabled
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isFaceDrivenAutoFocusEnabled
{
  return 0;
}

- (void)setFaceDrivenAutoFocusEnabled:(BOOL)faceDrivenAutoFocusEnabled
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (float)lensPosition
{
  return 0.0;
}

- (BOOL)isLockingFocusWithCustomLensPositionSupported
{
  return 0;
}

- (void)setFocusModeLockedWithLensPosition:(float)lensPosition completionHandler:(void *)handler
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v4);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
}

- (float)focalLength
{
  return 0.0;
}

- (float)lensAperture
{
  return 0.0;
}

- (BOOL)isExposureModeSupported:(AVCaptureExposureMode)exposureMode
{
  return 0;
}

- (AVCaptureExposureMode)exposureMode
{
  return -1;
}

- (void)setExposureMode:(AVCaptureExposureMode)exposureMode
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isExposurePointOfInterestSupported
{
  return 0;
}

- (CGPoint)exposurePointOfInterest
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.5;
  v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setExposurePointOfInterest:(CGPoint)exposurePointOfInterest
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)automaticallyAdjustsFaceDrivenAutoExposureEnabled
{
  return 0;
}

- (void)setAutomaticallyAdjustsFaceDrivenAutoExposureEnabled:(BOOL)automaticallyAdjustsFaceDrivenAutoExposureEnabled
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isFaceDrivenAutoExposureEnabled
{
  return 0;
}

- (void)setFaceDrivenAutoExposureEnabled:(BOOL)faceDrivenAutoExposureEnabled
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (CMTime)activeMaxExposureDuration
{
  *retstr = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- (void)setActiveMaxExposureDuration:(CMTime *)activeMaxExposureDuration
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (CMTime)exposureDuration
{
  *retstr = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

- (float)ISO
{
  return 0.0;
}

- (float)ISODigitalThreshold
{
  return 0.0;
}

- (void)setExposureModeCustomWithDuration:(CMTime *)duration ISO:(float)ISO completionHandler:(void *)handler
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v5);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
}

- (float)exposureTargetOffset
{
  return 0.0;
}

- (float)exposureTargetBias
{
  return 0.0;
}

- (float)minExposureTargetBias
{
  return 0.0;
}

- (float)maxExposureTargetBias
{
  return 0.0;
}

- (void)setExposureTargetBias:(float)bias completionHandler:(void *)handler
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v4);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
}

- (BOOL)isAdjustingExposure
{
  return 0;
}

- (BOOL)isGlobalToneMappingEnabled
{
  return 0;
}

- (void)setGlobalToneMappingEnabled:(BOOL)globalToneMappingEnabled
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isWhiteBalanceModeSupported:(AVCaptureWhiteBalanceMode)whiteBalanceMode
{
  return 0;
}

- (AVCaptureWhiteBalanceMode)whiteBalanceMode
{
  return -1;
}

- (void)setWhiteBalanceMode:(AVCaptureWhiteBalanceMode)whiteBalanceMode
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isAdjustingWhiteBalance
{
  return 0;
}

- (AVCaptureWhiteBalanceGains)deviceWhiteBalanceGains
{
  float v2;
  float v3;
  float v4;
  AVCaptureWhiteBalanceGains result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  result.blueGain = v4;
  result.greenGain = v3;
  result.redGain = v2;
  return result;
}

- (AVCaptureWhiteBalanceGains)grayWorldDeviceWhiteBalanceGains
{
  float v2;
  float v3;
  float v4;
  AVCaptureWhiteBalanceGains result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  result.blueGain = v4;
  result.greenGain = v3;
  result.redGain = v2;
  return result;
}

- (float)maxWhiteBalanceGain
{
  return 0.0;
}

- (BOOL)isLockingWhiteBalanceWithCustomDeviceGainsSupported
{
  return 0;
}

- (void)setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains:(AVCaptureWhiteBalanceGains)whiteBalanceGains completionHandler:(void *)handler
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v4);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
}

- (AVCaptureWhiteBalanceChromaticityValues)chromaticityValuesForDeviceWhiteBalanceGains:(AVCaptureWhiteBalanceGains)whiteBalanceGains
{
  float v3;
  float v4;
  AVCaptureWhiteBalanceChromaticityValues result;

  v3 = 0.0;
  v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (AVCaptureWhiteBalanceGains)deviceWhiteBalanceGainsForChromaticityValues:(AVCaptureWhiteBalanceChromaticityValues)chromaticityValues
{
  float v3;
  float v4;
  float v5;
  AVCaptureWhiteBalanceGains result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.blueGain = v5;
  result.greenGain = v4;
  result.redGain = v3;
  return result;
}

- (AVCaptureWhiteBalanceTemperatureAndTintValues)temperatureAndTintValuesForDeviceWhiteBalanceGains:(AVCaptureWhiteBalanceGains)whiteBalanceGains
{
  float v3;
  float v4;
  AVCaptureWhiteBalanceTemperatureAndTintValues result;

  v3 = 0.0;
  v4 = 0.0;
  result.tint = v4;
  result.temperature = v3;
  return result;
}

- (AVCaptureWhiteBalanceGains)deviceWhiteBalanceGainsForTemperatureAndTintValues:(AVCaptureWhiteBalanceTemperatureAndTintValues)tempAndTintValues
{
  float v3;
  float v4;
  float v5;
  AVCaptureWhiteBalanceGains result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.blueGain = v5;
  result.greenGain = v4;
  result.redGain = v3;
  return result;
}

- (BOOL)isImageControlModeSupported:(int64_t)a3
{
  return 0;
}

- (BOOL)automaticallyAdjustsImageControlMode
{
  return 1;
}

- (void)setAutomaticallyAdjustsImageControlMode:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (int64_t)imageControlMode
{
  return -1;
}

- (void)setImageControlMode:(int64_t)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)automaticallyAdjustsVideoHDREnabled
{
  return 0;
}

- (void)setAutomaticallyAdjustsVideoHDREnabled:(BOOL)automaticallyAdjustsVideoHDREnabled
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isVideoHDREnabled
{
  return 0;
}

- (void)setVideoHDREnabled:(BOOL)videoHDREnabled
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isVideoHDRSuspended
{
  return 0;
}

- (void)setVideoHDRSuspended:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (AVCaptureColorSpace)activeColorSpace
{
  return -1;
}

- (NSArray)virtualDeviceSwitchOverVideoZoomFactors
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)setActiveColorSpace:(AVCaptureColorSpace)activeColorSpace
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isWideColorSupported
{
  return 0;
}

- (CGFloat)videoZoomFactor
{
  return 1.0;
}

- (void)setVideoZoomFactor:(CGFloat)videoZoomFactor
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (void)rampToVideoZoomFactor:(CGFloat)factor withRate:(float)rate
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v4);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
}

- (void)rampExponentiallyToVideoZoomFactor:(float)a3 withDuration:(double)a4
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v4);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
}

- (void)rampToVideoZoomFactor:(float)a3 withTuning:(int64_t)a4
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v4);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
}

- (BOOL)isRampingVideoZoom
{
  return 0;
}

- (void)cancelVideoZoomRamp
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v2);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v2);
}

- (CGFloat)dualCameraSwitchOverVideoZoomFactor
{
  return 1.0;
}

- (CGFloat)minAvailableVideoZoomFactor
{
  return 1.0;
}

- (CGFloat)maxAvailableVideoZoomFactor
{
  return 1.0;
}

- (BOOL)isGeometricDistortionCorrectionSupported
{
  return 0;
}

- (BOOL)isGeometricDistortionCorrectionEnabled
{
  return 0;
}

- (void)setGeometricDistortionCorrectionEnabled:(BOOL)geometricDistortionCorrectionEnabled
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (id)cameraPoseMatrix
{
  return 0;
}

+ (NSData)extrinsicMatrixFromDevice:(AVCaptureDevice *)fromDevice toDevice:(AVCaptureDevice *)toDevice
{
  id v6;
  id v7;
  void *v8;
  AVCaptureDevicePosition v9;
  uint64_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _OWORD v38[3];
  _OWORD v39[3];

  v6 = -[AVCaptureDevice cameraPoseMatrix](fromDevice, "cameraPoseMatrix");
  v7 = -[AVCaptureDevice cameraPoseMatrix](toDevice, "cameraPoseMatrix");
  if (!fromDevice)
  {
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
LABEL_11:
    v25 = (void *)objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v25);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v25);
    return 0;
  }
  if (!toDevice)
  {
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    goto LABEL_11;
  }
  v8 = v7;
  if (objc_msgSend(v6, "length") != 64)
    return 0;
  if (objc_msgSend(v8, "length") != 64)
    return 0;
  v9 = -[AVCaptureDevice position](fromDevice, "position");
  if (v9 != -[AVCaptureDevice position](toDevice, "position"))
    return 0;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v6, "getBytes:length:", &v34, objc_msgSend(v6, "length"));
  objc_msgSend(v8, "getBytes:length:", &v30, objc_msgSend(v8, "length"));
  v10 = 0;
  v11 = (float32x4_t)vzip1q_s32(v30, v31);
  v11.i32[2] = v32.i32[0];
  v12 = (float32x4_t)vzip2q_s32(vzip1q_s32(v30, v32), vdupq_lane_s32(*(int32x2_t *)v31.i8, 1));
  v13 = (float32x4_t)vzip2q_s32(v30, v31);
  v13.i32[2] = v32.i32[2];
  v38[0] = v34;
  v38[1] = v35;
  v38[2] = v36;
  memset(v39, 0, sizeof(v39));
  do
  {
    v39[v10] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, COERCE_FLOAT(v38[v10])), v12, *(float32x2_t *)&v38[v10], 1), v13, (float32x4_t)v38[v10], 2);
    ++v10;
  }
  while (v10 != 3);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  FigCaptureFirmwareToNVMExtrinsicMatrixTransform();
  FigCaptureTransformExtrinsicMatrix();
  DWORD2(v26) = v14;
  DWORD2(v27) = v15;
  *(_QWORD *)&v26 = v16;
  *(_QWORD *)&v27 = v17;
  DWORD2(v28) = v18;
  DWORD2(v29) = v19;
  *(_QWORD *)&v28 = v20;
  *(_QWORD *)&v29 = v21;
  return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v26, 64);
}

uint64_t __44__AVCaptureDevice_setUpCenterStageStateOnce__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cinematicFramingEnabledChanged:");
}

+ (void)_cinematicFramingEnabledChanged:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setupKVOLoggingOnce");
  if (sDetailedKVOOverrideLogging)
  {
    FigCopyBacktrace();
    if (dword_1ECFED700)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v6 = objc_msgSend(a1, "_defaultCenterStageEnabled", v9, v11);
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = objc_msgSend(a3, "BOOLValue");
  }
  os_unfair_lock_lock(&sCenterStageLock);
  v7 = sCenterStageEnabled;
  os_unfair_lock_unlock(&sCenterStageLock);
  if (v7 != v6)
  {
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("cinematicFramingEnabled"));
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("centerStageEnabled"));
    os_unfair_lock_lock(&sCenterStageLock);
    sCenterStageEnabled = v6;
    os_unfair_lock_unlock(&sCenterStageLock);
    if (dword_1ECFED700)
    {
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("centerStageEnabled"), v10, v12);
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("cinematicFramingEnabled"));
  }
}

+ (AVCaptureCenterStageControlMode)centerStageControlMode
{
  AVCaptureCenterStageControlMode v2;

  objc_msgSend(a1, "setUpCenterStageStateOnce");
  os_unfair_lock_lock(&sCenterStageLock);
  v2 = sCenterStageControlMode;
  os_unfair_lock_unlock(&sCenterStageLock);
  return v2;
}

+ (void)setCenterStageControlMode:(AVCaptureCenterStageControlMode)centerStageControlMode
{
  uint64_t v5;
  void *v6;

  objc_msgSend(a1, "setUpCenterStageStateOnce");
  if ((unint64_t)centerStageControlMode >= (AVCaptureCenterStageControlModeCooperative|AVCaptureCenterStageControlModeApp))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("centerStageControlMode"));
    os_unfair_lock_lock(&sCenterStageLock);
    sCenterStageControlMode = centerStageControlMode;
    os_unfair_lock_unlock(&sCenterStageLock);
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", centerStageControlMode);
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v5, sCenterStageControlModeKey);
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("centerStageControlMode"));
  }
}

+ (void)setCenterStageEnabled:(BOOL)centerStageEnabled
{
  _BOOL8 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = centerStageEnabled;
  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setUpCenterStageStateOnce");
  if (objc_msgSend(a1, "centerStageControlMode"))
  {
    if (dword_1ECFED700)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, v9, v10);
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v7, sCenterStageEnabledKey);
    os_unfair_lock_lock(&sCenterStageLock);
    os_unfair_lock_unlock(&sCenterStageLock);
    if (dword_1ECFED700)
    {
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (BOOL)isCenterStageActive
{
  return 0;
}

- (CGRect)centerStageRectOfInterest
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setCenterStageRectOfInterest:(CGRect)centerStageRectOfInterest
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  objc_exception_throw(v3);
}

- (BOOL)isCenterStageRectOfInterestSupported
{
  return 0;
}

- (BOOL)isCenterStageMetadataDeliverySupported
{
  return 0;
}

- (void)setCenterStageMetadataDeliveryEnabled:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  objc_exception_throw(v3);
}

- (BOOL)isCenterStageMetadataDeliveryEnabled
{
  return 0;
}

+ (int64_t)centerStageFramingMode
{
  int64_t v2;

  objc_msgSend(a1, "setUpCenterStageStateOnce");
  os_unfair_lock_lock(&sCenterStageLock);
  v2 = sCenterStageFramingMode;
  os_unfair_lock_unlock(&sCenterStageLock);
  return v2;
}

+ (void)setCenterStageFramingMode:(int64_t)a3
{
  char v5;
  int v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  objc_msgSend(a1, "setUpCenterStageStateOnce");
  os_unfair_lock_lock(&sCenterStageLock);
  v5 = sSettingCenterStageFramingModeMyself;
  v6 = sCenterStageFramingMode;
  os_unfair_lock_unlock(&sCenterStageLock);
  if ((v5 & 1) != 0 || v6 == (_DWORD)a3)
  {
    if (dword_1ECFED700)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("centerStageFramingMode"));
    os_unfair_lock_lock(&sCenterStageLock);
    sCenterStageFramingMode = a3;
    sSettingCenterStageFramingModeMyself = 1;
    os_unfair_lock_unlock(&sCenterStageLock);
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("centerStageFramingMode"));
    os_unfair_lock_lock(&sCenterStageLock);
    sSettingCenterStageFramingModeMyself = 0;
    os_unfair_lock_unlock(&sCenterStageLock);
  }
}

- (BOOL)isPortraitEffectActive
{
  return 0;
}

uint64_t __47__AVCaptureDevice_setUpBackgroundBlurStateOnce__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundBlurEnabledChanged:");
}

uint64_t __47__AVCaptureDevice_setUpBackgroundBlurStateOnce__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundBlurApertureChanged:");
}

+ (void)_backgroundBlurEnabledChanged:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setupKVOLoggingOnce");
  if (sDetailedKVOOverrideLogging)
  {
    FigCopyBacktrace();
    if (dword_1ECFED700)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      LODWORD(a3) = objc_msgSend(a3, "BOOLValue");
    else
      LODWORD(a3) = 0;
  }
  os_unfair_lock_lock(&sBackgroundBlurLock);
  v6 = sBackgroundBlurEnabled;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  if (v6 != (_DWORD)a3)
  {
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("backgroundBlurEnabled"));
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("portraitEffectEnabled"));
    os_unfair_lock_lock(&sBackgroundBlurLock);
    sBackgroundBlurEnabled = (char)a3;
    os_unfair_lock_unlock(&sBackgroundBlurLock);
    if (dword_1ECFED700)
    {
      v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("portraitEffectEnabled"), v8, v9);
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("backgroundBlurEnabled"));
  }
}

+ (int64_t)backgroundBlurControlMode
{
  int64_t v2;

  objc_msgSend(a1, "setUpBackgroundBlurStateOnce");
  os_unfair_lock_lock(&sBackgroundBlurLock);
  v2 = sBackgroundBlurControlMode;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  return v2;
}

+ (void)setBackgroundBlurControlMode:(int64_t)a3
{
  uint64_t v5;
  void *v6;

  objc_msgSend(a1, "setUpBackgroundBlurStateOnce");
  if ((AVCaptureCurrentClientIsFaceTimeVariant() & 1) != 0
    || (AVCaptureClientIsContinuityCapture() & 1) != 0
    || (AVCaptureIsRunningInXCTest() & 1) != 0
    || (AVCaptureClientIsInternalTestTool() & 1) != 0
    || AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254())
  {
    if ((unint64_t)a3 < 3)
    {
LABEL_7:
      objc_msgSend(a1, "willChangeValueForKey:", CFSTR("backgroundBlurControlMode"));
      os_unfair_lock_lock(&sBackgroundBlurLock);
      sBackgroundBlurControlMode = a3;
      os_unfair_lock_unlock(&sBackgroundBlurLock);
      v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v5, sBackgroundBlurControlModeKey);
      objc_msgSend(a1, "didChangeValueForKey:", CFSTR("backgroundBlurControlMode"));
      return;
    }
  }
  else if (!a3)
  {
    goto LABEL_7;
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v6);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
}

+ (void)setBackgroundBlurEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setUpBackgroundBlurStateOnce");
  if (objc_msgSend(a1, "backgroundBlurControlMode"))
  {
    if (dword_1ECFED700)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, v9, v10);
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v7, sBackgroundBlurEnabledKey);
    os_unfair_lock_lock(&sBackgroundBlurLock);
    os_unfair_lock_unlock(&sBackgroundBlurLock);
    if (dword_1ECFED700)
    {
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

uint64_t __46__AVCaptureDevice_isEligibleForBackgroundBlur__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_checkEligiblityForEffect:", AVCaptureBundleCameraPortraitEffectEnabledKey);
  isEligibleForBackgroundBlur_sIsEligibleForBackgroundBlur = result;
  return result;
}

+ (void)_backgroundBlurApertureChanged:(id)a3
{
  float v4;
  float v6;
  char v7;
  float v8;

  v4 = 3.0;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a3, "floatValue");
      v4 = v6;
    }
  }
  os_unfair_lock_lock(&sBackgroundBlurLock);
  v7 = sSettingBackgroundBlurApertureMyself;
  v8 = *(float *)&sBackgroundBlurAperture;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  if ((v7 & 1) == 0 && v8 != v4)
  {
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("backgroundBlurAperture"));
    os_unfair_lock_lock(&sBackgroundBlurLock);
    sBackgroundBlurAperture = LODWORD(v4);
    os_unfair_lock_unlock(&sBackgroundBlurLock);
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("backgroundBlurAperture"));
  }
}

+ (void)setBackgroundBlurAperture:(float)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  uint64_t v10;

  objc_msgSend(a1, "setUpBackgroundBlurStateOnce");
  if (objc_msgSend(a1, "backgroundBlurControlMode"))
  {
    if (a3 >= 2.0 && a3 <= 4.0)
    {
      objc_msgSend(a1, "willChangeValueForKey:", CFSTR("backgroundBlurAperture"));
      os_unfair_lock_lock(&sBackgroundBlurLock);
      sBackgroundBlurAperture = LODWORD(a3);
      sSettingBackgroundBlurApertureMyself = 1;
      os_unfair_lock_unlock(&sBackgroundBlurLock);
      *(float *)&v9 = a3;
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
      +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v10, sBackgroundBlurApertureKey);
      os_unfair_lock_lock(&sBackgroundBlurLock);
      sSettingBackgroundBlurApertureMyself = 0;
      os_unfair_lock_unlock(&sBackgroundBlurLock);
      objc_msgSend(a1, "didChangeValueForKey:", CFSTR("backgroundBlurAperture"));
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

+ (AudioValueRange)backgroundBlurApertureRange
{
  double v2;
  double v3;
  AudioValueRange result;

  v2 = 2.0;
  v3 = 4.0;
  result.mMaximum = v3;
  result.mMinimum = v2;
  return result;
}

+ (float)backgroundBlurApertureDefault
{
  return 3.0;
}

uint64_t __47__AVCaptureDevice_setUpStudioLightingStateOnce__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_studioLightingEnabledChanged:");
}

uint64_t __47__AVCaptureDevice_setUpStudioLightingStateOnce__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_studioLightingIntensityChanged:");
}

+ (int64_t)studioLightingControlMode
{
  int64_t v2;

  objc_msgSend(a1, "setUpStudioLightingStateOnce");
  os_unfair_lock_lock(&sBackgroundBlurLock);
  v2 = sStudioLightingControlMode;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  return v2;
}

+ (void)setStudioLightingControlMode:(int64_t)a3
{
  int IsFaceTimeVariant;
  unint64_t v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "setUpStudioLightingStateOnce");
  if ((AVCaptureClientIsContinuityCapture() & 1) != 0
    || (AVCaptureIsRunningInXCTest() & 1) != 0
    || (AVCaptureClientIsInternalTestTool() & 1) != 0
    || (IsFaceTimeVariant = AVCaptureCurrentClientIsFaceTimeVariant(), v6 = a3, IsFaceTimeVariant))
  {
    v6 = a3 & 0xFFFFFFFFFFFFFFFDLL;
  }
  if (v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
  else
  {
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("studioLightingControlMode"));
    os_unfair_lock_lock(&sBackgroundBlurLock);
    sStudioLightingControlMode = a3;
    os_unfair_lock_unlock(&sBackgroundBlurLock);
    v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v8, sStudioLightingControlModeKey);
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("studioLightingControlMode"));
  }
}

+ (void)setStudioLightingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setUpStudioLightingStateOnce");
  if (objc_msgSend(a1, "studioLightingControlMode"))
  {
    if (dword_1ECFED700)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, v9, v10);
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v7, sStudioLightingEnabledKey);
    os_unfair_lock_lock(&sBackgroundBlurLock);
    os_unfair_lock_unlock(&sBackgroundBlurLock);
    if (dword_1ECFED700)
    {
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

uint64_t __46__AVCaptureDevice_isEligibleForStudioLighting__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_checkEligiblityForEffect:", AVCaptureBundleCameraStudioLightEnabledKey);
  isEligibleForStudioLighting_sIsEligibleForStudioLighting = result;
  return result;
}

+ (void)_studioLightEnabledChanged:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setupKVOLoggingOnce");
  if (sDetailedKVOOverrideLogging)
  {
    FigCopyBacktrace();
    if (dword_1ECFED700)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(a3, "BOOLValue");
  else
    v6 = 0;
  os_unfair_lock_lock(&sBackgroundBlurLock);
  v7 = sStudioLightingEnabled;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  if (v7 != v6)
  {
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("studioLightingEnabled"));
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("studioLightEnabled"));
    os_unfair_lock_lock(&sBackgroundBlurLock);
    sStudioLightingEnabled = v6;
    os_unfair_lock_unlock(&sBackgroundBlurLock);
    if (dword_1ECFED700)
    {
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("studioLightEnabled"), v9, v10);
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("studioLightingEnabled"));
  }
}

- (BOOL)isStudioLightActive
{
  return 0;
}

+ (void)setPortraitEffectStudioLightQuality:(int64_t)a3
{
  objc_msgSend(a1, "willChangeValueForKey:", CFSTR("portraitEffectStudioLightQuality"));
  os_unfair_lock_lock(&sBackgroundBlurLock);
  sPortraitEffectStudioLightQuality = a3;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  objc_msgSend(a1, "didChangeValueForKey:", CFSTR("portraitEffectStudioLightQuality"));
}

+ (void)_studioLightingIntensityChanged:(id)a3
{
  float v4;
  float v6;
  char v7;
  float v8;

  v4 = 0.5;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a3, "floatValue");
      v4 = v6;
    }
  }
  os_unfair_lock_lock(&sBackgroundBlurLock);
  v7 = sSettingStudioLightingIntensityMyself;
  v8 = *(float *)&sStudioLightingIntensity;
  os_unfair_lock_unlock(&sBackgroundBlurLock);
  if ((v7 & 1) == 0 && v8 != v4)
  {
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("studioLightingIntensity"));
    os_unfair_lock_lock(&sBackgroundBlurLock);
    sStudioLightingIntensity = LODWORD(v4);
    os_unfair_lock_unlock(&sBackgroundBlurLock);
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("studioLightingIntensity"));
  }
}

+ (void)setStudioLightingIntensity:(float)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  uint64_t v10;

  objc_msgSend(a1, "setUpStudioLightingStateOnce");
  if (objc_msgSend(a1, "studioLightingControlMode"))
  {
    if (a3 >= 0.0 && a3 <= 1.0)
    {
      objc_msgSend(a1, "willChangeValueForKey:", CFSTR("studioLightingIntensity"));
      os_unfair_lock_lock(&sBackgroundBlurLock);
      sStudioLightingIntensity = LODWORD(a3);
      sSettingStudioLightingIntensityMyself = 1;
      os_unfair_lock_unlock(&sBackgroundBlurLock);
      *(float *)&v9 = a3;
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
      +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v10, sStudioLightingIntensityKey);
      os_unfair_lock_lock(&sBackgroundBlurLock);
      sSettingStudioLightingIntensityMyself = 0;
      os_unfair_lock_unlock(&sBackgroundBlurLock);
      objc_msgSend(a1, "didChangeValueForKey:", CFSTR("studioLightingIntensity"));
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

+ (float)studioLightingIntensityDefault
{
  return 0.5;
}

uint64_t __48__AVCaptureDevice_setUpReactionEffectsStateOnce__block_invoke_300(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reactionsEnabledChanged:");
}

uint64_t __48__AVCaptureDevice_setUpReactionEffectsStateOnce__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_gesturesEnabledChanged:");
}

uint64_t __48__AVCaptureDevice_setUpReactionEffectsStateOnce__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reactionTriggered:");
}

uint64_t __48__AVCaptureDevice_setUpReactionEffectsStateOnce__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reactionsInProgressChangedByControlCenter:");
}

+ (void)_reactionsEnabledChanged:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setupKVOLoggingOnce");
  if (sDetailedKVOOverrideLogging)
  {
    FigCopyBacktrace();
    if (dword_1ECFED700)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v6 = +[AVCaptureDevice reactionEffectsEnabledDefault](AVCaptureDevice, "reactionEffectsEnabledDefault", v9, v11);
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = objc_msgSend(a3, "BOOLValue");
  }
  os_unfair_lock_lock(&sReactionsLock);
  v7 = sReactionsEnabled;
  os_unfair_lock_unlock(&sReactionsLock);
  if (v7 != v6)
  {
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("reactionEffectsEnabled"));
    os_unfair_lock_lock(&sReactionsLock);
    sReactionsEnabled = v6;
    os_unfair_lock_unlock(&sReactionsLock);
    if (dword_1ECFED700)
    {
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("reactionEffectsEnabled"), v10, v12);
  }
}

+ (void)_gesturesEnabledChanged:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setupKVOLoggingOnce");
  if (sDetailedKVOOverrideLogging)
  {
    FigCopyBacktrace();
    if (dword_1ECFED700)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v6 = +[AVCaptureDevice reactionEffectGesturesEnabledDefault](AVCaptureDevice, "reactionEffectGesturesEnabledDefault", v9, v11);
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = objc_msgSend(a3, "BOOLValue");
  }
  os_unfair_lock_lock(&sReactionsLock);
  v7 = sGesturesEnabled;
  os_unfair_lock_unlock(&sReactionsLock);
  if (v7 != v6)
  {
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("reactionEffectGesturesEnabled"));
    os_unfair_lock_lock(&sReactionsLock);
    sGesturesEnabled = v6;
    os_unfair_lock_unlock(&sReactionsLock);
    if (dword_1ECFED700)
    {
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("reactionEffectGesturesEnabled"), v10, v12);
  }
}

+ (void)_reactionTriggered:(id)a3
{
  uint64_t v4;
  AVCaptureDevice *v5;
  AVCaptureDevice *v6;
  uint64_t v7;

  v4 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVControlCenterModulesNotificationDeviceIdentifierKey"));
  if (v4
    && (v5 = +[AVCaptureDevice deviceWithUniqueID:](AVCaptureDevice, "deviceWithUniqueID:", v4)) != 0
    && (v6 = v5,
        v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVControlCenterModulesNotificationReactionTypeKey")),
        +[AVCaptureDevice setUpReactionEffectsStateOnce](AVCaptureDevice, "setUpReactionEffectsStateOnce"),
        (objc_msgSend((id)sAvailableReactions, "containsObject:", v7) & 1) != 0))
  {
    -[AVCaptureDevice _performReaction:](v6, "_performReaction:", v7);
  }
  else
  {
    FigDebugAssert3();
  }
}

+ (void)_reactionsInProgressChangedByControlCenter:(id)a3
{
  uint64_t v4;
  AVCaptureDevice *v5;
  AVCaptureDevice *v6;
  uint64_t v7;

  v4 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVControlCenterModulesNotificationDeviceIdentifierKey"));
  if (v4
    && (v5 = +[AVCaptureDevice deviceWithUniqueID:](AVCaptureDevice, "deviceWithUniqueID:", v4)) != 0
    && (v6 = v5,
        (v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVControlCenterModulesNotificationReactionEffectsInProgressKey"))) != 0))
  {
    -[AVCaptureDevice updateReactionsInProgress:](v6, "updateReactionsInProgress:", v7);
  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)updateReactionsInProgress:(id)a3
{
  NSMutableArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  __int128 *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 *v21;
  float Seconds;
  uint64_t v23;
  void *v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&sReactionsLock);
  v5 = self->_internal->activeReactions;
  os_unfair_lock_unlock(&sReactionsLock);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(a3);
        v11 = -[AVCaptureReactionEffectState initFromDictionary:]([AVCaptureReactionEffectState alloc], "initFromDictionary:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
        if (v11)
        {
          v12 = v11;
          objc_msgSend(v6, "addObject:", v11);

        }
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v8);
  }
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v14 = 0;
  v15 = 0;
  v16 = (__int128 *)MEMORY[0x1E0CA2E10];
  while (v15 < -[NSMutableArray count](v5, "count") || v14 < objc_msgSend(v6, "count"))
  {
    if (v15 >= -[NSMutableArray count](v5, "count"))
    {
      v23 = objc_msgSend(v6, "objectAtIndexedSubscript:", v14);
      v24 = v13;
LABEL_30:
      objc_msgSend(v24, "addObject:", v23);
      goto LABEL_34;
    }
    if (v14 >= objc_msgSend(v6, "count"))
    {
      v20 = (void *)-[NSMutableArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v15);
      v37 = *v16;
      v38 = *((_QWORD *)v16 + 2);
      v21 = &v37;
      goto LABEL_24;
    }
    v17 = (void *)objc_msgSend(v6, "objectAtIndexedSubscript:", v14);
    v18 = -[NSMutableArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v15);
    v19 = (void *)v18;
    if (v17)
    {
      objc_msgSend(v17, "startTime");
      if (!v19)
        goto LABEL_20;
    }
    else
    {
      memset(&lhs, 0, sizeof(lhs));
      if (!v18)
      {
LABEL_20:
        memset(&rhs, 0, sizeof(rhs));
        goto LABEL_21;
      }
    }
    objc_msgSend(v19, "startTime");
LABEL_21:
    CMTimeSubtract(&time, &lhs, &rhs);
    Seconds = CMTimeGetSeconds(&time);
    if (fabsf(Seconds) < 0.0001)
    {
      if (!v17)
      {
        v31 = 0;
        v32 = 0;
        v33 = 0;
LABEL_32:
        objc_msgSend(v13, "addObject:", v19);
        goto LABEL_33;
      }
      objc_msgSend(v17, "endTime");
      if ((v32 & 0x100000000) == 0)
        goto LABEL_32;
      objc_msgSend(v17, "endTime");
      v27 = v29;
      v28 = v30;
      objc_msgSend(v19, "setEndTime:", &v27);
LABEL_33:
      ++v15;
LABEL_34:
      ++v14;
    }
    else
    {
      if (Seconds < 0.0)
      {
        v24 = v13;
        v23 = (uint64_t)v17;
        goto LABEL_30;
      }
      v25 = *v16;
      v26 = *((_QWORD *)v16 + 2);
      v21 = &v25;
      v20 = v19;
LABEL_24:
      objc_msgSend(v20, "setEndTime:", v21, v25, v26);
      ++v15;
    }
  }
  -[AVCaptureDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("reactionEffectsInProgress"));
  os_unfair_lock_lock(&sReactionsLock);

  self->_internal->activeReactions = (NSMutableArray *)v13;
  os_unfair_lock_unlock(&sReactionsLock);
  -[AVCaptureDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("reactionEffectsInProgress"));

}

+ (void)setReactionEffectsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setUpReactionEffectsStateOnce");
  if (dword_1ECFED700)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, v7, v8);
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v5, sReactionsEnabledKey);
  os_unfair_lock_lock(&sReactionsLock);
  os_unfair_lock_unlock(&sReactionsLock);
  if (dword_1ECFED700)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

+ (void)setReactionEffectGesturesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setUpReactionEffectsStateOnce");
  if (dword_1ECFED700)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, v7, v8);
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v5, sGesturesEnabledKey);
  os_unfair_lock_lock(&sReactionsLock);
  os_unfair_lock_unlock(&sReactionsLock);
  if (dword_1ECFED700)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __59__AVCaptureDevice_setUpGesturesDefaultDisabledNotification__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_haveShownGesturesDefaultDisabledNotificationChanged:");
}

+ (void)_haveShownGesturesDefaultDisabledNotificationChanged:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setupKVOLoggingOnce");
  if (sDetailedKVOOverrideLogging)
  {
    FigCopyBacktrace();
    if (dword_1ECFED700)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      LODWORD(a3) = objc_msgSend(a3, "BOOLValue");
    else
      LODWORD(a3) = 0;
  }
  os_unfair_lock_lock(&sGesturesDefaultDisabledNotificationLock);
  v6 = sHaveShownGesturesDefaultDisabledNotification;
  os_unfair_lock_unlock(&sGesturesDefaultDisabledNotificationLock);
  if (v6 != (_DWORD)a3)
  {
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("haveShownGesturesDefaultDisabledNotification"));
    os_unfair_lock_lock(&sGesturesDefaultDisabledNotificationLock);
    sHaveShownGesturesDefaultDisabledNotification = (char)a3;
    os_unfair_lock_unlock(&sGesturesDefaultDisabledNotificationLock);
    if (dword_1ECFED700)
    {
      v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("haveShownGesturesDefaultDisabledNotification"), v8, v9);
  }
}

+ (void)requestGesturesDefaultDisabledNotification
{
  char v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = objc_msgSend(a1, "haveShownGesturesDefaultDisabledNotification");
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  if ((v2 & 1) == 0)
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", AVCaptureClientPreferencesDomain(), sRequestGesturesDefaultDisabledNotificationKey);
}

- (BOOL)canPerformReactionEffects
{
  _BOOL4 v2;

  v2 = -[AVCaptureDeviceFormat reactionEffectsSupported](-[AVCaptureDevice activeFormat](self, "activeFormat"), "reactionEffectsSupported");
  if (v2)
    LOBYTE(v2) = +[AVCaptureDevice reactionEffectsEnabled](AVCaptureDevice, "reactionEffectsEnabled");
  return v2;
}

- (NSSet)availableReactionTypes
{
  +[AVCaptureDevice setUpReactionEffectsStateOnce](AVCaptureDevice, "setUpReactionEffectsStateOnce");
  return (NSSet *)sAvailableReactions;
}

- (void)performEffectForReaction:(AVCaptureReactionType)reactionType
{
  __CFString *v5;
  void *v6;

  +[AVCaptureDevice setUpReactionEffectsStateOnce](AVCaptureDevice, "setUpReactionEffectsStateOnce");
  if ((objc_msgSend((id)sAvailableReactions, "containsObject:", reactionType) & 1) != 0)
  {
    v5 = AVCaptureClientPreferencesDomain();
    AVControlCenterVideoEffectsModulePerformReactionEffect((uint64_t)reactionType, (uint64_t)v5, self);
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

+ (void)setUpBackgroundReplacementStateOnce
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = a1;
  if (setUpBackgroundReplacementStateOnce_onceToken != -1)
    dispatch_once(&setUpBackgroundReplacementStateOnce_onceToken, block);
}

uint64_t __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[15];

  v2 = AVCaptureClientPreferencesDomain();
  sBackgroundReplacementEnabledKey = (uint64_t)(id)AVControlCenterVideoEffectsBackgroundReplacementEnabledPreferenceKey(v2);
  v3 = AVCaptureClientPreferencesDomain();
  sBackgroundReplacementUnavailableReasonsKey = (uint64_t)(id)AVControlCenterVideoEffectsBackgroundReplacementUnavailableReasonsPreferenceKey(v3);
  v4 = AVCaptureClientPreferencesDomain();
  sBackgroundReplacementURLBookmarkKey = (uint64_t)(id)AVControlCenterVideoEffectsBackgroundReplacementURLBookmarkPreferenceKey(v4);
  v5 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", sBackgroundReplacementEnabledKey);
  if (v5)
    sBackgroundReplacementEnabled = objc_msgSend(v5, "BOOLValue");
  v6 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", sBackgroundReplacementURLBookmarkKey);
  if (v6)
    sBackgroundReplacementURLBookmark = (uint64_t)v6;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = MEMORY[0x1E0C809B0];
  v13[10] = MEMORY[0x1E0C809B0];
  v13[11] = 3221225472;
  v13[12] = __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke_2;
  v13[13] = &unk_1E4216450;
  v13[14] = v7;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  v9 = *(_QWORD *)(a1 + 32);
  v13[5] = v8;
  v13[6] = 3221225472;
  v13[7] = __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke_3;
  v13[8] = &unk_1E4216450;
  v13[9] = v9;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = AVControlCenterVideoEffectsBackgroundReplacementURLRemovedSignalKey();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke_4;
  v13[3] = &unk_1E4216450;
  v13[4] = *(_QWORD *)(a1 + 32);
  return +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", v10, v11, 0, v13);
}

uint64_t __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundReplacementEnabledChanged:");
}

uint64_t __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundReplacementURLBookmarkChanged:");
}

uint64_t __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke_4_cold_1();
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "backgroundReplacementURL"), "URLByResolvingSymlinksInPath"), "URLByStandardizingPath");
  v6 = objc_msgSend((id)objc_msgSend(a3, "URLByResolvingSymlinksInPath"), "URLByStandardizingPath");
  if (!v5)
    return objc_msgSend(*(id *)(a1 + 32), "setBackgroundReplacementURL:", +[AVCaptureDevice backgroundReplacementURLDefault](AVCaptureDevice, "backgroundReplacementURLDefault"));
  result = objc_msgSend(v5, "isEqual:", v6);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "setBackgroundReplacementURL:", +[AVCaptureDevice backgroundReplacementURLDefault](AVCaptureDevice, "backgroundReplacementURLDefault"));
  return result;
}

+ (void)_backgroundReplacementEnabledChanged:(id)a3
{
  id v3;
  int v5;

  v3 = a3;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      LODWORD(v3) = objc_msgSend(v3, "BOOLValue");
    else
      LODWORD(v3) = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sBackgroundReplacementLock);
  v5 = sBackgroundReplacementEnabled;
  os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
  if (v5 != (_DWORD)v3)
  {
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("backgroundReplacementEnabled"));
    os_unfair_lock_lock((os_unfair_lock_t)&sBackgroundReplacementLock);
    sBackgroundReplacementEnabled = (char)v3;
    os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("backgroundReplacementEnabled"));
  }
}

+ (void)_backgroundReplacementURLBookmarkChanged:(id)a3
{
  id v3;
  char v5;

  v3 = a3;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v3 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sBackgroundReplacementLock);
  if ((id)sBackgroundReplacementURLBookmark == v3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
  }
  else
  {
    v5 = objc_msgSend((id)sBackgroundReplacementURLBookmark, "isEqual:", v3);
    os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
    if ((v5 & 1) == 0)
    {
      objc_msgSend(a1, "willChangeValueForKey:", CFSTR("backgroundReplacementURL"));
      objc_msgSend(a1, "willChangeValueForKey:", CFSTR("backgroundReplacementPixelBuffer"));
      os_unfair_lock_lock((os_unfair_lock_t)&sBackgroundReplacementLock);
      if (sBackgroundReplacementPixelBuffer)
      {
        CFRelease((CFTypeRef)sBackgroundReplacementPixelBuffer);
        sBackgroundReplacementPixelBuffer = 0;
      }

      sBackgroundReplacementURLBookmark = (uint64_t)v3;
      os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
      objc_msgSend(a1, "didChangeValueForKey:", CFSTR("backgroundReplacementURL"));
      objc_msgSend(a1, "didChangeValueForKey:", CFSTR("backgroundReplacementPixelBuffer"));
    }
  }
}

+ (void)setBackgroundReplacementEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;

  v3 = a3;
  objc_msgSend(a1, "setUpBackgroundReplacementStateOnce");
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v4, sBackgroundReplacementEnabledKey);
}

+ (void)setBackgroundReplacementURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "setUpBackgroundReplacementStateOnce");
  if (!a3)
    a3 = (id)objc_msgSend(a1, "backgroundReplacementURLDefault");
  v6 = 0;
  v5 = objc_msgSend(a3, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 0, 0, 0, &v6);
  if (!v6)
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v5, sBackgroundReplacementURLBookmarkKey);
}

+ (id)backgroundReplacementURLDefault
{
  return 0;
}

+ (id)backgroundReplacementURL
{
  void *v3;
  uint64_t v5;

  objc_msgSend(a1, "setUpBackgroundReplacementStateOnce");
  v5 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&sBackgroundReplacementLock);
  if (sBackgroundReplacementURLBookmark)
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", sBackgroundReplacementURLBookmark, 256, 0, 0, &v5);
  else
    v3 = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
  if (v5)
  {
    v3 = (void *)objc_msgSend(a1, "backgroundReplacementURLDefault");
    objc_msgSend(a1, "setBackgroundReplacementURL:", v3);
  }
  return v3;
}

+ (__CVBuffer)backgroundReplacementPixelBuffer
{
  CFTypeRef v3;
  __CVBuffer *v4;

  objc_msgSend(a1, "setUpBackgroundReplacementStateOnce");
  os_unfair_lock_lock((os_unfair_lock_t)&sBackgroundReplacementLock);
  if (sBackgroundReplacementPixelBuffer)
  {
    v3 = CFRetain((CFTypeRef)sBackgroundReplacementPixelBuffer);
    v4 = (__CVBuffer *)CFAutorelease(v3);
    os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
    if (v4)
      return v4;
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
  }
  v4 = +[AVCaptureProprietaryDefaultsSingleton imageForKey:fillWidth:fillHeight:](AVCaptureProprietaryDefaultsSingleton, "imageForKey:fillWidth:fillHeight:", sBackgroundReplacementURLBookmarkKey, 1920, 1440);
  if (v4)
    return v4;
  objc_msgSend(a1, "setBackgroundReplacementURL:", objc_msgSend(a1, "backgroundReplacementURLDefault"));
  return +[AVCaptureProprietaryDefaultsSingleton imageForKey:fillWidth:fillHeight:](AVCaptureProprietaryDefaultsSingleton, "imageForKey:fillWidth:fillHeight:", sBackgroundReplacementURLBookmarkKey, 1920, 1440);
}

+ (void)setBackgroundReplacementPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *v5;
  void *v6;
  char v7;
  int v8;
  const void *v9;

  objc_msgSend(a1, "setUpBackgroundReplacementStateOnce");
  if (!a3)
    return;
  os_unfair_lock_lock((os_unfair_lock_t)&sBackgroundReplacementLock);
  v5 = (__CVBuffer *)sBackgroundReplacementPixelBuffer;
  os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
  if (v5 == a3)
    return;
  v6 = (void *)CMGetAttachment(a3, CFSTR("preference-image-url"), 0);
  if (!v6)
  {
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("backgroundReplacementPixelBuffer"));
    goto LABEL_7;
  }
  v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "URLByResolvingSymlinksInPath"), "URLByStandardizingPath"), "isEqual:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "backgroundReplacementURL"), "URLByResolvingSymlinksInPath"), "URLByStandardizingPath"));
  objc_msgSend(a1, "willChangeValueForKey:", CFSTR("backgroundReplacementPixelBuffer"));
  if ((v7 & 1) == 0)
  {
LABEL_7:
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("backgroundReplacementURL"));
    objc_msgSend(a1, "setBackgroundReplacementURL:", v6);
    v8 = 1;
    goto LABEL_8;
  }
  v8 = 0;
LABEL_8:
  v9 = (const void *)sBackgroundReplacementPixelBuffer;
  sBackgroundReplacementPixelBuffer = (uint64_t)a3;
  CFRetain(a3);
  if (v9)
    CFRelease(v9);
  if (v8)
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("backgroundReplacementURL"));
  objc_msgSend(a1, "didChangeValueForKey:", CFSTR("backgroundReplacementPixelBuffer"));
  if (sBackgroundReplacementPixelBuffer)
  {
    CFRelease((CFTypeRef)sBackgroundReplacementPixelBuffer);
    sBackgroundReplacementPixelBuffer = 0;
  }
}

+ (BOOL)isEligibleForBackgroundReplacement
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AVCaptureDevice_isEligibleForBackgroundReplacement__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = a1;
  if (isEligibleForBackgroundReplacement_onceToken != -1)
    dispatch_once(&isEligibleForBackgroundReplacement_onceToken, block);
  return isEligibleForBackgroundReplacement_sIsEligibleForBackgroundReplacement;
}

uint64_t __53__AVCaptureDevice_isEligibleForBackgroundReplacement__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_checkEligiblityForEffect:", AVCaptureBundleCameraBackgroundReplacementEnabledKey);
  isEligibleForBackgroundReplacement_sIsEligibleForBackgroundReplacement = result;
  return result;
}

+ (BOOL)isBackgroundReplacementEnabled
{
  char v2;

  objc_msgSend(a1, "setUpBackgroundReplacementStateOnce");
  os_unfair_lock_lock((os_unfair_lock_t)&sBackgroundReplacementLock);
  v2 = sBackgroundReplacementEnabled;
  os_unfair_lock_unlock((os_unfair_lock_t)&sBackgroundReplacementLock);
  return v2;
}

- (BOOL)isBackgroundReplacementActive
{
  return 0;
}

+ (id)_listEligibleEffects
{
  if (_listEligibleEffects_onceToken != -1)
    dispatch_once(&_listEligibleEffects_onceToken, &__block_literal_global_328);
  return (id)_listEligibleEffects_sEligibleEffectSet;
}

uint64_t __39__AVCaptureDevice__listEligibleEffects__block_invoke()
{
  __CFString *v0;
  unint64_t v1;
  uint64_t v2;
  __objc2_class **p_superclass;
  void *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t result;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  int v19;
  NSObject *v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  const char *v24;
  int *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  os_log_type_t type;
  unsigned int v35;
  int v36;
  const char *v37;
  __int16 v38;
  __CFString *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  uint64_t v45;
  _BYTE v46[128];
  _QWORD v47[6];

  v47[4] = *MEMORY[0x1E0C80C00];
  v0 = AVCaptureClientPreferencesDomain();
  v1 = 0x1E0C99000uLL;
  v47[0] = AVCaptureBundleCameraPortraitEffectEnabledKey;
  v47[1] = AVCaptureBundleCameraStudioLightEnabledKey;
  v47[2] = AVCaptureBundleCameraReactionEffectsEnabledKey;
  v47[3] = AVCaptureBundleCameraBackgroundReplacementEnabledKey;
  v2 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4));
  p_superclass = &OBJC_METACLASS___AVCaptureFileOutput.superclass;
  if (!_listEligibleEffects_sEligibleEffectSet)
  {
    v4 = (void *)v2;
    if ((-[__CFString isEqual:](v0, "isEqual:", 0x1E4221E08) & 1) != 0
      || (-[__CFString isEqual:](v0, "isEqual:", 0x1E4221E48) & 1) != 0
      || (-[__CFString isEqual:](v0, "isEqual:", 0x1E4221E88) & 1) != 0
      || (AVCaptureClientIsContinuityCapture() & 1) != 0
      || (AVCaptureIsRunningInXCTest() & 1) != 0
      || (AVCaptureClientIsInternalCommandLineTool() & 1) != 0
      || AVCaptureClientIsInternalTestTool())
    {
      if (dword_1ECFED700)
      {
        v35 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      _listEligibleEffects_sEligibleEffectSet = v4;
    }
    else
    {
      v11 = (void *)MEMORY[0x1A1AF16C4]();
      v12 = (void *)objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend((id)objc_msgSend(v12, "UIBackgroundModes"), "containsObject:", CFSTR("voip")))
      {
        if (dword_1ECFED700)
        {
          v35 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      else
      {
        v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v15 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
        if (v15)
        {
          v16 = v15;
          v27 = v11;
          v28 = v0;
          v29 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v31 != v29)
                objc_enumerationMutation(v4);
              v18 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
              v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "infoDictionary", v25, v26), "objectForKey:ofClass:", v18, objc_opt_class()), "BOOLValue");
              if (v19)
                objc_msgSend(v14, "addObject:", v18);
              if (dword_1ECFED700)
              {
                v35 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v21 = v35;
                if (os_log_type_enabled(v20, type))
                  v22 = v21;
                else
                  v22 = v21 & 0xFFFFFFFE;
                if (v22)
                {
                  v23 = objc_msgSend(v12, "bundleIdentifier");
                  v36 = 136316162;
                  v24 = "is NOT";
                  if (v19)
                    v24 = "is";
                  v37 = "+[AVCaptureDevice _listEligibleEffects]_block_invoke";
                  v38 = 2112;
                  v39 = v28;
                  v40 = 2112;
                  v41 = v23;
                  v42 = 2080;
                  v43 = v24;
                  v44 = 2112;
                  v45 = v18;
                  LODWORD(v26) = 52;
                  v25 = &v36;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
            v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
          }
          while (v16);
          v4 = v14;
          v1 = 0x1E0C99000;
          v0 = v28;
          p_superclass = (__objc2_class **)(&OBJC_METACLASS___AVCaptureFileOutput + 8);
          v11 = v27;
        }
        else
        {
          v4 = v14;
        }
      }
      p_superclass[263] = (__objc2_class *)v4;
      objc_autoreleasePoolPop(v11);
    }
  }
  v6 = AVControlCenterVideoEffectsEligibleEffectListPreferenceKey(v0);
  v7 = *(void **)(v1 + 3680);
  v8 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", v6);
  if (v8)
    v9 = v8;
  else
    v9 = (id)MEMORY[0x1E0C9AA60];
  result = objc_msgSend((id)objc_msgSend(v7, "setWithArray:", v9, v25, v26), "isEqualToSet:", p_superclass[263]);
  if ((result & 1) == 0)
    return +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", -[__objc2_class allObjects](p_superclass[263], "allObjects"), v6);
  return result;
}

+ (AVCaptureMicrophoneMode)preferredMicrophoneMode
{
  AVCaptureMicrophoneMode v2;

  objc_msgSend(a1, "setUpMicrophoneModeStateOnce");
  os_unfair_lock_lock((os_unfair_lock_t)&sMicrophoneModeLock);
  v2 = sPreferredMicrophoneMode;
  os_unfair_lock_unlock((os_unfair_lock_t)&sMicrophoneModeLock);
  return v2;
}

+ (AVCaptureMicrophoneMode)activeMicrophoneMode
{
  AVCaptureMicrophoneMode v2;

  objc_msgSend(a1, "setUpMicrophoneModeStateOnce");
  os_unfair_lock_lock((os_unfair_lock_t)&sMicrophoneModeLock);
  v2 = sActiveMicrophoneMode;
  os_unfair_lock_unlock((os_unfair_lock_t)&sMicrophoneModeLock);
  return v2;
}

+ (void)setUpMicrophoneModeStateOnce
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVCaptureDevice_setUpMicrophoneModeStateOnce__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = a1;
  if (setUpMicrophoneModeStateOnce_onceToken != -1)
    dispatch_once(&setUpMicrophoneModeStateOnce_onceToken, block);
}

uint64_t __47__AVCaptureDevice_setUpMicrophoneModeStateOnce__block_invoke(uint64_t a1)
{
  __CFString *v2;
  uint64_t v3;
  __CFString *v4;
  uint64_t active;
  id v6;
  id v7;
  uint64_t v8;

  v2 = AVCaptureClientPreferencesDomain();
  v3 = AVControlCenterAudioPreferredMicrophoneModePreferenceKey(v2);
  v4 = AVCaptureClientPreferencesDomain();
  active = AVControlCenterAudioActiveMicrophoneModePreferenceKey(v4);
  v6 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", v3);
  if (v6)
    sPreferredMicrophoneMode = objc_msgSend(v6, "integerValue");
  v7 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", active);
  if (v7)
    sActiveMicrophoneMode = objc_msgSend(v7, "integerValue");
  v8 = MEMORY[0x1E0C809B0];
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:");
  return +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", v8, 3221225472, __47__AVCaptureDevice_setUpMicrophoneModeStateOnce__block_invoke_3, &unk_1E4216450, *(_QWORD *)(a1 + 32));
}

uint64_t __47__AVCaptureDevice_setUpMicrophoneModeStateOnce__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_preferredMicrophoneModeChanged:");
}

uint64_t __47__AVCaptureDevice_setUpMicrophoneModeStateOnce__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activeMicrophoneModeChanged:");
}

+ (void)_preferredMicrophoneModeChanged:(id)a3
{
  id v3;
  uint64_t v5;

  v3 = a3;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (id)objc_msgSend(v3, "integerValue");
    else
      v3 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sMicrophoneModeLock);
  v5 = sPreferredMicrophoneMode;
  os_unfair_lock_unlock((os_unfair_lock_t)&sMicrophoneModeLock);
  if ((id)v5 != v3)
  {
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("preferredMicrophoneMode"));
    os_unfair_lock_lock((os_unfair_lock_t)&sMicrophoneModeLock);
    sPreferredMicrophoneMode = (uint64_t)v3;
    os_unfair_lock_unlock((os_unfair_lock_t)&sMicrophoneModeLock);
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("preferredMicrophoneMode"));
  }
}

+ (void)_activeMicrophoneModeChanged:(id)a3
{
  id v3;
  uint64_t v5;

  v3 = a3;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (id)objc_msgSend(v3, "integerValue");
    else
      v3 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sMicrophoneModeLock);
  v5 = sActiveMicrophoneMode;
  os_unfair_lock_unlock((os_unfair_lock_t)&sMicrophoneModeLock);
  if ((id)v5 != v3)
  {
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("activeMicrophoneMode"));
    os_unfair_lock_lock((os_unfair_lock_t)&sMicrophoneModeLock);
    sActiveMicrophoneMode = (uint64_t)v3;
    os_unfair_lock_unlock((os_unfair_lock_t)&sMicrophoneModeLock);
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("activeMicrophoneMode"));
  }
}

+ (void)showSystemUserInterface:(AVCaptureSystemUserInterface)systemUserInterface
{
  void *v3;

  if ((unint64_t)(systemUserInterface - 1) >= 2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
  else
  {
    FigCaptureSourceRemoteShowSystemUserInterface();
  }
}

- (BOOL)isAutoRedEyeReductionSupported
{
  return 0;
}

- (BOOL)isVideoStabilizationSupported
{
  return 0;
}

- (BOOL)isCameraIntrinsicMatrixDeliverySupported
{
  return 0;
}

- (BOOL)isConstituentPhotoCalibrationDataSupported
{
  return 0;
}

- (BOOL)isVideoZoomSmoothingSupported
{
  return 0;
}

- (BOOL)isResponsiveCaptureWithDepthSupported
{
  return 0;
}

- (BOOL)isLowLightBoostEnabled
{
  return 0;
}

- (BOOL)automaticallyEnablesLowLightBoostWhenAvailable
{
  return 0;
}

- (void)setAutomaticallyEnablesLowLightBoostWhenAvailable:(BOOL)automaticallyEnablesLowLightBoostWhenAvailable
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (AVCaptureSystemPressureState)systemPressureState
{
  return -[AVCaptureSystemPressureState initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:]([AVCaptureSystemPressureState alloc], "initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:", 0, 0, 0);
}

- (int64_t)shallowDepthOfFieldEffectStatus
{
  return 0;
}

- (BOOL)isContinuousZoomWithDepthSupported
{
  return 0;
}

- (BOOL)isContinuousZoomWithDepthEnabled
{
  return 0;
}

- (void)setContinuousZoomWithDepthEnabled:(BOOL)a3
{
  void *v3;

  if (a3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
}

- (id)supportedMetadataObjectIdentifiers
{
  return 0;
}

- (id)supportedVisionDataProperties
{
  return 0;
}

- (BOOL)isEyeDetectionSupported
{
  return 0;
}

- (BOOL)isEyeClosedDetectionSupported
{
  return 0;
}

- (BOOL)isSmileDetectionSupported
{
  return 0;
}

- (void)setEyeDetectionEnabled:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (void)setEyeClosedDetectionEnabled:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (void)setSmileDetectionEnabled:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)eyeDetectionEnabled
{
  return 0;
}

- (BOOL)eyeClosedDetectionEnabled
{
  return 0;
}

- (BOOL)smileDetectionEnabled
{
  return 0;
}

- (id)availableBoxedMetadataFormatDescriptions
{
  return 0;
}

- (BOOL)isAttentionDetectionSupported
{
  return 0;
}

- (id)AVVideoSettingsForSessionPreset:(id)a3
{
  return 0;
}

- ($2825F4736939C4A6D3AD43837233062D)maxH264PhotoDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)0;
}

- ($2825F4736939C4A6D3AD43837233062D)maxH264VideoDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)0;
}

- (int)minMacroblocksForHighProfileUpTo30fps
{
  return 0;
}

- (int)minMacroblocksForHighProfileAbove30fps
{
  return 0;
}

- (BOOL)usesQuantizationScalingMatrix_H264_Steep_16_48
{
  return 0;
}

- (int)hevcTurboModeVersion
{
  return 0;
}

- (BOOL)hevcAllowBFramesForHighCTUCount
{
  return 0;
}

- (BOOL)isHEVCRelaxedAverageBitRateTargetSupported
{
  return 0;
}

- (BOOL)isHEVCSupported
{
  return 0;
}

- (BOOL)isHEVCPreferred
{
  return 0;
}

- (BOOL)isProResSupported
{
  return 0;
}

- (BOOL)isHEIFSupported
{
  return 0;
}

- (BOOL)isMotionCompensatedTemporalFilteringSupported
{
  return 0;
}

- (id)bravoCameraSelectionBehavior
{
  return CFSTR("AVCaptureBravoCameraSelectionBehaviorUnsupported");
}

- (void)setPrimaryConstituentDeviceSwitchingBehavior:(AVCapturePrimaryConstituentDeviceSwitchingBehavior)switchingBehavior restrictedSwitchingBehaviorConditions:(AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions)restrictedSwitchingBehaviorConditions
{
  void *v4;

  if (restrictedSwitchingBehaviorConditions | switchingBehavior)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
}

- (AVCapturePrimaryConstituentDeviceSwitchingBehavior)primaryConstituentDeviceSwitchingBehavior
{
  return 0;
}

- (AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions)primaryConstituentDeviceRestrictedSwitchingBehaviorConditions
{
  return 0;
}

- (AVCapturePrimaryConstituentDeviceSwitchingBehavior)activePrimaryConstituentDeviceSwitchingBehavior
{
  return 0;
}

- (AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions)activePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions
{
  return 0;
}

- (AVCaptureDevice)activePrimaryConstituentDevice
{
  return 0;
}

- (NSArray)supportedFallbackPrimaryConstituentDevices
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)fallbackPrimaryConstituentDevices
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)setFallbackPrimaryConstituentDevices:(NSArray *)fallbackPrimaryConstituentDevices
{
  void *v3;

  if (-[NSArray count](fallbackPrimaryConstituentDevices, "count"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
}

- (id)preferredPrimaryConstituentDevice
{
  return 0;
}

- (BOOL)isFocusedAtMacro
{
  return 0;
}

- (NSInteger)minimumFocusDistance
{
  return -1;
}

- (BOOL)_isDepthDataDeliveryEnabled
{
  return 0;
}

- (int)faceDrivenAEAFMode
{
  return 0;
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)isTimeOfFlightProjectorModeSupported:(int64_t)a3
{
  return a3 == 0;
}

- (int64_t)timeOfFlightProjectorMode
{
  return 0;
}

- (void)setTimeOfFlightProjectorMode:(int64_t)a3
{
  void *v3;

  if (!-[AVCaptureDevice isTimeOfFlightProjectorModeSupported:](self, "isTimeOfFlightProjectorModeSupported:", a3))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
}

- (int64_t)timeOfFlightBankCount
{
  return 0;
}

- (BOOL)isSpatialOverCaptureEnabled
{
  return 0;
}

- (void)setSpatialOverCaptureEnabled:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isNonDestructiveCropEnabled
{
  return 0;
}

- (void)setNonDestructiveCropEnabled:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (int64_t)nonDestructiveCropAspectRatio
{
  return 0;
}

- (void)setNonDestructiveCropAspectRatio:(int64_t)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isCinematicVideoFocusAtPointSupported
{
  return 0;
}

- (void)setCinematicVideoFocusAtPoint:(CGPoint)a3 objectID:(int64_t)a4 isHardFocus:(BOOL)a5 isFixedPlaneFocus:(BOOL)a6
{
  void *v6;

  if (!-[AVCaptureDevice isCinematicVideoFocusAtPointSupported](self, "isCinematicVideoFocusAtPointSupported", a4, a5, a6, a3.x, a3.y))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

+ (id)continuityCaptureCameraCapabilities
{
  void *v2;
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  _QWORD v13[8];

  v13[5] = *MEMORY[0x1E0C80C00];
  if (continuityCaptureCameraCapabilities_onceToken != -1)
    dispatch_once(&continuityCaptureCameraCapabilities_onceToken, &__block_literal_global_365);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v2 = (void *)getCMContinuityCaptureCapabilitiesClass_softClass;
  v12 = getCMContinuityCaptureCapabilitiesClass_softClass;
  if (!getCMContinuityCaptureCapabilitiesClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getCMContinuityCaptureCapabilitiesClass_block_invoke;
    v13[3] = &unk_1E42165D0;
    v13[4] = &v7;
    __getCMContinuityCaptureCapabilitiesClass_block_invoke((uint64_t)v13);
    v2 = (void *)v8[5];
  }
  _Block_object_dispose(&v7, 8);
  v3 = (void *)objc_msgSend((id)objc_msgSend(v2, "capabilitiesForCurrentDevice"), "dictionaryRepresentation");
  if (AVCaptureClientIsRapport())
    -[objc_class _releaseStaticResources](NSClassFromString(CFSTR("AVCaptureFigVideoDevice")), "_releaseStaticResources");
  if (dword_1ECFED700)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1ECFED700)
    {
      v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return v3;
}

uint64_t __54__AVCaptureDevice_continuityCaptureCameraCapabilities__block_invoke()
{
  id v0;
  id v1;
  AVCaptureBlockKVOObserver *v2;
  AVCaptureBlockKVOObserver *v3;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99EA0]);
  continuityCaptureCameraCapabilities_cameraCaptureUserDefaults = objc_msgSend(v0, "initWithSuiteName:", *MEMORY[0x1E0D03A88]);
  v1 = objc_alloc(MEMORY[0x1E0C99EA0]);
  continuityCaptureCameraCapabilities_cameraCaptureVolatileUserDefaults = objc_msgSend(v1, "initWithSuiteName:", *MEMORY[0x1E0D03A98]);
  v2 = [AVCaptureBlockKVOObserver alloc];
  continuityCaptureCameraCapabilities_continuityCaptureDisabledObserver = -[AVCaptureBlockKVOObserver initWithObjectToObserve:keyPath:options:handler:](v2, "initWithObjectToObserve:keyPath:options:handler:", continuityCaptureCameraCapabilities_cameraCaptureUserDefaults, *MEMORY[0x1E0D03A90], 3, &__block_literal_global_369);
  v3 = [AVCaptureBlockKVOObserver alloc];
  result = -[AVCaptureBlockKVOObserver initWithObjectToObserve:keyPath:options:handler:](v3, "initWithObjectToObserve:keyPath:options:handler:", continuityCaptureCameraCapabilities_cameraCaptureVolatileUserDefaults, *MEMORY[0x1E0D03AA0], 3, &__block_literal_global_371);
  continuityCaptureCameraCapabilities_continuityCaptureInUseObserver = result;
  return result;
}

uint64_t __54__AVCaptureDevice_continuityCaptureCameraCapabilities__block_invoke_2()
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVCaptureDeviceContinuityCaptureCameraCapabilitiesChangedNotification"), 0);
}

uint64_t __54__AVCaptureDevice_continuityCaptureCameraCapabilities__block_invoke_3()
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVCaptureDeviceContinuityCaptureCameraCapabilitiesChangedNotification"), 0);
}

+ (id)continuityCaptureLastUsedDate
{
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = (void *)CFPreferencesCopyValue((CFStringRef)*MEMORY[0x1E0D03AA8], (CFStringRef)*MEMORY[0x1E0D03A98], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (dword_1ECFED700)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

- (BOOL)isContinuityCamera
{
  return 0;
}

- (id)continuityDeviceUniqueID
{
  return 0;
}

- (AVCaptureDevice)companionDeskViewCamera
{
  return 0;
}

- (void)setDeskViewCameraMode:(int64_t)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (int64_t)deskViewCameraMode
{
  return 0;
}

- (BOOL)isDeskViewCameraModeSupported:(int64_t)a3
{
  return 0;
}

- (id)hardwareUniformType
{
  return 0;
}

- (BOOL)isManualFramingSupported
{
  return 0;
}

- (BOOL)isManualFramingEnabled
{
  return 0;
}

- (void)setManualFramingEnabled:(BOOL)a3
{
  void *v3;

  if (!-[AVCaptureDevice isManualFramingSupported](self, "isManualFramingSupported", a3))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
}

- (void)setCenterStageFieldOfViewRestrictedToWide:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isCenterStageFieldOfViewRestrictedToWide
{
  return 0;
}

- (void)setManualFramingPanningAngleX:(float)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (float)manualFramingPanningAngleX
{
  return 0.0;
}

- (void)setManualFramingPanningAngleY:(float)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (float)manualFramingPanningAngleY
{
  return 0.0;
}

- (void)startPanningAtPoint:(CGPoint)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (void)panWithTranslation:(CGPoint)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (void)performOneShotFraming
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v2);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v2);
}

- (void)resetFraming
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v2);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v2);
}

- (double)manualFramingMinZoomFactor
{
  return 1.0;
}

- (double)manualFramingMaxZoomFactor
{
  return 1.0;
}

- (double)manualFramingDefaultZoomFactor
{
  return 1.0;
}

- (BOOL)isGazeSelectionEnabled
{
  return 0;
}

- (void)setGazeSelectionEnabled:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (CGFloat)displayVideoZoomFactorMultiplier
{
  return 1.0;
}

- (id)serializedProcessingSettings
{
  return 0;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (int32_t)transportType
{
  return self->_transportType;
}

- (BOOL)isInUseByAnotherApplication
{
  return self->_inUseByAnotherApplication;
}

- (NSArray)linkedDevices
{
  return self->_linkedDevices;
}

- (NSArray)inputSources
{
  return self->_inputSources;
}

+ (id)proprietaryDefaultsDomainForAuditToken:(id *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v3;
  return +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsDomainForAuditToken:](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsDomainForAuditToken:", v5);
}

+ (void)ensureServerConnection
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED700)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  +[AVCaptureProprietaryDefaultsSingleton retryPriorFailedKeyObservationRegistrations](AVCaptureProprietaryDefaultsSingleton, "retryPriorFailedKeyObservationRegistrations", v4, v5);
  if (dword_1ECFED700)
  {
    v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (BOOL)isDockedTrackingSupported
{
  return 0;
}

- (void)setDockedTrackingEnabled:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v3);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
}

- (BOOL)isDockedTrackingEnabled
{
  return 0;
}

- (BOOL)isSceneClassificationActive
{
  return 0;
}

- (float)documentSceneConfidence
{
  return -1.0;
}

- (unint64_t)stereoCaptureStatus
{
  return 1;
}

- (unint64_t)stereoVideoCaptureStatus
{
  return 1;
}

- (id)spatialCaptureDiscomfortReasons
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

void __54__AVCaptureDevice_setUpBackgroundReplacementStateOnce__block_invoke_4_cold_1()
{
  __assert_rtn("+[AVCaptureDevice setUpBackgroundReplacementStateOnce]_block_invoke_4", "AVCaptureDevice.m", 4253, "[newValue isKindOfClass:[NSURL class]]");
}

@end
