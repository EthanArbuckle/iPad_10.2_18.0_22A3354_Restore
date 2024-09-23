@implementation MFMessageChangeManager_iOS

- (MFMessageChangeManager_iOS)initWithLibrary:(id)a3 database:(id)a4 localActionPersistence:(id)a5 messagePersistence:(id)a6 serverMessagePersistenceFactory:(id)a7 readLaterPersistence:(id)a8 categoryPersistence:(id)a9 bimiManager:(id)a10 hookResponder:(id)a11 hookRegistry:(id)a12
{
  id v18;
  MFMessageChangeManager_iOS *v19;
  MFMessageChangeManager_iOS *v20;
  objc_super v22;

  v18 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MFMessageChangeManager_iOS;
  v19 = -[EDMessageChangeManager initWithDatabase:localActionPersistence:messagePersistence:serverMessagePersistenceFactory:readLaterPersistence:categoryPersistence:bimiManager:hookResponder:hookRegistry:](&v22, sel_initWithDatabase_localActionPersistence_messagePersistence_serverMessagePersistenceFactory_readLaterPersistence_categoryPersistence_bimiManager_hookResponder_hookRegistry_, a4, a5, a6, a7, a8, a9, a10, a11, a12);
  v20 = v19;
  if (v19)
    objc_storeWeak((id *)&v19->_library, v18);

  return v20;
}

- (id)moveMessages:(id)a3 destinationMailboxURL:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  objc_super v12;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[MFMessageChangeManager_iOS _recordFrecencyEventWithMailboxURL:](self, "_recordFrecencyEventWithMailboxURL:", v9);
  v12.receiver = self;
  v12.super_class = (Class)MFMessageChangeManager_iOS;
  -[EDMessageChangeManager moveMessages:destinationMailboxURL:userInitiated:](&v12, sel_moveMessages_destinationMailboxURL_userInitiated_, v8, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)copyMessages:(id)a3 destinationMailboxURL:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  objc_super v12;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[MFMessageChangeManager_iOS _recordFrecencyEventWithMailboxURL:](self, "_recordFrecencyEventWithMailboxURL:", v9);
  v12.receiver = self;
  v12.super_class = (Class)MFMessageChangeManager_iOS;
  v10 = -[EDMessageChangeManager copyMessages:destinationMailboxURL:userInitiated:](&v12, sel_copyMessages_destinationMailboxURL_userInitiated_, v8, v9, v5);

  return v10;
}

- (id)addNewMessages:(id)a3 mailboxURL:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  objc_super v12;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[MFMessageChangeManager_iOS _recordFrecencyEventWithMailboxURL:](self, "_recordFrecencyEventWithMailboxURL:", v9);
  v12.receiver = self;
  v12.super_class = (Class)MFMessageChangeManager_iOS;
  -[EDMessageChangeManager addNewMessages:mailboxURL:userInitiated:](&v12, sel_addNewMessages_mailboxURL_userInitiated_, v8, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_recordFrecencyEventWithMailboxURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1D8]), "initWithURL:", v4);
    if (v5)
    {
      -[MFMessageChangeManager_iOS library](self, "library");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mailboxFrecencyController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recordEventWithMailboxIDs:", v8);

    }
  }

}

- (id)reflectNewMessages:(id)a3 mailboxURL:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFMessageChangeManager_iOS;
  -[EDMessageChangeManager reflectNewMessages:mailboxURL:](&v5, sel_reflectNewMessages_mailboxURL_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)messagesToJournalForMessages:(id)a3 inMailbox:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  +[MailAccount accountWithURL:](MailAccount, "accountWithURL:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "ef_filter:", &__block_literal_global_45);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (BOOL)persistNewMessages:(id)a3 mailboxURL:(id)a4 oldMessagesByNewMessage:(id)a5 fromSyncing:(BOOL)a6
{
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *i;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  BOOL v30;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  MFMessageChangeManager_iOS *v36;
  char v37;
  BOOL v38;

  v11 = a3;
  v12 = a4;
  v33 = a5;
  objc_msgSend(v11, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(a5) = objc_opt_isKindOfClass();

  if ((a5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMessageChangeManager_iOS.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[messages.firstObject isKindOfClass:[MFMessage class]]"));

  }
  v14 = v11;
  objc_msgSend(v12, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    i = 0;
  }
  else
  {
    v18 = objc_msgSend(v14, "count");
    for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v18); v18; --v18)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "addObject:", v19);

    }
  }
  v20 = -[EDMessageChangeManager mailboxURLIsInRemoteAccount:](self, "mailboxURLIsInRemoteAccount:", v12);
  v21 = objc_msgSend(v16, "mailboxType") == 6;
  objc_msgSend(v14, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "mailbox");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    v25 = !-[EDMessageChangeManager mailboxURL:isInSameAccountAsMailboxURL:](self, "mailboxURL:isInSameAccountAsMailboxURL:", v24, v12);
  else
    v25 = 0;
  v26 = (void *)objc_opt_new();
  -[MFMessageChangeManager_iOS library](self, "library");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v27, "addMessages:withMailbox:newMessagesByOldMessage:remoteIDs:setFlags:addPOPUIDs:dataSectionsByMessage:generationWindow:", v14, v16, v26, i, 0, 0, 0, 0);

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __96__MFMessageChangeManager_iOS_persistNewMessages_mailboxURL_oldMessagesByNewMessage_fromSyncing___block_invoke;
  v34[3] = &unk_1E4E8D5A0;
  v29 = v33;
  v37 = v25;
  v38 = v21;
  v35 = v29;
  v36 = self;
  objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v34);
  v30 = objc_msgSend(v26, "count") != 0;

  return v30;
}

