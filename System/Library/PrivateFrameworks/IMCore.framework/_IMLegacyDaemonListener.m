@implementation _IMLegacyDaemonListener

- (void)vcCapabilitiesChanged:(unint64_t)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_vcCapabilities = a3;
  v4 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "vcCapabilitiesChanged:", a3);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)updateCloudKitStateWithDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMCloudKitHooks sharedInstance](IMCloudKitHooks, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateCloudKitStateWithDictionary:", v3);

}

- (void)setupComplete:(BOOL)a3 info:(id)a4
{
  _BOOL4 v4;
  NSObject *v5;
  const __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t i;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  BOOL v40;
  void *v41;
  int v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  int v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  int v53;
  _BOOL4 v54;
  void *v55;
  NSObject *v56;
  NSMutableDictionary *services;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  id obj;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t buf[4];
  void *v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v4 = a3;
  v90 = *MEMORY[0x1E0C80C00];
  v68 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v4)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v86 = (void *)v6;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Setup complete with success %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_DEBUG, "Setup starting", buf, 2u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      MarcoLoggingStringForMessageData();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v86 = v9;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_DEBUG, "Setup info: %@", buf, 0xCu);

    }
  }
  objc_msgSend(v68, "objectForKey:", *MEMORY[0x1E0D390F0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "objectForKey:", *MEMORY[0x1E0D390E8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "objectForKey:", *MEMORY[0x1E0D390D8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IMLegacyDaemonListener services:properties:persistentProperties:](self, "services:properties:persistentProperties:", v10, v11, v12);

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  objc_msgSend(v68, "objectForKey:", *MEMORY[0x1E0D390F8]);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
  if (v66)
  {
    v65 = *(_QWORD *)v82;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v82 != v65)
        {
          v14 = v13;
          objc_enumerationMutation(obj);
          v13 = v14;
        }
        v67 = v13;
        v15 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v13);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v15;
            _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_DEBUG, "Service info: %@", buf, 0xCu);
          }

        }
        objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0D38F28]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0D38F30]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0D38F20]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0D38F18]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0D38F08]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0D38F10]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_IMLegacyDaemonListener service:properties:defaults:defaultAccountSettings:allAccounts:activeAccounts:](self, "service:properties:defaults:defaultAccountSettings:allAccounts:activeAccounts:", v17, v18, v19, v20, v21, v22);

        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0D38F00]);
        v69 = (id)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
        if (v71)
        {
          v70 = *(_QWORD *)v78;
          do
          {
            for (i = 0; i != v71; ++i)
            {
              if (*(_QWORD *)v78 != v70)
                objc_enumerationMutation(v69);
              v24 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
              v25 = (void *)MEMORY[0x1A8582D94]();
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v86 = v24;
                  _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_DEBUG, "Account info: %@", buf, 0xCu);
                }

              }
              objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0D37390]);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0D37380]);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[_IMLegacyDaemonListener account:defaultsChanged:](self, "account:defaultsChanged:", v27, v28);

              objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0D373A8]);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0D37378]);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "unsignedLongLongValue");
              objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0D37398]);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "intValue");
              objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0D373A0]);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[_IMLegacyDaemonListener account:status:capabilities:serviceLoginStatus:loginStatusMessage:](self, "account:status:capabilities:serviceLoginStatus:loginStatusMessage:", v27, v29, v31, v33, v34);

              objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0D37388]);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (v35)
                -[_IMLegacyDaemonListener account:groupsChanged:error:](self, "account:groupsChanged:error:", v27, v35, 0);

              objc_autoreleasePoolPop(v25);
            }
            v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
          }
          while (v71);
        }

        v13 = v67 + 1;
      }
      while (v67 + 1 != v66);
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
    }
    while (v66);
  }

  objc_msgSend(v68, "objectForKey:", *MEMORY[0x1E0D390A0]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IMLegacyDaemonListener _setStamp:forContext:](self, "_setStamp:forContext:", v36, CFSTR("DBModificationStamp"));
  objc_msgSend(v68, "objectForKey:", *MEMORY[0x1E0D390B0]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IMLegacyDaemonListener _setStamp:forContext:](self, "_setStamp:forContext:", v37, CFSTR("fileTransfers"));
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "capabilitiesForListenerID:", 0);
  v40 = (*MEMORY[0x1E0D36CE0] & v39) == 0;

  if (v40)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v45, OS_LOG_TYPE_DEBUG, "Clearing file transfer center", buf, 2u);
      }

    }
    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "_handleAllFileTransfers:", 0);
  }
  else
  {
    objc_msgSend(v68, "objectForKey:", *MEMORY[0x1E0D390A8]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = IMOSLoggingEnabled();
    if (v41)
    {
      if (v42)
      {
        OSLogHandleForIMFoundationCategory();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v43, OS_LOG_TYPE_DEBUG, "Updating file transfers", buf, 2u);
        }

      }
      +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "_handleAllFileTransfers:", v41);

    }
    else if (v42)
    {
      OSLogHandleForIMFoundationCategory();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v46, OS_LOG_TYPE_DEBUG, "Not updating file transfers", buf, 2u);
      }

    }
    objc_msgSend(v68, "objectForKey:", *MEMORY[0x1E0D390C0]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = IMOSLoggingEnabled();
    if (v47)
    {
      if (v48)
      {
        OSLogHandleForIMFoundationCategory();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v49, OS_LOG_TYPE_DEBUG, "Updating file transfers for group photo", buf, 2u);
        }

      }
      +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "_handleAllFileTransfers:", v47);

    }
    else if (v48)
    {
      OSLogHandleForIMFoundationCategory();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v51, OS_LOG_TYPE_DEBUG, "Not updating file transfers for group photo", buf, 2u);
      }

    }
  }

  self->_setupComplete = 1;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "capabilitiesForListenerID:", 0);
  v54 = (*MEMORY[0x1E0D36D18] & v53) == 0;

  if (v54)
  {
    -[_IMLegacyDaemonListener _reallyProcessMyStatusChanged](self, "_reallyProcessMyStatusChanged");
    +[IMMe me](IMMe, "me");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "rebuildIMHandles");

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      services = self->_services;
      *(_DWORD *)buf = 138412290;
      v86 = services;
      _os_log_impl(&dword_1A1FF4000, v56, OS_LOG_TYPE_DEBUG, "Setup is complete (Services: %@)", buf, 0xCu);
    }

  }
  -[_IMLegacyDaemonListener _deferredSetup:](self, "_deferredSetup:", v68);
  v58 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v59 = v58;
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
  if (v60)
  {
    v61 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v60; ++j)
      {
        if (*(_QWORD *)v74 != v61)
          objc_enumerationMutation(v59);
        v63 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v63, "setupComplete:info:", 1, v68);
      }
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
    }
    while (v60);
  }

}

