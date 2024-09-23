@implementation IMMessageNotificationTimeManager

+ (id)sharedInstance
{
  if (qword_1ECFC7688 != -1)
    dispatch_once(&qword_1ECFC7688, &unk_1E3FB3C88);
  return (id)qword_1ECFC75E8;
}

- (IMMessageNotificationTimeManager)init
{
  IMMessageNotificationTimeManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMMessageNotificationTimeManager;
  v2 = -[IMMessageNotificationTimeManager init](&v4, sel_init);
  if (v2)
    v2->_chatsStartTimeDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMMessageNotificationTimeManager;
  -[IMMessageNotificationTimeManager dealloc](&v3, sel_dealloc);
}

- (void)tearDownSessionForChatIdentifier:(id)a3
{
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](-[IMMessageNotificationTimeManager chatsStartTimeDictionary](self, "chatsStartTimeDictionary"), "count")&& -[NSMutableDictionary objectForKey:](-[IMMessageNotificationTimeManager chatsStartTimeDictionary](self, "chatsStartTimeDictionary"), "objectForKey:", a3))
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = 138412290;
        v7 = a3;
        _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Tearing down session for chatIdentifier %@", (uint8_t *)&v6, 0xCu);
      }
    }
    -[NSMutableDictionary removeObjectForKey:](-[IMMessageNotificationTimeManager chatsStartTimeDictionary](self, "chatsStartTimeDictionary"), "removeObjectForKey:", a3);
  }
}

- (void)setDate:(id)a3 forChatIdentifier:(id)a4
{
  IMMessageNotificationTimer *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "length"))
  {
    v7 = -[IMMessageNotificationTimer initWithDate:]([IMMessageNotificationTimer alloc], "initWithDate:", a3);
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = 138412546;
        v11 = v7;
        v12 = 2112;
        v13 = a4;
        _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Setting current notification object %@ for chatIdentifier %@", (uint8_t *)&v10, 0x16u);
      }
    }
    -[NSMutableDictionary setObject:forKey:](-[IMMessageNotificationTimeManager chatsStartTimeDictionary](self, "chatsStartTimeDictionary"), "setObject:forKey:", v7, a4);

  }
  else if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = a4;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Passed in chatIdentifier is not valid %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (BOOL)_isToneToggleSwitchOn
{
  return 1;
}

- (int64_t)_getTimeWindowOverride
{
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

- (int64_t)_getToneTimeWindow
{
  int64_t v2;
  int64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = -[IMMessageNotificationTimeManager _getTimeWindowOverride](self, "_getTimeWindowOverride");
  if (v2 == -1)
    return 180;
  v3 = v2;
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"), "isInternalInstall"))
    return 180;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "On internal install, overriding default time window to be %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

- (BOOL)_shouldSendNotificationForChatIdentifier:(id)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  BOOL v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  char v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableDictionary objectForKey:](-[IMMessageNotificationTimeManager chatsStartTimeDictionary](self, "chatsStartTimeDictionary"), "objectForKey:", a3);
  v6 = IMOSLoggingEnabled();
  if (!v5)
  {
    if (!v6)
      return 0;
    v21 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      return 0;
    v36 = 138412290;
    v37 = (uint64_t)a3;
    v22 = "Could not find a notification object for chatIdentifier %@, should not send notification";
    v23 = v21;
    v24 = 12;
    goto LABEL_32;
  }
  if (v6)
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v36 = 138412546;
      v37 = objc_msgSend(v5, "date");
      v38 = 2112;
      v39 = objc_msgSend(v5, "numberDingsLeft");
      _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Looking at notification object with previousDate %@, numberDingsLeft %@", (uint8_t *)&v36, 0x16u);
    }
  }
  v8 = -[IMMessageNotificationTimeManager _isToneToggleSwitchOn](self, "_isToneToggleSwitchOn");
  v9 = -[IMMessageNotificationTimeManager _getToneTimeWindow](self, "_getToneTimeWindow");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSinceDate:", objc_msgSend(v5, "date"));
  v11 = v10;
  v12 = (double)v9;
  v13 = v10 >= (double)v9;
  v14 = objc_msgSend(v5, "areDingsRemaining");
  if (!v8 || v13 || ((v14 ^ 1) & 1) != 0)
  {
    v25 = v11 >= v12 || !v8;
    v26 = IMOSLoggingEnabled();
    if ((v25 & 1) != 0)
    {
      if (v11 >= v12)
      {
        if (v26)
        {
          v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
            v29 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
            v36 = 138412546;
            v37 = v28;
            v38 = 2112;
            v39 = v29;
            _os_log_impl(&dword_19E239000, v27, OS_LOG_TYPE_INFO, "Time interval since then %@ is < than timeWindow %@, should send is NO, removing from dicitonary", (uint8_t *)&v36, 0x16u);
          }
        }
        -[IMMessageNotificationTimeManager tearDownSessionForChatIdentifier:](self, "tearDownSessionForChatIdentifier:", a3);
        return 0;
      }
      if (!v26)
        return 0;
      v30 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        return 0;
      v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v34 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
      v36 = 138412546;
      v37 = v33;
      v38 = 2112;
      v39 = v34;
      v22 = "Time interval since then %@ is NOT < than timeWindow %@, but tone toggle is off so should send is NO, but no"
            "t removing from dictionary";
    }
    else
    {
      if (!v26)
        return 0;
      v30 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        return 0;
      v31 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
      v36 = 138412546;
      v37 = v31;
      v38 = 2112;
      v39 = v32;
      v22 = "Time interval since then %@ is NOT < than timeWindow %@, tone toggle is on but no dings left so should send "
            "is NO, but not removing from dictionary";
    }
    v23 = v30;
    v24 = 22;
