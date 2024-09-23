@implementation IMDChat

- (unint64_t)unreadCount
{
  unint64_t unreadCount;

  -[NSRecursiveLock lock](self->_lock, "lock");
  unreadCount = self->_unreadCount;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return unreadCount;
}

- (id)groupPhotoGuid
{
  void *v2;
  void *v3;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D37788]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isBlackholed
{
  BOOL isBlackholed;

  -[NSRecursiveLock lock](self->_lock, "lock");
  isBlackholed = self->_isBlackholed;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return isBlackholed;
}

- (int64_t)compareBySequenceNumberAndDateDescending:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  -[IMDChat lastScheduledMessageCreatedDate](self, "lastScheduledMessageCreatedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastScheduledMessageCreatedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat lastMessage](self, "lastMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "time");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "laterDate:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = v9;
  }

  objc_msgSend(v4, "lastMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "time");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "laterDate:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = v12;
  }

  if (v11 && v8)
    goto LABEL_7;
  if (v11 | v8)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "lastMessageTimeStampOnLoad"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (uint64_t)v13;
LABEL_8:
      v14 = objc_msgSend(v13, "compare:", v8);
      if (v14)
        goto LABEL_23;
      goto LABEL_15;
    }
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)-[IMDChat lastMessageTimeStampOnLoad](self, "lastMessageTimeStampOnLoad"));
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v13 = (void *)v11;
      goto LABEL_8;
    }
  }
  else
  {
    v15 = objc_msgSend(v4, "lastMessageTimeStampOnLoad");
    if (v15 != -[IMDChat lastMessageTimeStampOnLoad](self, "lastMessageTimeStampOnLoad"))
    {
      v21 = objc_msgSend(v4, "lastMessageTimeStampOnLoad");
      v11 = 0;
      v8 = 0;
      if (v21 < -[IMDChat lastMessageTimeStampOnLoad](self, "lastMessageTimeStampOnLoad"))
        v14 = -1;
      else
        v14 = 1;
      goto LABEL_23;
    }
    v11 = 0;
    v8 = 0;
  }
LABEL_15:
  -[IMDChat lastMessage](self, "lastMessage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "messageID");

  objc_msgSend(v4, "lastMessage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "messageID");

  v20 = -1;
  if (v19 >= v17)
    v20 = 1;
  if (v19 == v17)
    v14 = 0;
  else
    v14 = v20;
LABEL_23:

  return v14;
}

- (NSString)groupID
{
  void *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSString copy](self->_groupID, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSString)serviceName
{
  void *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSString copy](self->_serviceName, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSString)chatIdentifier
{
  void *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSString copy](self->_chatIdentifier, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSString)deviceIndependentID
{
  if (-[IMDChat isGroupChat](self, "isGroupChat"))
    -[IMDChat groupID](self, "groupID");
  else
    -[IMDChat persistentID](self, "persistentID");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)pinningIdentifier
{
  void *v3;
  void *v4;

  if (-[IMDChat isGroupChat](self, "isGroupChat") && -[IMDChat isSMS](self, "isSMS"))
  {
    -[IMDChat participants](self, "participants");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat _sortedParticipantIDHashForParticipants:usesPersonCentricID:](self, "_sortedParticipantIDHashForParticipants:usesPersonCentricID:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[IMDChat deviceIndependentID](self, "deviceIndependentID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (BOOL)isGroupChat
{
  return -[IMDChat style](self, "style") != 45;
}

- (IMMessageItem)lastMessage
{
  IMMessageItem *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = self->_lastMessage;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (unsigned)style
{
  unsigned __int8 style;

  -[NSRecursiveLock lock](self->_lock, "lock");
  style = self->_style;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return style;
}

- (BOOL)isSMS
{
  void *v2;
  char v3;

  -[IMDChat serviceName](self, "serviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D38F58]);

  return v3;
}

- (id)copyDictionaryRepresentation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;

  v3 = a3;
  -[IMDChat accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    v7 = (void *)-[NSMutableDictionary mutableCopy](self->_chatInfo, "mutableCopy");
    if (v3)
    {
      -[IMDChat lastMessage](self, "lastMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copyDictionaryRepresentation");

      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("lastMessage"));
    }
    -[IMDChat personCentricID](self, "personCentricID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D37830]);

    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
  else
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1D166A5CC();

    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1D166A548(self, v12);

    IMLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1D166A4C4(self, v13);

    return 0;
  }
  return v7;
}

- (IMDAccount)account
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  IMDChat *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[IMDChat accountID](self, "accountID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_3;
  +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountForAccountID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_3:
    -[IMDChat serviceName](self, "serviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_10;
    +[IMDServiceController sharedController](IMDServiceController, "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat serviceName](self, "serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceWithName:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "accountsForService:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "__imFirstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v17 = 138412546;
          v18 = self;
          v19 = 2112;
          v20 = v6;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_DEBUG, "Reassociating chat: %@  to account: %@", (uint8_t *)&v17, 0x16u);
        }

      }
      objc_msgSend(v6, "accountID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat setAccountID:](self, "setAccountID:", v14);

      objc_msgSend(v10, "internalName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat setServiceName:](self, "setServiceName:", v15);

    }
    else
    {
LABEL_10:
      v6 = 0;
    }
  }
  return (IMDAccount *)v6;
}

- (NSString)accountID
{
  NSString *accountID;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  IMDChat *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  accountID = self->_accountID;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  if (accountID)
    return self->_accountID;
  -[IMDChat serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return (NSString *)0;
  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat serviceName](self, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return (NSString *)0;
  +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountsForService:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "__imFirstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138412546;
      v17 = self;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_DEBUG, "Reassociating chat: %@  to account: %@", (uint8_t *)&v16, 0x16u);
    }

  }
  objc_msgSend(v11, "accountID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat setAccountID:](self, "setAccountID:", v13);

  objc_msgSend(v8, "internalName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat setServiceName:](self, "setServiceName:", v14);

  objc_msgSend(v11, "accountID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (NSString)personCentricID
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0D39740];
  -[IMDChat guid](self, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat chatIdentifier](self, "chatIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IMDChat style](self, "style");
  -[IMDChat groupID](self, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IMDChat lastKnownHybridState](self, "lastKnownHybridState");
  -[IMDChat account](self, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "groupsMergeDisplayNames");
  -[IMDChat _mergeParticipantIDs](self, "_mergeParticipantIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = v11;
  objc_msgSend(v16, "personCentricIDForChatWithGUID:chatIdentifier:chatStyle:groupID:displayName:lastKnownToBeHybrid:mergeDisplayNames:participantIDs:", v3, v4, v5, v6, v7, v8, v15, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (BOOL)lastKnownHybridState
{
  void *v2;
  void *v3;
  char v4;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E0D377E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSDictionary)properties
{
  NSDictionary *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = self->_properties;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (NSString)displayName
{
  void *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSString copy](self->_displayName, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (id)_sortedParticipantIDHashForParticipants:(id)a3 usesPersonCentricID:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "personCentricID", (_QWORD)v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "length");

        if (v14)
          v15 = !v4;
        else
          v15 = 1;
        if (v15)
        {
          objc_msgSend(v12, "ID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
            continue;
          objc_msgSend(v12, "ID");
          v17 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v12, "personCentricID");
          v17 = objc_claimAutoreleasedReturnValue();
        }
        v18 = (void *)v17;
        objc_msgSend(v6, "addObject:", v17);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  IMSHA1HashFromStrings();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_mergeParticipantIDs
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[IMDChat participants](self, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[IMDChat participants](self, "participants", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "personCentricID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "__im_isSipHandle") & 1) != 0)
        {

        }
        else
        {
          v13 = IMSharedHelperContactsBasedMergingEnabled();

          if (v13)
          {
            objc_msgSend(v11, "CNContactID");
            v14 = objc_claimAutoreleasedReturnValue();
LABEL_12:
            v15 = (__CFString *)v14;
            goto LABEL_14;
          }
        }
        if (IMSharedHelperPersonCentricMergingEnabled())
        {
          objc_msgSend(v11, "personCentricID");
          v14 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        v15 = 0;
LABEL_14:
        if (!-[__CFString length](v15, "length"))
        {
          objc_msgSend(v11, "ID");
          v16 = objc_claimAutoreleasedReturnValue();

          v15 = (__CFString *)v16;
        }
        if (-[__CFString length](v15, "length"))
          v17 = v15;
        else
          v17 = CFSTR("invalidHandle");
        objc_msgSend(v5, "addObject:", v17);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSArray)participants
{
  void *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSArray copy](self->_participants, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSArray *)v3;
}

- (NSString)originalGroupID
{
  void *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSString copy](self->_originalGroupID, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSString)guid
{
  void *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSString copy](self->_guid, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (int64_t)state
{
  int64_t state;

  -[NSRecursiveLock lock](self->_lock, "lock");
  state = self->_state;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return state;
}

- (int64_t)lastMessageTimeStampOnLoad
{
  int64_t lastMessageTimeStampOnLoad;

  -[NSRecursiveLock lock](self->_lock, "lock");
  lastMessageTimeStampOnLoad = self->_lastMessageTimeStampOnLoad;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return lastMessageTimeStampOnLoad;
}

- (id)_findChatParticipantsWithFromID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[IMDChat participants](self, "participants", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "ID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(v11, "_stripFZIDPrefix");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (v4)
  {
    objc_msgSend(v4, "_stripFZIDPrefix");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

  }
  return v5;
}

- (void)_setParticipantVersion:(int64_t)a3
{
  int v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = IMOSLoggingEnabled(self);
  if (a3 < 0)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Received a negative participant version. This is not right!", (uint8_t *)&v9, 2u);
      }

    }
  }
  else
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        -[IMDChat groupID](self, "groupID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v7;
        v11 = 2048;
        v12 = a3;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Setting participant version of chat %@ to %ld", (uint8_t *)&v9, 0x16u);

      }
    }
    -[IMDChat setGroupParticipantVersion:](self, "setGroupParticipantVersion:", a3);
  }
}

- (void)_incrementParticipantVersion
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[IMDChat groupID](self, "groupID");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = 138412546;
      v6 = v4;
      v7 = 2048;
      v8 = -[IMDChat groupParticipantVersion](self, "groupParticipantVersion");
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Incrementing participant version of chat %@ to %ld", (uint8_t *)&v5, 0x16u);

    }
  }
  -[IMDChat setGroupParticipantVersion:](self, "setGroupParticipantVersion:", -[IMDChat groupParticipantVersion](self, "groupParticipantVersion") + 1);
}

- (void)_modifyGroupWithServiceSession:(id)a3 groupID:(id)a4 toParticipants:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 account:(id)a8 messageTimeStamp:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  __CFString *v25;
  void *v26;
  __CFString *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t i;
  __CFString *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t j;
  __CFString *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  __CFString *v58;
  NSObject *v59;
  const __CFString *v60;
  void *v61;
  uint64_t v62;
  id v63;
  int v64;
  void *v65;
  void *v66;
  __CFString *obj;
  char v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t buf[4];
  const __CFString *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v71 = a3;
  v63 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v69 = a9;
  v70 = v18;
  if (!v18)
  {
    objc_msgSend(v71, "account");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "_stripFZIDPrefix");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "_stripFZIDPrefix");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "__imArrayByApplyingBlock:", &unk_1E9229630);
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v19, "isEqualToIgnoringCase:", v66);
  v64 = v21;
  v22 = IMOSLoggingEnabled(v21);
  if ((_DWORD)v22)
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v84 = v20;
      v85 = 2112;
      v86 = v19;
      v87 = 2112;
      v88 = v66;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, " Updating participants: %@ toIdentifier: %@, fromIdentifier: %@", buf, 0x20u);
    }

  }
  if (IMOSLoggingEnabled(v22))
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      -[IMDChat participants](self, "participants");
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v84 = v25;
      _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Chat participants before converge %@", buf, 0xCu);

    }
  }
  -[IMDChat participants](self, "participants");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "arrayByApplyingSelector:", sel_ID);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v65);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (__CFString *)objc_msgSend(v65, "mutableCopy");
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v20;
  v28 = 0;
  v29 = -[__CFString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
  if (v29)
  {
    v68 = 0;
    v30 = *(_QWORD *)v78;
    if (v64)
      v31 = 0;
    else
      v31 = v66;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v78 != v30)
          objc_enumerationMutation(obj);
        v33 = *(__CFString **)(*((_QWORD *)&v77 + 1) + 8 * i);
        v34 = objc_msgSend(v72, "containsObject:", v33);
        if ((v34 & 1) == 0)
        {
          if (IMOSLoggingEnabled(v34))
          {
            OSLogHandleForIMFoundationCategory();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v84 = v33;
              _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "   Adding participant: %@", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x1E0C99D68], "__im_iMessageDateFromTimeStamp:", v69);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[__CFString isEqualToString:](v33, "isEqualToString:", v66))
          {
            objc_msgSend(v36, "dateByAddingTimeInterval:", -0.000002);
            v37 = objc_claimAutoreleasedReturnValue();

            v68 = 1;
            v36 = (void *)v37;
          }
          -[IMDChat chatIdentifier](self, "chatIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v62) = -[IMDChat style](self, "style");
          v39 = (id)objc_msgSend(v71, "didChangeMemberStatus:forHandle:fromHandle:unformattedNumber:countryCode:forChat:style:account:destinationCallerID:messageTime:", 2, v33, v31, 0, 0, v38, v62, v70, v19, v36);

          v28 = 1;
        }
        -[__CFString removeObject:](v27, "removeObject:", v33);
      }
      v29 = -[__CFString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    }
    while (v29);
  }
  else
  {
    v68 = 0;
  }

  if (IMOSLoggingEnabled(v40))
  {
    OSLogHandleForIMFoundationCategory();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v84 = v27;
      _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "   Participants to be removed %@", buf, 0xCu);
    }

  }
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v42 = v27;
  v43 = -[__CFString countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
  if (v43)
  {
    v44 = *(_QWORD *)v74;
    if (v64)
      v45 = 0;
    else
      v45 = v66;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v74 != v44)
          objc_enumerationMutation(v42);
        v47 = *(__CFString **)(*((_QWORD *)&v73 + 1) + 8 * j);
        v48 = -[__CFString isEqualToIgnoringCase:](v47, "isEqualToIgnoringCase:", v19);
        if ((v48 & 1) == 0)
        {
          if (IMOSLoggingEnabled(v48))
          {
            OSLogHandleForIMFoundationCategory();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v84 = v47;
              _os_log_impl(&dword_1D1413000, v49, OS_LOG_TYPE_INFO, "   Removing participant: %@", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x1E0C99D68], "__im_iMessageDateFromTimeStamp:", v69);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v50;
          if ((v68 & 1) != 0)
          {
            objc_msgSend(v50, "dateByAddingTimeInterval:", -0.000001);
            v52 = objc_claimAutoreleasedReturnValue();

            v51 = (void *)v52;
          }
          -[IMDChat chatIdentifier](self, "chatIdentifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v62) = -[IMDChat style](self, "style");
          v54 = (id)objc_msgSend(v71, "didChangeMemberStatus:forHandle:fromHandle:unformattedNumber:countryCode:forChat:style:account:destinationCallerID:messageTime:", 3, v47, v45, 0, 0, v53, v62, v70, v19, v51);

          v28 = 1;
        }
      }
      v43 = -[__CFString countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    }
    while (v43);
  }

  v56 = IMOSLoggingEnabled(v55);
  if ((_DWORD)v56)
  {
    OSLogHandleForIMFoundationCategory();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      -[IMDChat participants](self, "participants");
      v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v84 = v58;
      _os_log_impl(&dword_1D1413000, v57, OS_LOG_TYPE_INFO, "Chat participants after converge %@", buf, 0xCu);

    }
  }
  if (IMOSLoggingEnabled(v56))
  {
    OSLogHandleForIMFoundationCategory();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      v60 = CFSTR("NO");
      if ((v28 & 1) != 0)
        v60 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v84 = v60;
      _os_log_impl(&dword_1D1413000, v59, OS_LOG_TYPE_INFO, "Group changed and will write to db? %@", buf, 0xCu);
    }

  }
  if ((v28 & 1) != 0)
  {
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "storeChat:", self);

  }
}

- (BOOL)_convergesGroupPhotosForReplicationService:(id)a3
{
  return 1;
}

- (BOOL)_convergesParticipantsForReplicationService:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "supportsCapability:", *MEMORY[0x1E0D38DF8]) ^ 1;
  else
    return 1;
}

- (void)_convergeGroupChatIfNeededWithServiceSession:(id)a3 account:(id)a4 replicationService:(id)a5 groupID:(id)a6 incomingParticipants:(id)a7 fromIdentifier:(id)a8 toIdentifier:(id)a9 receivedGroupParticipantVersion:(id)a10 receivedGroupProtocolVersion:(id)a11 messageTimeStamp:(id)a12 groupPhotoCreationTime:(id)a13
{
  id v19;
  id v20;
  IMDChat *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const __CFString *v31;
  int v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  int v42;
  NSObject *v43;
  NSObject *v44;
  const __CFString *v45;
  unint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  id v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  id v81;
  __int16 v82;
  id v83;
  __int16 v84;
  const __CFString *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v58 = a3;
  v57 = a4;
  v59 = a5;
  v62 = a6;
  v64 = a7;
  v60 = a8;
  v19 = a9;
  v20 = a10;
  v67 = a11;
  v65 = a12;
  v66 = a13;
  v21 = self;
  -[IMDChat _findChatParticipantsWithFromID:](self, "_findChatParticipantsWithFromID:", v19);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "__imArrayByApplyingBlock:", &unk_1E9229650);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "__imSetFromArray");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v61, "isEqualToSet:", v23);
  v25 = -[IMDChat groupParticipantVersion](v21, "groupParticipantVersion");
  -[IMDChat properties](v21, "properties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKey:", qword_1EFC60668);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = v19;
  v27 = objc_msgSend(v65, "longLongValue") / 1000000000;
  v28 = objc_msgSend(v63, "longLongValue");
  v29 = v27 - v28;
  if (IMOSLoggingEnabled(v28))
  {
    OSLogHandleForIMFoundationCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219778;
      v71 = v25;
      v72 = 2112;
      v73 = v20;
      v74 = 2048;
      v75 = v29;
      v76 = 2048;
      v77 = objc_msgSend(v63, "longLongValue");
      v78 = 2048;
      v79 = objc_msgSend(v65, "longLongValue") / 1000000000;
      v31 = CFSTR("YES");
      v80 = 2112;
      v81 = v64;
      v82 = 2112;
      v83 = v67;
      if (!v24)
        v31 = CFSTR("NO");
      v84 = 2112;
      v85 = v31;
      _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "receiveMessageData localVersion: %ld, receivedGroupParticipantVersion: %@, timeDifference: %lld, lastUpdated:%lld, timestamp:%lld, incomingParticipants: %@, protocolVersion: %@, isIncomingParticipantSetSame %@", buf, 0x52u);
    }

  }
  if (v25 <= objc_msgSend(v20, "integerValue"))
  {
    if (v29 < 11)
    {
      v32 = 0;
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  v32 = 0;
  if (v67)
    v33 = 1;
  else
    v33 = v24;
  if ((v33 & 1) == 0 && v29 >= 11)
  {
LABEL_16:
    if (v25 == objc_msgSend(v20, "integerValue"))
      v32 = v24 ^ 1;
    else
      v32 = 1;
  }
LABEL_19:
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat groupPhotoGuid](v21, "groupPhotoGuid");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "transferForGUID:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = objc_msgSend(v66, "unsignedLongLongValue");
  if (v37)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "__im_iMessageDateFromTimeStamp:", v66);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v37;
    if (v36 && v37)
    {
      objc_msgSend(v36, "refreshDate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "compare:", v38) == -1)
      {
        v40 = -[IMDChat _convergesGroupPhotosForReplicationService:](v21, "_convergesGroupPhotosForReplicationService:", v59);

        if (!v40)
          goto LABEL_27;
        objc_msgSend(v36, "setRefreshDate:", v38);
        +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "messageGUID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "storeAttachment:associateWithMessageWithGUID:", v36, v41);

      }
    }
  }
  else
  {
    v38 = 0;
  }
