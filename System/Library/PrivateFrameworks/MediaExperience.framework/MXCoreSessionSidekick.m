@implementation MXCoreSessionSidekick

- (MXCoreSessionSidekick)initWithRemoteDeviceID:(id)a3
{
  OS_dispatch_queue *v5;
  MXCoreSessionSidekick *v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  v14 = 0;
  v5 = -[MXSessionManagerSidekick serialQueue](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "serialQueue");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__MXCoreSessionSidekick_initWithRemoteDeviceID___block_invoke;
  v8[3] = &unk_1E309CC78;
  v8[5] = a3;
  v8[6] = &v9;
  v8[4] = self;
  MXDispatchAsyncAndWait((uint64_t)"-[MXCoreSessionSidekick initWithRemoteDeviceID:]", (uint64_t)"MXCoreSessionSidekick.m", 46, 0, 0, v5, (uint64_t)v8);
  v6 = (MXCoreSessionSidekick *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __48__MXCoreSessionSidekick_initWithRemoteDeviceID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_initWithRemoteDeviceID:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (int)activate
{
  OS_dispatch_queue *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = -[MXSessionManagerSidekick serialQueue](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "serialQueue");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__MXCoreSessionSidekick_activate__block_invoke;
  v5[3] = &unk_1E309CCA0;
  v5[4] = self;
  v5[5] = &v6;
  MXDispatchAsyncAndWait((uint64_t)"-[MXCoreSessionSidekick activate]", (uint64_t)"MXCoreSessionSidekick.m", 57, 0, 0, v3, (uint64_t)v5);
  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)self;
}

uint64_t __33__MXCoreSessionSidekick_activate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_activate");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)deactivate:(BOOL)a3 postInterruptionNotification:(BOOL)a4
{
  OS_dispatch_queue *v7;
  int v8;
  _QWORD v10[6];
  BOOL v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v7 = -[MXSessionManagerSidekick serialQueue](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "serialQueue");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__MXCoreSessionSidekick_deactivate_postInterruptionNotification___block_invoke;
  v10[3] = &unk_1E309CCC8;
  v10[4] = self;
  v10[5] = &v13;
  v11 = a3;
  v12 = a4;
  MXDispatchAsyncAndWait((uint64_t)"-[MXCoreSessionSidekick deactivate:postInterruptionNotification:]", (uint64_t)"MXCoreSessionSidekick.m", 69, 0, 0, v7, (uint64_t)v10);
  v8 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __65__MXCoreSessionSidekick_deactivate_postInterruptionNotification___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_deactivate:postInterruptionNotification:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)MEMORY[0x194035B20](self, a2);
  -[MXSessionManagerSidekick unregisterMXCoreSessionSidekick:](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "unregisterMXCoreSessionSidekick:", self);

  v4.receiver = self;
  v4.super_class = (Class)MXCoreSessionSidekick;
  -[MXCoreSessionBase dealloc](&v4, sel_dealloc);
  objc_autoreleasePoolPop(v3);
}

- (int)setPropertyForKey:(id)a3 value:(id)a4
{
  OS_dispatch_queue *v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7 = -[MXSessionManagerSidekick serialQueue](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "serialQueue");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__MXCoreSessionSidekick_setPropertyForKey_value___block_invoke;
  v9[3] = &unk_1E3098CC8;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  v9[7] = &v10;
  MXDispatchAsyncAndWait((uint64_t)"-[MXCoreSessionSidekick setPropertyForKey:value:]", (uint64_t)"MXCoreSessionSidekick.m", 91, 0, 0, v7, (uint64_t)v9);
  LODWORD(a4) = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return (int)a4;
}

uint64_t __49__MXCoreSessionSidekick_setPropertyForKey_value___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setPropertyForKey:value:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (int)copyPropertyForKey:(id)a3 valueOut:(id *)a4
{
  OS_dispatch_queue *v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7 = -[MXSessionManagerSidekick serialQueue](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "serialQueue");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__MXCoreSessionSidekick_copyPropertyForKey_valueOut___block_invoke;
  v9[3] = &unk_1E3098CF0;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = &v10;
  v9[7] = a4;
  MXDispatchAsyncAndWait((uint64_t)"-[MXCoreSessionSidekick copyPropertyForKey:valueOut:]", (uint64_t)"MXCoreSessionSidekick.m", 102, 0, 0, v7, (uint64_t)v9);
  LODWORD(a4) = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return (int)a4;
}

