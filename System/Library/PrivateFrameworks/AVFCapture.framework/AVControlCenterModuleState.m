@implementation AVControlCenterModuleState

- (unint64_t)unavailableReasonsForVideoEffect:(id)a3
{
  unint64_t v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectCenterStage")))
    v5 = objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_centerStageUnavailableReasonsKey), "unsignedIntegerValue");
  else
    v5 = 0;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundBlur")))
    v5 = objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_backgroundBlurUnavailableReasonsKey), "unsignedIntegerValue");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectStudioLighting")))
    v5 = objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_studioLightingUnavailableReasonsKey), "unsignedIntegerValue");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectReactions")))
    v5 = objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_reactionsUnavailableReasonsKey), "unsignedIntegerValue");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectGestures")))
    v5 = objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_reactionsUnavailableReasonsKey), "unsignedIntegerValue");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundReplacement")))
    return objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_backgroundReplacementUnavailableReasonsKey), "unsignedIntegerValue");
  else
    return v5;
}

- (BOOL)isActive
{
  _BOOL4 holdingStateLock;
  BOOL v4;
  _BOOL4 centerStageSupported;
  _BOOL4 backgroundBlurSupported;
  _BOOL4 studioLightingSupported;
  _BOOL4 reactionEffectsSupported;
  _BOOL4 backgroundReplacementSupported;

  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  v4 = -[NSArray count](self->_supportedMicrophoneModes, "count") >= 2 && !self->_auVoiceIOBypassVoiceProcessing;
  centerStageSupported = self->_centerStageSupported;
  backgroundBlurSupported = self->_backgroundBlurSupported;
  studioLightingSupported = self->_studioLightingSupported;
  reactionEffectsSupported = self->_reactionEffectsSupported;
  backgroundReplacementSupported = self->_backgroundReplacementSupported;
  if (!holdingStateLock)
    os_unfair_lock_unlock(&self->_stateLock);
  return backgroundBlurSupported
      || centerStageSupported
      || studioLightingSupported
      || reactionEffectsSupported
      || backgroundReplacementSupported
      || v4;
}