LABEL_27:
  if (v67)
  {
    if (v32)
    {
      v37 = -[IMDChat _convergesParticipantsForReplicationService:](v21, "_convergesParticipantsForReplicationService:", v59);
      if ((v37 & 1) != 0)
      {
        v42 = 1;
        goto LABEL_40;
      }
      v37 = IMOSLoggingEnabled(v37);
      if ((_DWORD)v37)
      {
        OSLogHandleForIMFoundationCategory();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v43, OS_LOG_TYPE_INFO, "Not converging participants, replication service does not permit it", buf, 2u);
        }
LABEL_38:

      }
    }
  }
  else
  {
    v37 = IMOSLoggingEnabled(v37);
    if ((_DWORD)v37)
    {
      OSLogHandleForIMFoundationCategory();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v43, OS_LOG_TYPE_INFO, "Not converging participants. Message from legacy device", buf, 2u);
      }
      goto LABEL_38;
    }
  }
  v42 = 0;
LABEL_40:
  if (IMOSLoggingEnabled(v37))
  {
    OSLogHandleForIMFoundationCategory();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = CFSTR("NO");
      if (v42)
        v45 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v71 = (uint64_t)v45;
      _os_log_impl(&dword_1D1413000, v44, OS_LOG_TYPE_INFO, "shouldConvergeParticipants: %@", buf, 0xCu);
    }

  }
  if (objc_msgSend(v62, "length"))
  {
    v46 = objc_msgSend(v23, "count");
    if (v56)
    {
      if (v60 && v46 >= 2)
      {
        v47 = -[IMDChat style](v21, "style");
        v48 = v42 ^ 1;
        if ((_DWORD)v47 == 45)
          v48 = 1;
        if ((v48 & 1) == 0)
        {
          if (v20)
          {
            v49 = objc_msgSend(v20, "integerValue");
            if (v25 != v49)
            {
              if (IMOSLoggingEnabled(v49))
              {
                OSLogHandleForIMFoundationCategory();
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v71 = (uint64_t)v20;
                  _os_log_impl(&dword_1D1413000, v50, OS_LOG_TYPE_INFO, "Setting participant version to version received: %@", buf, 0xCu);
                }

              }
              if (objc_msgSend(v20, "integerValue") > v25)
              {
                -[IMDChat chatIdentifier](v21, "chatIdentifier");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "didUpdateChatStatus:chat:style:", 2, v51, -[IMDChat style](v21, "style"));

              }
              -[IMDChat _setParticipantVersion:](v21, "_setParticipantVersion:", objc_msgSend(v20, "integerValue"));
            }
          }
          else
          {
            if (IMOSLoggingEnabled(v47))
            {
              OSLogHandleForIMFoundationCategory();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v52, OS_LOG_TYPE_INFO, "Incrementing participant version by 1 on message receive.", buf, 2u);
              }

            }
            -[IMDChat _incrementParticipantVersion](v21, "_incrementParticipantVersion");
            -[IMDChat chatIdentifier](v21, "chatIdentifier");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "didUpdateChatStatus:chat:style:", 2, v53, -[IMDChat style](v21, "style"));

          }
          v68[0] = MEMORY[0x1E0C809B0];
          v68[1] = 3221225472;
          v68[2] = sub_1D146B818;
          v68[3] = &unk_1E9227D78;
          v54 = v56;
          v69 = v54;
          objc_msgSend(v64, "__imArrayByFilteringWithBlock:", v68);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDChat _modifyGroupWithServiceSession:groupID:toParticipants:toIdentifier:fromIdentifier:account:messageTimeStamp:](v21, "_modifyGroupWithServiceSession:groupID:toParticipants:toIdentifier:fromIdentifier:account:messageTimeStamp:", v58, v62, v55, v54, v60, v57, v65);

        }
      }
    }
  }

}

- (NSString)pronunciationHint
{
  return 0;
}

- (NSArray)alternativeSpeakableMatches
{
  return 0;
}

- (unint64_t)powerLogConversationType
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[IMDChat participants](self, "participants", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "isBusiness") & 1) != 0)
        {

          return 2;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }

  return -[IMDChat style](self, "style") != 45;
}

- (void)_repairChatIfNeeded
{
  -[IMDChat _repairGUIDIfNeeded](self, "_repairGUIDIfNeeded");
  MEMORY[0x1E0DE7D20](self, sel__repairParticipantForChatIDHandleIDMismatch);
}

- (void)_repairUnregisteredChatIfNeeded
{
  MEMORY[0x1E0DE7D20](self, sel__repairMissingServiceName);
}

- (void)_repairGUIDIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[IMDChat chatIdentifier](self, "chatIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[IMDChat serviceName](self, "serviceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      -[IMDChat guid](self, "guid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat _expectedGUID](self, "_expectedGUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "length");
      if (!v9 || (v9 = objc_msgSend(v7, "isEqualToString:", v8), (v9 & 1) == 0))
      {
        if (IMOSLoggingEnabled(v9))
        {
          OSLogHandleForIMFoundationCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            v20 = 138412546;
            v21 = v7;
            v22 = 2112;
            v23 = v8;
            _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Chat has GUID (%@) but expected GUID (%@), recovering chat", (uint8_t *)&v20, 0x16u);
          }

        }
        -[IMDChat _updateRepairHistoryWithRepairHistory:](self, "_updateRepairHistoryWithRepairHistory:", 1);
        -[IMDChat _resetGUIDToExpectedGUID:](self, "_resetGUIDToExpectedGUID:", v8);
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v18 = *MEMORY[0x1E0CB2938];
        v19 = CFSTR("Chat GUID did not match chat properties");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D36350], 0, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "forceAutoBugCaptureWithSubType:errorPayload:", CFSTR("Invalid Chat GUID"), v13);

      }
      return;
    }
  }
  else
  {

  }
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      -[IMDChat chatIdentifier](self, "chatIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat serviceName](self, "serviceName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Chat has zero length identifier %@ or service %@", (uint8_t *)&v20, 0x16u);

    }
  }
}

- (id)_expectedGUID
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];

  if (-[IMDChat style](self, "style") == 45)
  {
    -[IMDChat participants](self, "participants");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4 >= 2)
    {
      if (IMOSLoggingEnabled(v5))
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Chat has greater than 1 participant but 1-1 chat style, rewriting GUID and chat identifier", v14, 2u);
        }

      }
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat account](self, "account");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "generateUnusedChatIdentifierForGroupChatWithAccount:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat setChatIdentifier:](self, "setChatIdentifier:", v9);

      -[IMDChat setStyle:](self, "setStyle:", 43);
    }
  }
  -[IMDChat chatIdentifier](self, "chatIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat serviceName](self, "serviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat style](self, "style");
  v12 = (void *)IMCopyGUIDForChat();

  return v12;
}

- (BOOL)_otherChatExistsWithChatGUID:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)IMDChatRecordCopyChatForGUID();
  v4 = v3 != 0;

  return v4;
}

- (void)_resetGUIDToExpectedGUID:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;
  IMDChat *v20;
  uint8_t buf[4];
  NSObject *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMDChat style](self, "style") != 45)
  {
    v5 = -[IMDChat style](self, "style");
    if ((_DWORD)v5 != 43)
    {
      if (!IMOSLoggingEnabled(v5))
        goto LABEL_26;
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v22) = (char)-[IMDChat style](self, "style");
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Chat appears to need recovery but style is not supported %c", buf, 8u);
      }
      goto LABEL_25;
    }
  }
  if (!-[IMDChat _otherChatExistsWithChatGUID:](self, "_otherChatExistsWithChatGUID:", v4))
  {
    v11 = v4;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1D14FE0E8;
    v18[3] = &unk_1E922C100;
    v4 = v11;
    v19 = v4;
    v20 = self;
    objc_msgSend(v13, "resolveInconsistentGUIDForChatRecordWithGUID:newGUID:completionHandler:", v14, v4, v18);

    goto LABEL_26;
  }
  v6 = -[IMDChat style](self, "style");
  if ((_DWORD)v6 == 43)
  {
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "generateUnusedChatIdentifierForGroupChatWithAccount:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject length](v9, "length"))
    {
      -[IMDChat serviceName](self, "serviceName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat style](self, "style");
      v11 = (void *)IMCopyGUIDForChat();

      if (IMOSLoggingEnabled(-[IMDChat setChatIdentifier:](self, "setChatIdentifier:", v9)))
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v22 = v9;
          v23 = 2112;
          v24 = v11;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Chat with expected GUID already exists, generating new chat identifier %@ and GUID %@", buf, 0x16u);
        }

      }
      goto LABEL_12;
    }
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        -[IMDChat account](self, "account");
        v17 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v22 = v17;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Failed to generate new chat identifier for account %@", buf, 0xCu);

      }
    }
LABEL_25:

    goto LABEL_26;
  }
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v4;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Chat with expected GUID %@ already exists, cannot reset 1-1 chat GUID", buf, 0xCu);
    }

  }
LABEL_26:

}

- (void)_repairParticipantForChatIDHandleIDMismatch
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const void *v19;
  int v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  IMDHandle *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  IMDHandle *v37;
  int v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (-[IMDChat style](self, "style") == 45)
  {
    -[IMDChat participants](self, "participants");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4 == 1)
    {
      if (!-[IMDChat isBusinessChat](self, "isBusinessChat") && !-[IMDChat isStewieChat](self, "isStewieChat"))
      {
        -[IMDChat guid](self, "guid");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        IMComponentsFromChatGUID();
        v7 = 0;
        v8 = 0;

        -[IMDChat participants](self, "participants");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "ID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[IMDChat identifier:equalsIdentifier:](IMDChat, "identifier:equalsIdentifier:", v7, v11);

        if (!v12)
        {
          if (IMOSLoggingEnabled(v13))
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              -[IMDChat chatIdentifier](self, "chatIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMDChat participants](self, "participants");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "firstObject");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "ID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = 138412802;
              v39 = (uint64_t)v7;
              v40 = 2112;
              v41 = v15;
              v42 = 2112;
              v43 = v18;
              _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "1-1 chat has chat identifier (from GUID: %@ from chat identifier property: %@) but its participant's handle ID (%@) is different.", (uint8_t *)&v38, 0x20u);

            }
          }
          -[IMDChat _updateRepairHistoryWithRepairHistory:](self, "_updateRepairHistoryWithRepairHistory:", 2);
          v19 = (const void *)IMDHandleRecordCopyHandleForIDOnService();
          v20 = IMOSLoggingEnabled(v19);
          if (v19)
          {
            if (v20)
            {
              OSLogHandleForIMFoundationCategory();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                v38 = 138412546;
                v39 = (uint64_t)v7;
                v40 = 2112;
                v41 = v8;
                _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Found handle for ID (%@) on service (%@)", (uint8_t *)&v38, 0x16u);
              }

            }
            v22 = (id)IMDHandleRecordCopyID();
            v23 = (void *)IMDHandleRecordCopyCountry();
            v24 = (void *)IMDHandleRecordCopyUncanonicalizedID();
            v25 = (void *)IMDHandleRecordCopyPersonCentricID();
            CFRelease(v19);
          }
          else
          {
            if (v20)
            {
              OSLogHandleForIMFoundationCategory();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                v38 = 138412546;
                v39 = (uint64_t)v7;
                v40 = 2112;
                v41 = v8;
                _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "No handle found for ID (%@) on service (%@). Creating one instead.", (uint8_t *)&v38, 0x16u);
              }

            }
            v22 = v7;
            v23 = 0;
            v24 = 0;
            v25 = 0;
          }
          v29 = -[IMDHandle initWithID:unformattedID:countryCode:personCentricID:]([IMDHandle alloc], "initWithID:unformattedID:countryCode:personCentricID:", v22, v24, v23, v25);
          v37 = v29;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDChat resetParticipants:](self, "resetParticipants:", v30);

          v31 = (void *)MEMORY[0x1E0CB35C8];
          v35 = *MEMORY[0x1E0CB2938];
          v36 = CFSTR("[Chat Repair] [v2] Chat identifier for 1-1 chat did not match the participant's handle ID.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D36350], 0, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "forceAutoBugCaptureWithSubType:errorPayload:", CFSTR("Incorrect Chat Participant"), v33);

        }
      }
    }
    else if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        -[IMDChat participants](self, "participants");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 134217984;
        v39 = objc_msgSend(v27, "count");
        _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Chat is a 1-1 chat, but has %lu participants. Not repairing participants.", (uint8_t *)&v38, 0xCu);

      }
    }
  }
}

+ (BOOL)identifier:(id)a3 equalsIdentifier:(id)a4
{
  id v5;
  id v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if ((v5 != 0) != (v6 != 0))
  {
    v7 = 0;
  }
  else if ((unint64_t)objc_msgSend(v5, "length") >= 5 && (unint64_t)objc_msgSend(v6, "length") >= 5)
  {
    if ((IMStringIsEmail() & 1) != 0 || IMStringIsEmail())
    {
      objc_msgSend(v5, "lowercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lowercaseString");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "length") - 5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v6, "length") - 5);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    v7 = objc_msgSend(v8, "isEqualToString:", v9);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)_updateRepairHistoryWithRepairHistory:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(-[IMDChat setRepairHistory:](self, "setRepairHistory:", -[IMDChat repairHistory](self, "repairHistory") | a3)))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      -[IMDChat repairHistory](self, "repairHistory");
      IMStringFromChatRepairHistory();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Repair History Updated: %@", (uint8_t *)&v6, 0xCu);

    }
  }
}

- (void)_repairMissingServiceName
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[IMDChat serviceName](self, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0D36350];
    v13 = *MEMORY[0x1E0CB2938];
    v14[0] = CFSTR("[IMCreateIMDChat] Chat was missing a service when loaded from the database.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "forceAutoBugCaptureWithSubType:errorPayload:type:context:", CFSTR("Missing chat service name at load"), v8, CFSTR("MissingChatService"), 0);

    -[IMDChat guid](self, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    IMComponentsFromChatGUID();
    v11 = 0;

    -[IMDChat setServiceName:](self, "setServiceName:", v11);
    -[IMDChat _updateRepairHistoryWithRepairHistory:](self, "_updateRepairHistoryWithRepairHistory:", 4);
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_storeChat:updateProtectedProperties:", self, 1);

  }
}

- (IMDChat)initWithAccountID:(id)a3 service:(id)a4 guid:(id)a5 groupID:(id)a6 chatIdentifier:(id)a7 participants:(id)a8 roomName:(id)a9 displayName:(id)a10 lastAddressedLocalHandle:(id)a11 lastAddressedSIMID:(id)a12 properties:(id)a13 state:(int64_t)a14 style:(unsigned __int8)a15 isFiltered:(int64_t)a16 hasHadSuccessfulQuery:(BOOL)a17 engramID:(id)a18 serverChangeToken:(id)a19 cloudKitSyncState:(int64_t)a20 originalGroupID:(id)a21 lastReadMessageTimeStamp:(int64_t)a22 lastMessageTimeStampOnLoad:(int64_t)a23 cloudKitRecordID:(id)a24 isBlackholed:(BOOL)a25 autoDonationBehavior:(int64_t)a26 autoDonationBehaviorLastModificationDate:(id)a27 isRecovered:(BOOL)a28 isDeletingIncomingMessages:(BOOL)a29
{
  IMDChat *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  IMDChat *v39;
  NSRecursiveLock *v40;
  NSRecursiveLock *lock;
  NSMutableDictionary *v42;
  NSMutableDictionary *chatInfo;
  NSObject *v44;
  uint64_t v45;
  IMDChat *v46;
  NSObject *v47;
  IMDChat *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  id v55;
  NSObject *v56;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  objc_super v70;
  uint8_t buf[4];
  IMDChat *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v69 = a4;
  v34 = (IMDChat *)a5;
  v67 = a6;
  v35 = a7;
  v66 = a8;
  v59 = a9;
  v60 = a10;
  v68 = a11;
  v63 = a12;
  v64 = a13;
  v65 = a18;
  v62 = a19;
  v36 = a21;
  v37 = a24;
  v38 = a27;
  if (objc_msgSend(v35, "length"))
  {
    v70.receiver = self;
    v70.super_class = (Class)IMDChat;
    v39 = -[IMDChat init](&v70, sel_init);
    if (v39)
    {
      v40 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
      lock = v39->_lock;
      v39->_lock = v40;

      -[NSRecursiveLock lock](v39->_lock, "lock");
      v42 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      chatInfo = v39->_chatInfo;
      v39->_chatInfo = v42;

      if (-[IMDChat rangeOfString:](v34, "rangeOfString:", CFSTR(";")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (IMOSLoggingEnabled(0x7FFFFFFFFFFFFFFFLL))
        {
          OSLogHandleForIMFoundationCategory();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v72 = v34;
            _os_log_impl(&dword_1D1413000, v44, OS_LOG_TYPE_DEBUG, "Attempting to init chat with invalid guid %@", buf, 0xCu);
          }

        }
        v45 = IMCopyGUIDForChat();

        v34 = (IMDChat *)v45;
      }
      -[IMDChat setGroupID:](v39, "setGroupID:", v67);
      -[IMDChat setEngramID:](v39, "setEngramID:", v65);
      -[IMDChat setProperties:](v39, "setProperties:", v64);
      -[IMDChat setIsFiltered:](v39, "setIsFiltered:", a16);
      -[IMDChat setLastAddressedLocalHandle:](v39, "setLastAddressedLocalHandle:", v68);
      -[IMDChat setLastAddressedSIMID:](v39, "setLastAddressedSIMID:", v63);
      -[IMDChat setChatIdentifier:](v39, "setChatIdentifier:", v35);
      -[IMDChat setState:](v39, "setState:", a14);
      -[IMDChat setServiceName:](v39, "setServiceName:", v69);
      -[IMDChat setStyle:](v39, "setStyle:", a15);
      -[IMDChat setParticipants:](v39, "setParticipants:", v66);
      if (a15 != 45 || -[IMDChat isBusinessChat](v39, "isBusinessChat") || MEMORY[0x1D17EA368](v35))
        -[IMDChat setDisplayName:](v39, "setDisplayName:", v60);
      if (v34)
      {
        -[IMDChat setGuid:](v39, "setGuid:", v34);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDChat setGuid:](v39, "setGuid:", v49);

      }
      -[IMDChat setHasHadSuccessfulQuery:](v39, "setHasHadSuccessfulQuery:", a17);
      -[IMDChat setCreateEngramGroupOnMessageSend:](v39, "setCreateEngramGroupOnMessageSend:", 0);
      -[IMDChat setPendingENGroupParticipantUpdate:](v39, "setPendingENGroupParticipantUpdate:", 0);
      if (a15 != 45)
        -[IMDChat setRoomName:](v39, "setRoomName:", v59);
      -[IMDChat setAccountID:](v39, "setAccountID:", v61);
      -[IMDChat _updateCachedParticipants](v39, "_updateCachedParticipants");
      v39->_rowID = -1;
      v39->_isArchived = 0;
      -[IMDChat setServerChangeToken:](v39, "setServerChangeToken:", v62);
      v50 = v36;
      if (objc_msgSend(v50, "length"))
      {
        v51 = v50;
      }
      else
      {
        +[IMDServiceController sharedController](IMDServiceController, "sharedController");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "serviceWithName:", v69);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "supportsCapability:", *MEMORY[0x1E0D38DC8]);

        if (v54)
        {
          v55 = v67;
        }
        else
        {
          _IMDHashParticipants(v66, v68);
          v55 = (id)objc_claimAutoreleasedReturnValue();
        }
        v51 = v55;

      }
      -[IMDChat setOriginalGroupID:](v39, "setOriginalGroupID:", v51);
      -[IMDChat setLastReadMessageTimeStamp:](v39, "setLastReadMessageTimeStamp:", a22);
      -[IMDChat setLastMessageTimeStampOnLoad:](v39, "setLastMessageTimeStampOnLoad:", a23);
      -[IMDChat setCloudKitRecordID:](v39, "setCloudKitRecordID:", v37);
      -[IMDChat setIsBlackholed:](v39, "setIsBlackholed:", a25);
      -[IMDChat setWasReportedAsJunk:](v39, "setWasReportedAsJunk:", 0);
      -[IMDChat _setAutoDonationBehavior:lastModificationDate:setDirtyFlag:](v39, "_setAutoDonationBehavior:lastModificationDate:setDirtyFlag:", a26, v38, 0);
      -[IMDChat setRecovered:](v39, "setRecovered:", a28);
      -[IMDChat setDeletingIncomingMessages:](v39, "setDeletingIncomingMessages:", a29);
      -[IMDChat setCloudKitSyncState:](v39, "setCloudKitSyncState:", a20);
      if (IMOSLoggingEnabled(-[IMDChat setPendingIncomingSatelliteMessageCount:](v39, "setPendingIncomingSatelliteMessageCount:", 0)))
      {
        OSLogHandleForIMFoundationCategory();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v72 = v39;
          _os_log_impl(&dword_1D1413000, v56, OS_LOG_TYPE_DEBUG, "Created chat: %@", buf, 0xCu);
        }

      }
      -[NSRecursiveLock unlock](v39->_lock, "unlock");

    }
    v46 = v39;
    v48 = v46;
  }
  else
  {
    v46 = self;
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v34;
        _os_log_impl(&dword_1D1413000, v47, OS_LOG_TYPE_DEBUG, "Attempting to init chat with zero length chat identifier, guid: %@", buf, 0xCu);
      }

    }
    v48 = 0;
  }

  return v48;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  IMDChat *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v6 = self;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_DEBUG, "Dealloc chat: %@", buf, 0xCu);
    }

  }
  v4.receiver = self;
  v4.super_class = (Class)IMDChat;
  -[IMDChat dealloc](&v4, sel_dealloc);
}

