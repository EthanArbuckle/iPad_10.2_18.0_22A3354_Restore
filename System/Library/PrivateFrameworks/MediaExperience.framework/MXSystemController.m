@implementation MXSystemController

- (id)info
{
  void *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;

  if (-[MXSystemController remoteDeviceID](self, "remoteDeviceID"))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<MXSystemController: %@ PID=%d RemoteDeviceID=%@, listOfNotificationSubscriptions=%@>"), -[MXSystemController displayID](self, "displayID"), -[MXSystemController clientPID](self, "clientPID"), -[MXSystemController remoteDeviceID](self, "remoteDeviceID"), -[MXSystemController notificationsSubscribedTo](self, "notificationsSubscribedTo"), v10, v11);
  if (MX_FeatureFlags_IsAirPlayDaemonEnabled()
    && -[MXSystemController remoteDeviceIDs](self, "remoteDeviceIDs"))
  {
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<MXSystemController: %@ PID=%d RemoteDeviceIDs=%@, listOfNotificationSubscriptions=%@>"), -[MXSystemController displayID](self, "displayID"), -[MXSystemController clientPID](self, "clientPID"), -[MXSystemController remoteDeviceIDs](self, "remoteDeviceIDs"), -[MXSystemController notificationsSubscribedTo](self, "notificationsSubscribedTo"), v10, v11);
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[MXSystemController displayID](self, "displayID");
  v6 = -[MXSystemController clientPID](self, "clientPID");
  v7 = -[MXSystemController pidToInheritAppStateFrom](self, "pidToInheritAppStateFrom");
  if (-[MXSystemController appWantsVolumeChanges](self, "appWantsVolumeChanges"))
    v8 = "YES";
  else
    v8 = "NO";
  if (-[MXSystemController hasEntitlementToEnableWombat](self, "hasEntitlementToEnableWombat"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<MXSystemController: %@ PID=%d InheritingFrom=%d wantsVolumeChanges=%s hasEntitlementToEnableWombat=%@, listOfNotificationSubscriptions=%@>"), v5, v6, v7, v8, v9, -[MXSystemController notificationsSubscribedTo](self, "notificationsSubscribedTo"));
}

+ (int)getPIDForAnyAppThatWantsVolumeChanges
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[MXSystemController mxSystemControllerListBeginIteration](MXSystemController, "mxSystemControllerListBeginIteration");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)gMXSystemControllerList;
  v3 = objc_msgSend((id)gMXSystemControllerList, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (v7 && objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "appWantsVolumeChanges"))
        {
          v8 = objc_msgSend(v7, "clientPID");
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_12:
  +[MXSystemController mxSystemControllerListEndIteration](MXSystemController, "mxSystemControllerListEndIteration");
  return v8;
}

- (BOOL)appWantsVolumeChanges
{
  return self->_appWantsVolumeChanges;
}

+ (int)getPIDToInheritAppStateFromForPID:(int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[MXSystemController mxSystemControllerListBeginIteration](MXSystemController, "mxSystemControllerListBeginIteration");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)gMXSystemControllerList;
  v5 = objc_msgSend((id)gMXSystemControllerList, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (v9
          && objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "clientPID") == a3
          && objc_msgSend(v9, "pidToInheritAppStateFrom"))
        {
          v10 = objc_msgSend(v9, "pidToInheritAppStateFrom");
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_13:
  +[MXSystemController mxSystemControllerListEndIteration](MXSystemController, "mxSystemControllerListEndIteration");
  return v10;
}

+ (BOOL)getCanBeNowPlayingAppForPID:(int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[MXSystemController mxSystemControllerListBeginIteration](MXSystemController, "mxSystemControllerListBeginIteration");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)gMXSystemControllerList;
  v5 = objc_msgSend((id)gMXSystemControllerList, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (v9 && objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "clientPID") == a3)
        {
          v10 = objc_msgSend(v9, "canBeNowPlayingApp");
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:
  +[MXSystemController mxSystemControllerListEndIteration](MXSystemController, "mxSystemControllerListEndIteration");
  return v10;
}

- (int)clientPID
{
  return self->_clientPID;
}

+ (void)mxSystemControllerListEndIteration
{
  objc_msgSend((id)gMXSystemControllerListReadLock, "lock");
  if (!--gMXSystemControllerListActiveReaders)
    dispatch_semaphore_signal((dispatch_semaphore_t)gMXSystemControllerListWriteSemaphore);
  objc_msgSend((id)gMXSystemControllerListReadLock, "unlock");
}

+ (void)mxSystemControllerListBeginIteration
{
  objc_msgSend((id)gMXSystemControllerListReadLock, "lock");
  if (!gMXSystemControllerListActiveReaders++)
    dispatch_semaphore_wait((dispatch_semaphore_t)gMXSystemControllerListWriteSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)gMXSystemControllerListReadLock, "unlock");
}

- (BOOL)canBeNowPlayingApp
{
  return self->_canBeNowPlayingApp;
}

- (int)pidToInheritAppStateFrom
{
  return self->_pidToInheritAppStateFrom;
}

- (NSString)remoteDeviceID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)hasEntitlementToEnableWombat
{
  return self->_hasEntitlementToEnableWombat;
}

- (NSString)displayID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

void __88__MXSystemController_InternalUse__notifyAll_payload_dontPostIfSuspended_remoteDeviceID___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  _BOOL4 v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  os_log_type_t type;
  int v30;
  CFTypeRef cf;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = &gSidekickMXSystemControllerList;
  if (!*(_QWORD *)(a1 + 32))
    v3 = &gMXSystemControllerList;
  v4 = (void *)*v3;
  +[MXSystemController mxSystemControllerListBeginIteration](MXSystemController, "mxSystemControllerListBeginIteration");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    v24 = v4;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
        if (v9)
        {
          if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("ActiveAudioRouteDidChange")))
          {
            cf = 0;
            FigRoutingManagerContextUtilities_CopySystemMusicContextUUID((uint64_t)&cf);
            if (!FigRoutingContextUtilities_IsFollowingAnotherContext((uint64_t)cf)
              && ((objc_msgSend((id)objc_msgSend(v9, "displayID"), "isEqualToString:", CFSTR("com.apple.Music")) & 1) != 0
               || objc_msgSend((id)objc_msgSend(v9, "displayID"), "isEqualToString:", CFSTR("com.apple.TVMusic"))))
            {
              if (dword_1EE2B3EB0)
              {
                v30 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                v4 = v24;
                v10 = 1;
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              else
              {
                v10 = 1;
              }
            }
            else
            {
              v10 = 0;
            }
            if (cf)
              CFRelease(cf);
          }
          else
          {
            v10 = 0;
          }
          v11 = objc_msgSend((id)objc_msgSend(v9, "notificationsSubscribedTo", v22, v23), "objectForKey:", *(_QWORD *)(a1 + 40));
          if (*(_BYTE *)(a1 + 56))
          {
            v12 = MX_RunningBoardServices_GetApplicationStateForPID(objc_msgSend(v9, "clientPID"), 0) - 3 < 0xFFFFFFFE;
            if (v10)
              goto LABEL_31;
          }
          else
          {
            v12 = 1;
            if (v10)
              goto LABEL_31;
          }
          if (v11)
            v13 = !v12;
          else
            v13 = 1;
          if (!v13)
          {
            if (!*(_QWORD *)(a1 + 32)
              || (v14 = objc_msgSend(v9, "remoteDeviceID")) != 0
              && (v14 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(v9, "remoteDeviceID")),
                  (v14 & 1) != 0)
              || MX_FeatureFlags_IsAirPlayDaemonEnabled(v14, v15)
              && *(_QWORD *)(a1 + 32)
              && objc_msgSend(v9, "remoteDeviceIDs")
              && objc_msgSend((id)objc_msgSend(v9, "remoteDeviceIDs"), "containsObject:", *(_QWORD *)(a1 + 32)))
            {
              objc_msgSend(v2, "addObject:", v9);
            }
          }
        }
LABEL_31:
        ++v8;
      }
      while (v6 != v8);
      v17 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      v6 = v17;
    }
    while (v17);
  }
  +[MXSystemController mxSystemControllerListEndIteration](MXSystemController, "mxSystemControllerListEndIteration");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v2);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), *(_QWORD *)(a1 + 48));
      }
      v19 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    }
    while (v19);
  }

}