- (void)services:(id)a3 properties:(id)a4 persistentProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  uint64_t v13;
  NSMutableDictionary *i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  char v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  int v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  os_log_t v30;
  NSMutableDictionary *services;
  NSMutableDictionary *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  os_log_t log;
  void *v40;
  void *v41;
  _IMLegacyDaemonListener *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableDictionary removeAllObjects](self->_properties, "removeAllObjects");
  v41 = v9;
  -[NSMutableDictionary addEntriesFromDictionary:](self->_properties, "addEntriesFromDictionary:", v9);
  -[NSMutableDictionary removeAllObjects](self->_persistentProperties, "removeAllObjects");
  v42 = self;
  v40 = v10;
  -[NSMutableDictionary addEntriesFromDictionary:](self->_persistentProperties, "addEntriesFromDictionary:", v10);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v11 = (NSMutableDictionary *)v8;
  v12 = (NSMutableDictionary *)-[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (!v12)
  {
    v32 = v11;
LABEL_48:

    goto LABEL_50;
  }
  log = 0;
  v13 = *(_QWORD *)v48;
  do
  {
    for (i = 0; i != v12; i = (NSMutableDictionary *)((char *)i + 1))
    {
      if (*(_QWORD *)v48 != v13)
        objc_enumerationMutation(v11);
      v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance", log);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_servicesToAllow");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v17, "count"))
        goto LABEL_16;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v17;
          _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Allowing only services: %@", buf, 0xCu);
        }

      }
      v19 = objc_msgSend(v17, "containsObject:", v15);
      v20 = IMOSLoggingEnabled();
      if ((v19 & 1) != 0)
      {
        if (v20)
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v15;
            _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "  Allowing: %@", buf, 0xCu);
          }

        }
LABEL_16:
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_servicesToDeny");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "count"))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v52 = v23;
              _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "Denying services: %@", buf, 0xCu);
            }

          }
          v25 = objc_msgSend(v23, "containsObject:", v15);
          v26 = IMOSLoggingEnabled();
          if (v25)
          {
            if (v26)
            {
              OSLogHandleForIMFoundationCategory();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v52 = v15;
                _os_log_impl(&dword_1A1FF4000, v27, OS_LOG_TYPE_INFO, "  Skipping: %@", buf, 0xCu);
              }
              goto LABEL_41;
            }
            goto LABEL_42;
          }
          if (v26)
          {
            OSLogHandleForIMFoundationCategory();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v52 = v15;
              _os_log_impl(&dword_1A1FF4000, v29, OS_LOG_TYPE_INFO, "  Allowing: %@", buf, 0xCu);
            }

          }
        }
        -[NSMutableDictionary objectForKey:](v42->_services, "objectForKey:", v15);
        v27 = objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", v15);
          v27 = objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v30 = log;
            if (!log)
            {
              services = v42->_services;
              if (services)
                v30 = (os_log_t)-[NSMutableDictionary mutableCopy](services, "mutableCopy");
              else
                v30 = (os_log_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
            }
            -[NSObject setObject:forKey:](v30, "setObject:forKey:", v27, v15, v30);
          }
        }
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
      if (v20)
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v15;
          _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, "  Skipping: %@", buf, 0xCu);
        }

      }
LABEL_43:

    }
    v12 = (NSMutableDictionary *)-[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  }
  while (v12);

  if (log)
  {
    v12 = log;
    v32 = v42->_services;
    v42->_services = v12;
    goto LABEL_48;
  }
  v12 = 0;
LABEL_50:
  v33 = (void *)-[NSMutableArray _copyForEnumerating](v42->_handlers, "_copyForEnumerating");
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v34 = v33;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v44 != v36)
          objc_enumerationMutation(v34);
        v38 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v38, "services:properties:persistentProperties:", v11, v41, v40);
      }
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v35);
  }

}

- (id)serviceWithName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_services, "objectForKey:", a3);
}

- (void)service:(id)a3 properties:(id)a4 defaults:(id)a5 defaultAccountSettings:(id)a6 allAccounts:(id)a7 activeAccounts:(id)a8
{
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  IMAccount *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  int v37;
  id v38;
  void *v39;
  char v40;
  id v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  uint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t n;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t ii;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  id obj;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint8_t v108[128];
  uint8_t buf[4];
  id v110;
  __int16 v111;
  id v112;
  __int16 v113;
  id v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v76 = a3;
  v74 = a4;
  v73 = a5;
  v72 = a6;
  v68 = a7;
  v75 = a8;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_servicesToAllow");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v110 = v76;
      v111 = 2112;
      v112 = v68;
      v113 = 2112;
      v114 = v75;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Service: %@   all accounts: %@   activeAccounts: %@", buf, 0x20u);
    }

  }
  if (objc_msgSend(v69, "count") && (objc_msgSend(v69, "containsObject:", v76) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v110 = v76;
        _os_log_impl(&dword_1A1FF4000, v42, OS_LOG_TYPE_INFO, "  Skipping: %@ (not allowed)", buf, 0xCu);
      }

    }
  }
  else
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_servicesToDeny");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v67, "count") && objc_msgSend(v67, "containsObject:", v76))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v110 = v76;
          _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "  Skipping: %@ (denied)", buf, 0xCu);
        }

      }
    }
    else
    {
      +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setServiceProperties:", v74);
      objc_msgSend(v77, "setServiceDefaults:", v73);
      objc_msgSend(v77, "setDefaultAccountSettings:", v72);
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      obj = v68;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v100;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v100 != v18)
              objc_enumerationMutation(obj);
            v20 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i);
            +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "accountForUniqueID:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v22)
            {
              -[_IMLegacyDaemonListener serviceWithName:](self, "serviceWithName:", v76);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = -[IMAccount initWithUniqueID:service:]([IMAccount alloc], "initWithUniqueID:service:", v20, v23);
              if (v24)
              {
                +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "addAccount:locally:", v24, 1);

              }
            }

          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
        }
        while (v17);
      }

      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "accounts");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = 0;
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
      if (v29)
      {
        v70 = 0;
        v30 = 0;
        v31 = *(_QWORD *)v96;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v96 != v31)
              objc_enumerationMutation(v27);
            v33 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
            objc_msgSend(v33, "service");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v34 == v77;

            if (v35)
            {
              objc_msgSend(v33, "uniqueID");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v75, "containsObject:", v36);

              if (v37)
              {
                if (v28)
                {
                  v38 = v28;
                }
                else
                {
                  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v28 = v38;
                }
              }
              else
              {
                v38 = v70;
                if (!v70)
                {
                  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v70 = v38;
                }
              }
              objc_msgSend(v38, "addObject:", v33);
              objc_msgSend(v33, "uniqueID");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(obj, "containsObject:", v39);

              if ((v40 & 1) == 0)
              {
                v41 = v30;
                if (!v30)
                  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v30 = v41;
                objc_msgSend(v41, "addObject:", v33);
              }
            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
        }
        while (v29);
      }
      else
      {
        v70 = 0;
        v30 = 0;
      }

      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v43 = v28;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
      if (v44)
      {
        v45 = *(_QWORD *)v92;
        do
        {
          for (k = 0; k != v44; ++k)
          {
            if (*(_QWORD *)v92 != v45)
              objc_enumerationMutation(v43);
            v47 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * k);
            +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "activateAccount:locally:", v47, 1);

          }
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
        }
        while (v44);
      }

      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v49 = v70;
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
      if (v50)
      {
        v51 = *(_QWORD *)v88;
        do
        {
          for (m = 0; m != v50; ++m)
          {
            if (*(_QWORD *)v88 != v51)
              objc_enumerationMutation(v49);
            v53 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * m);
            +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "deactivateAccount:withDisable:", v53, 0);

          }
          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
        }
        while (v50);
      }

      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v55 = v30;
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v83, v104, 16);
      if (v56)
      {
        v57 = *(_QWORD *)v84;
        do
        {
          for (n = 0; n != v56; ++n)
          {
            if (*(_QWORD *)v84 != v57)
              objc_enumerationMutation(v55);
            v59 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * n);
            +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "deleteAccount:locally:", v59, 1);

          }
          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v83, v104, 16);
        }
        while (v56);
      }

      v61 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v62 = v61;
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v79, v103, 16);
      if (v63)
      {
        v64 = *(_QWORD *)v80;
        do
        {
          for (ii = 0; ii != v63; ++ii)
          {
            if (*(_QWORD *)v80 != v64)
              objc_enumerationMutation(v62);
            v66 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * ii);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v66, "service:properties:defaults:defaultAccountSettings:allAccounts:activeAccounts:", v76, v74, v73, v72, obj, v75);
          }
          v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v79, v103, 16);
        }
        while (v63);
      }

    }
  }

}