- (void)setGuid:(id)a3
{
  NSString *v4;
  NSString *guid;
  NSMutableDictionary *chatInfo;
  uint64_t v7;
  NSString *v8;

  v8 = (NSString *)a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_guid != v8)
  {
    v4 = (NSString *)-[NSString copy](v8, "copy");
    guid = self->_guid;
    self->_guid = v4;

    chatInfo = self->_chatInfo;
    v7 = *MEMORY[0x1E0D37778];
    if (v8)
      -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v8, v7);
    else
      -[NSMutableDictionary removeObjectForKey:](chatInfo, "removeObjectForKey:", v7);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)setChatIdentifier:(id)a3
{
  NSString *v4;
  NSString *chatIdentifier;
  NSMutableDictionary *chatInfo;
  uint64_t v7;
  NSString *v8;

  v8 = (NSString *)a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_chatIdentifier != v8)
  {
    v4 = (NSString *)-[NSString copy](v8, "copy");
    chatIdentifier = self->_chatIdentifier;
    self->_chatIdentifier = v4;

    chatInfo = self->_chatInfo;
    v7 = *MEMORY[0x1E0D37730];
    if (v8)
      -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v8, v7);
    else
      -[NSMutableDictionary removeObjectForKey:](chatInfo, "removeObjectForKey:", v7);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)setAccountID:(id)a3
{
  NSString *v4;
  NSString *accountID;
  NSMutableDictionary *chatInfo;
  uint64_t v7;
  NSString *v8;

  v8 = (NSString *)a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_accountID != v8)
  {
    v4 = (NSString *)-[NSString copy](v8, "copy");
    accountID = self->_accountID;
    self->_accountID = v4;

    chatInfo = self->_chatInfo;
    v7 = *MEMORY[0x1E0D37718];
    if (v8)
      -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v8, v7);
    else
      -[NSMutableDictionary removeObjectForKey:](chatInfo, "removeObjectForKey:", v7);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)setServiceName:(id)a3
{
  NSString *v4;
  NSString *serviceName;
  NSMutableDictionary *chatInfo;
  uint64_t v7;
  NSString *v8;

  v8 = (NSString *)a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_serviceName != v8)
  {
    v4 = (NSString *)-[NSString copy](v8, "copy");
    serviceName = self->_serviceName;
    self->_serviceName = v4;

    chatInfo = self->_chatInfo;
    v7 = *MEMORY[0x1E0D37870];
    if (v8)
      -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v8, v7);
    else
      -[NSMutableDictionary removeObjectForKey:](chatInfo, "removeObjectForKey:", v7);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)setParticipants:(id)a3
{
  NSArray *v4;
  NSArray *participants;
  NSArray *v6;

  v6 = (NSArray *)a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_participants != v6)
  {
    v4 = (NSArray *)-[NSArray copy](v6, "copy");
    participants = self->_participants;
    self->_participants = v4;

  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (NSArray)replySuggestions
{
  void *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSArray copy](self->_replySuggestions, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSArray *)v3;
}

- (void)setReplySuggestions:(id)a3
{
  NSArray *v4;
  NSArray *replySuggestions;
  NSMutableDictionary *chatInfo;
  uint64_t v7;
  NSArray *v8;

  v8 = (NSArray *)a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_replySuggestions != v8)
  {
    v4 = (NSArray *)-[NSArray copy](v8, "copy");
    replySuggestions = self->_replySuggestions;
    self->_replySuggestions = v4;

    chatInfo = self->_chatInfo;
    v7 = *MEMORY[0x1E0D37850];
    if (v8)
      -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v8, v7);
    else
      -[NSMutableDictionary removeObjectForKey:](chatInfo, "removeObjectForKey:", v7);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (NSString)roomName
{
  void *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSString copy](self->_roomName, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setRoomName:(id)a3
{
  NSString *v4;
  NSString *roomName;
  NSMutableDictionary *chatInfo;
  uint64_t v7;
  NSString *v8;

  v8 = (NSString *)a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_roomName != v8)
  {
    v4 = (NSString *)-[NSString copy](v8, "copy");
    roomName = self->_roomName;
    self->_roomName = v4;

    chatInfo = self->_chatInfo;
    v7 = *MEMORY[0x1E0D37858];
    if (v8)
      -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v8, v7);
    else
      -[NSMutableDictionary removeObjectForKey:](chatInfo, "removeObjectForKey:", v7);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSString *displayName;
  NSMutableDictionary *chatInfo;
  uint64_t v7;
  NSString *v8;

  v8 = (NSString *)a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_displayName != v8)
  {
    v4 = (NSString *)-[NSString copy](v8, "copy");
    displayName = self->_displayName;
    self->_displayName = v4;

    chatInfo = self->_chatInfo;
    v7 = *MEMORY[0x1E0D37760];
    if (v8)
      -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v8, v7);
    else
      -[NSMutableDictionary removeObjectForKey:](chatInfo, "removeObjectForKey:", v7);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (int64_t)autoDonationBehavior
{
  int64_t autoDonationBehavior;

  -[NSRecursiveLock lock](self->_lock, "lock");
  autoDonationBehavior = self->_autoDonationBehavior;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return autoDonationBehavior;
}

- (NSDate)autoDonationBehaviorLastModificationDate
{
  NSDate *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = self->_autoDonationBehaviorLastModificationDate;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)_setAutoDonationBehavior:(int64_t)a3 lastModificationDate:(id)a4 setDirtyFlag:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  uint64_t v10;
  NSObject *v11;
  int64_t autoDonationBehavior;
  NSMutableDictionary *chatInfo;
  void *v14;
  int v15;
  int64_t v16;
  uint64_t v17;

  v5 = a5;
  v17 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  objc_storeStrong((id *)&self->_autoDonationBehaviorLastModificationDate, a4);
  self->_autoDonationBehavior = a3;
  if (v5)
    self->_cloudKitSyncState = 0;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      autoDonationBehavior = self->_autoDonationBehavior;
      v15 = 134217984;
      v16 = autoDonationBehavior;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_DEBUG, "Updating chatInfo with autoDonationBehavior: %ld", (uint8_t *)&v15, 0xCu);
    }

  }
  chatInfo = self->_chatInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_autoDonationBehavior);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v14, *MEMORY[0x1E0D37728]);

}

- (BOOL)setAutoDonationBehavior:(int64_t)a3 lastModificationDate:(id)a4
{
  id v6;
  NSDate *autoDonationBehaviorLastModificationDate;
  NSObject *v8;
  NSDate *v9;
  NSString *guid;
  BOOL v11;
  NSObject *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v20;
  int64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  NSString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    autoDonationBehaviorLastModificationDate = self->_autoDonationBehaviorLastModificationDate;
    if (autoDonationBehaviorLastModificationDate
      && -[NSDate compare:](autoDonationBehaviorLastModificationDate, "compare:", v6) == NSOrderedDescending)
    {
      IMLogHandleForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = self->_autoDonationBehaviorLastModificationDate;
        guid = self->_guid;
        v20 = 138413058;
        v21 = (int64_t)v9;
        v22 = 2112;
        v23 = v6;
        v24 = 2048;
        v25 = a3;
        v26 = 2112;
        v27 = guid;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Syndication Date (%@ vs %@) is in the past. Not setting syndication type %ld for chat: %@", (uint8_t *)&v20, 0x2Au);
      }
      v11 = 0;
    }
    else
    {
      IMLogHandleForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = self->_guid;
        v20 = 134218498;
        v21 = a3;
        v22 = 2112;
        v23 = v6;
        v24 = 2112;
        v25 = (int64_t)v13;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Setting syndication type to: %ld, syndication date to: %@, for chat: %@", (uint8_t *)&v20, 0x20u);
      }

      v11 = 1;
      -[IMDChat _setAutoDonationBehavior:lastModificationDate:setDirtyFlag:](self, "_setAutoDonationBehavior:lastModificationDate:setDirtyFlag:", a3, v6, 1);
      +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "storeChat:", self);

      -[IMDChat guid](self, "guid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      IMDCoreSpotlightAddChatGUID();

      v8 = -[IMDChat copyDictionaryRepresentation:](self, "copyDictionaryRepresentation:", 0);
      -[IMDChat broadcaster](self, "broadcaster");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat guid](self, "guid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "chat:updated:", v17, v8);

    }
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
  else
  {
    IMLogHandleForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1D166A498();

    v11 = 0;
  }

  return v11;
}

- (void)setGroupID:(id)a3
{
  NSString *v4;
  NSString *v5;
  uint64_t v6;
  NSString *v7;
  NSString *groupID;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    v6 = -[NSString length](v4, "length");
    v5 = v9;
    if (v6)
    {
      -[NSRecursiveLock lock](self->_lock, "lock");
      if (self->_groupID != v9)
      {
        v7 = (NSString *)-[NSString copy](v9, "copy");
        groupID = self->_groupID;
        self->_groupID = v7;

        -[NSMutableDictionary setObject:forKey:](self->_chatInfo, "setObject:forKey:", v9, *MEMORY[0x1E0D37780]);
      }
      -[NSRecursiveLock unlock](self->_lock, "unlock");
      v5 = v9;
    }
  }

}

- (NSString)engramID
{
  void *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSString copy](self->_engramID, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setEngramID:(id)a3
{
  NSString *v4;
  NSString *v5;
  uint64_t v6;
  NSString *v7;
  NSString *engramID;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    v6 = -[NSString length](v4, "length");
    v5 = v9;
    if (v6)
    {
      -[NSRecursiveLock lock](self->_lock, "lock");
      if (self->_engramID != v9)
      {
        v7 = (NSString *)-[NSString copy](v9, "copy");
        engramID = self->_engramID;
        self->_engramID = v7;

        -[NSMutableDictionary setObject:forKey:](self->_chatInfo, "setObject:forKey:", v9, CFSTR("engramID"));
      }
      -[NSRecursiveLock unlock](self->_lock, "unlock");
      v5 = v9;
    }
  }

}

- (NSString)serverChangeToken
{
  void *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSString copy](self->_serverChangeToken, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setServerChangeToken:(id)a3
{
  NSString *v4;
  NSString *serverChangeToken;
  NSMutableDictionary *chatInfo;
  uint64_t v7;
  NSString *v8;

  v8 = (NSString *)a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_serverChangeToken != v8)
  {
    v4 = (NSString *)-[NSString copy](v8, "copy");
    serverChangeToken = self->_serverChangeToken;
    self->_serverChangeToken = v4;

    chatInfo = self->_chatInfo;
    v7 = *MEMORY[0x1E0D37868];
    if (v8)
      -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v8, v7);
    else
      -[NSMutableDictionary removeObjectForKey:](chatInfo, "removeObjectForKey:", v7);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (int64_t)cloudKitSyncState
{
  int64_t cloudKitSyncState;

  -[NSRecursiveLock lock](self->_lock, "lock");
  cloudKitSyncState = self->_cloudKitSyncState;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return cloudKitSyncState;
}

- (void)setCloudKitSyncState:(int64_t)a3
{
  NSMutableDictionary *chatInfo;
  void *v6;

  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_cloudKitSyncState = a3;
  chatInfo = self->_chatInfo;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v6, *MEMORY[0x1E0D37758]);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_chatInfo, "removeObjectForKey:", *MEMORY[0x1E0D37758]);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setOriginalGroupID:(id)a3
{
  NSString *v4;
  NSString *originalGroupID;
  NSString *v6;
  NSString *v7;

  v7 = (NSString *)a3;
  if (-[NSString length](v7, "length"))
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    if (self->_originalGroupID != v7)
    {
      v4 = (NSString *)-[NSString copy](v7, "copy");
      originalGroupID = self->_originalGroupID;
      self->_originalGroupID = v4;

      v6 = self->_originalGroupID;
      if (v6)
        -[NSMutableDictionary setObject:forKey:](self->_chatInfo, "setObject:forKey:", v6, *MEMORY[0x1E0D37810]);
    }
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

}

- (int64_t)lastReadMessageTimeStamp
{
  int64_t lastReadMessageTimeStamp;

  -[NSRecursiveLock lock](self->_lock, "lock");
  lastReadMessageTimeStamp = self->_lastReadMessageTimeStamp;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return lastReadMessageTimeStamp;
}

- (void)setLastReadMessageTimeStamp:(int64_t)a3
{
  NSMutableDictionary *chatInfo;
  void *v6;

  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_lastReadMessageTimeStamp = a3;
  chatInfo = self->_chatInfo;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v6, *MEMORY[0x1E0D377F8]);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_chatInfo, "removeObjectForKey:", *MEMORY[0x1E0D377F8]);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSDate)lastTUConversationCreatedDate
{
  void *v2;
  void *v3;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastTUConversationCreatedDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setLastTUConversationCreatedDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDChat lastTUConversationCreatedDate](self, "lastTUConversationCreatedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
  {
    v11 = CFSTR("lastTUConversationCreatedDate");
    v6 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat updateProperties:](self, "updateProperties:", v7);

    if (!v4)
    -[IMDChat broadcaster](self, "broadcaster");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat properties](self, "properties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chat:propertiesUpdated:", v9, v10);

  }
}

- (NSDate)lastScheduledMessageCreatedDate
{
  void *v2;
  void *v3;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastScheduledMessageCreatedDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setLastScheduledMessageCreatedDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDChat lastScheduledMessageCreatedDate](self, "lastScheduledMessageCreatedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
  {
    v11 = CFSTR("lastScheduledMessageCreatedDate");
    v6 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat updateProperties:](self, "updateProperties:", v7);

    if (!v4)
    -[IMDChat broadcaster](self, "broadcaster");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat properties](self, "properties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chat:propertiesUpdated:", v9, v10);

  }
}

- (NSString)lastAddressedLocalHandle
{
  void *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSString copy](self->_lastAddressedLocalHandle, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setLastAddressedLocalHandle:(id)a3
{
  NSString *v4;
  NSString *lastAddressedLocalHandle;
  NSMutableDictionary *chatInfo;
  uint64_t v7;
  NSString *v8;

  v8 = (NSString *)a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_lastAddressedLocalHandle != v8)
  {
    v4 = (NSString *)-[NSString copy](v8, "copy");
    lastAddressedLocalHandle = self->_lastAddressedLocalHandle;
    self->_lastAddressedLocalHandle = v4;

    chatInfo = self->_chatInfo;
    v7 = *MEMORY[0x1E0D377D8];
    if (v8)
      -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v8, v7);
    else
      -[NSMutableDictionary removeObjectForKey:](chatInfo, "removeObjectForKey:", v7);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (NSString)lastAddressedSIMID
{
  void *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSString copy](self->_lastAddressedSIMID, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setLastAddressedSIMID:(id)a3
{
  NSString *v4;
  NSString *lastAddressedSIMID;
  NSMutableDictionary *chatInfo;
  uint64_t v7;
  NSString *v8;

  v8 = (NSString *)a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_lastAddressedSIMID != v8)
  {
    v4 = (NSString *)-[NSString copy](v8, "copy");
    lastAddressedSIMID = self->_lastAddressedSIMID;
    self->_lastAddressedSIMID = v4;

    chatInfo = self->_chatInfo;
    v7 = *MEMORY[0x1E0D377E0];
    if (v8)
      -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v8, v7);
    else
      -[NSMutableDictionary removeObjectForKey:](chatInfo, "removeObjectForKey:", v7);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)setProperties:(id)a3
{
  NSMutableDictionary *chatInfo;
  uint64_t v6;
  NSDictionary *v7;

  v7 = (NSDictionary *)a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_properties != v7)
  {
    objc_storeStrong((id *)&self->_properties, a3);
    chatInfo = self->_chatInfo;
    v6 = *MEMORY[0x1E0D37838];
    if (v7)
      -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v7, v6);
    else
      -[NSMutableDictionary removeObjectForKey:](chatInfo, "removeObjectForKey:", v6);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)setLastMessage:(id)a3
{
  IMMessageItem *v5;

  v5 = (IMMessageItem *)a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_lastMessage != v5)
    objc_storeStrong((id *)&self->_lastMessage, a3);
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)setStyle:(unsigned __int8)a3
{
  int v3;
  NSMutableDictionary *chatInfo;
  void *v6;

  v3 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_style = v3;
  chatInfo = self->_chatInfo;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", (char)v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v6, *MEMORY[0x1E0D37878]);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_chatInfo, "removeObjectForKey:", *MEMORY[0x1E0D37878]);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setState:(int64_t)a3
{
  NSMutableDictionary *chatInfo;
  void *v6;

  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_state = a3;
  chatInfo = self->_chatInfo;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v6, *MEMORY[0x1E0D377C8]);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_chatInfo, "removeObjectForKey:", *MEMORY[0x1E0D377C8]);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_setUnreadCount:(unint64_t)a3
{
  NSMutableDictionary *chatInfo;
  void *v6;

  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_unreadCount = a3;
  chatInfo = self->_chatInfo;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v6, *MEMORY[0x1E0D37880]);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_chatInfo, "removeObjectForKey:", *MEMORY[0x1E0D37880]);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)isArchived
{
  BOOL isArchived;

  -[NSRecursiveLock lock](self->_lock, "lock");
  isArchived = self->_isArchived;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return isArchived;
}

