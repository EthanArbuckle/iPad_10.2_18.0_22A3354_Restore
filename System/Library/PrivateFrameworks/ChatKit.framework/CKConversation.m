@implementation CKConversation

- (void)fetchSuggestedNameIfNecessary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[CKConversation isBusinessConversation](self, "isBusinessConversation"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[CKConversation recipients](self, "recipients", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "defaultIMHandle");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "scheduleSuggestedNameFetchIfNecessary");

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

uint64_t __58__CKConversation_orderedContactsWithMaxCount_keysToFetch___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "defaultIMHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "matchesIMHandle:", v4);

  return v5;
}

- (unint64_t)recipientCount
{
  void *v2;
  unint64_t v3;

  -[CKConversation recipients](self, "recipients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSArray)recipients
{
  NSArray *recipients;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  CKEntity *v15;
  void *v16;
  CKEntity *v17;
  NSArray *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  recipients = self->_recipients;
  if (!recipients)
  {
    -[CKConversation chat](self, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CKConversation chat](self, "chat");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "participants");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "copy");

    }
    else
    {
      -[CKConversation pendingHandles](self, "pendingHandles");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "copy");
    }

    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          v15 = [CKEntity alloc];
          -[CKConversation chat](self, "chat", (_QWORD)v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[CKEntity initWithChat:imHandle:](v15, "initWithChat:imHandle:", v16, v14);

          -[NSArray addObject:](v8, "addObject:", v17);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    v18 = self->_recipients;
    self->_recipients = v8;

    recipients = self->_recipients;
  }
  return recipients;
}

- (id)nameWithRawAddresses:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *name;
  int v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  -[CKConversation recipients](self, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self->_chat, "guid");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v7;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Determining conversation name for chat guid: %@", (uint8_t *)&v12, 0xCu);

      }
    }
    -[IMChat displayNameWithRawAddress:isSpamFilteringEnabled:](self->_chat, "displayNameWithRawAddress:isSpamFilteringEnabled:", v3, +[CKConversation isSMSSpamFilteringEnabled](CKConversation, "isSMSSpamFilteringEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSString *)objc_msgSend(v8, "copy");
    name = self->_name;
    self->_name = v9;

  }
  return self->_name;
}

+ (BOOL)isSMSSpamFilteringEnabled
{
  return CKMessageSpamFilteringEnabled() != 0;
}

- (BOOL)hasDisplayName
{
  void *v3;
  void *v4;
  int v5;

  -[CKConversation displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CKConversation displayName](self, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", &stru_1E276D870) ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTranscriptSharingEnabled");

  if (v6)
  {
    -[CKConversation chat](self, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isStewieSharingChat");

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TS_CONVERSATION_NAME"), &stru_1E276D870, CFSTR("TranscriptSharing-SYDROB_FEATURES"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversation chat](self, "chat");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "emergencyUserHandle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversation chat](self, "chat");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "displayNameForChat:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringWithFormat:", v11, v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v16;
    }
  }
  return (NSString *)v4;
}

- (BOOL)isPlaceholder
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "messageCount"))
  {
    v4 = 0;
  }
  else
  {
    -[CKConversation chat](self, "chat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v4 = 0;
    }
    else
    {
      -[CKConversation chat](self, "chat");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastTUConversationCreatedDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v4 = 0;
      }
      else
      {
        -[CKConversation chat](self, "chat");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastScheduledMessageCreatedDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v10 == 0;

      }
    }

  }
  return v4;
}

- (int64_t)compareBySequenceNumberAndDateDescending:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (!v7)
    v7 = -[IMChat compareChatByLastFinishedMessageDate:](self->_chat, "compareChatByLastFinishedMessageDate:", v4[6]);

  return v7;
}

- (id)date
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__ck_watermarkDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastTUConversationCreatedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastScheduledMessageCreatedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastFinishedMessageDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "laterDate:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  if (v4)
  {
    objc_msgSend(v6, "laterDate:", v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  if (v5)
  {
    objc_msgSend(v6, "laterDate:", v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }

  return v6;
}

- (IMChat)chat
{
  return self->_chat;
}

void __58__CKConversation_orderedContactsWithMaxCount_keysToFetch___block_invoke_4(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "containsObject:", v9);
  v7 = v9;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v9, "cnContactWithKeys:", a1[4]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v8);
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count") >= a1[7])
      *a4 = 1;

    v7 = v9;
  }

}

- (BOOL)isMuted
{
  void *v2;
  char v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMuted");

  return v3;
}

- (BOOL)hasUnreadMessages
{
  return -[CKConversation unreadCount](self, "unreadCount") != 0;
}

- (unint64_t)unreadCount
{
  return -[IMChat unreadMessageCount](self->_chat, "unreadMessageCount");
}

- (BOOL)isStewieConversation
{
  void *v2;
  char v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStewieChat");

  return v3;
}

- (NSString)name
{
  return (NSString *)-[CKConversation nameWithRawAddresses:](self, "nameWithRawAddresses:", 0);
}

- (void)resetNameCaches
{
  NSString *name;

  name = self->_name;
  self->_name = 0;

}

- (BOOL)hasVerifiedBusiness
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[CKConversation isBusinessConversation](self, "isBusinessConversation");
  if (v3)
  {
    -[CKConversation businessHandle](self, "businessHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "brand");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isVerified");

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isBusinessConversation
{
  NSNumber *businessConversation;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  unsigned int v11;
  NSNumber *v12;
  NSNumber *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  businessConversation = self->_businessConversation;
  if (!businessConversation)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[CKConversation handles](self, "handles", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "isBusiness") & 1) != 0)
          {
            v9 = 1;
            goto LABEL_12;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_12:

    -[CKConversation chat](self, "chat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isBusinessChat");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9 | v11);
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v13 = self->_businessConversation;
    self->_businessConversation = v12;

    businessConversation = self->_businessConversation;
  }
  return -[NSNumber BOOLValue](businessConversation, "BOOLValue");
}

- (BOOL)wantsLabelForDSDS
{
  void *v3;
  int v4;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isConversationSIMLabelEnabled");

  if (v4)
  {
    if (+[CKApplicationState isResizing](CKApplicationState, "isResizing")
      && -[CKConversation hasCachedWantsLabelForDSDS](self, "hasCachedWantsLabelForDSDS"))
    {
      return -[CKConversation wantsLabelForDSDSCached](self, "wantsLabelForDSDSCached");
    }
    if ((IMSharedHelperDeviceHasMultipleActiveSubscriptions() & 1) != 0)
    {
      -[CKConversation sendingService](self, "sendingService");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "__ck_isCarrierBased");

      -[CKConversation setWantsLabelForDSDSCached:](self, "setWantsLabelForDSDSCached:", 1);
      -[CKConversation setHasCachedWantsLabelForDSDS:](self, "setHasCachedWantsLabelForDSDS:", 1);
      return v7;
    }
    -[CKConversation setWantsLabelForDSDSCached:](self, "setWantsLabelForDSDSCached:", 0);
    -[CKConversation setHasCachedWantsLabelForDSDS:](self, "setHasCachedWantsLabelForDSDS:", 1);
  }
  return 0;
}

- (void)setWantsLabelForDSDSCached:(BOOL)a3
{
  self->_wantsLabelForDSDSCached = a3;
}

- (void)setHasCachedWantsLabelForDSDS:(BOOL)a3
{
  self->_hasCachedWantsLabelForDSDS = a3;
}

- (id)conversationVisualIdentityWithKeys:(id)a3 requestedNumberOfContactsToFetch:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  CKVisualGroupIdentity *v13;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  void *v21;
  int v22;
  CKConversation *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  CKConversation *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->__conversationVisualIdentity)
  {
    -[CKConversation _createConversationVisualIdentityWithKeys:numberOfContacts:](self, "_createConversationVisualIdentityWithKeys:numberOfContacts:", v6, a4);
    -[CKConversation setNeedsUpdatedContactsForVisualIdentity:](self, "setNeedsUpdatedContactsForVisualIdentity:", 0);
    -[CKConversation setNeedsUpdatedGroupPhotoForVisualIdentity:](self, "setNeedsUpdatedGroupPhotoForVisualIdentity:", 0);
    -[CKConversation setNeedsUpdatedGroupNameForVisualIdentity:](self, "setNeedsUpdatedGroupNameForVisualIdentity:", 0);
    goto LABEL_24;
  }
  if (-[CKConversation needsUpdatedContactsForVisualIdentity](self, "needsUpdatedContactsForVisualIdentity"))
    goto LABEL_3;
  -[CKVisualGroupIdentity contacts](self->__conversationVisualIdentity, "contacts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") >= a4)
  {

  }
  else
  {
    -[CKVisualGroupIdentity contacts](self->__conversationVisualIdentity, "contacts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    -[CKConversation recipients](self, "recipients");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v17 < v19)
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_3:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            v22 = 138412290;
            v23 = self;
            _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Updating contacts for conversationVisualIdentity on conversation %@", (uint8_t *)&v22, 0xCu);
          }

        }
        -[CKVisualGroupIdentity contacts](self->__conversationVisualIdentity, "contacts");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v9 <= a4)
          v10 = a4;
        else
          v10 = v9;
        -[CKConversation _updateContactsForVisualIdentityWithKeys:numberOfContacts:](self, "_updateContactsForVisualIdentityWithKeys:numberOfContacts:", v6, v10);
        -[CKConversation setNeedsUpdatedContactsForVisualIdentity:](self, "setNeedsUpdatedContactsForVisualIdentity:", 0);
        goto LABEL_11;
      }
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        -[CKVisualGroupIdentity contacts](self->__conversationVisualIdentity, "contacts");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 134218498;
        v23 = (CKConversation *)objc_msgSend(v21, "count");
        v24 = 2048;
        v25 = a4;
        v26 = 2112;
        v27 = self;
        _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "Additional contacts needed for conversationVisualIdentity, had %ld, fetching %ld, conversation: %@", (uint8_t *)&v22, 0x20u);

      }
LABEL_30:

      goto LABEL_3;
    }
  }
  if (!-[CKConversation _contactsForVisualIdentityHaveKeys:](self, "_contactsForVisualIdentityHaveKeys:", v6))
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_3;
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v22 = 138412290;
      v23 = self;
      _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "Contacts need additional keys for conversationVisualIdentity on conversation %@", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_30;
  }
LABEL_11:
  if (-[CKConversation needsUpdatedGroupPhotoForVisualIdentity](self, "needsUpdatedGroupPhotoForVisualIdentity"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v22 = 138412290;
        v23 = self;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Updating group photo for conversationVisualIdentity on conversation %@", (uint8_t *)&v22, 0xCu);
      }

    }
    -[CKConversation _updateGroupPhotoForVisualIdentity](self, "_updateGroupPhotoForVisualIdentity");
    -[CKConversation setNeedsUpdatedGroupPhotoForVisualIdentity:](self, "setNeedsUpdatedGroupPhotoForVisualIdentity:", 0);
  }
  if (-[CKConversation needsUpdatedGroupNameForVisualIdentity](self, "needsUpdatedGroupNameForVisualIdentity"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v22 = 138412290;
        v23 = self;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Updating group name for conversationVisualIdentity on conversation %@", (uint8_t *)&v22, 0xCu);
      }

    }
    -[CKConversation _updateGroupNameForVisualIdentity](self, "_updateGroupNameForVisualIdentity");
    -[CKConversation setNeedsUpdatedGroupNameForVisualIdentity:](self, "setNeedsUpdatedGroupNameForVisualIdentity:", 0);
  }
LABEL_24:
  v13 = self->__conversationVisualIdentity;

  return v13;
}

- (NSAttributedString)previewText
{
  NSAttributedString *previewText;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSAttributedString *v9;
  NSAttributedString *v10;
  NSAttributedString *v11;

  previewText = self->_previewText;
  if (!previewText)
  {
    -[CKConversation chat](self, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastFinishedMessageItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isCorrupt"))
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3498]);
      CKFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CORRUPT_MESSAGE_FALLBACK_TEXT"), &stru_1E276D870, CFSTR("ChatKit"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (NSAttributedString *)objc_msgSend(v6, "initWithString:", v8);
      v10 = self->_previewText;
      self->_previewText = v9;

    }
    else
    {
      objc_msgSend(v4, "lastFinishedMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "__ck_previewTextWithChat:ignorePluginContent:", v4, 0);
      v11 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_previewText;
      self->_previewText = v11;
    }

    previewText = self->_previewText;
  }
  return previewText;
}

- (BOOL)needsUpdatedGroupPhotoForVisualIdentity
{
  return self->_needsUpdatedGroupPhotoForVisualIdentity;
}

- (BOOL)needsUpdatedGroupNameForVisualIdentity
{
  return self->_needsUpdatedGroupNameForVisualIdentity;
}

- (BOOL)needsUpdatedContactsForVisualIdentity
{
  return self->_needsUpdatedContactsForVisualIdentity;
}

- (BOOL)_contactsForVisualIdentityHaveKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKVisualGroupIdentity contacts](self->__conversationVisualIdentity, "contacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "areKeysAvailable:", v4, (_QWORD)v13))
          {
            v11 = 0;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
    v11 = 1;
LABEL_12:

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)setNeedsUpdatedGroupPhotoForVisualIdentity:(BOOL)a3
{
  self->_needsUpdatedGroupPhotoForVisualIdentity = a3;
}

- (void)setNeedsUpdatedGroupNameForVisualIdentity:(BOOL)a3
{
  self->_needsUpdatedGroupNameForVisualIdentity = a3;
}

- (void)setNeedsUpdatedContactsForVisualIdentity:(BOOL)a3
{
  self->_needsUpdatedContactsForVisualIdentity = a3;
}

- (void)_createConversationVisualIdentityWithKeys:(id)a3 numberOfContacts:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  CKVisualGroupIdentity *v13;
  CKVisualGroupIdentity *conversationVisualIdentity;
  int v15;
  CKConversation *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = self;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Create group photo for visual identity on conversation %@", (uint8_t *)&v15, 0xCu);
    }

  }
  -[CKConversation _contactsForVisualIdentityWithKeys:numberOfContacts:](self, "_contactsForVisualIdentityWithKeys:numberOfContacts:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation groupPhotoData](self, "groupPhotoData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      if (!v9)
        v11 = CFSTR("YES");
      v15 = 138412290;
      v16 = (CKConversation *)v11;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "groupImageData is nil: %@", (uint8_t *)&v15, 0xCu);
    }

  }
  -[CKConversation displayName](self, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CKVisualGroupIdentity initGroupWithName:photo:visualContacts:groupParticipantCount:]([CKVisualGroupIdentity alloc], "initGroupWithName:photo:visualContacts:groupParticipantCount:", v12, v9, v8, -[CKConversation recipientCount](self, "recipientCount"));
  conversationVisualIdentity = self->__conversationVisualIdentity;
  self->__conversationVisualIdentity = v13;

}

- (id)groupPhotoData
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[CKConversation isGroupConversation](self, "isGroupConversation"))
    return 0;
  -[CKConversation _groupPhotoFileURL](self, "_groupPhotoFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v17 = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "groupPhotoFileURL is nil: %@", buf, 0xCu);
      }

    }
    v7 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "groupPhotoFilePath is: %@", buf, 0xCu);
    }

  }
  if (!objc_msgSend(v5, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "groupPhotoFilePath is nil: %@", buf, 0xCu);
      }

    }
    v7 = 0;
    goto LABEL_33;
  }
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v5, 8, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v5;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Error loading group photo at path %@ error: %@", buf, 0x16u);
      }

    }
    if (!IMOSLoggingEnabled())
      goto LABEL_32;
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Error loading group photo: %@", buf, 0xCu);
    }
    goto LABEL_31;
  }
  if (v9)
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "no error in loading group photo data at path: %@", buf, 0xCu);
    }
LABEL_31:

  }
LABEL_32:

LABEL_33:
LABEL_34:

  return v7;
}

- (BOOL)isGroupConversation
{
  void *v2;
  char v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGroupChat");

  return v3;
}

- (id)_contactsForVisualIdentityWithKeys:(id)a3 numberOfContacts:(unint64_t)a4
{
  if (!a4)
    return MEMORY[0x1E0C9AA60];
  -[CKConversation orderedContactsWithMaxCount:keysToFetch:](self, "orderedContactsWithMaxCount:keysToFetch:", a4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_groupPhotoFileURL
{
  void *v3;
  CKConversation *v4;
  NSObject *v5;
  void *v6;
  CKConversation *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  CKConversation *v11;
  NSObject *v12;
  CKConversation *v13;
  NSObject *v14;
  CKConversation *v15;
  CKConversation *v16;
  NSObject *v17;
  int v19;
  CKConversation *v20;
  __int16 v21;
  CKConversation *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[IMChat allChatProperties](self->_chat, "allChatProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D37788]);
  v4 = (CKConversation *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v19 = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "retrieving group photo URL for conversation %@ using groupPhotoGuid %@", (uint8_t *)&v19, 0x16u);
    }

  }
  if (!-[CKConversation length](v4, "length"))
  {
    v11 = 0;
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transferForGUID:", v4);
  v7 = (CKConversation *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "found transfer %@", (uint8_t *)&v19, 0xCu);
    }

  }
  if (v7)
  {
    if ((-[CKConversation existsAtLocalPath](v7, "existsAtLocalPath") & 1) != 0)
    {
      -[CKConversation localPath](v7, "localPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "__ck_stringByExpandingTildeInPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v10, 0);
        v11 = (CKConversation *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            -[IMChat chatIdentifier](self->_chat, "chatIdentifier");
            v15 = (CKConversation *)objc_claimAutoreleasedReturnValue();
            v19 = 138412546;
            v20 = v4;
            v21 = 2112;
            v22 = v15;
            _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Could not determine path for group photo file tranfer with guid %@ for chat with identifier %@", (uint8_t *)&v19, 0x16u);

          }
        }
        v11 = 0;
      }

      goto LABEL_30;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        -[IMChat chatIdentifier](self->_chat, "chatIdentifier");
        v13 = (CKConversation *)objc_claimAutoreleasedReturnValue();
        v19 = 138412546;
        v20 = v4;
        v21 = 2112;
        v22 = v13;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Group photo with guid %@ does not exist at local path for chat with identifier %@", (uint8_t *)&v19, 0x16u);

      }
LABEL_28:

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[IMChat chatIdentifier](self->_chat, "chatIdentifier");
      v16 = (CKConversation *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v4;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Could not find file transfer matching groupPhotoGuid %@ for chat with identifier %@", (uint8_t *)&v19, 0x16u);

    }
    goto LABEL_28;
  }
  v11 = 0;
LABEL_30:

LABEL_31:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v19 = 138412546;
      v20 = v11;
      v21 = 2112;
      v22 = self;
      _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "retrieved group photo URL %@ for conversation %@", (uint8_t *)&v19, 0x16u);
    }

  }
  return v11;
}

- (id)orderedContactsWithMaxCount:(unint64_t)a3 keysToFetch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  unint64_t v35;
  unint64_t v36;
  _QWORD v37[4];
  id v38;
  _QWORD *v39;
  __int128 *v40;
  unint64_t v41;
  _QWORD v42[4];
  id v43;
  __int128 *v44;
  unint64_t v45;
  _QWORD aBlock[4];
  id v47;
  id v48;
  _QWORD *v49;
  __int128 *p_buf;
  _QWORD v51[5];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 buf;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v35 = a3;
  v64 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CKConversation recipients](self, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isTranscriptSharingEnabled");

    if (v8)
    {
      -[CKConversation chat](self, "chat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isStewieSharingChat");

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v12 = v6;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v54;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v54 != v14)
                objc_enumerationMutation(v12);
              v16 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
              objc_msgSend(v16, "defaultIMHandle", v35);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "isStewieTranscriptSharingHandle");

              if (v18)
              {
                objc_msgSend(v11, "addObject:", v16);
                goto LABEL_19;
              }
            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
            if (v13)
              continue;
            break;
          }
        }
