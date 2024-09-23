@implementation IMDBadgeUtilities

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (BOOL)isInAppleStoreDemoMode
{
  if (qword_1ED9360B8 != -1)
    dispatch_once(&qword_1ED9360B8, &unk_1E922F528);
  return byte_1ED936118;
}

- (void)clearFailureBadge
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D141B2A8;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)checkIfUnexpectedlyLoggedOut
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D141B220;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_updateBadge
{
  _BOOL8 v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t unreadCount;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[IMDBadgeUtilities _shouldShowFailureString](self, "_shouldShowFailureString");
  if (v3)
  {
    MEMORY[0x1E0DE7D20](self, sel__postBadgeString_);
  }
  else
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    unreadCount = self->_unreadCount;
    if (self->_isStewieActive)
    {
      -[IMDBadgeUtilities pendingSatelliteMessagesPerService](self, "pendingSatelliteMessagesPerService");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = sub_1D15EB094;
      v8[3] = &unk_1E922F4C8;
      v8[4] = &v9;
      objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

    }
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = v10[3];
        *(_DWORD *)buf = 134217984;
        v14 = v6;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Updating unread message count badge to %ld", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10[3]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDBadgeUtilities _postBadgeNumber:](self, "_postBadgeNumber:", v7);

    _Block_object_dispose(&v9, 8);
  }
}

- (BOOL)_shouldShowFailureString
{
  void *v3;
  char v4;
  _BOOL8 v5;
  NSObject *v6;
  _BOOL4 showingFailure;
  _BOOL4 v8;
  const __CFString *v9;
  const __CFString *v10;
  int v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[IMDBadgeUtilities isInAppleStoreDemoMode](self, "isInAppleStoreDemoMode")
    || (objc_msgSend(MEMORY[0x1E0D396C0], "sharedManager"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isAssistiveAccessRunning"),
        v3,
        (v4 & 1) != 0))
  {
    LOBYTE(v5) = 0;
  }
  else if (self->_showingFailure
         || (v5 = -[IMDBadgeUtilities _isUnexpectedlyLoggedOut](self, "_isUnexpectedlyLoggedOut")))
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        showingFailure = self->_showingFailure;
        v8 = -[IMDBadgeUtilities _isUnexpectedlyLoggedOut](self, "_isUnexpectedlyLoggedOut");
        v9 = CFSTR("YES");
        if (showingFailure)
          v10 = CFSTR("YES");
        else
          v10 = CFSTR("NO");
        if (!v8)
          v9 = CFSTR("NO");
        v12 = 138412546;
        v13 = v10;
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "_shouldShowFailureString _showingFailure %@ _isUnexpectedlyLoggedOut %@ ", (uint8_t *)&v12, 0x16u);
      }

    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)_postBadgeNumber:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Call notification center to post badge number %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMDBadgeUtilities notificationCenter](self, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBadgeCount:withCompletionHandler:", objc_msgSend(v4, "integerValue"), &unk_1E922F4E8);

}

- (BOOL)_isUnexpectedlyLoggedOut
{
  return 0;
}

- (void)_clearFailureBadge
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      if (self->_showingFailure)
        v4 = CFSTR("YES");
      else
        v4 = CFSTR("NO");
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Clearing failure badge, old value = %@", (uint8_t *)&v5, 0xCu);
    }

  }
  self->_showingFailure = 0;
  -[IMDBadgeUtilities _updateBadge](self, "_updateBadge");
}

- (void)_checkIfUnexpectedlyLoggedOut
{
  BOOL v3;

  v3 = (objc_msgSend((id)objc_opt_class(), "_iMessageEnabled") & 1) == 0
    && (objc_msgSend((id)objc_opt_class(), "_isTryingToLogin") & 1) == 0
    && (objc_msgSend((id)objc_opt_class(), "_iMessageFailedAccountIsIrreparable") & 1) == 0
    && (objc_msgSend((id)objc_opt_class(), "_isUserIntentNotLoggedOut") & 1) != 0;
  self->_unexpectedlyLoggedOut = v3;
  -[IMDBadgeUtilities _updateBadge](self, "_updateBadge");
}

+ (BOOL)_isUserIntentNotLoggedOut
{
  if (IMGetUserLoginIntent() == 2)
    return 0;
  else
    return IMGetUserIgnoreLogoutIntent() ^ 1;
}