- (void)setIsBlackholed:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableDictionary *chatInfo;
  void *v6;

  v3 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_isBlackholed = v3;
  chatInfo = self->_chatInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v6, *MEMORY[0x1E0D377A0]);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)hasScheduledMessage
{
  BOOL hasScheduledMessage;

  -[NSRecursiveLock lock](self->_lock, "lock");
  hasScheduledMessage = self->_hasScheduledMessage;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return hasScheduledMessage;
}

- (void)setHasScheduledMessage:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableDictionary *chatInfo;
  void *v6;

  v3 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_hasScheduledMessage = v3;
  chatInfo = self->_chatInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v6, *MEMORY[0x1E0D37790]);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (int64_t)rowID
{
  int64_t rowID;

  -[NSRecursiveLock lock](self->_lock, "lock");
  rowID = self->_rowID;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return rowID;
}

- (void)_setRowID:(int64_t)a3
{
  NSMutableDictionary *chatInfo;
  void *v6;

  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_rowID = a3;
  chatInfo = self->_chatInfo;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v6, *MEMORY[0x1E0D37860]);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_chatInfo, "removeObjectForKey:", *MEMORY[0x1E0D37860]);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (int64_t)isFiltered
{
  int64_t isFiltered;

  -[NSRecursiveLock lock](self->_lock, "lock");
  isFiltered = self->_isFiltered;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return isFiltered;
}

- (void)setIsFiltered:(int64_t)a3
{
  NSMutableDictionary *chatInfo;
  void *v6;

  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_isFiltered = a3;
  chatInfo = self->_chatInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v6, *MEMORY[0x1E0D377B8]);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)hasHadSuccessfulQuery
{
  BOOL hasHadSuccessfulQuery;

  -[NSRecursiveLock lock](self->_lock, "lock");
  hasHadSuccessfulQuery = self->_hasHadSuccessfulQuery;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return hasHadSuccessfulQuery;
}

- (void)setHasHadSuccessfulQuery:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableDictionary *chatInfo;
  void *v6;

  v3 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_hasHadSuccessfulQuery = v3;
  chatInfo = self->_chatInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v6, *MEMORY[0x1E0D37798]);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setLastMessageTimeStampOnLoad:(int64_t)a3
{
  NSMutableDictionary *chatInfo;
  void *v6;

  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_lastMessageTimeStampOnLoad = a3;
  chatInfo = self->_chatInfo;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v6, *MEMORY[0x1E0D377F0]);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_chatInfo, "removeObjectForKey:", *MEMORY[0x1E0D377F0]);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)isRecovered
{
  BOOL isRecovered;

  -[NSRecursiveLock lock](self->_lock, "lock");
  isRecovered = self->_isRecovered;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return isRecovered;
}

- (void)setRecovered:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableDictionary *chatInfo;
  void *v6;

  v3 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_isRecovered = v3;
  chatInfo = self->_chatInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v6, *MEMORY[0x1E0D377C0]);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)isDeletingIncomingMessages
{
  BOOL isDeletingIncomingMessages;

  -[NSRecursiveLock lock](self->_lock, "lock");
  isDeletingIncomingMessages = self->_isDeletingIncomingMessages;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return isDeletingIncomingMessages;
}

- (void)setDeletingIncomingMessages:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableDictionary *chatInfo;
  void *v6;

  v3 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_isDeletingIncomingMessages = v3;
  chatInfo = self->_chatInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v6, *MEMORY[0x1E0D377A8]);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (int64_t)pendingIncomingSatelliteMessageCount
{
  int64_t pendingIncomingSatelliteMessageCount;

  -[NSRecursiveLock lock](self->_lock, "lock");
  pendingIncomingSatelliteMessageCount = self->_pendingIncomingSatelliteMessageCount;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return pendingIncomingSatelliteMessageCount;
}

- (void)setPendingIncomingSatelliteMessageCount:(int64_t)a3
{
  NSMutableDictionary *chatInfo;
  void *v6;

  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_pendingIncomingSatelliteMessageCount = a3;
  chatInfo = self->_chatInfo;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v6, *MEMORY[0x1E0D37828]);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_chatInfo, "removeObjectForKey:", *MEMORY[0x1E0D37828]);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)isDownloadingPendingSatelliteMessages
{
  BOOL isDownloadingPendingSatelliteMessages;

  -[NSRecursiveLock lock](self->_lock, "lock");
  isDownloadingPendingSatelliteMessages = self->_isDownloadingPendingSatelliteMessages;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return isDownloadingPendingSatelliteMessages;
}

- (void)setIsDownloadingPendingSatelliteMessages:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableDictionary *chatInfo;
  void *v6;

  v3 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_isDownloadingPendingSatelliteMessages = v3;
  chatInfo = self->_chatInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v6, CFSTR("downloadingPendingSatelliteMessages"));

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)requestedDowngradeService
{
  void *v2;
  void *v3;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("requestedDowngradeService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setRequestedDowngradeService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDChat requestedDowngradeService](self, "requestedDowngradeService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
  {
    v11 = CFSTR("requestedDowngradeService");
    v6 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat updateProperties:](self, "updateProperties:", v7);

    if (!v4)
    -[IMDChat broadcaster](self, "broadcaster");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat properties](self, "properties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chat:propertiesUpdated:", v9, v10);

  }
}

- (NSDate)requestedDowngradeExpirationDate
{
  void *v2;
  void *v3;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("requestedDowngradeExpirationDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setRequestedDowngradeExpirationDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDChat requestedDowngradeExpirationDate](self, "requestedDowngradeExpirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
  {
    v11 = CFSTR("requestedDowngradeExpirationDate");
    v6 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat updateProperties:](self, "updateProperties:", v7);

    if (!v4)
    -[IMDChat broadcaster](self, "broadcaster");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat properties](self, "properties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chat:propertiesUpdated:", v9, v10);

  }
}

- (IMDaemonListenerChatProtocol)broadcaster
{
  void *v3;
  void *v4;

  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "broadcasterForChatListenersUsingBlackholeRegistry:", -[IMDChat isBlackholed](self, "isBlackholed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMDaemonListenerChatProtocol *)v4;
}

- (IMDHandle)recipient
{
  return (IMDHandle *)-[NSArray lastObject](self->_participants, "lastObject");
}

- (void)_updateCachedParticipants
{
  void *v3;
  NSMutableDictionary *chatInfo;
  uint64_t v5;
  id v6;

  -[IMDChat participants](self, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByApplyingSelector:", sel_handleInfo);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  chatInfo = self->_chatInfo;
  v5 = *MEMORY[0x1E0D37820];
  if (v6)
    -[NSMutableDictionary setObject:forKey:](chatInfo, "setObject:forKey:", v6, v5);
  else
    -[NSMutableDictionary removeObjectForKey:](chatInfo, "removeObjectForKey:", v5);

}

- (id)participantHandles
{
  void *v2;
  void *v3;

  -[IMDChat participants](self, "participants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByApplyingSelector:", sel_ID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addParticipants:(id)a3
{
  NSObject *v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  IMDChat *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  IMDChat *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  IMDChat *v34;
  __int16 v35;
  IMDChat *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v25 = (IMDChat *)a3;
  if (IMOSLoggingEnabled(v25))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v34 = self;
      v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_DEBUG, "Chat: %@  Adding participants: %@", buf, 0x16u);
    }

  }
  if (-[IMDChat style](self, "style") != 45
    || (-[IMDChat participants](self, "participants"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count") == 0,
        v4,
        v5))
  {
    -[IMDChat participants](self, "participants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "mutableCopy");

    if (!v9)
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = objc_msgSend(v9, "count");
    v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = v25;
    v11 = -[IMDChat countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v15 = objc_msgSend(v9, "indexOfObject:matchingComparison:", v14, sel_compareIDs_);
          if (v15 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v27, "addObject:", v14);
            objc_msgSend(v9, "addObject:", v14);
          }
          else
          {
            objc_msgSend(v9, "objectAtIndex:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v16, "isBetterDefinedThan:", v14) & 1) == 0)
              objc_msgSend(v9, "replaceObjectAtIndex:withObject:", v15, v14);

          }
        }
        v11 = -[IMDChat countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v11);
    }

    objc_msgSend(v24, "setObject:forKey:", v27, CFSTR("__kIMDChatParticipantsDidChangeAddedParticipantsKey"));
    -[IMDChat setParticipants:](self, "setParticipants:", v9);
    -[IMDChat participants](self, "participants");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count") == v23;

    if (!v18)
    {
      -[IMDChat setCloudKitSyncState:](self, "setCloudKitSyncState:", 0);
      +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "storeChat:", self);

      objc_msgSend(MEMORY[0x1E0D39A00], "sharedCoordinator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat groupID](self, "groupID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "informOfChangedGroupMembership:", v21);

    }
    -[IMDChat _updateCachedParticipants](self, "_updateCachedParticipants");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMDChatParticipantsDidChangeNotification"), self, v24);

  }
  else if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v25;
      v35 = 2112;
      v36 = self;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Trying to add participants: %@ to 1:1 chat :%@", buf, 0x16u);
    }

  }
}

- (void)addParticipant:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidatePersonCentricGroupedChatsCache");

  v5 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat addParticipants:](self, "addParticipants:", v6);

    v5 = v7;
  }

}

- (BOOL)removeParticipants:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  id v28;
  id v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  IMDChat *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  if (IMOSLoggingEnabled(v28))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v37 = self;
      v38 = 2112;
      v39 = v28;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_DEBUG, "Chat: %@  Removing participants: %@", buf, 0x16u);
    }

  }
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidatePersonCentricGroupedChatsCache");

  if (-[IMDChat style](self, "style") == 43)
  {
    -[IMDChat participants](self, "participants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") >= 3)
    {

    }
    else
    {
      -[IMDChat service](self, "service");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "supportsCapability:", *MEMORY[0x1E0D38DF8]);

      if ((v7 & 1) == 0)
      {
        if (IMOSLoggingEnabled(v8))
        {
          OSLogHandleForIMFoundationCategory();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v37 = self;
            _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Trying to remove participant from a group chat with 2 or less participants %@", buf, 0xCu);
          }

        }
        v10 = 0;
        goto LABEL_28;
      }
    }
  }
  -[IMDChat participants](self, "participants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "mutableCopy");

  if (!v12)
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = objc_msgSend(v12, "count");
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = v28;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v14);
        v18 = objc_msgSend(v12, "indexOfObject:matchingComparison:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), sel_compareIDs_, v27);
        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v12, "objectAtIndex:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

          objc_msgSend(v12, "removeObjectAtIndex:", v18);
        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v15);
  }

  objc_msgSend(v29, "setObject:forKey:", v13, CFSTR("__kIMDChatParticipantsDidChangeRemovedParticipantsKey"));
  -[IMDChat setParticipants:](self, "setParticipants:", v12);
  -[IMDChat participants](self, "participants");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count") == (int)v27;

  if (!v21)
  {
    -[IMDChat setCloudKitSyncState:](self, "setCloudKitSyncState:", 0);
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "storeChat:", self);

    objc_msgSend(MEMORY[0x1E0D39A00], "sharedCoordinator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat groupID](self, "groupID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "informOfChangedGroupMembership:", v24);

  }
  -[IMDChat _updateCachedParticipants](self, "_updateCachedParticipants", v27);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMDChatParticipantsDidChangeNotification"), self, v29);

  v10 = 1;
LABEL_28:

  return v10;
}

- (BOOL)removeParticipant:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[IMDChat removeParticipants:](self, "removeParticipants:", v6, v9, v10);
  return v7;
}

- (void)resetParticipants:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  unint64_t v7;
  NSObject *v8;
  signed __int8 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  _BYTE v14[18];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412546;
      *(_QWORD *)v14 = self;
      *(_WORD *)&v14[8] = 2112;
      *(_QWORD *)&v14[10] = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEBUG, "Chat: %@  Resetting to participants: %@", (uint8_t *)&v13, 0x16u);
    }

  }
  v6 = -[IMDChat style](self, "style") == 43;
  v7 = objc_msgSend(v4, "count");
  if (v6)
  {
    if (v7 <= 1)
      goto LABEL_7;
LABEL_12:
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidatePersonCentricGroupedChatsCache");

    -[IMDChat setParticipants:](self, "setParticipants:", v4);
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "storeChat:", self);

    -[IMDChat _updateCachedParticipants](self, "_updateCachedParticipants");
    goto LABEL_13;
  }
  if (v7 == 1)
    goto LABEL_12;
LABEL_7:
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = -[IMDChat style](self, "style");
      v10 = objc_msgSend(v4, "count");
      v13 = 67109376;
      *(_DWORD *)v14 = v9;
      *(_WORD *)&v14[4] = 2048;
      *(_QWORD *)&v14[6] = v10;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Rejecting participant reset, style is %c but participant count is %llu", (uint8_t *)&v13, 0x12u);
    }

  }
LABEL_13:

}

- (void)recoverParticipantsIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  IMDHandle *v6;
  NSObject *v7;
  int v8;
  IMDChat *v9;
  __int16 v10;
  IMDChat *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[IMDChat style](self, "style") == 45)
  {
    -[IMDChat participants](self, "participants");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (!v4)
    {
      -[IMDChat chatIdentifier](self, "chatIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "length"))
      {
        v6 = -[IMDHandle initWithID:unformattedID:countryCode:]([IMDHandle alloc], "initWithID:unformattedID:countryCode:", v5, 0, 0);
        if (IMOSLoggingEnabled(-[IMDChat addParticipant:](self, "addParticipant:", v6)))
        {
          OSLogHandleForIMFoundationCategory();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            v8 = 138412546;
            v9 = (IMDChat *)v6;
            v10 = 2112;
            v11 = self;
            _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_DEBUG, "1:1 chat was missing participant, re-added %@ to %@", (uint8_t *)&v8, 0x16u);
          }

        }
      }
      else
      {
        if (!IMOSLoggingEnabled(0))
        {
LABEL_13:

          return;
        }
        OSLogHandleForIMFoundationCategory();
        v6 = (IMDHandle *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_INFO))
        {
          v8 = 138412290;
          v9 = self;
          _os_log_impl(&dword_1D1413000, &v6->super, OS_LOG_TYPE_INFO, "Cannot recover participant due to empty chatIdentifier for chat: %@", (uint8_t *)&v8, 0xCu);
        }
      }

      goto LABEL_13;
    }
  }
}

- (IMDService)service
{
  void *v2;
  void *v3;

  -[IMDChat account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMDService *)v3;
}

- (IMDServiceSession)serviceSession
{
  void *v2;
  void *v3;

  -[IMDChat account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMDServiceSession *)v3;
}

