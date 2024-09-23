@implementation CKSOSUtilities

+ (id)sharedUtilities
{
  if (sharedUtilities_onceToken_0 != -1)
    dispatch_once(&sharedUtilities_onceToken_0, &__block_literal_global_281);
  return (id)sharedUtilities_sharedUtilities;
}

void __33__CKSOSUtilities_sharedUtilities__block_invoke()
{
  CKSOSUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(CKSOSUtilities);
  v1 = (void *)sharedUtilities_sharedUtilities;
  sharedUtilities_sharedUtilities = (uint64_t)v0;

}

- (BOOL)isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot
{
  int v2;
  _BOOL4 v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__pred_MKBGetDeviceLockStateMobileKeyBag != -1)
    dispatch_once(&isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__pred_MKBGetDeviceLockStateMobileKeyBag, &__block_literal_global_116_0);
  if (isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__pred_MKBDeviceUnlockedSinceBootMobileKeyBag != -1)
    dispatch_once(&isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__pred_MKBDeviceUnlockedSinceBootMobileKeyBag, &__block_literal_global_120_2);
  v2 = isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__MKBGetDeviceLockState(0);
  v3 = v2 == 3 || isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__MKBDeviceUnlockedSinceBoot() == 1;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 136315650;
      v7 = "-[CKSOSUtilities isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot]";
      v8 = 1024;
      v9 = v2;
      v10 = 1024;
      v11 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "%s keybagLockState:%d mobileKeyBagDisabledOrDeviceUnlockedSinceBoot:%d", (uint8_t *)&v6, 0x18u);
    }

  }
  return v3;
}

void *__65__CKSOSUtilities_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("MKBGetDeviceLockState", CFSTR("MobileKeyBag"));
  isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__MKBGetDeviceLockState = result;
  return result;
}

void *__65__CKSOSUtilities_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__block_invoke_2()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("MKBDeviceUnlockedSinceBoot", CFSTR("MobileKeyBag"));
  isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__MKBDeviceUnlockedSinceBoot = result;
  return result;
}

- (BOOL)isMMSEnabled
{
  NSObject *v2;

  IMLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[CKSOSUtilities isMMSEnabled].cold.1(v2);

  return 0;
}

- (void)sendMessage:(id)a3 location:(id)a4 recipients:(id)a5
{
  id v8;
  id v9;
  id v10;
  CKSOSMessage *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CKSOSMessage initWithMessage:recipients:]([CKSOSMessage alloc], "initWithMessage:recipients:", v10, v8);

  -[CKSOSMessage setLocation:](v11, "setLocation:", v9);
  -[CKSOSUtilities sendMessage:](self, "sendMessage:", v11);

}

- (void)sendMessage:(id)a3 location:(id)a4 recipients:(id)a5 failureHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CKSOSMessage *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[CKSOSMessage initWithMessage:recipients:]([CKSOSMessage alloc], "initWithMessage:recipients:", v13, v11);

  -[CKSOSMessage setLocation:](v14, "setLocation:", v12);
  -[CKSOSMessage setFailureBlock:](v14, "setFailureBlock:", v10);

  -[CKSOSUtilities sendMessage:](self, "sendMessage:", v14);
}

- (void)sendMessage:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  dispatch_time_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[8];
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v4 = a3;
  v5 = (id)*MEMORY[0x1E0D38810];
  v6 = (id)*MEMORY[0x1E0D38808];
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackEvent:withDictionary:", v5, &unk_1E2871E70);

  objc_msgSend(v4, "failureBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __30__CKSOSUtilities_sendMessage___block_invoke;
  v19[3] = &unk_1E274CC10;
  v11 = v6;
  v20 = v11;
  v21 = &unk_1E2871E70;
  v12 = v9;
  v22 = v12;
  objc_msgSend(v4, "setFailureBlock:", v19);
  -[CKSOSUtilities _refreshServicesForSending:](self, "_refreshServicesForSending:", v4);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "sendMessage: Waiting for registration check before sending", buf, 2u);
    }

  }
  v14 = dispatch_time(0, 4000000000);
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __30__CKSOSUtilities_sendMessage___block_invoke_129;
  v16[3] = &unk_1E274A108;
  v16[4] = self;
  v17 = v4;
  v15 = v4;
  dispatch_after(v14, MEMORY[0x1E0C80D38], v16);

}

