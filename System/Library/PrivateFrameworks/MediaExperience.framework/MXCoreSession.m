@implementation MXCoreSession

- (BOOL)wantsVolumeChangesWhenPausedOrInactive
{
  return self->_ignoreRingerSwitch;
}

- (BOOL)isSharePlayCallSession
{
  return self->_isSharePlayCapableCallSession;
}

- (BOOL)isSharePlayMediaSession
{
  return self->_isSharePlayCallSession;
}

- (id)copyMXSessionList
{
  void *v3;
  NSArray *v4;

  v3 = (void *)MEMORY[0x194035B20](self, a2);
  -[MXCoreSession mxSessionListBeginIteration](self, "mxSessionListBeginIteration");
  v4 = -[NSPointerArray allObjects](-[MXCoreSession mxSessionList](self, "mxSessionList"), "allObjects");
  -[MXCoreSession mxSessionListEndIteration](self, "mxSessionListEndIteration");
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (NSPointerArray)mxSessionList
{
  return self->_mxSessionList;
}

- (void)mxSessionListBeginIteration
{
  -[NSLock lock](-[MXCoreSession mxSessionListReadLock](self, "mxSessionListReadLock"), "lock");
  -[MXCoreSession setMxSessionListActiveReaders:](self, "setMxSessionListActiveReaders:", -[MXCoreSession mxSessionListActiveReaders](self, "mxSessionListActiveReaders") + 1);
  if (-[MXCoreSession mxSessionListActiveReaders](self, "mxSessionListActiveReaders") == 1)
    dispatch_semaphore_wait((dispatch_semaphore_t)-[MXCoreSession mxSessionListWriteSemaphore](self, "mxSessionListWriteSemaphore"), 0xFFFFFFFFFFFFFFFFLL);
  -[NSLock unlock](-[MXCoreSession mxSessionListReadLock](self, "mxSessionListReadLock"), "unlock");
}

- (void)mxSessionListEndIteration
{
  -[NSLock lock](-[MXCoreSession mxSessionListReadLock](self, "mxSessionListReadLock"), "lock");
  -[MXCoreSession setMxSessionListActiveReaders:](self, "setMxSessionListActiveReaders:", -[MXCoreSession mxSessionListActiveReaders](self, "mxSessionListActiveReaders") - 1);
  if (!-[MXCoreSession mxSessionListActiveReaders](self, "mxSessionListActiveReaders"))
    dispatch_semaphore_signal((dispatch_semaphore_t)-[MXCoreSession mxSessionListWriteSemaphore](self, "mxSessionListWriteSemaphore"));
  -[NSLock unlock](-[MXCoreSession mxSessionListReadLock](self, "mxSessionListReadLock"), "unlock");
}

- (unsigned)mxSessionListActiveReaders
{
  return self->_mxSessionListActiveReaders;
}

- (NSLock)mxSessionListReadLock
{
  return self->_mxSessionListReadLock;
}

- (OS_dispatch_semaphore)mxSessionListWriteSemaphore
{
  return self->_mxSessionListWriteSemaphore;
}

- (void)setMxSessionListActiveReaders:(unsigned int)a3
{
  self->_mxSessionListActiveReaders = a3;
}

- (BOOL)wantsVolumeChangesWhenPaused
{
  return self->_wantsVolumeChangesWhenPausedOrInactive;
}

- (NSString)badgeType
{
  NSString *v3;

  -[NSLock lock](-[MXCoreSession sessionPropertiesLock](self, "sessionPropertiesLock"), "lock");
  v3 = self->_badgeType;
  -[NSLock unlock](-[MXCoreSession sessionPropertiesLock](self, "sessionPropertiesLock"), "unlock");
  return v3;
}

- (BOOL)isHardwareSafetySession
{
  return self->_isCarSession;
}

- (BOOL)isIDSMXCoreSession
{
  return self->_isHardwareSafetySession;
}

- (BOOL)isSharePlayCapableCallSession
{
  return self->_allowSystemSoundsWhileRecording;
}

- (void)setSupportedOutputChannelLayouts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 816);
}

- (BOOL)allowedToBeNowPlayingApp
{
  return self->_isPiPPossible;
}

- (BOOL)isEligibleForNowPlayingAppConsideration
{
  return self->_prefersToTakeHWControlFlagsFromAnotherSession;
}

- (void)subscribeToNotifications:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](-[MXCoreSession sessionPropertiesLock](self, "sessionPropertiesLock"), "lock");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", self->_notificationsSubscribedTo);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(a3);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v5, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  self->_notificationsSubscribedTo = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", v5);
  -[NSLock unlock](-[MXCoreSession sessionPropertiesLock](self, "sessionPropertiesLock"), "unlock");
}

- (void)setBadgeType:(id)a3
{
  NSString *badgeType;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](-[MXCoreSession sessionPropertiesLock](self, "sessionPropertiesLock"), "lock");
  if (-[NSString isEqualToString:](self->_badgeType, "isEqualToString:", a3))
  {
    -[NSLock unlock](-[MXCoreSession sessionPropertiesLock](self, "sessionPropertiesLock"), "unlock");
  }
  else
  {
    badgeType = self->_badgeType;

    self->_badgeType = (NSString *)a3;
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[NSLock unlock](-[MXCoreSession sessionPropertiesLock](self, "sessionPropertiesLock", v7, v8), "unlock");
    if (badgeType)
      CMSMNotificationUtility_PostBadgeTypeDidChange(self);
  }
}

- (NSLock)sessionPropertiesLock
{
  return self->_sessionPropertiesLock;
}

- (int)pidToInheritAppStateFrom
{
  return self->_pidToInheritAppStateFrom;
}

- (BOOL)waitingForEndInterruptionWhenDeviceUnlocksOrInForeground
{
  return self->_waitingToResume;
}

- (BOOL)wasInterruptedByNowPlayingApp
{
  return self->_wasInterruptedWhileSuspended;
}

- (BOOL)waitingToResumeWhenDeviceUnlocksOrInForeground
{
  return self->_waitingForEndInterruptionWhenDeviceUnlocksOrInForeground;
}

- (BOOL)stopsWhenDeviceLocks
{
  return self->_systemSoundHasModifiedCurrentlyControllingFlags;
}

- (void)setStopsWhenDeviceLocks:(BOOL)a3
{
  self->_systemSoundHasModifiedCurrentlyControllingFlags = a3;
}

- (unsigned)clientPriority
{
  return self->_clientPriority;
}

- (NSDictionary)preferredPersistentRoute
{
  return self->_preferredPersistentRoute;
}

- (BOOL)doesntActuallyPlayAudio
{
  return self->_defaultBuiltInRoutePreferenceSetByClient;
}

- (void)setPrefersToTakeHWControlFlagsFromAnotherSession:(BOOL)a3
{
  self->_dontTakeOverHardware = a3;
}

- (void)setAllowedRouteTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 720);
}

- (void)setAllowedPortTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 712);
}

- (BOOL)preferredDecoupledInputOutput
{
  return self->_requiresAggregatedInputOutput;
}

- (BOOL)isAllowedToPlayInBackground
{
  return self->_wantsAutomaticClusterPairingOnPlaybackStart;
}

- (void)setOverridePortsList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 760);
}

- (void)setIsLongFormAudio:(BOOL)a3
{
  self->_wantsToPauseSpokenAudio = a3;
}

- (void)setAllowSystemSoundsWhileRecording:(BOOL)a3
{
  self->_allowMixableAudioWhileRecording = a3;
}

- (void)setAllowsDefaultBuiltInRouteCustomization:(BOOL)a3
{
  self->_areBothBudsInEarForA2DPPortBeforeInterrupting = a3;
}

- (void)setAllowsBluetoothRecordingCustomization:(BOOL)a3
{
  self->_allowsDefaultBuiltInRouteCustomization = a3;
}

- (void)setWantsToBeVolumeButtonClient:(BOOL)a3
{
  self->_prefersNoInterruptionsByRingtonesAndAlerts = a3;
}

- (unsigned)mode
{
  return self->_mode;
}

- (BOOL)allowsDefaultBuiltInRouteCustomization
{
  return self->_areBothBudsInEarForA2DPPortBeforeInterrupting;
}

- (BOOL)allowsBluetoothRecordingCustomization
{
  return self->_allowsDefaultBuiltInRouteCustomization;
}

- (BOOL)enableBluetoothRecordingPreferenceSetByClient
{
  return self->_isEligibleForBTTriangleConsideration;
}

- (BOOL)defaultBuiltInRoutePreferenceSetByClient
{
  return self->_prefersSpeechDetectEnabled;
}

- (void)setAllowedToBeNowPlayingApp:(BOOL)a3
{
  self->_isPiPPossible = a3;
}

- (BOOL)hasFetchedBackgroundPrivileges
{
  return self->_hasFetchedGPSPrivileges;
}

- (unsigned)hwControlFlags
{
  return self->_hwControlFlags;
}

- (void)setHwControlFlags:(unsigned int)a3
{
  self->_hwControlFlags = a3;
}

- (void)setMustUseDefaultClientPriority:(BOOL)a3
{
  self->_handsOverInterruptionsToInterruptor = a3;
}

- (void)setMakesMusicResume:(BOOL)a3
{
  self->_mustUseDefaultClientPriority = a3;
}

- (BOOL)mustUseDefaultClientPriority
{
  return self->_handsOverInterruptionsToInterruptor;
}

- (BOOL)isPiPPossible
{
  return self->_allowsBluetoothRecordingCustomization;
}

- (BOOL)isEligibleForBTTriangleConsideration
{
  return self->_isCameraRecordingExtension;
}

- (void)setPreferredIOBufferDuration:(float)a3
{
  self->_preferredIOBufferDuration = a3;
}

- (void)setHandsOverInterruptionsToInterruptor:(BOOL)a3
{
  self->_allowedToBeNowPlayingApp = a3;
}

- (BOOL)audioHWControlFlagsSetByClient
{
  return self->_routingContextSetByClient;
}

- (NSString)defaultBuiltInRoutePreference
{
  return (NSString *)objc_getProperty(self, a2, 736, 1);
}

- (BOOL)hasEntitlementToShowMicrophoneIndicatorWhileNotRecording
{
  return self->_hasEntitlementToSetPreferredMinimumMicrophoneIndicatorLightOnTime;
}

- (BOOL)wantsToShowMicrophoneIndicatorWhenNotRecording
{
  return self->_prefersConcurrentAirPlayAudio;
}