LABEL_32:
    _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v36, v24);
    return 0;
  }
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
      v36 = 138412546;
      v37 = v16;
      v38 = 2112;
      v39 = v17;
      _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Time interval since then %@ is NOT < than timeWindow %@, tone toggle is on so should send is YES, but not removing from dictionary", (uint8_t *)&v36, 0x16u);
    }
  }
  objc_msgSend(v5, "reduceNumberDingsLeft");
  if (!IMOSLoggingEnabled())
    return 1;
  v18 = OSLogHandleForIMFoundationCategory();
  v19 = 1;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v20 = objc_msgSend(v5, "numberDingsLeft");
    v36 = 138412546;
    v37 = (uint64_t)a3;
    v38 = 2112;
    v39 = v20;
    _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "Num dings left after sending ding tone for chatIdentifier %@ is %@", (uint8_t *)&v36, 0x16u);
  }
  return v19;
}

- (void)setLatestNotificationIDSTokenURI:(id)a3
{
  NSObject *v5;
  NSString *latestIDSTokenURI;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[IMMessageNotificationController audioAccessoryDeviceWithTokenURIExists:](+[IMMessageNotificationController sharedInstance](IMMessageNotificationController, "sharedInstance"), "audioAccessoryDeviceWithTokenURIExists:", a3))
  {
    -[IMMessageNotificationTimeManager setLatestIDSTokenURI:](self, "setLatestIDSTokenURI:", a3);
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        latestIDSTokenURI = self->_latestIDSTokenURI;
        v7 = 138412290;
        v8 = latestIDSTokenURI;
        _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Set latetsIDSTokenURI to %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (void)sendNotificationMessageIfNeededForIncomingMessageFromChatIdentifier:(id)a3
{
  NSObject *v5;
  NSString *latestIDSTokenURI;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->_latestIDSTokenURI, "length")
    && -[IMMessageNotificationTimeManager _shouldSendNotificationForChatIdentifier:](self, "_shouldSendNotificationForChatIdentifier:", a3))
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        latestIDSTokenURI = self->_latestIDSTokenURI;
        v7 = 138412290;
        v8 = latestIDSTokenURI;
        _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Sending incoming message notification to IDS token URI %@", (uint8_t *)&v7, 0xCu);
      }
    }
    -[IMMessageNotificationController sendNotificationMessageToTokenURI:withCommmand:](+[IMMessageNotificationController sharedInstance](IMMessageNotificationController, "sharedInstance"), "sendNotificationMessageToTokenURI:withCommmand:", self->_latestIDSTokenURI, 0);
  }
}

- (void)acquireAssertionToUnsuspendProcess
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_time_t v15;
  _QWORD v16[5];
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v2 = objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", CFSTR("com.apple.MobileSMS"));
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D87D68], "handleForPredicate:error:", v2, &v17);
  if (objc_msgSend(v3, "pid"))
  {
    v4 = objc_msgSend(v3, "pid");
    v5 = objc_alloc(MEMORY[0x1E0D87C98]);
    v6 = objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", v4);
    v20[0] = objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.MobileSMS"), CFSTR("IncomingMessage"));
    v7 = (void *)objc_msgSend(v5, "initWithExplanation:target:attributes:", CFSTR("incoming message assertion for MobileSMS"), v6, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1));
    LOBYTE(v6) = objc_msgSend(v7, "acquireWithError:", &v17);
    v8 = IMOSLoggingEnabled();
    if ((v6 & 1) != 0)
    {
      if (!v8)
        goto LABEL_13;
      v9 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v10 = "Acquired unsuspend assertion";
      v11 = v9;
      v12 = 2;
    }
    else
    {
      if (!v8)
        goto LABEL_13;
      v14 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        goto LABEL_13;
      *(_DWORD *)buf = 138412290;
      v19 = v17;
      v10 = "Failed to acquire unsuspend assertion %@";
      v11 = v14;
      v12 = 12;
    }
    _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, v10, buf, v12);
LABEL_13:
    v15 = dispatch_time(0, 3000000000);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_19E2FED34;
    v16[3] = &unk_1E3FB58C8;
    v16[4] = v7;
    dispatch_after(v15, MEMORY[0x1E0C80D38], v16);
    return;
  }
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Failed to get pid of MobileSMS", buf, 2u);
    }
  }
}

- (NSMutableDictionary)chatsStartTimeDictionary
{
  return self->_chatsStartTimeDictionary;
}

- (void)setChatsStartTimeDictionary:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)latestIDSTokenURI
{
  return self->_latestIDSTokenURI;
}

- (void)setLatestIDSTokenURI:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
