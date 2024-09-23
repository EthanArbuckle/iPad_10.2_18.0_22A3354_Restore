@implementation IMPinnedConversationsController

- (id)matchingIdentifierForChat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[IMPinnedConversationsController pinnedConversationIdentifierSet](self, "pinnedConversationIdentifierSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPinnedConversationsController chatMetadata](self, "chatMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPinnedConversationsController matchingIdentifierForChat:inIdentifierSet:withMetadata:](self, "matchingIdentifierForChat:inIdentifierSet:withMetadata:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSOrderedSet)pinnedConversationIdentifierSet
{
  return self->_pinnedConversationIdentifierSet;
}

- (id)matchingIdentifierForChat:(id)a3 inIdentifierSet:(id)a4 withMetadata:(id)a5
{
  id v8;
  unint64_t v9;
  void *v10;

  v8 = a4;
  v9 = -[IMPinnedConversationsController pinIndexForChat:inIdentifierSet:withMetadata:](self, "pinIndexForChat:inIdentifierSet:withMetadata:", a3, v8, a5);
  if (v9 >= objc_msgSend(v8, "count"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v8, "objectAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (unint64_t)pinIndexForChat:(id)a3 inIdentifierSet:(id)a4 withMetadata:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  id obj;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  unint64_t v53;
  __int16 v54;
  id v55;
  __int16 v56;
  NSObject *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "count");
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  v43 = v7;
  if (v7 && v10)
  {
    v42 = v9;
    objc_msgSend(v7, "pinningIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "indexOfObject:", v41);
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = v12;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218242;
          v53 = v11;
          v54 = 2112;
          v55 = v7;
          _os_log_impl(&dword_1A1FF4000, v31, OS_LOG_TYPE_INFO, "Match found for chat at index %lu using pinning identifier. chat: %@", buf, 0x16u);
        }

      }
      goto LABEL_44;
    }
    objc_msgSend(v7, "mergedPinningIdentifiers");
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v49;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v49 != v15)
            objc_enumerationMutation(v13);
          v11 = objc_msgSend(v8, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          {

            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218242;
                v53 = v11;
                v54 = 2112;
                v55 = v43;
                _os_log_impl(&dword_1A1FF4000, v32, OS_LOG_TYPE_INFO, "Match found for chat at index %lu using merged pinning identifiers. chat: %@", buf, 0x16u);
              }

            }
            goto LABEL_44;
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
        if (v14)
          continue;
        break;
      }
    }

    if (objc_msgSend(v43, "isGroupChat"))
    {
      objc_msgSend(v43, "displayName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17
        || (objc_msgSend(v43, "displayName"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v18, "isEqualToString:", &stru_1E4725068),
            v18,
            v17,
            v19))
      {
        +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "participants");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_sortedParticipantIDHashForParticipants:usesPersonCentricID:", v21, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v8, "indexOfObject:", v22);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218242;
              v53 = v11;
              v54 = 2112;
              v55 = v43;
              _os_log_impl(&dword_1A1FF4000, v35, OS_LOG_TYPE_INFO, "Match found for chat at index %lu using participantHash to pinning identifier comparison. chat: %@", buf, 0x16u);
            }

          }
LABEL_51:

LABEL_44:
          v9 = v42;
          goto LABEL_45;
        }

      }
    }
    if (!objc_msgSend(v43, "isGroupChat"))
      goto LABEL_20;
    objc_msgSend(v43, "originalGroupID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "indexOfObject:", v22);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {

LABEL_20:
      if (objc_msgSend(v43, "isGroupChat"))
      {
        objc_msgSend(v43, "originalGroupID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "identityHash");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        objc_msgSend(v42, "allKeys");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
        if (v23)
        {
          v40 = *(_QWORD *)v45;
          while (2)
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v45 != v40)
                objc_enumerationMutation(obj);
              v25 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
              objc_msgSend(v42, "objectForKey:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKey:", CFSTR("o"));
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = v27;
              if (v27)
              {
                if (-[NSObject isEqualToString:](v27, "isEqualToString:", v39))
                {
                  v11 = objc_msgSend(v8, "indexOfObject:", v25);
                  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (IMOSLoggingEnabled())
                    {
                      OSLogHandleForIMFoundationCategory();
                      v30 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 134218754;
                        v53 = v11;
                        v54 = 2112;
                        v55 = v25;
                        v56 = 2112;
                        v57 = v28;
                        v58 = 2112;
                        v59 = v43;
                        _os_log_impl(&dword_1A1FF4000, v30, OS_LOG_TYPE_INFO, "Match found for chat at index %lu using originalGroupID. pinnedPinningIdentifier: %@, originalGroupID: %@, chat: %@", buf, 0x2Au);
                      }
LABEL_65:

                    }
                    goto LABEL_67;
                  }
                }
              }
              objc_msgSend(v26, "objectForKey:", CFSTR("h"));
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = v29;
              if (v29)
              {
                if (-[NSObject isEqualToString:](v29, "isEqualToString:", v38))
                {
                  v11 = objc_msgSend(v8, "indexOfObject:", v25);
                  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (IMOSLoggingEnabled())
                    {
                      OSLogHandleForIMFoundationCategory();
                      v36 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 134218754;
                        v53 = v11;
                        v54 = 2112;
                        v55 = v25;
                        v56 = 2112;
                        v57 = v30;
                        v58 = 2112;
                        v59 = v43;
                        _os_log_impl(&dword_1A1FF4000, v36, OS_LOG_TYPE_INFO, "Match found for chat at index %lu using identityHash. pinnedPinningIdentifier: %@, identityHash: %@, chat: %@", buf, 0x2Au);
                      }

                    }
                    goto LABEL_65;
                  }
                }
              }

            }
            v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
            if (v23)
              continue;
            break;
          }
        }
        v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_67:

      }
      else
      {
        v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
      goto LABEL_44;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v53 = v11;
        v54 = 2112;
        v55 = v43;
        _os_log_impl(&dword_1A1FF4000, v34, OS_LOG_TYPE_INFO, "Match found for chat at index %lu using originalGroupID to pinning identifier comparison. chat: %@", buf, 0x16u);
      }

    }
    goto LABEL_51;
  }
LABEL_45:

  return v11;
}

- (NSDictionary)chatMetadata
{
  return self->_chatMetadata;
}

+ (id)sharedInstance
{
  if (qword_1ECF12410 != -1)
    dispatch_once(&qword_1ECF12410, &unk_1E471D3F8);
  objc_msgSend((id)qword_1ECF12570, "_postDeferredPinnedConversationsDidChangeNotificationIfNecessary");
  return (id)qword_1ECF12570;
}