uint64_t __53__MXCoreSessionSidekick_copyPropertyForKey_valueOut___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_copyPropertyForKey:valueOut:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (NSString)remoteDeviceID
{
  return self->_remoteDeviceID;
}

- (void)setRemoteDeviceID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (id)_initWithRemoteDeviceID:(id)a3
{
  MXCoreSessionSidekick *v4;
  MXCoreSessionSidekick *v5;
  double v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef cf;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)MXCoreSessionSidekick;
  v4 = -[MXCoreSessionBase init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    -[MXCoreSessionSidekick setRemoteDeviceID:](v4, "setRemoteDeviceID:", a3);
    -[MXCoreSessionBase setAudioCategory:](v5, "setAudioCategory:", CFSTR("MediaPlayback"));
    -[MXCoreSessionBase setAudioMode:](v5, "setAudioMode:", CFSTR("Default"));
    cf = 0;
    FigRoutingManagerContextUtilities_CopySidePlayContextUUID((uint64_t)&cf);
    -[MXCoreSessionBase setRoutingContextUUID:](v5, "setRoutingContextUUID:", cf);
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    LODWORD(v6) = *(_DWORD *)"333?";
    -[MXCoreSessionBase setInterruptionFadeDuration:](v5, "setInterruptionFadeDuration:", v6);
    -[MXSessionManagerSidekick registerMXCoreSessionSidekick:](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "registerMXCoreSessionSidekick:", v5);
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return v5;
}

- (int)_activate
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  float v9;
  float v10;
  float v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  os_log_type_t type;
  int v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!-[MXCoreSessionBase isActive](self, "isActive"))
  {
    -[MXCoreSessionBase setIsActive:](self, "setIsActive:", 1);
    if (dword_1EE2B3F38)
    {
      v26 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSUtility_CreateReporterIDIfNeeded(self);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = -[MXCoreSessionBase reporterIDs](self, "reporterIDs");
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v4);
          CMSUtility_SetAudioServiceTypeForReporterID(self, objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "longLongValue", v19, v20));
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v6);
    }
    CMSUtility_StartReporterWithAudioStatistics(self);
    -[MXCoreSessionBase interruptionFadeDuration](self, "interruptionFadeDuration");
    v10 = v9;
    if (-[NSString isEqualToString:](-[MXCoreSessionBase audioMode](self, "audioMode"), "isEqualToString:", CFSTR("Sleep")))
    {
      v11 = 5.0;
    }
    else
    {
      v11 = *(float *)"333?";
    }
    v12 = objc_alloc(MEMORY[0x1E0C99E08]);
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[MXCoreSessionBase audioSessionID](self, "audioSessionID"));
    v14 = objc_msgSend(v12, "initWithObjectsAndKeys:", v13, CFSTR("AudioSessionID"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MXCoreSessionBase isActive](self, "isActive")), CFSTR("IsActive"), -[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("AudioCategory"), -[MXCoreSessionBase audioMode](self, "audioMode"), CFSTR("AudioMode"), 0);
    v16 = (void *)v14;
    if (v10 != v11)
    {
      v17 = (void *)MEMORY[0x1E0CB37E8];
      -[MXCoreSessionBase interruptionFadeDuration](self, "interruptionFadeDuration");
      v14 = objc_msgSend(v16, "setObject:forKey:", objc_msgSend(v17, "numberWithFloat:"), CFSTR("InterruptionFadeDuration"));
    }
    if (MX_FeatureFlags_IsAirPlayDaemonEnabled(v14, v15))
      objc_msgSend(v16, "setObject:forKey:", -[MXCoreSessionSidekick remoteDeviceID](self, "remoteDeviceID"), CFSTR("RemoteDeviceID"));
    +[MXSystemController notifyAll:payload:dontPostIfSuspended:remoteDeviceID:](MXSystemController, "notifyAll:payload:dontPostIfSuspended:remoteDeviceID:", CFSTR("SomeClientIsActiveDidChange"), v16, 0, -[MXCoreSessionSidekick remoteDeviceID](self, "remoteDeviceID"));

  }
  return 0;
}

