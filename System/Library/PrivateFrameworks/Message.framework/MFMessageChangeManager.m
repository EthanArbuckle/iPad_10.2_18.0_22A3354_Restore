@implementation MFMessageChangeManager

uint64_t __69__MFMessageChangeManager_iOS_messagesToJournalForMessages_inMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "isSearchResultWithBogusRemoteId") ^ 1;
  else
    v3 = 1;

  return v3;
}

void __96__MFMessageChangeManager_iOS_persistNewMessages_mailboxURL_oldMessagesByNewMessage_fromSyncing___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);
  if (*(_BYTE *)(a1 + 48) || *(_BYTE *)(a1 + 49))
  {
    v9 = 0;
    objc_msgSend(v5, "messageDataIsComplete:downloadIfNecessary:", &v9, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "library");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setData:forMessageToAppend:", v7, v6);

    }
  }

}

uint64_t __54__MFMessageChangeManager_iOS_deletePersistedMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __54__MFMessageChangeManager_iOS_deletePersistedMessages___block_invoke_34(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "mailboxID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __54__MFMessageChangeManager_iOS_deletePersistedMessages___block_invoke_38(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messagesWereDeleted:", v9);

}

void __52__MFMessageChangeManager_iOS_didReflectNewMessages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t i;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _QWORD v66[4];

  v66[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v45 = a3;
  v40 = v4;
  v5 = objc_alloc(MEMORY[0x1E0D1E1D8]);
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "initWithURL:", v6);

  v8 = (void *)MEMORY[0x1E0D1E1E0];
  v41 = (void *)v7;
  v66[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mailboxScopeForMailboxObjectIDs:forExclusion:", v9, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messagesForPersistedMessages:mailboxScope:", v45, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v44, "ef_compactMap:", &__block_literal_global_46);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v45;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
  if (v48)
  {
    v47 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v57 != v47)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        if (objc_msgSend(v11, "updateSubjectFromEncryptedContent", v40))
        {
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
          objc_msgSend(v11, "subject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "subjectWithoutPrefix");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "updateUnprefixedSubjectTo:forMessage:", v14, v11);

        }
        objc_msgSend(v11, "signatureInfo");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
        {
          v49 = (void *)v15;
          v17 = objc_alloc(MEMORY[0x1E0D1E0D0]);
          objc_msgSend(v16, "smimeCapabilities");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "signingDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            v20 = v18;
          else
            v20 = (void *)MEMORY[0x1E0C9AA60];
          v21 = (void *)objc_msgSend(v17, "initWithCapabilities:date:", v20, v19);

          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          objc_msgSend(v49, "addresses");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
          if (v23)
          {
            v24 = *(_QWORD *)v53;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v53 != v24)
                  objc_enumerationMutation(v22);
                v26 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
                objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v26;
                objc_msgSend(v28, "emailAddressValue");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "simpleAddress");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = v30;
                if (v30)
                {
                  v32 = v30;
                }
                else
                {
                  objc_msgSend(v28, "stringValue");
                  v32 = (id)objc_claimAutoreleasedReturnValue();
                }
                v33 = v32;

                objc_msgSend(v27, "setMetadata:forAddress:", v21, v33);
              }
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
            }
            while (v23);
          }

          v16 = v49;
        }

      }
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    }
    while (v48);
  }

  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForRecentEmails");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v42, "copy");
  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, v34);

  objc_msgSend(MEMORY[0x1E0D1EB18], "log");
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = objc_msgSend(v44, "count");
    objc_msgSend(v41, "ef_publicDescription");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v61 = v38;
    v62 = 2114;
    v63 = v39;
    _os_log_impl(&dword_1A4F90000, v37, OS_LOG_TYPE_DEFAULT, "Notifying CoreDuet about %lu new messages in %{public}@", buf, 0x16u);

  }
}

id __52__MFMessageChangeManager_iOS_didReflectNewMessages___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serializedRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "identifierKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

  objc_msgSend(MEMORY[0x1E0D15C58], "incomingKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v7);

  objc_msgSend(v2, "subject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subjectWithoutPrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "subjectKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

  objc_msgSend(v2, "senderAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emailAddressValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "simpleAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "senderKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v14);

  objc_msgSend(v2, "toList");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ef_compactMap:", &__block_literal_global_51);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v16;
  objc_msgSend(v2, "ccList");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ef_compactMap:", &__block_literal_global_51);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v18;
  objc_msgSend(v2, "bccList");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ef_compactMap:", &__block_literal_global_51);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ef_uniquifyWithComparator:", &__block_literal_global_53);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C58], "recipientsKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, v23);

  objc_msgSend(v2, "mailboxes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "accountIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "representedObjectID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "accountIdentifierKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, v28);

  return v3;
}

id __52__MFMessageChangeManager_iOS_didReflectNewMessages___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "emailAddressValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simpleAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __52__MFMessageChangeManager_iOS_didReflectNewMessages___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __123__MFMessageChangeManager_iOS_iterateMessagesInMailboxURLs_excludingMessages_batchSize_returnMessagesForFlagChange_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    objc_msgSend(v12, "mailbox");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D1DB68]);

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "uid");
      if (!v7 || v8 < objc_msgSend(v7, "intValue"))
      {
        objc_msgSend(v12, "remoteID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v4);

      }
    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
    if (objc_msgSend(*(id *)(a1 + 48), "count") == *(_QWORD *)(a1 + 64))
    {
      v10 = *(_QWORD *)(a1 + 56);
      v11 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

      objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
    }

  }
}

@end
