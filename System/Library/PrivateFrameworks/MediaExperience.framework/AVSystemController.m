@implementation AVSystemController

+ (id)sharedAVSystemController
{
  return +[AVSystemController sharedInstance](AVSystemController, "sharedInstance");
}

- (BOOL)getActiveCategoryVolume:(float *)a3 andName:(id *)a4
{
  return -[AVSystemController getActiveCategoryVolume:andName:fallbackCategory:](self, "getActiveCategoryVolume:andName:fallbackCategory:", a3, a4, 0);
}

void __83__AVSystemController_InternalUse__postNotificationOnMainQueue_notification_object___block_invoke(uint64_t a1)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 48));
  if (Weak)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 32), Weak, *(_QWORD *)(a1 + 40));

}

- (BOOL)getVolume:(float *)a3 forCategory:(id)a4
{
  return -[AVSystemController getVolume:forCategory:mode:](self, "getVolume:forCategory:mode:", a3, a4, 0);
}

- (void)postEffectiveVolumeNotification:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *mCategory;
  id v11;
  float v12;
  float v13;
  id v14;
  NSString *v15;
  float mVolume;
  const __CFString *v17;
  id v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  id v24;

  v23 = 1065353216;
  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("Volume"));
  v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AudioCategory"));
  v24 = v6;
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("Reason"));
  v8 = objc_msgSend(a3, "objectForKey:", CFSTR("SilenceVolumeHUD"));
  v9 = objc_msgSend(a3, "objectForKey:", CFSTR("ActiveAudioCategory"));
  if (!v8)
    v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  mCategory = self->mCategory;
  if (!mCategory)
  {
    if (v6)
    {
      if (v5)
      {
        objc_msgSend(v5, "floatValue");
LABEL_16:
        self->mVolume = v13;
        v14 = v24;
        self->mCategory = (NSString *)v24;
        goto LABEL_17;
      }
      -[AVSystemController getVolume:forCategory:mode:](self, "getVolume:forCategory:mode:", &v23, v6, 0);
    }
    else
    {
      -[AVSystemController getActiveCategoryVolume:andName:](self, "getActiveCategoryVolume:andName:", &v23, &v24);
    }
    v13 = *(float *)&v23;
    goto LABEL_16;
  }
  if (v6)
  {

    v11 = v6;
    self->mCategory = (NSString *)v6;
  }
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
  }
  else
  {
    -[AVSystemController getActiveCategoryVolume:andName:](self, "getActiveCategoryVolume:andName:", &v23, &v24);
    v12 = *(float *)&v23;
  }
  self->mVolume = v12;
LABEL_17:
  v15 = self->mCategory;
  mVolume = 0.0;
  if (!self->mFullMute)
    mVolume = self->mVolume;
  v23 = LODWORD(mVolume);
  if (v7)
    v17 = (const __CFString *)v7;
  else
    v17 = CFSTR("FullMuteChange");
  v18 = objc_alloc(MEMORY[0x1E0CB37E8]);
  LODWORD(v19) = v23;
  v20 = (void *)objc_msgSend(v18, "initWithFloat:", v19);
  v21 = objc_alloc(MEMORY[0x1E0C99D80]);
  v22 = (void *)objc_msgSend(v21, "initWithObjectsAndKeys:", v15, AVSystemController_EffectiveVolumeNotificationParameter_Category, v20, AVSystemController_EffectiveVolumeNotificationParameter_Volume, v17, AVSystemController_EffectiveVolumeNotificationParameter_VolumeChangeReason, v8, AVSystemController_EffectiveVolumeNotificationParameter_SilenceVolumeHUD, v9, AVSystemController_EffectiveVolumeNotificationParameter_ActiveAudioCategory, 0);
  +[AVSystemController postNotificationOnMainQueue:notification:object:](AVSystemController, "postNotificationOnMainQueue:notification:object:", v22, AVSystemController_EffectiveVolumeDidChangeNotification, self);

}