LABEL_19:

        v6 = (void *)objc_msgSend(v11, "copy");
      }
    }
    if (objc_msgSend(v6, "count", v35) == 1)
    {
      objc_msgSend(v6, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "cnContactWithKeys:", v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v62 = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v58 = 0x3032000000;
      v59 = __Block_byref_object_copy__36;
      v60 = __Block_byref_object_dispose__36;
      v61 = 0;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v61 = (id)objc_claimAutoreleasedReturnValue();
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x3032000000;
      v51[3] = __Block_byref_object_copy__36;
      v51[4] = __Block_byref_object_dispose__36;
      v52 = 0;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v52 = (id)objc_claimAutoreleasedReturnValue();
      v25 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__CKConversation_orderedContactsWithMaxCount_keysToFetch___block_invoke;
      aBlock[3] = &unk_1E2751A58;
      v26 = v6;
      v47 = v26;
      v49 = v51;
      v27 = v5;
      v48 = v27;
      p_buf = &buf;
      v28 = _Block_copy(aBlock);
      if (-[CKConversation hasLoadedAllMessages](self, "hasLoadedAllMessages"))
      {
        -[CKConversation chat](self, "chat");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "chatItems");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = v25;
        v42[1] = 3221225472;
        v42[2] = __58__CKConversation_orderedContactsWithMaxCount_keysToFetch___block_invoke_3;
        v42[3] = &unk_1E2751A80;
        v43 = v28;
        v44 = &buf;
        v45 = v36;
        objc_msgSend(v30, "enumerateMessagesWithOptions:usingBlock:", 2, v42);

        v31 = v43;
      }
      else
      {
        -[CKConversation chat](self, "chat");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "lastIncomingFinishedMessage");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
          (*((void (**)(void *, void *))v28 + 2))(v28, v31);
      }

      v33 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count");
      if (v33 < objc_msgSend(v26, "count") && objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count") < v36)
      {
        v37[0] = v25;
        v37[1] = 3221225472;
        v37[2] = __58__CKConversation_orderedContactsWithMaxCount_keysToFetch___block_invoke_4;
        v37[3] = &unk_1E2751AA8;
        v39 = v51;
        v38 = v27;
        v40 = &buf;
        v41 = v36;
        objc_msgSend(v26, "enumerateObjectsUsingBlock:", v37);

      }
      v24 = *(id *)(*((_QWORD *)&buf + 1) + 40);

      _Block_object_dispose(v51, 8);
      _Block_object_dispose(&buf, 8);

    }
    v21 = v24;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        -[CKConversation chat](self, "chat");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "No recipients found for chat %@", (uint8_t *)&buf, 0xCu);

      }
    }
    v21 = 0;
  }

  return v21;
}

- (BOOL)hasLoadedAllMessages
{
  return self->_hasLoadedAllMessages;
}

void __58__CKConversation_orderedContactsWithMaxCount_keysToFetch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v9[1] = 3221225472;
    v9[2] = __58__CKConversation_orderedContactsWithMaxCount_keysToFetch___block_invoke_2;
    v9[3] = &unk_1E2751A30;
    v8 = v3;
    v9[0] = MEMORY[0x1E0C809B0];
    v10 = v3;
    v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v9);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "containsObject:", v6) & 1) == 0)
      {
        objc_msgSend(v6, "cnContactWithKeys:", *(_QWORD *)(a1 + 40));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v7);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v6);

      }
    }

    v3 = v8;
  }

}

- (id)orderedContactsForAvatarView
{
  return -[CKConversation orderedContactsWithMaxCount:keysToFetch:](self, "orderedContactsWithMaxCount:keysToFetch:", 2, MEMORY[0x1E0C9AA60]);
}

- (CKConversation)initWithChat:(id)a3
{
  id v4;
  CKConversation *v5;
  CKConversation *v6;

  v4 = a3;
  v5 = -[CKConversation init](self, "init");
  v6 = v5;
  if (v5)
    -[CKConversation setChat:](v5, "setChat:", v4);

  return v6;
}

- (void)setChat:(id)a3
{
  objc_storeStrong((id *)&self->_chat, a3);
}

- (CKConversation)init
{
  CKConversation *v2;
  CKConversation *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKConversation;
  v2 = -[CKConversation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_limitToLoad = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__handleLazuliCapabilitiesUpdatedNotification_, *MEMORY[0x1E0D35310], 0);

  }
  return v3;
}

- (NSString)conversationListCollectionViewListItemIdentifier
{
  NSString *conversationListCollectionViewListItemIdentifier;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  NSString *v9;
  NSString *v10;

  conversationListCollectionViewListItemIdentifier = self->_conversationListCollectionViewListItemIdentifier;
  if (!conversationListCollectionViewListItemIdentifier)
  {
    -[CKConversation chat](self, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "guid");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = &stru_1E276D870;
    if (v5)
      v7 = (__CFString *)v5;
    v8 = v7;

    objc_msgSend(CFSTR("list-"), "stringByAppendingString:", v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    v10 = self->_conversationListCollectionViewListItemIdentifier;
    self->_conversationListCollectionViewListItemIdentifier = v9;

    conversationListCollectionViewListItemIdentifier = self->_conversationListCollectionViewListItemIdentifier;
  }
  return conversationListCollectionViewListItemIdentifier;
}

- (NSArray)handles
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (-[CKConversation isPending](self, "isPending"))
  {
    -[CKConversation pendingHandles](self, "pendingHandles");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = (void *)MEMORY[0x1E0C9AA60];
    if (v3)
      v5 = (void *)v3;
    v6 = v5;
  }
  else
  {
    -[CKConversation chat](self, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "participants");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSArray *)v7;
}

- (BOOL)isPending
{
  void *v3;
  CKConversation *v4;
  BOOL v5;

  if (!CKIsRunningInMessages() && !IMIsRunningInMessagesComposeViewService())
    return self->_chat == 0;
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pendingConversation");
  v4 = (CKConversation *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == self;

  return v5;
}

- (void)setAllowedByPersonListInActiveFocus:(BOOL)a3
{
  self->_allowedByPersonListInActiveFocus = a3;
}

- (id)fastPreviewTextIgnoringPluginContent
{
  NSAttributedString *previewText;
  NSAttributedString **p_previewText;
  NSAttributedString *v4;
  void *v5;
  void *v6;
  void *v7;

  p_previewText = &self->_previewText;
  previewText = self->_previewText;
  if (previewText)
  {
    v4 = previewText;
  }
  else
  {
    -[CKConversation chat](self, "chat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastFinishedMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "__ck_previewTextWithChat:ignorePluginContent:", v5, 1);
    v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "balloonBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      objc_storeStrong((id *)p_previewText, v4);

  }
  return v4;
}

- (CKComposition)unsentComposition
{
  void *v3;
  void *v4;

  +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "draftForConversation:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKComposition *)v4;
}

- (id)uniqueIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[CKConversation groupID](self, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)groupID
{
  void *v2;
  void *v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)renderedAvatarImageWithSize:(CGSize)a3
{
  return -[CKConversation renderedAvatarImageWithSize:traitCollection:](self, "renderedAvatarImageWithSize:traitCollection:", 0, a3.width, a3.height);
}

- (id)renderedAvatarImageWithSize:(CGSize)a3 traitCollection:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  void *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars");
  -[CKConversation conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:](self, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", MEMORY[0x1E0C9AA60], v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupPhoto");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v9, "groupPhoto");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithData:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", width, height);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __84__CKConversation_AvatarImageRendering__renderedAvatarImageWithSize_traitCollection___block_invoke;
    v26[3] = &unk_1E274BD70;
    v28 = 0;
    v29 = 0;
    v30 = width;
    v31 = height;
    v32 = width * 0.5;
    v27 = v13;
    v15 = v13;
    objc_msgSend(v14, "imageWithActions:", v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v27;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scale");
    v20 = v19;

    if (v7)
    {
      objc_msgSend(v7, "displayScale");
      v20 = v21;
      if (objc_msgSend(v7, "userInterfaceStyle") == 1)
        v22 = 2;
      else
        v22 = 3;
    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C97460], "scopeWithPointSize:scale:rightToLeft:style:backgroundStyle:", 0, 0, v22, width, height, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc(MEMORY[0x1E0C97450]);
    objc_msgSend(MEMORY[0x1E0C97458], "defaultSettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v23, "initWithSettings:", v24);

    objc_msgSend(v9, "contacts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "avatarImageForContacts:scope:", v17, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

void __84__CKConversation_AvatarImageRendering__renderedAvatarImageWithSize_traitCollection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addClip");
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (id)pinnedConversationDisplayNamePreferringShortName:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  if (-[CKConversation recipientCount](self, "recipientCount") != 1)
  {
    if (-[CKConversation hasDisplayName](self, "hasDisplayName"))
    {
      -[CKConversation displayName](self, "displayName");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v10 = (void *)v9;
      return v10;
    }
LABEL_7:
    -[CKConversation name](self, "name");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!v3)
    goto LABEL_7;
  -[CKConversation recipients](self, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "defaultIMHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "_displayNameWithAbbreviation");
  else
    -[CKConversation name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)fetchOldestMessageDateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKConversation chat](self, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "guid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Fetch oldest message date for chat: %@", buf, 0xCu);
    }

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __95__CKConversation_MessageHistoryViewControllerDataSource__fetchOldestMessageDateWithCompletion___block_invoke;
    v10[3] = &unk_1E27507B0;
    v11 = v4;
    objc_msgSend(v6, "fetchOldestMessageDateWithCompletion:", v10);

  }
  else
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Oldest message date fetch skipped for conversation with no backing chat (e.g. new compose).", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v7);
  }

}

void __95__CKConversation_MessageHistoryViewControllerDataSource__fetchOldestMessageDateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void (*v17)(void);
  uint8_t v18[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __95__CKConversation_MessageHistoryViewControllerDataSource__fetchOldestMessageDateWithCompletion___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Message history fetch completed with non nil result", buf, 2u);
      }

      v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      if (v16)
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Message history fetch completed with nil result", v18, 2u);
      }

      v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v17();
  }

}

- (void)messageHistoryForDateInterval:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CKConversation chat](self, "chat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v10;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Message history fetch beginning for chat: %@, dateInterval: %@", buf, 0x16u);
    }

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __99__CKConversation_MessageHistoryViewControllerDataSource__messageHistoryForDateInterval_completion___block_invoke;
    v15[3] = &unk_1E27507D8;
    v16 = v10;
    v17 = v6;
    v18 = v7;
    v12 = v10;
    objc_msgSend(v9, "fetchMessageHistoryForDateInterval:completion:", v17, v15);

  }
  else
  {
    IMLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Message history fetch skipped for conversation with no backing chat (e.g. new compose).", buf, 2u);
    }

    v14 = objc_alloc(MEMORY[0x1E0D39908]);
    v12 = (id)objc_msgSend(v14, "initWithDateInterval:messages:", v6, MEMORY[0x1E0C9AA60]);
    (*((void (**)(id, id))v7 + 2))(v7, v12);
  }

}

void __99__CKConversation_MessageHistoryViewControllerDataSource__messageHistoryForDateInterval_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  IMLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "messages");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      v11 = a1[4];
      v12 = a1[5];
      v21 = 134218498;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Message history fetch completed with %ld results for chatGUID: %@, dateInterval: %@", (uint8_t *)&v21, 0x20u);

    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __95__CKConversation_MessageHistoryViewControllerDataSource__fetchOldestMessageDateWithCompletion___block_invoke_cold_1((uint64_t)v6, v8, v13, v14, v15, v16, v17, v18);

    v19 = objc_alloc(MEMORY[0x1E0D39908]);
    v20 = (void *)objc_msgSend(v19, "initWithDateInterval:messages:", a1[5], MEMORY[0x1E0C9AA60]);
    (*(void (**)(void))(a1[6] + 16))();

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if ((CKConversation *)-[IMChat contextInfo](self->_chat, "contextInfo") == self)
  {
    -[IMChat setContextInfo:](self->_chat, "setContextInfo:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D35310], 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)CKConversation;
  -[CKConversation dealloc](&v4, sel_dealloc);
}

- (void)willBecomeInactive
{
  id v2;

  -[CKConversation chat](self, "chat");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endListeningToAttributionChanges");

}

- (void)setNeedsUpdatedContactOrderForVisualIdentity
{
  -[CKConversation setNeedsUpdatedContactsForVisualIdentity:](self, "setNeedsUpdatedContactsForVisualIdentity:", 1);
}

- (void)setNeedsUpdatedGroupPhotoForVisualIdentity
{
  -[CKConversation setNeedsUpdatedGroupPhotoForVisualIdentity:](self, "setNeedsUpdatedGroupPhotoForVisualIdentity:", 1);
}

- (void)setNeedsUpdatedGroupNameForVisualIdentity
{
  -[CKConversation setNeedsUpdatedGroupNameForVisualIdentity:](self, "setNeedsUpdatedGroupNameForVisualIdentity:", 1);
}

- (void)_updateContactsForVisualIdentityWithKeys:(id)a3 numberOfContacts:(unint64_t)a4
{
  void *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v6 = (void *)MEMORY[0x1E0C97468];
  v7 = a3;
  v8 = objc_msgSend(v6, "maxContactAvatars");
  v9 = objc_msgSend(MEMORY[0x1E0C974E8], "maxContactAvatars");
  if (v8 <= v9)
    v10 = v9;
  else
    v10 = v8;
  if (v10 <= a4)
    v11 = a4;
  else
    v11 = v10;
  -[CKConversation _contactsForVisualIdentityWithKeys:numberOfContacts:](self, "_contactsForVisualIdentityWithKeys:numberOfContacts:", v7, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[CKVisualGroupIdentity updateVisualContacts:groupParticipantCount:](self->__conversationVisualIdentity, "updateVisualContacts:groupParticipantCount:", v12, -[CKConversation recipientCount](self, "recipientCount"));
}

- (void)_updateGroupPhotoForVisualIdentity
{
  NSObject *v3;
  void *v4;
  int v5;
  CKConversation *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Updating group photo for visual identity on conversation %@", (uint8_t *)&v5, 0xCu);
    }

  }
  -[CKConversation groupPhotoData](self, "groupPhotoData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVisualGroupIdentity updateGroupPhoto:](self->__conversationVisualIdentity, "updateGroupPhoto:", v4);

}

- (void)updateConversationVisualIdentityGroupPhotoWithSender:(id)a3
{
  NSString *v4;
  NSString *groupIdentityUpdateHandleID;

  v4 = (NSString *)a3;
  -[CKConversation setNeedsUpdatedGroupPhotoForVisualIdentity:](self, "setNeedsUpdatedGroupPhotoForVisualIdentity:", 1);
  groupIdentityUpdateHandleID = self->_groupIdentityUpdateHandleID;
  self->_groupIdentityUpdateHandleID = v4;

}

- (void)updateConversationVisualIdentityDisplayNameWithSender:(id)a3
{
  NSString *v4;
  NSString *groupIdentityUpdateHandleID;

  v4 = (NSString *)a3;
  -[CKConversation setNeedsUpdatedGroupNameForVisualIdentity:](self, "setNeedsUpdatedGroupNameForVisualIdentity:", 1);
  groupIdentityUpdateHandleID = self->_groupIdentityUpdateHandleID;
  self->_groupIdentityUpdateHandleID = v4;

}

- (void)_updateGroupNameForVisualIdentity
{
  id v3;

  -[CKConversation displayName](self, "displayName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CKVisualGroupIdentity updateGroupName:](self->__conversationVisualIdentity, "updateGroupName:", v3);

}

- (void)didBecomeActive
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "No chat found, bailing", v4, 2u);
    }

  }
  if (!CKIsRunningInMessagesNotificationExtension()
    && !CKIsRunningInMessagesViewService()
    && (IMSharedHelperIsOlderDevice() & 1) == 0)
  {
    objc_msgSend(v2, "beginListeningToAttributionChanges");
  }

}

- (id)acquireHandleStatusObservationAssertion
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Beginning listening to status changes", buf, 2u);
    }

  }
  -[CKConversation chat](self, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "beginObservingHandleStatuses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "No chat found, bailing", v9, 2u);
      }

    }
    v6 = 0;
  }

  return v6;
}

- (NSString)lastAddressedHandle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastAddressedHandleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[CKConversation chat](self, "chat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastAddressedHandleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CKConversation selectedLastAddressedHandle](self, "selectedLastAddressedHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v7;
}

- (NSString)lastAddressedSIMID
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastAddressedSIMID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[CKConversation chat](self, "chat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastAddressedSIMID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CKConversation selectedLastAddressedSIMID](self, "selectedLastAddressedSIMID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v7;
}

+ (id)newPendingConversation
{
  return -[CKConversation initWithChat:]([CKPendingConversation alloc], "initWithChat:", 0);
}

+ (id)conversationForAddresses:(id)a3 allowRetargeting:(BOOL)a4 candidateConversation:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  NSObject *v26;
  const __CFString *v27;
  _BOOL4 v29;
  id v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v29 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v6 = a5;
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(v7, "existingChatForAddresses:allowRetargeting:bestHandles:", v31, v29, &v37);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v37;

  v8 = v6;
  v9 = v8;
  if (v32)
  {
    objc_msgSend(v8, "chat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v32);

    v12 = v9;
    if ((v11 & 1) == 0)
    {
      objc_msgSend(v9, "setUnsentComposition:", 0);
      +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "conversationForExistingChat:", v32);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v14, "copyForPendingConversation");

    }
    objc_msgSend(v12, "refreshServiceForSending");
  }
  else
  {
    objc_msgSend(v8, "setUnsentComposition:", 0);
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pendingConversationCreatingIfNecessary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29 && (v16 = objc_msgSend(v30, "count"), v16 == objc_msgSend(v31, "count")))
    {
      v17 = v30;
    }
    else
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "__ck_bestAccountForAddresses:", v31);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v20 = v31;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v34 != v22)
              objc_enumerationMutation(v20);
            IMStripFormattingFromAddress();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "imHandleWithID:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
              objc_msgSend(v17, "addObject:", v25);

          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        }
        while (v21);
      }

    }
    objc_msgSend(v12, "setPendingHandles:", v17);
    v30 = v17;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = CFSTR("NO");
      if (v29)
        v27 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v39 = v27;
      v40 = 2112;
      v41 = v12;
      _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "conversationForAddresses (allowRetargeting is %@) using %@", buf, 0x16u);
    }

  }
  return v12;
}

+ (id)conversationForContacts:(id)a3 candidateConversation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v7, "existingChatForContacts:bestHandles:", v5, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;

  v10 = v6;
  v11 = v10;
  if (v8)
  {
    objc_msgSend(v10, "chat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", v8);

    v14 = v11;
    if ((v13 & 1) == 0)
    {
      objc_msgSend(v11, "setUnsentComposition:", 0);
      +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "conversationForExistingChat:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v16, "copyForPendingConversation");

    }
    objc_msgSend(v14, "refreshServiceForSending");
  }
  else
  {
    objc_msgSend(v10, "setUnsentComposition:", 0);
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pendingConversationCreatingIfNecessary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setPendingHandles:", v9);
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v14;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "conversationForContacts using %@", buf, 0xCu);
    }

  }
  return v14;
}

- (void)resetCaches
{
  NSArray *recipients;
  CKVisualGroupIdentity *conversationVisualIdentity;

  -[CKConversation resetNameCaches](self, "resetNameCaches");
  recipients = self->_recipients;
  self->_recipients = 0;

  conversationVisualIdentity = self->__conversationVisualIdentity;
  self->__conversationVisualIdentity = 0;

}

- (void)setNeedsReload
{
  self->_needsReload = 1;
}

- (void)reloadIfNeeded
{
  if (self->_needsReload)
  {
    -[CKConversation clearConversationLoadFromSpotlight](self, "clearConversationLoadFromSpotlight");
    -[CKConversation loadAllMessages](self, "loadAllMessages");
  }
}

