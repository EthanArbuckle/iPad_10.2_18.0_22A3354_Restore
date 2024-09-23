@implementation MBXPCClient

- (MBXPCClient)initWithDelegate:(id)a3 eventQueue:(id)a4
{
  return -[MBXPCClient initWithDelegate:eventQueue:personaIdentifier:](self, "initWithDelegate:eventQueue:personaIdentifier:", a3, a4, 0);
}

- (MBXPCClient)initWithDelegate:(id)a3 eventQueue:(id)a4 personaIdentifier:(id)a5
{
  id v8;
  dispatch_queue_t v9;
  id v10;
  MBXPCClient *v11;
  objc_class *v12;
  const char *Name;
  NSObject *v14;
  objc_super v16;

  v8 = a3;
  v9 = (dispatch_queue_t)a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MBXPCClient;
  v11 = -[MBManager _init](&v16, sel__init);
  if (v11)
  {
    if (!v9)
    {
      v12 = (objc_class *)objc_opt_class();
      Name = class_getName(v12);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v14 = objc_claimAutoreleasedReturnValue();
      v9 = dispatch_queue_create(Name, v14);

    }
    objc_storeStrong((id *)&v11->_eventQueue, v9);
    v11->_enabledToken = -1;
    objc_storeStrong((id *)&v11->_personaIdentifier, a5);
    -[MBManager setDelegate:](v11, "setDelegate:", v8);
  }

  return v11;
}

- (MBXPCClient)initWithAccount:(id)a3 delegate:(id)a4 eventQueue:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  MBXPCClient *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
    -[MBXPCClient initWithAccount:delegate:eventQueue:error:].cold.1();
  v13 = v12;
  objc_msgSend(v10, "personaIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isDataSeparatedAccount"))
  {
    if (!v14)
    {
      if (a6)
      {
        +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Nil persona identifier for Data Separated account"));
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v14 = 0;
LABEL_11:
        v16 = 0;
        *a6 = v15;
        goto LABEL_25;
      }
      goto LABEL_23;
    }
  }
  else
  {
    if (!objc_msgSend(v10, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]))
    {
      if (a6)
      {
        +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("ACAccount not eligible for backup"));
        v15 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
LABEL_24:
      v16 = 0;
      goto LABEL_25;
    }
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "userPersonaUniqueString");
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v14 = (void *)v19;

          goto LABEL_8;
        }
        if (a6)
        {
          +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Nil persona identifier for Primary account"));
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        if (a6)
        {
          +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Failed to fetch the attributes for personal persona"));
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        MBGetDefaultLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v28) = 0;
          _os_log_impl(&dword_1D5213000, v20, OS_LOG_TYPE_ERROR, "Failed to fetch the attributes for personal persona", (uint8_t *)&v28, 2u);
          _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to fetch the attributes for personal persona", v21, v22, v23, v24, v25, v26, v28);
        }

      }
LABEL_23:
      v14 = 0;
      goto LABEL_24;
    }
  }
LABEL_8:
  self = -[MBXPCClient initWithDelegate:eventQueue:personaIdentifier:](self, "initWithDelegate:eventQueue:personaIdentifier:", v11, v13, v14);
  v16 = self;
LABEL_25:

  return v16;
}

- (MBXPCClient)initWithAccount:(id)a3 delegate:(id)a4 eventQueue:(id)a5
{
  return -[MBXPCClient initWithAccount:delegate:eventQueue:error:](self, "initWithAccount:delegate:eventQueue:error:", a3, a4, a5, 0);
}

- (void)dealloc
{
  void *v3;
  int iTunesRestoreStartedNotificationToken;
  int iTunesRestoreEndedNotificationToken;
  NSObject *timer;
  int enabledToken;
  objc_super v8;

  -[MBXPCClient connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[MBXPCClient setConnection:](self, "setConnection:", 0);
  iTunesRestoreStartedNotificationToken = self->_iTunesRestoreStartedNotificationToken;
  if (iTunesRestoreStartedNotificationToken)
    notify_cancel(iTunesRestoreStartedNotificationToken);
  iTunesRestoreEndedNotificationToken = self->_iTunesRestoreEndedNotificationToken;
  if (iTunesRestoreEndedNotificationToken)
    notify_cancel(iTunesRestoreEndedNotificationToken);
  timer = self->_timer;
  if (timer)
    dispatch_source_cancel(timer);
  enabledToken = self->_enabledToken;
  if (enabledToken != -1)
    notify_cancel(enabledToken);
  v8.receiver = self;
  v8.super_class = (Class)MBXPCClient;
  -[MBXPCClient dealloc](&v8, sel_dealloc);
}

- (BOOL)_isBackupAgent2Running
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  const char *v10;
  BOOL v11;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t size;
  int v18[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)v18 = xmmword_1D5259AB8;
  v19 = 0;
  size = 0;
  if (sysctl(v18, 3u, 0, &size, 0, 0))
  {
    MBGetDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v9 = 0;
      goto LABEL_9;
    }
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1D5213000, v2, OS_LOG_TYPE_ERROR, "Error obtaining process list size", (uint8_t *)&v16, 2u);
    v9 = 0;
    v10 = "Error obtaining process list size";
    goto LABEL_7;
  }
  v9 = (char *)malloc_type_malloc(size, 0xBC1E9D96uLL);
  if (sysctl(v18, 3u, v9, &size, 0, 0))
  {
    MBGetDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1D5213000, v2, OS_LOG_TYPE_ERROR, "Error obtaining process list", (uint8_t *)&v16, 2u);
    v10 = "Error obtaining process list";
LABEL_7:
    _MBLog(CFSTR("ERROR"), (uint64_t)v10, v3, v4, v5, v6, v7, v8, v16);
    goto LABEL_9;
  }
  v13 = (int)size / 0x288uLL;
  if ((int)v13 < 1)
    goto LABEL_10;
  v14 = 0;
  v15 = 648 * v13;
  while (*(int *)&v9[v14 + 40] < 1
       || !strstr(&v9[v14 + 243], (const char *)objc_msgSend(CFSTR("BackupAgent2"), "UTF8String")))
  {
    v14 += 648;
    if (v15 == v14)
      goto LABEL_10;
  }
  v11 = 1;
LABEL_11:
  free(v9);
  return v11;
}

- (void)startWatchingBackupAgent2
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD handler[5];
  uint8_t buf[16];

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_eventQueue);
  timer = self->_timer;
  self->_timer = v3;

  v5 = self->_timer;
  if (v5)
  {
    v6 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v5, v6, 0x12A05F200uLL, 5uLL);
    v7 = self->_timer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __40__MBXPCClient_startWatchingBackupAgent2__block_invoke;
    handler[3] = &unk_1E995CE70;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_timer);
  }
  else
  {
    MBGetDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5213000, v8, OS_LOG_TYPE_ERROR, "Failed to create timer to monitor BackupAgent2", buf, 2u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to create timer to monitor BackupAgent2", v9, v10, v11, v12, v13, v14, v15);
    }

  }
}

void __40__MBXPCClient_startWatchingBackupAgent2__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  unsigned __int8 *v4;
  void *v5;
  char v6;

  v6 = 0;
  +[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getBooleanValueForKey:keyExists:", CFSTR("DriveRestoreInProgress"), &v6);
  v4 = *(unsigned __int8 **)(a1 + 32);
  if (v4[32] | v3)
  {
    if ((objc_msgSend(v4, "_isBackupAgent2Running") & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
      objc_msgSend(v2, "setPreferencesValue:forKey:", 0, CFSTR("DriveRestoreInProgress"));
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "managerDidFinishRestore:", *(_QWORD *)(a1 + 32));

    }
  }
  else
  {
    objc_msgSend(v4, "startWatchingBackupAgent2");
  }

}

- (void)setSupportsiTunes:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *eventQueue;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int iTunesRestoreStartedNotificationToken;
  int iTunesRestoreEndedNotificationToken;
  uint64_t v33[5];
  _QWORD handler[5];
  uint8_t buf[16];

  v3 = a3;
  -[MBXPCClient setShouldSupportiTunes:](self, "setShouldSupportiTunes:");
  if (v3)
  {
    MBGetDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5213000, v5, OS_LOG_TYPE_INFO, "MBManager is now monitoring iTunes restores", buf, 2u);
      _MBLog(CFSTR("INFO"), (uint64_t)"MBManager is now monitoring iTunes restores", v6, v7, v8, v9, v10, v11, v33[0]);
    }

    v12 = (const char *)objc_msgSend(CFSTR("com.apple.MobileBackup.Drive.RestoreStarted"), "UTF8String");
    eventQueue = self->_eventQueue;
    v14 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __33__MBXPCClient_setSupportsiTunes___block_invoke;
    handler[3] = &unk_1E995D638;
    handler[4] = self;
    if (notify_register_dispatch(v12, &self->_iTunesRestoreStartedNotificationToken, eventQueue, handler))
    {
      MBGetDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5213000, v15, OS_LOG_TYPE_ERROR, "Failed to start monitoring for iTunes restore session start", buf, 2u);
        _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to start monitoring for iTunes restore session start", v16, v17, v18, v19, v20, v21, v33[0]);
      }

    }
    v22 = (const char *)objc_msgSend(CFSTR("com.apple.MobileBackup.Drive.RestoreEnded"), "UTF8String");
    v23 = self->_eventQueue;
    v33[0] = v14;
    v33[1] = 3221225472;
    v33[2] = (uint64_t)__33__MBXPCClient_setSupportsiTunes___block_invoke_31;
    v33[3] = (uint64_t)&unk_1E995D638;
    v33[4] = (uint64_t)self;
    if (notify_register_dispatch(v22, &self->_iTunesRestoreEndedNotificationToken, v23, v33))
    {
      MBGetDefaultLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5213000, v24, OS_LOG_TYPE_ERROR, "Failed to start monitoring for iTunes restore session end", buf, 2u);
        _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to start monitoring for iTunes restore session end", v25, v26, v27, v28, v29, v30, v33[0]);
      }

    }
    -[MBXPCClient startWatchingBackupAgent2](self, "startWatchingBackupAgent2");
  }
  else
  {
    iTunesRestoreStartedNotificationToken = self->_iTunesRestoreStartedNotificationToken;
    if (iTunesRestoreStartedNotificationToken)
    {
      notify_cancel(iTunesRestoreStartedNotificationToken);
      self->_iTunesRestoreStartedNotificationToken = 0;
    }
    iTunesRestoreEndedNotificationToken = self->_iTunesRestoreEndedNotificationToken;
    if (iTunesRestoreEndedNotificationToken)
    {
      notify_cancel(iTunesRestoreEndedNotificationToken);
      self->_iTunesRestoreEndedNotificationToken = 0;
    }
  }
}

uint64_t __33__MBXPCClient_setSupportsiTunes___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 1;
  return result;
}

void __33__MBXPCClient_setSupportsiTunes___block_invoke_31(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "managerDidFinishRestore:", *(_QWORD *)(a1 + 32));
      v3 = v5;
    }
  }

}

- (BOOL)setupBackupWithPasscode:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  os_activity_scope_state_s v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1D5213000, "setupBackupWithPasscode:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  if (v6)
  {
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageSetupBackup"), v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  os_activity_scope_leave(&v12);
  return v10;
}