- (void)networkDataAvailabilityChanged:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("NO");
      if (v3)
        v5 = CFSTR("YES");
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "MobileSMS thinks networkDataAvailable: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNetworkDataAvailable:", v3);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[NSProtocolChecker methodSignatureForSelector:](self->_protocol, "methodSignatureForSelector:", a3);
}

- (BOOL)isSetupComplete
{
  return self->_setupComplete;
}

- (_IMLegacyDaemonListener)init
{
  _IMLegacyDaemonListener *v2;
  _IMLegacyDaemonListener *v3;
  NSDate *myIdleSince;
  NSMutableDictionary *v5;
  NSMutableDictionary *properties;
  NSMutableDictionary *v7;
  NSMutableDictionary *persistentProperties;
  uint64_t v9;
  NSProtocolChecker *protocol;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_IMLegacyDaemonListener;
  v2 = -[_IMLegacyDaemonListener init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    myIdleSince = v2->_myIdleSince;
    v2->_myIdleSince = 0;

    v3->_setupComplete = 0;
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    properties = v3->_properties;
    v3->_properties = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    persistentProperties = v3->_persistentProperties;
    v3->_persistentProperties = v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38C0]), "initWithProtocol:", &unk_1EE6B4318);
    protocol = v3->_protocol;
    v3->_protocol = (NSProtocolChecker *)v9;

  }
  return v3;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A8582D94]();
  v6 = (void *)-[NSMutableArray copy](self->_handlers, "copy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v4, "selector");
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v12 = (void *)MEMORY[0x1A8582D94]();
          objc_msgSend(v4, "invokeWithTarget:", v11);
          objc_autoreleasePoolPop(v12);
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_autoreleasePoolPop(v5);
}

- (NSArray)allServices
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_services, "allValues");
}

- (void)addHandler:(id)a3
{
  NSMutableArray *handlers;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = self->_handlers;
      self->_handlers = v5;

      handlers = self->_handlers;
    }
    -[NSMutableArray addObject:](handlers, "addObject:", v7);
  }

}

- (void)account:(id)a3 status:(id)a4 capabilities:(unint64_t)a5 serviceLoginStatus:(unint64_t)a6 loginStatusMessage:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v12 = a4;
  v13 = a7;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accountForUniqueID:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "updateCapabilities:", a5);
  objc_msgSend(v21, "setIMAccountLoginStatus:", a6);
  objc_msgSend(v21, "setCurrentAccountStatus:", v12);
  -[_IMLegacyDaemonListener _processMyStatusChanged](self, "_processMyStatusChanged");
  v15 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v20, "account:status:capabilities:serviceLoginStatus:loginStatusMessage:", v22, v12, a5, a6, v13);
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

}

- (void)account:(id)a3 defaultsChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountForUniqueID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "loadFromDictionary:", v7);
  v10 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "account:defaultsChanged:", v6, v7);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (id)_stampForContext:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_contexts, "objectForKey:", a3);
}

- (void)_setStamp:(id)a3 forContext:(id)a4
{
  id v6;
  NSMutableDictionary *contexts;
  id v8;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v6)
  {
    contexts = self->_contexts;
    v8 = v12;
    if (v12)
    {
      if (!contexts)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v10 = self->_contexts;
        self->_contexts = Mutable;

        v8 = v12;
        contexts = self->_contexts;
      }
      -[NSMutableDictionary setObject:forKey:](contexts, "setObject:forKey:", v8, v6);
    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](contexts, "removeObjectForKey:", v6);
      if (!-[NSMutableDictionary count](self->_contexts, "count"))
      {
        v11 = self->_contexts;
        self->_contexts = 0;

      }
    }
  }

}

