@implementation MXSessionManagerSidekick

- (void)dumpCoreSessionList
{
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  int *v24;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  NSPointerArray *obj;
  uint64_t v29;
  MXSessionManagerSidekick *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  os_log_type_t type;
  unsigned int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  int v44;
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](-[MXSessionManagerSidekick recursiveLock](self, "recursiveLock"), "lock");
  -[NSPointerArray addPointer:](self->mCoreSessionList, "addPointer:", 0);
  -[NSPointerArray compact](self->mCoreSessionList, "compact");
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v30 = self;
  obj = self->mCoreSessionList;
  v31 = -[NSPointerArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (v31)
  {
    v29 = *(_QWORD *)v40;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v3);
        v5 = -[MXSessionManagerSidekick copyMXSessionList:](v30, "copyMXSessionList:", v4, v24, v26);
        if (dword_1EE2B3F38)
        {
          v38 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v7 = v38;
          if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
            v8 = v7;
          else
            v8 = v7 & 0xFFFFFFFE;
          if (v8)
          {
            v9 = objc_msgSend(v4, "clientName");
            v10 = objc_msgSend(v5, "count");
            v44 = 136315650;
            v45 = "-[MXSessionManagerSidekick dumpCoreSessionList]";
            v46 = 2114;
            v47 = v9;
            v48 = 2048;
            v49 = v10;
            LODWORD(v27) = 32;
            v25 = &v44;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          if (dword_1EE2B3F38)
          {
            v38 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v12 = v38;
            if (os_log_type_enabled(v11, type))
              v13 = v12;
            else
              v13 = v12 & 0xFFFFFFFE;
            if (v13)
            {
              v14 = objc_msgSend(v4, "info");
              v44 = 136315394;
              v45 = "-[MXSessionManagerSidekick dumpCoreSessionList]";
              v46 = 2114;
              v47 = v14;
              LODWORD(v27) = 22;
              v25 = &v44;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        v32 = v3;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v43, 16, v25, v27);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v34 != v17)
                objc_enumerationMutation(v5);
              if (dword_1EE2B3F38)
              {
                v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                v38 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v21 = v38;
                if (os_log_type_enabled(v20, type))
                  v22 = v21;
                else
                  v22 = v21 & 0xFFFFFFFE;
                if (v22)
                {
                  v23 = objc_msgSend(v19, "info");
                  v44 = 136315394;
                  v45 = "-[MXSessionManagerSidekick dumpCoreSessionList]";
                  v46 = 2114;
                  v47 = v23;
                  LODWORD(v26) = 22;
                  v24 = &v44;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
            v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
          }
          while (v16);
        }

        v3 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v31 = -[NSPointerArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    }
    while (v31);
  }
  -[NSRecursiveLock unlock](-[MXSessionManagerSidekick recursiveLock](v30, "recursiveLock", v24, v26), "unlock");
}

- (void)dumpVersionNumbersFromSidekickSessionBehavioursPlist
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  os_log_type_t type;
  unsigned int v19;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  CelestialGetModelSpecificName();
  v2 = CelestialCFCreatePropertyListForModelAndBundleIdentifier();
  if (v2 && (v3 = (void *)v2, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          if (dword_1EE2B3F38)
          {
            v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
            v19 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v10 = v19;
            if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
              v11 = v10;
            else
              v11 = v10 & 0xFFFFFFFE;
            if (v11)
            {
              v12 = objc_msgSend(v8, "valueForKey:", CFSTR("Version"));
              v20 = 136315394;
              v21 = "-[MXSessionManagerSidekick dumpVersionNumbersFromSidekickSessionBehavioursPlist]";
              v22 = 2114;
              v23 = v12;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
      }
      while (v5);
    }

  }
  else
  {
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (BOOL)isSomeOtherSessionPlaying:(id)a3
{
  NSPointerArray *mCoreSessionList;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](-[MXSessionManagerSidekick recursiveLock](self, "recursiveLock"), "lock");
  -[NSPointerArray addPointer:](self->mCoreSessionList, "addPointer:", 0);
  -[NSPointerArray compact](self->mCoreSessionList, "compact");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  mCoreSessionList = self->mCoreSessionList;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](mCoreSessionList, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(mCoreSessionList);
        v10 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v10 != a3
          && objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "isPlaying")
          && (objc_msgSend((id)objc_msgSend(a3, "remoteDeviceID"), "isEqualToString:", objc_msgSend(v10, "remoteDeviceID")) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_13;
        }
      }
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](mCoreSessionList, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:
  -[NSRecursiveLock unlock](-[MXSessionManagerSidekick recursiveLock](self, "recursiveLock"), "unlock");
  return v11;
}