- (id)sortedHandles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("isContact"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:selector:", CFSTR("fullName"), 1, sel_caseInsensitiveCompare_);
  v9[0] = v3;
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation handles](self, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)containsHandleWithUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CKConversation handles](self, "handles", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "ID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (CKEntity)recipient
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[CKConversation recipients](self, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[CKConversation recipients](self, "recipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (CKEntity *)v6;
}

- (void)acceptTransfer:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(19);
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Accept transfer %@", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
  {
    v6 = v3;
    _CKLogExternal();
  }
  objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acceptTransfer:", v3);

}

- (void)_handleChatParticipantsDidChange:(id)a3
{
  void *v4;
  int v5;
  NSArray *recipients;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversation chat](self, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isEqual:", v4);

  if (v5)
  {
    recipients = self->_recipients;
    self->_recipients = 0;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("CKConversationParticipantsDidChangeNotification"), self);

    -[CKConversation updateKeyTransparencyStatusForChatParticipantsDidChange:](self, "updateKeyTransparencyStatusForChatParticipantsDidChange:", v8);
  }

}

- (void)_handleChatJoinStateDidChange:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversation chat](self, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "isEqual:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("CKConversationJoinStateDidChangeNotification"), self);

  }
}

- (void)_handleEngroupFinishedUpdating:(id)a3
{
  void *v4;
  int v5;
  NSSet *pendingRecipients;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversation chat](self, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isEqual:", v4);

  if (v5)
  {
    pendingRecipients = self->_pendingRecipients;
    self->_pendingRecipients = 0;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("CKConversationPendingRecipientsUpdatedNotification"), self);

  }
}

- (void)_handleLazuliCapabilitiesUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t, _BYTE *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  CKConversation *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[CKConversation chat](self, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __63__CKConversation__handleLazuliCapabilitiesUpdatedNotification___block_invoke;
  v13 = &unk_1E274C410;
  v8 = v5;
  v14 = v8;
  v15 = &v16;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v10);

  if (*((_BYTE *)v17 + 24))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v8;
        v22 = 2112;
        v23 = self;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Handle %@ is part of %@ and it's RCS capabilities got updated. Refreshing service...", buf, 0x16u);
      }

    }
    -[CKConversation refreshServiceForSending](self, "refreshServiceForSending", v10, v11, v12, v13);
  }

  _Block_object_dispose(&v16, 8);
}

void __63__CKConversation__handleLazuliCapabilitiesUpdatedNotification___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)setUnsentComposition:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDraft:forConversation:", v4, self);

}

- (void)updateUnsentCompositionByAppendingComposition:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CKConversation unsentComposition](self, "unsentComposition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isAudioComposition") & 1) == 0)
  {
    if (v4)
    {
      objc_msgSend(v4, "compositionByAppendingComposition:", v7);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = v7;
    }
    v6 = v5;
    -[CKConversation setUnsentComposition:](self, "setUnsentComposition:", v5);

  }
}

- (BOOL)isDowngraded
{
  void *v2;
  char v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDowngraded");

  return v3;
}

- (BOOL)isIgnoringTypingUpdates
{
  return *(_BYTE *)&self->_conversationFlags & 1;
}

- (void)setIgnoringTypingUpdates:(BOOL)a3
{
  *(_BYTE *)&self->_conversationFlags = *(_BYTE *)&self->_conversationFlags & 0xFE | a3;
}

- (BOOL)forceMMS
{
  void *v2;
  char v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "forceMMS");

  return v3;
}

- (void)setForceMMS:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKConversation chat](self, "chat");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForceMMS:", v3);

}

- (NSString)fallbackSendString
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  void *v8;

  if (-[CKConversation isToEmailAddress](self, "isToEmailAddress"))
  {
    CKFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("MADRID_SEND_TO_EMAIL");
  }
  else
  {
    -[CKConversation chat](self, "chat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isRCS");

    CKFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v7)
      v5 = CFSTR("LAZULI_SEND_AS_TEXT_MESSAGE");
    else
      v5 = CFSTR("MADRID_SEND_AS_TEXT_MESSAGE");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)canLeave
{
  void *v2;
  char v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canLeaveChat");

  return v3;
}

- (BOOL)hasLeft
{
  void *v3;
  uint64_t v4;
  unsigned int v5;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "joinState");

  v5 = (v4 != 3) & ~-[CKConversation isPending](self, "isPending");
  if (v4 == 2)
    return 0;
  else
    return v5;
}

- (BOOL)hasLeftGroupChat
{
  void *v2;
  char v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasLeftGroup");

  return v3;
}

- (void)leave
{
  id v2;

  -[CKConversation chat](self, "chat");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leave");

}

- (BOOL)isBusinessChatDisabled
{
  int v2;

  v2 = -[CKConversation isBusinessConversation](self, "isBusinessConversation");
  if (v2)
    LOBYTE(v2) = objc_msgSend(MEMORY[0x1E0D397F8], "supportsBusinessChat") ^ 1;
  return v2;
}

- (BOOL)shouldShowVerifiedCheckmark
{
  return !-[CKConversation isChatBot](self, "isChatBot")
      && -[CKConversation hasVerifiedBusiness](self, "hasVerifiedBusiness");
}

- (BOOL)shouldHaveRoundRectAvatar
{
  return -[CKConversation isChatBot](self, "isChatBot")
      || -[CKConversation isBusinessConversation](self, "isBusinessConversation");
}

- (BOOL)isReadOnlyChat
{
  void *v2;
  char v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReadOnly");

  return v3;
}

- (BOOL)supportsMutatingGroupMembers
{
  BOOL v3;
  void *v4;

  if ((CKIsRunningUITests() || CKIsRunningForDevelopmentOnSimulator())
    && -[CKConversation isGroupConversation](self, "isGroupConversation"))
  {
    return 1;
  }
  -[CKConversation chat](self, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "supportsCapabilities:", 32))
    v3 = -[CKConversation _allowMembershipMutationsFromThisDevice](self, "_allowMembershipMutationsFromThisDevice");
  else
    v3 = 0;

  return v3;
}

- (BOOL)supportsMutatingGroupIdentity
{
  void *v3;
  BOOL v4;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsCapabilities:", 16))
    v4 = -[CKConversation _allowMembershipMutationsFromThisDevice](self, "_allowMembershipMutationsFromThisDevice");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_allowMembershipMutationsFromThisDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35918], "rcsService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    return IMSharedHelperRetrieveSimDetailsFromTelephony();
  else
    return 1;
}

- (BOOL)isSatelliteMessagingCompatible
{
  void *v3;
  int v4;
  BOOL result;

  result = 0;
  if (!-[CKConversation isGroupConversation](self, "isGroupConversation")
    && !-[CKConversation isReadOnlyChat](self, "isReadOnlyChat")
    && !-[CKConversation hasLeft](self, "hasLeft")
    && !-[CKConversation isBusinessConversation](self, "isBusinessConversation")
    && !-[CKConversation isStewieConversation](self, "isStewieConversation"))
  {
    -[CKConversation chat](self, "chat");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isStewieSharingChat");

    if (!v4)
      return 1;
  }
  return result;
}

- (BOOL)isSatelliteSendingService
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[CKConversation sendingService](self, "sendingService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35918], "iMessageLiteService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {
    v7 = 1;
  }
  else
  {
    -[CKConversation sendingService](self, "sendingService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D35918], "satelliteSMSService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == v6;

  }
  return v7;
}

- (BOOL)isAdHocGroupConversation
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[CKConversation isGroupConversation](self, "isGroupConversation"))
    return 0;
  -[CKConversation conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:](self, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", MEMORY[0x1E0C9AA60], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupPhoto");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") == 0;

  return v5;
}

- (BOOL)canReplyToChatItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  char v12;
  char v13;

  v4 = a3;
  -[CKConversation chat](self, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation chat](self, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isStewieChat") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[CKConversation chat](self, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isStewieSharingChat");

    v7 = v9 ^ 1;
  }

  objc_msgSend(MEMORY[0x1E0D10788], "sharedSystemShellSwitcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isClarityBoardEnabled");

  if (!objc_msgSend(v5, "supportsCapabilities:", 4)
    || -[CKConversation hasLeftGroupChat](self, "hasLeftGroupChat")
    || -[CKConversation isReadOnlyChat](self, "isReadOnlyChat")
    || (objc_msgSend(v5, "isBusinessChat") & 1) != 0)
  {
    v12 = 0;
  }
  else if ((objc_msgSend(v5, "isOscarChat") & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v12 = v7 & (v11 ^ 1);
  }
  v13 = v12 & objc_msgSend(v4, "canInlineReply");

  return v13;
}

- (int64_t)maximumRecipientsForSendingService
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;

  -[CKConversation sendingService](self, "sendingService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation lastAddressedHandle](self, "lastAddressedHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation lastAddressedSIMID](self, "lastAddressedSIMID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = objc_msgSend(v3, "__ck_maxRecipientCountForHandle:simID:", v4, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D35918], "smsService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "__ck_maxRecipientCountForHandle:simID:", v4, v5);

  }
  return v6;
}

- (BOOL)canInsertMoreRecipients
{
  unint64_t v3;

  if (!-[CKConversation recipientCount](self, "recipientCount"))
    return 1;
  v3 = -[CKConversation recipientCount](self, "recipientCount");
  return v3 < -[CKConversation maximumRecipientsForSendingService](self, "maximumRecipientsForSendingService");
}

- (BOOL)canMuteStateBeToggled
{
  void *v3;
  void *v4;
  int v5;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKConversation chat](self, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isStewieChat") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (IMHandle)businessHandle
{
  IMHandle *businessHandle;
  IMHandle **p_businessHandle;
  void *v5;
  void *v6;
  void *v7;
  IMHandle *v8;
  IMHandle *v9;
  IMHandle *v10;

  if (-[CKConversation isBusinessConversation](self, "isBusinessConversation"))
  {
    p_businessHandle = &self->_businessHandle;
    businessHandle = self->_businessHandle;
    if (!businessHandle)
    {
      -[CKConversation handles](self, "handles");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "isBusiness"))
        objc_storeStrong((id *)&self->_businessHandle, v6);
      if (!*p_businessHandle)
      {
        -[CKConversation chat](self, "chat");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "businessHandle");
        v8 = (IMHandle *)objc_claimAutoreleasedReturnValue();
        v9 = self->_businessHandle;
        self->_businessHandle = v8;

      }
      businessHandle = *p_businessHandle;
    }
    v10 = businessHandle;
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (BOOL)isMapKitBusinessConversation
{
  NSNumber *mapKitBusinessConversation;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  unsigned int v11;
  NSNumber *v12;
  NSNumber *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  mapKitBusinessConversation = self->_mapKitBusinessConversation;
  if (!mapKitBusinessConversation)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[CKConversation handles](self, "handles", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "isMapKitBusiness") & 1) != 0)
          {
            v9 = 1;
            goto LABEL_12;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_12:

    -[CKConversation chat](self, "chat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isMapKitBusinessChat");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9 | v11);
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v13 = self->_mapKitBusinessConversation;
    self->_mapKitBusinessConversation = v12;

    mapKitBusinessConversation = self->_mapKitBusinessConversation;
  }
  return -[NSNumber BOOLValue](mapKitBusinessConversation, "BOOLValue");
}

- (BOOL)isChatBot
{
  NSNumber *chatBot;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSNumber *v11;
  NSNumber *v12;

  chatBot = self->_chatBot;
  if (chatBot)
    return -[NSNumber BOOLValue](chatBot, "BOOLValue");
  -[CKConversation chat](self, "chat");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        -[CKConversation chat](self, "chat"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "chatStyle"),
        v6,
        v5,
        v7 == 45))
  {
    -[CKConversation handles](self, "handles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isChatBot");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v12 = self->_chatBot;
    self->_chatBot = v11;

    chatBot = self->_chatBot;
    return -[NSNumber BOOLValue](chatBot, "BOOLValue");
  }
  return 0;
}

- (BOOL)shouldPresentSpamReasonPicker
{
  BOOL v3;

  v3 = -[CKConversation isChatBot](self, "isChatBot");
  return -[CKConversation isBusinessConversation](self, "isBusinessConversation") && !v3;
}

- (NSString)chatbotURI
{
  void *v3;
  void *v4;
  void *v5;

  if (-[CKConversation isChatBot](self, "isChatBot"))
  {
    -[CKConversation chat](self, "chat");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "chatIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("sip:"), &stru_1E276D870);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)deleteBrandLogos
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[CKConversation businessHandle](self, "businessHandle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "brand");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "brandURI");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Messages for Business delete brand logos for brand URI: %@", (uint8_t *)&v9, 0xCu);

    }
  }
  -[CKConversation businessHandle](self, "businessHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "brand");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearCachedAssets:", &__block_literal_global_99);

}

void __34__CKConversation_deleteBrandLogos__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    IMLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __34__CKConversation_deleteBrandLogos__block_invoke_cold_1((uint64_t)v2, v3);

  }
}

- (BOOL)isUserDeletable
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[CKConversation isStewieConversation](self, "isStewieConversation"))
  {
    objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isStewieActive");

  }
  else
  {
    v3 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("YES");
      if (v3)
        v5 = CFSTR("NO");
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Conversation can be deleted: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  return v3 ^ 1;
}

- (BOOL)isEmergencyTranscriptSharingConversation
{
  void *v2;
  char v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStewieSharingChat");

  return v3;
}

- (BOOL)isAppleConversation
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[CKConversation isBusinessConversation](self, "isBusinessConversation");
  if (v3)
  {
    -[CKConversation chat](self, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAppleChat");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isMakoConversation
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[CKConversation isBusinessConversation](self, "isBusinessConversation");
  if (v3)
  {
    -[CKConversation chat](self, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isMakoChat");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isWithMyself
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation sendingService](self, "sendingService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestActiveAccountForService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CKConversation handles](self, "handles", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v5, "aliases");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "ID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "containsObject:", v13);

        if (!v14)
        {
          v15 = 0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_11:

  return v15;
}

- (BOOL)hasReplyEnabled
{
  void *v3;
  void *v4;
  char v5;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CKConversation chat](self, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isReplyEnabled");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)unmute
{
  id v2;

  -[CKConversation chat](self, "chat");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMuteUntilDate:", 0);

}

- (void)setMutedUntilDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKConversation chat](self, "chat");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMuteUntilDate:", v4);

}

- (BOOL)shouldSendReadReceipts
{
  void *v2;
  char v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "__ck_sendReadReceipts");

  return v3;
}

- (void)setSendReadReceipts:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKConversation chat](self, "chat");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__ck_setSendReadReceipts:", v3);

}

- (void)canShareFocusStatusWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a3;
  -[CKConversation chat](self, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKConversation chat](self, "chat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "canShareFocusStatusWithCompletion:", v6);

  }
  else
  {
    v6[2](v6, 0);
  }

}

- (void)isInvitedToViewMyFocusStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  -[CKConversation chat](self, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKConversation chat](self, "chat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "isInvitedToViewMyFocusStatusWithCompletion:", v4);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Requested to share focus mode in conversation with no chat.", v8, 2u);
      }

    }
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)addRecipientHandles:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation setPendingRecipients:](self, "setPendingRecipients:", v6);

  -[CKConversation chat](self, "chat");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inviteParticipants:reason:", v5, 0);

}

- (void)removeRecipientHandles:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation setPendingRecipients:](self, "setPendingRecipients:", v6);

  -[CKConversation chat](self, "chat");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeParticipants:reason:", v5, 0);

}

- (id)entityMatchingHandle:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CKEntity *v11;
  NSObject *v12;
  CKEntity *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKConversation recipients](self, "recipients");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
      objc_msgSend(v9, "defaultIMHandle", (_QWORD)v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "matchesIMHandle:", v4) & 1) != 0)
        break;

      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v9;

    if (v11)
      goto LABEL_16;
  }
  else
  {
LABEL_9:

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v4;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Recipient not found on conversation mathing handle: %@. Creating a new CKEntity.", buf, 0xCu);
    }

  }
  v13 = [CKEntity alloc];
  -[CKConversation chat](self, "chat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CKEntity initWithChat:imHandle:](v13, "initWithChat:imHandle:", v14, v4);

LABEL_16:
  return v11;
}

- (void)updateDisplayNameIfSMSSpam
{
  if (-[CKConversation wasDetectedAsSMSSpam](self, "wasDetectedAsSMSSpam"))
    -[CKConversation resetNameCaches](self, "resetNameCaches");
}

- (id)orderedContactsForAvatar3DTouchUIWithKeysToFetch:(id)a3
{
  return -[CKConversation orderedContactsWithMaxCount:keysToFetch:](self, "orderedContactsWithMaxCount:keysToFetch:", -1, a3);
}

void __58__CKConversation_orderedContactsWithMaxCount_keysToFetch___block_invoke_3(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isFromMe") & 1) == 0 && (objc_msgSend(v5, "isTypingMessage") & 1) == 0)
  {
    (*(void (**)(void))(a1[4] + 16))();
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "count") >= a1[6])
      *a3 = 1;
  }

}

- (void)refreshServiceForSending
{
  NSObject *v3;
  void *v4;
  const char *v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(38);
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CKConversation refreshServiceForSending]";
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v5 = "-[CKConversation refreshServiceForSending]";
    _CKLog();
  }
  -[CKConversation chat](self, "chat", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshServiceForSending");

}

- (IMService)sendingService
{
  void *v3;
  void *v4;
  void *v5;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (-[CKConversation isChatBot](self, "isChatBot"))
      objc_msgSend(MEMORY[0x1E0D35910], "rcsService");
    else
      objc_msgSend(MEMORY[0x1E0D35910], "smsService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (IMService *)v5;
}

- (id)sendingServiceImpl
{
  void *v2;
  void *v3;
  void *v4;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0D35910], "smsService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)_handleIsForThisConversation:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[CKConversation handles](self, "handles");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "compareIDs:", v4, (_QWORD)v10))
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_handlePreferredServiceChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(38);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CKConversation _handlePreferredServiceChangedNotification:]";
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v7 = "-[CKConversation _handlePreferredServiceChangedNotification:]";
    _CKLog();
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("CKConversationPreferredServiceChangedNotification"), self, 0);

  -[CKConversation _clearTypingIndicatorsIfNecessary](self, "_clearTypingIndicatorsIfNecessary");
}

- (void)_chatItemsDidChange:(id)a3
{
  NSAttributedString *previewText;

  previewText = self->_previewText;
  self->_previewText = 0;

}

- (void)_chatPropertiesChanged:(id)a3
{
  id v3;

  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_postConversationListChangedNotification");

}