- (BOOL)isBackupEnabled
{
  NSObject *v3;
  void *v4;
  char v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  MBXPCClient *v18;
  int *p_enabledToken;
  int enabledToken;
  uint32_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint32_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t state64;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = _os_activity_create(&dword_1D5213000, "isBackupEnabled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEphemeralMultiUser");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC5EF0], "currentPersona");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!self->_personaIdentifier
      && ((objc_msgSend(v7, "isPersonalPersona") & 1) != 0
       || (objc_msgSend(v8, "isDefaultPersona") & 1) != 0
       || objc_msgSend(v8, "isSystemPersona")))
    {
      v18 = self;
      objc_sync_enter(v18);
      p_enabledToken = &v18->_enabledToken;
      enabledToken = v18->_enabledToken;
      if (enabledToken == -1)
      {
        v21 = notify_register_check("com.apple.MobileBackup.EnabledState", &v18->_enabledToken);
        if (v21)
        {
          MBGetDefaultLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            v47 = v21;
            _os_log_impl(&dword_1D5213000, v22, OS_LOG_TYPE_ERROR, "notify_register_check failed: %lu", buf, 0xCu);
            _MBLog(CFSTR("ERROR"), (uint64_t)"notify_register_check failed: %lu", v23, v24, v25, v26, v27, v28, v21);
          }

          enabledToken = -1;
          *p_enabledToken = -1;
        }
        else
        {
          enabledToken = *p_enabledToken;
        }
      }
      objc_sync_exit(v18);

      if (enabledToken != -1)
      {
        state64 = 0;
        v29 = notify_get_state(enabledToken, &state64);
        if (v29)
        {
          MBGetDefaultLog();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            v47 = v29;
            _os_log_impl(&dword_1D5213000, v30, OS_LOG_TYPE_ERROR, "notify_get_state failed: %lu", buf, 0xCu);
            _MBLog(CFSTR("ERROR"), (uint64_t)"notify_get_state failed: %lu", v31, v32, v33, v34, v35, v36, v29);
          }

          state64 = 0;
        }
        MBGetDefaultLog();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v47 = state64;
          _os_log_impl(&dword_1D5213000, v37, OS_LOG_TYPE_INFO, "Fetched the backup enabled notify state: 0x%llx", buf, 0xCu);
          _MBLog(CFSTR("INFO"), (uint64_t)"Fetched the backup enabled notify state: 0x%llx", v38, v39, v40, v41, v42, v43, state64);
        }

        if (state64 == 1)
        {
          LOBYTE(v6) = 1;
          goto LABEL_7;
        }
        if (state64 == -1)
        {
          LOBYTE(v6) = 0;
LABEL_7:

          goto LABEL_8;
        }
      }
    }
    -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageIsBackupEnabled"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "BOOLValue");
    MBGetDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v47) = v6;
      _os_log_impl(&dword_1D5213000, v10, OS_LOG_TYPE_INFO, "isBackupEnabled:%d", buf, 8u);
      _MBLog(CFSTR("INFO"), (uint64_t)"isBackupEnabled:%d", v11, v12, v13, v14, v15, v16, v6);
    }

    goto LABEL_7;
  }
  LOBYTE(v6) = 0;
LABEL_8:
  os_activity_scope_leave(&state);

  return v6;
}

- (void)setBackupEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  os_activity_scope_state_s v9;
  _QWORD v10[2];

  v3 = a3;
  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_1D5213000, "setBackupEnabled:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v5, &v9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageSetBackupEnabled"), v7);

  os_activity_scope_leave(&v9);
}

- (void)syncBackupEnabled
{
  NSObject *v3;
  id v4;
  os_activity_scope_state_s v5;

  v3 = _os_activity_create(&dword_1D5213000, "syncBackupEnabled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  v4 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageSyncBackupEnabled"), 0);
  os_activity_scope_leave(&v5);

}

- (BOOL)isLocalBackupPasswordSetWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "isLocalBackupPasswordSetWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageIsLocalBackupPasswordSet"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "BOOLValue");

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (BOOL)unsetLocalBackupPasswordWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "unsetLocalBackupPasswordWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageUnsetLocalBackupPassword"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "BOOLValue");

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (id)getBackupListWithError:(id *)a3
{
  return -[MBXPCClient getBackupListWithFiltering:error:](self, "getBackupListWithFiltering:error:", 1, a3);
}

- (id)getBackupListWithFiltering:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  os_activity_scope_state_s v12;
  _QWORD v13[2];

  v5 = a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = _os_activity_create(&dword_1D5213000, "getBackupListWithFiltering:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageBackupList"), v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&v12);
  return v10;
}

- (BOOL)inheritSnapshot:(id)a3 fromDevice:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  os_activity_scope_state_s state;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = _os_activity_create(&dword_1D5213000, "inheritSnapshot:snapshotID:fromDevice:error", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  v15[0] = v8;
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageInheritBackup"), v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(v12, "BOOLValue");
  os_activity_scope_leave(&state);

  return (char)a5;
}

- (id)backupState
{
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v6;

  v3 = _os_activity_create(&dword_1D5213000, "backupState", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageBackupState"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_activity_scope_leave(&v6);

  return v4;
}

- (id)backupDeviceUUID
{
  NSObject *v3;
  void *v4;
  void *v5;
  os_activity_scope_state_s v7;

  v3 = _os_activity_create(&dword_1D5213000, "backupDeviceUUID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v3, &v7);
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageGetBackupDeviceUUID"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mb_backupIDByAddingCKPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&v7);
  return v5;
}

- (BOOL)startBackupWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  os_activity_scope_state_s v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1D5213000, "startBackupWithOptions:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageStartBackup"), v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v9, "BOOLValue");
  os_activity_scope_leave(&v11);

  return (char)a4;
}

- (BOOL)startBackupWithError:(id *)a3
{
  void *v5;

  v5 = (void *)objc_opt_new();
  LOBYTE(a3) = -[MBXPCClient startBackupWithOptions:error:](self, "startBackupWithOptions:error:", v5, a3);

  return (char)a3;
}

- (void)cancel
{
  NSObject *v3;
  id v4;
  os_activity_scope_state_s v5;

  v3 = _os_activity_create(&dword_1D5213000, "cancel", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  v4 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageCancel"), 0);
  os_activity_scope_leave(&v5);

}

- (void)cancelRestore
{
  NSObject *v3;
  id v4;
  os_activity_scope_state_s v5;

  v3 = _os_activity_create(&dword_1D5213000, "cancelRestore", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  v4 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageCancelRestore"), 0);
  os_activity_scope_leave(&v5);

}

- (id)restoreStateWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 iTunesRestoreStarted;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  MBStateInfo *v16;
  double v17;
  MBStateInfo *v18;
  id v19;
  void *v20;
  id v22;
  char v23;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  _BOOL4 v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_1D5213000, "restoreState", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  if (-[MBXPCClient shouldSupportiTunes](self, "shouldSupportiTunes"))
  {
    v23 = 0;
    +[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "getBooleanValueForKey:keyExists:", CFSTR("DriveRestoreInProgress"), &v23);
    if (self->_iTunesRestoreStarted | v7
      && -[MBXPCClient _isBackupAgent2Running](self, "_isBackupAgent2Running"))
    {
      MBGetDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        iTunesRestoreStarted = self->_iTunesRestoreStarted;
        *(_DWORD *)buf = 67109376;
        v26 = iTunesRestoreStarted;
        v27 = 1024;
        v28 = v7;
        _os_log_impl(&dword_1D5213000, v8, OS_LOG_TYPE_INFO, "iTunes restore in progress (%d, %d)", buf, 0xEu);
        _MBLog(CFSTR("INFO"), (uint64_t)"iTunes restore in progress (%d, %d)", v10, v11, v12, v13, v14, v15, self->_iTunesRestoreStarted);
      }

      v16 = [MBStateInfo alloc];
      LODWORD(v17) = 0;
      v18 = -[MBStateInfo initWithState:progress:estimatedTimeRemaining:isCloud:isBackground:error:errors:backupAttemptCount:](v16, "initWithState:progress:estimatedTimeRemaining:isCloud:isBackground:error:errors:backupAttemptCount:", 2, 0, 0, 0, 0, 0, v17, 0);

      goto LABEL_12;
    }

  }
  v22 = 0;
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageRestoreState"), 0, &v22);
  v18 = (MBStateInfo *)objc_claimAutoreleasedReturnValue();
  v19 = v22;
  v20 = v19;
  if (a3 && !v18)
    *a3 = objc_retainAutorelease(v19);

LABEL_12:
  os_activity_scope_leave(&state);

  return v18;
}

- (id)restoreState
{
  return -[MBXPCClient restoreStateWithError:](self, "restoreStateWithError:", 0);
}

- (void)fetchiCloudRestoreIsCompleteWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (!v4)
    -[MBXPCClient fetchiCloudRestoreIsCompleteWithCompletion:].cold.1();
  v5 = v4;
  dispatch_get_global_queue(17, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__MBXPCClient_fetchiCloudRestoreIsCompleteWithCompletion___block_invoke;
  v8[3] = &unk_1E995D090;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __58__MBXPCClient_fetchiCloudRestoreIsCompleteWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  os_activity_scope_state_s state;

  v2 = (void *)MEMORY[0x1D8270CF0]();
  v3 = _os_activity_create(&dword_1D5213000, "fetchiCloudRestoreIsCompleteWithCompletion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = *(void **)(a1 + 32);
  v8 = 0;
  objc_msgSend(v4, "_sendRequest:arguments:error:", CFSTR("kMBMessageRestoreState"), 0, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  v7 = v6;
  if (v5)
  {

    objc_msgSend(v5, "state");
    v7 = 0;
  }
  else if (!v6)
  {
    __assert_rtn("-[MBXPCClient fetchiCloudRestoreIsCompleteWithCompletion:]_block_invoke", "MBXPCClient.m", 427, "error");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  os_activity_scope_leave(&state);
  objc_autoreleasePoolPop(v2);
}

- (id)backgroundRestoreInfo
{
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v6;

  v3 = _os_activity_create(&dword_1D5213000, "backgroundRestoreInfo", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageBackgroundRestoreInfo"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_activity_scope_leave(&v6);

  return v4;
}

- (BOOL)restoreFileExistsWithPath:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  os_activity_scope_state_s v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Null path"));
  v5 = _os_activity_create(&dword_1D5213000, "restoreFileExistsWithPath:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v5, &v10);
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageFileExists"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "BOOLValue");
  os_activity_scope_leave(&v10);

  return v8;
}

- (BOOL)restoreDataExistsForApplicationWithBundleID:(id)a3 size:(unint64_t *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  os_activity_scope_state_s v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1D5213000, "restoreDataExistsForApplicationWithBundleID:size:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v7, &v15);
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageDataExistsForApp"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a4)
    *a4 = objc_msgSend(v11, "unsignedLongLongValue");
  v13 = objc_msgSend(v10, "BOOLValue");

  os_activity_scope_leave(&v15);
  return v13;
}

- (BOOL)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 range:(_NSRange)a6 error:(id *)a7 progress:(id)a8
{
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger length;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  int v30;
  unint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  BOOL v40;
  char v41;
  void *v42;
  BOOL v43;
  BOOL v44;
  void (**v47)(id, void *);
  id v48;
  _BOOL4 v50;
  id v51;
  void *v52;
  NSUInteger v54;
  void *context;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  os_activity_scope_state_s state;
  _BYTE v68[128];
  _BYTE v69[128];
  _QWORD v70[5];
  uint8_t buf[4];
  id v72;
  __int16 v73;
  id v74;
  __int16 v75;
  _BOOL4 v76;
  uint64_t v77;

  v50 = a5;
  v77 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v57 = a4;
  v47 = (void (**)(id, void *))a8;
  v9 = _os_activity_create(&dword_1D5213000, "restoreFilesForDomain:relativePath:pendingOnly:range:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  MBGetDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v72 = v51;
    v73 = 2112;
    v74 = v57;
    v75 = 1024;
    v76 = v50;
    _os_log_impl(&dword_1D5213000, v10, OS_LOG_TYPE_DEFAULT, "Listing restore files for domain:%@, relativePath:%@, pendingOnly:%d", buf, 0x1Cu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"Listing restore files for domain:%@, relativePath:%@, pendingOnly:%d", v11, v12, v13, v14, v15, v16, (uint64_t)v51);
  }

  v48 = 0;
  do
  {
    context = (void *)MEMORY[0x1D8270CF0]();
    if (a6.length >= 0x1964)
      length = 6500;
    else
      length = a6.length;
    v70[0] = v51;
    v18 = v57;
    if (!v57)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v52;
    }
    v70[1] = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v50);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v70[2] = v19;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6.location);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v70[3] = v20;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", length);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v70[4] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageRestoreFiles"), v22, &v66);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = length;
    v56 = v66;

    if (!v57)
    if (v23)
    {
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v63;
        while (2)
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v63 != v26)
              objc_enumerationMutation(v24);
            v28 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v28) = v28 == v29;

            if ((v28 & 1) != 0)
            {
              v30 = 1;
              goto LABEL_22;
            }
          }
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
          if (v25)
            continue;
          break;
        }
      }
      v30 = 0;