+ (void)postNotificationOnMainQueue:(id)a3 notification:(id)a4 object:(id)a5
{
  id v8;
  _QWORD v9[6];
  id v10;
  id location;

  v8 = a3;
  objc_initWeak(&location, a5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__AVSystemController_InternalUse__postNotificationOnMainQueue_notification_object___block_invoke;
  v9[3] = &unk_1E309D2F0;
  objc_copyWeak(&v10, &location);
  v9[4] = a4;
  v9[5] = a3;
  MXDispatchAsync((uint64_t)"+[AVSystemController(InternalUse) postNotificationOnMainQueue:notification:object:]", (uint64_t)"AVSystemController.m", 2464, 0, 0, MEMORY[0x1E0C80D38], (uint64_t)v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)volumeCategoryForAudioCategory:(id)a3
{
  OpaqueFigSystemController *mFigController;
  unsigned int (*v7)(OpaqueFigSystemController *, id, _QWORD, id *, _QWORD);
  id v8;

  if (volumeCategoryForAudioCategory__onceToken != -1)
    dispatch_once(&volumeCategoryForAudioCategory__onceToken, &__block_literal_global_503);
  if (!a3)
    a3 = CFSTR("Audio/Video");
  objc_msgSend((id)volumeCategoryForAudioCategory__volumeCategoryForAudioCategoryCacheLock, "lock");
  v8 = (id)objc_msgSend((id)volumeCategoryForAudioCategory__volumeCategoryForAudioCategoryCache, "valueForKey:", a3);
  objc_msgSend((id)volumeCategoryForAudioCategory__volumeCategoryForAudioCategoryCacheLock, "unlock");
  if (!v8)
  {
    mFigController = self->mFigController;
    v7 = *(unsigned int (**)(OpaqueFigSystemController *, id, _QWORD, id *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                              + 24);
    if (v7)
    {
      if (!v7(mFigController, a3, 0, &v8, 0))
      {
        objc_msgSend((id)volumeCategoryForAudioCategory__volumeCategoryForAudioCategoryCacheLock, "lock");
        objc_msgSend((id)volumeCategoryForAudioCategory__volumeCategoryForAudioCategoryCache, "setValue:forKey:", v8, a3);
        objc_msgSend((id)volumeCategoryForAudioCategory__volumeCategoryForAudioCategoryCacheLock, "unlock");
      }
    }
  }
  return v8;
}

- (BOOL)getVolume:(float *)a3 forCategory:(id)a4 mode:(id)a5
{
  OpaqueFigSystemController *mFigController;
  unsigned int (*v9)(OpaqueFigSystemController *, uint64_t, id, id, _QWORD, _QWORD, _QWORD, float *, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE);

  mFigController = self->mFigController;
  v9 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, id, _QWORD, _QWORD, _QWORD, float *, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  return v9 && v9(mFigController, 13, a4, a5, 0, 0, 0, a3, 0.0, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (id)pickableRoutesForCategory:(id)a3
{
  OpaqueFigSystemController *mFigController;
  void (*v5)(OpaqueFigSystemController *, const __CFString *, const __CFString *, void **);
  const __CFString *v6;
  void *v7;
  id v8;
  void *v10;

  v10 = 0;
  mFigController = self->mFigController;
  v5 = *(void (**)(OpaqueFigSystemController *, const __CFString *, const __CFString *, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v5)
  {
    if (a3)
      v6 = (const __CFString *)a3;
    else
      v6 = CFSTR("Audio/Video");
    v5(mFigController, v6, CFSTR("Default"), &v10);
    v7 = v10;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  if (v10)
    return v10;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)setAttribute:(id)a3 forKey:(id)a4 error:(id *)a5
{
  uint64_t v10;
  uint64_t v11;
  OpaqueFigSystemController *mFigController;
  uint64_t (*v13)(OpaqueFigSystemController *, uint64_t, id);
  uint64_t v14;
  int v15;
  uint64_t v16;
  const __CFString *v17;

  if (a5)
    *a5 = 0;
  if ((objc_msgSend(a4, "isEqualToString:", AVSystemController_IAmTheiPodAppAttribute) & 1) != 0)
    return 1;
  v10 = objc_msgSend((id)sSetAttributeForKeyMappingToFig, "valueForKey:", a4);
  if (v10)
  {
    v11 = v10;
    mFigController = self->mFigController;
    v13 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 56);
    if (v13)
      v14 = v13(mFigController, v11, a3);
    else
      v14 = 4294954514;
    v16 = 0;
    if (a5 && (_DWORD)v14)
    {
      v17 = CFSTR("setAttribute failed: '%@'");
      goto LABEL_18;
    }
  }
  else
  {
    v15 = objc_msgSend(a4, "isEqualToString:", AVSystemController_PostNotificationsFromMainThreadOnly);
    v16 = 0;
    if (v15)
      v14 = 0;
    else
      v14 = 4294967246;
    if ((v15 & 1) == 0 && a5)
    {
      v17 = CFSTR("unsupported attribute: '%@'");
      v14 = 4294967246;
LABEL_18:
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v17, 0, a4);
    }
  }
  if (a5)
  {
    if ((_DWORD)v14)
      *a5 = -[AVSystemController errorWithCode:description:](self, "errorWithCode:description:", v14, v16);
  }
  return (_DWORD)v14 == 0;
}

- (BOOL)getActiveCategoryVolume:(float *)a3 andName:(id *)a4 fallbackCategory:(id)a5
{
  OpaqueFigSystemController *mFigController;
  uint64_t (*v9)(OpaqueFigSystemController *, uint64_t, id, _QWORD, _QWORD, _QWORD, _QWORD, float *, float, float, float, _QWORD, id *, _QWORD, _BYTE);
  int v10;
  id v11;

  if (a4)
    *a4 = 0;
  mFigController = self->mFigController;
  v9 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, id, _QWORD, _QWORD, _QWORD, _QWORD, float *, float, float, float, _QWORD, id *, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v9)
  {
    v10 = -12782;
    if (!a4)
      return v10 == 0;
    goto LABEL_5;
  }
  v10 = v9(mFigController, 3, a5, 0, 0, 0, 0, a3, 0.0, 0.0, 0.0, 0, a4, 0, 0);
  if (a4)
LABEL_5:
    v11 = *a4;
  return v10 == 0;
}

- (id)pickableRoutesForCategory:(id)a3 andMode:(id)a4
{
  OpaqueFigSystemController *mFigController;
  void (*v7)(OpaqueFigSystemController *, const __CFString *, const __CFString *, void **);
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  void *v13;

  v13 = 0;
  mFigController = self->mFigController;
  v7 = *(void (**)(OpaqueFigSystemController *, const __CFString *, const __CFString *, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v7)
  {
    if (a4)
      v8 = (const __CFString *)a4;
    else
      v8 = CFSTR("Default");
    if (a3)
      v9 = (const __CFString *)a3;
    else
      v9 = CFSTR("Audio/Video");
    v7(mFigController, v9, v8, &v13);
    v10 = v13;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;
  if (v13)
    return v13;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (id)attributeForKey:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  OpaqueFigSystemController *mFigController;
  void (*v8)(OpaqueFigSystemController *, uint64_t, _QWORD, void **);
  void *v9;
  id v11;
  int v12;
  void *v13;
  void *v14;

  v14 = 0;
  v5 = objc_msgSend((id)sAttributeForKeyMappingToFig, "valueForKey:");
  if (v5)
  {
    v6 = v5;
    mFigController = self->mFigController;
    v8 = *(void (**)(OpaqueFigSystemController *, uint64_t, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 8)
                                                                                      + 48);
    if (v8)
    {
      v8(mFigController, v6, *MEMORY[0x1E0C9AE00], &v14);
      v9 = v14;
    }
    else
    {
      v9 = 0;
    }
    v11 = v9;
    v12 = objc_msgSend(a3, "isEqualToString:", AVSystemController_ActiveAudioRouteAttribute);
    v13 = v14;
    if (v12)
      return +[AVSystemController compatibleAudioRouteForRoute:](AVSystemController, "compatibleAudioRouteForRoute:", v14);
  }
  else
  {
    if (objc_msgSend(a3, "isEqualToString:", AVSystemController_PostNotificationsFromMainThreadOnly)
      || objc_msgSend(a3, "isEqualToString:", AVSystemController_DeviceManufacturedForEURegion))
    {
      return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    }
    return 0;
  }
  return v13;
}

+ (id)compatibleAudioRouteForRoute:(id)a3
{
  id result;

  if (compatibleAudioRouteForRoute__onceToken != -1)
    dispatch_once(&compatibleAudioRouteForRoute__onceToken, &__block_literal_global_34);
  result = (id)objc_msgSend((id)compatibleAudioRouteForRoute__sRouteMap, "objectForKey:", a3);
  if (!result)
    return a3;
  return result;
}

+ (id)sharedInstance
{
  AVSystemController *v2;
  AVSystemController *v3;
  unsigned int v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_489);
  objc_msgSend((id)gSharedInstanceLock, "lock");
  v2 = (AVSystemController *)gSharedInstance;
  if (!gSharedInstance)
  {
    v5 = 1;
    do
    {
      v2 = objc_alloc_init(AVSystemController);
      gSharedInstance = (uint64_t)v2;
      if (v2)
        break;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v2 = (AVSystemController *)gSharedInstance;
      if (gSharedInstance)
        break;
    }
    while (v5++ < 3);
  }
  v3 = v2;
  objc_msgSend((id)gSharedInstanceLock, "unlock");
  return (id)gSharedInstance;
}

- (AVSystemController)init
{
  AVSystemController *v2;
  AVSystemController *v3;
  OpaqueFigSystemController **p_mFigController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVSystemController;
  v2 = -[AVSystemController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->mCategory = 0;
    v2->mFullMute = 0;
    v2->mVolume = 0.0;
    v2->mRemoteDeviceIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v3->mRemoteDeviceIDsLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    p_mFigController = &v3->mFigController;
    if (FigSystemControllerRemoteCreate(*MEMORY[0x1E0C9AE00], 0, &v3->mFigController)
      || !*p_mFigController
      || (CMNotificationCenterGetDefaultLocalCenter(), FigNotificationCenterAddWeakListeners())
      || !*p_mFigController)
    {

      return 0;
    }
  }
  return v3;
}

id __36__AVSystemController_sharedInstance__block_invoke()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0CB38E0]);
  gSharedInstanceLock = (uint64_t)result;
  return result;
}

id __53__AVSystemController_volumeCategoryForAudioCategory___block_invoke()
{
  id result;

  volumeCategoryForAudioCategory__volumeCategoryForAudioCategoryCache = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  result = objc_alloc_init(MEMORY[0x1E0CB3740]);
  volumeCategoryForAudioCategory__volumeCategoryForAudioCategoryCacheLock = (uint64_t)result;
  return result;
}

- (BOOL)currentRouteHasVolumeControl
{
  OpaqueFigSystemController *mFigController;
  uint64_t (*v3)(OpaqueFigSystemController *, const __CFString *, _QWORD, CFTypeRef *);
  int v4;
  CFTypeRef v5;
  BOOL v6;
  CFTypeID v7;
  CFTypeID TypeID;
  BOOL v9;
  CFTypeRef cf;

  cf = 0;
  mFigController = self->mFigController;
  v3 = *(uint64_t (**)(OpaqueFigSystemController *, const __CFString *, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v3)
    return 1;
  v4 = v3(mFigController, CFSTR("CurrentRouteHasVolumeControl"), *MEMORY[0x1E0C9AE00], &cf);
  v5 = cf;
  if (v4)
    v6 = 1;
  else
    v6 = cf == 0;
  if (!v6)
  {
    v7 = CFGetTypeID(cf);
    TypeID = CFBooleanGetTypeID();
    v5 = cf;
    if (v7 == TypeID)
    {
      v9 = CFBooleanGetValue((CFBooleanRef)cf) != 0;
      v5 = cf;
      if (!cf)
        return v9;
      goto LABEL_10;
    }
  }
  v9 = 1;
  if (v5)
LABEL_10:
    CFRelease(v5);
  return v9;
}

+ (void)initialize
{
  id v2;
  id v3;

  if ((id)objc_opt_self() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
    v2 = objc_alloc(MEMORY[0x1E0C99D80]);
    sAttributeForKeyMappingToFig = objc_msgSend(v2, "initWithObjectsAndKeys:", CFSTR("HeadphoneJackIsConnected"), AVSystemController_HeadphoneJackIsConnectedAttribute, CFSTR("HeadphoneJackHasInput"), AVSystemController_HeadphoneJackHasInputAttribute, CFSTR("SystemHasAudioInputDevice"), AVSystemController_SystemHasAudioInputDeviceAttribute, CFSTR("SystemHasAudioInputDeviceExcludingBluetooth"), AVSystemController_SystemHasAudioInputDeviceExcludingBluetoothAttribute, CFSTR("HeadphoneVolumeLimit"), AVSystemController_HeadphoneVolumeLimitAttribute, CFSTR("CurrentExternalScreen"), AVSystemController_CurrentExternalScreenAttribute, CFSTR("ActiveAudioRoute"), AVSystemController_ActiveAudioRouteAttribute, CFSTR("PickableRoutes"), AVSystemController_PickableRoutesAttribute, CFSTR("CurrentlyActiveCategory"),
                                     AVSystemController_CurrentlyActiveCategoryAttribute,
                                     CFSTR("CurrentlyActiveMode"),
                                     AVSystemController_CurrentlyActiveModeAttribute,
                                     CFSTR("PickedRoute"),
                                     AVSystemController_PickedRouteAttribute,
                                     CFSTR("SomeClientIsPlayingLongFormAudio"),
                                     AVSystemController_SomeClientIsPlayingLongFormAudioAttribute,
                                     CFSTR("ActiveClientPIDsThatHideTheSpeechDetectionDevice"),
                                     AVSystemController_ActiveClientPIDsThatHideTheSpeechDetectionDeviceAttribute,
                                     CFSTR("FullMute"),
                                     AVSystemController_FullMuteAttribute,
                                     CFSTR("RecordingClientPIDs"),
                                     AVSystemController_RecordingClientPIDsAttribute,
                                     CFSTR("UplinkMute"),
                                     AVSystemController_UplinkMuteAttribute,
                                     CFSTR("DownlinkMute"),
                                     AVSystemController_DownlinkMuteAttribute,
                                     CFSTR("ThermalControlInfo"),
                                     AVSystemController_ThermalControlInfoAttribute,
                                     CFSTR("MeasuredHDMILatency"),
                                     AVSystemController_MeasuredHDMILatencyAttribute,
                                     CFSTR("VoicePromptStyle"),
                                     AVSystemController_VoicePromptStyleAttribute,
                                     CFSTR("NowPlayingAppShouldPlayOnCarPlayConnect"),
                                     AVSystemController_NowPlayingAppShouldPlayOnCarPlayConnectAttribute,
                                     CFSTR("CarPlayIsConnected"),
                                     AVSystemController_CarPlayIsConnectedAttribute,
                                     CFSTR("CarPlayAuxStreamSupport"),
                                     AVSystemController_CarPlayAuxStreamSupportAttribute,
                                     CFSTR("CarPlaySupportsMixableSiri"),
                                     AVSystemController_CarPlaySupportsMixableSiriAttribute,
                                     CFSTR("CarPlayIsPlayingLongerDurationSession"),
                                     AVSystemController_CarPlayIsPlayingLongerDurationSession,
                                     CFSTR("CanBeNowPlayingApp"),
                                     AVSystemController_CanBeNowPlayingAppAttribute,
                                     CFSTR("AppWantsVolumeChanges"),
                                     AVSystemController_AppWantsVolumeChangesAttribute,
                                     CFSTR("ActiveInputRouteForPlayAndRecordNoBluetooth"),
                                     AVSystemController_ActiveInputRouteForPlayAndRecordNoBluetoothAttribute,
                                     CFSTR("NowPlayingAppPID"),
                                     AVSystemController_NowPlayingAppPIDAttribute,
                                     CFSTR("NowPlayingAppDisplayID"),
                                     AVSystemController_NowPlayingAppDisplayIDAttribute,
                                     CFSTR("CallIsActive"));
    v3 = objc_alloc(MEMORY[0x1E0C99D80]);
    sSetAttributeForKeyMappingToFig = objc_msgSend(v3, "initWithObjectsAndKeys:", CFSTR("HeadphoneVolumeLimit"), AVSystemController_HeadphoneVolumeLimitAttribute, CFSTR("PickedRoute"), AVSystemController_PickedRouteAttribute, CFSTR("RouteAwayFromAirPlay"), AVSystemController_RouteAwayFromAirPlayAttribute, CFSTR("FullMute"), AVSystemController_FullMuteAttribute, CFSTR("UplinkMute"), AVSystemController_UplinkMuteAttribute, CFSTR("DownlinkMute"), AVSystemController_DownlinkMuteAttribute, CFSTR("ThermalControlInfo"), AVSystemController_ThermalControlInfoAttribute, CFSTR("MeasuredHDMILatency"), AVSystemController_MeasuredHDMILatencyAttribute, CFSTR("PIDToInheritApplicationStateFrom"),
                                        AVSystemController_PIDToInheritApplicationStateFrom,
                                        CFSTR("CanBeNowPlayingApp"),
                                        AVSystemController_CanBeNowPlayingAppAttribute,
                                        CFSTR("AllowAppToInitiatePlaybackTemporarily"),
                                        AVSystemController_AllowAppToInitiatePlaybackTemporarilyAttribute,
                                        CFSTR("AppWantsVolumeChanges"),
                                        AVSystemController_AppWantsVolumeChangesAttribute,
                                        CFSTR("AirPlayScreenSuspended"),
                                        AVSystemController_AirPlayScreenSuspended,
                                        CFSTR("AppToInterruptCurrentNowPlayingSession"),
                                        AVSystemController_AppToInterruptCurrentNowPlayingSessionAttribute,
                                        CFSTR("InterruptAudioSessionIDForHandoff"),
                                        AVSystemController_InterruptAudioSessionIDForHandoff,
                                        CFSTR("AllowAppToFadeInTemporarily"),
                                        AVSystemController_AllowAppToFadeInTemporarilyAttribute,
                                        CFSTR("SubscribeToNotifications"),
                                        AVSystemController_SubscribeToNotificationsAttribute,
                                        CFSTR("PostInterruptionEndedNotification"),
                                        AVSystemController_PostInterruptionEndedNotification,
                                        CFSTR("WombatEnabled"),
                                        AVSystemController_WombatEnabledAttribute,
                                        CFSTR("CallScreeningStatus"),
                                        AVSystemController_CallScreeningStatusAttribute,
                                        CFSTR("MaximumSpeakerVolumeLimit"),
                                        AVSystemController_MaximumSpeakerVolumeLimitAttribute,
                                        0);
  }
}

uint64_t __51__AVSystemController_compatibleAudioRouteForRoute___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("Receiver"), CFSTR("ReceiverAndMicrophone"), CFSTR("Headset"), CFSTR("HeadsetInOut"), CFSTR("Headphone"), CFSTR("HeadphonesAndMicrophone"), CFSTR("Speaker"), CFSTR("SpeakerAndMicrophone"), CFSTR("BestSpeaker"), CFSTR("BestSpeakerAndMicrophone"), CFSTR("LineOut"), CFSTR("LineInOut"), 0);
  compatibleAudioRouteForRoute__sRouteMap = result;
  return result;
}

- (void)dealloc
{
  OpaqueFigSystemController *mFigController;
  NSString *mCategory;
  objc_super v5;

  if (self->mFigController)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListeners();
    mFigController = self->mFigController;
    if (mFigController)
    {
      CFRelease(mFigController);
      self->mFigController = 0;
    }
  }
  mCategory = self->mCategory;
  if (mCategory)
    CFRelease(mCategory);

  self->mRemoteDeviceIDs = 0;
  self->mRemoteDeviceIDsLock = 0;
  v5.receiver = self;
  v5.super_class = (Class)AVSystemController;
  -[AVSystemController dealloc](&v5, sel_dealloc);
}