- (BOOL)_isSendButtonDisabledForCarrierMessaging
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  void *v7;

  if (-[CKConversation recipientCount](self, "recipientCount"))
  {
    -[CKConversation sendingService](self, "sendingService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "__ck_isSMS") && -[CKConversation isPending](self, "isPending"))
    {
      v4 = objc_msgSend(MEMORY[0x1E0D35918], "smsEnabled");

      if (!v4)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
    }
    else
    {

    }
  }
  if (-[CKConversation recipientCount](self, "recipientCount"))
  {
    -[CKConversation sendingService](self, "sendingService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "__ck_isRCS") && -[CKConversation isPending](self, "isPending"))
    {
      objc_msgSend(MEMORY[0x1E0D39A70], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "isRCSEnabled") ^ 1;

    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (char)sendButtonColor
{
  void *v5;
  char v6;

  if (-[CKConversation _isSendButtonDisabledForCarrierMessaging](self, "_isSendButtonDisabledForCarrierMessaging"))
    return -1;
  if (-[CKConversation isMapKitBusinessConversation](self, "isMapKitBusinessConversation")
    || -[CKConversation isStewieConversation](self, "isStewieConversation"))
  {
    return 6;
  }
  -[CKConversation sendingService](self, "sendingService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "__ck_displayColor");

  return v6;
}

- (BOOL)noAvailableServices
{
  return 0;
}

- (NSString)deviceIndependentID
{
  void *v2;
  void *v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceIndependentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)pinningIdentifier
{
  void *v2;
  void *v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pinningIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int)wasDetectedAsSpam
{
  int v3;

  v3 = -[CKConversation wasDetectedAsSMSSpam](self, "wasDetectedAsSMSSpam");
  return -[CKConversation wasDetectedAsiMessageSpam](self, "wasDetectedAsiMessageSpam") | v3;
}

- (int)wasDetectedAsiMessageSpam
{
  void *v3;
  void *v4;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForChatProperty:", *MEMORY[0x1E0D359F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_wasDetectedAsiMessageSpam = objc_msgSend(v4, "intValue");

  return self->_wasDetectedAsiMessageSpam;
}

- (int)wasDetectedAsSMSSpam
{
  void *v3;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_wasDetectedAsSMSSpam = objc_msgSend(v3, "wasDetectedAsSMSSpam");

  return self->_wasDetectedAsSMSSpam;
}

- (int)wasDetectedAsSMSCategory
{
  void *v3;
  void *v4;
  int *p_wasDetectedAsSMSCategory;
  void *v6;
  void *v7;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForChatProperty:", *MEMORY[0x1E0D359D0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v4, "intValue") < 1)
  {
    -[CKConversation chat](self, "chat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForChatProperty:", *MEMORY[0x1E0D359E8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_wasDetectedAsSMSCategory = objc_msgSend(v7, "intValue") != 0;
    p_wasDetectedAsSMSCategory = &self->_wasDetectedAsSMSCategory;

  }
  else
  {
    self->_wasDetectedAsSMSCategory = 1;
    p_wasDetectedAsSMSCategory = &self->_wasDetectedAsSMSCategory;
  }

  return *p_wasDetectedAsSMSCategory;
}

- (int64_t)spamCategory
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForChatProperty:", *MEMORY[0x1E0D359E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
    return 2;
  v7 = (void *)MEMORY[0x1E0D399F8];
  -[CKConversation chat](self, "chat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForChatProperty:", *MEMORY[0x1E0D359D0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "filterActionForCategory:", (int)objc_msgSend(v9, "intValue"));

  return v10;
}

- (int64_t)spamSubCategory
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForChatProperty:", *MEMORY[0x1E0D359D0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (int)objc_msgSend(v4, "intValue");

  -[CKConversation chat](self, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForChatProperty:", *MEMORY[0x1E0D359D8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (int)objc_msgSend(v7, "intValue");

  return objc_msgSend(MEMORY[0x1E0D399F8], "filterSubActionForCategory:subCategory:", v5, v8);
}

- (BOOL)hasKnownParticipants
{
  void *v2;
  char v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasKnownParticipants");

  return v3;
}

- (id)recipientsSortedByIsContact:(BOOL)a3 alphabetically:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v5 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("defaultIMHandle.isContact"), 0);
    objc_msgSend(v7, "addObject:", v8);

  }
  if (v4)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:selector:", CFSTR("fullName"), 1, sel_caseInsensitiveCompare_);
    objc_msgSend(v7, "addObject:", v9);

  }
  -[CKConversation recipients](self, "recipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingDescriptors:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isToEmailAddress
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  char v7;
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
  -[CKConversation recipients](self, "recipients", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "rawAddress");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "_appearsToBeEmail");

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_deleteAllMessagesAndRemoveGroup:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  CKDetailsContactsManager *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  CKConversation *v20;
  _BOOL8 v21;
  uint8_t buf[4];
  CKConversation *v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(27);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v23 = self;
      v24 = 1024;
      v25 = v3;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "deleting all messages involving conversation %@ and removing group: %d", buf, 0x12u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v20 = self;
    v21 = v3;
    _CKLog();
  }
  -[CKConversation chat](self, "chat", v20, v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isBusinessChat");
  objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isFeatureEnabled"))
  {
    v9 = objc_msgSend(v6, "hasCommSafetySensitiveMessage");

    if (!v9)
      goto LABEL_12;
    v10 = (void *)MEMORY[0x1E0D357D0];
    -[CKConversation chat](self, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerEvent:eventType:messageGUID:chat:forImages:", 2, 3, 0, v8, 0);
  }

LABEL_12:
  if (v3)
    objc_msgSend(v6, "remove");
  else
    objc_msgSend(v6, "deleteAllHistory");
  if (v7)
    objc_msgSend(v6, "deleteExtensionPayloadData");
  if (!-[CKConversation isGroupConversation](self, "isGroupConversation"))
  {
    -[CKConversation recipient](self, "recipient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rawAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (!v13)
    {
      v14 = objc_alloc_init(CKDetailsContactsManager);
      -[CKConversation recipient](self, "recipient");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "rawAddress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsContactsManager setPreferredCallService:forID:](v14, "setPreferredCallService:forID:", 0, v16);

    }
  }
  +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDraft:forConversation:", 0, self);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v23 = (CKConversation *)"-[CKConversation _deleteAllMessagesAndRemoveGroup:]";
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "%s requesting purge of default snapshot", buf, 0xCu);
    }

  }
  v19 = objc_alloc_init(MEMORY[0x1E0DAAD88]);
  objc_msgSend(v19, "deleteSnapshotsForApplicationIdentifier:", CFSTR("com.apple.MobileSMS"));
  objc_msgSend(v19, "invalidate");

}

- (void)deleteAllMessages
{
  -[CKConversation _deleteAllMessagesAndRemoveGroup:](self, "_deleteAllMessagesAndRemoveGroup:", 0);
}

- (void)deleteAllMessagesAndRemoveGroup
{
  -[CKConversation _deleteAllMessagesAndRemoveGroup:](self, "_deleteAllMessagesAndRemoveGroup:", 1);
}

- (BOOL)_earlyReturnHistoryLoad
{
  return !CKIsRunningInPreferences()
      && !CKIsRunningInNanoSettings()
      && !CKIsRunningInMessagesOrSpringBoard()
      && (IMIsRunningInMessagesComposeViewService() & 1) == 0
      && !CKIsRunningInMessagesNotificationExtension()
      && !CKIsRunningInMessagesAssistantUIExtension()
      && !CKIsRunningInMessagesTranscriptExtension()
      || CKIsRunningUnitTests() != 0;
}

- (void)loadAllMessages
{
  NSObject *v3;
  unsigned int v4;
  NSObject *v5;
  id v6;
  uint8_t v7[16];
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_18DFCD000, "com.apple.messages.HistoryLoad", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  if (!-[CKConversation _earlyReturnHistoryLoad](self, "_earlyReturnHistoryLoad"))
  {
    v4 = -[CKConversation limitToLoad](self, "limitToLoad");
    if (-[CKConversation _chatHasValidUnreadMessageToLoad](self, "_chatHasValidUnreadMessageToLoad"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v7 = 0;
          _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "First unread message is not loaded. Increasing limitToLoad to 100 for Catch Up.", v7, 2u);
        }

      }
      v4 = 100;
    }
    else if (!v4)
    {
LABEL_11:
      self->_needsReload = 0;
      -[CKConversation setHasLoadedAllMessages:](self, "setHasLoadedAllMessages:", 1);
      goto LABEL_12;
    }
    -[IMChat setNumberOfMessagesToKeepLoaded:](self->_chat, "setNumberOfMessagesToKeepLoaded:", v4);
    if (v4 >= 2)
      v6 = (id)-[IMChat loadMessagesBeforeDate:limit:loadImmediately:](self->_chat, "loadMessagesBeforeDate:limit:loadImmediately:", 0, v4, 1);
    goto LABEL_11;
  }
LABEL_12:
  os_activity_scope_leave(&state);

}

- (void)fetchAllMessages:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  IMChat *chat;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (!-[CKConversation _earlyReturnHistoryLoad](self, "_earlyReturnHistoryLoad"))
  {
    v5 = -[CKConversation limitToLoad](self, "limitToLoad");
    if (v5)
    {
      v6 = v5;
      v7 = v5;
      -[IMChat setNumberOfMessagesToKeepLoaded:](self->_chat, "setNumberOfMessagesToKeepLoaded:", v5);
      if (v6 != 1)
      {
        chat = self->_chat;
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __35__CKConversation_fetchAllMessages___block_invoke;
        v9[3] = &unk_1E2751AD0;
        v9[4] = self;
        v10 = v4;
        -[IMChat fetchMessagesUpToLimit:completion:](chat, "fetchMessagesUpToLimit:completion:", v7, v9);

      }
    }
  }

}

uint64_t __35__CKConversation_fetchAllMessages___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "setHasLoadedAllMessages:", 1);
}

- (void)loadAllUnreadMessagesUpToMessageGUID:(id)a3
{
  BOOL v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  id v8;
  id v9;

  v9 = a3;
  v4 = -[CKConversation _earlyReturnHistoryLoad](self, "_earlyReturnHistoryLoad");
  v5 = v9;
  if (!v4)
  {
    v6 = -[CKConversation limitToLoad](self, "limitToLoad");
    if (v6)
    {
      v7 = v6;
      -[IMChat setNumberOfMessagesToKeepLoaded:](self->_chat, "setNumberOfMessagesToKeepLoaded:", v6);
      if (v7 != 1)
        v8 = (id)-[IMChat loadUnreadMessagesWithLimit:fallbackToMessagesUpToGUID:](self->_chat, "loadUnreadMessagesWithLimit:fallbackToMessagesUpToGUID:", v7, v9);
    }
    self->_needsReload = 0;
    v5 = v9;
  }

}

- (void)loadMoreMessagesBeforeFirstMessage
{
  NSObject *v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  os_activity_scope_state_s v10;

  v3 = _os_activity_create(&dword_18DFCD000, "com.apple.messages.HistoryLoadMore", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v3, &v10);
  if (!-[CKConversation _earlyReturnHistoryLoad](self, "_earlyReturnHistoryLoad"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "defaultConversationLoadMoreCount");

    v6 = -[CKConversation limitToLoad](self, "limitToLoad");
    if (v6)
    {
      -[IMChat setNumberOfMessagesToKeepLoaded:](self->_chat, "setNumberOfMessagesToKeepLoaded:", v6);
      if (v6 >= 2)
      {
        -[IMChat firstMessage](self->_chat, "firstMessage");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "guid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (id)-[IMChat loadMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:loadImmediately:threadIdentifier:](self->_chat, "loadMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:loadImmediately:threadIdentifier:", v8, v5, 0, 1, 0);

      }
    }
  }
  os_activity_scope_leave(&v10);

}

- (void)fetchMoreMessagesBeforeFirstMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  void *v10;
  os_activity_scope_state_s v11;

  v4 = a3;
  v5 = _os_activity_create(&dword_18DFCD000, "com.apple.messages.HistoryLoadMore", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v5, &v11);
  if (!-[CKConversation _earlyReturnHistoryLoad](self, "_earlyReturnHistoryLoad"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "defaultConversationLoadMoreCount");

    v8 = -[CKConversation limitToLoad](self, "limitToLoad");
    if (v8)
    {
      -[IMChat setNumberOfMessagesToKeepLoaded:](self->_chat, "setNumberOfMessagesToKeepLoaded:", v8);
      if (v8 >= 2)
      {
        -[IMChat firstMessage](self->_chat, "firstMessage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "guid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMChat fetchMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:threadIdentifier:completion:](self->_chat, "fetchMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:threadIdentifier:completion:", v10, v7, 0, 0, v4);

      }
    }
  }
  os_activity_scope_leave(&v11);

}

- (void)loadMoreMessagesAfterLastMessage
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  id v8;
  id v9;

  if (!-[CKConversation _earlyReturnHistoryLoad](self, "_earlyReturnHistoryLoad"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "defaultConversationLoadMoreCount");

    -[CKConversation setLimitToLoad:](self, "setLimitToLoad:", -[CKConversation limitToLoad](self, "limitToLoad") + v4);
    v5 = -[CKConversation limitToLoad](self, "limitToLoad");
    if (v5)
    {
      v6 = v5;
      -[IMChat setNumberOfMessagesToKeepLoaded:](self->_chat, "setNumberOfMessagesToKeepLoaded:", v5);
      if (v6 != 1)
      {
        -[IMChat lastMessage](self->_chat, "lastMessage");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "guid");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (id)-[IMChat loadMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:loadImmediately:threadIdentifier:](self->_chat, "loadMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:loadImmediately:threadIdentifier:", v7, 0, v4, 1, 0);

      }
    }
  }
}

- (void)fetchMoreMessagesAfterLastMessage:(id)a3
{
  void *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!-[CKConversation _earlyReturnHistoryLoad](self, "_earlyReturnHistoryLoad"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "defaultConversationLoadMoreCount");

    -[CKConversation setLimitToLoad:](self, "setLimitToLoad:", -[CKConversation limitToLoad](self, "limitToLoad") + v5);
    v6 = -[CKConversation limitToLoad](self, "limitToLoad");
    if (v6)
    {
      v7 = v6;
      -[IMChat setNumberOfMessagesToKeepLoaded:](self->_chat, "setNumberOfMessagesToKeepLoaded:", v6);
      if (v7 != 1)
      {
        -[IMChat lastMessage](self->_chat, "lastMessage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "guid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMChat fetchMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:threadIdentifier:completion:](self->_chat, "fetchMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:threadIdentifier:completion:", v9, 0, v5, 0, v10);

      }
    }
  }

}

- (NSArray)frequentReplies
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[IMChat frequentReplies](self->_chat, "frequentReplies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (void)loadFrequentReplies
{
  NSObject *v3;
  IMChat *chat;
  void *v5;
  uint64_t v6;
  id v7;
  IMChat *v8;
  CKConversation *v9;
  uint8_t buf[4];
  IMChat *v11;
  __int16 v12;
  CKConversation *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (CKIsRunningInMessagesOrSpringBoard()
    || (IMIsRunningInMessagesComposeViewService() & 1) != 0
    || CKIsRunningInMessagesNotificationExtension())
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(21);
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        chat = self->_chat;
        *(_DWORD *)buf = 138412546;
        v11 = chat;
        v12 = 2112;
        v13 = self;
        _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_DEBUG, "Loading common replies for imchat %@ on conversation %@", buf, 0x16u);
      }

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_CKShouldLog())
      {
        v8 = self->_chat;
        v9 = self;
        _CKLog();
      }
    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", v8, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "commonRepliesLoadLimit");

    v7 = (id)-[IMChat loadFrequentRepliesLimit:loadImmediately:](self->_chat, "loadFrequentRepliesLimit:loadImmediately:", v6, 1);
  }
}

- (void)loadMoreMessages
{
  void *v3;
  int v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "defaultConversationLoadMoreCount");

  -[CKConversation setLimitToLoad:](self, "setLimitToLoad:", -[CKConversation limitToLoad](self, "limitToLoad") + v4);
  if (-[CKConversation hasLoadedFromSpotlight](self, "hasLoadedFromSpotlight"))
    -[CKConversation loadMoreMessagesBeforeFirstMessage](self, "loadMoreMessagesBeforeFirstMessage");
  else
    -[CKConversation loadAllMessages](self, "loadAllMessages");
}

- (void)fetchMoreMessages:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "defaultConversationLoadMoreCount");

  -[CKConversation setLimitToLoad:](self, "setLimitToLoad:", -[CKConversation limitToLoad](self, "limitToLoad") + v5);
  -[CKConversation fetchMoreMessagesBeforeFirstMessage:](self, "fetchMoreMessagesBeforeFirstMessage:", v6);

}

- (void)setLoadedMessageCount:(unint64_t)a3 loadImmediately:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  unsigned int limitToLoad;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint8_t buf[4];
  unsigned int v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(27);
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      limitToLoad = self->_limitToLoad;
      -[CKConversation shortDescription](self, "shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v18 = limitToLoad;
      v19 = 2048;
      v20 = a3;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Setting limit to load (old: %d   new: %lu) for conversation: %@", buf, 0x1Cu);

    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
  {
    v10 = self->_limitToLoad;
    -[CKConversation shortDescription](self, "shortDescription");
    v15 = a3;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10;
    _CKLogExternal();

  }
  if (self->_limitToLoad == a3)
  {
    if (!-[CKConversation hasLoadedFromSpotlight](self, "hasLoadedFromSpotlight"))
    {
      if (self->_limitToLoad)
      {
        -[CKConversation chat](self, "chat");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_items");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count") == 0;

        if (v13)
          -[CKConversation setNeedsReload](self, "setNeedsReload");
      }
      -[CKConversation reloadIfNeeded](self, "reloadIfNeeded", v14, v15, v16);
    }
  }
  else
  {
    -[CKConversation setLimitToLoad:](self, "setLimitToLoad:", a3);
    if (v4 && !-[CKConversation hasLoadedFromSpotlight](self, "hasLoadedFromSpotlight"))
      -[CKConversation loadAllMessages](self, "loadAllMessages");
  }
}

- (BOOL)_chatHasValidUnreadMessageToLoad
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;
  BOOL v7;

  if (!CKIsCatchUpEnabled())
    return 0;
  v3 = -[IMChat unreadMessageCount](self->_chat, "unreadMessageCount");
  -[IMChat lastSeenMessageGuid](self->_chat, "lastSeenMessageGuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat messageForGUID:](self->_chat, "messageForGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = objc_msgSend(v4, "length") != 0;
  else
    v6 = 0;
  if (v5)
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

- (void)setLoadedMessageCount:(unint64_t)a3
{
  -[CKConversation setLoadedMessageCount:loadImmediately:](self, "setLoadedMessageCount:loadImmediately:", a3, 1);
}

- (id)ensureMessageWithGUIDIsLoaded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;

  v4 = a3;
  -[IMChat messageForGUID:](self->_chat, "messageForGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "defaultConversationViewingMessageCount");

    v8 = (id)-[IMChat loadMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:loadImmediately:threadIdentifier:](self->_chat, "loadMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:loadImmediately:threadIdentifier:", v4, v7, v7, 1, 0);
    -[IMChat messageForGUID:](self->_chat, "messageForGUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      _sHasLoadedGuidFromSpotlight = 1;
      -[CKConversation setNeedsReload](self, "setNeedsReload");
    }
    v9 = -[CKConversation limitToLoad](self, "limitToLoad");
    v10 = -[IMChat messageCount](self->_chat, "messageCount");
    if (v9 <= v10)
      v11 = v10;
    else
      v11 = v9;
    -[CKConversation setLimitToLoad:](self, "setLimitToLoad:", v11);
  }

  return v5;
}

- (void)clearConversationLoadFromSpotlight
{
  _sHasLoadedGuidFromSpotlight = 0;
}

- (BOOL)hasLoadedFromSpotlight
{
  return _sHasLoadedGuidFromSpotlight;
}

- (void)enumerateMessagesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[CKConversation chat](self, "chat");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chatItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumerateMessagesWithOptions:usingBlock:", a3, v6);

}

- (void)markAllMessagesAsRead
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  if (!objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
    goto LABEL_5;
  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || (v6 = v3, v5 = objc_msgSend(v3, "allowedByScreenTime"), v4 = v6, v5))
  {

LABEL_5:
    -[CKConversation chat](self, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markAllMessagesAsRead");
    v4 = v7;
  }

}

- (void)markLastMessageAsUnread
{
  id v2;

  -[CKConversation chat](self, "chat");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markLastMessageAsUnread");

}

- (BOOL)canReadStateBeToggled
{
  return !-[CKConversation hasLeftGroupChat](self, "hasLeftGroupChat");
}

- (void)updateLastViewedDate
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversation setDateLastViewed:](self, "setDateLastViewed:", v3);

}

- (BOOL)hasCancellableScheduledMessage
{
  void *v2;
  char v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCancellableScheduledMessage");

  return v3;
}

- (id)shortDescription
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_getAssociatedObject(self, "CKConversationShortDescriptionKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = objc_opt_class();
    -[CKConversation chat](self, "chat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistentID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversation chat](self, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversation chat](self, "chat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "participants");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@<%p>{identifier:'%@'  guid:'%@'}%@"), v5, self, v7, v9, v11);

    objc_setAssociatedObject(self, "CKConversationShortDescriptionKey", v3, (void *)1);
  }
  return v3;
}