LABEL_22:

      v31 = v54;
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v24, "count"));
      v33 = v32;
      if (v30)
      {
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v34 = v24;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
        if (v35)
        {
          v36 = *(_QWORD *)v59;
          do
          {
            for (j = 0; j != v35; ++j)
            {
              if (*(_QWORD *)v59 != v36)
                objc_enumerationMutation(v34);
              v38 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v38 == v39;

              if (!v40)
                objc_msgSend(v33, "addObject:", v38);
            }
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
          }
          while (v35);
        }

        v31 = v54;
      }
      else
      {
        objc_msgSend(v32, "addObjectsFromArray:", v24);
      }
      v47[2](v47, v33);
      if (objc_msgSend(v24, "count") && objc_msgSend(v24, "count") >= v31)
      {
        a6.location += v31;
        a6.length -= v31;
        v41 = 1;
      }
      else
      {
        v41 = 0;
      }
    }
    else
    {
      v41 = 0;
      v33 = v48;
      v48 = v56;
    }

    objc_autoreleasePoolPop(context);
  }
  while ((v41 & 1) != 0);
  v42 = v48;
  if (a7)
    v43 = v48 == 0;
  else
    v43 = 1;
  v44 = v43;
  if (!v43)
  {
    *a7 = objc_retainAutorelease(v48);
    v42 = v48;
  }

  os_activity_scope_leave(&state);
  return v44;
}

- (id)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 range:(_NSRange)a6 error:(id *)a7
{
  NSUInteger length;
  NSUInteger location;
  _BOOL8 v10;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  _BOOL4 v47;
  uint64_t v48;

  length = a6.length;
  location = a6.location;
  v10 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__1;
  v38 = __Block_byref_object_dispose__1;
  v39 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __74__MBXPCClient_restoreFilesForDomain_relativePath_pendingOnly_range_error___block_invoke;
  v33[3] = &unk_1E995D660;
  v33[4] = &v34;
  if (-[MBXPCClient restoreFilesForDomain:relativePath:pendingOnly:range:error:progress:](self, "restoreFilesForDomain:relativePath:pendingOnly:range:error:progress:", v13, v14, v10, location, length, a7, v33))
  {
    MBGetDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v15;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_msgSend((id)v35[5], "count");
        *(_DWORD *)buf = 134218754;
        v41 = v16;
        v42 = 2112;
        v43 = v13;
        v44 = 2112;
        v45 = v14;
        v46 = 1024;
        v47 = v10;
        _os_log_impl(&dword_1D5213000, v15, OS_LOG_TYPE_DEFAULT, "Found %lu restore files for domain:%@, relativePath:%@, pendingOnly:%d", buf, 0x26u);
      }

      v17 = objc_msgSend((id)v35[5], "count");
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Found %lu restore files for domain:%@, relativePath:%@, pendingOnly:%d", v18, v19, v20, v21, v22, v23, v17);
    }
  }
  else
  {
    MBGetDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v24 = *a7;
      *(_DWORD *)buf = 138412546;
      v41 = (uint64_t)v13;
      v42 = 2112;
      v43 = v24;
      _os_log_impl(&dword_1D5213000, v15, OS_LOG_TYPE_ERROR, "Failed to query restore files for domain %@: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to query restore files for domain %@: %@", v25, v26, v27, v28, v29, v30, (uint64_t)v13);
    }
  }

  v31 = (id)v35[5];
  _Block_object_dispose(&v34, 8);

  return v31;
}

void __74__MBXPCClient_restoreFilesForDomain_relativePath_pendingOnly_range_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v3, "addObjectsFromArray:", v7);

}

- (id)restoreFilesForDomain:(id)a3 error:(id *)a4
{
  return -[MBXPCClient restoreFilesForDomain:relativePath:pendingOnly:range:error:](self, "restoreFilesForDomain:relativePath:pendingOnly:range:error:", a3, 0, 1, 0, -1, a4);
}

- (id)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 error:(id *)a6
{
  return -[MBXPCClient restoreFilesForDomain:relativePath:pendingOnly:range:error:](self, "restoreFilesForDomain:relativePath:pendingOnly:range:error:", a3, a4, a5, 0, -1, a6);
}

- (void)prioritizeRestoreFileWithPath:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  os_activity_scope_state_s v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1D5213000, "prioritizeRestoreFileWithPath:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessagePrioritizeRestoreFile"), v6);

  os_activity_scope_leave(&v8);
}

- (BOOL)recordRestoreFailure:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;
  os_activity_scope_state_s v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBXPCClient.m"), 576, CFSTR("identifier must be non null"));

  }
  objc_msgSend(v7, "dataclass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBXPCClient.m"), 577, CFSTR("dataclass must be non null"));

  }
  v10 = _os_activity_create(&dword_1D5213000, "recordRestoreFailure:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter(v10, &v17);
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageReportRestoreFailure"), v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "BOOLValue");
  os_activity_scope_leave(&v17);

  return v13;
}

- (id)restoreFailuresForDataclass:(id)a3 assetType:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  os_activity_scope_state_s v18;
  _QWORD v19[4];
  NSRange v20;

  length = a5.length;
  location = a5.location;
  v19[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = _os_activity_create(&dword_1D5213000, "restoreFailuresForDataclass:assetType:range:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter(v11, &v18);
  v12 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[0] = v12;
  v13 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[1] = v13;
  v20.location = location;
  v20.length = length;
  NSStringFromRange(v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageListRestoreFailures"), v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  if (!v9)

  os_activity_scope_leave(&v18);
  return v16;
}

- (unint64_t)countOfRestoreFailuresForDataclass:(id)a3 assetType:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  os_activity_scope_state_s state;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1D5213000, "countOfRestoreFailuresForDataclass:assetType", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[0] = v9;
  v10 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageCountRestoreFailures"), v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  if (!v6)

  v13 = objc_msgSend(v12, "unsignedIntegerValue");
  os_activity_scope_leave(&state);

  return v13;
}

- (id)dateOfLastBackup
{
  return -[MBXPCClient dateOfLastBackupWithError:](self, "dateOfLastBackupWithError:", 0);
}

- (id)dateOfNextScheduledBackup
{
  return -[MBXPCClient dateOfNextScheduledBackupWithError:](self, "dateOfNextScheduledBackupWithError:", 0);
}

- (id)dateOfLastBackupWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "dateOfLastBackup", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageDateOfLastBackup"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_activity_scope_leave(&v8);

  return v6;
}

- (id)dateOfNextScheduledBackupWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "dateOfNextScheduledBackup", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageDateOfNextBackup"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_activity_scope_leave(&v8);

  return v6;
}

- (BOOL)restoreSupportsBatching
{
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v6;

  v3 = _os_activity_create(&dword_1D5213000, "restoreSupportsBatching:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageRestoreSupportsBatching"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "BOOLValue");

  os_activity_scope_leave(&v6);
  return (char)self;
}

- (void)setRestoreQualityOfService:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  os_activity_scope_state_s v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_1D5213000, "setRestoreQualityOfService:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v5, &v9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageSetRestoreQualityOfService"), v7);

  os_activity_scope_leave(&v9);
}

- (void)saveBackgroundRestoreCellularAccess:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(17, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MBXPCClient_saveBackgroundRestoreCellularAccess_completion___block_invoke;
  block[3] = &unk_1E995D688;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __62__MBXPCClient_saveBackgroundRestoreCellularAccess_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  os_activity_scope_state_s state;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D8270CF0]();
  v3 = _os_activity_create(&dword_1D5213000, "saveBackgroundRestoreCellularAccess:completion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = (void *)a1[4];
  v10[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v6 = (id)objc_msgSend(v4, "_sendRequest:arguments:error:", CFSTR("kMBMessageSaveBackgroundRestoreCellularAccess"), v5, &v8);
  v7 = v8;

  (*(void (**)(void))(a1[6] + 16))();
  os_activity_scope_leave(&state);

  objc_autoreleasePoolPop(v2);
}

- (void)fetchBackgroundRestoreCellularAccessWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(17, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__MBXPCClient_fetchBackgroundRestoreCellularAccessWithCompletion___block_invoke;
  v7[3] = &unk_1E995D090;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __66__MBXPCClient_fetchBackgroundRestoreCellularAccessWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  os_activity_scope_state_s state;

  v2 = (void *)MEMORY[0x1D8270CF0]();
  v3 = _os_activity_create(&dword_1D5213000, "fetchBackgroundRestoreCellularAccessWithCompletion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = *(void **)(a1 + 32);
  v7 = 0;
  objc_msgSend(v4, "backgroundRestoreCellularAccessWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  os_activity_scope_leave(&state);
  objc_autoreleasePoolPop(v2);
}

- (id)backgroundRestoreCellularAccessWithError:(id *)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v7;
  os_activity_scope_state_s state;

  v4 = _os_activity_create(&dword_1D5213000, "backgroundRestoreCellularAccessWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  v7 = 0;
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageFetchBackgroundRestoreCellularAccess"), 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_activity_scope_leave(&state);

  return v5;
}

- (BOOL)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "cellularAccess");
  if (objc_claimAutoreleasedReturnValue())
    -[MBXPCClient startRestoreForBackupUDID:snapshotID:error:].cold.1();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__MBXPCClient_startRestoreForBackupUDID_snapshotID_error___block_invoke;
  v15[3] = &unk_1E995D6B0;
  v17 = &v18;
  v11 = v10;
  v16 = v11;
  -[MBXPCClient startRestoreForBackupUDID:snapshotID:options:completion:](self, "startRestoreForBackupUDID:snapshotID:options:completion:", v8, a4, v9, v15);
  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v12 = (void *)v19[5];
  if (a5 && v12)
  {
    *a5 = objc_retainAutorelease(v12);
    v12 = (void *)v19[5];
  }
  v13 = v12 == 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __58__MBXPCClient_startRestoreForBackupUDID_snapshotID_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  MBXPCClient *v19;
  id v20;
  id v21;
  unint64_t v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!v10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must provide a valid backup UDID"));
  dispatch_get_global_queue(17, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MBXPCClient_startRestoreForBackupUDID_snapshotID_options_completion___block_invoke;
  block[3] = &unk_1E995D6D8;
  v21 = v12;
  v22 = a4;
  v18 = v10;
  v19 = self;
  v20 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

void __71__MBXPCClient_startRestoreForBackupUDID_snapshotID_options_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  MBSnapshotIdentifier *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  os_activity_scope_state_s state;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D8270CF0]();
  v3 = _os_activity_create(&dword_1D5213000, "startRestoreForBackupUDID:snapshotID:options:completion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = -[MBSnapshotIdentifier initWithBackupUDID:snapshotID:]([MBSnapshotIdentifier alloc], "initWithBackupUDID:snapshotID:", a1[4], a1[8]);
  v6 = (void *)a1[5];
  v5 = a1[6];
  v12[0] = v4;
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v8 = (id)objc_msgSend(v6, "_sendRequest:arguments:error:", CFSTR("kMBMessageStartRestore"), v7, &v10);
  v9 = v10;

  (*(void (**)(void))(a1[7] + 16))();
  os_activity_scope_leave(&state);

  objc_autoreleasePoolPop(v2);
}

- (void)startRestoreForSnapshot:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    -[MBXPCClient startRestoreForSnapshot:options:completion:].cold.1();
  v11 = v10;
  dispatch_get_global_queue(17, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__MBXPCClient_startRestoreForSnapshot_options_completion___block_invoke;
  v16[3] = &unk_1E995D700;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v8;
  dispatch_async(v12, v16);

}

void __58__MBXPCClient_startRestoreForSnapshot_options_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  os_activity_scope_state_s state;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D8270CF0]();
  v3 = _os_activity_create(&dword_1D5213000, "startRestoreForSnapshot:options:completion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = (void *)a1[4];
  v5 = a1[6];
  v11[0] = a1[5];
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v7 = (id)objc_msgSend(v4, "_sendRequest:arguments:error:", CFSTR("kMBMessageStartRestore"), v6, &v9);
  v8 = v9;

  (*(void (**)(void))(a1[7] + 16))();
  os_activity_scope_leave(&state);

  objc_autoreleasePoolPop(v2);
}

- (BOOL)restoreFileWithPath:(id)a3 error:(id *)a4
{
  return -[MBXPCClient restoreFileWithPath:context:error:](self, "restoreFileWithPath:context:error:", a3, 0, a4);
}

- (BOOL)restoreFileWithPath:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  os_activity_scope_state_s v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must provide a valid file path"));
  v10 = _os_activity_create(&dword_1D5213000, "restoreFileWithPath:context:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v10, &v15);
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageStartFileRestore"), v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "BOOLValue");
  os_activity_scope_leave(&v15);

  return v13;
}

- (BOOL)restoreFilesWithPaths:(id)a3 error:(id *)a4
{
  return -[MBXPCClient restoreFilesWithPaths:context:error:](self, "restoreFilesWithPaths:context:error:", a3, 0, a4);
}

- (BOOL)restoreFilesWithPaths:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  os_activity_scope_state_s v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8 || !objc_msgSend(v8, "count"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must provide a valid array of file paths"));
  v10 = _os_activity_create(&dword_1D5213000, "restoreFilesWithPaths:context:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v10, &v15);
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageStartFilesRestore"), v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "BOOLValue");
  os_activity_scope_leave(&v15);

  return v13;
}

- (BOOL)restoreBookWithPath:(id)a3 error:(id *)a4
{
  return -[MBXPCClient restoreBookWithPath:context:error:](self, "restoreBookWithPath:context:error:", a3, 0, a4);
}

- (BOOL)restoreBookWithPath:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  os_activity_scope_state_s v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = _os_activity_create(&dword_1D5213000, "restoreBookWithPath:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v10, &v14);
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageStartBookRestore"), v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(v12, "BOOLValue");
  os_activity_scope_leave(&v14);

  return (char)a5;
}

- (BOOL)_restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 qos:(id)a5 context:(id)a6 error:(id *)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  os_activity_scope_state_s state;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[MBXPCClient _restoreApplicationWithBundleID:failed:qos:context:error:].cold.1();
  }
  if (!v12)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must provide a valid bundle id"));
  v15 = _os_activity_create(&dword_1D5213000, "restoreApplicationWithBundleID:failed:withQOS:context:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  v16 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayWithObjects:", v12, v17, v13, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageStartAppRestore"), v18, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  os_activity_scope_leave(&state);
  return v20;
}

- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 withQOS:(int64_t)a5 context:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  void *v12;
  id v13;
  id v14;
  void *v15;

  v9 = a4;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a6;
  v14 = a3;
  objc_msgSend(v12, "numberWithInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = -[MBXPCClient _restoreApplicationWithBundleID:failed:qos:context:error:](self, "_restoreApplicationWithBundleID:failed:qos:context:error:", v14, v9, v15, v13, a7);

  return (char)a7;
}

- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 context:(id)a5 error:(id *)a6
{
  return -[MBXPCClient _restoreApplicationWithBundleID:failed:qos:context:error:](self, "_restoreApplicationWithBundleID:failed:qos:context:error:", a3, a4, 0, a5, a6);
}

- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 error:(id *)a5
{
  return -[MBXPCClient restoreApplicationWithBundleID:failed:context:error:](self, "restoreApplicationWithBundleID:failed:context:error:", a3, a4, 0, a5);
}

- (BOOL)cancelApplicationRestoreWithBundleID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  os_activity_scope_state_s v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must provide a valid bundle id"));
  v7 = _os_activity_create(&dword_1D5213000, "cancelApplicationRestoreWithBundleID:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageCancelAppRestore"), v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  os_activity_scope_leave(&v12);
  return v10;
}