- (BOOL)changeActiveCategoryVolumeBy:(float)a3 fallbackCategory:(id)a4 resultVolume:(float *)a5 affectedCategory:(id *)a6
{
  OpaqueFigSystemController *mFigController;
  uint64_t (*v10)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float *, float, float, float, _QWORD, id *, _QWORD, _BYTE);
  int v11;
  id v12;

  if (a6)
    *a6 = 0;
  mFigController = self->mFigController;
  v10 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float *, float, float, float, _QWORD, id *, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v10)
  {
    v11 = -12782;
    if (!a6)
      return v11 == 0;
    goto LABEL_5;
  }
  v11 = v10(mFigController, 1, 0, 0, 0, 0, 0, a5, a3, 0.0, 0.0, 0, a6, 0, 0);
  if (a6)
LABEL_5:
    v12 = *a6;
  return v11 == 0;
}

- (BOOL)changeActiveCategoryVolume:(BOOL)a3 fallbackCategory:(id)a4 resultVolume:(float *)a5 affectedCategory:(id *)a6
{
  _BOOL4 v8;
  OpaqueFigSystemController *mFigController;
  uint64_t (*v10)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float *, __n128, float, float, _QWORD, id *, _QWORD, _BYTE);
  __n128 v11;
  int v12;
  id v13;

  v8 = a3;
  if (a6)
    *a6 = 0;
  mFigController = self->mFigController;
  v10 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float *, __n128, float, float, _QWORD, id *, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v10)
  {
    v12 = -12782;
    if (!a6)
      return v12 == 0;
    goto LABEL_7;
  }
  v11.n128_u32[0] = -1115684864;
  if (v8)
    v11.n128_f32[0] = 0.0625;
  v12 = v10(mFigController, 1, 0, 0, 0, 0, 0, a5, v11, 0.0, 0.0, 0, a6, 0, 0);
  if (a6)