- (NSDictionary)notificationsSubscribedTo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (int)copyAttributeForKeyInternal:(id)a3 withValueOut:(void *)a4
{
  NSArray *active;
  void *v8;
  void *CurrentlyAirPlayingVideoStreamsDictionary;
  _BOOL8 v10;
  id v11;
  id v12;
  int result;
  id v14;
  int IsSuspended;
  _BOOL8 v16;
  uint64_t v17;
  id v18;
  NSArray *v19;
  NSArray *ScreenType;
  id v21;
  int v22;
  uint64_t LocalSessionPriority;
  id v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t IsSomeClientRecording;
  id v28;
  uint64_t v29;
  int IsPlaying;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v32;
  double v33;
  id v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  float v38;
  float v39;
  int v40;
  MXSessionManager *v41;
  _BOOL8 IsContinuityScreenOutputPortPresentInConnectedOutputPorts;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ActiveNeroVisualStreamInfo")))
  {
    active = (NSArray *)FigRoutingManagerCopyActiveNeroVisualStreamInfo((uint64_t)-[MXSessionManager systemMirroringRoutingContextUUID](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "systemMirroringRoutingContextUUID"));
LABEL_18:
    v19 = active;
    result = 0;
    *(_QWORD *)a4 = v19;
    return result;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ActivePhoneCallInfo")))
  {
    v8 = (void *)CMSMUtility_CopyActivePhoneCallInfo();
    CurrentlyAirPlayingVideoStreamsDictionary = v8;
    if (!v8)
    {
LABEL_7:

      return 0;
    }
    v10 = objc_msgSend((id)objc_msgSend(v8, "objectForKey:", CFSTR("ClientPriority")), "intValue") == 10;
    v11 = objc_alloc(MEMORY[0x1E0C99D80]);
    v12 = (id)objc_msgSend(v11, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10), CFSTR("CallIsHighPriority"), 0, v45, v46);
LABEL_6:
    *(_QWORD *)a4 = v12;
    goto LABEL_7;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AirPlayScreenSuspended")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = CMScreenIsSuspended();
LABEL_10:
    v16 = IsSuspended != 0;
LABEL_16:
    v18 = v14;
LABEL_17:
    active = (NSArray *)objc_msgSend(v18, "initWithBool:", v16, v43, v44);
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AppWantsVolumeChanges")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v17 = -[MXSystemController appWantsVolumeChanges](self, "appWantsVolumeChanges");
LABEL_15:
    v16 = v17;
    goto LABEL_16;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CanBeNowPlayingApp")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v17 = -[MXSystemController canBeNowPlayingApp](self, "canBeNowPlayingApp");
    goto LABEL_15;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CarPlayAuxStreamSupport")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = FigRoutingManager_iOSIsCarPlayAuxStreamSupported();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CarPlayIsConnected")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v17 = -[MXSessionManager carPlayIsConnected](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "carPlayIsConnected");
    goto LABEL_15;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CarPlayIsPlayingLongerDurationSession")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = CMSMUtility_CarPlayIsPlayingLongerDurationSession();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CarPlaySupportsMixableSiri")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = CMSMUtility_DoesCarPlaySupportMixableSiri();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ExternalScreenType")))
  {
    ScreenType = (NSArray *)CMScreenGetScreenType();
LABEL_29:
    active = ScreenType;
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentlyActiveCategory")))
  {
    active = (NSArray *)CMSMUtility_CopyCurrentlyActiveCategory();
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentlyActiveMode")))
  {
    active = (NSArray *)CMSMUtility_CopyCurrentlyActiveMode();
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentVideoStreams")))
  {
    CurrentlyAirPlayingVideoStreamsDictionary = CMSMUtility_CreateCurrentlyAirPlayingVideoStreamsDictionary((uint64_t)CFSTR("CurrentVideoStreams_BundleID"), (uint64_t)CFSTR("CurrentVideoStreams_VideoRoutes"));
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CurrentlyAirPlayingVideoStreamsDictionary, 0);
    goto LABEL_6;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("DeviceSupportsPiP")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = CMSMDeviceState_SupportsPiP();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("HeadphoneJackHasInput")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = vaemHeadphoneJackHasInput(1);
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("HeadphoneJackIsConnected")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = vaemHeadphoneJackIsConnected(1);
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("HighestArbitrationPriorityForTipi")))
  {
    if (MX_FeatureFlags_IsSmartRoutingOnActivationEnabled())
      v21 = -[MXSessionManager copyHighestPriorityActiveSession:deviceIdentifier:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyHighestPriorityActiveSession:deviceIdentifier:", 0x1E30A4C28, 0);
    else
      v21 = CMSM_CopyHighestPriorityLocalPlayingSession(1);
    CurrentlyAirPlayingVideoStreamsDictionary = v21;
    LocalSessionPriority = CMSM_GetLocalSessionPriority(v21, 1);
    v24 = objc_alloc(MEMORY[0x1E0C99D80]);
    v25 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LocalSessionPriority);
    if (objc_msgSend(CurrentlyAirPlayingVideoStreamsDictionary, "displayID"))
      v26 = (const __CFString *)objc_msgSend(CurrentlyAirPlayingVideoStreamsDictionary, "displayID");
    else
      v26 = CFSTR("Unknown");
    v12 = (id)objc_msgSend(v24, "initWithObjectsAndKeys:", v25, CFSTR("HighestArbitrationPriorityForTipi_AudioScore"), v26, CFSTR("HighestArbitrationPriorityForTipi_BundleID"), 0);
    goto LABEL_6;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("iOSWillRequestToBorrowStarkMainAudio")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v22 = 1;
LABEL_49:
    IsSuspended = CMSMUtility_iOSWillRequestCarMainAudio(v22);
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("iOSWillRequestToTakeStarkMainAudio")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v22 = 0;
    goto LABEL_49;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("IsSomeoneRecording")))
  {
    IsSomeClientRecording = CMSMUtility_IsSomeClientRecording();
    v28 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v29 = IsSomeClientRecording;
LABEL_57:
    active = (NSArray *)objc_msgSend(v28, "initWithUnsignedInt:", v29);
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("LongFormVideoApps")))
  {
    ScreenType = -[MXSessionManager longFormVideoApps](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "longFormVideoApps");
    goto LABEL_29;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NowPlayingAppDisplayID")))
  {
    ScreenType = -[MXNowPlayingAppManager nowPlayingAppDisplayID](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "nowPlayingAppDisplayID");
    goto LABEL_29;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NowPlayingAppIsInterrupted")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = CMSMNP_GetNowPlayingAppIsInterrupted();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NowPlayingAppIsPlaying")))
  {
    IsPlaying = CMSMNP_GetNowPlayingAppIsPlaying();
LABEL_66:
    v18 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v16 = IsPlaying != 0;
    goto LABEL_17;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NowPlayingAppPID")))
  {
    active = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", -[MXNowPlayingAppManager nowPlayingAppPID](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "nowPlayingAppPID"));
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NowPlayingAppShouldResumeForCarPlay")))
  {
    IsPlaying = CMSMNP_GetNowPlayingAppShouldResumeForCarPlay();
    if (dword_1EE2B3EB0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_66;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("MaximumSpeakerVolumeLimit")))
  {
    v32 = objc_alloc(MEMORY[0x1E0CB37E8]);
    LODWORD(v33) = 1.0;
LABEL_76:
    active = (NSArray *)objc_msgSend(v32, "initWithFloat:", v33);
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("MinimumAllowedMaximumSpeakerVolumeLimit")))
  {
    v32 = objc_alloc(MEMORY[0x1E0CB37E8]);
    LODWORD(v33) = 1045220557;
    goto LABEL_76;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PhoneCallExists")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = CMSMUtility_IsPhoneCallActive();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PIDToInheritApplicationStateFrom")))
  {
    v34 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v29 = -[MXSystemController pidToInheritAppStateFrom](self, "pidToInheritAppStateFrom");
    v28 = v34;
    goto LABEL_57;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PlayingSessionsDescription")))
  {
    active = (NSArray *)CMSMNotificationUtility_CreatePlayingSessionsDescription();
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("RecommendedMaximumSpeakerVolumeLimit")))
  {
    v32 = objc_alloc(MEMORY[0x1E0CB37E8]);
    LODWORD(v33) = 0.5;
    goto LABEL_76;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("DuckScalarForVoiceOver")))
  {
    if (!MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled())
      return -12981;
    if (-[MXSystemController hasEntitlementToSetRelativeVoiceOverVolume](self, "hasEntitlementToSetRelativeVoiceOverVolume"))
    {
      v35 = objc_alloc(MEMORY[0x1E0CB37E8]);
      -[MXSessionManager duckScalarForVoiceOver](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "duckScalarForVoiceOver");
      v32 = v35;
      goto LABEL_76;
    }
    return -12988;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("RecordingClientPIDs")))
  {
    ScreenType = -[MXSessionManager recordingClientPIDs](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "recordingClientPIDs");
    goto LABEL_29;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("RecordingSessionsDescription")))
  {
    active = (NSArray *)CMSMNotificationUtility_CreateRecordingSessionsDescription();
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ShouldIgnorePlayCommandsFromAccessory")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = CMSMUtility_ShouldIgnorePlayCommandsFromAccessory();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SilentModeEnabled")))
  {
    if (-[MXSystemController hasEntitlementForSilentModeNotifications](self, "hasEntitlementForSilentModeNotifications")|| -[MXSystemController hasEntitlementToSetSilentMode](self, "hasEntitlementToSetSilentMode"))
    {
      v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
      v17 = -[MXSessionManager silentModeEnabled](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "silentModeEnabled");
      goto LABEL_15;
    }
    v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return -12988;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SomeClientIsPlaying")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = CMSMUtility_SomeClientIsPlaying();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SomeClientIsPlayingLongFormAudio")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = CMSMUtility_SomeClientIsPlayingLongFormAudio();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SomeLongFormVideoClientIsActiveOverAirPlayVideo")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = CMSMUtility_IsAnyLongFormVideoSessionActiveOverAirPlayVideo();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SomeLongFormVideoClientIsPlaying")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = CMSMUtility_IsAnyLongFormVideoSessionPlaying();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SomeLongFormVideoClientIsPlayingOverAirPlayVideo")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = CMSMUtility_IsAnyLongFormVideoSessionPlayingOverAirPlayVideo();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SomeRecordingSessionPresentThatDisallowsSystemSounds")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = CMSMUtility_IsSomeRecordingSessionPresentThatDisallowsSystemSounds();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlerts")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = CMSMUtility_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlerts();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("StarkMainAudioIsOwnedByiOSButBorrowedByCar")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v17 = -[MXSessionManager starkMainAudioIsOwnedByiOSButBorrowedByCar](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "starkMainAudioIsOwnedByiOSButBorrowedByCar");
    goto LABEL_15;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SystemHasAudioInputDevice")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = vaemSystemHasAudioInputDevice();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SystemHasAudioInputDeviceExcludingBluetooth")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = vaemSystemHasAudioInputDeviceExcludingBluetooth();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SystemIsAnAppleTV")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = CMSMDeviceState_ItsAnAppleTV();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("UplinkMute")))
  {
    if (!MX_FeatureFlags_IsSessionBasedMutingEnabled())
    {
      v40 = MX_FeatureFlags_IsCallManagementMuteControlEnabled();
      v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
      v41 = +[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance");
      if (v40)
        v17 = -[MXSessionManager uplinkMuteSetByClient](v41, "uplinkMuteSetByClient");
      else
        v17 = -[MXSessionManager uplinkMute](v41, "uplinkMute");
      goto LABEL_15;
    }
    v37 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    MXSimulateCrash((uint64_t)"This is unexpected. Please file a radar to MediaExperience (New Bugs) | All.");
    return -12984;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("VibeIntensity")))
  {
    v38 = PVMGetVibeIntensityPreference();
LABEL_129:
    v39 = v38;
    v32 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v33 = v39;
    goto LABEL_76;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("VoicePromptStyle")))
  {
    ScreenType = (NSArray *)CMSMUtility_GetVoicePromptStyle();
    goto LABEL_29;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("RemoteDeviceIDs")))
  {
    ScreenType = -[NSSet allObjects](-[MXSystemController remoteDeviceIDs](self, "remoteDeviceIDs"), "allObjects");
    goto LABEL_29;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("WombatEnabled")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v17 = -[MXSessionManager wombatEnabled](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "wombatEnabled");
    goto LABEL_15;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("ActiveAudioRoute")) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentlyActiveRoute")))
  {
    cmsmUpdateCurrentActiveRoutesInfo();
    ScreenType = (NSArray *)CMSMUtility_GetCurrentRouteTypeAtIndex(0);
    goto LABEL_29;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ActiveClientPIDsThatHideTheSpeechDetectionDevice")))
  {
    active = (NSArray *)CMSMUtility_CopyActiveClientPIDsThatHideTheSpeechDetectionDevice();
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ActiveInputRouteForPlayAndRecordNoBluetooth")))
  {
    CurrentlyAirPlayingVideoStreamsDictionary = vaemCopyActiveInputRouteNamesForRouteConfiguration((NSDictionary *)CFSTR("PlayAndRecord"), (uint64_t)CFSTR("Default"), 0);
    v12 = (id)objc_msgSend(CurrentlyAirPlayingVideoStreamsDictionary, "firstObject");
    goto LABEL_6;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AvailableVirtualAudioDevices")))
  {
    active = (NSArray *)vaemCopyAvailableVADUIDs();
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CallScreeningStatus")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = vaemGetCallScreeningStatus();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ContinuityScreenOutputPortAvailable")))
  {
    if (MX_FeatureFlags_IsOnenessEnabled())
      IsContinuityScreenOutputPortPresentInConnectedOutputPorts = vaemIsContinuityScreenOutputPortPresentInConnectedOutputPorts();
    else
      IsContinuityScreenOutputPortPresentInConnectedOutputPorts = 0;
    v18 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v16 = IsContinuityScreenOutputPortPresentInConnectedOutputPorts;
    goto LABEL_17;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentPhoneCallIsRoutedViaCarBT")))
  {
    active = (NSArray *)CMSMUtility_CopyCurrentPhoneCallIsRoutedViaCarBT();
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentPlayingSessionIsRoutedViaCarBT")))
  {
    active = (NSArray *)CMSMUtility_CopyCurrentPlayingSessionIsRoutedViaCarBT();
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentPrimaryAppDisplayID")))
  {
    active = (NSArray *)MX_FrontBoardServcies_CopyPrimaryAppDisplayID();
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentRouteHasVolumeControl")))
  {
    active = (NSArray *)CMSMUtility_CopyCurrentRouteHasVolumeControl();
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("DownlinkMute")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = vaemGetDownlinkMute();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("FullMute")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = vaemGetFullMute();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("HeadphoneVolumeLimit")))
  {
    v38 = PVMGetVolumeLimit();
    goto LABEL_129;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PickableRoutes")))
  {
    CurrentlyAirPlayingVideoStreamsDictionary = CMSMUtility_CopyPickableRoutes();
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", CurrentlyAirPlayingVideoStreamsDictionary, 1);
    goto LABEL_6;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PickedRoute")))
  {
    active = (NSArray *)cmsmDeepCopyPickedRoute();
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SpeechDetectionDevicePresent")))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    IsSuspended = vaemSpeechDetectionVADExists();
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ThermalControlInfo")))
  {
    active = (NSArray *)vaemCopyThermalControlInfo();
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ThermalGainAdjustment_Haptics")))
  {
    active = (NSArray *)vaemCopyThermalGainAdjustment_Haptics();
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ThermalGainAdjustment_Speaker")))
  {
    active = (NSArray *)vaemCopyThermalGainAdjustment_Speaker();
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("TopOfNowPlayingAppStackDisplayID")))
  {
    active = -[MXNowPlayingAppManager copyTopOfNowPlayingAppStack](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "copyTopOfNowPlayingAppStack");
    goto LABEL_18;
  }
  return -12984;
}

- (int)copyAttributeForKey:(id)a3 withValueOut:(void *)a4
{
  uint64_t UpTimeNanoseconds;
  int v8;
  NSObject *v9;
  int v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  if (+[MXSystemController isNonSerializedCopyProperty:](MXSystemController, "isNonSerializedCopyProperty:", a3))
  {
    v8 = -[MXSystemController copyAttributeForKeyInternal:withValueOut:](self, "copyAttributeForKeyInternal:withValueOut:", a3, a4);
    *((_DWORD *)v14 + 6) = v8;
  }
  else
  {
    v9 = MXGetSerialQueue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__MXSystemController_copyAttributeForKey_withValueOut___block_invoke;
    v12[3] = &unk_1E3098CF0;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = &v13;
    v12[7] = a4;
    MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController copyAttributeForKey:withValueOut:]", (uint64_t)"MXSystemController_Embedded.m", 1148, 0, 0, v9, (uint64_t)v12);
  }
  -[MXAudioStatistics sendSinglePerformanceMessageForRoutine:operationTime:details:](+[MXAudioStatistics sharedInstance](MXAudioStatistics, "sharedInstance"), "sendSinglePerformanceMessageForRoutine:operationTime:details:", "-[MXSystemController copyAttributeForKey:withValueOut:]", FigGetUpTimeNanoseconds() - UpTimeNanoseconds, a3);
  v10 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v10;
}

+ (BOOL)isNonSerializedCopyProperty:(id)a3
{
  return objc_msgSend((id)gMXSystemControllerNonSerializedCopyProperties, "containsObject:", a3);
}

- (int)performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpDuration:(float)a10 rampDownDuration:(float)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16 retainFullMute:(BOOL)a17
{
  NSObject *v27;
  _QWORD v29[16];
  unsigned int v30;
  float v31;
  float v32;
  float v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;

  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v27 = MXGetSerialQueue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __223__MXSystemController_performVolumeOperation_volume_category_mode_routeName_routeDeviceIdentifier_routeSubtype_rampUpDuration_rampDownDuration_outVolume_outSequenceNumber_outMuted_outCategoryCopy_outModeCopy_retainFullMute___block_invoke;
  v29[3] = &unk_1E309C448;
  v30 = a3;
  v29[4] = self;
  v29[5] = a5;
  v29[6] = a6;
  v29[7] = a7;
  v29[8] = a8;
  v29[9] = a9;
  v31 = a4;
  v32 = a10;
  v33 = a11;
  v29[10] = &v35;
  v29[11] = a12;
  v29[12] = a13;
  v29[13] = a14;
  v29[14] = a15;
  v29[15] = a16;
  v34 = a17;
  MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController performVolumeOperation:volume:category:mode:routeName:routeDeviceIdentifier:routeSubtype:rampUpDuration:rampDownDuration:outVolume:outSequenceNumber:outMuted:outCategoryCopy:outModeCopy:retainFullMute:]", (uint64_t)"MXSystemController_Embedded.m", 725, 0, 0, v27, (uint64_t)v29);
  LODWORD(a9) = *((_DWORD *)v36 + 6);
  _Block_object_dispose(&v35, 8);
  return (int)a9;
}

- (int)setAttributeForKey:(id)a3 andValue:(const void *)a4
{
  uint64_t UpTimeNanoseconds;
  int v8;
  NSObject *v9;
  int v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  if (+[MXSystemController isNonSerializedSetProperty:](MXSystemController, "isNonSerializedSetProperty:", a3))
  {
    v8 = -[MXSystemController setAttributeForKeyInternal:andValue:](self, "setAttributeForKeyInternal:andValue:", a3, a4);
    *((_DWORD *)v14 + 6) = v8;
  }
  else
  {
    v9 = MXGetSerialQueue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__MXSystemController_setAttributeForKey_andValue___block_invoke;
    v12[3] = &unk_1E3098CF0;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = &v13;
    v12[7] = a4;
    MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController setAttributeForKey:andValue:]", (uint64_t)"MXSystemController_Embedded.m", 1178, 0, 0, v9, (uint64_t)v12);
  }
  -[MXAudioStatistics sendSinglePerformanceMessageForRoutine:operationTime:details:](+[MXAudioStatistics sharedInstance](MXAudioStatistics, "sharedInstance"), "sendSinglePerformanceMessageForRoutine:operationTime:details:", "-[MXSystemController setAttributeForKey:andValue:]", FigGetUpTimeNanoseconds() - UpTimeNanoseconds, a3);
  v10 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v10;
}

+ (BOOL)isNonSerializedSetProperty:(id)a3
{
  return objc_msgSend((id)gMXSystemControllerNonSerializedSetProperties, "containsObject:", a3);
}

- (int)setAttributeForKeyInternal:(id)a3 andValue:(const void *)a4
{
  int refreshed;
  NSString *v8;
  __int128 v10;
  const __CFAllocator *v11;
  __SecTask *v12;
  CFStringRef v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  unsigned int v33;
  unsigned int v34;
  NSString *v35;
  float v36;
  float v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v44;
  const __CFNumber *Value;
  _BOOL4 v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  int v51;
  int v52;
  MXSessionManager *v53;
  double v54;
  int v55;
  NSObject *v56;
  float v57;
  float v58;
  uint64_t VolumeSequenceNumber;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  float v64;
  float v65;
  NSObject *v66;
  MXSessionManager *v67;
  __int128 v68;
  audit_token_t *p_token;
  uint64_t v70;
  uint64_t v71;
  _QWORD block[5];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  os_log_type_t type;
  unsigned int v78;
  audit_token_t token;
  _BYTE v80[128];
  audit_token_t valuePtr[4];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AirPlayScreenSuspended")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      refreshed = objc_msgSend((id)a4, "BOOLValue");
      v8 = -[MXSessionManager systemMirroringRoutingContextUUID](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "systemMirroringRoutingContextUUID");
      if (refreshed)
      {
        FigRoutingManagerSuspendCurrentEndpointScreen((uint64_t)v8);
        return 0;
      }
      FigRoutingManagerResumeCurrentEndpointScreen((uint64_t)v8);
      return refreshed;
    }
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AllowAppToFadeInTemporarily")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (MX_FeatureFlags_IsHandoffEnabled())
      {
        -[MXSessionManager setAppAllowedToFadeInTemporarily:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "setAppAllowedToFadeInTemporarily:", a4);
        cmsmStartAllowedToFadeInTemporarilyTimer();
      }
      return 0;
    }
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AllowAppToInitiatePlaybackTemporarily")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MXSessionManager setAppAllowedToInitiatePlaybackTemporarily:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "setAppAllowedToInitiatePlaybackTemporarily:", a4);
      cmsmStartAllowedToInitiatePlaybackTemporarilyTimer();
      return 0;
    }
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AllowAppToInitiateRecordingTemporarily")))
  {
    if (-[MXSystemController hasEntitlementToInitiateRecordingTemporarily](self, "hasEntitlementToInitiateRecordingTemporarily"))
    {
      if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[MXSessionManager setAppAllowedToInitiateRecordingTemporarily:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "setAppAllowedToInitiateRecordingTemporarily:", a4);
        return 0;
      }
    }
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AppWantsVolumeChanges")))
  {
    -[MXSystemController setAppWantsVolumeChanges:](self, "setAppWantsVolumeChanges:", objc_msgSend((id)a4, "BOOLValue"));
    return 0;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CarSpeechStateChanged")))
  {
    if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (objc_msgSend((id)a4, "BOOLValue"))
        CMSMNotificationUtility_PostVoicePromptStyleDidChange();
      return 0;
    }
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ClientAuditToken")))
  {
    if (a4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MXSystemController setAuditToken:](self, "setAuditToken:", a4);
        *(_QWORD *)&v10 = -1;
        *((_QWORD *)&v10 + 1) = -1;
        *(_OWORD *)valuePtr[0].val = v10;
        *(_OWORD *)&valuePtr[0].val[4] = v10;
        objc_msgSend((id)a4, "getBytes:length:", valuePtr, 32);
        v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        token = valuePtr[0];
        v12 = SecTaskCreateWithAuditToken(v11, &token);
        v13 = SecTaskCopySigningIdentifier(v12, 0);
        -[MXSystemController setBundleID:](self, "setBundleID:", v13);
        -[MXSystemController setHasEntitlementForPIDInheritance:](self, "setHasEntitlementForPIDInheritance:", 0);
        v14 = (void *)SecTaskCopyValueForEntitlement(v12, CFSTR("com.apple.UIKit.vends-view-services"), 0);
        if ((objc_msgSend(v14, "BOOLValue") & 1) != 0
          || (v14,
              v14 = (void *)SecTaskCopyValueForEntitlement(v12, CFSTR("com.apple.private.coremedia.pidinheritance.allow"), 0), objc_msgSend(v14, "BOOLValue")))
        {
          -[MXSystemController setHasEntitlementForPIDInheritance:](self, "setHasEntitlementForPIDInheritance:", 1);
        }

        v15 = -[MXSystemController clientPID](self, "clientPID");
        if (v15 != getpid())
        {
          v16 = (void *)SecTaskCopyValueForEntitlement(v12, CFSTR("com.apple.private.mediaexperience.allowwombatenabled"), 0);
          -[MXSystemController setHasEntitlementToEnableWombat:](self, "setHasEntitlementToEnableWombat:", objc_msgSend(v16, "BOOLValue"));

          v17 = (void *)SecTaskCopyValueForEntitlement(v12, CFSTR("com.apple.private.mediaexperience.setsilentmode.allow"), 0);
          -[MXSystemController setHasEntitlementToSetSilentMode:](self, "setHasEntitlementToSetSilentMode:", objc_msgSend(v17, "BOOLValue"));

          v18 = (void *)SecTaskCopyValueForEntitlement(v12, CFSTR("com.apple.private.mediaexperience.silentmodenotifications.allow"), 0);
          -[MXSystemController setHasEntitlementForSilentModeNotifications:](self, "setHasEntitlementForSilentModeNotifications:", objc_msgSend(v18, "BOOLValue"));

          v19 = (void *)SecTaskCopyValueForEntitlement(v12, CFSTR("com.apple.private.mediaexperience.allowvoiprecording"), 0);
          -[MXSystemController setHasEntitlementToInitiateRecordingTemporarily:](self, "setHasEntitlementToInitiateRecordingTemporarily:", objc_msgSend(v19, "BOOLValue"));

          if (!-[MXSystemController hasEntitlementToInitiateRecordingTemporarily](self, "hasEntitlementToInitiateRecordingTemporarily"))
          {
            v20 = (void *)SecTaskCopyValueForEntitlement(v12, CFSTR("com.apple.private.mediaexperience.allowrecordingtemporarily"), 0);
            -[MXSystemController setHasEntitlementToInitiateRecordingTemporarily:](self, "setHasEntitlementToInitiateRecordingTemporarily:", objc_msgSend(v20, "BOOLValue"));

          }
          v21 = (void *)SecTaskCopyValueForEntitlement(v12, CFSTR("com.apple.private.mediaexperience.clearmutestatecache.allow"), 0);
          -[MXSystemController setHasEntitlementToClearCacheForFirstPartyPhoneCalls:](self, "setHasEntitlementToClearCacheForFirstPartyPhoneCalls:", objc_msgSend(v21, "BOOLValue"));

          if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled())
          {
            v22 = (void *)SecTaskCopyValueForEntitlement(v12, CFSTR("com.apple.private.mediaexperience.relativevoiceovervolume.allow"), 0);
            -[MXSystemController setHasEntitlementToSetRelativeVoiceOverVolume:](self, "setHasEntitlementToSetRelativeVoiceOverVolume:", v22 != 0);

          }
        }
        if (v12)
          CFRelease(v12);
        if (v13)
          CFRelease(v13);
        return 0;
      }
    }
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NowPlayingAppShouldResumeForCarPlay")))
  {
    if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[MXSessionManager nowPlayingAppShouldResumeForCarPlay:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "nowPlayingAppShouldResumeForCarPlay:", objc_msgSend((id)a4, "BOOLValue"));
      return 0;
    }
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PostInterruptionEndedNotification")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return FigSignalErrorAt();
    v23 = objc_msgSend((id)objc_msgSend((id)a4, "objectForKey:", CFSTR("AudioSessionID")), "unsignedIntValue");
    v24 = objc_msgSend((id)objc_msgSend((id)a4, "objectForKey:", CFSTR("IsResumable")), "BOOLValue");
    if (dword_1EE2B3EB0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return CMSMUtility_PostInterruptionEndedNotificationForAudioSessionID(v23, v24);
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("StarkMainAudioIsOwnedByiOSButBorrowedByCar")))
  {
    if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[MXSessionManager setStarkMainAudioIsOwnedByiOSButBorrowedByCar:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "setStarkMainAudioIsOwnedByiOSButBorrowedByCar:", objc_msgSend((id)a4, "BOOLValue"));
      return 0;
    }
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SubscribeToNotifications")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      refreshed = FigSignalErrorAt();
      if (dword_1EE2B3EB0)
      {
        v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return refreshed;
    }
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", -[MXSystemController notificationsSubscribedTo](self, "notificationsSubscribedTo"));
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v27 = objc_msgSend((id)a4, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
    if (!v27)
      goto LABEL_75;
    v28 = v27;
    v29 = *(_QWORD *)v74;
    v71 = *(_QWORD *)v74;
LABEL_58:
    v30 = 0;
    while (1)
    {
      if (*(_QWORD *)v74 != v29)
        objc_enumerationMutation((id)a4);
      v31 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v30);
      if (objc_msgSend(v31, "isEqualToString:", CFSTR("SilentModeEnabledDidChange"), p_token, v70))
      {
        if (!-[MXSystemController hasEntitlementForSilentModeNotifications](self, "hasEntitlementForSilentModeNotifications")&& !-[MXSystemController hasEntitlementToSetSilentMode](self, "hasEntitlementToSetSilentMode"))
        {
          v78 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v33 = v78;
          if (os_log_type_enabled(v32, type))
            v34 = v33;
          else
            v34 = v33 & 0xFFFFFFFE;
          if (v34)
          {
            v35 = -[MXSystemController displayID](self, "displayID");
            token.val[0] = 136315394;
            *(_QWORD *)&token.val[1] = "-[MXSystemController(InternalUse) setAttributeForKeyInternal:andValue:]";
            LOWORD(token.val[3]) = 2114;
            *(_QWORD *)((char *)&token.val[3] + 2) = v35;
            LODWORD(v70) = 22;
            p_token = &token;
            _os_log_send_and_compose_impl();
          }
          v29 = v71;
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          goto LABEL_73;
        }
        objc_msgSend(v26, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), v31);
      }
      objc_msgSend(v26, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), v31);
      if (objc_msgSend(v31, "isEqualToString:", CFSTR("EffectiveVolumeDidChange")))
      {
        objc_msgSend(v26, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("SystemVolumeDidChange"));
        objc_msgSend(v26, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("UserFullMuteDidChange"));
      }