- (void)setPendingComposeRecipients:(id)a3
{
  id v4;

  objc_msgSend(a3, "composeRecipientHandles");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversation setPendingHandles:](self, "setPendingHandles:", v4);

}

- (void)setPendingRecipients:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[NSSet isEqualToSet:](self->_pendingRecipients, "isEqualToSet:", v5))
  {
    objc_storeStrong((id *)&self->_pendingRecipients, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("CKConversationPendingRecipientsUpdatedNotification"), self);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = 138412546;
        v9 = v5;
        v10 = 2112;
        v11 = CFSTR("CKConversationPendingRecipientsUpdatedNotification");
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Setting pending recipients to: %@ and firing notification: %@", (uint8_t *)&v8, 0x16u);
      }

    }
  }

}

- (void)setPendingHandles:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_pendingHandles != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_pendingHandles, a3);
    -[CKConversation resetCaches](self, "resetCaches");
    v5 = v6;
  }

}

- (NSArray)pendingEntities
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CKEntity *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CKConversation pendingHandles](self, "pendingHandles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[CKConversation pendingHandles](self, "pendingHandles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[CKConversation pendingHandles](self, "pendingHandles", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = -[CKEntity initWithIMHandle:]([CKEntity alloc], "initWithIMHandle:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = 0;
  }
  return (NSArray *)v7;
}

- (NSArray)recipientStrings
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CKConversation recipients](self, "recipients", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "rawAddress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSSet)recipientNames
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CKConversation recipients](self, "recipients", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "fullName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v10;
}

- (BOOL)canAcceptMediaObjectType:(int)a3 givenMediaObjects:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[CKConversation sendingService](self, "sendingService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation lastAddressedHandle](self, "lastAddressedHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation lastAddressedSIMID](self, "lastAddressedSIMID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "__ck_isSMS");
  v11 = (void *)objc_opt_class();
  if (v10)
    v12 = objc_msgSend(v11, "_sms_canAcceptMediaObjectType:givenMediaObjects:phoneNumber:simID:", v4, v6, v8, v9);
  else
    v12 = objc_msgSend(v11, "_iMessage_canAcceptMediaObjectType:givenMediaObjects:", v4, v6);
  v13 = v12;

  return v13;
}

- (BOOL)_allowedByScreenTime
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;

  if (!objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
    return 1;
  -[CKConversation chat](self, "chat");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 1;
  v4 = (void *)v3;
  -[CKConversation chat](self, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowedToShowConversationSync");

  return v6;
}

- (BOOL)canSendComposition:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[CKConversation canSendComposition:forCapabilities:error:](self, "canSendComposition:forCapabilities:error:", v6, 0x10000, a4);
  if (a4 && !v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*a4, "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v9;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Cannot send composition due to error %@", (uint8_t *)&v21, 0xCu);

      }
    }
    goto LABEL_18;
  }
  if (!-[CKConversation _allowedByScreenTime](self, "_allowedByScreenTime"))
  {
LABEL_18:
    v17 = 0;
    goto LABEL_19;
  }
  -[CKConversation sendingService](self, "sendingService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CKConversation isToEmailAddress](self, "isToEmailAddress");
  if (objc_msgSend(v10, "__ck_isSMS"))
  {
    v12 = (void *)objc_opt_class();
    -[CKConversation lastAddressedHandle](self, "lastAddressedHandle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversation lastAddressedSIMID](self, "lastAddressedSIMID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "_sms_canSendComposition:lastAddressedHandle:lastAddressedSIMID:recipientsContainEmail:error:", v6, v13, v14, v11, a4);
LABEL_12:
    v17 = v15;
    goto LABEL_13;
  }
  if (objc_msgSend(v10, "__ck_isRCS"))
  {
    v16 = (void *)objc_opt_class();
    -[CKConversation lastAddressedHandle](self, "lastAddressedHandle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversation lastAddressedSIMID](self, "lastAddressedSIMID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "_rcs_canSendComposition:lastAddressedHandle:lastAddressedSIMID:recipientsContainEmail:error:", v6, v13, v14, v11, a4);
    goto LABEL_12;
  }
  if (!objc_msgSend(v10, "__ck_isMadrid"))
  {
    v17 = 1;
    goto LABEL_14;
  }
  v18 = (void *)objc_opt_class();
  -[CKConversation lastAddressedHandle](self, "lastAddressedHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation lastAddressedSIMID](self, "lastAddressedSIMID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation chat](self, "chat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v18, "_iMessage_canSendComposition:lastAddressedHandle:lastAddressedSIMID:currentService:forceSMS:error:", v6, v13, v14, v10, objc_msgSend(v19, "shouldForceToSMS"), a4);

LABEL_13:
LABEL_14:

LABEL_19:
  return v17;
}

- (BOOL)canSendToRecipients:(id)a3 alertIfUnable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  v4 = a4;
  v6 = a3;
  -[CKConversation sendingService](self, "sendingService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "__ck_isSMS"))
    v8 = -[CKConversation _sms_canSendToRecipients:alertIfUnable:](self, "_sms_canSendToRecipients:alertIfUnable:", v6, v4);
  else
    v8 = -[CKConversation _iMessage_canSendToRecipients:alertIfUnable:](self, "_iMessage_canSendToRecipients:alertIfUnable:", v6, v4);
  v9 = v8;

  return v9;
}

- (double)maxTrimDurationForMedia:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;

  v4 = objc_msgSend(a3, "mediaType");
  -[CKConversation sendingService](self, "sendingService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "__ck_isSMS");
  v7 = (void *)objc_opt_class();
  if (v6)
    objc_msgSend(v7, "_sms_maxTrimDurationForMediaType:", v4);
  else
    objc_msgSend(v7, "_iMessage_maxTrimDurationForMediaType:", v4);
  v9 = v8;

  return v9;
}

- (void)resortMessagesIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  CKConversation *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation dateLastViewed](self, "dateLastViewed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CKConversation dateLastViewed](self, "dateLastViewed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v5);
    v7 = v6;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transcriptResortTimeout");
    v10 = v9;

    if (v7 > v10)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          -[CKConversation dateLastViewed](self, "dateLastViewed");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "transcriptResortTimeout");
          v16 = 138413058;
          v17 = self;
          v18 = 2112;
          v19 = v12;
          v20 = 2112;
          v21 = v3;
          v22 = 2048;
          v23 = v14;
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "re-sorting messages in conversation: %@ date last viewed: %@, date now: %@, resort timeout: %f", (uint8_t *)&v16, 0x2Au);

        }
      }
      -[CKConversation chat](self, "chat");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "resortMessages");

    }
  }

}

- (id)messageWithComposition:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[CKConversation chat](self, "chat");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "localTypingMessageGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversation sendingServiceImpl](self, "sendingServiceImpl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "shouldReuseTypingIndicatorGUID");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  objc_msgSend(v4, "messageWithGUID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)messagesFromComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKConversation chat](self, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localTypingMessageGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversation sendingServiceImpl](self, "sendingServiceImpl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldReuseTypingIndicatorGUID");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  -[CKConversation sendingService](self, "sendingService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messagesFromCompositionFirstGUIDForMessage:sendingService:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isCarrierPigeonEnabled");

  if (v13)
  {
    -[CKConversation chat](self, "chat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "shouldDisplayOffGridModeStatus");

    if (v15)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v16 = v11;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v23;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v23 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20++), "setPendingSatelliteSend:", 1, (_QWORD)v22);
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v18);
      }

    }
  }

  return v11;
}

- (void)retryMessage:(id)a3 onService:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_msgSend(v7, "setIsTapToRetry:", 1);
  if ((objc_msgSend(v7, "scheduleState") & 0xFFFFFFFFFFFFFFFELL) == 4)
    objc_msgSend(v7, "setScheduleState:", 1);
  -[CKConversation sendMessage:onService:newComposition:](self, "sendMessage:onService:newComposition:", v7, v6, 0);
  objc_msgSend(v7, "setIsTapToRetry:", 0);

}

- (void)sendMessage:(id)a3 onService:(id)a4 newComposition:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  char v40;
  NSObject *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  const __CFString *v47;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  const __CFString *v60;
  uint64_t v61;

  v5 = a5;
  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v49 = a4;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(27);
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v56 = v8;
      v57 = 2112;
      if (v5)
        v10 = CFSTR("YES");
      v58 = v49;
      v59 = 2112;
      v60 = v10;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "sendMessage:onService:newComposition: [%@] [%@] [%@]", buf, 0x20u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
  {
    if (v5)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v46 = v49;
    v47 = v11;
    v44 = v8;
    _CKLogExternal();
  }
  if (-[CKConversation hasLeftGroupChat](self, "hasLeftGroupChat", v44, v46, v47))
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(27);
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_DEBUG, "Failing to send message on a group chat we've left before", buf, 2u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
LABEL_20:
      _CKLog();
  }
  else if (-[CKConversation isReadOnlyChat](self, "isReadOnlyChat"))
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(27);
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_DEBUG, "Failing to send message on a read only chat", buf, 2u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      goto LABEL_20;
  }
  else
  {
    -[CKConversation chat](self, "chat");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bestAccountForService:", v49);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v48, "account");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v8, "fileTransferGUIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v51 != v18)
            objc_enumerationMutation(v16);
          v20 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "assignTransfer:toMessage:account:", v20, v8, v15);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      }
      while (v17);
    }

    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "guid");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v56 = v23;
        _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Sending message with guid: %@", buf, 0xCu);

      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      objc_msgSend(v8, "guid");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      _CKLogExternal();

    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v48;
        _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "  => Chat: %@", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      v45 = v48;
      _CKLogExternal();
    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v48, "account");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v56 = v26;
        _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "  => Sending account: %@", buf, 0xCu);

      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      objc_msgSend(v48, "account");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      _CKLogExternal();

    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v48, "account");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "displayName");
        v29 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v56 = v29;
        _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "  => Display name: %@", buf, 0xCu);

      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      objc_msgSend(v48, "account");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "displayName");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      _CKLogExternal();

    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v48, "participants");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR(","));
        v33 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v56 = v33;
        _os_log_impl(&dword_18DFCD000, v31, OS_LOG_TYPE_INFO, "  => Recipients: [%@]", buf, 0xCu);

      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      objc_msgSend(v48, "participants");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR(","));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      _CKLogExternal();

    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "fileTransferGUIDs");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR(","));
        v37 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v56 = v37;
        _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "  => Transfers: [%@]", buf, 0xCu);

      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      objc_msgSend(v8, "fileTransferGUIDs");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "componentsJoinedByString:", CFSTR(","));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      _CKLogExternal();

    }
    objc_msgSend(v48, "sendMessage:onService:", v8, v49, v45);
    -[CKConversation chat](self, "chat");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "unreadMessageCount") && CKIsRunningInMessages())
    {
      v40 = objc_msgSend(v8, "isTypingMessage");

      if ((v40 & 1) == 0
        && (!+[CKStarkManager isCarPlayConnected](CKStarkManager, "isCarPlayConnected")
         || !CKIsScreenLocked()))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            -[CKConversation chat](self, "chat");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "chatIdentifier");
            v43 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v56 = v43;
            _os_log_impl(&dword_18DFCD000, v41, OS_LOG_TYPE_INFO, "Marking chat %@ as read on message send ", buf, 0xCu);

          }
        }
        -[CKConversation markAllMessagesAsRead](self, "markAllMessagesAsRead");
      }
    }
    else
    {

    }
    -[CKConversation _setProofReadingInfoForChat:withMessage:](self, "_setProofReadingInfoForChat:withMessage:", v48, v8);

  }
}

- (void)_setProofReadingInfoForChat:(id)a3 withMessage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
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
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[2];
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[2];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "__im_messagePartIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "lastIndex");

  objc_msgSend(v7, "__im_messagePartMatchingPartIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messagePartBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "length");
  objc_msgSend(v5, "proofreadingInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0D35430];
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D35430]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
  {
    v49 = v10;
    v50 = v6;
    v17 = v12;
    objc_msgSend(v5, "proofreadingInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("UnderlineRanges"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v20;
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v50, "guid");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("p:%ld/%@"), v9, v47);
      v10 = v49;
      v12 = v17;
      if (v9 && CKIsRunningInMacCatalyst())
      {
        v46 = v21;
        objc_msgSend(v7, "attributedSubstringFromRange:", 0, v13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "string");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "proofreadingInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v15);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("TextCorrections"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = v26;
        objc_msgSend(v26, "lastObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_msgSend(v46, "lastObject");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "rangeValue");
          v42 = v28;
          v29 = objc_msgSend(v23, "length");
          v40 = v29 - objc_msgSend(v27, "length");
          objc_msgSend(v5, "proofreadingInfo");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", v15);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("ReplacedStrings"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v55 = v27;
          v56[0] = CFSTR("TextCorrections");
          v43 = v27;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v57[0] = v41;
          v56[1] = CFSTR("ReplacedStrings");
          objc_msgSend(v39, "lastObject");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v38;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v57[1] = v32;
          v56[2] = CFSTR("UnderlineRanges");
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v40, v42);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v33;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v57[2] = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = v43;
          v51[0] = *MEMORY[0x1E0D35438];
          v51[1] = v15;
          v52[0] = v48;
          v52[1] = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setProofreadingInfo:", v36);

        }
        v10 = v49;
        v6 = v50;
        v21 = v46;
        v37 = (void *)v48;
      }
      else
      {
        v58[0] = *MEMORY[0x1E0D35438];
        v58[1] = v15;
        v37 = (void *)v48;
        v59[0] = v48;
        v59[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setProofreadingInfo:", v23);
        v6 = v50;
      }

    }
    else
    {

      v12 = v17;
      v10 = v49;
      v6 = v50;
    }
  }

}

- (void)sendMessage:(id)a3 newComposition:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  _BOOL8 v9;
  uint8_t buf[4];
  _BOOL4 v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(27);
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v11 = v4;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_DEBUG, "sending message on preferred service (newComposition: %d)", buf, 8u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v9 = v4;
    _CKLog();
  }
  -[CKConversation sendingService](self, "sendingService", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation sendMessage:onService:newComposition:](self, "sendMessage:onService:newComposition:", v6, v8, v4);

}

- (void)retractMessagePart:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKConversation chat](self, "chat");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "retractMessagePart:", v4);

}

- (void)retractScheduledMessageParts:(id)a3 fromAggregateChatItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
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
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13++), "index", (_QWORD)v16));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  -[CKConversation chat](self, "chat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v14, "retractScheduledMessagePartIndexes:fromChatItem:", v15, v7);

}

- (void)editMessageItem:(id)a3 partIndex:(int64_t)a4 withNewComposition:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v8 = a3;
  objc_msgSend(a5, "superFormatText:", 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversation _backwardCompatabilityTextForEditedMessagePartText:](self, "_backwardCompatabilityTextForEditedMessagePartText:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation chat](self, "chat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "editMessageItem:atPartIndex:withNewPartText:backwardCompatabilityText:", v8, a4, v11, v9);

}

- (void)resendEditedMessageItem:(id)a3 forPartIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  objc_msgSend(v6, "body");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "__im_messagePartMatchingPartIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messagePartBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    -[CKConversation _backwardCompatabilityTextForEditedMessagePartText:](self, "_backwardCompatabilityTextForEditedMessagePartText:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[CKConversation chat](self, "chat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resendEditedMessageItem:forPartIndex:withBackwardCompatabilityText:", v6, a4, v9);

}

- (id)_backwardCompatabilityTextForEditedMessagePartText:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CEAAD8];
  v4 = a3;
  objc_msgSend(v3, "currentInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  IMSharedUtilitiesFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v7, "localizations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(v7, "preferredLocalizations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredLocalizationsFromArray:forPreferences:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedStringForKey:value:table:localization:", CFSTR("EDITED_MESSAGE_BACKWARD_COMPATIBILITY_EDITED"), 0, CFSTR("IMSharedUtilities"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:localization:", CFSTR("EDITED_MESSAGE_BACKWARD_COMPATIBILITY_FORMAT"), 0, CFSTR("IMSharedUtilities"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v16);
  v18 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v18, "removeAttribute:range:", *MEMORY[0x1E0D366B8], 0, objc_msgSend(v18, "length"));
  v19 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(MEMORY[0x1E0CB3498], "localizedAttributedStringWithFormat:", v17, v15, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)supportsMessageEditing
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  void *v6;
  BOOL v7;
  char v8;
  __int16 v10;
  __int16 v11;

  if (-[CKConversation hasLeftGroupChat](self, "hasLeftGroupChat"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v11 = 0;
        v4 = "Not allowing message editing because the user is no longer a member of this group chat.";
        v5 = (uint8_t *)&v11;
LABEL_9:
        _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    return 0;
  }
  -[CKConversation chat](self, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 1;
  v8 = objc_msgSend(v6, "supportsCapabilities:", 1);

  if ((v8 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v10 = 0;
        v4 = "Not allowing message editing because the capability is not allowed.";
        v5 = (uint8_t *)&v10;
        goto LABEL_9;
      }
LABEL_10:

    }
    return 0;
  }
  return v7;
}

- (BOOL)supportsInlineAdaptiveImageGlyphs
{
  void *v2;
  void *v3;
  char v4;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "supportsCapabilities:", 0x400000);
  else
    v4 = 1;

  return v4;
}

- (BOOL)supportsSendLater
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScheduledMessagesEnabled");

  if (v4
    && (-[CKConversation recipient](self, "recipient"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "defaultIMHandle"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "matchesLoginHandleForAnyAccount"),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    -[CKConversation chat](self, "chat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CKConversation chat](self, "chat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = objc_msgSend(v10, "supportsCapabilities:", 0x80000);
    }
    else
    {
      -[CKConversation sendingService](self, "sendingService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v10 == v11;

    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (void)repositionSticker:(id)a3 associatedChatItem:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(27);
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "repositionSticker: [%@]", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
  {
    v11 = v6;
    _CKLogExternal();
  }
  if (-[CKConversation hasLeftGroupChat](self, "hasLeftGroupChat", v11))
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(27);
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_DEBUG, "Failing to send message on a group chat we've left before", buf, 2u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
LABEL_15:
      _CKLog();
  }
  else
  {
    if (!-[CKConversation isReadOnlyChat](self, "isReadOnlyChat"))
    {
      -[IMChat repositionSticker:associatedChatItem:](self->_chat, "repositionSticker:associatedChatItem:", v6, v7);
      goto LABEL_25;
    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(27);
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_DEBUG, "Failing to send message on a read only chat", buf, 2u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      goto LABEL_15;
  }
LABEL_25:

}

- (void)sendPendingSatelliteMessages
{
  -[IMChat sendPendingSatelliteMessages](self->_chat, "sendPendingSatelliteMessages");
}

- (void)fetchIncomingPendingMessagesOverSatellite
{
  -[IMChat fetchIncomingPendingMessagesOverSatellite](self->_chat, "fetchIncomingPendingMessagesOverSatellite");
}

- (BOOL)_allowedToSendTypingIndicators
{
  void *v4;
  char v5;

  if (-[CKConversation isIgnoringTypingUpdates](self, "isIgnoringTypingUpdates")
    || !CKIsRunningInMessagesOrSpringBoard()
    && !CKIsRunningInMessagesNotificationViewService()
    && (IMIsRunningInMessagesComposeViewService() & 1) == 0
    && !CKIsRunningInMessagesNotificationExtension())
  {
    return 0;
  }
  -[CKConversation chat](self, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsSendingTypingIndicators");

  return v5;
}

- (void)setLocalUserIsComposing:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[CKConversation _allowedToSendTypingIndicators](self, "_allowedToSendTypingIndicators"))
  {
    -[CKConversation chat](self, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocalUserIsComposing:", v5);

  }
}

- (void)setLocalUserIsComposing:(id)a3 typingIndicatorIcon:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[CKConversation _allowedToSendTypingIndicators](self, "_allowedToSendTypingIndicators"))
  {
    -[CKConversation chat](self, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocalUserIsComposing:typingIndicatorData:", v8, v6);

  }
}

- (NSString)localUserIsComposing
{
  void *v2;
  void *v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localUserIsComposing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLocalUserIsTyping:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[CKConversation _allowedToSendTypingIndicators](self, "_allowedToSendTypingIndicators"))
  {
    -[CKConversation chat](self, "chat");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocalUserIsTyping:", v3);

  }
}

- (BOOL)localUserIsTyping
{
  void *v2;
  char v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "localUserIsTyping");

  return v3;
}

- (void)setLocalUserIsRecording:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[CKConversation _allowedToSendTypingIndicators](self, "_allowedToSendTypingIndicators"))
  {
    -[CKConversation chat](self, "chat");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocalUserIsRecording:", v3);

  }
}