+ (BOOL)_isUsableSendingForAccount:(id)a3
{
  id v3;
  void *v4;
  int v5;
  char v6;
  void *v7;
  void *v8;
  char v9;

  v3 = a3;
  if (!objc_msgSend(v3, "isActive"))
    goto LABEL_14;
  if (!objc_msgSend(v3, "accountType"))
    goto LABEL_9;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsRegistration");

  if (!v5)
    goto LABEL_9;
  if (objc_msgSend(v3, "accountType") == 2)
  {
    if (objc_msgSend(v3, "registrationStatus") != 5)
    {
      v6 = objc_msgSend(v3, "registrationStatus") == 2;
      goto LABEL_15;
    }
LABEL_9:
    v6 = 1;
    goto LABEL_15;
  }
  if (objc_msgSend(v3, "accountType") == 1)
  {
    if (objc_msgSend(v3, "registrationStatus") == 2)
      goto LABEL_9;
    if (objc_msgSend(v3, "registrationStatus") != 5)
    {
LABEL_14:
      v6 = 0;
      goto LABEL_15;
    }
  }
  objc_msgSend(v3, "aliases");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToIgnoringCase:", *MEMORY[0x1E0D36F80]);

      v6 = v9 ^ 1;
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

LABEL_15:
  return v6;
}

+ (BOOL)_isTryingToLogin
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_accountsArrayForServiceIMessage");
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "loginStatus", (_QWORD)v7) == 3)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (BOOL)_iMessageFailedAccountIsIrreparable
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_accountsArrayForServiceIMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "session");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "registrationStatus");

        if (v11 == -1)
        {
          objc_msgSend(v9, "session");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "registrationError") != 26;

          v6 |= v13;
          v5 = 1;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }

  return v5 & ~v6 & 1;
}

+ (BOOL)_iMessageEnabled
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_accountsArrayForServiceIMessage");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend((id)objc_opt_class(), "_isUsableSendingForAccount:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), (_QWORD)v9) & 1) != 0)
        {
          v7 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

+ (id)_accountsArrayForServiceIMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceWithName:", *MEMORY[0x1E0D38F68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountsForService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sharedInstance
{
  if (qword_1ED935D40 != -1)
    dispatch_once(&qword_1ED935D40, &unk_1E922F4A0);
  return (id)qword_1ED935E80;
}

- (IMDBadgeUtilities)init
{
  void *v3;
  IMDBadgeUtilities *v4;

  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IMDBadgeUtilities initWithMessageStore:](self, "initWithMessageStore:", v3);

  return v4;
}

- (IMDBadgeUtilities)initWithMessageStore:(id)a3
{
  return (IMDBadgeUtilities *)MEMORY[0x1E0DE7D20](self, sel_initWithMessageStore_defaultsStore_);
}