LABEL_73:
      if (v28 == ++v30)
      {
        v28 = objc_msgSend((id)a4, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
        if (!v28)
        {
LABEL_75:
          -[MXSystemController setNotificationsSubscribedTo:](self, "setNotificationsSubscribedTo:", v26, p_token, v70);

          return 0;
        }
        goto LABEL_58;
      }
    }
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("VibeIntensity")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)a4, "floatValue");
      v37 = v36;
      if (v36 != PVMGetVibeIntensityPreference())
      {
        if (dword_1EE2B3EB0)
        {
          v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v47 = PVMSetVibeIntensityPreference(v37);
        refreshed = v47;
        if (!(_DWORD)v47)
          FigRoutingContextUtilities_LogCurrentState(v47, v48);
        return refreshed;
      }
      return 0;
    }
    return FigSignalErrorAt();
  }
  v40 = objc_msgSend(a3, "isEqualToString:", CFSTR("RemoteDeviceIDs"));
  if ((_DWORD)v40)
  {
    if (MX_FeatureFlags_IsAirPlayDaemonEnabled(v40, v41))
    {
      if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (dword_1EE2B3EB0)
        {
          v78 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", a4);
        -[MXSystemController setRemoteDeviceIDs:](self, "setRemoteDeviceIDs:", v49);

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __71__MXSystemController_InternalUse__setAttributeForKeyInternal_andValue___block_invoke;
        block[3] = &unk_1E3099900;
        block[4] = self;
        if (setAttributeForKeyInternal_andValue__onceToken == -1)
          return 0;
        dispatch_once(&setAttributeForKeyInternal_andValue__onceToken, block);
        return 0;
      }
    }
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AppToInterruptCurrentNowPlayingSession")))
  {
    if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (dword_1EE2B3EB0)
      {
        v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[MXSessionManager appToInterruptCurrentNowPlayingSession:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", p_token, v70), "appToInterruptCurrentNowPlayingSession:", a4);
      return 0;
    }
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AvailableForVoicePrompts")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a4, CFSTR("PortNumber"));
      if (Value)
      {
        valuePtr[0].val[0] = 0;
        CFNumberGetValue(Value, kCFNumberSInt32Type, valuePtr);
        v46 = CFDictionaryGetValue((CFDictionaryRef)a4, CFSTR("BTDetails_IsAvailableForVoicePrompts")) == (const void *)*MEMORY[0x1E0C9AE50];
        refreshed = vaeSetPortAvailableForVoicePrompts(valuePtr[0].val[0], v46);
        cmsmUpdatePickableRouteDescriptionLists(1);
        return refreshed;
      }
      return 0;
    }
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CallScreeningStatus")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return vaemSetCallScreeningStatus(objc_msgSend((id)a4, "BOOLValue"));
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CanBeNowPlayingApp")))
  {
    -[MXSystemController applyCanBeNowPlayingApp:](self, "applyCanBeNowPlayingApp:", a4);
    return 0;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("DownlinkMute")))
  {
    if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (!MX_FeatureFlags_IsCallManagementMuteControlEnabled())
        return vaemSetDownlinkMute(objc_msgSend((id)a4, "BOOLValue"));
      v50 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v50, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1), CFSTR("MuteCmd"));
      objc_msgSend(v50, "setObject:forKey:", a4, CFSTR("MuteValue"));
      refreshed = CMSMUtility_AudioToolboxServerRefreshMuteState();

      return refreshed;
    }
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("DuckScalarForVoiceOver")))
  {
    if (!MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled())
      return FigSignalErrorAt();
    if (!-[MXSystemController hasEntitlementToSetRelativeVoiceOverVolume](self, "hasEntitlementToSetRelativeVoiceOverVolume"))return FigSignalErrorAt();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return FigSignalErrorAt();
    objc_msgSend((id)a4, "floatValue");
    v52 = v51;
    v53 = +[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance");
    LODWORD(v54) = v52;
    -[MXSessionManager setDuckScalarForVoiceOver:](v53, "setDuckScalarForVoiceOver:", v54);
    return 0;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("FullMute")))
  {
    if (a4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        return FigSignalErrorAt();
    }
    v55 = objc_msgSend((id)a4, "BOOLValue");
    if (vaemGetFullMute() != v55)
    {
      if (dword_1EE2B3EB0)
      {
        v56 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return vaemSetFullMute();
    }
    return 0;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("HeadphoneVolumeLimit")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return FigSignalErrorAt();
    objc_msgSend((id)a4, "floatValue");
    v58 = v57;
    VolumeSequenceNumber = CMSMUtility_GetVolumeSequenceNumber();
    PVMSetVolumeLimit(VolumeSequenceNumber, v58);
    return 0;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("InterruptAudioSessionIDForHandoff")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return CMSMUtility_InterruptAudioSessionIDForHandoff(objc_msgSend((id)a4, "unsignedIntValue"));
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("MakeStarkPortRoutableForPhoneCall")))
  {
    if (a4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        return FigSignalErrorAt();
    }
    -[MXSessionManager makeStarkPortRoutableForPhoneCall:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "makeStarkPortRoutableForPhoneCall:", objc_msgSend((id)a4, "BOOLValue"));
    return 0;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("MakeStarkPortRoutableForPlayingSession")))
  {
    if (a4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        return FigSignalErrorAt();
    }
    -[MXSessionManager makeStarkPortRoutableForPlayingSession:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "makeStarkPortRoutableForPlayingSession:", objc_msgSend((id)a4, "BOOLValue"));
    return 0;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("MaximumSpeakerVolumeLimit")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (dword_1EE2B3EB0)
      {
        v60 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return 0;
    }
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("OverrideToPartnerRoute")))
  {
    if (dword_1EE2B3EB0)
    {
      v61 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return CMSMVAUtility_OverrideToPartnerPort();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PickedRoute")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MXSystemController displayID](self, "displayID");
      return cmsmActivateEndpointFromRouteDescription((const __CFDictionary *)a4);
    }
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PickedRouteWithPassword")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return FigSignalErrorAt();
    objc_msgSend((id)a4, "valueForKey:", CFSTR("RouteName"));
    if (dword_1EE2B3EB0)
    {
      v62 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend((id)objc_msgSend((id)a4, "valueForKey:", CFSTR("AVAudioRouteName"), p_token, v70), "isEqualToString:", CFSTR("AirTunes"));
    -[MXSystemController displayID](self, "displayID");
    return cmsmActivateEndpointFromRouteDescription((const __CFDictionary *)a4);
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PIDToInheritApplicationStateFrom")))
  {
    -[MXSystemController applyPIDToInheritAppStateFrom:](self, "applyPIDToInheritAppStateFrom:", a4);
    return 0;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PopNowPlayingAppStack")))
  {
    if (!MX_FeatureFlags_IsNowPlayingAppStackEnabled())
      return FigSignalErrorAt();
    +[MXNowPlayingAppManager processNowPlayingAppPIDChangeIfNeeded:](MXNowPlayingAppManager, "processNowPlayingAppPIDChangeIfNeeded:", -[MXNowPlayingAppManager resetNowPlayingAppIfNeeded:allowedToBeNowPlaying:canBeNowPlayingApp:](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "resetNowPlayingAppIfNeeded:allowedToBeNowPlaying:canBeNowPlayingApp:", 7, 0, 0));
    return 0;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("RouteAwayFromAirPlay")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (dword_1EE2B3EB0)
      {
        v63 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CMSMAP_DisconnectAllAirPlaySessions(1);
      return 0;
    }
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ThermalControlInfo")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return vaemSetThermalControlInfo((uint64_t)a4);
    return FigSignalErrorAt();
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ThermalGainAdjustment_Haptics")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return FigSignalErrorAt();
    objc_msgSend(a3, "floatValue");
    vaemUpdateHapticsThermalGainAdjustment(v64);
    return 0;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ThermalGainAdjustment_Speaker")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return FigSignalErrorAt();
    objc_msgSend(a3, "floatValue");
    vaemUpdateSpeakerThermalGainAdjustment(v65);
    return 0;
  }
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("UplinkMute")))
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("WombatEnabled")))
    {
      if (!-[MXSystemController hasEntitlementToEnableWombat](self, "hasEntitlementToEnableWombat"))
        return FigSignalErrorAt();
      -[MXSessionManager setWombatEnabled:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "setWombatEnabled:", objc_msgSend((id)a4, "BOOLValue"));
    }
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return FigSignalErrorAt();
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    v66 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    MXSimulateCrash((uint64_t)"This is unexpected. Please file a radar to MediaExperience (New Bugs) | All.");
    return -12984;
  }
  if (MX_FeatureFlags_IsCallManagementMuteControlEnabled())
  {
    v67 = +[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance");
    *(_QWORD *)&v68 = -1;
    *((_QWORD *)&v68 + 1) = -1;
    *(_OWORD *)valuePtr[0].val = v68;
    *(_OWORD *)&valuePtr[0].val[4] = v68;
    return -[MXSessionManager updateMuteState:muteValue:](v67, "updateMuteState:muteValue:", valuePtr, a4);
  }
  return vaemSetUplinkMute(objc_msgSend((id)a4, "BOOLValue"));
}

