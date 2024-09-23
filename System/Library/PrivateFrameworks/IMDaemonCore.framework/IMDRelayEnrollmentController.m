@implementation IMDRelayEnrollmentController

- (IMDRelayEnrollmentController)initWithServiceDelegate:(id)a3 dispatchDelegate:(id)a4
{
  id v7;
  id v8;
  IMDRelayEnrollmentController *v9;
  IMDRelayEnrollmentController *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint8_t v19[16];
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)IMDRelayEnrollmentController;
  v9 = -[IMDRelayEnrollmentController init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceDelegate, a3);
    objc_storeStrong((id *)&v10->_dispatchDelegate, a4);
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Setting up push handler", v19, 2u);
      }

    }
    +[IMDRelayPushHandler sharedInstance](IMDRelayPushHandler, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addListener:", v10);

    +[IMDRelayPushHandler sharedInstance](IMDRelayPushHandler, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRegistered:", 1);

    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "...done", v19, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v10, sel__micEnabledStateDidChange_, CFSTR("com.apple.IMDaemonCore.IMDCKUtilities.MiCEnabledStateReturned"), 0);

    -[IMDRelayEnrollmentController _migrateSMSRelayForMICIfNeeded](v10, "_migrateSMSRelayForMICIfNeeded");
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[IMDRelayPushHandler sharedInstance](IMDRelayPushHandler, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListener:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)IMDRelayEnrollmentController;
  -[IMDRelayEnrollmentController dealloc](&v5, sel_dealloc);
}

- (void)enrollDeviceInSMSRelay:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = IMOSLoggingEnabled(v4);
  if (v4)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "SMS Service Session Received Request To Enroll %@ Into SMS Relay ", (uint8_t *)&v12, 0xCu);
      }

    }
    -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "idsDeviceFromUniqueID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "isHSATrusted");
    if ((_DWORD)v9)
    {
      if (IMOSLoggingEnabled(v9))
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v12 = 138412290;
          v13 = v8;
          _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Automatically enrolling HSA trusted device %@ ", (uint8_t *)&v12, 0xCu);
        }

      }
      -[IMDRelayEnrollmentController _addDeviceToAllowedSMSRelay:shouldSendApproval:](self, "_addDeviceToAllowedSMSRelay:shouldSendApproval:", v8, 1);
    }
    else
    {
      -[IMDRelayEnrollmentController _sendPinCodeToDeviceAndPromptForResponse:](self, "_sendPinCodeToDeviceAndPromptForResponse:", v4);
    }

  }
  else if (v5)
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "empty deviceID passed in", (uint8_t *)&v12, 2u);
    }

  }
}

- (void)unEnrollDeviceInSMSRelay:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = IMOSLoggingEnabled(v4);
  if (v4)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "SMS Service Session Received Request To Un Enroll %@ Into SMS Relay ", (uint8_t *)&v11, 0xCu);
      }

    }
    -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "idsDeviceFromUniqueID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMDRelayEnrollmentController _removeDeviceFromAllowedSMSRelay:](self, "_removeDeviceFromAllowedSMSRelay:", v8);
    -[IMDRelayEnrollmentController sendUnApproveToDevice:extraKeys:](self, "sendUnApproveToDevice:extraKeys:", v8, 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.sms.smsRelayDevices.changed"), 0, 0, 0);

  }
  else if (v5)
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "empty deviceID passed in", (uint8_t *)&v11, 2u);
    }

  }
}

- (void)enrollSelfDeviceInSMSRelay
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "SMS Service Session Received Request To Enroll ourselves for SMS Relay", v4, 2u);
    }

  }
  -[IMDRelayEnrollmentController sendApprovalEnrollMe](self, "sendApprovalEnrollMe");
}

- (id)_allowedDevicesforSMSRelay
{
  void *v2;
  void *v3;
  id v4;

  IMGetCachedDomainValueForKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)_allowedIDSDevicesforSMSRelay
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  id obj;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  IMGetCachedDomainValueForKey();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "peerDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v4;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v10 = v20;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v22;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v22 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
                objc_msgSend(v9, "uniqueID");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v15) = objc_msgSend(v16, "isEqualToString:", v15);

                if ((_DWORD)v15)
                {
                  objc_msgSend(v19, "addObject:", v9);
                  goto LABEL_17;
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              if (v12)
                continue;
              break;
            }
          }
LABEL_17:

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v6);
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_ignoredDevicesforSMSRelay
{
  void *v2;
  void *v3;
  id v4;

  IMGetCachedDomainValueForKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)_ignoredIDSDevicesforSMSRelay
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  id obj;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  IMGetCachedDomainValueForKey();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "peerDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v4;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v10 = v20;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v22;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v22 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
                objc_msgSend(v9, "uniqueID");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v15) = objc_msgSend(v16, "isEqualToString:", v15);

                if ((_DWORD)v15)
                {
                  objc_msgSend(v19, "addObject:", v9);
                  goto LABEL_17;
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              if (v12)
                continue;
              break;
            }
          }