- (int64_t)engroupCreationDate
{
  void *v2;
  void *v3;
  int64_t v4;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("EngroupCreationDateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (id)_sortedParticipantIDHashForParticipants:(id)a3
{
  return -[IMDChat _sortedParticipantIDHashForParticipants:usesPersonCentricID:](self, "_sortedParticipantIDHashForParticipants:usesPersonCentricID:", a3, 1);
}

- (BOOL)isOlderThan:(id)a3
{
  return -[IMDChat compareBySequenceNumberAndDateDescending:](self, "compareBySequenceNumberAndDateDescending:", a3) == 1;
}

- (BOOL)isNewerThan:(id)a3
{
  return -[IMDChat compareBySequenceNumberAndDateDescending:](self, "compareBySequenceNumberAndDateDescending:", a3) == -1;
}

- (NSString)description
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  const __CFString *v17;
  int64_t v18;
  void *v19;
  void *v20;
  int64_t v21;
  unint64_t v22;
  void *v23;
  int64_t v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v27 = (void *)MEMORY[0x1E0CB3940];
  -[IMDChat guid](self, "guid");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[IMDChat style](self, "style");
  v24 = -[IMDChat state](self, "state");
  -[IMDChat participants](self, "participants");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat roomName](self, "roomName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat displayName](self, "displayName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat chatIdentifier](self, "chatIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[IMDChat unreadCount](self, "unreadCount");
  v21 = -[IMDChat rowID](self, "rowID");
  -[IMDChat groupID](self, "groupID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat originalGroupID](self, "originalGroupID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat lastAddressedLocalHandle](self, "lastAddressedLocalHandle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat lastAddressedSIMID](self, "lastAddressedSIMID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[IMDChat isFiltered](self, "isFiltered");
  v3 = CFSTR("YES");
  if (-[IMDChat hasHadSuccessfulQuery](self, "hasHadSuccessfulQuery"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v17 = v4;
  -[IMDChat engramID](self, "engramID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat serverChangeToken](self, "serverChangeToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMDChat cloudKitSyncState](self, "cloudKitSyncState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[IMDChat lastReadMessageTimeStamp](self, "lastReadMessageTimeStamp"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMDChat engroupCreationDate](self, "engroupCreationDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat cloudKitRecordID](self, "cloudKitRecordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMDChat isBlackholed](self, "isBlackholed"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  -[IMDChat groupPhotoGuid](self, "groupPhotoGuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMDChat isRecovered](self, "isRecovered"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (!-[IMDChat isDeletingIncomingMessages](self, "isDeletingIncomingMessages"))
    v3 = CFSTR("NO");
  -[IMDChat repairHistory](self, "repairHistory");
  IMStringFromChatRepairHistory();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("IMDChat: %p GUID: %@ Style: %c State: %d Participants: %@  Room Name: %@  Display Name: %@  Identifier: %@  Unread count: %d  Row ID: %lld  Group ID: %@, originalGroupID: %@ lastAddressedHandle: %@ lastAddressedSIMID: %@ isFiltered: %d, hasHadSuccessfulQuery: %@, Engram ID: %@, serverChangeToken:%@, cKSate:%@ lastReadTime:%@ engroupCreationDate: %@ %@ cloudKitRecordID, isBlackholed: %@ groupPhotoGuid: %@ isRecovered: %@ isDeletingIncomingMessages %@ repairHistory %@ pendingIncomingSatelliteMessageCount: %d"), self, v26, v25, v24, v31, v30, v23, v32, v22, v21, v29, v20, v19, v28, v18, v17,
    v16,
    v5,
    v6,
    v15,
    v7,
    v8,
    v9,
    v10,
    v11,
    v3,
    v12,
    -[IMDChat pendingIncomingSatelliteMessageCount](self, "pendingIncomingSatelliteMessageCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSDictionary)chatProperties
{
  return (NSDictionary *)-[IMDChat copyDictionaryRepresentation:](self, "copyDictionaryRepresentation:", 0);
}

- (id)dictionaryRepresentationIncludingLastMessage
{
  return -[IMDChat copyDictionaryRepresentation:](self, "copyDictionaryRepresentation:", 1);
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)-[IMDChat copyDictionaryRepresentation:](self, "copyDictionaryRepresentation:", 0);
}

- (void)_updateLastMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  IMDChat *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138412546;
      v8 = self;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEBUG, "Chat: %@   Updating last message: %@", (uint8_t *)&v7, 0x16u);
    }

  }
  -[IMDChat setLastMessage:](self, "setLastMessage:", v4);
  if (objc_msgSend(v4, "isFromMe"))
  {
    objc_msgSend(v4, "time");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat setLastSentMessageDate:](self, "setLastSentMessageDate:", v6);

  }
}

- (BOOL)updateProperties:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  CFMutableDictionaryRef Mutable;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  IMDChat *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v19 = 138412546;
        v20 = self;
        v21 = 2112;
        v22 = v4;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEBUG, "Chat: %@   Property update: %@", (uint8_t *)&v19, 0x16u);
      }

    }
    -[NSRecursiveLock lock](self->_lock, "lock");
    if (-[NSDictionary count](self->_properties, "count"))
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", self->_properties);
    else
      v7 = 0;
    Mutable = (CFMutableDictionaryRef)-[NSDictionary mutableCopy](self->_properties, "mutableCopy");
    if (!Mutable)
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    -[__CFDictionary addEntriesFromDictionary:](Mutable, "addEntriesFromDictionary:", v4);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary allKeysForObject:](Mutable, "allKeysForObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
      -[__CFDictionary removeObjectsForKeys:](Mutable, "removeObjectsForKeys:", v11);
    v12 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", Mutable, 200);
    v8 = v12;
    if ((v12 & 1) != 0)
    {
      v13 = IMOSLoggingEnabled(v12);
      if ((_DWORD)v13)
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v19 = 138412290;
          v20 = (IMDChat *)Mutable;
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_DEBUG, "     Resulting properties: %@", (uint8_t *)&v19, 0xCu);
        }

      }
      if (v7 && self->_properties)
      {
        v13 = objc_msgSend(v7, "isEqualToDictionary:", Mutable);
        v15 = Mutable ? v13 : 0;
        if ((v15 & 1) != 0)
        {
          v8 = 0;
LABEL_34:
          -[NSRecursiveLock unlock](self->_lock, "unlock");

          goto LABEL_35;
        }
      }
      if (IMOSLoggingEnabled(v13))
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_DEBUG, "     => Saving changes", (uint8_t *)&v19, 2u);
        }

      }
      -[IMDChat setProperties:](self, "setProperties:", Mutable);
      +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject storeChat:](v16, "storeChat:", self);
    }
    else
    {
      IMLogHandleForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1D166A5F8();
    }

    goto LABEL_34;
  }
  v8 = 0;
LABEL_35:

  return v8;
}

- (BOOL)updateProperties:(id)a3 shouldBroadcast:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = -[IMDChat updateProperties:](self, "updateProperties:", a3);
  if (v6 && v4)
  {
    -[IMDChat broadcaster](self, "broadcaster");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat properties](self, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat:propertiesUpdated:", v8, v9);

  }
  return v6;
}

- (void)storeAndBroadcastChatChanges
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storeChat:", self);

  v6 = -[IMDChat copyDictionaryRepresentation:](self, "copyDictionaryRepresentation:", 0);
  -[IMDChat broadcaster](self, "broadcaster");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat guid](self, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat:updated:", v5, v6);

}

- (id)generateNewGroupID
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v10;
  IMDChat *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[IMDChat style](self, "style") == 45)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v10 = 138412546;
        v11 = self;
        v12 = 2112;
        v13 = v3;
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_DEBUG, "   Generating group ID for chat: %@    groupID: %@", (uint8_t *)&v10, 0x16u);
      }
LABEL_9:

    }
  }
  else
  {
    -[IMDChat participants](self, "participants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat lastAddressedLocalHandle](self, "lastAddressedLocalHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _IMDHashParticipants(v5, v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        -[IMDChat participants](self, "participants");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412802;
        v11 = self;
        v12 = 2112;
        v13 = v3;
        v14 = 2112;
        v15 = v8;
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_DEBUG, "   Generating group ID for chat: %@    groupID: %@  using IDs = %@", (uint8_t *)&v10, 0x20u);

      }
      goto LABEL_9;
    }
  }
  return v3;
}

- (BOOL)isUnnamedChat
{
  void *v3;
  void *v4;
  BOOL v5;

  -[IMDChat displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IMDChat displayName](self, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)updateGroupID:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[IMDChat groupID](self, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = IMSharedHelperAreObjectsLogicallySame();

  if ((v5 & 1) == 0)
  {
    -[IMDChat setGroupID:](self, "setGroupID:", v6);
    -[IMDChat storeAndBroadcastChatChanges](self, "storeAndBroadcastChatChanges");
  }

}

- (void)updateEngramID:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[IMDChat engramID](self, "engramID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = IMSharedHelperAreObjectsLogicallySame();

  if ((v5 & 1) == 0)
  {
    -[IMDChat setEngramID:](self, "setEngramID:", v8);
    -[IMDChat storeAndBroadcastChatChanges](self, "storeAndBroadcastChatChanges");
    -[IMDChat broadcaster](self, "broadcaster");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chat:engramIDUpdated:", v7, v8);

  }
}

- (void)updateEngroupCreationDate:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  if (!-[IMDChat engroupCreationDate](self, "engroupCreationDate"))
  {
    -[IMDChat properties](self, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = v8;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("EngroupCreationDateKey"));

    -[IMDChat updateProperties:](self, "updateProperties:", v10);
  }
}

- (void)updateLastReadMessageTimeStampIfNeeded:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_lastReadMessageTimeStamp < a3)
  {
    if (IMOSLoggingEnabled(self))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_lastReadMessageTimeStamp);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDChat chatIdentifier](self, "chatIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412802;
        v10 = v6;
        v11 = 2112;
        v12 = v7;
        v13 = 2112;
        v14 = v8;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEBUG, "Updating lastReadMessageTimeStamp from: %@ to: %@ for chat: %@", (uint8_t *)&v9, 0x20u);

      }
    }
    -[IMDChat setLastReadMessageTimeStamp:](self, "setLastReadMessageTimeStamp:", a3);
    -[IMDChat setCloudKitSyncState:](self, "setCloudKitSyncState:", 0);
    -[IMDChat storeAndBroadcastChatChanges](self, "storeAndBroadcastChatChanges");
  }
}

- (void)updateServerChangeToken:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDChat serverChangeToken](self, "serverChangeToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = IMSharedHelperAreObjectsLogicallySame();

  if ((v6 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[IMDChat serverChangeToken](self, "serverChangeToken");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        -[IMDChat chatIdentifier](self, "chatIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412802;
        v12 = v9;
        v13 = 2112;
        v14 = v4;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_DEBUG, "Updating record change tag (etag) from: %@ to: %@ for chat: %@", (uint8_t *)&v11, 0x20u);

      }
    }
    -[IMDChat setServerChangeToken:](self, "setServerChangeToken:", v4);
    -[IMDChat storeAndBroadcastChatChanges](self, "storeAndBroadcastChatChanges");
  }

}

- (void)updateCloudKitSyncState:(int64_t)a3
{
  if (self->_cloudKitSyncState != a3)
  {
    -[IMDChat setCloudKitSyncState:](self, "setCloudKitSyncState:");
    -[IMDChat storeAndBroadcastChatChanges](self, "storeAndBroadcastChatChanges");
  }
}

- (void)updateOriginalGroupID:(id)a3
{
  id v4;

  v4 = a3;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
  {
    -[IMDChat setOriginalGroupID:](self, "setOriginalGroupID:", v4);
    -[IMDChat storeAndBroadcastChatChanges](self, "storeAndBroadcastChatChanges");
  }

}

- (void)updateCloudKitRecordID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDChat cloudKitRecordID](self, "cloudKitRecordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = IMSharedHelperAreObjectsLogicallySame();

  if ((v6 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[IMDChat cloudKitRecordID](self, "cloudKitRecordID");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        -[IMDChat chatIdentifier](self, "chatIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412802;
        v12 = v9;
        v13 = 2112;
        v14 = v4;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_DEBUG, "Updating ck record ID from: %@ to: %@ for chat: %@", (uint8_t *)&v11, 0x20u);

      }
    }
    -[IMDChat setCloudKitRecordID:](self, "setCloudKitRecordID:", v4);
    -[IMDChat storeAndBroadcastChatChanges](self, "storeAndBroadcastChatChanges");
  }

}

- (void)resetCKSyncState
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_DEBUG, "resetting CK Sync state", v4, 2u);
    }

  }
  -[IMDChat setCloudKitSyncState:](self, "setCloudKitSyncState:", 0);
  -[IMDChat setServerChangeToken:](self, "setServerChangeToken:", 0);
  -[IMDChat setCloudKitRecordID:](self, "setCloudKitRecordID:", 0);
  -[IMDChat storeAndBroadcastChatChanges](self, "storeAndBroadcastChatChanges");
}

- (void)updateLastAddressedHandle:(id)a3
{
  -[IMDChat updateLastAddressedHandle:forceUpdate:](self, "updateLastAddressedHandle:forceUpdate:", a3, 0);
}

- (void)updateLastAddressedHandle:(id)a3 forceUpdate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char v8;
  uint64_t HasMultipleSubscriptions;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  _BYTE v18[22];
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4
    || (-[IMDChat lastAddressedLocalHandle](self, "lastAddressedLocalHandle"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = IMSharedHelperAreObjectsLogicallySame(),
        v7,
        (v8 & 1) == 0))
  {
    if ((objc_msgSend(v6, "isEqualToIgnoringCase:", *MEMORY[0x1E0D36F80]) & 1) == 0)
    {
      HasMultipleSubscriptions = IMSharedHelperDeviceHasMultipleSubscriptions();
      if (v6
        || (HasMultipleSubscriptions & 1) != 0
        || (objc_msgSend(0, "trimmedString"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "length"),
            v10,
            v11))
      {
        if (IMOSLoggingEnabled(HasMultipleSubscriptions))
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            -[IMDChat lastAddressedLocalHandle](self, "lastAddressedLocalHandle");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = CFSTR("NO");
            *(_DWORD *)v18 = 138412802;
            *(_QWORD *)&v18[4] = v13;
            *(_WORD *)&v18[12] = 2112;
            if (v4)
              v14 = CFSTR("YES");
            *(_QWORD *)&v18[14] = v6;
            v19 = 2112;
            v20 = v14;
            _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_DEBUG, "Updating last addressed handle ID from %@ to %@. force update %@", v18, 0x20u);

          }
        }
        -[IMDChat setLastAddressedLocalHandle:](self, "setLastAddressedLocalHandle:", v6, *(_OWORD *)v18);
        +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "storeChat:", self);

        -[IMDChat broadcaster](self, "broadcaster");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDChat guid](self, "guid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "chat:lastAddressedHandleUpdated:", v17, v6);

        -[IMDChat storeAndBroadcastChatChanges](self, "storeAndBroadcastChatChanges");
      }
    }
  }

}

- (void)updateLastAddressedSIMID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMDChat lastAddressedSIMID](self, "lastAddressedSIMID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = IMSharedHelperAreObjectsLogicallySame();

    if ((v6 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v7))
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          -[IMDChat lastAddressedSIMID](self, "lastAddressedSIMID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138412546;
          v14 = v9;
          v15 = 2112;
          v16 = v4;
          _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_DEBUG, "Updating last addressed sim ID from %@ to %@", (uint8_t *)&v13, 0x16u);

        }
      }
      -[IMDChat setLastAddressedSIMID:](self, "setLastAddressedSIMID:", v4);
      +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "storeChat:", self);

      -[IMDChat broadcaster](self, "broadcaster");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat guid](self, "guid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "chat:lastAddressedSIMIDUpdated:", v12, v4);

      -[IMDChat storeAndBroadcastChatChanges](self, "storeAndBroadcastChatChanges");
    }
  }

}

- (void)updateLastAddressedHandle:(id)a3 forceUpdateHandle:(BOOL)a4 lastAddressedSIMID:(id)a5
{
  void *v5;
  id v9;
  id v10;
  uint64_t HasMultipleSubscriptions;
  char v12;
  int v13;
  void *v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (a4)
  {
    if ((objc_msgSend(v9, "isEqualToIgnoringCase:", *MEMORY[0x1E0D36F80]) & 1) != 0)
    {
      if (a4)
        goto LABEL_13;
LABEL_7:

      goto LABEL_13;
    }
    HasMultipleSubscriptions = IMSharedHelperDeviceHasMultipleSubscriptions();
    if (v9 || (HasMultipleSubscriptions & 1) != 0)
    {
LABEL_24:
      if (IMOSLoggingEnabled(HasMultipleSubscriptions))
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          -[IMDChat lastAddressedLocalHandle](self, "lastAddressedLocalHandle");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138412546;
          v26 = v23;
          v27 = 2112;
          v28 = v9;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_DEBUG, "Updating last addressed handle ID from %@ to %@", (uint8_t *)&v25, 0x16u);

        }
      }
      -[IMDChat setLastAddressedLocalHandle:](self, "setLastAddressedLocalHandle:", v9);
      if (!objc_msgSend(v10, "length"))
        goto LABEL_30;
      v13 = 1;
LABEL_15:
      -[IMDChat lastAddressedSIMID](self, "lastAddressedSIMID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = IMSharedHelperAreObjectsLogicallySame();

      if ((v15 & 1) == 0)
      {
        if (IMOSLoggingEnabled(v16))
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            -[IMDChat lastAddressedSIMID](self, "lastAddressedSIMID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138412546;
            v26 = v18;
            v27 = 2112;
            v28 = v10;
            _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_DEBUG, "Updating last addressed sim ID from %@ to %@", (uint8_t *)&v25, 0x16u);

          }
        }
        -[IMDChat setLastAddressedSIMID:](self, "setLastAddressedSIMID:", v10);
        +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "storeChat:", self);

        -[IMDChat broadcaster](self, "broadcaster");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDChat guid](self, "guid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v20, "chat:lastAddressedHandleUpdated:lastAddressedSIMIDUpdated:", v21, v9, v10);
        else
          objc_msgSend(v20, "chat:lastAddressedSIMIDUpdated:", v21, v10);
        goto LABEL_32;
      }
      if (!v13)
        goto LABEL_33;
LABEL_30:
      +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "storeChat:", self);

      -[IMDChat broadcaster](self, "broadcaster");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat guid](self, "guid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "chat:lastAddressedHandleUpdated:", v21, v9);
LABEL_32:

      -[IMDChat storeAndBroadcastChatChanges](self, "storeAndBroadcastChatChanges");
      goto LABEL_33;
    }
  }
  else
  {
    -[IMDChat lastAddressedLocalHandle](self, "lastAddressedLocalHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((IMSharedHelperAreObjectsLogicallySame() & 1) != 0
      || (objc_msgSend(v9, "isEqualToIgnoringCase:", *MEMORY[0x1E0D36F80]) & 1) != 0)
    {
      goto LABEL_7;
    }
    v12 = IMSharedHelperDeviceHasMultipleSubscriptions();

    if (v9 || (v12 & 1) != 0)
      goto LABEL_24;
  }
LABEL_13:
  if (objc_msgSend(v10, "length"))
  {
    v13 = 0;
    goto LABEL_15;
  }
LABEL_33:

}

- (void)updateDisplayName:(id)a3
{
  -[IMDChat updateDisplayName:sender:](self, "updateDisplayName:sender:", a3, 0);
}

- (void)updateDisplayName:(id)a3 sender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;

  v15 = (NSString *)a3;
  v6 = a4;
  if (self->_displayName != v15
    && (self->_style != 45
     || -[IMDChat isBusinessChat](self, "isBusinessChat")
     || -[IMDChat isStewieChat](self, "isStewieChat")))
  {
    -[IMDChat setDisplayName:](self, "setDisplayName:", v15);
    -[IMDChat setCloudKitSyncState:](self, "setCloudKitSyncState:", 0);
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storeChat:", self);

    +[IMDChatVocabularyUpdater sharedInstance](IMDChatVocabularyUpdater, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateVocabularyForRenamedChat:completionHandler:", self, 0);

    -[IMDChat storeAndBroadcastChatChanges](self, "storeAndBroadcastChatChanges");
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateFaceTimeGroupName:", self);

    objc_msgSend(MEMORY[0x1E0D39A00], "sharedCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat groupID](self, "groupID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "informOfChangedGroupDisplayName:", v11);

    -[IMDChat broadcaster](self, "broadcaster");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat personCentricID](self, "personCentricID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "chat:chatPersonCentricID:displayNameUpdated:sender:", v13, v14, v15, v6);

  }
}

- (void)updateIsFiltered:(int64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[IMDChat isFiltered](self, "isFiltered") != a3)
  {
    v5 = -[IMDChat isFiltered](self, "isFiltered") == 2;
    -[IMDChat setIsFiltered:](self, "setIsFiltered:", a3);
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "storeChat:", self);

    -[IMDChat broadcaster](self, "broadcaster");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat:isFilteredUpdated:", v8, a3);

    if (v5)
    {
      if (IMOSLoggingEnabled(v9))
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          -[IMDChat guid](self, "guid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138412290;
          v17 = v11;
          _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_DEBUG, "Indexing with Spotlight as chat was moved out of Junk. Chat with guid: %@", (uint8_t *)&v16, 0xCu);

        }
      }
      v9 = -[IMDChat _indexChatAndMessagesToSpotlightWithReason:](self, "_indexChatAndMessagesToSpotlightWithReason:", 1002);
    }
    else if (a3 == 2)
    {
      if (IMOSLoggingEnabled(v9))
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          -[IMDChat guid](self, "guid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138412290;
          v17 = v13;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_DEBUG, "Delete from Spotlight as chat was moved to Junk. Chat with guid: %@", (uint8_t *)&v16, 0xCu);

        }
      }
      -[IMDChat guid](self, "guid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      IMDCoreSpotlightDeleteChatGUID();

    }
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = 67109120;
        LODWORD(v17) = a3;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_DEBUG, "Updating isFiltered to: %d", (uint8_t *)&v16, 8u);
      }

    }
  }
}