- (id)copyDetailedRouteDescription
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v8;

  v3 = -[MXAdditiveRoutingManager copyDetailedRouteDescription:](+[MXAdditiveRoutingManager sharedInstance](MXAdditiveRoutingManager, "sharedInstance"), "copyDetailedRouteDescription:", CMSUtility_GetCurrentOutputVADID(self));
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[MXCoreSessionBase hasInput](self, "hasInput"))
  {
    v5 = -[MXAdditiveRoutingManager copyDetailedRouteDescription:](+[MXAdditiveRoutingManager sharedInstance](MXAdditiveRoutingManager, "sharedInstance"), "copyDetailedRouteDescription:", CMSUtility_GetCurrentInputVADID(self));
    v6 = objc_msgSend(v5, "objectForKey:", CFSTR("RouteDetailedDescription_Inputs"));
    if (v6)
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("RouteDetailedDescription_Inputs"));
    if (!v5)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }

  }
  if (vaemIsContinuityScreenOutputPortPresentInConnectedOutputPorts())
  {
    v8 = -[MXCoreSession copyDetailedRouteDescriptionForContinuityScreenOutput:](self, "copyDetailedRouteDescriptionForContinuityScreenOutput:", v4);

    return v8;
  }
  return v4;
}

- (BOOL)prefersNoInterruptionsByRingtonesAndAlerts
{
  return self->_prefersNoInterruptionsByMixableSessions;
}

- (BOOL)prefersInterruptionOnRouteDisconnectSetByClient
{
  return self->_isSharedAVAudioSessionInstance;
}

- (BOOL)wantsToBeVolumeButtonClient
{
  return self->_prefersNoInterruptionsByRingtonesAndAlerts;
}

- (NSDictionary)activationContext
{
  return (NSDictionary *)objc_getProperty(self, a2, 696, 1);
}

- (NSString)siriInputDeviceUUID
{
  return (NSString *)objc_getProperty(self, a2, 800, 1);
}

- (BOOL)prefersEchoCancelledInput
{
  return self->_createSpeakerDevice;
}

- (NSDictionary)preferredRouteControlFeatures
{
  return (NSDictionary *)objc_getProperty(self, a2, 792, 1);
}

- (void)setEnableBluetoothRecordingPreferenceSetByClient:(BOOL)a3
{
  self->_isEligibleForBTTriangleConsideration = a3;
}

- (BOOL)forceSoundCheck
{
  return self->_wantsToBeVolumeButtonClient;
}

- (NSArray)allowedRouteTypes
{
  return (NSArray *)objc_getProperty(self, a2, 720, 1);
}

- (BOOL)prefersConcurrentAirPlayAudio
{
  return self->_prefersSuppressingRecordingState;
}

- (NSArray)allowedPortTypes
{
  return (NSArray *)objc_getProperty(self, a2, 712, 1);
}

- (void)setHasEntitlementToStartRecordingInTheBackground:(BOOL)a3
{
  self->_hasEntitlementToSuppressRecordingStateToSystemStatus = a3;
}

- (void)setHasEntitlementToSupportProcessAssertionAuditTokens:(BOOL)a3
{
  self->_hasEntitlementToRecordDuringCall = a3;
}

- (void)setHasEntitlementToRecordAudioInAnExtension:(BOOL)a3
{
  self->_hasEntitlementToStartRecordingInTheBackground = a3;
}

- (void)setIsAllowedToPlayInBackground:(BOOL)a3
{
  self->_wantsAutomaticClusterPairingOnPlaybackStart = a3;
}

- (void)setHasEntitlementToSuppressRecordingStateToSystemStatus:(BOOL)a3
{
  self->_hasEntitlementToSupportProcessAssertionAuditTokens = a3;
}

- (void)setHasEntitlementToSetPreferredMinimumMicrophoneIndicatorLightOnTime:(BOOL)a3
{
  self->_doesGameAudioNeedToBeSpatialized = a3;
}

- (void)setHasEntitlementToSetEmergencyAlertPriority:(BOOL)a3
{
  self->_hasEntitlementToShowMicrophoneIndicatorWhileNotRecording = a3;
}

- (void)setIsSharedAVAudioSessionInstance:(BOOL)a3
{
  self->_prefersBeingInterruptedByNextActiveRecordingClient = a3;
}

- (void)setIsEligibleForNowPlayingAppConsideration:(BOOL)a3
{
  self->_prefersToTakeHWControlFlagsFromAnotherSession = a3;
}

- (void)setWantsToPauseSpokenAudio:(BOOL)a3
{
  self->_wantsVibrationNotifications = a3;
}

- (void)setIsPiPPossible:(BOOL)a3
{
  self->_allowsBluetoothRecordingCustomization = a3;
}

- (void)setPidToInheritAppStateFrom:(int)a3
{
  self->_pidToInheritAppStateFrom = a3;
}

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
}

- (void)setDoNotNotifyOtherSessionsOnNextInactive:(BOOL)a3
{
  self->_wantsToSendResumableEndInterruptionWhenBackgrounded = a3;
}

- (void)setSomeMXSessionIsPlaying:(BOOL)a3
{
  self->_clientIsPlaying = a3;
}

- (void)setPlaybackAssertionRef:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 544);
}

- (void)setIsPlayingOutput:(BOOL)a3
{
  self->_isRecordingMuted = a3;
}

- (void)setHostProcessPlaybackAssertions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 496);
}

- (void)setSavedHWControlFlagsForClientThatDoesNotActuallyPlayAudio:(unsigned int)a3
{
  self->_savedHWControlFlagsForClientThatDoesNotActuallyPlayAudio = a3;
}

- (void)setDoesntActuallyPlayAudio:(BOOL)a3
{
  self->_defaultBuiltInRoutePreferenceSetByClient = a3;
}

- (void)setHasFetchedBackgroundPrivileges:(BOOL)a3
{
  self->_hasFetchedGPSPrivileges = a3;
}

- (BOOL)idleSleepPreventorAllocated
{
  return self->_silentMuted;
}

- (void)updateApplicationStateAndPIDToInheritAppStateFrom
{
  uint64_t v3;
  int v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[MXCoreSessionBase setApplicationState:](self, "setApplicationState:", 0);
  v3 = +[MXSystemController getPIDToInheritAppStateFromForPID:](MXSystemController, "getPIDToInheritAppStateFromForPID:", -[NSNumber intValue](-[MXCoreSessionBase clientPID](self, "clientPID"), "intValue"));
  if ((_DWORD)v3 != -[MXCoreSession pidToInheritAppStateFrom](self, "pidToInheritAppStateFrom"))
  {
    v4 = -[MXCoreSession pidToInheritAppStateFrom](self, "pidToInheritAppStateFrom");
    -[MXCoreSession setPidToInheritAppStateFrom:](self, "setPidToInheritAppStateFrom:", v3);
    if (-[MXCoreSession pidToInheritAppStateFrom](self, "pidToInheritAppStateFrom") >= 1)
      MX_RunningBoardServices_StartMonitoringForPID(-[MXCoreSession pidToInheritAppStateFrom](self, "pidToInheritAppStateFrom"));
    if (v4 >= 1)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if (-[MXCoreSession pidToInheritAppStateFrom](self, "pidToInheritAppStateFrom", v7, v8) < 1)
    v6 = -[NSNumber intValue](-[MXCoreSessionBase clientPID](self, "clientPID"), "intValue");
  else
    v6 = -[MXCoreSession pidToInheritAppStateFrom](self, "pidToInheritAppStateFrom");
  -[MXCoreSessionBase setApplicationState:](self, "setApplicationState:", MX_RunningBoardServices_GetApplicationStateForPID(v6, 0));
}

- (void)setWasInterruptedWhileRecording:(BOOL)a3
{
  self->_wasRecordingBeforeBeingInterrupted = a3;
}

- (void)setWasActiveWhenDeviceOwnershipRelinquished:(BOOL)a3
{
  self->_shouldMuteBeAppliedToRemoteDevice = a3;
}

- (void)setWantsToShowMicrophoneIndicatorWhenNotRecording:(BOOL)a3
{
  self->_prefersConcurrentAirPlayAudio = a3;
}

- (void)setWantsAutomaticClusterPairingOnPlaybackStart:(BOOL)a3
{
  self->_isSharePlayMediaSession = a3;
}

- (void)setWaitingForRemoteInterruptionDoneIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 560);
}

- (void)setVibratingOSTransaction:(id)a3
{
  self->_vibratingOSTransaction = (OS_os_transaction *)a3;
}

- (void)setUnduckToLevelScalarSetByClient:(BOOL)a3
{
  self->_duckToLevelDBSetByClient = a3;
}

- (void)setUnduckToLevelScalar:(float)a3
{
  self->_unduckToLevelScalar = a3;
}

- (void)setUnduckFadeDurationSetByClient:(BOOL)a3
{
  self->_audioHWControlFlagsSetByClient = a3;
}

- (void)setTookControlOfStarkMainAudio:(BOOL)a3
{
  self->_duckCommandSentToCarSession = a3;
}

- (void)setTimestampWhenMostRecentlyInterrupted:(int64_t)a3
{
  self->_timestampWhenMostRecentlyInterrupted = a3;
}

- (void)setTimestampWhenMostRecentResumableEndInterruptionWasSent:(int64_t)a3
{
  self->_timestampWhenMostRecentResumableEndInterruptionWasSent = a3;
}

- (void)setSystemSoundHasModifiedCurrentlyControllingFlags:(BOOL)a3
{
  self->_makesMusicResume = a3;
}

- (void)setStarkBorrowCount:(unsigned int)a3
{
  self->_starkBorrowCount = a3;
}

- (void)setShadowingAudioSessionID:(unsigned int)a3
{
  self->_shadowingAudioSessionID = a3;
}

- (void)setResumeBackgroundAppUpdaterTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 648);
}

- (void)setResumeAssertionRef:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 552);
}

- (void)setRecentlyWantedToPauseSpokenAudio:(BOOL)a3
{
  self->_waitingToSendEndInterruptionToSpokenAudioApp = a3;
}

- (void)setPrefersToVibeWhenVibrationsAreDisabled:(BOOL)a3
{
  self->_optOutOfMutePriority = a3;
}

- (void)setPrefersSuppressingRecordingState:(BOOL)a3
{
  self->_prefersToPlayDuringWombat = a3;
}

- (void)setPrefersSpeechDetectEnabled:(BOOL)a3
{
  self->_prefersInterruptionOnRouteDisconnect = a3;
}

- (void)setPrefersNoInterruptionsByRingtonesAndAlerts:(BOOL)a3
{
  self->_prefersNoInterruptionsByMixableSessions = a3;
}

- (void)setPrefersNoInterruptionsByMixableSessions:(BOOL)a3
{
  self->_prefersNoInterruptionsDuringRemoteDeviceControl = a3;
}

- (void)setPrefersNoInterruptionWhenSecureMicrophoneIsEngaged:(BOOL)a3
{
  self->_wantsToShowMicrophoneIndicatorWhenNotRecording = a3;
}

- (void)setPrefersNoDucking:(BOOL)a3
{
  self->_isIDSMXCoreSession = a3;
}

- (void)setPrefersMultichannelAudio:(BOOL)a3
{
  self->_enableBluetoothRecordingPreferenceSetByClient = a3;
}

- (void)setPrefersInterruptionOnRouteDisconnectSetByClient:(BOOL)a3
{
  self->_isSharedAVAudioSessionInstance = a3;
}