LABEL_17:

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v6);
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_challengedDevicesforSMSRelay
{
  void *v2;
  void *v3;
  id v4;

  IMGetCachedDomainValueForKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)_challengedIDSDevicesforSMSRelay
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  id obj;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  IMGetCachedDomainValueForKey();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "peerDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v4;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v10 = v20;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v22;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v22 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
                objc_msgSend(v9, "uniqueID");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v15) = objc_msgSend(v16, "isEqualToString:", v15);

                if ((_DWORD)v15)
                {
                  objc_msgSend(v19, "addObject:", v9);
                  goto LABEL_17;
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              if (v12)
                continue;
              break;
            }
          }
LABEL_17:

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v6);
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_noteDeviceHasMICForSMSRelay:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMGetCachedDomainValueForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);
    if ((_DWORD)v7)
    {
      if (IMOSLoggingEnabled(v7))
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v13[0]) = 0;
          _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Told to add an item but we already have its ID, ignoring and moving on.", (uint8_t *)v13, 2u);
        }

      }
    }
    else
    {
      objc_msgSend(v5, "addObject:", v6);
      v9 = objc_msgSend(v5, "count");
      v10 = objc_msgSend(v4, "count");
      if (v9 < v10 && IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v13[0] = 67109376;
          v13[1] = objc_msgSend(v5, "count");
          v14 = 1024;
          v15 = objc_msgSend(v4, "count");
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", (uint8_t *)v13, 0xEu);
        }

      }
      if (!objc_msgSend(v5, "count") && IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v13[0]) = 0;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", (uint8_t *)v13, 2u);
        }

      }
      IMSetDomainValueForKey();
      IMSyncronizeAppPreferences();
    }

  }
}

- (void)_removeDeviceHasMICForSMSRelay:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMGetCachedDomainValueForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqualToString:", v6, (_QWORD)v18))
          {
            objc_msgSend(v7, "removeObject:", v11);
            v12 = objc_msgSend(v7, "count");
            v13 = objc_msgSend(v4, "count");
            if (v12 < v13 && IMOSLoggingEnabled(v13))
            {
              OSLogHandleForIMFoundationCategory();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                v15 = objc_msgSend(v7, "count");
                v16 = objc_msgSend(v4, "count");
                *(_DWORD *)buf = 67109376;
                v23 = v15;
                v24 = 1024;
                v25 = v16;
                _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "_removeDeviceFromMICSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", buf, 0xEu);
              }

            }
            if (!objc_msgSend(v7, "count") && IMOSLoggingEnabled(0))
            {
              OSLogHandleForIMFoundationCategory();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "_removeDeviceFromMICSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", buf, 2u);
              }

            }
            IMSetDomainValueForKey();
            IMSyncronizeAppPreferences();
            goto LABEL_22;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_22:

  }
}

- (void)_addDeviceToAllowedSMSRelay:(id)a3 shouldSendApproval:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  _DWORD v21[2];
  __int16 v22;
  int v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  IMGetCachedDomainValueForKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsObject:", v9);
    if ((_DWORD)v10)
    {
      if (IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(v21[0]) = 0;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Told to add an item but we allready have its ID, moving on", (uint8_t *)v21, 2u);
        }

      }
    }
    else
    {
      objc_msgSend(v8, "addObject:", v9);
      v12 = objc_msgSend(v8, "count");
      v13 = objc_msgSend(v7, "count");
      if (v12 < v13 && IMOSLoggingEnabled(v13))
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v21[0] = 67109376;
          v21[1] = objc_msgSend(v8, "count");
          v22 = 1024;
          v23 = objc_msgSend(v7, "count");
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", (uint8_t *)v21, 0xEu);
        }

      }
      if (!objc_msgSend(v8, "count") && IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LOWORD(v21[0]) = 0;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", (uint8_t *)v21, 2u);
        }

      }
      IMSetDomainValueForKey();
      IMSyncronizeAppPreferences();
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isSMSFilterSyncEnabled");

      if (v17)
      {
        v18 = objc_msgSend(MEMORY[0x1E0D399F8], "IDSDeviceSupportsIncomingSMSRelayFilteringForDeviceType:", objc_msgSend(v6, "deviceType"));
        if ((_DWORD)v18)
        {
          if (IMOSLoggingEnabled(v18))
          {
            OSLogHandleForIMFoundationCategory();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              LOWORD(v21[0]) = 0;
              _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Added device for relay. Relaying current SMS Filtering settings.", (uint8_t *)v21, 2u);
            }

          }
          +[IMDFilteringController sharedInstance](IMDFilteringController, "sharedInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "_relayCurrentSMSFilteringSettings");

        }
      }
    }

  }
  if (v4)
    -[IMDRelayEnrollmentController sendApprovalResponseToDevice:enteredCorrectly:wasCancelled:](self, "sendApprovalResponseToDevice:enteredCorrectly:wasCancelled:", v6, 1, 0);

}