- (void)_postDeferredPinnedConversationsDidChangeNotificationIfNecessary
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_hasDefferedPinnedConversationsDidChangeNotification
    && -[IMPinnedConversationsController _canPostPinnedConversationsDidChangeNotification](self, "_canPostPinnedConversationsDidChangeNotification"))
  {
    self->_hasDefferedPinnedConversationsDidChangeNotification = 0;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Performing deffered pinned conversations did change notification.", v4, 2u);
      }

    }
    -[IMPinnedConversationsController _postPinnedConversationsDidChangeNotification](self, "_postPinnedConversationsDidChangeNotification");
  }
}

- (BOOL)shouldSync
{
  void *v2;
  void *v3;
  char v4;

  +[IMCloudKitHooks sharedInstance](IMCloudKitHooks, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEnabled"))
  {
    +[IMCloudKitHooks sharedInstance](IMCloudKitHooks, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "mocAccountsMatch");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)pinnedConversationIdentifiers
{
  return -[NSOrderedSet array](self->_pinnedConversationIdentifierSet, "array");
}

- (id)pinnedConversationIdentifiersFromPinConfiguration:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("pP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (void)performPinConfigValidationAndMigrationIfNecessary
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "pinConfigurationMigrationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getBoolFromDomain:forKey:", CFSTR("com.apple.messages.pinning"), v3);

  if ((v5 & 1) == 0)
  {
    -[IMPinnedConversationsController _locallyStoredPinConfiguration](self, "_locallyStoredPinConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[IMPinnedConversationsController validatedPinConfigurationWithCurrentVersionForPinConfiguration:](self, "validatedPinConfigurationWithCurrentVersionForPinConfiguration:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMPinnedConversationsController pinnedConversationIdentifiersFromPinConfiguration:](self, "pinnedConversationIdentifiersFromPinConfiguration:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMPinnedConversationsController chatMetadataFromPinConfiguration:](self, "chatMetadataFromPinConfiguration:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        IMLogHandleForCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_1A2195EC8((uint64_t)v6, v10);

      }
      -[IMPinnedConversationsController _setPinnedConversationIdentifiers:withChatMetadata:updateReason:shouldUpdateStores:](self, "_setPinnedConversationIdentifiers:withChatMetadata:updateReason:shouldUpdateStores:", v8, v9, CFSTR("migration"), 1);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = 136315138;
        v14 = "-[IMPinnedConversationsController performPinConfigValidationAndMigrationIfNecessary]";
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "%s Not performing migration because the local pin config is nil", (uint8_t *)&v13, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBool:forDomain:forKey:", 1, CFSTR("com.apple.messages.pinning"), v3);

  }
}

- (IMPinnedConversationsController)init
{
  IMPinnedConversationsController *v2;
  NSObject *v3;
  int64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)IMPinnedConversationsController;
  v2 = -[IMPinnedConversationsController init](&v18, sel_init);
  if (v2)
  {
    if (+[IMPinnedConversationsController processSupportsPinnedConversations](IMPinnedConversationsController, "processSupportsPinnedConversations"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          v4 = +[IMPinnedConversationsController currentPinConfigurationVersion](IMPinnedConversationsController, "currentPinConfigurationVersion");
          *(_DWORD *)buf = 134217984;
          v20 = v4;
          _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "currentPinConfigurationVersion == %li", buf, 0xCu);
        }

      }
      v2->_numberOfPendingForceSyncs = 0;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", v2, sel_imCloudKitHooksSetEnabledDidReturn_, CFSTR("com.apple.IMCore.IMCloudKitHooks.SetEnabledReturned"), 0);
      -[NSObject addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", v2, sel__handleChatGroupIDDidChangeNotification_, CFSTR("__kIMChatRegistryGroupIDChangedNotification"), 0);
      -[NSObject addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", v2, sel__connectedToDaemon_, CFSTR("__kIMDaemonDidConnectNotification"), 0);
      -[IMPinnedConversationsController fetchPinnedConversationIdentifiersFromLocalStore](v2, "fetchPinnedConversationIdentifiersFromLocalStore");
      v6 = -[IMPinnedConversationsController shouldSync](v2, "shouldSync");
      v7 = IMOSLoggingEnabled();
      if (v6)
      {
        if (v7)
        {
          OSLogHandleForIMFoundationCategory();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "sync to local data store", buf, 2u);
          }

        }
        -[IMPinnedConversationsController synchronizeLocalDataStore](v2, "synchronizeLocalDataStore");
      }
      else if (v7)
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "cannot sync to local data store", buf, 2u);
        }

      }
      -[IMPinnedConversationsController performPinConfigValidationAndMigrationIfNecessary](v2, "performPinConfigValidationAndMigrationIfNecessary");
      v2->_hasCompletedInitialization = 1;
    }
    else
    {
      IMLogHandleForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_1A2195E94(v5, v9, v10, v11, v12, v13, v14, v15);
    }

  }
  return v2;
}

- (void)fetchPinnedConversationIdentifiersFromLocalStore
{
  void *v3;
  void *v4;
  id v5;

  -[IMPinnedConversationsController _locallyStoredPinConfiguration](self, "_locallyStoredPinConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMPinnedConversationsController pinnedConversationIdentifiersFromPinConfiguration:](self, "pinnedConversationIdentifiersFromPinConfiguration:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPinnedConversationsController chatMetadataFromPinConfiguration:](self, "chatMetadataFromPinConfiguration:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPinnedConversationsController _setPinnedConversationIdentifiers:withChatMetadata:updateReason:shouldUpdateStores:](self, "_setPinnedConversationIdentifiers:withChatMetadata:updateReason:shouldUpdateStores:", v3, v4, CFSTR("fetchFromLocalStore"), 0);

}

- (id)chatMetadataFromPinConfiguration:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKey:", CFSTR("pZ"));
}