- (void)_indexChatAndMessagesToSpotlightWithReason:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      -[IMDChat guid](self, "guid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = (uint64_t)v5;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_DEBUG, "Index chat to Spotlight as it was moved out of Junk. Chat with guid: %@", buf, 0xCu);

    }
  }
  -[IMDChat guid](self, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IMDCoreSpotlightAddChatGUID();

  -[IMDChat guid](self, "guid");
  v16 = (void *)IMDChatRecordCopyChatForGUID();
  v7 = (void *)IMDChatRecordCopyMessagesWithLimit();
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134217984;
      v23 = v9;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_DEBUG, "Starting indexing %llu messages to Spotlight", buf, 0xCu);
    }

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "guid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          IMDCoreSpotlightAddMessageGUID();
        }
        else if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_DEBUG, "Failed to find messageGUID for spotlight", buf, 2u);
          }

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (void)updateIsBlackholed:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  _BOOL4 v31;
  _BYTE v32[128];
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[3];

  v3 = a3;
  v36[1] = *MEMORY[0x1E0C80C00];
  if (-[IMDChat isBlackholed](self, "isBlackholed") != a3)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0D39920], "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "acquireAssertionToUnsuspendProcess");

    }
    -[IMDChat setIsBlackholed:](self, "setIsBlackholed:", v3);
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storeChat:", self);

    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "broadcasterForChatListenersUsingBlackholeRegistry:", v3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "broadcasterForChatListenersUsingBlackholeRegistry:", v3 ^ 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMDChat guid](self, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leftChat:", v8);

    if (v3)
    {
      -[IMDChat chatIdentifier](self, "chatIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat dictionaryRepresentationIncludingLastMessage](self, "dictionaryRepresentationIncludingLastMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "chatLoadedWithChatIdentifier:chats:", v9, v11);
    }
    else
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("__kIMChatPreviouslyBlackholedChatHasBeenLoaded"), 0, 0, 1u);
      -[IMDChat chatIdentifier](self, "chatIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat dictionaryRepresentationIncludingLastMessage](self, "dictionaryRepresentationIncludingLastMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "previouslyBlackholedChatLoadedWithChatIdentifier:chats:", v9, v11);
    }

    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "checkBlackholedChatsExistAfterUpdatingChatWithAdd:", v3);

    -[IMDChat guid](self, "guid");
    v22 = (void *)IMDChatRecordCopyChatForGUID();
    if (!v3)
    {
      v33 = CFSTR("restoredFromBlackhole");
      v34 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat updateProperties:](self, "updateProperties:", v14);

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v15 = (id)IMDChatRecordCopyMessagesWithLimit();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v27 != v17)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "guid", v22);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              IMDCoreSpotlightAddMessageGUID();
            }
            else if (IMOSLoggingEnabled(0))
            {
              OSLogHandleForIMFoundationCategory();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109120;
                v31 = v3;
                _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_DEBUG, "Failed to find messageGUID for spotlight reindexing when isBlackholed set to (expecting 0): %d", buf, 8u);
              }

            }
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        }
        while (v16);
      }

      -[IMDChat _chatRegistry](self, "_chatRegistry");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "updateLastMessageForChat:hintMessage:", self, 0);

    }
  }
}

- (void)updateHasCancellableScheduledMessage:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v5 = -[IMDChat hasScheduledMessage](self, "hasScheduledMessage");
  if (v5 != v3)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = CFSTR("NO");
        if (v3)
          v7 = CFSTR("YES");
        v15 = 138412290;
        v16 = v7;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEBUG, "Updating hasScheduledMessage to: %@", (uint8_t *)&v15, 0xCu);
      }

    }
    -[IMDChat setHasScheduledMessage:](self, "setHasScheduledMessage:", v3);
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storeChat:", self);

    v9 = -[IMDChat copyDictionaryRepresentation:](self, "copyDictionaryRepresentation:", 0);
    -[IMDChat broadcaster](self, "broadcaster");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "chat:updated:", v11, v9);

    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = CFSTR("NO");
        if (v3)
          v14 = CFSTR("YES");
        v15 = 138412290;
        v16 = v14;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_DEBUG, "Updated hasScheduledMessage to: %@", (uint8_t *)&v15, 0xCu);
      }

    }
  }
}

- (void)_updateIsRecovered:(BOOL)a3 silently:(BOOL)a4
{
  _BOOL8 v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;

  v5 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (-[IMDChat isRecovered](self, "isRecovered") != a3)
  {
    v7 = -[IMDChat setRecovered:](self, "setRecovered:", v5);
    if (!a4)
    {
      +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "storeChat:", self);

      -[IMDChat setCloudKitSyncState:](self, "setCloudKitSyncState:", 0);
      -[IMDChat broadcaster](self, "broadcaster");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat guid](self, "guid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "chat:isRecoveredUpdated:", v10, v5);

    }
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = CFSTR("NO");
        if (v5)
          v12 = CFSTR("YES");
        v13 = 138412290;
        v14 = v12;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_DEBUG, "Updating isRecovered to: %@", (uint8_t *)&v13, 0xCu);
      }

    }
  }
}

- (void)updateIsDeletingIncomingMessages:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (-[IMDChat isDeletingIncomingMessages](self, "isDeletingIncomingMessages") != a3)
  {
    -[IMDChat setDeletingIncomingMessages:](self, "setDeletingIncomingMessages:", v3);
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storeChat:", self);

    -[IMDChat broadcaster](self, "broadcaster");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chat:isDeletingIncomingMessagesUpdated:", v7, v3);

    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = CFSTR("NO");
        if (v3)
          v10 = CFSTR("YES");
        v11 = 138412290;
        v12 = v10;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_DEBUG, "Updating isDeletingIncomingMessages to: %@", (uint8_t *)&v11, 0xCu);
      }

    }
  }
}

- (void)updateIsRecovered:(BOOL)a3
{
  MEMORY[0x1E0DE7D20](self, sel__updateIsRecovered_silently_);
}

- (void)updateIsDownloadingPendingSatelliteMessages:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierPigeonEnabled");

  if (!v6)
    return;
  +[IMDChorosController sharedController](IMDChorosController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSatelliteConnectionActive");

  if ((v8 & 1) != 0)
  {
    if (-[IMDChat isDownloadingPendingSatelliteMessages](self, "isDownloadingPendingSatelliteMessages") == v3)
      return;
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[IMDChat guid](self, "guid");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v11;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_DEBUG, "Satellite connection is inactive. Immediately setting isDownloadingPendingSatelliteMessages to NO for chat with GUID %@", (uint8_t *)&v19, 0xCu);

    }
  }
  if (-[IMDChat isDownloadingPendingSatelliteMessages](self, "isDownloadingPendingSatelliteMessages"))
  {
    v3 = 0;
LABEL_11:
    -[IMDChat setIsDownloadingPendingSatelliteMessages:](self, "setIsDownloadingPendingSatelliteMessages:", v3);
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "storeChat:", self);

    v13 = -[IMDChat copyDictionaryRepresentation:](self, "copyDictionaryRepresentation:", 0);
    -[IMDChat broadcaster](self, "broadcaster");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chat:updated:", v15, v13);

    if (IMOSLoggingEnabled(v16))
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = CFSTR("NO");
        if (v3)
          v18 = CFSTR("YES");
        v19 = 138412290;
        v20 = v18;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_DEBUG, "Updating isDownloadingPendingSatelliteMessages to: %@", (uint8_t *)&v19, 0xCu);
      }

    }
  }
}

- (void)updatePendingIncomingSatelliteMessageCount:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierPigeonEnabled");

  if (v6 && -[IMDChat pendingIncomingSatelliteMessageCount](self, "pendingIncomingSatelliteMessageCount") != a3)
  {
    -[IMDChat setPendingIncomingSatelliteMessageCount:](self, "setPendingIncomingSatelliteMessageCount:", a3);
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storeChat:", self);

    v8 = -[IMDChat copyDictionaryRepresentation:](self, "copyDictionaryRepresentation:", 0);
    -[IMDChat broadcaster](self, "broadcaster");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chat:updated:", v10, v8);

    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13[0] = 67109120;
        v13[1] = a3;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_DEBUG, "Updating pendingIncomingSatelliteMessageCount to: %d", (uint8_t *)v13, 8u);
      }

    }
  }
}

- (void)updateNumberOfTimesRespondedToThread
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = -[IMDChat getNumberOfTimesRespondedToThread](self, "getNumberOfTimesRespondedToThread");
  if (v3 <= 2)
  {
    v9 = CFSTR("numberOfTimesRespondedtoThread");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v3 + 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat updateProperties:](self, "updateProperties:", v5);

    -[IMDChat broadcaster](self, "broadcaster");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat properties](self, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chat:propertiesUpdated:", v7, v8);

  }
}

- (void)updateIsiMessageSpam:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("wasDetectedAsiMessageSpam");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat updateProperties:](self, "updateProperties:", v5);

  -[IMDChat broadcaster](self, "broadcaster");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat guid](self, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chat:propertiesUpdated:", v7, v8);

}

- (int64_t)spamCategory
{
  void *v3;
  char v4;
  void *v6;
  void *v7;
  int64_t v8;

  -[NSDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("wasDetectedAsSMSSpam"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) != 0)
    return 2;
  v6 = (void *)MEMORY[0x1E0D399F8];
  -[NSDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("SMSCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "filterActionForCategory:", (int)objc_msgSend(v7, "intValue"));

  return v8;
}

- (id)spamExtensionName
{
  return -[NSDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("smsSpamExtensionName"));
}

- (void)updateSMSCategory:(int64_t)a3 subCategory:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void **v13;
  const __CFString **v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v28 = CFSTR("wasDetectedAsSMSSpam");
  v29[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat updateProperties:](self, "updateProperties:", v7);

  if ((unint64_t)(a3 - 3) >= 2)
  {
    if (a3 == 2)
    {
      -[IMDChat updateIsFiltered:](self, "updateIsFiltered:", 2);
      v26 = CFSTR("SMSCategory");
      v27 = &unk_1E92713F8;
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = &v27;
      v14 = &v26;
      v15 = 1;
    }
    else
    {
      -[IMDChat updateIsFiltered:](self, "updateIsFiltered:", 1);
      v22[0] = CFSTR("SMSCategory");
      v22[1] = CFSTR("SMSSubCategory");
      v23[0] = &unk_1E9271410;
      v23[1] = &unk_1E9271410;
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = (void **)v23;
      v14 = (const __CFString **)v22;
      v15 = 2;
    }
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat updateProperties:](self, "updateProperties:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D399F8], "fetchSMSFilterParamForCategory:subCategory:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "category");
      v11 = objc_msgSend(v9, "subCategory");
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    -[IMDChat updateIsFiltered:](self, "updateIsFiltered:", a3 | (16 * a4));
    v24[0] = CFSTR("SMSCategory");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = CFSTR("SMSSubCategory");
    v25[0] = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat updateProperties:](self, "updateProperties:", v18);

  }
  -[IMDChat broadcaster](self, "broadcaster");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat guid](self, "guid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat properties](self, "properties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "chat:propertiesUpdated:", v20, v21);

}

- (void)updateShouldForceToSMS:(BOOL)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("shouldForceToSMS");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IMDChat updateProperties:](self, "updateProperties:", v5);

  if (v6)
  {
    -[IMDChat broadcaster](self, "broadcaster");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat properties](self, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat:propertiesUpdated:", v8, v9);

  }
}

- (void)updateSMSSpamExtensionNameChatProperty:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v10 = CFSTR("smsSpamExtensionName");
    v11[0] = a3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMDChat updateProperties:](self, "updateProperties:", v6);
    -[IMDChat broadcaster](self, "broadcaster");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat properties](self, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat:propertiesUpdated:", v8, v9);

  }
}

- (void)setLastSentMessageDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("LSMD");
  v11[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDChat updateProperties:](self, "updateProperties:", v6);
  -[IMDChat broadcaster](self, "broadcaster");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat guid](self, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat properties](self, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chat:propertiesUpdated:", v8, v9);

}

- (void)updateReceivedBlackholeError:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("RBHE");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat updateProperties:](self, "updateProperties:", v5);

  -[IMDChat broadcaster](self, "broadcaster");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat guid](self, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chat:propertiesUpdated:", v7, v8);

}

- (void)updateSMSHandshakeState:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("smsHandshakeState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat updateProperties:](self, "updateProperties:", v5);

  -[IMDChat broadcaster](self, "broadcaster");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat guid](self, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chat:propertiesUpdated:", v7, v8);

}

- (void)updateMessageHandshakeState:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("messageHandshakeState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat updateProperties:](self, "updateProperties:", v5);

  -[IMDChat broadcaster](self, "broadcaster");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat guid](self, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chat:propertiesUpdated:", v7, v8);

}

- (void)updateLastKnownHybridStateAndRemergeIfAppropriate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v3 = a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  if (-[IMDChat lastKnownHybridState](self, "lastKnownHybridState") != a3)
  {
    -[IMDChat personCentricID](self, "personCentricID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D377E8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat updateProperties:](self, "updateProperties:", v7);

    -[IMDChat broadcaster](self, "broadcaster");
    v8 = objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat properties](self, "properties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "chat:propertiesUpdated:", v9, v10);

    -[IMDChat personCentricID](self, "personCentricID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v5, "isEqualToString:", v11);

    if ((v8 & 1) == 0)
    {
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_triggerRemergeForPersonCentricID:", v5);

    }
  }
}

- (void)updateEmergencyTranscriptSharingStateChatProperty:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v3 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  v5 = -[IMDChat emergencyTranscriptSharingState](self, "emergencyTranscriptSharingState");
  if ((_DWORD)v5 != (_DWORD)v3)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v7;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEBUG, "Updating transcript sharing state to %@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3, CFSTR("emergencyTranscriptSharingState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat updateProperties:](self, "updateProperties:", v9);

    -[IMDChat broadcaster](self, "broadcaster");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat properties](self, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "chat:propertiesUpdated:", v11, v12);

  }
}

- (BOOL)isiMessageSpam
{
  void *v2;
  void *v3;
  char v4;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("wasDetectedAsiMessageSpam"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)isSMSSpam
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[IMDChat properties](self, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("wasDetectedAsSMSSpam"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDChat properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("SMSCategory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v4 && (objc_msgSend(v4, "BOOLValue") & 1) != 0 || objc_msgSend(v6, "intValue") == 1;
  return v7;
}

- (int)getNumberOfTimesRespondedToThread
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  int v7;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("numberOfTimesRespondedtoThread"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &unk_1E9271428;
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v7 = objc_msgSend(v6, "intValue");
  return v7;
}

- (id)lastSentMessageDate
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  -[IMDChat properties](self, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("LSMD"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[IMDChat lastMessage](self, "lastMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isFromMe");

    if (v6)
    {
      -[IMDChat lastMessage](self, "lastMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "time");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMDChat setLastSentMessageDate:](self, "setLastSentMessageDate:", v4);
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (BOOL)receivedBlackholeError
{
  void *v2;
  void *v3;
  char v4;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RBHE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (int)smsHandshakeState
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  int v7;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("smsHandshakeState"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &unk_1E9271428;
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v7 = objc_msgSend(v6, "intValue");
  return v7;
}

- (int)messageHandshakeState
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  int v7;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("messageHandshakeState"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &unk_1E9271428;
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v7 = objc_msgSend(v6, "intValue");
  return v7;
}

- (int)emergencyTranscriptSharingState
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  int v7;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("emergencyTranscriptSharingState"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &unk_1E9271428;
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v7 = objc_msgSend(v6, "intValue");
  return v7;
}

- (NSString)lastSeenMessageGuid
{
  void *v2;
  void *v3;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D37800]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)updateLastSeenMessageGuidIfNeeded:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCatchUpEnabled");

  if (v6)
  {
    -[IMDChat properties](self, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0D37800];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D37800]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v9;
        v21 = 2112;
        v22 = v4;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_DEBUG, "Checking if last seen message guid needs updating, old %@ new %@", buf, 0x16u);
      }

    }
    if ((objc_msgSend(v9, "isEqualToString:", v4) & 1) == 0)
    {
      v17 = v8;
      v12 = v4;
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null", v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v18 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat updateProperties:](self, "updateProperties:", v13);

      if (!v4)
      -[IMDChat broadcaster](self, "broadcaster", v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat guid](self, "guid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat properties](self, "properties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "chat:propertiesUpdated:", v15, v16);

    }
  }

}

- (id)lastTranslatableMessageGUIDWithLanguageCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[IMDChat properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D37808]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updateLastMessageGUID:(id)a3 forLanguageCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[IMDChat properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D37808];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D37808]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setValue:forKey:", v7, v6);
  v12 = v9;
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat updateProperties:](self, "updateProperties:", v11);

}

- (BOOL)isEmergencyChat
{
  void *v2;
  void *v3;
  char v4;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D377B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)updateIsEmergencyChat:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D377B0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat updateProperties:](self, "updateProperties:", v5);

}

- (BOOL)isStewieChat
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "stewieEnabled");

  if (!v4)
    return 0;
  -[IMDChat chatIdentifier](self, "chatIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1D17EA368]();

  return v6;
}

- (BOOL)isStewieEmergencyChat
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "stewieEnabled");

  if (!v4)
    return 0;
  -[IMDChat chatIdentifier](self, "chatIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = IMIsStringStewieEmergency();

  return v6;
}

- (BOOL)isStewieRoadsideChat
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "stewieEnabled");

  if (!v4)
    return 0;
  -[IMDChat chatIdentifier](self, "chatIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = IMIsStringStewieRoadside();

  return v6;
}

- (BOOL)isStewieSharingChat
{
  void *v3;
  int v4;
  NSNumber *cachedStewieSharingChat;
  void *v6;
  void *v7;
  NSNumber *v8;
  NSNumber *v9;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTranscriptSharingEnabled");

  if (!v4)
    return 0;
  cachedStewieSharingChat = self->_cachedStewieSharingChat;
  if (!cachedStewieSharingChat)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[IMDChat emergencyUserInfo](self, "emergencyUserInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInt:", v7 != 0);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v9 = self->_cachedStewieSharingChat;
    self->_cachedStewieSharingChat = v8;

    cachedStewieSharingChat = self->_cachedStewieSharingChat;
  }
  return -[NSNumber BOOLValue](cachedStewieSharingChat, "BOOLValue");
}

- (void)setEmergencyUserInfo:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTranscriptSharingEnabled");

  if (v6)
  {
    v12 = *MEMORY[0x1E0D37768];
    objc_msgSend(v4, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat updateProperties:](self, "updateProperties:", v8);

    -[IMDChat broadcaster](self, "broadcaster");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat properties](self, "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chat:propertiesUpdated:", v10, v11);

  }
}

- (IMSharedEmergencyInfo)emergencyUserInfo
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTranscriptSharingEnabled");

  if (v4)
  {
    -[IMDChat properties](self, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D37768]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D39A60], "infoFromDictionary:isStewieTranscriptSharingMessage:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (IMSharedEmergencyInfo *)v7;
}

