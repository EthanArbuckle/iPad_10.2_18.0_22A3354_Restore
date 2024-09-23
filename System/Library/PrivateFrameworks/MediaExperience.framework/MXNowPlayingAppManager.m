@implementation MXNowPlayingAppManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_35);
  return (id)sharedInstance_sSharedInstance_4;
}

MXNowPlayingAppManager *__40__MXNowPlayingAppManager_sharedInstance__block_invoke()
{
  MXNowPlayingAppManager *result;

  result = objc_alloc_init(MXNowPlayingAppManager);
  sharedInstance_sSharedInstance_4 = (uint64_t)result;
  return result;
}

- (MXNowPlayingAppManager)init
{
  MXNowPlayingAppManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MXNowPlayingAppManager;
  v2 = -[MXNowPlayingAppManager init](&v4, sel_init);
  if (v2)
  {
    v2->mLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v2->_nowPlayingAppDisplayID = 0;
    v2->_nowPlayingAppStopTime = 0;
    v2->_writeNowPlayingAppToDiskTimer = 0;
    v2->mNowPlayingAppDisplayIDStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->mNowPlayingAppHostProcessAttributionBundleID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_nowPlayingAppDisplayID = 0;
  self->_nowPlayingAppStopTime = 0;

  self->_writeNowPlayingAppToDiskTimer = 0;
  self->mNowPlayingAppDisplayIDStack = 0;

  self->mNowPlayingAppHostProcessAttributionBundleID = 0;
  self->mLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXNowPlayingAppManager;
  -[MXNowPlayingAppManager dealloc](&v3, sel_dealloc);
}

- (void)setWriteNowPlayingAppToDiskTimer:(id)a3
{
  NSObject *writeNowPlayingAppToDiskTimer;
  NSObject *v6;

  -[NSLock lock](self->mLock, "lock");
  writeNowPlayingAppToDiskTimer = self->_writeNowPlayingAppToDiskTimer;
  if (writeNowPlayingAppToDiskTimer)
  {
    dispatch_source_cancel(writeNowPlayingAppToDiskTimer);
    v6 = self->_writeNowPlayingAppToDiskTimer;
    if (v6)
    {
      dispatch_release(v6);
      self->_writeNowPlayingAppToDiskTimer = 0;
    }
  }
  self->_writeNowPlayingAppToDiskTimer = (OS_dispatch_source *)a3;
  -[NSLock unlock](self->mLock, "unlock");
}

+ (void)actuallyWriteNowPlayingAppDisplayIDToDisk:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("nowPlayingAppDisplayID"), a3);
}

+ (void)processNowPlayingAppPIDChangeIfNeeded:(BOOL)a3
{
  if (a3)
  {
    CMSMUtility_UpdateSharePlayVolumeBehaviours();
    CMSMNotificationUtility_PostNowPlayingAppPIDDidChange();
    CMSMNotificationUtility_PostNowPlayingAppDidChange();
    CMSMNotificationUtility_PostSomeSessionIsPlayingDidChange();
    -[MXSessionManager updateSupportedOutputChannelLayouts](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "updateSupportedOutputChannelLayouts");
  }
  CMSMNotificationUtility_PostNowPlayingAppIsPlayingDidChange();
  CMSMNotificationUtility_PostNowPlayingAppStackDidChange();
}

+ (id)getNowPlayingAppUpdateReasonString:(unsigned int)a3
{
  if (a3 >= 8)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN reason = %d"), *(_QWORD *)&a3);
  else
    return *(&off_1E309D310 + (int)a3);
}

- (void)writeNowPlayingAppInfoToDisk
{
  NSObject *v3;

  v3 = MXGetSerialQueue();
  -[MXNowPlayingAppManager setWriteNowPlayingAppToDiskTimer:](self, "setWriteNowPlayingAppToDiskTimer:", FigRoutingManagerCreateOneShotTimer(v3, 5.0, (uint64_t)&__block_literal_global_27, 0, 0));
}

