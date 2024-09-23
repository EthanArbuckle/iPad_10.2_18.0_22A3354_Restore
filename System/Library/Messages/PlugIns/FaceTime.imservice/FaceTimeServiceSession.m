@implementation FaceTimeServiceSession

- (unint64_t)capabilities
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BE505A0], "sharedDaemon"), "vcCapabilities") | 0x102000000000;
}

- (void)refreshServiceCapabilities
{
  id v3;

  v3 = -[IMDServiceSession broadcaster](self, "broadcaster");
  -[IMDServiceSession accountID](self, "accountID");
  -[FaceTimeServiceSession capabilities](self, "capabilities");
  MEMORY[0x24BEDD108](v3, sel_account_capabilitiesChanged_);
}

- (id)idsAccounts
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[IMDServiceSession accounts](self, "accounts");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", objc_msgSend(v9, "idsAccount"));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  if (objc_msgSend(v3, "count"))
  {
    IMDInconsistencyResolved();
  }
  else
  {
    if (-[IMDServiceSession isActive](self, "isActive"))
    {
      -[IMDServiceSession accounts](self, "accounts");
      IMDNoticedInconsistency();
    }
    return 0;
  }
  return v3;
}

- (void)refreshRegistration
{
  id v3;
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

  v13 = *MEMORY[0x24BDAC8D0];
  -[FaceTimePushHandler setRegistered:](self->_ftPushHandler, "setRegistered:", -[IMDAppleServiceSession _isDeviceRegistered](self, "_isDeviceRegistered"));
  if (-[IMDAppleServiceSession _isDeviceRegistered](self, "_isDeviceRegistered"))
    -[IMDAccount writeAccountDefaults:](-[IMDServiceSession account](self, "account"), "writeAccountDefaults:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", _IDSInvitationProtocolVersionNumber(), CFSTR("InvitationProtocolVersion")));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[FaceTimeServiceSession idsAccounts](self, "idsAccounts", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        -[IMDAppleServiceSession resetCallerIDForIDSAccount:](self, "resetCallerIDForIDSAccount:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)sessionWillBecomeInactiveWithAccount:(id)a3
{
  NSObject *v5;
  id completionBlock;
  const char *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[FaceTimeServiceSession sessionWillBecomeInactiveWithAccount:]";
      _os_log_impl(&dword_229238000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v7 = "-[FaceTimeServiceSession sessionWillBecomeInactiveWithAccount:]";
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v7 = "-[FaceTimeServiceSession sessionWillBecomeInactiveWithAccount:]";
      _IMAlwaysLog();
    }
  }
  -[FaceTimeServiceSession _purgeMap](self, "_purgeMap", v7);
  completionBlock = self->_completionBlock;
  if (completionBlock)
  {

    self->_completionBlock = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)FaceTimeServiceSession;
  -[IMDAppleServiceSession sessionWillBecomeInactiveWithAccount:](&v8, sel_sessionWillBecomeInactiveWithAccount_, a3);
}

- (void)_purgeMap
{
  NSObject *v3;
  NSString *v4;
  uint64_t v5;
  uint8_t buf[4];
  NSString *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v7 = -[IMDAppleServiceSession GUID](self, "GUID");
      v8 = 2112;
      v9 = qword_253E79928;
      _os_log_impl(&dword_229238000, v3, OS_LOG_TYPE_INFO, "Purging GUID %@ from conference maps %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v4 = -[IMDAppleServiceSession GUID](self, "GUID");
    v5 = qword_253E79928;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v4 = -[IMDAppleServiceSession GUID](self, "GUID", v4, v5);
      v5 = qword_253E79928;
      _IMAlwaysLog();
    }
  }
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__purgeMap, 0, v4, v5);
  objc_msgSend((id)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "removeAllObjects");
  objc_msgSend((id)qword_253E79928, "removeObjectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229238000, v3, OS_LOG_TYPE_INFO, "Dealloc", buf, 2u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    _IMLoggingLog();
    if (_IMWillLog())
      _IMAlwaysLog();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, 0, 0);
  -[FaceTimeServiceSession _purgeMap](self, "_purgeMap");

  -[FaceTimePushHandler removeListener:](self->_ftPushHandler, "removeListener:", self);
  objc_msgSend((id)qword_253E79928, "removeObjectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));

  objc_msgSend((id)qword_253E79920, "removeObject:", -[IMDAppleServiceSession GUID](self, "GUID"));
  if (!objc_msgSend((id)qword_253E79920, "count"))
  {
    objc_msgSend((id)qword_253E79930, "invalidate");

    qword_253E79930 = 0;
  }

  objc_msgSend(self->_broadcasterACInvocationQueue, "setDelegate:", 0);
  objc_msgSend(self->_broadcasterACInvocationQueue, "setTarget:", 0);
  objc_msgSend(self->_broadcasterACInvocationQueue, "removeAllInvocations");

  objc_msgSend(self->_broadcasterVCInvocationQueue, "setDelegate:", 0);
  objc_msgSend(self->_broadcasterVCInvocationQueue, "setTarget:", 0);
  objc_msgSend(self->_broadcasterVCInvocationQueue, "removeAllInvocations");

  v4.receiver = self;
  v4.super_class = (Class)FaceTimeServiceSession;
  -[IMDAppleServiceSession dealloc](&v4, sel_dealloc);
}

+ (void)initialize
{
  if (qword_253E79918 != -1)
    dispatch_once(&qword_253E79918, &unk_24F1EACC8);
}

- (void)_setPurgeTimer
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__purgeMap, 0);
  MEMORY[0x24BEDD108](self, sel_performSelector_withObject_afterDelay_);
}

- (void)_setPeerInfo:(id)a3 conferenceID:(id)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  _BYTE v15[18];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3 && a4)
  {
    if (!objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")))
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend((id)qword_253E79928, "setObject:forKey:", v7, -[IMDAppleServiceSession GUID](self, "GUID"));

    }
    if ((unint64_t)objc_msgSend((id)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "count") >= 0x15)
    {
      if (IMOSLoggingEnabled())
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v15 = 20;
          *(_WORD *)&v15[4] = 2112;
          *(_QWORD *)&v15[6] = objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
          _os_log_impl(&dword_229238000, v8, OS_LOG_TYPE_INFO, "Max cache size of %d reached for CONFERENCE_MAP. Removing all objects in CONFERENCE_MAP %@", buf, 0x12u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v12 = 20;
        v13 = (id)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v9 = objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID", 20, v13));
          v12 = 20;
          v13 = (id)v9;
          _IMAlwaysLog();
        }
      }
      objc_msgSend((id)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID", v12, v13)), "removeAllObjects");
    }
    objc_msgSend((id)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "setObject:forKey:", a3, a4);
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v15 = a3;
        *(_WORD *)&v15[8] = 2112;
        *(_QWORD *)&v15[10] = a4;
        _os_log_impl(&dword_229238000, v10, OS_LOG_TYPE_INFO, "Setting peer info: %@  for cid: %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v12 = (uint64_t)a3;
      v13 = a4;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v12 = (uint64_t)a3;
        v13 = a4;
        _IMAlwaysLog();
      }
    }
    v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v15 = a3;
      *(_WORD *)&v15[8] = 2112;
      *(_QWORD *)&v15[10] = a4;
      _os_log_impl(&dword_229238000, v11, OS_LOG_TYPE_DEFAULT, "Setting peer info: %@  for cid: %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v12 = (uint64_t)a3;
        v13 = a4;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v12 = (uint64_t)a3;
        v13 = a4;
        IMLogString();
      }
    }
    -[FaceTimeServiceSession _setPurgeTimer](self, "_setPurgeTimer", v12, v13);
  }
}

- (BOOL)_hasPeersForPeerID:(id)a3 conferenceID:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  NSString *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  BOOL result;
  NSString *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v35 = (uint64_t)a3;
      v36 = 2112;
      v37 = (uint64_t)a4;
      _os_log_impl(&dword_229238000, v7, OS_LOG_TYPE_INFO, "Checking peers with peerID %@ conferenceID %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v23 = (NSString *)a3;
    v27 = a4;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v23 = (NSString *)a3;
      v27 = a4;
      _IMAlwaysLog();
    }
  }
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = -[IMDAppleServiceSession GUID](self, "GUID");
      *(_DWORD *)buf = 138412290;
      v35 = (uint64_t)v9;
      _os_log_impl(&dword_229238000, v8, OS_LOG_TYPE_INFO, "My GUID: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v23 = -[IMDAppleServiceSession GUID](self, "GUID");
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v23 = -[IMDAppleServiceSession GUID](self, "GUID", v23);
      _IMAlwaysLog();
    }
  }
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = qword_253E79928;
      _os_log_impl(&dword_229238000, v10, OS_LOG_TYPE_INFO, "Conference maps %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v23 = (NSString *)qword_253E79928;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v23 = (NSString *)qword_253E79928;
      _IMAlwaysLog();
    }
  }
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
      *(_DWORD *)buf = 138412290;
      v35 = v12;
      _os_log_impl(&dword_229238000, v11, OS_LOG_TYPE_INFO, "Looking for peer in map %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v23 = (NSString *)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v23 = (NSString *)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID", v23));
      _IMAlwaysLog();
    }
  }
  v13 = (void *)objc_msgSend((id)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID", v23, v27)), "objectForKey:", a4);
  if (!v13)
    return 0;
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = (uint64_t)v13;
      _os_log_impl(&dword_229238000, v14, OS_LOG_TYPE_INFO, "Peers %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v24 = v13;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v24 = v13;
      _IMAlwaysLog();
    }
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16, v24);
  if (!v15)
    return 0;
  v16 = *(_QWORD *)v30;
  while (2)
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v30 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      if (IMOSLoggingEnabled())
      {
        v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v35 = (uint64_t)v18;
          _os_log_impl(&dword_229238000, v19, OS_LOG_TYPE_INFO, "Peer info %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v25 = v18;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v25 = v18;
          _IMAlwaysLog();
        }
      }
      v20 = objc_msgSend(v18, "objectForKey:", CFSTR("id"), v25);
      if (IMOSLoggingEnabled())
      {
        v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v35 = (uint64_t)a3;
          v36 = 2112;
          v37 = v20;
          _os_log_impl(&dword_229238000, v21, OS_LOG_TYPE_INFO, "Comparing %@ to %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v26 = a3;
        v28 = v20;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v26 = a3;
          v28 = v20;
          _IMAlwaysLog();
        }
      }
      if ((objc_msgSend(a3, "isEqualToString:", v20, v26, v28) & 1) != 0)
        return 1;
    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    result = 0;
    if (v15)
      continue;
    break;
  }
  return result;
}

- (id)_displayIDForPeerID:(id)a3 conferenceID:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "objectForKey:", a4);
  v6 = v5;
  if (v5)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v10, "objectForKey:", CFSTR("id"))))
          {
            v6 = (void *)objc_msgSend((id)objc_msgSend(v10, "objectForKey:", CFSTR("canonical-id")), "_stripFZIDPrefix");
            if (v6)
            {
              v11 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v19 = v6;
                v20 = 2112;
                v21 = a3;
                _os_log_impl(&dword_229238000, v11, OS_LOG_TYPE_DEFAULT, "Found display ID: %@ for peer ID: %@", buf, 0x16u);
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                if (MarcoShouldLog())
                  MarcoLog();
                if (IMShouldLog())
                  IMLogString();
              }
              if (IMOSLoggingEnabled())
              {
                v12 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v19 = v6;
                  v20 = 2112;
                  v21 = a3;
                  _os_log_impl(&dword_229238000, v12, OS_LOG_TYPE_INFO, "Found display ID: %@ for peer ID: %@", buf, 0x16u);
                }
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                _IMLoggingLog();
                if (_IMWillLog())
                  _IMAlwaysLog();
              }
            }
            else
            {
              _IMWarn();
              return a3;
            }
            return v6;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v7)
          continue;
        break;
      }
    }
    _IMWarn();
    return (id)objc_msgSend(a3, "_stripFZIDPrefix", a3);
  }
  else
  {
    _IMWarn();
  }
  return v6;
}

- (void)_retargetPeerID:(id)a3 displayID:(id)a4 pushToken:(id)a5 conferenceID:(id)a6
{
  __CFDictionary *v11;
  NSObject *v12;
  NSObject *v13;
  const void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  __CFDictionary *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  uint8_t buf[4];
  _BYTE v32[18];
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v11 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)v32 = a3;
      *(_WORD *)&v32[8] = 2112;
      *(_QWORD *)&v32[10] = a4;
      v33 = 2112;
      v34 = a5;
      v35 = 2112;
      v36 = a6;
      _os_log_impl(&dword_229238000, v12, OS_LOG_TYPE_INFO, "Retargeting peer ID: %@   display ID: %@   token: %@   cid: %@", buf, 0x2Au);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v29 = a5;
    v30 = a6;
    v23 = a3;
    v27 = a4;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v29 = a5;
      v30 = a6;
      v23 = a3;
      v27 = a4;
      _IMAlwaysLog();
    }
  }
  v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v32 = a3;
    *(_WORD *)&v32[8] = 2112;
    *(_QWORD *)&v32[10] = a4;
    v33 = 2112;
    v34 = a5;
    v35 = 2112;
    v36 = a6;
    _os_log_impl(&dword_229238000, v13, OS_LOG_TYPE_DEFAULT, "Retargeting peer ID: %@   display ID: %@   token: %@   cid: %@", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      v29 = a5;
      v30 = a6;
      v23 = a3;
      v27 = a4;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      v29 = a5;
      v30 = a6;
      v23 = a3;
      v27 = a4;
      IMLogString();
    }
  }
  if (!a4)
    a4 = -[FaceTimeServiceSession _displayIDForPeerID:conferenceID:](self, "_displayIDForPeerID:conferenceID:", a3, a6);
  v14 = (const void *)objc_msgSend(a4, "_IDFromFZIDType:", objc_msgSend(a4, "_FZBestGuessFZIDType", v23, v27, v29, v30));
  if (v14)
    CFDictionarySetValue(v11, CFSTR("canonical-id"), v14);
  if (a3)
    CFDictionarySetValue(v11, CFSTR("id"), a3);
  if (a5)
    CFDictionarySetValue(v11, CFSTR("push-token"), a5);
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v32 = v11;
      _os_log_impl(&dword_229238000, v15, OS_LOG_TYPE_INFO, "Resulting peerInfo %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v24 = v11;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v24 = v11;
      _IMAlwaysLog();
    }
  }
  if (!objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID", v24)))
  {
    v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend((id)qword_253E79928, "setObject:forKey:", v16, -[IMDAppleServiceSession GUID](self, "GUID"));

  }
  if ((unint64_t)objc_msgSend((id)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "count") >= 0x15)
  {
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v32 = 20;
        *(_WORD *)&v32[4] = 2112;
        *(_QWORD *)&v32[6] = v18;
        _os_log_impl(&dword_229238000, v17, OS_LOG_TYPE_INFO, "Max cache size of %d reached for CONFERENCE_MAP. Removing all objects in CONFERENCE_MAP %@", buf, 0x12u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v25 = 20;
      v28 = objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v19 = objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID", 20, v28));
        v25 = 20;
        v28 = v19;
        _IMAlwaysLog();
      }
    }
    objc_msgSend((id)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID", v25, v28)), "removeAllObjects");
  }
  objc_msgSend((id)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "setObject:forKey:", IMSingleObjectArray(), a6);
  if (IMOSLoggingEnabled())
  {
    v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v32 = v21;
      _os_log_impl(&dword_229238000, v20, OS_LOG_TYPE_INFO, "Conference map after retarget: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v26 = objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
    _IMLoggingLog();
    if (_IMWillLog())
    {
      objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID", v26));
      _IMAlwaysLog();
    }
  }
  if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v32 = qword_253E79928;
      _os_log_impl(&dword_229238000, v22, OS_LOG_TYPE_INFO, "All maps after retarget: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    _IMLoggingLog();
    if (_IMWillLog())
      _IMAlwaysLog();
  }

  -[FaceTimeServiceSession _setPurgeTimer](self, "_setPurgeTimer");
}

- (void)_setAlternateDisplayID:(id)a3 forPeerID:(id)a4 conferenceID:(id)a5
{
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __CFDictionary *v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (a3
    && a4
    && a5
    && objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")))
  {
    v9 = (void *)objc_msgSend((id)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "objectForKey:", a5);
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v27 = a3;
        v28 = 2112;
        v29 = a4;
        v30 = 2112;
        v31 = a5;
        _os_log_impl(&dword_229238000, v10, OS_LOG_TYPE_INFO, "Setting alternate display ID: %@ for peer ID: %@ cid: %@", buf, 0x20u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v19 = a4;
      v20 = a5;
      v18 = a3;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v19 = a4;
        v20 = a5;
        v18 = a3;
        _IMAlwaysLog();
      }
    }
    v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v27 = a3;
      v28 = 2112;
      v29 = a4;
      v30 = 2112;
      v31 = a5;
      _os_log_impl(&dword_229238000, v11, OS_LOG_TYPE_DEFAULT, "Setting alternate display ID: %@ for peer ID: %@ cid: %@", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v19 = a4;
        v20 = a5;
        v18 = a3;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v19 = a4;
        v20 = a5;
        v18 = a3;
        IMLogString();
      }
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16, v18, v19, v20);
    if (v12)
    {
      v13 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(a4, "isEqualToString:", objc_msgSend(v15, "objectForKey:", CFSTR("id"))))
          {
            v17 = (__CFDictionary *)objc_msgSend(v15, "mutableCopy");
            v16 = (void *)objc_msgSend(v9, "mutableCopy");
            CFDictionarySetValue(v17, CFSTR("alternate-display-id"), a3);
            objc_msgSend(v16, "removeObjectIdenticalTo:", v15);
            objc_msgSend(v16, "addObject:", v17);

            if (v16)
              objc_msgSend((id)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "setObject:forKey:", v16, a5);
            goto LABEL_29;
          }
        }
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v12)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_29:

    -[FaceTimeServiceSession _setPurgeTimer](self, "_setPurgeTimer");
  }
}

- (BOOL)_anyPeersForConferenceIDMayRequireBreakBeforeMake:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL result;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend((id)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "objectForKey:", a3);
  if (!v3)
  {
    _IMWarn();
    return 0;
  }
  v4 = v3;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (!v5)
    return 0;
  v6 = *(_QWORD *)v14;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
      v9 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("protocol-flags"));
      v10 = objc_msgSend(v8, "objectForKey:", CFSTR("id"));
      if ((objc_msgSend(v9, "unsignedIntegerValue") & 0x10) != 0)
      {
        if (IMOSLoggingEnabled())
        {
          v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v10;
            _os_log_impl(&dword_229238000, v12, OS_LOG_TYPE_INFO, "Peer: %@   requires break before make!", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog())
            _IMAlwaysLog();
        }
        return 1;
      }
    }
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    result = 0;
    if (v5)
      continue;
    break;
  }
  return result;
}

- (id)_peerIDPushTokenPairsForConferenceID:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "objectForKey:", a3);
  if (v4)
  {
    v24 = a3;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = v4;
    v6 = 0;
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "objectForKey:", CFSTR("id"), v22, v23);
          v12 = objc_msgSend(v10, "objectForKey:", CFSTR("push-token"));
          v13 = v12;
          if (v11)
            v14 = v12 == 0;
          else
            v14 = 1;
          if (v14)
          {
            v22 = v12;
            v23 = v11;
            _IMWarn();
            v15 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v30 = v13;
              v31 = 2112;
              v32 = v11;
              _os_log_impl(&dword_229238000, v15, OS_LOG_TYPE_DEFAULT, "Peer didn't have a token %@ or peer ID: %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (MarcoShouldLog())
              {
                v22 = v13;
                v23 = v11;
                MarcoLog();
              }
              if (IMShouldLog())
              {
                v22 = v13;
                v23 = v11;
                IMLogString();
              }
            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              v17 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v30 = v13;
                v31 = 2112;
                v32 = v11;
                _os_log_impl(&dword_229238000, v17, OS_LOG_TYPE_INFO, "Found token: %@ for peer ID: %@", buf, 0x16u);
              }
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              _IMLoggingLog();
              if (_IMWillLog())
                _IMAlwaysLog();
            }
            v18 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v30 = v13;
              v31 = 2112;
              v32 = v11;
              _os_log_impl(&dword_229238000, v18, OS_LOG_TYPE_DEFAULT, "Found token: %@ for peer ID: %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (MarcoShouldLog())
                MarcoLog();
              if (IMShouldLog())
                IMLogString();
            }
            if (!v6)
              v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v11, CFSTR("id"), v13, CFSTR("push-token"), 0);
            objc_msgSend(v6, "addObject:", v19);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v7);
    }
    if (!objc_msgSend(v6, "count", v22, v23))
    {
      v20 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = (uint64_t)v24;
        _os_log_impl(&dword_229238000, v20, OS_LOG_TYPE_DEFAULT, "Couldn't build peerID to push token map for cid: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
          MarcoLog();
        if (IMShouldLog())
          IMLogString();
      }
      _IMWarn();
    }
    return v6;
  }
  else
  {
    _IMWarn();
    return 0;
  }
}

- (id)_pushTokensForPeerID:(id)a3 conferenceID:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "objectForKey:", a4);
  if (v5)
  {
    v6 = v5;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = 0;
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v11, "objectForKey:", CFSTR("id"), v18)))
          {
            v12 = objc_msgSend(v11, "objectForKey:", CFSTR("push-token"));
            if (v12)
            {
              if (IMOSLoggingEnabled())
              {
                v13 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v25 = v12;
                  v26 = 2112;
                  v27 = a3;
                  _os_log_impl(&dword_229238000, v13, OS_LOG_TYPE_INFO, "Found token: %@ for peer ID: %@", buf, 0x16u);
                }
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                v18 = (id)v12;
                v19 = a3;
                _IMLoggingLog();
                if (_IMWillLog())
                {
                  v18 = (id)v12;
                  v19 = a3;
                  _IMAlwaysLog();
                }
              }
              v14 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v25 = v12;
                v26 = 2112;
                v27 = a3;
                _os_log_impl(&dword_229238000, v14, OS_LOG_TYPE_DEFAULT, "Found token: %@ for peer ID: %@", buf, 0x16u);
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                if (MarcoShouldLog())
                {
                  v18 = (id)v12;
                  v19 = a3;
                  MarcoLog();
                }
                if (IMShouldLog())
                {
                  v18 = (id)v12;
                  v19 = a3;
                  IMLogString();
                }
              }
              if (!v7)
                v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              objc_msgSend(v7, "addObject:", v12, v18, v19);
            }
            else
            {
              v18 = a3;
              _IMWarn();
              v15 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v25 = (uint64_t)a3;
                _os_log_impl(&dword_229238000, v15, OS_LOG_TYPE_DEFAULT, "Found no token for peer ID: %@", buf, 0xCu);
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                if (MarcoShouldLog())
                {
                  v18 = a3;
                  MarcoLog();
                }
                if (IMShouldLog())
                {
                  v18 = a3;
                  IMLogString();
                }
              }
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v8);
    }
    if (!objc_msgSend(v7, "count", v18))
    {
      v16 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = (uint64_t)a3;
        _os_log_impl(&dword_229238000, v16, OS_LOG_TYPE_DEFAULT, "Found no mapping at all for peer ID: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
          MarcoLog();
        if (IMShouldLog())
          IMLogString();
      }
      _IMWarn();
    }
    return v7;
  }
  else
  {
    _IMWarn();
    return 0;
  }
}

- (id)_pushTokenForPeerID:(id)a3 conferenceID:(id)a4
{
  return (id)objc_msgSend(-[FaceTimeServiceSession _pushTokensForPeerID:conferenceID:](self, "_pushTokensForPeerID:conferenceID:", a3, a4), "lastObject");
}