- (void)setStudioLightingSupported:(BOOL)a3
{
  int isOptedInForStudioLight;
  _BOOL4 holdingStateLock;
  int studioLightingSupported;
  NSString *bundleID;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[3];

  isOptedInForStudioLight = a3;
  v10[2] = *MEMORY[0x1E0C80C00];
  holdingStateLock = self->_holdingStateLock;
  if (self->_holdingStateLock)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  os_unfair_lock_lock(&self->_stateLock);
  if (isOptedInForStudioLight)
LABEL_3:
    isOptedInForStudioLight = self->_isOptedInForStudioLight;
LABEL_4:
  studioLightingSupported = self->_studioLightingSupported;
  self->_studioLightingSupported = isOptedInForStudioLight;
  if (!holdingStateLock)
    os_unfair_lock_unlock(&self->_stateLock);
  if (studioLightingSupported != isOptedInForStudioLight)
  {
    v9[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
    v9[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
    bundleID = self->_bundleID;
    v10[0] = CFSTR("AVControlCenterVideoEffectStudioLighting");
    v10[1] = bundleID;
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification"), 0, v8);
  }
}

- (void)setReactionEffectsSupported:(BOOL)a3
{
  int isOptedInForReactionEffects;
  _BOOL4 holdingStateLock;
  int reactionEffectsSupported;
  NSString *bundleID;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[3];

  isOptedInForReactionEffects = a3;
  v10[2] = *MEMORY[0x1E0C80C00];
  holdingStateLock = self->_holdingStateLock;
  if (self->_holdingStateLock)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  os_unfair_lock_lock(&self->_stateLock);
  if (isOptedInForReactionEffects)
LABEL_3:
    isOptedInForReactionEffects = self->_isOptedInForReactionEffects;
LABEL_4:
  reactionEffectsSupported = self->_reactionEffectsSupported;
  self->_reactionEffectsSupported = isOptedInForReactionEffects;
  if (!holdingStateLock)
    os_unfair_lock_unlock(&self->_stateLock);
  if (reactionEffectsSupported != isOptedInForReactionEffects)
  {
    v9[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
    v9[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
    bundleID = self->_bundleID;
    v10[0] = CFSTR("AVControlCenterVideoEffectReactions");
    v10[1] = bundleID;
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification"), 0, v8);
  }
}

- (void)setCenterStageSupported:(BOOL)a3
{
  int v3;
  _BOOL4 centerStageSupported;
  NSString *bundleID;
  uint64_t v7;
  int v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v3 = a3;
  v10[2] = *MEMORY[0x1E0C80C00];
  if (self->_holdingStateLock)
  {
    centerStageSupported = self->_centerStageSupported;
    self->_centerStageSupported = a3;
    if (centerStageSupported == a3)
      return;
  }
  else
  {
    os_unfair_lock_lock(&self->_stateLock);
    v8 = self->_centerStageSupported;
    self->_centerStageSupported = v3;
    os_unfair_lock_unlock(&self->_stateLock);
    if (v8 == v3)
      return;
  }
  v9[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
  v9[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
  bundleID = self->_bundleID;
  v10[0] = CFSTR("AVControlCenterVideoEffectCenterStage");
  v10[1] = bundleID;
  v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification"), 0, v7);
}

- (void)setBackgroundBlurSupported:(BOOL)a3
{
  int isOptedInForBackgroundBlur;
  _BOOL4 holdingStateLock;
  int backgroundBlurSupported;
  NSString *bundleID;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[3];

  isOptedInForBackgroundBlur = a3;
  v10[2] = *MEMORY[0x1E0C80C00];
  holdingStateLock = self->_holdingStateLock;
  if (self->_holdingStateLock)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  os_unfair_lock_lock(&self->_stateLock);
  if (isOptedInForBackgroundBlur)
LABEL_3:
    isOptedInForBackgroundBlur = self->_isOptedInForBackgroundBlur;
LABEL_4:
  backgroundBlurSupported = self->_backgroundBlurSupported;
  self->_backgroundBlurSupported = isOptedInForBackgroundBlur;
  if (!holdingStateLock)
    os_unfair_lock_unlock(&self->_stateLock);
  if (backgroundBlurSupported != isOptedInForBackgroundBlur)
  {
    v9[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
    v9[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
    bundleID = self->_bundleID;
    v10[0] = CFSTR("AVControlCenterVideoEffectBackgroundBlur");
    v10[1] = bundleID;
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification"), 0, v8);
  }
}

- (BOOL)isDeviceBasedModuleState
{
  return self->_deviceBasedModuleState;
}

- (BOOL)supportsVideoEffect:(id)a3
{
  _BOOL4 holdingStateLock;
  BOOL centerStageSupported;

  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectCenterStage")))
    centerStageSupported = self->_centerStageSupported;
  else
    centerStageSupported = 0;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundBlur")))
    centerStageSupported = self->_backgroundBlurSupported;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectStudioLighting")))
    centerStageSupported = self->_studioLightingSupported;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectReactions")))
    centerStageSupported = self->_reactionEffectsSupported;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundReplacement")))
    centerStageSupported = self->_backgroundReplacementSupported;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectGestures")))
    centerStageSupported = self->_reactionEffectsSupported;
  if (!holdingStateLock)
    os_unfair_lock_unlock(&self->_stateLock);
  return centerStageSupported;
}

- (BOOL)isEnabledForVideoEffect:(id)a3
{
  _BOOL4 holdingStateLock;
  BOOL centerStageEnabled;

  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectCenterStage")))
    centerStageEnabled = self->_centerStageEnabled;
  else
    centerStageEnabled = 0;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundBlur")))
    centerStageEnabled = self->_backgroundBlurEnabled;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectStudioLighting")))
    centerStageEnabled = self->_studioLightingEnabled;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectReactions")))
    centerStageEnabled = self->_reactionsEnabled;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectGestures")))
    centerStageEnabled = self->_gesturesEnabled;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundReplacement")))
    centerStageEnabled = self->_backgroundReplacementEnabled;
  if (!holdingStateLock)
    os_unfair_lock_unlock(&self->_stateLock);
  return centerStageEnabled;
}

- (int64_t)controlModeForVideoEffect:(id)a3
{
  _BOOL4 holdingStateLock;
  int64_t centerStageControlMode;
  int v7;
  int v8;
  int v9;

  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectCenterStage")))
    centerStageControlMode = self->_centerStageControlMode;
  else
    centerStageControlMode = 0;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundBlur")))
    centerStageControlMode = self->_backgroundBlurControlMode;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectStudioLighting")))
    centerStageControlMode = self->_studioLightingControlMode;
  v7 = objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectReactions"));
  v8 = objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectGestures"));
  v9 = objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundReplacement"));
  if (!holdingStateLock)
    os_unfair_lock_unlock(&self->_stateLock);
  if (v9 | v8 | v7)
    return 2;
  else
    return centerStageControlMode;
}

+ (id)moduleStateForBundleID:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForBundleID:", a3);
}

- (id)initForBundleID:(id)a3
{
  AVControlCenterModuleState *v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;
  _QWORD v10[3];
  __int128 v11;
  NSString *backgroundBlurUnavailableReasonsKey;
  _QWORD v13[3];
  __int128 v14;
  NSString *centerStageUnavailableReasonsKey;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)AVControlCenterModuleState;
  v4 = -[AVControlCenterModuleState init](&v9, sel_init);
  if (v4)
  {
    v4->_bundleID = (NSString *)a3;
    v4->_stateLock._os_unfair_lock_opaque = 0;
    objc_msgSend(a3, "isEqualToString:", 0x1E4221E08);
    v5 = AVControlCenterPreferencesDomainForPreferencesDomain(a3);
    v4->_eligibleEffectsKey = (NSString *)AVControlCenterVideoEffectsEligibleEffectListPreferenceKey(v5);
    v4->_centerStageControlModeKey = (NSString *)(id)AVControlCenterVideoEffectsCenterStageControlModePreferenceKey(v5);
    v4->_centerStageEnabledKey = (NSString *)(id)AVControlCenterVideoEffectsCenterStageEnabledPreferenceKey(v5);
    v4->_centerStageUnavailableReasonsKey = (NSString *)(id)AVControlCenterVideoEffectsCenterStageUnavailableReasonsPreferenceKey(v5);
    v6 = AVControlCenterVideoEffectsCenterStageMigrationCompletePreferenceKey(v5);
    v13[0] = CFSTR("videoeffects-cinematicframing-controlmode");
    v13[1] = CFSTR("videoeffects-cinematicframing-enabled");
    v14 = *(_OWORD *)&v4->_centerStageControlModeKey;
    v13[2] = 0x1E4223688;
    centerStageUnavailableReasonsKey = v4->_centerStageUnavailableReasonsKey;
    AVControlCenterMigrateDefaultsForKeys(v5, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, v13, 3), v6);
    v4->_backgroundBlurControlModeKey = (NSString *)(id)AVControlCenterVideoEffectsPortraitEffectControlModePreferenceKey(v5);
    v4->_backgroundBlurEnabledKey = (NSString *)(id)AVControlCenterVideoEffectsPortraitEffectEnabledPreferenceKey(v5);
    v4->_backgroundBlurUnavailableReasonsKey = (NSString *)(id)AVControlCenterVideoEffectsPortraitEffectUnavailableReasonsPreferenceKey(v5);
    v4->_backgroundBlurApertureKey = (NSString *)(id)AVControlCenterVideoEffectsPortraitEffectAperturePreferenceKey(v5);
    v7 = AVControlCenterVideoEffectsPortraitEffectMigrationCompletePreferenceKey(v5);
    v10[0] = CFSTR("videoeffects-backgroundblur-controlmode");
    v10[1] = CFSTR("videoeffects-backgroundblur-enabled");
    v11 = *(_OWORD *)&v4->_backgroundBlurControlModeKey;
    v10[2] = 0x1E42236E8;
    backgroundBlurUnavailableReasonsKey = v4->_backgroundBlurUnavailableReasonsKey;
    AVControlCenterMigrateDefaultsForKeys(v5, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, v10, 3), v7);
    v4->_studioLightingControlModeKey = (NSString *)(id)AVControlCenterVideoEffectsStudioLightingControlModePreferenceKey(v5);
    v4->_studioLightingEnabledKey = (NSString *)(id)AVControlCenterVideoEffectsStudioLightingEnabledPreferenceKey(v5);
    v4->_studioLightingUnavailableReasonsKey = (NSString *)(id)AVControlCenterVideoEffectsStudioLightingUnavailableReasonsPreferenceKey(v5);
    v4->_studioLightingIntensityKey = (NSString *)(id)AVControlCenterVideoEffectsStudioLightingIntensityPreferenceKey(v5);
    v4->_previousReactionStateByDeviceIdentifier = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_reactionsEnabledKey = (NSString *)(id)AVControlCenterVideoEffectsReactionsEnabledPreferenceKey(v5);
    v4->_gesturesEnabledKey = (NSString *)(id)AVControlCenterVideoEffectsGesturesEnabledPreferenceKey(v5);
    v4->_gesturesEnabledDefaultKey = (NSString *)(id)AVControlCenterVideoEffectsGesturesEnabledDefaultPreferenceKey(v5);
    v4->_reactionsUnavailableReasonsKey = (NSString *)(id)AVControlCenterVideoEffectsReactionsUnavailableReasonsPreferenceKey(v5);
    v4->_reactionTriggeredKey = (NSString *)(id)AVControlCenterVideoEffectsReactionsTriggeredPreferenceKey(v5);
    v4->_reactionsInProgressKey = (NSString *)(id)AVControlCenterVideoEffectsReactionsInProgressPreferenceKey(v5);
    v4->_backgroundReplacementEnabledKey = (NSString *)(id)AVControlCenterVideoEffectsBackgroundReplacementEnabledPreferenceKey(v5);
    v4->_backgroundReplacementUnavailableReasonsKey = (NSString *)(id)AVControlCenterVideoEffectsBackgroundReplacementUnavailableReasonsPreferenceKey(v5);
    v4->_backgroundReplacementURLBookmarkKey = (NSString *)(id)AVControlCenterVideoEffectsBackgroundReplacementURLBookmarkPreferenceKey(v5);
    v4->_auVoiceIOBypassVoiceProcessingKey = (NSString *)(id)AVControlCenterAudioVoiceProcessingBypassedPreferenceKey(v5);
    v4->_microphoneModeKey = (NSString *)(id)AVControlCenterAudioPreferredMicrophoneModePreferenceKey(v5);
    v4->_activeMicrophoneModeKey = (NSString *)(id)AVControlCenterAudioActiveMicrophoneModePreferenceKey(v5);
    v4->_supportedMicrophoneModesKey = (NSString *)(id)AVControlCenterAudioSupportedMicrophoneModesPreferenceKey(v5);
    v4->_hiddenMicrophoneModesKey = (NSString *)(id)AVControlCenterAudioHiddenMicrophoneModesPreferenceKey(v5);
    v4->_autoMicModeEnabledKey = (NSString *)(id)AVControlCenterAudioIsAutoMicrophoneModeEnabledPreferenceKey(v5);
    -[AVControlCenterModuleState cleanUpOrphanedSupportedMicModes](v4, "cleanUpOrphanedSupportedMicModes");
    -[AVControlCenterModuleState setupDeviceBasedModuleStatesIfNeeded](v4, "setupDeviceBasedModuleStatesIfNeeded");
  }
  return v4;
}

- (void)cleanUpOrphanedSupportedMicModes
{
  __CFString *v3;
  uint64_t v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.cisco.squared"), CFSTR("com.webex.meeting"), 0), "containsObject:", self->_bundleID))
  {
    v3 = AVControlCenterPreferencesDomainForPreferencesDomain(self->_bundleID);
    v4 = AVControlCenterDidOverwriteOrphanedSupportedMicrophoneModesPreferenceKey(v3);
    if ((objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", v4), "BOOLValue") & 1) == 0)
    {
      +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", MEMORY[0x1E0C9AA60], self->_supportedMicrophoneModesKey);
      +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v4);
      if (dword_1ECFED5A0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
}

- (void)updateCenterStageSupported:(BOOL)a3 backgroundBlurSupported:(BOOL)a4 studioLightingSupported:(BOOL)a5 reactionEffectsSupported:(BOOL)a6 backgroundReplacementSupported:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  -[AVControlCenterModuleState setCenterStageSupported:](self, "setCenterStageSupported:", a3);
  -[AVControlCenterModuleState setBackgroundBlurSupported:](self, "setBackgroundBlurSupported:", v10);
  -[AVControlCenterModuleState setStudioLightingSupported:](self, "setStudioLightingSupported:", v9);
  -[AVControlCenterModuleState setReactionEffectsSupported:](self, "setReactionEffectsSupported:", v8);
  -[AVControlCenterModuleState setBackgroundReplacementSupported:](self, "setBackgroundReplacementSupported:", v7);
}

- (BOOL)isDeviceBasedModuleStateUpdateToDate
{
  return !-[AVCaptureDevice isManualFramingSupported](+[AVCaptureDevice deviceWithUniqueID:](AVCaptureDevice, "deviceWithUniqueID:", self->_bundleID), "isManualFramingSupported")|| self->_deviceSupportsManualFraming;
}

- (void)installProprietaryDefaultsHandlers
{
  os_unfair_lock_s *p_stateLock;
  uint64_t v4;
  NSString *eligibleEffectsKey;
  NSString *centerStageControlModeKey;
  NSString *centerStageEnabledKey;
  NSString *centerStageUnavailableReasonsKey;
  NSString *backgroundBlurControlModeKey;
  NSString *backgroundBlurEnabledKey;
  NSString *backgroundBlurUnavailableReasonsKey;
  NSString *backgroundBlurApertureKey;
  NSString *studioLightingControlModeKey;
  NSString *studioLightingEnabledKey;
  NSString *studioLightingUnavailableReasonsKey;
  NSString *studioLightingIntensityKey;
  NSString *reactionsEnabledKey;
  NSString *gesturesEnabledKey;
  NSString *gesturesEnabledDefaultKey;
  NSString *reactionTriggeredKey;
  NSString *reactionsInProgressKey;
  NSString *backgroundReplacementEnabledKey;
  NSString *backgroundReplacementUnavailableReasonsKey;
  NSString *backgroundReplacementURLBookmarkKey;
  NSString *auVoiceIOBypassVoiceProcessingKey;
  NSString *microphoneModeKey;
  NSString *activeMicrophoneModeKey;
  NSString *supportedMicrophoneModesKey;
  NSString *hiddenMicrophoneModesKey;
  NSString *autoMicModeEnabledKey;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[5];

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  self->_holdingStateLock = 1;
  v4 = MEMORY[0x1E0C809B0];
  eligibleEffectsKey = self->_eligibleEffectsKey;
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke;
  v56[3] = &unk_1E4216450;
  v56[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, eligibleEffectsKey, 1, v56);
  centerStageControlModeKey = self->_centerStageControlModeKey;
  v55[0] = v4;
  v55[1] = 3221225472;
  v55[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_2;
  v55[3] = &unk_1E4216450;
  v55[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, centerStageControlModeKey, 1, v55);
  centerStageEnabledKey = self->_centerStageEnabledKey;
  v54[0] = v4;
  v54[1] = 3221225472;
  v54[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_3;
  v54[3] = &unk_1E4216450;
  v54[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, centerStageEnabledKey, 1, v54);
  centerStageUnavailableReasonsKey = self->_centerStageUnavailableReasonsKey;
  v53[0] = v4;
  v53[1] = 3221225472;
  v53[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_4;
  v53[3] = &unk_1E4216450;
  v53[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, centerStageUnavailableReasonsKey, 1, v53);
  backgroundBlurControlModeKey = self->_backgroundBlurControlModeKey;
  v52[0] = v4;
  v52[1] = 3221225472;
  v52[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_5;
  v52[3] = &unk_1E4216450;
  v52[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, backgroundBlurControlModeKey, 1, v52);
  backgroundBlurEnabledKey = self->_backgroundBlurEnabledKey;
  v51[0] = v4;
  v51[1] = 3221225472;
  v51[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_6;
  v51[3] = &unk_1E4216450;
  v51[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, backgroundBlurEnabledKey, 1, v51);
  backgroundBlurUnavailableReasonsKey = self->_backgroundBlurUnavailableReasonsKey;
  v50[0] = v4;
  v50[1] = 3221225472;
  v50[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_7;
  v50[3] = &unk_1E4216450;
  v50[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, backgroundBlurUnavailableReasonsKey, 1, v50);
  backgroundBlurApertureKey = self->_backgroundBlurApertureKey;
  v49[0] = v4;
  v49[1] = 3221225472;
  v49[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_8;
  v49[3] = &unk_1E4216450;
  v49[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, backgroundBlurApertureKey, 1, v49);
  studioLightingControlModeKey = self->_studioLightingControlModeKey;
  v48[0] = v4;
  v48[1] = 3221225472;
  v48[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_9;
  v48[3] = &unk_1E4216450;
  v48[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, studioLightingControlModeKey, 1, v48);
  studioLightingEnabledKey = self->_studioLightingEnabledKey;
  v47[0] = v4;
  v47[1] = 3221225472;
  v47[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_10;
  v47[3] = &unk_1E4216450;
  v47[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, studioLightingEnabledKey, 1, v47);
  studioLightingUnavailableReasonsKey = self->_studioLightingUnavailableReasonsKey;
  v46[0] = v4;
  v46[1] = 3221225472;
  v46[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_11;
  v46[3] = &unk_1E4216450;
  v46[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, studioLightingUnavailableReasonsKey, 1, v46);
  studioLightingIntensityKey = self->_studioLightingIntensityKey;
  v45[0] = v4;
  v45[1] = 3221225472;
  v45[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_12;
  v45[3] = &unk_1E4216450;
  v45[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, studioLightingIntensityKey, 1, v45);
  reactionsEnabledKey = self->_reactionsEnabledKey;
  v44[0] = v4;
  v44[1] = 3221225472;
  v44[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_13;
  v44[3] = &unk_1E4216450;
  v44[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, reactionsEnabledKey, 1, v44);
  gesturesEnabledKey = self->_gesturesEnabledKey;
  v43[0] = v4;
  v43[1] = 3221225472;
  v43[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_14;
  v43[3] = &unk_1E4216450;
  v43[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, gesturesEnabledKey, 1, v43);
  gesturesEnabledDefaultKey = self->_gesturesEnabledDefaultKey;
  v42[0] = v4;
  v42[1] = 3221225472;
  v42[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_15;
  v42[3] = &unk_1E4216450;
  v42[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, gesturesEnabledDefaultKey, 0, v42);
  reactionTriggeredKey = self->_reactionTriggeredKey;
  v41[0] = v4;
  v41[1] = 3221225472;
  v41[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_16;
  v41[3] = &unk_1E4216450;
  v41[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, reactionTriggeredKey, 0, v41);
  reactionsInProgressKey = self->_reactionsInProgressKey;
  v40[0] = v4;
  v40[1] = 3221225472;
  v40[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_17;
  v40[3] = &unk_1E4216450;
  v40[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, reactionsInProgressKey, 0, v40);
  backgroundReplacementEnabledKey = self->_backgroundReplacementEnabledKey;
  v39[0] = v4;
  v39[1] = 3221225472;
  v39[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_18;
  v39[3] = &unk_1E4216450;
  v39[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, backgroundReplacementEnabledKey, 1, v39);
  backgroundReplacementUnavailableReasonsKey = self->_backgroundReplacementUnavailableReasonsKey;
  v38[0] = v4;
  v38[1] = 3221225472;
  v38[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_19;
  v38[3] = &unk_1E4216450;
  v38[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, backgroundReplacementUnavailableReasonsKey, 1, v38);
  backgroundReplacementURLBookmarkKey = self->_backgroundReplacementURLBookmarkKey;
  v37[0] = v4;
  v37[1] = 3221225472;
  v37[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_20;
  v37[3] = &unk_1E4216450;
  v37[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, backgroundReplacementURLBookmarkKey, 1, v37);
  auVoiceIOBypassVoiceProcessingKey = self->_auVoiceIOBypassVoiceProcessingKey;
  v36[0] = v4;
  v36[1] = 3221225472;
  v36[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_21;
  v36[3] = &unk_1E4216450;
  v36[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, auVoiceIOBypassVoiceProcessingKey, 1, v36);
  microphoneModeKey = self->_microphoneModeKey;
  v35[0] = v4;
  v35[1] = 3221225472;
  v35[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_22;
  v35[3] = &unk_1E4216450;
  v35[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, microphoneModeKey, 1, v35);
  activeMicrophoneModeKey = self->_activeMicrophoneModeKey;
  v34[0] = v4;
  v34[1] = 3221225472;
  v34[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_23;
  v34[3] = &unk_1E4216450;
  v34[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, activeMicrophoneModeKey, 1, v34);
  supportedMicrophoneModesKey = self->_supportedMicrophoneModesKey;
  v33[0] = v4;
  v33[1] = 3221225472;
  v33[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_24;
  v33[3] = &unk_1E4216450;
  v33[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, supportedMicrophoneModesKey, 1, v33);
  hiddenMicrophoneModesKey = self->_hiddenMicrophoneModesKey;
  v32[0] = v4;
  v32[1] = 3221225472;
  v32[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_25;
  v32[3] = &unk_1E4216450;
  v32[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, hiddenMicrophoneModesKey, 1, v32);
  autoMicModeEnabledKey = self->_autoMicModeEnabledKey;
  v31[0] = v4;
  v31[1] = 3221225472;
  v31[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_26;
  v31[3] = &unk_1E4216450;
  v31[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, autoMicModeEnabledKey, 1, v31);
  os_unfair_lock_unlock(p_stateLock);
  self->_holdingStateLock = 0;
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEligibleEffects:");
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), AVCCM_CenterStageControlModeChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), AVCCM_CenterStageEnabledChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), AVCCM_CenterStageUnavailableReasonsChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), AVCCM_BackgroundBlurControlModeChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), AVCCM_BackgroundBlurEnabledChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), AVCCM_BackgroundBlurUnavailableReasonsChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136), AVCCM_BackgroundBlurApertureChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), AVCCM_StudioLightingControlModeChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), AVCCM_StudioLightingEnabledChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184), AVCCM_StudioLightingUnavailableReasonsChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200), AVCCM_StudioLightingIntensityChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216), AVCCM_ReactionsEnabledChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232), AVCCM_GesturesEnabledChangedContext);
}

id __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_15(uint64_t a1)
{
  id result;

  result = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232));
  if (!result)
    return (id)objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232), AVCCM_GesturesEnabledChangedContext);
  return result;
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256), AVCCM_ReactionEffectTriggeredContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272), AVCCM_ReactionEffectsInProgressChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288), AVCCM_BackgroundReplacementEnabledChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_19(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296), AVCCM_BackgroundReplacementUnavailableReasonsChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312), AVCCM_BackgroundReplacementURLChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344), AVCCM_AUVoiceIOBypassVoiceProcessingChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_22(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368), AVCCM_AUVoiceIOChatFlavorChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_23(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 376), AVCCM_AUVoiceIOActiveChatFlavorChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392), AVCCM_AUVoiceIOSupportedChatFlavorsChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408), AVCCM_AUVoiceIOHiddenChatFlavorsChangedContext);
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_26(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:context:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424), AVCCM_AUVoiceIOAutoEnabledChangedContext);
}

- (void)dealloc
{
  __CVBuffer *backgroundReplacementPixelBuffer;
  objc_super v4;

  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_centerStageControlModeKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_centerStageEnabledKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_centerStageUnavailableReasonsKey);

  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_backgroundBlurControlModeKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_backgroundBlurEnabledKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_backgroundBlurUnavailableReasonsKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_backgroundBlurApertureKey);

  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_studioLightingControlModeKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_studioLightingEnabledKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_studioLightingUnavailableReasonsKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_studioLightingIntensityKey);

  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_reactionsEnabledKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_gesturesEnabledKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_reactionsUnavailableReasonsKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_reactionTriggeredKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_reactionsInProgressKey);

  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_backgroundReplacementEnabledKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_backgroundReplacementUnavailableReasonsKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_backgroundReplacementURLBookmarkKey);

  backgroundReplacementPixelBuffer = self->_backgroundReplacementPixelBuffer;
  if (backgroundReplacementPixelBuffer)
  {
    CFRelease(backgroundReplacementPixelBuffer);
    self->_backgroundReplacementPixelBuffer = 0;
  }
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_auVoiceIOBypassVoiceProcessingKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_microphoneModeKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_activeMicrophoneModeKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_supportedMicrophoneModesKey);
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_hiddenMicrophoneModesKey);
  -[AVControlCenterModuleState invalidateDeviceBasedModuleStatesIfNeeded](self, "invalidateDeviceBasedModuleStatesIfNeeded");

  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_eligibleEffectsKey);
  v4.receiver = self;
  v4.super_class = (Class)AVControlCenterModuleState;
  -[AVControlCenterModuleState dealloc](&v4, sel_dealloc);
}

