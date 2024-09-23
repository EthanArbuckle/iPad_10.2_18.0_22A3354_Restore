@implementation CKConversationMutedChatListMigrator

- (void)migrateMutedChatListInfoIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;

  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    -[CKConversationMutedChatListMigrator performMutedChatListMigrationIfNecessary](self, "performMutedChatListMigrationIfNecessary");
}

- (id)_dnd_deprecated_globalIdentifierForChat:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "chatStyle") == 45)
    objc_msgSend(v3, "chatIdentifier");
  else
    objc_msgSend(v3, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)performMutedChatListMigrationIfNecessary
{
  CFIndex AppIntegerValue;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CFIndex v38;
  CKConversationMutedChatListMigrator *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  Boolean keyExistsAndHasValidFormat;
  _BYTE v49[128];
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("CKDNDMigrationKey"), CFSTR("com.apple.MobileSMS.CKDNDList"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppIntegerValue < 1;
  else
    v4 = 1;
  if (v4)
  {
    v38 = AppIntegerValue;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v45;
      v39 = self;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v45 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "chat");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "valueForChatProperty:", CFSTR("CKChatUnmuteTime"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "doubleValue");
            if (v14 > 0.0)
            {
              v15 = (void *)MEMORY[0x1E0C99D68];
              objc_msgSend(v13, "doubleValue");
              objc_msgSend(v15, "dateWithTimeIntervalSince1970:");
              v16 = objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                v17 = (void *)v16;
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "setValue:forChatProperty:", v18, CFSTR("CKChatUnmuteTime"));

                objc_msgSend(MEMORY[0x1E0D39970], "sharedList");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[CKConversationMutedChatListMigrator _dnd_deprecated_globalIdentifierForChat:](self, "_dnd_deprecated_globalIdentifierForChat:", v11);
                v20 = objc_claimAutoreleasedReturnValue();
                v21 = (void *)v20;
                if (v20)
                {
                  v50 = v20;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
                  v22 = v8;
                  v23 = v9;
                  v24 = v6;
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "muteChatWithMuteIdentifiers:untilDate:syncToPairedDevice:", v25, v17, 0);

                  v6 = v24;
                  v9 = v23;
                  v8 = v22;
                }

                self = v39;
              }
            }
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      }
      while (v8);
    }

    AppIntegerValue = v38;
  }
  if (AppIntegerValue <= 1)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "conversations");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v41 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "chat");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D39970], "sharedList");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKConversationMutedChatListMigrator _dnd_deprecated_globalIdentifierForChat:](self, "_dnd_deprecated_globalIdentifierForChat:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "unmuteDateForMuteIdentifier:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            objc_msgSend(MEMORY[0x1E0D39970], "sharedList");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "muteChat:untilDate:syncToPairedDevice:", v32, v35, 0);

          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v29);
    }

    CFPreferencesSetAppValue(CFSTR("CKDNDMigrationKey"), &unk_1E2870558, CFSTR("com.apple.MobileSMS.CKDNDList"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.MobileSMS.CKDNDList"));
    objc_msgSend(MEMORY[0x1E0D39970], "sharedList");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "syncToPairedDeviceIncludingVersion:", 1);

  }
}

@end