- (void)deletePersistedMessages:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "ef_objectsPassingTest:", &__block_literal_global_31_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1EB18], "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "Deleting persisted messages: %@", buf, 0xCu);
    }

    -[MFMessageChangeManager_iOS library](self, "library");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "compactMessages:permanently:notifyPersistence:", v5, 1, 0);

    objc_msgSend(v5, "ef_groupBy:", &__block_literal_global_36);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageChangeManager_iOS library](self, "library");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mailboxURLsForIDs:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D1EB18], "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_INFO, "Persisted messages were deleted { %@ }", buf, 0xCu);
    }

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__MFMessageChangeManager_iOS_deletePersistedMessages___block_invoke_38;
    v14[3] = &unk_1E4E8D628;
    v13 = v11;
    v15 = v13;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);

  }
}

- (BOOL)haveCompleteMIMEForMessage:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = 0;
    -[MFMessageChangeManager_iOS library](self, "library");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "areMessageContentsLocallyAvailable:fullContentsAvailble:", v4, &v9);

    if (v9)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)mailboxDatabaseIDForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[MFMessageChangeManager_iOS library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "mailboxIDForURLString:createIfNecessary:", v6, 1);

  return v7;
}

- (void)setRemoteID:(id)a3 onMessageWithDatabaseID:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MFMessageChangeManager_iOS library](self, "library");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageWithLibraryID:options:inMailbox:", a4, 7346239, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setRemoteID:", v8);
  objc_msgSend(v7, "commit");

}

- (void)setData:(id)a3 onMessage:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMessageChangeManager_iOS.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[message isKindOfClass:[MFLibraryMessage class]]"));

  }
  objc_msgSend(v7, "mailbox");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[EDMessageChangeManager mailboxURLIsInRemoteAccount:](self, "mailboxURLIsInRemoteAccount:", v9);

  -[MFMessageChangeManager_iOS library](self, "library");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v11, "setData:forMessageToAppend:", v13, v7);
  else
    objc_msgSend(v11, "setData:forMessage:isPartial:", v13, v7, 0);

}

- (void)checkForNewActionsInMailboxID:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[MFMessageChangeManager_iOS library](self, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "urlForMailboxID:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[MailAccount accountWithURLString:](MailAccount, "accountWithURLString:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "newActionsAdded");

}

- (void)actionHasChangedAccount:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "mailboxURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount accountWithURL:](MailAccount, "accountWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addNewAction:", v5);
}

- (void)didReflectNewMessages:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)MFMessageChangeManager_iOS;
  v13 = a3;
  -[EDMessageChangeManager didReflectNewMessages:](&v19, sel_didReflectNewMessages_);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v13;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "mailbox");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "type") == 7)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "addObject:", v9);
          }
          else
          {
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v9, 0);
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);
          }

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v6);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__MFMessageChangeManager_iOS_didReflectNewMessages___block_invoke;
  v14[3] = &unk_1E4E8D710;
  v14[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v14);

}

- (void)messageWasAppended:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMessageChangeManager_iOS library](self, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "increaseProtectionOnFileForMessage:", v5);

}

- (void)resetStatusCountsForMailboxWithURL:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "absoluteString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "shouldUseNonDeletedForUnreadCount") & 1) == 0)
  {
    -[MFMessageChangeManager_iOS library](self, "library");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLastSyncAndMostRecentStatusCount:forMailbox:", *MEMORY[0x1E0D1DC58], v6);

  }
}

- (id)applyFlagChange:(id)a3 toMessagesInDatabase:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  MFFlagChangeDictionaryForFlagChange(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFlagsLocallyFromDictionary:forMessages:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)applyVIPStatus:(BOOL)a3 toMessagesInDatabase:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v4 = a3;
  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[MFMessageChangeManager_iOS library](self, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("MessageSenderIsVIP");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "setFlagsFromDictionary:forMessages:", v9, v6);

}