- (void)_updateEligibleEffects:(id)a3
{
  _BOOL4 holdingStateLock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    holdingStateLock = self->_holdingStateLock;
    if (!self->_holdingStateLock)
      os_unfair_lock_lock(&self->_stateLock);
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
    self->_isOptedInForBackgroundBlur = objc_msgSend(v6, "containsObject:", AVCaptureBundleCameraPortraitEffectEnabledKey);
    self->_isOptedInForStudioLight = objc_msgSend(v6, "containsObject:", AVCaptureBundleCameraStudioLightEnabledKey);
    self->_isOptedInForReactionEffects = objc_msgSend(v6, "containsObject:", AVCaptureBundleCameraReactionEffectsEnabledKey);
    self->_isOptedInForBackgroundReplacement = objc_msgSend(v6, "containsObject:", AVCaptureBundleCameraBackgroundReplacementEnabledKey);
    if (!holdingStateLock)
      os_unfair_lock_unlock(&self->_stateLock);
    v7 = objc_msgSend((id)sCaptureDeviceWatcher, "centerStageSupported");
    v8 = objc_msgSend((id)sCaptureDeviceWatcher, "backgroundBlurSupported");
    v9 = objc_msgSend((id)sCaptureDeviceWatcher, "studioLightingSupported");
    v10 = objc_msgSend((id)sCaptureDeviceWatcher, "reactionEffectsSupported");
    -[AVControlCenterModuleState updateCenterStageSupported:backgroundBlurSupported:studioLightingSupported:reactionEffectsSupported:backgroundReplacementSupported:](self, "updateCenterStageSupported:backgroundBlurSupported:studioLightingSupported:reactionEffectsSupported:backgroundReplacementSupported:", v7, v8, v9, v10, objc_msgSend((id)sCaptureDeviceWatcher, "backgroundReplacementSupported"));
  }
}

- (BOOL)centerStageSupported
{
  _BOOL4 centerStageSupported;
  os_unfair_lock_s *p_stateLock;

  if (self->_holdingStateLock)
  {
    return self->_centerStageSupported;
  }
  else
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    centerStageSupported = self->_centerStageSupported;
    os_unfair_lock_unlock(p_stateLock);
  }
  return centerStageSupported;
}

- (BOOL)backgroundBlurSupported
{
  _BOOL4 backgroundBlurSupported;
  os_unfair_lock_s *p_stateLock;

  if (self->_holdingStateLock)
  {
    return self->_backgroundBlurSupported;
  }
  else
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    backgroundBlurSupported = self->_backgroundBlurSupported;
    os_unfair_lock_unlock(p_stateLock);
  }
  return backgroundBlurSupported;
}

- (BOOL)studioLightingSupported
{
  _BOOL4 studioLightingSupported;
  os_unfair_lock_s *p_stateLock;

  if (self->_holdingStateLock)
  {
    return self->_studioLightingSupported;
  }
  else
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    studioLightingSupported = self->_studioLightingSupported;
    os_unfair_lock_unlock(p_stateLock);
  }
  return studioLightingSupported;
}

- (BOOL)reactionEffectsSupported
{
  _BOOL4 reactionEffectsSupported;
  os_unfair_lock_s *p_stateLock;

  if (self->_holdingStateLock)
  {
    return self->_reactionEffectsSupported;
  }
  else
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    reactionEffectsSupported = self->_reactionEffectsSupported;
    os_unfair_lock_unlock(p_stateLock);
  }
  return reactionEffectsSupported;
}

- (BOOL)backgroundReplacementSupported
{
  _BOOL4 backgroundReplacementSupported;
  os_unfair_lock_s *p_stateLock;

  if (self->_holdingStateLock)
  {
    return self->_backgroundReplacementSupported;
  }
  else
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    backgroundReplacementSupported = self->_backgroundReplacementSupported;
    os_unfair_lock_unlock(p_stateLock);
  }
  return backgroundReplacementSupported;
}

- (void)setBackgroundReplacementSupported:(BOOL)a3
{
  int isOptedInForBackgroundReplacement;
  _BOOL4 holdingStateLock;
  int backgroundReplacementSupported;
  NSString *bundleID;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[3];

  isOptedInForBackgroundReplacement = a3;
  v10[2] = *MEMORY[0x1E0C80C00];
  holdingStateLock = self->_holdingStateLock;
  if (self->_holdingStateLock)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  os_unfair_lock_lock(&self->_stateLock);
  if (isOptedInForBackgroundReplacement)
LABEL_3:
    isOptedInForBackgroundReplacement = self->_isOptedInForBackgroundReplacement;
LABEL_4:
  backgroundReplacementSupported = self->_backgroundReplacementSupported;
  self->_backgroundReplacementSupported = isOptedInForBackgroundReplacement;
  if (!holdingStateLock)
    os_unfair_lock_unlock(&self->_stateLock);
  if (backgroundReplacementSupported != isOptedInForBackgroundReplacement)
  {
    v9[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
    v9[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
    bundleID = self->_bundleID;
    v10[0] = CFSTR("AVControlCenterVideoEffectBackgroundReplacement");
    v10[1] = bundleID;
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification"), 0, v8);
  }
}

- (BOOL)isAutoMicrophoneModeSupported
{
  return AVControlCenterAudioMicrophoneMGAutoMode() != -1;
}

- (BOOL)setEnabled:(BOOL)a3 forVideoEffect:(id)a4
{
  _BOOL8 v5;
  _BOOL4 holdingStateLock;
  int v8;

  v5 = a3;
  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
  {
    os_unfair_lock_lock(&self->_stateLock);
    self->_holdingStateLock = 1;
  }
  v8 = objc_msgSend(a4, "isEqualToString:", CFSTR("AVControlCenterVideoEffectCenterStage"));
  if (v8)
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5), self->_centerStageEnabledKey);
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundBlur")))
  {
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5), self->_backgroundBlurEnabledKey);
    LOBYTE(v8) = 1;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("AVControlCenterVideoEffectStudioLighting")))
  {
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5), self->_studioLightingEnabledKey);
    LOBYTE(v8) = 1;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("AVControlCenterVideoEffectReactions")))
  {
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5), self->_reactionsEnabledKey);
    LOBYTE(v8) = 1;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("AVControlCenterVideoEffectGestures")))
  {
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5), self->_gesturesEnabledKey);
    LOBYTE(v8) = 1;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundReplacement")))
  {
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5), self->_backgroundReplacementEnabledKey);
    LOBYTE(v8) = 1;
  }
  if (!holdingStateLock)
  {
    os_unfair_lock_unlock(&self->_stateLock);
    self->_holdingStateLock = 0;
  }
  return v8;
}

