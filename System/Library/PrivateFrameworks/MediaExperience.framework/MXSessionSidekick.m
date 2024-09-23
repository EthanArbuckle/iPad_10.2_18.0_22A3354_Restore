@implementation MXSessionSidekick

+ (void)initialize
{
  if ((id)objc_opt_self() == a1)
    sOrderedMXSessionSidekickProperties = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithObjects:", CFSTR("ClientType"), CFSTR("ClientName"), CFSTR("AudioSessionID"), CFSTR("ClientPID"), CFSTR("AuditToken"), CFSTR("IAmTheAssistant"), CFSTR("AudioCategory"), CFSTR("AudioMode"), CFSTR("InterruptionFadeDuration"), 0);
}

- (BOOL)getIsPlaying
{
  return self->mIsPlaying;
}

- (unint64_t)getID
{
  return self->mID;
}

- (id)getCoreSession
{
  return self->mCoreSession;
}

- (unint64_t)getCoreSessionID
{
  return self->mCoreSessionID;
}

- (int)getClientType
{
  return self->mClientType;
}

- (id)getClientTypeAsString
{
  int v2;

  v2 = self->mClientType - 1;
  if (v2 > 3)
    return CFSTR("kMXSessionClientType_Invalid");
  else
    return *(&off_1E309EFF0 + v2);
}

- (int)setID:(unint64_t)a3
{
  self->mID = a3;
  return 0;
}

- (int)setIsPlaying:(BOOL)a3
{
  if (self->mIsPlaying == a3)
    return 0;
  self->mIsPlaying = a3;
  return +[MXSessionSidekick updateIsPlaying:](MXSessionSidekick, "updateIsPlaying:", self->mCoreSession);
}

- (int)setClientType:(int)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  self->mClientType = a3;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return 0;
}

+ (int)updateIsPlaying:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v11;
  int v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = -[MXSessionManagerSidekick copyMXSessionList:](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "copyMXSessionList:", a3);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "getIsPlaying"))
          v7 = 1;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((v7 & 1) == objc_msgSend(a3, "isPlaying", v14, v16))
  {
    v12 = 0;
  }
  else
  {
    if (dword_1EE2B3F38)
    {
      v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v12 = objc_msgSend(a3, "_setPropertyForKey:value:", CFSTR("IsPlaying"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 & 1, v15, v17));
  }

  return v12;
}

- (id)info
{
  void *v3;
  unint64_t mID;
  unint64_t mCoreSessionID;
  uint64_t v6;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  mID = self->mID;
  mCoreSessionID = self->mCoreSessionID;
  v6 = objc_msgSend(-[MXSessionSidekick getCoreSession](self, "getCoreSession"), "clientName");
  v7 = CFSTR("YES");
  if (!self->mIsPlaying)
    v7 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<MXSessionID: %llx, CoreSessionID = %lld, Name = %@, Playing = %@, clientType = %x"), mID, mCoreSessionID, v6, v7, self->mClientType);
}