- (id)addLabels:(id)a3 removeLabels:(id)a4 toMessagesInDatabase:(id)a5
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)messageForDatabaseID:(int64_t)a3
{
  void *v4;
  void *v5;

  -[MFMessageChangeManager_iOS library](self, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageWithLibraryID:options:inMailbox:", a3, 7346239, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)messagesForRemoteIDs:(id)a3 mailboxURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[MFMessageChangeManager_iOS library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "copyMessagesWithRemoteIDs:options:inRemoteMailbox:", v9, 7346239, v10);

  return v11;
}

- (id)iterateMessagesInMailboxURLs:(id)a3 excludingMessages:(id)a4 batchSize:(unint64_t)a5 returnMessagesForFlagChange:(id)a6 handler:(id)a7
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  char v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void (**v41)(id, id);
  void (**v42)(id, id);
  id v43;
  unint64_t v45;
  uint64_t v46;
  id v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  void (**v57)(id, id);
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[2];
  uint8_t buf[4];
  uint64_t v65;
  _BYTE v66[128];
  uint64_t v67;

  v45 = a5;
  v67 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v48 = a4;
  v52 = a6;
  v49 = a7;
  v51 = v10;
  v50 = (void *)objc_opt_new();
  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFMessageCriterion criterionForMailboxURL:](MFMessageCriterion, "criterionForMailboxURL:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v60 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_msgSend(v19, "absoluteString", v45);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[MFMessageCriterion criterionForMailboxURL:](MFMessageCriterion, "criterionForMailboxURL:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v14, "addObject:", v21);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D1EB18], "log");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v19, "absoluteString");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[MFMessageChangeManager_iOS iterateMessagesInMailboxURLs:excludingMessages:batchSize:returnMessagesForFlagChange:handler:].cold.1(v23, buf, &v65, v22);
            }

          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
      }
      while (v16);
    }

    +[MFMessageCriterion orCompoundCriterionWithCriteria:](MFMessageCriterion, "orCompoundCriterionWithCriteria:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0D1E778], "setRead", v45);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v52, "isEqual:", v24);

  if (v25)
  {
    +[MFMessageCriterion unreadMessageCriterion](MFMessageCriterion, "unreadMessageCriterion");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1E778], "clearRead");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v52, "isEqual:", v27);

    if ((v28 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D1E778], "clearRead");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v52, "isEqual:", v29);

      if ((v30 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D1E778], "clearRead");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v52, "isEqual:", v31);

        if (!v32)
        {
          v33 = 0;
          goto LABEL_24;
        }
      }
    }
    +[MFMessageCriterion readMessageCriterion](MFMessageCriterion, "readMessageCriterion");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v26;
  if (v26)
  {
    v63[0] = v13;
    v63[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v34);
    v35 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v35;
  }
LABEL_24:
  v36 = (void *)objc_opt_new();
  -[MFMessageChangeManager_iOS library](self, "library");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __123__MFMessageChangeManager_iOS_iterateMessagesInMailboxURLs_excludingMessages_batchSize_returnMessagesForFlagChange_handler___block_invoke;
  v53[3] = &unk_1E4E8D738;
  v38 = v48;
  v54 = v38;
  v39 = v50;
  v55 = v39;
  v40 = v36;
  v56 = v40;
  v58 = v46;
  v41 = (void (**)(id, id))v49;
  v57 = v41;
  objc_msgSend(v37, "iterateMessagesMatchingCriterion:options:handler:", v13, 7346367, v53);

  if (objc_msgSend(v40, "count"))
    v41[2](v41, v40);
  v42 = v57;
  v43 = v39;

  return v43;
}

- (id)accountForMailboxURL:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount accountWithURLString:](MailAccount, "accountWithURLString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)mailboxIsAllMail:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount accountWithURL:](MailAccount, "accountWithURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isGmailAccount"))
    v8 = objc_msgSend(v6, "type") == 2;
  else
    v8 = 0;

  return v8;
}

- (BOOL)mailboxPartOfAllMail:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  BOOL v10;

  v3 = a3;
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount accountWithURL:](MailAccount, "accountWithURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");
  objc_msgSend(v5, "baseAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isGmailAccount");
  if ((unint64_t)(v7 - 4) < 0xFFFFFFFFFFFFFFFDLL)
    v10 = v9;
  else
    v10 = 0;

  return v10;
}

- (void)willStartPersistenceDidAddMessages:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFMessageChangeManager_iOS;
  -[EDMessageChangeManager willStartPersistenceDidAddMessages:](&v6, sel_willStartPersistenceDidAddMessages_, v4);
  -[MFMessageChangeManager_iOS library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willStartPersistenceDidAddMessages:", v4);

}

- (void)didFinishPersistenceDidAddMessages:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFMessageChangeManager_iOS;
  -[EDMessageChangeManager didFinishPersistenceDidAddMessages:](&v6, sel_didFinishPersistenceDidAddMessages_, v4);
  -[MFMessageChangeManager_iOS library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didFinishPersistenceDidAddMessages:", v4);

}

- (MFMailMessageLibrary)library
{
  return (MFMailMessageLibrary *)objc_loadWeakRetained((id *)&self->_library);
}

- (void)setLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_library, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_library);
}

- (void)iterateMessagesInMailboxURLs:(_QWORD *)a3 excludingMessages:(os_log_t)log batchSize:returnMessagesForFlagChange:handler:.cold.1(void *a1, uint8_t *buf, _QWORD *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_fault_impl(&dword_1A4F90000, log, OS_LOG_TYPE_FAULT, "messagesInMailboxURLCriterion is nil for mailboxURL %@", buf, 0xCu);

}

@end