- (void)_setPinnedConversationIdentifiers:(id)a3 withChatMetadata:(id)a4 updateReason:(id)a5 shouldUpdateStores:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  NSObject *v20;
  NSOrderedSet *v21;
  NSOrderedSet *pinnedConversationIdentifierSet;
  NSObject *v23;
  NSDictionary *v24;
  NSDictionary *chatMetadata;
  _BYTE v26[22];
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v6 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_28;
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v26 = 136315138;
      *(_QWORD *)&v26[4] = "-[IMPinnedConversationsController _setPinnedConversationIdentifiers:withChatMetadata:updateRe"
                           "ason:shouldUpdateStores:]";
      _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "%s called with nil. Ignoring.", v26, 0xCu);
    }
    goto LABEL_6;
  }
  v13 = objc_msgSend(v10, "count");
  v14 = objc_msgSend((id)objc_opt_class(), "maximumNumberOfPinnedConversations");
  v15 = IMOSLoggingEnabled();
  if (v13 <= v14)
  {
    if (v15)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_QWORD *)&v26[4] = "-[IMPinnedConversationsController _setPinnedConversationIdentifiers:withChatMetadata:update"
                             "Reason:shouldUpdateStores:]";
        v18 = CFSTR("NO");
        *(_DWORD *)v26 = 136316162;
        if (v6)
          v18 = CFSTR("YES");
        *(_WORD *)&v26[12] = 2112;
        *(_QWORD *)&v26[14] = v12;
        v27 = 2112;
        v28 = v18;
        v29 = 2112;
        v30 = v10;
        v31 = 2112;
        v32 = v11;
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "%s called with reason: %@, shouldUpdateStores: %@, pinnedConversationIdentifiers: %@, chatMetadata: %@", v26, 0x34u);
      }

    }
    if (v6)
    {
      -[IMPinnedConversationsController dictionaryWithPinnedConversationIdentifiers:chatMetadata:updateReason:](self, "dictionaryWithPinnedConversationIdentifiers:chatMetadata:updateReason:", v10, v11, v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMPinnedConversationsController updateStoresWithPinConfiguration:](self, "updateStoresWithPinConfiguration:", v19);

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v26 = 136315394;
        *(_QWORD *)&v26[4] = "-[IMPinnedConversationsController _setPinnedConversationIdentifiers:withChatMetadata:update"
                             "Reason:shouldUpdateStores:]";
        *(_WORD *)&v26[12] = 2112;
        *(_QWORD *)&v26[14] = v10;
        _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "%s Setting new cached pinned conversation identifiers %@", v26, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v10, *(_OWORD *)v26);
    v21 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    pinnedConversationIdentifierSet = self->_pinnedConversationIdentifierSet;
    self->_pinnedConversationIdentifierSet = v21;

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v26 = 136315394;
        *(_QWORD *)&v26[4] = "-[IMPinnedConversationsController _setPinnedConversationIdentifiers:withChatMetadata:update"
                             "Reason:shouldUpdateStores:]";
        *(_WORD *)&v26[12] = 2112;
        *(_QWORD *)&v26[14] = v11;
        _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "%s Setting new cached chat metadata %@", v26, 0x16u);
      }

    }
    v24 = (NSDictionary *)objc_msgSend(v11, "copy");
    chatMetadata = self->_chatMetadata;
    self->_chatMetadata = v24;

    -[IMPinnedConversationsController _postPinnedConversationsDidChangeNotification](self, "_postPinnedConversationsDidChangeNotification");
  }
  else if (v15)
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v26 = 136315394;
      *(_QWORD *)&v26[4] = "-[IMPinnedConversationsController _setPinnedConversationIdentifiers:withChatMetadata:updateRe"
                           "ason:shouldUpdateStores:]";
      *(_WORD *)&v26[12] = 2048;
      *(_QWORD *)&v26[14] = objc_msgSend(v10, "count");
      _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "%s called with %ld items. Ignoring.", v26, 0x16u);
    }
LABEL_6:

  }
LABEL_28:

}

- (void)_postPinnedConversationsDidChangeNotification
{
  void *v3;
  id v4;

  if (-[IMPinnedConversationsController _canPostPinnedConversationsDidChangeNotification](self, "_canPostPinnedConversationsDidChangeNotification"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)-[NSOrderedSet copy](self->_pinnedConversationIdentifierSet, "copy");
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("__kIMPinnedConversationsDidChangeNotification"), v3);

  }
  else
  {
    self->_hasDefferedPinnedConversationsDidChangeNotification = 1;
  }
}

- (id)_locallyStoredPinConfiguration
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValueFromDomain:forKey:", CFSTR("com.apple.messages.pinning"), CFSTR("pD"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (BOOL)_canPostPinnedConversationsDidChangeNotification
{
  void *v2;
  char v3;
  int v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  __int16 v9;
  __int16 v10;

  if (!self->_hasCompletedInitialization)
  {
    v4 = IMOSLoggingEnabled();
    if (!v4)
      return v4;
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = 0;
      v6 = "Deffering pinned conversations did change notification until after initialization is completed.";
      v7 = (uint8_t *)&v10;
LABEL_10:
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
    }
LABEL_11:

    LOBYTE(v4) = 0;
    return v4;
  }
  +[IMDaemonController sharedController](IMDaemonController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConnected");

  if ((v3 & 1) == 0)
  {
    v4 = IMOSLoggingEnabled();
    if (!v4)
      return v4;
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 0;
      v6 = "Deffering pinned conversations did change notification until after connected to daemon.";
      v7 = (uint8_t *)&v9;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  LOBYTE(v4) = 1;
  return v4;
}

+ (id)pinConfigurationMigrationKey
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IMPinningPinConfigMigrationKey-v%li-r%li"), objc_msgSend(a1, "currentPinConfigurationVersion"), objc_msgSend(a1, "currentPinConfigurationRevision"));
}

+ (unint64_t)maximumNumberOfPinnedConversations
{
  return 9;
}

+ (int64_t)currentPinConfigurationVersion
{
  return 2;
}

+ (int64_t)currentPinConfigurationRevision
{
  return 2;
}

+ (id)requiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("pV");
  v6[1] = CFSTR("pT");
  v6[2] = CFSTR("pP");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_ubiquitousDispatchQueue
{
  if (qword_1EE65F1D0 != -1)
    dispatch_once(&qword_1EE65F1D0, &unk_1E471C430);
  return (id)qword_1EE65F1D8;
}

- (NSUbiquitousKeyValueStore)dataStore
{
  IMPinnedConversationsController *v2;
  NSUbiquitousKeyValueStore *dataStore;
  uint64_t v4;
  NSUbiquitousKeyValueStore *v5;
  void *v6;
  NSUbiquitousKeyValueStore *v7;

  v2 = self;
  objc_sync_enter(v2);
  dataStore = v2->_dataStore;
  if (!dataStore)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A38]), "_initWithStoreIdentifier:usingEndToEndEncryption:", CFSTR("com.apple.messages.pinning"), 1);
    v5 = v2->_dataStore;
    v2->_dataStore = (NSUbiquitousKeyValueStore *)v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification_, *MEMORY[0x1E0CB3368], v2->_dataStore);

    dataStore = v2->_dataStore;
  }
  v7 = dataStore;
  objc_sync_exit(v2);

  return v7;
}