- (MXSessionManagerSidekick)init
{
  MXSessionManagerSidekick *v2;
  NSObject *v3;
  _QWORD v5[5];
  objc_super v6;

  if (gMXSessionManagerSidekick)
  {

    return (MXSessionManagerSidekick *)gMXSessionManagerSidekick;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MXSessionManagerSidekick;
    v2 = -[MXSessionManagerSidekick init](&v6, sel_init);
    if (v2)
    {
      v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaexperiencesession.Sidekick", v3);
      v2->_remoteDeviceIDToCoreSessionIDList = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
      v2->_coreSessionIDToMXSessionList = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
      v2->_recursiveLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
      v2->mCoreSessionList = (NSPointerArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 5);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __32__MXSessionManagerSidekick_init__block_invoke;
      v5[3] = &unk_1E3099900;
      v5[4] = v2;
      MXInstallSysdiagnoseBlock((uint64_t)CFSTR("MXSessionManagerSidekickSessionList"), (uint64_t)v5);
    }
    gMXSessionManagerSidekick = (uint64_t)v2;
  }
  return v2;
}

void __32__MXSessionManagerSidekick_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__MXSessionManagerSidekick_init__block_invoke_2;
  v3[3] = &unk_1E3099900;
  v3[4] = *(_QWORD *)(a1 + 32);
  MXDispatchAsync((uint64_t)"-[MXSessionManagerSidekick init]_block_invoke", (uint64_t)"MXSessionManagerSidekick.m", 133, 0, 0, v2, (uint64_t)v3);
}

uint64_t __32__MXSessionManagerSidekick_init__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dumpCoreSessionList");
  return objc_msgSend(*(id *)(a1 + 32), "dumpVersionNumbersFromSidekickSessionBehavioursPlist");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)MEMORY[0x194035B20](self, a2);
  dispatch_release((dispatch_object_t)self->_serialQueue);

  v4.receiver = self;
  v4.super_class = (Class)MXSessionManagerSidekick;
  -[MXSessionManagerSidekick dealloc](&v4, sel_dealloc);
  objc_autoreleasePoolPop(v3);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MXSessionManagerSidekick_sharedInstance__block_invoke;
  block[3] = &unk_1E3099900;
  block[4] = a1;
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, block);
  return (id)gMXSessionManagerSidekick;
}

uint64_t __42__MXSessionManagerSidekick_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t result;
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_METACLASS___MXSessionManagerSidekick;
  result = objc_msgSend(objc_msgSendSuper2(&v2, sel_allocWithZone_, 0), "init");
  gMXSessionManagerSidekick = result;
  return result;
}

- (id)copyMXCoreSessionForAudioSessionID:(unsigned int)a3
{
  NSPointerArray *mCoreSessionList;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](-[MXSessionManagerSidekick recursiveLock](self, "recursiveLock"), "lock");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  mCoreSessionList = self->mCoreSessionList;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](mCoreSessionList, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(mCoreSessionList);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "audioSessionID") == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](mCoreSessionList, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:
  -[NSRecursiveLock unlock](-[MXSessionManagerSidekick recursiveLock](self, "recursiveLock"), "unlock");
  return v10;
}

- (void)registerMXCoreSessionSidekick:(id)a3
{
  id v5;
  void *v6;
  id location;

  -[NSRecursiveLock lock](-[MXSessionManagerSidekick recursiveLock](self, "recursiveLock"), "lock");
  v5 = -[NSMapTable objectForKey:](-[MXSessionManagerSidekick remoteDeviceIDToCoreSessionIDList](self, "remoteDeviceIDToCoreSessionIDList"), "objectForKey:", objc_msgSend(a3, "remoteDeviceID"));
  v6 = v5;
  if (!v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 5);
  objc_initWeak(&location, a3);
  objc_msgSend(v6, "addPointer:", objc_loadWeak(&location));
  -[NSMapTable setObject:forKey:](-[MXSessionManagerSidekick remoteDeviceIDToCoreSessionIDList](self, "remoteDeviceIDToCoreSessionIDList"), "setObject:forKey:", v6, objc_msgSend(a3, "remoteDeviceID"));
  -[NSPointerArray addPointer:](self->mCoreSessionList, "addPointer:", objc_loadWeak(&location));
  -[NSRecursiveLock unlock](-[MXSessionManagerSidekick recursiveLock](self, "recursiveLock"), "unlock");
  if (!v5)

  objc_destroyWeak(&location);
}

