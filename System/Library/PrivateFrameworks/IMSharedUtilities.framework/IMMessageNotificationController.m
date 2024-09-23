@implementation IMMessageNotificationController

+ (id)sharedInstance
{
  if (qword_1ECFC7660 != -1)
    dispatch_once(&qword_1ECFC7660, &unk_1E3FB3AA8);
  return (id)qword_1ECFC75C0;
}

- (IMMessageNotificationController)init
{
  IMMessageNotificationController *v2;
  IDSService *v3;
  NSObject *v4;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMMessageNotificationController;
  v2 = -[IMMessageNotificationController init](&v7, sel_init);
  if (v2)
  {
    v3 = (IDSService *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.messagenotification"));
    v2->_messageNotificationControllerIDSService = v3;
    -[IDSService addDelegate:queue:](v3, "addDelegate:queue:", v2, MEMORY[0x1E0C80D38]);
  }
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Instantiated IMMessageNotificationController", v6, 2u);
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[IDSService removeDelegate:](self->_messageNotificationControllerIDSService, "removeDelegate:", self);

  v3.receiver = self;
  v3.super_class = (Class)IMMessageNotificationController;
  -[IMMessageNotificationController dealloc](&v3, sel_dealloc);
}

- (BOOL)_isCurrentDeviceAudioAccessory
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance"), "deviceType");
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = CFSTR("NO");
      if (v2 == 7)
        v4 = CFSTR("YES");
      v6 = 134218242;
      v7 = v2;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "Current device has deviceType %ld, isAudioAccessory %@", (uint8_t *)&v6, 0x16u);
    }
  }
  return v2 == 7;
}

- (BOOL)_deviceIsAudioAccessory:(id)a3
{
  int v4;
  NSObject *v5;
  uint64_t v6;
  const __CFString *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_msgSend(a3, "modelIdentifier"), "containsString:", CFSTR("AudioAccessory"));
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_msgSend(a3, "uniqueID");
      v7 = CFSTR("NO");
      if (v4)
        v7 = CFSTR("YES");
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Device with unique id %@ is audio accessory %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return v4;
}

- (id)_copyIDForDevice:(id)a3
{
  return (id)IDSCopyIDForDevice();
}

- (BOOL)audioAccessoryDeviceWithTokenURIExists:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  BOOL v11;
  _BOOL4 v12;
  NSObject *v13;
  const __CFString *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  const __CFString *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)-[IDSService devices](-[IMMessageNotificationController messageNotificationControllerIDSService](self, "messageNotificationControllerIDSService", 0), "devices");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = -[IMMessageNotificationController _copyIDForDevice:](self, "_copyIDForDevice:", v9);
        if ((objc_msgSend(v10, "isEqualToString:", a3) & 1) != 0)
        {
          v11 = -[IMMessageNotificationController _deviceIsAudioAccessory:](self, "_deviceIsAudioAccessory:", v9);

          if (v11)
          {
            v12 = 1;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v6);
  }
  v12 = 0;
LABEL_13:
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = CFSTR("NO");
      if (v12)
        v14 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v21 = a3;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Found IDS Audio Accessory device with token URI %@ ? %@", buf, 0x16u);
    }
  }
  return v12;
}

- (id)_copyIDSIdentifierOrDefault:(id)a3
{
  void *v5;
  uint64_t v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)-[IDSService devices](-[IMMessageNotificationController messageNotificationControllerIDSService](self, "messageNotificationControllerIDSService"), "devices"), "count"))
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_29;
    v14 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v15 = "Service did not have any devices, could not send notification message";
    goto LABEL_28;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (void *)-[IDSService devices](-[IMMessageNotificationController messageNotificationControllerIDSService](self, "messageNotificationControllerIDSService"), "devices");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (!v6)
    goto LABEL_36;
  v8 = 0;
  v9 = *(_QWORD *)v22;
  *(_QWORD *)&v7 = 138412546;
  v20 = v7;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v22 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend(v11, "uniqueID", v20), "isEqualToString:", a3)
        && -[IMMessageNotificationController _deviceIsAudioAccessory:](self, "_deviceIsAudioAccessory:", v11))
      {

        v8 = -[IMMessageNotificationController _copyIDForDevice:](self, "_copyIDForDevice:", v11);
        if (IMOSLoggingEnabled())
        {
          v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = objc_msgSend(v11, "uniqueID");
            *(_DWORD *)buf = v20;
            v26 = v17;
            v27 = 2112;
            v28 = v8;
            _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "Found specified uniqueID %@ formatted to %@", buf, 0x16u);
          }
        }
        goto LABEL_24;
      }
      if (!v8)
      {
        if (-[IMMessageNotificationController _deviceIsAudioAccessory:](self, "_deviceIsAudioAccessory:", v11))
        {
          v8 = -[IMMessageNotificationController _copyIDForDevice:](self, "_copyIDForDevice:", v11);
          if (IMOSLoggingEnabled())
          {
            v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              v13 = objc_msgSend(v11, "uniqueID");
              *(_DWORD *)buf = v20;
              v26 = v13;
              v27 = 2112;
              v28 = v8;
              _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Found first default audio accessory uniqueID %@ formatted to %@", buf, 0x16u);
            }
          }
        }
        else
        {
          v8 = 0;
        }
      }
    }
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v6)
      continue;
    break;
  }