- (void)performReactionEffect:(id)a3 forCaptureDeviceWithID:(id)a4
{
  _BOOL4 holdingStateLock;
  NSString *v8;
  NSString *bundleID;
  uint64_t v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  v8 = self->_reactionTriggeredKey;
  bundleID = self->_bundleID;
  v11[0] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
  v11[1] = CFSTR("AVControlCenterModulesNotificationDeviceIdentifierKey");
  v12[0] = bundleID;
  v12[1] = a4;
  v11[2] = CFSTR("AVControlCenterModulesNotificationReactionTypeKey");
  v12[2] = a3;
  v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  if (!holdingStateLock)
    os_unfair_lock_unlock(&self->_stateLock);
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v10, v8);

}

- (void)updateActiveReactions:(id)a3 currentRenderPTS:(id *)a4 requestedTriggers:(int)a5 forCaptureDeviceWithID:(id)a6
{
  _BOOL4 holdingStateLock;
  NSString *v12;
  NSString *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  __int128 v19;
  int64_t var3;
  _QWORD v21[6];
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  v12 = self->_bundleID;
  v13 = self->_reactionsInProgressKey;
  v14 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_previousReactionStateByDeviceIdentifier, "objectForKeyedSubscript:", a6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_previousReactionStateByDeviceIdentifier, "setObject:forKeyedSubscript:", (id)objc_msgSend(a3, "mutableCopy"), a6);
  if (!holdingStateLock)
    os_unfair_lock_unlock(&self->_stateLock);
  if (a5 > 0 || (v15 = objc_msgSend(a3, "count"), v15 != objc_msgSend(v14, "count")))
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count") + objc_msgSend(v14, "count"));
    v17 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __110__AVControlCenterModuleState_updateActiveReactions_currentRenderPTS_requestedTriggers_forCaptureDeviceWithID___block_invoke;
    v21[3] = &unk_1E421DA18;
    v21[4] = v14;
    v21[5] = v16;
    objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v21);
    v18[0] = v17;
    v18[1] = 3221225472;
    v18[2] = __110__AVControlCenterModuleState_updateActiveReactions_currentRenderPTS_requestedTriggers_forCaptureDeviceWithID___block_invoke_2;
    v18[3] = &unk_1E421DA40;
    v19 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v18[4] = v16;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v18);
    objc_msgSend(v16, "sortUsingComparator:", &__block_literal_global_22);
    v22[0] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
    v22[1] = CFSTR("AVControlCenterModulesNotificationDeviceIdentifierKey");
    v23[0] = v12;
    v23[1] = a6;
    v22[2] = CFSTR("AVControlCenterModulesNotificationReactionEffectsInProgressKey");
    v23[2] = v16;
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3), v13);
  }

}

void __110__AVControlCenterModuleState_updateActiveReactions_currentRenderPTS_requestedTriggers_forCaptureDeviceWithID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  AVCaptureReactionType AVCaptureReactionTypeForPTEffectReactionType;
  AVCaptureReactionType v6;
  Float64 v7;
  AVCaptureReactionEffectState *v8;
  AVCaptureReactionEffectState *v9;
  CMTime v10;
  CMTime v11;

  objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", a2);
  AVCaptureReactionTypeForPTEffectReactionType = _AVControlCenterGetAVCaptureReactionTypeForPTEffectReactionType(objc_msgSend(a3, "effectType"));
  if (AVCaptureReactionTypeForPTEffectReactionType)
  {
    v6 = AVCaptureReactionTypeForPTEffectReactionType;
    memset(&v11, 0, sizeof(v11));
    objc_msgSend(a3, "startTime");
    CMTimeMakeWithSeconds(&v11, v7, 1000000000);
    v8 = [AVCaptureReactionEffectState alloc];
    v10 = v11;
    v9 = -[AVCaptureReactionEffectState initWithReactionType:startTime:](v8, "initWithReactionType:startTime:", v6, &v10);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", -[AVCaptureReactionEffectState dictionaryRepresentation](v9, "dictionaryRepresentation"));

  }
}

void __110__AVControlCenterModuleState_updateActiveReactions_currentRenderPTS_requestedTriggers_forCaptureDeviceWithID___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  AVCaptureReactionType AVCaptureReactionTypeForPTEffectReactionType;
  AVCaptureReactionType v6;
  Float64 v7;
  AVCaptureReactionEffectState *v8;
  AVCaptureReactionEffectState *v9;
  __int128 v10;
  uint64_t v11;
  CMTime v12;
  CMTime v13;

  AVCaptureReactionTypeForPTEffectReactionType = _AVControlCenterGetAVCaptureReactionTypeForPTEffectReactionType(objc_msgSend(a3, "effectType"));
  if (AVCaptureReactionTypeForPTEffectReactionType)
  {
    v6 = AVCaptureReactionTypeForPTEffectReactionType;
    memset(&v13, 0, sizeof(v13));
    objc_msgSend(a3, "startTime");
    CMTimeMakeWithSeconds(&v13, v7, 1000000000);
    v8 = [AVCaptureReactionEffectState alloc];
    v12 = v13;
    v10 = *(_OWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 56);
    v9 = -[AVCaptureReactionEffectState initWithReactionType:startTime:endTime:](v8, "initWithReactionType:startTime:endTime:", v6, &v12, &v10);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", -[AVCaptureReactionEffectState dictionaryRepresentation](v9, "dictionaryRepresentation"));

  }
}

uint64_t __110__AVControlCenterModuleState_updateActiveReactions_currentRenderPTS_requestedTriggers_forCaptureDeviceWithID___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("StartTime")), "compare:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StartTime")));
}

- (NSURL)backgroundReplacementURL
{
  _BOOL4 holdingStateLock;
  NSURL *v4;

  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_backgroundReplacementURL;
  if (!holdingStateLock)
    os_unfair_lock_unlock(&self->_stateLock);
  return v4;
}

- (void)setBackgroundReplacementURL:(id)a3
{
  void *v4;
  uint64_t v5;

  if (a3)
  {
    v5 = 0;
    v4 = (void *)objc_msgSend(a3, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 0, 0, 0, &v5);
    if (v5)
      return;
    a3 = v4;
  }
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", a3, self->_backgroundReplacementURLBookmarkKey);
}

- (__CVBuffer)backgroundReplacementPixelBufferFillingWidth:(int)a3 height:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  _BOOL4 holdingStateLock;
  __CVBuffer *backgroundReplacementPixelBuffer;
  CFTypeRef v9;
  __CVBuffer *v10;
  __CVBuffer *v11;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  backgroundReplacementPixelBuffer = self->_backgroundReplacementPixelBuffer;
  if (backgroundReplacementPixelBuffer)
  {
    if (self->_backgroundReplacementPixelBufferFillWidth == (_DWORD)v5
      && self->_backgroundReplacementPixelBufferFillHeight == (_DWORD)v4)
    {
      v9 = CFRetain(backgroundReplacementPixelBuffer);
      v10 = (__CVBuffer *)CFAutorelease(v9);
      if (!holdingStateLock)
        goto LABEL_16;
      goto LABEL_17;
    }
    if (!(_DWORD)v5 || !(_DWORD)v4)
    {
      CFRelease(backgroundReplacementPixelBuffer);
      self->_backgroundReplacementPixelBuffer = 0;
      goto LABEL_15;
    }
LABEL_13:
    v10 = 0;
    if (!holdingStateLock)
      goto LABEL_16;
    goto LABEL_17;
  }
  if ((_DWORD)v5 && (_DWORD)v4)
    goto LABEL_13;
LABEL_15:
  v10 = 0;
  *(_QWORD *)&self->_backgroundReplacementPixelBufferFillWidth = 0;
  if (!holdingStateLock)
LABEL_16:
    os_unfair_lock_unlock(&self->_stateLock);
LABEL_17:
  if ((int)v4 >= 1 && (int)v5 >= 1 && !v10)
  {
    v10 = +[AVCaptureProprietaryDefaultsSingleton imageForKey:fillWidth:fillHeight:](AVCaptureProprietaryDefaultsSingleton, "imageForKey:fillWidth:fillHeight:", self->_backgroundReplacementURLBookmarkKey, v5, v4);
    if (v10
      || (-[AVControlCenterModuleState setBackgroundReplacementURL:](self, "setBackgroundReplacementURL:", +[AVCaptureDevice backgroundReplacementURLDefault](AVCaptureDevice, "backgroundReplacementURLDefault")), (v10 = +[AVCaptureProprietaryDefaultsSingleton imageForKey:fillWidth:fillHeight:](AVCaptureProprietaryDefaultsSingleton, "imageForKey:fillWidth:fillHeight:", self->_backgroundReplacementURLBookmarkKey, v5, v4)) != 0))
    {
      if (!holdingStateLock)
        os_unfair_lock_lock(&self->_stateLock);
      v11 = self->_backgroundReplacementPixelBuffer;
      self->_backgroundReplacementPixelBuffer = v10;
      CFRetain(v10);
      if (v11)
        CFRelease(v11);
      self->_backgroundReplacementPixelBufferFillWidth = v5;
      self->_backgroundReplacementPixelBufferFillHeight = v4;
      if (!holdingStateLock)
        os_unfair_lock_unlock(&self->_stateLock);
    }
  }
  return v10;
}

- (BOOL)hasBackgroundReplacementBeenToggled
{
  return +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_backgroundReplacementEnabledKey) != 0;
}

- (float)getEffectIntensityForVideoEffect:(id)a3
{
  _BOOL4 holdingStateLock;
  uint64_t v6;
  float v7;
  void *v8;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundBlur")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectStudioLighting")) & 1) != 0)
  {
    holdingStateLock = self->_holdingStateLock;
    if (!self->_holdingStateLock)
      os_unfair_lock_lock(&self->_stateLock);
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundBlur")) & 1) != 0)
    {
      v6 = 128;
    }
    else
    {
      v7 = 0.0;
      if (!objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectStudioLighting")))
        goto LABEL_10;
      v6 = 192;
    }
    v7 = *(float *)((char *)&self->super.isa + v6);
LABEL_10:
    if (!holdingStateLock)
      os_unfair_lock_unlock(&self->_stateLock);
    return v7;
  }
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  return 0.0;
}