uint64_t __54__MXNowPlayingAppManager_writeNowPlayingAppInfoToDisk__block_invoke()
{
  +[MXNowPlayingAppManager actuallyWriteNowPlayingAppDisplayIDToDisk:](MXNowPlayingAppManager, "actuallyWriteNowPlayingAppDisplayIDToDisk:", -[MXNowPlayingAppManager nowPlayingAppDisplayID](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "nowPlayingAppDisplayID"));
  if (MX_FeatureFlags_IsNowPlayingAppStackEnabled())
    -[MXNowPlayingAppManager saveNowPlayingAppStackToDisk](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "saveNowPlayingAppStackToDisk");
  return -[MXNowPlayingAppManager setWriteNowPlayingAppToDiskTimer:](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "setWriteNowPlayingAppToDiskTimer:", 0);
}

- (void)resetNowPlayingAppToDefaultMusicApp
{
  -[MXNowPlayingAppManager setNowPlayingAppDisplayID:](self, "setNowPlayingAppDisplayID:", -[MXSessionManager defaultMusicApp](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "defaultMusicApp"));
  -[MXNowPlayingAppManager setNowPlayingAppPID:](self, "setNowPlayingAppPID:", 0);
  -[MXNowPlayingAppManager setNowPlayingAppStopTime:](self, "setNowPlayingAppStopTime:", 0);
}

- (void)resetNowPlayingApp:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (MX_FeatureFlags_IsNowPlayingAppStackEnabled())
  {
    v4 = -[MXNowPlayingAppManager copyTopOfNowPlayingAppStack](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "copyTopOfNowPlayingAppStack");
    -[MXNowPlayingAppManager popNowPlayingAppStack](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "popNowPlayingAppStack");
    v5 = -[MXNowPlayingAppManager copyTopOfNowPlayingAppStack](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "copyTopOfNowPlayingAppStack");
  }
  else
  {
    v4 = -[MXNowPlayingAppManager nowPlayingAppDisplayID](self, "nowPlayingAppDisplayID");
    v5 = -[MXSessionManager defaultMusicApp](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "defaultMusicApp");
    -[MXNowPlayingAppManager resetNowPlayingAppToDefaultMusicApp](self, "resetNowPlayingAppToDefaultMusicApp");
  }
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

}

- (BOOL)resetNowPlayingAppIfNeeded:(unsigned int)a3 allowedToBeNowPlaying:(BOOL)a4 canBeNowPlayingApp:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  NSString *v9;
  NSString *v10;
  int v11;
  _BOOL4 v12;
  const __CFString *v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BOOL result;
  int IsNowPlayingAppStackEnabled;

  v5 = a5;
  v6 = a4;
  v9 = -[MXNowPlayingAppManager nowPlayingAppDisplayID](self, "nowPlayingAppDisplayID");
  v10 = -[MXSessionManager defaultMusicApp](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "defaultMusicApp");
  v11 = -[NSString isEqualToString:](v9, "isEqualToString:", v10);
  if (MX_FeatureFlags_IsNowPlayingAppStackEnabled())
  {
    if (objc_msgSend(-[MXNowPlayingAppManager copyTopOfNowPlayingAppStack](self, "copyTopOfNowPlayingAppStack"), "isEqualToString:", v10))v12 = -[MXNowPlayingAppManager nowPlayingAppStackSize](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "nowPlayingAppStackSize") == 1;
    else
      v12 = 0;
    v11 &= v12;
  }
  if (!a3 || v11)
  {
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 0;
  }
  else
  {
    if (a3 == 3 && !v6)
    {
      v13 = CFSTR("of new interruption style");
LABEL_22:
      -[MXNowPlayingAppManager resetNowPlayingApp:](self, "resetNowPlayingApp:", v13);
      -[MXNowPlayingAppManager writeNowPlayingAppInfoToDisk](self, "writeNowPlayingAppInfoToDisk");
      return 1;
    }
    if (a3 == 4 && !v5)
    {
      v13 = CFSTR("of canBeNowPlayingApp changed to false");
      goto LABEL_22;
    }
    if (a3 == 2)
    {
      v13 = CFSTR("app went into background");
      goto LABEL_22;
    }
    IsNowPlayingAppStackEnabled = MX_FeatureFlags_IsNowPlayingAppStackEnabled();
    result = 0;
    if (a3 == 7 && IsNowPlayingAppStackEnabled)
    {
      v13 = CFSTR("Now Playing app stack is being popped");
      goto LABEL_22;
    }
  }
  return result;
}