- (void)setPrefersInterruptionOnRouteDisconnect:(BOOL)a3
{
  self->_prefersInterruptionOnRouteDisconnectSetByClient = a3;
}

- (void)setPrefersEchoCancelledInput:(BOOL)a3
{
  self->_createSpeakerDevice = a3;
}

- (void)setPrefersConcurrentAirPlayAudio:(BOOL)a3
{
  self->_prefersSuppressingRecordingState = a3;
}

- (void)setPrefersBluetoothAccessoryMuting:(BOOL)a3
{
  self->_isVibrating = a3;
}

- (void)setPreferredStereoInputOrientation:(int)a3
{
  self->_preferredStereoInputOrientation = a3;
}

- (void)setPreferredPersistentRoute:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 856);
}

- (void)setPreferredOutputSampleRateSetByClient:(BOOL)a3
{
  self->_preferredDecoupledInputOutput = a3;
}

- (void)setPreferredOutputSampleRate:(double)a3
{
  self->_preferredOutputSampleRate = a3;
}

- (void)setPreferredMinimumMicrophoneIndicatorLightOnTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 784);
}

- (void)setPreferredInputSampleRate:(double)a3
{
  self->_preferredInputSampleRate = a3;
}

- (void)setPreferredHardwareFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 776);
}

- (void)setPowerProfile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 768);
}

- (void)setParentProcessAuditTokens:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 536);
}

- (void)setOrientationOverride:(unsigned int)a3
{
  self->_orientationOverride = a3;
}

- (void)setOptOutOfMutePriority:(BOOL)a3
{
  self->_prefersNoDucking = a3;
}

- (void)setNowPlayingAppWasStoppedOnMostRecentActivation:(BOOL)a3
{
  self->_nowPlayingAppThatWasStoppedOnMostRecentActivationWasDoingSpokenAudio = a3;
}

- (void)setNowPlayingAppThatWasStoppedOnMostRecentActivationWasDoingSpokenAudio:(BOOL)a3
{
  self->_isActiveOverAirPlayVideo = a3;
}

- (void)setNotFullyInactive:(BOOL)a3
{
  self->_someMXSessionIsPlaying = a3;
}

- (void)setNeedsAudioBudget:(BOOL)a3
{
  self->_isLongFormAudio = a3;
}

- (void)setIsSharePlayMediaSession:(BOOL)a3
{
  self->_isSharePlayCallSession = a3;
}

- (void)setIsSharePlayCapableCallSession:(BOOL)a3
{
  self->_allowSystemSoundsWhileRecording = a3;
}

- (void)setIsSharePlayCallSession:(BOOL)a3
{
  self->_isSharePlayCapableCallSession = a3;
}

- (void)setIsShadowSessionForFigSBAR:(BOOL)a3
{
  self->_isAudioSession = a3;
}

- (void)setIsRecordingMuted:(BOOL)a3
{
  self->_prefersBluetoothAccessoryMuting = a3;
}

- (void)setIsHardwareSafetySession:(BOOL)a3
{
  self->_isCarSession = a3;
}

- (void)setIsEligibleForBTTriangleConsideration:(BOOL)a3
{
  self->_isCameraRecordingExtension = a3;
}

- (void)setIsAirPlayReceiverSession:(BOOL)a3
{
  self->_isInterruptionCalledOffAudioControlQueue = a3;
}

- (void)setInterruptionFadeDurationSetByClient:(BOOL)a3
{
  self->_duckFadeDurationSetByClient = a3;
}

- (void)setHostProcessAttribution:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (void)setHasGPSPrivileges:(BOOL)a3
{
  self->_isAllowedToPlayInBackground = a3;
}

- (void)setHasEntitlementToShowMicrophoneIndicatorWhileNotRecording:(BOOL)a3
{
  self->_hasEntitlementToSetPreferredMinimumMicrophoneIndicatorLightOnTime = a3;
}

- (void)setHasEntitlementToRecordDuringCall:(BOOL)a3
{
  self->_hasEntitlementToSetEmergencyAlertPriority = a3;
}

- (void)setHapticEngineIsPlaying:(BOOL)a3
{
  self->_isAirPlayReceiverSession = a3;
}

- (void)setForceSoundCheck:(BOOL)a3
{
  self->_wantsToBeVolumeButtonClient = a3;
}

- (void)setExtendBackgroundAppAssertionTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 656);
}

- (void)setExcludedPortsList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 752);
}

- (void)setDuckingSourceList:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 688);
}

- (void)setDuckToLevelScalarSetByClient:(BOOL)a3
{
  self->_unduckToLevelScalarSetByClient = a3;
}

- (void)setDuckToLevelScalar:(float)a3
{
  self->_duckToLevelScalar = a3;
}

- (void)setDuckToLevelDBSetByClient:(BOOL)a3
{
  self->_wasActiveWhenDeviceOwnershipRelinquished = a3;
}

- (void)setDuckToLevelDB:(float)a3
{
  self->_duckToLevelDB = a3;
}

- (void)setDuckFadeDurationSetByClient:(BOOL)a3
{
  self->_unduckFadeDurationSetByClient = a3;
}

- (void)setDuckCommandSentToCarSession:(BOOL)a3
{
  self->_triggeredRemoteInterruption = a3;
}

- (void)setDesiredInputGainScalar:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 744);
}

- (void)setDeactivateTimerDelay:(int)a3
{
  self->_deactivateTimerDelay = a3;
}

- (void)setClientIsPlaying:(BOOL)a3
{
  self->_hapticEngineIsPlaying = a3;
}

- (void)setBundleIdToPAAccessIntervalMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (void)setAssertionAuditTimerDelay:(unsigned int)a3
{
  self->_assertionAuditTimerDelay = a3;
}

- (void)setAreBothBudsInEarForA2DPPortBeforeInterrupting:(BOOL)a3
{
  self->_wasInterruptedByNowPlayingApp = a3;
}

- (void)setAllowMixableAudioWhileRecording:(BOOL)a3
{
  self->_prefersNoInterruptionWhenSecureMicrophoneIsEngaged = a3;
}

- (void)setAggregateDeviceClockUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 704);
}

- (void)setAddSharedAudioRouteToRoutablePorts:(BOOL)a3
{
  self->_hasFetchedBackgroundPrivileges = a3;
}

- (void)setDefaultBuiltInRoutePreferenceSetByClient:(BOOL)a3
{
  self->_prefersSpeechDetectEnabled = a3;
}

- (void)setDefaultBuiltInRoutePreference:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 736);
}

- (int)preferredNumberOfInputChannels
{
  return self->_preferredNumberOfInputChannels;
}

- (int)preferredNumberOfOutputChannels
{
  return self->_preferredNumberOfOutputChannels;
}

- (BOOL)silentMuted
{
  return self->_isDucked;
}

- (BOOL)isAirPlayReceiverSession
{
  return self->_isInterruptionCalledOffAudioControlQueue;
}

- (int)routeSharingPolicy
{
  return self->_routeSharingPolicy;
}

- (BOOL)routingContextSetByClient
{
  return self->_auditTokenSetByClient;
}

- (void)setRouteSharingPolicy:(int)a3
{
  self->_routeSharingPolicy = a3;
}

- (void)setDefaultVPChatMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (OS_dispatch_source)sessionDeactivateTimer
{
  return self->_sessionDeactivateTimer;
}

- (BOOL)userMuted
{
  return self->_mutesAudioBasedOnRingerSwitchState;
}

- (void)setSavedCurrentlyControllingFlags:(unsigned int)a3
{
  self->_savedCurrentlyControllingFlags = a3;
}

- (unsigned)currentlyControllingFlags
{
  return self->_currentlyControllingFlags;
}

- (BOOL)prefersNoInterruptionWhenSecureMicrophoneIsEngaged
{
  return self->_wantsToShowMicrophoneIndicatorWhenNotRecording;
}

- (void)setIsPlayingStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 520);
}

- (OS_dispatch_source)sessionAssertionAuditTimer
{
  return self->_sessionAssertionAuditTimer;
}

- (BOOL)isSharedAVAudioSessionInstance
{
  return self->_prefersBeingInterruptedByNextActiveRecordingClient;
}

- (BOOL)willRouteToOnDemandVADOnActivation
{
  NSDictionary *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = -[MXCoreSessionBase additiveRoutingInfo](self, "additiveRoutingInfo");
  if (v2)
  {
    v5 = 0;
    if (CMSMVAUtility_WillSessionWithDescriptionRouteToOnDemandVADOnActivation((uint64_t)v2, &v5)
      || dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    LOBYTE(v2) = v5 != 0;
  }
  return (char)v2;
}

- (void)setCurrentlyControllingFlags:(unsigned int)a3
{
  self->_currentlyControllingFlags = a3;
}

- (BOOL)prefersToTakeHWControlFlagsFromAnotherSession
{
  return self->_dontTakeOverHardware;
}

- (NSString)preferredHardwareFormat
{
  return (NSString *)objc_getProperty(self, a2, 776, 1);
}

- (double)preferredOutputSampleRate
{
  return self->_preferredOutputSampleRate;
}

- (int)preferredIOBufferFrames
{
  return self->_preferredIOBufferFrames;
}

- (float)preferredIOBufferDuration
{
  return self->_preferredIOBufferDuration;
}

- (double)getPreferredOutputSampleRatePointer
{
  return &self->_preferredOutputSampleRate;
}

- (int)getPreferredIOBufferFramesPointer
{
  return &self->_preferredIOBufferFrames;
}

- (BOOL)wasMutedBeforeInterruption
{
  return self->_nowPlayingAppWasStoppedOnMostRecentActivation;
}

- (NSString)waitingForRemoteInterruptionDoneIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 560, 1);
}

- (void)setWasMutedBeforeInterruption:(BOOL)a3
{
  self->_nowPlayingAppWasStoppedOnMostRecentActivation = a3;
}

- (int)preferredStereoInputOrientation
{
  return self->_preferredStereoInputOrientation;
}

- (unsigned)orientationOverride
{
  return self->_orientationOverride;
}

- (BOOL)disallowAudioFormatChanges
{
  return self->_prefersMultichannelAudio;
}

- (void)setPreferredIOBufferFrames:(int)a3
{
  self->_preferredIOBufferFrames = a3;
}

- (double)preferredInputSampleRate
{
  return self->_preferredInputSampleRate;
}

- (BOOL)wasActiveWhenDeviceOwnershipRelinquished
{
  return self->_shouldMuteBeAppliedToRemoteDevice;
}

- (NSDictionary)vibrationData
{
  return (NSDictionary *)objc_getProperty(self, a2, 824, 1);
}

- (void)setWasInterruptedWhileSuspended:(BOOL)a3
{
  self->_wasInterruptedWhileRecording = a3;
}

- (void)setWaitingToResume:(BOOL)a3
{
  self->_needToEndInterruption = a3;
}

- (void)setIsPlayingStopTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 528);
}

- (void)setInterruptingSession:(id)a3
{
  self->_interruptingSession = (MXCoreSession *)a3;
}