- (BOOL)localUserIsRecording
{
  void *v2;
  char v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "localUserIsRecording");

  return v3;
}

- (void)updateUserActivity
{
  void *v3;
  void *v4;
  id v5;

  if (-[CKConversation isPending](self, "isPending"))
  {
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserActivityForChat:orHandles:", 0, 0);
  }
  else
  {
    -[CKConversation chat](self, "chat");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CKConversation handles](self, "handles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserActivityForChat:orHandles:", v5, v3);

  }
}

- (void)_clearTypingIndicatorsIfNecessary
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  id v7;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "localUserIsTyping");

  if (v4)
  {
    -[CKConversation chat](self, "chat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsSendingTypingIndicators");

    if ((v6 & 1) == 0)
    {
      -[CKConversation chat](self, "chat");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLocalUserIsTyping:", 0);

    }
  }
}

- (NSString)senderIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastAddressedHandleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
    return (NSString *)v4;
  if (v4 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[CKConversation chat](self, "chat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v10;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "lastAddressedHandleID is empty but not nil for chat %@", (uint8_t *)&v17, 0xCu);

    }
  }
  -[CKConversation chat](self, "chat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversation sendingService](self, "sendingService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bestActiveAccountForService:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v12, "strippedLogin");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CKConversation senderIdentifier].cold.1((uint64_t)v12, self, v16);

  }
  return (NSString *)v15;
}

- (BOOL)shouldShowCharacterCount
{
  BOOL v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  char v8;

  if (!-[CKConversation isStewieConversation](self, "isStewieConversation"))
  {
    -[CKConversation sendingService](self, "sendingService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversation recipientStrings](self, "recipientStrings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "__ck_isSMS"))
    {
      v6 = -[CKConversation _sms_supportsCharacterCountForAddresses:](self, "_sms_supportsCharacterCountForAddresses:", v5);
    }
    else
    {
      if ((objc_msgSend(v4, "__ck_isiMessageLite") & 1) != 0
        || (objc_msgSend(v4, "__ck_isSatelliteSMS") & 1) != 0
        || (-[CKConversation chat](self, "chat"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v7, "shouldDisplayOffGridModeStatus"),
            v7,
            (v8 & 1) != 0))
      {
        v3 = 1;
        goto LABEL_10;
      }
      v6 = -[CKConversation _iMessage_supportsCharacterCountForAddresses:](self, "_iMessage_supportsCharacterCountForAddresses:", v5);
    }
    v3 = v6;
LABEL_10:

    return v3;
  }
  return 1;
}

- (unint64_t)disclosureAtomStyle
{
  return 2 * CKIsRunningInFullCKClient();
}

- (NSString)rawAddressedName
{
  return (NSString *)-[CKConversation nameWithRawAddresses:](self, "nameWithRawAddresses:", 1);
}

- (NSString)searchDisplayName
{
  uint64_t v3;

  if (+[CKConversation isSMSSpamFilteringEnabled](CKConversation, "isSMSSpamFilteringEnabled"))
    v3 = 65792;
  else
    v3 = 0x10000;
  return (NSString *)-[IMChat displayNameWithDescriptor:](self->_chat, "displayNameWithDescriptor:", v3, 3);
}

- (void)setDisplayName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKConversation chat](self, "chat");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayName:", v4);

}

- (BOOL)isPreviewTextForAttachment
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastFinishedMessageItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isCorrupt") & 1) != 0
    || (objc_msgSend(v4, "retractedPartIndexes"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    v7 = 0;
  }
  else
  {
    -[CKConversation chat](self, "chat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastFinishedMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_7;
    objc_msgSend(v10, "balloonBundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12
      || (-[CKConversation chat](self, "chat"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "__ck_previewTextWithChat:ignorePluginContent:", v13, 1),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "length"),
          v14,
          v13,
          !v15))
    {
LABEL_7:
      v7 = 0;
    }
    else
    {
      objc_msgSend(v10, "plainBody");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", *MEMORY[0x1E0D362F8], &stru_1E276D870);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "messageSubject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "string");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v19, "length");
      if (v22 | objc_msgSend(v21, "length"))
        v7 = 0;
      else
        v7 = (objc_msgSend(v10, "flags") & 0x1000000) == 0;

    }
  }

  return v7;
}

- (BOOL)shouldReloadPreviewTextForGeneratedAdaptiveImageGlyphWithFileTransferGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSAttributedString *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSAttributedString *previewText;
  BOOL v15;
  _QWORD aBlock[4];
  id v18;

  v4 = a3;
  -[CKConversation chat](self, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastFinishedMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileTransferGUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v4);

  if (!v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "associatedMessagePartText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __92__CKConversation_shouldReloadPreviewTextForGeneratedAdaptiveImageGlyphWithFileTransferGUID___block_invoke;
      aBlock[3] = &unk_1E2750760;
      v18 = v11;
      v12 = v11;
      v13 = _Block_copy(aBlock);
      if (objc_msgSend(v10, "__im_containsAdaptiveImageGlyphFileTransfersUsingFileTransferProvider:", v13))
      {
        previewText = self->_previewText;
        self->_previewText = 0;

        goto LABEL_6;
      }

    }
    v15 = 0;
    goto LABEL_9;
  }
  v9 = self->_previewText;
  self->_previewText = 0;

LABEL_6:
  v15 = 1;
LABEL_9:

  return v15;
}

uint64_t __92__CKConversation_shouldReloadPreviewTextForGeneratedAdaptiveImageGlyphWithFileTransferGUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "transferForGUID:", a2);
}

- (NSSet)mergedPinningIdentifiers
{
  void *v2;
  void *v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergedPinningIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (BOOL)isPinned
{
  void *v2;
  char v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPinned");

  return v3;
}

- (char)buttonColor
{
  void *v3;
  char v4;

  -[CKConversation sendingService](self, "sendingService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKConversation isStewieConversation](self, "isStewieConversation"))
  {
    v4 = 12;
  }
  else if (-[CKConversation isBusinessConversation](self, "isBusinessConversation"))
  {
    v4 = 6;
  }
  else
  {
    v4 = objc_msgSend(v3, "__ck_displayColor");
  }

  return v4;
}

- (char)outgoingBubbleColor
{
  void *v3;
  char v4;

  -[CKConversation sendingService](self, "sendingService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKConversation isStewieConversation](self, "isStewieConversation"))
  {
    v4 = 12;
  }
  else if (-[CKConversation isBusinessConversation](self, "isBusinessConversation"))
  {
    v4 = 6;
  }
  else
  {
    v4 = objc_msgSend(v3, "__ck_displayColor");
  }

  return v4;
}

- (NSString)serviceDisplayName
{
  void *v2;
  void *v3;

  -[CKConversation sendingService](self, "sendingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__ck_displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_nameForHandle:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isLoginIMHandle"))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ME"), &stru_1E276D870, CFSTR("ChatKit"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "_displayNameWithAbbreviation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "length"))
    {
      CKFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Unknown"), &stru_1E276D870, CFSTR("ChatKit"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v5 = v4;
    v4 = v5;
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (id)_headerTitleForService:(id)a3 shouldListParticipants:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  __CFString *v30;

  v6 = a3;
  -[CKConversation handles](self, "handles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = objc_msgSend(v6, "__ck_isSMS");

  if (v9)
  {
    -[CKConversation lastAddressedHandle](self, "lastAddressedHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversation lastAddressedSIMID](self, "lastAddressedSIMID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D35918], "mmsEnabledforPhoneNumber:simID:", v10, v11)
      && (unint64_t)objc_msgSend(v7, "count") >= 2
      && objc_msgSend(MEMORY[0x1E0D39730], "IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:simID:", v10, v11))
    {
      if (a4)
      {
        -[CKConversation name](self, "name");
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_28:
        v17 = (void *)v12;
        goto LABEL_18;
      }
      v25 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("GROUP_PEOPLE_COUNT"), &stru_1E276D870, CFSTR("ChatKit"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringWithFormat:", v27, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "userInterfaceLayoutDirection");

      if (v29 == 1)
        v30 = CFSTR("\u200F");
      else
        v30 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v30, "stringByAppendingString:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((unint64_t)objc_msgSend(v7, "count") < 2)
      {
        objc_msgSend(v7, "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversation _nameForHandle:](self, "_nameForHandle:", v14);
      }
      else
      {
        CKFrameworkBundle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OUTGOING"), &stru_1E276D870, CFSTR("ChatKit"));
      }
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v15;

LABEL_18:
LABEL_22:

    v10 = v17;
    goto LABEL_23;
  }
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    -[CKConversation businessHandle](self, "businessHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      -[CKConversation businessHandle](self, "businessHandle");
    else
      objc_msgSend(v7, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversation _nameForHandle:](self, "_nameForHandle:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  -[CKConversation displayName](self, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CKConversation hasDisplayName](self, "hasDisplayName"))
  {
    if (!a4)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("GROUP_PEOPLE_COUNT"), &stru_1E276D870, CFSTR("ChatKit"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithFormat:", v21, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "userInterfaceLayoutDirection");

      if (v23 == 1)
        v24 = CFSTR("\u200F");
      else
        v24 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v24, "stringByAppendingString:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    -[CKConversation name](self, "name");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v17 = (void *)v13;
    goto LABEL_22;
  }
LABEL_23:

  return v10;
}

- (id)_headerTitleForPendingMediaObjects:(id)a3 subject:(id)a4 onService:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  const __CFString *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  char v31;
  void *v32;
  id obj;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CKConversation isBusinessConversation](self, "isBusinessConversation"))
  {
    -[CKConversation businessHandle](self, "businessHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = (void *)v12;
    goto LABEL_24;
  }
  if (objc_msgSend(v10, "__ck_isiMessage"))
  {
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NEW_MADRID_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[CKConversation pendingHandles](self, "pendingHandles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation lastAddressedHandle](self, "lastAddressedHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation lastAddressedSIMID](self, "lastAddressedSIMID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "__ck_isRCS") && (unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0D39728], "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "groupMessagingEnabledForPhoneNumber:simID:", v14, v15);

    CKFrameworkBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v19 = CFSTR("NEW_BROADCAST_MESSAGE");
      goto LABEL_17;
    }
    goto LABEL_9;
  }
  if (!objc_msgSend(v10, "__ck_isSMS")
    || !objc_msgSend(MEMORY[0x1E0D35918], "mmsEnabledforPhoneNumber:simID:", v14, v15))
  {
    goto LABEL_21;
  }
  if ((unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    v20 = objc_msgSend(MEMORY[0x1E0D39730], "IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:simID:", v14, v15);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isLazuliEnabled");

    if (v20)
    {
      CKFrameworkBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        v19 = CFSTR("NEW_MMS_GROUP");
        goto LABEL_17;
      }
LABEL_9:
      v19 = CFSTR("NEW_GROUP_MESSAGE");
LABEL_17:
      v23 = v18;
      goto LABEL_22;
    }
    if (v22)
    {
      CKFrameworkBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v23;
      v19 = CFSTR("NEW_BROADCAST_MESSAGE");
      goto LABEL_22;
    }
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isLazuliEnabled");

  if ((v25 & 1) != 0)
    goto LABEL_21;
  if (!objc_msgSend(v8, "count") && !objc_msgSend(v9, "length"))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v11;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v27)
    {
      v28 = v27;
      v34 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v36 != v34)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "ID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "_appearsToBeEmail");

          if ((v31 & 1) != 0)
          {
            CKFrameworkBundle();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("NEW_MMS_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_23;
          }
        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v28)
          continue;
        break;
      }
    }

LABEL_21:
    CKFrameworkBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v23;
    v19 = CFSTR("NEW_MESSAGE");
    goto LABEL_22;
  }
  CKFrameworkBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v23;
  v19 = CFSTR("NEW_MMS_MESSAGE");
LABEL_22:
  objc_msgSend(v23, "localizedStringForKey:value:table:", v19, &stru_1E276D870, CFSTR("ChatKit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
LABEL_24:

  return v13;
}

- (id)displayNameForMediaObjects:(id)a3 subject:(id)a4 shouldListParticipants:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[CKConversation sendingService](self, "sendingService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKConversation isPending](self, "isPending"))
    -[CKConversation _headerTitleForPendingMediaObjects:subject:onService:](self, "_headerTitleForPendingMediaObjects:subject:onService:", v8, v9, v10);
  else
    -[CKConversation _headerTitleForService:shouldListParticipants:](self, "_headerTitleForService:shouldListParticipants:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)copyForPendingConversation
{
  CKPendingConversation *v3;
  void *v4;
  CKPendingConversation *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = [CKPendingConversation alloc];
  -[CKConversation chat](self, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CKConversation initWithChat:](v3, "initWithChat:", v4);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[CKConversation chat](self, "chat");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Created pending conversation for chat: %@", (uint8_t *)&v9, 0xCu);

    }
  }
  return v5;
}

- (BOOL)deletingIncomingMessages
{
  void *v2;
  char v3;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDeletingIncomingMessages");

  return v3;
}

- (void)updateDeletingIncomingMessages:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKConversation chat](self, "chat");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeletingIncomingMessages:", v3);

}

- (BOOL)isKnownSender
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFiltered");

  -[CKConversation chat](self, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "containsMessageFromContactOrMe") || v4 > 1)
  {
    if (!v4)
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_7:
    -[CKConversation chat](self, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "hasKnownParticipantsCache");

    goto LABEL_9;
  }
  v6 = 1;
  if (-[CKConversation wasDetectedAsSMSCategory](self, "wasDetectedAsSMSCategory") && v4)
    goto LABEL_7;
LABEL_9:

  if (!self->_hasSetWasKnownSender)
  {
    self->_hasSetWasKnownSender = 1;
    self->_wasKnownSender = v6;
  }
  return v6;
}

- (void)updateWasKnownSender
{
  void *v3;
  char v4;

  if (-[CKConversation _unknownFilteringEnabled](self, "_unknownFilteringEnabled"))
  {
    -[CKConversation _conversationList](self, "_conversationList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isHoldingWasKnownSenderUpdates");

    if ((v4 & 1) == 0)
      self->_wasKnownSender = -[CKConversation isKnownSender](self, "isKnownSender");
  }
}

- (BOOL)wasKnownSender
{
  return self->_wasKnownSender;
}

- (BOOL)hasSetWasKnownSender
{
  return self->_hasSetWasKnownSender;
}

- (BOOL)_unknownFilteringEnabled
{
  return CKMessageUnknownFilteringEnabled() != 0;
}

- (NSString)conversationListCollectionViewPinnedItemIdentifier
{
  NSString *conversationListCollectionViewPinnedItemIdentifier;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  NSString *v9;
  NSString *v10;

  conversationListCollectionViewPinnedItemIdentifier = self->_conversationListCollectionViewPinnedItemIdentifier;
  if (!conversationListCollectionViewPinnedItemIdentifier)
  {
    -[CKConversation chat](self, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "guid");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = &stru_1E276D870;
    if (v5)
      v7 = (__CFString *)v5;
    v8 = v7;

    objc_msgSend(CFSTR("pinned-"), "stringByAppendingString:", v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    v10 = self->_conversationListCollectionViewPinnedItemIdentifier;
    self->_conversationListCollectionViewPinnedItemIdentifier = v9;

    conversationListCollectionViewPinnedItemIdentifier = self->_conversationListCollectionViewPinnedItemIdentifier;
  }
  return conversationListCollectionViewPinnedItemIdentifier;
}

- (NSString)conversationListCollectionViewJunkItemIdentifier
{
  NSString *conversationListCollectionViewJunkItemIdentifier;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  NSString *v9;
  NSString *v10;

  conversationListCollectionViewJunkItemIdentifier = self->_conversationListCollectionViewJunkItemIdentifier;
  if (!conversationListCollectionViewJunkItemIdentifier)
  {
    -[CKConversation chat](self, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "guid");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = &stru_1E276D870;
    if (v5)
      v7 = (__CFString *)v5;
    v8 = v7;

    objc_msgSend(CFSTR("junk-"), "stringByAppendingString:", v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    v10 = self->_conversationListCollectionViewJunkItemIdentifier;
    self->_conversationListCollectionViewJunkItemIdentifier = v9;

    conversationListCollectionViewJunkItemIdentifier = self->_conversationListCollectionViewJunkItemIdentifier;
  }
  return conversationListCollectionViewJunkItemIdentifier;
}

- (NSString)conversationListCollectionViewRecentlyDeletedListItemIdentifier
{
  NSString *conversationListCollectionViewRecentlyDeletedListItemIdentifier;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  NSString *v9;
  NSString *v10;

  conversationListCollectionViewRecentlyDeletedListItemIdentifier = self->_conversationListCollectionViewRecentlyDeletedListItemIdentifier;
  if (!conversationListCollectionViewRecentlyDeletedListItemIdentifier)
  {
    -[CKConversation chat](self, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "guid");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = &stru_1E276D870;
    if (v5)
      v7 = (__CFString *)v5;
    v8 = v7;

    objc_msgSend(CFSTR("recoverable-"), "stringByAppendingString:", v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    v10 = self->_conversationListCollectionViewRecentlyDeletedListItemIdentifier;
    self->_conversationListCollectionViewRecentlyDeletedListItemIdentifier = v9;

    conversationListCollectionViewRecentlyDeletedListItemIdentifier = self->_conversationListCollectionViewRecentlyDeletedListItemIdentifier;
  }
  return conversationListCollectionViewRecentlyDeletedListItemIdentifier;
}

- (BOOL)isBlockedByCommunicationLimits
{
  void *v2;
  void *v3;
  int v4;

  -[CKConversation chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "allowedToShowConversationSync") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)prepareForRecoverableDeletionWithDeleteDate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  CKDetailsContactsManager *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "moving all messages before date: %@ to recently deleted", (uint8_t *)&v14, 0xCu);
    }

  }
  -[CKConversation chat](self, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isBusinessChat"))
    objc_msgSend(v6, "deleteExtensionPayloadData");
  if (!-[CKConversation isGroupConversation](self, "isGroupConversation"))
  {
    -[CKConversation recipient](self, "recipient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rawAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (!v9)
    {
      v10 = objc_alloc_init(CKDetailsContactsManager);
      -[CKConversation recipient](self, "recipient");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rawAddress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsContactsManager setPreferredCallService:forID:](v10, "setPreferredCallService:forID:", 0, v12);

    }
  }
  +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDraft:forConversation:", 0, self);

  -[CKConversation _invalidateApplicationSnapshotIfNeeded](self, "_invalidateApplicationSnapshotIfNeeded");
}

- (void)recoverableDeleteAllMessagesGivenDeleteDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKConversation prepareForRecoverableDeletionWithDeleteDate:](self, "prepareForRecoverableDeletionWithDeleteDate:", v4);
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation chat](self, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveMessagesInChatsToRecentlyDeleted:deleteDate:synchronously:completionHandler:", v7, v4, 0, &__block_literal_global_270_0);

}