- (id)_dictionaryWithPinnedConversationIdentifiers:(id)a3 chatMetadata:(id)a4 updateReason:(id)a5 timestamp:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;

  v9 = a6;
  v10 = (objc_class *)MEMORY[0x1E0C99E08];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v10);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[IMPinnedConversationsController currentPinConfigurationRevision](IMPinnedConversationsController, "currentPinConfigurationRevision"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("pR"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[IMPinnedConversationsController currentPinConfigurationVersion](IMPinnedConversationsController, "currentPinConfigurationVersion"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("pV"));

  if (v9)
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, CFSTR("pT"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("pT"));

  }
  if (v13)
    v18 = v13;
  else
    v18 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("pP"));

  if (v12)
    v19 = v12;
  else
    v19 = (id)MEMORY[0x1E0C9AA70];
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("pZ"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("pU"));
  v20 = (void *)objc_msgSend(v14, "copy");

  return v20;
}

- (id)dictionaryWithPinnedConversationIdentifiers:(id)a3 chatMetadata:(id)a4 updateReason:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPinnedConversationsController _dictionaryWithPinnedConversationIdentifiers:chatMetadata:updateReason:timestamp:](self, "_dictionaryWithPinnedConversationIdentifiers:chatMetadata:updateReason:timestamp:", v11, v10, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_metadataDictionaryForChat:(id)a3
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "originalGroupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v3, "isGroupChat"))
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("o"));
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "originalGroupID was nil for chat. Not including in chat metadata dictionary. chat: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  objc_msgSend(v3, "identityHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && objc_msgSend(v3, "isGroupChat"))
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("h"));
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "identityHash was nil for chat. Not including in chat metadata dictionary. chat: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  if (objc_msgSend(v4, "count"))
    v9 = (void *)objc_msgSend(v4, "copy");
  else
    v9 = 0;

  return v9;
}

- (id)mostUpToDatePinConfigurationByComparingPinConfiguration:(id)a3 toOtherPinConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("pT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("pT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = 1;
  else
    v10 = v7 == 0;
  v11 = v5;
  if (!v10)
    goto LABEL_13;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v13 = v12;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v11 = v5;
  if (v13 < v14)
    goto LABEL_13;
  v15 = v7 || v9 == 0;
  v11 = v6;
  if (v15
    && (objc_msgSend(v7, "timeIntervalSinceReferenceDate"),
        v17 = v16,
        objc_msgSend(v9, "timeIntervalSinceReferenceDate"),
        v11 = v6,
        v17 >= v18))
  {
    v19 = 0;
  }
  else
  {
LABEL_13:
    v19 = v11;
  }

  return v19;
}

- (void)_handleChatGroupIDDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("__kIMChatRegistryPreviousGroupIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("__kIMChatRegistryUpdatedGroupIDKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v22 = 138412802;
      v23 = v7;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Received group ID change notification for chat. previousGroupID: %@, newGroupID: %@, chat: %@", (uint8_t *)&v22, 0x20u);
    }

  }
  if (v5)
  {
    -[IMPinnedConversationsController pinnedConversationIdentifierSet](self, "pinnedConversationIdentifierSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v7);

    if (v12)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v22 = 138412802;
          v23 = v7;
          v24 = 2112;
          v25 = v9;
          v26 = 2112;
          v27 = v5;
          _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Chat with previousGroupID (%@) was pinned, but that group ID changed. Replacing previous group ID with new group ID (%@) in the pinning stores. chat: %@", (uint8_t *)&v22, 0x20u);
        }

      }
      -[IMPinnedConversationsController pinnedConversationIdentifierSet](self, "pinnedConversationIdentifierSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      v16 = objc_msgSend(v15, "indexOfObject:", v7);
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            LOWORD(v22) = 0;
            _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "pinnedConversationIdentifierSet contained the previous groupID, but the index was NSNotFound!", (uint8_t *)&v22, 2u);
          }
LABEL_23:

        }
      }
      else
      {
        if (v9)
        {
          objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v16, v9);
          -[IMPinnedConversationsController chatMetadata](self, "chatMetadata");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "mutableCopy");

          objc_msgSend(v19, "removeObjectForKey:", v7);
          -[IMPinnedConversationsController _metadataDictionaryForChat:](self, "_metadataDictionaryForChat:", v5);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v19, "setObject:forKey:", v20, v9);
          objc_msgSend(v15, "array");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMPinnedConversationsController _setPinnedConversationIdentifiers:withChatMetadata:updateReason:shouldUpdateStores:](self, "_setPinnedConversationIdentifiers:withChatMetadata:updateReason:shouldUpdateStores:", v21, v19, CFSTR("groupIDChange"), 1);

          goto LABEL_24;
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v22 = 138412546;
            v23 = v7;
            v24 = 2112;
            v25 = v5;
            _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "IMPinnedConversationsController received a groupID change notification, but the new groupID was nil! Not making changes to the pin config. previousGroupID: %@, chat: %@", (uint8_t *)&v22, 0x16u);
          }
          goto LABEL_23;
        }
      }
LABEL_24:

    }
  }

}

- (void)setPinnedChats:(id)a3 withUpdateReason:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "pinningIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v7, "addObject:", v14);
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v13;
            _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "pinningIdentifier was nil for chat. Not including in new pinnedConversationIdentifiers. chat: %@", buf, 0xCu);
          }

        }
        -[IMPinnedConversationsController _metadataDictionaryForChat:](self, "_metadataDictionaryForChat:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          v17 = v14 != 0;
        else
          v17 = 0;
        if (v17)
          objc_msgSend(v8, "setObject:forKey:", v16, v14);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v10);
  }

  -[IMPinnedConversationsController _setPinnedConversationIdentifiers:withChatMetadata:updateReason:shouldUpdateStores:](self, "_setPinnedConversationIdentifiers:withChatMetadata:updateReason:shouldUpdateStores:", v7, v8, v18, 1);
}

- (void)conversationWasDeletedWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMPinnedConversationsController conversationsWereDeletedWithIdentifiers:](self, "conversationsWereDeletedWithIdentifiers:", v6, v7, v8);
  }
}