- (BOOL)setEffectIntensityForVideoEffect:(float)a3 forVideoEffect:(id)a4
{
  _BOOL4 holdingStateLock;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  void *v16;

  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundBlur")) & 1) == 0
    && (objc_msgSend(a4, "isEqualToString:", CFSTR("AVControlCenterVideoEffectStudioLighting")) & 1) == 0)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v14);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v14);
    return 0;
  }
  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
  {
    os_unfair_lock_lock(&self->_stateLock);
    self->_holdingStateLock = 1;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundBlur")))
  {
    +[AVCaptureDevice backgroundBlurApertureRange](AVCaptureDevice, "backgroundBlurApertureRange");
    if (v8 > a3
      || (+[AVCaptureDevice backgroundBlurApertureRange](AVCaptureDevice, "backgroundBlurApertureRange"),
          v10 < a3))
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
LABEL_18:
      v16 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector(), 0);
      if (!holdingStateLock)
      {
        os_unfair_lock_unlock(&self->_stateLock);
        self->_holdingStateLock = 0;
      }
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v16);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v16);
      return 0;
    }
    v13 = 136;
LABEL_25:
    *(float *)&v9 = a3;
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9), *(Class *)((char *)&self->super.isa + v13));
    v15 = 1;
    if (holdingStateLock)
      return v15;
LABEL_26:
    os_unfair_lock_unlock(&self->_stateLock);
    self->_holdingStateLock = 0;
    return v15;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("AVControlCenterVideoEffectStudioLighting")))
  {
    if (a3 < 0.0 || a3 > 1.0)
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
      goto LABEL_18;
    }
    v13 = 200;
    goto LABEL_25;
  }
  v15 = 0;
  if (!holdingStateLock)
    goto LABEL_26;
  return v15;
}

- (AudioValueRange)getEffectIntensityRangeForVideoEffect:(id)a3
{
  double v4;
  double v5;
  int v6;
  void *v7;
  AudioValueRange result;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundBlur")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectStudioLighting")) & 1) != 0)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundBlur")))
    {
      +[AVCaptureDevice backgroundBlurApertureRange](AVCaptureDevice, "backgroundBlurApertureRange");
    }
    else
    {
      v6 = objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectStudioLighting"));
      v4 = 0.0;
      v5 = 1.0;
      if (!v6)
        v5 = 0.0;
    }
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
    v5 = 0.0;
    v4 = 0.0;
  }
  result.mMaximum = v5;
  result.mMinimum = v4;
  return result;
}

- (float)getEffectIntensityDefaultForVideoEffect:(id)a3
{
  float result;
  void *v5;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundBlur")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectStudioLighting")) & 1) != 0)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectBackgroundBlur")))
    {
      +[AVCaptureDevice backgroundBlurApertureDefault](AVCaptureDevice, "backgroundBlurApertureDefault");
      return result;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVControlCenterVideoEffectStudioLighting")))
    {
      +[AVCaptureDevice studioLightingIntensityDefault](AVCaptureDevice, "studioLightingIntensityDefault");
      return result;
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
  return 0.0;
}

- (void)enableBlackenFrames:(BOOL)a3 forDeviceUID:(id)a4
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = AVControlCenterBlackenFramesPreferenceKey(self->_bundleID, (uint64_t)a4);
  if (v4)
    v6 = MEMORY[0x1E0C9AAB0];
  else
    v6 = 0;
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v6, v5);
}

- (id)supportedMicrophoneModes
{
  _BOOL4 holdingStateLock;
  void *v4;

  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  if (-[AVControlCenterModuleState micModesSupported](self, "micModesSupported"))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_supportedMicrophoneModes);
    if (!holdingStateLock)
      goto LABEL_7;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
    if (!holdingStateLock)
LABEL_7:
      os_unfair_lock_unlock(&self->_stateLock);
  }
  return v4;
}

- (id)hiddenMicrophoneModes
{
  _BOOL4 holdingStateLock;
  void *v4;

  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  if (!self->_hiddenMicrophoneModes)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
    if (holdingStateLock)
      return v4;
    goto LABEL_5;
  }
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
  if (!holdingStateLock)
LABEL_5:
    os_unfair_lock_unlock(&self->_stateLock);
  return v4;
}

- (int64_t)microphoneMode
{
  _BOOL4 holdingStateLock;
  int64_t microphoneMode;

  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  if (-[AVControlCenterModuleState micModesSupported](self, "micModesSupported"))
  {
    microphoneMode = self->_microphoneMode;
    if (!holdingStateLock)
      goto LABEL_7;
  }
  else
  {
    microphoneMode = 0;
    if (!holdingStateLock)
LABEL_7:
      os_unfair_lock_unlock(&self->_stateLock);
  }
  return microphoneMode;
}

- (BOOL)setMicrophoneMode:(int64_t)a3
{
  _BOOL4 holdingStateLock;
  void *v6;
  BOOL v7;

  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
  {
    os_unfair_lock_lock(&self->_stateLock);
    self->_holdingStateLock = 1;
  }
  LODWORD(v6) = -[AVControlCenterModuleState micModesSupported](self, "micModesSupported");
  if ((_DWORD)v6)
  {
    v7 = -[NSArray containsObject:](self->_supportedMicrophoneModes, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
    if (a3 && !v7)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
      if (!holdingStateLock)
      {
        os_unfair_lock_unlock(&self->_stateLock);
        self->_holdingStateLock = 0;
      }
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v6);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
      LOBYTE(v6) = 0;
      return (char)v6;
    }
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), self->_microphoneModeKey);
  }
  if (!holdingStateLock)
  {
    os_unfair_lock_unlock(&self->_stateLock);
    self->_holdingStateLock = 0;
  }
  return (char)v6;
}

- (int64_t)activeMicrophoneMode
{
  _BOOL4 holdingStateLock;
  uint64_t activeMicrophoneMode;

  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  activeMicrophoneMode = self->_activeMicrophoneMode;
  if (activeMicrophoneMode <= 0)
  {
    if (activeMicrophoneMode == -1)
    {
      activeMicrophoneMode = self->_microphoneMode;
      if (holdingStateLock)
        return activeMicrophoneMode;
      goto LABEL_7;
    }
    activeMicrophoneMode = 0;
  }
  if (!holdingStateLock)
LABEL_7:
    os_unfair_lock_unlock(&self->_stateLock);
  return activeMicrophoneMode;
}

- (BOOL)voiceProcessingBypassed
{
  _BOOL4 holdingStateLock;
  BOOL auVoiceIOBypassVoiceProcessing;

  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  if (-[AVControlCenterModuleState micModesSupported](self, "micModesSupported"))
  {
    auVoiceIOBypassVoiceProcessing = self->_auVoiceIOBypassVoiceProcessing;
    if (!holdingStateLock)
      goto LABEL_7;
  }
  else
  {
    auVoiceIOBypassVoiceProcessing = 0;
    if (!holdingStateLock)
LABEL_7:
      os_unfair_lock_unlock(&self->_stateLock);
  }
  return auVoiceIOBypassVoiceProcessing;
}

- (BOOL)isAutoMicrophoneModeEnabled
{
  _BOOL4 holdingStateLock;
  BOOL autoMicModeEnabled;

  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  if (-[AVControlCenterModuleState isAutoMicrophoneModeSupported](self, "isAutoMicrophoneModeSupported"))
  {
    autoMicModeEnabled = self->_autoMicModeEnabled;
    if (!holdingStateLock)
      goto LABEL_7;
  }
  else
  {
    autoMicModeEnabled = 0;
    if (!holdingStateLock)
LABEL_7:
      os_unfair_lock_unlock(&self->_stateLock);
  }
  return autoMicModeEnabled;
}

- (BOOL)setAutoMicrophoneModeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 holdingStateLock;
  _BOOL4 v6;

  v3 = a3;
  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
  {
    os_unfair_lock_lock(&self->_stateLock);
    self->_holdingStateLock = 1;
  }
  v6 = -[AVControlCenterModuleState isAutoMicrophoneModeSupported](self, "isAutoMicrophoneModeSupported");
  if (v6)
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3), self->_autoMicModeEnabledKey);
  if (!holdingStateLock)
  {
    os_unfair_lock_unlock(&self->_stateLock);
    self->_holdingStateLock = 0;
  }
  return v6;
}

- (void)startPanningAtPoint:(CGPoint)a3
{
  CFDictionaryRef DictionaryRepresentation;

  DictionaryRepresentation = CGPointCreateDictionaryRepresentation(a3);
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", DictionaryRepresentation, self->_startPanningAtPointKey);
  CFRelease(DictionaryRepresentation);
}

- (void)panWithTranslation:(CGPoint)a3
{
  CFDictionaryRef DictionaryRepresentation;

  DictionaryRepresentation = CGPointCreateDictionaryRepresentation(a3);
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", DictionaryRepresentation, self->_panWithTranslationKey);
  CFRelease(DictionaryRepresentation);
}

- (void)setManualFramingOriginalZoomFactor:(double)a3 convertedZoomFactor:(double)a4
{
  uint64_t v7;
  uint64_t v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = AVControlCenterManualFramingOriginalVideoZoomFactor;
  v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v12[1] = AVControlCenterManualFramingConvertedVideoZoomFactor;
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v12[2] = AVControlCenterManualFramingUpdateSettingEntity;
  v13[1] = v7;
  v13[2] = CFSTR("ControlCenterModules");
  v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVControlCenterModuleState _checkManualFramingDefaultStateWithNewOriginalZoomFactor:](self, "_checkManualFramingDefaultStateWithNewOriginalZoomFactor:", a3, v10, v11);
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v8, self->_manualFramingVideoZoomFactorKey);
}

- (double)manualFramingOriginalVideoZoomFactor
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  float v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v13;
  int64_t v14;
  float v15;
  double v16;
  double v17;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v3 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_manualFramingVideoZoomFactorKey);
  if (v3 && (v4 = v3, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", AVControlCenterManualFramingOriginalVideoZoomFactor);
    v6 = objc_msgSend(v4, "objectForKeyedSubscript:", AVControlCenterManualFramingConvertedVideoZoomFactor);
    if (v5)
    {
      objc_msgSend(v5, "floatValue");
      v8 = v7;
    }
    else
    {
      v13 = (void *)v6;
      v14 = -[AVControlCenterModuleState manualFramingDeviceType](self, "manualFramingDeviceType");
      objc_msgSend(v13, "floatValue");
      v16 = v15;
      if (v14 == 2)
        v8 = v16 * 0.5;
      else
        v8 = v16;
    }
    -[AVControlCenterModuleState _defaultOriginalVideoZoomFactor](self, "_defaultOriginalVideoZoomFactor");
    v10 = v17;
    if (vabdd_f64(v8, v17) >= 0.00999999978)
    {
      v10 = v8;
    }
    else
    {
      if (!dword_1ECFED5A0)
        return v10;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    -[AVControlCenterModuleState _defaultOriginalVideoZoomFactor](self, "_defaultOriginalVideoZoomFactor");
    v10 = v9;
  }
  if (dword_1ECFED5A0)
  {
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v10;
}

- (void)performOneShotFraming
{
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", MEMORY[0x1E0C9AAB0], self->_performOneShotFramingKey);
}

- (void)resetFraming
{
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", MEMORY[0x1E0C9AAB0], self->_resetFramingKey);
}

- (BOOL)manualFramingEnabledForDevice:(id)a3
{
  _BOOL4 holdingStateLock;
  BOOL centerStageSupported;

  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  if ((objc_msgSend(a3, "isCenterStageActive") & 1) != 0)
  {
    centerStageSupported = 0;
    if (!holdingStateLock)
      goto LABEL_7;
  }
  else
  {
    centerStageSupported = self->_centerStageSupported;
    if (!holdingStateLock)
LABEL_7:
      os_unfair_lock_unlock(&self->_stateLock);
  }
  return centerStageSupported;
}

- (BOOL)manualFramingIsAtDefault
{
  _BOOL4 holdingStateLock;
  const __CFDictionary *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  CGPoint v11;

  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  v4 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_panningAnglesKey);
  -[AVControlCenterModuleState manualFramingOriginalVideoZoomFactor](self, "manualFramingOriginalVideoZoomFactor");
  v6 = v5;
  -[AVControlCenterModuleState _defaultOriginalVideoZoomFactor](self, "_defaultOriginalVideoZoomFactor");
  v8 = v7;
  if (!holdingStateLock)
    os_unfair_lock_unlock(&self->_stateLock);
  v11.x = 0.0;
  v11.y = 0.0;
  v9 = CGPointMakeWithDictionaryRepresentation(v4, &v11);
  if (v9)
  {
    LOBYTE(v9) = 0;
    if (fabs(v11.x) < 0.00999999978 && fabs(v11.y) < 0.00999999978)
      LOBYTE(v9) = vabdd_f64(v6, v8) < 0.00999999978;
  }
  return v9;
}

- (void)setCenterStageFieldOfViewRestrictedToWide:(BOOL)a3
{
  uint64_t v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = AVControlCenterCenterStageFieldOfViewRestrictedToWide;
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5[1] = AVControlCenterManualFramingUpdateSettingEntity;
  v6[0] = v4;
  v6[1] = CFSTR("ControlCenterModules");
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2), self->_centerStageFieldOfViewRestrictedToWideKey);
}