- (BOOL)saveKeybagsForBackupUDID:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  os_activity_scope_state_s v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = _os_activity_create(&dword_1D5213000, "saveKeybagsForBackupUDID:withError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v14.opaque[0] = 0;
    v14.opaque[1] = 0;
    os_activity_scope_enter(v8, &v14);
    objc_msgSend(v7, "mb_backupIDByRemovingCKPrefix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageSaveKeybags"), v10, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "BOOLValue");
    os_activity_scope_leave(&v14);

  }
  else if (a4)
  {
    +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("must provide a valid backupUDID"));
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v12;
}

- (void)finishRestore
{
  NSObject *v3;
  id v4;
  os_activity_scope_state_s v5;

  v3 = _os_activity_create(&dword_1D5213000, "finishRestore", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  v4 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageFinishRestore"), 0);
  os_activity_scope_leave(&v5);

}

- (void)insufficientFreeSpaceToRestore
{
  NSObject *v3;
  id v4;
  os_activity_scope_state_s v5;

  v3 = _os_activity_create(&dword_1D5213000, "insufficientFreeSpaceToRestore", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  v4 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageInsufficientFreeSpaceToRestore"), 0);
  os_activity_scope_leave(&v5);

}

- (void)wakeUp
{
  NSObject *v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = _os_activity_create(&dword_1D5213000, "wakeUp", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v13 = 0;
  v4 = -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageWakeUp"), 0, &v13);
  v5 = v13;
  if (v5)
  {
    MBGetDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1D5213000, v6, OS_LOG_TYPE_ERROR, "Failed to send WakeUp message to backupd: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to send WakeUp message to backupd: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v5);
    }

  }
  os_activity_scope_leave(&state);

}

- (void)accountChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1D5213000, "accountChanged", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v20[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v7 = -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageAccountChanged"), v6, &v16);
  v8 = v16;

  if (v8)
  {
    MBGetDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v8;
      _os_log_impl(&dword_1D5213000, v9, OS_LOG_TYPE_ERROR, "Failed to send AccountChanged message to backupd: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to send AccountChanged message to backupd: %@", v10, v11, v12, v13, v14, v15, (uint64_t)v8);
    }

  }
  os_activity_scope_leave(&state);

}

- (void)keyBagIsLocking
{
  NSObject *v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = _os_activity_create(&dword_1D5213000, "keyBagIsLocking", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v13 = 0;
  v4 = -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageKeyBagIsLocking"), 0, &v13);
  v5 = v13;
  if (v5)
  {
    MBGetDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1D5213000, v6, OS_LOG_TYPE_ERROR, "Failed to send KeyBagIsLocking message to backupd: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to send KeyBagIsLocking message to backupd: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v5);
    }

  }
  os_activity_scope_leave(&state);

}

- (void)keyBagIsUnlocked
{
  void *v3;
  unsigned int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint8_t v23[4];
  id v24;
  uint8_t buf[8];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)CFPreferencesCopyValue(CFSTR("NotifyDaemonNextTimeKeyBagIsUnlocked"), CFSTR("com.apple.MobileBackup"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  v4 = objc_msgSend(v3, "BOOLValue");
  MBGetDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v4;
    LOWORD(v26[0]) = 2112;
    *(_QWORD *)((char *)v26 + 2) = v3;
    _os_log_impl(&dword_1D5213000, v5, OS_LOG_TYPE_INFO, "kMBNotifyDaemonNextTimeKeyBagIsUnlocked %d (%@)", buf, 0x12u);
    _MBLog(CFSTR("INFO"), (uint64_t)"kMBNotifyDaemonNextTimeKeyBagIsUnlocked %d (%@)", v6, v7, v8, v9, v10, v11, v4);
  }

  if (v4)
  {
    v12 = _os_activity_create(&dword_1D5213000, "keyBagIsUnlocked", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    *(_QWORD *)buf = 0;
    v26[0] = 0;
    os_activity_scope_enter(v12, (os_activity_scope_state_t)buf);
    v22 = 0;
    v13 = -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageKeyBagIsUnlocked"), 0, &v22);
    v14 = v22;
    if (v14)
    {
      MBGetDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v23 = 138412290;
        v24 = v14;
        _os_log_impl(&dword_1D5213000, v15, OS_LOG_TYPE_DEFAULT, "Failed to send KeyBagIsUnlocked message to backupd: %@", v23, 0xCu);
        _MBLog(CFSTR("DEFAULT"), (uint64_t)"Failed to send KeyBagIsUnlocked message to backupd: %@", v16, v17, v18, v19, v20, v21, (uint64_t)v14);
      }

    }
    os_activity_scope_leave((os_activity_scope_state_t)buf);

  }
}

- (BOOL)deleteAccountWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "deleteAccountWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageDeleteAccount"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "BOOLValue");

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (BOOL)deleteBackupUDID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  os_activity_scope_state_s v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must provide a valid backup"));
  v7 = _os_activity_create(&dword_1D5213000, "deleteBackupUDID:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v7, &v13);
  objc_msgSend(v6, "mb_backupIDByRemovingCKPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageDeleteBackup"), v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "BOOLValue");
  os_activity_scope_leave(&v13);

  return v11;
}

- (BOOL)deleteSnapshotID:(unint64_t)a3 fromBackupUDID:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  os_activity_scope_state_s state;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must provide a valid backup UDID"));
  v9 = _os_activity_create(&dword_1D5213000, "deleteSnapshotID:fromBackupUDID:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  objc_msgSend(v8, "mb_backupIDByRemovingCKPrefix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageDeleteSnapshot"), v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "BOOLValue");
  os_activity_scope_leave(&state);

  return v14;
}

- (id)journalLastModifiedForBackupUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  os_activity_scope_state_s state;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "length"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must provide a valid backup UDID"));
  v8 = _os_activity_create(&dword_1D5213000, "journalLastModifiedForBackupUUID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  objc_msgSend(v7, "mb_backupIDByRemovingCKPrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MBGetDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v9;
    _os_log_impl(&dword_1D5213000, v10, OS_LOG_TYPE_DEFAULT, "journalLastModifiedForBackupUUID: %@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"journalLastModifiedForBackupUUID: %@", v11, v12, v13, v14, v15, v16, (uint64_t)v9);
  }

  v21 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageJournalLastModified"), v17, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&state);
  return v18;
}

- (id)journalForBackupUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  os_activity_scope_state_s state;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "length"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must provide a valid backup UDID"));
  v8 = _os_activity_create(&dword_1D5213000, "journalForBackupUUID:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  objc_msgSend(v7, "mb_backupIDByRemovingCKPrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MBGetDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v9;
    _os_log_impl(&dword_1D5213000, v10, OS_LOG_TYPE_DEFAULT, "journalForBackup: backupUDID: %@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"journalForBackup: backupUDID: %@", v11, v12, v13, v14, v15, v16, (uint64_t)v9);
  }

  v21 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBListJournalActions"), v17, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&state);
  return v18;
}

- (id)filesForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  os_activity_scope_state_s state;
  _QWORD v24[2];
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  if (!v8 || !objc_msgSend(v8, "length"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must provide a valid backup UDID"));
  v10 = _os_activity_create(&dword_1D5213000, "filesForSnapshotID:backupUDID:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  objc_msgSend(v9, "mb_backupIDByRemovingCKPrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  MBGetDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v26 = a3;
    v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_1D5213000, v12, OS_LOG_TYPE_DEFAULT, "filesForSnapshot (client): %ld backupUDID: %@", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"filesForSnapshot (client): %ld backupUDID: %@", v13, v14, v15, v16, v17, v18, a3);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v19;
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageListSnapshotFiles"), v20, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&state);
  return v21;
}

- (BOOL)mergeSnapshots:(id)a3 backupUUID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  os_activity_scope_state_s v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = _os_activity_create(&dword_1D5213000, "mergeSnapshots:backupUUID:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v10, &v16);
  objc_msgSend(v9, "mb_backupIDByRemovingCKPrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageMergeSnapshots"), v13, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v14, "BOOLValue");

  os_activity_scope_leave(&v16);
  return (char)a5;
}

- (BOOL)acquireLockWithBackupUDID:(id)a3 owner:(id)a4 timeout:(double)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v21;
  void *v22;
  os_activity_scope_state_s v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = v12;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBXPCClient.m"), 979, CFSTR("Must provide a valid backup UDID"));

    if (v13)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBXPCClient.m"), 980, CFSTR("Must provide a valid lock owner"));

    goto LABEL_3;
  }
  if (!v12)
    goto LABEL_5;