- (id)associatedBusinessID
{
  void *v3;
  void *v4;

  if (-[IMDChat isStewieRoadsideChat](self, "isStewieRoadsideChat"))
  {
    -[IMDChat properties](self, "properties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D37720]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)updateAssociatedBusinessID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[IMDChat isStewieRoadsideChat](self, "isStewieRoadsideChat"))
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1D166A690();
    goto LABEL_13;
  }
  if ((objc_msgSend(v4, "_appearsToBeBusinessID") & 1) == 0)
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1D166A624((uint64_t)v4, v11, v14);
    goto LABEL_13;
  }
  -[IMDChat associatedBusinessID](self, "associatedBusinessID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[IMDChat guid](self, "guid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v4;
        v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_DEBUG, "Updating Associated business ID to: %@ for chat guid: %@", buf, 0x16u);

      }
    }
    v15 = *MEMORY[0x1E0D37720];
    v16 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat updateProperties:](self, "updateProperties:", v10);

    -[IMDChat broadcaster](self, "broadcaster");
    v11 = objc_claimAutoreleasedReturnValue();
    -[IMDChat guid](self, "guid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat properties](self, "properties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject chat:propertiesUpdated:](v11, "chat:propertiesUpdated:", v12, v13);

LABEL_13:
  }

}

- (BOOL)isOscarChat
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  if (-[IMDChat isFiltered](self, "isFiltered") != 2)
    return 0;
  -[IMDChat account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D38F68]);

  return v6;
}

- (void)updateHasHadSuccessfulQuery:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[IMDChat hasHadSuccessfulQuery](self, "hasHadSuccessfulQuery") != a3)
  {
    -[IMDChat setHasHadSuccessfulQuery:](self, "setHasHadSuccessfulQuery:", v3);
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storeChat:", self);

  }
}

- (void)updateGroupPhotoGuid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDChat groupPhotoGuid](self, "groupPhotoGuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
    {
      -[IMDChat setCloudKitSyncState:](self, "setCloudKitSyncState:", 0);
      v14 = *MEMORY[0x1E0D37788];
      v15[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat updateProperties:](self, "updateProperties:", v7);
LABEL_6:

      -[IMDChat broadcaster](self, "broadcaster");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat guid](self, "guid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat properties](self, "properties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "chat:propertiesUpdated:", v10, v11);

    }
  }
  else if (v5)
  {
    -[IMDChat setCloudKitSyncState:](self, "setCloudKitSyncState:", 0);
    v12 = *MEMORY[0x1E0D37788];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat updateProperties:](self, "updateProperties:", v8);

    goto LABEL_6;
  }

}

- (id)groupPhotoUploadFailureCount
{
  void *v2;
  void *v3;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("GPUFC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateGroupPhotoUploadFailureCount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDChat groupPhotoUploadFailureCount](self, "groupPhotoUploadFailureCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if ((objc_msgSend(v5, "isEqualToNumber:", v4) & 1) == 0)
    {
      v14 = CFSTR("GPUFC");
      v15[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat updateProperties:](self, "updateProperties:", v7);
LABEL_6:

      -[IMDChat broadcaster](self, "broadcaster");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat guid](self, "guid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChat properties](self, "properties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "chat:propertiesUpdated:", v10, v11);

    }
  }
  else if (v5)
  {
    v12 = CFSTR("GPUFC");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat updateProperties:](self, "updateProperties:", v8);

    goto LABEL_6;
  }

}

- (id)_chatRegistry
{
  return +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
}

- (void)_persistMergedIDMergedChatsIfNeeded:(id)a3
{
  NSObject *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  __int128 v24;
  id v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  if (IMOSLoggingEnabled(v25))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_DEBUG, "Trying to persist legacy mergedID-based merged chats - 48047873", buf, 2u);
    }

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[IMDChat participants](self, "participants");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v37;
    *(_QWORD *)&v5 = 138412290;
    v24 = v5;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v37 != v27)
        {
          v7 = v6;
          objc_enumerationMutation(obj);
          v6 = v7;
        }
        v29 = v6;
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v6);
        objc_msgSend(v8, "CNContactID", v24);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "personCentricID");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v30)
          v11 = 1;
        else
          v11 = v9 == 0;
        if (!v11)
        {
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v12 = v25;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
          if (v13)
          {
            v31 = 0;
            v14 = *(_QWORD *)v33;
            while (2)
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v33 != v14)
                  objc_enumerationMutation(v12);
                v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                if (v16 != v8)
                {
                  objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "CNContactID");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "personCentricID");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v18, "isEqualToString:", v10);
                  if ((_DWORD)v19)
                  {
                    if (IMOSLoggingEnabled(v19))
                    {
                      OSLogHandleForIMFoundationCategory();
                      v20 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138413058;
                        v41 = v8;
                        v42 = 2112;
                        v43 = v16;
                        v44 = 2112;
                        v45 = v17;
                        v46 = 2112;
                        v47 = v10;
                        _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_DEBUG, "For handle [%@] we found another handle [%@] with contactID [%@] that has the same mergedID: [%@]", buf, 0x2Au);
                      }

                    }
                    if (v17)
                    {

                      v31 = v17;
LABEL_34:
                      if (IMOSLoggingEnabled(v21))
                      {
                        OSLogHandleForIMFoundationCategory();
                        v22 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412546;
                          v41 = v8;
                          v42 = 2112;
                          v43 = v31;
                          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_DEBUG, "handle [%@] gets a mergedContactID: [%@]", buf, 0x16u);
                        }

                      }
                      objc_msgSend(v8, "setCNContactID:", v31);

                      goto LABEL_44;
                    }
                    if (!v31)
                      v31 = v10;
                  }

                }
              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
              if (v13)
                continue;
              break;
            }

            if (v31)
              goto LABEL_34;
          }
          else
          {

          }
          if (IMOSLoggingEnabled(v21))
          {
            OSLogHandleForIMFoundationCategory();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v24;
              v41 = v8;
              _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_DEBUG, "handle [%@] doesn't have mergedID siblings", buf, 0xCu);
            }

          }
        }
LABEL_44:

        v6 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v28);
  }

}

- (id)cloudKitChatID
{
  void *v3;
  void *v4;

  if (-[IMDChat style](self, "style") == 45)
    -[IMDChat guid](self, "guid");
  else
    -[IMDChat originalGroupID](self, "originalGroupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)_ckUniqueID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[IMDChat style](self, "style") == 45)
  {
    -[IMDChat guid](self, "guid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[IMDChat serviceName](self, "serviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat groupID](self, "groupID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), v5, v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)cloudKitDebugDescription
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMDChat _ckUniqueID](self, "_ckUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IMDChat cloudKitSyncState](self, "cloudKitSyncState");
  -[IMDChat serverChangeToken](self, "serverChangeToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMDChat %p _ckUniqueID %@, ckSyncState %ld recordChangeTag %@>"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)groupParticipantVersion
{
  void *v2;
  void *v3;
  int64_t v4;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("pv"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setGroupParticipantVersion:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[IMDChat groupID](self, "groupID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v6;
      v13 = 2048;
      v14 = a3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEBUG, "Setting participant version of chat %@ to %ld", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3, CFSTR("pv"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat updateProperties:](self, "updateProperties:", v8);

}

- (BOOL)isBusinessChat
{
  void *v2;
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
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[IMDChat participants](self, "participants", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isBusiness") & 1) != 0)
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

- (BOOL)isChatBot
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[IMDChat participants](self, "participants", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "personCentricID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "__im_isSipHandle"))
        {

LABEL_13:
          v11 = 1;
          goto LABEL_14;
        }
        objc_msgSend(v7, "ID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "__im_isChatBot");

        if ((v10 & 1) != 0)
          goto LABEL_13;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (void)addBIAContextWithUserID:(id)a3 referenceID:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  id obj;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[16];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isBIAEnabled");

  if (v7)
  {
    if (objc_msgSend(v38, "length"))
    {
      -[IMDChat properties](self, "properties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("AMB-BIAContext"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = v10;
      v11 = 0;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v44 != v13)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend(v15, "valueForKey:", CFSTR("userId"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v38, "isEqualToString:", v16))
            {
              v17 = v15;

              objc_msgSend(v17, "valueForKey:", CFSTR("referenceIds"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = 0u;
              v42 = 0u;
              v39 = 0u;
              v40 = 0u;
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
              if (v19)
              {
                v20 = *(_QWORD *)v40;
                do
                {
                  for (j = 0; j != v19; ++j)
                  {
                    if (*(_QWORD *)v40 != v20)
                      objc_enumerationMutation(v18);
                    objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
                  }
                  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
                }
                while (v19);
              }

              v11 = v17;
            }

          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        }
        while (v12);
      }

      if (!obj)
        obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (!v11)
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
        v24 = objc_msgSend(v38, "length");
        if (v24)
          v24 = objc_msgSend(v23, "setValue:forKey:", v38, CFSTR("userId"));
        if (IMOSLoggingEnabled(v24))
        {
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_DEBUG, "Adding a new BIA Context to Chat Properties", buf, 2u);
          }

        }
        objc_msgSend(obj, "addObject:", v23);
        objc_msgSend(v22, "setObject:forKeyedSubscript:", obj, CFSTR("AMB-BIAContext"));

      }
      if (objc_msgSend(v5, "length"))
      {
        -[IMDChat properties](self, "properties");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKey:", CFSTR("AMB-BIALastUsedReferenceID"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_msgSend(v5, "isEqualToString:", v27);
        if ((v28 & 1) == 0)
        {
          if (IMOSLoggingEnabled(v28))
          {
            OSLogHandleForIMFoundationCategory();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_DEBUG, "Updating lastUsedBIAReferenceID", buf, 2u);
            }

          }
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v5, CFSTR("AMB-BIALastUsedReferenceID"));
        }

      }
      if (objc_msgSend(v22, "count"))
      {
        -[IMDChat updateProperties:](self, "updateProperties:", v22);
        -[IMDChat broadcaster](self, "broadcaster");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDChat guid](self, "guid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDChat properties](self, "properties");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "chat:propertiesUpdated:", v31, v32);

        if (IMOSLoggingEnabled(v33))
        {
          OSLogHandleForIMFoundationCategory();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_DEBUG, "Updated Chat Properties for BIA", buf, 2u);
          }

        }
      }

    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_DEBUG, "BIA userID not provided. Early return.", buf, 2u);
      }

    }
  }

}

- (id)BIAContext
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBIAEnabled");

  if (v4)
  {
    -[IMDChat properties](self, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("AMB-BIAContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)deleteBIAContext
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBIAEnabled");

  if (!v4)
    return 0;
  v13[0] = CFSTR("AMB-BIAContext");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("AMB-BIALastUsedReferenceID");
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IMDChat updateProperties:](self, "updateProperties:", v7);

  -[IMDChat broadcaster](self, "broadcaster");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat guid](self, "guid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat properties](self, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "chat:propertiesUpdated:", v10, v11);

  return v8;
}

- (id)lastUsedBIAUserID
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBIAEnabled");

  if (v4)
  {
    -[IMDChat properties](self, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("AMB-BIAContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "valueForKey:", CFSTR("userId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)lastUsedBIAReferenceID
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBIAEnabled");

  if (v4)
  {
    -[IMDChat properties](self, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("AMB-BIALastUsedReferenceID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)containsActiveBIASession
{
  void *v3;
  int v4;
  void *v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBIAEnabled");

  if (!v4)
    return 0;
  -[IMDChat lastUsedBIAUserID](self, "lastUsedBIAUserID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") != 0;

  return v6;
}

- (NSDictionary)keyTransparencyURIToUUIDMapping
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D377D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v11);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return (NSDictionary *)v13;
}

- (void)tearDownToneNotificationSessionIfNeeded
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D39920], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tearDownSessionForChatIdentifier:", self->_chatIdentifier);

}

- (void)updateNicknamesForParticipants:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        +[IMDNicknameController sharedInstance](IMDNicknameController, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "nicknameForHandleURI:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          if (IMOSLoggingEnabled(v13))
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v25 = v12;
              _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_DEBUG, "Loaded message profile: %@", buf, 0xCu);
            }

          }
          objc_msgSend(v12, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "ID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v15, v16);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v6);
  }

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (objc_msgSend(v4, "count"))
  {
    -[NSMutableDictionary setObject:forKey:](self->_chatInfo, "setObject:forKey:", v4, *MEMORY[0x1E0D37818]);
    objc_storeStrong((id *)&self->_nicknamesForParticipants, v4);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  -[IMDChat broadcaster](self, "broadcaster");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat guid](self, "guid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "chat:nicknamesUpdated:", v18, v4);

}

- (void)meCardHasUpdated
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_DEBUG, "The meCard has been edited", v4, 2u);
    }

  }
  -[IMDChat setMeCardUpdated:](self, "setMeCardUpdated:", 1);
}

- (unint64_t)repairHistory
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IMDChat properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D37848]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setRepairHistory:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D37848];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat updateProperties:](self, "updateProperties:", v5);

}

- (BOOL)downloadingPendingSatelliteMessages
{
  return self->_isDownloadingPendingSatelliteMessages;
}

- (void)setRecipient:(id)a3
{
  objc_storeStrong((id *)&self->_recipient, a3);
}

- (NSString)cloudKitRecordID
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setCloudKitRecordID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 264);
}

- (BOOL)wasDowngradedToLiteMessage
{
  return self->_wasDowngradedToLiteMessage;
}

- (void)setWasDowngradedToLiteMessage:(BOOL)a3
{
  self->_wasDowngradedToLiteMessage = a3;
}

- (NSDate)lastSentDowngradeRequestSinceLoadDate
{
  return (NSDate *)objc_getProperty(self, a2, 272, 1);
}

- (void)setLastSentDowngradeRequestSinceLoadDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (int64_t)lastSentDowngradeRequestSinceLoadSessionIndex
{
  return self->_lastSentDowngradeRequestSinceLoadSessionIndex;
}

- (void)setLastSentDowngradeRequestSinceLoadSessionIndex:(int64_t)a3
{
  self->_lastSentDowngradeRequestSinceLoadSessionIndex = a3;
}

- (NSDate)lastReplicationSinceLoadDate
{
  return self->_lastReplicationSinceLoadDate;
}

- (void)setLastReplicationSinceLoadDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastReplicationSinceLoadDate, a3);
}

- (BOOL)createEngramGroupOnMessageSend
{
  return self->_createEngramGroupOnMessageSend;
}

- (void)setCreateEngramGroupOnMessageSend:(BOOL)a3
{
  self->_createEngramGroupOnMessageSend = a3;
}

- (BOOL)pendingENGroupParticipantUpdate
{
  return self->_pendingENGroupParticipantUpdate;
}

- (void)setPendingENGroupParticipantUpdate:(BOOL)a3
{
  self->_pendingENGroupParticipantUpdate = a3;
}

- (NSDictionary)nicknamesForParticipants
{
  return self->_nicknamesForParticipants;
}

- (BOOL)wasReportedAsJunk
{
  return self->_wasReportedAsJunk;
}

- (void)setWasReportedAsJunk:(BOOL)a3
{
  self->_wasReportedAsJunk = a3;
}

- (void)setOscarChat:(BOOL)a3
{
  self->_oscarChat = a3;
}

- (NSNumber)cachedStewieSharingChat
{
  return self->_cachedStewieSharingChat;
}

- (void)setCachedStewieSharingChat:(id)a3
{
  objc_storeStrong((id *)&self->_cachedStewieSharingChat, a3);
}

- (unint64_t)numMessagesSent
{
  return self->_numMessagesSent;
}

- (void)setNumMessagesSent:(unint64_t)a3
{
  self->_numMessagesSent = a3;
}

- (BOOL)meCardUpdated
{
  return self->_meCardUpdated;
}

- (void)setMeCardUpdated:(BOOL)a3
{
  self->_meCardUpdated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStewieSharingChat, 0);
  objc_storeStrong((id *)&self->_nicknamesForParticipants, 0);
  objc_storeStrong((id *)&self->_lastReplicationSinceLoadDate, 0);
  objc_storeStrong((id *)&self->_lastSentDowngradeRequestSinceLoadDate, 0);
  objc_storeStrong((id *)&self->_cloudKitRecordID, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_autoDonationBehaviorLastModificationDate, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_originalGroupID, 0);
  objc_storeStrong((id *)&self->_chatInfo, 0);
  objc_storeStrong((id *)&self->_lastMessage, 0);
  objc_storeStrong((id *)&self->_replySuggestions, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_lastAddressedSIMID, 0);
  objc_storeStrong((id *)&self->_lastAddressedLocalHandle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_engramID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_chatIdentifier, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)updateCollaborationMetadata:(id)a3 forMessageGUID:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = a4;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  IMDCoreSpotlightReindexMessagesWithCollaborationMetadata();
}

- (BOOL)updateDonationStateWithSyndicationAction:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  const __CFString *v13;
  BOOL v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = v4;
  if (!v4)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1D166B818((uint64_t)self, v9);
    goto LABEL_14;
  }
  if (-[__CFString isAutoDonatingMessages](v4, "isAutoDonatingMessages"))
    v6 = 1;
  else
    v6 = 2;
  -[__CFString syndicationStartDate](v5, "syndicationStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IMDChat setAutoDonationBehavior:lastModificationDate:](self, "setAutoDonationBehavior:lastModificationDate:", v6, v7);

  IMLogHandleForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (!v8)
  {
    if (v10)
    {
      -[IMDChat guid](self, "guid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v15;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Chat %@ not updated with incoming SyndicationAction: %@", (uint8_t *)&v17, 0x16u);

    }
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  if (v10)
  {
    -[IMDChat guid](self, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[__CFString isAutoDonatingMessages](v5, "isAutoDonatingMessages");
    v13 = CFSTR("NO");
    v17 = 138412802;
    v18 = v11;
    v19 = 2112;
    if (v12)
      v13 = CFSTR("YES");
    v20 = v13;
    v21 = 2112;
    v22 = v5;
    v14 = 1;
    _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Updated chat with GUID: %@ donation setting to %@ with SyndicationAction: %@", (uint8_t *)&v17, 0x20u);

  }
  else
  {
    v14 = 1;
  }
LABEL_15:

  return v14;
}

+ (id)_recordType
{
  return CFSTR("chatEncryptedv2");
}

- (id)_copyCKRecordFromExistingCKMetadataWithZoneID:(id)a3 salt:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  -[IMDChat serverChangeToken](self, "serverChangeToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat cloudKitRecordID](self, "cloudKitRecordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat guid](self, "guid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKRecordUtilities recordNameForRecordChangeTag:ckRecordID:salt:guid:](CKRecordUtilities, "recordNameForRecordChangeTag:ckRecordID:salt:guid:", v8, v9, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    v12 = objc_alloc(MEMORY[0x1E0C95048]);
    +[IMDChat _recordType](IMDChat, "_recordType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKRecordUtilities recordIDUsingName:zoneID:](CKRecordUtilities, "recordIDUsingName:zoneID:", v11, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithRecordType:recordID:", v13, v14);

    -[IMDChat serverChangeToken](self, "serverChangeToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v17)
    {
      -[IMDChat serverChangeToken](self, "serverChangeToken");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setEtag:", v18);

      objc_msgSend(v15, "setKnownToServer:", 1);
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_addGroupPhotoToCKRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  BOOL v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat groupPhotoGuid](self, "groupPhotoGuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transferForGUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || (objc_msgSend(v9, "localURL"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, !v11))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCloudKitChatSyncErrorDomain"), 1, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      *a4 = v10;
    }
    if (!IMOSLoggingEnabled(v10))
      goto LABEL_19;
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      -[IMDChat groupPhotoGuid](self, "groupPhotoGuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v24;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Transfer not found for group photo guid %@", buf, 0xCu);

    }
    goto LABEL_18;
  }
  v12 = objc_msgSend(v9, "isFinished");
  if ((v12 & 1) == 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCloudKitChatSyncErrorDomain"), 2, 0);
      v12 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
      *a4 = (id)v12;
    }
    if (!IMOSLoggingEnabled(v12))
      goto LABEL_19;
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      -[IMDChat groupPhotoGuid](self, "groupPhotoGuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v25;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Transfer not finished for group photo guid %@", buf, 0xCu);

    }