- (void)_removeDeviceFromAllowedSMSRelay:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMGetCachedDomainValueForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqualToString:", v6, (_QWORD)v18))
          {
            objc_msgSend(v7, "removeObject:", v11);
            v12 = objc_msgSend(v7, "count");
            v13 = objc_msgSend(v4, "count");
            if (v12 < v13 && IMOSLoggingEnabled(v13))
            {
              OSLogHandleForIMFoundationCategory();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                v15 = objc_msgSend(v7, "count");
                v16 = objc_msgSend(v4, "count");
                *(_DWORD *)buf = 67109376;
                v23 = v15;
                v24 = 1024;
                v25 = v16;
                _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "_removeDeviceFromAllowedSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", buf, 0xEu);
              }

            }
            if (!objc_msgSend(v7, "count") && IMOSLoggingEnabled(0))
            {
              OSLogHandleForIMFoundationCategory();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "_removeDeviceFromAllowedSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", buf, 2u);
              }

            }
            IMSetDomainValueForKey();
            IMSyncronizeAppPreferences();
            goto LABEL_22;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_22:

  }
}

- (void)_addDeviceToIgnoredSMSRelay:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMGetCachedDomainValueForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);
    if ((_DWORD)v7)
    {
      if (IMOSLoggingEnabled(v7))
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v13[0]) = 0;
          _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Told to add an iteam but we allready have its ID, moving on", (uint8_t *)v13, 2u);
        }

      }
    }
    else
    {
      objc_msgSend(v5, "addObject:", v6);
      v9 = objc_msgSend(v5, "count");
      v10 = objc_msgSend(v4, "count");
      if (v9 < v10 && IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v13[0] = 67109376;
          v13[1] = objc_msgSend(v5, "count");
          v14 = 1024;
          v15 = objc_msgSend(v4, "count");
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: newIgnoredDeviceUUIDs count: %d ignoredDeviceUUIDs count: %d", (uint8_t *)v13, 0xEu);
        }

      }
      if (!objc_msgSend(v5, "count") && IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v13[0]) = 0;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "_addDeviceToIgnoredSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", (uint8_t *)v13, 2u);
        }

      }
      IMSetDomainValueForKey();
      IMSyncronizeAppPreferences();
    }

  }
}

- (void)_removeDeviceFromIgnoredSMSRelay:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMGetCachedDomainValueForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqualToString:", v6, (_QWORD)v18))
          {
            objc_msgSend(v7, "removeObject:", v11);
            v12 = objc_msgSend(v7, "count");
            v13 = objc_msgSend(v4, "count");
            if (v12 < v13 && IMOSLoggingEnabled(v13))
            {
              OSLogHandleForIMFoundationCategory();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                v15 = objc_msgSend(v7, "count");
                v16 = objc_msgSend(v4, "count");
                *(_DWORD *)buf = 67109376;
                v23 = v15;
                v24 = 1024;
                v25 = v16;
                _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "_removeDeviceFromIgnoredSMSRelay: newIgnoredDeviceUUIDs count: %d ignoredDeviceUUIDs count: %d", buf, 0xEu);
              }

            }
            if (!objc_msgSend(v7, "count") && IMOSLoggingEnabled(0))
            {
              OSLogHandleForIMFoundationCategory();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "_removeDeviceFromIgnoredSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", buf, 2u);
              }

            }
            IMSetDomainValueForKey();
            IMSyncronizeAppPreferences();
            goto LABEL_22;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_22:

  }
}

- (void)_addDefaultPairedDeviceToAllowedSMSRelayList
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMEventCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Trying to add default paired device to allowed list", buf, 2u);
    }

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peerDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v14;
    *(_QWORD *)&v7 = 138412290;
    v12 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isDefaultPairedDevice", v12)
          && IMOSLoggingEnabled(-[IMDRelayEnrollmentController _addDeviceToAllowedSMSRelay:shouldSendApproval:](self, "_addDeviceToAllowedSMSRelay:shouldSendApproval:", v10, 0)))
        {
          OSLogHandleForIMEventCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v12;
            v18 = v10;
            _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Added to paired list %@", buf, 0xCu);
          }

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v6);
  }

}

- (void)_addDeviceToChallengedSMSRelay:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMGetCachedDomainValueForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);
    if ((_DWORD)v7)
    {
      if (IMOSLoggingEnabled(v7))
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v13[0]) = 0;
          _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Told to add an iteam but we allready have its ID, moving on", (uint8_t *)v13, 2u);
        }

      }
    }
    else
    {
      objc_msgSend(v5, "addObject:", v6);
      v9 = objc_msgSend(v5, "count");
      v10 = objc_msgSend(v4, "count");
      if (v9 < v10 && IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v13[0] = 67109376;
          v13[1] = objc_msgSend(v5, "count");
          v14 = 1024;
          v15 = objc_msgSend(v4, "count");
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", (uint8_t *)v13, 0xEu);
        }

      }
      if (!objc_msgSend(v5, "count") && IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v13[0]) = 0;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "_addDeviceToIgnoredSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", (uint8_t *)v13, 2u);
        }

      }
      IMSetDomainValueForKey();
      IMSyncronizeAppPreferences();
    }

  }
}

