@implementation MXSessionManagerSecure

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sSharedInstance;
}

MXSessionManagerSecure *__40__MXSessionManagerSecure_sharedInstance__block_invoke()
{
  MXSessionManagerSecure *result;

  result = objc_alloc_init(MXSessionManagerSecure);
  sharedInstance_sSharedInstance = (uint64_t)result;
  return result;
}

- (MXSessionManagerSecure)init
{
  MXSessionManagerSecure *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)MXSessionManagerSecure;
  v2 = -[MXSessionManagerSecure init](&v5, sel_init);
  if (v2)
  {
    if (CMSMDeviceState_DeviceHasExclaveCapability())
    {
      v2->mMXCoreSessionSecureList = (NSPointerArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 5);
      v2->mMXCoreSessionSecureListLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->mMXCoreSessionSecureList = 0;
  self->mMXCoreSessionSecureListLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXSessionManagerSecure;
  -[MXSessionManagerSecure dealloc](&v3, sel_dealloc);
}

- (unint64_t)addMXCoreSessionSecure:(id)a3
{
  unint64_t v4;
  id location;

  objc_initWeak(&location, a3);
  -[NSLock lock](self->mMXCoreSessionSecureListLock, "lock");
  -[NSPointerArray addPointer:](self->mMXCoreSessionSecureList, "addPointer:", objc_loadWeak(&location));
  -[NSPointerArray compact](self->mMXCoreSessionSecureList, "compact");
  v4 = -[NSPointerArray count](self->mMXCoreSessionSecureList, "count");
  -[NSLock unlock](self->mMXCoreSessionSecureListLock, "unlock");
  objc_destroyWeak(&location);
  return v4;
}

- (unint64_t)removeMXCoreSessionSecure:(id)a3
{
  unint64_t i;
  unint64_t v5;
  id location;

  objc_initWeak(&location, a3);
  -[NSLock lock](self->mMXCoreSessionSecureListLock, "lock");
  for (i = 0; i < -[NSPointerArray count](self->mMXCoreSessionSecureList, "count"); ++i)
  {
    if (objc_msgSend(-[NSPointerArray pointerAtIndex:](self->mMXCoreSessionSecureList, "pointerAtIndex:", i), "isEqual:", objc_loadWeak(&location)))
    {
      -[NSPointerArray removePointerAtIndex:](self->mMXCoreSessionSecureList, "removePointerAtIndex:", i);
      -[NSPointerArray compact](self->mMXCoreSessionSecureList, "compact");
      break;
    }
  }
  v5 = -[NSPointerArray count](self->mMXCoreSessionSecureList, "count");
  -[NSLock unlock](self->mMXCoreSessionSecureListLock, "unlock");
  objc_destroyWeak(&location);
  return v5;
}

- (id)copyMXCoreSessionSecureList
{
  void *v3;
  NSArray *v4;

  v3 = (void *)MEMORY[0x194035B20](-[NSLock lock](self->mMXCoreSessionSecureListLock, "lock"));
  v4 = -[NSPointerArray allObjects](self->mMXCoreSessionSecureList, "allObjects");
  objc_autoreleasePoolPop(v3);
  -[NSLock unlock](self->mMXCoreSessionSecureListLock, "unlock");
  return v4;
}

- (int)_beginInterruption:(id)a3 withSecTask:(__SecTask *)a4 andFlags:(unint64_t)a5
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v7;
  NSObject *v8;
  NSObject *v9;
  int v10;

  if (objc_msgSend((id)objc_msgSend(a3, "audioMode"), "isEqualToString:", CFSTR("Enrollment")))
  {
    if (CMSMUtility_IsPhoneCallActive())
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return -15685;
    }
    -[MXSessionManager interruptAllSessionsAndSystemSounds:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "interruptAllSessionsAndSystemSounds:", CFSTR("secure enrollment session is going active"));
    v7 = -[MXSessionManager updateSecureSpeakerMuteState:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "updateSecureSpeakerMuteState:", 1);
    if (v7)
    {
      v10 = v7;
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return v10;
    }
  }
  objc_msgSend(a3, "setIsActive:", 1);
  if (dword_1EE2B3F38)
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMSUtility_CreateReporterIDIfNeeded(a3);
  return -[MXAdditiveRoutingManager sendActiveSessionsInfoToVA](+[MXAdditiveRoutingManager sharedInstance](MXAdditiveRoutingManager, "sharedInstance"), "sendActiveSessionsInfoToVA");
}

- (int)_endInterruption:(id)a3 withSecTask:(__SecTask *)a4 andStatus:(id)a5
{
  int v6;
  int v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a3, "audioMode"), "isEqualToString:", CFSTR("Enrollment"))
    && (v6 = -[MXSessionManager updateSecureSpeakerMuteState:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "updateSecureSpeakerMuteState:", 0)) != 0)
  {
    v7 = v6;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    objc_msgSend(a3, "setIsActive:", 0);
    if (dword_1EE2B3F38)
    {
      v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return -[MXAdditiveRoutingManager sendActiveSessionsInfoToVA](+[MXAdditiveRoutingManager sharedInstance](MXAdditiveRoutingManager, "sharedInstance", v11, v12), "sendActiveSessionsInfoToVA");
  }
  return v7;
}

- (id)copySessionWithAudioSessionID:(unsigned int)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = -[MXSessionManagerSecure copyMXCoreSessionSecureList](self, "copyMXCoreSessionSecureList");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        if (objc_msgSend(v9, "audioSessionID") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)copyActiveSessionsInfoForAdditiveRouting
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = -[MXSessionManagerSecure copyMXCoreSessionSecureList](self, "copyMXCoreSessionSecureList");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v8, "isActive", v12, v13))
        {
          v9 = objc_msgSend(v8, "additiveRoutingInfo");
          if (v9)
          {
            objc_msgSend(v14, "addObject:", v9);
          }
          else
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return v14;
}

- (BOOL)isSessionWithAudioModeActive:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = -[MXSessionManagerSecure copyMXCoreSessionSecureList](self, "copyMXCoreSessionSecureList");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        if (objc_msgSend(v9, "isActive") && (objc_msgSend(v9, "hasAudioMode:", a3) & 1) != 0)
        {
          v10 = 1;
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

  return v10;
}

- (void)logDebugInfo
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  os_log_type_t type;
  unsigned int v23;
  _BYTE v24[128];
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B3F38)
  {
    v23 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v4 = -[MXSessionManagerSecure copyMXCoreSessionSecureList](self, "copyMXCoreSessionSecureList", v14, v16);
  v5 = CMSMUtility_CopyPrioritizedListBasedOnPlayingAndActiveState(v4);
  if (dword_1EE2B3F38)
  {
    v23 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16, v15, v17);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "logDebugInfo");
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }
  if (dword_1EE2B3F38)
  {
    v23 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v12 = v23;
    if (os_log_type_enabled(v11, type))
      v13 = v12;
    else
      v13 = v12 & 0xFFFFFFFE;
    if (v13)
    {
      v25 = 136315138;
      v26 = "-[MXSessionManagerSecure logDebugInfo]";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

}

@end