- (void)setNotificationsSubscribedTo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

+ (void)notifyAll:(id)a3 payload:(id)a4 dontPostIfSuspended:(BOOL)a5 remoteDeviceID:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  _QWORD v13[7];
  BOOL v14;

  v10 = a3;
  v11 = a4;
  v12 = MXGetNotificationSenderQueue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__MXSystemController_InternalUse__notifyAll_payload_dontPostIfSuspended_remoteDeviceID___block_invoke;
  v13[3] = &unk_1E309C4C0;
  v13[4] = a6;
  v13[5] = a3;
  v14 = a5;
  v13[6] = a4;
  MXDispatchAsync((uint64_t)"+[MXSystemController(InternalUse) notifyAll:payload:dontPostIfSuspended:remoteDeviceID:]", (uint64_t)"MXSystemController_Embedded.m", 2880, 0, 0, v12, (uint64_t)v13);
}

+ (void)notifyAll:(id)a3 payload:(id)a4 dontPostIfSuspended:(BOOL)a5
{
  +[MXSystemController notifyAll:payload:dontPostIfSuspended:remoteDeviceID:](MXSystemController, "notifyAll:payload:dontPostIfSuspended:remoteDeviceID:", a3, a4, a5, 0);
}

- (void)setHasEntitlementForPIDInheritance:(BOOL)a3
{
  self->_hasEntitlementForPIDInheritance = a3;
}