- (id)_peerIDsForDiplayID:(id)a3 conferenceID:(id)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend((id)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "objectForKey:", a4);
  if (v6)
  {
    v7 = (void *)v6;
    v26 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v12 = (void *)objc_msgSend((id)objc_msgSend(v11, "objectForKey:", CFSTR("canonical-id"), v23), "_stripFZIDPrefix");
          v13 = objc_msgSend(v11, "objectForKey:", CFSTR("alternate-display-id"));
          if ((objc_msgSend(v12, "isEqualToString:", a3) & 1) != 0
            || v13 && objc_msgSend(a3, "isEqualToString:", v13))
          {
            v14 = objc_msgSend(v11, "objectForKey:", CFSTR("id"));
            if (v14)
            {
              v15 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                v32 = v14;
                v33 = 2112;
                v34 = a3;
                v35 = 2112;
                v36 = v11;
                _os_log_impl(&dword_229238000, v15, OS_LOG_TYPE_DEFAULT, "Found peer ID: %@ for display ID: %@  (Peer info: %@)", buf, 0x20u);
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                if (MarcoShouldLog())
                {
                  v24 = a3;
                  v25 = v11;
                  v23 = (void *)v14;
                  MarcoLog();
                }
                if (IMShouldLog())
                {
                  v24 = a3;
                  v25 = v11;
                  v23 = (void *)v14;
                  IMLogString();
                }
              }
              if (IMOSLoggingEnabled())
              {
                v16 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  v32 = v14;
                  v33 = 2112;
                  v34 = a3;
                  v35 = 2112;
                  v36 = v11;
                  _os_log_impl(&dword_229238000, v16, OS_LOG_TYPE_INFO, "Found peer ID: %@ for display ID: %@  (Peer info: %@)", buf, 0x20u);
                }
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                v24 = a3;
                v25 = v11;
                v23 = (void *)v14;
                _IMLoggingLog();
                if (_IMWillLog())
                {
                  v24 = a3;
                  v25 = v11;
                  v23 = (void *)v14;
                  _IMAlwaysLog();
                }
              }
              objc_msgSend(v26, "addObject:", v14, v23, v24, v25);
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                v17 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v32 = (uint64_t)v11;
                  _os_log_impl(&dword_229238000, v17, OS_LOG_TYPE_INFO, "Found no ref ID in peer info: %@", buf, 0xCu);
                }
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                _IMLoggingLog();
                if (_IMWillLog())
                  _IMAlwaysLog();
              }
              v23 = v11;
              _IMWarn();
            }
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v8);
    }
    if (objc_msgSend(v26, "count", v23))
    {
      v18 = v26;
    }
    else
    {
      _IMWarn();
      if (IMOSLoggingEnabled())
      {
        v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v32 = (uint64_t)a3;
          _os_log_impl(&dword_229238000, v21, OS_LOG_TYPE_INFO, "Found no peers for display ID: %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog())
          _IMAlwaysLog();
      }
      v22 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = (uint64_t)a3;
        _os_log_impl(&dword_229238000, v22, OS_LOG_TYPE_DEFAULT, "Found no peers for display ID: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
          MarcoLog();
        if (IMShouldLog())
          IMLogString();
      }

      v18 = 0;
    }
    return (id)objc_msgSend(v18, "allObjects");
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v32 = (uint64_t)a3;
        v33 = 2112;
        v34 = a4;
        _os_log_impl(&dword_229238000, v19, OS_LOG_TYPE_INFO, "No peers found for display id: %@  cid: %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
    _IMWarn();
    return 0;
  }
}

- (id)_peerIDForDiplayID:(id)a3 conferenceID:(id)a4
{
  return (id)objc_msgSend(-[FaceTimeServiceSession _peerIDsForDiplayID:conferenceID:](self, "_peerIDsForDiplayID:conferenceID:", a3, a4), "lastObject");
}

- (id)_peerIDPushTokensPairsForPeerID:(id)a3 conferenceID:(id)a4 skippingPairs:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = -[FaceTimeServiceSession _peerIDPushTokenPairsForConferenceID:](self, "_peerIDPushTokenPairsForConferenceID:", a4);
  v10 = -[FaceTimeServiceSession pushToken](self, "pushToken");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "objectForKey:", CFSTR("push-token"));
        if ((objc_msgSend(a5, "containsObject:", v15) & 1) == 0
          && (!v10 || (objc_msgSend(v10, "isEqual:", v16) & 1) == 0))
        {
          objc_msgSend(v8, "addObject:", v15);
        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }
  if (!objc_msgSend(v8, "count"))
  {

    v8 = 0;
  }
  return v8;
}

- (id)_peerInfoForDisplayID:(id)a3 conferenceID:(id)a4 skippingPairs:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = a4;
  v9 = -[FaceTimeServiceSession _peerIDPushTokenPairsForConferenceID:](self, "_peerIDPushTokenPairsForConferenceID:", a4);
  v10 = -[FaceTimeServiceSession pushToken](self, "pushToken");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "objectForKey:", CFSTR("push-token"));
        if ((objc_msgSend(a5, "containsObject:", v14) & 1) == 0
          && (!v10 || (objc_msgSend(v10, "isEqual:", v15) & 1) == 0))
        {
          objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v11);
  }
  if (!objc_msgSend(v8, "count"))
  {

    v8 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v26 = a5;
      v27 = 2112;
      v28 = a3;
      v29 = 2112;
      v30 = v19;
      v31 = 2112;
      v32 = v8;
      _os_log_impl(&dword_229238000, v16, OS_LOG_TYPE_INFO, "Skipping pairs: %@    for display id: %@   conference: %@  Built peer info: %@", buf, 0x2Au);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    _IMLoggingLog();
    if (_IMWillLog())
      _IMAlwaysLog();
  }
  v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v26 = a5;
    v27 = 2112;
    v28 = a3;
    v29 = 2112;
    v30 = v19;
    v31 = 2112;
    v32 = v8;
    _os_log_impl(&dword_229238000, v17, OS_LOG_TYPE_DEFAULT, "Skipping pairs: %@    for display id: %@   conference: %@  Built peer info: %@", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
      MarcoLog();
    if (IMShouldLog())
      IMLogString();
  }
  return v8;
}

- (void)_setConferenceIDMap:(id)a3 forToken:(id)a4
{
  NSObject *v7;
  NSMutableDictionary *conferenceIDMap;
  NSObject *v9;
  NSMutableDictionary *v10;
  id v11;
  uint64_t v12;
  id v13;
  NSMutableDictionary *v14;
  uint8_t buf[4];
  _BYTE v16[18];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a3 && a4)
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v16 = a4;
        *(_WORD *)&v16[8] = 2112;
        *(_QWORD *)&v16[10] = a3;
        _os_log_impl(&dword_229238000, v7, OS_LOG_TYPE_INFO, "Setting token %@ for conference ID %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v11 = a4;
      v13 = a3;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v11 = a4;
        v13 = a3;
        _IMAlwaysLog();
      }
    }
    conferenceIDMap = self->_conferenceIDMap;
    if (!conferenceIDMap)
    {
      conferenceIDMap = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      self->_conferenceIDMap = conferenceIDMap;
    }
    if ((unint64_t)-[NSMutableDictionary count](conferenceIDMap, "count", v11, v13) >= 0x15)
    {
      if (IMOSLoggingEnabled())
      {
        v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = self->_conferenceIDMap;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v16 = 20;
          *(_WORD *)&v16[4] = 2112;
          *(_QWORD *)&v16[6] = v10;
          _os_log_impl(&dword_229238000, v9, OS_LOG_TYPE_INFO, "Max cache size of %d reached for conferenceIDMap. Removing all objects in conferenceIDMap %@", buf, 0x12u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v12 = 20;
        v14 = self->_conferenceIDMap;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v12 = 20;
          v14 = self->_conferenceIDMap;
          _IMAlwaysLog();
        }
      }
      -[NSMutableDictionary removeAllObjects](self->_conferenceIDMap, "removeAllObjects", v12, v14);
    }
    -[NSMutableDictionary setObject:forKey:](self->_conferenceIDMap, "setObject:forKey:", a4, a3);
    -[FaceTimeServiceSession _setPurgeTimer](self, "_setPurgeTimer");
  }
}

- (void)_setInitiatedConference:(id)a3
{
  NSMutableArray *initiatedConferences;
  NSObject *v6;
  NSMutableArray *v7;
  uint64_t v8;
  NSMutableArray *v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  NSMutableArray *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    initiatedConferences = self->_initiatedConferences;
    if (!initiatedConferences)
    {
      initiatedConferences = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      self->_initiatedConferences = initiatedConferences;
    }
    if ((unint64_t)-[NSMutableArray count](initiatedConferences, "count") >= 0x15)
    {
      if (IMOSLoggingEnabled())
      {
        v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v7 = self->_initiatedConferences;
          *(_DWORD *)buf = 67109378;
          v11 = 20;
          v12 = 2112;
          v13 = v7;
          _os_log_impl(&dword_229238000, v6, OS_LOG_TYPE_INFO, "Max cache size of %d reached for initiatedConferences map. Removing all objects in initiatedConferences %@", buf, 0x12u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v8 = 20;
        v9 = self->_initiatedConferences;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v8 = 20;
          v9 = self->_initiatedConferences;
          _IMAlwaysLog();
        }
      }
      -[NSMutableArray removeAllObjects](self->_initiatedConferences, "removeAllObjects", v8, v9);
    }
    -[NSMutableArray addObject:](self->_initiatedConferences, "addObject:", a3);
  }
}

- (id)_mappedSessionTokenForConferenceID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_conferenceIDMap, "objectForKey:", a3);
}

- (int)_callTypeForConferenceID:(id)a3
{
  void *v5;
  NSObject *v6;
  NSMutableDictionary *callTypeMap;
  id v9;
  NSMutableDictionary *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  NSMutableDictionary *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_callTypeMap, "objectForKey:");
  if (!v5)
  {
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        callTypeMap = self->_callTypeMap;
        *(_DWORD *)buf = 138412546;
        v12 = a3;
        v13 = 2112;
        v14 = callTypeMap;
        _os_log_impl(&dword_229238000, v6, OS_LOG_TYPE_INFO, "Could not find call type for conference ID %@ in map: %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v9 = a3;
      v10 = self->_callTypeMap;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v9 = a3;
        v10 = self->_callTypeMap;
        _IMAlwaysLog();
      }
    }
  }
  return objc_msgSend(v5, "intValue", v9, v10);
}

- (void)_setCallType:(int)a3 forConferenceID:(id)a4
{
  uint64_t v5;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  NSMutableDictionary *callTypeMap;
  NSObject *v12;
  NSMutableDictionary *v13;
  const void *v14;
  const __CFString *v15;
  uint64_t v16;
  id v17;
  NSMutableDictionary *v18;
  uint8_t buf[4];
  _BYTE v20[18];
  uint64_t v21;

  v5 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("unknown");
      if (!(_DWORD)v5)
        v8 = CFSTR("video");
      if ((_DWORD)v5 == 1)
        v8 = CFSTR("audio");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v20 = v8;
      *(_WORD *)&v20[8] = 2112;
      *(_QWORD *)&v20[10] = a4;
      _os_log_impl(&dword_229238000, v7, OS_LOG_TYPE_INFO, "Setting call type to %@ for conference ID %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v9 = CFSTR("unknown");
    if (!(_DWORD)v5)
      v9 = CFSTR("video");
    if ((_DWORD)v5 == 1)
      v10 = CFSTR("audio");
    else
      v10 = v9;
    v15 = v10;
    v17 = a4;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v15 = v10;
      v17 = a4;
      _IMAlwaysLog();
    }
  }
  callTypeMap = self->_callTypeMap;
  if (!callTypeMap)
  {
    callTypeMap = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    self->_callTypeMap = callTypeMap;
  }
  if ((unint64_t)-[NSMutableDictionary count](callTypeMap, "count", v15, v17) >= 0x15)
  {
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = self->_callTypeMap;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v20 = 20;
        *(_WORD *)&v20[4] = 2112;
        *(_QWORD *)&v20[6] = v13;
        _os_log_impl(&dword_229238000, v12, OS_LOG_TYPE_INFO, "Max cache size of %d reached for callTypeMap. Removing all objects in callTypeMap %@", buf, 0x12u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v16 = 20;
      v18 = self->_callTypeMap;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v16 = 20;
        v18 = self->_callTypeMap;
        _IMAlwaysLog();
      }
    }
    -[NSMutableDictionary removeAllObjects](self->_callTypeMap, "removeAllObjects", v16, v18);
  }
  v14 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  if (v14)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_callTypeMap, a4, v14);
}

- (FaceTimeServiceSession)initWithAccount:(id)a3 service:(id)a4
{
  FaceTimeServiceSession *v4;
  id v5;
  NSObject *v6;
  NSString *loggingCategory;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  FaceTimePushHandler *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  NSObject *v22;
  NSString *v24;
  id v25;
  uint64_t v26;
  uint8_t v27[16];
  _QWORD v28[6];
  objc_super v29;
  _BYTE buf[24];
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  FaceTimeServiceSession *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)FaceTimeServiceSession;
  v4 = -[IMDAppleServiceSession initWithAccount:service:](&v29, sel_initWithAccount_service_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BE4FBE0]);
    v4->_callAccountController = (IDSAccountController *)objc_msgSend(v5, "initWithService:", *MEMORY[0x24BE4FB50]);
    v4->_loggingCategory = (NSString *)CFSTR("FaceTime");
    v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      loggingCategory = v4->_loggingCategory;
      v8 = -[IMDAppleServiceSession GUID](v4, "GUID");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = loggingCategory;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_229238000, v6, OS_LOG_TYPE_DEBUG, "Initializing FaceTime Session with category: %@   accountID: %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v24 = v4->_loggingCategory;
      v26 = -[IMDAppleServiceSession GUID](v4, "GUID");
      IMLogString();
    }
    objc_msgSend((id)qword_253E79920, "addObject:", -[IMDAppleServiceSession GUID](v4, "GUID", v24, v26));
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229238000, v9, OS_LOG_TYPE_INFO, "Priming FaceTime Server bag", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
    objc_msgSend(MEMORY[0x24BE4FCB0], "sharedInstanceForBagType:", 0);
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229238000, v10, OS_LOG_TYPE_INFO, "...done", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229238000, v11, OS_LOG_TYPE_INFO, "Building push listener", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v13 = -[FaceTimeServiceSession topicForCallType:](v4, "topicForCallType:", 1);
    if (objc_msgSend(v13, "length"))
      objc_msgSend(v12, "addObject:", v13);
    v14 = -[FaceTimeServiceSession topicForCallType:](v4, "topicForCallType:", 0);
    if (objc_msgSend(v14, "length"))
      objc_msgSend(v12, "addObject:", v14);
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v12;
        _os_log_impl(&dword_229238000, v15, OS_LOG_TYPE_INFO, "  => Topics: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v25 = v12;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v25 = v12;
        _IMAlwaysLog();
      }
    }
    v16 = -[FaceTimePushHandler initWithTopics:]([FaceTimePushHandler alloc], "initWithTopics:", v12);
    v4->_ftPushHandler = v16;
    -[FaceTimePushHandler addListener:](v16, "addListener:", v4);

    -[FaceTimePushHandler configureAsMacNotificationCenterObserver:](v4->_ftPushHandler, "configureAsMacNotificationCenterObserver:", *MEMORY[0x24BE50A48]);
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229238000, v17, OS_LOG_TYPE_INFO, "...done", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229238000, v18, OS_LOG_TYPE_INFO, "Building Message delivery", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
    if (!qword_253E79930)
    {
      if (IMOSLoggingEnabled())
      {
        v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_229238000, v19, OS_LOG_TYPE_INFO, "Building Message delivery", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog())
          _IMAlwaysLog();
      }
      qword_253E79930 = (uint64_t)objc_alloc_init((Class)objc_msgSend(MEMORY[0x24BE30348], "APNSMessageDeliveryClass", v25));
      objc_msgSend((id)qword_253E79930, "setUserAgent:", CFSTR("com.apple.invitation-service"));
    }
    v20 = objc_alloc_init(MEMORY[0x24BE508A0]);
    v4->_broadcasterACInvocationQueue = v20;
    objc_msgSend(v20, "setProtocol:", &unk_255A567B0);
    objc_msgSend(v4->_broadcasterACInvocationQueue, "setDelegate:", v4);
    objc_msgSend(v4->_broadcasterACInvocationQueue, "setDequeueRate:", 0.1);
    v21 = objc_alloc_init(MEMORY[0x24BE508A0]);
    v4->_broadcasterVCInvocationQueue = v21;
    objc_msgSend(v21, "setProtocol:", &unk_255A567B0);
    objc_msgSend(v4->_broadcasterVCInvocationQueue, "setDelegate:", v4);
    objc_msgSend(v4->_broadcasterVCInvocationQueue, "setDequeueRate:", 0.1);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    v31 = sub_22923E71C;
    v32 = sub_2292397DC;
    v33 = v4;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = sub_22923E72C;
    v28[3] = &unk_24F1EACF0;
    v28[4] = v4;
    v28[5] = buf;
    v4->_completionBlock = (id)objc_msgSend(v28, "copy");
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_229238000, v22, OS_LOG_TYPE_INFO, "...done", v27, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
    _Block_object_dispose(buf, 8);
  }
  return v4;
}

- (id)pushToken
{
  return -[FaceTimePushHandler pushToken](self->_ftPushHandler, "pushToken");
}

- (id)regionID
{
  IDSAccount *v2;
  id result;

  v2 = -[IMDAppleServiceSession idsAccount](self, "idsAccount");
  if (!v2 || (result = (id)-[IDSAccount regionID](v2, "regionID")) == 0)
  {
    _IMWarn();
    return 0;
  }
  return result;
}

- (id)regionBasePhoneNumber
{
  IDSAccount *v2;
  id result;

  v2 = -[IMDAppleServiceSession idsAccount](self, "idsAccount");
  if (!v2 || (result = (id)-[IDSAccount regionBasePhoneNumber](v2, "regionBasePhoneNumber")) == 0)
  {
    _IMWarn();
    return 0;
  }
  return result;
}

- (id)regionServerContext
{
  IDSAccount *v2;
  id result;

  v2 = -[IMDAppleServiceSession idsAccount](self, "idsAccount");
  if (!v2 || (result = (id)-[IDSAccount regionServerContext](v2, "regionServerContext")) == 0)
  {
    _IMWarn();
    return 0;
  }
  return result;
}

- (id)profileID
{
  IDSAccount *v2;
  void *v3;

  v2 = -[IMDAppleServiceSession idsAccount](self, "idsAccount");
  if (!v2)
  {
    v3 = 0;
LABEL_5:
    _IMWarn();
    return v3;
  }
  v3 = (void *)-[IDSAccount profileID](v2, "profileID");
  if (!objc_msgSend(v3, "length"))
    goto LABEL_5;
  return v3;
}

- (id)userID
{
  return (id)-[IMDAccount loginID](-[IMDServiceSession account](self, "account"), "loginID");
}

- (id)phoneNumber
{
  IDSAccount *v2;
  void *v3;

  v2 = -[IMDAppleServiceSession idsAccount](self, "idsAccount");
  if (!v2)
  {
    v3 = 0;
LABEL_5:
    _IMWarn();
    return v3;
  }
  v3 = (void *)-[IDSAccount loginID](v2, "loginID");
  if (!objc_msgSend(v3, "length"))
    goto LABEL_5;
  return v3;
}

- (__SecKey)callerPrivateKey
{
  __SecKey *result;

  if (!self->_privateIdentityLoaded)
  {
    _IDSAppleRegistrationCopyKeyPair();
    self->_privateIdentityLoaded = 1;
  }
  result = self->_privateKey;
  if (!result)
  {
    _IMWarn();
    return self->_privateKey;
  }
  return result;
}

- (id)idsAccountForCallType:(int)a3
{
  IDSAccount *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  int v19;
  IMDAccount *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (a3 == 1)
  {
    v4 = -[IMDAppleServiceSession idsAccount](self, "idsAccount");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v5 = (void *)-[IDSAccountController accounts](self->_callAccountController, "accounts");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "accountType");
          if (v12 == -[IDSAccount accountType](v4, "accountType")
            && objc_msgSend((id)objc_msgSend(v11, "loginID"), "isEqualToIgnoringCase:", -[IDSAccount loginID](v4, "loginID"))&& objc_msgSend(v11, "registrationStatus") == 5)
          {
            v8 = v11;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v7);
      if (v8)
        return v8;
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = (void *)-[IDSAccountController accounts](self->_callAccountController, "accounts", 0);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v14)
    {
      v15 = v14;
      v8 = 0;
      v16 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
          v19 = objc_msgSend(v18, "accountType");
          if (v19 == -[IDSAccount accountType](v4, "accountType")
            && objc_msgSend(v18, "registrationStatus") == 5)
          {
            v8 = v18;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v15);
      if (v8)
        return v8;
    }
  }
  else
  {
    v20 = -[IMDServiceSession account](self, "account");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (id)-[IMDAccount idsAccount](v20, "idsAccount");
  }
  _IMWarn();
  return 0;
}

- (id)callerCertForCallType:(int)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = -[FaceTimeServiceSession idsAccountForCallType:](self, "idsAccountForCallType:", *(_QWORD *)&a3);
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_229238000, v4, OS_LOG_TYPE_INFO, "  =>  Found account: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v8 = v3;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v8 = v3;
      _IMAlwaysLog();
    }
  }
  v5 = (void *)objc_msgSend(v3, "registrationCertificate", v8);
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v5;
        _os_log_impl(&dword_229238000, v6, OS_LOG_TYPE_INFO, "  =>  Returning caller cert: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
  }
  else
  {
    _IMWarn();
  }
  return v5;
}

- (id)topicForCallType:(int)a3
{
  const __CFString *v3;
  __CFString *v4;
  NSObject *v5;
  uint8_t buf[4];
  __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("com.apple.private.ac");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("com.apple.ess");
  if (-[__CFString length](v4, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v8 = v4;
        _os_log_impl(&dword_229238000, v5, OS_LOG_TYPE_INFO, "  =>  Returning topic: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
  }
  else
  {
    _IMWarn();
  }
  return v4;
}

- (BOOL)_checkAliasInfoAndFailIfNecessaryWithAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7
{
  uint64_t v10;
  id v13;
  NSDictionary *v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  int64_t v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v10 = *(_QWORD *)&a4;
  v40 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(-[FaceTimeServiceSession idsAccountForCallType:](self, "idsAccountForCallType:", *(_QWORD *)&a4), "accountType") != 1)return 1;
  v31 = a3;
  v13 = -[FaceTimeServiceSession registeredURIs](self, "registeredURIs");
  v14 = -[IMDServiceSession accountDefaults](self, "accountDefaults");
  -[NSDictionary objectForKey:](v14, "objectForKey:", *MEMORY[0x24BE50A30]);
  v15 = objc_msgSend(v13, "__imArrayByApplyingBlock:", &unk_24F1EAD30);
  v16 = (id)_IDSCopyCallerID();
  v17 = (void *)objc_msgSend(v16, "_URIFromFZIDType:", objc_msgSend(v16, "_FZBestGuessFZIDType"));
  if (IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v33 = v16;
      v34 = 2112;
      v35 = v17;
      v36 = 2112;
      v37 = v15;
      _os_log_impl(&dword_229238000, v18, OS_LOG_TYPE_INFO, "Choosing callerID %@ callerURI %@ from aliases %@", buf, 0x20u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v26 = v17;
    v28 = v15;
    v24 = v16;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v26 = v17;
      v28 = v15;
      v24 = v16;
      _IMAlwaysLog();
    }
  }
  v19 = -[FaceTimeServiceSession callerCertForCallType:](self, "callerCertForCallType:", v10, v24, v26, v28);
  if (objc_msgSend(v17, "length"))
  {
    if (objc_msgSend(v19, "length"))
      return 1;
  }
  v21 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v33 = v17;
    v34 = 2112;
    v35 = v19;
    v36 = 2112;
    v37 = (uint64_t)v16;
    v38 = 2112;
    v39 = v13;
    _os_log_impl(&dword_229238000, v21, OS_LOG_TYPE_DEFAULT, "This conference invitation has bogus alias info! (callerURI: %@  Cert: %@  callerID: %@  bindings: %@)", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      v29 = v16;
      v30 = v13;
      v25 = v17;
      v27 = v19;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      v29 = v16;
      v30 = v13;
      v25 = v17;
      v27 = v19;
      IMLogString();
    }
  }
  if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v33 = v17;
      v34 = 2112;
      v35 = v19;
      v36 = 2112;
      v37 = (uint64_t)v16;
      v38 = 2112;
      v39 = v13;
      _os_log_impl(&dword_229238000, v22, OS_LOG_TYPE_INFO, "This conference invitation has bogus alias info! (callerURI: %@  Cert: %@  callerID: %@  bindings: %@)", buf, 0x2Au);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v29 = v16;
    v30 = v13;
    v25 = v17;
    v27 = v19;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v29 = v16;
      v30 = v13;
      v25 = v17;
      v27 = v19;
      _IMAlwaysLog();
    }
  }
  v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (objc_msgSend(a5, "length"))
    objc_msgSend(v23, "setObject:forKey:", a5, CFSTR("conference"));
  if (objc_msgSend(a6, "length", v25, v27, v29, v30))
    objc_msgSend(v23, "setObject:forKey:", a6, CFSTR("ID"));
  if (a7)
    objc_msgSend(v23, "setObject:forKey:", a7, CFSTR("properties"));
  objc_msgSend(-[IMDServiceSession broadcaster](self, "broadcaster"), "account:postedError:", -[IMDServiceSession accountID](self, "accountID"), objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE505A8], v31, v23));

  return 0;
}