- (void)conversationsWereDeletedWithIdentifiers:(id)a3
{
  char *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  IMPinnedConversationsController *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v31 = self;
  -[IMPinnedConversationsController pinnedConversationIdentifierSet](self, "pinnedConversationIdentifierSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[IMPinnedConversationsController pinnedConversationIdentifierSet](self, "pinnedConversationIdentifierSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    -[IMPinnedConversationsController chatMetadata](self, "chatMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v11 = v30;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v33;
      v3 = "Warning";
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (v15)
          {
            objc_msgSend(v8, "removeObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
            objc_msgSend(v10, "removeObjectForKey:", v15);
          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v37 = "-[IMPinnedConversationsController conversationsWereDeletedWithIdentifiers:]";
              _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "%s Tried to delete a nil identifier.", buf, 0xCu);
            }

          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      }
      while (v12);
    }

    -[IMPinnedConversationsController pinnedConversationIdentifierSet](v31, "pinnedConversationIdentifierSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v17)
    {
      -[IMPinnedConversationsController pinnedConversationIdentifierSet](v31, "pinnedConversationIdentifierSet");
      v3 = (char *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToOrderedSet:", v3) & 1) == 0)
      {

LABEL_30:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            -[IMPinnedConversationsController pinnedConversationIdentifierSet](v31, "pinnedConversationIdentifierSet");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "array");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v37 = "-[IMPinnedConversationsController conversationsWereDeletedWithIdentifiers:]";
            v38 = 2112;
            v39 = v11;
            v40 = 2112;
            v41 = v8;
            v42 = 2112;
            v43 = v27;
            _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, "%s Removing pinned conversations with identifers %@, resulting in pinnedConversationIdentifiers: %@ existing value: %@", buf, 0x2Au);

          }
        }
        objc_msgSend(v8, "array");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v10, "copy");
        -[IMPinnedConversationsController _setPinnedConversationIdentifiers:withChatMetadata:updateReason:shouldUpdateStores:](v31, "_setPinnedConversationIdentifiers:withChatMetadata:updateReason:shouldUpdateStores:", v28, v29, CFSTR("conversationDelete"), 1);

LABEL_35:
        goto LABEL_36;
      }
    }
    -[IMPinnedConversationsController chatMetadata](v31, "chatMetadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v10 == v18)
    {

      v22 = v8;
      if (v8 != v17)
      {

        v22 = v17;
      }

    }
    else
    {
      -[IMPinnedConversationsController chatMetadata](v31, "chatMetadata");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v10, "isEqualToDictionary:", v20);

      if (v8 == v17)
      {

      }
      else
      {

      }
      if ((v21 & 1) == 0)
        goto LABEL_30;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        -[IMPinnedConversationsController pinnedConversationIdentifierSet](v31, "pinnedConversationIdentifierSet");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v37 = "-[IMPinnedConversationsController conversationsWereDeletedWithIdentifiers:]";
        v38 = 2112;
        v39 = v11;
        v40 = 2112;
        v41 = v8;
        v42 = 2112;
        v43 = v24;
        _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "Received call to %s with identifiers %@, but it resulted in no changes to the cached pinningIdentifiers. proposed: %@ existing value: %@", buf, 0x2Au);

      }
    }
    goto LABEL_35;
  }
LABEL_36:

}

- (BOOL)pinnedConversationsContainsChat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[IMPinnedConversationsController pinnedConversationIdentifierSet](self, "pinnedConversationIdentifierSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPinnedConversationsController chatMetadata](self, "chatMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IMPinnedConversationsController pinIndexForChat:inIdentifierSet:withMetadata:](self, "pinIndexForChat:inIdentifierSet:withMetadata:", v4, v5, v6);

  return v7 != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)validatedPinConfigurationWithCurrentVersionForPinConfiguration:(id)a3
{
  int64_t v4;
  int64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  int64_t v59;
  __int16 v60;
  int64_t v61;
  __int16 v62;
  int64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v4 = +[IMPinnedConversationsController currentPinConfigurationVersion](IMPinnedConversationsController, "currentPinConfigurationVersion");
  v5 = +[IMPinnedConversationsController currentPinConfigurationRevision](IMPinnedConversationsController, "currentPinConfigurationRevision");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v59 = v4;
      v60 = 2112;
      v61 = (int64_t)v52;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Determining if pin config needs migration to version %li. %@", buf, 0x16u);
    }

  }
  objc_msgSend(v52, "objectForKey:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    objc_msgSend(v52, "objectForKey:");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v50, "integerValue");
    v8 = objc_msgSend(v51, "integerValue");
    v9 = v8;
    if (v8 > v4)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218498;
          v59 = v9;
          v60 = 2048;
          v61 = v4;
          v62 = 2112;
          v63 = (int64_t)v52;
          _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Pin config has a version (%li) greater than the current version (%li). This pin config is not usable. %@", buf, 0x20u);
        }

      }
      v11 = 0;
      goto LABEL_83;
    }
    v14 = v8 == v4 && v7 == v5;
    v15 = IMOSLoggingEnabled();
    if (v14)
    {
      if (v15)
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v59 = v4;
          v60 = 2048;
          v61 = v5;
          _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Pin config has current version (%li) and revision (%li) already . No migration necessary.", buf, 0x16u);
        }

      }
      v11 = v52;
      goto LABEL_83;
    }
    if (v15)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218496;
        v59 = v9;
        v60 = 2048;
        v61 = v4;
        v62 = 2048;
        v63 = v5;
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Pin config has a version (%li) less than the current version (%li) or revision (%li). Attempting migration.", buf, 0x20u);
      }

    }
    v49 = (void *)objc_msgSend(v52, "mutableCopy");
    if (v9 < 2)
    {
      IMLogHandleForCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1A2195FF8(v18, v19, v20, v21, v22, v23, v24, v25);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setObject:forKey:", v26, CFSTR("pV"));

    }
    if (v9 <= 2 && v7 <= 1)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v59 = (int64_t)v49;
          _os_log_impl(&dword_1A1FF4000, v27, OS_LOG_TYPE_INFO, "The given pin config did not have chat metadata. Attempting to add some. pin config: %@", buf, 0xCu);
        }

      }
      -[IMPinnedConversationsController pinnedConversationIdentifiersFromPinConfiguration:](self, "pinnedConversationIdentifiersFromPinConfiguration:", v49);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v48);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMPinnedConversationsController chatMetadataFromPinConfiguration:](self, "chatMetadataFromPinConfiguration:", v49);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "cachedChats");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v33 = v32;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      if (v34)
      {
        v35 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v54 != v35)
              objc_enumerationMutation(v33);
            v37 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
            -[IMPinnedConversationsController matchingIdentifierForChat:inIdentifierSet:withMetadata:](self, "matchingIdentifierForChat:inIdentifierSet:withMetadata:", v37, v28, v29);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (v38)
            {
              -[IMPinnedConversationsController _metadataDictionaryForChat:](self, "_metadataDictionaryForChat:", v37);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (v39)
                objc_msgSend(v30, "setObject:forKey:", v39, v38);

            }
          }
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
        }
        while (v34);
      }

      if (v30 && objc_msgSend(v30, "count"))
        objc_msgSend(v49, "setObject:forKey:", v30, CFSTR("pZ"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setObject:forKey:", v40, CFSTR("pV"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setObject:forKey:", v41, CFSTR("pR"));

    }
    if (-[IMPinnedConversationsController pinConfigurationIsValid:](self, "pinConfigurationIsValid:", v49))
    {
      if (-[IMPinnedConversationsController pinConfigurationHasCurrentVersion:](self, "pinConfigurationHasCurrentVersion:", v49))
      {
        v11 = (id)objc_msgSend(v49, "copy");
LABEL_82:

LABEL_83:
        goto LABEL_84;
      }
      IMLogHandleForCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        sub_1A2195F38();

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v59 = (int64_t)v52;
          _os_log_impl(&dword_1A1FF4000, v46, OS_LOG_TYPE_INFO, "Migrated pin config wrong version. pinConfigToMigrate: %@", buf, 0xCu);
        }

      }
      if (!IMOSLoggingEnabled())
      {
LABEL_81:
        v11 = 0;
        goto LABEL_82;
      }
      OSLogHandleForIMFoundationCategory();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v59 = (int64_t)v49;
        _os_log_impl(&dword_1A1FF4000, v44, OS_LOG_TYPE_INFO, "Migrated pin config wrong version. migratedPinConfig: %@", buf, 0xCu);
      }
    }
    else
    {
      IMLogHandleForCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        sub_1A2195F98();

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v59 = (int64_t)v52;
          _os_log_impl(&dword_1A1FF4000, v43, OS_LOG_TYPE_INFO, "Invalid migrated pin config. pinConfigToMigrate: %@", buf, 0xCu);
        }

      }
      if (!IMOSLoggingEnabled())
        goto LABEL_81;
      OSLogHandleForIMFoundationCategory();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v59 = (int64_t)v49;
        _os_log_impl(&dword_1A1FF4000, v44, OS_LOG_TYPE_INFO, "Invalid migrated pin config. migratedPinConfig: %@", buf, 0xCu);
      }
    }

    goto LABEL_81;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v59 = (int64_t)v52;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Pin config has nil version. This pin config is not valid. %@", buf, 0xCu);
    }

  }
  v11 = 0;