- (BOOL)setIsNowPlayingApp:(int)a3
{
  uint64_t v3;
  int v5;
  id v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = *(_QWORD *)&a3;
  v12 = *MEMORY[0x1E0C80C00];
  v5 = -[MXNowPlayingAppManager nowPlayingAppPID](self, "nowPlayingAppPID");
  if (v5 != (_DWORD)v3)
  {
    -[MXNowPlayingAppManager setNowPlayingAppPID:](self, "setNowPlayingAppPID:", 0);
    v6 = -[MXSessionManager copySessionEligibleForNowPlayingAppConsideration:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copySessionEligibleForNowPlayingAppConsideration:", v3);
    if (v6)
    {
      -[MXNowPlayingAppManager setNowPlayingAppPID:](self, "setNowPlayingAppPID:", v3);
      if (!-[NSString isEqualToString:](-[MXNowPlayingAppManager nowPlayingAppDisplayID](self, "nowPlayingAppDisplayID"), "isEqualToString:", objc_msgSend(v6, "displayID")))
      {
        if (dword_1EE2B3F38)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[MXNowPlayingAppManager setNowPlayingAppDisplayID:](self, "setNowPlayingAppDisplayID:", objc_msgSend(v6, "displayID", v10, v11));
        if (MX_FeatureFlags_IsNowPlayingAppStackEnabled())
        {
          v8 = CMSUtility_CopyBundleID(v6);
          -[MXNowPlayingAppManager pushToNowPlayingAppStack:hostProcessAttributionBundleID:](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "pushToNowPlayingAppStack:hostProcessAttributionBundleID:", objc_msgSend(v6, "displayID"), v8);

        }
        -[MXNowPlayingAppManager writeNowPlayingAppInfoToDisk](self, "writeNowPlayingAppInfoToDisk");
      }
    }

  }
  return v5 != (_DWORD)v3;
}

- (void)updateNowPlayingApp:(int)a3 session:(id)a4 reasonForUpdate:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  int v8;
  void *v9;
  _BOOL8 v10;
  MXSessionManager *v11;
  _BOOL8 v12;
  unint64_t v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _BOOL8 v15;
  char v16;
  _BOOL8 v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = *(_QWORD *)&a5;
    v6 = *(_QWORD *)&a3;
    if (!-[MXNowPlayingAppManager ignoreNowPlayingAppUpdates](self, "ignoreNowPlayingAppUpdates", *(_QWORD *)&a3, a4))
    {
      v8 = -[MXNowPlayingAppManager nowPlayingAppPID](self, "nowPlayingAppPID");
      v9 = (void *)MEMORY[0x194035B20]();
      v10 = +[MXSystemController getCanBeNowPlayingAppForPID:](MXSystemController, "getCanBeNowPlayingAppForPID:", v6);
      objc_autoreleasePoolPop(v9);
      if (!v10)
      {
        -[MXSessionManager updateBadgeType:matchingPID:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "updateBadgeType:matchingPID:", CFSTR("NotApplicable"), v6);
        v11 = +[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance");
        -[MXSessionManager updateSupportedOutputChannelLayouts:matchingPID:](v11, "updateSupportedOutputChannelLayouts:matchingPID:", objc_msgSend(MEMORY[0x1E0C99D20], "array"), v6);
      }
      v12 = -[MXSessionManager isPIDAllowedToBeNowPlayingApp:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isPIDAllowedToBeNowPlayingApp:", v6);
      if (!CMSNP_IsCurrentNowPlayingSessionAirPlayingLongFormMedia()
        || CMSUtility_IsSessionWithPIDAllowedToInterruptCurrentlyAirPlayingNowPlayingSession(v6)
        || v8 == (_DWORD)v6)
      {
        v13 = 0x1EE2B0000;
        if (dword_1EE2B3F38)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v13 = 0x1EE2B0000uLL;
        }
        if (v10 && v12 || v8 != (_DWORD)v6)
        {
          v16 = !v10 || !v12;
          if (v8 == (_DWORD)v6)
            v16 = 1;
          if ((v16 & 1) != 0 || !CMSUtility_SessionWithPIDIsPlaying(v6))
          {
            v17 = 0;
            goto LABEL_20;
          }
          v15 = -[MXNowPlayingAppManager setIsNowPlayingApp:](self, "setIsNowPlayingApp:", v6);
        }
        else
        {
          -[MXNowPlayingAppManager setNowPlayingAppPID:](self, "setNowPlayingAppPID:", 0);
          v15 = -[MXNowPlayingAppManager resetNowPlayingAppIfNeeded:allowedToBeNowPlaying:canBeNowPlayingApp:](self, "resetNowPlayingAppIfNeeded:allowedToBeNowPlaying:canBeNowPlayingApp:", v5, v12, v10);
        }
        v17 = v15;
LABEL_20:
        objc_msgSend((id)(v13 + 3080), "processNowPlayingAppPIDChangeIfNeeded:", v17, v19, v20);
        if (-[MXNowPlayingAppManager nowPlayingAppPID](self, "nowPlayingAppPID") == (_DWORD)v6
          && CMSUtility_SessionWithPIDIsPlaying(v6))
        {
          if (dword_1EE2B3F38)
          {
            v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          cmsmUpdateInEarBasedPlaybackState(0, 0, 1);
        }
      }
    }
  }
}

- (unint64_t)nowPlayingAppStackSize
{
  unint64_t v3;

  -[NSLock lock](self->mLock, "lock");
  v3 = -[NSMutableArray count](self->mNowPlayingAppDisplayIDStack, "count");
  -[NSLock unlock](self->mLock, "unlock");
  return v3;
}

- (BOOL)doesNowPlayingAppStackContain:(id)a3
{
  uint64_t v5;
  id v6;
  char v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (a3)
  {
    -[NSLock lock](self->mLock, "lock");
    v5 = -[NSMutableDictionary objectForKey:](self->mNowPlayingAppHostProcessAttributionBundleID, "objectForKey:", a3);
    if (v5)
      v6 = (id)v5;
    else
      v6 = a3;
    v7 = -[NSMutableArray containsObject:](self->mNowPlayingAppDisplayIDStack, "containsObject:", v6);
    -[NSLock unlock](self->mLock, "unlock");
    return v7;
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
}

- (void)pushToNowPlayingAppStack:(id)a3 hostProcessAttributionBundleID:(id)a4
{
  unint64_t v7;
  NSMutableDictionary *mNowPlayingAppHostProcessAttributionBundleID;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  NSObject *v18;
  int *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  os_log_type_t type;
  unsigned int v26;
  int v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = -[MXNowPlayingAppManager nowPlayingAppStackSize](self, "nowPlayingAppStackSize");
    -[NSLock lock](self->mLock, "lock");
    -[NSMutableArray removeObject:](self->mNowPlayingAppDisplayIDStack, "removeObject:", a3);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    mNowPlayingAppHostProcessAttributionBundleID = self->mNowPlayingAppHostProcessAttributionBundleID;
    v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mNowPlayingAppHostProcessAttributionBundleID, "countByEnumeratingWithState:objects:count:", &v21, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(mNowPlayingAppHostProcessAttributionBundleID);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(a3, "isEqualToString:", -[NSMutableDictionary objectForKey:](self->mNowPlayingAppHostProcessAttributionBundleID, "objectForKey:", v13)))
          {
            -[NSMutableDictionary removeObjectForKey:](self->mNowPlayingAppHostProcessAttributionBundleID, "removeObjectForKey:", v13);
            goto LABEL_12;
          }
        }
        v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mNowPlayingAppHostProcessAttributionBundleID, "countByEnumeratingWithState:objects:count:", &v21, v37, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_12:
    -[NSMutableArray addObject:](self->mNowPlayingAppDisplayIDStack, "addObject:", a3);
    if (a4)
      -[NSMutableDictionary setObject:forKey:](self->mNowPlayingAppHostProcessAttributionBundleID, "setObject:forKey:", a3, a4);
    -[NSLock unlock](self->mLock, "unlock");
    if (dword_1EE2B3F38)
    {
      v26 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v15 = v26;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
        v16 = v15;
      else
        v16 = v15 & 0xFFFFFFFE;
      if (v16)
      {
        v17 = -[MXNowPlayingAppManager nowPlayingAppStackSize](self, "nowPlayingAppStackSize");
        v27 = 136316162;
        v28 = "-[MXNowPlayingAppManager pushToNowPlayingAppStack:hostProcessAttributionBundleID:]";
        v29 = 2114;
        v30 = a3;
        v31 = 2114;
        v32 = a4;
        v33 = 2048;
        v34 = v7;
        v35 = 2048;
        v36 = v17;
        LODWORD(v20) = 52;
        v19 = &v27;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (-[MXNowPlayingAppManager nowPlayingAppStackSize](self, "nowPlayingAppStackSize", v19, v20) >= 6)
      -[MXNowPlayingAppManager popNowPlayingAppStackOldestDisplayID](self, "popNowPlayingAppStackOldestDisplayID");
    -[MXNowPlayingAppManager writeNowPlayingAppInfoToDisk](self, "writeNowPlayingAppInfoToDisk");
  }
  else
  {
    v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)popNowPlayingAppStack
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v4;
  NSMutableDictionary *mNowPlayingAppHostProcessAttributionBundleID;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  os_log_type_t type;
  int v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->mLock, "lock");
  if (dword_1EE2B3F38)
  {
    v18 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[NSMutableArray count](self->mNowPlayingAppDisplayIDStack, "count", v11, v12))
  {
    v4 = (void *)-[NSMutableArray lastObject](self->mNowPlayingAppDisplayIDStack, "lastObject");
    -[NSMutableArray removeObject:](self->mNowPlayingAppDisplayIDStack, "removeObject:", v4);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    mNowPlayingAppHostProcessAttributionBundleID = self->mNowPlayingAppHostProcessAttributionBundleID;
    v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mNowPlayingAppHostProcessAttributionBundleID, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(mNowPlayingAppHostProcessAttributionBundleID);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v4, "isEqualToString:", -[NSMutableDictionary objectForKey:](self->mNowPlayingAppHostProcessAttributionBundleID, "objectForKey:", v10)))
          {
            -[NSMutableDictionary removeObjectForKey:](self->mNowPlayingAppHostProcessAttributionBundleID, "removeObjectForKey:", v10);
            goto LABEL_14;
          }
        }
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mNowPlayingAppHostProcessAttributionBundleID, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
  }
