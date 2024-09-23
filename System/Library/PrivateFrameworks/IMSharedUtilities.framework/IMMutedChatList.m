@implementation IMMutedChatList

+ (IMMutedChatList)sharedList
{
  if (qword_1ECFC7298 != -1)
    dispatch_once(&qword_1ECFC7298, &unk_1E3FB3968);
  return (IMMutedChatList *)(id)qword_1ECFC72A0;
}

- (IMMutedChatList)init
{
  IMMutedChatList *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMMutedChatList;
  v2 = -[IMMutedChatList init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_19E2D13F0, CFSTR("com.apple.MobileSMS.CKDNDList.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)IMMutedChatList;
  -[IMMutedChatList dealloc](&v4, sel_dealloc);
}

- (id)muteIdentifiersForChatStyle:(unsigned __int8)a3 groupID:(id)a4 participantIDs:(id)a5 lastAddressedHandleID:(id)a6 originalGroupID:(id)a7 chatIdentifier:(id)a8
{
  int v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;

  v12 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v12 == 45)
  {
    if (objc_msgSend(v18, "length"))
      objc_msgSend(v19, "addObject:", v18);
  }
  else
  {
    if (objc_msgSend(v14, "length"))
      objc_msgSend(v19, "addObject:", v14);
    -[IMMutedChatList groupHashForParticipantIDs:lastAddressedHandleID:](self, "groupHashForParticipantIDs:lastAddressedHandleID:", v15, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "length"))
      objc_msgSend(v19, "addObject:", v20);
    if (objc_msgSend(v17, "length"))
      objc_msgSend(v19, "addObject:", v17);

  }
  v21 = (void *)objc_msgSend(v19, "copy");

  return v21;
}

- (id)mutedChatListFromPreferences
{
  void *v2;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CKDNDListKey"), CFSTR("com.apple.MobileSMS.CKDNDList"));
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA70];
  return v2;
}

- (BOOL)isMutedChatForChatIdentifier:(id)a3 chatStyle:(unsigned __int8)a4 groupID:(id)a5 participantIDs:(id)a6 lastAddressedHandleID:(id)a7 originalGroupID:(id)a8
{
  IMMutedChatList *v8;
  void *v9;

  v8 = self;
  -[IMMutedChatList muteIdentifiersForChatStyle:groupID:participantIDs:lastAddressedHandleID:originalGroupID:chatIdentifier:](self, "muteIdentifiersForChatStyle:groupID:participantIDs:lastAddressedHandleID:originalGroupID:chatIdentifier:", a4, a5, a6, a7, a8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = -[IMMutedChatList isMutedChatForMuteIdentifiers:](v8, "isMutedChatForMuteIdentifiers:", v9);

  return (char)v8;
}

- (BOOL)isMutedChatForMuteIdentifiers:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[IMMutedChatList unmuteDateForMuteIdentifiers:](self, "unmuteDateForMuteIdentifiers:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "compare:", v3) == -1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)unmuteDateForMuteIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[IMMutedChatList unmuteDateForMuteIdentifier:](self, "unmuteDateForMuteIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), (_QWORD)v12);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)unmuteDateForMuteIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[IMMutedChatList mutedChatListFromPreferences](self, "mutedChatListFromPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v7, "dateWithTimeIntervalSince1970:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)unmuteChatWithMuteIdentifiers:(id)a3 syncToPairedDevice:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v17 = v4;
    v18 = v6;
    -[IMMutedChatList mutedChatListFromPreferences](self, "mutedChatListFromPreferences");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v19, "mutableCopy");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (!v9)
      goto LABEL_18;
    v10 = *(_QWORD *)v21;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13 == 0;

        if (v14)
        {
          if (!IMOSLoggingEnabled())
            continue;
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v12;
            _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Can't unmute chat with identifier: %@, that wasn't muted to begin with...", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v7, "removeObjectForKey:", v12);
          if (!IMOSLoggingEnabled())
            continue;
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v12;
            _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Unmuting chat with identifier: %@", buf, 0xCu);
          }
        }

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (!v9)
      {
LABEL_18:

        v16 = (void *)objc_msgSend(v7, "copy");
        -[IMMutedChatList _synchronizeMutedChatList:syncToPairedDevice:](self, "_synchronizeMutedChatList:syncToPairedDevice:", v16, v17);

        v6 = v18;
        break;
      }
    }
  }

}