- (void)setDoNotResetAudioCategoryOnNextInactive:(BOOL)a3
{
  self->_doNotNotifyOtherSessionsOnNextInactive = a3;
}

- (BOOL)isVibrating
{
  return self->_isUsingCamera;
}

- (BOOL)doNotResetAudioCategoryOnNextInactive
{
  return self->_doNotNotifyOtherSessionsOnNextInactive;
}

- (BOOL)mutesAudioBasedOnRingerSwitchState
{
  return self->_wantsVolumeChangesWhenPaused;
}

- (BOOL)isActiveOverAirPlayVideo
{
  return self->_isAudioOnlyAirPlayVideoActive;
}

- (BOOL)hapticEngineIsPlaying
{
  return self->_isAirPlayReceiverSession;
}

- (BOOL)someMXSessionIsPlaying
{
  return self->_clientIsPlaying;
}

- (BOOL)clientIsPlaying
{
  return self->_hapticEngineIsPlaying;
}

- (MXCoreSession)init
{
  MXCoreSession *v2;
  id location;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MXCoreSession;
  v2 = -[MXCoreSessionBase init](&v5, sel_init);
  if (v2)
  {
    v2->_mxSessionList = (NSPointerArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 5);
    v2->_mxSessionListActiveReaders = 0;
    v2->_mxSessionListReadLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v2->_mxSessionListWriteSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v2->_sessionPropertiesLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    objc_initWeak(&location, v2);
    -[MXSessionManager mxCoreSessionListAddSession:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListAddSession:", objc_loadWeak(&location));
    v2->_doesInterAppAudio = 0;
    v2->_notificationsSubscribedTo = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (unint64_t)mxSessionListAddSession:(id)a3
{
  unint64_t v4;
  id location;

  objc_initWeak(&location, a3);
  dispatch_semaphore_wait((dispatch_semaphore_t)-[MXCoreSession mxSessionListWriteSemaphore](self, "mxSessionListWriteSemaphore"), 0xFFFFFFFFFFFFFFFFLL);
  -[NSPointerArray addPointer:](-[MXCoreSession mxSessionList](self, "mxSessionList"), "addPointer:", objc_loadWeak(&location));
  -[NSPointerArray compact](-[MXCoreSession mxSessionList](self, "mxSessionList"), "compact");
  v4 = -[NSPointerArray count](-[MXCoreSession mxSessionList](self, "mxSessionList"), "count");
  dispatch_semaphore_signal((dispatch_semaphore_t)-[MXCoreSession mxSessionListWriteSemaphore](self, "mxSessionListWriteSemaphore"));
  objc_destroyWeak(&location);
  return v4;
}

- (BOOL)dontTakeOverHardware
{
  return self->_preferredOutputSampleRateSetByClient;
}

- (BOOL)wantsToPauseSpokenAudio
{
  return self->_wantsVibrationNotifications;
}

- (int64_t)timestampWhenMostRecentlyInterrupted
{
  return self->_timestampWhenMostRecentlyInterrupted;
}

- (void)setDontTakeOverHardware:(BOOL)a3
{
  self->_preferredOutputSampleRateSetByClient = a3;
}

- (NSArray)subPortPreferences
{
  return (NSArray *)objc_getProperty(self, a2, 808, 1);
}

- (NSArray)overridePortsList
{
  return (NSArray *)objc_getProperty(self, a2, 760, 1);
}

- (BOOL)willSetScreenDarkModeOnVAD
{
  return self->_addSharedAudioRouteToRoutablePorts;
}

- (NSDictionary)vpBlockConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 832, 1);
}

- (void)setWillSetScreenDarkModeOnVAD:(BOOL)a3
{
  self->_addSharedAudioRouteToRoutablePorts = a3;
}

- (BOOL)ignoreRingerSwitch
{
  return self->_forceSoundCheck;
}

- (NSArray)excludedPortsList
{
  return (NSArray *)objc_getProperty(self, a2, 752, 1);
}

- (BOOL)createSpeakerDevice
{
  return self->_disallowAudioFormatChanges;
}

- (NSDictionary)cameraParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 728, 1);
}

- (NSString)aggregateDeviceClockUID
{
  return (NSString *)objc_getProperty(self, a2, 704, 1);
}

- (BOOL)addSharedAudioRouteToRoutablePorts
{
  return self->_hasFetchedBackgroundPrivileges;
}

- (RBSAssertion)playbackAssertionRef
{
  return (RBSAssertion *)objc_getProperty(self, a2, 544, 1);
}

- (NSDictionary)hostProcessPlaybackAssertions
{
  return (NSDictionary *)objc_getProperty(self, a2, 496, 1);
}

- (BOOL)isDucked
{
  return self->_duckedOnVAD;
}

- (RBSAssertion)resumeAssertionRef
{
  return (RBSAssertion *)objc_getProperty(self, a2, 552, 1);
}

- (NSArray)parentProcessAuditTokens
{
  return (NSArray *)objc_getProperty(self, a2, 536, 1);
}

- (BOOL)needToEndInterruption
{
  return self->_wasMutedBeforeInterruption;
}

- (OS_dispatch_source)idleSleepPreventorUpdaterTimer
{
  return self->_idleSleepPreventorUpdaterTimer;
}

- (void)setIdleSleepPreventorUpdaterTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 680);
}

- (NSArray)hostProcessAttribution
{
  return (NSArray *)objc_getProperty(self, a2, 488, 1);
}

- (BOOL)isPlayingOutput
{
  return self->_isRecordingMuted;
}

- (void)setIsAudioSession:(BOOL)a3
{
  self->_isFigInstantiatedAudioSession = a3;
}

- (void)setAuditTokenSetByClient:(BOOL)a3
{
  self->_duckToLevelScalarSetByClient = a3;
}

- (BOOL)isRecordingMuted
{
  return self->_prefersBluetoothAccessoryMuting;
}

- (void)setRoutingContextSetByClient:(BOOL)a3
{
  self->_auditTokenSetByClient = a3;
}

- (void)setIsAudioOnlyAirPlayVideoActive:(BOOL)a3
{
  self->_recentlyWantedToPauseSpokenAudio = a3;
}

- (void)setIsActiveOverAirPlayVideo:(BOOL)a3
{
  self->_isAudioOnlyAirPlayVideoActive = a3;
}

- (void)setAudioHWControlFlagsSetByClient:(BOOL)a3
{
  self->_routingContextSetByClient = a3;
}

- (void)setWantsToSendResumableEndInterruptionWhenBackgrounded:(BOOL)a3
{
  self->_hasGPSPrivileges = a3;
}

- (void)setPreferredNumberOfOutputChannels:(int)a3
{
  self->_preferredNumberOfOutputChannels = a3;
}

- (void)setIsUsingCamera:(BOOL)a3
{
  self->_stopsWhenDeviceLocks = a3;
}

- (void)setSubPortPreferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 808);
}

- (BOOL)isUsingCamera
{
  return self->_stopsWhenDeviceLocks;
}

- (BOOL)wasInterruptedWhileRecording
{
  return self->_wasRecordingBeforeBeingInterrupted;
}

uint64_t __24__MXCoreSession_dealloc__block_invoke()
{
  return -[MXSessionManager updateNeroScreenState:suspendScreen:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "updateNeroScreenState:suspendScreen:", 0, 1);
}

- (int64_t)timestampWhenRecordingInBackgroundMostRecentlyStopped
{
  return self->_timestampWhenRecordingInBackgroundMostRecentlyStopped;
}

- (int64_t)timestampWhenMostRecentResumableEndInterruptionWasSent
{
  return self->_timestampWhenMostRecentResumableEndInterruptionWasSent;
}

- (void)setWaitingForEndInterruptionWhenDeviceUnlocksOrInForeground:(BOOL)a3
{
  self->_waitingToResume = a3;
}

- (void)setPreferredDecoupledInputOutput:(BOOL)a3
{
  self->_requiresAggregatedInputOutput = a3;
}

- (BOOL)requiresAggregatedInputOutput
{
  return self->_prefersEchoCancelledInput;
}

- (BOOL)notFullyInactive
{
  return self->_someMXSessionIsPlaying;
}

- (BOOL)hasEntitlementToSuppressRecordingStateToSystemStatus
{
  return self->_hasEntitlementToSupportProcessAssertionAuditTokens;
}