- (BOOL)_checkConferenceIDAndFailIfNecessaryWithAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7
{
  int v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v12 = objc_msgSend(a5, "hasPrefix:", CFSTR("ConferenceID:"), *(_QWORD *)&a4);
  if (v12)
  {
    v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = a5;
      _os_log_impl(&dword_229238000, v13, OS_LOG_TYPE_DEFAULT, "This conference ID (%@) is bogus, failing this message", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v17 = a5;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v17 = a5;
        IMLogString();
      }
    }
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = a5;
        _os_log_impl(&dword_229238000, v14, OS_LOG_TYPE_INFO, "Conference ID is bogus: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v17 = a5;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v17 = a5;
        _IMAlwaysLog();
      }
    }
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (objc_msgSend(a5, "length"))
      objc_msgSend(v15, "setObject:forKey:", a5, CFSTR("conference"));
    if (objc_msgSend(a6, "length", v17))
      objc_msgSend(v15, "setObject:forKey:", a6, CFSTR("ID"));
    if (a7)
      objc_msgSend(v15, "setObject:forKey:", a7, CFSTR("properties"));
    objc_msgSend(-[IMDServiceSession broadcaster](self, "broadcaster"), "account:postedError:", -[IMDServiceSession accountID](self, "accountID"), objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE505A8], a3, v15));

  }
  return v12 ^ 1;
}

- (BOOL)_checkCanSendRequestsAndFailIfNecessaryAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7
{
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint8_t v17[16];
  uint8_t buf[16];

  v12 = -[FaceTimeServiceSession _validRegistrationStateToMakeCalls](self, "_validRegistrationStateToMakeCalls", a3, *(_QWORD *)&a4);
  if (!v12)
  {
    v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229238000, v13, OS_LOG_TYPE_DEFAULT, "The device is not allowed to make calls now", buf, 2u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_229238000, v14, OS_LOG_TYPE_INFO, "The device is not allowed to make calls now", v17, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v15, "setObject:forKey:", &unk_24F1F2638, CFSTR("internalCode"));
    if (objc_msgSend(a5, "length"))
      objc_msgSend(v15, "setObject:forKey:", a5, CFSTR("conference"));
    if (objc_msgSend(a6, "length"))
      objc_msgSend(v15, "setObject:forKey:", a6, CFSTR("ID"));
    if (a7)
      objc_msgSend(v15, "setObject:forKey:", a7, CFSTR("properties"));
    objc_msgSend(-[IMDServiceSession broadcaster](self, "broadcaster"), "account:postedError:", -[IMDServiceSession accountID](self, "accountID"), objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE505A8], a3, v15));

  }
  return v12;
}

- (BOOL)_checkManagedProfileAndFailIfNecessaryAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7
{
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint8_t v17[16];
  uint8_t buf[16];

  v12 = -[IMDServiceSession allowedAsChild](self, "allowedAsChild", a3, *(_QWORD *)&a4);
  if (!v12)
  {
    v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229238000, v13, OS_LOG_TYPE_DEFAULT, "The device has a managed profile, not allowed", buf, 2u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_229238000, v14, OS_LOG_TYPE_INFO, "The device has a managed profile, not allowed", v17, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v15, "setObject:forKey:", &unk_24F1F2650, CFSTR("internalCode"));
    if (objc_msgSend(a5, "length"))
      objc_msgSend(v15, "setObject:forKey:", a5, CFSTR("conference"));
    if (objc_msgSend(a6, "length"))
      objc_msgSend(v15, "setObject:forKey:", a6, CFSTR("ID"));
    if (a7)
      objc_msgSend(v15, "setObject:forKey:", a7, CFSTR("properties"));
    objc_msgSend(-[IMDServiceSession broadcaster](self, "broadcaster"), "account:postedError:", -[IMDServiceSession accountID](self, "accountID"), objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE505A8], a3, v15));

  }
  return v12;
}

- (BOOL)_checkBadPushToken:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = -[FaceTimeServiceSession pushToken](self, "pushToken");
  LOBYTE(v5) = 1;
  if (a3 && v4)
  {
    if (objc_msgSend(a3, "isEqual:"))
    {
      v6 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229238000, v6, OS_LOG_TYPE_DEFAULT, "Received push to myself, from myself - ignoring", buf, 2u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
          MarcoLog();
        if (IMShouldLog())
          IMLogString();
      }
      if (IMOSLoggingEnabled())
      {
        v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_229238000, v7, OS_LOG_TYPE_INFO, "Received push to myself, from myself - ignoring", v9, 2u);
        }
      }
      v5 = os_log_shim_legacy_logging_enabled();
      if (v5)
      {
        _IMLoggingLog();
        v5 = _IMWillLog();
        if (v5)
        {
          _IMAlwaysLog();
          LOBYTE(v5) = 0;
        }
      }
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)_checkForBadPeerIDWithAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7 peerID:(id)a8
{
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v13 = objc_msgSend((id)objc_msgSend(a8, "_stripFZIDPrefix", a3, *(_QWORD *)&a4), "length");
  if (!v13)
  {
    v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = a6;
      _os_log_impl(&dword_229238000, v14, OS_LOG_TYPE_DEFAULT, "Bad peer ID supplied for person ID: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v19 = a6;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v19 = a6;
        IMLogString();
      }
    }
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = a6;
        _os_log_impl(&dword_229238000, v15, OS_LOG_TYPE_INFO, "Bad peer ID supplied for person ID: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v19 = a6;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v19 = a6;
        _IMAlwaysLog();
      }
    }
    if (IMOSLoggingEnabled())
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = (id)qword_253E79928;
        _os_log_impl(&dword_229238000, v16, OS_LOG_TYPE_INFO, "Conference Map: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v19 = (id)qword_253E79928;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v19 = (id)qword_253E79928;
        _IMAlwaysLog();
      }
    }
    v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v17, "setObject:forKey:", &unk_24F1F2668, CFSTR("internalCode"));
    if (objc_msgSend(a5, "length"))
      objc_msgSend(v17, "setObject:forKey:", a5, CFSTR("conference"));
    if (objc_msgSend(a6, "length", v19))
      objc_msgSend(v17, "setObject:forKey:", a6, CFSTR("ID"));
    if (a7)
      objc_msgSend(v17, "setObject:forKey:", a7, CFSTR("properties"));
    objc_msgSend(-[IMDServiceSession broadcaster](self, "broadcaster"), "account:postedError:", -[IMDServiceSession accountID](self, "accountID"), objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE505A8], a3, v17));

  }
  return v13 != 0;
}

- (BOOL)_checkRegistrationAndFailIfNecessaryAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7
{
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint8_t v17[16];
  uint8_t buf[16];

  v12 = -[IMDAppleServiceSession _isDeviceRegistered](self, "_isDeviceRegistered", a3, *(_QWORD *)&a4);
  if (!v12)
  {
    v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229238000, v13, OS_LOG_TYPE_DEFAULT, "The device is not registered, failing this message", buf, 2u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_229238000, v14, OS_LOG_TYPE_INFO, "Device is not registered, failing", v17, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v15, "setObject:forKey:", &unk_24F1F2680, CFSTR("internalCode"));
    if (objc_msgSend(a5, "length"))
      objc_msgSend(v15, "setObject:forKey:", a5, CFSTR("conference"));
    if (objc_msgSend(a6, "length"))
      objc_msgSend(v15, "setObject:forKey:", a6, CFSTR("ID"));
    if (a7)
      objc_msgSend(v15, "setObject:forKey:", a7, CFSTR("properties"));
    objc_msgSend(-[IMDServiceSession broadcaster](self, "broadcaster"), "account:postedError:", -[IMDServiceSession accountID](self, "accountID"), objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE505A8], a3, v15));

  }
  return v12;
}

- (BOOL)_registrationSupportedForRegistration
{
  NSObject *v2;
  NSObject *v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BE508A8], "sharedInstance"), "isExpired"))
  {
    if (IMOSLoggingEnabled())
    {
      v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229238000, v2, OS_LOG_TYPE_INFO, "*** Lockdown state is expired, not allowing registration", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
    v3 = OSLogHandleForRegistrationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229238000, v3, OS_LOG_TYPE_ERROR, "*** Lockdown state is expired, not allowing registration", buf, 2u);
    }
    if (os_log_shim_legacy_logging_enabled())
      IMLogString();
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BE30338], "sharedInstance"), "registrationSupported");
    v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = CFSTR("NO");
      if (v4)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_impl(&dword_229238000, v5, OS_LOG_TYPE_DEBUG, "Returning device support registration supported: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  return v4;
}

- (BOOL)_validRegistrationStateToAcceptCalls
{
  NSObject *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BE508A8], "sharedInstance"), "isExpired"))
  {
    v3 = OSLogHandleForFaceTimeCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229238000, v3, OS_LOG_TYPE_DEFAULT, "*** Lockdown state is expired, not allowing accept", buf, 2u);
    }
    if (MarcoShouldLog())
      MarcoLog();
    if ((_IMWillLog() & 1) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  if (!-[FaceTimeServiceSession _registrationSupportedForRegistration](self, "_registrationSupportedForRegistration"))
  {
    v5 = OSLogHandleForFaceTimeCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_229238000, v5, OS_LOG_TYPE_DEFAULT, "Registration is not supported, we cannot accept calls", v13, 2u);
    }
    if (MarcoShouldLog())
      MarcoLog();
    if ((_IMWillLog() & 1) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BE508D0], "sharedInstance"), "isSetup") & 1) == 0)
  {
    v6 = OSLogHandleForFaceTimeCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_229238000, v6, OS_LOG_TYPE_DEFAULT, "We're not restored from backup yet, we cannot accept calls", v12, 2u);
    }
    if (MarcoShouldLog())
      MarcoLog();
    if ((_IMWillLog() & 1) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BE508A8], "sharedInstance"), "isActivated") & 1) == 0)
  {
    v7 = OSLogHandleForFaceTimeCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_229238000, v7, OS_LOG_TYPE_DEFAULT, "Locked down, we cannot accept calls", v11, 2u);
    }
    if (MarcoShouldLog())
      MarcoLog();
    if ((_IMWillLog() & 1) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  if (-[IDSAccount accountType](-[IMDAppleServiceSession idsAccount](self, "idsAccount"), "accountType")
    || !objc_msgSend((id)objc_msgSend(MEMORY[0x24BE30338], "sharedInstance"), "isTelephonyDevice")
    || (sub_22924571C() & 1) != 0)
  {
    LOBYTE(v4) = 1;
    return v4;
  }
  v8 = OSLogHandleForFaceTimeCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_229238000, v8, OS_LOG_TYPE_DEFAULT, "Not a valid sim state, we cannot accept calls", v10, 2u);
  }
  if (MarcoShouldLog())
    MarcoLog();
  v4 = _IMWillLog();
  if (v4)
  {
LABEL_32:
    _IMAlwaysLog();
LABEL_33:
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)registeredURIs
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[FaceTimeServiceSession idsAccounts](self, "idsAccounts");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "registeredURIs"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  if (objc_msgSend(v3, "count"))
  {
    IMDInconsistencyResolved();
    return (id)objc_msgSend(v3, "allObjects");
  }
  else
  {
    if (-[IMDServiceSession isActive](self, "isActive"))
    {
      -[IMDServiceSession accounts](self, "accounts");
      IMDNoticedInconsistency();
    }
    return 0;
  }
}

- (BOOL)_validRegistrationStateToMakeCalls
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BE508A8], "sharedInstance"), "isActivated") & 1) == 0)
  {
    v4 = OSLogHandleForFaceTimeCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229238000, v4, OS_LOG_TYPE_DEFAULT, "*** Lockdown state is expired, not allowing calls", buf, 2u);
    }
    if (MarcoShouldLog())
      MarcoLog();
    if ((_IMWillLog() & 1) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BE508D0], "sharedInstance"), "isSetup") & 1) == 0)
  {
    v5 = OSLogHandleForFaceTimeCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_229238000, v5, OS_LOG_TYPE_DEFAULT, "We're not restored from backup yet, we cannot make calls", v13, 2u);
    }
    if (MarcoShouldLog())
      MarcoLog();
    if ((_IMWillLog() & 1) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  if (!-[FaceTimeServiceSession _registrationSupportedForRegistration](self, "_registrationSupportedForRegistration"))
  {
    v6 = OSLogHandleForFaceTimeCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_229238000, v6, OS_LOG_TYPE_DEFAULT, "Registration is not supported, we cannot make calls", v12, 2u);
    }
    if (MarcoShouldLog())
      MarcoLog();
    if ((_IMWillLog() & 1) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BE508A8], "sharedInstance"), "isActivated") & 1) == 0)
  {
    v7 = OSLogHandleForFaceTimeCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_229238000, v7, OS_LOG_TYPE_DEFAULT, "Locked down, we cannot make calls", v11, 2u);
    }
    if (MarcoShouldLog())
      MarcoLog();
    if ((_IMWillLog() & 1) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  if (-[IDSAccount accountType](-[IMDAppleServiceSession idsAccount](self, "idsAccount"), "accountType")
    || !objc_msgSend((id)objc_msgSend(MEMORY[0x24BE30338], "sharedInstance"), "isTelephonyDevice")
    || (sub_229245CA8() & 1) != 0)
  {
    LOBYTE(v3) = 1;
    return v3;
  }
  v8 = OSLogHandleForFaceTimeCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_229238000, v8, OS_LOG_TYPE_DEFAULT, "Not a valid sim state, we cannot make calls", v10, 2u);
  }
  if (MarcoShouldLog())
    MarcoLog();
  v3 = _IMWillLog();
  if (v3)
  {
LABEL_32:
    _IMAlwaysLog();
LABEL_33:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_logLocalInfo
{
  NSObject *v3;
  uint8_t buf[4];
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v5 = -[FaceTimeServiceSession registeredURIs](self, "registeredURIs");
    _os_log_impl(&dword_229238000, v3, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      -[FaceTimeServiceSession registeredURIs](self, "registeredURIs");
      MarcoLog();
    }
    if (IMShouldLog())
    {
      -[FaceTimeServiceSession registeredURIs](self, "registeredURIs");
      IMLogString();
    }
  }
}

- (void)_sendRejectToPeerID:(id)a3 peerToken:(id)a4 sessionToken:(id)a5 callType:(int)a6 reason:(int64_t)a7 clientInfo:(id)a8
{
  uint64_t v10;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  FTRejectMessage *v18;
  __CFDictionary *v19;
  const void *v20;
  const char *v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v10 = *(_QWORD *)&a6;
  v27 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[FaceTimeServiceSession _sendRejectToPeerID:peerToken:sessionToken:callType:reason:clientInfo:]";
      v25 = 2112;
      v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("peerID: %@  peerToken: %@  sessionToken: %@  reason: %d  clientInfo: %@"), a3, a4, a5, a7, a8);
      _os_log_impl(&dword_229238000, v15, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("peerID: %@  peerToken: %@  sessionToken: %@  reason: %d  clientInfo: %@"), a3, a4, a5, a7, a8);
    v21 = "-[FaceTimeServiceSession _sendRejectToPeerID:peerToken:sessionToken:callType:reason:clientInfo:]";
    v22 = v16;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("peerID: %@  peerToken: %@  sessionToken: %@  reason: %d  clientInfo: %@"), a3, a4, a5, a7, a8);
      v21 = "-[FaceTimeServiceSession _sendRejectToPeerID:peerToken:sessionToken:callType:reason:clientInfo:]";
      v22 = v17;
      _IMAlwaysLog();
    }
  }
  v18 = objc_alloc_init(FTRejectMessage);
  -[FTRejectMessage setReason:](v18, "setReason:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a7));
  -[FTRejectMessage setPeerID:](v18, "setPeerID:", a3);
  -[IDSBaseMessage setClientInfo:](v18, "setClientInfo:", a8);
  -[FTFaceTimeMessage setSessionToken:](v18, "setSessionToken:", a5);
  -[FTRejectMessage setPeerPushToken:](v18, "setPeerPushToken:", a4);
  -[FTRejectMessage setSelfPushToken:](v18, "setSelfPushToken:", -[FaceTimeServiceSession pushToken](self, "pushToken"));
  -[IDSBaseMessage setCompletionBlock:](v18, "setCompletionBlock:", self->_completionBlock);
  -[FaceTimeServiceSession _messageTimeoutTimeForMessage:](self, "_messageTimeoutTimeForMessage:", v18);
  -[IDSBaseMessage setTimeout:](v18, "setTimeout:");
  -[FTIDSMessage setIDCertificate:](v18, "setIDCertificate:", -[FaceTimeServiceSession callerCertForCallType:](self, "callerCertForCallType:", v10));
  -[FTIDSMessage setIdentityPrivateKey:](v18, "setIdentityPrivateKey:", -[FaceTimeServiceSession callerPrivateKey](self, "callerPrivateKey"));
  -[FTIDSMessage setSelfURI:](v18, "setSelfURI:", -[IMDAppleServiceSession callerURI](self, "callerURI"));
  v19 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v20 = (const void *)objc_msgSend(MEMORY[0x24BDBCE60], "date");
  if (v20)
    CFDictionarySetValue(v19, CFSTR("sendDate"), v20);
  -[IDSBaseMessage setUserInfo:](v18, "setUserInfo:", v19, v21, v22);
  -[IDSBaseMessage setTopic:](v18, "setTopic:", -[FaceTimeServiceSession topicForCallType:](self, "topicForCallType:", v10));
  if (v18)
    objc_msgSend((id)qword_253E79930, "sendMessage:", v18);

}

- (void)_cancelVCRequestWithPerson:(id)a3 properties:(id)a4 conference:(id)a5 pairsToSkip:(id)a6 reason:(id)a7
{
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  id v21;
  NSObject *v22;
  FTCancelMessage *v23;
  __CFDictionary *v24;
  __CFDictionary *v25;
  const void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  const __CFString *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      v44 = (uint64_t)a3;
      v45 = 2112;
      v46 = a5;
      v47 = 2112;
      v48 = a4;
      v49 = 2112;
      v50 = a6;
      v51 = 2112;
      v52 = a7;
      _os_log_impl(&dword_229238000, v13, OS_LOG_TYPE_INFO, "cancelVCRequestWithPerson: %@  conference: %@ properties: %@ pairsToSkip: %@ reason: %@", buf, 0x34u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v38 = a6;
    v40 = a7;
    v33 = a5;
    v36 = a4;
    v30 = a3;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v38 = a6;
      v40 = a7;
      v33 = a5;
      v36 = a4;
      v30 = a3;
      _IMAlwaysLog();
    }
  }
  v14 = -[FaceTimeServiceSession _mappedSessionTokenForConferenceID:](self, "_mappedSessionTokenForConferenceID:", a5, v30, v33, v36, v38, v40);
  v15 = -[FaceTimeServiceSession _callTypeForConferenceID:](self, "_callTypeForConferenceID:", a5);
  v16 = (void *)objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50AE8]);
  v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = CFSTR("unknown");
    if (!(_DWORD)v15)
      v18 = CFSTR("video");
    *(_DWORD *)buf = 138413058;
    v44 = (uint64_t)a3;
    if ((_DWORD)v15 == 1)
      v18 = CFSTR("audio");
    v45 = 2112;
    v46 = (id)v18;
    v47 = 2112;
    v48 = a5;
    v49 = 2112;
    v50 = v16;
    _os_log_impl(&dword_229238000, v17, OS_LOG_TYPE_DEFAULT, "userID: %@  call type: %@  rid: %@ sessionID: %@", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      v19 = CFSTR("unknown");
      if (!(_DWORD)v15)
        v19 = CFSTR("video");
      if ((_DWORD)v15 == 1)
        v19 = CFSTR("audio");
      v37 = a5;
      v39 = v16;
      v31 = a3;
      v34 = v19;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      v20 = CFSTR("unknown");
      if (!(_DWORD)v15)
        v20 = CFSTR("video");
      if ((_DWORD)v15 == 1)
        v20 = CFSTR("audio");
      v37 = a5;
      v39 = v16;
      v31 = a3;
      v34 = v20;
      IMLogString();
    }
  }
  if (-[FaceTimeServiceSession _checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 3, v15, a5, a3, 0, v31, v34, v37, v39)&& -[FaceTimeServiceSession _checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 3, v15, a5, a3, 0)
    && -[FaceTimeServiceSession _checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 3, v15, a5, a3, 0)&& -[FaceTimeServiceSession _checkAliasInfoAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:](self, "_checkAliasInfoAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:", 3, v15, a5, a3, 0))
  {
    v21 = -[FaceTimeServiceSession _peerInfoForDisplayID:conferenceID:skippingPairs:](self, "_peerInfoForDisplayID:conferenceID:skippingPairs:", a3, a5, a6);
    if (objc_msgSend(v21, "count"))
      goto LABEL_41;
    v41 = objc_msgSend(-[FaceTimeServiceSession _mappedSessionTokenForConferenceID:](self, "_mappedSessionTokenForConferenceID:", a5), "__imHexString");
    if (v41 && (objc_msgSend(a5, "isEqualToString:") & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v44 = v41;
          v45 = 2112;
          v46 = a5;
          _os_log_impl(&dword_229238000, v22, OS_LOG_TYPE_INFO, "New conference ID %@ for %@, finding peers", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v32 = (id)v41;
        v35 = a5;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v32 = (id)v41;
          v35 = a5;
          _IMAlwaysLog();
        }
      }
      v21 = -[FaceTimeServiceSession _peerInfoForDisplayID:conferenceID:skippingPairs:](self, "_peerInfoForDisplayID:conferenceID:skippingPairs:", a3, v41, a6, v32, v35);
    }
    if (objc_msgSend(v21, "count"))
    {
LABEL_41:
      v42 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      *(_DWORD *)buf = objc_msgSend(v16, "unsignedIntValue");
      objc_msgSend(v42, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 4), CFSTR("s"));
      v23 = objc_alloc_init(FTCancelMessage);
      if (!v14)
        v14 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "__imDataWithHexString:", a5);
      -[FTFaceTimeMessage setSessionToken:](v23, "setSessionToken:", v14);
      -[FTCancelMessage setReason:](v23, "setReason:", a7);
      -[FTCancelMessage setPeers:](v23, "setPeers:", v21);
      -[IDSBaseMessage setClientInfo:](v23, "setClientInfo:", v42);
      v24 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v25 = v24;
      if (a3)
        CFDictionarySetValue(v24, CFSTR("ID"), a3);
      if (a5)
        CFDictionarySetValue(v25, CFSTR("conference"), a5);
      v26 = (const void *)objc_msgSend(MEMORY[0x24BDBCE60], "date");
      if (v26)
        CFDictionarySetValue(v25, CFSTR("sendDate"), v26);
      -[IDSBaseMessage setTopic:](v23, "setTopic:", -[FaceTimeServiceSession topicForCallType:](self, "topicForCallType:", v15));
      -[IDSBaseMessage setUserInfo:](v23, "setUserInfo:", v25);
      -[IDSBaseMessage setCompletionBlock:](v23, "setCompletionBlock:", self->_completionBlock);
      -[FaceTimeServiceSession _messageTimeoutTimeForMessage:](self, "_messageTimeoutTimeForMessage:", v23);
      -[IDSBaseMessage setTimeout:](v23, "setTimeout:");
      -[FTIDSMessage setIDCertificate:](v23, "setIDCertificate:", -[FaceTimeServiceSession callerCertForCallType:](self, "callerCertForCallType:", v15));
      -[FTIDSMessage setIdentityPrivateKey:](v23, "setIdentityPrivateKey:", -[FaceTimeServiceSession callerPrivateKey](self, "callerPrivateKey"));
      -[FTIDSMessage setSelfURI:](v23, "setSelfURI:", -[IMDAppleServiceSession callerURI](self, "callerURI"));
      if (IMOSLoggingEnabled())
      {
        v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v44 = (uint64_t)a3;
          _os_log_impl(&dword_229238000, v27, OS_LOG_TYPE_INFO, "Sending cancel invitation to: %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v32 = a3;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v32 = a3;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        v32 = a3;
        MarcoNoteCheckpoint();
      }
      objc_msgSend((id)qword_253E79930, "sendMessage:", v23, v32);

    }
    else
    {
      if (-[FaceTimeServiceSession _hasOutgoingInvitationInFlight](self, "_hasOutgoingInvitationInFlight"))
      {
        if (IMOSLoggingEnabled())
        {
          v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v44 = (uint64_t)a5;
            _os_log_impl(&dword_229238000, v28, OS_LOG_TYPE_INFO, "Delaying cancel for cid %@", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog())
            _IMAlwaysLog();
        }
        im_dispatch_after();
      }
      if (IMOSLoggingEnabled())
      {
        v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_229238000, v29, OS_LOG_TYPE_INFO, "No peers to send cancel invitation to, ignoring", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog())
          _IMAlwaysLog();
      }
      if (MarcoShouldLogCheckpoints())
        MarcoNoteCheckpoint();
    }
  }
}