- (void)_reallyProcessMyStatusChanged
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSData *v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  NSObject *v10;
  NSDate *myIdleSince;
  NSObject *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSString **p_myNowPlayingString;
  NSString *myNowPlayingString;
  NSString *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  unint64_t v27;
  NSData *v28;
  __CFString *v29;
  __CFString *v30;
  NSDate *obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  __CFString *v39;
  __int16 v40;
  NSDate *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (self->_hasPendingProcessChange)
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reallyProcessMyStatusChanged, 0);
  self->_hasPendingProcessChange = 0;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestAccountForStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v4, "myStatus");
  objc_msgSend(v4, "myStatusMessage");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "myIdleSince");
  obj = (NSDate *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "myPictureData");
  v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "myNowPlayingString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = &stru_1E4725068;
  if (v5)
    v9 = (const __CFString *)v5;
  else
    v9 = &stru_1E4725068;
  if (v7)
    v8 = (const __CFString *)v7;
  v29 = (__CFString *)v8;
  v30 = (__CFString *)v9;
  if ((-[NSData isNull](v6, "isNull") & 1) != 0 || !-[NSData length](v6, "length"))
  {

    v6 = 0;
  }
  v28 = v6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109634;
      v37 = v27;
      v38 = 2112;
      v39 = v30;
      v40 = 2112;
      v41 = obj;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_DEBUG, "Notified that my status is now %i, message '%@', idleSince %@", buf, 0x1Cu);
    }

  }
  myIdleSince = self->_myIdleSince;
  v26 = obj != myIdleSince;
  if (obj != myIdleSince)
    objc_storeStrong((id *)&self->_myIdleSince, obj);
  if (v4 && v6 != self->_myPicture && !-[NSData isEqualToData:](v6, "isEqualToData:"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = -[NSData length](v6, "length");
        *(_DWORD *)buf = 67109120;
        v37 = v13;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Service: Received my new picture from daemon -- %d bytes", buf, 8u);
      }

    }
    objc_storeStrong((id *)&self->_myPicture, v6);
    +[IMMe me](IMMe, "me");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "myPictureChanged");

    v15 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v20, "myPictureDataChanged:", self->_myPicture);
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      }
      while (v17);
    }

  }
  if (self->_myStatus != v27)
  {
    self->_myStatus = v27;
    v26 = 1;
  }
  if (-[NSString isEqualToString:](self->_myStatusMessage, "isEqualToString:", v30))
  {
    myNowPlayingString = self->_myNowPlayingString;
    p_myNowPlayingString = &self->_myNowPlayingString;
    if ((-[__CFString isEqualToString:](v29, "isEqualToString:", myNowPlayingString) & 1) != 0)
    {
      if (!v26)
        goto LABEL_43;
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  objc_storeStrong((id *)&self->_myStatusMessage, v30);
  v23 = self->_myNowPlayingString;
  p_myNowPlayingString = &self->_myNowPlayingString;
  if ((-[__CFString isEqualToString:](v29, "isEqualToString:", v23) & 1) == 0)
LABEL_41:
    objc_storeStrong((id *)p_myNowPlayingString, v29);
LABEL_42:
  +[IMService notificationCenter](IMService, "notificationCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMMyStatusChangedNotification"), 0, 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "__mainThreadPostNotificationName:object:", CFSTR("__kIMMeStatusChangedNotification"), 0);

LABEL_43:
}

- (void)_processMyStatusChanged
{
  if (!self->_hasPendingProcessChange && self->_setupComplete)
    -[_IMLegacyDaemonListener performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reallyProcessMyStatusChanged, 0, 0.0);
}

- (BOOL)_hidingDisconnect
{
  return self->_hidingDisconnect;
}

- (void)_deferredSetup:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  void *v9;
  _QWORD *v10;
  void *v11;
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
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[12];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Performing deferred setup", buf, 2u);
    }

  }
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_daemonBeganDeferredSetup");

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "capabilitiesForListenerID:", 0);
  v43 = *MEMORY[0x1E0D36CD0];
  v8 = ((*MEMORY[0x1E0D36D28] | *MEMORY[0x1E0D36CC0] | *MEMORY[0x1E0D36CD0]) & v7) == 0;

  if (v8)
  {
    +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_handleChatReconstructions:", 0);
    goto LABEL_19;
  }
  +[IMKeyTransparencyController sharedController](IMKeyTransparencyController, "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setupComplete:info:", 1, v44);

  v10 = (_QWORD *)MEMORY[0x1E0D39098];
  objc_msgSend(v44, "objectForKey:", *MEMORY[0x1E0D39098]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKey:", *MEMORY[0x1E0D390E0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKey:", *MEMORY[0x1E0D39088]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKey:", *MEMORY[0x1E0D39090]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKey:", *MEMORY[0x1E0D390B8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_handleCachingAliasToCNIDMap:", v13);

  }
  if (v12)
  {
    +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_handleMergedChatReconstructions:", v12);
LABEL_13:

    goto LABEL_14;
  }
  if (v11)
  {
    +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKey:", *v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_handleChatReconstructions:", v18);

    goto LABEL_13;
  }
LABEL_14:
  if (v14)
  {
    +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_updateBlackholedChatsExist:", objc_msgSend(v14, "BOOLValue"));

  }
  if (v15)
  {
    +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_updateFilterediMessageChatsExist:", objc_msgSend(v15, "BOOLValue"));

  }
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "updateRecoverableMessagesMetadataSynchronously:loadChats:completionHandler:", 0, 0, 0);

LABEL_19:
  objc_msgSend(v44, "objectForKey:", *MEMORY[0x1E0D39108]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IMLegacyDaemonListener vcCapabilitiesChanged:](self, "vcCapabilitiesChanged:", objc_msgSend(v22, "unsignedLongLongValue"));

  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_daemonCompletedDeferredSetup");

  self->_postedSetupComplete = 1;
  v24 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v25 = v24;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v50 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v29, "setupComplete");
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v26);
  }

  if (!-[_IMLegacyDaemonListener _hidingDisconnect](self, "_hidingDisconnect"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "__mainThreadPostNotificationName:object:", CFSTR("__kIMDaemonDidConnectNotification"), 0);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "__mainThreadPostNotificationName:object:", CFSTR("__k_IMDaemonDidConnectNotification"), 0);

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  +[IMServiceImpl allServicesNonBlocking](IMServiceImpl, "allServicesNonBlocking");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v46 != v34)
          objc_enumerationMutation(v32);
        v36 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
        if (!-[_IMLegacyDaemonListener _hidingDisconnect](self, "_hidingDisconnect"))
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "__mainThreadPostNotificationName:object:", CFSTR("ServiceDidConnect"), v36);

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "__mainThreadPostNotificationName:object:", CFSTR("__k_IMServiceDidConnectNotification"), v36);

      }
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v33);
  }

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "capabilities");

  if ((v40 & v43) != 0)
  {
    if ((*MEMORY[0x1E0D36D30] & v40) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "requestPendingMessages");

    }
    IMSMSReportSpamActivateExtensions();
  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "_noteSetupComplete");

}

- (void)_noteDisconnected
{
  self->_setupComplete = 0;
  self->_postedSetupComplete = 0;
}

- (void)removeHandler:(id)a3
{
  NSMutableArray *handlers;

  -[NSMutableArray removeObjectIdenticalTo:](self->_handlers, "removeObjectIdenticalTo:", a3);
  if (!-[NSMutableArray count](self->_handlers, "count"))
  {
    handlers = self->_handlers;
    self->_handlers = 0;

  }
}