- (BOOL)hasEntitlementToRecordDuringCall
{
  return self->_hasEntitlementToSetEmergencyAlertPriority;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  const __CFString *v5;
  NSUInteger v6;
  NSObject *interruptSessionWithoutValidAssertionsTimer;
  RBSAssertion *playbackAssertionRef;
  RBSAssertion *resumeAssertionRef;
  NSObject *resumeBackgroundAppUpdaterTimer;
  NSObject *sessionDeactivateTimer;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *sessionAssertionAuditTimer;
  NSObject *idleSleepPreventorUpdaterTimer;
  NSObject *v15;
  objc_super v16;
  os_log_type_t type;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  NSUInteger v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x194035B20](self, a2);
  -[MXSessionManager mxCoreSessionListAddSession:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListAddSession:", 0);

  self->_mxSessionList = 0;
  self->_mxSessionListReadLock = 0;
  dispatch_release((dispatch_object_t)self->_mxSessionListWriteSemaphore);
  self->_mxSessionListWriteSemaphore = 0;

  self->_sessionPropertiesLock = 0;
  self->_isPlayingStartTime = 0;

  self->_isPlayingStopTime = 0;
  self->_vibrationData = 0;

  self->_defaultVPChatMode = 0;
  self->_overridePortsList = 0;

  self->_subPortPreferences = 0;
  self->_supportedOutputChannelLayouts = 0;

  self->_activeRoutesWhenInterrupted = 0;
  self->_allowedRouteTypes = 0;

  self->_allowedPortTypes = 0;
  self->_aggregateDeviceClockUID = 0;
  if (self->_extendBackgroundAppAssertionTimer)
  {
    v4 = MXGetAssertionLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_playbackAssertionRef)
        v5 = CFSTR("YES");
      else
        v5 = CFSTR("NO");
      v6 = -[NSDictionary count](self->_hostProcessPlaybackAssertions, "count");
      v20 = "-MXCoreSession_Embedded-";
      v21 = 2082;
      *(_DWORD *)buf = 136447234;
      v22 = "-[MXCoreSession dealloc]";
      v23 = 1024;
      v24 = 144;
      v25 = 2114;
      v26 = v5;
      v27 = 2048;
      v28 = v6;
      _os_log_impl(&dword_1935FC000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}s:%i Extend background app assertion timer is running playbackAssertion exists: %{public}@, host process playbackassertion count: %lu", buf, 0x30u);
    }
    dispatch_source_cancel((dispatch_source_t)self->_extendBackgroundAppAssertionTimer);

    self->_extendBackgroundAppAssertionTimer = 0;
  }
  interruptSessionWithoutValidAssertionsTimer = self->_interruptSessionWithoutValidAssertionsTimer;
  if (interruptSessionWithoutValidAssertionsTimer)
  {
    dispatch_source_cancel(interruptSessionWithoutValidAssertionsTimer);

    self->_interruptSessionWithoutValidAssertionsTimer = 0;
  }
  playbackAssertionRef = self->_playbackAssertionRef;
  if (playbackAssertionRef)
  {
    MX_RunningBoardServices_InvalidateAssertion(playbackAssertionRef);

    self->_playbackAssertionRef = 0;
  }

  self->_activationContext = 0;
  self->_vpBlockConfiguration = 0;
  resumeAssertionRef = self->_resumeAssertionRef;
  if (resumeAssertionRef)
  {
    MX_RunningBoardServices_InvalidateAssertion(resumeAssertionRef);

    self->_resumeAssertionRef = 0;
  }
  resumeBackgroundAppUpdaterTimer = self->_resumeBackgroundAppUpdaterTimer;
  if (resumeBackgroundAppUpdaterTimer)
  {
    dispatch_source_cancel(resumeBackgroundAppUpdaterTimer);

    self->_resumeBackgroundAppUpdaterTimer = 0;
  }
  sessionDeactivateTimer = self->_sessionDeactivateTimer;
  if (sessionDeactivateTimer)
  {
    dispatch_source_cancel(sessionDeactivateTimer);

    self->_sessionDeactivateTimer = 0;
    if (dword_1EE2B3F38)
    {
      v18 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  sessionAssertionAuditTimer = self->_sessionAssertionAuditTimer;
  if (sessionAssertionAuditTimer)
  {
    dispatch_source_cancel(sessionAssertionAuditTimer);

    self->_sessionAssertionAuditTimer = 0;
  }

  self->_excludedPortsList = 0;
  self->_cameraParameters = 0;

  self->_duckingSourceList = 0;
  self->_preferredHardwareFormat = 0;

  self->_idleSleepPreventorName = 0;
  self->_idleSleepPreventorCreationTime = 0;
  idleSleepPreventorUpdaterTimer = self->_idleSleepPreventorUpdaterTimer;
  if (idleSleepPreventorUpdaterTimer)
  {
    dispatch_source_cancel(idleSleepPreventorUpdaterTimer);

    self->_idleSleepPreventorUpdaterTimer = 0;
  }

  self->_waitingForRemoteInterruptionDoneIdentifier = 0;
  self->_siriInputDeviceUUID = 0;

  self->_defaultBuiltInRoutePreference = 0;
  self->_desiredInputGainScalar = 0;

  self->_bundleIdToPAAccessIntervalMap = 0;
  self->_parentProcessAuditTokens = 0;

  self->_hostProcessPlaybackAssertions = 0;
  self->_hostProcessAttribution = 0;

  self->_powerProfile = 0;
  self->_preferredPersistentRoute = 0;

  self->_notificationsSubscribedTo = 0;
  self->_badgeType = 0;
  v15 = MXGetSerialQueue();
  MXDispatchAsync((uint64_t)"-[MXCoreSession dealloc]", (uint64_t)"MXCoreSession.m", 300, 0, 0, v15, (uint64_t)&__block_literal_global_11);
  v16.receiver = self;
  v16.super_class = (Class)MXCoreSession;
  -[MXCoreSessionBase dealloc](&v16, sel_dealloc);
  objc_autoreleasePoolPop(v3);
}

- (BOOL)auditTokenSetByClient
{
  return self->_duckToLevelScalarSetByClient;
}

- (BOOL)allowSystemSoundsWhileRecording
{
  return self->_allowMixableAudioWhileRecording;
}

- (id)copyDetailedRouteDescriptionForContinuityScreenOutput:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend(a3, "mutableCopy");
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = (id)objc_msgSend(a3, "objectForKey:");
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(obj);
        v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "mutableCopy");
        if (vaeGetPortTypeFromPortID(objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("RouteDetailedDescription_ID")), "unsignedIntValue")) == 1885565807)
        {
          objc_msgSend(v9, "setObject:forKey:", CFSTR("Speaker"), CFSTR("RouteDetailedDescription_Name"));
          objc_msgSend(v9, "setObject:forKey:", CFSTR("Speaker"), CFSTR("RouteDetailedDescription_UID"));
        }
        objc_msgSend(v4, "addObject:", v9);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  objc_msgSend(v11, "setObject:forKey:", v4, CFSTR("RouteDetailedDescription_Outputs"));

  return v11;
}

- (BOOL)shouldAttemptSmartRoutingHijackForMusicApp
{
  _BOOL4 v3;

  v3 = -[NSString isEqualToString:](-[MXCoreSessionBase displayID](self, "displayID"), "isEqualToString:", CFSTR("com.apple.Music"));
  if (v3)
  {
    v3 = -[MXCoreSession isSharedAVAudioSessionInstance](self, "isSharedAVAudioSessionInstance");
    if (v3)
      LOBYTE(v3) = -[MXCoreSessionBase hasAudioCategory:](self, "hasAudioCategory:", CFSTR("MediaPlayback"))
                || -[MXCoreSessionBase hasAudioCategory:](self, "hasAudioCategory:", CFSTR("MediaPlaybackNoSpeaker"));
  }
  return v3;
}

- (BOOL)shouldEnableBluetoothRecording
{
  if (-[MXCoreSession enableBluetoothRecordingPreferenceSetByClient](self, "enableBluetoothRecordingPreferenceSetByClient"))
  {
    return -[MXCoreSessionBase enableBluetoothRecordingPreference](self, "enableBluetoothRecordingPreference");
  }
  else
  {
    return objc_msgSend((id)CMSMUtility_GetDefaultEnableBluetoothRecordingSettingForMode(-[MXCoreSession mode](self, "mode")), "BOOLValue");
  }
}

- (id)defaultBuiltInRouteToUse
{
  if (-[MXCoreSession defaultBuiltInRoutePreferenceSetByClient](self, "defaultBuiltInRoutePreferenceSetByClient"))
    return -[MXCoreSession defaultBuiltInRoutePreference](self, "defaultBuiltInRoutePreference");
  else
    return (id)CMSMUtility_GetDefaultBuiltInRouteSettingForMode(-[MXCoreSession mode](self, "mode"));
}

- (BOOL)updateAudioBehaviourFromVARouteConfig:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v15;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "objectForKey:", 0x1E30A87E8);
  v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", 0x1E30A8828), "count");
  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", 0x1E30A8848), "count");
  v8 = objc_msgSend(v5, "containsString:", 0x1E30A4CA8);
  if (v5)
  {
    v9 = v8;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v5, 0);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", -[MXCoreSessionBase audioBehaviour](self, "audioBehaviour"));
    v12 = v11;
    if (v6)
      objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("AudioBehaviour_Source"));
    if (v7)
    {
      -[MXCoreSessionBase setAudioDestinationPriority:](self, "setAudioDestinationPriority:", v10);
      objc_msgSend(v12, "setObject:forKey:", v10, CFSTR("AudioBehaviour_Destination"));
    }
    v13 = -[NSDictionary isEqualToDictionary:](-[MXCoreSessionBase audioBehaviour](self, "audioBehaviour"), "isEqualToDictionary:", v12);
    if (!v13)
    {
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[MXCoreSessionBase setAudioBehaviour:](self, "setAudioBehaviour:", v12, v18, v19);
      CMSMNotificationUtility_PostSessionAudioBehaviourDidChange(self);
      if (v9)
        CMSMNotificationUtility_PostSessionRouteControlFeaturesDidChange(self, 1);
      CMSMVAUtility_UpdateSessionInfoAndReporterIDsOnVA(self, 0);
    }
    v16 = !v13;

  }
  else
  {
    v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  return v16;
}

- (void)updateCameraExtensionFlagsIfNeeded
{
  id v3;

  v3 = (id)MX_RunningBoardServices_CopyBundleExtensionPointID(self);
  -[MXCoreSession setIsCameraRecordingExtension:](self, "setIsCameraRecordingExtension:", objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.securecapture")));

}

- (BOOL)isRouteSharingPolicySetByClient
{
  int v3;

  v3 = -[MXCoreSession routeSharingPolicy](self, "routeSharingPolicy");
  return v3 == -[MXCoreSession lastRouteSharingPolicySetByClient](self, "lastRouteSharingPolicySetByClient");
}

- (void)updateRouteSharingPolicy:(int)a3 setByClient:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  -[MXCoreSession setRouteSharingPolicy:](self, "setRouteSharingPolicy:");
  if (v4)
    -[MXCoreSession setLastRouteSharingPolicySetByClient:](self, "setLastRouteSharingPolicySetByClient:", v5);
}

- (void)updatePreferredIOBufferDuration:(float)a3
{
  double v5;

  -[MXCoreSession preferredIOBufferDuration](self, "preferredIOBufferDuration");
  if (*(float *)&v5 != a3)
  {
    *(float *)&v5 = a3;
    -[MXCoreSession setPreferredIOBufferDuration:](self, "setPreferredIOBufferDuration:", v5);
  }
}

- (void)updatePreferredIOBufferFrames:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[MXCoreSession preferredIOBufferFrames](self, "preferredIOBufferFrames") != a3)
    -[MXCoreSession setPreferredIOBufferFrames:](self, "setPreferredIOBufferFrames:", v3);
}

- (void)setNotificationsSubscribedTo:(id)a3
{
  -[NSLock lock](-[MXCoreSession sessionPropertiesLock](self, "sessionPropertiesLock"), "lock");

  self->_notificationsSubscribedTo = (NSSet *)a3;
  -[NSLock unlock](-[MXCoreSession sessionPropertiesLock](self, "sessionPropertiesLock"), "unlock");
}

- (NSSet)notificationsSubscribedTo
{
  NSSet *v3;

  -[NSLock lock](-[MXCoreSession sessionPropertiesLock](self, "sessionPropertiesLock"), "lock");
  v3 = self->_notificationsSubscribedTo;
  -[NSLock unlock](-[MXCoreSession sessionPropertiesLock](self, "sessionPropertiesLock"), "unlock");
  return v3;
}