- (void)requestVCWithPerson:(id)a3 properties:(id)a4 conference:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  NSString *v10;
  NSString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  NSObject *v45;
  NSObject *v46;
  __CFDictionary *v47;
  int v48;
  id v49;
  id v50;
  id v51;
  id v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  __CFDictionary *v58;
  __CFDictionary *v59;
  const void *v60;
  const void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  NSString *v66;
  id v67;
  id v68;
  id v69;
  NSData *v70;
  const __CFString *v71;
  uint64_t v72;
  id v73;
  FTReInitiateMessage *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  unsigned int v79;
  id v80;
  id value;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  uint8_t v92[128];
  uint8_t buf[4];
  id v94;
  __int16 v95;
  id v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  const __CFString *v100;
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v94 = a3;
      v95 = 2112;
      v96 = a4;
      v97 = 2112;
      v98 = (uint64_t)a5;
      _os_log_impl(&dword_229238000, v8, OS_LOG_TYPE_INFO, "requestVCWithPerson: %@  properties: %@ conference: %@", buf, 0x20u);
    }
  }
  value = a3;
  v80 = a5;
  if (os_log_shim_legacy_logging_enabled())
  {
    v66 = (NSString *)a4;
    v69 = a5;
    v62 = a3;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v66 = (NSString *)a4;
      v69 = a5;
      v62 = a3;
      _IMAlwaysLog();
    }
  }
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = -[IMDAppleServiceSession callerURI](self, "callerURI");
      *(_DWORD *)buf = 138412546;
      v94 = a3;
      v95 = 2112;
      v96 = v10;
      _os_log_impl(&dword_229238000, v9, OS_LOG_TYPE_INFO, "Sending invitation to: %@   from: %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v62 = a3;
    v66 = -[IMDAppleServiceSession callerURI](self, "callerURI");
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v11 = -[IMDAppleServiceSession callerURI](self, "callerURI", a3, v66);
      v62 = a3;
      v66 = v11;
      _IMAlwaysLog();
    }
  }
  if (MarcoShouldLogCheckpoints())
  {
    v62 = a3;
    v66 = -[IMDAppleServiceSession callerURI](self, "callerURI");
    MarcoNoteCheckpoint();
  }
  -[FaceTimeServiceSession _logLocalInfo](self, "_logLocalInfo", v62, v66, v69);
  v12 = objc_msgSend(a3, "_URIFromFZIDType:", objc_msgSend(a3, "_FZBestGuessFZIDType"));
  v13 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50A68]);
  v14 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithPlistData:", v13);
  v15 = objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BE50A78]);
  v16 = objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BE50A98]);
  v17 = objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BE50A90]);
  v75 = objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BE50AE0]);
  v76 = (void *)objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BE50AE8]);
  v18 = (void *)objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BE50A88]);
  v19 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("excludingPushTokens"));
  v78 = (void *)objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50A50]);
  v20 = (id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50AA0]);
  v77 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50A60]);
  v79 = objc_msgSend(v78, "BOOLValue");
  if (-[FaceTimeServiceSession _checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 1, v79, a5, value, a4)&& -[FaceTimeServiceSession _checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 1, v79, a5, value, a4)&& -[FaceTimeServiceSession _checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 1,
         v79,
         a5,
         value,
         a4)
    && -[FaceTimeServiceSession _checkAliasInfoAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:](self, "_checkAliasInfoAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:", 1, v79, a5, value, a4)&& -[FaceTimeServiceSession _checkForBadPeerIDWithAction:callType:conferenceID:withPerson:properties:peerID:](self, "_checkForBadPeerIDWithAction:callType:conferenceID:withPerson:properties:peerID:", 1, v79, a5, value, a4, v12))
  {
    v21 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = CFSTR("video");
      *(_DWORD *)buf = 138413058;
      v94 = value;
      if (v79)
        v22 = CFSTR("audio");
      v95 = 2112;
      v96 = v76;
      v97 = 2112;
      v98 = (uint64_t)a4;
      v99 = 2112;
      v100 = v22;
      _os_log_impl(&dword_229238000, v21, OS_LOG_TYPE_DEFAULT, "userID: %@  sessionID: %@ props: %@   call type: %@", buf, 0x2Au);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v23 = CFSTR("video");
        if (v79)
          v23 = CFSTR("audio");
        v70 = (NSData *)a4;
        v71 = v23;
        v63 = value;
        v67 = v76;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v24 = CFSTR("video");
        if (v79)
          v24 = CFSTR("audio");
        v70 = (NSData *)a4;
        v71 = v24;
        v63 = value;
        v67 = v76;
        IMLogString();
      }
    }
    v73 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (v77)
    {
      v74 = objc_alloc_init(FTReInitiateMessage);
      if (v20)
        v25 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "__imDataWithHexString:", v20);
      else
        v25 = -[FaceTimeServiceSession _mappedSessionTokenForConferenceID:](self, "_mappedSessionTokenForConferenceID:", a5);
      -[FTFaceTimeMessage setSessionToken:](v74, "setSessionToken:", v25, v63, v67, v70, v71);
      if (IMOSLoggingEnabled())
      {
        v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = -[FTFaceTimeMessage sessionToken](v74, "sessionToken");
          *(_DWORD *)buf = 138412802;
          v94 = v20;
          v95 = 2112;
          v96 = a5;
          v97 = 2112;
          v98 = v27;
          _os_log_impl(&dword_229238000, v26, OS_LOG_TYPE_INFO, "existingConferenceID %@   conferenceID %@   sessionToken %@", buf, 0x20u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v67 = a5;
        v70 = -[FTFaceTimeMessage sessionToken](v74, "sessionToken");
        v63 = v20;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v28 = -[FTFaceTimeMessage sessionToken](v74, "sessionToken", v20, a5, v70);
          v67 = a5;
          v70 = (NSData *)v28;
          v63 = v20;
          _IMAlwaysLog();
        }
      }
    }
    else
    {
      v74 = objc_alloc_init(FTInitiateMessage);
    }
    -[FTReInitiateMessage setSelfNATType:](v74, "setSelfNATType:", v16, v63, v67, v70);
    -[FTReInitiateMessage setSelfNatIP:](v74, "setSelfNatIP:", v17);
    -[FTReInitiateMessage setSelfPushToken:](v74, "setSelfPushToken:", -[FaceTimeServiceSession pushToken](self, "pushToken"));
    -[FTReInitiateMessage setSelfBlob:](v74, "setSelfBlob:", v15);
    v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (v77)
    {
      v31 = (void *)objc_msgSend((id)qword_253E79928, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
      v32 = objc_msgSend(v20, "length") ? v20 : a5;
      v33 = (void *)objc_msgSend((id)objc_msgSend(v31, "objectForKey:", v32), "lastObject");
      v34 = v33;
      if (v33)
      {
        v72 = objc_msgSend(v33, "objectForKey:", CFSTR("id"));
        v35 = objc_msgSend(v34, "objectForKey:", CFSTR("push-token"));
        if (IMOSLoggingEnabled())
        {
          v36 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v94 = v34;
            _os_log_impl(&dword_229238000, v36, OS_LOG_TYPE_INFO, "Existing peer found %@", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog())
            _IMAlwaysLog();
        }
        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v72, CFSTR("id"), v35, CFSTR("push-token"), 0);
        objc_msgSend(v29, "addObject:", v37);

      }
    }
    if (!objc_msgSend(v29, "count"))
    {
      v38 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      if (objc_msgSend(v18, "count"))
        objc_msgSend(v38, "addObjectsFromArray:", objc_msgSend(v18, "arrayByApplyingSelector:", sel__bestGuessURI));
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v88;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v88 != v40)
              objc_enumerationMutation(v38);
            objc_msgSend(v29, "addObject:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i), CFSTR("raw-id")));
          }
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
        }
        while (v39);
      }
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v42 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
      if (v42)
      {
        v43 = *(_QWORD *)v84;
        do
        {
          for (j = 0; j != v42; ++j)
          {
            if (*(_QWORD *)v84 != v43)
              objc_enumerationMutation(v19);
            objc_msgSend(v30, "addObject:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j), CFSTR("push-token")));
          }
          v42 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
        }
        while (v42);
      }

    }
    if (IMOSLoggingEnabled())
    {
      v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v94 = v30;
        _os_log_impl(&dword_229238000, v45, OS_LOG_TYPE_INFO, "All peers %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v64 = v30;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v64 = v30;
        _IMAlwaysLog();
      }
    }
    -[FTReInitiateMessage setPeers:](v74, "setPeers:", v29, v64);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        v46 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v94 = v30;
          _os_log_impl(&dword_229238000, v46, OS_LOG_TYPE_INFO, "Excluding push tokens %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v65 = v30;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v65 = v30;
          _IMAlwaysLog();
        }
      }
      -[FTReInitiateMessage setPushTokensToExclude:](v74, "setPushTokensToExclude:", v30, v65);
    }
    *(_DWORD *)buf = objc_msgSend(v76, "unsignedIntValue");
    objc_msgSend(v73, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 4), CFSTR("s"));
    *(_DWORD *)buf = objc_msgSend(v78, "unsignedIntValue");
    objc_msgSend(v73, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 4), CFSTR("a"));
    if (v77)
      sub_229247F94((void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1), v73);
    if (v75)
    {
      objc_msgSend(v73, "setObject:forKey:", v75, CFSTR("k"));
      objc_msgSend(v73, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1), CFSTR("kv"));
    }
    sub_229248048((void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1), v73);
    *(_DWORD *)buf = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 2), "unsignedIntValue");
    objc_msgSend(v73, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 4), CFSTR("p"));
    -[IDSBaseMessage setClientInfo:](v74, "setClientInfo:", v73);
    -[FTIDSMessage setIDCertificate:](v74, "setIDCertificate:", -[FaceTimeServiceSession callerCertForCallType:](self, "callerCertForCallType:", v79));
    -[FTIDSMessage setIdentityPrivateKey:](v74, "setIdentityPrivateKey:", -[FaceTimeServiceSession callerPrivateKey](self, "callerPrivateKey"));
    -[FTIDSMessage setSelfURI:](v74, "setSelfURI:", -[IMDAppleServiceSession callerURI](self, "callerURI"));
    v47 = (__CFDictionary *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE30338], "sharedInstance"), "CTNetworkInformation"), "mutableCopy");
    if (!v47)
      v47 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v48 = -[IDSAccount accountType](-[IMDAppleServiceSession idsAccount](self, "idsAccount"), "accountType");
    if (!v48)
    {
      v52 = -[FaceTimeServiceSession phoneNumber](self, "phoneNumber");
      v54 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v94 = v52;
        _os_log_impl(&dword_229238000, v54, OS_LOG_TYPE_DEFAULT, "Using base number: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          v65 = v52;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          v65 = v52;
          IMLogString();
        }
      }
      goto LABEL_138;
    }
    if (v48 != 1)
    {
      v55 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229238000, v55, OS_LOG_TYPE_DEFAULT, "Local account used to call someone, unsupported", buf, 2u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
          MarcoLog();
        if (IMShouldLog())
          IMLogString();
      }
      goto LABEL_140;
    }
    v49 = -[FaceTimeServiceSession regionID](self, "regionID");
    if (v49)
      CFDictionarySetValue(v47, CFSTR("region-id"), v49);
    v50 = -[FaceTimeServiceSession regionServerContext](self, "regionServerContext", v49);
    if (v50)
      CFDictionarySetValue(v47, CFSTR("extra"), v50);
    v51 = -[FaceTimeServiceSession regionBasePhoneNumber](self, "regionBasePhoneNumber", v50);
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BE30338], "sharedInstance"), "isTelephonyDevice"))
    {
      v52 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE30338], "sharedInstance"), "telephoneNumber");
      if (objc_msgSend(v52, "length"))
      {
        v53 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v94 = v52;
          v95 = 2112;
          v96 = v51;
          _os_log_impl(&dword_229238000, v53, OS_LOG_TYPE_DEFAULT, "Using device number: %@ instead of base number: %@", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (MarcoShouldLog())
          {
            v65 = v52;
            v68 = v51;
            MarcoLog();
          }
          if (IMShouldLog())
          {
            v65 = v52;
            v68 = v51;
            IMLogString();
          }
        }
        goto LABEL_138;
      }
      v57 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v94 = v51;
        _os_log_impl(&dword_229238000, v57, OS_LOG_TYPE_DEFAULT, "No device number present, using base number: %@", buf, 0xCu);
      }
      if (!os_log_shim_legacy_logging_enabled())
        goto LABEL_137;
      if (MarcoShouldLog())
      {
        v65 = v51;
        MarcoLog();
      }
      if (!IMShouldLog())
      {
LABEL_137:
        v52 = v51;
LABEL_138:
        if (v52)
          CFDictionarySetValue(v47, CFSTR("base-phone-number"), v52);
LABEL_140:
        -[FTReInitiateMessage setRegionInformation:](v74, "setRegionInformation:", v47, v65, v68);
        v58 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        v59 = v58;
        if (value)
          CFDictionarySetValue(v58, CFSTR("ID"), value);
        if (v76)
          CFDictionarySetValue(v59, CFSTR("sessionID"), v76);
        if (a4)
          CFDictionarySetValue(v59, CFSTR("properties"), a4);
        if (v80)
          CFDictionarySetValue(v59, CFSTR("conference"), v80);
        v60 = (const void *)objc_msgSend(MEMORY[0x24BDBCE60], "date");
        if (v60)
          CFDictionarySetValue(v59, CFSTR("sendDate"), v60);
        v61 = (const void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE505A0], "sharedDaemon", v60), "currentMessageContext");
        if (v61)
          CFDictionarySetValue(v59, CFSTR("messageContext"), v61);
        -[IDSBaseMessage setTopic:](v74, "setTopic:", -[FaceTimeServiceSession topicForCallType:](self, "topicForCallType:", v79));
        -[IDSBaseMessage setUserInfo:](v74, "setUserInfo:", v59);

        -[IDSBaseMessage setCompletionBlock:](v74, "setCompletionBlock:", self->_completionBlock);
        -[FaceTimeServiceSession _messageTimeoutTimeForMessage:](self, "_messageTimeoutTimeForMessage:", v74);
        -[IDSBaseMessage setTimeout:](v74, "setTimeout:");
        objc_msgSend((id)qword_253E79930, "sendMessage:", v74);

        return;
      }
    }
    else
    {
      v56 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v94 = v51;
        _os_log_impl(&dword_229238000, v56, OS_LOG_TYPE_DEFAULT, "This is not a telephony device, just using base number: %@", buf, 0xCu);
      }
      if (!os_log_shim_legacy_logging_enabled())
        goto LABEL_137;
      if (MarcoShouldLog())
      {
        v65 = v51;
        MarcoLog();
      }
      if (!IMShouldLog())
        goto LABEL_137;
    }
    v65 = v51;
    IMLogString();
    goto LABEL_137;
  }
}

- (void)respondToVCInvitationWithPerson:(id)a3 properties:(id)a4 conference:(id)a5
{
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  const void *v21;
  const void *v22;
  _BOOL4 v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  int v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  int v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  const __CFString *v44;
  id v45;
  id v46;
  __CFDictionary *theDict;
  id v48;
  FTAcceptMessage *v49;
  void *value;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  _BYTE v56[24];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v9 = -[FaceTimeServiceSession _callTypeForConferenceID:](self, "_callTypeForConferenceID:", a5);
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("unknown");
      if (!(_DWORD)v9)
        v11 = CFSTR("video");
      *(_DWORD *)buf = 138413058;
      v52 = a3;
      if ((_DWORD)v9 == 1)
        v11 = CFSTR("audio");
      v53 = 2112;
      v54 = a4;
      v55 = 2112;
      *(_QWORD *)v56 = a5;
      *(_WORD *)&v56[8] = 2112;
      *(_QWORD *)&v56[10] = v11;
      _os_log_impl(&dword_229238000, v10, OS_LOG_TYPE_INFO, "respondToVCInvitationWithPerson: %@  properties: %@ conference: %@  callType: %@", buf, 0x2Au);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v12 = CFSTR("unknown");
    if (!(_DWORD)v9)
      v12 = CFSTR("video");
    if ((_DWORD)v9 == 1)
      v13 = CFSTR("audio");
    else
      v13 = v12;
    v42 = a5;
    v44 = v13;
    v35 = a3;
    v39 = a4;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v42 = a5;
      v44 = v13;
      v35 = a3;
      v39 = a4;
      _IMAlwaysLog();
    }
  }
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v52 = (id)qword_253E79928;
      _os_log_impl(&dword_229238000, v14, OS_LOG_TYPE_INFO, "All conference maps %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v35 = (id)qword_253E79928;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v35 = (id)qword_253E79928;
      _IMAlwaysLog();
    }
  }
  v15 = -[FaceTimeServiceSession _peerIDForDiplayID:conferenceID:](self, "_peerIDForDiplayID:conferenceID:", a3, a5, v35, v39, v42, v44);
  v16 = -[FaceTimeServiceSession _pushTokenForPeerID:conferenceID:](self, "_pushTokenForPeerID:conferenceID:", v15, a5);
  v17 = (void *)objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50AD0]);
  v18 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50AD8]);
  v19 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithPlistData:", v18);
  value = (void *)objc_msgSend(v19, "objectForKey:", *MEMORY[0x24BE50AE8]);
  if (IMOSLoggingEnabled())
  {
    v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v19;
      _os_log_impl(&dword_229238000, v20, OS_LOG_TYPE_INFO, "Reponse dictionary: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v36 = v19;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v36 = v19;
      _IMAlwaysLog();
    }
  }
  if (-[FaceTimeServiceSession _checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 4, v9, a5, a3, a4, v36)&& -[FaceTimeServiceSession _checkConferenceIDAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:](self, "_checkConferenceIDAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:", 4, v9, a5, a3, a4)&& -[FaceTimeServiceSession _checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:",
         4,
         v9,
         a5,
         a3,
         a4)
    && -[FaceTimeServiceSession _checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 4, v9, a5, a3, a4)&& -[FaceTimeServiceSession _checkAliasInfoAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:](self, "_checkAliasInfoAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:", 4, v9, a5, a3, a4)&& -[FaceTimeServiceSession _checkForBadPeerIDWithAction:callType:conferenceID:withPerson:properties:peerID:](self, "_checkForBadPeerIDWithAction:callType:conferenceID:withPerson:properties:peerID:", 4,
         v9,
         a5,
         a3,
         a4,
         v15))
  {
    v48 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    theDict = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (a3)
      CFDictionarySetValue(theDict, CFSTR("ID"), a3);
    if (v17)
      CFDictionarySetValue(theDict, CFSTR("response"), v17);
    if (value)
      CFDictionarySetValue(theDict, CFSTR("sessionID"), value);
    if (a4)
      CFDictionarySetValue(theDict, CFSTR("properties"), a4);
    if (a5)
      CFDictionarySetValue(theDict, CFSTR("conference"), a5);
    v21 = (const void *)objc_msgSend(MEMORY[0x24BDBCE60], "date");
    if (v21)
      CFDictionarySetValue(theDict, CFSTR("sendDate"), v21);
    v22 = (const void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE505A0], "sharedDaemon", v21), "currentMessageContext");
    if (v22)
      CFDictionarySetValue(theDict, CFSTR("messageContext"), v22);
    *(_DWORD *)buf = objc_msgSend(value, "unsignedIntValue", v22);
    objc_msgSend(v48, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 4), CFSTR("s"));
    sub_229248048((void *)objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50A70]), v48);
    sub_229247FF0(objc_msgSend(v19, "objectForKey:", *MEMORY[0x24BE50AE0]), v48);
    *(_DWORD *)buf = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 2), "unsignedIntValue");
    objc_msgSend(v48, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 4), CFSTR("p"));
    if (!objc_msgSend(v17, "intValue"))
    {
      v49 = objc_alloc_init(FTAcceptMessage);
      -[IDSBaseMessage setClientInfo:](v49, "setClientInfo:", v48);
      -[FTFaceTimeMessage setSessionToken:](v49, "setSessionToken:", objc_msgSend(MEMORY[0x24BDBCE50], "__imDataWithHexString:", a5));
      -[FTAcceptMessage setSelfPushToken:](v49, "setSelfPushToken:", -[FaceTimeServiceSession pushToken](self, "pushToken"));
      -[FTAcceptMessage setSelfBlob:](v49, "setSelfBlob:", objc_msgSend(v19, "objectForKey:", *MEMORY[0x24BE50A78]));
      -[FTAcceptMessage setSelfNATType:](v49, "setSelfNATType:", objc_msgSend(v19, "objectForKey:", *MEMORY[0x24BE50A98]));
      -[FTAcceptMessage setSelfNATIP:](v49, "setSelfNATIP:", objc_msgSend(v19, "objectForKey:", *MEMORY[0x24BE50A90]));
      -[FTAcceptMessage setPeerID:](v49, "setPeerID:", v15);
      -[FTAcceptMessage setPeerPushToken:](v49, "setPeerPushToken:", v16);
      -[FTAcceptMessage setPeerBlob:](v49, "setPeerBlob:", objc_msgSend(v19, "objectForKey:", *MEMORY[0x24BE50AA8]));
      -[FTAcceptMessage setPeerNATType:](v49, "setPeerNATType:", objc_msgSend(v19, "objectForKey:", *MEMORY[0x24BE50AC0]));
      -[FTAcceptMessage setPeerNATIP:](v49, "setPeerNATIP:", objc_msgSend(v19, "objectForKey:", *MEMORY[0x24BE50AB8]));
      if (IMOSLoggingEnabled())
      {
        v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v52 = a3;
          v53 = 2112;
          v54 = a5;
          _os_log_impl(&dword_229238000, v28, OS_LOG_TYPE_INFO, "Sending accept to: %@  for conference: %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v37 = a3;
        v40 = a5;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v37 = a3;
          v40 = a5;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        v37 = a3;
        v40 = a5;
        MarcoNoteCheckpoint();
      }
      -[IDSBaseMessage setTopic:](v49, "setTopic:", -[FaceTimeServiceSession topicForCallType:](self, "topicForCallType:", v9, v37, v40));
      -[IDSBaseMessage setUserInfo:](v49, "setUserInfo:", theDict);
      -[IDSBaseMessage setCompletionBlock:](v49, "setCompletionBlock:", self->_completionBlock);
      -[FaceTimeServiceSession _messageTimeoutTimeForMessage:](self, "_messageTimeoutTimeForMessage:", v49);
      -[IDSBaseMessage setTimeout:](v49, "setTimeout:");
      -[FTIDSMessage setIDCertificate:](v49, "setIDCertificate:", -[FaceTimeServiceSession callerCertForCallType:](self, "callerCertForCallType:", v9));
      -[FTIDSMessage setIdentityPrivateKey:](v49, "setIdentityPrivateKey:", -[FaceTimeServiceSession callerPrivateKey](self, "callerPrivateKey"));
      -[FTIDSMessage setSelfURI:](v49, "setSelfURI:", -[IMDAppleServiceSession callerURI](self, "callerURI"));
      objc_msgSend((id)qword_253E79930, "sendMessage:", v49);

      v29 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = objc_msgSend(v17, "intValue");
        *(_DWORD *)buf = 138413314;
        v52 = a3;
        v53 = 2112;
        v54 = value;
        v55 = 1024;
        *(_DWORD *)v56 = v30;
        *(_WORD *)&v56[4] = 2112;
        *(_QWORD *)&v56[6] = a4;
        *(_WORD *)&v56[14] = 2112;
        *(_QWORD *)&v56[16] = v48;
        _os_log_impl(&dword_229238000, v29, OS_LOG_TYPE_DEFAULT, "userID: %@  sessionID: %@ response: %d props: %@  client info: %@", buf, 0x30u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          v45 = a4;
          v46 = v48;
          v41 = value;
          v43 = objc_msgSend(v17, "intValue");
          v38 = a3;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          v45 = a4;
          v46 = v48;
          v41 = value;
          v43 = objc_msgSend(v17, "intValue");
          v38 = a3;
          IMLogString();
        }
      }
      if ((_DWORD)v9 == 1)
        v31 = -[IMDServiceSession broadcasterForACConferenceListeners](self, "broadcasterForACConferenceListeners");
      else
        v31 = -[IMDServiceSession broadcasterForVCConferenceListeners](self, "broadcasterForVCConferenceListeners");
      objc_msgSend(v31, "account:conference:receivedAVMessage:from:sessionID:userInfo:", -[IMDServiceSession accountID](self, "accountID", v38, v41, v43, v45, v46), a5, 350, sub_2292432C8(a3), objc_msgSend(value, "unsignedIntValue"), 0);
      goto LABEL_100;
    }
    v23 = objc_msgSend(v17, "intValue") == 1;
    v24 = IMOSLoggingEnabled();
    if (v23)
    {
      if (v24)
      {
        v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v52 = a3;
          v53 = 2112;
          v54 = a5;
          _os_log_impl(&dword_229238000, v25, OS_LOG_TYPE_INFO, "Sending decline to: %@  for conference: %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v37 = a3;
        v40 = a5;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v37 = a3;
          v40 = a5;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        v37 = a3;
        v40 = a5;
        MarcoNoteCheckpoint();
      }
      v26 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_msgSend(v17, "intValue");
        *(_DWORD *)buf = 138413058;
        v52 = a3;
        v53 = 2112;
        v54 = value;
        v55 = 1024;
        *(_DWORD *)v56 = v27;
        *(_WORD *)&v56[4] = 2112;
        *(_QWORD *)&v56[6] = a4;
        _os_log_impl(&dword_229238000, v26, OS_LOG_TYPE_DEFAULT, "userID: %@  sessionID: %@ response: %d props: %@", buf, 0x26u);
      }
      if (!os_log_shim_legacy_logging_enabled())
        goto LABEL_97;
      if (MarcoShouldLog())
      {
        v43 = objc_msgSend(v17, "intValue");
        v45 = a4;
        v37 = a3;
        v40 = value;
        MarcoLog();
      }
      if ((IMShouldLog() & 1) == 0)
        goto LABEL_97;
    }
    else
    {
      if (v24)
      {
        v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v52 = a3;
          v53 = 2112;
          v54 = a5;
          _os_log_impl(&dword_229238000, v32, OS_LOG_TYPE_INFO, "Sending busy to: %@  for conference: %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v37 = a3;
        v40 = a5;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v37 = a3;
          v40 = a5;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        v37 = a3;
        v40 = a5;
        MarcoNoteCheckpoint();
      }
      v33 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = objc_msgSend(v17, "intValue");
        *(_DWORD *)buf = 138413058;
        v52 = a3;
        v53 = 2112;
        v54 = value;
        v55 = 1024;
        *(_DWORD *)v56 = v34;
        *(_WORD *)&v56[4] = 2112;
        *(_QWORD *)&v56[6] = a4;
        _os_log_impl(&dword_229238000, v33, OS_LOG_TYPE_DEFAULT, "userID: %@  sessionID: %@ response: %d props: %@", buf, 0x26u);
      }
      if (!os_log_shim_legacy_logging_enabled())
        goto LABEL_97;
      if (MarcoShouldLog())
      {
        v43 = objc_msgSend(v17, "intValue");
        v45 = a4;
        v37 = a3;
        v40 = value;
        MarcoLog();
      }
      if (!IMShouldLog())
        goto LABEL_97;
    }
    v43 = objc_msgSend(v17, "intValue", v37, v40, v43, v45);
    v45 = a4;
    v37 = a3;
    v40 = value;
    IMLogString();