- (BOOL)centerStageFieldOfViewRestrictedToWide
{
  id v2;
  void *v3;

  v2 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_centerStageFieldOfViewRestrictedToWideKey);
  if (v2 && (v3 = v2, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    return objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", AVControlCenterCenterStageFieldOfViewRestrictedToWide), "BOOLValue");
  else
    return 0;
}

- (void)setManualFramingDeviceType:(int64_t)a3
{
  if (self->_holdingStateLock)
  {
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), self->_manualFramingDeviceTypeKey);
    self->_manualFramingDeviceType = a3;
  }
  else
  {
    os_unfair_lock_lock(&self->_stateLock);
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), self->_manualFramingDeviceTypeKey);
    self->_manualFramingDeviceType = a3;
    os_unfair_lock_unlock(&self->_stateLock);
  }
}

- (int64_t)manualFramingDeviceType
{
  return self->_manualFramingDeviceType;
}

- (NSDictionary)zoomFactorConstantsByManualFramingDeviceType
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->_zoomFactorConstantsByManualFramingDeviceType);
}

- (void)invalidateDeviceBasedModuleStatesIfNeeded
{
  if (-[AVControlCenterModuleState isDeviceBasedModuleState](self, "isDeviceBasedModuleState"))
  {
    if (self->_deviceSupportsManualFraming)
    {
      if (self->_observingManualFramingProprietaryDefaultKeys)
      {
        +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_centerStageFieldOfViewRestrictedToWideKey);
        +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_dockedTrackingActiveKey);
        +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_oneShotFramingCompletedKey);
        +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_resetFramingCompletedKey);
        +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_panningAnglesKey);
        +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_manualFramingVideoZoomFactorKey);
        self->_observingManualFramingProprietaryDefaultKeys = 0;
      }

      self->_startPanningAtPointKey = 0;
      self->_panWithTranslationKey = 0;

      self->_manualFramingVideoZoomFactorKey = 0;
      self->_performOneShotFramingKey = 0;

      self->_resetFramingKey = 0;
      self->_oneShotFramingCompletedKey = 0;

      self->_resetFramingCompletedKey = 0;
      self->_panningAnglesKey = 0;

      self->_manualFramingDeviceTypeKey = 0;
      self->_zoomFactorConstantsByManualFramingDeviceType = 0;

      self->_centerStageFieldOfViewRestrictedToWideKey = 0;
    }
    if (self->_observingDockedTrackingProprietaryDefaultKey)
    {
      +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_dockedTrackingActiveKey);

      self->_dockedTrackingActiveKey = 0;
      self->_observingDockedTrackingProprietaryDefaultKey = 0;
    }
  }
}

- (double)_defaultOriginalVideoZoomFactor
{
  int64_t v3;
  NSDictionary *v4;
  id v5;
  float v6;
  double result;

  v3 = -[AVControlCenterModuleState manualFramingDeviceType](self, "manualFramingDeviceType");
  v4 = -[AVControlCenterModuleState zoomFactorConstantsByManualFramingDeviceType](self, "zoomFactorConstantsByManualFramingDeviceType");
  v5 = -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v3));
  objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D03C90]), "floatValue");
  result = v6;
  if (v3 == 2)
    return result * 0.5;
  return result;
}