- (int)updateInterruptionStyle:(unsigned int)a3
{
  uint64_t v4;
  int v5;
  _BOOL8 v6;
  MXCoreSession *v7;
  NSObject *v8;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (a3 == 2)
    v4 = 8;
  else
    v4 = a3;
  v5 = -12981;
  if (v4 <= 0x20)
  {
    if (((1 << v4) & 0x10112) != 0)
    {
      -[MXCoreSessionBase setInterruptionStyle:](self, "setInterruptionStyle:", v4);
      v6 = (_DWORD)v4 == 16;
    }
    else
    {
      if (v4 != 32)
        goto LABEL_8;
      if (!-[MXCoreSession duckToLevelScalarSetByClient](self, "duckToLevelScalarSetByClient"))
      {
        LODWORD(v10) = 1045220557;
        -[MXCoreSession setDuckToLevelScalar:](self, "setDuckToLevelScalar:", v10);
      }
      if (!-[MXCoreSession duckToLevelDBSetByClient](self, "duckToLevelDBSetByClient"))
      {
        LODWORD(v11) = -1038090240;
        -[MXCoreSession setDuckToLevelDB:](self, "setDuckToLevelDB:", v11);
      }
      if (!-[MXCoreSession unduckToLevelScalarSetByClient](self, "unduckToLevelScalarSetByClient"))
      {
        LODWORD(v12) = 1045220557;
        -[MXCoreSession setUnduckToLevelScalar:](self, "setUnduckToLevelScalar:", v12);
      }
      if (!-[MXCoreSession duckFadeDurationSetByClient](self, "duckFadeDurationSetByClient"))
      {
        LODWORD(v13) = 0.5;
        -[MXCoreSession setDuckFadeDuration:](self, "setDuckFadeDuration:", v13);
      }
      if (!-[MXCoreSession unduckFadeDurationSetByClient](self, "unduckFadeDurationSetByClient"))
      {
        LODWORD(v14) = 0.5;
        -[MXCoreSession setUnduckFadeDuration:](self, "setUnduckFadeDuration:", v14);
      }
      if (-[MXCoreSessionBase audioCategory](self, "audioCategory")
        && CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("VoiceOver")))
      {
        *(float *)&v15 = CMSMUtility_GetVoiceOverDuckFadeDuration();
        -[MXCoreSession setDuckFadeDuration:](self, "setDuckFadeDuration:", v15);
        *(float *)&v16 = CMSMUtility_GetVoiceOverDuckFadeDuration();
        -[MXCoreSession setUnduckFadeDuration:](self, "setUnduckFadeDuration:", v16);
      }
      -[MXCoreSessionBase setInterruptionStyle:](self, "setInterruptionStyle:", 32);
      v6 = 1;
    }
    -[MXCoreSessionBase setMixesWithEveryone:](self, "setMixesWithEveryone:", v6);
    v5 = 0;
  }
LABEL_8:
  CMSMNP_UpdateNowPlayingAppForNewInterruptionStyle(self);
  v7 = self;
  v8 = MXGetNotificationSenderQueue();
  MXDispatchAsyncFunction((uint64_t)"-[MXCoreSession updateInterruptionStyle:]", (uint64_t)"MXCoreSession.m", 1261, 0, 0, v8, (uint64_t)self, (uint64_t)CMSMNotificationUtility_PostSessionAudioBehaviourDidChange_f);
  return v5;
}

- (int)setUpDefaultInterruptionStyleForCategoryAndMode
{
  uint64_t v3;

  -[MXCoreSessionBase setMixesWithEveryone:](self, "setMixesWithEveryone:", 0);
  -[MXCoreSessionBase setInterruptionStyleSetByClient:](self, "setInterruptionStyleSetByClient:", 0);
  if (!-[MXCoreSessionBase audioCategory](self, "audioCategory"))
    goto LABEL_11;
  if (CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("UserInterfaceSoundEffects"))
    || CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("AmbientSound"))
    || -[MXSessionManager isSpeechDetectCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isSpeechDetectCategory:", -[MXCoreSessionBase audioCategory](self, "audioCategory")))
  {
    goto LABEL_5;
  }
  if (CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("MediaPlayback"))
    || CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("MediaPlaybackNoSpeaker"))
    || CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("LiveAudio"))
    || CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("AudioProcessing"))
    || CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("SoloAmbientSound")))
  {
    goto LABEL_11;
  }
  if (CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("Notice"))
    || CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("VoiceOver")))
  {
LABEL_15:
    -[MXCoreSessionBase setMixesWithEveryone:](self, "setMixesWithEveryone:", 1);
    v3 = 32;
    goto LABEL_12;
  }
  if (CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("VoiceCommand"))
    || CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("VoiceCommand_WithBluetooth")))
  {
LABEL_18:
    v3 = 4;
    goto LABEL_12;
  }
  if (CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("VoiceCommandThatMixes"))
    || CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("VoiceCommandThatMixes_WithBluetooth")))
  {
    goto LABEL_15;
  }
  if (CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("Record"))
    || CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("Record_WithBluetooth"))
    || CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("PlayAndRecord"))
    || CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("PlayAndRecord_WithBluetooth"))
    || CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("PlayAndRecord_NoBluetooth_DefaultToSpeaker"))|| CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("PlayAndRecord_WithBluetooth_DefaultToSpeaker"))|| CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("Multi")))
  {
    if (-[MXCoreSessionBase hasAudioMode:](self, "hasAudioMode:", CFSTR("EchoCancellationInput")))
      v3 = 16;
    else
      v3 = 8;
  }
  else
  {
    if (CMSUtility_HasPhoneCallBehaviour(self))
      goto LABEL_11;
    if (CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("Ringtone")))
      goto LABEL_18;
    if (!CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("Alarm")))
    {
      if (!CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("RingtonePreview"))
        && !CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("FindMyPhone"))
        && !CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("WaterEjection"))
        && !CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("EmergencyAlert"))
        && !CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("EmergencyAlert_Muteable")))
      {
        if (CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("Voicemail"))
          || CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("VoicemailGreeting")))
        {
          goto LABEL_11;
        }
        if (!CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("FindMyAudioDevice")))
        {
          if (CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("SystemSoundsAndHaptics")))
          {
LABEL_5:
            -[MXCoreSessionBase setMixesWithEveryone:](self, "setMixesWithEveryone:", 1);
            v3 = 16;
            goto LABEL_12;
          }
          CFEqual(-[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("eARC"));
LABEL_11:
          v3 = 8;
          goto LABEL_12;
        }
      }
      goto LABEL_18;
    }
    if (CFEqual(-[MXCoreSessionBase audioMode](self, "audioMode"), CFSTR("Sleep")))
      v3 = 8;
    else
      v3 = 4;
  }
LABEL_12:
  -[MXCoreSession updateInterruptionStyle:](self, "updateInterruptionStyle:", v3);
  return 0;
}

- (int)setUpDefaultBehavioursForCategoryAtClientRequest
{
  unsigned int LocalSessionPriority;
  _BOOL4 v4;
  int v5;
  BOOL v6;

  LocalSessionPriority = CMSM_GetLocalSessionPriority(self, 1);
  v4 = -[MXCoreSessionBase mixesWithEveryone](self, "mixesWithEveryone");
  v5 = -[MXCoreSession setUpDefaultInterruptionStyleForCategoryAndMode](self, "setUpDefaultInterruptionStyleForCategoryAndMode");
  if (!v5 && -[MXCoreSessionBase isActive](self, "isActive"))
  {
    v6 = -[MXCoreSessionBase mixesWithEveryone](self, "mixesWithEveryone");
    if (!v4 || v6)
      cmsTryToTakeControl(self);
    else
      cmsBeginInterruptionGuts(self, 0, 2);
    CMSUtility_RouteToPreferredRouteIfRequired(self, LocalSessionPriority, 5);
  }
  return v5;
}

- (int)setInterruptionStyleAtClientRequest:(unsigned int)a3
{
  uint64_t v4;
  int v5;
  const __CFString *v7;
  _BOOL4 v8;
  unsigned int v9;
  _BOOL8 v10;
  uint64_t v11;
  unsigned int LocalSessionPriority;
  unsigned int v13;
  BOOL v14;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSPointerArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  MXCoreSession *v21;
  NSObject *v22;
  unsigned int v23;
  unsigned int v24;
  BOOL v25;
  const __CFArray *v26;
  int *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  os_log_type_t type;
  unsigned int v34;
  _BYTE v35[128];
  int v36;
  const char *v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  _BOOL4 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    -[MXCoreSessionBase setInterruptionStyleSetByClient:](self, "setInterruptionStyleSetByClient:");
    return -[MXCoreSession setUpDefaultBehavioursForCategoryAtClientRequest](self, "setUpDefaultBehavioursForCategoryAtClientRequest");
  }
  v4 = *(_QWORD *)&a3;
  if (-[MXCoreSessionBase interruptionStyle](self, "interruptionStyle") == a3)
  {
    -[MXCoreSessionBase setInterruptionStyleSetByClient:](self, "setInterruptionStyleSetByClient:", 1);
  }
  else
  {
    if (-[MXCoreSessionBase audioCategory](self, "audioCategory"))
      v7 = -[MXSessionManager getUncustomizedCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getUncustomizedCategory:", -[MXCoreSessionBase audioCategory](self, "audioCategory"));
    else
      v7 = CFSTR("Audio/Video");
    v8 = -[MXCoreSessionBase mixesWithEveryone](self, "mixesWithEveryone");
    v9 = -[MXCoreSessionBase interruptionStyle](self, "interruptionStyle");
    v10 = -[MXCoreSessionBase interruptionStyleSetByClient](self, "interruptionStyleSetByClient");
    v11 = -[MXCoreSessionBase interruptionStyle](self, "interruptionStyle");
    LocalSessionPriority = CMSM_GetLocalSessionPriority(self, 1);
    if ((_DWORD)v4 == 32 || (_DWORD)v4 == 16)
    {
      if (!FigCFEqual()
        && !FigCFEqual()
        && !FigCFEqual()
        && !FigCFEqual()
        && !FigCFEqual()
        && !FigCFEqual()
        && !FigCFEqual()
        && !FigCFEqual()
        && !FigCFEqual()
        && !FigCFEqual()
        && !CMSMUtility_IsEmergencyAlertCategory((unint64_t)v7)
        && !FigCFEqual()
        && (!CMSMDeviceState_ItsAHomePod() || !FigCFEqual())
        && !-[MXSessionManager isSpeechDetectCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isSpeechDetectCategory:", v7))
      {
        return 0;
      }
    }
    else if (!FigCFEqual()
           && !FigCFEqual()
           && !FigCFEqual()
           && !FigCFEqual()
           && !FigCFEqual()
           && !CMSMUtility_IsEmergencyAlertCategory((unint64_t)v7)
           && !FigCFEqual()
           && (!CMSMDeviceState_ItsAHomePod() || !FigCFEqual())
           && !-[MXSessionManager isSpeechDetectCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isSpeechDetectCategory:", v7))
    {
      return 0;
    }
    v5 = -[MXCoreSession updateInterruptionStyle:](self, "updateInterruptionStyle:", v4);
    if (v5)
      return v5;
    -[MXCoreSessionBase setInterruptionStyleSetByClient:](self, "setInterruptionStyleSetByClient:", 1);
    v13 = -[MXCoreSessionBase interruptionStyle](self, "interruptionStyle");
    if (-[MXCoreSessionBase isActive](self, "isActive"))
    {
      v14 = -[MXCoreSessionBase mixesWithEveryone](self, "mixesWithEveryone");
      if (!v8 || v14)
      {
        cmsTryToTakeControl(self);
      }
      else if (cmsBeginInterruptionGuts(self, 0, 2))
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v5 = -[MXCoreSession updateInterruptionStyle:](self, "updateInterruptionStyle:", v11);
        -[MXCoreSessionBase setInterruptionStyleSetByClient:](self, "setInterruptionStyleSetByClient:", v10);
        return v5;
      }
      -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v16 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionList");
      v17 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v30;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v30 != v19)
              objc_enumerationMutation(v16);
            v21 = *(MXCoreSession **)(*((_QWORD *)&v29 + 1) + 8 * i);
            if (v21 != self && -[MXCoreSessionBase isActive](v21, "isActive"))
            {
              -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
              if ((v9 == 32) == (v13 == 32)
                || !-[MXSessionManager voiceOverSessionWantsRelativeDucking:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "voiceOverSessionWantsRelativeDucking:", self))
              {
                v25 = v9 != 32;
                if (v9 == 32 || v13 != 32)
                {
                  if (v13 == 32)
                    v25 = 1;
                  if (!v25)
                    -[MXSessionManager unduckSessionsForDucker:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "unduckSessionsForDucker:", self);
                }
                else
                {
                  v26 = CMSUtility_CopySessionsToDuck(1, 0, (const __CFArray *)self);
                  -[MXSessionManager duckSessionsForDucker:sessionsToDuck:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "duckSessionsForDucker:sessionsToDuck:", self, v26);
                  if (v26)
                    -[MXCoreSession setNeedToEndInterruption:](self, "setNeedToEndInterruption:", 1);

                }
              }
              else
              {
                if (dword_1EE2B3F38)
                {
                  v34 = 0;
                  type = OS_LOG_TYPE_DEFAULT;
                  v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  v23 = v34;
                  if (os_log_type_enabled(v22, type))
                    v24 = v23;
                  else
                    v24 = v23 & 0xFFFFFFFE;
                  if (v24)
                  {
                    v36 = 136315650;
                    v37 = "-[MXCoreSession setInterruptionStyleAtClientRequest:]";
                    v38 = 1024;
                    v39 = v9 == 32;
                    v40 = 1024;
                    v41 = v13 == 32;
                    LODWORD(v28) = 24;
                    v27 = &v36;
                    _os_log_send_and_compose_impl();
                  }
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
                -[MXSessionManager startAsyncDuckingOperation](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v27, v28), "startAsyncDuckingOperation");
                -[MXSessionManager updateDuckedSessionsForVoiceOver:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "updateDuckedSessionsForVoiceOver:", self);
                -[MXSessionManager endAsyncDuckingOperation](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "endAsyncDuckingOperation");
              }
              goto LABEL_71;
            }
          }
          v18 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
          if (v18)
            continue;
          break;
        }
      }
      -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
LABEL_71:
      CMSUtility_RouteToPreferredRouteIfRequired(self, LocalSessionPriority, 4);
    }
  }
  return 0;
}