LABEL_97:
    -[FaceTimeServiceSession _sendRejectToPeerID:peerToken:sessionToken:callType:reason:clientInfo:](self, "_sendRejectToPeerID:peerToken:sessionToken:callType:reason:clientInfo:", v15, v16, objc_msgSend(MEMORY[0x24BDBCE50], "__imDataWithHexString:", a5, v37, v40, v43, v45), v9, (int)objc_msgSend(v17, "intValue"), v48);
LABEL_100:

  }
}

- (void)cancelVCRequestWithPerson:(id)a3 properties:(id)a4 conference:(id)a5 reason:(id)a6
{
  -[FaceTimeServiceSession _cancelVCRequestWithPerson:properties:conference:pairsToSkip:reason:](self, "_cancelVCRequestWithPerson:properties:conference:pairsToSkip:reason:", a3, a4, a5, 0, a6);
}

- (void)sendAVMessageToPerson:(id)a3 sessionID:(unsigned int)a4 type:(unsigned int)a5 userInfo:(id)a6 conference:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  id v21;
  FTSendMessage *v22;
  __CFDictionary *v23;
  __CFDictionary *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  const __CFString *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  _BYTE v38[40];
  uint64_t v39;

  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v39 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v38 = v9;
      *(_WORD *)&v38[4] = 1024;
      *(_DWORD *)&v38[6] = v10;
      *(_WORD *)&v38[10] = 2112;
      *(_QWORD *)&v38[12] = a7;
      *(_WORD *)&v38[20] = 2112;
      *(_QWORD *)&v38[22] = a3;
      *(_WORD *)&v38[30] = 2112;
      *(_QWORD *)&v38[32] = a6;
      _os_log_impl(&dword_229238000, v13, OS_LOG_TYPE_INFO, "Request to send AV Message type: %d   for session ID: %u  for conference: %@  to person: %@  userInfo: %@", buf, 0x2Cu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v34 = a3;
    v36 = a6;
    v30 = v10;
    v32 = a7;
    v27 = v9;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v34 = a3;
      v36 = a6;
      v30 = v10;
      v32 = a7;
      v27 = v9;
      _IMAlwaysLog();
    }
  }
  if ((v9 - 1000) < 2 || (_DWORD)v9 == 1500)
  {
    v14 = -[FaceTimeServiceSession _mappedSessionTokenForConferenceID:](self, "_mappedSessionTokenForConferenceID:", a7, v27, v30, v32, v34, v36);
    v15 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v10);
    v16 = -[FaceTimeServiceSession _callTypeForConferenceID:](self, "_callTypeForConferenceID:", a7);
    v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = CFSTR("unknown");
      if (!(_DWORD)v16)
        v18 = CFSTR("video");
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v38 = v9;
      if ((_DWORD)v16 == 1)
        v18 = CFSTR("audio");
      *(_WORD *)&v38[4] = 2112;
      *(_QWORD *)&v38[6] = v18;
      *(_WORD *)&v38[14] = 2112;
      *(_QWORD *)&v38[16] = a3;
      *(_WORD *)&v38[24] = 2112;
      *(_QWORD *)&v38[26] = a6;
      _os_log_impl(&dword_229238000, v17, OS_LOG_TYPE_DEFAULT, "Sending AV Message type: %d callType: %@ to: %@ userInfo :%@", buf, 0x26u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v19 = CFSTR("unknown");
        if (!(_DWORD)v16)
          v19 = CFSTR("video");
        if ((_DWORD)v16 == 1)
          v19 = CFSTR("audio");
        v33 = a3;
        v35 = a6;
        v28 = v9;
        v31 = v19;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v20 = CFSTR("unknown");
        if (!(_DWORD)v16)
          v20 = CFSTR("video");
        if ((_DWORD)v16 == 1)
          v20 = CFSTR("audio");
        v33 = a3;
        v35 = a6;
        v28 = v9;
        v31 = v20;
        IMLogString();
      }
    }
    if (-[FaceTimeServiceSession _checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 6, v16, a7, a3, 0, v28, v31, v33, v35)&& -[FaceTimeServiceSession _checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 6, v16, a7, a3, 0)
      && -[FaceTimeServiceSession _checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 6, v16, a7, a3, 0)&& -[FaceTimeServiceSession _checkAliasInfoAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:](self, "_checkAliasInfoAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:", 6, v16, a7, a3, 0))
    {
      v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      *(_DWORD *)buf = objc_msgSend(v15, "unsignedIntValue");
      objc_msgSend(v21, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 4), CFSTR("s"));
      if (a6)
        CFDictionarySetValue((CFMutableDictionaryRef)v21, CFSTR("info"), a6);
      v22 = objc_alloc_init(FTSendMessage);
      if (!v14)
        v14 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "__imDataWithHexString:", a7);
      -[FTFaceTimeMessage setSessionToken:](v22, "setSessionToken:", v14);
      -[FTSendMessage setReason:](v22, "setReason:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9));
      -[FTSendMessage setPeers:](v22, "setPeers:", -[FaceTimeServiceSession _peerInfoForDisplayID:conferenceID:skippingPairs:](self, "_peerInfoForDisplayID:conferenceID:skippingPairs:", a3, a7, 0));
      -[IDSBaseMessage setClientInfo:](v22, "setClientInfo:", v21);
      v23 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v24 = v23;
      if (a3)
        CFDictionarySetValue(v23, CFSTR("ID"), a3);
      if (a7)
        CFDictionarySetValue(v24, CFSTR("conference"), a7);
      -[IDSBaseMessage setTopic:](v22, "setTopic:", -[FaceTimeServiceSession topicForCallType:](self, "topicForCallType:", v16));
      -[IDSBaseMessage setUserInfo:](v22, "setUserInfo:", v24);
      -[IDSBaseMessage setCompletionBlock:](v22, "setCompletionBlock:", self->_completionBlock);
      -[FaceTimeServiceSession _messageTimeoutTimeForMessage:](self, "_messageTimeoutTimeForMessage:", v22);
      -[IDSBaseMessage setTimeout:](v22, "setTimeout:");
      -[FTIDSMessage setIDCertificate:](v22, "setIDCertificate:", -[FaceTimeServiceSession callerCertForCallType:](self, "callerCertForCallType:", v16));
      -[FTIDSMessage setIdentityPrivateKey:](v22, "setIdentityPrivateKey:", -[FaceTimeServiceSession callerPrivateKey](self, "callerPrivateKey"));
      -[FTIDSMessage setSelfURI:](v22, "setSelfURI:", -[IMDAppleServiceSession callerURI](self, "callerURI"));
      -[FTSendMessage setSelfPushToken:](v22, "setSelfPushToken:", -[FaceTimeServiceSession pushToken](self, "pushToken"));
      if (IMOSLoggingEnabled())
      {
        v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v38 = a3;
          _os_log_impl(&dword_229238000, v25, OS_LOG_TYPE_INFO, "Sending generic message to: %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v29 = a3;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v29 = a3;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        v29 = a3;
        MarcoNoteCheckpoint();
      }
      objc_msgSend((id)qword_253E79930, "sendMessage:", v22, v29);

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v38 = v9;
        _os_log_impl(&dword_229238000, v26, OS_LOG_TYPE_INFO, " => Not sending, not supported message type: %d", buf, 8u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
  }
}

- (void)relay:(id)a3 sendInitateRequest:(id)a4 toPerson:(id)a5
{
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  FTRelayInitateMessage *v19;
  __CFDictionary *v20;
  __CFDictionary *v21;
  const void *v22;
  const void *v23;
  id v24;
  id v25;
  id v26;
  const __CFString *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v30 = a5;
      v31 = 2112;
      v32 = a3;
      v33 = 2112;
      v34 = a4;
      _os_log_impl(&dword_229238000, v9, OS_LOG_TYPE_INFO, "sendRelayInitateRequestTo: %@ relayID: %@  userInfo: %@", buf, 0x20u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v26 = a3;
    v28 = a4;
    v24 = a5;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v26 = a3;
      v28 = a4;
      v24 = a5;
      _IMAlwaysLog();
    }
  }
  v10 = -[FaceTimeServiceSession _mappedSessionTokenForConferenceID:](self, "_mappedSessionTokenForConferenceID:", a3, v24, v26, v28);
  v11 = -[FaceTimeServiceSession _peerIDForDiplayID:conferenceID:](self, "_peerIDForDiplayID:conferenceID:", a5, a3);
  v12 = -[FaceTimeServiceSession _pushTokenForPeerID:conferenceID:](self, "_pushTokenForPeerID:conferenceID:", v11, a3);
  v13 = -[FaceTimeServiceSession _callTypeForConferenceID:](self, "_callTypeForConferenceID:", a3);
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = CFSTR("unknown");
      if (!(_DWORD)v13)
        v15 = CFSTR("video");
      if ((_DWORD)v13 == 1)
        v15 = CFSTR("audio");
      *(_DWORD *)buf = 138412546;
      v30 = a5;
      v31 = 2112;
      v32 = (id)v15;
      _os_log_impl(&dword_229238000, v14, OS_LOG_TYPE_INFO, "Sending relay initate to: %@  callType: %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v16 = CFSTR("unknown");
    if (!(_DWORD)v13)
      v16 = CFSTR("video");
    if ((_DWORD)v13 == 1)
      v17 = CFSTR("audio");
    else
      v17 = v16;
    v25 = a5;
    v27 = v17;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v25 = a5;
      v27 = v17;
      _IMAlwaysLog();
    }
  }
  if (MarcoShouldLogCheckpoints())
  {
    v18 = CFSTR("unknown");
    if (!(_DWORD)v13)
      v18 = CFSTR("video");
    if ((_DWORD)v13 == 1)
      v18 = CFSTR("audio");
    v25 = a5;
    v27 = v18;
    MarcoNoteCheckpoint();
  }
  if (-[FaceTimeServiceSession _checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 7, v13, a3, a5, 0, v25, v27)&& -[FaceTimeServiceSession _checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 7, v13, a3, a5, 0)&& -[FaceTimeServiceSession _checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self,
         "_checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:",
         7,
         v13,
         a3,
         a5,
         0)
    && -[FaceTimeServiceSession _checkAliasInfoAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:](self, "_checkAliasInfoAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:", 7, v13, a3, a5, 0)&& -[FaceTimeServiceSession _checkForBadPeerIDWithAction:callType:conferenceID:withPerson:properties:peerID:](self, "_checkForBadPeerIDWithAction:callType:conferenceID:withPerson:properties:peerID:", 7, v13, a3, a5, 0, v11))
  {
    if (v10)
    {
      v19 = objc_alloc_init(FTRelayInitateMessage);
    }
    else
    {
      if (!-[FaceTimeServiceSession _checkConferenceIDAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:](self, "_checkConferenceIDAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:", 7, v13, a3, a5, 0))return;
      v19 = objc_alloc_init(FTRelayInitateMessage);
      v10 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "__imDataWithHexString:", a3);
    }
    -[FTFaceTimeMessage setSessionToken:](v19, "setSessionToken:", v10);
    -[FTRelayInitateMessage setSelfPushToken:](v19, "setSelfPushToken:", -[FaceTimeServiceSession pushToken](self, "pushToken"));
    -[FTRelayInitateMessage setSelfNatType:](v19, "setSelfNatType:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50608]));
    -[FTRelayInitateMessage setSelfNATIP:](v19, "setSelfNATIP:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50600]));
    -[FTRelayInitateMessage setPeerID:](v19, "setPeerID:", v11);
    -[FTRelayInitateMessage setPeerPushToken:](v19, "setPeerPushToken:", v12);
    -[FTRelayInitateMessage setPeerNatType:](v19, "setPeerNatType:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE505C8]));
    -[FTRelayInitateMessage setPeerNATIP:](v19, "setPeerNATIP:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE505C0]));
    -[FTRelayInitateMessage setRelayCandidateID:](v19, "setRelayCandidateID:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE505F8]));
    v20 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v21 = v20;
    if (a5)
      CFDictionarySetValue(v20, CFSTR("ID"), a5);
    if (a3)
      CFDictionarySetValue(v21, CFSTR("conference"), a3);
    v22 = (const void *)objc_msgSend(MEMORY[0x24BDBCE60], "date");
    if (v22)
      CFDictionarySetValue(v21, CFSTR("sendDate"), v22);
    v23 = (const void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE505A0], "sharedDaemon", v22), "currentMessageContext");
    if (v23)
      CFDictionarySetValue(v21, CFSTR("messageContext"), v23);
    -[IDSBaseMessage setTopic:](v19, "setTopic:", -[FaceTimeServiceSession topicForCallType:](self, "topicForCallType:", v13));
    -[IDSBaseMessage setUserInfo:](v19, "setUserInfo:", v21);
    -[IDSBaseMessage setCompletionBlock:](v19, "setCompletionBlock:", self->_completionBlock);
    -[FaceTimeServiceSession _messageTimeoutTimeForMessage:](self, "_messageTimeoutTimeForMessage:", v19);
    -[IDSBaseMessage setTimeout:](v19, "setTimeout:");
    -[FTIDSMessage setIDCertificate:](v19, "setIDCertificate:", -[FaceTimeServiceSession callerCertForCallType:](self, "callerCertForCallType:", v13));
    -[FTIDSMessage setIdentityPrivateKey:](v19, "setIdentityPrivateKey:", -[FaceTimeServiceSession callerPrivateKey](self, "callerPrivateKey"));
    -[FTIDSMessage setSelfURI:](v19, "setSelfURI:", -[IMDAppleServiceSession callerURI](self, "callerURI"));
    objc_msgSend((id)qword_253E79930, "sendMessage:", v19);

  }
}

- (void)relay:(id)a3 sendUpdate:(id)a4 toPerson:(id)a5
{
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  FTRelayUpdateMessage *v19;
  uint64_t v20;
  uint64_t v21;
  __CFDictionary *v22;
  __CFDictionary *v23;
  const void *v24;
  const void *v25;
  id v26;
  id v27;
  id v28;
  const __CFString *v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v32 = a5;
      v33 = 2112;
      v34 = a3;
      v35 = 2112;
      v36 = a4;
      _os_log_impl(&dword_229238000, v9, OS_LOG_TYPE_INFO, "sendRelayUpdateTo: %@ relayID: %@  userInfo: %@", buf, 0x20u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v28 = a3;
    v30 = a4;
    v26 = a5;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v28 = a3;
      v30 = a4;
      v26 = a5;
      _IMAlwaysLog();
    }
  }
  v10 = -[FaceTimeServiceSession _mappedSessionTokenForConferenceID:](self, "_mappedSessionTokenForConferenceID:", a3, v26, v28, v30);
  v11 = -[FaceTimeServiceSession _peerIDForDiplayID:conferenceID:](self, "_peerIDForDiplayID:conferenceID:", a5, a3);
  v12 = -[FaceTimeServiceSession _pushTokenForPeerID:conferenceID:](self, "_pushTokenForPeerID:conferenceID:", v11, a3);
  v13 = -[FaceTimeServiceSession _callTypeForConferenceID:](self, "_callTypeForConferenceID:", a3);
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = CFSTR("unknown");
      if (!(_DWORD)v13)
        v15 = CFSTR("video");
      if ((_DWORD)v13 == 1)
        v15 = CFSTR("audio");
      *(_DWORD *)buf = 138412546;
      v32 = a5;
      v33 = 2112;
      v34 = (id)v15;
      _os_log_impl(&dword_229238000, v14, OS_LOG_TYPE_INFO, "Sending relay update to: %@   callType: %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v16 = CFSTR("unknown");
    if (!(_DWORD)v13)
      v16 = CFSTR("video");
    if ((_DWORD)v13 == 1)
      v17 = CFSTR("audio");
    else
      v17 = v16;
    v27 = a5;
    v29 = v17;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v27 = a5;
      v29 = v17;
      _IMAlwaysLog();
    }
  }
  if (MarcoShouldLogCheckpoints())
  {
    v18 = CFSTR("unknown");
    if (!(_DWORD)v13)
      v18 = CFSTR("video");
    if ((_DWORD)v13 == 1)
      v18 = CFSTR("audio");
    v27 = a5;
    v29 = v18;
    MarcoNoteCheckpoint();
  }
  if (-[FaceTimeServiceSession _checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 8, v13, a3, a5, 0, v27, v29)&& -[FaceTimeServiceSession _checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 8, v13, a3, a5, 0)&& -[FaceTimeServiceSession _checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self,
         "_checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:",
         8,
         v13,
         a3,
         a5,
         0)
    && -[FaceTimeServiceSession _checkAliasInfoAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:](self, "_checkAliasInfoAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:", 8, v13, a3, a5, 0)&& -[FaceTimeServiceSession _checkForBadPeerIDWithAction:callType:conferenceID:withPerson:properties:peerID:](self, "_checkForBadPeerIDWithAction:callType:conferenceID:withPerson:properties:peerID:", 8, v13, a3, a5, 0, v11))
  {
    if (v10)
    {
      v19 = objc_alloc_init(FTRelayUpdateMessage);
    }
    else
    {
      if (!-[FaceTimeServiceSession _checkConferenceIDAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:](self, "_checkConferenceIDAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:", 8, v13, a3, a5, 0))return;
      v19 = objc_alloc_init(FTRelayUpdateMessage);
      v10 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "__imDataWithHexString:", a3);
    }
    -[FTFaceTimeMessage setSessionToken:](v19, "setSessionToken:", v10);
    -[FTRelayUpdateMessage setPeerID:](v19, "setPeerID:", v11);
    -[FTRelayUpdateMessage setPeerPushToken:](v19, "setPeerPushToken:", v12);
    -[FTRelayUpdateMessage setRelayType:](v19, "setRelayType:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50640]));
    -[FTRelayUpdateMessage setRelayConnectionID:](v19, "setRelayConnectionID:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE505B0]));
    -[FTRelayUpdateMessage setRelayTransactionIDAlloc:](v19, "setRelayTransactionIDAlloc:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50638]));
    -[FTRelayUpdateMessage setRelayTokenAllocRes:](v19, "setRelayTokenAllocRes:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50630]));
    -[FTRelayUpdateMessage setSelfPushToken:](v19, "setSelfPushToken:", -[FaceTimeServiceSession pushToken](self, "pushToken"));
    -[FTRelayUpdateMessage setSelfRelayIP:](v19, "setSelfRelayIP:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50610]));
    -[FTRelayUpdateMessage setSelfRelayPort:](v19, "setSelfRelayPort:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50628]));
    -[FTRelayUpdateMessage setSelfRelayNATIP:](v19, "setSelfRelayNATIP:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50618]));
    -[FTRelayUpdateMessage setSelfRelayNATPort:](v19, "setSelfRelayNATPort:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50620]));
    v20 = *MEMORY[0x24BE505D8];
    if (objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE505D8]))
      v21 = v20;
    else
      v21 = *MEMORY[0x24BE505D0];
    -[FTRelayUpdateMessage setPeerRelayIP:](v19, "setPeerRelayIP:", objc_msgSend(a4, "objectForKey:", v21));
    -[FTRelayUpdateMessage setPeerRelayPort:](v19, "setPeerRelayPort:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE505E8]));
    -[FTRelayUpdateMessage setSelfRelayBlob:](v19, "setSelfRelayBlob:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE505F0]));
    -[FTRelayUpdateMessage setRelayCandidateID:](v19, "setRelayCandidateID:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE505F8]));
    v22 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v23 = v22;
    if (a5)
      CFDictionarySetValue(v22, CFSTR("ID"), a5);
    if (a3)
      CFDictionarySetValue(v23, CFSTR("conference"), a3);
    v24 = (const void *)objc_msgSend(MEMORY[0x24BDBCE60], "date");
    if (v24)
      CFDictionarySetValue(v23, CFSTR("sendDate"), v24);
    v25 = (const void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE505A0], "sharedDaemon", v24), "currentMessageContext");
    if (v25)
      CFDictionarySetValue(v23, CFSTR("messageContext"), v25);
    -[IDSBaseMessage setTopic:](v19, "setTopic:", -[FaceTimeServiceSession topicForCallType:](self, "topicForCallType:", v13));
    -[IDSBaseMessage setUserInfo:](v19, "setUserInfo:", v23);
    -[IDSBaseMessage setCompletionBlock:](v19, "setCompletionBlock:", self->_completionBlock);
    -[FaceTimeServiceSession _messageTimeoutTimeForMessage:](self, "_messageTimeoutTimeForMessage:", v19);
    -[IDSBaseMessage setTimeout:](v19, "setTimeout:");
    -[FTIDSMessage setIDCertificate:](v19, "setIDCertificate:", -[FaceTimeServiceSession callerCertForCallType:](self, "callerCertForCallType:", v13));
    -[FTIDSMessage setIdentityPrivateKey:](v19, "setIdentityPrivateKey:", -[FaceTimeServiceSession callerPrivateKey](self, "callerPrivateKey"));
    -[FTIDSMessage setSelfURI:](v19, "setSelfURI:", -[IMDAppleServiceSession callerURI](self, "callerURI"));
    objc_msgSend((id)qword_253E79930, "sendMessage:", v19);

  }
}

- (BOOL)_hasOutgoingRelayInitiateInFlight
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)qword_253E79930, "currentMessage");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
    v3 = (void *)objc_msgSend((id)qword_253E79930, "allMessages", 0, 0);
    v2 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (!v2)
      return v2;
    v4 = v2;
    v5 = *(_QWORD *)v9;
LABEL_6:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v5)
        objc_enumerationMutation(v3);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        LOBYTE(v2) = 0;
        if (v4)
          goto LABEL_6;
        return v2;
      }
    }
  }
  LOBYTE(v2) = 1;
  return v2;
}