- (void)dumpInfo
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (MXSessionSidekick)initWithSession:(id)a3
{
  MXSessionSidekick *v4;
  MXSessionSidekick *v5;
  MXCoreSessionSidekick *v6;
  uint64_t v7;
  NSMapTable *v8;
  uint64_t v9;
  void *v10;
  NSMapTable *v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v13;
  id location;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)MXSessionSidekick;
  v4 = -[MXSessionSidekick init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->mIsPlaying = 0;
      v4->mClientType = 1;
      v6 = (MXCoreSessionSidekick *)a3;
      v5->mCoreSession = v6;
      v7 = -[NSNumber unsignedLongLongValue](-[MXCoreSessionBase ID](v6, "ID"), "unsignedLongLongValue");
      v5->mCoreSessionID = v7;
      v5->mID = objc_msgSend(a3, "mxSessionIDCounter") + 1000 * v7;
      objc_msgSend(a3, "setMxSessionIDCounter:", objc_msgSend(a3, "mxSessionIDCounter") + 1);
      -[NSRecursiveLock lock](-[MXSessionManagerSidekick recursiveLock](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "recursiveLock"), "lock");
      v8 = -[MXSessionManagerSidekick coreSessionIDToMXSessionList](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "coreSessionIDToMXSessionList");
      v9 = -[NSMapTable objectForKey:](v8, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5->mCoreSessionID));
      v10 = (void *)v9;
      if (!v9)
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 5);
      objc_initWeak(&location, v5);
      objc_msgSend(v10, "addPointer:", objc_loadWeak(&location));
      v11 = -[MXSessionManagerSidekick coreSessionIDToMXSessionList](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "coreSessionIDToMXSessionList");
      -[NSMapTable setObject:forKey:](v11, "setObject:forKey:", v10, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5->mCoreSessionID));
      -[NSRecursiveLock unlock](-[MXSessionManagerSidekick recursiveLock](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "recursiveLock"), "unlock");
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (!v9)

      v5->mDescription = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<MXSessionID = %llx, CoreSessionID = %lld>"), v5->mID, v5->mCoreSessionID);
      objc_destroyWeak(&location);
    }
    else
    {
      v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  id v4;
  NSMapTable *v5;
  OS_dispatch_queue *v6;
  objc_super v7;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = (void *)MEMORY[0x194035B20](self, a2);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[NSRecursiveLock lock](-[MXSessionManagerSidekick recursiveLock](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "recursiveLock"), "lock");
  v4 = -[NSMapTable objectForKey:](-[MXSessionManagerSidekick coreSessionIDToMXSessionList](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "coreSessionIDToMXSessionList"), "objectForKey:", -[MXCoreSessionBase ID](self->mCoreSession, "ID"));
  objc_msgSend(v4, "addPointer:", 0);
  objc_msgSend(v4, "compact");
  if (objc_msgSend(v4, "count"))
  {
    *((_BYTE *)v11 + 24) = 1;
  }
  else
  {
    v5 = -[MXSessionManagerSidekick coreSessionIDToMXSessionList](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "coreSessionIDToMXSessionList");
    -[NSMapTable removeObjectForKey:](v5, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->mCoreSessionID));
  }
  -[NSRecursiveLock unlock](-[MXSessionManagerSidekick recursiveLock](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "recursiveLock"), "unlock");
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3052000000;
  v9[3] = __Block_byref_object_copy__16;
  v9[4] = __Block_byref_object_dispose__16;
  v9[5] = self->mCoreSession;
  v6 = -[MXSessionManagerSidekick serialQueue](+[MXSessionManagerSidekick sharedInstance](MXSessionManagerSidekick, "sharedInstance"), "serialQueue");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__MXSessionSidekick_dealloc__block_invoke;
  v8[3] = &unk_1E309EFD0;
  v8[4] = &v10;
  v8[5] = v9;
  MXDispatchAsync((uint64_t)"-[MXSessionSidekick dealloc]", (uint64_t)"MXSessionSidekick.m", 315, 0, 0, v6, (uint64_t)v8);

  v7.receiver = self;
  v7.super_class = (Class)MXSessionSidekick;
  -[MXSessionSidekick dealloc](&v7, sel_dealloc);
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v10, 8);
  objc_autoreleasePoolPop(v3);
}

void __28__MXSessionSidekick_dealloc__block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    +[MXSessionSidekick updateIsPlaying:](MXSessionSidekick, "updateIsPlaying:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (int)setPropertyForKey:(id)a3 value:(id)a4
{
  CFTypeID v7;
  int v8;
  CFTypeID v9;
  int v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int valuePtr[32];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("IsPlaying")))
  {
    if (a4)
    {
      v7 = CFGetTypeID(a4);
      if (v7 == CFBooleanGetTypeID())
      {
        v8 = -[MXSessionSidekick setIsPlaying:](self, "setIsPlaying:", *MEMORY[0x1E0C9AE50] == (_QWORD)a4);
        goto LABEL_10;
      }
    }
  }
  else
  {
    if (!objc_msgSend(a3, "isEqualToString:", CFSTR("ClientType")))
    {
      v8 = -[MXCoreSessionSidekick _setPropertyForKey:value:](self->mCoreSession, "_setPropertyForKey:value:", a3, a4);
      goto LABEL_10;
    }
    v9 = CFGetTypeID(a4);
    if (v9 == CFNumberGetTypeID())
    {
      valuePtr[0] = 1;
      CFNumberGetValue((CFNumberRef)a4, kCFNumberSInt32Type, valuePtr);
      if ((valuePtr[0] - 5) > 0xFFFFFFFB)
      {
        v8 = -[MXSessionSidekick setClientType:](self, "setClientType:");
        goto LABEL_10;
      }
    }
  }
  v8 = FigSignalErrorAt();
LABEL_10:
  v10 = v8;
  if (v8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v10;
}

- (int)setProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  int v6;
  id v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  id *v35;
  int v36;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  os_log_type_t type;
  int v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v6 = a4;
  v62 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = a5;
  if (a3)
  {
    if (dword_1EE2B3F38)
    {
      v52 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMDebugUtility_PrintDictionary(a3);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v10 = (void *)sOrderedMXSessionSidekickProperties;
    v11 = objc_msgSend((id)sOrderedMXSessionSidekickProperties, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v48 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          v16 = objc_msgSend(a3, "objectForKey:", v15, v33, v34);
          if (v16)
          {
            v59 = v15;
            v60 = v16;
            objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
      }
      while (v12);
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v58, 16, v33, v34);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v44 != v19)
            objc_enumerationMutation(a3);
          v21 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
          if ((objc_msgSend((id)sOrderedMXSessionSidekickProperties, "containsObject:", v21) & 1) == 0)
          {
            v56 = v21;
            v57 = objc_msgSend(a3, "objectForKey:", v21);
            objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
          }
        }
        v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
      }
      while (v18);
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v22 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
    if (v22)
    {
      v23 = v22;
      v36 = 0;
      v24 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(v8);
          v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * k);
          v27 = (void *)MEMORY[0x194035B20]();
          v28 = objc_msgSend((id)objc_msgSend(v26, "allKeys"), "firstObject");
          v29 = objc_msgSend(v26, "objectForKey:", v28);
          if (v29 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
            v30 = 0;
          else
            v30 = v29;
          v31 = -[MXSessionSidekick setPropertyForKey:value:](self, "setPropertyForKey:value:", v28, v30);
          v53 = v28;
          v54 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v31);
          objc_msgSend(v38, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
          if (v6 == 2)
          {
            if ((_DWORD)v31)
              v36 = FigSignalErrorAt();
          }
          else if (v6 == 1 && (_DWORD)v31)
          {
            v36 = FigSignalErrorAt();
            objc_autoreleasePoolPop(v27);
            goto LABEL_40;
          }
          objc_autoreleasePoolPop(v27);
        }
        v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
      }
      while (v23);
    }
    else
    {
      v36 = 0;
    }
  }
  else
  {
    v36 = FigSignalErrorAt();
  }