- (void)setHasEntitlementToSetSilentMode:(BOOL)a3
{
  self->_hasEntitlementToSetSilentMode = a3;
}

- (void)setHasEntitlementToInitiateRecordingTemporarily:(BOOL)a3
{
  self->_hasEntitlementToInitiateRecordingTemporarily = a3;
}

- (void)setHasEntitlementToEnableWombat:(BOOL)a3
{
  self->_hasEntitlementToEnableWombat = a3;
}

- (void)setHasEntitlementToClearCacheForFirstPartyPhoneCalls:(BOOL)a3
{
  self->_hasEntitlementToClearCacheForFirstPartyPhoneCalls = a3;
}

- (void)setHasEntitlementForSilentModeNotifications:(BOOL)a3
{
  self->_hasEntitlementForSilentModeNotifications = a3;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setAuditToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

uint64_t __55__MXSystemController_copyAttributeForKey_withValueOut___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "copyAttributeForKeyInternal:withValueOut:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __223__MXSystemController_performVolumeOperation_volume_category_mode_routeName_routeDeviceIdentifier_routeSubtype_rampUpDuration_rampDownDuration_outVolume_outSequenceNumber_outMuted_outCategoryCopy_outModeCopy_retainFullMute___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t result;
  uint64_t v6;

  LODWORD(a2) = *(_DWORD *)(a1 + 132);
  LODWORD(a3) = *(_DWORD *)(a1 + 136);
  LODWORD(a4) = *(_DWORD *)(a1 + 140);
  LOBYTE(v6) = *(_BYTE *)(a1 + 144);
  result = objc_msgSend(*(id *)(a1 + 32), "_performVolumeOperation:volume:category:mode:routeName:routeDeviceIdentifier:routeSubtype:rampUpDuration:rampDownDuration:outVolume:outSequenceNumber:outMuted:outCategoryCopy:outModeCopy:retainFullMute:", *(unsigned int *)(a1 + 128), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), a2, a3, a4, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), v6);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = result;
  return result;
}

- (int)_performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpDuration:(float)a10 rampDownDuration:(float)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16 retainFullMute:(BOOL)a17
{
  int v25;
  uint64_t v26;
  id v28;
  const __CFString *v29;

  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized", *(_QWORD *)&a3, a5, a6);
  if (a10 < 0.0 || a11 < 0.0)
    return -12981;
  v28 = a9;
  v25 = a11 > 0.0 && a10 > 0.0;
  v26 = -[MXSystemController clientPID](self, "clientPID", v28);
  return MXSMPerformVolumeOperation(a3, (const __CFString *)a5, a7, a8, v29, v25, v26, a12, a4, a10, a11, a14, (CFTypeRef *)a15, a13, 0, a17);
}

uint64_t __50__MXSystemController_setAttributeForKey_andValue___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setAttributeForKeyInternal:andValue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __49__MXSystemController_initWithPID_remoteDeviceID___block_invoke_2(uint64_t a1)
{
  __CFString *v2;

  v2 = (__CFString *)MX_RunningBoardServices_CopyDisplayIDForPID(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 40), "clientPID"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setDisplayID:", v2);

}

- (void)setDisplayID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)volumeCategoryAndMode:(id)a3 mode:(id)a4 outCategoryCopy:(id *)a5 outModeCopy:(id *)a6
{
  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  PVMCopyVolumeCategoryAndMode((const __CFString *)-[MXSessionManager getUncustomizedCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getUncustomizedCategory:", a3), a4, a5, a6);
}

- (MXSystemController)initWithPID:(int)a3 remoteDeviceID:(id)a4
{
  NSObject *v4;
  MXSystemController *v5;
  _QWORD v7[7];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  MXSystemController *v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__MXSystemController_initWithPID_remoteDeviceID___block_invoke;
  v7[3] = &unk_1E309C3A8;
  v7[5] = a4;
  v7[6] = &v9;
  v8 = a3;
  v7[4] = self;
  if (MX_FeatureFlags_IsOffloadACQEnabled())
  {
    __49__MXSystemController_initWithPID_remoteDeviceID___block_invoke((uint64_t)v7);
  }
  else
  {
    v4 = MXGetSerialQueue();
    MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController initWithPID:remoteDeviceID:]", (uint64_t)"MXSystemController_Embedded.m", 280, 0, 0, v4, (uint64_t)v7);
  }
  v5 = (MXSystemController *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __49__MXSystemController_initWithPID_remoteDeviceID___block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id location;
  objc_super v12;

  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)MXSystemController;
  v2 = objc_msgSendSuper2(&v12, sel_init);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v2;
  if (v2)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20) = *(_DWORD *)(a1 + 56);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
    v3 = *(_DWORD *)(a1 + 56);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = v3 == getpid();
    v4 = *(_DWORD *)(a1 + 56);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13) = v4 == getpid();
    v5 = *(_DWORD *)(a1 + 56);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 14) = v5 == getpid();
    v6 = *(_DWORD *)(a1 + 56);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 15) = v6 == getpid();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_initWeak(&location, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v7 = *(void **)(a1 + 40);
    if (v7)
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = v7;
    +[MXSystemController mxSystemControllerListAddInstance:isSidekick:](MXSystemController, "mxSystemControllerListAddInstance:isSidekick:", objc_loadWeak(&location), v7 != 0);
    v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v9 = MXGetSerialQueue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__MXSystemController_initWithPID_remoteDeviceID___block_invoke_2;
    v10[3] = &unk_1E3099018;
    v10[4] = *(_QWORD *)(a1 + 48);
    MXDispatchAsync((uint64_t)"-[MXSystemController initWithPID:remoteDeviceID:]_block_invoke", (uint64_t)"MXSystemController_Embedded.m", 265, 0, 0, v9, (uint64_t)v10);
    objc_destroyWeak(&location);
  }
}

- (MXSystemController)initWithPID:(int)a3
{
  return -[MXSystemController initWithPID:remoteDeviceID:](self, "initWithPID:remoteDeviceID:", *(_QWORD *)&a3, 0);
}

+ (void)mxSystemControllerListAddInstance:(id)a3 isSidekick:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t *v5;
  id location;

  v4 = a4;
  objc_initWeak(&location, a3);
  dispatch_semaphore_wait((dispatch_semaphore_t)gMXSystemControllerListWriteSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (v4)
  {
    v5 = &gSidekickMXSystemControllerList;
    objc_msgSend((id)gSidekickMXSystemControllerList, "addPointer:", objc_loadWeak(&location));
  }
  else
  {
    v5 = &gMXSystemControllerList;
    objc_msgSend((id)gMXSystemControllerList, "addPointer:", objc_loadWeak(&location));
  }
  objc_msgSend((id)*v5, "compact");
  dispatch_semaphore_signal((dispatch_semaphore_t)gMXSystemControllerListWriteSemaphore);
  objc_destroyWeak(&location);
}