LABEL_3:
  v14 = _os_activity_create(&dword_1D5213000, "acquireLockWithBackupUDID:owner:timeout:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  os_activity_scope_enter(v14, &v23);
  objc_msgSend(v11, "mb_backupIDByRemovingCKPrefix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v15;
  v24[1] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageAcquireLock"), v17, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "BOOLValue");
  os_activity_scope_leave(&v23);

  return v19;
}

- (BOOL)releaseLockWithBackupUDID:(id)a3 owner:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v18;
  void *v19;
  os_activity_scope_state_s state;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBXPCClient.m"), 993, CFSTR("Must provide a valid backup UDID"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBXPCClient.m"), 994, CFSTR("Must provide a valid lock owner"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = _os_activity_create(&dword_1D5213000, "releaseLockWithBackupUDID:account:owner:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  objc_msgSend(v9, "mb_backupIDByRemovingCKPrefix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v13;
  v21[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageReleaseLock"), v14, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "BOOLValue");
  os_activity_scope_leave(&state);

  return v16;
}

- (id)deviceLockInfosWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "deviceLockInfosWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageFetchDeviceLockInfos"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_activity_scope_leave(&v8);

  return v6;
}

- (BOOL)startScanWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "startScanWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageStartScan"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "BOOLValue");

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (BOOL)startScanForBundleIDs:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v13;
  os_activity_scope_state_s v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBXPCClient.m"), 1022, CFSTR("Must provide bundleIDs"));

  }
  v8 = _os_activity_create(&dword_1D5213000, "startScanForBundleIDs:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v8, &v14);
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageStartScanForBundleIDs"), v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "BOOLValue");
  os_activity_scope_leave(&v14);

  return v11;
}

- (unint64_t)nextBackupSize
{
  NSObject *v3;
  void *v4;
  unint64_t v5;
  os_activity_scope_state_s v7;

  v3 = _os_activity_create(&dword_1D5213000, "nextBackupSize", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v3, &v7);
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageNextBackupSize"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");

  os_activity_scope_leave(&v7);
  return v5;
}

- (id)nextBackupSizeInfo
{
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v6;

  v3 = _os_activity_create(&dword_1D5213000, "nextBackupSizeInfo:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageNextBackupSizeInfo"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_activity_scope_leave(&v6);

  return v4;
}

- (id)domainInfoForName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  os_activity_scope_state_s v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1D5213000, "domainInfoForName:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v5, &v9);
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageDomainInfo"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&v9);
  return v7;
}

- (id)domainInfoList
{
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v6;

  v3 = _os_activity_create(&dword_1D5213000, "domainInfoList", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  if (domainInfoList_onceToken != -1)
    dispatch_once(&domainInfoList_onceToken, &__block_literal_global_9);
  dispatch_semaphore_wait((dispatch_semaphore_t)domainInfoList_domainInfosSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageDomainInfoList"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal((dispatch_semaphore_t)domainInfoList_domainInfosSemaphore);
  os_activity_scope_leave(&v6);

  return v4;
}

void __29__MBXPCClient_domainInfoList__block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(2);
  v1 = (void *)domainInfoList_domainInfosSemaphore;
  domainInfoList_domainInfosSemaphore = (uint64_t)v0;

}

- (id)disabledDomainInfos
{
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v6;

  v3 = _os_activity_create(&dword_1D5213000, "disabledDomainInfos", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageDisabledDomainInfos"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_activity_scope_leave(&v6);

  return v4;
}

- (BOOL)removeDomainName:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  os_activity_scope_state_s v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1D5213000, "removeDomainName:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageRemoveDomain"), v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v9, "BOOLValue");
  os_activity_scope_leave(&v11);

  return (char)a4;
}

- (id)reservedBackupSizeListWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "reservedBackupSizeList:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageReservedBackupSizeList"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_activity_scope_leave(&v8);

  return v6;
}

- (BOOL)isBackupEnabledForDomainName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  os_activity_scope_state_s v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1D5213000, "isBackupEnabledForDomainName:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v5, &v9);
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageIsDomainEnabled"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = objc_msgSend(v7, "BOOLValue");
  os_activity_scope_leave(&v9);

  return (char)self;
}

- (void)setBackupEnabled:(BOOL)a3 forDomainName:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  os_activity_scope_state_s state;
  _QWORD v12[3];

  v4 = a3;
  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = _os_activity_create(&dword_1D5213000, "setBackupEnabled:forDomainName:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageSetDomainEnabled"), v9);
  os_activity_scope_leave(&state);

}

- (BOOL)extractItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 toPath:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  os_activity_scope_state_s v25;
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Null backup UDID"));
    if (v15)
    {
LABEL_3:
      if (v16)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Null relative path"));
      if (v17)
        goto LABEL_5;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Null destination path"));
      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Null domain name"));
  if (!v16)
    goto LABEL_8;
LABEL_4:
  if (!v17)
    goto LABEL_9;
LABEL_5:
  v18 = _os_activity_create(&dword_1D5213000, "extractItemFromBackupUDID:snapshotID:domainName:relativePath:toPath:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v25.opaque[0] = 0;
  v25.opaque[1] = 0;
  os_activity_scope_enter(v18, &v25);
  objc_msgSend(v14, "mb_backupIDByRemovingCKPrefix");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v20;
  v26[2] = v15;
  v26[3] = v16;
  v26[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageExtractItem"), v21, a8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  os_activity_scope_leave(&v25);
  return v23;
}

- (BOOL)addFileToBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 fromPath:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  os_activity_scope_state_s v25;
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Null backup UDID"));
    if (v15)
    {
LABEL_3:
      if (v16)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Null relative path"));
      if (v17)
        goto LABEL_5;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Null path"));
      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Null domain name"));
  if (!v16)
    goto LABEL_8;
LABEL_4:
  if (!v17)
    goto LABEL_9;
LABEL_5:
  v18 = _os_activity_create(&dword_1D5213000, "addFileToBackupUDID:snapshotID:domainName:relativePath:fromPath:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v25.opaque[0] = 0;
  v25.opaque[1] = 0;
  os_activity_scope_enter(v18, &v25);
  objc_msgSend(v14, "mb_backupIDByRemovingCKPrefix");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v20;
  v26[2] = v15;
  v26[3] = v16;
  v26[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageAddFile"), v21, a8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  os_activity_scope_leave(&v25);
  return v23;
}

- (BOOL)deleteItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  os_activity_scope_state_s state;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Null domain name"));
    if (v14)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Null relative path"));
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Null backup UDID"));
  if (!v13)
    goto LABEL_6;
LABEL_3:
  if (!v14)
    goto LABEL_7;
LABEL_4:
  v15 = _os_activity_create(&dword_1D5213000, "deleteItemFromBackupUDID:snapshotID:domainName:relativePath:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  objc_msgSend(v12, "mb_backupIDByRemovingCKPrefix");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  v23[2] = v13;
  v23[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageDeleteItem"), v18, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  os_activity_scope_leave(&state);
  return v20;
}

- (id)getAppleIDsForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  void *v9;

  objc_msgSend(a3, "mb_backupIDByRemovingCKPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient getAppleIDsForBackupUDID:snapshotID:activeAppleID:error:](self, "getAppleIDsForBackupUDID:snapshotID:activeAppleID:error:", v8, a4, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)getAppleIDsForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 activeAppleID:(id *)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  os_activity_scope_state_s state;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!v10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must provide a valid backup UDID"));
  v11 = _os_activity_create(&dword_1D5213000, "getAppleIDsForBackupUDID:snapshotID:activeAppleID:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  objc_msgSend(v10, "mb_backupIDByRemovingCKPrefix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageGetAppleIDs"), v14, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "subarrayWithRange:", 0, objc_msgSend(v15, "count") - 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 == v18)
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(v15, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a5)
    *a5 = objc_retainAutorelease(v19);

  os_activity_scope_leave(&state);
  return v16;
}

- (id)getAppleIDsMapForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 activeAppleID:(id *)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  os_activity_scope_state_s state;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!v10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must provide a valid backup UDID"));
  v11 = _os_activity_create(&dword_1D5213000, "getAppleIDsMapForBackupUDID:snapshotID:activeAppleID:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  objc_msgSend(v10, "mb_backupIDByRemovingCKPrefix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageGetAppleIDsMap"), v14, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 == v17)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(v15, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v15, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 == v20)
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(v15, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a5)
    *a5 = objc_retainAutorelease(v21);

  os_activity_scope_leave(&state);
  return v18;
}

- (id)getBuddyDataStashForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  os_activity_scope_state_s state;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must provide a valid backup UDID"));
  v9 = _os_activity_create(&dword_1D5213000, "getBuddyDataStashForBackupUDID:snapshotID:activeAppleID:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  objc_msgSend(v8, "mb_backupIDByRemovingCKPrefix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageGetBuddyData"), v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&state);
  return v13;
}

- (id)restoreInfo
{
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v6;

  v3 = _os_activity_create(&dword_1D5213000, "restoreInfo", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageRestoreInfo"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_activity_scope_leave(&v6);

  return v4;
}

- (void)setRestoreSessionWithBackupUDID:(id)a3 snapshotUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  os_activity_scope_state_s state;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1D5213000, "setRestoreSessionWithBackupUDID:snapshotUUID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  objc_msgSend(v6, "mb_backupIDByRemovingCKPrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageSetRestoreSession"), v10);

  os_activity_scope_leave(&state);
}

- (void)clearRestoreSession
{
  NSObject *v3;
  id v4;
  os_activity_scope_state_s v5;

  v3 = _os_activity_create(&dword_1D5213000, "clearRestoreSession", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  v4 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageClearRestoreSession"), 0);
  os_activity_scope_leave(&v5);

}

- (void)setAllowiTunesBackup:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  os_activity_scope_state_s v9;
  _QWORD v10[2];

  v3 = a3;
  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_1D5213000, "setAllowiTunesBackup:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v5, &v9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageSetAllowiTunesBackup"), v7);
  os_activity_scope_leave(&v9);

}

- (BOOL)allowiTunesBackup
{
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v6;

  v3 = _os_activity_create(&dword_1D5213000, "allowiTunesBackup", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageGetAllowiTunesBackup"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "BOOLValue");

  os_activity_scope_leave(&v6);
  return (char)self;
}

- (BOOL)airTrafficShouldCreateAppPlaceholdersWithError:(id *)a3
{
  return 1;
}

- (void)rebootDevice
{
  -[MBXPCClient rebootDevice:](self, "rebootDevice:", 0);
}

- (void)rebootDevice:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  dispatch_time_t v10;
  os_activity_scope_state_s v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = dispatch_semaphore_create(0);
  v7 = MEMORY[0x1E0C80FC8];
  while (1)
  {
    v8 = _os_activity_create(&dword_1D5213000, "rebootDevice", v7, OS_ACTIVITY_FLAG_DEFAULT);
    v11.opaque[0] = 0;
    v11.opaque[1] = 0;
    os_activity_scope_enter(v8, &v11);
    v9 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageRebootDevice"), v5);
    v10 = dispatch_time(0, 300000000000);
    dispatch_semaphore_wait(v6, v10);
    os_activity_scope_leave(&v11);

  }
}

- (void)repair
{
  NSObject *v3;
  id v4;
  os_activity_scope_state_s v5;

  v3 = _os_activity_create(&dword_1D5213000, "repair", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  v4 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageRepair"), 0);
  os_activity_scope_leave(&v5);

}

- (BOOL)countCameraRollQuota
{
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v6;

  v3 = _os_activity_create(&dword_1D5213000, "countCameraRollQuota", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageCountCameraRollQuota"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "BOOLValue");

  os_activity_scope_leave(&v6);
  return (char)self;
}

- (BOOL)countCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = _os_activity_create(&dword_1D5213000, "countCameraRollQuotaForBackupUDID:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v7, &v10);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageCountCameraRollQuota"), 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v8, "BOOLValue");

  os_activity_scope_leave(&v10);
  return (char)a4;
}

- (BOOL)discountCameraRollQuota
{
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v6;

  v3 = _os_activity_create(&dword_1D5213000, "discountCameraRollQuota", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageDiscountCameraRollQuota"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "BOOLValue");

  os_activity_scope_leave(&v6);
  return (char)self;
}

- (BOOL)discountCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = _os_activity_create(&dword_1D5213000, "discountCameraRollQuotaForBackupUDID:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v7, &v10);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageDiscountCameraRollQuota"), 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v8, "BOOLValue");

  os_activity_scope_leave(&v10);
  return (char)a4;
}

- (BOOL)prepareForBackgroundRestoreWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "prepareForBackgroundRestoreWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessagePrepareForBackgroundRestore"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "BOOLValue");

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (BOOL)archiveLogsTo:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  os_activity_scope_state_s v15;
  const __CFString *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1D5213000, "archiveLogsTo:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v7, &v15);
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageArchiveLogs"), v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if (a4 && (_DWORD)v10)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v16 = CFSTR("status");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), 1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  os_activity_scope_leave(&v15);

  return (_DWORD)v10 == 0;
}