- (int)_deactivate:(BOOL)a3 postInterruptionNotification:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  MXCoreSessionSidekick *v14;
  NSObject *v15;
  _QWORD v17[6];
  os_log_type_t type;
  int v19;
  uint64_t v20;

  v4 = a4;
  v5 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (-[MXCoreSessionBase isActive](self, "isActive"))
  {
    -[MXCoreSessionSidekick _setPropertyForKey:value:](self, "_setPropertyForKey:value:", CFSTR("IsPlaying"), *MEMORY[0x1E0C9AE40]);
    -[MXCoreSessionBase setIsActive:](self, "setIsActive:", 0);
    CMSUtility_StopReporterWithAudioStatistics(self);
    v7 = -[MXCoreSessionBase audioSessionID](self, "audioSessionID");
    v8 = objc_alloc(MEMORY[0x1E0C99E08]);
    v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MXCoreSessionBase isActive](self, "isActive"));
    v11 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", v9, CFSTR("AudioSessionID"), v10, CFSTR("IsActive"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5), CFSTR("NotifyOthers"), -[MXCoreSessionBase audioCategory](self, "audioCategory"), CFSTR("AudioCategory"), -[MXCoreSessionBase audioMode](self, "audioMode"), CFSTR("AudioMode"), 0);
    if (MX_FeatureFlags_IsAirPlayDaemonEnabled(v11, v12))
      objc_msgSend(v11, "setObject:forKey:", -[MXCoreSessionSidekick remoteDeviceID](self, "remoteDeviceID"), CFSTR("RemoteDeviceID"));
    +[MXSystemController notifyAll:payload:dontPostIfSuspended:remoteDeviceID:](MXSystemController, "notifyAll:payload:dontPostIfSuspended:remoteDeviceID:", CFSTR("SomeClientIsActiveDidChange"), v11, 0, -[MXCoreSessionSidekick remoteDeviceID](self, "remoteDeviceID"));

    if (dword_1EE2B3F38)
    {
      v19 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v4)
    {
      v14 = self;
      v15 = MXGetNotificationSenderQueue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __79__MXCoreSessionSidekick_InternalUse___deactivate_postInterruptionNotification___block_invoke;
      v17[3] = &unk_1E309CCF0;
      v17[4] = self;
      v17[5] = self;
      MXDispatchAsync((uint64_t)"-[MXCoreSessionSidekick(InternalUse) _deactivate:postInterruptionNotification:]", (uint64_t)"MXCoreSessionSidekick.m", 230, 0, 0, v15, (uint64_t)v17);
    }
  }
  return 0;
}

void __79__MXCoreSessionSidekick_InternalUse___deactivate_postInterruptionNotification___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99D80]);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v4 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v3, CFSTR("InterruptionCmd"), CFSTR("MXSessionManager"), CFSTR("InterruptorName"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2), CFSTR("InterruptionReason"), 0);
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[MXSessionManagerSidekick postNotification:toSession:payload:](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance", v6, v7), "postNotification:toSession:payload:", CFSTR("Interruption"), *(_QWORD *)(a1 + 40), v4);

}

- (BOOL)isCategoryValid:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Alarm")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("MediaPlayback"));
}

- (BOOL)isModeValidForCategory:(id)a3
{
  __CFString **v5;
  int v6;

  if (!-[NSString isEqualToString:](-[MXCoreSessionBase audioCategory](self, "audioCategory"), "isEqualToString:", CFSTR("Alarm")))
  {
    v6 = -[NSString isEqualToString:](-[MXCoreSessionBase audioCategory](self, "audioCategory"), "isEqualToString:", CFSTR("MediaPlayback"));
    if (!v6)
      return v6;
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Default")) & 1) == 0
      && (objc_msgSend(a3, "isEqualToString:", CFSTR("VoicePrompt")) & 1) == 0)
    {
      v5 = kMXSessionAudioMode_VoiceMessages;
      goto LABEL_10;
    }
LABEL_7:
    LOBYTE(v6) = 1;
    return v6;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
    goto LABEL_7;
  v5 = kMXSessionAudioMode_Sleep;
LABEL_10:
  LOBYTE(v6) = objc_msgSend(a3, "isEqualToString:", *v5);
  return v6;
}