uint64_t __30__CKSOSUtilities_sendMessage___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackEvent:withDictionary:", a1[4], a1[5]);

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __30__CKSOSUtilities_sendMessage___block_invoke_129(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessageAndObserveNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_refreshServicesForSending:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a3, "recipients");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v7, 0);
        objc_msgSend(MEMORY[0x1E0D35910], "smsService");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        CKMakeHandlesFromRecipientsWithFallbackService(v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "count"))
        {
          objc_msgSend(v10, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "firstObject");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKSOSUtilities _chatForHandle:](self, "_chatForHandle:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            IMLogHandleForCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
            if (v13)
            {
              if (v15)
              {
                *(_DWORD *)buf = 138412546;
                v23 = v7;
                v24 = 2112;
                v25 = v13;
                _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "refreshServiceForSending for recipient:%@ chat:%@", buf, 0x16u);
              }

              objc_msgSend(v13, "refreshServiceForSending");
            }
            else
            {
              if (v15)
              {
                *(_DWORD *)buf = 138412290;
                v23 = v7;
                _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Can't refreshServiceForSending for recipient:%@ (no chat)", buf, 0xCu);
              }

            }
          }
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v4);
  }

}

- (void)_sendMessageAndObserveNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  dispatch_time_t v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__85;
  v26 = __Block_byref_object_dispose__85;
  v27 = 0;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v5;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Trying to send SOS message with recipients:%@", buf, 0xCu);
    }

  }
  -[CKSOSUtilities _sendMessageAndReturnGUIDs:](self, "_sendMessageAndReturnGUIDs:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = MEMORY[0x1E0C809B0];
  if (v6 && v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D35400];
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __53__CKSOSUtilities__sendMessageAndObserveNotification___block_invoke;
    v18[3] = &unk_1E275AF50;
    v19 = v9;
    v20 = v6;
    v21 = &v22;
    objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", v13, 0, v12, v18);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v23[5];
    v23[5] = v14;

  }
  v16 = dispatch_time(0, 600000000000);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __53__CKSOSUtilities__sendMessageAndObserveNotification___block_invoke_2;
  v17[3] = &unk_1E274A178;
  v17[4] = &v22;
  dispatch_after(v16, MEMORY[0x1E0C80D38], v17);
  _Block_object_dispose(&v22, 8);

}

void __53__CKSOSUtilities__sendMessageAndObserveNotification___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D354E8]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (void *)a1[4];
  objc_msgSend(v9, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    (*(void (**)(void))(a1[5] + 16))();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

  }
}

void __53__CKSOSUtilities__sendMessageAndObserveNotification___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (id)_compositionsForMessage:(id)a3 withReasons:(unint64_t)a4
{
  id v5;
  CKComposition *v6;
  id v7;
  void *v8;
  void *v9;
  CKComposition *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CKComposition *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t buf[16];

  v5 = a3;
  v6 = [CKComposition alloc];
  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v5, "messageForReasons:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);
  v10 = -[CKComposition initWithText:subject:](v6, "initWithText:subject:", v9, 0);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v10, 0);
  objc_msgSend(v5, "locationURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    v14 = [CKComposition alloc];
    v15 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v5, "locationURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithString:", v16);
    v18 = -[CKComposition initWithText:subject:](v14, "initWithText:subject:", v17, 0);

    objc_msgSend(v11, "addObject:", v18);
  }
  else
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_4;
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "cannot send location URL as none was provided", buf, 2u);
    }
  }

LABEL_4:
  return v11;
}