LABEL_7:
    v13 = *a6;
  return v12 == 0;
}

- (BOOL)setVibeIntensityTo:(float)a3
{
  id v5;
  double v6;
  void *v7;
  OpaqueFigSystemController *mFigController;
  unsigned int (*v9)(OpaqueFigSystemController *, const __CFString *, void *);
  BOOL v10;

  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v6 = a3;
  v7 = (void *)objc_msgSend(v5, "initWithFloat:", v6);
  mFigController = self->mFigController;
  v9 = *(unsigned int (**)(OpaqueFigSystemController *, const __CFString *, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                              + 56);
  if (v9)
    v10 = v9(mFigController, CFSTR("VibeIntensity"), v7) == 0;
  else
    v10 = 0;

  return v10;
}

- (BOOL)getVibeIntensity:(float *)a3
{
  OpaqueFigSystemController *mFigController;
  uint64_t (*v5)(OpaqueFigSystemController *, const __CFString *, _QWORD, id *);
  int v6;
  id v7;
  int v8;
  id v10;

  v10 = 0;
  mFigController = self->mFigController;
  v5 = *(uint64_t (**)(OpaqueFigSystemController *, const __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                               + 48);
  if (!v5)
  {
    v7 = 0;
    v6 = -12782;
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = v5(mFigController, CFSTR("VibeIntensity"), *MEMORY[0x1E0C9AE00], &v10);
  v7 = v10;
  if (a3)
  {
LABEL_3:
    objc_msgSend(v7, "floatValue");
    *(_DWORD *)a3 = v8;
    v7 = v10;
  }
LABEL_4:

  return v6 == 0;
}

- (BOOL)changeActiveCategoryVolumeBy:(float)a3
{
  int v4;

  v4 = 0;
  return -[AVSystemController changeActiveCategoryVolumeBy:fallbackCategory:resultVolume:affectedCategory:](self, "changeActiveCategoryVolumeBy:fallbackCategory:resultVolume:affectedCategory:", 0, &v4, 0);
}

- (BOOL)changeActiveCategoryVolume:(BOOL)a3
{
  int v4;

  v4 = 0;
  return -[AVSystemController changeActiveCategoryVolume:fallbackCategory:resultVolume:affectedCategory:](self, "changeActiveCategoryVolume:fallbackCategory:resultVolume:affectedCategory:", a3, 0, &v4, 0);
}

- (BOOL)setActiveCategoryVolumeTo:(float)a3 fallbackCategory:(id)a4 resultVolume:(float *)a5 affectedCategory:(id *)a6
{
  OpaqueFigSystemController *mFigController;
  uint64_t (*v11)(OpaqueFigSystemController *, uint64_t, id, _QWORD, _QWORD, _QWORD, _QWORD, float *, float, float, float, _QWORD, id *, _QWORD, _BYTE);
  int v12;
  id v13;

  if (a6)
    *a6 = 0;
  mFigController = self->mFigController;
  v11 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, id, _QWORD, _QWORD, _QWORD, _QWORD, float *, float, float, float, _QWORD, id *, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v11)
  {
    v12 = -12782;
    if (!a6)
      return v12 == 0;
    goto LABEL_5;
  }
  v12 = v11(mFigController, 2, a4, 0, 0, 0, 0, a5, a3, 0.0, 0.0, 0, a6, 0, 0);
  if (a6)
LABEL_5:
    v13 = *a6;
  return v12 == 0;
}

- (BOOL)setActiveCategoryVolumeTo:(float)a3
{
  int v4;

  v4 = 0;
  return -[AVSystemController setActiveCategoryVolumeTo:fallbackCategory:resultVolume:affectedCategory:](self, "setActiveCategoryVolumeTo:fallbackCategory:resultVolume:affectedCategory:", 0, &v4, 0);
}

- (BOOL)changeActiveCategoryVolumeBy:(float)a3 forRoute:(id)a4 andDeviceIdentifier:(id)a5
{
  OpaqueFigSystemController *mFigController;
  unsigned int (*v9)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, id, id, _QWORD, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE);

  mFigController = self->mFigController;
  v9 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, id, id, _QWORD, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  return v9 && v9(mFigController, 4, 0, 0, a4, a5, 0, 0, a3, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)changeActiveCategoryVolume:(BOOL)a3 forRoute:(id)a4 andDeviceIdentifier:(id)a5
{
  _BOOL4 v7;
  OpaqueFigSystemController *mFigController;
  unsigned int (*v9)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, id, id, _QWORD, _QWORD, __n128, float, float, _QWORD, _QWORD, _QWORD, _BYTE);
  __n128 v10;

  v7 = a3;
  mFigController = self->mFigController;
  v9 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, id, id, _QWORD, _QWORD, __n128, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v9)
    return 0;
  v10.n128_u32[0] = -1115684864;
  if (v7)
    v10.n128_f32[0] = 0.0625;
  return v9(mFigController, 4, 0, 0, a4, a5, 0, 0, v10, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)setActiveCategoryVolumeTo:(float)a3 forRoute:(id)a4 andDeviceIdentifier:(id)a5
{
  OpaqueFigSystemController *mFigController;
  unsigned int (*v9)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, id, id, _QWORD, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE);

  mFigController = self->mFigController;
  v9 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, id, id, _QWORD, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  return v9 && v9(mFigController, 5, 0, 0, a4, a5, 0, 0, a3, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)getActiveCategoryVolume:(float *)a3 andName:(id *)a4 forRoute:(id)a5 andDeviceIdentifier:(id)a6
{
  OpaqueFigSystemController *mFigController;
  unsigned int (*v10)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, id, id, _QWORD, float *, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE);

  mFigController = self->mFigController;
  v10 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, id, id, _QWORD, float *, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  return v10 && v10(mFigController, 6, 0, 0, a5, a6, 0, a3, 0.0, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)changeVolumeForRouteBy:(float)a3 forCategory:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 andRouteSubtype:(id)a8
{
  OpaqueFigSystemController *mFigController;
  unsigned int (*v14)(OpaqueFigSystemController *, uint64_t, id, _QWORD, id, id, id, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE);

  mFigController = self->mFigController;
  v14 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, _QWORD, id, id, id, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  return v14 && v14(mFigController, 11, a4, 0, a6, a7, a8, 0, a3, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)changeVolumeForRoute:(BOOL)a3 forCategory:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 andRouteSubtype:(id)a8
{
  _BOOL4 v12;
  OpaqueFigSystemController *mFigController;
  unsigned int (*v14)(OpaqueFigSystemController *, uint64_t, id, _QWORD, id, id, id, _QWORD, __n128, float, float, _QWORD, _QWORD, _QWORD, _BYTE);
  __n128 v15;

  v12 = a3;
  mFigController = self->mFigController;
  v14 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, _QWORD, id, id, id, _QWORD, __n128, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v14)
    return 0;
  v15.n128_u32[0] = -1115684864;
  if (v12)
    v15.n128_f32[0] = 0.0625;
  return v14(mFigController, 11, a4, 0, a6, a7, a8, 0, v15, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)setVolumeForRouteTo:(float)a3 forCategory:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 andRouteSubtype:(id)a8
{
  OpaqueFigSystemController *mFigController;
  unsigned int (*v14)(OpaqueFigSystemController *, uint64_t, id, _QWORD, id, id, id, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE);

  mFigController = self->mFigController;
  v14 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, _QWORD, id, id, id, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  return v14 && v14(mFigController, 12, a4, 0, a6, a7, a8, 0, a3, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (int)setVolume:(float)a3 category:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 routeSubtype:(id)a8 rampUpwardDuration:(id)a9 rampDownwardDuration:(id)a10
{
  OpaqueFigSystemController *mFigController;
  float v16;
  float v17;
  float v18;
  float v19;
  uint64_t (*v20)(OpaqueFigSystemController *, uint64_t, id, _QWORD, id, id, id, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE);

  mFigController = self->mFigController;
  objc_msgSend(a9, "floatValue", a4, a5);
  v17 = v16;
  objc_msgSend(a10, "floatValue");
  v19 = v18;
  v20 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, id, _QWORD, id, id, id, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v20)
    return v20(mFigController, 12, a4, 0, a6, a7, a8, 0, a3, v17, v19, 0, 0, 0, 0);
  else
    return -12782;
}

- (int)setVolume:(float)a3 category:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 routeSubtype:(id)a8 rampUpDuration:(float)a9 rampDownDuration:(float)a10
{
  int result;
  OpaqueFigSystemController *mFigController;
  uint64_t (*v20)(OpaqueFigSystemController *, uint64_t, id, _QWORD, id, id, id, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE);

  result = -12981;
  if (a9 >= 0.0 && a10 >= 0.0)
  {
    mFigController = self->mFigController;
    v20 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, id, _QWORD, id, id, id, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v20)
      return v20(mFigController, 12, a4, 0, a6, a7, a8, 0, a3, a9, a10, 0, 0, 0, 0);
    else
      return -12782;
  }
  return result;
}

- (int)setVolume:(float)a3 category:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 routeSubtype:(id)a8 rampUpDuration:(float)a9 rampDownDuration:(float)a10 retainFullMute:(BOOL)a11
{
  int result;
  OpaqueFigSystemController *mFigController;
  uint64_t (*v22)(OpaqueFigSystemController *, uint64_t, id, _QWORD, id, id, id, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, BOOL);

  result = -12981;
  if (a9 >= 0.0 && a10 >= 0.0)
  {
    mFigController = self->mFigController;
    v22 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, id, _QWORD, id, id, id, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, BOOL))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v22)
      return v22(mFigController, 12, a4, 0, a6, a7, a8, 0, a3, a9, a10, 0, 0, 0, a11);
    else
      return -12782;
  }
  return result;
}