- (void)muteChatWithMuteIdentifiers:(id)a3 untilDate:(id)a4 syncToPairedDevice:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  IMMutedChatList *v24;
  _BOOL4 v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v5 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v26 = v8;
  if (objc_msgSend(v8, "count"))
  {
    if (!v9)
    {
      -[IMMutedChatList unmuteChatWithMuteIdentifiers:syncToPairedDevice:](self, "unmuteChatWithMuteIdentifiers:syncToPairedDevice:", v8, v5);
      goto LABEL_27;
    }
    v25 = v5;
    v27 = v9;
    v24 = self;
    -[IMMutedChatList mutedChatListFromPreferences](self, "mutedChatListFromPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v9, "timeIntervalSince1970");
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = v8;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (!v16)
      goto LABEL_25;
    v17 = *(_QWORD *)v29;
    while (1)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 && objc_msgSend(v14, "isEqualToNumber:", v20))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "Same unmute time, not updating", buf, 2u);
            }

          }
        }
        else
        {
          if (v13 <= 0.0)
          {
            objc_msgSend(v11, "removeObjectForKey:", v19);
            if (!IMOSLoggingEnabled())
              goto LABEL_23;
            OSLogHandleForIMFoundationCategory();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v33 = v27;
              v34 = 2112;
              v35 = v19;
              _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "Updating unmute time to %@ for chat with identifier: %@", buf, 0x16u);
            }
          }
          else
          {
            objc_msgSend(v11, "setObject:forKey:", v14, v19);
            if (!IMOSLoggingEnabled())
              goto LABEL_23;
            OSLogHandleForIMFoundationCategory();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v33 = v19;
              _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "Muting chat with identifier: %@", buf, 0xCu);
            }
          }

        }
LABEL_23:

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (!v16)
      {
LABEL_25:

        v23 = (void *)objc_msgSend(v11, "copy");
        -[IMMutedChatList _synchronizeMutedChatList:syncToPairedDevice:](v24, "_synchronizeMutedChatList:syncToPairedDevice:", v23, v25);

        v9 = v27;
        break;
      }
    }
  }
LABEL_27:

}

- (void)_synchronizeMutedChatList:(id)a3 syncToPairedDevice:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v9[16];

  v4 = a4;
  v6 = a3;
  CFPreferencesSetAppValue(CFSTR("CKDNDListKey"), v6, CFSTR("com.apple.MobileSMS.CKDNDList"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.MobileSMS.CKDNDList"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Synchronized Do Not Disturb list", v9, 2u);
    }

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.CKDNDList.changed"), 0, 0, 2u);
  if (v4)
    -[IMMutedChatList syncToPairedDeviceIncludingVersion:](self, "syncToPairedDeviceIncludingVersion:", 0);

}

- (id)groupHashForParticipantIDs:(id)a3 lastAddressedHandleID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "addObject:", v5);
  v8 = (void *)objc_msgSend(v7, "copy");
  IMSharedHelperGroupHashForHandleIDs(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_handleMutedChatListChanged
{
  dispatch_async(MEMORY[0x1E0C80D38], &unk_1E3FB15E8);
}

- (void)syncToPairedDeviceIncludingVersion:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a3;
  -[IMMutedChatList syncManager](self, "syncManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init((Class)MEMORY[0x1A1AE7D4C](CFSTR("NPSManager"), CFSTR("NanoPreferencesSync")));
    -[IMMutedChatList setSyncManager:](self, "setSyncManager:", v5);
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", CFSTR("CKDNDListKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
    objc_msgSend(v6, "addObject:", CFSTR("CKDNDMigrationKey"));
  objc_msgSend(v5, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.MobileSMS.CKDNDList"), v7);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "NPSManager synchronizedNanoDomain", v9, 2u);
    }

  }
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
  objc_storeStrong((id *)&self->_syncManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncManager, 0);
}

@end