- (int)_setPropertyForKey:(id)a3 value:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeID v8;
  CFTypeID v9;
  CFTypeID v10;
  CFTypeID v11;
  int v12;
  CFTypeID v14;
  NSString *v15;
  CFTypeID v16;
  id v17;
  _BOOL4 v18;
  NSObject *v19;
  CFTypeID v20;
  NSObject *v21;
  _BOOL4 v22;
  float v23;
  CFTypeID v24;
  uint64_t v25;
  uint64_t v26;
  float valuePtr[32];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("AudioSessionID"), v25, v26))
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("ClientPID")))
    {
      if (a4)
      {
        v9 = CFGetTypeID(a4);
        if (v9 == CFNumberGetTypeID())
        {
          -[MXCoreSessionBase setClientPID:](self, "setClientPID:", a4);
          return 0;
        }
      }
      goto LABEL_53;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("ClientName")))
    {
      if (a4)
      {
        v10 = CFGetTypeID(a4);
        if (v10 == CFStringGetTypeID())
        {
          -[MXCoreSessionBase updateClientName:](self, "updateClientName:", a4);
          return 0;
        }
      }
      goto LABEL_53;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("AudioCategory")))
    {
      if (a4)
      {
        v11 = CFGetTypeID(a4);
        if (v11 == CFStringGetTypeID())
        {
          if (-[MXCoreSessionSidekick isCategoryValid:](self, "isCategoryValid:", a4))
          {
            -[MXCoreSessionBase setAudioCategory:](self, "setAudioCategory:", a4);
            return 0;
          }
          v12 = -12981;
LABEL_44:
          v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          return v12;
        }
      }
      goto LABEL_53;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("AudioMode")))
    {
      if (a4)
      {
        v14 = CFGetTypeID(a4);
        if (v14 == CFStringGetTypeID())
        {
          v15 = -[MXCoreSessionBase audioMode](self, "audioMode");
          if (-[MXCoreSessionSidekick isModeValidForCategory:](self, "isModeValidForCategory:", a4))
          {
            -[MXCoreSessionBase setAudioMode:](self, "setAudioMode:", a4);
            -[MXCoreSessionBase updateDefaultInterruptionFadeDuration:](self, "updateDefaultInterruptionFadeDuration:", v15);
            v12 = 0;
          }
          else
          {
            v12 = -12981;
          }

LABEL_43:
          if (!v12)
            return v12;
          goto LABEL_44;
        }
      }
LABEL_53:
      v12 = FigSignalErrorAt();
      goto LABEL_43;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("IsPlaying")))
    {
      if (a4)
      {
        v16 = CFGetTypeID(a4);
        if (v16 == CFBooleanGetTypeID())
        {
          v17 = (id)*MEMORY[0x1E0C9AE50];
          v18 = *MEMORY[0x1E0C9AE50] == (_QWORD)a4;
          if (-[MXCoreSessionBase isPlaying](self, "isPlaying") != v18)
          {
            if (v17 == a4 && !-[MXCoreSessionBase isActive](self, "isActive"))
              -[MXCoreSessionSidekick _activate](self, "_activate");
            -[MXCoreSessionBase setIsPlaying:](self, "setIsPlaying:", v17 == a4);
            if (dword_1EE2B3F38)
            {
              v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            +[MXSystemController notifyAll:payload:dontPostIfSuspended:](MXSystemController, "notifyAll:payload:dontPostIfSuspended:", CFSTR("SomeSidekickSessionIsPlayingDidChange"), (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", -[MXCoreSessionSidekick remoteDeviceID](self, "remoteDeviceID"), CFSTR("RemoteDeviceID"), 0), 0);
          }
          return 0;
        }
      }
      goto LABEL_53;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("IAmTheAssistant")))
    {
      if (a4)
      {
        v20 = CFGetTypeID(a4);
        if (v20 == CFBooleanGetTypeID())
        {
          -[MXCoreSessionBase setIsTheAssistant:](self, "setIsTheAssistant:", *MEMORY[0x1E0C9AE50] == (_QWORD)a4);
          return 0;
        }
      }
      goto LABEL_53;
    }
    if (!objc_msgSend(a3, "isEqualToString:", CFSTR("InterruptionFadeDuration")))
      return 0;
    v22 = -[MXCoreSessionBase hasAudioMode:](self, "hasAudioMode:", CFSTR("Sleep"));
    v23 = *(float *)"333?";
    if (v22)
      v23 = 5.0;
    valuePtr[0] = v23;
    if (a4)
    {
      v24 = CFGetTypeID(a4);
      if (v24 != CFNumberGetTypeID())
        goto LABEL_53;
      CFNumberGetValue((CFNumberRef)a4, kCFNumberFloat32Type, valuePtr);
    }
    -[MXCoreSessionBase setInterruptionFadeDuration:](self, "setInterruptionFadeDuration:");
    v12 = 0;
    goto LABEL_43;
  }
  if (!a4)
    goto LABEL_53;
  v8 = CFGetTypeID(a4);
  if (v8 != CFNumberGetTypeID())
    goto LABEL_53;
  -[MXCoreSessionBase setAudioSessionID:](self, "setAudioSessionID:", objc_msgSend(a4, "unsignedIntValue"));
  return 0;
}