- (void)_removeDeviceFromChallengedSMSRelay:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMGetCachedDomainValueForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqualToString:", v6, (_QWORD)v18))
          {
            objc_msgSend(v7, "removeObject:", v11);
            v12 = objc_msgSend(v7, "count");
            v13 = objc_msgSend(v4, "count");
            if (v12 < v13 && IMOSLoggingEnabled(v13))
            {
              OSLogHandleForIMFoundationCategory();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                v15 = objc_msgSend(v7, "count");
                v16 = objc_msgSend(v4, "count");
                *(_DWORD *)buf = 67109376;
                v23 = v15;
                v24 = 1024;
                v25 = v16;
                _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", buf, 0xEu);
              }

            }
            if (!objc_msgSend(v7, "count") && IMOSLoggingEnabled(0))
            {
              OSLogHandleForIMFoundationCategory();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "_addDeviceToIgnoredSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", buf, 2u);
              }

            }
            IMSetDomainValueForKey();
            IMSyncronizeAppPreferences();
            goto LABEL_22;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_22:

  }
}

- (void)_sendPinCodeToDeviceAndPromptForResponse:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
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
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsDeviceFromUniqueID:", v27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v27;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Tried to enroll a device that doesnt excist in our set of devices or was nil %@", buf, 0xCu);
    }

  }
  v8 = -[IMDRelayEnrollmentController sendApprovalDisplayPinToDevice:](self, "sendApprovalDisplayPinToDevice:", v5);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0D36A10];
    objc_msgSend(v5, "modelIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "marketingNameForModel:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ENTER_THE_CODE_SHOWN_ON_YOUR_DEVICE_FOR_SMS_RELAY"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Text Message Forwarding"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Allow"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v24, v26, v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", &stru_1E92346B0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", &stru_1E92346B0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v23, *MEMORY[0x1E0D36958], v15, *MEMORY[0x1E0D36938], v16, *MEMORY[0x1E0D36950], v17, *MEMORY[0x1E0D36948], v12, *MEMORY[0x1E0D36928], v13, *MEMORY[0x1E0D36918], v18, *MEMORY[0x1E0C9B850], 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D36B00], "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:", CFSTR("SMSRelayCodeInput"), 3, 0, v19, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D36B08], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1D147F458;
    v28[3] = &unk_1E9229DC8;
    v28[4] = self;
    v29 = v5;
    objc_msgSend(v21, "addUserNotification:listener:completionHandler:", v20, 0, v28);

  }
  else if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "We were unable to send the PIN to the other device to be displayed, Sorry", buf, 2u);
    }

  }
}

- (BOOL)sendApprovalDisplayPinToDevice:(id)a3
{
  id v4;
  unint64_t v5;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *pendingCodesToDevicesForApproval;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
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
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  char v26;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[IMDRelayEnrollmentController randomSixDigitCode](self, "randomSixDigitCode");
  if (!self->_pendingCodesToDevicesForApproval)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    pendingCodesToDevicesForApproval = self->_pendingCodesToDevicesForApproval;
    self->_pendingCodesToDevicesForApproval = Mutable;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = self->_pendingCodesToDevicesForApproval;
    objc_msgSend(v4, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue((CFMutableDictionaryRef)v9, v10, v8);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1D1667964(v4);
  }

  v11 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, IMDRelayApprovalKeyKey, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  JWEncodeDictionary();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "_FTCopyGzippedData");
  v16 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 142);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  StringGUID();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  IDSGetUUIDData();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D348E0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D341D8], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D341C0], MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D34150], v17, *MEMORY[0x1E0D34138], v19, *MEMORY[0x1E0D341E0], v15, *MEMORY[0x1E0D34148], v20, *MEMORY[0x1E0D341C8], 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v22))
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v24;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Sending a Pin Code To Device %@  to display to enroll them into SMS Relay", buf, 0xCu);

    }
  }
  -[IMDRelayEnrollmentController dispatchDelegate](self, "dispatchDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "sendEnrollmentRelatedMessageOverIDS:deviceToSendTo:", v21, v4);

  return v26;
}