- (void)unregisterMXCoreSessionSidekick:(id)a3
{
  id v5;

  -[NSRecursiveLock lock](-[MXSessionManagerSidekick recursiveLock](self, "recursiveLock"), "lock");
  -[NSPointerArray addPointer:](self->mCoreSessionList, "addPointer:", 0);
  -[NSPointerArray compact](self->mCoreSessionList, "compact");
  v5 = -[NSMapTable objectForKey:](-[MXSessionManagerSidekick remoteDeviceIDToCoreSessionIDList](self, "remoteDeviceIDToCoreSessionIDList"), "objectForKey:", objc_msgSend(a3, "remoteDeviceID"));
  objc_msgSend(v5, "addPointer:", 0);
  objc_msgSend(v5, "compact");
  if (!objc_msgSend(v5, "count"))
    -[NSMapTable removeObjectForKey:](-[MXSessionManagerSidekick remoteDeviceIDToCoreSessionIDList](self, "remoteDeviceIDToCoreSessionIDList"), "removeObjectForKey:", objc_msgSend(a3, "remoteDeviceID"));
  -[NSRecursiveLock unlock](-[MXSessionManagerSidekick recursiveLock](self, "recursiveLock"), "unlock");
}

- (id)copyMXSessionList:(id)a3
{
  void *v5;
  id v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (a3)
  {
    v5 = (void *)MEMORY[0x194035B20](self, a2);
    -[NSRecursiveLock lock](-[MXSessionManagerSidekick recursiveLock](self, "recursiveLock"), "lock");
    v6 = (id)objc_msgSend(-[NSMapTable objectForKey:](-[MXSessionManagerSidekick coreSessionIDToMXSessionList](self, "coreSessionIDToMXSessionList"), "objectForKey:", objc_msgSend(a3, "ID")), "allObjects");
    -[NSRecursiveLock unlock](-[MXSessionManagerSidekick recursiveLock](self, "recursiveLock"), "unlock");
    objc_autoreleasePoolPop(v5);
    return v6;
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
}

- (int)postInterruptionEndedNotificationForAudioSessionID:(unsigned int)a3 resumable:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v9;
  NSObject *v10;
  _QWORD v12[6];
  BOOL v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = -[MXSessionManagerSidekick copyMXCoreSessionForAudioSessionID:](self, "copyMXCoreSessionForAudioSessionID:");
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend(v6, "isActive"))
    {
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }

    }
    else
    {
      v10 = MXGetNotificationSenderQueue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __89__MXSessionManagerSidekick_postInterruptionEndedNotificationForAudioSessionID_resumable___block_invoke;
      v12[3] = &unk_1E309D770;
      v13 = a4;
      v12[4] = v7;
      v12[5] = self;
      MXDispatchAsync((uint64_t)"-[MXSessionManagerSidekick postInterruptionEndedNotificationForAudioSessionID:resumable:]", (uint64_t)"MXSessionManagerSidekick.m", 287, 0, 0, v10, (uint64_t)v12);
    }
    return 0;
  }
  else
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return -15681;
  }
}

void __89__MXSessionManagerSidekick_postInterruptionEndedNotificationForAudioSessionID_resumable___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  id v3;
  void *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
    v2 = CFSTR("resumable.MXSessionManager");
  else
    v2 = CFSTR("non-resumable.MXSessionManager");
  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  v4 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1), CFSTR("InterruptionCmd"), CFSTR("MXSessionManager"), CFSTR("InterruptorName"), v2, CFSTR("Status"), 0);
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 40), "postNotification:toSession:payload:", CFSTR("Interruption"), *(_QWORD *)(a1 + 32), v4, v6, v7);

}

- (void)postNotification:(id)a3 toSession:(id)a4 payload:(id)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", a3, a4, a5);
  v9 = -[MXSessionManagerSidekick copyMXSessionList:](self, "copyMXSessionList:", a4);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", a3, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), a5);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (NSMapTable)remoteDeviceIDToCoreSessionIDList
{
  return self->_remoteDeviceIDToCoreSessionIDList;
}

- (NSMapTable)coreSessionIDToMXSessionList
{
  return self->_coreSessionIDToMXSessionList;
}

- (NSRecursiveLock)recursiveLock
{
  return self->_recursiveLock;
}

@end