- (void)relay:(id)a3 sendCancel:(id)a4 toPerson:(id)a5
{
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  FTRelayCancelMessage *v19;
  uint64_t v20;
  uint64_t v21;
  __CFDictionary *v22;
  __CFDictionary *v23;
  id v24;
  id v25;
  id v26;
  const __CFString *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v30 = a5;
      v31 = 2112;
      v32 = a3;
      v33 = 2112;
      v34 = a4;
      _os_log_impl(&dword_229238000, v9, OS_LOG_TYPE_INFO, "sendRelayCancelTo: %@ relayID: %@  userInfo: %@", buf, 0x20u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v26 = a3;
    v28 = a4;
    v24 = a5;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v26 = a3;
      v28 = a4;
      v24 = a5;
      _IMAlwaysLog();
    }
  }
  if (-[FaceTimeServiceSession _hasOutgoingRelayInitiateInFlight](self, "_hasOutgoingRelayInitiateInFlight", v24, v26, v28))
  {
    im_dispatch_after();
    return;
  }
  v10 = -[FaceTimeServiceSession _mappedSessionTokenForConferenceID:](self, "_mappedSessionTokenForConferenceID:", a3);
  v11 = -[FaceTimeServiceSession _peerIDForDiplayID:conferenceID:](self, "_peerIDForDiplayID:conferenceID:", a5, a3);
  v12 = -[FaceTimeServiceSession _pushTokenForPeerID:conferenceID:](self, "_pushTokenForPeerID:conferenceID:", v11, a3);
  v13 = -[FaceTimeServiceSession _callTypeForConferenceID:](self, "_callTypeForConferenceID:", a3);
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = CFSTR("unknown");
      if (!(_DWORD)v13)
        v15 = CFSTR("video");
      if ((_DWORD)v13 == 1)
        v15 = CFSTR("audio");
      *(_DWORD *)buf = 138412546;
      v30 = a5;
      v31 = 2112;
      v32 = (id)v15;
      _os_log_impl(&dword_229238000, v14, OS_LOG_TYPE_INFO, "Sending relay cancel to: %@  callType: %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v16 = CFSTR("unknown");
    if (!(_DWORD)v13)
      v16 = CFSTR("video");
    if ((_DWORD)v13 == 1)
      v17 = CFSTR("audio");
    else
      v17 = v16;
    v25 = a5;
    v27 = v17;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v25 = a5;
      v27 = v17;
      _IMAlwaysLog();
    }
  }
  if (MarcoShouldLogCheckpoints())
  {
    v18 = CFSTR("unknown");
    if (!(_DWORD)v13)
      v18 = CFSTR("video");
    if ((_DWORD)v13 == 1)
      v18 = CFSTR("audio");
    v25 = a5;
    v27 = v18;
    MarcoNoteCheckpoint();
  }
  if (-[FaceTimeServiceSession _checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 9, v13, a3, a5, 0, v25, v27)&& -[FaceTimeServiceSession _checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 9, v13, a3, a5, 0)&& -[FaceTimeServiceSession _checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self,
         "_checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:",
         9,
         v13,
         a3,
         a5,
         0)
    && -[FaceTimeServiceSession _checkAliasInfoAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:](self, "_checkAliasInfoAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:", 9, v13, a3, a5, 0)&& -[FaceTimeServiceSession _checkForBadPeerIDWithAction:callType:conferenceID:withPerson:properties:peerID:](self, "_checkForBadPeerIDWithAction:callType:conferenceID:withPerson:properties:peerID:", 9, v13, a3, a5, 0, v11))
  {
    if (v10)
    {
      v19 = objc_alloc_init(FTRelayCancelMessage);
    }
    else
    {
      if (!-[FaceTimeServiceSession _checkConferenceIDAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:](self, "_checkConferenceIDAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:", 9, v13, a3, a5, 0))return;
      v19 = objc_alloc_init(FTRelayCancelMessage);
      v10 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "__imDataWithHexString:", a3);
    }
    -[FTFaceTimeMessage setSessionToken:](v19, "setSessionToken:", v10);
    -[FTRelayCancelMessage setPeerID:](v19, "setPeerID:", v11);
    -[FTRelayCancelMessage setPeerPushToken:](v19, "setPeerPushToken:", v12);
    -[FTRelayCancelMessage setReason:](v19, "setReason:", &unk_24F1F2698);
    -[FTRelayCancelMessage setRelayType:](v19, "setRelayType:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50640]));
    -[FTRelayCancelMessage setRelayConnectionID:](v19, "setRelayConnectionID:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE505B0]));
    -[FTRelayCancelMessage setSelfRelayIP:](v19, "setSelfRelayIP:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50610]));
    -[FTRelayCancelMessage setSelfRelayPort:](v19, "setSelfRelayPort:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE50628]));
    v20 = *MEMORY[0x24BE505D8];
    if (objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE505D8]))
      v21 = v20;
    else
      v21 = *MEMORY[0x24BE505D0];
    -[FTRelayCancelMessage setPeerRelayIP:](v19, "setPeerRelayIP:", objc_msgSend(a4, "objectForKey:", v21));
    -[FTRelayCancelMessage setPeerRelayPort:](v19, "setPeerRelayPort:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE505E8]));
    -[FTRelayCancelMessage setRelayCandidateID:](v19, "setRelayCandidateID:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE505F8]));
    v22 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v23 = v22;
    if (a5)
      CFDictionarySetValue(v22, CFSTR("ID"), a5);
    if (a3)
      CFDictionarySetValue(v23, CFSTR("conference"), a3);
    -[IDSBaseMessage setTopic:](v19, "setTopic:", -[FaceTimeServiceSession topicForCallType:](self, "topicForCallType:", v13));
    -[IDSBaseMessage setUserInfo:](v19, "setUserInfo:", v23);
    -[IDSBaseMessage setCompletionBlock:](v19, "setCompletionBlock:", self->_completionBlock);
    -[FaceTimeServiceSession _messageTimeoutTimeForMessage:](self, "_messageTimeoutTimeForMessage:", v19);
    -[IDSBaseMessage setTimeout:](v19, "setTimeout:");
    -[FTIDSMessage setIDCertificate:](v19, "setIDCertificate:", -[FaceTimeServiceSession callerCertForCallType:](self, "callerCertForCallType:", v13));
    -[FTIDSMessage setIdentityPrivateKey:](v19, "setIdentityPrivateKey:", -[FaceTimeServiceSession callerPrivateKey](self, "callerPrivateKey"));
    -[FTIDSMessage setSelfURI:](v19, "setSelfURI:", -[IMDAppleServiceSession callerURI](self, "callerURI"));
    objc_msgSend((id)qword_253E79930, "sendMessage:", v19);

  }
}

- (void)_cancelOtherInvitesForPeerID:(id)a3 skipPairs:(id)a4 properties:(id)a5 conference:(id)a6 reason:(id)a7
{
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v20 = a3;
      v21 = 2112;
      v22 = a4;
      _os_log_impl(&dword_229238000, v13, OS_LOG_TYPE_INFO, "Cancelling other invites for peer ID: %@     ignore pairs: %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v16 = a3;
    v18 = a4;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v16 = a3;
      v18 = a4;
      _IMAlwaysLog();
    }
  }
  v14 = -[FaceTimeServiceSession _peerIDPushTokensPairsForPeerID:conferenceID:skippingPairs:](self, "_peerIDPushTokensPairsForPeerID:conferenceID:skippingPairs:", a3, a6, a4, v16, v18);
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_impl(&dword_229238000, v15, OS_LOG_TYPE_INFO, "         pairs to cancel: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v17 = v14;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v17 = v14;
      _IMAlwaysLog();
    }
  }
  if (objc_msgSend(v14, "count", v17))
    -[FaceTimeServiceSession _cancelVCRequestWithPerson:properties:conference:pairsToSkip:reason:](self, "_cancelVCRequestWithPerson:properties:conference:pairsToSkip:reason:", -[FaceTimeServiceSession _displayIDForPeerID:conferenceID:](self, "_displayIDForPeerID:conferenceID:", a3, a6), a5, a6, a4, a7);
}

- (BOOL)_hasOutgoingInvitationInFlight
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)qword_253E79930, "currentMessage");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
    v3 = (void *)objc_msgSend((id)qword_253E79930, "allMessages", 0, 0);
    v2 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (!v2)
      return v2;
    v4 = v2;
    v5 = *(_QWORD *)v9;
LABEL_6:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v5)
        objc_enumerationMutation(v3);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        LOBYTE(v2) = 0;
        if (v4)
          goto LABEL_6;
        return v2;
      }
    }
  }
  LOBYTE(v2) = 1;
  return v2;
}

- (void)handler:(id)a3 sessionInitated:(id)a4 topic:(id)a5 myID:(id)a6 peerID:(id)a7 peerDisplayID:(id)a8 peerCN:(id)a9 peerPushToken:(id)a10 peerNATType:(id)a11 peerBlob:(id)a12 peerNatIP:(id)a13 clientInfo:(id)a14 serviceData:(id)a15
{
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  char v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  id v36;
  unsigned int v37;
  id v38;
  NSArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  const __CFString *v54;
  char v55;
  NSObject *v56;
  const __CFString *v57;
  __CFString *v58;
  const __CFString *v59;
  NSObject *v60;
  void *v61;
  __CFDictionary *v62;
  __CFDictionary *v63;
  _QWORD *v64;
  void *v65;
  void *v66;
  const void *v67;
  const void *v68;
  const void *v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  NSObject *v78;
  NSObject *v79;
  id v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  NSObject *v86;
  NSObject *v87;
  const char *v88;
  const char *v89;
  __CFDictionary *v90;
  __CFDictionary *v91;
  uint64_t v92;
  id v93;
  id v94;
  id v95;
  __CFString *v96;
  const char *v97;
  unsigned int v99;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t);
  void *v112;
  FaceTimeServiceSession *v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint8_t buf[4];
  const char *v132;
  __int16 v133;
  id v134;
  __int16 v135;
  const __CFString *v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v132 = "-[FaceTimeServiceSession handler:sessionInitated:topic:myID:peerID:peerDisplayID:peerCN:peerPushToken:peerN"
             "ATType:peerBlob:peerNatIP:clientInfo:serviceData:]";
      v133 = 2112;
      v134 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@, myID: %@"), a4, a5, a6);
      _os_log_impl(&dword_229238000, v20, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@, myID: %@"), a4, a5, a6);
    v88 = "-[FaceTimeServiceSession handler:sessionInitated:topic:myID:peerID:peerDisplayID:peerCN:peerPushToken:peerNATT"
          "ype:peerBlob:peerNatIP:clientInfo:serviceData:]";
    v92 = v21;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@, myID: %@"), a4, a5, a6);
      v88 = "-[FaceTimeServiceSession handler:sessionInitated:topic:myID:peerID:peerDisplayID:peerCN:peerPushToken:peerNA"
            "TType:peerBlob:peerNatIP:clientInfo:serviceData:]";
      v92 = v22;
      _IMAlwaysLog();
    }
  }
  v99 = objc_msgSend(a5, "isEqualToString:", CFSTR("com.apple.private.ac"), v88, v92);
  v23 = -[IDSAccount accountType](-[IMDAppleServiceSession idsAccount](self, "idsAccount"), "accountType");
  if (v23)
  {
    if (v23 != 1)
    {
      if (IMOSLoggingEnabled())
      {
        v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_229238000, v31, OS_LOG_TYPE_INFO, "Ignoring this invite, it came to the local account", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog())
          _IMAlwaysLog();
      }
      if (IMOSLoggingEnabled())
      {
        v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_229238000, v32, OS_LOG_TYPE_INFO, "Ignoring this invite, it came to the local account", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog())
          _IMAlwaysLog();
      }
      if (MarcoShouldLogCheckpoints())
        MarcoNoteCheckpoint();
      return;
    }
    v24 = objc_msgSend(a6, "isEqualToString:", -[FaceTimeServiceSession profileID](self, "profileID"));
  }
  else
  {
    v24 = objc_msgSend(a6, "isEqualToString:", objc_msgSend(-[FaceTimeServiceSession phoneNumber](self, "phoneNumber"), "_IDFromFZIDType:", 0));
  }
  if ((v24 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = -[FaceTimeServiceSession userID](self, "userID");
        *(_DWORD *)buf = 138412546;
        v132 = (const char *)a6;
        v133 = 2112;
        v134 = v34;
        _os_log_impl(&dword_229238000, v33, OS_LOG_TYPE_INFO, "Ignoring this invite, it is not to me, but instead to: %@  (mine is: %@)", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v94 = -[FaceTimeServiceSession userID](self, "userID");
      _IMLoggingLog();
      if (_IMWillLog())
      {
        -[FaceTimeServiceSession userID](self, "userID", a6, v94);
        _IMAlwaysLog();
      }
    }
    if (IMOSLoggingEnabled())
    {
      v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = -[FaceTimeServiceSession userID](self, "userID");
        *(_DWORD *)buf = 138412546;
        v132 = (const char *)a6;
        v133 = 2112;
        v134 = v36;
        _os_log_impl(&dword_229238000, v35, OS_LOG_TYPE_INFO, "Ignoring this invite, it is not to me, but instead to: %@  (mine is: %@)", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v95 = -[FaceTimeServiceSession userID](self, "userID");
      _IMLoggingLog();
      if (_IMWillLog())
      {
        -[FaceTimeServiceSession userID](self, "userID", a6, v95);
        _IMAlwaysLog();
      }
    }
    if (MarcoShouldLogCheckpoints())
    {
      -[FaceTimeServiceSession userID](self, "userID");
      MarcoNoteCheckpoint();
    }
    return;
  }
  v25 = objc_msgSend(a4, "__imHexString");
  -[FaceTimeServiceSession _setCallType:forConferenceID:](self, "_setCallType:forConferenceID:", v99, v25);
  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v26 = (void *)objc_msgSend((id)qword_253E79928, "allValues");
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v128;
LABEL_14:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v128 != v28)
        objc_enumerationMutation(v26);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * v29), "objectForKey:", v25))
        break;
      if (v27 == ++v29)
      {
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
        if (v27)
          goto LABEL_14;
        goto LABEL_20;
      }
    }
  }
  else
  {
LABEL_20:
    if (-[FaceTimeServiceSession _hasOutgoingInvitationInFlight](self, "_hasOutgoingInvitationInFlight"))
    {
      if (IMOSLoggingEnabled())
      {
        v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v132 = (const char *)v25;
          v133 = 2112;
          v134 = a4;
          _os_log_impl(&dword_229238000, v30, OS_LOG_TYPE_INFO, "Delaying initiate for conference ID: %@  (token: %@)", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog())
          _IMAlwaysLog();
      }
      v109 = MEMORY[0x24BDAC760];
      v110 = 3221225472;
      v111 = sub_22924CDA8;
      v112 = &unk_24F1EADA8;
      v113 = self;
      v114 = a3;
      v115 = a4;
      v116 = a5;
      v117 = a6;
      v118 = a7;
      v119 = a8;
      v120 = a9;
      v121 = a10;
      v122 = a11;
      v123 = a12;
      v124 = a13;
      v125 = a14;
      v126 = a15;
      im_dispatch_after();
      return;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BE4FC40], "sharedInstance"), "_setCurrentIDStatus:forDestination:service:", 1, a8, a5);
  v37 = sub_22924CDF4(a14);
  if (objc_msgSend(a8, "length"))
    v38 = a8;
  else
    v38 = a7;
  v97 = (const char *)objc_msgSend(v38, "_stripFZIDPrefix");
  if ((v37 & 1) == 0)
  {
    MarcoBeginSession();
    MarcoSetInitiator();
  }
  if (-[IDSAccount accountType](-[IMDAppleServiceSession idsAccount](self, "idsAccount"), "accountType") == 1)
  {
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v39 = -[IMDAppleServiceSession aliases](self, "aliases");
    v40 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v105, v138, 16);
    if (!v40)
    {
LABEL_70:
      if (IMOSLoggingEnabled())
      {
        v43 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_229238000, v43, OS_LOG_TYPE_INFO, "Ignoring this invite, we don't have any validated aliases", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog())
          _IMAlwaysLog();
      }
      if (IMOSLoggingEnabled())
      {
        v44 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_229238000, v44, OS_LOG_TYPE_INFO, "Ignoring this invite, we don't have any validated aliases", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog())
          _IMAlwaysLog();
      }
      if (MarcoShouldLogCheckpoints())
      {
LABEL_83:
        MarcoNoteCheckpoint();
        return;
      }
      return;
    }
    v41 = *(_QWORD *)v106;
LABEL_64:
    v42 = 0;
    while (1)
    {
      if (*(_QWORD *)v106 != v41)
        objc_enumerationMutation(v39);
      if (-[IMDAppleServiceSession validationStatusForAlias:](self, "validationStatusForAlias:", *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * v42)) == 3)break;
      if (v40 == ++v42)
      {
        v40 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v105, v138, 16);
        if (v40)
          goto LABEL_64;
        goto LABEL_70;
      }
    }
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BE508D0], "sharedInstance"), "isFastUserSwitched"))
  {
    if (IMOSLoggingEnabled())
    {
      v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229238000, v45, OS_LOG_TYPE_INFO, "Ignoring this invite, we're fast user switched out", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
    if (IMOSLoggingEnabled())
    {
      v46 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229238000, v46, OS_LOG_TYPE_INFO, "Ignoring this invite, we're fast user switched out", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
    if (MarcoShouldLogCheckpoints())
      goto LABEL_83;
  }
  else
  {
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v47 = (void *)objc_msgSend((id)qword_253E79928, "allValues");
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v101, v137, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v102;
LABEL_101:
      v50 = 0;
      while (1)
      {
        if (*(_QWORD *)v102 != v49)
          objc_enumerationMutation(v47);
        v51 = objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * v50), "objectForKey:", v25);
        if (v51)
          break;
        if (v48 == ++v50)
        {
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v101, v137, 16);
          if (v48)
            goto LABEL_101;
          goto LABEL_107;
        }
      }
    }
    else
    {
LABEL_107:
      v51 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      v52 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v132 = (const char *)v51;
        _os_log_impl(&dword_229238000, v52, OS_LOG_TYPE_INFO, "Peers for this call %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
    if (IMOSLoggingEnabled())
    {
      v53 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        v54 = CFSTR("NO");
        if (v37)
          v54 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v132 = (const char *)v54;
        _os_log_impl(&dword_229238000, v53, OS_LOG_TYPE_INFO, "Is reinitiate: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
    if (v51)
      v55 = v37;
    else
      v55 = 1;
    if ((v55 & 1) != 0)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BE508D0], "sharedInstance"), "isScreenLocked");
      FTAWDSetSubmissionDate();
      FTAWDLogCallInvitationReceived();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v25), CFSTR("ConferenceID"));
      PLLogRegisteredEvent();
      if (IMOSLoggingEnabled())
      {
        v56 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          v57 = CFSTR("video");
          *(_DWORD *)buf = 138412802;
          v132 = v97;
          v133 = 2112;
          if (v99)
            v57 = CFSTR("audio");
          v134 = a7;
          v135 = 2112;
          v136 = v57;
          _os_log_impl(&dword_229238000, v56, OS_LOG_TYPE_INFO, "Received invite push from: %@ (%@)  type: %@", buf, 0x20u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v58 = v99 ? CFSTR("audio") : CFSTR("video");
        v93 = a7;
        v96 = v58;
        v89 = v97;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v93 = a7;
          v96 = v58;
          v89 = v97;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        if (v99)
          v59 = CFSTR("audio");
        else
          v59 = CFSTR("video");
        v93 = a7;
        v96 = (__CFString *)v59;
        v89 = v97;
        MarcoNoteCheckpoint();
      }
      if (IMOSLoggingEnabled())
      {
        v60 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v132 = (const char *)v25;
          _os_log_impl(&dword_229238000, v60, OS_LOG_TYPE_INFO, "Conference ID: %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v89 = (const char *)v25;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v89 = (const char *)v25;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        v89 = (const char *)v25;
        MarcoNoteCheckpoint();
      }
      -[FaceTimeServiceSession _logLocalInfo](self, "_logLocalInfo", v89, v93, v96);
      if (-[IMDServiceSession allowedAsChild](self, "allowedAsChild"))
      {
        if (-[FaceTimeServiceSession _validRegistrationStateToAcceptCalls](self, "_validRegistrationStateToAcceptCalls"))
        {
          if (-[IMDAppleServiceSession _isDeviceRegistered](self, "_isDeviceRegistered"))
          {
            v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE508C0]), "initWithIdentifier:timeout:", CFSTR("IncomingFaceTimeCall"), 10.0);
            v62 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
            v63 = v62;
            if (a6)
              CFDictionarySetValue(v62, (const void *)*MEMORY[0x24BE50AF0], a6);
            if (a12)
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x24BE50A78], a12);
            if (a9)
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x24BE50A58], a9);
            if (a11)
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x24BE50A98], a11);
            v64 = (_QWORD *)MEMORY[0x24BE50A90];
            if (a13)
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x24BE50A90], a13);
            v65 = sub_22924CED8(a14);
            if (v65)
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x24BE50AE8], v65);
            v66 = sub_22924CFC0(a14);
            if (v66)
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x24BE50A50], v66);
            v67 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", sub_22924CDF4(a14));
            if (v67)
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x24BE50A60], v67);
            v68 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", sub_22924D0A8(a14));
            if (v68)
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x24BE50A70], v68);
            v69 = (const void *)sub_22924D18C(a14);
            if (v69)
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x24BE50AE0], v69);
            v70 = sub_22924D24C(a14);
            if (v70)
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x24BE50AC8], v70);
            if (IMOSLoggingEnabled())
            {
              v71 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v132 = (const char *)v63;
                _os_log_impl(&dword_229238000, v71, OS_LOG_TYPE_INFO, "ConferenceDictionary: %@", buf, 0xCu);
              }
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              v90 = v63;
              _IMLoggingLog();
              if (_IMWillLog())
              {
                v90 = v63;
                _IMAlwaysLog();
              }
            }
            v72 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v132 = (const char *)v63;
              _os_log_impl(&dword_229238000, v72, OS_LOG_TYPE_DEFAULT, "Response dictionary: %@", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (MarcoShouldLog())
              {
                v90 = v63;
                MarcoLog();
              }
              if (IMShouldLog())
              {
                v90 = v63;
                IMLogString();
              }
            }
            v73 = (void *)MEMORY[0x24BDBCED8];
            v74 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4, v90);
            v75 = -[__CFDictionary plistData](v63, "plistData");
            v76 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
            v77 = (void *)objc_msgSend(v73, "dictionaryWithObjectsAndKeys:", v74, *MEMORY[0x24BE50AF8], v75, *MEMORY[0x24BE50A68], v76, *MEMORY[0x24BE50AB0], a13, *v64, 0);
            objc_msgSend(v77, "addEntriesFromDictionary:", v63);
            if (IMOSLoggingEnabled())
            {
              v78 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v132 = (const char *)v77;
                _os_log_impl(&dword_229238000, v78, OS_LOG_TYPE_INFO, "Generated Properties: %@", buf, 0xCu);
              }
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              v91 = (__CFDictionary *)v77;
              _IMLoggingLog();
              if (_IMWillLog())
              {
                v91 = (__CFDictionary *)v77;
                _IMAlwaysLog();
              }
            }
            v79 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v132 = (const char *)v63;
              _os_log_impl(&dword_229238000, v79, OS_LOG_TYPE_DEFAULT, "Properties dictionary: %@", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (MarcoShouldLog())
              {
                v91 = v63;
                MarcoLog();
              }
              if (IMShouldLog())
              {
                v91 = v63;
                IMLogString();
              }
            }
            if (v99)
              v80 = -[IMDServiceSession broadcasterForACConferenceListeners](self, "broadcasterForACConferenceListeners");
            else
              v80 = -[IMDServiceSession broadcasterForVCConferenceListeners](self, "broadcasterForVCConferenceListeners");
            objc_msgSend(v80, "account:conference:receivedInvitationFrom:properties:", -[IMDServiceSession accountID](self, "accountID", v91), v25, sub_2292432C8(v97), v77);
            -[FaceTimeServiceSession _retargetPeerID:displayID:pushToken:conferenceID:](self, "_retargetPeerID:displayID:pushToken:conferenceID:", a7, v97, a10, v25);

            return;
          }
          if (IMOSLoggingEnabled())
          {
            v86 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_229238000, v86, OS_LOG_TYPE_INFO, "Device is not registered, not showing invite", buf, 2u);
            }
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            _IMLoggingLog();
            if (_IMWillLog())
              _IMAlwaysLog();
          }
          if (IMOSLoggingEnabled())
          {
            v87 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_229238000, v87, OS_LOG_TYPE_INFO, "Device is not registered, not showing invite", buf, 2u);
            }
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            _IMLoggingLog();
            if (_IMWillLog())
              _IMAlwaysLog();
          }
          if (MarcoShouldLogCheckpoints())
            MarcoNoteCheckpoint();
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            v84 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_229238000, v84, OS_LOG_TYPE_INFO, "Ignoring invite due to reg agent state", buf, 2u);
            }
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            _IMLoggingLog();
            if (_IMWillLog())
              _IMAlwaysLog();
          }
          if (IMOSLoggingEnabled())
          {
            v85 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_229238000, v85, OS_LOG_TYPE_INFO, "Ignoring this invite, we're not in a good state to recieve calls", buf, 2u);
            }
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            _IMLoggingLog();
            if (_IMWillLog())
              _IMAlwaysLog();
          }
          if (MarcoShouldLogCheckpoints())
            MarcoNoteCheckpoint();
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v82 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_229238000, v82, OS_LOG_TYPE_INFO, "Managed configuration has disabled FaceTime, we're ignoring this", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog())
            _IMAlwaysLog();
        }
        if (IMOSLoggingEnabled())
        {
          v83 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_229238000, v83, OS_LOG_TYPE_INFO, "Managed configuration has disabled FaceTime, we're ignoring this", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog())
            _IMAlwaysLog();
        }
        if (MarcoShouldLogCheckpoints())
          MarcoNoteCheckpoint();
      }
      MarcoEndSession();
      return;
    }
    if (IMOSLoggingEnabled())
    {
      v81 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229238000, v81, OS_LOG_TYPE_INFO, "This is an invitation from ourselves. Ignoring it", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
  }
}