LABEL_18:

LABEL_19:
    v21 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v9, "localURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v14 = objc_msgSend(v13, "checkResourceIsReachableAndReturnError:", &v31);
  v15 = v31;

  if ((v14 & 1) != 0)
  {
    v17 = objc_alloc(MEMORY[0x1E0C94BB8]);
    objc_msgSend(v9, "localURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithFileURL:", v18);

    v21 = v19 != 0;
    if (v19)
    {
      objc_msgSend(v6, "_setCKRecordAsset:forKey:", v19, CFSTR("gp"));
      -[IMDChat groupPhotoGuid](self, "groupPhotoGuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_setCKRecordString:forKey:", v22, CFSTR("gpid"));

    }
    else
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCloudKitChatSyncErrorDomain"), 4, 0);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        *a4 = v20;
      }
      if (IMOSLoggingEnabled(v20))
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v9, "localURL");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v33 = v30;
          _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "ckAsset not able to initialize from transfer file URL: %@", buf, 0xCu);

        }
      }
    }

  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCloudKitChatSyncErrorDomain"), 3, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      *a4 = v16;
    }
    if (IMOSLoggingEnabled(v16))
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "localURL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v33 = v28;
        v34 = 2112;
        v35 = v15;
        _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Resource not reachable for %@ with error %@", buf, 0x16u);

      }
    }
    v21 = 0;
  }

LABEL_20:
  return v21;
}

- (id)copyCKRecordRepresentationWithZoneID:(id)a3 salt:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char IsEmpty;
  _BOOL8 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  NSObject *v47;
  int v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  _QWORD v52[2];
  _QWORD v53[3];

  v53[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = -[IMDChat _copyCKRecordFromExistingCKMetadataWithZoneID:salt:](self, "_copyCKRecordFromExistingCKMetadataWithZoneID:salt:", v8, v9);
  if (v10)
    goto LABEL_4;
  if (objc_msgSend(v9, "length"))
  {
    -[IMDChat guid](self, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKRecordUtilities recordIDUsingSalt:zoneID:guid:](CKRecordUtilities, "recordIDUsingSalt:zoneID:guid:", v9, v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x1E0C95048]);
    +[IMDChat _recordType](IMDChat, "_recordType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v13, "initWithRecordType:recordID:", v14, v12);

LABEL_4:
    -[IMDChat chatIdentifier](self, "chatIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setCKRecordString:forKey:", v15, CFSTR("cid"));

    -[IMDChat guid](self, "guid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setCKRecordString:forKey:", v16, CFSTR("guid"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[IMDChat style](self, "style"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setCKRecordNumber:forKey:", v17, CFSTR("stl"));

    -[IMDChat serviceName](self, "serviceName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setCKRecordString:forKey:", v18, CFSTR("svc"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMDChat state](self, "state"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setCKRecordNumber:forKey:", v19, CFSTR("ste"));

    -[IMDChat groupID](self, "groupID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setCKRecordString:forKey:", v20, CFSTR("gid"));

    -[IMDChat originalGroupID](self, "originalGroupID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setCKRecordString:forKey:", v21, CFSTR("ogid"));

    -[IMDChat displayName](self, "displayName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setCKRecordString:forKey:", v22, CFSTR("name"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[IMDChat isFiltered](self, "isFiltered"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setCKRecordNumber:forKey:", v23, CFSTR("filt"));

    -[IMDChat lastAddressedLocalHandle](self, "lastAddressedLocalHandle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setCKRecordString:forKey:", v24, CFSTR("lah"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMDChat hasHadSuccessfulQuery](self, "hasHadSuccessfulQuery"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setCKRecordNumber:forKey:", v25, CFSTR("sqry"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[IMDChat lastReadMessageTimeStamp](self, "lastReadMessageTimeStamp"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setCKRecordNumber:forKey:", v26, CFSTR("rwm"));

    -[IMDChat participants](self, "participants");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "__imArrayByApplyingBlock:", &unk_1E922F440);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setCKRecordArray:forKey:", v28, CFSTR("ptcpts"));
    -[IMDChat groupPhotoGuid](self, "groupPhotoGuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    IsEmpty = IMStringIsEmpty();

    if ((IsEmpty & 1) != 0
      || (v31 = -[IMDChat _addGroupPhotoToCKRecord:error:](self, "_addGroupPhotoToCKRecord:error:", v10, a5)))
    {
      -[IMDChat properties](self, "properties");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      JWEncodeDictionary();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setCKRecordData:forKey:", v33, CFSTR("prop"));

      -[IMDChat autoDonationBehaviorLastModificationDate](self, "autoDonationBehaviorLastModificationDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        v52[0] = CFSTR("st");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMDChat autoDonationBehavior](self, "autoDonationBehavior"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = CFSTR("sd");
        v53[0] = v35;
        v36 = (void *)MEMORY[0x1E0CB37E8];
        -[IMDChat autoDonationBehaviorLastModificationDate](self, "autoDonationBehaviorLastModificationDate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "numberWithLongLong:", objc_msgSend(v37, "__im_nanosecondTimeInterval"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v53[1] = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v50 = CFSTR("st");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMDChat autoDonationBehavior](self, "autoDonationBehavior"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (IMOSLoggingEnabled(v40))
      {
        OSLogHandleForIMFoundationCategory();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v48 = 138412290;
          v49 = v39;
          _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "Syncing new syndication attributes up %@", (uint8_t *)&v48, 0xCu);
        }

      }
      JWEncodeDictionary();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setCKRecordData:forKey:", v42, CFSTR("prop001"));

      -[IMDChat compressedProtobufDataForChatProto1](self, "compressedProtobufDataForChatProto1");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setCKRecordData:forKey:", v43, CFSTR("proto001"));

      v44 = v10;
    }
    else
    {
      if (IMOSLoggingEnabled(v31))
      {
        OSLogHandleForIMFoundationCategory();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          LOWORD(v48) = 0;
          _os_log_impl(&dword_1D1413000, v45, OS_LOG_TYPE_INFO, "Couldn't add group photo to CKRecord. Returning nil.", (uint8_t *)&v48, 2u);
        }

      }
      v44 = 0;
    }

    goto LABEL_20;
  }
  if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      LOWORD(v48) = 0;
      _os_log_impl(&dword_1D1413000, v47, OS_LOG_TYPE_INFO, "*********Cannot create record without a salt", (uint8_t *)&v48, 2u);
    }

  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCloudKitChatSyncErrorDomain"), 0, 0);
    v44 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = 0;
  }
LABEL_20:

  return v44;
}

+ (IMDChat)chatWithSyncData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  unsigned int v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  IMDChat *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  IMDChat *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  void *v58;
  char v59;
  id v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  id v102;
  __int16 v103;
  id v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "sourceRecordType"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        +[IMDChat _recordType](IMDChat, "_recordType"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqualToString:", v6),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    objc_msgSend(v4, "stringForKey:", CFSTR("svc"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForKey:", CFSTR("guid"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForKey:", CFSTR("gid"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForKey:", CFSTR("cid"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForKey:", CFSTR("ogid"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayForKey:", CFSTR("ptcpts"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "__imArrayByApplyingBlock:", &unk_1E922F480);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForKey:", CFSTR("name"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "stringByTrimmingCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (!v10)
    {

      v92 = 0;
    }
    objc_msgSend(v4, "stringForKey:", CFSTR("lah"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictForKey:", CFSTR("prop"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberForKey:", CFSTR("ste"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v11, "integerValue");

    objc_msgSend(v4, "numberForKey:", CFSTR("stl"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    objc_msgSend(v4, "numberForKey:", CFSTR("filt"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v4, "numberForKey:", CFSTR("sqry"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v4, "numberForKey:", CFSTR("rwm"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "longLongValue");

    v20 = v90;
    if (v13 == 45)
      v20 = 0;
    v80 = v20;
    objc_msgSend(v4, "dictForKey:", CFSTR("prop001"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = IMOSLoggingEnabled(v91);
    if (v91)
    {
      if (v21)
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v100 = v91;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Server Chat record has props001 %@, pulling isAutoDonating and donationDate", buf, 0xCu);
        }

      }
      objc_msgSend(v91, "objectForKey:", CFSTR("st"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
        v25 = (int)objc_msgSend(v23, "intValue");
      else
        v25 = 0;
      objc_msgSend(v91, "objectForKey:", CFSTR("sd"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v29, "longLongValue"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v79 = 0;
      }

    }
    else
    {
      if (v21)
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Server Chat record had props001 data, but we failed to decode to a dictionary!", buf, 2u);
        }

      }
      v25 = 0;
      v79 = 0;
    }
    objc_msgSend(v4, "dataForKey:", CFSTR("proto001"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v89, "length"))
    {
      v31 = objc_alloc(MEMORY[0x1E0D39A78]);
      objc_msgSend(v89, "_FTOptionallyDecompressData");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v31, "initWithData:", v32);

      v34 = objc_msgSend(v33, "isRecovered");
    }
    else
    {
      v34 = 0;
    }
    v35 = [IMDChat alloc];
    objc_msgSend(v4, "sourceRecordChangeTag");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceRecordName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v75) = v34;
    LOBYTE(v74) = 0;
    LOBYTE(v73) = v17;
    LOBYTE(v72) = v13;
    v27 = -[IMDChat initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:](v35, "initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:", &stru_1E92346B0, v84, v88, v86, v90, v83, v80, v92, v82, 0, v81, v77, v72, v15,
            v73,
            0,
            v36,
            1,
            v85,
            v19,
            -1,
            v37,
            v74,
            v25,
            v79,
            v75);

    objc_msgSend(v4, "assetURLForKey:", CFSTR("gp"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForKey:", CFSTR("gpid"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v38)
    {
      v41 = objc_msgSend(v39, "length");
      if (v41)
      {
        if (IMOSLoggingEnabled(v41))
        {
          OSLogHandleForIMFoundationCategory();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v42, OS_LOG_TYPE_INFO, "Group photo exists, setting up transfer", buf, 2u);
          }

        }
        v43 = (void *)IMDCopyAttachmentPersistentPath();
        if (objc_msgSend(v43, "length"))
        {
          objc_msgSend(v43, "stringByDeletingLastPathComponent");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          IMSharedHelperEnsureDirectoryExistsAtPath();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v43);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = 0;
          v47 = objc_msgSend(v45, "moveItemAtURL:toURL:error:", v38, v46, &v94);
          v78 = v94;

          if ((v47 & 1) != 0)
          {
            +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v43);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v49, "registerGUID:forNewOutgoingTransferWithLocalURL:", v40, v50);

            if (v51)
            {
              if (IMOSLoggingEnabled(v52))
              {
                OSLogHandleForIMFoundationCategory();
                v53 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v100 = v88;
                  v101 = 2112;
                  v102 = v43;
                  _os_log_impl(&dword_1D1413000, v53, OS_LOG_TYPE_INFO, "Created transfer %@, finalAssetPath %@", buf, 0x16u);
                }

              }
              +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "transferForGUID:", v40);
              v76 = (void *)objc_claimAutoreleasedReturnValue();

              if (IMOSLoggingEnabled(v55))
              {
                OSLogHandleForIMFoundationCategory();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v100 = v76;
                  _os_log_impl(&dword_1D1413000, v56, OS_LOG_TYPE_INFO, "Found transfer: %@", buf, 0xCu);
                }

              }
              objc_msgSend(v76, "setCloudKitSyncState:", 1);
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v97 = *MEMORY[0x1E0CB2AD8];
              v98 = *MEMORY[0x1E0CB2AC0];
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v93 = 0;
              v59 = objc_msgSend(v57, "setAttributes:ofItemAtPath:error:", v58, v43, &v93);
              v60 = v93;

              if ((v59 & 1) == 0 && IMOSLoggingEnabled(v61))
              {
                OSLogHandleForIMFoundationCategory();
                v62 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v100 = v43;
                  v101 = 2112;
                  v102 = v60;
                  _os_log_impl(&dword_1D1413000, v62, OS_LOG_TYPE_INFO, "Failed making group photo file class C: %@ with error %@", buf, 0x16u);
                }

              }
              +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = objc_msgSend(v63, "storeAttachment:associateWithMessageWithGUID:chatGUID:storeAtExternalLocation:", v76, 0, v88, 1);

              if (v64)
              {
                v95 = *MEMORY[0x1E0D37788];
                v96 = v40;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                -[IMDChat updateProperties:](v27, "updateProperties:", v65);

                +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "updateTransfer:", v40);

                if (IMOSLoggingEnabled(v67))
                {
                  OSLogHandleForIMFoundationCategory();
                  v68 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v100 = v88;
                    v101 = 2112;
                    v102 = v76;
                    _os_log_impl(&dword_1D1413000, v68, OS_LOG_TYPE_INFO, "Group photo stored for chat guid %@ with transfer %@", buf, 0x16u);
                  }

                }
              }

            }
          }
          else
          {
            if (IMOSLoggingEnabled(v48))
            {
              OSLogHandleForIMFoundationCategory();
              v70 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v100 = v38;
                v101 = 2112;
                v102 = v43;
                v103 = 2112;
                v104 = v78;
                _os_log_impl(&dword_1D1413000, v70, OS_LOG_TYPE_INFO, "Failed to move group photo file from %@ to %@, error %@", buf, 0x20u);
              }

            }
            objc_msgSend(MEMORY[0x1E0D39848], "cleanUpAssetURL:", v38);
          }

        }
        else if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v100 = v88;
            v101 = 2112;
            v102 = v38;
            v103 = 2112;
            v104 = v43;
            _os_log_impl(&dword_1D1413000, v69, OS_LOG_TYPE_INFO, "Failed to write asset to disk because of nil path! Asset from ckrecord with guid %@ has path %@, finalAssetPath %@", buf, 0x20u);
          }

        }
      }
    }
    objc_msgSend(MEMORY[0x1E0D39848], "cleanUpAssetURL:", v38);

  }
  else
  {
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v100 = v4;
        _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Invalid record passed to chatWithCKRecord %@", buf, 0xCu);
      }

    }
    v27 = 0;
  }

  return v27;
}

- (BOOL)applyChangesUsingSyncData:(id)a3
{
  id v4;
  int64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  int64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  int v39;
  int64_t v40;
  __int16 v41;
  _BYTE v42[18];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[IMDChat cloudKitSyncState](self, "cloudKitSyncState");
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[IMDChat guid](self, "guid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412546;
      v40 = (int64_t)v7;
      v41 = 2048;
      *(_QWORD *)v42 = v5;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "applying changes on chat %@ state %ld", (uint8_t *)&v39, 0x16u);

    }
  }
  v8 = -[IMDChat lastReadMessageTimeStamp](self, "lastReadMessageTimeStamp");
  objc_msgSend(v4, "numberForKey:", CFSTR("rwm"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = v8 < objc_msgSend(v9, "longLongValue");

  if ((_DWORD)v8)
  {
    objc_msgSend(v4, "numberForKey:", CFSTR("rwm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChat setLastReadMessageTimeStamp:](self, "setLastReadMessageTimeStamp:", objc_msgSend(v11, "longLongValue"));

    v12 = 1;
  }
  else
  {
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = -[IMDChat lastReadMessageTimeStamp](self, "lastReadMessageTimeStamp");
        objc_msgSend(v4, "numberForKey:", CFSTR("rwm"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 134218242;
        v40 = v14;
        v41 = 2112;
        *(_QWORD *)v42 = v15;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Local last read timestamp %lld, server record last read timestamp %@", (uint8_t *)&v39, 0x16u);

      }
    }
    v12 = 0;
  }
  objc_msgSend(v4, "dictForKey:", CFSTR("prop001"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = IMOSLoggingEnabled(v16);
  if (v16)
  {
    if ((_DWORD)v17)
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v39 = 138412290;
        v40 = (int64_t)v16;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Server Chat record has props001 %@, pulling syndication_type and syndication_ranges", (uint8_t *)&v39, 0xCu);
      }

    }
    objc_msgSend(v16, "objectForKey:", CFSTR("st"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      objc_msgSend(v19, "intValue");
    objc_msgSend(v16, "objectForKey:", CFSTR("sd"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v21))
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        -[IMDChat autoDonationBehaviorLastModificationDate](self, "autoDonationBehaviorLastModificationDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "__im_nanosecondTimeInterval");
        v39 = 138412546;
        v40 = (int64_t)v16;
        v41 = 2048;
        *(_QWORD *)v42 = v24;
        _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Server Chat record has older props001 %@, local syndicationDate: %lu, skipping", (uint8_t *)&v39, 0x16u);

      }
    }

  }
  else if ((_DWORD)v17)
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      LOWORD(v39) = 0;
      _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Server Chat record had props001 data, but we failed to decode to a dictionary!", (uint8_t *)&v39, 2u);
    }

  }
  v26 = IMOSLoggingEnabled(v17);
  if ((_DWORD)v26)
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      -[IMDChat guid](self, "guid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412802;
      v40 = (int64_t)v28;
      v41 = 1024;
      *(_DWORD *)v42 = v12;
      *(_WORD *)&v42[4] = 2112;
      *(_QWORD *)&v42[6] = CFSTR("YES");
      _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Updating chat:%@ madeChanges %d serverHadMoreRecentData %@", (uint8_t *)&v39, 0x1Cu);

    }
  }
  if (v5 != 1)
  {
    v26 = -[IMDChat setCloudKitSyncState:](self, "setCloudKitSyncState:", 1);
    v12 = 1;
  }
  if (IMOSLoggingEnabled(v26))
  {
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      -[IMDChat guid](self, "guid");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sourceRecordName");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sourceRecordChangeTag");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412802;
      v40 = (int64_t)v30;
      v41 = 2112;
      *(_QWORD *)v42 = v31;
      *(_WORD *)&v42[8] = 2112;
      *(_QWORD *)&v42[10] = v32;
      _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Updating chat %@ record name %@ change tag %@", (uint8_t *)&v39, 0x20u);

    }
  }
  objc_msgSend(v4, "sourceRecordChangeTag");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat setServerChangeToken:](self, "setServerChangeToken:", v33);

  objc_msgSend(v4, "sourceRecordName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChat setCloudKitRecordID:](self, "setCloudKitRecordID:", v34);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isMessagesIniCloudVersion2");

  if (v36)
  {
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "storeChat:", self);

  }
  else
  {
    -[IMDChat storeAndBroadcastChatChanges](self, "storeAndBroadcastChatChanges");
  }

  return v12 != 0;
}

- (id)compressedProtobufDataForChatProto1
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v3, "setIsRecovered:", -[IMDChat isRecovered](self, "isRecovered"));
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "_FTCopyGzippedData");

  return v5;
}

@end