- (void)applyCanBeNowPlayingApp:(const void *)a3
{
  int v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !CMSMUtility_FetchUIShouldIgnoreRemoteControlEvents(-[MXSystemController clientPID](self, "clientPID")))
  {
    v5 = -[MXSystemController canBeNowPlayingApp](self, "canBeNowPlayingApp");
    if (v5 != objc_msgSend((id)a3, "BOOLValue"))
    {
      -[MXSystemController setCanBeNowPlayingApp:](self, "setCanBeNowPlayingApp:", objc_msgSend((id)a3, "BOOLValue"));
      if (dword_1EE2B3EB0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[MXNowPlayingAppManager updateNowPlayingApp:session:reasonForUpdate:](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance", v7, v8), "updateNowPlayingApp:session:reasonForUpdate:", -[MXSystemController clientPID](self, "clientPID"), 0, 4);
      CMSMUtility_UpdateRoutingContextForSessionsWithPID(-[MXSystemController clientPID](self, "clientPID"));
      -[MXSessionManager updateSupportedOutputChannelLayouts](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "updateSupportedOutputChannelLayouts");
    }
  }
}

- (void)setCanBeNowPlayingApp:(BOOL)a3
{
  self->_canBeNowPlayingApp = a3;
}

+ (void)initialize
{
  if ((id)objc_opt_self() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
    if ((dword_1EE2B3EB0 & 0x100) != 0)
      dword_1EE2B3EB0 = 0;
    MXSystemControllerSetup();
    gMXSystemControllerNonSerializedCopyProperties = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ActiveNeroVisualStreamInfo"), CFSTR("ActivePhoneCallInfo"), CFSTR("AirPlayScreenSuspended"), CFSTR("AppWantsVolumeChanges"), CFSTR("CanBeNowPlayingApp"), CFSTR("CarPlayAuxStreamSupport"), CFSTR("CarPlayIsConnected"), CFSTR("CarPlayIsPlayingLongerDurationSession"), CFSTR("CarPlaySupportsMixableSiri"), CFSTR("ExternalScreenType"), CFSTR("CurrentlyActiveCategory"), CFSTR("CurrentlyActiveMode"), CFSTR("CurrentVideoStreams"), CFSTR("DeviceSupportsPiP"), CFSTR("HeadphoneJackHasInput"), CFSTR("HeadphoneJackIsConnected"), CFSTR("HighestArbitrationPriorityForTipi"),
                                                       CFSTR("iOSWillRequestToBorrowStarkMainAudio"),
                                                       CFSTR("iOSWillRequestToTakeStarkMainAudio"),
                                                       CFSTR("IsSomeoneRecording"),
                                                       CFSTR("LongFormVideoApps"),
                                                       CFSTR("MaximumSpeakerVolumeLimit"),
                                                       CFSTR("MinimumAllowedMaximumSpeakerVolumeLimit"),
                                                       CFSTR("NowPlayingAppDisplayID"),
                                                       CFSTR("NowPlayingAppIsInterrupted"),
                                                       CFSTR("NowPlayingAppIsPlaying"),
                                                       CFSTR("NowPlayingAppPID"),
                                                       CFSTR("NowPlayingAppShouldResumeForCarPlay"),
                                                       CFSTR("PhoneCallExists"),
                                                       CFSTR("PIDToInheritApplicationStateFrom"),
                                                       CFSTR("PlayingSessionsDescription"),
                                                       CFSTR("RecommendedMaximumSpeakerVolumeLimit"),
                                                       CFSTR("RecordingClientPIDs"),
                                                       CFSTR("RecordingSessionsDescription"),
                                                       CFSTR("ShouldIgnorePlayCommandsFromAccessory"),
                                                       CFSTR("SilentModeEnabled"),
                                                       CFSTR("SomeClientIsPlaying"),
                                                       CFSTR("SomeClientIsPlayingLongFormAudio"),
                                                       CFSTR("SomeLongFormVideoClientIsActiveOverAirPlayVideo"),
                                                       CFSTR("SomeLongFormVideoClientIsPlaying"),
                                                       CFSTR("SomeLongFormVideoClientIsPlayingOverAirPlayVideo"),
                                                       CFSTR("SomeRecordingSessionPresentThatDisallowsSystemSounds"),
                                                       CFSTR("SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlerts"),
                                                       CFSTR("StarkMainAudioIsOwnedByiOSButBorrowedByCar"),
                                                       CFSTR("SystemHasAudioInputDevice"),
                                                       CFSTR("SystemHasAudioInputDeviceExcludingBluetooth"),
                                                       CFSTR("SystemIsAnAppleTV"),
                                                       CFSTR("UplinkMute"),
                                                       CFSTR("VibeIntensity"),
                                                       CFSTR("VoicePromptStyle"),
                                                       CFSTR("WombatEnabled"),
                                                       CFSTR("RemoteDeviceIDs"),
                                                       0);
    gMXSystemControllerNonSerializedSetProperties = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("AirPlayScreenSuspended"), CFSTR("AllowAppToFadeInTemporarily"), CFSTR("AllowAppToInitiatePlaybackTemporarily"), CFSTR("AllowAppToInitiateRecordingTemporarily"), CFSTR("AppWantsVolumeChanges"), CFSTR("CarSpeechStateChanged"), CFSTR("ClientAuditToken"), CFSTR("NowPlayingAppShouldResumeForCarPlay"), CFSTR("PostInterruptionEndedNotification"), CFSTR("StarkMainAudioIsOwnedByiOSButBorrowedByCar"), CFSTR("SubscribeToNotifications"), CFSTR("VibeIntensity"), CFSTR("RemoteDeviceIDs"), 0);
  }
}

- (void)dealloc
{
  void *v3;
  int clientPID;
  NSObject *v5;
  objc_super v6;
  _QWORD v7[4];
  int v8;

  v3 = (void *)MEMORY[0x194035B20](self, a2);
  clientPID = self->_clientPID;
  +[MXSystemController updateMXSystemControllerList](MXSystemController, "updateMXSystemControllerList");

  self->_displayID = 0;
  self->_notificationsSubscribedTo = 0;

  self->_remoteDeviceID = 0;
  self->_remoteDeviceID = 0;

  self->_auditToken = 0;
  self->_bundleID = 0;
  v5 = MXGetSerialQueue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__MXSystemController_dealloc__block_invoke;
  v7[3] = &__block_descriptor_36_e5_v8__0l;
  v8 = clientPID;
  MXDispatchAsync((uint64_t)"-[MXSystemController dealloc]", (uint64_t)"MXSystemController_Embedded.m", 325, 0, 0, v5, (uint64_t)v7);
  v6.receiver = self;
  v6.super_class = (Class)MXSystemController;
  -[MXSystemController dealloc](&v6, sel_dealloc);
  objc_autoreleasePoolPop(v3);
}

uint64_t __29__MXSystemController_dealloc__block_invoke(uint64_t a1)
{
  return -[MXNowPlayingAppManager updateNowPlayingApp:session:reasonForUpdate:](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "updateNowPlayingApp:session:reasonForUpdate:", *(unsigned int *)(a1 + 32), 0, 0);
}