- (BOOL)pinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  os_activity_scope_state_s state;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must provide a valid backup UDID"));
  v9 = _os_activity_create(&dword_1D5213000, "pinSnapshotID:backupUDID:error", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  objc_msgSend(v8, "mb_backupIDByRemovingCKPrefix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessagePinSnapshot"), v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "BOOLValue");
  os_activity_scope_leave(&state);

  return v14;
}

- (BOOL)unpinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  os_activity_scope_state_s state;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must provide a valid backup UDID"));
  v9 = _os_activity_create(&dword_1D5213000, "unpinSnapshotID:backupUDID:error", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  objc_msgSend(v8, "mb_backupIDByRemovingCKPrefix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageUnpinSnapshot"), v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "BOOLValue");
  os_activity_scope_leave(&state);

  return v14;
}

- (void)boostBackgroundRestoreWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(17, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__MBXPCClient_boostBackgroundRestoreWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E995D090;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __59__MBXPCClient_boostBackgroundRestoreWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  os_activity_scope_state_s state;

  v2 = (void *)MEMORY[0x1D8270CF0]();
  v3 = _os_activity_create(&dword_1D5213000, "boostRunningBackgroundRestore:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = *(void **)(a1 + 32);
  v7 = 0;
  v5 = (id)objc_msgSend(v4, "_sendRequest:arguments:error:", CFSTR("kMBMessageBoostBackgroundRestore"), 0, &v7);
  v6 = v7;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  os_activity_scope_leave(&state);
  objc_autoreleasePoolPop(v2);
}

- (void)fetchAppBundleIDsForSnapshot:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(17, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MBXPCClient_fetchAppBundleIDsForSnapshot_completion___block_invoke;
  block[3] = &unk_1E995D688;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __55__MBXPCClient_fetchAppBundleIDsForSnapshot_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  os_activity_scope_state_s state;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D8270CF0]();
  v3 = _os_activity_create(&dword_1D5213000, "fetchAppBundleIDs", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = (void *)a1[4];
  v10[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v4, "_sendRequest:arguments:error:", CFSTR("kMBMessageFetchBundleIDs"), v5, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;

  (*(void (**)(void))(a1[6] + 16))();
  os_activity_scope_leave(&state);

  objc_autoreleasePoolPop(v2);
}

- (void)fetchRestorableSnapshotsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(17, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__MBXPCClient_fetchRestorableSnapshotsWithCompletion___block_invoke;
  v7[3] = &unk_1E995D090;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __54__MBXPCClient_fetchRestorableSnapshotsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  os_activity_scope_state_s state;

  v2 = (void *)MEMORY[0x1D8270CF0]();
  v3 = _os_activity_create(&dword_1D5213000, "fetchRestorableSnapshots", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = *(void **)(a1 + 32);
  v7 = 0;
  objc_msgSend(v4, "_sendRequest:arguments:error:", CFSTR("kMBMessageFetchRestorableSnapshots"), 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  os_activity_scope_leave(&state);
  objc_autoreleasePoolPop(v2);
}

- (id)pendingSnapshotForCurrentDeviceWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "pendingSnapshotForCurrentDeviceWithError", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessagePendingSnapshotForCurrentDevice"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_activity_scope_leave(&v8);

  return v6;
}

- (unint64_t)_backupOnCellularSupport
{
  MBXPCClient *v2;
  MBCellularDataSubscriptionMonitor *v3;
  NSObject *v4;
  objc_class *v5;
  const char *Name;
  NSObject *v7;
  dispatch_queue_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  -[MBXPCClient cellularDataSubscriptionMonitor](v2, "cellularDataSubscriptionMonitor");
  v3 = (MBCellularDataSubscriptionMonitor *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MBXPCClient initialBackupOnCellularSupportGroup](v2, "initialBackupOnCellularSupportGroup");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_initWeak(&location, v2);
    v4 = dispatch_group_create();
    -[MBXPCClient setInitialBackupOnCellularSupportGroup:](v2, "setInitialBackupOnCellularSupportGroup:", v4);
    dispatch_group_enter(v4);
    v5 = (objc_class *)objc_opt_class();
    Name = class_getName(v5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create(Name, v7);

    v3 = -[MBCellularDataSubscriptionMonitor initWithQueue:timeout:]([MBCellularDataSubscriptionMonitor alloc], "initWithQueue:timeout:", v8, 30);
    -[MBXPCClient setCellularDataSubscriptionMonitor:](v2, "setCellularDataSubscriptionMonitor:", v3);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __39__MBXPCClient__backupOnCellularSupport__block_invoke;
    v14 = &unk_1E995D040;
    objc_copyWeak(&v15, &location);
    -[MBCellularDataSubscriptionMonitor setBackupOnCellularSupportHandler:](v3, "setBackupOnCellularSupportHandler:", &v11);
    -[MBCellularDataSubscriptionMonitor start](v3, "start", v11, v12, v13, v14);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

  if (v4)
    dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v9 = -[MBCellularDataSubscriptionMonitor backupOnCellularSupport](v3, "backupOnCellularSupport");

  return v9;
}

void __39__MBXPCClient__backupOnCellularSupport__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "initialBackupOnCellularSupportGroup");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(v3, "setInitialBackupOnCellularSupportGroup:", 0);
      dispatch_group_leave(v2);
    }

    WeakRetained = v3;
  }

}

- (BOOL)isBackupOnCellularAllowedWithAccount:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;

  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "aa_useCellularForDataclass:", *MEMORY[0x1E0C8EE18]))
    v7 = (-[MBXPCClient _backupOnCellularSupport](self, "_backupOnCellularSupport") >> 1) & 1;
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (BOOL)isManualBackupOnCellularAllowedWithAccount:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;

  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "aa_useCellularForDataclass:", *MEMORY[0x1E0C8EE18]))
    v7 = -[MBXPCClient _backupOnCellularSupport](self, "_backupOnCellularSupport") & 1;
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (unint64_t)backupOnCellularSupportWithAccount:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;

  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "aa_useCellularForDataclass:", *MEMORY[0x1E0C8EE18]))
    v7 = -[MBXPCClient _backupOnCellularSupport](self, "_backupOnCellularSupport");
  else
    v7 = 0;

  return v7;
}

- (BOOL)isBackupOnCellularEnabledWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "isBackupOnCellularEnabledWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageIsBackupOnCellularEnabled"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "BOOLValue");

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (BOOL)setBackupOnCellularEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  os_activity_scope_state_s v12;
  _QWORD v13[2];

  v5 = a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = _os_activity_create(&dword_1D5213000, "setBackupOnCellularEnabled:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageSetBackupOnCellularEnabled"), v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v10, "BOOLValue");
  os_activity_scope_leave(&v12);

  return (char)a4;
}

- (BOOL)setEntryPointForMegaBackupTelemetry:(int64_t)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  os_activity_scope_state_s v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = _os_activity_create(&dword_1D5213000, "setEntryPointForMegaBackupTelemetry:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageSetEntryPointForMegaBackupTelemetry"), v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v10, "BOOLValue");
  os_activity_scope_leave(&v12);

  return (char)a4;
}

- (BOOL)setPrebuddyUIDeltaTelemetry:(id)a3 date:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  os_activity_scope_state_s state;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = _os_activity_create(&dword_1D5213000, "setPrebuddyUIDeltaTelemetry:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  v15[0] = v8;
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageSetPrebuddyUIDeltaTelemetry"), v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(v12, "BOOLValue");
  os_activity_scope_leave(&state);

  return (char)a5;
}

- (BOOL)logPrebuddyFlowTelemetry:(int64_t)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  os_activity_scope_state_s v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = _os_activity_create(&dword_1D5213000, "logPrebuddyFlowTelemetry:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageLogPrebuddyFlowTelemetry"), v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v10, "BOOLValue");
  os_activity_scope_leave(&v12);

  return (char)a4;
}

- (id)synchronizeFileListsWithDeviceUUID:(id)a3 commitID:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v14[0] = a3;
  v14[1] = a4;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageSynchronizeFileLists"), v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)restoreDomain:(id)a3 deviceUUID:(id)a4 commitID:(id)a5 intoPath:(id)a6 error:(id *)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v20[0] = a3;
  v20[1] = a4;
  v20[2] = a5;
  v20[3] = a6;
  v12 = (void *)MEMORY[0x1E0C99D20];
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "arrayWithObjects:count:", v20, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageRestoreDomain"), v17, a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a7) = objc_msgSend(v18, "BOOLValue");
  return (char)a7;
}

- (id)fetchBackupCKRecordsIntoDB:(id *)a3
{
  return -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageFetchBackupCKRecordsIntoDB"), 0, a3);
}

- (BOOL)startDeviceTransferWithTaskType:(int64_t)a3 sessionInfo:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  os_activity_scope_state_s state;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!a3)
    -[MBXPCClient startDeviceTransferWithTaskType:sessionInfo:error:].cold.1();
  v9 = v8;
  if (!v8)
    -[MBXPCClient startDeviceTransferWithTaskType:sessionInfo:error:].cold.2();
  if (!a5)
    -[MBXPCClient startDeviceTransferWithTaskType:sessionInfo:error:].cold.3();
  v10 = _os_activity_create(&dword_1D5213000, "startDeviceTransfer", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageStartDeviceTransfer"), v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "BOOLValue");
  os_activity_scope_leave(&state);

  return v14;
}

- (BOOL)cancelDeviceTransferWithTaskType:(int64_t)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  os_activity_scope_state_s v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    -[MBXPCClient cancelDeviceTransferWithTaskType:error:].cold.1();
  if (!a4)
    -[MBXPCClient cancelDeviceTransferWithTaskType:error:].cold.2();
  v7 = _os_activity_create(&dword_1D5213000, "cancelDeviceTransfer", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v7, &v13);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageCancelDeviceTransfer"), v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "BOOLValue");
  os_activity_scope_leave(&v13);

  return v11;
}

- (BOOL)resumeDeviceTransferWithTaskType:(int64_t)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  os_activity_scope_state_s v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    -[MBXPCClient resumeDeviceTransferWithTaskType:error:].cold.1();
  if (!a4)
    -[MBXPCClient resumeDeviceTransferWithTaskType:error:].cold.2();
  v7 = _os_activity_create(&dword_1D5213000, "resumeDeviceTransfer", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v7, &v13);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageResumeDeviceTransfer"), v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "BOOLValue");
  os_activity_scope_leave(&v13);

  return v11;
}

- (void)startPreflightWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(17, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MBXPCClient_startPreflightWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E995D090;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __51__MBXPCClient_startPreflightWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  os_activity_scope_state_s state;

  v2 = (void *)MEMORY[0x1D8270CF0]();
  v3 = _os_activity_create(&dword_1D5213000, "preflight", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = *(void **)(a1 + 32);
  v9 = 0;
  objc_msgSend(v4, "_sendRequest:arguments:error:", CFSTR("kMBMessageStartPreflight"), MEMORY[0x1E0C9AA60], &v9);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v9;
  if (!(v5 | v6))
    __assert_rtn("-[MBXPCClient startPreflightWithCompletionHandler:]_block_invoke", "MBXPCClient.m", 1605, "preflightInfo || error");
  v7 = (void *)v6;
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, v5, v7);

  os_activity_scope_leave(&state);
  objc_autoreleasePoolPop(v2);
}

- (void)startKeychainTransferWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(17, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__MBXPCClient_startKeychainTransferWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E995D090;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__MBXPCClient_startKeychainTransferWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  os_activity_scope_state_s state;

  v2 = (void *)MEMORY[0x1D8270CF0]();
  v3 = _os_activity_create(&dword_1D5213000, "keychainTransfer", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = *(void **)(a1 + 32);
  v9 = 0;
  objc_msgSend(v4, "_sendRequest:arguments:error:", CFSTR("kMBMessageStarKeychainTransfer"), MEMORY[0x1E0C9AA60], &v9);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v9;
  if (!(v5 | v6))
    __assert_rtn("-[MBXPCClient startKeychainTransferWithCompletionHandler:]_block_invoke", "MBXPCClient.m", 1620, "result || error");
  v7 = (void *)v6;
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v7);

  os_activity_scope_leave(&state);
  objc_autoreleasePoolPop(v2);
}