- (unint64_t)myStatus
{
  void *v3;
  void *v4;
  uint64_t v5;

  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectedAccounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    return self->_myStatus;
  else
    return 1;
}

- (unsigned)myIdleTime
{
  NSDate *myIdleSince;
  double v3;

  myIdleSince = self->_myIdleSince;
  if (myIdleSince)
  {
    -[NSDate timeIntervalSinceNow](myIdleSince, "timeIntervalSinceNow");
    LODWORD(myIdleSince) = -v3;
  }
  return myIdleSince;
}

- (void)_processDeferredInvitationDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("AccountUniqueID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ChatIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("Properties"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ChatStyle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "charValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("Message"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("DeferType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  if (v12 == 2)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("Messages"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IMLegacyDaemonListener account:chat:style:chatProperties:messagesReceived:](self, "account:chat:style:chatProperties:messagesReceived:", v5, v6, v9, v7, v13);

  }
  else if (v12 == 1)
  {
    -[_IMLegacyDaemonListener account:chat:style:chatProperties:messageReceived:](self, "account:chat:style:chatProperties:messageReceived:", v5, v6, v9, v7, v10);
  }
  else if (v12)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Unknown defer type", v15, 2u);
      }

    }
  }
  else
  {
    -[_IMLegacyDaemonListener account:chat:style:chatProperties:invitationReceived:](self, "account:chat:style:chatProperties:invitationReceived:", v5, v6, v9, v7, v10);
  }

}

- (void)_deferNotification:(id)a3
{
  id v4;
  NSMutableArray *deferredChatMessages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  deferredChatMessages = self->_deferredChatMessages;
  v8 = v4;
  if (!deferredChatMessages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_deferredChatMessages;
    self->_deferredChatMessages = v6;

    v4 = v8;
    deferredChatMessages = self->_deferredChatMessages;
  }
  -[NSMutableArray addObject:](deferredChatMessages, "addObject:", v4);

}

- (BOOL)isHoldingChatMessages
{
  return -[NSMutableArray count](self->_deferredChatMessages, "count") != 0;
}

- (void)holdChatMessages
{
  self->_holdingChatMessages = 1;
}

- (void)releaseHeldChatMessages
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  self->_holdingChatMessages = 0;
  if (-[_IMLegacyDaemonListener isHoldingChatMessages](self, "isHoldingChatMessages"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = self->_deferredChatMessages;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          -[_IMLegacyDaemonListener _processDeferredInvitationDictionary:](self, "_processDeferredInvitationDictionary:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)defaultsChanged:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "defaultsChanged:", v6);
    v10 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "defaultsChanged:forService:", v6, v7);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

- (void)activeAccountsChanged:(id)a3 forService:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v5 = a4;
  +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountsForService:", v33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReadOnly:", 1);

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v10 = v32;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v43 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
          +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "accountForUniqueID:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "activateAccount:locally:", v16, 1);

          objc_msgSend(v8, "removeObject:", v16);
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v11);
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v39 != v20)
            objc_enumerationMutation(v18);
          v22 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
          +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "_deactivateAccount:", v22);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v19);
    }

    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setReadOnly:", 0);

    objc_msgSend(v33, "activeAccountsChanged:", v10);
    v25 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v26 = v25;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v35;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v35 != v28)
            objc_enumerationMutation(v26);
          v30 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * k);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v30, "activeAccountsChanged:forService:", v10, v5);
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      }
      while (v27);
    }

    -[_IMLegacyDaemonListener _processMyStatusChanged](self, "_processMyStatusChanged");
  }

}

- (void)accountAdded:(id)a3 defaults:(id)a4 service:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  IMAccount *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  -[_IMLegacyDaemonListener serviceWithName:](self, "serviceWithName:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountForUniqueID:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = -[IMAccount initWithUniqueID:service:]([IMAccount alloc], "initWithUniqueID:service:", v14, v9);
      if (v12)
      {
        if (v8)
          -[_IMLegacyDaemonListener account:defaultsChanged:](self, "account:defaultsChanged:", v14, v8);
        +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAccount:locally:", v12, 1);

      }
      -[_IMLegacyDaemonListener _processMyStatusChanged](self, "_processMyStatusChanged");
    }

  }
}

- (void)accountRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountForUniqueID:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteAccount:locally:", v7, 1);

  }
  -[_IMLegacyDaemonListener _processMyStatusChanged](self, "_processMyStatusChanged");

}

- (void)account:(id)a3 loginStatusChanged:(unint64_t)a4 message:(id)a5 reason:(int)a6 properties:(id)a7
{
  uint64_t v8;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v8 = *(_QWORD *)&a6;
  v34 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v11 = a5;
  v12 = a7;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      +[IMAccount nameOfLoginStatus:](IMAccount, "nameOfLoginStatus:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v24;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Account: %@   Login Status Changed: %@", buf, 0x16u);

    }
  }
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accountForUniqueID:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "loginStatusChanged:message:reason:properties:", a4, v11, v8, v12);
  v16 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v21, "account:loginStatusChanged:message:reason:properties:", v24, a4, v11, v8, v12);
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v18);
  }

  -[_IMLegacyDaemonListener _processMyStatusChanged](self, "_processMyStatusChanged");
}

- (void)account:(id)a3 statusChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountForUniqueID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurrentAccountStatus:", v7);

  -[_IMLegacyDaemonListener _processMyStatusChanged](self, "_processMyStatusChanged");
  v10 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "account:statusChanged:", v6, v7);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)account:(id)a3 capabilitiesChanged:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountForUniqueID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v7, "capabilities");
  if (v14 != a4)
    objc_msgSend(v7, "updateCapabilities:", a4);
  v8 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "account:capabilitiesChanged:", v5, a4);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  if (v14 != a4)
    -[_IMLegacyDaemonListener _processMyStatusChanged](self, "_processMyStatusChanged");

}

- (void)account:(id)a3 buddyPropertiesChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountForUniqueID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1A8582D94]();
  objc_msgSend(v9, "buddyPropertiesChanged:", v7);
  objc_autoreleasePoolPop(v10);
  v11 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "account:buddyPropertiesChanged:", v6, v7);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)account:(id)a3 buddyPictureChanged:(id)a4 imageData:(id)a5 imageHash:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accountForUniqueID:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1A8582D94]();
  objc_msgSend(v22, "buddyPictureChanged:imageData:imageHash:", v11, v12, v13);
  objc_autoreleasePoolPop(v15);
  v16 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v21, "account:buddyPictureChanged:imageData:imageHash:", v10, v11, v12, v13);
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }

}