- (BOOL)phoneCallExists
{
  void *v2;
  BOOL v3;

  v2 = (void *)MEMORY[0x194035B20](self, a2);
  v3 = CMSMUtility_IsPhoneCallActive();
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (BOOL)isSomeoneRecording
{
  void *v2;
  BOOL v3;

  v2 = (void *)MEMORY[0x194035B20](self, a2);
  v3 = CMSMUtility_IsSomeClientRecording() != 0;
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (BOOL)someLongFormVideoClientIsPlaying
{
  void *v2;
  BOOL v3;

  v2 = (void *)MEMORY[0x194035B20](self, a2);
  v3 = CMSMUtility_IsAnyLongFormVideoSessionPlaying() != 0;
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (BOOL)someLongFormVideoClientIsActiveOverAirPlayVideo
{
  void *v2;
  BOOL v3;

  v2 = (void *)MEMORY[0x194035B20](self, a2);
  v3 = CMSMUtility_IsAnyLongFormVideoSessionActiveOverAirPlayVideo() != 0;
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (BOOL)someLongFormVideoClientIsPlayingOverAirPlayVideo
{
  void *v2;
  BOOL v3;

  v2 = (void *)MEMORY[0x194035B20](self, a2);
  v3 = CMSMUtility_IsAnyLongFormVideoSessionPlayingOverAirPlayVideo() != 0;
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (int)toggleInputMute
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v3;
  int v4;
  NSObject *v5;
  _QWORD v7[5];
  os_log_type_t v8;
  os_log_type_t type[4];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    if (dword_1EE2B3EB0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    MXSimulateCrash((uint64_t)"This is unexpected. Please file a radar to MediaExperience (New Bugs) | All.");
    return -15685;
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    if (MX_FeatureFlags_IsCallManagementMuteControlEnabled())
    {
      v3 = MXGetSerialQueue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __37__MXSystemController_toggleInputMute__block_invoke;
      v7[3] = &unk_1E3099018;
      v7[4] = &v10;
      MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController toggleInputMute]", (uint64_t)"MXSystemController_Embedded.m", 420, 0, 0, v3, (uint64_t)v7);
    }
    else
    {
      *((_DWORD *)v11 + 6) = -15685;
      *(_DWORD *)type = 0;
      v8 = OS_LOG_TYPE_DEFAULT;
      v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v4 = *((_DWORD *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  return v4;
}

uint64_t __37__MXSystemController_toggleInputMute__block_invoke(uint64_t a1)
{
  MXSessionManager *v2;
  __int128 v3;
  uint64_t result;
  _OWORD v5[2];

  v2 = +[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance");
  *(_QWORD *)&v3 = -1;
  *((_QWORD *)&v3 + 1) = -1;
  v5[0] = v3;
  v5[1] = v3;
  result = -[MXSessionManager updateMuteState:muteValue:](v2, "updateMuteState:muteValue:", v5, 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (int)setInputMute:(id *)a3 muteValue:(BOOL)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v7;
  __int128 v8;
  int v9;
  NSObject *v10;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  BOOL v15;
  os_log_type_t v16;
  os_log_type_t type[4];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    if (dword_1EE2B3EB0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    MXSimulateCrash((uint64_t)"This is unexpected. Please file a radar to MediaExperience (New Bugs) | All.");
    return -15685;
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    if (MX_FeatureFlags_IsCallManagementMuteControlEnabled())
    {
      v7 = MXGetSerialQueue();
      v12[1] = 3221225472;
      v8 = *(_OWORD *)&a3->var0[4];
      v13 = *(_OWORD *)a3->var0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[2] = __45__MXSystemController_setInputMute_muteValue___block_invoke;
      v12[3] = &unk_1E309C3D0;
      v12[4] = &v18;
      v14 = v8;
      v15 = a4;
      MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController setInputMute:muteValue:]", (uint64_t)"MXSystemController_Embedded.m", 449, 0, 0, v7, (uint64_t)v12);
    }
    else
    {
      *((_DWORD *)v19 + 6) = -15685;
      *(_DWORD *)type = 0;
      v16 = OS_LOG_TYPE_DEFAULT;
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v9 = *((_DWORD *)v19 + 6);
    _Block_object_dispose(&v18, 8);
  }
  return v9;
}

uint64_t __45__MXSystemController_setInputMute_muteValue___block_invoke(uint64_t a1)
{
  MXSessionManager *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t result;
  _OWORD v6[2];

  v2 = +[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance");
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
  v4 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v4;
  result = -[MXSessionManager updateMuteState:muteValue:](v2, "updateMuteState:muteValue:", v6, v3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (int)getInputMute:(id *)a3 outMuteValue:(BOOL *)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v7;
  __int128 v8;
  int v9;
  NSObject *v10;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  os_log_type_t v15;
  os_log_type_t type[4];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    if (dword_1EE2B3EB0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    MXSimulateCrash((uint64_t)"This is unexpected. Please file a radar to MediaExperience (New Bugs) | All.");
    return -15685;
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    if (MX_FeatureFlags_IsCallManagementMuteControlEnabled())
    {
      v7 = MXGetSerialQueue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __48__MXSystemController_getInputMute_outMuteValue___block_invoke;
      v12[3] = &unk_1E309C3F8;
      v8 = *(_OWORD *)&a3->var0[4];
      v13 = *(_OWORD *)a3->var0;
      v14 = v8;
      v12[4] = &v17;
      v12[5] = a4;
      MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController getInputMute:outMuteValue:]", (uint64_t)"MXSystemController_Embedded.m", 477, 0, 0, v7, (uint64_t)v12);
    }
    else
    {
      *((_DWORD *)v18 + 6) = -15685;
      *a4 = 0;
      *(_DWORD *)type = 0;
      v15 = OS_LOG_TYPE_DEFAULT;
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v9 = *((_DWORD *)v18 + 6);
    _Block_object_dispose(&v17, 8);
  }
  return v9;
}

uint64_t __48__MXSystemController_getInputMute_outMuteValue___block_invoke(uint64_t a1)
{
  MXSessionManager *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t result;
  _OWORD v6[2];

  v2 = +[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 64);
  v6[0] = *(_OWORD *)(a1 + 48);
  v6[1] = v4;
  result = -[MXSessionManager getMuteState:outMuteValue:](v2, "getMuteState:outMuteValue:", v6, v3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (int)clearUplinkMutedCache
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;
  NSObject *v5;
  int v6;
  _QWORD v8[5];
  os_log_type_t v9;
  os_log_type_t type[4];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    if (dword_1EE2B3EB0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    MXSimulateCrash((uint64_t)"This is unexpected. Please file a radar to MediaExperience (New Bugs) | All.");
    return -15685;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    if (MX_FeatureFlags_IsCallManagementMuteControlEnabled()
      && -[MXSystemController hasEntitlementToClearCacheForFirstPartyPhoneCalls](self, "hasEntitlementToClearCacheForFirstPartyPhoneCalls"))
    {
      v4 = MXGetSerialQueue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __43__MXSystemController_clearUplinkMutedCache__block_invoke;
      v8[3] = &unk_1E3099018;
      v8[4] = &v11;
      MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController clearUplinkMutedCache]", (uint64_t)"MXSystemController_Embedded.m", 505, 0, 0, v4, (uint64_t)v8);
    }
    else
    {
      *((_DWORD *)v12 + 6) = -15685;
      *(_DWORD *)type = 0;
      v9 = OS_LOG_TYPE_DEFAULT;
      v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v6 = *((_DWORD *)v12 + 6);
    _Block_object_dispose(&v11, 8);
  }
  return v6;
}

uint64_t __43__MXSystemController_clearUplinkMutedCache__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MXSessionManager clearUplinkMutedCache](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "clearUplinkMutedCache");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (int)copySessionIDsWithMuteValue:(id *)a3 muteValue:(BOOL *)a4
{
  id v6;
  MXSessionManager *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  _BOOL4 v23;
  int v24;
  int *v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id obj;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _OWORD v38[2];
  os_log_type_t type;
  unsigned int v40;
  int v41;
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  _BOOL4 v48;
  __int16 v49;
  int v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *a4 = 0;
    v6 = -[MXSessionManager copyPhoneCallBehaviorRecordingSession](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyPhoneCallBehaviorRecordingSession");
    if (objc_msgSend(v6, "prefersBluetoothAccessoryMuting"))
    {
      *a4 = objc_msgSend(v6, "isRecordingMuted") ^ 1;
      v7 = +[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance");
      if (v6)
        objc_msgSend(v6, "auditToken");
      else
        memset(v38, 0, sizeof(v38));
      obj = -[MXSessionManager copySessionsWithAuditToken:](v7, "copySessionsWithAuditToken:", v38);
      if (!objc_msgSend(obj, "count") && dword_1EE2B3EB0)
      {
        v40 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v11 = v40;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
          v12 = v11;
        else
          v12 = v11 & 0xFFFFFFFE;
        if (v12)
        {
          v41 = 136315138;
          v42 = "-[MXSystemController copySessionIDsWithMuteValue:muteValue:]";
          LODWORD(v28) = 12;
          v26 = &v41;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v30 = v6;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v51, 16, v26, v28);
      v15 = v31;
      if (v14)
      {
        v16 = v14;
        v33 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v35 != v33)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v18, "audioSessionID", v27, v29)));
            if (dword_1EE2B3EB0)
            {
              v40 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v20 = v40;
              if (os_log_type_enabled(v19, type))
                v21 = v20;
              else
                v21 = v20 & 0xFFFFFFFE;
              if (v21)
              {
                v22 = objc_msgSend(v18, "info");
                v23 = *a4;
                v24 = objc_msgSend(v18, "audioSessionID");
                v41 = 136316162;
                v42 = "-[MXSystemController copySessionIDsWithMuteValue:muteValue:]";
                v43 = 2048;
                v44 = v18;
                v45 = 2114;
                v46 = v22;
                v47 = 1024;
                v48 = v23;
                v15 = v31;
                v49 = 1024;
                v50 = v24;
                LODWORD(v29) = 44;
                v27 = &v41;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
        }
        while (v16);
      }
      *a3 = v15;
      -[MXSessionManager setAppendContextToMuteNotification:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v27, v29), "setAppendContextToMuteNotification:", 1);

      v13 = 0;
      v6 = v30;
    }
    else
    {
      -[MXSessionManager updateBluetoothFrameworkToPlayMuteChime:playRejectTone:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "updateBluetoothFrameworkToPlayMuteChime:playRejectTone:", v6, 1);
      if (dword_1EE2B3EB0)
      {
        v40 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v13 = -15687;
    }

  }
  else
  {
    if (dword_1EE2B3EB0)
    {
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return -15685;
  }
  return v13;
}

- (int)_performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpwardDuration:(id)a10 rampDownwardDuration:(id)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16
{
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  _BOOL4 v26;
  int result;

  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized", *(_QWORD *)&a3, a5, a6);
  objc_msgSend(a10, "floatValue");
  v21 = v20;
  objc_msgSend(a11, "floatValue");
  v23 = v22;
  objc_msgSend(a10, "floatValue");
  if (v24 <= 0.0)
  {
    v26 = 0;
  }
  else
  {
    objc_msgSend(a11, "floatValue");
    v26 = v25 > 0.0;
  }
  result = MXSMPerformVolumeOperation(a3, (const __CFString *)a5, a7, a8, (const __CFString *)a9, v26, -[MXSystemController clientPID](self, "clientPID"), a12, a4, v21, v23, a14, (CFTypeRef *)a15, a13, 0, 0);
  if (a16)
    *a16 = 0;
  return result;
}

- (int)performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpwardDuration:(id)a10 rampDownwardDuration:(id)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16
{
  NSObject *v24;
  _QWORD v26[18];
  unsigned int v27;
  float v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;

  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v24 = MXGetSerialQueue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __216__MXSystemController_performVolumeOperation_volume_category_mode_routeName_routeDeviceIdentifier_routeSubtype_rampUpwardDuration_rampDownwardDuration_outVolume_outSequenceNumber_outMuted_outCategoryCopy_outModeCopy___block_invoke;
  v26[3] = &unk_1E309C420;
  v27 = a3;
  v28 = a4;
  v26[4] = self;
  v26[5] = a5;
  v26[6] = a6;
  v26[7] = a7;
  v26[8] = a8;
  v26[9] = a9;
  v26[10] = a10;
  v26[11] = a11;
  v26[12] = &v29;
  v26[13] = a12;
  v26[14] = a13;
  v26[15] = a14;
  v26[16] = a15;
  v26[17] = a16;
  MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController performVolumeOperation:volume:category:mode:routeName:routeDeviceIdentifier:routeSubtype:rampUpwardDuration:rampDownwardDuration:outVolume:outSequenceNumber:outMuted:outCategoryCopy:outModeCopy:]", (uint64_t)"MXSystemController_Embedded.m", 639, 0, 0, v24, (uint64_t)v26);
  LODWORD(a9) = *((_DWORD *)v30 + 6);
  _Block_object_dispose(&v29, 8);
  return (int)a9;
}

uint64_t __216__MXSystemController_performVolumeOperation_volume_category_mode_routeName_routeDeviceIdentifier_routeSubtype_rampUpwardDuration_rampDownwardDuration_outVolume_outSequenceNumber_outMuted_outCategoryCopy_outModeCopy___block_invoke(uint64_t a1, double a2)
{
  uint64_t result;

  LODWORD(a2) = *(_DWORD *)(a1 + 148);
  result = objc_msgSend(*(id *)(a1 + 32), "_performVolumeOperation:volume:category:mode:routeName:routeDeviceIdentifier:routeSubtype:rampUpwardDuration:rampDownwardDuration:outVolume:outSequenceNumber:outMuted:outCategoryCopy:outModeCopy:", *(unsigned int *)(a1 + 144), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), a2, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = result;
  return result;
}

- (int)_performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpDuration:(float)a10 rampDownDuration:(float)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16
{
  uint64_t v24;
  double v26;
  id v27;
  double v28;
  void *v29;
  id v31;
  double v32;
  void *v33;
  int v34;

  v24 = *(_QWORD *)&a3;
  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  if (a10 < 0.0 || a11 < 0.0)
    return -12981;
  if (a10 == 0.0)
  {
    v29 = 0;
  }
  else
  {
    v27 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v28 = a10;
    v29 = (void *)objc_msgSend(v27, "initWithFloat:", v28);
  }
  if (a11 == 0.0)
  {
    v33 = 0;
  }
  else
  {
    v31 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v32 = a11;
    v33 = (void *)objc_msgSend(v31, "initWithFloat:", v32);
  }
  *(float *)&v26 = a4;
  v34 = -[MXSystemController _performVolumeOperation:volume:category:mode:routeName:routeDeviceIdentifier:routeSubtype:rampUpwardDuration:rampDownwardDuration:outVolume:outSequenceNumber:outMuted:outCategoryCopy:outModeCopy:](self, "_performVolumeOperation:volume:category:mode:routeName:routeDeviceIdentifier:routeSubtype:rampUpwardDuration:rampDownwardDuration:outVolume:outSequenceNumber:outMuted:outCategoryCopy:outModeCopy:", v24, a5, a6, a7, a8, a9, v26, v29, v33, a12, a13, a14, a15, a16);

  return v34;
}

- (int)performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpDuration:(float)a10 rampDownDuration:(float)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16
{
  NSObject *v26;
  _QWORD v28[16];
  unsigned int v29;
  float v30;
  float v31;
  float v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;

  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v26 = MXGetSerialQueue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __208__MXSystemController_performVolumeOperation_volume_category_mode_routeName_routeDeviceIdentifier_routeSubtype_rampUpDuration_rampDownDuration_outVolume_outSequenceNumber_outMuted_outCategoryCopy_outModeCopy___block_invoke;
  v28[3] = &unk_1E309C470;
  v29 = a3;
  v28[4] = self;
  v28[5] = a5;
  v28[6] = a6;
  v28[7] = a7;
  v28[8] = a8;
  v28[9] = a9;
  v30 = a4;
  v31 = a10;
  v32 = a11;
  v28[10] = &v33;
  v28[11] = a12;
  v28[12] = a13;
  v28[13] = a14;
  v28[14] = a15;
  v28[15] = a16;
  MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController performVolumeOperation:volume:category:mode:routeName:routeDeviceIdentifier:routeSubtype:rampUpDuration:rampDownDuration:outVolume:outSequenceNumber:outMuted:outCategoryCopy:outModeCopy:]", (uint64_t)"MXSystemController_Embedded.m", 824, 0, 0, v26, (uint64_t)v28);
  LODWORD(a9) = *((_DWORD *)v34 + 6);
  _Block_object_dispose(&v33, 8);
  return (int)a9;
}

uint64_t __208__MXSystemController_performVolumeOperation_volume_category_mode_routeName_routeDeviceIdentifier_routeSubtype_rampUpDuration_rampDownDuration_outVolume_outSequenceNumber_outMuted_outCategoryCopy_outModeCopy___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t result;

  LODWORD(a2) = *(_DWORD *)(a1 + 132);
  LODWORD(a3) = *(_DWORD *)(a1 + 136);
  LODWORD(a4) = *(_DWORD *)(a1 + 140);
  result = objc_msgSend(*(id *)(a1 + 32), "_performVolumeOperation:volume:category:mode:routeName:routeDeviceIdentifier:routeSubtype:rampUpDuration:rampDownDuration:outVolume:outSequenceNumber:outMuted:outCategoryCopy:outModeCopy:", *(unsigned int *)(a1 + 128), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), a2, a3, a4, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = result;
  return result;
}

- (int)_performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 outVolume:(float *)a10 outSequenceNumber:(int64_t *)a11 outMuted:(BOOL *)a12 outCategoryCopy:(id *)a13 outModeCopy:(id *)a14
{
  int result;

  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized", *(_QWORD *)&a3, a5, a6);
  result = MXSMPerformVolumeOperation(a3, (const __CFString *)a5, a7, a8, (const __CFString *)a9, 0, -[MXSystemController clientPID](self, "clientPID"), a10, a4, 0.0, 0.0, a12, (CFTypeRef *)a13, a11, 0, 0);
  if (a14)
    *a14 = 0;
  return result;
}

- (int)performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 outVolume:(float *)a10 outSequenceNumber:(int64_t *)a11 outMuted:(BOOL *)a12 outCategoryCopy:(id *)a13 outModeCopy:(id *)a14
{
  NSObject *v22;
  _QWORD v24[16];
  unsigned int v25;
  float v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;

  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v22 = MXGetSerialQueue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __176__MXSystemController_performVolumeOperation_volume_category_mode_routeName_routeDeviceIdentifier_routeSubtype_outVolume_outSequenceNumber_outMuted_outCategoryCopy_outModeCopy___block_invoke;
  v24[3] = &unk_1E309C498;
  v25 = a3;
  v26 = a4;
  v24[4] = self;
  v24[5] = a5;
  v24[6] = a6;
  v24[7] = a7;
  v24[8] = a8;
  v24[9] = a9;
  v24[10] = &v27;
  v24[11] = a10;
  v24[12] = a11;
  v24[13] = a12;
  v24[14] = a13;
  v24[15] = a14;
  MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController performVolumeOperation:volume:category:mode:routeName:routeDeviceIdentifier:routeSubtype:outVolume:outSequenceNumber:outMuted:outCategoryCopy:outModeCopy:]", (uint64_t)"MXSystemController_Embedded.m", 913, 0, 0, v22, (uint64_t)v24);
  LODWORD(a9) = *((_DWORD *)v28 + 6);
  _Block_object_dispose(&v27, 8);
  return (int)a9;
}

uint64_t __176__MXSystemController_performVolumeOperation_volume_category_mode_routeName_routeDeviceIdentifier_routeSubtype_outVolume_outSequenceNumber_outMuted_outCategoryCopy_outModeCopy___block_invoke(uint64_t a1, double a2)
{
  uint64_t result;

  LODWORD(a2) = *(_DWORD *)(a1 + 132);
  result = objc_msgSend(*(id *)(a1 + 32), "_performVolumeOperation:volume:category:mode:routeName:routeDeviceIdentifier:routeSubtype:outVolume:outSequenceNumber:outMuted:outCategoryCopy:outModeCopy:", *(unsigned int *)(a1 + 128), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), a2, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = result;
  return result;
}

- (BOOL)someSharePlayCapableCallSessionIsActive
{
  void *v2;
  BOOL v3;

  v2 = (void *)MEMORY[0x194035B20](self, a2);
  v3 = CMSMUtility_IsSharePlayCapableCallSessionActive() != 0;
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (int)applyPIDToInheritAppStateFrom:(const void *)a3
{
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return FigSignalErrorAt();
  }
  v5 = -[MXSystemController clientPID](self, "clientPID");
  if ((int)v5 < 1)
    return FigSignalErrorAt();
  v6 = (void *)MX_RunningBoardServices_CopyBundleInfoValueForKeyAndPID((uint64_t)CFSTR("CanInheritApplicationStateFromOtherProcesses"), v5);
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    return FigSignalErrorAt();
  }
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) == 0 || !-[MXSystemController hasEntitlementForPIDInheritance](self, "hasEntitlementForPIDInheritance"))
    return FigSignalErrorAt();
  -[MXSystemController setPidToInheritAppStateFrom:](self, "setPidToInheritAppStateFrom:", objc_msgSend((id)a3, "intValue"));
  +[MXSystemController mxSystemControllerListBeginIteration](MXSystemController, "mxSystemControllerListBeginIteration");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)gMXSystemControllerList;
  v9 = objc_msgSend((id)gMXSystemControllerList, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
        if (v13)
        {
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "clientPID");
          if (v14 == -[MXSystemController pidToInheritAppStateFrom](self, "pidToInheritAppStateFrom"))
          {
            if (objc_msgSend(v13, "pidToInheritAppStateFrom"))
              -[MXSystemController setPidToInheritAppStateFrom:](self, "setPidToInheritAppStateFrom:", objc_msgSend(v13, "pidToInheritAppStateFrom"));
          }
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  +[MXSystemController mxSystemControllerListEndIteration](MXSystemController, "mxSystemControllerListEndIteration");
  CMSMUtility_ApplyPIDToInheritAppStateFrom(-[MXSystemController clientPID](self, "clientPID"), -[MXSystemController pidToInheritAppStateFrom](self, "pidToInheritAppStateFrom"));
  return 0;
}

- (int)setSilentMode:(BOOL)a3 untilTime:(id)a4 reason:(id)a5 clientType:(unsigned int)a6
{
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  _QWORD v18[6];
  int v19;
  BOOL v20;
  os_log_type_t type;
  int v22;
  uint64_t v23;

  v6 = *(_QWORD *)&a6;
  v23 = *MEMORY[0x1E0C80C00];
  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  if (-[MXSystemController hasEntitlementToSetSilentMode](self, "hasEntitlementToSetSilentMode"))
  {
    if (v6 >= 0xA
      || CMSMDeviceState_DeviceHasHardwareRingerSwitch()
      && -[MXSessionManager clientTypeOverridesHardwareSwitch:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "clientTypeOverridesHardwareSwitch:", v6))
    {
      v22 = 0;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return -12981;
    }
    else
    {
      if (dword_1EE2B3EB0)
      {
        v22 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v14 = a4;
      v15 = a5;
      v16 = MXGetSerialQueue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __64__MXSystemController_setSilentMode_untilTime_reason_clientType___block_invoke;
      v18[3] = &unk_1E3098FC0;
      v20 = a3;
      v18[4] = a4;
      v18[5] = a5;
      v19 = v6;
      MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController setSilentMode:untilTime:reason:clientType:]", (uint64_t)"MXSystemController_Embedded.m", 1058, 0, 0, v16, (uint64_t)v18);
      return 0;
    }
  }
  else
  {
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return -12988;
  }
}

void __64__MXSystemController_setSilentMode_untilTime_reason_clientType___block_invoke(uint64_t a1)
{
  -[MXSessionManager updateSilentModeState:untilTime:withReason:forClientType:updateForStartup:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "updateSilentModeState:untilTime:withReason:forClientType:updateForStartup:", *(unsigned __int8 *)(a1 + 52), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), 0);

}

- (int)grantMediaEndowmentWithEnvironmentID:(id)a3 endowmentPayload:(id)a4
{
  id v7;
  NSData *v8;
  NSString *v9;
  uint64_t v10;
  int v11;

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = -[MXSystemController auditToken](self, "auditToken");
  v9 = -[MXSystemController bundleID](self, "bundleID");
  v10 = objc_msgSend(a4, "objectForKey:", CFSTR("RecordingWebsite"));
  if (v8)
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("AuditToken"));
  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("BundleID"));
  if (v10)
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("RecordingWebsite"));
  v11 = -[MXMediaEndowmentManager grantMediaEndowment:environmentID:endowmentPayload:](+[MXMediaEndowmentManager sharedInstance](MXMediaEndowmentManager, "sharedInstance"), "grantMediaEndowment:environmentID:endowmentPayload:", -[MXSystemController clientPID](self, "clientPID"), a3, v7);

  return v11;
}