LABEL_14:
  if (!-[NSMutableArray count](self->mNowPlayingAppDisplayIDStack, "count"))
    -[NSMutableArray addObject:](self->mNowPlayingAppDisplayIDStack, "addObject:", -[MXSessionManager defaultMusicApp](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "defaultMusicApp"));
  -[MXNowPlayingAppManager setNowPlayingAppDisplayID:](self, "setNowPlayingAppDisplayID:", -[NSMutableArray lastObject](self->mNowPlayingAppDisplayIDStack, "lastObject"));
  -[MXNowPlayingAppManager setNowPlayingAppPID:](self, "setNowPlayingAppPID:", 0);
  -[MXNowPlayingAppManager setNowPlayingAppStopTime:](self, "setNowPlayingAppStopTime:", 0);
  -[NSLock unlock](self->mLock, "unlock");
  -[MXNowPlayingAppManager writeNowPlayingAppInfoToDisk](self, "writeNowPlayingAppInfoToDisk");
}

- (void)removeFromNowPlayingAppStack:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[NSLock lock](self->mLock, "lock");
    v5 = -[NSMutableArray lastObject](self->mNowPlayingAppDisplayIDStack, "lastObject");
    v6 = -[NSMutableDictionary objectForKey:](self->mNowPlayingAppHostProcessAttributionBundleID, "objectForKey:", a3);
    if (v6)
      v7 = (id)v6;
    else
      v7 = a3;
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[NSMutableArray removeObject:](self->mNowPlayingAppDisplayIDStack, "removeObject:", v7, v12, v13);
    -[NSMutableDictionary removeObjectForKey:](self->mNowPlayingAppHostProcessAttributionBundleID, "removeObjectForKey:", a3);
    if (!-[NSMutableArray count](self->mNowPlayingAppDisplayIDStack, "count"))
      -[NSMutableArray addObject:](self->mNowPlayingAppDisplayIDStack, "addObject:", -[MXSessionManager defaultMusicApp](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "defaultMusicApp"));
    v10 = (void *)-[NSMutableArray lastObject](self->mNowPlayingAppDisplayIDStack, "lastObject");
    v11 = objc_msgSend(v10, "isEqualToString:", v5);
    if ((v11 & 1) == 0)
    {
      -[MXNowPlayingAppManager setNowPlayingAppDisplayID:](self, "setNowPlayingAppDisplayID:", v10);
      -[MXNowPlayingAppManager setNowPlayingAppPID:](self, "setNowPlayingAppPID:", 0);
      -[MXNowPlayingAppManager setNowPlayingAppStopTime:](self, "setNowPlayingAppStopTime:", 0);
    }
    -[NSLock unlock](self->mLock, "unlock");
    +[MXNowPlayingAppManager processNowPlayingAppPIDChangeIfNeeded:](MXNowPlayingAppManager, "processNowPlayingAppPIDChangeIfNeeded:", v11 ^ 1u);
    -[MXNowPlayingAppManager writeNowPlayingAppInfoToDisk](self, "writeNowPlayingAppInfoToDisk");
  }
  else
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)populateNowPlayingAppStack:(id)a3 hostProcessAttributionBundleID:(id)a4
{
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(a3);
        -[MXNowPlayingAppManager pushToNowPlayingAppStack:hostProcessAttributionBundleID:](self, "pushToNowPlayingAppStack:hostProcessAttributionBundleID:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10), objc_msgSend(a4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10)));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
  if (!-[MXNowPlayingAppManager nowPlayingAppStackSize](self, "nowPlayingAppStackSize"))
    -[MXNowPlayingAppManager pushToNowPlayingAppStack:hostProcessAttributionBundleID:](self, "pushToNowPlayingAppStack:hostProcessAttributionBundleID:", -[MXSessionManager defaultMusicApp](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "defaultMusicApp"), 0);
  -[MXNowPlayingAppManager writeNowPlayingAppInfoToDisk](self, "writeNowPlayingAppInfoToDisk");
}

- (void)popNowPlayingAppStackOldestDisplayID
{
  uint64_t v3;

  -[NSLock lock](self->mLock, "lock");
  v3 = -[NSMutableArray objectAtIndex:](self->mNowPlayingAppDisplayIDStack, "objectAtIndex:", 0);
  -[NSMutableDictionary removeObjectForKey:](self->mNowPlayingAppHostProcessAttributionBundleID, "removeObjectForKey:", v3);
  -[NSMutableArray removeObject:](self->mNowPlayingAppDisplayIDStack, "removeObject:", v3);
  -[NSLock unlock](self->mLock, "unlock");
}

- (id)copyTopOfNowPlayingAppStack
{
  id v3;

  -[NSLock lock](self->mLock, "lock");
  v3 = (id)-[NSMutableArray lastObject](self->mNowPlayingAppDisplayIDStack, "lastObject");
  -[NSLock unlock](self->mLock, "unlock");
  return v3;
}

- (void)saveNowPlayingAppStackToDisk
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  -[NSLock lock](self->mLock, "lock");
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("nowPlayingAppDisplayIDStack"), self->mNowPlayingAppDisplayIDStack);
  MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("nowPlayingAppHostProcessAttributionBundleID"), self->mNowPlayingAppHostProcessAttributionBundleID);
  -[NSLock unlock](self->mLock, "unlock");
}