- (void)displayPinCodeForAccount:(id)a3 pinCode:(id)a4 deviceName:(id)a5 deviceType:(id)a6 phoneNumber:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v12, CFSTR("pinCode"), v13, CFSTR("deviceName"), v14, CFSTR("deviceType"), v15, CFSTR("phoneNumber"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accountForUniqueID:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "SMSPINRelay accountToBroadcast %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMAccountSMSRelayPinAlertNotification"), v18, v16);

}

- (void)pinCodeAlertCompleted:(id)a3 deviceName:(id)a4 deviceType:(id)a5 phoneNumber:(id)a6 responseFromDevice:(BOOL)a7 wasCancelled:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = a8;
  v9 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v18, CFSTR("responseFromDevice"), v19, CFSTR("wasCancelled"), v14, CFSTR("deviceName"), v15, CFSTR("deviceType"), v16, CFSTR("phoneNumber"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "accountForUniqueID:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMAccountSMSRelayPinDismissNotification"), v22, v20);

}

- (void)account:(id)a3 buddyProperties:(id)a4 buddyPictures:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountForUniqueID:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1A8582D94]();
  objc_msgSend(v19, "setBuddyProperties:buddyPictures:", v9, v10);
  objc_autoreleasePoolPop(v12);
  v13 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v18, "account:buddyProperties:buddyPictures:", v8, v9, v10);
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 invitationReceived:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  __CFDictionary *v16;
  __CFDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id value;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v9 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  value = a6;
  v14 = a7;
  v15 = v13;
  if (-[_IMLegacyDaemonListener shouldHoldChatMessages](self, "shouldHoldChatMessages"))
  {
    v16 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = v16;
    if (v12)
      CFDictionarySetValue(v16, CFSTR("AccountUniqueID"), v12);
    v18 = v12;
    if (value)
      CFDictionarySetValue(v17, CFSTR("Properties"), value);
    if (v15)
      CFDictionarySetValue(v17, CFSTR("ChatIdentifier"), v15);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", (char)v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      CFDictionarySetValue(v17, CFSTR("ChatStyle"), v19);

    if (v14)
      CFDictionarySetValue(v17, CFSTR("Message"), v14);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      CFDictionarySetValue(v17, CFSTR("DeferType"), v20);

    -[_IMLegacyDaemonListener _deferNotification:](self, "_deferNotification:", v17);
  }
  else
  {
    v18 = v12;
    v21 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = v21;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v26, "account:chat:style:chatProperties:invitationReceived:", v18, v15, v9, value, v14);
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v23);
    }

  }
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messageReceived:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  __CFDictionary *v16;
  __CFDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id value;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v9 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  value = a6;
  v14 = a7;
  v15 = v13;
  if (-[_IMLegacyDaemonListener shouldHoldChatMessages](self, "shouldHoldChatMessages"))
  {
    v16 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = v16;
    if (v12)
      CFDictionarySetValue(v16, CFSTR("AccountUniqueID"), v12);
    v18 = v12;
    if (value)
      CFDictionarySetValue(v17, CFSTR("Properties"), value);
    if (v15)
      CFDictionarySetValue(v17, CFSTR("ChatIdentifier"), v15);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", (char)v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      CFDictionarySetValue(v17, CFSTR("ChatStyle"), v19);

    if (v14)
      CFDictionarySetValue(v17, CFSTR("Message"), v14);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      CFDictionarySetValue(v17, CFSTR("DeferType"), v20);

    -[_IMLegacyDaemonListener _deferNotification:](self, "_deferNotification:", v17);
  }
  else
  {
    v18 = v12;
    v21 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = v21;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v26, "account:chat:style:chatProperties:messageReceived:", v18, v15, v9, value, v14);
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v23);
    }

  }
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messagesReceived:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  __CFDictionary *v16;
  __CFDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id value;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v9 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  value = a6;
  v14 = a7;
  v15 = v13;
  if (-[_IMLegacyDaemonListener shouldHoldChatMessages](self, "shouldHoldChatMessages"))
  {
    v16 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = v16;
    if (v12)
      CFDictionarySetValue(v16, CFSTR("AccountUniqueID"), v12);
    v18 = v12;
    if (value)
      CFDictionarySetValue(v17, CFSTR("Properties"), value);
    if (v15)
      CFDictionarySetValue(v17, CFSTR("ChatIdentifier"), v15);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", (char)v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      CFDictionarySetValue(v17, CFSTR("ChatStyle"), v19);

    if (v14)
      CFDictionarySetValue(v17, CFSTR("Messages"), v14);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      CFDictionarySetValue(v17, CFSTR("DeferType"), v20);

    -[_IMLegacyDaemonListener _deferNotification:](self, "_deferNotification:", v17);
  }
  else
  {
    v18 = v12;
    v21 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = v21;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v26, "account:chat:style:chatProperties:messagesReceived:", v18, v15, v9, value, v14);
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v23);
    }

  }
}

- (void)fileTransfer:(id)a3 createdWithProperties:(id)a4
{
  id v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "capabilitiesForListenerID:", 0);
  v8 = *MEMORY[0x1E0D36CE0] & v7;

  if (v8)
  {
    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_handleFileTransfer:createdWithProperties:", v10, v5);

  }
}

- (void)fileTransfers:(id)a3 createdWithLocalPaths:(id)a4
{
  id v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "capabilitiesForListenerID:", 0);
  v8 = *MEMORY[0x1E0D36CE0] & v7;

  if (v8)
  {
    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_handleFileTransfers:createdWithLocalPaths:", v10, v5);

  }
}

- (void)fileTransfer:(id)a3 updatedWithProperties:(id)a4
{
  id v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "capabilitiesForListenerID:", 0);
  v8 = *MEMORY[0x1E0D36CE0] & v7;

  if (v8)
  {
    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_handleFileTransfer:updatedWithProperties:", v10, v5);

  }
}

- (void)fileTransfer:(id)a3 updatedWithCurrentBytes:(unint64_t)a4 totalBytes:(unint64_t)a5 averageTransferRate:(unint64_t)a6
{
  void *v9;
  int v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "capabilitiesForListenerID:", 0);
  v11 = *MEMORY[0x1E0D36CE0] & v10;

  if (v11)
  {
    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_handleFileTransfer:updatedWithCurrentBytes:totalBytes:averageTransferRate:", v13, a4, a5, a6);

  }
}

- (void)fileTransfer:(id)a3 highQualityDownloadSucceededWithPath:(id)a4
{
  id v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "capabilitiesForListenerID:", 0);
  v8 = *MEMORY[0x1E0D36CE0] & v7;

  if (v8)
  {
    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_handleFileTransfer:highQualityDownloadSucceededWithPath:", v10, v5);

  }
}