- (BOOL)getVolumeForRoute:(float *)a3 forCategory:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 andRouteSubtype:(id)a8
{
  OpaqueFigSystemController *mFigController;
  unsigned int (*v14)(OpaqueFigSystemController *, uint64_t, id, _QWORD, id, id, id, float *, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE);

  mFigController = self->mFigController;
  v14 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, _QWORD, id, id, id, float *, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  return v14 && v14(mFigController, 13, a4, 0, a6, a7, a8, a3, 0.0, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (int)getVolume:(float *)a3 category:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 routeSubtype:(id)a8
{
  OpaqueFigSystemController *mFigController;
  uint64_t (*v14)(OpaqueFigSystemController *, uint64_t, id, _QWORD, id, id, id, float *, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE);

  mFigController = self->mFigController;
  v14 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, id, _QWORD, id, id, id, float *, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v14)
    return v14(mFigController, 13, a4, 0, a6, a7, a8, a3, 0.0, 0.0, 0.0, 0, 0, 0, 0);
  else
    return -12782;
}

- (int)volumeCategoryAndMode:(id)a3 mode:(id)a4 outCategory:(id *)a5 outMode:(id *)a6
{
  int v6;
  OpaqueFigSystemController *mFigController;
  uint64_t (*v12)(OpaqueFigSystemController *, id, id, _QWORD *, id *);
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v19;
  _QWORD v20[23];

  v20[22] = *MEMORY[0x1E0C80C00];
  v6 = -12980;
  if (a5 && a6)
  {
    v19 = 0;
    v20[0] = 0;
    mFigController = self->mFigController;
    v12 = *(uint64_t (**)(OpaqueFigSystemController *, id, id, _QWORD *, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 24);
    if (v12)
    {
      v6 = v12(mFigController, a3, a4, v20, &v19);
      if (!v6)
      {
        v14 = v19;
        v13 = (void *)v20[0];
        *a5 = (id)v20[0];
        *a6 = v14;
        v15 = v13;
        v16 = v19;
        return v6;
      }
    }
    else
    {
      v6 = -12782;
    }
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v6;
}

- (int)setDuckScalarForVoiceOver:(float)a3
{
  id v5;
  double v6;
  void *v7;
  OpaqueFigSystemController *mFigController;
  uint64_t (*v9)(OpaqueFigSystemController *, const __CFString *, void *);
  int v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v6 = a3;
  v7 = (void *)objc_msgSend(v5, "initWithFloat:", v6);
  mFigController = self->mFigController;
  v9 = *(uint64_t (**)(OpaqueFigSystemController *, const __CFString *, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                         + 56);
  if (v9)
  {
    v10 = v9(mFigController, CFSTR("DuckScalarForVoiceOver"), v7);
    if (!v10)
      goto LABEL_6;
  }
  else
  {
    v10 = -12782;
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_6:

  return v10;
}

- (int)getDuckScalarForVoiceOver:(float *)a3
{
  OpaqueFigSystemController *mFigController;
  uint64_t (*v5)(OpaqueFigSystemController *, const __CFString *, _QWORD, id *);
  int v6;
  int v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v10[23];

  v10[22] = *(id *)MEMORY[0x1E0C80C00];
  v10[0] = 0;
  mFigController = self->mFigController;
  v5 = *(uint64_t (**)(OpaqueFigSystemController *, const __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                               + 48);
  if (!v5)
  {
    v6 = -12782;
    goto LABEL_6;
  }
  v6 = v5(mFigController, CFSTR("DuckScalarForVoiceOver"), *MEMORY[0x1E0C9AE00], v10);
  if (v6)
  {
LABEL_6:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_7;
  }
  if (a3)
  {
    objc_msgSend(v10[0], "floatValue");
    v6 = 0;
    *(_DWORD *)a3 = v7;
  }
  else
  {
    v6 = 0;
  }
LABEL_7:

  return v6;
}

- (int)popNowPlayingAppStack
{
  OpaqueFigSystemController *mFigController;
  uint64_t (*v3)(OpaqueFigSystemController *, const __CFString *, _QWORD);
  int v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  mFigController = self->mFigController;
  v3 = *(uint64_t (**)(OpaqueFigSystemController *, const __CFString *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                         + 56);
  if (v3)
  {
    v4 = v3(mFigController, CFSTR("PopNowPlayingAppStack"), 0);
    if (!v4)
      return v4;
  }
  else
  {
    v4 = -12782;
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return v4;
}

- (id)topOfNowPlayingAppStack
{
  OpaqueFigSystemController *mFigController;
  unsigned int (*v3)(OpaqueFigSystemController *, const __CFString *, _QWORD, id *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v5;
  id v7[23];

  v7[22] = *(id *)MEMORY[0x1E0C80C00];
  v7[0] = 0;
  mFigController = self->mFigController;
  v3 = *(unsigned int (**)(OpaqueFigSystemController *, const __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v3 || v3(mFigController, CFSTR("TopOfNowPlayingAppStackDisplayID"), *MEMORY[0x1E0C9AE00], v7))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v5 = v7[0];
  return v7[0];
}

- (BOOL)toggleActiveCategoryMuted
{
  OpaqueFigSystemController *mFigController;
  unsigned int (*v3)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE);

  mFigController = self->mFigController;
  v3 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  return v3 && v3(mFigController, 7, 0, 0, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)toggleActiveCategoryMutedForRoute:(id)a3 andDeviceIdentifier:(id)a4
{
  OpaqueFigSystemController *mFigController;
  unsigned int (*v7)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, id, id, _QWORD, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE);

  mFigController = self->mFigController;
  v7 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, id, id, _QWORD, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  return v7 && v7(mFigController, 9, 0, 0, a3, a4, 0, 0, 0.0, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)getActiveCategoryMuted:(BOOL *)a3
{
  OpaqueFigSystemController *mFigController;
  uint64_t (*v5)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float, float, float, char *, _QWORD, _QWORD, _BYTE);
  int v6;
  BOOL result;
  char v8;

  v8 = 0;
  mFigController = self->mFigController;
  v5 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float, float, float, char *, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v5)
    return 0;
  v6 = v5(mFigController, 8, 0, 0, 0, 0, 0, 0, 0.0, 0.0, 0.0, &v8, 0, 0, 0);
  result = 0;
  if (!v6)
  {
    *a3 = v8 != 0;
    return 1;
  }
  return result;
}

- (BOOL)getActiveCategoryMuted:(BOOL *)a3 forRoute:(id)a4 andDeviceIdentifier:(id)a5
{
  OpaqueFigSystemController *mFigController;
  uint64_t (*v9)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, id, id, _QWORD, _QWORD, float, float, float, char *, _QWORD, _QWORD, _BYTE);
  int v10;
  BOOL result;
  char v12;

  v12 = 0;
  mFigController = self->mFigController;
  v9 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, _QWORD, _QWORD, id, id, _QWORD, _QWORD, float, float, float, char *, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v9)
    return 0;
  v10 = v9(mFigController, 10, 0, 0, a4, a5, 0, 0, 0.0, 0.0, 0.0, &v12, 0, 0, 0);
  result = 0;
  if (!v10)
  {
    *a3 = v12 != 0;
    return 1;
  }
  return result;
}

- (BOOL)changeVolumeBy:(float)a3 forCategory:(id)a4
{
  OpaqueFigSystemController *mFigController;
  unsigned int (*v7)(OpaqueFigSystemController *, uint64_t, id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE);

  mFigController = self->mFigController;
  v7 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  return v7 && v7(mFigController, 11, a4, 0, 0, 0, 0, 0, a3, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)changeVolume:(BOOL)a3 forCategory:(id)a4
{
  return -[AVSystemController changeVolume:forCategory:mode:](self, "changeVolume:forCategory:mode:", a3, a4, 0);
}

- (BOOL)changeVolume:(BOOL)a3 forCategory:(id)a4 mode:(id)a5
{
  _BOOL4 v7;
  OpaqueFigSystemController *mFigController;
  unsigned int (*v9)(OpaqueFigSystemController *, uint64_t, id, id, _QWORD, _QWORD, _QWORD, _QWORD, __n128, float, float, _QWORD, _QWORD, _QWORD, _BYTE);
  __n128 v10;

  v7 = a3;
  mFigController = self->mFigController;
  v9 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, id, _QWORD, _QWORD, _QWORD, _QWORD, __n128, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v9)
    return 0;
  v10.n128_u32[0] = -1115684864;
  if (v7)
    v10.n128_f32[0] = 0.0625;
  return v9(mFigController, 11, a4, a5, 0, 0, 0, 0, v10, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)setVolumeTo:(float)a3 forCategory:(id)a4
{
  return -[AVSystemController setVolumeTo:forCategory:mode:](self, "setVolumeTo:forCategory:mode:", a4, 0);
}

- (BOOL)setVolumeTo:(float)a3 forCategory:(id)a4 retainFullMute:(BOOL)a5
{
  OpaqueFigSystemController *mFigController;
  unsigned int (*v9)(OpaqueFigSystemController *, uint64_t, id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, BOOL);

  mFigController = self->mFigController;
  v9 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, BOOL))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  return v9 && v9(mFigController, 12, a4, 0, 0, 0, 0, 0, a3, 0.0, 0.0, 0, 0, 0, a5) == 0;
}

- (BOOL)setVolumeTo:(float)a3 forCategory:(id)a4 mode:(id)a5
{
  OpaqueFigSystemController *mFigController;
  unsigned int (*v9)(OpaqueFigSystemController *, uint64_t, id, id, _QWORD, _QWORD, _QWORD, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE);

  mFigController = self->mFigController;
  v9 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, id, _QWORD, _QWORD, _QWORD, _QWORD, float, float, float, _QWORD, _QWORD, _QWORD, _BYTE))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  return v9 && v9(mFigController, 12, a4, a5, 0, 0, 0, 0, a3, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)setBTHFPRoute:(id)a3 availableForVoicePrompts:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  OpaqueFigSystemController *mFigController;
  unsigned int (*v10)(OpaqueFigSystemController *, const __CFString *, void *);
  BOOL v11;

  v4 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = v7;
  if (a3)
  {
    objc_msgSend(v7, "addEntriesFromDictionary:", a3);
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("BTDetails_IsAvailableForVoicePrompts"));
    objc_msgSend(v8, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4), CFSTR("BTDetails_IsAvailableForVoicePrompts"));
    mFigController = self->mFigController;
    v10 = *(unsigned int (**)(OpaqueFigSystemController *, const __CFString *, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                                 + 56);
    if (v10)
      v11 = v10(mFigController, CFSTR("AvailableForVoicePrompts"), v8) == 0;
    else
      v11 = 0;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)didCancelRoutePicking:(id)a3
{
  return 0;
}

- (BOOL)setPickedRouteWithPassword:(id)a3 withPassword:(id)a4
{
  id v7;
  void *v8;
  OpaqueFigSystemController *mFigController;
  unsigned int (*v10)(OpaqueFigSystemController *, const __CFString *, void *);
  BOOL v11;

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = v7;
  if (a3)
  {
    objc_msgSend(v7, "addEntriesFromDictionary:", a3);
    objc_msgSend(v8, "setObject:forKey:", a4, CFSTR("PortPassword"));
    mFigController = self->mFigController;
    v10 = *(unsigned int (**)(OpaqueFigSystemController *, const __CFString *, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                                 + 56);
    if (v10)
      v11 = v10(mFigController, CFSTR("PickedRouteWithPassword"), v8) == 0;
    else
      v11 = 0;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)setSilentMode:(BOOL)a3 untilTime:(id)a4 reason:(id)a5 clientType:(unsigned int)a6
{
  uint64_t v6;
  _BOOL8 v9;
  OpaqueFigSystemController *mFigController;
  unsigned int (*v11)(OpaqueFigSystemController *, _BOOL8, id, id, uint64_t);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v6 = *(_QWORD *)&a6;
  v9 = a3;
  mFigController = self->mFigController;
  v11 = *(unsigned int (**)(OpaqueFigSystemController *, _BOOL8, id, id, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                            + 112);
  if (v11 && !v11(mFigController, v9, a4, a5, v6))
    return 1;
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return 0;
}

- (BOOL)getSilentMode
{
  return objc_msgSend(-[AVSystemController attributeForKey:](self, "attributeForKey:", AVSystemController_SilentModeEnabledAttribute), "BOOLValue");
}

- (BOOL)getSilentMode:(BOOL *)a3 error:(id *)a4
{
  OpaqueFigSystemController *mFigController;
  uint64_t (*v8)(OpaqueFigSystemController *, const __CFString *, _QWORD, id *);
  uint64_t v9;
  id v10;
  id v12;

  v12 = 0;
  mFigController = self->mFigController;
  v8 = *(uint64_t (**)(OpaqueFigSystemController *, const __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                               + 48);
  if (v8)
  {
    v9 = v8(mFigController, CFSTR("SilentModeEnabled"), *MEMORY[0x1E0C9AE00], &v12);
    v10 = v12;
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v10 = 0;
  v9 = 4294954514;
  if (a3)
  {
LABEL_3:
    *a3 = objc_msgSend(v10, "BOOLValue");
    v10 = v12;
  }
LABEL_4:

  if (a4)
    *a4 = -[AVSystemController errorWithCode:description:](self, "errorWithCode:description:", v9, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error querying SilentModeEnabled with err = %d"), v9));
  return (_DWORD)v9 == 0;
}

- (id)routeForCategory:(id)a3
{
  OpaqueFigSystemController *mFigController;
  void (*v5)(OpaqueFigSystemController *, id, void **, _QWORD);
  void *v6;
  id v7;
  void *v9;

  v9 = 0;
  mFigController = self->mFigController;
  v5 = *(void (**)(OpaqueFigSystemController *, id, void **, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 16);
  if (v5)
  {
    v5(mFigController, a3, &v9, 0);
    v6 = v9;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  return +[AVSystemController compatibleAudioRouteForRoute:](AVSystemController, "compatibleAudioRouteForRoute:", v9);
}

- (int)toggleInputMute
{
  OpaqueFigSystemController *mFigController;
  uint64_t (*v3)(OpaqueFigSystemController *);

  mFigController = self->mFigController;
  v3 = *(uint64_t (**)(OpaqueFigSystemController *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
  if (v3)
    return v3(mFigController);
  else
    return -12782;
}

- (int)setInputMute:(id *)a3 muteValue:(BOOL)a4
{
  _BOOL8 v4;
  OpaqueFigSystemController *mFigController;
  __int128 v6;
  uint64_t (*v7)(OpaqueFigSystemController *, _OWORD *, _BOOL8);
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  mFigController = self->mFigController;
  v6 = *(_OWORD *)&a3->var0[4];
  v10 = *(_OWORD *)a3->var0;
  v11 = v6;
  v7 = *(uint64_t (**)(OpaqueFigSystemController *, _OWORD *, _BOOL8))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 64);
  if (!v7)
    return -12782;
  v9[0] = v10;
  v9[1] = v11;
  return v7(mFigController, v9, v4);
}

- (int)getInputMute:(id *)a3 outMuteValue:(BOOL *)a4
{
  OpaqueFigSystemController *mFigController;
  __int128 v6;
  uint64_t (*v7)(OpaqueFigSystemController *, _OWORD *, BOOL *);
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  mFigController = self->mFigController;
  v6 = *(_OWORD *)&a3->var0[4];
  v10 = *(_OWORD *)a3->var0;
  v11 = v6;
  v7 = *(uint64_t (**)(OpaqueFigSystemController *, _OWORD *, BOOL *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 72);
  if (!v7)
    return -12782;
  v9[0] = v10;
  v9[1] = v11;
  return v7(mFigController, v9, a4);
}

- (int)clearUplinkMutedCache
{
  OpaqueFigSystemController *mFigController;
  uint64_t (*v3)(OpaqueFigSystemController *);

  mFigController = self->mFigController;
  v3 = *(uint64_t (**)(OpaqueFigSystemController *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
  if (v3)
    return v3(mFigController);
  else
    return -12782;
}

- (int)allowAppToInitiateRecordingTemporarily:(id)a3
{
  OpaqueFigSystemController *mFigController;
  uint64_t (*v5)(OpaqueFigSystemController *, id);
  int v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  mFigController = self->mFigController;
  v5 = *(uint64_t (**)(OpaqueFigSystemController *, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 88);
  if (v5)
  {
    v6 = v5(mFigController, a3);
    if (!v6)
      return v6;
  }
  else
  {
    v6 = -12782;
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return v6;
}

- (int)grantMediaEndowmentWithEnvironmentID:(id)a3 endowmentPayload:(id)a4
{
  OpaqueFigSystemController *mFigController;
  uint64_t (*v7)(OpaqueFigSystemController *, id, id);
  int v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  mFigController = self->mFigController;
  v7 = *(uint64_t (**)(OpaqueFigSystemController *, id, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 96);
  if (v7)
  {
    v8 = v7(mFigController, a3, a4);
    if (!v8)
      return v8;
  }
  else
  {
    v8 = -12782;
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return v8;
}

- (int)revokeMediaEndowmentWithEnvironmentID:(id)a3
{
  OpaqueFigSystemController *mFigController;
  uint64_t (*v5)(OpaqueFigSystemController *, id);
  int v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  mFigController = self->mFigController;
  v5 = *(uint64_t (**)(OpaqueFigSystemController *, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 104);
  if (v5)
  {
    v6 = v5(mFigController, a3);
    if (!v6)
      return v6;
  }
  else
  {
    v6 = -12782;
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return v6;
}

- (BOOL)overrideToPartnerRoute
{
  OpaqueFigSystemController *mFigController;
  unsigned int (*v3)(OpaqueFigSystemController *, const __CFString *, _QWORD);

  mFigController = self->mFigController;
  v3 = *(unsigned int (**)(OpaqueFigSystemController *, const __CFString *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                              + 56);
  return v3 && v3(mFigController, CFSTR("OverrideToPartnerRoute"), 0) == 0;
}

- (BOOL)allowUserToExceedEUVolumeLimit
{
  return 0;
}

- (BOOL)hasRouteSharingPolicyLongFormVideo:(id)a3
{
  OpaqueFigSystemController *mFigController;
  unsigned int (*v5)(OpaqueFigSystemController *, id, char *);
  BOOL v6;
  char v8;

  v8 = 0;
  mFigController = self->mFigController;
  v5 = *(unsigned int (**)(OpaqueFigSystemController *, id, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 40);
  if (!v5)
    return 0;
  if (v5(mFigController, a3, &v8))
    v6 = 1;
  else
    v6 = v8 == 0;
  return !v6;
}

- (BOOL)shouldClientWithAudioScore:(int)a3 hijackRoute:(id)a4 hijackDeniedReason:(id *)a5
{
  uint64_t v7;
  OpaqueFigSystemController *mFigController;
  void (*v9)(OpaqueFigSystemController *, uint64_t, id, char *, id *);
  char v11;

  v7 = *(_QWORD *)&a3;
  v11 = 0;
  mFigController = self->mFigController;
  v9 = *(void (**)(OpaqueFigSystemController *, uint64_t, id, char *, id *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 16)
                                                                                     + 48);
  if (!v9)
    return 0;
  v9(mFigController, v7, a4, &v11, a5);
  return v11 != 0;
}

- (BOOL)setMaxSpeakerVolumeLimit:(float)a3
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  return -[AVSystemController setAttribute:forKey:error:](self, "setAttribute:forKey:error:", v4, AVSystemController_MaximumSpeakerVolumeLimitAttribute, 0);
}

- (float)maxSpeakerVolumeLimit
{
  float result;

  objc_msgSend(-[AVSystemController attributeForKey:](self, "attributeForKey:", AVSystemController_MaximumSpeakerVolumeLimitAttribute), "floatValue");
  return result;
}

- (float)minimumAllowedMaxSpeakerVolumeLimit
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AVSystemController_minimumAllowedMaxSpeakerVolumeLimit__block_invoke;
  block[3] = &unk_1E3099900;
  block[4] = self;
  if (minimumAllowedMaxSpeakerVolumeLimit_onceToken != -1)
    dispatch_once(&minimumAllowedMaxSpeakerVolumeLimit_onceToken, block);
  return *(float *)&minimumAllowedMaxSpeakerVolumeLimit_minimumAllowedMaxSpeakerVolumeLimit;
}

uint64_t __57__AVSystemController_minimumAllowedMaxSpeakerVolumeLimit__block_invoke(uint64_t a1)
{
  uint64_t result;
  int v2;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "attributeForKey:", AVSystemController_MinimumAllowedMaximumSpeakerVolumeLimitAttribute), "floatValue");
  minimumAllowedMaxSpeakerVolumeLimit_minimumAllowedMaxSpeakerVolumeLimit = v2;
  return result;
}

- (float)recommendedMaxSpeakerVolumeLimit
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVSystemController_recommendedMaxSpeakerVolumeLimit__block_invoke;
  block[3] = &unk_1E3099900;
  block[4] = self;
  if (recommendedMaxSpeakerVolumeLimit_onceToken != -1)
    dispatch_once(&recommendedMaxSpeakerVolumeLimit_onceToken, block);
  return *(float *)&recommendedMaxSpeakerVolumeLimit_recommendedMaxSpeakerVolumeLimit;
}

uint64_t __54__AVSystemController_recommendedMaxSpeakerVolumeLimit__block_invoke(uint64_t a1)
{
  uint64_t result;
  int v2;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "attributeForKey:", AVSystemController_RecommendedMaximumSpeakerVolumeLimitAttribute), "floatValue");
  recommendedMaxSpeakerVolumeLimit_recommendedMaxSpeakerVolumeLimit = v2;
  return result;
}

- (BOOL)remoteDeviceControlIsAllowed:(unsigned int *)a3
{
  int v4;
  OpaqueFigSystemController *mFigController;
  uint64_t (*v6)(OpaqueFigSystemController *, unsigned int *);
  int v7;
  unsigned int v9;

  v4 = 1;
  v9 = 1;
  mFigController = self->mFigController;
  v6 = *(uint64_t (**)(OpaqueFigSystemController *, unsigned int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 120);
  if (v6)
  {
    v7 = v6(mFigController, &v9);
    v4 = v9;
    if (a3)
    {
      if (!v7)
        *a3 = v9;
    }
  }
  return v4 == 0;
}

- (BOOL)addRemoteDeviceID:(id)a3
{
  id v5;
  OpaqueFigSystemController *mFigController;
  unsigned int (*v7)(OpaqueFigSystemController *, const __CFString *, id);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BOOL v9;

  if (!a3)
    return 0;
  -[NSLock lock](self->mRemoteDeviceIDsLock, "lock");
  -[NSMutableSet addObject:](self->mRemoteDeviceIDs, "addObject:", a3);
  v5 = (id)-[NSMutableSet allObjects](self->mRemoteDeviceIDs, "allObjects");
  -[NSLock unlock](self->mRemoteDeviceIDsLock, "unlock");
  mFigController = self->mFigController;
  v7 = *(unsigned int (**)(OpaqueFigSystemController *, const __CFString *, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                          + 56);
  if (v7 && !v7(mFigController, CFSTR("RemoteDeviceIDs"), v5))
  {
    v9 = 1;
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v9 = 0;
  }

  return v9;
}

- (BOOL)removeRemoteDeviceID:(id)a3
{
  id v5;
  OpaqueFigSystemController *mFigController;
  unsigned int (*v7)(OpaqueFigSystemController *, const __CFString *, id);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BOOL v9;

  if (!a3)
    return 0;
  -[NSLock lock](self->mRemoteDeviceIDsLock, "lock");
  -[NSMutableSet removeObject:](self->mRemoteDeviceIDs, "removeObject:", a3);
  v5 = (id)-[NSMutableSet allObjects](self->mRemoteDeviceIDs, "allObjects");
  -[NSLock unlock](self->mRemoteDeviceIDsLock, "unlock");
  mFigController = self->mFigController;
  v7 = *(unsigned int (**)(OpaqueFigSystemController *, const __CFString *, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                          + 56);
  if (v7 && !v7(mFigController, CFSTR("RemoteDeviceIDs"), v5))
  {
    v9 = 1;
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v9 = 0;
  }

  return v9;
}

- (id)errorWithCode:(int)a3 description:(id)a4
{
  id v4;
  id v6;
  void *v7;

  v4 = a4;
  if (a4)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D80]);
    v4 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", v4, *MEMORY[0x1E0CB2D50], 0);
  }
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], a3, v4);

  return v7;
}

- (void)releaseSharedInstance
{
  AVSystemController *v3;

  objc_msgSend((id)gSharedInstanceLock, "lock");
  if ((AVSystemController *)gSharedInstance == self)
  {
    v3 = self;
    gSharedInstance = 0;
  }
  objc_msgSend((id)gSharedInstanceLock, "unlock");
}

- (void)handleServerDied
{
  void *v3;

  -[AVSystemController releaseSharedInstance](self, "releaseSharedInstance");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v3, "postNotificationName:object:", AVSystemController_ServerConnectionDiedNotification, self);
}

- (void)postFullMuteDidChangeNotification:(id)a3
{
  uint64_t v4;
  const __CFBoolean *v5;
  id v6;
  id v7;

  v4 = objc_msgSend(a3, "objectForKey:", CFSTR("FullMuted"));
  if (v4)
    v5 = (const __CFBoolean *)v4;
  else
    v5 = (const __CFBoolean *)*MEMORY[0x1E0C9AE40];
  v6 = objc_alloc(MEMORY[0x1E0C99D80]);
  v7 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", v5, AVSystemController_AudioFullMutedNotificationParameter, 0);
  self->mFullMute = CFBooleanGetValue(v5) != 0;
  +[AVSystemController postNotificationOnMainQueue:notification:object:](AVSystemController, "postNotificationOnMainQueue:notification:object:", v7, AVSystemController_FullMuteDidChangeNotification, self);

}

@end