- (id)_sendMessageAndReturnGUIDs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  CKConversation *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int IsEmail;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  BOOL v33;
  NSObject *v34;
  void (**v35)(void);
  id v37;
  id obj;
  uint64_t v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v3, "recipients");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v4)
  {
    v39 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v42 != v39)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v6, 0);
        objc_msgSend(MEMORY[0x1E0D35910], "smsService");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        CKMakeHandlesFromRecipientsWithFallbackService(v7, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "count"))
        {
          objc_msgSend(v9, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10 == 0;

          if (!v11)
          {
            objc_msgSend(v9, "firstObject");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKSOSUtilities _chatForHandle:](self, "_chatForHandle:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v13, "guid");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v46 = v3;
                v47 = 2112;
                v48 = v12;
                v49 = 2112;
                v50 = v15;
                _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "_sendMessageAndReturnGUIDs:%@, handle %@, chat guid %@.", buf, 0x20u);

              }
            }
            v16 = -[CKConversation initWithChat:]([CKConversation alloc], "initWithChat:", v13);
            objc_msgSend(v3, "recipientReasons");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", v6);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "integerValue");

            objc_msgSend(v12, "ID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v18) = IMStringIsEmail();

            if ((_DWORD)v18)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v46 = v3;
                  _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "[Alerting] sending SOS messages over iMessage to Zelkova email handle. %@", buf, 0xCu);
                }

              }
              -[CKSOSUtilities _compositionsForMessage:withReasons:](self, "_compositionsForMessage:withReasons:", v3, v19);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[CKSOSUtilities _sendCompositions:toConversation:useStandalone:shouldForceSMS:isCritical:](self, "_sendCompositions:toConversation:useStandalone:shouldForceSMS:isCritical:", v22, v16, objc_msgSend(v3, "useStandalone"), 0, objc_msgSend(v3, "isCritical"));
              v23 = objc_claimAutoreleasedReturnValue();
              goto LABEL_36;
            }
            -[CKConversation lastAddressedHandle](v16, "lastAddressedHandle");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            IsEmail = IMStringIsEmail();

            if (IsEmail)
            {
              if ((v19 & 2) != 0)
              {
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v46 = v3;
                    _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "[Alerting] sending SOS messages over iMessage to Zelkova phone number handle from email handle. %@", buf, 0xCu);
                  }

                }
                -[CKSOSUtilities _compositionsForMessage:withReasons:](self, "_compositionsForMessage:withReasons:", v3, 2);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[CKSOSUtilities _sendCompositions:toConversation:useStandalone:shouldForceSMS:isCritical:](self, "_sendCompositions:toConversation:useStandalone:shouldForceSMS:isCritical:", v27, v16, objc_msgSend(v3, "useStandalone"), 0, objc_msgSend(v3, "isCritical"));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "addObjectsFromArray:", v28);

              }
              if ((v19 & 1) != 0)
              {
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v46 = v3;
                    _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "[Alerting] sending SOS messages to EC over SMS. %@", buf, 0xCu);
                  }

                }
                -[CKSOSUtilities _compositionsForMessage:withReasons:](self, "_compositionsForMessage:withReasons:", v3, 1);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[CKSOSUtilities _sendCompositions:toConversation:useStandalone:shouldForceSMS:isCritical:](self, "_sendCompositions:toConversation:useStandalone:shouldForceSMS:isCritical:", v22, v16, objc_msgSend(v3, "useStandalone"), 1, objc_msgSend(v3, "isCritical"));
                v23 = objc_claimAutoreleasedReturnValue();
                goto LABEL_36;
              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v46 = v3;
                  _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "[Alerting] sending SOS messages over SMS. %@", buf, 0xCu);
                }

              }
              -[CKSOSUtilities _compositionsForMessage:withReasons:](self, "_compositionsForMessage:withReasons:", v3, v19);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[CKSOSUtilities _sendCompositions:toConversation:useStandalone:shouldForceSMS:isCritical:](self, "_sendCompositions:toConversation:useStandalone:shouldForceSMS:isCritical:", v22, v16, objc_msgSend(v3, "useStandalone"), 1, objc_msgSend(v3, "isCritical"));
              v23 = objc_claimAutoreleasedReturnValue();
