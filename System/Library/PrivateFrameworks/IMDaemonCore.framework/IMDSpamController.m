@implementation IMDSpamController

+ (id)sharedInstance
{
  if (qword_1ED935C50 != -1)
    dispatch_once(&qword_1ED935C50, &unk_1E9228BA8);
  return (id)qword_1ED935D78;
}

- (IMDSpamController)init
{
  IMDSpamController *v2;
  IMDSpamController *v3;
  CFMutableDictionaryRef Mutable;
  NSMutableDictionary *chatGUIDToSpamCheckTimerMap;
  CFMutableDictionaryRef v6;
  NSMutableDictionary *chatGUIDToCountMap;
  NSObject *v8;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IMDSpamController;
  v2 = -[IMDSpamController init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    if (!v2->_chatGUIDToSpamCheckTimerMap)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      chatGUIDToSpamCheckTimerMap = v3->_chatGUIDToSpamCheckTimerMap;
      v3->_chatGUIDToSpamCheckTimerMap = (NSMutableDictionary *)Mutable;

    }
    if (!v3->_chatGUIDToCountMap)
    {
      v6 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      chatGUIDToCountMap = v3->_chatGUIDToCountMap;
      v3->_chatGUIDToCountMap = (NSMutableDictionary *)v6;

    }
  }
  if (IMOSLoggingEnabled(-[IMDSpamController setSpamExtensionCutoffTime:](v3, "setSpamExtensionCutoffTime:", 10.0)))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Instantiated IMDSpamController", v10, 2u);
    }

  }
  return v3;
}

- (void)__queryServerForID:(id)a3 count:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Performing server query with alias: %@, count: %@", buf, 0x16u);
    }

  }
  if (IMStringIsEmail())
    v11 = MEMORY[0x1D17E94E0](v7);
  else
    v11 = MEMORY[0x1D17E94F8](v7, 0, 1);
  v12 = (void *)v11;
  v14 = v9;
  v13 = v9;
  IDSCheckiMessageUnknownSender();

}

- (void)_updateSpamCheckTimerWithInterval:(double)a3 forChatGUID:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *chatGUIDToSpamCheckTimerMap;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  IMDSpamController *v19;
  uint8_t buf[4];
  double v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3 >= 0.0)
  {
    v9 = objc_msgSend(v6, "length");
    v10 = IMOSLoggingEnabled(v9);
    if (!v9)
    {
      if (!v10)
        goto LABEL_22;
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v21 = *(double *)&v7;
        v22 = 2048;
        v23 = a3;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Stopping spam check for chatGUID: %@ interval: %f", buf, 0x16u);
      }
      goto LABEL_5;
    }
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v21 = a3;
        v22 = 2112;
        v23 = *(double *)&v7;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Scheduling a spam check with interval: %f for chatGUID: %@", buf, 0x16u);
      }

    }
    if (!self->_chatGUIDToSpamCheckTimerMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      chatGUIDToSpamCheckTimerMap = self->_chatGUIDToSpamCheckTimerMap;
      self->_chatGUIDToSpamCheckTimerMap = Mutable;

    }
    if (a3 <= 0.0)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = sub_1D144F4EC;
      v17[3] = &unk_1E9228750;
      v18 = v7;
      v19 = self;
      dispatch_async(MEMORY[0x1E0C80D38], v17);

    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_chatGUIDToSpamCheckTimerMap, "objectForKey:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "invalidate");
        -[NSMutableDictionary removeObjectForKey:](self->_chatGUIDToSpamCheckTimerMap, "removeObjectForKey:", v7);
      }
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D36AE0]), "initWithTimeInterval:name:shouldWake:target:selector:userInfo:", CFSTR("message-spam-check-timer"), 1, self, sel__spamCheckTimerFired_, v7, a3);

      -[NSMutableDictionary setObject:forKey:](self->_chatGUIDToSpamCheckTimerMap, "setObject:forKey:", v16, v7);
    }
  }
  else if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v21 = *(double *)&v7;
      v22 = 2048;
      v23 = a3;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Stopping spam check for chatGUID: %@ interval: %f", buf, 0x16u);
    }
LABEL_5:

  }
LABEL_22:

}

- (void)_spamCheckTimerFired:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[NSMutableDictionary removeObjectForKey:](self->_chatGUIDToSpamCheckTimerMap, "removeObjectForKey:", v5);
  IMComponentsFromChatGUID();
  v6 = 0;
  if (objc_msgSend(v6, "length"))
    -[IMDSpamController detectSpam:chatGUID:](self, "detectSpam:chatGUID:", v6, v5);

}

- (id)chatRegistry
{
  return +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
}

- (BOOL)_isDisabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("disable-auto-detect-spam"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (void)detectSpam:(id)a3 chatGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *chatGUIDToCountMap;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  IMDSpamController *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMDSpamController chatRegistry](self, "chatRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "existingChatWithGUID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "serviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D38F58]);

  if ((v11 & 1) == 0)
  {
    v12 = -[IMDSpamController _isDisabled](self, "_isDisabled");
    if (v12
      || (objc_msgSend(v9, "properties"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "objectForKey:", CFSTR("hasViewedPotentialSpamChat")),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "BOOLValue"),
          v14,
          v13,
          (v15 & 1) != 0))
    {
      if (IMOSLoggingEnabled(v12))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = -[IMDSpamController _isDisabled](self, "_isDisabled");
          objc_msgSend(v9, "properties");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          v20 = CFSTR("NO");
          *(_DWORD *)buf = 138412802;
          v36 = v7;
          v37 = 2112;
          if (v17)
            v20 = CFSTR("YES");
          v38 = v20;
          v39 = 2112;
          v40 = v18;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "don't try to detect spam for chat: %@, disabled: %@, properties: %@", buf, 0x20u);

        }
      }
      -[IMDSpamController chatGUIDToCountMap](self, "chatGUIDToCountMap");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeObjectForKey:", v7);
    }
    else
    {
      if (!self->_chatGUIDToCountMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        chatGUIDToCountMap = self->_chatGUIDToCountMap;
        self->_chatGUIDToCountMap = Mutable;

      }
      -[IMDSpamController chatGUIDToCountMap](self, "chatGUIDToCountMap");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "unsignedIntegerValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = sub_1D144F994;
      v31[3] = &unk_1E9228BF8;
      v28 = v7;
      v32 = v28;
      v33 = v9;
      v34 = self;
      -[IMDSpamController __queryServerForID:count:completion:](self, "__queryServerForID:count:completion:", v6, v27, v31);

      -[IMDSpamController chatGUIDToCountMap](self, "chatGUIDToCountMap");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26 + 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKey:", v30, v28);

      v21 = v32;
    }

  }
}

- (BOOL)shouldCheckForSpamWithExtensionInChat:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5
{
  return 0;
}

- (void)checkForSpamWithExtensionInChat:(id)a3 forMessageBody:(id)a4 sender:(id)a5 withCompletion:(id)a6
{
  if (a6)
    (*((void (**)(id, _QWORD, _QWORD))a6 + 2))(a6, 0, 0);
}

- (NSMutableDictionary)chatGUIDToSpamCheckTimerMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setChatGUIDToSpamCheckTimerMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)chatGUIDToCountMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setChatGUIDToCountMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (double)spamExtensionCutoffTime
{
  return self->_spamExtensionCutoffTime;
}

- (void)setSpamExtensionCutoffTime:(double)a3
{
  self->_spamExtensionCutoffTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatGUIDToCountMap, 0);
  objc_storeStrong((id *)&self->_chatGUIDToSpamCheckTimerMap, 0);
}

@end