- (void)resetInterruptionFlags
{
  -[MXCoreSession setWaitingToResumeWhenDeviceUnlocksOrInForeground:](self, "setWaitingToResumeWhenDeviceUnlocksOrInForeground:", 0);
  -[MXCoreSession setWaitingForEndInterruptionWhenDeviceUnlocksOrInForeground:](self, "setWaitingForEndInterruptionWhenDeviceUnlocksOrInForeground:", 0);
}

- (NSArray)activeRoutesWhenInterrupted
{
  return (NSArray *)objc_getProperty(self, a2, 464, 1);
}

- (void)setActiveRoutesWhenInterrupted:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (NSDictionary)bundleIdToPAAccessIntervalMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 472, 1);
}

- (NSString)defaultVPChatMode
{
  return (NSString *)objc_getProperty(self, a2, 480, 1);
}

- (NSDate)idleSleepPreventorCreationTime
{
  return (NSDate *)objc_getProperty(self, a2, 504, 1);
}

- (void)setIdleSleepPreventorCreationTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 504);
}

- (NSString)idleSleepPreventorName
{
  return (NSString *)objc_getProperty(self, a2, 512, 1);
}

- (void)setIdleSleepPreventorName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 512);
}

- (NSDate)isPlayingStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 520, 1);
}

- (NSDate)isPlayingStopTime
{
  return (NSDate *)objc_getProperty(self, a2, 528, 1);
}

- (void)setMxSessionList:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 568);
}

- (void)setMxSessionListReadLock:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 576);
}

- (void)setMxSessionListWriteSemaphore:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 584);
}

- (void)setSessionPropertiesLock:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 592);
}

- (void)setSessionDeactivateTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 600);
}

- (void)setSessionAssertionAuditTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 608);
}

- (BOOL)isInterruptionCalledOffAudioControlQueue
{
  return self->_isPlayingOutput;
}

- (void)setIsInterruptionCalledOffAudioControlQueue:(BOOL)a3
{
  self->_isPlayingOutput = a3;
}

- (BOOL)prefersBluetoothAccessoryMuting
{
  return self->_isVibrating;
}

- (void)setIsVibrating:(BOOL)a3
{
  self->_isUsingCamera = a3;
}

- (unsigned)savedCurrentlyControllingFlags
{
  return self->_savedCurrentlyControllingFlags;
}

- (unsigned)savedHWControlFlagsForClientThatDoesNotActuallyPlayAudio
{
  return self->_savedHWControlFlagsForClientThatDoesNotActuallyPlayAudio;
}

- (BOOL)systemSoundHasModifiedCurrentlyControllingFlags
{
  return self->_makesMusicResume;
}

- (BOOL)makesMusicResume
{
  return self->_mustUseDefaultClientPriority;
}

- (BOOL)handsOverInterruptionsToInterruptor
{
  return self->_allowedToBeNowPlayingApp;
}

- (BOOL)areBothBudsInEarForA2DPPortBeforeInterrupting
{
  return self->_wasInterruptedByNowPlayingApp;
}

- (MXCoreSession)interruptingSession
{
  return self->_interruptingSession;
}

- (void)setWasInterruptedByNowPlayingApp:(BOOL)a3
{
  self->_wasInterruptedWhileSuspended = a3;
}

- (BOOL)wasInterruptedWhileSuspended
{
  return self->_wasInterruptedWhileRecording;
}

- (BOOL)wasRecordingBeforeBeingInterrupted
{
  return self->_waitingToResumeWhenDeviceUnlocksOrInForeground;
}

- (void)setWasRecordingBeforeBeingInterrupted:(BOOL)a3
{
  self->_waitingToResumeWhenDeviceUnlocksOrInForeground = a3;
}

- (void)setWaitingToResumeWhenDeviceUnlocksOrInForeground:(BOOL)a3
{
  self->_waitingForEndInterruptionWhenDeviceUnlocksOrInForeground = a3;
}

- (BOOL)waitingToResume
{
  return self->_needToEndInterruption;
}

- (void)setNeedToEndInterruption:(BOOL)a3
{
  self->_wasMutedBeforeInterruption = a3;
}

- (BOOL)nowPlayingAppWasStoppedOnMostRecentActivation
{
  return self->_nowPlayingAppThatWasStoppedOnMostRecentActivationWasDoingSpokenAudio;
}

- (BOOL)nowPlayingAppThatWasStoppedOnMostRecentActivationWasDoingSpokenAudio
{
  return self->_isActiveOverAirPlayVideo;
}

- (void)setTimestampWhenRecordingInBackgroundMostRecentlyStopped:(int64_t)a3
{
  self->_timestampWhenRecordingInBackgroundMostRecentlyStopped = a3;
}

- (OS_dispatch_source)resumeBackgroundAppUpdaterTimer
{
  return self->_resumeBackgroundAppUpdaterTimer;
}

- (OS_dispatch_source)extendBackgroundAppAssertionTimer
{
  return self->_extendBackgroundAppAssertionTimer;
}

- (OS_dispatch_source)interruptSessionWithoutValidAssertionsTimer
{
  return self->_interruptSessionWithoutValidAssertionsTimer;
}

- (void)setInterruptSessionWithoutValidAssertionsTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 664);
}

- (BOOL)isAudioOnlyAirPlayVideoActive
{
  return self->_recentlyWantedToPauseSpokenAudio;
}

- (BOOL)recentlyWantedToPauseSpokenAudio
{
  return self->_waitingToSendEndInterruptionToSpokenAudioApp;
}

- (BOOL)waitingToSendEndInterruptionToSpokenAudioApp
{
  return self->_idleSleepPreventorAllocated;
}

- (void)setWaitingToSendEndInterruptionToSpokenAudioApp:(BOOL)a3
{
  self->_idleSleepPreventorAllocated = a3;
}

- (void)setIdleSleepPreventorAllocated:(BOOL)a3
{
  self->_silentMuted = a3;
}

- (OS_os_transaction)vibratingOSTransaction
{
  return self->_vibratingOSTransaction;
}

- (unsigned)idleSleepPreventor
{
  return self->_idleSleepPreventor;
}

- (void)setIdleSleepPreventor:(unsigned int)a3
{
  self->_idleSleepPreventor = a3;
}

- (NSMutableArray)duckingSourceList
{
  return self->_duckingSourceList;
}

- (void)setSilentMuted:(BOOL)a3
{
  self->_isDucked = a3;
}

- (void)setIsDucked:(BOOL)a3
{
  self->_duckedOnVAD = a3;
}

- (BOOL)duckedOnVAD
{
  return self->_tookControlOfStarkMainAudio;
}

- (void)setDuckedOnVAD:(BOOL)a3
{
  self->_tookControlOfStarkMainAudio = a3;
}

- (unsigned)starkBorrowCount
{
  return self->_starkBorrowCount;
}

- (BOOL)tookControlOfStarkMainAudio
{
  return self->_duckCommandSentToCarSession;
}

- (BOOL)duckCommandSentToCarSession
{
  return self->_triggeredRemoteInterruption;
}

- (BOOL)triggeredRemoteInterruption
{
  return self->_mustRestoreCurrentlyControllingFlags;
}

- (void)setTriggeredRemoteInterruption:(BOOL)a3
{
  self->_mustRestoreCurrentlyControllingFlags = a3;
}

- (BOOL)mustRestoreCurrentlyControllingFlags
{
  return self->_willSetScreenDarkModeOnVAD;
}

- (void)setMustRestoreCurrentlyControllingFlags:(BOOL)a3
{
  self->_willSetScreenDarkModeOnVAD = a3;
}

- (BOOL)hasFetchedGPSPrivileges
{
  return self->_interruptionFadeDurationSetByClient;
}

- (void)setHasFetchedGPSPrivileges:(BOOL)a3
{
  self->_interruptionFadeDurationSetByClient = a3;
}

- (BOOL)interruptionFadeDurationSetByClient
{
  return self->_duckFadeDurationSetByClient;
}

- (BOOL)duckFadeDurationSetByClient
{
  return self->_unduckFadeDurationSetByClient;
}

- (BOOL)unduckFadeDurationSetByClient
{
  return self->_audioHWControlFlagsSetByClient;
}

- (BOOL)duckToLevelScalarSetByClient
{
  return self->_unduckToLevelScalarSetByClient;
}

- (BOOL)unduckToLevelScalarSetByClient
{
  return self->_duckToLevelDBSetByClient;
}