LABEL_84:

  return v11;
}

+ (id)_forceSyncDispatchQueue
{
  if (qword_1EE65F3F8 != -1)
    dispatch_once(&qword_1EE65F3F8, &unk_1E471C570);
  return (id)qword_1EE65F3F0;
}

- (void)imCloudKitHooksSetEnabledDidReturn:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  const __CFString *v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Received IMCloudKitHooksSetEnabledReturned notification {notification %@}", (uint8_t *)&v13, 0xCu);
    }

  }
  -[__CFString userInfo](v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("ResultKeyNewState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = -[IMPinnedConversationsController shouldSync](self, "shouldSync");
      v11 = CFSTR("NO");
      if (v8)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      if (v10)
        v11 = CFSTR("YES");
      v13 = 138412546;
      v14 = v12;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "New MiC enabled state is %@. [self shouldSync] == %@", (uint8_t *)&v13, 0x16u);
    }

  }
  -[IMPinnedConversationsController synchronizeLocalDataStore](self, "synchronizeLocalDataStore");

}

- (void)synchronizeLocalDataStore
{
  _QWORD v3[4];
  id v4;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1A2030754;
  v3[3] = &unk_1E471E488;
  objc_copyWeak(&v4, &location);
  -[IMPinnedConversationsController fetchMostUpToDatePinConfiguration:](self, "fetchMostUpToDatePinConfiguration:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)forceSynchronizeUbiquitousStore
{
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  _BYTE v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[IMPinnedConversationsController numberOfPendingForceSyncs](self, "numberOfPendingForceSyncs") < 4)
  {
    -[IMPinnedConversationsController setNumberOfPendingForceSyncs:](self, "setNumberOfPendingForceSyncs:", -[IMPinnedConversationsController numberOfPendingForceSyncs](self, "numberOfPendingForceSyncs") + 1);
    *(_QWORD *)v7 = 0;
    objc_initWeak((id *)v7, self);
    +[IMPinnedConversationsController _forceSyncDispatchQueue](IMPinnedConversationsController, "_forceSyncDispatchQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_1A2030BC0;
    v5[3] = &unk_1E471E460;
    objc_copyWeak(&v6, (id *)v7);
    dispatch_async(v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)v7);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v7 = 136315394;
      *(_QWORD *)&v7[4] = "-[IMPinnedConversationsController forceSynchronizeUbiquitousStore]";
      v8 = 2048;
      v9 = 3;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Blocking additional calls to %s because there are already at least %ld pending calls.", v7, 0x16u);
    }

  }
}

- (void)handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Received NSUbiquitousKeyValueStoreDidChangeExternallyNotification {notification: %@}", buf, 0xCu);
    }

  }
  if (-[IMPinnedConversationsController shouldSync](self, "shouldSync"))
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CB3360]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "containsObject:", CFSTR("pD")) & 1) != 0)
    {
      objc_msgSend(v4, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB3358]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = objc_msgSend(v9, "integerValue");
        switch(v10)
        {
          case 0:
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "-[handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:] change reason is NSUbiquitousKeyValueStoreServerChange.", buf, 2u);
              }
              goto LABEL_25;
            }
            break;
          case 1:
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "-[handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:] change reason is NSUbiquitousKeyValueStoreInitialSyncChange.", buf, 2u);
              }
              goto LABEL_25;
            }
            break;
          case 2:
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "-[handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:] change reason is NSUbiquitousKeyValueStoreQuotaViolationChange.", buf, 2u);
              }
              goto LABEL_25;
            }
            break;
          case 3:
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "-[handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:] change reason is NSUbiquitousKeyValueStoreAccountChange.", buf, 2u);
              }
              goto LABEL_25;
            }
            break;
          default:
            if (v10 == 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_22;
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v16 = v9;
                _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "-[handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:] change reason is %@", buf, 0xCu);
              }
              goto LABEL_25;
            }
            break;
        }
      }
      else
      {
LABEL_22:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "-[handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:] change reason is nil.", buf, 2u);
          }
LABEL_25:

        }
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1A203124C;
      block[3] = &unk_1E471E348;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "-[handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:] IMPinConfigurationTopLevelKey was not in NSUbiquitousKeyValueStoreChangedKeysKey. Ignoring notification.", buf, 2u);
      }

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "[self shouldSync] == NO. Ignoring NSUbiquitousKeyValueStoreDidChangeExternallyNotification.", buf, 2u);
    }

  }
}

- (void)updateStoresWithPinConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[IMPinnedConversationsController updateStoresWithPinConfiguration:]";
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "%s Updating stores %@", buf, 0x16u);
    }

  }
  -[IMPinnedConversationsController _updateLocalStoreWithPinConfiguration:](self, "_updateLocalStoreWithPinConfiguration:", v4);
  if (-[IMPinnedConversationsController shouldSync](self, "shouldSync"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1A20313B0;
    v6[3] = &unk_1E471E4B0;
    v7 = v4;
    -[IMPinnedConversationsController _updateUbiquitousStoreWithPinConfiguration:completion:](self, "_updateUbiquitousStoreWithPinConfiguration:completion:", v7, v6);

  }
}

- (void)_updateUbiquitousStoreWithPinConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _BYTE buf[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Attempting to save new pin configuration to ubiquitous store: %@", buf, 0xCu);
    }

  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1A2031650;
  v11[3] = &unk_1E471E4D8;
  objc_copyWeak(&v14, (id *)buf);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  -[IMPinnedConversationsController _fetchUbiquitousPinConfiguration:](self, "_fetchUbiquitousPinConfiguration:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (BOOL)_updateLocalStoreWithPinConfiguration:(id)a3
{
  char *v4;
  NSObject *v5;
  char *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  char *v11;
  _BOOL4 v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  const __CFString *v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Received request to save new pin configuration to local store: %@", buf, 0xCu);
    }

  }
  -[IMPinnedConversationsController validatedPinConfigurationWithCurrentVersionForPinConfiguration:](self, "validatedPinConfigurationWithCurrentVersionForPinConfiguration:", v4);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v4;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Successfully migrated pin config to current version. before: %@", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v6;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Successfully migrated pin config to current version. after: %@", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v6;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Attempting to save the migrated pin config to local store: %@", buf, 0xCu);
      }

    }
    -[IMPinnedConversationsController _locallyStoredPinConfiguration](self, "_locallyStoredPinConfiguration");
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    v12 = -[IMPinnedConversationsController shouldUpdateExistingPinConfig:withProposedPinConfig:](self, "shouldUpdateExistingPinConfig:withProposedPinConfig:", v11, v6);
    v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v13)
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v11;
          _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Saving new pin configuration to local store. Old: %@", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v6;
          _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Saving new pin configuration to local store. New: %@", buf, 0xCu);
        }

      }
      if ((IMIsRunningInUnitTesting() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setValue:forDomain:forKey:", v6, CFSTR("com.apple.messages.pinning"), CFSTR("pD"));

        v19 = objc_alloc_init((Class)MEMORY[0x1A858292C](CFSTR("NPSManager"), CFSTR("NanoPreferencesSync")));
        v20 = (void *)MEMORY[0x1E0C99E60];
        v25 = CFSTR("pD");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setWithArray:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.messages.pinning"), v22);

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "syncManager", buf, 2u);
          }

        }
        goto LABEL_46;
      }
      if (!IMOSLoggingEnabled())
      {
LABEL_46:

        goto LABEL_47;
      }
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[IMPinnedConversationsController _updateLocalStoreWithPinConfiguration:]";
        _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "%s Didn't actually update the local store because we're running a unit test.", buf, 0xCu);
      }
    }
    else
    {
      if (!v13)
        goto LABEL_46;
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v6;
        _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "shouldUpdate == NO. Not saving new pin configuration to local store: %@", buf, 0xCu);
      }
    }

    goto LABEL_46;
  }
  if (v7)
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v4;
      _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Could not migrate the proposedConfig to the current version. Not saving new pin configuration to local store: %@", buf, 0xCu);
    }

  }
  LOBYTE(v12) = 0;
LABEL_47:

  return v12;
}

- (BOOL)shouldWriteProposedPinConfiguration:(id)a3 toUbiquitousStoreWithExistingPinConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  const __CFString *v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("pV"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("pV"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v21 = 138413058;
        v22 = 0;
        v23 = 2048;
        v24 = (const char *)objc_msgSend(0, "integerValue");
        v25 = 2112;
        v26 = v7;
        v27 = 2048;
        v28 = objc_msgSend(v7, "integerValue");
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Could not definitively determine if proposed version (%@, %li) is greater than or equal to the existing ubiquitous data's (%@, %li), not writing to ubiquitous store", (uint8_t *)&v21, 0x2Au);
      }

    }
    goto LABEL_12;
  }
  if (v7)
  {
    v10 = objc_msgSend(v8, "integerValue");
    v11 = objc_msgSend(v7, "integerValue");
    v12 = IMOSLoggingEnabled();
    if (v10 < v11)
    {
      if (v12)
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v21 = 134218240;
          v22 = v10;
          v23 = 2048;
          v24 = (const char *)v11;
          _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Proposed version (%li) is less than the existing ubiquitous data's (%li), not writing earlier version to ubiquitous store", (uint8_t *)&v21, 0x16u);
        }

      }
LABEL_12:
      v15 = 0;
      goto LABEL_22;
    }
    if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v21 = 134218240;
        v22 = v10;
        v23 = 2048;
        v24 = (const char *)v11;
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Proposed version (%li) is greater than or equal to the existing ubiquitous data's (%li), ok to write to ubiquitous store", (uint8_t *)&v21, 0x16u);
      }

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "There was no existing version in the ubiquitous store.", (uint8_t *)&v21, 2u);
    }

  }
  v15 = 1;
LABEL_22:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = CFSTR("NO");
      if (v15)
        v19 = CFSTR("YES");
      v21 = 138412546;
      v22 = (uint64_t)v19;
      v23 = 2080;
      v24 = "-[IMPinnedConversationsController shouldWriteProposedPinConfiguration:toUbiquitousStoreWithExistingPinConfiguration:]";
      _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Returning %@ for %s", (uint8_t *)&v21, 0x16u);
    }

  }
  return v15;
}

- (BOOL)pinConfigurationHasCompatibleVersion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  const __CFString *v14;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("pV"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v16 = 136315138;
        v17 = "-[IMPinnedConversationsController pinConfigurationHasCompatibleVersion:]";
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "%s The pin config's version was nil.", (uint8_t *)&v16, 0xCu);
      }

    }
    goto LABEL_11;
  }
  v6 = objc_msgSend(v4, "integerValue");
  v7 = +[IMPinnedConversationsController currentPinConfigurationVersion](IMPinnedConversationsController, "currentPinConfigurationVersion");
  v8 = IMOSLoggingEnabled();
  if (v6 > v7)
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v16 = 136315650;
        v17 = "-[IMPinnedConversationsController pinConfigurationHasCompatibleVersion:]";
        v18 = 2048;
        v19 = (const char *)v6;
        v20 = 2048;
        v21 = v7;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "%s The pin config's version (%li) was definitively greater than the current version (%li).", (uint8_t *)&v16, 0x20u);
      }

    }
LABEL_11:
    v11 = 0;
    goto LABEL_17;
  }
  if (v8)
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v16 = 136315650;
      v17 = "-[IMPinnedConversationsController pinConfigurationHasCompatibleVersion:]";
      v18 = 2048;
      v19 = (const char *)v6;
      v20 = 2048;
      v21 = v7;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "%s The pin config's version (%li) was definitively less than or equal to the current version (%li).", (uint8_t *)&v16, 0x20u);
    }

  }
  v11 = 1;