- (void)startKeychainDataTransferWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(17, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__MBXPCClient_startKeychainDataTransferWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E995D090;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __62__MBXPCClient_startKeychainDataTransferWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  os_activity_scope_state_s state;

  v2 = (void *)MEMORY[0x1D8270CF0]();
  v3 = _os_activity_create(&dword_1D5213000, "keychainDataTransfer", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = *(void **)(a1 + 32);
  v9 = 0;
  objc_msgSend(v4, "_sendRequest:arguments:error:", CFSTR("kMBMessageStarKeychainDataTransfer"), MEMORY[0x1E0C9AA60], &v9);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v9;
  if (!(v5 | v6))
    __assert_rtn("-[MBXPCClient startKeychainDataTransferWithCompletionHandler:]_block_invoke", "MBXPCClient.m", 1634, "keychainInfo || error");
  v7 = (void *)v6;
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, v5, v7);

  os_activity_scope_leave(&state);
  objc_autoreleasePoolPop(v2);
}

- (void)startKeychainDataImportWithKeychainInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (!v6)
    -[MBXPCClient startKeychainDataImportWithKeychainInfo:completionHandler:].cold.1();
  v8 = v7;
  dispatch_get_global_queue(17, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MBXPCClient_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke;
  block[3] = &unk_1E995D688;
  block[4] = self;
  v13 = v6;
  v14 = v8;
  v10 = v8;
  v11 = v6;
  dispatch_async(v9, block);

}

void __73__MBXPCClient_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  os_activity_scope_state_s state;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D8270CF0]();
  v3 = _os_activity_create(&dword_1D5213000, "keychainDataImport", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = (void *)a1[4];
  v11[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "_sendRequest:arguments:error:", CFSTR("kMBMessageStarKeychainDataImport"), v5, &v9);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (unint64_t)v9;

  if (!(v6 | v7))
    __assert_rtn("-[MBXPCClient startKeychainDataImportWithKeychainInfo:completionHandler:]_block_invoke", "MBXPCClient.m", 1649, "result || error");
  v8 = a1[6];
  if (v8)
    (*(void (**)(uint64_t, unint64_t))(v8 + 16))(v8, v7);

  os_activity_scope_leave(&state);
  objc_autoreleasePoolPop(v2);
}

- (void)startDataTransferWithPreflightInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (!v6)
    -[MBXPCClient startDataTransferWithPreflightInfo:completionHandler:].cold.1();
  v8 = v7;
  dispatch_get_global_queue(17, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MBXPCClient_startDataTransferWithPreflightInfo_completionHandler___block_invoke;
  block[3] = &unk_1E995D688;
  block[4] = self;
  v13 = v6;
  v14 = v8;
  v10 = v8;
  v11 = v6;
  dispatch_async(v9, block);

}

void __68__MBXPCClient_startDataTransferWithPreflightInfo_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  os_activity_scope_state_s state;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D8270CF0]();
  v3 = _os_activity_create(&dword_1D5213000, "dataTransfer", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = (void *)a1[4];
  v11[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "_sendRequest:arguments:error:", CFSTR("kMBMessageStartDataTransfer"), v5, &v9);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (unint64_t)v9;

  if (!(v6 | v7))
    __assert_rtn("-[MBXPCClient startDataTransferWithPreflightInfo:completionHandler:]_block_invoke", "MBXPCClient.m", 1664, "result || error");
  v8 = a1[6];
  if (v8)
    (*(void (**)(uint64_t, unint64_t))(v8 + 16))(v8, v7);

  os_activity_scope_leave(&state);
  objc_autoreleasePoolPop(v2);
}

- (id)personalPersonaIdentifier
{
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v6;

  v3 = _os_activity_create(&dword_1D5213000, "personalPersonaIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageFetchPersonalPersonaIdentifier"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_activity_scope_leave(&v6);

  return v4;
}

- (id)_makeConnection
{
  MBXPCClient *v2;
  MBConnection *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  MBXPCClient *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[MBXPCClient connection](v2, "connection");
  v3 = (MBConnection *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    MBGetDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v2;
      v14 = 2112;
      v15 = CFSTR("com.apple.backupd");
      _os_log_impl(&dword_1D5213000, v4, OS_LOG_TYPE_INFO, "%@ connecting to \"%@\", buf, 0x16u);
      _MBLog(CFSTR("INFO"), (uint64_t)"%@ connecting to \"%@\", v5, v6, v7, v8, v9, v10, (uint64_t)v2);
    }

    v3 = -[MBConnection initWithServiceName:delegate:delegateQueue:]([MBConnection alloc], "initWithServiceName:delegate:delegateQueue:", CFSTR("com.apple.backupd"), v2, v2->_eventQueue);
    -[MBXPCClient setConnection:](v2, "setConnection:", v3);
    -[MBConnection resume](v3, "resume");
  }
  objc_sync_exit(v2);

  if (!v3)
    -[MBXPCClient _makeConnection].cold.1();
  return v3;
}

- (id)_sendRequest:(id)a3 arguments:(id)a4
{
  return -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", a3, a4, 0);
}

- (id)_sendRequest:(id)a3 arguments:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  +[MBMessage messageWithName:arguments:personaIdentifier:](MBMessage, "messageWithName:arguments:personaIdentifier:", v8, a4, self->_personaIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _makeConnection](self, "_makeConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  objc_msgSend(v10, "sendMessageWithReplyAndSync:error:", v9, &v42);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v42;

  if (v11)
    goto LABEL_2;
  v17 = +[MBError isError:withCode:](MBError, "isError:withCode:", v12, 19);
  MBGetDefaultLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v44 = v8;
      v45 = 2112;
      v46 = v12;
      _os_log_impl(&dword_1D5213000, v19, OS_LOG_TYPE_DEFAULT, "Failed to send \"%@\" message - retrying once: %@", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Failed to send \"%@\" message - retrying once: %@", v20, v21, v22, v23, v24, v25, (uint64_t)v8);
    }

    -[MBXPCClient _makeConnection](self, "_makeConnection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v12;
    objc_msgSend(v26, "sendMessageWithReplyAndSync:error:", v9, &v41);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v41;

    if (v11)
    {
      v12 = v27;
LABEL_2:
      objc_msgSend(v11, "replyError");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (a5 && v13)
        *a5 = objc_retainAutorelease(v13);
      objc_msgSend(v11, "reply");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    MBGetDefaultLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v44 = v8;
      v45 = 2112;
      v46 = v27;
      _os_log_impl(&dword_1D5213000, v34, OS_LOG_TYPE_ERROR, "Failed to send \"%@\" message on retry: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to send \"%@\" message on retry: %@", v35, v36, v37, v38, v39, v40, (uint64_t)v8);
    }

    if (a5)
    {
      +[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 19, v27, CFSTR("Connection to backupd interrupted"));
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    v12 = v27;
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v44 = v8;
      v45 = 2112;
      v46 = v12;
      _os_log_impl(&dword_1D5213000, v19, OS_LOG_TYPE_ERROR, "Failed to send \"%@\" message: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to send \"%@\" message: %@", v28, v29, v30, v31, v32, v33, (uint64_t)v8);
    }

    if (a5)
    {
      +[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 20, v12, CFSTR("Connection to backupd invalid"));
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }
LABEL_6:

  return v15;
}

- (void)connection:(id)a3 didReceiveMessage:(id)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  double v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t buf[4];
  const __CFString *v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[MBManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
    objc_msgSend(v5, "name");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arguments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidFinishBackup")))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "managerDidFinishBackup:", self);
      goto LABEL_31;
    }
    if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidFinishScan")))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedLongLongValue");

        objc_msgSend(v6, "managerDidFinishScan:bytesUsed:", self, v11);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "managerDidFinishScan:", self);
      goto LABEL_31;
    }
    if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidFinishVerification")))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "managerDidFinishVerification:", self);
      goto LABEL_31;
    }
    if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidFinishRestore")))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "managerDidFinishRestore:", self);
      goto LABEL_31;
    }
    if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidFinishFileRestore")))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "manager:didFinishRestoreForPath:", self, v12);
LABEL_30:

      }
LABEL_31:

      goto LABEL_32;
    }
    if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidScanBundle")))
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_31;
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "manager:didScanBundleWithID:bytesUsed:", self, v12, objc_msgSend(v13, "unsignedLongLongValue"));
    }
    else
    {
      if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidScanDomainForBundle")))
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_31;
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "manager:didScanDomainWithName:forBundleID:bytesUsed:", self, v12, v13, objc_msgSend(v14, "unsignedLongLongValue"));
      }
      else
      {
        if (!-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidScanFilesForBundle")))
        {
          if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidFailBackup")))
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v6, "manager:didFailBackupWithError:", self, v9);
            goto LABEL_31;
          }
          if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidFailScan")))
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v6, "manager:didFailScanWithError:", self, v9);
            goto LABEL_31;
          }
          if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidFailVerification")))
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v6, "manager:didFailVerificationWithError:", self, v9);
            goto LABEL_31;
          }
          if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidFailRestore")))
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v6, "manager:didFailRestoreWithError:", self, v9);
            goto LABEL_31;
          }
          if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidFailFileRestore")))
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
              goto LABEL_31;
            objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "manager:didFailRestoreForPath:withError:", self, v12, v9);
            goto LABEL_30;
          }
          if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidCancelRestore")))
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v6, "managerDidCancelRestore:", self);
            goto LABEL_31;
          }
          if (!-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidUpdateProgress")))
          {
            if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidSetBackupEnabled")))
            {
              if ((objc_opt_respondsToSelector() & 1) == 0)
                goto LABEL_31;
              objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "manager:didSetBackupEnabled:", self, objc_msgSend(v12, "BOOLValue"));
            }
            else
            {
              if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidUpdateBackgroundRestoreProgress")))
              {
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v6, "managerDidUpdateBackgroundRestoreProgress:", self);
                goto LABEL_31;
              }
              if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidFinishDeviceTransfer")))
              {
                MBGetDefaultLog();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v51 = CFSTR("kMBMessageDidFinishDeviceTransfer");
                  _os_log_impl(&dword_1D5213000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
                  _MBLog(CFSTR("DEFAULT"), (uint64_t)"%{public}@", v20, v21, v22, v23, v24, v25, (uint64_t)CFSTR("kMBMessageDidFinishDeviceTransfer"));
                }

                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v6, "manager:didFinishDeviceTransferWithError:", self, v9);
                goto LABEL_31;
              }
              if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidFinishDeviceTransferKeychainTransfer")))
              {
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v6, "manager:didFinishDeviceTransferKeychainTransfer:", self, 0);
                goto LABEL_31;
              }
              if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidFinishDeviceTransferPreflight")))
              {
                if ((objc_opt_respondsToSelector() & 1) == 0)
                  goto LABEL_31;
                objc_msgSend(v8, "firstObject");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "manager:didFinishDeviceTransferPreflight:error:", self, v12, v9);
              }
              else if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidUpdateDeviceTransferProgress")))
              {
                objc_msgSend(v8, "firstObject");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                MBGetDefaultLog();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v12, "progress");
                  *(_DWORD *)buf = 134217984;
                  v51 = v27;
                  _os_log_impl(&dword_1D5213000, v26, OS_LOG_TYPE_DEFAULT, "p:%.2f", buf, 0xCu);
                  objc_msgSend(v12, "progress");
                  _MBLog(CFSTR("DEFAULT"), (uint64_t)"p:%.2f", v28, v29, v30, v31, v32, v33, v34);
                }

                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v6, "manager:didUpdateDeviceTransferProgress:", self, v12);
              }
              else
              {
                if (!-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kMBMessageDidUpdateDeviceTransferConnectionInfo")))
                {
                  MBGetDefaultLog();
                  v43 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v51 = v7;
                    _os_log_impl(&dword_1D5213000, v43, OS_LOG_TYPE_ERROR, "Unknown command '%@' from daemon", buf, 0xCu);
                    _MBLog(CFSTR("ERROR"), (uint64_t)"Unknown command '%@' from daemon", v44, v45, v46, v47, v48, v49, (uint64_t)v7);
                  }

                  goto LABEL_31;
                }
                objc_msgSend(v8, "firstObject");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                MBGetDefaultLog();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134218240;
                  v51 = (const __CFString *)objc_msgSend(v12, "connectionState");
                  v52 = 2048;
                  v53 = objc_msgSend(v12, "connectionType");
                  _os_log_impl(&dword_1D5213000, v35, OS_LOG_TYPE_DEFAULT, "s:%ld, t:%ld", buf, 0x16u);
                  v36 = objc_msgSend(v12, "connectionState");
                  objc_msgSend(v12, "connectionType");
                  _MBLog(CFSTR("DEFAULT"), (uint64_t)"s:%ld, t:%ld", v37, v38, v39, v40, v41, v42, v36);
                }

                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v6, "manager:didUpdateDeviceTransferConnectionInfo:", self, v12);
              }
            }
            goto LABEL_30;
          }
          if ((objc_opt_respondsToSelector() & 1) == 0)
            goto LABEL_31;
          objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "floatValue");
          v16 = v15;
          objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v13, "unsignedIntegerValue");
          LODWORD(v18) = v16;
          objc_msgSend(v6, "manager:didUpdateProgress:estimatedTimeRemaining:", self, v17, v18);
          goto LABEL_29;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_31;
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "manager:didScanFiles:forDomainWithName:bundleID:", self, v12, v13, v14);
      }

    }