- (void)sendApprovalEnrollMe
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFDictionary *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint8_t buf[4];
  void *v40;
  __CFString *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v3 = IMOSLoggingEnabled(self);
  if ((_DWORD)v3)
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "SMS Service session received request to enroll ourselves into SMS Relay", buf, 2u);
    }

  }
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "SMS Service session received request to enroll ourselves into SMS Relay", buf, 2u);
    }

  }
  -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dominentPhoneNumberAlias");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_callerIDForRelay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "_appearsToBePhoneNumber");
  if ((_DWORD)v10
    && (-[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isAliasRelayCapable:", v9),
        v11,
        v12))
  {
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "This device has a callerID set to a phone number, That phone number is SMS Relay enabled, we should use that ", buf, 2u);
      }

    }
    v14 = v9;
    v15 = v14;
    if (!v14)
    {
LABEL_46:
      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "We are unable to send any request for enabling SMS Relay for ourselves, we know of no phone with an alias we can use!!!!!", buf, 2u);
        }

      }
      v15 = 0;
      goto LABEL_51;
    }
  }
  else
  {
    v14 = (id)IMOSLoggingEnabled(v10);
    if ((_DWORD)v14)
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "This device does not have a callerID set, so we are going to use the Dominent phone number one if possible ", buf, 2u);
      }

    }
    if (!v7)
      goto LABEL_46;
    v15 = v7;
    v14 = (id)IMOSLoggingEnabled(v15);
    if ((_DWORD)v14)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "It is possible to use the Dominent phone number alias, thats awesome, lets go for it", buf, 2u);
      }

    }
  }
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "We have an alias, we know where to send this request, lets go for it", buf, 2u);
    }

  }
  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "cloudKitSyncingEnabled");

  if (v20)
  {
    if (IMOSLoggingEnabled(v21))
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "MOC is ON including in this enrollment payload", buf, 2u);
      }

    }
    v41 = IMDRelayMICStateKey;
    v42[0] = &unk_1E9271020;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    JWEncodeDictionary();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "_FTCopyGzippedData");

  }
  else
  {
    v25 = 0;
  }
  v26 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 148);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  StringGUID();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  IDSGetUUIDData();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D348E0]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D341D8], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D341C0], MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D34150], v27, *MEMORY[0x1E0D34138], v29, *MEMORY[0x1E0D341E0], v30, *MEMORY[0x1E0D341C8], 0);
  v31 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (v25)
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E0D34148], v25);
  -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_deviceForCallerID:", v15);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    if (IMOSLoggingEnabled(v34))
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v33, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v36;
        _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "Asking for device %@  to enroll me into SMS Relay", buf, 0xCu);

      }
    }
    -[IMDRelayEnrollmentController dispatchDelegate](self, "dispatchDelegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "sendEnrollmentRelatedMessageOverIDS:deviceToSendTo:", v31, v33);

  }
LABEL_51:

}

- (void)sendApprovalResponseToDevice:(id)a3 enteredCorrectly:(BOOL)a4 wasCancelled:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
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
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v5 = a5;
  v6 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = IMDRelayApprovalResponseKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, v11, v12, IMDRelayApprovalWasCancelledKey, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  JWEncodeDictionary();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "_FTCopyGzippedData");
  StringGUID();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 145);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  IDSGetUUIDData();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D348E0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D341D8], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D341C0], MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D34150], v18, *MEMORY[0x1E0D34138], v19, *MEMORY[0x1E0D341E0], v15, *MEMORY[0x1E0D34148], v20, *MEMORY[0x1E0D341C8], 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v22))
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v27 = v24;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Sending an Approval response message to device %@ message guid %@ with information %@ ", buf, 0x20u);

    }
  }
  -[IMDRelayEnrollmentController dispatchDelegate](self, "dispatchDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendEnrollmentRelatedMessageOverIDS:deviceToSendTo:", v21, v8);

}

- (void)sendUnApproveToDevice:(id)a3 extraKeys:(id)a4
{
  id v5;
  uint64_t v6;
  __CFDictionary *v7;
  CFMutableDictionaryRef v8;
  CFMutableDictionaryRef Mutable;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v5 = a4;
  v6 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], IMDRelayAuthorizationRevokedKey, 0);
  v7 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    Mutable = (CFMutableDictionaryRef)-[__CFDictionary mutableCopy](v7, "mutableCopy");
    if (!Mutable)
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    -[__CFDictionary addEntriesFromDictionary:](Mutable, "addEntriesFromDictionary:", v5);

    v8 = Mutable;
  }
  JWEncodeDictionary();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "_FTCopyGzippedData");
  StringGUID();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 145);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  IDSGetUUIDData();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D348E0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v6, *MEMORY[0x1E0D341D8], v6, *MEMORY[0x1E0D341C0], MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D34150], v14, *MEMORY[0x1E0D34138], v15, *MEMORY[0x1E0D341E0], v11, *MEMORY[0x1E0D34148], v16, *MEMORY[0x1E0D341C8], 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v18))
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v23, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v20;
      v26 = 2112;
      v27 = v12;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Sending an Un-Approve message to device %@ message guid %@", buf, 0x16u);

    }
  }
  -[IMDRelayEnrollmentController dispatchDelegate](self, "dispatchDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sendEnrollmentRelatedMessageOverIDS:deviceToSendTo:", v17, v23);

}

- (unint64_t)randomSixDigitCode
{
  return (int)(arc4random_uniform(0xDBB9Fu) + 100000);
}

- (void)_approveSelfForSMSRelay
{
  id v3;

  if (!-[IMDRelayEnrollmentController hasBeenRemoteApproved](self, "hasBeenRemoteApproved"))
  {
    -[IMDRelayEnrollmentController setHasBeenRemoteApproved:](self, "setHasBeenRemoteApproved:", 1);
    IMSyncronizeAppPreferences();
    -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateRelayStatus");

  }
}

- (void)_micEnabledStateDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSMSForwardingEnabled");

  if (v6)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMEventCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "MIC State has changed, checking next steps for SMS Relay", v9, 2u);
      }

    }
    -[IMDRelayEnrollmentController enrollSelfDeviceInSMSRelay](self, "enrollSelfDeviceInSMSRelay");
  }

}

- (void)_migrateSMSRelayForMICIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  int v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSMSForwardingEnabled");

  if (v4 && (IMGetDomainBoolForKey() & 1) == 0)
  {
    IMSetDomainBoolForKey();
    IMSyncronizeAppPreferences();
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "cloudKitSyncingEnabled");

    if (v6)
      -[IMDRelayEnrollmentController enrollSelfDeviceInSMSRelay](self, "enrollSelfDeviceInSMSRelay");
  }
}