- (void)_proprietaryDefaultChanged:(id)a3 keyPath:(id)a4 context:(void *)a5
{
  NSURL *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _BOOL4 holdingStateLock;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  int64_t v18;
  NSString *bundleID;
  NSObject *v20;
  NSString *v21;
  BOOL v22;
  NSString *v23;
  int IsAutoMicrophoneEnabledForBundleIDAndMicMode;
  NSArray *hiddenMicrophoneModes;
  NSString *v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  _BOOL4 v30;
  NSString *v31;
  BOOL v32;
  NSString *v33;
  void *v34;
  uint64_t *v35;
  const __CFString **v36;
  uint64_t v37;
  _BOOL4 v38;
  NSString *v39;
  NSString *v40;
  uint64_t v41;
  float v42;
  NSString *v43;
  NSObject *v44;
  NSString *v45;
  float v46;
  NSString *v47;
  uint64_t v48;
  float v49;
  NSString *v50;
  NSString *v51;
  float v52;
  NSString *v53;
  int isOptedInForReactionEffects;
  NSObject *v55;
  uint64_t v56;
  NSObject *v57;
  NSURL *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  NSObject *v63;
  uint64_t v64;
  NSString *v65;
  NSString *v66;
  NSString *v67;
  uint64_t v68;
  char isKindOfClass;
  __CVBuffer *backgroundReplacementPixelBuffer;
  NSString *v71;
  NSString *v72;
  uint64_t v73;
  uint64_t v74;
  const __CFString *v75;
  NSURL *v76;
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[2];
  _QWORD v104[2];
  const __CFString *v105;
  uint64_t v106;
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  const __CFString *v111;
  NSString *v112;
  const __CFString *v113;
  NSString *v114;
  const __CFString *v115;
  NSString *v116;
  const __CFString *v117;
  NSString *v118;
  const __CFString *v119;
  NSString *v120;
  const __CFString *v121;
  NSString *v122;
  _QWORD v123[19];

  v6 = (NSURL *)a3;
  v123[16] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  if ((void *)AVCCM_AUVoiceIOBypassVoiceProcessingChangedContext == a5)
  {
    v13 = -[AVControlCenterModuleState micModesSupported](self, "micModesSupported", a3, a4);
    if (v6)
      LODWORD(v6) = -[NSURL BOOLValue](v6, "BOOLValue");
    v11 = 0;
    if (holdingStateLock)
    {
      v12 = 0;
    }
    else
    {
      v14 = !v13;
      v12 = 0;
      if (!v14)
      {
        if (self->_auVoiceIOBypassVoiceProcessing == (_DWORD)v6)
        {
          v11 = 0;
          v12 = 0;
        }
        else
        {
          bundleID = self->_bundleID;
          v121 = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
          v122 = bundleID;
          v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
          v12 = CFSTR("AVControlCenterMicrophoneModesModuleVoiceProcessingBypassedDidChangeNotification");
        }
      }
    }
    self->_auVoiceIOBypassVoiceProcessing = (char)v6;
    goto LABEL_136;
  }
  if ((void *)AVCCM_AUVoiceIOChatFlavorChangedContext == a5)
  {
    v15 = -[AVControlCenterModuleState micModesSupported](self, "micModesSupported", a3, a4);
    if (v6)
      v6 = (NSURL *)-[NSURL integerValue](v6, "integerValue");
    v11 = 0;
    if (holdingStateLock)
    {
      v12 = 0;
    }
    else
    {
      v16 = !v15;
      v12 = 0;
      if (!v16)
      {
        if (v6 == (NSURL *)self->_microphoneMode)
        {
          v11 = 0;
          v12 = 0;
        }
        else
        {
          v21 = self->_bundleID;
          v119 = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
          v120 = v21;
          v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
          v12 = CFSTR("AVControlCenterMicrophoneModesModuleMicrophoneModeDidChangeNotification");
        }
      }
    }
    self->_microphoneMode = (int64_t)v6;
    goto LABEL_136;
  }
  if ((void *)AVCCM_AUVoiceIOActiveChatFlavorChangedContext == a5)
  {
    v17 = -[AVControlCenterModuleState micModesSupported](self, "micModesSupported", a3, a4);
    if (v6)
      v18 = -[NSURL integerValue](v6, "integerValue");
    else
      v18 = -1;
    v11 = 0;
    if (holdingStateLock)
    {
      v12 = 0;
    }
    else
    {
      v22 = !v17;
      v12 = 0;
      if (!v22)
      {
        if (v18 == self->_activeMicrophoneMode)
        {
          v11 = 0;
          v12 = 0;
        }
        else
        {
          v23 = self->_bundleID;
          v117 = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
          v118 = v23;
          v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
          v12 = CFSTR("AVControlCenterMicrophoneModesModuleActiveMicrophoneModeDidChangeNotification");
        }
      }
    }
    self->_activeMicrophoneMode = v18;
    goto LABEL_136;
  }
  if ((void *)AVCCM_AUVoiceIOSupportedChatFlavorsChangedContext == a5)
  {
    if (!v6)
    {
      v6 = (NSURL *)AVControlCenterAudioDefaultSupportedMicrophoneModesForBundleID(self->_bundleID);
      if (dword_1ECFED5A0)
      {
        v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    v30 = -[AVControlCenterModuleState micModesSupported](self, "micModesSupported", a3, a4, v73, v74);
    v11 = 0;
    v12 = 0;
    if (!holdingStateLock && v30)
    {
      if ((-[NSURL isEqual:](v6, "isEqual:", self->_supportedMicrophoneModes) & 1) != 0)
      {
        v11 = 0;
        v12 = 0;
      }
      else
      {
        v31 = self->_bundleID;
        v115 = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
        v116 = v31;
        v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
        v12 = CFSTR("AVControlCenterMicrophoneModesModuleSupportedMicrophoneModesDidChangeNotification");
      }
    }

    self->_supportedMicrophoneModes = (NSArray *)v6;
    goto LABEL_136;
  }
  if ((void *)AVCCM_AUVoiceIOHiddenChatFlavorsChangedContext == a5)
  {
    if (!v6)
      v6 = (NSURL *)MEMORY[0x1E0C9AA60];
    if (holdingStateLock
      || (hiddenMicrophoneModes = self->_hiddenMicrophoneModes) == 0
      || (-[NSURL isEqual:](v6, "isEqual:", hiddenMicrophoneModes, a4) & 1) != 0)
    {
      v11 = 0;
      v12 = 0;
    }
    else
    {
      v26 = self->_bundleID;
      v113 = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
      v114 = v26;
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
      v12 = CFSTR("AVControlCenterMicrophoneModesModuleHiddenMicrophoneModesDidChangeNotification");
    }

    self->_hiddenMicrophoneModes = (NSArray *)v6;
    goto LABEL_136;
  }
  if ((void *)AVCCM_AUVoiceIOAutoEnabledChangedContext == a5)
  {
    if (v6)
    {
      IsAutoMicrophoneEnabledForBundleIDAndMicMode = -[NSURL BOOLValue](v6, "BOOLValue", a3, a4);
    }
    else
    {
      IsAutoMicrophoneEnabledForBundleIDAndMicMode = AVControlCenterAudioDefaultIsAutoMicrophoneEnabledForBundleIDAndMicMode((uint64_t)self->_bundleID, self->_microphoneMode);
      if (dword_1ECFED5A0)
      {
        v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    v38 = -[AVControlCenterModuleState isAutoMicrophoneModeSupported](self, "isAutoMicrophoneModeSupported", v73, v74);
    if (holdingStateLock || !v38 || self->_autoMicModeEnabled == IsAutoMicrophoneEnabledForBundleIDAndMicMode)
    {
      v11 = 0;
      v12 = 0;
    }
    else
    {
      v39 = self->_bundleID;
      v111 = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
      v112 = v39;
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
      v12 = CFSTR("AVControlCenterMicrophoneModesModuleAutoEnabledDidChangeNotification");
    }
    self->_autoMicModeEnabled = IsAutoMicrophoneEnabledForBundleIDAndMicMode;
    goto LABEL_136;
  }
  if ((void *)AVCCM_CenterStageControlModeChangedContext == a5)
  {
    if (v6)
      v6 = (NSURL *)-[NSURL integerValue](v6, "integerValue", a3, a4);
    if (holdingStateLock || v6 == (NSURL *)self->_centerStageControlMode)
    {
      v11 = 0;
      v12 = 0;
    }
    else
    {
      v109[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
      v109[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
      v33 = self->_bundleID;
      v110[0] = CFSTR("AVControlCenterVideoEffectCenterStage");
      v110[1] = v33;
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
      v12 = CFSTR("AVControlCenterVideoEffectsModuleEffectControlModeDidChangeNotification");
    }
    self->_centerStageControlMode = (int64_t)v6;
    goto LABEL_136;
  }
  if ((void *)AVCCM_CenterStageEnabledChangedContext == a5)
  {
    if (v6)
      v27 = -[NSURL BOOLValue](v6, "BOOLValue", a3, a4);
    else
      v27 = +[AVCaptureDevice defaultCenterStageEnabledForBundleID:](AVCaptureDevice, "defaultCenterStageEnabledForBundleID:", self->_bundleID, a4);
    v32 = v27;
    if (holdingStateLock || self->_centerStageEnabled == v27)
    {
      v11 = 0;
      v12 = 0;
    }
    else
    {
      v107[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
      v107[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
      v40 = self->_bundleID;
      v108[0] = CFSTR("AVControlCenterVideoEffectCenterStage");
      v108[1] = v40;
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 2);
      v12 = CFSTR("AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification");
    }
    self->_centerStageEnabled = v32;
    goto LABEL_136;
  }
  if ((void *)AVCCM_CenterStageUnavailableReasonsChangedContext == a5)
  {
    if (v6)
      v29 = -[NSURL unsignedIntegerValue](v6, "unsignedIntegerValue", a3, a4);
    else
      v29 = 0;
    v105 = CFSTR("AVControlCenterModulesNotificationCenterStageUnavailableReasonsKey");
    v106 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29, v73, v74);
    v34 = (void *)MEMORY[0x1E0C99D80];
    v35 = &v106;
    v36 = &v105;
    v37 = 1;
    goto LABEL_135;
  }
  if ((void *)AVCCM_BackgroundBlurControlModeChangedContext == a5)
  {
    if (v6)
      v6 = (NSURL *)-[NSURL integerValue](v6, "integerValue", a3, a4);
    if (holdingStateLock || v6 == (NSURL *)self->_backgroundBlurControlMode)
    {
      v11 = 0;
      v12 = 0;
    }
    else
    {
      v103[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
      v103[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
      v43 = self->_bundleID;
      v104[0] = CFSTR("AVControlCenterVideoEffectBackgroundBlur");
      v104[1] = v43;
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 2);
      v12 = CFSTR("AVControlCenterVideoEffectsModuleEffectControlModeDidChangeNotification");
    }
    self->_backgroundBlurControlMode = (int64_t)v6;
    goto LABEL_136;
  }
  if ((void *)AVCCM_BackgroundBlurEnabledChangedContext == a5)
  {
    if (v6)
      LODWORD(v6) = -[NSURL BOOLValue](v6, "BOOLValue", a3, a4);
    if (holdingStateLock || self->_backgroundBlurEnabled == (_DWORD)v6)
    {
      v11 = 0;
      v12 = 0;
    }
    else
    {
      v101[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
      v101[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
      v45 = self->_bundleID;
      v102[0] = CFSTR("AVControlCenterVideoEffectBackgroundBlur");
      v102[1] = v45;
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 2);
      v12 = CFSTR("AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification");
    }
    self->_backgroundBlurEnabled = (char)v6;
    goto LABEL_136;
  }
  if ((void *)AVCCM_BackgroundBlurUnavailableReasonsChangedContext == a5)
  {
    if (v6)
      v41 = -[NSURL unsignedIntegerValue](v6, "unsignedIntegerValue", a3, a4);
    else
      v41 = 0;
    v99[0] = CFSTR("AVControlCenterModulesNotificationBackgroundBlurUnavailableReasonsKey");
    v99[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
    v100[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v41, v73, v74);
    v100[1] = self->_bundleID;
    v34 = (void *)MEMORY[0x1E0C99D80];
    v35 = v100;
    v36 = (const __CFString **)v99;
    goto LABEL_134;
  }
  if ((void *)AVCCM_BackgroundBlurApertureChangedContext == a5)
  {
    if (v6)
      -[NSURL floatValue](v6, "floatValue", a3, a4);
    else
      +[AVCaptureDevice backgroundBlurApertureDefault](AVCaptureDevice, "backgroundBlurApertureDefault", a3, a4);
    v46 = v42;
    if (holdingStateLock || v42 == self->_backgroundBlurAperture)
    {
      v11 = 0;
      v12 = 0;
    }
    else
    {
      v97[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
      v97[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
      v47 = self->_bundleID;
      v98[0] = CFSTR("AVControlCenterVideoEffectBackgroundBlur");
      v98[1] = v47;
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
      v12 = CFSTR("AVControlCenterVideoEffectsModuleEffectIntensityDidChangeNotification");
    }
    self->_backgroundBlurAperture = v46;
    goto LABEL_136;
  }
  if ((void *)AVCCM_StudioLightingControlModeChangedContext == a5)
  {
    if (v6)
      v6 = (NSURL *)-[NSURL integerValue](v6, "integerValue", a3, a4);
    if (holdingStateLock || v6 == (NSURL *)self->_studioLightingControlMode)
    {
      v11 = 0;
      v12 = 0;
    }
    else
    {
      v95[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
      v95[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
      v50 = self->_bundleID;
      v96[0] = CFSTR("AVControlCenterVideoEffectStudioLighting");
      v96[1] = v50;
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
      v12 = CFSTR("AVControlCenterVideoEffectsModuleEffectControlModeDidChangeNotification");
    }
    self->_studioLightingControlMode = (int64_t)v6;
    goto LABEL_136;
  }
  if ((void *)AVCCM_StudioLightingEnabledChangedContext == a5)
  {
    if (v6)
      LODWORD(v6) = -[NSURL BOOLValue](v6, "BOOLValue", a3, a4);
    if (holdingStateLock || self->_studioLightingEnabled == (_DWORD)v6)
    {
      v11 = 0;
      v12 = 0;
    }
    else
    {
      v93[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
      v93[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
      v51 = self->_bundleID;
      v94[0] = CFSTR("AVControlCenterVideoEffectStudioLighting");
      v94[1] = v51;
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
      v12 = CFSTR("AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification");
    }
    self->_studioLightingEnabled = (char)v6;
    goto LABEL_136;
  }
  if ((void *)AVCCM_StudioLightingUnavailableReasonsChangedContext == a5)
  {
    if (v6)
      v48 = -[NSURL unsignedIntegerValue](v6, "unsignedIntegerValue", a3, a4);
    else
      v48 = 0;
    v91[0] = CFSTR("AVControlCenterModulesNotificationStudioLightingUnavailableReasonsKey");
    v91[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
    v92[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v48, v73, v74);
    v92[1] = self->_bundleID;
    v34 = (void *)MEMORY[0x1E0C99D80];
    v35 = v92;
    v36 = (const __CFString **)v91;
    goto LABEL_134;
  }
  if ((void *)AVCCM_StudioLightingIntensityChangedContext == a5)
  {
    if (v6)
      -[NSURL floatValue](v6, "floatValue", a3, a4);
    else
      +[AVCaptureDevice studioLightingIntensityDefault](AVCaptureDevice, "studioLightingIntensityDefault", a3, a4);
    v52 = v49;
    if (holdingStateLock || v49 == self->_studioLightingIntensity)
    {
      v11 = 0;
      v12 = 0;
    }
    else
    {
      v89[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
      v89[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
      v53 = self->_bundleID;
      v90[0] = CFSTR("AVControlCenterVideoEffectStudioLighting");
      v90[1] = v53;
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
      v12 = CFSTR("AVControlCenterVideoEffectsModuleEffectIntensityDidChangeNotification");
    }
    self->_studioLightingIntensity = v52;
    goto LABEL_136;
  }
  if ((void *)AVCCM_ManualFramingOneShotFramingCompletedContext == a5)
  {
    v12 = CFSTR("AVControlCenterManualFramingOneShotFramingDidCompleteNotification");
LABEL_167:
    v11 = MEMORY[0x1E0C9AA70];
    goto LABEL_136;
  }
  if ((void *)AVCCM_ManualFramingResetFramingCompletedContext == a5)
  {
    v12 = CFSTR("AVControlCenterManualFramingResetFramingDidCompleteNotification");
    goto LABEL_167;
  }
  if ((void *)AVCCM_ReactionsEnabledChangedContext == a5)
  {
    if (v6)
    {
      isOptedInForReactionEffects = -[NSURL BOOLValue](v6, "BOOLValue", a3, a4);
    }
    else
    {
      isOptedInForReactionEffects = self->_isOptedInForReactionEffects;
      v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (holdingStateLock || self->_reactionsEnabled == isOptedInForReactionEffects)
    {
      v11 = 0;
      v12 = 0;
    }
    else
    {
      v87[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
      v87[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
      v66 = self->_bundleID;
      v88[0] = CFSTR("AVControlCenterVideoEffectReactions");
      v88[1] = v66;
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
      v12 = CFSTR("AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification");
    }
    self->_reactionsEnabled = isOptedInForReactionEffects;
    goto LABEL_136;
  }
  if ((void *)AVCCM_GesturesEnabledChangedContext == a5)
  {
    if (v6)
    {
      if (dword_1ECFED5A0)
      {
        v55 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v58 = v6;
LABEL_203:
      v62 = -[NSURL BOOLValue](v58, "BOOLValue", v73, v74);
      if (holdingStateLock)
        goto LABEL_227;
      goto LABEL_204;
    }
    v58 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_gesturesEnabledDefaultKey, a4);
    if (v58)
      goto LABEL_203;
    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", self->_bundleID, 1, 0);
    v60 = (void *)objc_msgSend(v59, "infoDictionary");
    v61 = (void *)objc_msgSend(v60, "objectForKey:ofClass:", AVCaptureBundleCameraReactionEffectGesturesEnabledDefaultKey, objc_opt_class());
    if (v61)
    {
      v62 = objc_msgSend(v61, "BOOLValue");
      if (!dword_1ECFED5A0)
        goto LABEL_226;
    }
    else
    {
      v62 = FigGetCFPreferenceBooleanWithDefault() != 0;
      if (!dword_1ECFED5A0)
      {
LABEL_226:

        if (holdingStateLock)
          goto LABEL_227;
LABEL_204:
        if (self->_gesturesEnabled != v62)
        {
          v85[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
          v85[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
          v67 = self->_bundleID;
          v86[0] = CFSTR("AVControlCenterVideoEffectGestures");
          v86[1] = v67;
          v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
          v12 = CFSTR("AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification");
LABEL_228:
          self->_gesturesEnabled = v62;
          goto LABEL_136;
        }
LABEL_227:
        v11 = 0;
        v12 = 0;
        goto LABEL_228;
      }
    }
    v63 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_226;
  }
  if ((void *)AVCCM_ReactionsUnavailableReasonsChangedContext == a5)
  {
    if (v6)
      v56 = -[NSURL unsignedIntegerValue](v6, "unsignedIntegerValue", a3, a4);
    else
      v56 = 0;
    v83[0] = CFSTR("AVControlCenterModulesNotificationReactionsUnavailableReasonsKey");
    v64 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v56, v73, v74);
    v83[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
    v65 = self->_bundleID;
    v84[0] = v64;
    v84[1] = v65;
    v34 = (void *)MEMORY[0x1E0C99D80];
    v35 = v84;
    v36 = (const __CFString **)v83;
LABEL_134:
    v37 = 2;
LABEL_135:
    v11 = objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, v37);
    v12 = CFSTR("AVControlCenterVideoEffectsUnavailableReasonsDidChangeNotification");
    goto LABEL_136;
  }
  v10 = a5;
  if ((void *)AVCCM_ReactionEffectTriggeredContext == a5)
  {
    v12 = CFSTR("AVControlCenterVideoEffectsReactionWasRequestedNotification");
LABEL_188:
    v11 = (uint64_t)v6;
    goto LABEL_136;
  }
  if ((void *)AVCCM_ReactionEffectsInProgressChangedContext == a5)
  {
    v12 = CFSTR("AVControlCenterVideoEffectsReactionsInProgressDidChangeNotification");
    goto LABEL_188;
  }
  if ((void *)AVCCM_BackgroundReplacementEnabledChangedContext != a5)
  {
    if ((void *)AVCCM_BackgroundReplacementUnavailableReasonsChangedContext != a5)
    {
      if ((void *)AVCCM_BackgroundReplacementURLChangedContext == a5)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if (v6 && (isKindOfClass & 1) == 0)
          -[AVControlCenterModuleState _proprietaryDefaultChanged:keyPath:context:].cold.1();
        if (v6)
        {
          v123[0] = 0;
          v6 = (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v6, 256, 0, 0, v123);
        }
        if (holdingStateLock || v6 == self->_backgroundReplacementURL || (-[NSURL isEqual:](v6, "isEqual:") & 1) != 0)
        {
          v11 = 0;
          v12 = 0;
        }
        else
        {
          v77[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
          v77[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
          v72 = self->_bundleID;
          v78[0] = CFSTR("AVControlCenterVideoEffectBackgroundReplacement");
          v78[1] = v72;
          v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
          v12 = CFSTR("AVControlCenterVideoEffectsBackgroundReplacementURLDidChangeNotification");
        }

        self->_backgroundReplacementURL = v6;
        backgroundReplacementPixelBuffer = self->_backgroundReplacementPixelBuffer;
        if (backgroundReplacementPixelBuffer)
        {
          CFRelease(backgroundReplacementPixelBuffer);
          self->_backgroundReplacementPixelBuffer = 0;
        }
        *(_QWORD *)&self->_backgroundReplacementPixelBufferFillWidth = 0;
      }
      else
      {
        v11 = 0;
        if (v6)
        {
          v12 = 0;
          if ((void *)AVCCM_DockedTrackingActiveChangedContext == v10)
          {
            v75 = CFSTR("dockedTrackingActive");
            v76 = v6;
            v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
            v12 = CFSTR("AVControlCenterDockedTrackingActiveDidChangeNotification");
          }
        }
        else
        {
          v12 = 0;
        }
      }
      goto LABEL_136;
    }
    if (v6)
      v68 = -[NSURL unsignedIntegerValue](v6, "unsignedIntegerValue", a3, a4);
    else
      v68 = 0;
    v79[0] = CFSTR("AVControlCenterModulesNotificationBackgroundReplacementUnavailableReasonsKey");
    v79[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
    v80[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v68, v73, v74);
    v80[1] = self->_bundleID;
    v34 = (void *)MEMORY[0x1E0C99D80];
    v35 = v80;
    v36 = (const __CFString **)v79;
    goto LABEL_134;
  }
  if (v6)
    LODWORD(v6) = -[NSURL BOOLValue](v6, "BOOLValue", a3, a4);
  if (holdingStateLock || self->_backgroundReplacementEnabled == (_DWORD)v6)
  {
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v81[0] = CFSTR("AVControlCenterModulesNotificationVideoEffectKey");
    v81[1] = CFSTR("AVControlCenterModulesNotificationBundleIdentifierKey");
    v71 = self->_bundleID;
    v82[0] = CFSTR("AVControlCenterVideoEffectBackgroundReplacement");
    v82[1] = v71;
    v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
    v12 = CFSTR("AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification");
  }
  self->_backgroundReplacementEnabled = (char)v6;
LABEL_136:
  if (!holdingStateLock)
    os_unfair_lock_unlock(&self->_stateLock);
  if (v12 && v11)
  {
    if (dword_1ECFED5A0)
    {
      v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v73, v74), "postNotificationName:object:userInfo:", v12, 0, v11);
  }
}

- (void)_handlePanningAnglesUpdate:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _BOOL4 holdingStateLock;
  double v6;
  double v7;
  float currentOriginalZoomFactor;
  float currentPanningAngleX;
  float currentPanningAngleY;
  _BOOL4 v11;
  double v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t *v17;
  const __CFString **v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CGPoint point;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  _QWORD v28[25];

  v28[24] = *MEMORY[0x1E0C80C00];
  point.x = 0.0;
  point.y = 0.0;
  CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)a3, &point);
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  -[AVControlCenterModuleState _defaultOriginalVideoZoomFactor](self, "_defaultOriginalVideoZoomFactor", v20, v22);
  v7 = v6;
  currentOriginalZoomFactor = self->_currentOriginalZoomFactor;
  currentPanningAngleX = self->_currentPanningAngleX;
  currentPanningAngleY = self->_currentPanningAngleY;
  *(CGPoint *)&self->_currentPanningAngleX = point;
  if (!holdingStateLock)
    os_unfair_lock_unlock(&self->_stateLock);
  v11 = 0;
  v12 = currentOriginalZoomFactor;
  if (fabs(currentPanningAngleX) < 0.00999999978 && fabs(currentPanningAngleY) < 0.00999999978)
    v11 = vabdd_f64(v12, v7) < 0.00999999978;
  v13 = fabs(point.x) < 0.00999999978;
  if (fabs(point.y) >= 0.00999999978)
    v13 = 0;
  if (v11 && !v13)
  {
    if (dword_1ECFED5A0)
    {
      v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v27 = CFSTR("isAtDefault");
    v28[0] = MEMORY[0x1E0C9AAA0];
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = v28;
    v18 = &v27;
LABEL_24:
    v19 = objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1, v12, v21, v23);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVControlCenterManualFramingDefaultStateDidUpdateNotification"), 0, v19);
    return;
  }
  v12 = vabdd_f64(v12, v7);
  if (v12 >= 0.00999999978)
    LOBYTE(v11) = 1;
  if (!v11 && v13)
  {
    if (dword_1ECFED5A0)
    {
      v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v25 = CFSTR("isAtDefault");
    v26 = MEMORY[0x1E0C9AAB0];
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = &v26;
    v18 = &v25;
    goto LABEL_24;
  }
}

- (void)_handleBackPropagatedVideoZoomFactorUpdate:(id)a3
{
  void *v4;
  int64_t v5;
  float v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  _QWORD v17[25];

  v17[24] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", AVControlCenterManualFramingConvertedVideoZoomFactor);
  v5 = -[AVControlCenterModuleState manualFramingDeviceType](self, "manualFramingDeviceType");
  objc_msgSend(v4, "floatValue");
  v7 = v6;
  if (v5 == 2)
    v8 = v7 * 0.5;
  else
    v8 = v7;
  -[AVControlCenterModuleState _defaultOriginalVideoZoomFactor](self, "_defaultOriginalVideoZoomFactor");
  *(float *)&v9 = v9;
  v10 = *(float *)&v9;
  if (vabdd_f64(v8, *(float *)&v9) >= 0.00999999978)
  {
    v10 = v8;
  }
  else
  {
    if (!dword_1ECFED5A0)
      goto LABEL_10;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (dword_1ECFED5A0)
  {
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_10:
  v13 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v14, v15);
  v16 = CFSTR("videoZoomFactor");
  v17[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("AVControlCenterManualFramingVideoZoomFactorDidChangeNotification"), 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1));
  -[AVControlCenterModuleState _checkManualFramingDefaultStateWithNewOriginalZoomFactor:](self, "_checkManualFramingDefaultStateWithNewOriginalZoomFactor:", v10);
}

- (void)_checkManualFramingDefaultStateWithNewOriginalZoomFactor:(double)a3
{
  _BOOL4 holdingStateLock;
  double v6;
  double v7;
  double currentPanningAngleX;
  double currentPanningAngleY;
  double currentOriginalZoomFactor;
  double v11;
  double v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v14;
  void *v15;
  uint64_t *v16;
  const __CFString **v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  _QWORD v24[23];

  v24[22] = *MEMORY[0x1E0C80C00];
  holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
    os_unfair_lock_lock(&self->_stateLock);
  -[AVControlCenterModuleState _defaultOriginalVideoZoomFactor](self, "_defaultOriginalVideoZoomFactor");
  v7 = v6;
  currentPanningAngleX = self->_currentPanningAngleX;
  currentPanningAngleY = self->_currentPanningAngleY;
  currentOriginalZoomFactor = self->_currentOriginalZoomFactor;
  self->_currentOriginalZoomFactor = a3;
  if (!holdingStateLock)
    os_unfair_lock_unlock(&self->_stateLock);
  if (fabs(currentPanningAngleX) < 0.00999999978 && fabs(currentPanningAngleY) < 0.00999999978)
  {
    v11 = vabdd_f64(currentOriginalZoomFactor, v7);
    v12 = vabdd_f64(a3, v7);
    if (v11 < 0.00999999978 && v12 >= 0.00999999978)
    {
      if (dword_1ECFED5A0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v23 = CFSTR("isAtDefault");
      v24[0] = MEMORY[0x1E0C9AAA0];
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = v24;
      v17 = &v23;
LABEL_17:
      v18 = objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1, v19, v20);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVControlCenterManualFramingDefaultStateDidUpdateNotification"), 0, v18);
      return;
    }
    if (v11 >= 0.00999999978 && v12 < 0.00999999978)
    {
      if (dword_1ECFED5A0)
      {
        v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v21 = CFSTR("isAtDefault");
      v22 = MEMORY[0x1E0C9AAB0];
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = &v22;
      v17 = &v21;
      goto LABEL_17;
    }
  }
}

- (void)_proprietaryDefaultChanged:keyPath:context:.cold.1()
{
  __assert_rtn("-[AVControlCenterModuleState _proprietaryDefaultChanged:keyPath:context:]", "AVControlCenterModules.m", 2892, "[newValue isKindOfClass:[NSData class]] || newValue == nil");
}

@end
