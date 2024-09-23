@implementation IMParentalControls

- (void)setShouldPostNotifications:(BOOL)a3
{
  self->_shouldPostNotifications = a3;
}

- (BOOL)okToConnectAccount:(id)a3
{
  return MEMORY[0x1E0DE7D20](self, sel_accountIsEnabled_);
}

- (IMParentalControls)init
{
  IMParentalControls *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *parentalControls;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMParentalControls;
  v2 = -[IMParentalControls init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    parentalControls = v2->_parentalControls;
    v2->_parentalControls = v3;

    -[IMParentalControls setShouldPostNotifications:](v2, "setShouldPostNotifications:", 0);
    -[IMParentalControls _updateParentalSettings](v2, "_updateParentalSettings");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__managedPrefsNotification_, *MEMORY[0x1E0C9B0B0], *MEMORY[0x1E0C9B0B8]);

    -[IMParentalControls setShouldPostNotifications:](v2, "setShouldPostNotifications:", 1);
  }
  return v2;
}

- (BOOL)disableService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4)
  {
    if (-[IMParentalControls active](self, "active"))
    {
      objc_msgSend(v4, "internalName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMParentalControls _serviceWithName:](self, "_serviceWithName:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "disableService");

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)accountIsEnabled:(id)a3
{
  void *v4;

  objc_msgSend(a3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = !-[IMParentalControls disableService:](self, "disableService:", v4);

  return (char)self;
}

- (void)_updateParentalSettings
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  int v16;
  _BOOL4 v17;
  NSObject *v18;
  _BOOL4 v19;
  const __CFString *v20;
  NSObject *v21;
  _BOOL4 v22;
  const __CFString *v23;
  NSObject *v24;
  _BOOL4 v25;
  const __CFString *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  NSObject *v32;
  __CFString *v33;
  int v34;
  const __CFString *v35;
  NSObject *v36;
  __CFString *v37;
  int v38;
  const __CFString *v39;
  NSObject *v40;
  __CFString *v41;
  __CFString *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  const __CFString *v55;
  __int16 v56;
  const __CFString *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v48 = !self->_active;
  if (!self->_active)
    self->_active = 1;
  -[IMParentalControls _serviceWithName:](self, "_serviceWithName:", *MEMORY[0x1E0D38F40]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D471A8]);
  if ((v4 == 2) != objc_msgSend(v2, "disableService"))
  {
    objc_msgSend(v2, "setDisableService:", v4 == 2);
    v48 = 1;
  }

  -[IMParentalControls _serviceWithName:](self, "_serviceWithName:", CFSTR("Calling"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F58]);
  if ((v7 == 2) != objc_msgSend(v5, "disableService"))
  {
    objc_msgSend(v5, "setDisableService:", v7 == 2);
    v48 = 1;
  }

  -[IMParentalControls _serviceWithName:](self, "_serviceWithName:", *MEMORY[0x1E0D38F68]);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F98]);
  if ((v9 == 2) != objc_msgSend(v47, "disableService"))
  {
    objc_msgSend(v47, "setDisableService:", v9 == 2);
    v48 = 1;
  }

  objc_msgSend(MEMORY[0x1E0D47240], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidateRestrictions");

  objc_msgSend(MEMORY[0x1E0D47240], "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidateSettings");

  +[IMParentalControls objectForKey:](IMParentalControls, "objectForKey:", *MEMORY[0x1E0D36C68]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = objc_msgSend(v12, "intValue");
  else
    v14 = 0;
  v15 = v14 != 0;
  if (self->_forceChatLogging != v15)
  {
    self->_forceChatLogging = v15;
    v48 = 1;
  }
  +[IMParentalControls objectForKey:](IMParentalControls, "objectForKey:", *MEMORY[0x1E0D36C60]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (int)v45;
  if (v45)
    v16 = objc_msgSend(v45, "intValue");
  v17 = v16 != 0;
  if (self->_disableAV != v17)
  {
    self->_disableAV = v17;
    v48 = 1;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = -[IMParentalControls active](self, "active");
      v20 = CFSTR("NO");
      if (v19)
        v20 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v55 = v20;
      _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_DEBUG, "Active: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = -[IMParentalControls disableAV](self, "disableAV");
      v23 = CFSTR("NO");
      if (v22)
        v23 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v55 = v23;
      _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_DEBUG, "Disable AV: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = -[IMParentalControls forceChatLogging](self, "forceChatLogging");
      v26 = CFSTR("NO");
      if (v25)
        v26 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v55 = v26;
      _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_DEBUG, "Force Chat Logging: %@", buf, 0xCu);
    }

  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[NSMutableDictionary allValues](self->_parentalControls, "allValues", v45);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v51 != v29)
          objc_enumerationMutation(v27);
        v31 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v31, "name");
            v33 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v31, "disableService");
            *(_DWORD *)buf = 138412546;
            v35 = CFSTR("NO");
            if (v34)
              v35 = CFSTR("YES");
            v55 = v33;
            v56 = 2112;
            v57 = v35;
            _os_log_impl(&dword_1A1FF4000, v32, OS_LOG_TYPE_INFO, "%@ Disabled: %@", buf, 0x16u);

          }
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v31, "name");
            v37 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v31, "forceAllowlist");
            *(_DWORD *)buf = 138412546;
            v39 = CFSTR("NO");
            if (v38)
              v39 = CFSTR("YES");
            v55 = v37;
            v56 = 2112;
            v57 = v39;
            _os_log_impl(&dword_1A1FF4000, v36, OS_LOG_TYPE_DEBUG, "%@ Force Allowlist: %@", buf, 0x16u);

          }
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v31, "name");
            v41 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "allowlist");
            v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v55 = v41;
            v56 = 2112;
            v57 = v42;
            _os_log_impl(&dword_1A1FF4000, v40, OS_LOG_TYPE_DEBUG, "%@ Allowlist: %@", buf, 0x16u);

          }
        }
      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v28);
  }

  v43 = !v48;
  if (!self->_shouldPostNotifications)
    v43 = 1;
  if ((v43 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "__mainThreadPostNotificationName:object:", CFSTR("__kIMManagedPreferencesChangedNotification"), self);

  }
}