void __62__CKConversation_recoverableDeleteAllMessagesGivenDeleteDate___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateRecoverableMessagesMetadataSynchronously:completionHandler:", 0, 0);

}

- (void)_invalidateApplicationSnapshotIfNeeded
{
  NSObject *v2;
  id v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[CKConversation _invalidateApplicationSnapshotIfNeeded]";
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "%s requesting purge of default snapshot", (uint8_t *)&v4, 0xCu);
    }

  }
  v3 = objc_alloc_init(MEMORY[0x1E0DAAD88]);
  objc_msgSend(v3, "deleteSnapshotsForApplicationIdentifier:", CFSTR("com.apple.MobileSMS"));
  objc_msgSend(v3, "invalidate");

}

- (id)recipientEmailAddresses
{
  void *v3;
  void *v4;
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CKConversation recipientStrings](self, "recipientStrings", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if (IMStringIsEmail())
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)recipientPhoneNumbers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CKConversation recipientStrings](self, "recipientStrings", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (MEMORY[0x193FF3B1C](v9))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)_conversationList
{
  return +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
}

- (id)contactNameByHandle
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CKConversation recipients](self, "recipients", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "defaultIMHandle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "ID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "fullName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "length") && objc_msgSend(v11, "length"))
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)allowsMentions
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  void *v9;
  BOOL v10;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "platformSupportsMentioning");

  if (!v4)
    return 0;
  -[CKConversation chat](self, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKConversation chat](self, "chat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsCapabilities:", 128);

    return v7;
  }
  -[CKConversation sendingService](self, "sendingService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "__ck_isSMS"))
  {
    v10 = -[CKConversation isGroupConversation](self, "isGroupConversation");

    if (!v10)
      return 0;
  }
  else
  {

  }
  if (-[CKConversation isStewieConversation](self, "isStewieConversation"))
    return 0;
  return !-[CKConversation isBusinessConversation](self, "isBusinessConversation");
}

- (void)updateKeyTransparencyStatusForChatParticipantsDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isKeyTransparencyEnabled");

  if (v6)
  {
    v7 = objc_msgSend(v4, "ktStatus");
    objc_msgSend(v4, "fetchKTStatus");
    v8 = objc_msgSend(v4, "keyTransparencyStatusForAffectedHandles:", 0);
    if (v7 != v8)
    {
      v9 = v8;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v12 = 134218240;
          v13 = v7;
          v14 = 2048;
          v15 = v9;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "chat participants changed status %lu->%lu: sending status change notification", (uint8_t *)&v12, 0x16u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "__mainThreadPostNotificationName:object:", *MEMORY[0x1E0D353E8], self);

    }
  }

}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (NSString)selectedLastAddressedHandle
{
  return self->_selectedLastAddressedHandle;
}

- (void)setSelectedLastAddressedHandle:(id)a3
{
  objc_storeStrong((id *)&self->_selectedLastAddressedHandle, a3);
}

- (NSString)selectedLastAddressedSIMID
{
  return self->_selectedLastAddressedSIMID;
}

- (void)setSelectedLastAddressedSIMID:(id)a3
{
  objc_storeStrong((id *)&self->_selectedLastAddressedSIMID, a3);
}

- (NSSet)pendingRecipients
{
  return self->_pendingRecipients;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSAttributedString)groupName
{
  return self->_groupName;
}

- (void)setPreviewText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (BOOL)allowedByPersonListInActiveFocus
{
  return self->_allowedByPersonListInActiveFocus;
}

- (void)setWasDetectedAsSMSSpam:(int)a3
{
  self->_wasDetectedAsSMSSpam = a3;
}

- (void)setWasDetectedAsSMSCategory:(int)a3
{
  self->_wasDetectedAsSMSCategory = a3;
}

- (void)setWasDetectedAsiMessageSpam:(int)a3
{
  self->_wasDetectedAsiMessageSpam = a3;
}

- (void)setWasDetectedAsSpam:(int)a3
{
  self->_wasDetectedAsSpam = a3;
}

- (BOOL)shouldShowGroupPhotoUpdateBanner
{
  return self->_shouldShowGroupPhotoUpdateBanner;
}

- (void)setShouldShowGroupPhotoUpdateBanner:(BOOL)a3
{
  self->_shouldShowGroupPhotoUpdateBanner = a3;
}

- (BOOL)shouldShowGroupNameUpdateBanner
{
  return self->_shouldShowGroupNameUpdateBanner;
}

- (void)setShouldShowGroupNameUpdateBanner:(BOOL)a3
{
  self->_shouldShowGroupNameUpdateBanner = a3;
}

- (NSString)groupIdentityUpdateHandleID
{
  return self->_groupIdentityUpdateHandleID;
}

- (void)setGroupIdentityUpdateHandleID:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentityUpdateHandleID, a3);
}

- (BOOL)wantsLabelForDSDSCached
{
  return self->_wantsLabelForDSDSCached;
}

- (BOOL)hasCachedWantsLabelForDSDS
{
  return self->_hasCachedWantsLabelForDSDS;
}

- (unsigned)limitToLoad
{
  return self->_limitToLoad;
}

- (void)setLimitToLoad:(unsigned int)a3
{
  self->_limitToLoad = a3;
}

- (NSArray)pendingHandles
{
  return self->_pendingHandles;
}

- (void)setBusinessHandle:(id)a3
{
  objc_storeStrong((id *)&self->_businessHandle, a3);
}

- (NSNumber)chatBot
{
  return self->_chatBot;
}

- (void)setChatBot:(id)a3
{
  objc_storeStrong((id *)&self->_chatBot, a3);
}

- (BOOL)isDeletingIncomingMessages
{
  return self->_deletingIncomingMessages;
}

- (BOOL)shouldHoldInUnreadFilter
{
  return self->_holdInUnreadFilter;
}

- (void)setHoldInUnreadFilter:(BOOL)a3
{
  self->_holdInUnreadFilter = a3;
}

- (void)setConversationListCollectionViewPinnedItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_conversationListCollectionViewPinnedItemIdentifier, a3);
}

- (void)setConversationListCollectionViewListItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_conversationListCollectionViewListItemIdentifier, a3);
}

- (void)setConversationListCollectionViewJunkItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_conversationListCollectionViewJunkItemIdentifier, a3);
}

- (void)setConversationListCollectionViewRecentlyDeletedListItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_conversationListCollectionViewRecentlyDeletedListItemIdentifier, a3);
}

- (BOOL)shouldElevateCheckIn
{
  return self->_elevateCheckIn;
}

- (void)setElevateCheckIn:(BOOL)a3
{
  self->_elevateCheckIn = a3;
}

- (void)setHasLoadedAllMessages:(BOOL)a3
{
  self->_hasLoadedAllMessages = a3;
}

- (BOOL)isReportedAsSpam
{
  return self->_isReportedAsSpam;
}

- (void)setIsReportedAsSpam:(BOOL)a3
{
  self->_isReportedAsSpam = a3;
}

- (NSNumber)businessConversation
{
  return self->_businessConversation;
}

- (void)setBusinessConversation:(id)a3
{
  objc_storeStrong((id *)&self->_businessConversation, a3);
}

- (NSNumber)mapKitBusinessConversation
{
  return self->_mapKitBusinessConversation;
}

- (void)setMapKitBusinessConversation:(id)a3
{
  objc_storeStrong((id *)&self->_mapKitBusinessConversation, a3);
}

- (NSDate)dateLastViewed
{
  return self->_dateLastViewed;
}

- (void)setDateLastViewed:(id)a3
{
  objc_storeStrong((id *)&self->_dateLastViewed, a3);
}

- (void)setWasKnownSender:(BOOL)a3
{
  self->_wasKnownSender = a3;
}

- (void)setHasSetWasKnownSender:(BOOL)a3
{
  self->_hasSetWasKnownSender = a3;
}

- (CKVisualGroupIdentity)_conversationVisualIdentity
{
  return self->__conversationVisualIdentity;
}

- (void)set_conversationVisualIdentity:(id)a3
{
  objc_storeStrong((id *)&self->__conversationVisualIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__conversationVisualIdentity, 0);
  objc_storeStrong((id *)&self->_dateLastViewed, 0);
  objc_storeStrong((id *)&self->_mapKitBusinessConversation, 0);
  objc_storeStrong((id *)&self->_businessConversation, 0);
  objc_storeStrong((id *)&self->_conversationListCollectionViewRecentlyDeletedListItemIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationListCollectionViewJunkItemIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationListCollectionViewListItemIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationListCollectionViewPinnedItemIdentifier, 0);
  objc_storeStrong((id *)&self->_chatBot, 0);
  objc_storeStrong((id *)&self->_businessHandle, 0);
  objc_storeStrong((id *)&self->_pendingHandles, 0);
  objc_storeStrong((id *)&self->_groupIdentityUpdateHandleID, 0);
  objc_storeStrong((id *)&self->_previewText, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pendingRecipients, 0);
  objc_storeStrong((id *)&self->_selectedLastAddressedSIMID, 0);
  objc_storeStrong((id *)&self->_selectedLastAddressedHandle, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_chat, 0);
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  return (NSArray *)&unk_1E286F610;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;

  v5 = (void (**)(id, void *, _QWORD))a4;
  -[CKConversation chat](self, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v8, 0);
  return 0;
}

+ (BOOL)_iMessage_canAcceptMediaObjectType:(int)a3 givenMediaObjects:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _OWORD v19[3];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  memset(v19, 0, 44);
  ++*((_DWORD *)v19 + a3);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "mediaType");
        ++*((_DWORD *)v19 + v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  v12 = objc_msgSend(a1, "_iMessage_canSendMessageWithMediaObjectTypes:", v19);

  return v12;
}

+ (int64_t)_iMessage_maxAttachmentCount
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_iMessage_supportsCharacterCountForAddresses:(id)a3
{
  return 0;
}

+ (BOOL)_iMessage_canSendMessageWithMediaObjectTypes:(int *)a3 errorCode:(int64_t *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  NSObject *v13;
  const __CFString *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t buf[4];
  int64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v5 = 0;
  v6 = 0;
  v25 = *MEMORY[0x1E0C80C00];
  do
    v6 += a3[v5++];
  while (v5 != 11);
  v7 = objc_msgSend(a1, "_iMessage_maxAttachmentCount");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
    v9 = 1;
  }
  else
  {
    v10 = v7;
    v9 = v6 <= v7;
    if (v6 > v7)
      v8 = 2001;
    else
      v8 = 0;
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(24);
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        if (v6 <= v10)
          v12 = CFSTR("YES");
        v20 = (int64_t)v12;
        v21 = 2048;
        v22 = v6;
        v23 = 2048;
        v24 = v10;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_DEBUG, "(iMessage) Accept: %@: total count: %ld, max attachment count: %ld", buf, 0x20u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      _CKLog();
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = CFSTR("NO");
      if (v9)
        v14 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v20 = (int64_t)v14;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_DEBUG, "(iMessage) Accept: %@", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    _CKLog();
  if (a4)
    v15 = v9;
  else
    v15 = 1;
  if ((v15 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(24);
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v20 = v8;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_DEBUG, "(iMessage) Error code: %ld", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      _CKLog();
    *a4 = v8;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_DEBUG, "---------", buf, 2u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    _CKLog();
  return v9;
}

+ (BOOL)_iMessage_canSendMessageWithMediaObjectTypes:(int *)a3
{
  return objc_msgSend(a1, "_iMessage_canSendMessageWithMediaObjectTypes:errorCode:", a3, 0);
}

+ (BOOL)_iMessage_canSendComposition:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5 currentService:(id)a6 forceSMS:(BOOL)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  int v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _DWORD v39[14];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (CKIsRunningInFullCKClient()
    && !CKIsRunningUnitTests()
    && !CKIsRunningUITests()
    && !CKIsRunningForDevelopmentOnSimulator()
    && !objc_msgSend(MEMORY[0x1E0D35918], "iMessageEnabledForSenderLastAddressedHandle:simID:previousService:", v14, v15, v16))
  {
    LOBYTE(v27) = 0;
    v28 = 3001;
    if (!a8)
      goto LABEL_23;
    goto LABEL_19;
  }
  v17 = v16;
  v18 = v15;
  v19 = v14;
  memset(v39, 0, 44);
  v20 = v13;
  objc_msgSend(v13, "mediaObjects", a8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(v21);
        v26 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "mediaType");
        ++v39[v26];
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v23);
  }
  if (objc_msgSend(v21, "count"))
  {
    v33 = 0;
    v27 = objc_msgSend(a1, "_iMessage_canSendMessageWithMediaObjectTypes:errorCode:", v39, &v33);
    if (v27)
      v28 = 0;
    else
      v28 = v33;
  }
  else
  {
    v28 = 0;
    LOBYTE(v27) = 1;
  }

  v14 = v19;
  v15 = v18;
  v16 = v17;
  a8 = v32;
  v13 = v20;
  if (v32)
  {
LABEL_19:
    if ((v27 & 1) == 0)
    {
      objc_msgSend(a1, "_iMessage_localizedErrorForReason:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
        *a8 = objc_retainAutorelease(v29);

    }
  }
LABEL_23:

  return v27;
}

+ (id)_iMessage_localizedErrorForReason:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v3 = (void *)a3;
  v16 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      return v3;
    case 2001:
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(44);
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v15 = 2001;
          _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_DEBUG, "iMessage: Not handing back error for too many attachments: %ld", buf, 0xCu);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        v13 = 2001;
        _CKLog();
      }
      break;
    case 3001:
      CKFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ERR_NEED_IMESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    default:
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(44);
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v15 = (uint64_t)v3;
          _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_DEBUG, "iMessage: Not handing back error with: %ld", buf, 0xCu);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        v13 = (uint64_t)v3;
        _CKLog();
      }
      break;
  }
  v5 = 0;
LABEL_20:
  v8 = CKShowInternalErrors();
  v9 = v8;
  if (v5 || v8)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v5)
    {
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n[INTERNAL]\niMessage Content Error: %ld"), v5, v3);
        v11 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v11;
      }
      objc_msgSend(v10, "setObject:forKey:", v5, *MEMORY[0x1E0CB2D50], v13);
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CKMessageContentErrorDomain"), v3, v10, v13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
    v5 = 0;
  }

  return v3;
}

- (BOOL)_iMessage_canSendToRecipients:(id)a3 alertIfUnable:(BOOL)a4
{
  return 1;
}

+ (unint64_t)_iMessage_maxTransferFileSizeForWiFi:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v9;
  unint64_t v10;

  v3 = a3;
  v9 = 0;
  v10 = 0;
  if (!CKIsRunningInMessages()
    && (IMIsRunningInMessagesComposeViewService() & 1) == 0
    && !CKIsRunningInMessagesNotificationViewService()
    && !CKIsRunningInMessagesNotificationExtension()
    || (v4 = (void *)MEMORY[0x1E0D39730],
        objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstanceForBagType:", 1, v9),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "IMiMessageMaxTransferFileSizeForWifiForPhoneNumber:cellSize:serverConfigurationBag:phoneNumber:simID:", &v10, &v9, v5, 0, 0), v5, (v6 = v10) == 0))
  {
    v6 = 10485760;
  }
  v7 = v9;
  if (!v9)
    v7 = 0x200000;
  if (v3)
    return v6;
  else
    return v7;
}

+ (double)_iMessage_maxTrimDurationForMediaType:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void (*v10)(_BYTE *);
  double v11;
  NSObject *v12;
  double (*v13)(_BYTE *);
  double v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v18;
  _BYTE v19[24];
  _BYTE v20[24];
  uint8_t buf[4];
  double v22;
  uint64_t v23;

  v3 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x1E0C80C00];
  if (_iMessage_maxTrimDurationForMediaType___pred_CMTimeGetSecondsCoreMedia != -1)
    dispatch_once(&_iMessage_maxTrimDurationForMediaType___pred_CMTimeGetSecondsCoreMedia, &__block_literal_global_166);
  v5 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "_iMessage_maxTransferFileSizeForWiFi:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObject:forKey:", v6, CFSTR("fileLengthLimit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(19);
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v3;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_DEBUG, "maxTrimDurationForMediaType: %d", buf, 8u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v18 = v3;
    _CKLog();
  }
  if ((_DWORD)v3 == 2)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_DEBUG, "video!", buf, 2u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      _CKLog();
    v13 = (double (*)(_BYTE *))_iMessage_maxTrimDurationForMediaType___CMTimeGetSeconds;
    objc_msgSend(MEMORY[0x1E0C8AFC0], "maximumDurationForPreset:properties:", *MEMORY[0x1E0C89E88], v7, v18);
    v11 = v13(v19);
    goto LABEL_28;
  }
  if ((_DWORD)v3 == 1)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_DEBUG, "audio!", buf, 2u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      _CKLog();
    v10 = (void (*)(_BYTE *))_iMessage_maxTrimDurationForMediaType___CMTimeGetSeconds;
    objc_msgSend(MEMORY[0x1E0C8AFC0], "maximumDurationForPreset:properties:", *MEMORY[0x1E0C89E90], v7, v18);
    v10(v20);
LABEL_28:
    v14 = v11;
    goto LABEL_37;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(19);
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_DEBUG, "default!", buf, 2u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    _CKLog();
  v14 = 9.22337204e18;
LABEL_37:
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(19);
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v22 = v14;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_DEBUG, "Max trim answer: %f", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    _CKLog();

  return v14;
}

void *__75__CKConversation_Content_Utilities___iMessage_maxTrimDurationForMediaType___block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CMTimeGetSeconds", CFSTR("CoreMedia"));
  _iMessage_maxTrimDurationForMediaType___CMTimeGetSeconds = result;
  return result;
}

+ (BOOL)_sms_mediaObjectPassesRestriction:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  int CanBeSent;
  NSObject *v15;
  const __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  CGSize v31;
  CGSize v32;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (objc_msgSend(v3, "mediaType") == 3)
  {
    v6 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v3, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ckImageWithData:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "size");
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v10 = *MEMORY[0x1E0C9D820];
    v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  objc_msgSend(v3, "mimeType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CanBeSent = IMMMSPartCanBeSent();

  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      if (CanBeSent)
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      objc_msgSend(v3, "mimeType");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v31.width = v10;
      v31.height = v12;
      NSStringFromCGSize(v31);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      v26 = 2048;
      v27 = v5;
      v28 = 2112;
      v29 = v18;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_DEBUG, "(MMS) Accept: %@ (MIME Type: %@, length %lu, sz %@)", buf, 0x2Au);

    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    objc_msgSend(v3, "mimeType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32.width = v10;
    v32.height = v12;
    NSStringFromCGSize(v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _CKLog();

  }
  return CanBeSent;
}

+ (int64_t)_sms_maxAttachmentCountForPhoneNumber:(id)a3 simID:(id)a4
{
  return (int)objc_msgSend(MEMORY[0x1E0D39730], "IMMMSMaximumSlideCountForPhoneNumber:simID:", a3, a4);
}