- (void)fileTransferHighQualityDownloadFailed:(id)a3
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "capabilitiesForListenerID:", 0);
  v5 = *MEMORY[0x1E0D36CE0] & v4;

  if (v5)
  {
    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_handleFileTransferHighQualityDownloadFailed:", v7);

  }
}

- (void)fileTransfer:(id)a3 explicitDownloadSucceededWithPath:(id)a4 livePhotoBundlePath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "capabilitiesForListenerID:", 0);

  if ((v10 & 0x10000000) != 0)
  {
    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_handleFileTransfer:explicitDownloadSucceededWithPath:livePhotoBundlePath:", v12, v7, v8);

  }
}

- (void)fileTransferExplicitDownloadFailed:(id)a3 suggestedRetryGUID:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "capabilitiesForListenerID:", 0);

  if ((v10 & 0x10000000) != 0)
  {
    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_handleFileTransferExplicitDownloadFailed:suggestedRetryGUID:error:", v12, v7, v8);

  }
}

- (void)fileTransferDownloadedSucceededWithLocalURL:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "capabilitiesForListenerID:", 0);

  if ((v4 & 0x10000000) != 0)
  {
    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_handleFileTransferDownloadSucceededWithLocalURL:", v6);

  }
}

- (void)fileTransferDownloadFailedWithLocalURL:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "capabilitiesForListenerID:", 0);

  if ((v7 & 0x10000000) != 0)
  {
    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_handleFileTransferDownloadFailedWithLocalURL:error:", v9, v5);

  }
}

- (void)account:(id)a3 groupsChanged:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountForUniqueID:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1A8582D94]();
  objc_msgSend(v19, "groupsChanged:error:", v9, v10);
  objc_autoreleasePoolPop(v12);
  v13 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v18, "account:groupsChanged:error:", v8, v9, v10);
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

}

- (void)account:(id)a3 handleSubscriptionRequestFrom:(id)a4 withMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountForUniqueID:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "handleSubscriptionRequestFrom:withMessage:", v9, v10);
  v12 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v17, "account:handleSubscriptionRequestFrom:withMessage:", v8, v9, v10);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

}

- (void)account:(id)a3 postedError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__mainThreadPostNotificationName:object:userInfo:", *MEMORY[0x1E0D36418], v7, 0);

  }
  v9 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "account:postedError:", v6, v7);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (id)valueOfProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", a3);
}

- (void)_cacheValue:(id)a3 forProperty:(id)a4
{
  id v6;
  NSMutableDictionary *properties;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6)
  {
    properties = self->_properties;
    if (v8)
      -[NSMutableDictionary setObject:forKey:](properties, "setObject:forKey:", v8, v6);
    else
      -[NSMutableDictionary removeObjectForKey:](properties, "removeObjectForKey:", v6);
  }

}

- (void)property:(id)a3 changedTo:(id)a4 from:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_IMLegacyDaemonListener _cacheValue:forProperty:](self, "_cacheValue:forProperty:", v9, v8);
  v11 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "property:changedTo:from:", v8, v9, v10);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (id)valueOfPersistentProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_persistentProperties, "objectForKey:", a3);
}

- (void)_cacheValue:(id)a3 forPersistentProperty:(id)a4
{
  id v6;
  NSMutableDictionary *persistentProperties;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6)
  {
    persistentProperties = self->_persistentProperties;
    if (v8)
      -[NSMutableDictionary setObject:forKey:](persistentProperties, "setObject:forKey:", v8, v6);
    else
      -[NSMutableDictionary removeObjectForKey:](persistentProperties, "removeObjectForKey:", v6);
  }

}

- (void)persistentProperty:(id)a3 changedTo:(id)a4 from:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_IMLegacyDaemonListener _cacheValue:forPersistentProperty:](self, "_cacheValue:forPersistentProperty:", v9, v8);
  v11 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "persistentProperty:changedTo:from:", v8, v9, v10);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)account:(id)a3 defaults:(id)a4 blockList:(id)a5 allowList:(id)a6 blockingMode:(unsigned int)a7 blockIdleStatus:(BOOL)a8 status:(id)a9 capabilities:(unint64_t)a10 serviceLoginStatus:(unint64_t)a11 loginStatusMessage:(id)a12
{
  id v15;
  id v16;
  id v17;

  v15 = a12;
  v16 = a9;
  v17 = a3;
  -[_IMLegacyDaemonListener account:defaultsChanged:](self, "account:defaultsChanged:", v17, a4);
  -[_IMLegacyDaemonListener account:status:capabilities:serviceLoginStatus:loginStatusMessage:](self, "account:status:capabilities:serviceLoginStatus:loginStatusMessage:", v17, v16, a10, a11, v15);

}

- (void)newSetupInfoAvailable
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A1FF4000, v2, OS_LOG_TYPE_INFO, "Received notice from daemon that setup info has been invalidated, re-requesting", v5, 2u);
    }

  }
  +[IMDaemonController sharedController](IMDaemonController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestSetup");

  +[IMDaemonController sharedController](IMDaemonController, "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blockUntilConnected");

}

- (void)databaseUpdated:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
    -[_IMLegacyDaemonListener _setStamp:forContext:](self, "_setStamp:forContext:", v4, CFSTR("DBModificationStamp"));
  v5 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "databaseUpdated:", v4);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v11 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "databaseUpdated");
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

}

- (void)databaseChatSpamUpdated:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "databaseChatSpamUpdated:", v4);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)didFetchSyncStateStats:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEBUG, "didFetchSyncStateStats %@", buf, 0xCu);
    }

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("IMCloudKitSyncStatisticsKey");
    v10 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("IMCloudKitFetchedSyncStatsNotification"), self, v7);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Received nil sync state stats", buf, 2u);
    }

  }
}

- (void)didFetchRampState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEBUG, "didFetchRampState %@", buf, 0xCu);
    }

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("IMCloudKitRampStateKey");
    v10 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("IMCloudKitFetchedRampStateNotification"), self, v7);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Received nil rampState", buf, 2u);
    }

  }
}