- (void)handler:(id)a3 sessionAccepted:(id)a4 topic:(id)a5 peerID:(id)a6 peerCN:(id)a7 peerPushToken:(id)a8 peerNATType:(id)a9 peerBlob:(id)a10 peerNatIP:(id)a11 relayType:(id)a12 relayConnectionID:(id)a13 relayTransactionIDAlloc:(id)a14 relayTokenAllocReq:(id)a15 myRelayIP:(id)a16 myRelayPort:(id)a17 peerRelayIP:(id)a18 peerRelayPort:(id)a19 clientInfo:(id)a20 serviceData:(id)a21
{
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  int v35;
  NSObject *v36;
  const __CFString *v37;
  __CFString *v38;
  const __CFString *v39;
  __CFDictionary *v40;
  __CFDictionary *v41;
  void *v42;
  const void **v43;
  const void *v44;
  const void *v45;
  const void *v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  __CFDictionary *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  int *v57;
  __CFDictionary *v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  const char *v63;
  const char *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  __CFString *v69;
  const char *v70;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  id v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v78 = "-[FaceTimeServiceSession handler:sessionAccepted:topic:peerID:peerCN:peerPushToken:peerNATType:peerBlob:peer"
            "NatIP:relayType:relayConnectionID:relayTransactionIDAlloc:relayTokenAllocReq:myRelayIP:myRelayPort:peerRelay"
            "IP:peerRelayPort:clientInfo:serviceData:]";
      v79 = 2112;
      v80 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
      _os_log_impl(&dword_229238000, v25, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
    v63 = "-[FaceTimeServiceSession handler:sessionAccepted:topic:peerID:peerCN:peerPushToken:peerNATType:peerBlob:peerNa"
          "tIP:relayType:relayConnectionID:relayTransactionIDAlloc:relayTokenAllocReq:myRelayIP:myRelayPort:peerRelayIP:p"
          "eerRelayPort:clientInfo:serviceData:]";
    v67 = v26;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
      v63 = "-[FaceTimeServiceSession handler:sessionAccepted:topic:peerID:peerCN:peerPushToken:peerNATType:peerBlob:peer"
            "NatIP:relayType:relayConnectionID:relayTransactionIDAlloc:relayTokenAllocReq:myRelayIP:myRelayPort:peerRelay"
            "IP:peerRelayPort:clientInfo:serviceData:]";
      v67 = v27;
      _IMAlwaysLog();
    }
  }
  if (-[FaceTimeServiceSession _checkBadPushToken:](self, "_checkBadPushToken:", a8, v63, v67))
  {
    v28 = objc_msgSend(a4, "__imHexString");
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v29 = (void *)objc_msgSend((id)qword_253E79928, "allValues");
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v74;
LABEL_10:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v74 != v31)
          objc_enumerationMutation(v29);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * v32), "objectForKey:", v28))
          break;
        if (v30 == ++v32)
        {
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
          if (v30)
            goto LABEL_10;
          goto LABEL_16;
        }
      }
    }
    else
    {
LABEL_16:
      if (-[FaceTimeServiceSession _hasOutgoingInvitationInFlight](self, "_hasOutgoingInvitationInFlight"))
      {
        if (IMOSLoggingEnabled())
        {
          v33 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v78 = (const char *)v28;
            v79 = 2112;
            v80 = (uint64_t)a4;
            _os_log_impl(&dword_229238000, v33, OS_LOG_TYPE_INFO, "Delaying accept for conference ID: %@  (token: %@)", buf, 0x16u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog())
            _IMAlwaysLog();
        }
        im_dispatch_after();
        return;
      }
    }
    if ((sub_22924CDF4(a20) & 1) != 0
      || -[FaceTimeServiceSession _hasPeersForPeerID:conferenceID:](self, "_hasPeersForPeerID:conferenceID:", a6, v28))
    {
      v70 = -[FaceTimeServiceSession _displayIDForPeerID:conferenceID:](self, "_displayIDForPeerID:conferenceID:", a6, v28);
      v34 = -[FaceTimeServiceSession _pushTokensForPeerID:conferenceID:](self, "_pushTokensForPeerID:conferenceID:", a6, v28);
      v35 = objc_msgSend(a5, "isEqualToString:", CFSTR("com.apple.private.ac"));
      if (IMOSLoggingEnabled())
      {
        v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = CFSTR("video");
          *(_DWORD *)buf = 138412802;
          v78 = v70;
          v79 = 2112;
          if (v35)
            v37 = CFSTR("audio");
          v80 = (uint64_t)a6;
          v81 = 2112;
          v82 = (id)v37;
          _os_log_impl(&dword_229238000, v36, OS_LOG_TYPE_INFO, "Received accept push from: %@ (%@)   %@", buf, 0x20u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v38 = v35 ? CFSTR("audio") : CFSTR("video");
        v68 = a6;
        v69 = v38;
        v64 = v70;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v68 = a6;
          v69 = v38;
          v64 = v70;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        if (v35)
          v39 = CFSTR("audio");
        else
          v39 = CFSTR("video");
        v68 = a6;
        v69 = (__CFString *)v39;
        v64 = v70;
        MarcoNoteCheckpoint();
      }
      if ((objc_msgSend(v34, "containsObject:", a8, v64, v68, v69) & 1) != 0)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BE508D0], "sharedInstance"), "isScreenLocked");
        FTAWDLogCallAcceptReceived();
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v28), CFSTR("ConferenceID"));
        PLLogRegisteredEvent();
        v40 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        v41 = v40;
        if (a10)
          CFDictionarySetValue(v40, (const void *)*MEMORY[0x24BE50A78], a10);
        if (a7)
          CFDictionarySetValue(v41, (const void *)*MEMORY[0x24BE50A58], a7);
        if (a9)
          CFDictionarySetValue(v41, (const void *)*MEMORY[0x24BE50A98], a9);
        v42 = sub_22924CED8(a20);
        v43 = (const void **)MEMORY[0x24BE50AE8];
        if (v42)
          CFDictionarySetValue(v41, (const void *)*MEMORY[0x24BE50AE8], v42);
        v44 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", sub_22924CDF4(a20));
        if (v44)
          CFDictionarySetValue(v41, (const void *)*MEMORY[0x24BE50A60], v44);
        v45 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", sub_22924D0A8(a20));
        if (v45)
          CFDictionarySetValue(v41, (const void *)*MEMORY[0x24BE50A70], v45);
        v46 = (const void *)sub_22924D18C(a20);
        if (v46)
          CFDictionarySetValue(v41, (const void *)*MEMORY[0x24BE50AE0], v46);
        v47 = sub_22924D24C(a20);
        if (v47)
          CFDictionarySetValue(v41, (const void *)*MEMORY[0x24BE50AC8], v47);
        if (IMOSLoggingEnabled())
        {
          v48 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v78 = (const char *)v41;
            _os_log_impl(&dword_229238000, v48, OS_LOG_TYPE_INFO, "Response Dictionary : %@", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          v65 = v41;
          _IMLoggingLog();
          if (_IMWillLog())
          {
            v65 = v41;
            _IMAlwaysLog();
          }
        }
        if (a12)
        {
          if (IMOSLoggingEnabled())
          {
            v49 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v78 = (const char *)a12;
              _os_log_impl(&dword_229238000, v49, OS_LOG_TYPE_INFO, "Accept also had inline relay request for relay type: %@", buf, 0xCu);
            }
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            v65 = a12;
            _IMLoggingLog();
            if (_IMWillLog())
            {
              v65 = a12;
              _IMAlwaysLog();
            }
          }
          if (MarcoShouldLogCheckpoints())
          {
            v65 = a12;
            MarcoNoteCheckpoint();
          }
          v50 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
          CFDictionarySetValue(v50, (const void *)*MEMORY[0x24BE50640], a12);
          if (a13)
            CFDictionarySetValue(v50, (const void *)*MEMORY[0x24BE505B0], a13);
          if (a14)
            CFDictionarySetValue(v50, (const void *)*MEMORY[0x24BE50638], a14);
          if (a15)
            CFDictionarySetValue(v50, (const void *)*MEMORY[0x24BE50630], a15);
          if (a6)
            CFDictionarySetValue(v50, (const void *)*MEMORY[0x24BE505B8], a6);
          if (a18)
            CFDictionarySetValue(v50, (const void *)*MEMORY[0x24BE505D0], a18);
          if (a19)
            CFDictionarySetValue(v50, (const void *)*MEMORY[0x24BE505E8], a19);
          if (a16)
            CFDictionarySetValue(v50, (const void *)*MEMORY[0x24BE50610], a16);
          if (a17)
            CFDictionarySetValue(v50, (const void *)*MEMORY[0x24BE50628], a17);
          if (v50)
            CFDictionarySetValue(v41, (const void *)*MEMORY[0x24BE50A80], v50);

        }
        v51 = (void *)MEMORY[0x24BDBCE70];
        v52 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0, v65);
        v53 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
        v54 = -[__CFDictionary plistData](v41, "plistData");
        v55 = objc_msgSend(v51, "dictionaryWithObjectsAndKeys:", v52, *MEMORY[0x24BE50AD0], v53, *MEMORY[0x24BE50AF8], v54, *MEMORY[0x24BE50AD8], 0);
        if (IMOSLoggingEnabled())
        {
          v56 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v78 = (const char *)v55;
            _os_log_impl(&dword_229238000, v56, OS_LOG_TYPE_INFO, "Generated Properties: %@", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          v66 = v55;
          _IMLoggingLog();
          if (_IMWillLog())
          {
            v66 = v55;
            _IMAlwaysLog();
          }
        }
        v57 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterVCInvocationQueue;
        if (v35)
          v57 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterACInvocationQueue;
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v57), "account:conference:receivedResponseToInvitationFrom:properties:", -[IMDServiceSession accountID](self, "accountID", v66), objc_msgSend(a4, "__imHexString"), sub_2292432C8(v70), v55);
        v58 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        v59 = sub_22924CED8(a20);
        if (v59)
          CFDictionarySetValue(v58, *v43, v59);
        -[FaceTimeServiceSession _cancelOtherInvitesForPeerID:skipPairs:properties:conference:reason:](self, "_cancelOtherInvitesForPeerID:skipPairs:properties:conference:reason:", a6, sub_22924E3A0((uint64_t)a6, (uint64_t)a8), v58, objc_msgSend(a4, "__imHexString"), &unk_24F1F26B0);
        -[FaceTimeServiceSession _retargetPeerID:displayID:pushToken:conferenceID:](self, "_retargetPeerID:displayID:pushToken:conferenceID:", a6, 0, a8, objc_msgSend(a4, "__imHexString"));

        return;
      }
      if (IMOSLoggingEnabled())
      {
        v60 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v78 = (const char *)a8;
          v79 = 2112;
          v80 = (uint64_t)v34;
          v81 = 2112;
          v82 = a6;
          _os_log_impl(&dword_229238000, v60, OS_LOG_TYPE_INFO, "Response from token (%@) not in this conference set: %@ (%@)", buf, 0x20u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog())
          _IMAlwaysLog();
      }
      if (MarcoShouldLogCheckpoints())
        MarcoNoteCheckpoint();
      if (IMOSLoggingEnabled())
      {
        v61 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v78 = (const char *)a8;
          v79 = 2112;
          v80 = (uint64_t)v34;
          v81 = 2112;
          v82 = a6;
          _os_log_impl(&dword_229238000, v61, OS_LOG_TYPE_INFO, "Response from token (%@) not in this conference set: %@ (%@)", buf, 0x20u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog())
LABEL_123:
          _IMAlwaysLog();
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v62 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v78 = (const char *)a6;
          v79 = 2112;
          v80 = v28;
          _os_log_impl(&dword_229238000, v62, OS_LOG_TYPE_INFO, "Ignoring this accept, no peers with peerID %@ in conferenceID %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog())
          goto LABEL_123;
      }
    }
  }
}

- (void)handler:(id)a3 sessionRejected:(id)a4 topic:(id)a5 peerID:(id)a6 peerPushToken:(id)a7 reason:(id)a8 clientInfo:(id)a9 serviceData:(id)a10
{
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  __CFDictionary *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  int *v35;
  __CFDictionary *v36;
  void *v37;
  unsigned int v38;
  NSObject *v39;
  NSObject *v40;
  const char *v41;
  const char *v42;
  __CFDictionary *v43;
  id v44;
  uint64_t v45;
  id v46;
  const char *v47;
  id v48;
  int v49;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v57 = "-[FaceTimeServiceSession handler:sessionRejected:topic:peerID:peerPushToken:reason:clientInfo:serviceData:]";
      v58 = 2112;
      v59 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
      _os_log_impl(&dword_229238000, v14, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
    v41 = "-[FaceTimeServiceSession handler:sessionRejected:topic:peerID:peerPushToken:reason:clientInfo:serviceData:]";
    v45 = v15;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
      v41 = "-[FaceTimeServiceSession handler:sessionRejected:topic:peerID:peerPushToken:reason:clientInfo:serviceData:]";
      v45 = v16;
      _IMAlwaysLog();
    }
  }
  v17 = objc_msgSend(a4, "__imHexString", v41, v45);
  v49 = objc_msgSend(a5, "isEqualToString:", CFSTR("com.apple.private.ac"));
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v18 = (void *)objc_msgSend((id)qword_253E79928, "allValues");
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v53;
LABEL_9:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v53 != v20)
        objc_enumerationMutation(v18);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v21), "objectForKey:", v17))
        break;
      if (v19 == ++v21)
      {
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
        if (v19)
          goto LABEL_9;
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    if (-[FaceTimeServiceSession _hasOutgoingInvitationInFlight](self, "_hasOutgoingInvitationInFlight"))
    {
      im_dispatch_after();
      return;
    }
  }
  if (-[FaceTimeServiceSession _hasPeersForPeerID:conferenceID:](self, "_hasPeersForPeerID:conferenceID:", a6, v17))
  {
    v22 = -[FaceTimeServiceSession _displayIDForPeerID:conferenceID:](self, "_displayIDForPeerID:conferenceID:", a6, v17);
    if (IMOSLoggingEnabled())
    {
      v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v57 = v22;
        v58 = 2112;
        v59 = (uint64_t)a6;
        _os_log_impl(&dword_229238000, v23, OS_LOG_TYPE_INFO, "Received reject push from: %@  (%@)", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v42 = v22;
      v46 = a6;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v42 = v22;
        v46 = a6;
        _IMAlwaysLog();
      }
    }
    if (MarcoShouldLogCheckpoints())
    {
      v42 = v22;
      v46 = a6;
      MarcoNoteCheckpoint();
    }
    if (IMOSLoggingEnabled())
    {
      v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v57 = v22;
        v58 = 2112;
        v59 = (uint64_t)a6;
        _os_log_impl(&dword_229238000, v24, OS_LOG_TYPE_INFO, "Received reject push from: %@  (%@)", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v42 = v22;
      v46 = a6;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v42 = v22;
        v46 = a6;
        _IMAlwaysLog();
      }
    }
    v25 = -[FaceTimeServiceSession _pushTokensForPeerID:conferenceID:](self, "_pushTokensForPeerID:conferenceID:", a6, v17, v42, v46);
    if ((objc_msgSend(v25, "containsObject:", a7) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v17), CFSTR("ConferenceID"));
      PLLogRegisteredEvent();
      v26 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v27 = sub_22924CED8(a9);
      if (v27)
        CFDictionarySetValue(v26, (const void *)*MEMORY[0x24BE50AE8], v27);
      if (IMOSLoggingEnabled())
      {
        v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v57 = (const char *)v26;
          _os_log_impl(&dword_229238000, v28, OS_LOG_TYPE_INFO, "Response Dictionary : %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v43 = v26;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v43 = v26;
          _IMAlwaysLog();
        }
      }
      v29 = (void *)MEMORY[0x24BDBCE70];
      v30 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4, v43);
      v31 = -[__CFDictionary plistData](v26, "plistData");
      v32 = *MEMORY[0x24BE50AD0];
      v33 = (void *)objc_msgSend(v29, "dictionaryWithObjectsAndKeys:", a8, *MEMORY[0x24BE50AD0], v30, *MEMORY[0x24BE50AF8], v31, *MEMORY[0x24BE50AD8], 0);
      if (IMOSLoggingEnabled())
      {
        v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v57 = (const char *)a8;
          v58 = 2112;
          v59 = (uint64_t)v22;
          v60 = 2112;
          v61 = a7;
          _os_log_impl(&dword_229238000, v34, OS_LOG_TYPE_INFO, "Reject response: %@   from peer: %@   token: %@", buf, 0x20u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v47 = v22;
        v48 = a7;
        v44 = a8;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v47 = v22;
          v48 = a7;
          v44 = a8;
          _IMAlwaysLog();
        }
      }
      v35 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterVCInvocationQueue;
      if (v49)
        v35 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterACInvocationQueue;
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v35), "account:conference:receivedResponseToInvitationFrom:properties:", -[IMDServiceSession accountID](self, "accountID", v44, v47, v48), objc_msgSend(a4, "__imHexString"), sub_2292432C8(v22), v33);
      v36 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v37 = sub_22924CED8(a9);
      if (v37)
        CFDictionarySetValue(v36, (const void *)*MEMORY[0x24BE50AE8], v37);
      v38 = objc_msgSend((id)objc_msgSend(v33, "objectForKey:", v32), "intValue");
      if (v38 > 0xB || ((1 << v38) & 0x830) == 0)
        -[FaceTimeServiceSession _cancelOtherInvitesForPeerID:skipPairs:properties:conference:reason:](self, "_cancelOtherInvitesForPeerID:skipPairs:properties:conference:reason:", a6, sub_22924E3A0((uint64_t)a6, (uint64_t)a7), v36, objc_msgSend(a4, "__imHexString"), &unk_24F1F26C8);

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v40 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v57 = (const char *)a7;
          v58 = 2112;
          v59 = (uint64_t)v25;
          v60 = 2112;
          v61 = a6;
          _os_log_impl(&dword_229238000, v40, OS_LOG_TYPE_INFO, "Response from token (%@) not in this conference set: %@ (%@)", buf, 0x20u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog())
          _IMAlwaysLog();
      }
      if (MarcoShouldLogCheckpoints())
        MarcoNoteCheckpoint();
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v57 = (const char *)a6;
        v58 = 2112;
        v59 = v17;
        _os_log_impl(&dword_229238000, v39, OS_LOG_TYPE_INFO, "Ignoring this reject, no peers with peerID %@ conferenceID %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
  }
}