LABEL_29:

    goto LABEL_30;
  }
LABEL_32:

}

- (void)connectionWasInterrupted:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MBManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[MBXPCClient connection](self, "connection");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      MBGetDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6 == v4)
      {
        if (v8)
        {
          *(_DWORD *)buf = 138412290;
          v22 = v4;
          _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_DEFAULT, "Informing client connection was interrupted: %@", buf, 0xCu);
          _MBLog(CFSTR("DEFAULT"), (uint64_t)"Informing client connection was interrupted: %@", v15, v16, v17, v18, v19, v20, (uint64_t)v4);
        }

        objc_msgSend(v5, "managerDidLoseConnectionToService:", self);
      }
      else
      {
        if (v8)
        {
          *(_DWORD *)buf = 138412546;
          v22 = v4;
          v23 = 2112;
          v24 = v6;
          _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_DEFAULT, "Not informing client connection was interrupted because there is a new connection already(%@ != %@)", buf, 0x16u);
          _MBLog(CFSTR("DEFAULT"), (uint64_t)"Not informing client connection was interrupted because there is a new connection already(%@ != %@)", v9, v10, v11, v12, v13, v14, (uint64_t)v4);
        }

      }
    }
  }

}

- (void)connectionWasInvalidated:(id)a3
{
  MBXPCClient *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MBXPCClient setConnection:](v4, "setConnection:", 0);
  objc_sync_exit(v4);

}

- (BOOL)isInitialMegaBackupCompleted:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "isInitialMegaBackupCompleted", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageIsInitialMegaBackupCompleted"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "BOOLValue");

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (void)saveBackupEnabledForMegaBackup
{
  NSObject *v3;
  id v4;
  os_activity_scope_state_s v5;

  v3 = _os_activity_create(&dword_1D5213000, "saveBackupEnabledForMegaBackup", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  v4 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageSaveBackupEnabledForMegaBackup"), 0);
  os_activity_scope_leave(&v5);

}

- (BOOL)wasBackupEnabledForMegaBackup:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "wasBackupEnabledForMegaBackup:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageWasBackupEnabledForMegaBackup"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "BOOLValue");

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (void)saveSyncSettingsEnabledForMegaBackup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  os_activity_scope_state_s v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1D5213000, "saveSyncSettingsEnabledForMegaBackup:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageSaveSyncSettingsEnabledForMegaBackup"), v6);

  os_activity_scope_leave(&v8);
}

- (void)saveBackupDomainsEnabledForMegaBackup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  os_activity_scope_state_s v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1D5213000, "saveBackupDomainsEnabledForMegaBackup:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageSaveBackupDomainsEnabledForMegaBackup"), v6);

  os_activity_scope_leave(&v8);
}

- (BOOL)restorePreviousSettingsEnabledForMegaBackup:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "restorePreviousSettingsForMegaBackup:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageRestorePreviousSettingsEnabledForMegaBackup"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "BOOLValue");

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (BOOL)requestMegaBackupExpirationDate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  os_activity_scope_state_s v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1D5213000, "requestMegaBackupExpirationDate:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageRequestMegaBackupExpirationDate"), v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v9, "BOOLValue");
  os_activity_scope_leave(&v11);

  return (char)a4;
}

- (BOOL)updateMegaBackupExpirationDate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  os_activity_scope_state_s v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1D5213000, "updateMegaBackupExpirationDate:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageUpdateMegaBackupExpirationDate"), v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v9, "BOOLValue");
  os_activity_scope_leave(&v11);

  return (char)a4;
}

- (BOOL)exitMegaBackupMode:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "exitMegaBackupMode", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageExitMegaBackupMode"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "BOOLValue");

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (BOOL)setMegaBackupTurnOniCloudBackupTelemetry:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  os_activity_scope_state_s v11;
  _QWORD v12[2];

  v4 = a3;
  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_1D5213000, "setMegaBackupTurnOniCloudBackupTelemetry:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v6, &v11);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageSetMegaBackupTurnOniCloudBackupTelemetry"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");
  os_activity_scope_leave(&v11);

  return (char)self;
}

- (BOOL)setMegaBackupTurnOnAllAppsSyncTelemetry:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  os_activity_scope_state_s v11;
  _QWORD v12[2];

  v4 = a3;
  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_1D5213000, "setMegaBackupTurnOnAllAppsSyncTelemetry:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v6, &v11);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:](self, "_sendRequest:arguments:", CFSTR("kMBMessageSetMegaBackupTurnOnAllAppsSyncTelemetry"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");
  os_activity_scope_leave(&v11);

  return (char)self;
}

- (BOOL)postFollowUpForDrySpellWithDuration:(double)a3 firstBackup:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  os_activity_scope_state_s state;
  _QWORD v16[3];

  v6 = a4;
  v16[2] = *MEMORY[0x1E0C80C00];
  v9 = _os_activity_create(&dword_1D5213000, "postFollowUpForDrySpellWithDuration:firstBackup:error", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessagePostFollowUpForDrySpell"), v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = objc_msgSend(v13, "BOOLValue");
  os_activity_scope_leave(&state);

  return (char)self;
}

- (BOOL)postFollowUpForRestoreTimeoutWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "postFollowUpForRestoreTimeoutWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessagePostFollowUpForRestoreTimeout"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "BOOLValue");

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (BOOL)postFollowUpForBackgroundRestoreProgress:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  os_activity_scope_state_s v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1D5213000, "postFollowUpForBackgroundRestoreProgress:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessagePostFollowUpForBackgroundRestoreProgress"), v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v9, "BOOLValue");
  os_activity_scope_leave(&v11);

  return (char)a4;
}

- (BOOL)postFollowUpForRestoreFinishedWithError:(id *)a3 skipiCloudQuotaOffer:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  os_activity_scope_state_s v12;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = _os_activity_create(&dword_1D5213000, "postFollowUpForRestoreFinishedWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessagePostFollowUpForRestoreFinished"), v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = objc_msgSend(v10, "BOOLValue");
  os_activity_scope_leave(&v12);

  return (char)a3;
}

- (BOOL)postFollowUpForRestoreFailedWithDomainNames:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  os_activity_scope_state_s v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1D5213000, "postFollowUpForRestoreFailedWithDomainNames:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  if (v6)
  {
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessagePostFollowUpForRestoreFailed"), v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)

  v10 = objc_msgSend(v9, "BOOLValue");
  os_activity_scope_leave(&v12);

  return v10;
}

- (BOOL)clearAllPendingFollowUpsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v5 = _os_activity_create(&dword_1D5213000, "clearAllPendingFollowUpsWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  -[MBXPCClient _sendRequest:arguments:error:](self, "_sendRequest:arguments:error:", CFSTR("kMBMessageClearAllPendingFollowUps"), 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "BOOLValue");

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (MBConnection)connection
{
  return (MBConnection *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)shouldSupportiTunes
{
  return self->_shouldSupportiTunes;
}

- (void)setShouldSupportiTunes:(BOOL)a3
{
  self->_shouldSupportiTunes = a3;
}

- (MBCellularDataSubscriptionMonitor)cellularDataSubscriptionMonitor
{
  return self->_cellularDataSubscriptionMonitor;
}

- (void)setCellularDataSubscriptionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_cellularDataSubscriptionMonitor, a3);
}

- (OS_dispatch_group)initialBackupOnCellularSupportGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInitialBackupOnCellularSupportGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialBackupOnCellularSupportGroup, 0);
  objc_storeStrong((id *)&self->_cellularDataSubscriptionMonitor, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

- (void)initWithAccount:delegate:eventQueue:error:.cold.1()
{
  __assert_rtn("-[MBXPCClient initWithAccount:delegate:eventQueue:error:]", "MBXPCClient.m", 77, "account");
}

- (void)fetchiCloudRestoreIsCompleteWithCompletion:.cold.1()
{
  __assert_rtn("-[MBXPCClient fetchiCloudRestoreIsCompleteWithCompletion:]", "MBXPCClient.m", 418, "completion");
}

- (void)startRestoreForBackupUDID:snapshotID:error:.cold.1()
{
  __assert_rtn("-[MBXPCClient startRestoreForBackupUDID:snapshotID:error:]", "MBXPCClient.m", 675, "!options.cellularAccess");
}

- (void)startRestoreForSnapshot:options:completion:.cold.1()
{
  __assert_rtn("-[MBXPCClient startRestoreForSnapshot:options:completion:]", "MBXPCClient.m", 704, "snapshotIdentifier");
}

- (void)_restoreApplicationWithBundleID:failed:qos:context:error:.cold.1()
{
  __assert_rtn("-[MBXPCClient _restoreApplicationWithBundleID:failed:qos:context:error:]", "MBXPCClient.m", 762, "qos == nil || [qos isKindOfClass:[NSNumber class]]");
}

- (void)startDeviceTransferWithTaskType:sessionInfo:error:.cold.1()
{
  __assert_rtn("-[MBXPCClient startDeviceTransferWithTaskType:sessionInfo:error:]", "MBXPCClient.m", 1564, "taskType != MBDeviceTransferTaskTypeUnspecified");
}

- (void)startDeviceTransferWithTaskType:sessionInfo:error:.cold.2()
{
  __assert_rtn("-[MBXPCClient startDeviceTransferWithTaskType:sessionInfo:error:]", "MBXPCClient.m", 1565, "sessionInfo");
}

- (void)startDeviceTransferWithTaskType:sessionInfo:error:.cold.3()
{
  __assert_rtn("-[MBXPCClient startDeviceTransferWithTaskType:sessionInfo:error:]", "MBXPCClient.m", 1566, "error");
}

- (void)cancelDeviceTransferWithTaskType:error:.cold.1()
{
  __assert_rtn("-[MBXPCClient cancelDeviceTransferWithTaskType:error:]", "MBXPCClient.m", 1576, "taskType != MBDeviceTransferTaskTypeUnspecified");
}

- (void)cancelDeviceTransferWithTaskType:error:.cold.2()
{
  __assert_rtn("-[MBXPCClient cancelDeviceTransferWithTaskType:error:]", "MBXPCClient.m", 1577, "error");
}

- (void)resumeDeviceTransferWithTaskType:error:.cold.1()
{
  __assert_rtn("-[MBXPCClient resumeDeviceTransferWithTaskType:error:]", "MBXPCClient.m", 1587, "taskType != MBDeviceTransferTaskTypeUnspecified");
}

- (void)resumeDeviceTransferWithTaskType:error:.cold.2()
{
  __assert_rtn("-[MBXPCClient resumeDeviceTransferWithTaskType:error:]", "MBXPCClient.m", 1588, "error");
}

- (void)startKeychainDataImportWithKeychainInfo:completionHandler:.cold.1()
{
  __assert_rtn("-[MBXPCClient startKeychainDataImportWithKeychainInfo:completionHandler:]", "MBXPCClient.m", 1641, "keychainInfo");
}

- (void)startDataTransferWithPreflightInfo:completionHandler:.cold.1()
{
  __assert_rtn("-[MBXPCClient startDataTransferWithPreflightInfo:completionHandler:]", "MBXPCClient.m", 1656, "preflightInfo");
}

- (void)_makeConnection
{
  __assert_rtn("-[MBXPCClient _makeConnection]", "MBXPCClient.m", 1691, "connection");
}

@end