- (BOOL)_sms_willSendMMSByDefaultForAddresses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int IsEmail;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D35918];
  -[CKConversation lastAddressedHandle](self, "lastAddressedHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation lastAddressedSIMID](self, "lastAddressedSIMID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "mmsEnabledforPhoneNumber:simID:", v6, v7);

  if ((_DWORD)v5
    && objc_msgSend(v4, "count")
    && (objc_msgSend(v4, "count") != 1
     || (objc_msgSend(v4, "lastObject"),
         v8 = (void *)objc_claimAutoreleasedReturnValue(),
         IsEmail = IMStringIsEmail(),
         v8,
         IsEmail)))
  {
    if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      v13 = 1;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0D39730];
      -[CKConversation lastAddressedHandle](self, "lastAddressedHandle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversation lastAddressedSIMID](self, "lastAddressedSIMID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:simID:", v11, v12);

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_sms_supportsCharacterCountForAddresses:(id)a3
{
  return !-[CKConversation _sms_willSendMMSByDefaultForAddresses:](self, "_sms_willSendMMSByDefaultForAddresses:", a3);
}

+ (BOOL)_sms_canSendMessageWithMediaObjectTypes:(int *)a3 phoneNumber:(id)a4 simID:(id)a5 errorCode:(int64_t *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  int v20;
  _BOOL4 v21;
  NSObject *v22;
  const __CFString *v23;
  int v24;
  int v25;
  const __CFString *v26;
  double v27;
  NSObject *v28;
  NSObject *v29;
  float v30;
  float v31;
  int v32;
  int v33;
  NSObject *v34;
  const __CFString *v35;
  NSObject *v36;
  const __CFString *v37;
  void *v38;
  char v39;
  NSObject *v40;
  void *v41;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint8_t buf[4];
  double v49;
  __int16 v50;
  _WORD v51[17];

  *(_QWORD *)&v51[13] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = 0;
  LODWORD(v13) = 0;
  do
    v13 = a3[v12++] + (uint64_t)(int)v13;
  while (v12 != 11);
  v14 = objc_msgSend(a1, "_sms_maxAttachmentCountForPhoneNumber:simID:", v10, v11);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_15;
  v15 = v14;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&v17 = COERCE_DOUBLE(CFSTR("YES"));
      *(_DWORD *)buf = 138412802;
      if (v15 < v13)
        *(double *)&v17 = COERCE_DOUBLE(CFSTR("NO"));
      v49 = *(double *)&v17;
      v50 = 1024;
      *(_DWORD *)v51 = v13;
      v51[2] = 2048;
      *(_QWORD *)&v51[3] = v15;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_DEBUG, "(MMS) Accept: %@: total count: %d, max attachment count: %ld", buf, 0x1Cu);
    }

  }
  if (!os_log_shim_legacy_logging_enabled() || !_CKShouldLog())
  {
    if (v15 >= v13)
      goto LABEL_15;
LABEL_19:
    v21 = 0;
    v19 = 2001;
    goto LABEL_63;
  }
  v18 = CFSTR("YES");
  if (v15 < v13)
    v18 = CFSTR("NO");
  v44 = v13;
  v47 = v15;
  v43 = v18;
  _CKLog();
  if (v15 < v13)
    goto LABEL_19;
LABEL_15:
  if (a3[1] >= 1)
  {
    if ((int)v13 <= 1)
    {
      *(double *)&v19 = 0.0;
      v20 = 1;
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  *(double *)&v19 = 0.0;
  v20 = 1;
  if (a3[2] >= 1 && (int)v13 > 1)
  {
LABEL_22:
    v20 = 0;
    v19 = 2004;
  }
LABEL_23:
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&v23 = COERCE_DOUBLE(CFSTR("NO"));
      if (v20)
        *(double *)&v23 = COERCE_DOUBLE(CFSTR("YES"));
      v24 = a3[1];
      v25 = a3[2];
      *(_DWORD *)buf = 138412802;
      v49 = *(double *)&v23;
      v50 = 1024;
      *(_DWORD *)v51 = v13;
      v51[2] = 1024;
      *(_DWORD *)&v51[3] = v25 + v24;
      _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_DEBUG, "(MMS) Accept: %@: total count: %d, avCount: %d", buf, 0x18u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v26 = CFSTR("NO");
    if (v20)
      v26 = CFSTR("YES");
    v44 = v13;
    v47 = (a3[2] + a3[1]);
    v43 = v26;
    _CKLog();
    if ((v20 & 1) == 0)
      goto LABEL_34;
  }
  else if (!v20)
  {
LABEL_34:
    v21 = 0;
    goto LABEL_63;
  }
  *(_QWORD *)&v27 = (int)objc_msgSend(MEMORY[0x1E0D39730], "IMMMSMaximumMessageByteCountForPhoneNumber:simID:", v10, v11, v43, v44, v47);
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v49 = v27;
      _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_DEBUG, "(MMS) Max Message Byte Count: %lld", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    _CKLog();
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v49 = (double)SLODWORD(v27) * 0.95;
      _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_DEBUG, "(MMS) Max Message Byte Count (less backoff): %f", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    _CKLog();
  v30 = (double)SLODWORD(v27) * 0.95 / 10240.0;
  v31 = floorf(v30);
  if (v31 < 1.0)
    v31 = 1.0;
  v32 = (int)v31;
  v33 = a3[3];
  v21 = v33 <= (int)v31;
  if (v33 > (int)v31)
    v19 = 2002;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    OSLogHandleForIMFoundationCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&v35 = COERCE_DOUBLE(CFSTR("NO"));
      *(_DWORD *)buf = 138412802;
      if (v33 <= v32)
        *(double *)&v35 = COERCE_DOUBLE(CFSTR("YES"));
      v49 = *(double *)&v35;
      v50 = 1024;
      *(_DWORD *)v51 = v32;
      v51[2] = 1024;
      *(_DWORD *)&v51[3] = v33;
      _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_DEBUG, "(MMS) Accept: %@: maximumImageCount: %d, asked for %d", buf, 0x18u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    _CKLog();
LABEL_63:
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    OSLogHandleForIMFoundationCategory();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      if (v21)
        *(double *)&v37 = COERCE_DOUBLE(CFSTR("YES"));
      else
        *(double *)&v37 = COERCE_DOUBLE(CFSTR("NO"));
      CKErrorStringForCKMessageContentError(v19);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v49 = *(double *)&v37;
      v50 = 2112;
      *(_QWORD *)v51 = v38;
      _os_log_impl(&dword_18DFCD000, v36, OS_LOG_TYPE_DEBUG, "(MMS) Accept: %@ reason [%@]", buf, 0x16u);

    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    CKErrorStringForCKMessageContentError(v19);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    _CKLog();

  }
  if (a6)
    v39 = v21;
  else
    v39 = 1;
  if ((v39 & 1) == 0)
  {
    *a6 = v19;
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(24);
      OSLogHandleForIMFoundationCategory();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        CKErrorStringForCKMessageContentError(v19);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v49 = *(double *)&v19;
        v50 = 2112;
        *(_QWORD *)v51 = v41;
        _os_log_impl(&dword_18DFCD000, v40, OS_LOG_TYPE_DEBUG, "Error code: %ld description: %@", buf, 0x16u);

      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      CKErrorStringForCKMessageContentError(v19);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      _CKLog();

    }
  }

  return v21;
}

+ (BOOL)_sms_canSendMessageWithMediaObjectTypes:(int *)a3 phoneNumber:(id)a4 simID:(id)a5
{
  return objc_msgSend(a1, "_sms_canSendMessageWithMediaObjectTypes:phoneNumber:simID:errorCode:", a3, a4, a5, 0);
}

+ (BOOL)_sms_canAcceptMediaObjectType:(int)a3 givenMediaObjects:(id)a4 phoneNumber:(id)a5 simID:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  int v17;
  char v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _OWORD v25[3];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  memset(v25, 0, 44);
  ++*((_DWORD *)v25 + a3);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v10);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "mediaType");
        ++*((_DWORD *)v25 + v17);
      }
      v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }
  v18 = objc_msgSend(a1, "_sms_canSendMessageWithMediaObjectTypes:phoneNumber:simID:", v25, v11, v12);

  return v18;
}

+ (BOOL)_sms_canSendComposition:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5 recipientsContainEmail:(BOOL)a6 error:(id *)a7
{
  return objc_msgSend(a1, "_sms_canSendComposition:lastAddressedHandle:lastAddressedSIMID:recipientsContainEmail:skipMMSCheck:error:", a3, a4, a5, a6, 0, a7);
}

+ (BOOL)_sms_canSendComposition:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5 recipientsContainEmail:(BOOL)a6 skipMMSCheck:(BOOL)a7 error:(id *)a8
{
  id v11;
  id v12;
  id v13;
  int v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  char isKindOfClass;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  int v30;
  int v31;
  _BOOL4 v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  const __CFString *v48;
  int v49;
  _BOOL4 v51;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint8_t v72[128];
  uint8_t buf[16];
  _OWORD v74[3];
  uint64_t v75;

  v51 = a6;
  v75 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v49 = objc_msgSend(MEMORY[0x1E0D35918], "mmsEnabledforPhoneNumber:simID:", v12, v13);
  v53 = v12;
  v54 = v13;
  v14 = objc_msgSend(MEMORY[0x1E0D39730], "IMMMSRestrictedModeEnabledForPhoneNumber:simID:", v12, v13);
  memset(v74, 0, 44);
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = CFSTR("NO");
      if (v14)
        v16 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_DEBUG, "(MMS) Restricted Mode Enabled [%@]", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v17 = CFSTR("NO");
    if (v14)
      v17 = CFSTR("YES");
    v48 = v17;
    _CKLog();
  }
  objc_msgSend(v11, "shelfPluginPayload", v48);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v19 = v57;
  if ((isKindOfClass & 1) == 0)
    v19 = 0;
  v56 = v19;
  v20 = objc_msgSend(v56, "shouldSendAsMediaObject");
  if (v20)
  {
    objc_msgSend(v56, "mediaObjectFromPayload");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "compositionByAppendingMediaObject:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v22;
  }
  else
  {
    v23 = v11;
  }
  v55 = v23;
  objc_msgSend(v23, "mediaObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v25 = 0;
  v26 = 0;
  v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v67 != v28)
          objc_enumerationMutation(v24);
        v30 = objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "mediaType");
        ++*((_DWORD *)v74 + v30);
        v25 |= v30 == 2;
        v26 |= v30 == 7;
      }
      v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    }
    while (v27);
  }
  if (objc_msgSend(v24, "count"))
    v31 = 1;
  else
    v31 = v20;
  if ((v31 & 1) != 0)
  {
    v32 = 1;
  }
  else
  {
    objc_msgSend(v55, "subject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v33, "length") != 0;

  }
  if ((v26 & 1) != 0)
  {
    LOBYTE(v34) = 0;
    v35 = 2003;
  }
  else
  {
    LOBYTE(v34) = 1;
    if (!v51 && !v32 || a7)
      goto LABEL_73;
    v34 = v49;
    if (v49)
      v35 = 0;
    else
      v35 = 3000;
    if ((v49 & v31) == 1)
    {
      *(_QWORD *)buf = 0;
      v34 = objc_msgSend(a1, "_sms_canSendMessageWithMediaObjectTypes:phoneNumber:simID:errorCode:", v74, v53, v54, buf);
      if (v34)
        v35 = 0;
      else
        v35 = *(_QWORD *)buf;
    }
    if ((v31 & v34 & v14) == 1)
    {
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v38 = v24;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v63;
        while (2)
        {
          for (j = 0; j != v39; ++j)
          {
            if (*(_QWORD *)v63 != v40)
              objc_enumerationMutation(v38);
            if (!objc_msgSend(a1, "_sms_mediaObjectPassesRestriction:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j)))
            {
              v34 = 0;
              v35 = 2003;
              goto LABEL_58;
            }
          }
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
          if (v39)
            continue;
          break;
        }
      }
      else
      {
        v34 = 1;
      }
LABEL_58:

    }
    if (v34)
    {
      if ((v25 & 1) == 0)
      {
        LOBYTE(v34) = 1;
        goto LABEL_73;
      }
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v42 = v24;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      if (v43)
      {
        v44 = *(_QWORD *)v59;
        do
        {
          for (k = 0; k != v43; ++k)
          {
            if (*(_QWORD *)v59 != v44)
              objc_enumerationMutation(v42);
            v46 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * k);
            if (objc_msgSend(v46, "mediaType") - 1 <= 1
              && !objc_msgSend(a1, "_sms_mediaObjectPassesDurationCheck:", v46))
            {
              v35 = 2005;
              LOBYTE(v34) = 0;
            }
          }
          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
        }
        while (v43);
        LOBYTE(v34) = v34 & 1;
      }
      else
      {
        LOBYTE(v34) = 1;
      }

    }
  }
  if (a8 && (v34 & 1) == 0)
  {
    objc_msgSend(a1, "_sms_localizedErrorForReason:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v36)
      *a8 = objc_retainAutorelease(v36);

    LOBYTE(v34) = 0;
  }
LABEL_73:

  return v34;
}

+ (BOOL)_rcs_canSendComposition:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5 recipientsContainEmail:(BOOL)a6 error:(id *)a7
{
  return objc_msgSend(a1, "_sms_canSendComposition:lastAddressedHandle:lastAddressedSIMID:recipientsContainEmail:skipMMSCheck:error:", a3, a4, a5, a6, 1, a7);
}

+ (id)_sms_localizedErrorForReason:(int64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  id v9;
  uint64_t v10;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v3 = (void *)a3;
  v16 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 2001) >= 5)
  {
    if (!a3)
      return v3;
    if (a3 != 3000)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(44);
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v15 = v3;
          _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_DEBUG, "SMS: Not generating NSError for message content error: %ld", buf, 0xCu);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        v13 = v3;
        _CKLog();
      }
      v6 = 0;
      goto LABEL_4;
    }
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ERR_NEED_MMS"), &stru_1E276D870, CFSTR("ChatKit"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ERR_NEED_IMESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

LABEL_4:
  v7 = CKShowInternalErrors();
  v8 = v7;
  if (v6 || v7)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v6)
    {
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n[INTERNAL]\nSMS Content Error: %ld"), v6, v3);
        v10 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v10;
      }
      objc_msgSend(v9, "setObject:forKey:", v6, *MEMORY[0x1E0CB2D50], v13);
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CKMessageContentErrorDomain"), v3, v9, v13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
    v6 = 0;
  }

  return v3;
}

+ (double)_sms_maxTrimDurationForMediaType:(int)a3
{
  double result;

  if (a3 == 1)
    objc_msgSend(MEMORY[0x1E0D39730], "IMMMSMaximumAudioDurationForPhoneNumber:simID:", 0, 0);
  else
    objc_msgSend(MEMORY[0x1E0D39730], "IMMMSMaximumVideoDurationForPhoneNumber:simID:", 0, 0);
  return result;
}

+ (BOOL)_sms_mediaObjectPassesDurationCheck:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  NSObject *v11;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v4, "duration"),
        v6 = v5,
        objc_msgSend(a1, "_sms_maxTrimDurationForMediaType:", objc_msgSend(v4, "mediaType")),
        v8 = v7,
        v6 >= v7 + 0.00000011920929))
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(44);
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        v13 = v6;
        v14 = 2048;
        v15 = v8;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_DEBUG, "SMS: Media has duration:%f   max: %f", buf, 0x16u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      _CKLog();
    v9 = 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)_sms_canSendToRecipients:(id)a3 alertIfUnable:(BOOL)a4
{
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD block[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  LODWORD(v4) = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0D35918];
  -[CKConversation lastAddressedHandle](self, "lastAddressedHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation lastAddressedSIMID](self, "lastAddressedSIMID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "mmsEnabledforPhoneNumber:simID:", v8, v9);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    v15 = (void *)*MEMORY[0x1E0C966A8];
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v11);
        if ((v10 & 1) == 0)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "propertyType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17 == v15)
          {
            if ((_DWORD)v4)
            {
              CKFrameworkBundle();
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CANNOT_SEND_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
              v4 = (void *)objc_claimAutoreleasedReturnValue();

              CKFrameworkBundle();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ERR_NEED_MMS_TO_EMAIL"), &stru_1E276D870, CFSTR("ChatKit"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v20, 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              CKFrameworkBundle();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v23, 0, 0);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v21, "addAction:", v24);
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __80__CKConversation_SMS_Content_Utilities___sms_canSendToRecipients_alertIfUnable___block_invoke;
              block[3] = &unk_1E274A208;
              v28 = v21;
              v25 = v21;
              dispatch_async(MEMORY[0x1E0C80D38], block);

              LOBYTE(v4) = 0;
            }
            goto LABEL_13;
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v13)
        continue;
      break;
    }
  }
  LOBYTE(v4) = 1;
LABEL_13:

  return (char)v4;
}

void __80__CKConversation_SMS_Content_Utilities___sms_canSendToRecipients_alertIfUnable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "presentFromViewController:animated:completion:", v4, 1, 0);
}

- (BOOL)supportsSurf
{
  void *v4;
  char v5;

  if (-[CKConversation isGroupConversation](self, "isGroupConversation")
    || -[CKConversation isBusinessConversation](self, "isBusinessConversation"))
  {
    return 0;
  }
  -[CKConversation sendingService](self, "sendingService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "__ck_isiMessage");

  return v5;
}

- (BOOL)supportsWaldo
{
  void *v4;
  char v5;

  if (-[CKConversation isBusinessConversation](self, "isBusinessConversation"))
    return 0;
  -[CKConversation sendingService](self, "sendingService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "__ck_isiMessage");

  return v5;
}

- (BOOL)supportsSafetyMonitor
{
  return +[CKCheckInAppVisibilityManager isCheckInVisibleInConversation:](CKCheckInAppVisibilityManager, "isCheckInVisibleInConversation:", self);
}

- (id)activityForNewScene
{
  return -[CKConversation activityForNewSceneCreatedViaDrag:](self, "activityForNewSceneCreatedViaDrag:", 0);
}

- (id)activityForNewSceneCreatedViaDrag:(BOOL)a3
{
  _BOOL4 v3;
  CKSceneDelegateState *v5;
  void *v6;
  CKSceneDelegateState *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v3 = a3;
  v15[2] = *MEMORY[0x1E0C80C00];
  if (_IMWillLog())
  {
    -[CKConversation groupID](self, "groupID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();

  }
  v5 = [CKSceneDelegateState alloc];
  -[CKConversation groupID](self, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKSceneDelegateState initWithUnreadMessages:groupID:composingNewMessage:filterMode:showingInbox:](v5, "initWithUnreadMessages:groupID:composingNewMessage:filterMode:showingInbox:", 0, v6, 0, 0, 0);

  +[CKSceneDelegate userInfoDictionaryForState:](CKSceneDelegate, "userInfoDictionaryForState:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.Messages.StateRestoration"));
    v14[1] = CFSTR("CKSceneInitiationTypeKey");
    v15[0] = &unk_1E28710C8;
    v14[0] = CFSTR("CKCanvasStateRestorationContainerType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", !v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addUserInfoEntriesFromDictionary:", v11);

    objc_msgSend(v9, "addUserInfoEntriesFromDictionary:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isAutoDonatingMessages
{
  return sub_18E64CE74(self, (uint64_t)a2, (SEL *)&selRef_isAutoDonatingMessages);
}

- (void)sendAutoDonationUpdate:(BOOL)a3
{
  _BOOL8 v3;
  CKConversation *v4;
  IMChat *v5;

  v3 = a3;
  v4 = self;
  v5 = -[CKConversation chat](v4, sel_chat);
  -[IMChat sendAutoDonationUpdate:](v5, sel_sendAutoDonationUpdate_, v3);

}

- (BOOL)shouldShowAutoDonationAction
{
  return sub_18E64CE74(self, (uint64_t)a2, (SEL *)&selRef_shouldShowAutoDonationAction);
}

- (BOOL)canSendComposition:(id)a3 forCapabilities:(unint64_t)a4 error:(id *)a5
{
  id v7;
  CKConversation *v8;

  v7 = a3;
  v8 = self;
  CKConversation.canSendComposition(_:forCapabilities:)(v7, a4);

  return 1;
}

void __95__CKConversation_MessageHistoryViewControllerDataSource__fetchOldestMessageDateWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "Message history fetch failed with error: %@", a5, a6, a7, a8, 2u);
}

void __34__CKConversation_deleteBrandLogos__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Unable to delete logos from cache. Error %@.", (uint8_t *)&v2, 0xCu);
}

- (void)sendMessage:(void *)a1 onService:newComposition:.cold.1(void *a1)
{

  objc_end_catch();
}

- (void)sendMessage:(void *)a1 onService:newComposition:.cold.2(void *a1)
{

  objc_end_catch();
}

- (void)senderIdentifier
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_18DFCD000, a3, OS_LOG_TYPE_ERROR, "senderIdentifier is nil for account: %@, chat: %@", (uint8_t *)&v6, 0x16u);

}

@end