- (int)revokeMediaEndowmentWithEnvironmentID:(id)a3
{
  return -[MXMediaEndowmentManager revokeMediaEndowment:environmentID:](+[MXMediaEndowmentManager sharedInstance](MXMediaEndowmentManager, "sharedInstance"), "revokeMediaEndowment:environmentID:", -[MXSystemController clientPID](self, "clientPID"), a3);
}

- (int)remoteDeviceControlIsAllowed:(unsigned int *)a3
{
  -[MXSessionManager remoteDeviceControlIsAllowed:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "remoteDeviceControlIsAllowed:", a3);
  return 0;
}

- (void)setRemoteDeviceID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSSet)remoteDeviceIDs
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRemoteDeviceIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSData)auditToken
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAppWantsVolumeChanges:(BOOL)a3
{
  self->_appWantsVolumeChanges = a3;
}

- (void)setClientPID:(int)a3
{
  self->_clientPID = a3;
}

- (BOOL)hasEntitlementForPIDInheritance
{
  return self->_hasEntitlementForPIDInheritance;
}

- (BOOL)hasEntitlementToClearCacheForFirstPartyPhoneCalls
{
  return self->_hasEntitlementToClearCacheForFirstPartyPhoneCalls;
}

- (BOOL)hasEntitlementToSetSilentMode
{
  return self->_hasEntitlementToSetSilentMode;
}

- (BOOL)hasEntitlementForSilentModeNotifications
{
  return self->_hasEntitlementForSilentModeNotifications;
}

- (void)setPidToInheritAppStateFrom:(int)a3
{
  self->_pidToInheritAppStateFrom = a3;
}

- (BOOL)hasEntitlementToInitiateRecordingTemporarily
{
  return self->_hasEntitlementToInitiateRecordingTemporarily;
}

- (BOOL)hasEntitlementToSetRelativeVoiceOverVolume
{
  return self->_hasEntitlementToSetRelativeVoiceOverVolume;
}

- (void)setHasEntitlementToSetRelativeVoiceOverVolume:(BOOL)a3
{
  self->_hasEntitlementToSetRelativeVoiceOverVolume = a3;
}

void __71__MXSystemController_InternalUse__setAttributeForKeyInternal_andValue___block_invoke(uint64_t a1)
{
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  +[MXSystemController mxSystemControllerListAddInstance:isSidekick:](MXSystemController, "mxSystemControllerListAddInstance:isSidekick:", objc_loadWeak(&location), 1);
  objc_destroyWeak(&location);
}

+ (void)dumpInfoOfMXSystemControllers
{
  uint64_t *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  BOOL v24;
  NSObject *v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  int *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  os_log_type_t type;
  unsigned int v44;
  _BYTE v45[128];
  int v46;
  const char *v47;
  __int16 v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = &sCategoryToPriorityMapForTriangle;
  if (dword_1EE2B3EB0)
  {
    v44 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  +[MXSystemController mxSystemControllerListBeginIteration](MXSystemController, "mxSystemControllerListBeginIteration", v29, v32);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = (void *)gMXSystemControllerList;
  v5 = objc_msgSend((id)gMXSystemControllerList, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (v9)
          v10 = dword_1EE2B3EB0 == 0;
        else
          v10 = 1;
        if (!v10)
        {
          v44 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v12 = v44;
          if (os_log_type_enabled(v11, type))
            v13 = v12;
          else
            v13 = v12 & 0xFFFFFFFE;
          if (v13)
          {
            v14 = objc_msgSend(v9, "info");
            v46 = 136315394;
            v47 = "+[MXSystemController(InternalUse) dumpInfoOfMXSystemControllers]";
            v48 = 2114;
            v49 = v14;
            LODWORD(v33) = 22;
            v30 = &v46;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v2 = &sCategoryToPriorityMapForTriangle;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    }
    while (v6);
  }
  if (dword_1EE2B3EB0)
  {
    v44 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v16 = v44;
    if (os_log_type_enabled(v15, type))
      v17 = v16;
    else
      v17 = v16 & 0xFFFFFFFE;
    if (v17)
    {
      v46 = 136315138;
      v47 = "+[MXSystemController(InternalUse) dumpInfoOfMXSystemControllers]";
      LODWORD(v33) = 12;
      v30 = &v46;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v18 = (void *)gSidekickMXSystemControllerList;
  v19 = objc_msgSend((id)gSidekickMXSystemControllerList, "countByEnumeratingWithState:objects:count:", &v35, v45, 16, v30, v33);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        if (v23)
          v24 = *((_DWORD *)v2 + 940) == 0;
        else
          v24 = 1;
        if (!v24)
        {
          v44 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v26 = v44;
          if (os_log_type_enabled(v25, type))
            v27 = v26;
          else
            v27 = v26 & 0xFFFFFFFE;
          if (v27)
          {
            v28 = objc_msgSend(v23, "info");
            v46 = 136315394;
            v47 = "+[MXSystemController(InternalUse) dumpInfoOfMXSystemControllers]";
            v48 = 2114;
            v49 = v28;
            LODWORD(v34) = 22;
            v31 = &v46;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v2 = &sCategoryToPriorityMapForTriangle;
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v20);
  }
  +[MXSystemController mxSystemControllerListEndIteration](MXSystemController, "mxSystemControllerListEndIteration", v31, v34);
}

+ (void)updateMXSystemControllerList
{
  dispatch_semaphore_wait((dispatch_semaphore_t)gMXSystemControllerListWriteSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)gMXSystemControllerList, "addPointer:", 0);
  objc_msgSend((id)gMXSystemControllerList, "compact");
  objc_msgSend((id)gMXSystemControllerList, "addPointer:", 0);
  objc_msgSend((id)gMXSystemControllerList, "compact");
  dispatch_semaphore_signal((dispatch_semaphore_t)gMXSystemControllerListWriteSemaphore);
}

@end