- (BOOL)duckToLevelDBSetByClient
{
  return self->_wasActiveWhenDeviceOwnershipRelinquished;
}

- (BOOL)shouldMuteBeAppliedToRemoteDevice
{
  return self->_isRecordingMutedForRemoteDevice;
}

- (void)setShouldMuteBeAppliedToRemoteDevice:(BOOL)a3
{
  self->_isRecordingMutedForRemoteDevice = a3;
}

- (BOOL)isRecordingMutedForRemoteDevice
{
  return self->_hasEntitlementToRecordAudioInAnExtension;
}

- (void)setIsRecordingMutedForRemoteDevice:(BOOL)a3
{
  self->_hasEntitlementToRecordAudioInAnExtension = a3;
}

- (void)setActivationContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 696);
}

- (void)setCameraParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 728);
}

- (NSNumber)desiredInputGainScalar
{
  return (NSNumber *)objc_getProperty(self, a2, 744, 1);
}

- (NSDictionary)powerProfile
{
  return (NSDictionary *)objc_getProperty(self, a2, 768, 1);
}

- (NSNumber)preferredMinimumMicrophoneIndicatorLightOnTime
{
  return (NSNumber *)objc_getProperty(self, a2, 784, 1);
}

- (void)setPreferredRouteControlFeatures:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 792);
}

- (void)setSiriInputDeviceUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 800);
}

- (NSArray)supportedOutputChannelLayouts
{
  return (NSArray *)objc_getProperty(self, a2, 816, 1);
}

- (void)setVibrationData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 824);
}

- (void)setVpBlockConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 832);
}

- (BOOL)hasEntitlementToRecordAudioInAnExtension
{
  return self->_hasEntitlementToStartRecordingInTheBackground;
}

- (BOOL)hasEntitlementToStartRecordingInTheBackground
{
  return self->_hasEntitlementToSuppressRecordingStateToSystemStatus;
}

- (BOOL)hasEntitlementToSupportProcessAssertionAuditTokens
{
  return self->_hasEntitlementToRecordDuringCall;
}

- (BOOL)hasEntitlementToSetEmergencyAlertPriority
{
  return self->_hasEntitlementToShowMicrophoneIndicatorWhileNotRecording;
}

- (BOOL)hasEntitlementToSetPreferredMinimumMicrophoneIndicatorLightOnTime
{
  return self->_doesGameAudioNeedToBeSpatialized;
}

- (BOOL)doesGameAudioNeedToBeSpatialized
{
  return self->_bypassSystemSpatialAudioForGame;
}

- (void)setDoesGameAudioNeedToBeSpatialized:(BOOL)a3
{
  self->_bypassSystemSpatialAudioForGame = a3;
}

- (BOOL)bypassSystemSpatialAudioForGame
{
  return self->_isEligibleForNowPlayingAppConsideration;
}

- (void)setBypassSystemSpatialAudioForGame:(BOOL)a3
{
  self->_isEligibleForNowPlayingAppConsideration = a3;
}

- (void)setClientPriority:(unsigned int)a3
{
  self->_clientPriority = a3;
}

- (BOOL)preferredOutputSampleRateSetByClient
{
  return self->_preferredDecoupledInputOutput;
}

- (void)setRequiresAggregatedInputOutput:(BOOL)a3
{
  self->_prefersEchoCancelledInput = a3;
}

- (void)setPreferredNumberOfInputChannels:(int)a3
{
  self->_preferredNumberOfInputChannels = a3;
}

- (void)setCreateSpeakerDevice:(BOOL)a3
{
  self->_disallowAudioFormatChanges = a3;
}

- (void)setDisallowAudioFormatChanges:(BOOL)a3
{
  self->_prefersMultichannelAudio = a3;
}

- (BOOL)prefersMultichannelAudio
{
  return self->_enableBluetoothRecordingPreferenceSetByClient;
}

- (BOOL)isCameraRecordingExtension
{
  return self->_userMuted;
}

- (void)setIsCameraRecordingExtension:(BOOL)a3
{
  self->_userMuted = a3;
}

- (float)duckToLevelScalar
{
  return self->_duckToLevelScalar;
}

- (float)unduckToLevelScalar
{
  return self->_unduckToLevelScalar;
}

- (float)duckToLevelDB
{
  return self->_duckToLevelDB;
}

- (float)lastDuckVolumeApplied
{
  return self->_lastDuckVolumeApplied;
}

- (void)setLastDuckVolumeApplied:(float)a3
{
  self->_lastDuckVolumeApplied = a3;
}

- (float)duckFadeDuration
{
  return self->_duckFadeDuration;
}

- (void)setDuckFadeDuration:(float)a3
{
  self->_duckFadeDuration = a3;
}

- (float)unduckFadeDuration
{
  return self->_unduckFadeDuration;
}

- (void)setUnduckFadeDuration:(float)a3
{
  self->_unduckFadeDuration = a3;
}

- (void)setUserMuted:(BOOL)a3
{
  self->_mutesAudioBasedOnRingerSwitchState = a3;
}

- (unsigned)shadowingAudioSessionID
{
  return self->_shadowingAudioSessionID;
}

- (void)setMutesAudioBasedOnRingerSwitchState:(BOOL)a3
{
  self->_wantsVolumeChangesWhenPaused = a3;
}

- (float)audioQueueFadeDuration
{
  return self->_audioQueueFadeDuration;
}

- (void)setAudioQueueFadeDuration:(float)a3
{
  self->_audioQueueFadeDuration = a3;
}

- (float)audioQueueDuckVolume
{
  return self->_audioQueueDuckVolume;
}

- (void)setAudioQueueDuckVolume:(float)a3
{
  self->_audioQueueDuckVolume = a3;
}

- (void)setWantsVolumeChangesWhenPaused:(BOOL)a3
{
  self->_wantsVolumeChangesWhenPausedOrInactive = a3;
}

- (void)setWantsVolumeChangesWhenPausedOrInactive:(BOOL)a3
{
  self->_ignoreRingerSwitch = a3;
}

- (void)setIgnoreRingerSwitch:(BOOL)a3
{
  self->_forceSoundCheck = a3;
}

- (float)constantOutputVolumeLeveldB
{
  return self->_constantOutputVolumeLeveldB;
}

- (void)setConstantOutputVolumeLeveldB:(float)a3
{
  self->_constantOutputVolumeLeveldB = a3;
}

- (BOOL)prefersNoInterruptionsByMixableSessions
{
  return self->_prefersNoInterruptionsDuringRemoteDeviceControl;
}

- (BOOL)prefersNoInterruptionsDuringRemoteDeviceControl
{
  return self->_prefersToVibeWhenVibrationsAreDisabled;
}

- (void)setPrefersNoInterruptionsDuringRemoteDeviceControl:(BOOL)a3
{
  self->_prefersToVibeWhenVibrationsAreDisabled = a3;
}

- (BOOL)prefersToVibeWhenVibrationsAreDisabled
{
  return self->_optOutOfMutePriority;
}

- (BOOL)optOutOfMutePriority
{
  return self->_prefersNoDucking;
}

- (BOOL)prefersNoDucking
{
  return self->_isIDSMXCoreSession;
}

- (void)setIsIDSMXCoreSession:(BOOL)a3
{
  self->_isHardwareSafetySession = a3;
}

- (BOOL)isCarSession
{
  return self->_isShadowSessionForFigSBAR;
}

- (void)setIsCarSession:(BOOL)a3
{
  self->_isShadowSessionForFigSBAR = a3;
}

- (BOOL)isShadowSessionForFigSBAR
{
  return self->_isAudioSession;
}

- (BOOL)isAudioSession
{
  return self->_isFigInstantiatedAudioSession;
}

- (BOOL)isFigInstantiatedAudioSession
{
  return self->_isTemporaryAssertionEnabled;
}

- (void)setIsFigInstantiatedAudioSession:(BOOL)a3
{
  self->_isTemporaryAssertionEnabled = a3;
}

- (BOOL)isTemporaryAssertionEnabled
{
  return self->_doesInterAppAudio;
}

- (void)setIsTemporaryAssertionEnabled:(BOOL)a3
{
  self->_doesInterAppAudio = a3;
}

- (BOOL)doesInterAppAudio
{
  return self->_needsAudioBudget;
}

- (void)setDoesInterAppAudio:(BOOL)a3
{
  self->_needsAudioBudget = a3;
}

- (BOOL)needsAudioBudget
{
  return self->_isLongFormAudio;
}

- (BOOL)isLongFormAudio
{
  return self->_wantsToPauseSpokenAudio;
}

- (BOOL)wantsVibrationNotifications
{
  return self->_doNotResetAudioCategoryOnNextInactive;
}

- (void)setWantsVibrationNotifications:(BOOL)a3
{
  self->_doNotResetAudioCategoryOnNextInactive = a3;
}

- (BOOL)doNotNotifyOtherSessionsOnNextInactive
{
  return self->_wantsToSendResumableEndInterruptionWhenBackgrounded;
}

- (BOOL)wantsToSendResumableEndInterruptionWhenBackgrounded
{
  return self->_hasGPSPrivileges;
}

- (BOOL)hasGPSPrivileges
{
  return self->_isAllowedToPlayInBackground;
}

- (BOOL)wantsAutomaticClusterPairingOnPlaybackStart
{
  return self->_isSharePlayMediaSession;
}

- (BOOL)allowMixableAudioWhileRecording
{
  return self->_prefersNoInterruptionWhenSecureMicrophoneIsEngaged;
}

- (int)deactivateTimerDelay
{
  return self->_deactivateTimerDelay;
}

- (unsigned)assertionAuditTimerDelay
{
  return self->_assertionAuditTimerDelay;
}

- (BOOL)prefersSuppressingRecordingState
{
  return self->_prefersToPlayDuringWombat;
}

- (BOOL)prefersToPlayDuringWombat
{
  return self->_doesntActuallyPlayAudio;
}

- (void)setPrefersToPlayDuringWombat:(BOOL)a3
{
  self->_doesntActuallyPlayAudio = a3;
}

- (int)lastRouteSharingPolicySetByClient
{
  return self->_lastRouteSharingPolicySetByClient;
}

- (void)setLastRouteSharingPolicySetByClient:(int)a3
{
  self->_lastRouteSharingPolicySetByClient = a3;
}

- (BOOL)prefersSpeechDetectEnabled
{
  return self->_prefersInterruptionOnRouteDisconnect;
}

- (BOOL)prefersInterruptionOnRouteDisconnect
{
  return self->_prefersInterruptionOnRouteDisconnectSetByClient;
}

- (BOOL)prefersBeingInterruptedByNextActiveRecordingClient
{
  return *(&self->_prefersBeingInterruptedByNextActiveRecordingClient + 1);
}

- (void)setPrefersBeingInterruptedByNextActiveRecordingClient:(BOOL)a3
{
  *(&self->_prefersBeingInterruptedByNextActiveRecordingClient + 1) = a3;
}

@end