- (int)_copyPropertyForKey:(id)a3 valueOut:(id *)a4
{
  NSArray *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *UInt32;
  const __CFAllocator *v11;
  CFNumberType v12;
  _BOOL4 v13;
  NSArray **v14;
  int v15;
  int valuePtr[32];
  _QWORD v17[3];
  _QWORD v18[3];
  uint64_t v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return -15682;
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("RemoteDeviceID")))
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("RoutingContextUUID")))
    {
      v7 = -[MXCoreSessionBase routingContextUUID](self, "routingContextUUID");
      goto LABEL_7;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("RoutingContext")))
    {
      FigRoutingManagerContextUtilities_CopyRoutingContextForContextUUID((uint64_t)-[MXCoreSessionBase routingContextUUID](self, "routingContextUUID"), (uint64_t)a4);
      goto LABEL_8;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("AudioSessionID")))
    {
      -[MXCoreSessionBase audioSessionID](self, "audioSessionID");
      UInt32 = (void *)FigCFNumberCreateUInt32();
LABEL_19:
      *a4 = UInt32;
      goto LABEL_8;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("ClientPID")))
    {
      valuePtr[0] = -[NSNumber intValue](-[MXCoreSessionBase clientPID](self, "clientPID"), "intValue");
LABEL_17:
      v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v12 = kCFNumberIntType;
LABEL_18:
      UInt32 = CFNumberCreate(v11, v12, valuePtr);
      goto LABEL_19;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("ClientName")))
    {
      v7 = -[MXCoreSessionBase clientName](self, "clientName");
      goto LABEL_7;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("AudioCategory")))
    {
      v7 = -[MXCoreSessionBase audioCategory](self, "audioCategory");
      goto LABEL_7;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("AudioMode")))
    {
      v7 = -[MXCoreSessionBase audioMode](self, "audioMode");
      goto LABEL_7;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("IsActive")))
    {
      v13 = -[MXCoreSessionBase isActive](self, "isActive");
    }
    else if (objc_msgSend(a3, "isEqualToString:", CFSTR("IsPlaying")))
    {
      v13 = -[MXCoreSessionBase isPlaying](self, "isPlaying");
    }
    else
    {
      if (objc_msgSend(a3, "isEqualToString:", CFSTR("MaximumNumberOfOutputChannels")))
      {
        valuePtr[0] = 2;
        goto LABEL_17;
      }
      if (!objc_msgSend(a3, "isEqualToString:", CFSTR("SomeOtherClientIsPlaying")))
      {
        if (objc_msgSend(a3, "isEqualToString:", CFSTR("DetailedActiveAudioRoute")))
        {
          v20 = CFSTR("RouteDetailedDescription_Outputs");
          v17[0] = CFSTR("RouteDetailedDescription_Name");
          v17[1] = CFSTR("RouteDetailedDescription_PortType");
          v17[2] = CFSTR("RouteDetailedDescription_UID");
          v18[0] = CFSTR("AirTunes");
          v18[1] = CFSTR("AirTunes");
          v18[2] = CFSTR("AirTunes");
          v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
          v21[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
          v7 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
          goto LABEL_7;
        }
        if (objc_msgSend(a3, "isEqualToString:", CFSTR("ReporterIDs")))
        {
          CMSUtility_CreateReporterIDIfNeeded(self);
          v7 = -[MXCoreSessionBase reporterIDs](self, "reporterIDs");
          goto LABEL_7;
        }
        if (!objc_msgSend(a3, "isEqualToString:", CFSTR("InterruptionFadeDuration")))
        {
          *a4 = 0;
          goto LABEL_8;
        }
        -[MXCoreSessionBase interruptionFadeDuration](self, "interruptionFadeDuration");
        valuePtr[0] = v15;
        v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v12 = kCFNumberFloat32Type;
        goto LABEL_18;
      }
      v13 = -[MXSessionManagerSidekick isSomeOtherSessionPlaying:](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "isSomeOtherSessionPlaying:", self);
    }
    v14 = (NSArray **)MEMORY[0x1E0C9AE50];
    if (!v13)
      v14 = (NSArray **)MEMORY[0x1E0C9AE40];
    v7 = *v14;
    goto LABEL_7;
  }
  v7 = -[MXCoreSessionSidekick remoteDeviceID](self, "remoteDeviceID");
LABEL_7:
  *a4 = v7;
  CFRetain(v7);
LABEL_8:
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return 0;
}

@end