- (IMDBadgeUtilities)initWithMessageStore:(id)a3 defaultsStore:(id)a4
{
  id v6;
  id v7;
  IMDBadgeUtilities *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v11;
  NSMutableDictionary *pendingSatelliteMessagesPerService;
  uint64_t v13;
  NSObject *v14;
  void *unreadCount;
  uint64_t v16;
  UNUserNotificationCenter *notificationCenter;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v25;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)IMDBadgeUtilities;
  v8 = -[IMDBadgeUtilities init](&v27, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_create("IMDBadgeUtilitiesQueue", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v8->_messageStore, v6);
    v8->_unreadCount = objc_msgSend(v6, "unreadMessagesCount");
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingSatelliteMessagesPerService = v8->_pendingSatelliteMessagesPerService;
    v8->_pendingSatelliteMessagesPerService = v11;

    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        unreadCount = (void *)v8->_unreadCount;
        *(_DWORD *)buf = 134217984;
        v29 = unreadCount;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Initializing IMDBadgeUtilities with unread count: %ld", buf, 0xCu);
      }

    }
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.MobileSMS"));
    notificationCenter = v8->_notificationCenter;
    v8->_notificationCenter = (UNUserNotificationCenter *)v16;

    +[IMDChorosController sharedController](IMDChorosController, "sharedController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:", v8);

    *(_WORD *)&v8->_showingFailure = 0;
    v8->_addedObserverForUnexpectedlyLoggedOut = 0;
    objc_storeStrong((id *)&v8->_sharedDefaultsInstance, a4);
    v19 = -[IMDBadgeUtilities _savedFailureDate](v8, "_savedFailureDate");
    v8->_lastFailedMessageDate = v19;
    if (v19 <= 0)
    {
      v20 = objc_msgSend(v6, "lastFailedMessageDate");
      v8->_lastFailedMessageDate = v20;
      v19 = -[IMDBadgeUtilities _saveFailureDate:](v8, "_saveFailureDate:", v20);
    }
    if (IMOSLoggingEnabled(v19))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8->_lastFailedMessageDate);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "lastFailedMessageDate"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v22;
        v30 = 2112;
        v31 = v23;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "_lastFailedMessageDate saved date %@  last failed message data in DB %@ ", buf, 0x16u);

      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)sub_1D141AB7C, CFSTR("__kMessagesBadgeControllerClearFailureBadgeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v25 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v25, v8, (CFNotificationCallback)sub_1D15EA9D4, CFSTR("__kIMDBadgeUtilitiesRebuildUnreadMessageCountNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[IMDBadgeUtilities _updateBadge](v8, "_updateBadge");
  }

  return v8;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;
  __CFNotificationCenter *v6;
  __CFNotificationCenter *v7;
  objc_super v8;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("__kMessagesBadgeControllerClearFailureBadgeNotification"), 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, CFSTR("__kIMDBadgeUtilitiesRebuildUnreadMessageCountNotification"), 0);
  if (self->_addedObserverForUnexpectedlyLoggedOut)
  {
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v5, self, CFSTR("com.apple.IMSharedUtilities.IMUserLoginIntentChangedInternal"), 0);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v6, self, CFSTR("__kIMDBadgeUtilitiesLoginStatusChangedNotification"), 0);
    v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v7, self, CFSTR("__kIMDBadgeUtilitiesOperationalAccountsChangedNotification"), 0);
  }
  v8.receiver = self;
  v8.super_class = (Class)IMDBadgeUtilities;
  -[IMDBadgeUtilities dealloc](&v8, sel_dealloc);
}

- (void)updateBadgeForUnreadCountChangeIfNeeded:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D15EAB84;
  v4[3] = &unk_1E922A7E8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_updateBadgeForUnreadCountChangeIfNeeded:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D15EABE8;
  v4[3] = &unk_1E922A7E8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)updateBadgeForLastFailedMessageDateChangeIfNeeded:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D15EADD0;
  v4[3] = &unk_1E922A7E8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_updateBadgeForLastFailedMessageDateChangeIfNeeded:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D15EAE34;
  v4[3] = &unk_1E922A7E8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)updateBadgeInCaseOfMistakenLoginInvalidation
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15EAF9C;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)updateBadgeForPendingSatelliteMessagesIfNeeded:(int64_t)a3 onService:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15EB030;
  block[3] = &unk_1E9229A70;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)_postBadgeString:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDBadgeUtilities notificationCenter](self, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Call notification center to post badge string %@", buf, 0xCu);
    }

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D15EB224;
  v9[3] = &unk_1E9228750;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

- (BOOL)isUnexpectedlyLoggedOut
{
  uint64_t v3;
  NSObject *queue;
  char v5;
  _QWORD block[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  _QWORD v12[5];

  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D15EB424;
  v12[3] = &unk_1E92287A0;
  v12[4] = self;
  if (qword_1ED936288 != -1)
    dispatch_once(&qword_1ED936288, v12);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  queue = self->_queue;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = sub_1D15EB5B8;
  block[3] = &unk_1E922EBF0;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(queue, block);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)_rebuildUnreadMessageCount
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_messageStore);
  objc_msgSend(WeakRetained, "rebuildUnreadMessageCount");

}

- (void)_compareLastFailureDateAndUpdateBadge:(int64_t)a3
{
  int64_t lastFailedMessageDate;
  BOOL v4;

  lastFailedMessageDate = self->_lastFailedMessageDate;
  if (lastFailedMessageDate < a3)
  {
    self->_lastFailedMessageDate = a3;
    v4 = 1;
LABEL_5:
    self->_showingFailure = v4;
    goto LABEL_6;
  }
  if (lastFailedMessageDate > a3)
  {
    v4 = 0;
    goto LABEL_5;
  }
LABEL_6:
  -[IMDBadgeUtilities _updateBadge](self, "_updateBadge");
}