LABEL_24:
  if (!v8)
  {
LABEL_36:
    if (!IMOSLoggingEnabled())
      goto LABEL_29;
    v14 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v15 = "Could not find audio accessory on service.";
LABEL_28:
    _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, v15, buf, 2u);
LABEL_29:
    v8 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v26 = (uint64_t)a3;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "From specified audio accessory unique id %@, returning %@", buf, 0x16u);
    }
  }
  return v8;
}

- (void)_playTone
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  BOOL v6;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[16];

  qword_1EE504198 = MEMORY[0x1A1AE7D4C](CFSTR("TLToneManager"), CFSTR("ToneLibrary"));
  qword_1EE5041A0 = MEMORY[0x1A1AE7D4C](CFSTR("TLAlertConfiguration"), CFSTR("ToneLibrary"));
  v2 = MEMORY[0x1A1AE7D4C](CFSTR("TLAlert"), CFSTR("ToneLibrary"));
  qword_1EE5041A8 = v2;
  v3 = qword_1EE504198;
  v4 = qword_1EE5041A0;
  v5 = IMOSLoggingEnabled();
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6 || v2 == 0)
  {
    if (v5)
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Failed to weak link ToneLibrary classes, not playing messages alert tone", buf, 2u);
      }
    }
  }
  else
  {
    if (v5)
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Weak linked ToneLibrary classes, playing messages alert tone", buf, 2u);
      }
    }
    v10 = objc_msgSend((id)objc_msgSend((id)qword_1EE504198, "sharedToneManager"), "currentToneIdentifierForAlertType:", 2);
    v11 = (void *)objc_msgSend(objc_alloc((Class)qword_1EE5041A0), "initWithType:", 2);
    objc_msgSend(v11, "setToneIdentifier:", v10);
    v12 = (void *)objc_msgSend((id)qword_1EE5041A8, "alertWithConfiguration:", v11);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_19E2E3930;
    v13[3] = &unk_1E3FB8288;
    v13[4] = v11;
    objc_msgSend(v12, "playWithCompletionHandler:", v13);
  }
}

- (void)_executeCommandFromMessageRequest:(id)a3
{
  uint64_t v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("c")), "integerValue");
  v5 = -[IMMessageNotificationController _isCurrentDeviceAudioAccessory](self, "_isCurrentDeviceAudioAccessory");
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v8 = CFSTR("NO");
      if (v5)
        v8 = CFSTR("YES");
      v12 = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Looking at command to execute %@, isAudioAccessory %@", (uint8_t *)&v12, 0x16u);
    }
  }
  if (v5)
  {
    v9 = IMOSLoggingEnabled();
    if (v4)
    {
      if (v9)
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Got unrecognized command, not doing anything", (uint8_t *)&v12, 2u);
        }
      }
    }
    else
    {
      if (v9)
      {
        v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Got IMMessageNotificationControllerCommandIncomingMessage command, calling playTone method", (uint8_t *)&v12, 2u);
        }
      }
      -[IMMessageNotificationController _playTone](self, "_playTone");
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  NSObject *v13;
  int v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  _BOOL4 v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  _BYTE v28[54];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v27 = 138413314;
      *(_QWORD *)v28 = a3;
      *(_WORD *)&v28[8] = 2112;
      *(_QWORD *)&v28[10] = a4;
      *(_WORD *)&v28[18] = 2112;
      *(_QWORD *)&v28[20] = a5;
      *(_WORD *)&v28[28] = 2112;
      *(_QWORD *)&v28[30] = a6;
      *(_WORD *)&v28[38] = 2112;
      *(_QWORD *)&v28[40] = a7;
      _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "service %@, account %@, incomingMessage %@ fromID %@ context %@", (uint8_t *)&v27, 0x34u);
    }
  }
  v14 = +[IMIDSUtilities verifyFromID:comesFromAccount:](IMIDSUtilities, "verifyFromID:comesFromAccount:", a6, a4);
  v15 = IMOSLoggingEnabled();
  if (v14)
  {
    if (v15)
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = objc_msgSend(a4, "vettedAliases");
        v18 = objc_msgSend(a4, "devices");
        v27 = 67110402;
        *(_DWORD *)v28 = v14;
        *(_WORD *)&v28[4] = 2112;
        *(_QWORD *)&v28[6] = a4;
        *(_WORD *)&v28[14] = 2112;
        *(_QWORD *)&v28[16] = a6;
        *(_WORD *)&v28[24] = 2112;
        *(_QWORD *)&v28[26] = a7;
        *(_WORD *)&v28[34] = 2112;
        *(_QWORD *)&v28[36] = v17;
        *(_WORD *)&v28[44] = 2112;
        *(_QWORD *)&v28[46] = v18;
        v19 = "Incoming message is not from ourself. Dropping! (matchStatus: 0x%X account %@ fromID %@ context %@ vettedA"
              "liases %@ devices %@)";
        v20 = v16;
        v21 = 58;
LABEL_19:
        _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v27, v21);
      }
    }
  }
  else
  {
    if (v15)
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "Incoming message verified as coming from ourself. Processing!", (uint8_t *)&v27, 2u);
      }
    }
    v23 = -[IMMessageNotificationController _isCurrentDeviceAudioAccessory](self, "_isCurrentDeviceAudioAccessory");
    v24 = IMOSLoggingEnabled();
    if (v23)
    {
      if (v24)
      {
        v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_19E239000, v25, OS_LOG_TYPE_INFO, "Current device is an audio accessory, executing command action", (uint8_t *)&v27, 2u);
        }
      }
      -[IMMessageNotificationController _executeCommandFromMessageRequest:](self, "_executeCommandFromMessageRequest:", a5);
    }
    else if (v24)
    {
      v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        LOWORD(v27) = 0;
        v19 = "Current device is not an audio accessory, not executing command actions";
        v20 = v26;
        v21 = 2;
        goto LABEL_19;
      }
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v7;
  NSObject *v11;
  const __CFString *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v7 = a6;
  v21 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = CFSTR("NO");
      v13 = 138413058;
      v14 = a3;
      v15 = 2112;
      if (v7)
        v12 = CFSTR("YES");
      v16 = a4;
      v17 = 2112;
      v18 = a5;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "message sent with service %@, account %@, and identifier %@ with success %@", (uint8_t *)&v13, 0x2Au);
    }
  }
}