- (id)_serviceWithName:(id)a3
{
  id v4;
  IMParentalControlsService *v5;
  IMParentalControlsService *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_parentalControls, "objectForKey:", v4);
    v5 = (IMParentalControlsService *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = objc_alloc_init(IMParentalControlsService);
      -[IMParentalControlsService setName:](v5, "setName:", v4);
      -[NSMutableDictionary setObject:forKey:](self->_parentalControls, "setObject:forKey:", v5, v4);
    }
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)standardControls
{
  if (qword_1ECF124A8 != -1)
    dispatch_once(&qword_1ECF124A8, &unk_1E471D658);
  if (qword_1ECF12498 != -1)
    dispatch_once(&qword_1ECF12498, &unk_1E471FDE0);
  if (qword_1ECF124A0 != -1)
    dispatch_once(&qword_1ECF124A0, &unk_1E471BB60);
  return (id)qword_1ECF124B0;
}

+ (id)objectForKey:(id)a3
{
  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0, 0);

  v4.receiver = self;
  v4.super_class = (Class)IMParentalControls;
  -[IMParentalControls dealloc](&v4, sel_dealloc);
}

- (BOOL)disableAV
{
  _BOOL4 v3;

  v3 = -[IMParentalControls active](self, "active");
  if (v3)
    LOBYTE(v3) = self->_disableAV;
  return v3;
}

- (BOOL)forceChatLogging
{
  _BOOL4 v3;

  v3 = -[IMParentalControls active](self, "active");
  if (v3)
    LOBYTE(v3) = self->_forceChatLogging;
  return v3;
}

- (BOOL)disableAccount:(id)a3
{
  void *v4;

  objc_msgSend(a3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[IMParentalControls disableService:](self, "disableService:", v4);

  return (char)self;
}

- (id)allowlistForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4 && -[IMParentalControls active](self, "active"))
  {
    objc_msgSend(v4, "internalName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMParentalControls _serviceWithName:](self, "_serviceWithName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allowlist");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
      v8 = v7;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)forceAllowlistForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4)
  {
    if (-[IMParentalControls active](self, "active"))
    {
      objc_msgSend(v4, "internalName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMParentalControls _serviceWithName:](self, "_serviceWithName:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "forceAllowlist");

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)allowlistForAccount:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMParentalControls allowlistForService:](self, "allowlistForService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)forceAllowlistForAccount:(id)a3
{
  void *v4;

  objc_msgSend(a3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[IMParentalControls forceAllowlistForService:](self, "forceAllowlistForService:", v4);

  return (char)self;
}

- (BOOL)accountHasAllowlist:(id)a3
{
  void *v4;

  objc_msgSend(a3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[IMParentalControls forceAllowlistForService:](self, "forceAllowlistForService:", v4);

  return (char)self;
}

- (BOOL)shouldPostNotifications
{
  return self->_shouldPostNotifications;
}

- (NSMutableDictionary)_parentalControls
{
  return self->_parentalControls;
}

- (BOOL)_disableAV
{
  return self->_disableAV;
}

- (BOOL)_forceChatLogging
{
  return self->_forceChatLogging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentalControls, 0);
}

@end