LABEL_36:
              v31 = (void *)v23;
              objc_msgSend(v37, "addObjectsFromArray:", v23);

            }
          }
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v4);
  }

  if (!objc_msgSend(v37, "count"))
  {
    objc_msgSend(v3, "failureBlock");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32 == 0;

    if (!v33)
    {
      IMLogHandleForCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[CKSOSUtilities _sendMessageAndReturnGUIDs:].cold.1((uint64_t)v3, v34);

      objc_msgSend(v3, "failureBlock");
      v35 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v35[2]();

    }
  }

  return v37;
}

- (id)_chatForHandle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ctSubscriptionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredOrDefaultSubscriptionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "If no chat is found, new chat will be created with subscription %@", (uint8_t *)&v15, 0xCu);
    }

  }
  objc_msgSend(v6, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "labelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "existingChatWithChatIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "chatWithHandle:lastAddressedHandle:lastAddressedSIMID:", v3, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)_uniqueFilePathForFilename:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createUniqueDirectoryWithName:atPath:ofType:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByDeletingPathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "uniqueFilename:atPath:ofType:", v11, v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_sendCompositions:(id)a3 toConversation:(id)a4 useStandalone:(BOOL)a5 shouldForceSMS:(BOOL)a6 isCritical:(BOOL)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v8 = a6;
  v9 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        -[CKSOSUtilities sendComposition:toConversation:useStandalone:shouldForceSMS:isCritical:](self, "sendComposition:toConversation:useStandalone:shouldForceSMS:isCritical:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19), v13, v9, v8, a7, (_QWORD)v22);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObjectsFromArray:", v20);

        a7 = 0;
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      a7 = 0;
    }
    while (v17);
  }

  return v14;
}

- (id)sendComposition:(id)a3 toConversation:(id)a4 useStandalone:(BOOL)a5 shouldForceSMS:(BOOL)a6 isCritical:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  id v12;
  int v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _QWORD v40[3];
  _QWORD v41[3];
  uint8_t buf[4];
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v39 = 0;
  v34 = v11;
  v13 = objc_msgSend(v12, "canSendComposition:error:", v11, &v39);
  v33 = v39;
  if (v13)
  {
    objc_msgSend(v12, "resetCaches");
    objc_msgSend(v12, "messagesFromComposition:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUnsentComposition:", 0);
    objc_msgSend(v14, "__imArrayByApplyingBlock:", &__block_literal_global_142_2);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v19, "setUseStandalone:", v9);
          objc_msgSend(v19, "__ck_sosMessage");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v7)
          {
            objc_msgSend(v20, "__ck_criticalMessage");
            v22 = objc_claimAutoreleasedReturnValue();

            v21 = (void *)v22;
          }
          if (v8)
          {
            objc_msgSend(MEMORY[0x1E0D35910], "smsService");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "sendMessage:onService:newComposition:", v21, v23, 0);

          }
          else
          {
            objc_msgSend(v12, "sendMessage:newComposition:", v21, 0);
          }

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v16);
    }

    objc_msgSend(v12, "setIgnoringTypingUpdates:", 0);
    objc_msgSend(v12, "setLocalUserIsTyping:", 0);
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "unpendConversation");

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v33;
        _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Failed to send SOS to conversation with error: %@", buf, 0xCu);
      }

    }
    v32 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = CFSTR("markedCritical");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v27;
  v40[1] = CFSTR("usingStandalone");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v28;
  v40[2] = CFSTR("forcedSMS");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trackEvent:withDictionary:", *MEMORY[0x1E0D38828], v30);

  return v32;
}

uint64_t __89__CKSOSUtilities_sendComposition_toConversation_useStandalone_shouldForceSMS_isCritical___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "guid");
}

- (void)isMMSEnabled
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "isMMSEnabled is deprecated and should not be used.", v1, 2u);
}

- (void)_sendMessageAndReturnGUIDs:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Failed to send message %@", (uint8_t *)&v2, 0xCu);
}

@end