- (BOOL)_areiMessageAndiCloudAccountTheSame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "accountType") == 1 && objc_msgSend(v10, "isActive"))
        {
          objc_msgSend(v10, "profileID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("D:%@"), v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled(v12))
          {
            OSLogHandleForIMEventCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v21 = v12;
              v22 = 2112;
              v23 = v11;
              _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "iCloud DSID is %@, imessage DSID is %@", buf, 0x16u);
            }

          }
          v14 = objc_msgSend(v11, "isEqualToString:", v12);

          if ((v14 & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_17;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_17:

  return v7;
}

- (BOOL)_isDeviceATrustedHSA2Device:(id)a3
{
  return 1;
}

- (void)_enableSMSRelayForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  IMGetCachedDomainValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IMDRelayEnrollmentController _isDeviceATrustedHSA2Device:](self, "_isDeviceATrustedHSA2Device:", v4);
  if (!v8)
  {
    if (!IMOSLoggingEnabled(v8))
      goto LABEL_16;
    OSLogHandleForIMEventCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Device is not on HSA2 trusted list, not approving it for SMS relay %@", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_6;
  }
  v9 = objc_msgSend(v5, "containsObject:", v7);
  if ((_DWORD)v9)
  {
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMEventCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "(HSA2 Trusted) Already added device to paired list once %@", (uint8_t *)&v12, 0xCu);
      }
LABEL_6:

    }
  }
  else
  {
    if (IMOSLoggingEnabled(-[IMDRelayEnrollmentController _addDeviceToAllowedSMSRelay:shouldSendApproval:](self, "_addDeviceToAllowedSMSRelay:shouldSendApproval:", v4, 1)))
    {
      OSLogHandleForIMEventCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "(HSA2 Trusted) Added to paired list %@", (uint8_t *)&v12, 0xCu);
      }

    }
    objc_msgSend(v6, "addObject:", v7);
    IMSetDomainValueForKey();
    IMSyncronizeAppPreferences();
  }
LABEL_16:

}

- (void)_shouldAutoEnableDevicesforSMSRelay:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1D1481090;
    v6[3] = &unk_1E9229E18;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "fetchCloudKitAccountStatusWithCompletion:", v6);

  }
}

- (void)_addHSA2PairedDevicesToAllowedSMSRelayList
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMEventCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Trying to add HSA2 paired devices to allowed list", buf, 2u);
    }

  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D1481300;
  v4[3] = &unk_1E9229870;
  v4[4] = self;
  -[IMDRelayEnrollmentController _shouldAutoEnableDevicesforSMSRelay:](self, "_shouldAutoEnableDevicesforSMSRelay:", v4);
}

- (BOOL)hasBeenRemoteApproved
{
  return IMGetDomainBoolForKey();
}

- (void)setHasBeenRemoteApproved:(BOOL)a3
{
  IMSetDomainBoolForKey();
  IMSyncronizeAppPreferences();
}

- (IMDRelayEnrollmentControllerServiceDelegate)serviceDelegate
{
  return self->_serviceDelegate;
}

- (IMDRelayEnrollmentControllerDispatchDelegate)dispatchDelegate
{
  return self->_dispatchDelegate;
}

- (NSMutableDictionary)pendingCodesToDevicesForApproval
{
  return self->_pendingCodesToDevicesForApproval;
}

- (void)setPendingCodesToDevicesForApproval:(id)a3
{
  objc_storeStrong((id *)&self->_pendingCodesToDevicesForApproval, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCodesToDevicesForApproval, 0);
  objc_storeStrong((id *)&self->_dispatchDelegate, 0);
  objc_storeStrong((id *)&self->_serviceDelegate, 0);
}

- (id)_bestAccountWithAlias:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceWithName:", *MEMORY[0x1E0D38F58]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountsForService:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "aliases", (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsObject:", v3);

        if (v16)
        {
          v17 = v14;

          v8 = v17;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)handler:(id)a3 incomingDisplayPinCode:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 storageContext:(id)a10
{
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v16 = a4;
  v43 = a5;
  v44 = a6;
  v45 = a7;
  v40 = a8;
  v41 = a9;
  v42 = a10;
  if (IMOSLoggingEnabled(v42))
  {
    OSLogHandleForIMEventCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v47 = v44;
      v48 = 2112;
      v49 = v43;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "SMS Service Session Received an incomming approval request from:%@ to:%@", buf, 0x16u);
    }

  }
  v39 = v16;
  objc_msgSend(v16, "_numberForKey:", IMDRelayApprovalKeyKey);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "idsDeviceFromPushToken:", v45);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "supportsSMSRelay");
  if ((v21 & 1) != 0)
  {
    objc_msgSend(v20, "linkedUserURIs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_stripFZIDPrefix");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    IMFormattedDisplayStringForID();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithLTREmbedding");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("TO_SEND_AND_RECEIVE_YOUR_IPHONE_TEXT_MESSAGES"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0D36B00];
    objc_msgSend(v20, "uniqueID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v29, v26, v18, v38);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:", v31, v32, 0, v28, 0, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v33, "setUsesNotificationCenter:", 0);
      objc_msgSend(v33, "setRepresentedApplicationBundle:", *MEMORY[0x1E0D36C08]);
      objc_msgSend(MEMORY[0x1E0D36B08], "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addUserNotification:listener:completionHandler:", v33, 0, &unk_1E9229E58);

    }
  }
  else
  {
    v35 = IMOSLoggingEnabled(v21);
    if ((_DWORD)v35)
    {
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "********** We received an imcomming pin code alert from a non SMS Device", buf, 2u);
      }

    }
    if (IMOSLoggingEnabled(v35))
    {
      OSLogHandleForIMFoundationCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v20;
        _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "The device that sent this request was %@", buf, 0xCu);
      }

    }
  }

}