- (void)handler:(id)a3 sessionCancelled:(id)a4 topic:(id)a5 peerID:(id)a6 reason:(id)a7 clientInfo:(id)a8 serviceData:(id)a9
{
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  NSObject *v21;
  __CFDictionary *v22;
  void *v23;
  const void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  const char *v31;
  const char *v32;
  __CFDictionary *v33;
  uint64_t v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[FaceTimeServiceSession handler:sessionCancelled:topic:peerID:reason:clientInfo:serviceData:]";
      v38 = 2112;
      v39 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
      _os_log_impl(&dword_229238000, v15, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
    v31 = "-[FaceTimeServiceSession handler:sessionCancelled:topic:peerID:reason:clientInfo:serviceData:]";
    v34 = v16;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
      v31 = "-[FaceTimeServiceSession handler:sessionCancelled:topic:peerID:reason:clientInfo:serviceData:]";
      v34 = v17;
      _IMAlwaysLog();
    }
  }
  v18 = objc_msgSend(a4, "__imHexString", v31, v34);
  v19 = objc_msgSend(a5, "isEqualToString:", CFSTR("com.apple.private.ac"));
  if (-[FaceTimeServiceSession _hasPeersForPeerID:conferenceID:](self, "_hasPeersForPeerID:conferenceID:", a6, v18))
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v18), CFSTR("ConferenceID"));
    PLLogRegisteredEvent();
    v20 = -[FaceTimeServiceSession _displayIDForPeerID:conferenceID:](self, "_displayIDForPeerID:conferenceID:", a6, v18);
    if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v37 = v20;
        v38 = 2112;
        v39 = (uint64_t)a6;
        _os_log_impl(&dword_229238000, v21, OS_LOG_TYPE_INFO, "Received cancel push from: %@ (%@)", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v32 = v20;
      v35 = a6;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v32 = v20;
        v35 = a6;
        _IMAlwaysLog();
      }
    }
    if (MarcoShouldLogCheckpoints())
    {
      v32 = v20;
      v35 = a6;
      MarcoNoteCheckpoint();
    }
    v22 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v23 = sub_22924CED8(a8);
    if (v23)
      CFDictionarySetValue(v22, (const void *)*MEMORY[0x24BE50AE8], v23);
    v24 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a7, "intValue", v23, v32, v35));
    if (v24)
      CFDictionarySetValue(v22, (const void *)*MEMORY[0x24BE50AD0], v24);
    if (IMOSLoggingEnabled())
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v37 = (const char *)v22;
        _os_log_impl(&dword_229238000, v25, OS_LOG_TYPE_INFO, "Response Dictionary : %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v33 = v22;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v33 = v22;
        _IMAlwaysLog();
      }
    }
    v26 = (void *)MEMORY[0x24BDBCE70];
    v27 = -[__CFDictionary plistData](v22, "plistData", v33);
    v28 = objc_msgSend(v26, "dictionaryWithObjectsAndKeys:", v27, *MEMORY[0x24BE50AD8], 0);
    if (v19)
      v29 = -[IMDServiceSession broadcasterForACConferenceListeners](self, "broadcasterForACConferenceListeners");
    else
      v29 = -[IMDServiceSession broadcasterForVCConferenceListeners](self, "broadcasterForVCConferenceListeners");
    objc_msgSend(v29, "account:conference:receivedCancelInvitationFrom:properties:", -[IMDServiceSession accountID](self, "accountID"), v18, sub_2292432C8(v20), v28);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v37 = (const char *)a6;
        v38 = 2112;
        v39 = v18;
        _os_log_impl(&dword_229238000, v30, OS_LOG_TYPE_INFO, "Ignoring this cancel, no peers with peerID %@ conferenceID %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
  }
}

- (void)handler:(id)a3 incomingMessage:(id)a4 topic:(id)a5 peerID:(id)a6 reason:(id)a7 clientInfo:(id)a8 serviceData:(id)a9
{
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  id v26;
  NSObject *v27;
  const char *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint8_t buf[4];
  _BYTE v35[18];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v35 = "-[FaceTimeServiceSession handler:incomingMessage:topic:peerID:reason:clientInfo:serviceData:]";
      *(_WORD *)&v35[8] = 2112;
      *(_QWORD *)&v35[10] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
      _os_log_impl(&dword_229238000, v15, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
    v28 = "-[FaceTimeServiceSession handler:incomingMessage:topic:peerID:reason:clientInfo:serviceData:]";
    v31 = v16;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
      v28 = "-[FaceTimeServiceSession handler:incomingMessage:topic:peerID:reason:clientInfo:serviceData:]";
      v31 = v17;
      _IMAlwaysLog();
    }
  }
  v18 = objc_msgSend(a4, "__imHexString", v28, v31);
  v19 = sub_22924CED8(a8);
  v20 = objc_msgSend(a5, "isEqualToString:", CFSTR("com.apple.private.ac"));
  if (-[FaceTimeServiceSession _hasPeersForPeerID:conferenceID:](self, "_hasPeersForPeerID:conferenceID:", a6, v18))
  {
    v21 = -[FaceTimeServiceSession _displayIDForPeerID:conferenceID:](self, "_displayIDForPeerID:conferenceID:", a6, v18);
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v35 = v21;
        *(_WORD *)&v35[8] = 2112;
        *(_QWORD *)&v35[10] = a6;
        _os_log_impl(&dword_229238000, v22, OS_LOG_TYPE_INFO, "Received generic message push from: %@ (%@)", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v29 = v21;
      v32 = a6;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v29 = v21;
        v32 = a6;
        _IMAlwaysLog();
      }
    }
    if (MarcoShouldLogCheckpoints())
    {
      v29 = v21;
      v32 = a6;
      MarcoNoteCheckpoint();
    }
    v23 = objc_msgSend(a8, "objectForKey:", CFSTR("info"), v29, v32);
    if (IMOSLoggingEnabled())
    {
      v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = objc_msgSend(a7, "intValue");
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v35 = v25;
        *(_WORD *)&v35[4] = 2112;
        *(_QWORD *)&v35[6] = v23;
        _os_log_impl(&dword_229238000, v24, OS_LOG_TYPE_INFO, "Incoming message type: %d   info: %@", buf, 0x12u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v30 = objc_msgSend(a7, "intValue");
      v33 = v23;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v30 = objc_msgSend(a7, "intValue", v30, v23);
        v33 = v23;
        _IMAlwaysLog();
      }
    }
    if (v20)
      v26 = -[IMDServiceSession broadcasterForACConferenceListeners](self, "broadcasterForACConferenceListeners");
    else
      v26 = -[IMDServiceSession broadcasterForVCConferenceListeners](self, "broadcasterForVCConferenceListeners");
    objc_msgSend(v26, "account:conference:receivedAVMessage:from:sessionID:userInfo:", -[IMDServiceSession accountID](self, "accountID", v30, v33), v18, objc_msgSend(a7, "intValue"), sub_2292432C8(v21), objc_msgSend(v19, "unsignedIntValue"), v23);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v35 = a6;
        *(_WORD *)&v35[8] = 2112;
        *(_QWORD *)&v35[10] = v18;
        _os_log_impl(&dword_229238000, v27, OS_LOG_TYPE_INFO, "Ignoring this message, no peers with peerID %@ conferenceID %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
  }
}

- (void)handler:(id)a3 relayInitiated:(id)a4 topic:(id)a5 peerID:(id)a6 peerPushToken:(id)a7 relayType:(id)a8 relayConnectionID:(id)value relayTransactionIDAlloc:(id)a10 relayTokenAllocReq:(id)a11 relayCandidateID:(id)a12 myRelayIP:(id)a13 myRelayPort:(id)a14 peerRelayIP:(id)a15 peerRelayPort:(id)a16 clientInfo:(id)a17 serviceData:(id)a18
{
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  const char *v29;
  NSObject *v30;
  id v31;
  __CFDictionary *v32;
  __CFDictionary *v33;
  int *v34;
  NSObject *v35;
  NSObject *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[FaceTimeServiceSession handler:relayInitiated:topic:peerID:peerPushToken:relayType:relayConnectionID:relay"
            "TransactionIDAlloc:relayTokenAllocReq:relayCandidateID:myRelayIP:myRelayPort:peerRelayIP:peerRelayPort:clien"
            "tInfo:serviceData:]";
      v43 = 2112;
      v44 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
      _os_log_impl(&dword_229238000, v24, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
    v37 = "-[FaceTimeServiceSession handler:relayInitiated:topic:peerID:peerPushToken:relayType:relayConnectionID:relayTr"
          "ansactionIDAlloc:relayTokenAllocReq:relayCandidateID:myRelayIP:myRelayPort:peerRelayIP:peerRelayPort:clientInfo:serviceData:]";
    v39 = v25;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
      v37 = "-[FaceTimeServiceSession handler:relayInitiated:topic:peerID:peerPushToken:relayType:relayConnectionID:relay"
            "TransactionIDAlloc:relayTokenAllocReq:relayCandidateID:myRelayIP:myRelayPort:peerRelayIP:peerRelayPort:clien"
            "tInfo:serviceData:]";
      v39 = v26;
      _IMAlwaysLog();
    }
  }
  if (-[FaceTimeServiceSession _checkBadPushToken:](self, "_checkBadPushToken:", a7, v37, v39))
  {
    v27 = objc_msgSend(a4, "__imHexString");
    v28 = objc_msgSend(a5, "isEqualToString:", CFSTR("com.apple.private.ac"));
    if (-[FaceTimeServiceSession _hasPeersForPeerID:conferenceID:](self, "_hasPeersForPeerID:conferenceID:", a6, v27))
    {
      v29 = -[FaceTimeServiceSession _displayIDForPeerID:conferenceID:](self, "_displayIDForPeerID:conferenceID:", a6, v27);
      if (IMOSLoggingEnabled())
      {
        v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v42 = v29;
          v43 = 2112;
          v44 = (uint64_t)a6;
          _os_log_impl(&dword_229238000, v30, OS_LOG_TYPE_INFO, "Received relay initate push from: %@ (%@)", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v38 = v29;
        v40 = a6;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v38 = v29;
          v40 = a6;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        v38 = v29;
        v40 = a6;
        MarcoNoteCheckpoint();
      }
      v31 = -[FaceTimeServiceSession _pushTokensForPeerID:conferenceID:](self, "_pushTokensForPeerID:conferenceID:", a6, v27, v38, v40);
      if ((objc_msgSend(v31, "containsObject:", a7) & 1) != 0)
      {
        -[NSMutableArray containsObject:](self->_initiatedConferences, "containsObject:", v27);
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BE508D0], "sharedInstance"), "isScreenLocked");
        FTAWDLogCallRelayInitiateReceived();
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v27), CFSTR("ConferenceID"));
        PLLogRegisteredEvent();
        v32 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        v33 = v32;
        if (a8)
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE50640], a8);
        if (value)
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x24BE505B0], value);
        if (a10)
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x24BE50638], a10);
        if (a11)
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x24BE50630], a11);
        if (a6)
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x24BE505B8], a6);
        if (a15)
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x24BE505D0], a15);
        if (a16)
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x24BE505E8], a16);
        if (a13)
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x24BE50610], a13);
        if (a14)
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x24BE50628], a14);
        if (a12)
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x24BE505F8], a12);
        v34 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterVCInvocationQueue;
        if (v28)
          v34 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterACInvocationQueue;
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v34), "account:relay:handleInitate:fromPerson:", -[IMDServiceSession accountID](self, "accountID"), objc_msgSend(a4, "__imHexString"), v33, sub_2292432C8(v29));
        -[FaceTimeServiceSession _retargetPeerID:displayID:pushToken:conferenceID:](self, "_retargetPeerID:displayID:pushToken:conferenceID:", a6, 0, a7, objc_msgSend(a4, "__imHexString"));

      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v36 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v42 = (const char *)a7;
            v43 = 2112;
            v44 = (uint64_t)v31;
            v45 = 2112;
            v46 = a6;
            _os_log_impl(&dword_229238000, v36, OS_LOG_TYPE_INFO, "Response from token (%@) not in this conference set: %@ (%@)", buf, 0x20u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog())
            _IMAlwaysLog();
        }
        if (MarcoShouldLogCheckpoints())
          MarcoNoteCheckpoint();
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v42 = (const char *)a6;
          v43 = 2112;
          v44 = v27;
          _os_log_impl(&dword_229238000, v35, OS_LOG_TYPE_INFO, "Ignoring this relay initiate, no peers with peerID %@ in conferenceID %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog())
          _IMAlwaysLog();
      }
    }
  }
}

- (void)handler:(id)a3 relayUpdated:(id)a4 topic:(id)a5 peerID:(id)a6 peerPushToken:(id)a7 relayType:(id)a8 relayConnectionID:(id)value relayTransactionIDChannelBind:(id)a10 relayTokenChannelBind:(id)a11 relayCandidateID:(id)a12 relayBlob:(id)a13 peerRelayNATIP:(id)a14 peerRelayNATPort:(id)a15 clientInfo:(id)a16 serviceData:(id)a17
{
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  id v29;
  int v30;
  __CFDictionary *v31;
  __CFDictionary *v32;
  int *v33;
  NSObject *v34;
  NSObject *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[FaceTimeServiceSession handler:relayUpdated:topic:peerID:peerPushToken:relayType:relayConnectionID:relayTr"
            "ansactionIDChannelBind:relayTokenChannelBind:relayCandidateID:relayBlob:peerRelayNATIP:peerRelayNATPort:clie"
            "ntInfo:serviceData:]";
      v42 = 2112;
      v43 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
      _os_log_impl(&dword_229238000, v23, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
    v36 = "-[FaceTimeServiceSession handler:relayUpdated:topic:peerID:peerPushToken:relayType:relayConnectionID:relayTran"
          "sactionIDChannelBind:relayTokenChannelBind:relayCandidateID:relayBlob:peerRelayNATIP:peerRelayNATPort:clientIn"
          "fo:serviceData:]";
    v38 = v24;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
      v36 = "-[FaceTimeServiceSession handler:relayUpdated:topic:peerID:peerPushToken:relayType:relayConnectionID:relayTr"
            "ansactionIDChannelBind:relayTokenChannelBind:relayCandidateID:relayBlob:peerRelayNATIP:peerRelayNATPort:clie"
            "ntInfo:serviceData:]";
      v38 = v25;
      _IMAlwaysLog();
    }
  }
  if (-[FaceTimeServiceSession _checkBadPushToken:](self, "_checkBadPushToken:", a7, v36, v38))
  {
    v26 = objc_msgSend(a4, "__imHexString");
    if (-[FaceTimeServiceSession _hasPeersForPeerID:conferenceID:](self, "_hasPeersForPeerID:conferenceID:", a6, v26))
    {
      v27 = -[FaceTimeServiceSession _displayIDForPeerID:conferenceID:](self, "_displayIDForPeerID:conferenceID:", a6, v26);
      if (IMOSLoggingEnabled())
      {
        v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v41 = v27;
          v42 = 2112;
          v43 = (uint64_t)a6;
          _os_log_impl(&dword_229238000, v28, OS_LOG_TYPE_INFO, "Received relay update push from: %@ (%@)", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v37 = v27;
        v39 = a6;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v37 = v27;
          v39 = a6;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        v37 = v27;
        v39 = a6;
        MarcoNoteCheckpoint();
      }
      v29 = -[FaceTimeServiceSession _pushTokensForPeerID:conferenceID:](self, "_pushTokensForPeerID:conferenceID:", a6, v26, v37, v39);
      if ((objc_msgSend(v29, "containsObject:", a7) & 1) != 0)
      {
        -[NSMutableArray containsObject:](self->_initiatedConferences, "containsObject:", v26);
        v30 = objc_msgSend(a5, "isEqualToString:", CFSTR("com.apple.private.ac"));
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BE508D0], "sharedInstance"), "isScreenLocked");
        FTAWDLogCallRelayUpdatedReceived();
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v26), CFSTR("ConferenceID"));
        PLLogRegisteredEvent();
        v31 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        v32 = v31;
        if (a8)
          CFDictionarySetValue(v31, (const void *)*MEMORY[0x24BE50640], a8);
        if (value)
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE505B0], value);
        if (a10)
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE50638], a10);
        if (a11)
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE50630], a11);
        if (a6)
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE505B8], a6);
        if (a14)
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE505D8], a14);
        if (a15)
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE505E0], a15);
        if (a13)
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE505F0], a13);
        if (a12)
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE505F8], a12);
        v33 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterVCInvocationQueue;
        if (v30)
          v33 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterACInvocationQueue;
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v33), "account:relay:handleUpdate:fromPerson:", -[IMDServiceSession accountID](self, "accountID"), objc_msgSend(a4, "__imHexString"), v32, sub_2292432C8(v27));
        -[FaceTimeServiceSession _retargetPeerID:displayID:pushToken:conferenceID:](self, "_retargetPeerID:displayID:pushToken:conferenceID:", a6, 0, a7, objc_msgSend(a4, "__imHexString"));

      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v35 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v41 = (const char *)a7;
            v42 = 2112;
            v43 = (uint64_t)v29;
            v44 = 2112;
            v45 = a6;
            _os_log_impl(&dword_229238000, v35, OS_LOG_TYPE_INFO, "Response from token (%@) not in this conference set: %@ (%@)", buf, 0x20u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog())
            _IMAlwaysLog();
        }
        if (MarcoShouldLogCheckpoints())
          MarcoNoteCheckpoint();
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v41 = (const char *)a6;
          v42 = 2112;
          v43 = v26;
          _os_log_impl(&dword_229238000, v34, OS_LOG_TYPE_INFO, "Ignoring this relay update, no peers with peerID %@ in conferenceID %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog())
          _IMAlwaysLog();
      }
    }
  }
}

- (void)handler:(id)a3 relayCancelled:(id)a4 topic:(id)a5 peerID:(id)a6 relayType:(id)a7 relayTokenAllocReq:(id)a8 relayConnectionID:(id)value relayTransactionIDAlloc:(id)a10 relayCandidateID:(id)a11 myRelayIP:(id)a12 myRelayPort:(id)a13 peerRelayIP:(id)a14 peerRelayPort:(id)a15 reason:(id)a16 clientInfo:(id)a17 serviceData:(id)a18
{
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  const char *v29;
  NSObject *v30;
  __CFDictionary *v31;
  __CFDictionary *v32;
  int *v33;
  NSObject *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[FaceTimeServiceSession handler:relayCancelled:topic:peerID:relayType:relayTokenAllocReq:relayConnectionID:"
            "relayTransactionIDAlloc:relayCandidateID:myRelayIP:myRelayPort:peerRelayIP:peerRelayPort:reason:clientInfo:serviceData:]";
      v41 = 2112;
      v42 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
      _os_log_impl(&dword_229238000, v24, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
    v35 = "-[FaceTimeServiceSession handler:relayCancelled:topic:peerID:relayType:relayTokenAllocReq:relayConnectionID:re"
          "layTransactionIDAlloc:relayCandidateID:myRelayIP:myRelayPort:peerRelayIP:peerRelayPort:reason:clientInfo:serviceData:]";
    v37 = v25;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionToken: %@, topic: %@"), a4, a5);
      v35 = "-[FaceTimeServiceSession handler:relayCancelled:topic:peerID:relayType:relayTokenAllocReq:relayConnectionID:"
            "relayTransactionIDAlloc:relayCandidateID:myRelayIP:myRelayPort:peerRelayIP:peerRelayPort:reason:clientInfo:serviceData:]";
      v37 = v26;
      _IMAlwaysLog();
    }
  }
  v27 = objc_msgSend(a4, "__imHexString", v35, v37);
  v28 = objc_msgSend(a5, "isEqualToString:", CFSTR("com.apple.private.ac"));
  if (-[FaceTimeServiceSession _hasPeersForPeerID:conferenceID:](self, "_hasPeersForPeerID:conferenceID:", a6, v27))
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v27), CFSTR("ConferenceID"));
    PLLogRegisteredEvent();
    v29 = -[FaceTimeServiceSession _displayIDForPeerID:conferenceID:](self, "_displayIDForPeerID:conferenceID:", a6, v27);
    if (IMOSLoggingEnabled())
    {
      v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v40 = v29;
        v41 = 2112;
        v42 = (uint64_t)a6;
        _os_log_impl(&dword_229238000, v30, OS_LOG_TYPE_INFO, "Received relay cancel push from: %@ (%@)", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v36 = v29;
      v38 = a6;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v36 = v29;
        v38 = a6;
        _IMAlwaysLog();
      }
    }
    if (MarcoShouldLogCheckpoints())
    {
      v36 = v29;
      v38 = a6;
      MarcoNoteCheckpoint();
    }
    v31 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v32 = v31;
    if (a7)
      CFDictionarySetValue(v31, (const void *)*MEMORY[0x24BE50640], a7);
    if (a8)
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE50630], a8);
    if (value)
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE505B0], value);
    if (a10)
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE50638], a10);
    if (a11)
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE505F8], a11);
    if (a12)
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE50610], a12);
    if (a13)
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE50628], a13);
    if (a14)
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE505D0], a14);
    if (a15)
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE505E8], a15);
    if (a6)
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BE505B8], a6);
    v33 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterVCInvocationQueue;
    if (v28)
      v33 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterACInvocationQueue;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v33), "account:relay:handleCancel:fromPerson:", -[IMDServiceSession accountID](self, "accountID", v36, v38), objc_msgSend(a4, "__imHexString"), v32, sub_2292432C8(v29));

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v40 = (const char *)a6;
        v41 = 2112;
        v42 = v27;
        _os_log_impl(&dword_229238000, v34, OS_LOG_TYPE_INFO, "Ignoring this relay cancel, no peers with peerID %@ in conferenceID %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog())
        _IMAlwaysLog();
    }
  }
}

- (unint64_t)queue:(id)a3 optionsForInvocation:(id)a4
{
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v10;
  id v11;
  NSString *v12;
  uint8_t buf[4];
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = (const char *)objc_msgSend(a4, "selector");
  v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = NSStringFromSelector(v6);
    _os_log_impl(&dword_229238000, v7, OS_LOG_TYPE_DEFAULT, "Checking queue options for: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      v12 = NSStringFromSelector(v6);
      MarcoLog();
    }
    if (IMShouldLog())
    {
      v12 = NSStringFromSelector(v6);
      IMLogString();
    }
  }
  if ((objc_msgSend((id)qword_253E79930, "hasQueuedItems", v12) & 1) != 0)
  {
    v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229238000, v8, OS_LOG_TYPE_DEFAULT, "This should queue normally", buf, 2u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    return 1;
  }
  else
  {
    v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229238000, v10, OS_LOG_TYPE_DEFAULT, "This should just happen now!", buf, 2u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    if (self->_broadcasterACInvocationQueue == a3)
      v11 = -[IMDServiceSession broadcasterForACConferenceListeners](self, "broadcasterForACConferenceListeners");
    else
      v11 = -[IMDServiceSession broadcasterForVCConferenceListeners](self, "broadcasterForVCConferenceListeners");
    objc_msgSend(a3, "setTarget:", v11);
    return 16;
  }
}

- (BOOL)queue:(id)a3 shouldInvoke:(id)a4
{
  const char *v6;
  NSObject *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  NSString *v15;
  uint8_t buf[4];
  NSString *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (const char *)objc_msgSend(a4, "selector");
  v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = NSStringFromSelector(v6);
    _os_log_impl(&dword_229238000, v7, OS_LOG_TYPE_DEFAULT, "Checking to see if I can invoke: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      v15 = NSStringFromSelector(v6);
      MarcoLog();
    }
    if (IMShouldLog())
    {
      v15 = NSStringFromSelector(v6);
      IMLogString();
    }
  }
  v8 = objc_msgSend((id)qword_253E79930, "hasQueuedItems", v15);
  if ((v8 & 1) != 0)
  {
    v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend((id)qword_253E79930, "currentMessage");
      v11 = objc_msgSend((id)qword_253E79930, "queuedMessages");
      *(_DWORD *)buf = 138412546;
      v17 = (NSString *)v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_229238000, v9, OS_LOG_TYPE_DEFAULT, "Can't send yet, current delivery: %@ queued items: %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        objc_msgSend((id)qword_253E79930, "currentMessage");
        objc_msgSend((id)qword_253E79930, "queuedMessages");
        MarcoLog();
      }
      if (IMShouldLog())
      {
        objc_msgSend((id)qword_253E79930, "currentMessage");
        objc_msgSend((id)qword_253E79930, "queuedMessages");
        IMLogString();
      }
    }
  }
  else
  {
    v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229238000, v12, OS_LOG_TYPE_DEFAULT, "Looks good to go, i'll send it along", buf, 2u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    if (self->_broadcasterACInvocationQueue == a3)
      v13 = -[IMDServiceSession broadcasterForACConferenceListeners](self, "broadcasterForACConferenceListeners");
    else
      v13 = -[IMDServiceSession broadcasterForVCConferenceListeners](self, "broadcasterForVCConferenceListeners");
    objc_msgSend(a3, "setTarget:", v13);
  }
  return v8 ^ 1;
}

- (id)loggingName
{
  if (self->_loggingCategory)
    return self->_loggingCategory;
  else
    return CFSTR("FaceTime");
}

- (double)_messageTimeoutTimeForMessage:(id)a3
{
  double v3;
  double v4;
  int v5;
  uint64_t v6;

  objc_msgSend(a3, "timeout");
  v4 = v3;
  v5 = IMGetCachedDomainIntForKey();
  if (v5 < 1)
  {
    return (double)(uint64_t)v4;
  }
  else
  {
    v6 = v5;
    _IMWarn();
  }
  return (double)v6;
}

@end