- (void)_stopSuppressingSound
{
  IMSetDomainValueForKey();
  IMSetDomainValueForKey();
}

- (void)_cacheFailureDate:(int64_t)a3
{
  NSObject *v5;
  int64_t lastFailedMessageDate;
  int v7;
  int64_t v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3 >= 1)
  {
    if (IMOSLoggingEnabled(self))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        lastFailedMessageDate = self->_lastFailedMessageDate;
        v7 = 134218240;
        v8 = lastFailedMessageDate;
        v9 = 2048;
        v10 = a3;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Cached failure id %lld    alert failure id %lld", (uint8_t *)&v7, 0x16u);
      }

    }
    -[IMDBadgeUtilities _saveFailureDate:](self, "_saveFailureDate:", a3);
  }
}

- (IMDefaults)sharedDefaultsInstance
{
  IMDefaults *sharedDefaultsInstance;
  IMDefaults *v4;
  IMDefaults *v5;

  sharedDefaultsInstance = self->_sharedDefaultsInstance;
  if (!sharedDefaultsInstance)
  {
    objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
    v4 = (IMDefaults *)objc_claimAutoreleasedReturnValue();
    v5 = self->_sharedDefaultsInstance;
    self->_sharedDefaultsInstance = v4;

    sharedDefaultsInstance = self->_sharedDefaultsInstance;
  }
  return sharedDefaultsInstance;
}

- (int64_t)_savedFailureDate
{
  void *v2;
  void *v3;
  int64_t v4;

  -[IMDBadgeUtilities sharedDefaultsInstance](self, "sharedDefaultsInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValueFromDomain:forKey:", CFSTR("com.apple.imdbadgeutilities"), CFSTR("lastMadridFailureID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "longLongValue");
  else
    v4 = -1;

  return v4;
}

- (void)_saveFailureDate:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDBadgeUtilities sharedDefaultsInstance](self, "sharedDefaultsInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forDomain:forKey:", v5, CFSTR("com.apple.imdbadgeutilities"), CFSTR("lastMadridFailureID"));

}

- (BOOL)_isUnexpectedlyLogOutValue
{
  return self->_unexpectedlyLoggedOut;
}

- (void)satelliteStateDidChange:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D15EB908;
  v4[3] = &unk_1E922F550;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (unint64_t)unreadCount
{
  return self->_unreadCount;
}

- (void)setUnreadCount:(unint64_t)a3
{
  self->_unreadCount = a3;
}

- (int64_t)lastFailedMessageDate
{
  return self->_lastFailedMessageDate;
}

- (void)setLastFailedMessageDate:(int64_t)a3
{
  self->_lastFailedMessageDate = a3;
}

- (BOOL)isShowingFailure
{
  return self->_showingFailure;
}

- (void)setShowingFailure:(BOOL)a3
{
  self->_showingFailure = a3;
}

- (void)setUnexpectedlyLoggedOut:(BOOL)a3
{
  self->_unexpectedlyLoggedOut = a3;
}

- (BOOL)addedObserverForUnexpectedlyLoggedOut
{
  return self->_addedObserverForUnexpectedlyLoggedOut;
}

- (void)setAddedObserverForUnexpectedlyLoggedOut:(BOOL)a3
{
  self->_addedObserverForUnexpectedlyLoggedOut = a3;
}

- (BOOL)isStewieActive
{
  return self->_isStewieActive;
}

- (void)setIsStewieActive:(BOOL)a3
{
  self->_isStewieActive = a3;
}

- (NSMutableDictionary)pendingSatelliteMessagesPerService
{
  return self->_pendingSatelliteMessagesPerService;
}

- (void)setPendingSatelliteMessagesPerService:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSatelliteMessagesPerService, a3);
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (void)setSharedDefaultsInstance:(id)a3
{
  objc_storeStrong((id *)&self->_sharedDefaultsInstance, a3);
}

- (IMDMessageStore)messageStore
{
  return (IMDMessageStore *)objc_loadWeakRetained((id *)&self->_messageStore);
}

- (void)setMessageStore:(id)a3
{
  objc_storeWeak((id *)&self->_messageStore, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageStore);
  objc_storeStrong((id *)&self->_sharedDefaultsInstance, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_pendingSatelliteMessagesPerService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