- (void)handler:(id)a3 incomingEnrollMeRequest:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 storageContext:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  const __CFString *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v49 = a8;
  v50 = a9;
  v51 = a10;
  if (IMOSLoggingEnabled(v51))
  {
    OSLogHandleForIMEventCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v53 = v18;
      v54 = 2112;
      v55 = v17;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "SMS Service Session Received a request to enroll a device into SMS Relay from:%@ to:%@", buf, 0x16u);
    }

  }
  objc_msgSend(v16, "_numberForKey:", IMDRelayMICStateKey, v47);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v21))
  {
    OSLogHandleForIMEventCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = CFSTR("YES");
      *(_DWORD *)buf = 138412802;
      v53 = v18;
      v54 = 2112;
      if (!v21)
        v23 = CFSTR("NO");
      v55 = v17;
      v56 = 2112;
      v57 = v23;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "SMS Service Session Received a request to enroll a device into SMS Relay from:%@ to:%@, micIsOn:%@", buf, 0x20u);
    }

  }
  -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "idsDeviceFromPushToken:", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[IMDRelayEnrollmentController _allowedDevicesforSMSRelay](self, "_allowedDevicesforSMSRelay");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "uniqueID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "containsObject:", v28);

    if (v29)
    {
      v31 = IMOSLoggingEnabled(v30);
      if ((_DWORD)v31)
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Received request to enroll a device into SMS Relay, However we already have this device in our allowed list ", buf, 2u);
        }

      }
      if (!v21)
      {
        -[IMDRelayEnrollmentController _removeDeviceHasMICForSMSRelay:](self, "_removeDeviceHasMICForSMSRelay:", v25);
        goto LABEL_49;
      }
      if (IMOSLoggingEnabled(v31))
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "Received request to enroll a device into SMS Relay, However this is just an update for its MIC State to YES, Saving that down", buf, 2u);
        }

      }
      goto LABEL_42;
    }
    -[IMDRelayEnrollmentController _challengedDevicesforSMSRelay](self, "_challengedDevicesforSMSRelay");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "uniqueID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "containsObject:", v38);

    if (v39)
    {
      if (!IMOSLoggingEnabled(v40))
        goto LABEL_49;
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "Received request to enroll a device into SMS Relay, However this device has requested to be enrolled before, Not allowing it to try again", buf, 2u);
      }
      goto LABEL_30;
    }
    v41 = objc_msgSend(v25, "isHSATrusted");
    v42 = v41;
    v43 = IMOSLoggingEnabled(v41);
    if (v42)
    {
      if (v43)
      {
        OSLogHandleForIMFoundationCategory();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v25;
          _os_log_impl(&dword_1D1413000, v44, OS_LOG_TYPE_INFO, "Automatically enrolling for SMS relay with requesting device: %@", buf, 0xCu);
        }

      }
      -[IMDRelayEnrollmentController _addDeviceToAllowedSMSRelay:shouldSendApproval:](self, "_addDeviceToAllowedSMSRelay:shouldSendApproval:", v25, 1);
      if (v21)
LABEL_42:
        -[IMDRelayEnrollmentController _noteDeviceHasMICForSMSRelay:](self, "_noteDeviceHasMICForSMSRelay:", v25);
    }
    else
    {
      if (v43)
      {
        OSLogHandleForIMFoundationCategory();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v45, OS_LOG_TYPE_INFO, "Received request to enroll a device into SMS Relay, This is your first time trying, You only get 1 chance", buf, 2u);
        }

      }
      -[IMDRelayEnrollmentController _addDeviceToChallengedSMSRelay:](self, "_addDeviceToChallengedSMSRelay:", v25);
      objc_msgSend(v25, "uniqueID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDRelayEnrollmentController _sendPinCodeToDeviceAndPromptForResponse:](self, "_sendPinCodeToDeviceAndPromptForResponse:", v46);

    }
  }
  else
  {
    v34 = IMOSLoggingEnabled(v26);
    if ((_DWORD)v34)
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "********** We received an Enroll me Request from a device that we do not recognize", buf, 2u);
      }

    }
    if (IMOSLoggingEnabled(v34))
    {
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v53 = 0;
        _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "The device that sent this request was %@", buf, 0xCu);
      }
LABEL_30:

    }
  }
LABEL_49:

}