LABEL_40:
  if (v35)
    *v35 = v38;
  else

  return v36;
}

- (int)setOrderedProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  int v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  os_log_type_t type;
  int v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v6 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3)
  {
    if (dword_1EE2B3F38)
    {
      v31 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMDebugUtility_PrintCollection(a3);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v9)
    {
      v11 = v9;
      LODWORD(v23) = 0;
      v12 = *(_QWORD *)v27;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(a3);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
          v15 = (void *)MEMORY[0x194035B20](v9, v10);
          v16 = objc_msgSend((id)objc_msgSend(v14, "allKeys"), "firstObject");
          v17 = objc_msgSend(v14, "objectForKey:", v16);
          if (v17 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
            v18 = 0;
          else
            v18 = v17;
          v19 = -[MXSessionSidekick setPropertyForKey:value:](self, "setPropertyForKey:value:", v16, v18, v21, v22);
          v32 = v16;
          v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
          objc_msgSend(v25, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
          if (v6 == 2)
          {
            if ((_DWORD)v19)
              LODWORD(v23) = FigSignalErrorAt();
          }
          else if (v6 == 1 && (_DWORD)v19)
          {
            LODWORD(v23) = FigSignalErrorAt();
            objc_autoreleasePoolPop(v15);
            goto LABEL_22;
          }
          objc_autoreleasePoolPop(v15);
          ++v13;
        }
        while (v11 != v13);
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        v11 = v9;
      }
      while (v9);
    }
    else
    {
      LODWORD(v23) = 0;
    }
  }
  else
  {
    v23 = FigSignalErrorAt();
  }
LABEL_22:
  if (a5)
    *a5 = v25;
  else

  return v23;
}

- (id)copyProperties:(id)a3 outPropertyErrors:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(a3);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x194035B20]();
        v18 = 0;
        v13 = -[MXSessionSidekick copyPropertyForKey:valueOut:](self, "copyPropertyForKey:valueOut:", v11, &v18);
        if ((_DWORD)v13)
          v14 = 1;
        else
          v14 = v18 == 0;
        if (!v14)
          objc_msgSend(v17, "setObject:forKey:");
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13), v11);

        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  if (a4)
    *a4 = v6;
  else

  return v17;
}

- (int)copyPropertyForKey:(id)a3 valueOut:(id *)a4
{
  _BOOL4 v7;
  id *v8;
  id v9;
  int result;
  const __CFAllocator *v11;
  unint64_t *p_valuePtr;
  CFNumberType v13;
  CFNumberRef v14;
  int valuePtr;
  unint64_t v16;

  if (!a3)
    return -15682;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("IsPlaying")))
  {
    v7 = -[MXSessionSidekick getIsPlaying](self, "getIsPlaying");
    v8 = (id *)MEMORY[0x1E0C9AE50];
    if (!v7)
      v8 = (id *)MEMORY[0x1E0C9AE40];
    v9 = *v8;
    *a4 = *v8;
    CFRetain(v9);
    return 0;
  }
  else
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("MXSessionID")))
    {
      v16 = -[MXSessionSidekick getID](self, "getID");
      v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      p_valuePtr = &v16;
      v13 = kCFNumberSInt64Type;
    }
    else
    {
      if (!objc_msgSend(a3, "isEqualToString:", CFSTR("TestOnly_ClientType")))
        return -[MXCoreSessionSidekick _copyPropertyForKey:valueOut:](self->mCoreSession, "_copyPropertyForKey:valueOut:", a3, a4);
      valuePtr = -[MXSessionSidekick getClientType](self, "getClientType");
      v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      p_valuePtr = (unint64_t *)&valuePtr;
      v13 = kCFNumberSInt32Type;
    }
    v14 = CFNumberCreate(v11, v13, p_valuePtr);
    result = 0;
    *a4 = v14;
  }
  return result;
}

- (int)activate
{
  return -[MXCoreSessionSidekick activate](self->mCoreSession, "activate");
}

- (int)deactivate:(BOOL)a3 postInterruptionNotification:(BOOL)a4
{
  return -[MXCoreSessionSidekick deactivate:postInterruptionNotification:](self->mCoreSession, "deactivate:postInterruptionNotification:", a3, a4);
}

@end