- (void)sendNotificationMessageToUniqueID:(id)a3 withCommmand:(int64_t)a4
{
  uint64_t v7;
  id v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v18 = CFSTR("c");
  v19[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v8 = -[IMMessageNotificationController _copyIDSIdentifierOrDefault:](self, "_copyIDSIdentifierOrDefault:", a3);
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138413058;
      v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v12 = 2112;
      v13 = a3;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Request to send command %@ to uniqueID %@ tokenURI %@ so constructed requestDicitonary to send to IDS: %@", (uint8_t *)&v10, 0x2Au);
    }
  }
  -[IMMessageNotificationController _sendNotificationMessageRequest:toTokenURI:](self, "_sendNotificationMessageRequest:toTokenURI:", v7, v8);
}

- (void)sendNotificationMessageToTokenURI:(id)a3 withCommmand:(int64_t)a4
{
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15 = CFSTR("c");
  v16[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412802;
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v11 = 2112;
      v12 = a3;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Request to send command %@ to tokenURI %@ so constructed requestDicitonary to send to IDS: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  -[IMMessageNotificationController _sendNotificationMessageRequest:toTokenURI:](self, "_sendNotificationMessageRequest:toTokenURI:", v7, a3);
}

- (void)_sendNotificationMessageRequest:(id)a3 toTokenURI:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  IDSService *v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v21 = (uint64_t)a3;
      v22 = 2112;
      v23 = a4;
      _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Trying to send request %@ to tokenURI %@", buf, 0x16u);
    }
  }
  if (objc_msgSend(a4, "length"))
  {
    v18 = 0;
    v19 = 0;
    v8 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a4);
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v8;
        v22 = 2112;
        v23 = a3;
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Sending notification message to local account (toDests %@) (request %@)", buf, 0x16u);
      }
    }
    v10 = -[IMMessageNotificationController messageNotificationControllerIDSService](self, "messageNotificationControllerIDSService");
    v28 = *MEMORY[0x1E0D34160];
    v29[0] = MEMORY[0x1E0C9AAB0];
    v11 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](v10, "sendMessage:toDestinations:priority:options:identifier:error:", a3, v8, 300, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1), &v19, &v18);
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = CFSTR("NO");
        if (v11)
          v13 = CFSTR("YES");
        *(_DWORD *)buf = 138413058;
        v21 = v19;
        v22 = 2112;
        v23 = v18;
        v24 = 2112;
        v25 = a3;
        v26 = 2112;
        v27 = v13;
        v14 = "Sent notification message to local account (identifier %@)  (error %@)  (request %@) success: %@";
        v15 = v12;
        v16 = 42;
        goto LABEL_16;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v14 = "Could not send message because could not find valid identifier";
      v15 = v17;
      v16 = 2;
LABEL_16:
      _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
    }
  }
}

- (IDSService)messageNotificationControllerIDSService
{
  return self->_messageNotificationControllerIDSService;
}

- (void)setMessageNotificationControllerIDSService:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