- (BOOL)_deviceAllowedToDisableRelay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peerDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "uniqueID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uniqueID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if (v12)
        {
          if ((objc_msgSend(v4, "supportsSMSRelay") & 1) != 0)
            v16 = 1;
          else
            v16 = objc_msgSend(v4, "supportsMMSRelay");

          goto LABEL_18;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (IMOSLoggingEnabled(v13))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Device %@ was not found in our relay service!", buf, 0xCu);

    }
  }
  v16 = 0;
LABEL_18:

  return v16;
}

- (void)handler:(id)a3 incomingResponseForApproval:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 storageContext:(id)a10
{
  id v16;
  __CFString *v17;
  __CFString *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  _BOOL8 v28;
  BOOL v29;
  int v30;
  NSObject *v31;
  __CFString *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  __CFString *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  int v47;
  uint64_t v48;
  NSObject *v49;
  const __CFString *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  __CFString *v56;
  id v57;
  id v58;
  id v59;
  uint8_t buf[4];
  const __CFString *v61;
  __int16 v62;
  const __CFString *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v16 = a4;
  v17 = (__CFString *)a5;
  v18 = (__CFString *)a6;
  v19 = a7;
  v58 = a8;
  v59 = a9;
  v20 = a10;
  if (IMOSLoggingEnabled(v20))
  {
    OSLogHandleForIMEventCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v61 = v18;
      v62 = 2112;
      v63 = v17;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "SMS Service Session Received an incomming approval response from:%@ to:%@", buf, 0x16u);
    }

  }
  -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "idsDeviceFromPushToken:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectForKey:", IMDRelayAuthorizationRevokedKey);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLValue");

  objc_msgSend(v16, "objectForKey:", IMDRelayAuthorizationUnauthorizedDeviceKey);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "BOOLValue");

  if (v25)
  {
    v28 = -[IMDRelayEnrollmentController _deviceAllowedToDisableRelay:](self, "_deviceAllowedToDisableRelay:", v23);
    v29 = v28;
    v30 = IMOSLoggingEnabled(v28);
    if (v29)
    {
      if (v30)
      {
        OSLogHandleForIMFoundationCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v23, "name");
          v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v61 = v32;
          _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "Device %@ Told us that they have turned off SMS Relay for us, revoking them now ", buf, 0xCu);

        }
      }
      IMSetDomainBoolForKey();
      v33 = -[IMDRelayEnrollmentController setHasBeenRemoteApproved:](self, "setHasBeenRemoteApproved:", 0);
      if (v27)
      {
        if (IMOSLoggingEnabled(v33))
        {
          OSLogHandleForIMFoundationCategory();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "This response indicated to us that we tried to send when we shouldnt have tried to send, Pulling out the guid and marking that message as a failure ", buf, 2u);
          }

        }
        objc_msgSend(v16, "_stringForKey:", IMDRelayMessageDictionaryGUIDKey);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (__CFString *)v35;
        if (v35)
        {
          if (IMOSLoggingEnabled(v35))
          {
            OSLogHandleForIMFoundationCategory();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v61 = v36;
              _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "Telling message GUID %@ that it's a failure", buf, 0xCu);
            }

          }
          -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "didReceiveMessageError:", v36);

        }
      }
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isSMSFilterSyncEnabled");

      if (v40)
      {
        +[IMDFilteringController sharedInstance](IMDFilteringController, "sharedInstance");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "uniqueIDOverride");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "_checkAndUpdateSMSFilteringSettingsForDeviceID:smsFilterCapabilitiesOptions:filterExtensionName:", v42, 0, 0);

      }
      -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "updateRelayStatus");

    }
    else if (v30)
    {
      OSLogHandleForIMFoundationCategory();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v23, "name");
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v61 = v56;
        _os_log_impl(&dword_1D1413000, v55, OS_LOG_TYPE_INFO, "Device %@ Told us that they have turned off SMS Relay for us, but we determined they are not allowed to. Ignoring!", buf, 0xCu);

      }
    }
  }
  else
  {
    objc_msgSend(v16, "objectForKey:", IMDRelayApprovalResponseKey);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "BOOLValue");

    objc_msgSend(v16, "objectForKey:", IMDRelayApprovalWasCancelledKey);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "BOOLValue");

    if (IMOSLoggingEnabled(v48))
    {
      OSLogHandleForIMFoundationCategory();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        v50 = CFSTR("NO");
        if ((_DWORD)v45)
          v51 = CFSTR("YES");
        else
          v51 = CFSTR("NO");
        if (v47)
          v50 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v61 = v51;
        v62 = 2112;
        v63 = v50;
        _os_log_impl(&dword_1D1413000, v49, OS_LOG_TYPE_INFO, "The response was %@ Was it a cancelation/revokation? %@ ", buf, 0x16u);
      }

    }
    -[IMDRelayEnrollmentController setHasBeenRemoteApproved:](self, "setHasBeenRemoteApproved:", v45);
    -[IMDRelayEnrollmentController serviceDelegate](self, "serviceDelegate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "updateRelayStatus");

    objc_msgSend(MEMORY[0x1E0D36B08], "sharedInstance");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "uniqueID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "removeNotificationsForServiceIdentifier:", v54);

  }
}

@end