- (void)clearNowPlayingAppStack
{
  -[NSLock lock](self->mLock, "lock");
  -[NSMutableArray removeAllObjects](self->mNowPlayingAppDisplayIDStack, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->mNowPlayingAppHostProcessAttributionBundleID, "removeAllObjects");
  -[NSLock unlock](self->mLock, "unlock");
}

- (void)updateNowPlayingAppStackFromDisk
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v4 = (void *)MXCFPreferencesCopyPreference(CFSTR("nowPlayingAppDisplayIDStack"));
  v5 = (void *)MXCFPreferencesCopyPreference(CFSTR("nowPlayingAppHostProcessAttributionBundleID"));
  -[MXNowPlayingAppManager clearNowPlayingAppStack](self, "clearNowPlayingAppStack");
  if (v4)
  {
    if (!v5)
      goto LABEL_7;
  }
  else
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (!v5)
    {
LABEL_7:
      v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  -[MXNowPlayingAppManager populateNowPlayingAppStack:hostProcessAttributionBundleID:](self, "populateNowPlayingAppStack:hostProcessAttributionBundleID:", v4, v5, v8, v9);

}

- (void)dumpNowPlayingAppInfo
{
  void *v3;
  void *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;

  -[NSLock lock](self->mLock, "lock");
  v3 = (void *)-[NSMutableArray copy](self->mNowPlayingAppDisplayIDStack, "copy");
  v4 = (void *)-[NSMutableDictionary copy](self->mNowPlayingAppHostProcessAttributionBundleID, "copy");
  -[NSLock unlock](self->mLock, "unlock");
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EE2B3F38)
    {
      v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (dword_1EE2B3F38)
      {
        v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  CMSMDebugUtility_PrintCollection(v3);
  if (dword_1EE2B3F38)
  {
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMSMDebugUtility_PrintDictionary(v4);
  if (dword_1EE2B3F38)
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

}

- (OS_dispatch_source)writeNowPlayingAppToDiskTimer
{
  return self->_writeNowPlayingAppToDiskTimer;
}

- (int)nowPlayingAppPID
{
  return self->_nowPlayingAppPID;
}

- (void)setNowPlayingAppPID:(int)a3
{
  self->_nowPlayingAppPID = a3;
}

- (NSString)nowPlayingAppDisplayID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNowPlayingAppDisplayID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)nowPlayingAppStopTime
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNowPlayingAppStopTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)ignoreNowPlayingAppUpdates
{
  return self->_ignoreNowPlayingAppUpdates;
}

- (void)setIgnoreNowPlayingAppUpdates:(BOOL)a3
{
  self->_ignoreNowPlayingAppUpdates = a3;
}

@end