- (void)didAttemptToDisableiCloudBackups:(int64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  int64_t v17;
  __int16 v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    v20[0] = CFSTR("IMCloudKitBackupDisableBackupAttemptResultKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = CFSTR("IMCloudKitBackupDisableBackupAttemptErrorKey");
    v21[0] = v7;
    v21[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v17 = a3;
        v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Attempt to disable iCloud backups resulted in error. Result: %ld, error: %@", buf, 0x16u);

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3, CFSTR("IMCloudKitBackupDisableBackupAttemptResultKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v17 = a3;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "did attempt to disable iCloud backups: %ld", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("IMCloudKitAttemptedToDisableiCloudBackupsNotification"), self, v8);

}

- (void)didFetchCloudKitSyncDebuggingInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "did fetch cloudkit sync state debugging info: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("IMCloudKitFetchedSyncDebuggingInfoNotification"), self, v4);

}

- (void)qosClassWhileServicingRequestsResponse:(unsigned int)a3 identifier:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v4 = *(_QWORD *)&a3;
  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a4;
  objc_msgSend(v6, "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("Identifier");
  v11[1] = CFSTR("QOSClass");
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("IMDaemonListenerReceivedQOSClassWhileServicingRequestsResponseNotification"), self, v10);
}

- (void)didAttemptToSetEnabledTo:(BOOL)a3 result:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  +[IMCloudKitHooks sharedInstance](IMCloudKitHooks, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_didAttemptToSetEnabledTo:result:", v5, v4);

}

- (void)didPerformAdditionalStorageRequiredCheckWithSuccess:(BOOL)a3 additionalStorageRequired:(unint64_t)a4 forAccountId:(id)a5 error:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  id v11;

  v8 = a3;
  v9 = a6;
  v10 = a5;
  +[IMCloudKitHooks sharedInstance](IMCloudKitHooks, "sharedInstance");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_didPerformAdditionalStorageRequiredCheckWithSuccess:additionalStorageRequired:forAccountId:error:", v8, a4, v10, v9);

}

- (void)didAttemptToDisableAllDevicesResult:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[IMCloudKitHooks sharedInstance](IMCloudKitHooks, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_didAttemptToDisableAllDevicesResult:", v3);

}

- (void)updateCloudKitState
{
  id v2;

  +[IMCloudKitHooks sharedInstance](IMCloudKitHooks, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateCloudKitState");

}

- (void)updateCloudKitProgressWithDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMCloudKitHooks sharedInstance](IMCloudKitHooks, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateCloudKitProgressWithDictionary:", v3);

}

- (void)receivedUrgentRequestForMessages:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "receivedUrgentRequestForMessages:", v4);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)updatePendingNicknameUpdates:(id)a3 handledNicknames:(id)a4 archivedNicknames:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Got back pending nickname updates %@", buf, 0xCu);
    }

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1A205A304;
  v23[3] = &unk_1E471F038;
  v13 = v11;
  v24 = v13;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v23);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Got back handled nicknames %@", buf, 0xCu);
    }

  }
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = sub_1A205A37C;
  v21[3] = &unk_1E471F038;
  v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v22 = v15;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v21);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Got back archived nicknames %@", buf, 0xCu);
    }

  }
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = sub_1A205A3F4;
  v19[3] = &unk_1E471F038;
  v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v17 = v20;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v19);
  +[IMNicknameController sharedInstance](IMNicknameController, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updatePendingNicknames:handledNicknames:archivedNicknames:", v13, v15, v17);

}

- (void)updateNicknameHandlesForSharing:(id)a3 blocked:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[IMNicknameController sharedInstance](IMNicknameController, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateSharingAllowList:denyList:", v6, v5);

}

- (void)updateTransitionedNicknameHandles:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMNicknameController sharedInstance](IMNicknameController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateTransitionedNicknameHandles:", v3);

}

- (void)updateActiveNicknameRecords:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMNicknameController sharedInstance](IMNicknameController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateIsActiveList:", v3);

}

- (void)updateIgnoredNicknameRecords:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMNicknameController sharedInstance](IMNicknameController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateIsIgnoredList:", v3);

}

- (void)updatePersonalNickname:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMNicknameController sharedInstance](IMNicknameController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatePersonalNickname:", v3);

}

- (void)oneTimeCodesDidChange:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Got the call back for validation codes count %@", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("validCodes");
  v9 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("com.apple.imcore.otcUpdated"), 0, v7);

}

- (void)_resetPostedSetupCompleted
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Resetting posted setup complete after changing listener caps", v4, 2u);
    }

  }
  self->_postedSetupComplete = 0;
}

- (void)simSubscriptionsDidChange
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A1FF4000, v2, OS_LOG_TYPE_INFO, "Raising notification that SIM subscriptions have changed.", v4, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__mainThreadPostNotificationName:object:", *MEMORY[0x1E0D38CF0], 0);

}

- (NSMutableDictionary)_contexts
{
  return self->_contexts;
}

- (void)_setHidingDisconnect:(BOOL)a3
{
  self->_hidingDisconnect = a3;
}

- (NSMutableArray)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (NSString)myStatusMessage
{
  return self->_myStatusMessage;
}

- (void)setMyStatusMessage:(id)a3
{
  objc_storeStrong((id *)&self->_myStatusMessage, a3);
}

- (unint64_t)vcCapabilities
{
  return self->_vcCapabilities;
}

- (BOOL)shouldHoldChatMessages
{
  return self->_holdingChatMessages;
}

- (BOOL)hasPostedSetupComplete
{
  return self->_postedSetupComplete;
}

- (NSMutableDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (NSMutableDictionary)persistentProperties
{
  return self->_persistentProperties;
}

- (void)setPersistentProperties:(id)a3
{
  objc_storeStrong((id *)&self->_persistentProperties, a3);
}

- (NSProtocolChecker)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_protocol, a3);
}

- (NSMutableArray)deferredChatMessages
{
  return self->_deferredChatMessages;
}

- (void)setDeferredChatMessages:(id)a3
{
  objc_storeStrong((id *)&self->_deferredChatMessages, a3);
}

- (NSMutableDictionary)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_storeStrong((id *)&self->_services, a3);
}

- (NSDate)myIdleSince
{
  return self->_myIdleSince;
}

- (void)setMyIdleSince:(id)a3
{
  objc_storeStrong((id *)&self->_myIdleSince, a3);
}

- (NSData)myPicture
{
  return self->_myPicture;
}

- (void)setMyPicture:(id)a3
{
  objc_storeStrong((id *)&self->_myPicture, a3);
}

- (void)setMyStatus:(unint64_t)a3
{
  self->_myStatus = a3;
}

- (NSString)myNowPlayingString
{
  return self->_myNowPlayingString;
}

- (void)setMyNowPlayingString:(id)a3
{
  objc_storeStrong((id *)&self->_myNowPlayingString, a3);
}

- (BOOL)hasPendingProcessChange
{
  return self->_hasPendingProcessChange;
}

- (void)setHasPendingProcessChange:(BOOL)a3
{
  self->_hasPendingProcessChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myNowPlayingString, 0);
  objc_storeStrong((id *)&self->_myPicture, 0);
  objc_storeStrong((id *)&self->_myIdleSince, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_deferredChatMessages, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_persistentProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_myStatusMessage, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
}

@end