LABEL_17:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = CFSTR("NO");
      if (v11)
        v14 = CFSTR("YES");
      v16 = 138412546;
      v17 = (const char *)v14;
      v18 = 2080;
      v19 = "-[IMPinnedConversationsController pinConfigurationHasCompatibleVersion:]";
      _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Returning %@ for %s", (uint8_t *)&v16, 0x16u);
    }

  }
  return v11;
}

- (BOOL)pinConfigurationIsValid:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IMPinnedConversationsController requiredKeys](IMPinnedConversationsController, "requiredKeys");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {

          v11 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = -[IMPinnedConversationsController pinConfigurationHasCompatibleVersion:](self, "pinConfigurationHasCompatibleVersion:", v4);
LABEL_11:

  return v11;
}

- (BOOL)pinConfigurationHasCurrentVersion:(id)a3
{
  void *v3;
  int64_t v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("pV"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[IMPinnedConversationsController currentPinConfigurationVersion](IMPinnedConversationsController, "currentPinConfigurationVersion");
  if (v3)
    v5 = objc_msgSend(v3, "integerValue") == v4;
  else
    v5 = 0;

  return v5;
}

- (BOOL)shouldUpdateExistingPinConfig:(id)a3 withProposedPinConfig:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  const __CFString *v19;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[IMPinnedConversationsController pinConfigurationIsValid:](self, "pinConfigurationIsValid:", v7))
  {
    v16 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("pT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("pT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v21 = 136315138;
        v22 = "-[IMPinnedConversationsController shouldUpdateExistingPinConfig:withProposedPinConfig:]";
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "%s The proposed timestamp was nil.", (uint8_t *)&v21, 0xCu);
      }
      goto LABEL_22;
    }
LABEL_23:
    v16 = 0;
    goto LABEL_24;
  }
  if (v8)
  {
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v11 = v10;
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v13 = v12;
    v14 = IMOSLoggingEnabled();
    if (v11 < v13)
    {
      if (v14)
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v21 = 136315138;
          v22 = "-[IMPinnedConversationsController shouldUpdateExistingPinConfig:withProposedPinConfig:]";
          _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "%s The proposed timestamp was definitively later than the existing timestamp.", (uint8_t *)&v21, 0xCu);
        }
LABEL_17:

        goto LABEL_18;
      }
      goto LABEL_18;
    }
    if (v14)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v21 = 136315138;
        v22 = "-[IMPinnedConversationsController shouldUpdateExistingPinConfig:withProposedPinConfig:]";
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "%s The proposed timestamp was definitively earlier than or equivalent to the existing timestamp.", (uint8_t *)&v21, 0xCu);
      }
LABEL_22:

      goto LABEL_23;
    }
    goto LABEL_23;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v21 = 136315138;
      v22 = "-[IMPinnedConversationsController shouldUpdateExistingPinConfig:withProposedPinConfig:]";
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "%s There was no existing timestamp.", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_17;
  }
LABEL_18:
  v16 = 1;
LABEL_24:

LABEL_25:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = CFSTR("NO");
      if (v16)
        v19 = CFSTR("YES");
      v21 = 138412546;
      v22 = (const char *)v19;
      v23 = 2080;
      v24 = "-[IMPinnedConversationsController shouldUpdateExistingPinConfig:withProposedPinConfig:]";
      _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Returning %@ for %s", (uint8_t *)&v21, 0x16u);
    }

  }
  return v16;
}

- (void)_fetchUbiquitousPinConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  +[IMPinnedConversationsController _ubiquitousDispatchQueue](IMPinnedConversationsController, "_ubiquitousDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A2032BEC;
  block[3] = &unk_1E471E550;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)fetchMostUpToDatePinConfiguration:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A2032EDC;
  v6[3] = &unk_1E471E5A0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[IMPinnedConversationsController _fetchUbiquitousPinConfiguration:](self, "_fetchUbiquitousPinConfiguration:", v6);

}

- (id)_ubiquitousPinConfigurationInStore:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getBoolFromDomain:forKey:", CFSTR("com.apple.messages.pinning"), CFSTR("IMPinningShouldTryFetchAgainIfNullKey"));
  objc_msgSend(v3, "dictionaryForKey:", CFSTR("pD"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Retrieved from iCloud: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  if (v6)
  {
    if ((v5 & 1) == 0)
      objc_msgSend(v4, "setBool:forDomain:forKey:", 1, CFSTR("com.apple.messages.pinning"), CFSTR("IMPinningShouldTryFetchAgainIfNullKey"));
    goto LABEL_24;
  }
  if (!v3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Received nil when trying to fetch the pin configuration from the ubiquitous store because the NSUbiquitousKeyValueStore was nil.", (uint8_t *)&v11, 2u);
      }
      goto LABEL_22;
    }
LABEL_23:
    v6 = 0;
    goto LABEL_24;
  }
  if (!v5)
    goto LABEL_23;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Received nil when trying to fetch the pin configuration from the ubiquitous store even though the NSUbiquitousKeyValueStore is initialized and the user has already pinned something before. This is an issue in NSUbiquitousKeyValueStore. Trying again.", (uint8_t *)&v11, 2u);
    }

  }
  objc_msgSend(v3, "dictionaryForKey:", CFSTR("pD"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Received nil when trying to fetch the pin configuration from the ubiquitous store even after trying the fetch again. This is an issue in NSUbiquitousKeyValueStore.", (uint8_t *)&v11, 2u);
      }
LABEL_22:

      goto LABEL_23;
    }
    goto LABEL_23;
  }
LABEL_24:

  return v6;
}

- (BOOL)hasCompletedInitialization
{
  return self->_hasCompletedInitialization;
}

- (void)setHasCompletedInitialization:(BOOL)a3
{
  self->_hasCompletedInitialization = a3;
}

- (BOOL)hasDefferedPinnedConversationsDidChangeNotification
{
  return self->_hasDefferedPinnedConversationsDidChangeNotification;
}

- (void)setHasDefferedPinnedConversationsDidChangeNotification:(BOOL)a3
{
  self->_hasDefferedPinnedConversationsDidChangeNotification = a3;
}

- (int64_t)numberOfPendingForceSyncs
{
  return self->_numberOfPendingForceSyncs;
}

- (void)setNumberOfPendingForceSyncs:(int64_t)a3
{
  self->_numberOfPendingForceSyncs = a3;
}

- (void)setDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_dataStore, a3);
}

- (void)setPinnedConversationIdentifierSet:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedConversationIdentifierSet, a3);
}

- (void)setChatMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_chatMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatMetadata, 0);
  objc_storeStrong((id *)&self->_pinnedConversationIdentifierSet, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end
