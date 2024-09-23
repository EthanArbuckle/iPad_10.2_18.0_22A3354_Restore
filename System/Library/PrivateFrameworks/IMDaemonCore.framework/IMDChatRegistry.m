@implementation IMDChatRegistry

- (void)_enumeratePersonMergedChatsWithMaximumNumberOfChats:(int64_t)a3 usingChats:(id)a4 useCachedChatGroups:(BOOL)a5 includingPinnedChatIdentifiers:(id)a6 usingBlock:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  v14 = (void (**)(id, _QWORD, void *))a7;
  -[IMDChatRegistry _chatGUIDToChatMapForChats:](self, "_chatGUIDToChatMapForChats:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry _fixUpChatParticipantsIfNeeded:usingChatGUIDToChatMap:](self, "_fixUpChatParticipantsIfNeeded:usingChatGUIDToChatMap:", v12, v15);
  v27 = v12;
  if (a5)
    -[IMDChatRegistry groupChatsBasedOnIdentityUsingCacheIfApplicable:](self, "groupChatsBasedOnIdentityUsingCacheIfApplicable:", v12);
  else
    -[IMDChatRegistry groupChatsBasedOnIdentity:](self, "groupChatsBasedOnIdentity:", v12);
  v16 = objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry sortPersonCentricChatGroups:](self, "sortPersonCentricChatGroups:", v16, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v13;
  -[IMDChatRegistry truncatedSortedChatsGroupedByPersonCentricID:count:pinnedChatIdentifiers:](self, "truncatedSortedChatsGroupedByPersonCentricID:count:pinnedChatIdentifiers:", v17, a3, v13);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        v23 = (void *)MEMORY[0x1D17EA968]();
        -[IMDChatRegistry _mergedPinningIdentifiersForChats:chatGUIDToChatMap:groupedChatsByPersonCentricIdWithSortedChats:](self, "_mergedPinningIdentifiersForChats:chatGUIDToChatMap:groupedChatsByPersonCentricIdWithSortedChats:", v22, v15, v17);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v14[2](v14, v22, v24);

        objc_autoreleasePoolPop(v23);
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v19);
  }

}

- (void)repairInconsistentMergedChatsIfNecessary:(id)a3
{
  id v4;

  v4 = a3;
  -[IMDChatRegistry _repairInconsistentGroupPhotoGuidAcrossMergedChatsIfNecessary:](self, "_repairInconsistentGroupPhotoGuidAcrossMergedChatsIfNecessary:", v4);
  -[IMDChatRegistry _repairInconsistentJoinStatesAcrossMergedChatsIfNecessary:](self, "_repairInconsistentJoinStatesAcrossMergedChatsIfNecessary:", v4);

}

- (void)_repairInconsistentJoinStatesAcrossMergedChatsIfNecessary:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  _BYTE v37[18];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[IMDChatRegistry _hasInconsistentJoinStateAcrossMergedChats:](self, "_hasInconsistentJoinStateAcrossMergedChats:", v4))goto LABEL_39;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Join state inconsistency detected among merged chats. Attempting to repair", buf, 2u);
    }

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = v4;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v33;
    v10 = 3;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v12, "service");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "supportsMutatingGroupMembers");

        if (v14)
        {
          v10 = objc_msgSend(v12, "state");
          v8 = 1;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v7);

    if ((v8 & 1) != 0)
      goto LABEL_22;
  }
  else
  {

    v10 = 3;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Couldn't find a chat whose service supports group mutability. Setting all chats to joined.", buf, 2u);
    }

  }
LABEL_22:
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  v18 = 0;
  if (v17)
  {
    v19 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        if (objc_msgSend(v21, "state") != v10)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v21, "guid");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v37 = v23;
              *(_WORD *)&v37[8] = 2048;
              *(_QWORD *)&v37[10] = v10;
              _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Repairing join state of %@ to %ld", buf, 0x16u);

            }
          }
          objc_msgSend(v21, "setState:", v10);
          +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "storeChat:", v21);

          ++v18;
        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v17);
  }

  v4 = v27;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = objc_msgSend(v16, "count");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v37 = v18;
      *(_WORD *)&v37[4] = 2048;
      *(_QWORD *)&v37[6] = v26;
      _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Repaired join state for %d of %lu chats", buf, 0x12u);
    }

    v4 = v27;
  }
LABEL_39:

}

- (void)_repairInconsistentGroupPhotoGuidAcrossMergedChatsIfNecessary:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  IMDChatRegistry *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMDChatRegistry _hasInconsistentGroupPhotoGUIDAcrossMergedChats:](self, "_hasInconsistentGroupPhotoGUIDAcrossMergedChats:", v4))
  {
    v33 = self;
    v31 = v4;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Group photo inconsistency detected among merged chats. Attempting to repair", buf, 2u);
      }

    }
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v7 = v31;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v39 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v11, "groupPhotoGuid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "guid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v43 = v13;
              v44 = 2112;
              v45 = v12;
              _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "    Chat %@ has groupPhotoGuid %@", buf, 0x16u);
            }

          }
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
      }
      while (v8);
    }

    -[IMDChatRegistry _preferredFileTransferFromGroupPhotoGUIDs:](v33, "_preferredFileTransferFromGroupPhotoGUIDs:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v15;
    if (v15)
    {
      objc_msgSend(v15, "guid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v43 = v16;
          v44 = 2112;
          v45 = v32;
          _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "The preferred groupPhotoGuid is %@. Transfer: %@", buf, 0x16u);
        }

      }
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v18 = v7;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v35;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v35 != v20)
              objc_enumerationMutation(v18);
            v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
            objc_msgSend(v22, "guid");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "groupPhotoGuid");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "isEqualToString:", v16);
            v26 = IMOSLoggingEnabled();
            if ((v25 & 1) != 0)
            {
              if (v26)
              {
                OSLogHandleForIMFoundationCategory();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v43 = v23;
                  v44 = 2112;
                  v45 = v24;
                  _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Chat %@ already had groupPhotoGuid %@, leaving as is.", buf, 0x16u);
                }

              }
            }
            else
            {
              if (v26)
              {
                OSLogHandleForIMFoundationCategory();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  v43 = v16;
                  v44 = 2112;
                  v45 = v23;
                  v46 = 2112;
                  v47 = v24;
                  _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Applying groupPhotoGuid %@ to chat %@ which previously had groupPhotoGuid %@", buf, 0x20u);
                }

              }
              objc_msgSend(v22, "updateGroupPhotoGuid:", v16);
            }

          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
        }
        while (v19);
      }

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Completed repair of group photo inconsistency.", buf, 2u);
        }

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Could not determine a preferred group photo among inconsistent merged chats. Leaving inconsistency as is.", buf, 2u);
      }

    }
    v4 = v31;
  }

}

- (BOOL)_hasInconsistentJoinStateAcrossMergedChats:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "state");

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "state", (_QWORD)v13) != v6)
          {
            v4 = 1;
            goto LABEL_13;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
          continue;
        break;
      }
    }
    v4 = 0;
LABEL_13:

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_hasInconsistentGroupPhotoGUIDAcrossMergedChats:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupPhotoGuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v3;
    v4 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "groupPhotoGuid", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10 != v6)
          {
            v12 = !v10 || v6 == 0;
            if (v12 || (objc_msgSend(v10, "isEqualToString:", v6) & 1) == 0)
            {

              LOBYTE(v4) = 1;
              goto LABEL_18;
            }
          }

        }
        v4 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_18:

  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)_mergedPinningIdentifiersForChats:(id)a3 chatGUIDToChatMap:(id)a4 groupedChatsByPersonCentricIdWithSortedChats:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id obj;
  uint64_t v30;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *context;
  uint64_t v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v32 = a4;
  v39 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v28 = v7;
    obj = v7;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v33)
    {
      v30 = *(_QWORD *)v49;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v49 != v30)
            objc_enumerationMutation(obj);
          v37 = v9;
          v10 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v9);
          context = (void *)MEMORY[0x1D17EA968]();
          objc_msgSend(v10, "pinningIdentifier");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v8, "addObject:", v11);
          v35 = (void *)v11;
          objc_msgSend(v10, "originalGroupID", v28);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12 && objc_msgSend(v10, "style") != 45)
            objc_msgSend(v8, "addObject:", v12);
          v34 = (void *)v12;
          -[IMDChatRegistry _siblingChatsForChat:usingChatGUIDToChatMap:iMessageChat:](self, "_siblingChatsForChat:usingChatGUIDToChatMap:iMessageChat:", v10, v32, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v38 = v13;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v45;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v45 != v16)
                  objc_enumerationMutation(v38);
                objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v17), "personCentricID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "objectForKeyedSubscript:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = 0u;
                v41 = 0u;
                v42 = 0u;
                v43 = 0u;
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
                if (v20)
                {
                  v21 = v20;
                  v22 = *(_QWORD *)v41;
                  do
                  {
                    v23 = 0;
                    do
                    {
                      if (*(_QWORD *)v41 != v22)
                        objc_enumerationMutation(v19);
                      objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v23), "pinningIdentifier");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v24)
                        objc_msgSend(v8, "addObject:", v24);

                      ++v23;
                    }
                    while (v21 != v23);
                    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
                  }
                  while (v21);
                }

                ++v17;
              }
              while (v17 != v15);
              v15 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
            }
            while (v15);
          }

          objc_autoreleasePoolPop(context);
          v9 = v37 + 1;
        }
        while (v37 + 1 != v33);
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      }
      while (v33);
    }

    objc_msgSend(v8, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");

    v7 = v28;
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v26;
}

- (void)_fixUpChatParticipantsIfNeeded:(id)a3 usingChatGUIDToChatMap:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  int buf;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Attempting to fix up chat participants if needed", (uint8_t *)&buf, 2u);
    }

  }
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[IMDChatRegistry _chatGUIDToChatMapForChats:](self, "_chatGUIDToChatMapForChats:", v19);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v19;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x1D17EA968]();
        v20 = 0;
        -[IMDChatRegistry _siblingChatsForChat:usingChatGUIDToChatMap:iMessageChat:](self, "_siblingChatsForChat:usingChatGUIDToChatMap:iMessageChat:", v14, v9, &v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v20;
        v18 = objc_msgSend(v16, "count");
        if (self && v18)
          -[IMDChatRegistry _fixSiblingChatsAndStoreIfNeeded:iMessageChat:chatsToRegenerate:](self, "_fixSiblingChatsAndStoreIfNeeded:iMessageChat:chatsToRegenerate:", v16, v17, 0);

        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v11);
  }

}

- (id)stringForChatStyle:(unsigned __int8)a3
{
  const __CFString *v3;

  v3 = CFSTR("-");
  if (a3 == 43)
    v3 = CFSTR("+");
  if (a3 == 35)
    return CFSTR("#");
  else
    return (id)v3;
}

- (id)_chatGUIDToChatMapForChats:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "guid", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)truncatedSortedChatsGroupedByPersonCentricID:(id)a3 count:(int64_t)a4 pinnedChatIdentifiers:(id)a5
{
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  int64_t v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v26 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v30 = a4;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Truncating person centric grouped chats to %ld chats.", buf, 0xCu);
    }

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v26);
  objc_msgSend(v25, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1D1417EAC;
  v27[3] = &unk_1E922C818;
  v10 = v8;
  v28 = v10;
  objc_msgSend(v9, "sortedArrayUsingComparator:", v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  if (v12 >= a4)
    v13 = a4;
  else
    v13 = v12;
  objc_msgSend(v11, "subarrayWithRange:", 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subarrayWithRange:", v13, objc_msgSend(v11, "count") - v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "__imArrayByFilteringWithBlock:", &unk_1E922C858);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  v18 = 200;
  if (v17 < 0xC8)
    v18 = objc_msgSend(v16, "count");
  objc_msgSend(v16, "subarrayWithRange:", 0, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = objc_msgSend(v16, "count");
      v22 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 134218496;
      v30 = v21;
      v31 = 2048;
      v32 = a4;
      v33 = 2048;
      v34 = v22;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Found %ld chats with unread messages that would have been cutoff by a count of %ld of out %ld total cutoff chat groups", buf, 0x20u);
    }

  }
  objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)sortPersonCentricChatGroups:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1D1417DE0;
  v8[3] = &unk_1E9228890;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

- (id)recoverableMessagesMetadata
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadRecoverableMessagesMetadataGroupedByChatGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSMutableDictionary)personCentricGroupedChatsCache
{
  return self->_personCentricGroupedChatsCache;
}

- (id)personCentricGroupedChatsArrayWithMaximumNumberOfChats:(int64_t)a3 skipsLastMessageLoading:(BOOL)a4 usingChats:(id)a5 useCachedChatGroups:(BOOL)a6 includingPinnedChatIdentifiers:(id)a7 repairInconsistentMergedChats:(BOOL)a8
{
  _BOOL8 v10;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v19[6];
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v10 = a6;
  v29 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a7;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1D15213F4;
  v25 = sub_1D1521404;
  v26 = 0;
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1D14186CC;
  v19[3] = &unk_1E922C8C8;
  v20 = a8;
  v19[4] = self;
  v19[5] = &v21;
  if (IMOSLoggingEnabled(-[IMDChatRegistry _enumeratePersonMergedChatsWithMaximumNumberOfChats:usingChats:useCachedChatGroups:includingPinnedChatIdentifiers:usingBlock:](self, "_enumeratePersonMergedChatsWithMaximumNumberOfChats:usingChats:useCachedChatGroups:includingPinnedChatIdentifiers:usingBlock:", a3, v13, v10, v14, v19)))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)v22[5], "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v16;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Number of person centric chats created to send to client %@", buf, 0xCu);

    }
  }
  v17 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v17;
}

- (id)groupChatsBasedOnIdentityUsingCacheIfApplicable:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint8_t v11[16];

  v4 = a3;
  -[IMDChatRegistry personCentricGroupedChatsCache](self, "personCentricGroupedChatsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    -[IMDChatRegistry groupChatsBasedOnIdentity:](self, "groupChatsBasedOnIdentity:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    -[IMDChatRegistry setPersonCentricGroupedChatsCache:](self, "setPersonCentricGroupedChatsCache:", v8);
LABEL_6:

    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Using person centric grouped chats cache", v11, 2u);
    }
    goto LABEL_6;
  }
LABEL_7:
  -[IMDChatRegistry personCentricGroupedChatsCache](self, "personCentricGroupedChatsCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)filterediMessageChatsExist
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = *MEMORY[0x1E0D38F68];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[IMDChatRegistry filteredChatsExistForServices:](self, "filteredChatsExistForServices:", v3);

  return (char)self;
}

- (id)existingChatsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 olderThan:(id)a5 limit:(unint64_t)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a4;
  v10 = a5;
  v11 = a3;
  -[IMDChatRegistry chatStore](self, "chatStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "chatsFilteredUsingPredicate:sortedUsingLastMessageDateAscending:olderThan:limit:", v11, v7, v10, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDChatRegistry _addChatsFromCacheMisses:preferExistingChats:](self, "_addChatsFromCacheMisses:preferExistingChats:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)existingChatsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 limit:(unint64_t)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_existingChatsFilteredUsingPredicate_sortedUsingLastMessageDateAscending_olderThan_limit_);
}

- (NSArray)chats
{
  return (NSArray *)-[IMDChatRegistry _chatsWithBlackholed:](self, "_chatsWithBlackholed:", 0);
}

- (IMDChatStore)chatStore
{
  IMDChatStore *chatStore;
  IMDChatStore *v4;
  IMDChatStore *v5;

  chatStore = self->_chatStore;
  if (!chatStore)
  {
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v4 = (IMDChatStore *)objc_claimAutoreleasedReturnValue();
    v5 = self->_chatStore;
    self->_chatStore = v4;

    chatStore = self->_chatStore;
  }
  return chatStore;
}

- (id)blackholedChats
{
  return -[IMDChatRegistry _chatsWithBlackholed:](self, "_chatsWithBlackholed:", 1);
}

- (BOOL)blackholedChatsExist
{
  void *v2;
  BOOL v3;

  -[IMDChatRegistry blackholedChats](self, "blackholedChats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)aliasToCNIDMap
{
  return (id)-[NSMutableDictionary copy](self->_cachedAliasToCNIDMap, "copy");
}

- (id)_chatsWithBlackholed:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v8[4];
  BOOL v9;

  -[NSRecursiveLock lock](self->_chatsLock, "lock");
  -[NSMutableDictionary allValues](self->_chats, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1D1417E48;
  v8[3] = &unk_1E922C5D8;
  v9 = a3;
  objc_msgSend(v5, "__imArrayByFilteringWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSRecursiveLock unlock](self->_chatsLock, "unlock");
  return v6;
}

- (id)_addChatsFromCacheMisses:(id)a3 preferExistingChats:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSRecursiveLock **p_chatsLock;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  v19 = v6;
  if (v4)
  {
    p_chatsLock = &self->_chatsLock;
    -[NSRecursiveLock lock](self->_chatsLock, "lock");
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1D152436C;
    v24[3] = &unk_1E922C688;
    v24[4] = self;
    objc_msgSend(v7, "__imArrayByApplyingBlock:", v24);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[NSRecursiveLock unlock](*p_chatsLock, "unlock");
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    v12 = v11;
    if (v11)
    {
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
          if (IMOSLoggingEnabled(v11))
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v15, "guid");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v26 = v17;
              _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Adding cache missed chat with GUID %@, not preferring existing chats", buf, 0xCu);

            }
          }
          v11 = -[IMDChatRegistry addChat:firstLoad:store:](self, "addChat:firstLoad:store:", v15, 0, 0);
          ++v14;
        }
        while (v12 != v14);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
        v12 = v11;
      }
      while (v11);
    }

    v9 = v10;
  }

  return v9;
}

+ (IMDChatRegistry)sharedInstance
{
  if (qword_1ED935CC0 != -1)
    dispatch_once(&qword_1ED935CC0, &unk_1E922C590);
  return (IMDChatRegistry *)(id)qword_1ED935DF8;
}

- (IMDChatRegistry)init
{
  IMDChatRegistry *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *chats;
  NSMutableDictionary *v11;
  NSMutableDictionary *chatsByGroupID;
  NSRecursiveLock *v13;
  NSRecursiveLock *chatsLock;
  NSRecursiveLock *v15;
  NSRecursiveLock *handlesLock;
  NSMutableDictionary *v17;
  NSMutableDictionary *idToHandlesMap;
  NSData *v19;
  NSData *historyToken;
  IMDChatRegistry *v21;
  void *v22;
  void *v23;
  TUConversationManager *v24;
  TUConversationManager *conversationManager;
  NSMutableDictionary *v26;
  NSMutableDictionary *personCentricGroupedChatsCache;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  IMDChatRegistry *v33;
  IMDChatRegistry *v34;
  IMDChatRegistry *v35;
  _QWORD aBlock[4];
  IMDChatRegistry *v37;
  objc_super v38;
  uint8_t buf[4];
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)IMDChatRegistry;
  v2 = -[IMDChatRegistry init](&v38, sel_init);
  v3 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isUnderFirstDataProtectionLock");

    v2->_firstUnlockTriggered = v5 ^ 1;
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = CFSTR("NO");
        if (v5)
          v8 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v40 = v8;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Is under first unlock: %@", buf, 0xCu);
      }

    }
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    chats = v2->_chats;
    v2->_chats = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    chatsByGroupID = v2->_chatsByGroupID;
    v2->_chatsByGroupID = v11;

    v13 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    chatsLock = v2->_chatsLock;
    v2->_chatsLock = v13;

    v15 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    handlesLock = v2->_handlesLock;
    v2->_handlesLock = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    idToHandlesMap = v2->_idToHandlesMap;
    v2->_idToHandlesMap = v17;

    v19 = (NSData *)objc_alloc_init(MEMORY[0x1E0C99D50]);
    historyToken = v2->_historyToken;
    v2->_historyToken = v19;

    aBlock[0] = v3;
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D151E1C0;
    aBlock[3] = &unk_1E922C5B8;
    v21 = v2;
    v37 = v21;
    v22 = _Block_copy(aBlock);
    dword_1ED934F80 = IMDispatchForNotify();
    dword_1ED934F84 = IMDispatchForNotify();

    v35 = v21;
    dword_1ED934F88 = IMDispatchForNotify();

    v34 = v35;
    IMDispatchForNotify();

    objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addListener:", v34);

    v34->_doneLoadingAfterMerge = 0;
    v24 = (TUConversationManager *)objc_alloc_init(MEMORY[0x1E0DBD298]);
    conversationManager = v34->_conversationManager;
    v34->_conversationManager = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    personCentricGroupedChatsCache = v34->_personCentricGroupedChatsCache;
    v34->_personCentricGroupedChatsCache = v26;

  }
  if (IMSharedHelperContactsBasedMergingEnabled())
  {
    objc_msgSend(MEMORY[0x1E0C97298], "initialize");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v2, sel__contactsChanged_, *MEMORY[0x1E0C96870], 0);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObserver:selector:name:object:", v2, sel_updateMeCardHasUpdatedForAllChats, IMDMeCardUpdatedNotification, 0);

  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "hasReceivedFirstUnlockNotification");

  if (v31)
  {
    v33 = v2;
    im_dispatch_after();

  }
  return v2;
}

- (IMDCKUtilities)ckUtilities
{
  IMDCKUtilities *ckUtilities;
  IMDCKUtilities *v4;
  IMDCKUtilities *v5;

  ckUtilities = self->_ckUtilities;
  if (!ckUtilities)
  {
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v4 = (IMDCKUtilities *)objc_claimAutoreleasedReturnValue();
    v5 = self->_ckUtilities;
    self->_ckUtilities = v4;

    ckUtilities = self->_ckUtilities;
  }
  return ckUtilities;
}

+ (id)supportedServiceNames
{
  void *v2;
  void *v3;

  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceNamesSupportingCapability:", *MEMORY[0x1E0D38E30]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (dword_1ED934F80 != -1)
  {
    notify_cancel(dword_1ED934F80);
    dword_1ED934F80 = -1;
  }
  if (dword_1ED934F84 != -1)
  {
    notify_cancel(dword_1ED934F84);
    dword_1ED934F84 = -1;
  }
  if (dword_1ED934F88 != -1)
  {
    notify_cancel(dword_1ED934F88);
    dword_1ED934F88 = -1;
  }
  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListener:", self);

  v4.receiver = self;
  v4.super_class = (Class)IMDChatRegistry;
  -[IMDChatRegistry dealloc](&v4, sel_dealloc);
}

- (id)_sharedMessageStore
{
  return +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
}

- (NSArray)allChats
{
  void *v3;
  void *v4;

  -[NSRecursiveLock lock](self->_chatsLock, "lock");
  -[NSMutableDictionary allValues](self->_chats, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[NSRecursiveLock unlock](self->_chatsLock, "unlock");
  return (NSArray *)v4;
}

- (NSArray)cachedChats
{
  void *v3;
  void *v4;

  -[NSRecursiveLock lock](self->_chatsLock, "lock");
  -[NSMutableDictionary allValues](self->_chats, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[NSRecursiveLock unlock](self->_chatsLock, "unlock");
  return (NSArray *)v4;
}

- (unint64_t)cachedChatCount
{
  unint64_t v3;

  -[NSRecursiveLock lock](self->_chatsLock, "lock");
  v3 = -[NSMutableDictionary count](self->_chats, "count");
  -[NSRecursiveLock unlock](self->_chatsLock, "unlock");
  return v3;
}

- (id)chatForHandle:(id)a3 account:(id)a4 chatIdentifier:(id)a5 guid:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 isBlackholed:(BOOL)a9
{
  IMDChat *v14;
  id v15;
  id v16;
  NSObject *v17;
  IMDChat *v18;
  void *v19;
  IMDChat *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  IMDChat *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  IMDChat *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  IMDChat *v46;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  IMDChat *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v14 = (IMDChat *)a3;
  v15 = a4;
  v16 = a5;
  v50 = a6;
  v48 = a7;
  v49 = a8;
  if (IMOSLoggingEnabled(v49))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v52 = v14;
      v53 = 2112;
      v54 = v15;
      v55 = 2112;
      v56 = v16;
      v57 = 2112;
      v58 = v50;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_DEBUG, "handle: %@  account: %@  chatIdentifier: %@  guid: %@", buf, 0x2Au);
    }

  }
  v18 = 0;
  if (v14 && v15)
  {
    -[IMDChat ID](v14, "ID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChatRegistry existingChatForID:account:](self, "existingChatForID:account:", v19, v15);
    v20 = (IMDChat *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (IMOSLoggingEnabled(v21))
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v20;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Found existing chat: %@", buf, 0xCu);
        }

      }
      v18 = v20;
    }
    else
    {
      -[IMDChat ID](v14, "ID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChatRegistry alternateIDForHandle:](self, "alternateIDForHandle:", v23);
      v46 = (IMDChat *)objc_claimAutoreleasedReturnValue();

      if (v46 && IMOSLoggingEnabled(-[IMDChat setPersonCentricID:](v14, "setPersonCentricID:", v46)))
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          -[IMDChat ID](v14, "ID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v52 = v46;
          v53 = 2112;
          v54 = v25;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Found alternate ID: %@, for handle: %@", buf, 0x16u);

        }
      }
      v26 = [IMDChat alloc];
      objc_msgSend(v15, "accountID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "service");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "internalName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      IMSingleObjectArray();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(v45) = 0;
      LOBYTE(v44) = a9;
      LOBYTE(v43) = 0;
      LOBYTE(v42) = 45;
      v32 = -[IMDChat initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:](v26, "initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:", v27, v29, v50, v30, v16, v31, v16, 0, v48, v49, 0, 3, v42, 1,
              v43,
              0,
              0,
              0,
              0,
              0,
              -1,
              0,
              v44,
              0,
              0,
              v45);

      if (IMOSLoggingEnabled(v33))
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          -[IMDChat lastAddressedLocalHandle](v32, "lastAddressedLocalHandle");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v52 = v32;
          v53 = 2112;
          v54 = v35;
          _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "Created chat: %@ lastAddressedHandle %@", buf, 0x16u);

        }
      }
      -[IMDChatRegistry addChat:](self, "addChat:", v32);
      if (objc_msgSend(MEMORY[0x1E0D39AF8], "isInternationalSpamFilteringEnabled"))
      {
        -[IMDChat serviceName](v32, "serviceName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "isEqualToString:", *MEMORY[0x1E0D38F68]);

        if (v37)
        {
          -[IMDChat chatIdentifier](v32, "chatIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDChatRegistry existingSMSChatForID:withChatStyle:](self, "existingSMSChatForID:withChatStyle:", v38, -[IMDChat style](v32, "style"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
            -[IMDChat updateSMSHandshakeState:](v32, "updateSMSHandshakeState:", objc_msgSend(v39, "smsHandshakeState"));

        }
      }
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addIMDHandleToRegistry:", v14);

      v18 = v32;
    }

  }
  return v18;
}

- (id)chatForHandles:(id)a3 account:(id)a4 chatIdentifier:(id)a5 style:(unsigned __int8)a6 groupID:(id)a7 originalGroupID:(id)a8 displayName:(id)a9 guid:(id)a10 lastAddressedHandle:(id)a11 lastAddressedSIMID:(id)a12 isBlackholed:(BOOL)a13
{
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  IMDChat *v22;
  NSObject *v23;
  IMDChat *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  IMDChat *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  IMDChat *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  IMDChat *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  IMDChat *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v50 = (IMDChat *)a3;
  v18 = a4;
  v19 = a5;
  v44 = a7;
  v45 = a8;
  v46 = a9;
  v49 = a10;
  v47 = a11;
  v48 = a12;
  if (IMOSLoggingEnabled(v48))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v57 = v50;
      v58 = 2112;
      v59 = v18;
      v60 = 2112;
      v61 = v19;
      v62 = 2112;
      v63 = v49;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_DEBUG, "handles: %@  account: %@  chatIdentifier: %@  guid: %@", buf, 0x2Au);
    }

  }
  if (v18)
  {
    -[IMDChatRegistry existingChatWithIdentifier:account:](self, "existingChatWithIdentifier:account:", v19, v18);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (IMDChat *)v21;
    if (v21)
    {
      if (IMOSLoggingEnabled(v21))
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v22;
          _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Found existing chat: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v24 = [IMDChat alloc];
      objc_msgSend(v18, "accountID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "service");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "internalName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        LOWORD(v42) = 0;
        LOBYTE(v41) = a13;
        LOBYTE(v40) = 0;
        LOBYTE(v39) = a6;
        v22 = -[IMDChat initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:](v24, "initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:", v25, v27, v49, v44, v19, v50, v19, v46, v47, v48, 0, 0, v39,
                1,
                v40,
                0,
                0,
                0,
                v45,
                0,
                -1,
                0,
                v41,
                0,
                0,
                v42);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LOWORD(v42) = 0;
        LOBYTE(v41) = a13;
        LOBYTE(v40) = 0;
        LOBYTE(v39) = a6;
        v22 = -[IMDChat initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:](v24, "initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:", v25, v27, v49, v28, v19, v50, v19, v46, v47, v48, 0, 0, v39,
                1,
                v40,
                0,
                0,
                0,
                v45,
                0,
                -1,
                0,
                v41,
                0,
                0,
                v42);

      }
      if (IMOSLoggingEnabled(v29))
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v22;
          _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Created chat: %@", buf, 0xCu);
        }

      }
      -[IMDChatRegistry addChat:](self, "addChat:", v22);
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v31 = v50;
      v32 = -[IMDChat countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v52 != v33)
              objc_enumerationMutation(v31);
            v35 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
            +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addIMDHandleToRegistry:", v35);

          }
          v32 = -[IMDChat countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        }
        while (v32);
      }

    }
    v37 = v22;

  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (id)chatForRoom:(id)a3 account:(id)a4 chatIdentifier:(id)a5 guid:(id)a6
{
  IMDChat *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  IMDChat *v16;
  uint64_t v17;
  IMDChat *v18;
  NSObject *v19;
  IMDChat *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  IMDChat *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = (IMDChat *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (IMOSLoggingEnabled(v13))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v33 = v10;
      v34 = 2112;
      v35 = v11;
      v36 = 2112;
      v37 = v12;
      v38 = 2112;
      v39 = v13;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_DEBUG, "room: %@  account: %@  chatIdentifier: %@  guid: %@", buf, 0x2Au);
    }

  }
  v15 = -[IMDChat length](v10, "length");
  v16 = 0;
  if (v11 && v15)
  {
    -[IMDChatRegistry existingChatForRoom:account:](self, "existingChatForRoom:account:", v10, v11);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (IMDChat *)v17;
    if (v17)
    {
      if (IMOSLoggingEnabled(v17))
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v18;
          _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Found existing chat: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v20 = [IMDChat alloc];
      objc_msgSend(v11, "accountID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "service");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "internalName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(v31) = 0;
      LOBYTE(v30) = 0;
      LOBYTE(v29) = 0;
      LOBYTE(v28) = 35;
      v18 = -[IMDChat initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:](v20, "initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:", v21, v23, v13, v24, v12, 0, v10, 0, 0, 0, 0, 0, v28, 1,
              v29,
              0,
              0,
              0,
              0,
              0,
              -1,
              0,
              v30,
              0,
              0,
              v31);

      if (IMOSLoggingEnabled(v25))
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v18;
          _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Created chat: %@", buf, 0xCu);
        }

      }
      -[IMDChatRegistry addChat:](self, "addChat:", v18);
    }
    v16 = v18;

  }
  return v16;
}

- (id)generateUnusedChatIdentifierForGroupChatWithAccount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = (void *)MEMORY[0x1E0D39740];
  objc_msgSend(a3, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D151F3F0;
  v9[3] = &unk_1E92294F8;
  v9[4] = self;
  objc_msgSend(v4, "generateUnusedChatIdentifierForGroupChatWithServiceName:chatWithChatIdentifierExists:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)existingiMessageChatForID:(id)a3
{
  return -[IMDChatRegistry existingiMessageChatForID:withChatStyle:](self, "existingiMessageChatForID:withChatStyle:", a3, 45);
}

- (id)existingiMessageChatForID:(id)a3 withChatStyle:(unsigned __int8)a4
{
  void *v5;
  void *v6;
  void *v7;

  MEMORY[0x1D17EA374](a3, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)IMCopyGUIDForChat();

  -[IMDChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)existingSMSChatForID:(id)a3
{
  return -[IMDChatRegistry existingSMSChatForID:withChatStyle:](self, "existingSMSChatForID:withChatStyle:", a3, 45);
}

- (id)existingSMSChatForID:(id)a3 withChatStyle:(unsigned __int8)a4
{
  void *v5;
  void *v6;
  void *v7;

  MEMORY[0x1D17EA374](a3, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)IMCopyGUIDForChat();

  -[IMDChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasKnownSenderChatWithChatIdentifier:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[IMDChatRegistry existingiMessageChatForID:](self, "existingiMessageChatForID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isFiltered") == 0;
  else
    v5 = 0;

  return v5;
}

- (id)_cachedChatWithGUID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[NSRecursiveLock lock](self->_chatsLock, "lock");
    -[NSMutableDictionary objectForKeyedSubscript:](self->_chats, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSRecursiveLock unlock](self->_chatsLock, "unlock");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_cachedChatsWithGroupID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[NSRecursiveLock lock](self->_chatsLock, "lock");
    -[NSMutableDictionary objectForKey:](self->_chatsByGroupID, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    -[NSRecursiveLock unlock](self->_chatsLock, "unlock");
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (void)pendingAlternateID:(id)a3 forHandle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[IMDChatRegistry pendingChatBotHandleToAlternateID](self, "pendingChatBotHandleToAlternateID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[IMDChatRegistry setPendingChatBotHandleToAlternateID:](self, "setPendingChatBotHandleToAlternateID:", v9);

  }
  -[IMDChatRegistry pendingChatBotHandleToAlternateID](self, "pendingChatBotHandleToAlternateID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v6);

}

- (id)alternateIDForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[IMDChatRegistry pendingChatBotHandleToAlternateID](self, "pendingChatBotHandleToAlternateID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IMDChatRegistry pendingChatBotHandleToAlternateID](self, "pendingChatBotHandleToAlternateID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[IMDChatRegistry pendingChatBotHandleToAlternateID](self, "pendingChatBotHandleToAlternateID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v4);

    }
  }

  return v5;
}

- (id)existingChatWithGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMDChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[IMDChatRegistry chatStore](self, "chatStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "chatWithGUID:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMDChatRegistry _addChatFromCacheMiss:preferExistingChat:](self, "_addChatFromCacheMiss:preferExistingChat:", v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v8;
      if (v8)
      {
        objc_msgSend(v8, "guid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v4);

        if ((v10 & 1) == 0)
        {
          if (IMOSLoggingEnabled(v8))
          {
            OSLogHandleForIMFoundationCategory();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v5, "guid");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = 138412546;
              v16 = v12;
              v17 = 2112;
              v18 = v4;
              _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Chat GUID %@ doesn't match requested GUID %@, may have changed due to inconsistent properties", (uint8_t *)&v15, 0x16u);

            }
          }

          v5 = 0;
        }
      }
      if (IMOSLoggingEnabled(v8))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v15 = 138412546;
          v16 = v4;
          v17 = 2112;
          v18 = v5;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Cache miss for chat with guid: %@ result: %@", (uint8_t *)&v15, 0x16u);
        }

      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)existingChatsFilteredUsingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[IMDChatRegistry chatStore](self, "chatStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatsFilteredUsingPredicate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDChatRegistry _addChatsFromCacheMisses:preferExistingChats:](self, "_addChatsFromCacheMisses:preferExistingChats:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)existingChatsWithGroupID:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = (id)MEMORY[0x1E0C9AA60];
  if (v5)
  {
    -[IMDChatRegistry _cachedChatsWithGroupID:](self, "_cachedChatsWithGroupID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v8 = v7;
    }
    else
    {
      -[IMDChatRegistry chatStore](self, "chatStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "chatsWithGroupID:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMDChatRegistry _addChatsFromCacheMisses:preferExistingChats:](self, "_addChatsFromCacheMisses:preferExistingChats:", v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled(v11))
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "arrayByApplyingSelector:", sel_guid);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138412546;
          v17 = v4;
          v18 = 2112;
          v19 = v13;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Cache miss for chats with group ID: %@ result: %@", (uint8_t *)&v16, 0x16u);

        }
      }

    }
    if (v8)
      v14 = v8;
    else
      v14 = v6;
    v6 = v14;

  }
  return v6;
}

- (id)existingChatWithGroupID:(id)a3 onService:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[IMDChatRegistry existingChatsWithGroupID:](self, "existingChatsWithGroupID:", a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "serviceName", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v6);

        if ((v13 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)existingChatWithIdentifier:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  int v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v7, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "internalName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)IMCopyGUIDForChat();

    -[IMDChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      v13 = v12;
    }
    else
    {
      objc_msgSend(v7, "service");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "internalName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)IMCopyGUIDForChat();

      -[IMDChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v17;
      if (v17)
      {
        v13 = v17;
      }
      else
      {
        -[IMDChatRegistry chatStore](self, "chatStore");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "service");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "chatsWithIdentifier:onService:", v6, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDChatRegistry _addChatFromCacheMiss:preferExistingChat:](self, "_addChatFromCacheMiss:preferExistingChat:", v21, 1);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "chatIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", v6);

          if ((v24 & 1) == 0)
          {
            if (IMOSLoggingEnabled(v22))
            {
              OSLogHandleForIMFoundationCategory();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v13, "chatIdentifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = 138412546;
                v30 = v26;
                v31 = 2112;
                v32 = v6;
                _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Chat identifier %@ doesn't match requested identifier %@, may have changed due to inconsistent properties", (uint8_t *)&v29, 0x16u);

              }
            }

            v13 = 0;
          }
        }
        if (IMOSLoggingEnabled(v22))
        {
          OSLogHandleForIMFoundationCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v29 = 138412802;
            v30 = v6;
            v31 = 2112;
            v32 = v7;
            v33 = 2112;
            v34 = v13;
            _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Cache miss for chat with identifier: %@ account: %@ result: %@", (uint8_t *)&v29, 0x20u);
          }

        }
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)existingChatsWithPinningIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "supportedServiceNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry allChatsWithIdentifier:style:serviceNames:](self, "allChatsWithIdentifier:style:serviceNames:", v4, 45, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = v6;
  }
  else
  {
    -[IMDChatRegistry existingChatsWithGroupID:](self, "existingChatsWithGroupID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v7 = v8;
    }
    else
    {
      -[IMDChatRegistry chatStore](self, "chatStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "chatsWithPinningIdentifier:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMDChatRegistry _addChatsFromCacheMisses:preferExistingChats:](self, "_addChatsFromCacheMisses:preferExistingChats:", v10, 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (id)existingChatWithEngramID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[IMDChatRegistry allChats](self, "allChats", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "engramID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)existingChatForID:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
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
  uint64_t v20;
  NSObject *v21;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  v9 = 0;
  if (v7 && v8)
  {
    objc_msgSend(v7, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "internalName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)IMCopyGUIDForChat();

    -[IMDChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v9 = v13;
    }
    else
    {
      -[IMDChatRegistry chatStore](self, "chatStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "service");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "internalName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "chatsWithHandle:onService:", v6, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChatRegistry _addChatFromCacheMiss:preferExistingChat:](self, "_addChatFromCacheMiss:preferExistingChat:", v19, 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled(v20))
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v23 = 138412802;
          v24 = v6;
          v25 = 2112;
          v26 = v7;
          v27 = 2112;
          v28 = v9;
          _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Cache miss for chats with ID: %@ account: %@ result: %@", (uint8_t *)&v23, 0x20u);
        }

      }
    }

  }
  return v9;
}

- (id)existingChatForIDs:(id)a3 account:(id)a4 style:(unsigned __int8)a5
{
  return -[IMDChatRegistry existingChatForIDs:account:displayName:groupID:style:](self, "existingChatForIDs:account:displayName:groupID:style:", a3, a4, 0, 0, a5);
}

- (id)existingChatForIDs:(id)a3 account:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  objc_msgSend(a4, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry existingChatsForIDs:onService:displayName:groupID:style:](self, "existingChatsForIDs:onService:displayName:groupID:style:", v14, v15, v13, v12, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)existingChatForIDs:(id)a3 account:(id)a4 displayName:(id)a5 originalGroupID:(id)a6 style:(unsigned __int8)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  objc_msgSend(a4, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry existingChatsForIDs:onService:displayName:originalGroupID:style:](self, "existingChatsForIDs:onService:displayName:originalGroupID:style:", v14, v15, v13, v12, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)existingChatsForIDs:(id)a3 onService:(id)a4 style:(unsigned __int8)a5
{
  return -[IMDChatRegistry existingChatsForIDs:onService:displayName:groupID:style:](self, "existingChatsForIDs:onService:displayName:groupID:style:", a3, a4, 0, 0, a5);
}

- (id)existingChatsForIDs:(id)a3 onService:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  objc_msgSend(a4, "internalName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry _existingChatsForIDs:serviceName:displayName:groupID:useOriginalGroupID:style:](self, "_existingChatsForIDs:serviceName:displayName:groupID:useOriginalGroupID:style:", v14, v15, v13, v12, 0, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)existingChatsForIDs:(id)a3 onService:(id)a4 displayName:(id)a5 originalGroupID:(id)a6 style:(unsigned __int8)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  objc_msgSend(a4, "internalName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry _existingChatsForIDs:serviceName:displayName:groupID:useOriginalGroupID:style:](self, "_existingChatsForIDs:serviceName:displayName:groupID:useOriginalGroupID:style:", v14, v15, v13, v12, 1, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)existingChatsForIDs:(id)a3 displayName:(id)a4 groupID:(id)a5 style:(unsigned __int8)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v6 = a6;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend((id)objc_opt_class(), "supportedServiceNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(obj);
        -[IMDChatRegistry _existingChatsForIDs:serviceName:displayName:groupID:useOriginalGroupID:style:](self, "_existingChatsForIDs:serviceName:displayName:groupID:useOriginalGroupID:style:", v10, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17), v11, v12, 0, v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObjectsFromArray:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  return v13;
}

- (id)_existingChatsForIDs:(id)a3 serviceName:(id)a4 displayName:(id)a5 groupID:(id)a6 useOriginalGroupID:(BOOL)a7 style:(unsigned __int8)a8
{
  uint64_t v8;
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v8 = a8;
  v9 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[IMDChatRegistry chatStore](self, "chatStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v9)
    objc_msgSend(v18, "chatsWithHandles:onService:displayName:originalGroupID:style:", v17, v16, v15, v14, v8);
  else
    objc_msgSend(v18, "chatsWithHandles:onService:displayName:groupID:style:", v17, v16, v15, v14, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDChatRegistry _addChatsFromCacheMisses:preferExistingChats:](self, "_addChatsFromCacheMisses:preferExistingChats:", v20, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)existingChatForRoom:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  IMDChatRegistry *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7 && objc_msgSend(v6, "length"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v27 = self;
    -[IMDChatRegistry allChats](self, "allChats");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v12, "service");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "service");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v13 == v14;

          if (v15 && objc_msgSend(v12, "style") == 35)
          {
            objc_msgSend(v12, "roomName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "length"))
            {
              objc_msgSend(v12, "roomName");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "isEqualToString:", v6);

              if ((v18 & 1) != 0)
              {
                v25 = v12;
                goto LABEL_21;
              }
            }
            else
            {

            }
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v9);
    }

    -[IMDChatRegistry chatStore](v27, "chatStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "service");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "internalName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "chatsWithRoomname:onService:", v6, v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChatRegistry _addChatFromCacheMiss:preferExistingChat:](v27, "_addChatFromCacheMiss:preferExistingChat:", v22, 1);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v23))
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v33 = v6;
        v34 = 2112;
        v35 = v7;
        v36 = 2112;
        v37 = v25;
        _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Cache miss for chat with roomname: %@ account: %@ result: %@", buf, 0x20u);
      }

    }
LABEL_21:

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)allChatsWithIdentifier:(id)a3 style:(unsigned __int8)a4 serviceNames:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "length") && objc_msgSend(v8, "count"))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v8;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)IMCopyGUIDForChat();
          -[IMDChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v9, "addObject:", v16);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    v8 = v18;
  }
  else
  {
    v9 = (id)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (id)allExistingSupportedServiceChatsWithIdentifier:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "supportedServiceNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry allChatsWithIdentifier:style:serviceNames:](self, "allChatsWithIdentifier:style:serviceNames:", v6, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allExistingChatsWithIdentifier:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "supportedServiceNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry allChatsWithIdentifier:style:serviceNames:](self, "allChatsWithIdentifier:style:serviceNames:", v6, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allExistingChatsWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[IMDChatRegistry chatStore](self, "chatStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatsWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDChatRegistry _addChatsFromCacheMisses:preferExistingChats:](self, "_addChatsFromCacheMisses:preferExistingChats:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_participantIDSetFromHandles:(id)a3 toIdentifier:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E20];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v7, "__imArrayByApplyingBlock:", &unk_1E922C5F8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObjectsFromArray:", v9);
  if (v5)
    objc_msgSend(v8, "addObject:", v5);

  return v8;
}

- (id)_exactGroupChatMatchOrNewestMatchingGroupID:(id)a3 originalGroupID:(id)a4 serviceName:(id)a5 participants:(id)a6 toIdentifier:(id)a7 outNewestSiblingChat:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(void *, void *);
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  id v31;
  id v33;
  id v34;
  id v35;
  IMDChatRegistry *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD aBlock[4];
  id v44;
  IMDChatRegistry *v45;
  id v46;
  id v47;
  uint64_t *v48;
  _QWORD *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _QWORD v57[3];
  char v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint8_t buf[4];
  void *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v38 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = sub_1D15213F4;
  v63 = sub_1D1521404;
  v64 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  v58 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = sub_1D15213F4;
  v55 = sub_1D1521404;
  v56 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D152140C;
  aBlock[3] = &unk_1E922C620;
  v48 = &v51;
  v35 = v14;
  v44 = v35;
  v45 = self;
  v37 = self;
  v34 = v16;
  v46 = v34;
  v33 = v15;
  v47 = v33;
  v49 = v57;
  v50 = &v59;
  v17 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[IMDChatRegistry existingChatsWithGroupID:](self, "existingChatsWithGroupID:", v13);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v67, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v40 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v22, "groupID", v33, v34);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToIgnoringCase:", v13);

        if ((v24 & 1) != 0)
        {
          v17[2](v17, v22);
        }
        else if (IMOSLoggingEnabled(v25))
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v66 = v22;
            _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, " ==> ERROR sanity check failed: ChatRegistry returned chat that did not match inputs: %@", buf, 0xCu);
          }

        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v67, 16);
    }
    while (v19);
  }

  if (v38 && !v60[5])
  {
    -[IMDChatRegistry newestExistingChatWithOriginalGroupID:onService:](v37, "newestExistingChatWithOriginalGroupID:onService:", v38, v35);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "originalGroupID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", v38);

    if (v29)
      v17[2](v17, v27);

  }
  if (a8)
  {
    v30 = (void *)v52[5];
    if (v30)
      *a8 = objc_retainAutorelease(v30);
  }
  v31 = (id)v60[5];

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(v57, 8);
  _Block_object_dispose(&v59, 8);

  return v31;
}

- (id)_newestGroupChatMatchingParticipants:(id)a3 displayName:(id)a4 strictDisplayNameMatching:(BOOL)a5 serviceName:(id)a6 toIdentifier:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v9 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v36 = a6;
  v14 = a7;
  v33 = v12;
  v15 = (void *)objc_msgSend(v12, "mutableCopy");
  v34 = v14;
  objc_msgSend(v15, "removeObject:", v14);
  v35 = v15;
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry _existingChatsForIDs:serviceName:displayName:groupID:useOriginalGroupID:style:](self, "_existingChatsForIDs:serviceName:displayName:groupID:useOriginalGroupID:style:", v16, v36, v13, 0, 0, 43);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  v20 = 0;
  v21 = v19;
  if (v19)
  {
    v22 = *(_QWORD *)v38;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v23);
        if (!v9
          || (v19 = objc_msgSend(v13, "length")) != 0
          || (objc_msgSend(v24, "displayName"),
              v27 = (void *)objc_claimAutoreleasedReturnValue(),
              v28 = objc_msgSend(v27, "length") == 0,
              v27,
              v28))
        {
          if (!v20 || (v19 = objc_msgSend(v24, "isNewerThan:", v20), (_DWORD)v19))
          {
            if (IMOSLoggingEnabled(v19))
            {
              OSLogHandleForIMFoundationCategory();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v42 = v24;
                _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, " ==> Found a newer chat based on participants and display name: %@", buf, 0xCu);
              }

            }
            v26 = v24;

            v20 = v26;
          }
        }
        else
        {
          v19 = IMOSLoggingEnabled(v19);
          if ((_DWORD)v19)
          {
            OSLogHandleForIMFoundationCategory();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v24, "displayName");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v42 = v30;
              v43 = 2112;
              v44 = v24;
              _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, " ==> Skipping chat with display name of %@, requested display name was zero length, chat: %@", buf, 0x16u);

            }
          }
        }
        ++v23;
      }
      while (v21 != v23);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      v21 = v19;
    }
    while (v19);
  }

  v31 = v20;
  return v31;
}

- (void)_setGroupID:(id)a3 forChatAndAllSiblings:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21 = a4;
  if (IMOSLoggingEnabled(v21))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, " ==> Migrating siblings to new groupID if needed: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v21, "chatIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry allExistingChatsWithIdentifier:style:](self, "allExistingChatsWithIdentifier:style:", v8, objc_msgSend(v21, "style"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "groupID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = IMSharedHelperAreObjectsLogicallySame();

        if ((v16 & 1) == 0)
        {
          if (IMOSLoggingEnabled(v17))
          {
            OSLogHandleForIMFoundationCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v14, "guid");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "groupID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v27 = v19;
              v28 = 2112;
              v29 = v20;
              v30 = 2112;
              v31 = v6;
              _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, " ==> Updating chat (%@) group ID from %@ => %@", buf, 0x20u);

            }
          }
          -[IMDChatRegistry updateGroupIDForChat:newGroupID:](self, "updateGroupIDForChat:newGroupID:", v14, v6);
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v11);
  }

}

- (id)bestCandidateGroupChatWithFromIdentifier:(id)a3 toIdentifier:(id)a4 displayName:(id)a5 participants:(id)a6 groupID:(id)a7 serviceName:(id)a8
{
  return -[IMDChatRegistry bestCandidateGroupChatWithFromIdentifier:toIdentifier:displayName:participants:groupID:originalGroupID:serviceName:](self, "bestCandidateGroupChatWithFromIdentifier:toIdentifier:displayName:participants:groupID:originalGroupID:serviceName:", a3, a4, a5, a6, a7, 0, a8);
}

- (id)bestCandidateGroupChatWithFromIdentifier:(id)a3 toIdentifier:(id)a4 displayName:(id)a5 participants:(id)a6 groupID:(id)a7 originalGroupID:(id)a8 serviceName:(id)a9
{
  __CFString *v15;
  id v16;
  id v17;
  id v18;
  __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  __CFString *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  const __CFString *v32;
  __CFString *v33;
  uint64_t v34;
  NSObject *v35;
  __CFString *v36;
  void *v38;
  id v39;
  __CFString *v40;
  id v41;
  uint8_t buf[4];
  __CFString *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v40 = (__CFString *)a5;
  v15 = (__CFString *)a7;
  v39 = a8;
  v16 = a9;
  v17 = a6;
  v18 = a4;
  objc_msgSend(a3, "_stripFZIDPrefix");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_stripFZIDPrefix");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "__imArrayByApplyingBlock:", &unk_1E922C640);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v20);
  v22 = IMOSLoggingEnabled(v21);
  if ((_DWORD)v22)
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      v43 = v19;
      v44 = 2112;
      v45 = v38;
      v46 = 2112;
      v47 = v40;
      v48 = 2112;
      v49 = v20;
      v50 = 2112;
      v51 = v15;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Finding best candidate group chat with toIdentifier: %@ fromIdentifier: %@ displayName: %@ partipciants: %@ groupID: %@", buf, 0x34u);
    }

  }
  if (IMOSLoggingEnabled(v22))
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v15;
      _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, " ==> Looking up with groupID %@", buf, 0xCu);
    }

  }
  if (-[__CFString length](v15, "length"))
  {
    v41 = 0;
    -[IMDChatRegistry _exactGroupChatMatchOrNewestMatchingGroupID:originalGroupID:serviceName:participants:toIdentifier:outNewestSiblingChat:](self, "_exactGroupChatMatchOrNewestMatchingGroupID:originalGroupID:serviceName:participants:toIdentifier:outNewestSiblingChat:", v15, v39, v16, v21, v19, &v41);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v26 = v41;
    if (v25)
      goto LABEL_23;
  }
  else
  {
    v26 = 0;
  }
  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "serviceWithName:", v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "groupsMergeDisplayNames");

  if (IMOSLoggingEnabled(v30))
  {
    OSLogHandleForIMFoundationCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v43 = v40;
      v44 = 2112;
      if (v29)
        v32 = CFSTR("YES");
      v45 = v20;
      v46 = 2112;
      v47 = v32;
      _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, " ==> groupID lookup failed, falling back to display name: %@ participants: %@ mergeDisplayNames: %@", buf, 0x20u);
    }

  }
  if (v29)
    v33 = 0;
  else
    v33 = v40;
  -[IMDChatRegistry _newestGroupChatMatchingParticipants:displayName:strictDisplayNameMatching:serviceName:toIdentifier:](self, "_newestGroupChatMatchingParticipants:displayName:strictDisplayNameMatching:serviceName:toIdentifier:", v21, v33, v29 ^ 1u, v16, v19);
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_23:
  v34 = -[__CFString length](v15, "length");
  if (v34 && v25)
    v34 = -[IMDChatRegistry _setGroupID:forChatAndAllSiblings:](self, "_setGroupID:forChatAndAllSiblings:", v15, v25);
  if (IMOSLoggingEnabled(v34))
  {
    OSLogHandleForIMFoundationCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v25;
      _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, " ==> Found matching chat: %@", buf, 0xCu);
    }

  }
  v36 = v25;

  return v36;
}

- (void)updateLastMessageForChat:(id)a3 hintMessage:(id)a4
{
  -[IMDChatRegistry updateLastMessageForChat:hintMessage:historyQuery:](self, "updateLastMessageForChat:hintMessage:historyQuery:", a3, a4, 1);
}

- (void)updateLastMessageForChat:(id)a3 hintMessage:(id)a4 historyQuery:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  int v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v5 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
    goto LABEL_46;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isScheduledMessagesCoreEnabled");

  if (!v10)
  {
LABEL_15:
    if (v8)
    {
      v11 = objc_msgSend(v8, "messageID");
      if (v11)
      {
        objc_msgSend(v7, "lastMessage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isOlderThanItem:", v8);

        if (v15)
        {
          if (IMOSLoggingEnabled(v11))
          {
            OSLogHandleForIMEventCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v8, "time");
              v17 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "lastMessage");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "time");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = 138412546;
              v47 = v17;
              v48 = 2112;
              v49 = v19;
              _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, " Hint message for last message was newer than the current last message: %@, current: %@", (uint8_t *)&v46, 0x16u);

            }
          }
          v20 = v8;
          v21 = v20;
          goto LABEL_41;
        }
      }
    }
    if (!v5)
      goto LABEL_46;
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMEventCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v46 = 138412290;
        v47 = v7;
        _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, " Querying db for last message: %@", (uint8_t *)&v46, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isScheduledMessagesCoreEnabled");

    if (v24)
    {
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastMessageForChatWithRowID:", objc_msgSend(v7, "rowID"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_41:
      if (IMOSLoggingEnabled(v20))
      {
        OSLogHandleForIMFoundationCategory();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = 138412546;
          v47 = v21;
          v48 = 2112;
          v49 = v7;
          _os_log_impl(&dword_1D1413000, v45, OS_LOG_TYPE_INFO, " => Using last message: %@ for chat: %@", (uint8_t *)&v46, 0x16u);
        }

      }
      objc_msgSend(v7, "_updateLastMessage:", v21);

      goto LABEL_46;
    }
    v20 = (id)objc_msgSend(v7, "style");
    if ((_DWORD)v20 == 35 || (_DWORD)v20 == 43)
    {
      objc_msgSend(v7, "roomName");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (!v20)
        goto LABEL_41;
      objc_msgSend(v7, "service");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "internalName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37 == 0;

      if (!v38)
      {
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "roomName");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        IMSingleObjectArray();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "service");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "internalName");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        IMSingleObjectArray();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "lastMessageWithRoomNames:onServices:", v41, v44);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_41;
      }
    }
    else if ((_DWORD)v20 == 45)
    {
      objc_msgSend(v7, "participants");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "count"))
      {
        objc_msgSend(v7, "service");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "internalName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28 == 0;

        if (!v29)
        {
          +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "participants");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "arrayByApplyingSelector:", sel_ID);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "service");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "internalName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          IMSingleObjectArray();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "lastMessageWithHandles:onServices:", v32, v35);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_41;
        }
      }
      else
      {

      }
    }
    v21 = 0;
    goto LABEL_41;
  }
  if (objc_msgSend(v8, "scheduleType") != 2
    || (v12 = objc_msgSend(v8, "scheduleState"), v12 != 2) && (v12 = objc_msgSend(v8, "scheduleState"), v12 != 1))
  {
    v11 = objc_msgSend(v8, "isTypingMessage");
    if ((_DWORD)v11)
    {
      if (!IMOSLoggingEnabled(v11))
        goto LABEL_46;
      OSLogHandleForIMEventCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v46 = 138412290;
        v47 = v8;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Skipping updating last message to %@ because it's a typingMessage.", (uint8_t *)&v46, 0xCu);
      }
      goto LABEL_9;
    }
    goto LABEL_15;
  }
  if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMEventCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v46) = 0;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Scheduled Messages | Skiping updating last message as hint message is a user scheduled message", (uint8_t *)&v46, 2u);
    }
LABEL_9:

  }
LABEL_46:

}

- (BOOL)updateUnreadCountForChat:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  int v12;
  void *v13;
  __int16 v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "unreadCount");
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unreadCountForChat:", v4);

    if ((v7 & 0x80000000) != 0)
    {
      v10 = 0;
    }
    else
    {
      if (IMOSLoggingEnabled(v8))
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v12 = 138412546;
          v13 = v4;
          v14 = 1024;
          v15 = v7;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, " Updating unread count for chat: %@ to: %d", (uint8_t *)&v12, 0x12u);
        }

      }
      objc_msgSend(v4, "_setUnreadCount:", v7);
      v10 = v5 != objc_msgSend(v4, "unreadCount");
    }
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)updateNotificationUnreadCountForChat:(id)a3
{
  uint64_t v3;

  LOWORD(v3) = 1;
  -[IMDChatRegistry updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:](self, "updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:", a3, 0, 0, 1, 0, 0, v3);
}

- (void)updateStateForChat:(id)a3 fromMessage:(id)a4 toMessage:(id)a5 forcePost:(BOOL)a6 hintMessage:(id)a7 shouldRebuildFailedMessageDate:(BOOL)a8 shouldCalculateUnreadCount:(BOOL)a9 setUnreadCountToZero:(BOOL)a10
{
  _BOOL4 v10;
  _BOOL4 v12;
  id v16;
  id v17;
  id v18;
  _BOOL8 v19;
  NSObject *v20;
  void *v21;
  _BOOL4 v22;
  _BOOL8 v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v10 = a8;
  v12 = a6;
  v42 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v39 = a5;
  v18 = a7;
  if (v18)
    -[IMDChatRegistry updateLastMessageForChat:hintMessage:](self, "updateLastMessageForChat:hintMessage:", v16, v18);
  v19 = -[IMDChatRegistry isBeingSetup](self, "isBeingSetup");
  if (v19 || !a9)
  {
    v23 = -[IMDChatRegistry isBeingSetup](self, "isBeingSetup");
    v22 = 0;
    if (!v23 && a10)
    {
      if (IMOSLoggingEnabled(v23))
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v16;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Forcing unread count to zero on chat: %@", buf, 0xCu);
        }

      }
      objc_msgSend(v16, "_setUnreadCount:", 0);
      v22 = 1;
    }
  }
  else
  {
    if (IMOSLoggingEnabled(v19))
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v16, "guid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v41 = v21;
        _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Updating the unread count on chat: %@", buf, 0xCu);

      }
    }
    v22 = -[IMDChatRegistry updateUnreadCountForChat:](self, "updateUnreadCountForChat:", v16);
  }
  if (v39
    && v17
    && v10
    && ((v25 = objc_msgSend(v17, "errorCode"), (_DWORD)v25) || (v25 = objc_msgSend(v39, "errorCode"), (_DWORD)v25)))
  {
    v26 = IMOSLoggingEnabled(v25);
    if ((_DWORD)v26)
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v17;
        _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "We believe the failed message might have changed, lets rebuild with fromMessage: %@", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled(v26))
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v39;
        _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "    => toMessage: %@", buf, 0xCu);
      }

    }
    v29 = 1;
  }
  else
  {
    if (!v22 && !v12)
      goto LABEL_41;
    v29 = 0;
  }
  v30 = (void *)objc_msgSend(v16, "copyDictionaryRepresentation:", 0);
  -[IMDChatRegistry _sharedMessageStore](self, "_sharedMessageStore");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isSuppressDatabaseUpdates");

  if (v32 ^ 1 | v12)
  {
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "broadcasterForChatListenersUsingBlackholeRegistry:", objc_msgSend(v16, "isBlackholed"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "guid");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "chat:updated:", v35, v30);

  }
  -[IMDChatRegistry _sharedMessageStore](self, "_sharedMessageStore");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "updateStamp");

  if (!-[IMDChatRegistry isBeingSetup](self, "isBeingSetup"))
  {
    if (v22 || a9)
    {
      -[IMDChatRegistry _sharedMessageStore](self, "_sharedMessageStore");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "rebuildUnreadMessageCount");

    }
    if (v29)
    {
      -[IMDChatRegistry _sharedMessageStore](self, "_sharedMessageStore");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "rebuildLastFailedMessageDate");

    }
  }

LABEL_41:
}

- (void)updateStateForChat:(id)a3 hintMessage:(id)a4
{
  -[IMDChatRegistry updateStateForChat:hintMessage:shouldRebuildFailedMessageDate:](self, "updateStateForChat:hintMessage:shouldRebuildFailedMessageDate:", a3, a4, 1);
}

- (void)updateStateForChat:(id)a3 hintMessage:(id)a4 shouldRebuildFailedMessageDate:(BOOL)a5
{
  uint64_t v5;

  LOWORD(v5) = 1;
  -[IMDChatRegistry updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:](self, "updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:", a3, 0, 0, 0, a4, a5, v5);
}

- (void)updateStateForChat:(id)a3 hintMessage:(id)a4 shouldRebuildFailedMessageDate:(BOOL)a5 shouldCalculateUnreadCount:(BOOL)a6
{
  uint64_t v6;

  LOWORD(v6) = a6;
  -[IMDChatRegistry updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:](self, "updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:", a3, 0, 0, 0, a4, a5, v6);
}

- (void)updateStateForChat:(id)a3 hintMessage:(id)a4 shouldRebuildFailedMessageDate:(BOOL)a5 setUnreadCountToZero:(BOOL)a6
{
  uint64_t v6;

  BYTE1(v6) = a6;
  LOBYTE(v6) = 0;
  -[IMDChatRegistry updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:](self, "updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:", a3, 0, 0, 0, a4, a5, v6);
}

- (void)updateStateForChat:(id)a3 forcePost:(BOOL)a4
{
  MEMORY[0x1E0DE7D20](self, sel_updateStateForChat_forcePost_shouldRebuildFailedMessageDate_);
}

- (void)updateStateForChat:(id)a3 forcePost:(BOOL)a4 shouldRebuildFailedMessageDate:(BOOL)a5
{
  -[IMDChatRegistry updateStateForChat:forcePost:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:](self, "updateStateForChat:forcePost:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:", a3, a4, a5, 1);
}

- (void)updateStateForChat:(id)a3 forcePost:(BOOL)a4 shouldRebuildFailedMessageDate:(BOOL)a5 shouldCalculateUnreadCount:(BOOL)a6
{
  uint64_t v6;

  LOWORD(v6) = a6;
  -[IMDChatRegistry updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:](self, "updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:", a3, 0, 0, a4, 0, a5, v6);
}

- (void)updateStateForChat:(id)a3 forcePost:(BOOL)a4 shouldRebuildFailedMessageDate:(BOOL)a5 setUnreadCountToZero:(BOOL)a6
{
  uint64_t v6;

  BYTE1(v6) = a6;
  LOBYTE(v6) = 0;
  -[IMDChatRegistry updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:](self, "updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:", a3, 0, 0, a4, 0, a5, v6);
}

- (void)updateGroupIDForChat:(id)a3 newGroupID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[NSRecursiveLock lock](self->_chatsLock, "lock");
    -[IMDChatRegistry __removeChatFromGroupIDChatIndex:](self, "__removeChatFromGroupIDChatIndex:", v6);
    if (IMOSLoggingEnabled(-[NSRecursiveLock unlock](self->_chatsLock, "unlock")))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "groupID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412802;
        v11 = v9;
        v12 = 2112;
        v13 = v7;
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Updating groupID from (%@) to (%@) for chat %@", (uint8_t *)&v10, 0x20u);

      }
    }
    objc_msgSend(v6, "updateGroupID:", v7);
    -[NSRecursiveLock lock](self->_chatsLock, "lock");
    -[IMDChatRegistry __addChatToGroupIDChatIndex:](self, "__addChatToGroupIDChatIndex:", v6);
    -[NSRecursiveLock unlock](self->_chatsLock, "unlock");
  }

}

- (void)checkBlackholedChatsExistAfterUpdatingChatWithAdd:(BOOL)a3
{
  int blackholedChatsExistCache;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  blackholedChatsExistCache = self->_blackholedChatsExistCache;
  if (blackholedChatsExistCache != a3)
  {
    v5 = -[IMDChatRegistry blackholedChatsExist](self, "blackholedChatsExist");
    self->_blackholedChatsExistCache = v5;
    if (blackholedChatsExistCache != v5)
    {
      +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "broadcasterForBlackholeChatListeners");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "blackholedChatsExist:", self->_blackholedChatsExistCache);

      +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "broadcasterForChatListeners");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "blackholedChatsExist:", self->_blackholedChatsExistCache);

    }
  }
}

- (BOOL)filteredChatsExistForServices:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3528];
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a3;
  objc_msgSend(v5, "__im_chatPredicateForFilterAction:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "__im_chatPredicateForServiceNames:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDChatRegistry existingChatsFilteredUsingPredicate:sortedUsingLastMessageDateAscending:limit:](self, "existingChatsFilteredUsingPredicate:sortedUsingLastMessageDateAscending:limit:", v10, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v11, "count") != 0;

  return (char)self;
}

- (unint64_t)markAsSpamForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7 autoReport:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[IMDChatRegistry markAsSpamForIDs:style:onServices:chatID:queryID:autoReport:isJunkReportedToCarrier:](self, "markAsSpamForIDs:style:onServices:chatID:queryID:autoReport:isJunkReportedToCarrier:", a3, a4, a5, a6, a7, a8, v9);
}

- (unint64_t)markAsSpamForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7 autoReport:(BOOL)a8 isJunkReportedToCarrier:(BOOL)a9
{
  uint64_t v10;

  LOBYTE(v10) = a9;
  return -[IMDChatRegistry markAsSpamForIDs:style:onServices:chatID:queryID:autoReport:isJunkReportedToCarrier:reportReason:](self, "markAsSpamForIDs:style:onServices:chatID:queryID:autoReport:isJunkReportedToCarrier:reportReason:", a3, a4, a5, a6, a7, a8, v10, 0);
}

- (unint64_t)markAsSpamForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7 autoReport:(BOOL)a8 isJunkReportedToCarrier:(BOOL)a9 reportReason:(unint64_t)a10
{
  _BOOL8 v10;
  id v15;
  id v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  __CFString *v33;
  id v34;
  id v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  int v50;
  id v51;
  unint64_t v52;
  uint8_t buf[4];
  const __CFString *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v10 = a8;
  v50 = a4;
  v61 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v51 = a6;
  v49 = a7;
  if (IMOSLoggingEnabled(v49))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      if (v10)
        v18 = CFSTR("YES");
      v54 = v18;
      v55 = 2112;
      v56 = v15;
      v57 = 2112;
      v58 = v16;
      v59 = 2112;
      v60 = v51;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Handling request (autoReport %@) to mark IDs (%@) for services (%@) as spam for chatGUID (%@)", buf, 0x2Au);
    }

  }
  if (objc_msgSend(v15, "count") && objc_msgSend(v16, "count"))
  {
    if (v50 == 45 && v10)
    {
      +[IMDSpamController sharedInstance](IMDSpamController, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "detectSpam:chatGUID:", v20, v51);

    }
    objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKey:", CFSTR("max-spam-messages-per-report"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKey:", CFSTR("max-spam-message-size"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v21;
    if (v21)
    {
      v44 = objc_msgSend(v21, "integerValue");
    }
    else
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Server Bag has no value for max-spam-message-size, using the default 50", buf, 2u);
        }

      }
      v44 = 50;
    }
    if (v46)
    {
      v24 = objc_msgSend(v46, "integerValue");
    }
    else
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Server Bag has no value for max-spam-messages-per-report, using the default 2", buf, 2u);
        }

      }
      v24 = 2;
    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isReportJunkTextToAppleServerEnabled");

    if (v27)
    {
      if (-[IMDChatRegistry _shouldHandleInternalPhishingAttempts](self, "_shouldHandleInternalPhishingAttempts")
        || !a9)
      {
        v28 = 30;
      }
      else
      {
        v28 = 1;
      }
    }
    else
    {
      v28 = 30;
    }
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v50 == 45)
      objc_msgSend(v29, "itemsWithHandles:onServices:messageGUID:limit:", v15, v16, 0, v28);
    else
      objc_msgSend(v29, "itemsWithRoomNames:onServices:messageGUID:limit:", v15, v16, 0, v28);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMDChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v51);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "lastAddressedLocalHandle");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32)
      v33 = (__CFString *)v32;
    else
      v33 = &stru_1E92346B0;
    v52 = 0;
    v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    LOBYTE(v43) = a9;
    -[IMDChatRegistry _reportMessageDictionaryForMessages:withLastAddressedHandle:maxMessageLength:isAutoReport:withChat:maxMessagesToReport:totalMessageCount:isJunkReportedToCarrier:reportReason:iMessageReportSpamDictionaries:textMessageReportSpamDictionaries:](self, "_reportMessageDictionaryForMessages:withLastAddressedHandle:maxMessageLength:isAutoReport:withChat:maxMessagesToReport:totalMessageCount:isJunkReportedToCarrier:reportReason:iMessageReportSpamDictionaries:textMessageReportSpamDictionaries:", v45, v33, v44, v10, v31, v24, &v52, v43, a10, v34, v35);
    -[IMDChatRegistry _reportToIDSiMessageSpam:](self, "_reportToIDSiMessageSpam:", v34);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isReportJunkTextToAppleServerEnabled");

    if (v37)
      v38 = -[IMDChatRegistry _reportToIDSTextMessageSpam:](self, "_reportToIDSTextMessageSpam:", v35);
    else
      v38 = -[IMDChatRegistry _reportToIDSiMessageSpam:](self, "_reportToIDSiMessageSpam:", v35);
    if (v50 == 43 && !v10)
    {
      objc_msgSend(v31, "setWasReportedAsJunk:", 1);
      objc_msgSend(v31, "groupID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "length"))
      {
        objc_msgSend(MEMORY[0x1E0D39868], "sharedInstance");
        v40 = objc_claimAutoreleasedReturnValue();
        -[NSObject blocklistGroupId:](v40, "blocklistGroupId:", v39);
      }
      else
      {
        IMLogHandleForCategory();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          sub_1D166A97C((uint64_t)v31, v40);
      }

    }
    if (IMOSLoggingEnabled(v38))
    {
      OSLogHandleForIMFoundationCategory();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v54 = (const __CFString *)v52;
        _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "Marked %lu messages as spam", buf, 0xCu);
      }

    }
    v22 = v52;

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)_reportMessageDictionaryForMessages:(id)a3 withLastAddressedHandle:(id)a4 maxMessageLength:(unint64_t)a5 isAutoReport:(BOOL)a6 withChat:(id)a7 maxMessagesToReport:(unint64_t)a8 totalMessageCount:(unint64_t *)a9 isJunkReportedToCarrier:(BOOL)a10 reportReason:(unint64_t)a11 iMessageReportSpamDictionaries:(id)a12 textMessageReportSpamDictionaries:(id)a13
{
  _BOOL8 v14;
  id v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  uint64_t v23;
  id v25;

  v14 = a6;
  v25 = a3;
  v18 = a4;
  v19 = a7;
  v20 = a12;
  v21 = a13;
  v22 = !v14 && -[IMDChatRegistry _shouldHandleInternalPhishingAttempts](self, "_shouldHandleInternalPhishingAttempts");
  BYTE1(v23) = a10;
  LOBYTE(v23) = v22;
  -[IMDChatRegistry _reportMessageDictionaryForMessages:withLastAddressedHandle:maxMessageLength:isAutoReport:withChat:maxMessagesToReport:totalMessageCount:notifyInternalSecurity:isJunkReportedToCarrier:reportReason:iMessageReportSpamDictionaries:textMessageReportSpamDictionaries:](self, "_reportMessageDictionaryForMessages:withLastAddressedHandle:maxMessageLength:isAutoReport:withChat:maxMessagesToReport:totalMessageCount:notifyInternalSecurity:isJunkReportedToCarrier:reportReason:iMessageReportSpamDictionaries:textMessageReportSpamDictionaries:", v25, v18, a5, v14, v19, a8, a9, v23, a11, v20, v21);

}

- (void)_reportToIDSiMessageSpam:(id)a3
{
  if (a3)
    objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", &unk_1E922C660);
}

- (id)_spamMessageCreator
{
  return objc_alloc_init(IMDSpamMessageCreator);
}

- (void)_reportMessageDictionaryForMessages:(id)a3 withLastAddressedHandle:(id)a4 maxMessageLength:(unint64_t)a5 isAutoReport:(BOOL)a6 withChat:(id)a7 maxMessagesToReport:(unint64_t)a8 totalMessageCount:(unint64_t *)a9 notifyInternalSecurity:(BOOL)a10 isJunkReportedToCarrier:(BOOL)a11 reportReason:(unint64_t)a12 iMessageReportSpamDictionaries:(id)a13 textMessageReportSpamDictionaries:(id)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  _BOOL4 v26;

  v26 = a6;
  v18 = a14;
  v19 = a13;
  v20 = a7;
  v21 = a4;
  v22 = a3;
  -[IMDChatRegistry _spamMessageCreator](self, "_spamMessageCreator");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  LOWORD(v23) = __PAIR16__(a11, a10);
  objc_msgSend(v24, "reportMessageDictionariesForMessages:withLastAddressedHandle:maxMessageLength:isAutoReport:withChat:maxMessagesToReport:totalMessageCount:notifyInternalSecurity:isJunkReportedToCarrier:reportReason:iMessageReportSpamDictionaries:textMessageReportSpamDictionaries:", v22, v21, a5, v26, v20, a8, a9, v23, a12, v19, v18);

}

- (void)_reportToIDSTextMessageSpam:(id)a3
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D34358]);
    v5 = (void *)objc_msgSend(v4, "initWithService:", *MEMORY[0x1E0D34240]);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1D1523D54;
    v7[3] = &unk_1E9228890;
    v8 = v5;
    v6 = v5;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  }
  else
  {
    if (!IMOSLoggingEnabled(0))
      goto LABEL_4;
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Recieved empty junk message metadata dictionary while reporting to IDS server.", buf, 2u);
    }
  }

LABEL_4:
}

- (void)_finalizeIncomingChat:(id)a3
{
  id v4;

  v4 = a3;
  -[IMDChatRegistry _populateLastMessageForChat:](self, "_populateLastMessageForChat:", v4);
  objc_msgSend(v4, "_repairChatIfNeeded");

}

- (void)_populateLastMessageForChat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "lastMessageTimeStampOnLoad")
    || (objc_msgSend(v3, "lastMessage"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    objc_msgSend(v3, "lastMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastMessageForChatWithRowID:", objc_msgSend(v3, "rowID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled(objc_msgSend(v3, "setLastMessage:", v7)))
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v3, "guid");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "guid");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v23 = v9;
          v24 = 2112;
          v25 = v10;
          _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Chat %@ did not have final message, loaded %@", buf, 0x16u);

        }
      }

    }
    objc_msgSend(v3, "lastMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "guid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0D38298], 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_1D1524230;
      v19[3] = &unk_1E922A050;
      v20 = v3;
      objc_msgSend(v15, "fetchMessageRecordsForChatRecordWithGUID:filteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:", v16, 0, v18, 1, v19);

      v13 = v20;
    }
    else
    {
      objc_msgSend(v3, "lastMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "time");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setLastMessageTimeStampOnLoad:", objc_msgSend(v14, "__im_nanosecondTimeInterval"));

    }
  }

}

- (id)_addChatFromCacheMiss:(id)a3 preferExistingChat:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = a4;
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDChatRegistry _addChatsFromCacheMisses:preferExistingChats:](self, "_addChatsFromCacheMisses:preferExistingChats:", v8, v4, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)addChat:(id)a3
{
  -[IMDChatRegistry addChat:firstLoad:store:](self, "addChat:firstLoad:store:", a3, 0, 1);
}

- (void)addChat:(id)a3 firstLoad:(BOOL)a4 store:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  NSMutableDictionary *chats;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  BOOL v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  const __CFString *v41;
  void *v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v5 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v33 = v8;
  if (v8)
  {
    v35 = a4;
    if (!a4 && IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v33;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Registering chat: %@", buf, 0xCu);
      }

    }
    -[IMDChatRegistry _finalizeIncomingChat:](self, "_finalizeIncomingChat:", v33);
    -[NSRecursiveLock lock](self->_chatsLock, "lock");
    chats = self->_chats;
    objc_msgSend(v33, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](chats, "setObject:forKey:", v33, v11);

    if (objc_msgSend(v33, "style") == 43)
    {
      objc_msgSend(v33, "groupID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length") == 0;

      if (!v13)
        -[IMDChatRegistry __addChatToGroupIDChatIndex:](self, "__addChatToGroupIDChatIndex:", v33);
    }
    -[NSRecursiveLock unlock](self->_chatsLock, "unlock");
    if (!v35)
    {
      if (objc_msgSend(v33, "isBlackholed"))
        -[IMDChatRegistry checkBlackholedChatsExistAfterUpdatingChatWithAdd:](self, "checkBlackholedChatsExistAfterUpdatingChatWithAdd:", 1);
      if ((IMIsRunningInUnitTesting() & 1) == 0)
      {
        +[IMDChatVocabularyUpdater sharedInstance](IMDChatVocabularyUpdater, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "updateVocabularyForAddedChat:completionHandler:", v33, 0);

      }
    }
    if (v5)
    {
      +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "storeChat:", v33);

      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "updateStamp");

    }
    objc_msgSend(v33, "participants");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "__imArrayByApplyingBlock:", &unk_1E922C6C8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[IMDChatRegistry _contactsBasedMerginEnabled](self, "_contactsBasedMerginEnabled") && !v35)
      -[IMDChatRegistry _updateCachedCNIDMapForHandles:](self, "_updateCachedCNIDMapForHandles:", v32);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v33, "participants");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v38;
      v34 = *MEMORY[0x1E0D35C18];
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v21, "ID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22 && -[IMDChatRegistry _contactsBasedMerginEnabled](self, "_contactsBasedMerginEnabled"))
          {

            if (v35)
              goto LABEL_35;
            -[IMDChatRegistry cachedAliasToCNIDMap](self, "cachedAliasToCNIDMap");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "ID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v24);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = objc_msgSend(v22, "isEqualToString:", v34);
            if ((v25 & 1) == 0)
              v25 = objc_msgSend(v21, "setCNContactID:", v22);
            if (IMOSLoggingEnabled(v25))
            {
              OSLogHandleForIMFoundationCategory();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v21, "ID");
                v27 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "CNContactID");
                v28 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "guid");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v44 = v27;
                v45 = 2112;
                v46 = v28;
                v47 = 2112;
                v48 = v29;
                _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Adding handle %@ handleCNID  %@ to chat %@", buf, 0x20u);

              }
            }
          }

LABEL_35:
          -[IMDChatRegistry addIMDHandleToRegistry:](self, "addIMDHandleToRegistry:", v21);
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      }
      while (v18);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = CFSTR("__kIMDChatRegistryChatKey");
    v42 = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "postNotificationName:object:userInfo:", CFSTR("__kIMDChatRegistryAddedChatNotification"), self, v31);

    if (!v35)
      -[IMDChatRegistry invalidatePersonCentricGroupedChatsCache](self, "invalidatePersonCentricGroupedChatsCache");

  }
}

- (void)_evictCachedChat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = v6;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Evicting chat: %@", (uint8_t *)&v10, 0xCu);
      }

    }
    -[NSRecursiveLock lock](self->_chatsLock, "lock");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_chats, "setObject:forKeyedSubscript:", 0, v6);
    if (objc_msgSend(v5, "style") == 43)
    {
      objc_msgSend(v5, "groupID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length") == 0;

      if (!v9)
        -[IMDChatRegistry __removeChatFromGroupIDChatIndex:](self, "__removeChatFromGroupIDChatIndex:", v5);
    }
    -[NSRecursiveLock unlock](self->_chatsLock, "unlock");
    -[IMDChatRegistry invalidatePersonCentricGroupedChatsCache](self, "invalidatePersonCentricGroupedChatsCache");

  }
}

- (void)removeChat:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  IMDChatRegistry *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  void *v50;
  uint8_t buf[4];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v44 = self;
    if (IMOSLoggingEnabled(-[IMDChatRegistry invalidatePersonCentricGroupedChatsCache](self, "invalidatePersonCentricGroupedChatsCache")))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v4;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Unregistering chat: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v4, "guid");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChatRegistry _evictCachedChat:](v44, "_evictCachedChat:", v4);
    if (objc_msgSend(v4, "isBlackholed"))
      -[IMDChatRegistry checkBlackholedChatsExistAfterUpdatingChatWithAdd:](v44, "checkBlackholedChatsExistAfterUpdatingChatWithAdd:", 0);
    if (!v44->_isLoading)
    {
      v6 = IMIsRunningInUnitTesting();
      if ((v6 & 1) == 0)
      {
        if (IMOSLoggingEnabled(v6))
        {
          OSLogHandleForIMFoundationCategory();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v4;
            _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Deleting chat: %@", buf, 0xCu);
          }

        }
        +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "deleteChat:", v4);

        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "updateStamp");

        objc_msgSend(MEMORY[0x1E0D39890], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v42;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "deleteInteractionsWithChatGUIDs:", v11);

        +[IMDChatVocabularyUpdater sharedInstance](IMDChatVocabularyUpdater, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "updateVocabularyForDeletedChat:completionHandler:", v4, 0);

        objc_msgSend(v4, "recordName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "cloudKitSyncingEnabled");

          if (v15)
          {
            if (IMOSLoggingEnabled(v16))
            {
              OSLogHandleForIMFoundationCategory();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "CloudKit syncing is on. Writing deleted chat to deleted sync table", buf, 2u);
              }

            }
            objc_msgSend(v4, "guid");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "recordName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "lastMessage");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "time");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "__im_nanosecondTimeInterval");
            IMDChatInsertIntoDeletedChatsTable();

          }
        }

      }
    }
    objc_msgSend(v4, "account");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "session");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "guid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chatIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v4, "style");
    objc_msgSend(v4, "groupID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalGroupID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "properties");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastAddressedLocalHandle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastAddressedSIMID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "didDeleteChatGUID:chatIdentifier:style:groupID:originalGroupID:properties:lastAddressedLocalHandle:lastAddressedSIMID:", v23, v24, v25, v26, v27, v28, v29, v30);

    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v4, "participants");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v46 != v34)
            objc_enumerationMutation(v32);
          v36 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "removeIMDHandleFromRegistry:", v36);

          if (v38)
          {
            objc_msgSend(v36, "ID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObject:", v39);

          }
        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v33);
    }

    +[IMDNicknameController sharedInstance](IMDNicknameController, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "cleanUpNicknameForIDs:", v31);

    -[IMDChatRegistry personCentricGroupedChatsCache](v44, "personCentricGroupedChatsCache");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "removeAllObjects");

  }
}

- (void)addItem:(id)a3 toChat:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serviceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "canStoreItem:onService:", v5, v9);

      if (v10)
      {
        if (IMOSLoggingEnabled(v11))
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v5, "guid");
            v13 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "guid");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = 136315650;
            v18 = "-[IMDChatRegistry addItem:toChat:]";
            v19 = 2112;
            v20 = v13;
            v21 = 2112;
            v22 = v14;
            _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "%s: item: %@ chat: %@\n", (uint8_t *)&v17, 0x20u);

          }
        }
        +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "guid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addMessageWithGUID:toChat:", v16, v7);

      }
    }
  }

}

- (void)removeItem:(id)a3 fromChat:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (v13)
  {
    if (v6)
    {
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serviceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "canStoreItem:onService:", v13, v8);

      if (v9)
      {
        +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeMessageWithGUID:fromChat:", v11, v6);

        +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "updateLastMessageForChat:hintMessage:", v6, 0);

        -[IMDChatRegistry updateStateForChat:hintMessage:](self, "updateStateForChat:hintMessage:", v6, 0);
      }
    }
  }

}

- (void)addMessage:(id)a3 toChat:(id)a4
{
  -[IMDChatRegistry addMessage:toChat:deferSpotlightIndexing:](self, "addMessage:toChat:deferSpotlightIndexing:", a3, a4, 0);
}

- (void)addMessage:(id)a3 toChat:(id)a4 deferSpotlightIndexing:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v5 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = IMOSLoggingEnabled(v8);
  if ((_DWORD)v9)
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "guid");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "guid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136315650;
      v25 = "-[IMDChatRegistry addMessage:toChat:deferSpotlightIndexing:]";
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "%s: message: %@ chat: %@\n", (uint8_t *)&v24, 0x20u);

    }
  }
  if (!v7 || !v8)
  {
    if (!IMOSLoggingEnabled(v9))
      goto LABEL_21;
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = 138412546;
      v25 = (const char *)v7;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "******* Not storing message %@ to chat %@", (uint8_t *)&v24, 0x16u);
    }
    goto LABEL_20;
  }
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "canStoreMessage:onService:", v7, v14);

  v17 = IMOSLoggingEnabled(v16);
  if ((v15 & 1) == 0)
  {
    if (!v17)
      goto LABEL_21;
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = 138412546;
      v25 = (const char *)v7;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "******* IMDMessageStore cannot store message %@ to chat %@", (uint8_t *)&v24, 0x16u);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (v17)
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "guid");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "guid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136315650;
      v25 = "-[IMDChatRegistry addMessage:toChat:deferSpotlightIndexing:]";
      v26 = 2112;
      v27 = v19;
      v28 = 2112;
      v29 = v20;
      _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "%s: message: %@ chat: %@\n", (uint8_t *)&v24, 0x20u);

    }
  }
  +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addMessageWithGUID:toChat:deferSpotlightIndexing:", v22, v8, v5);

LABEL_21:
}

- (void)removeMessage:(id)a3 fromChat:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (v13)
  {
    if (v6)
    {
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serviceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "canStoreMessage:onService:", v13, v8);

      if (v9)
      {
        +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeMessageWithGUID:fromChat:", v11, v6);

        +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "updateLastMessageForChat:hintMessage:", v6, 0);

        -[IMDChatRegistry updateStateForChat:hintMessage:](self, "updateStateForChat:hintMessage:", v6, 0);
      }
    }
  }

}

- (void)_fixSiblingChatsAndStoreIfNeeded:(id)a3 iMessageChat:(id)a4 chatsToRegenerate:(id)a5
{
  id v7;
  __int128 v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  char v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  __int128 v36;
  id obj;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v45 = a4;
  v39 = a5;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v7;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v47;
    *(_QWORD *)&v8 = 138413314;
    v36 = v8;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v47 != v40)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v10, "displayName", v36);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "groupID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "displayName");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "groupID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "serviceSession");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "chatCanMergeWithSuperChat:", v10);

        if (v13
          && (!IMSharedHelperAreObjectsLogicallySame()
           || (IMSharedHelperAreObjectsLogicallySame() & 1) == 0))
        {
          objc_msgSend(v10, "setGroupID:", v11);
          if (IMOSLoggingEnabled(objc_msgSend(v10, "setDisplayName:", v44)))
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v10, "guid");
              v15 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "displayName");
              v16 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "groupID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v36;
              v51 = v15;
              v52 = 2112;
              v53 = v42;
              v54 = 2112;
              v55 = v43;
              v56 = 2112;
              v57 = v16;
              v58 = 2112;
              v59 = v17;
              _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Storing sibling chat %@ old display name %@, old group ID %@ new display name %@, new group ID %@", buf, 0x34u);

            }
          }
          -[IMDChatRegistry chatStore](self, "chatStore");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "storeChat:", v10);

        }
        objc_msgSend(v45, "participants");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "participants");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v19, "count"))
        {
          v21 = objc_msgSend(v20, "count");
          if (v21)
          {
            if (IMOSLoggingEnabled(v21))
            {
              OSLogHandleForIMFoundationCategory();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v51 = v45;
                v52 = 2112;
                v53 = v20;
                _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Found iMessage chat with zero participants %@. Updating with sibling participants %@", buf, 0x16u);
              }

            }
            objc_msgSend(v45, "resetParticipants:", v20);
            v23 = v20;

            objc_msgSend(v39, "addObject:", v45);
            v19 = v23;
          }
        }
        sub_1D14176D4(v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1D14176D4(v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "isEqualToSet:", v25) & 1) == 0)
        {
          objc_msgSend(v10, "serviceSession");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "chatCanMergeWithSuperChat:", v10);

          if (v27)
          {
            if (IMOSLoggingEnabled(v28))
            {
              OSLogHandleForIMFoundationCategory();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v51 = v10;
                v52 = 2112;
                v53 = v45;
                _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Found sibling chat with different participants than its iMessage sibling. Chat: %@. Updating participants using %@", buf, 0x16u);
              }

            }
            objc_msgSend(v10, "resetParticipants:", v19);
          }
          else
          {
            objc_msgSend(v10, "groupID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "groupID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v30, "isEqualToString:", v31);

            if ((v32 & 1) != 0)
              goto LABEL_35;
            if (IMOSLoggingEnabled(v33))
            {
              OSLogHandleForIMFoundationCategory();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "Found sibling chat with different participants than its iMessage sibling, but it is backed by a group server. We must fork 🍴", buf, 2u);
              }

            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setGroupID:", v35);

          }
          objc_msgSend(v39, "addObject:", v10);
        }
LABEL_35:

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
    }
    while (v41);
  }

}

- (void)_fixUpChatParticipantsIfNeeded:(id)a3
{
  -[IMDChatRegistry _fixUpChatParticipantsIfNeeded:usingChatGUIDToChatMap:](self, "_fixUpChatParticipantsIfNeeded:usingChatGUIDToChatMap:", a3, 0);
}

- (id)_siblingChatsForChat:(id)a3 usingChatGUIDToChatMap:(id)a4 iMessageChat:(id *)a5
{
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v21;
  id *v22;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v24 = a4;
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D38F68]);
  v22 = a5;
  if (a5 && v9)
    *a5 = objc_retainAutorelease(v7);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  +[IMDChatRegistry supportedServiceNames](IMDChatRegistry, "supportedServiceNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isEqualToString:", v8) & 1) == 0)
        {
          -[IMDChatRegistry stringForChatStyle:](self, "stringForChatStyle:", objc_msgSend(v7, "style"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "chatIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)IMSharedHelperNSNewStringByAppendingStrings();

          objc_msgSend(v24, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v21, "addObject:", v18);
            v19 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D38F68]);
            if (v22)
            {
              if (v19)
                *v22 = objc_retainAutorelease(v18);
            }
          }

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

  return v21;
}

- (id)_chatInfoForChats:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v17;
    *(_QWORD *)&v7 = 138412290;
    v15 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(v11, "copyDictionaryRepresentation:", 1, v15, (_QWORD)v16);
        if (v12)
        {
          objc_msgSend(v4, "addObject:", v12);
        }
        else
        {
          IMLogHandleForCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            v21 = v11;
            _os_log_error_impl(&dword_1D1413000, v13, OS_LOG_TYPE_ERROR, "Could not get chatInfo from chat: %@", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v8);
  }

  return v4;
}

- (id)_chatInfoForConnection
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__chatInfoInRange_wantsBlackholed_);
}

- (id)_allChatInfo
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__chatInfoInRange_wantsBlackholed_);
}

- (id)_chatInfoForNumberOfChats:(int64_t)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__chatInfoInRange_wantsBlackholed_);
}

- (id)_blackholedChatInfoForNumberOfChats:(int64_t)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__chatInfoInRange_wantsBlackholed_);
}

- (id)_chatInfoInRange:(_NSRange)a3 wantsBlackholed:(BOOL)a4
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id obj;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint8_t v47[128];
  uint8_t buf[4];
  NSUInteger v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  NSUInteger v53;
  __int16 v54;
  NSUInteger v55;
  uint64_t v56;

  length = a3.length;
  location = a3.location;
  v56 = *MEMORY[0x1E0C80C00];
  -[IMDChatRegistry _chatsWithBlackholed:](self, "_chatsWithBlackholed:", a4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v28, "count");
  if (location + length <= v6)
  {
    if (!location && IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v49 = length;
        v50 = 2048;
        v51 = objc_msgSend(v28, "count");
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Retrieving %ld most recent chats out of %ld chats", buf, 0x16u);
      }

    }
    v8 = length;
  }
  else
  {
    v7 = objc_msgSend(v28, "count");
    v8 = v7 - location;
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218752;
        v49 = location;
        v50 = 2048;
        v51 = length;
        v52 = 2048;
        v53 = location;
        v54 = 2048;
        v55 = v8;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Could not retrieve chats in range (%ld,%ld) as there are not that many, so retrieving all chats, range (%ld,%ld).", buf, 0x2Au);
      }

    }
  }
  objc_msgSend(v28, "sortedArrayUsingComparator:", &unk_1E922C6E8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subarrayWithRange:", location, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v13);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v13);
  v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v13);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v12;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v43 != v31)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v16, "guid");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKey:", v16, v36);
        v41 = 0;
        -[IMDChatRegistry _siblingChatsForChat:usingChatGUIDToChatMap:iMessageChat:](self, "_siblingChatsForChat:usingChatGUIDToChatMap:iMessageChat:", v16, v34, &v41);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v41;
        v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (objc_msgSend(v17, "count"))
          -[IMDChatRegistry _fixSiblingChatsAndStoreIfNeeded:iMessageChat:chatsToRegenerate:](self, "_fixSiblingChatsAndStoreIfNeeded:iMessageChat:chatsToRegenerate:", v17, v35, v18);
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v38;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v38 != v21)
                objc_enumerationMutation(v19);
              v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
              if (v23 != v16)
              {
                v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "copyDictionaryRepresentation:", 1);
                if (objc_msgSend(v24, "count"))
                {
                  objc_msgSend(v23, "guid");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "setObject:forKey:", v24, v25);

                }
              }
            }
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          }
          while (v20);
        }

        v26 = (void *)objc_msgSend(v16, "copyDictionaryRepresentation:", 1);
        if (objc_msgSend(v26, "count"))
        {
          objc_msgSend(v14, "setObject:forKey:", v26, v36);
          objc_msgSend(v30, "addObject:", v26);
        }

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v32);
  }

  return v30;
}

- (void)_setInitialLoadForTesting:(BOOL)a3
{
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint8_t v8[16];

  v5 = IMIsRunningInUnitTesting();
  if ((v5 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "********* Calling setInitialLoadForTesting in non unit tests is not supported ***** ", v8, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("com.apple.IMDaemonCore.unsupportedAction"), 0, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  self->_doneLoadingAfterMerge = a3;
}

- (void)_forceReloadChats:(BOOL)a3
{
  _BOOL4 v3;
  IMDChatRegistry *v4;
  unint64_t v5;
  NSObject *v6;
  _BOOL4 isLoading;
  _BOOL4 doneLoadingAfterMerge;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  int v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v3 = a3;
  v4 = self;
  v30 = *MEMORY[0x1E0C80C00];
  if ((self->_isLoading || self->_doneLoadingAfterMerge) && !a3)
  {
    v5 = -[IMDChatRegistry cachedChatCount](self, "cachedChatCount");
    self = (IMDChatRegistry *)IMOSLoggingEnabled(v5);
    if (v5)
    {
      if ((_DWORD)self)
      {
        OSLogHandleForIMEventCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          isLoading = v4->_isLoading;
          doneLoadingAfterMerge = v4->_doneLoadingAfterMerge;
          v24 = 67109632;
          v25 = isLoading;
          v26 = 1024;
          v27 = doneLoadingAfterMerge;
          v28 = 1024;
          v29 = v3;
          _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "NOT forcing reload of chats _isLoading: %d _doneLoadingAfterMerge: %d forced: %d", (uint8_t *)&v24, 0x14u);
        }

      }
      return;
    }
    if ((_DWORD)self)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Would have ignored reload of chats but has zero chats, forcing reload", (uint8_t *)&v24, 2u);
      }

    }
  }
  v10 = IMOSLoggingEnabled(self);
  if ((_DWORD)v10)
  {
    OSLogHandleForIMEventCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = v4->_isLoading;
      v13 = v4->_doneLoadingAfterMerge;
      v24 = 67109632;
      v25 = v12;
      v26 = 1024;
      v27 = v13;
      v28 = 1024;
      v29 = v3;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Forcing reload of chats _isLoading: %d _doneLoadingAfterMerge: %d forced: %d", (uint8_t *)&v24, 0x14u);
    }

  }
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Dropping all chats in registry", (uint8_t *)&v24, 2u);
    }

  }
  -[NSRecursiveLock lock](v4->_chatsLock, "lock");
  -[NSMutableDictionary removeAllObjects](v4->_chats, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](v4->_chatsByGroupID, "removeAllObjects");
  -[NSRecursiveLock unlock](v4->_chatsLock, "unlock");
  -[NSRecursiveLock lock](v4->_handlesLock, "lock");
  -[NSMutableDictionary removeAllObjects](v4->_idToHandlesMap, "removeAllObjects");
  -[NSRecursiveLock unlock](v4->_handlesLock, "unlock");
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeFinishedTransfers");

  -[IMDChatRegistry invalidatePersonCentricGroupedChatsCache](v4, "invalidatePersonCentricGroupedChatsCache");
  if (IMOSLoggingEnabled(-[IMDChatRegistry loadChatsWithCompletionBlock:](v4, "loadChatsWithCompletionBlock:", 0)))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Updating database clients", (uint8_t *)&v24, 2u);
    }

  }
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateStamp");

  if (IMOSLoggingEnabled(v18))
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Posting the update chat registry to all listeners", (uint8_t *)&v24, 2u);
    }

  }
  +[IMDLocalDaemon sharedDaemon](IMDLocalDaemon, "sharedDaemon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "notifyClientsNewSetupInfoAvailableWithRequiredCapabilities:", 4);

  if (IMOSLoggingEnabled(v21))
  {
    OSLogHandleForIMEventCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "=> Done notifying clients", (uint8_t *)&v24, 2u);
    }

  }
  +[IMDChatVocabularyUpdater sharedInstance](IMDChatVocabularyUpdater, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "updateVocabularyForDeferredUpdateRequestIfNecessaryWithCompletionHandler:", 0);

}

- (void)refreshUIWhileSyncing
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1413000, v2, OS_LOG_TYPE_INFO, "Posting the update chat registry to all listeners", v4, 2u);
    }

  }
  +[IMDLocalDaemon sharedDaemon](IMDLocalDaemon, "sharedDaemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyClientsNewSetupInfoAvailableWithRequiredCapabilities:", 4);

}

- (void)waitForLoadedChatsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMEventCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Received request to wait for chats to be loaded", buf, 2u);
    }

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D1526E98;
  v7[3] = &unk_1E9229148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

- (BOOL)loadChatsWithCompletionBlock:(id)a3
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void (*v43)(void *);
  NSObject *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  int v50;
  int v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void (*v58)(void *);
  NSObject *v59;
  NSObject *v60;
  uint64_t v61;
  BOOL v62;
  void *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  int v68;
  void *v69;
  char v70;
  uint64_t v71;
  NSObject *v72;
  IMDChatRegistry *v73;
  IMDMessageProcessingController *v74;
  IMDMessageProcessingController *messageProcessingController;
  IMDMessageHistorySyncTaskLiveFactory *v76;
  IMDMessageHistorySyncController *v77;
  IMDMessageHistorySyncController *messageHistorySyncController;
  void *v79;
  void *v80;
  char v82;
  void (**v83)(id, uint64_t);
  void *v84;
  int v85;
  id obj;
  uint64_t v88;
  int v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t v94[4];
  void *v95;
  _BYTE buf[32];
  uint64_t v97;
  _BYTE v98[128];
  uint64_t v99;
  _QWORD v100[3];

  v100[1] = *MEMORY[0x1E0C80C00];
  v83 = (void (**)(id, uint64_t))a3;
  if (IMOSLoggingEnabled(v83))
  {
    OSLogHandleForIMEventCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Loading Chats... ", buf, 2u);
    }

  }
  self->_isLoading = 1;
  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v4, "isUnderFirstDataProtectionLock");

  v5 = IMGetDomainBoolForKeyWithDefaultValue();
  v85 = v5;
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("YES");
      if (v85)
        v7 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Should fix unnamed groupID: %@", buf, 0xCu);
    }

  }
  +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loadRecentChats");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(v84, "count");
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v11;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, " Found %d chats", buf, 8u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = *MEMORY[0x1E0D38A80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v84, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, &v99, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trackEvent:withDictionary:", *MEMORY[0x1E0D38548], v14);

  if (!v84 || !objc_msgSend(v84, "count"))
  {
    v62 = 0;
    goto LABEL_86;
  }
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = v84;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
  if (!v15)
  {
    LOBYTE(v89) = 0;
    goto LABEL_85;
  }
  v89 = 0;
  v88 = *(_QWORD *)v91;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v91 != v88)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v16);
      v18 = (void *)MEMORY[0x1D17EA968]();
      if (v17)
      {
        +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "accountID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "accountForAccountID:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          goto LABEL_38;
        objc_msgSend(v17, "service");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "serviceName");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if (!v22)
        {
          v23 = IMOSLoggingEnabled(v23);
          if ((_DWORD)v23)
          {
            OSLogHandleForIMFoundationCategory();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v24;
              _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "No service found, looking at name: %@", buf, 0xCu);
            }

          }
        }
        if (v24)
        {
          +[IMDServiceController sharedController](IMDServiceController, "sharedController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "serviceWithName:", v24);
          v27 = objc_claimAutoreleasedReturnValue();

          v22 = (void *)v27;
        }
        if (!v22 && IMOSLoggingEnabled(v23))
        {
          OSLogHandleForIMFoundationCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v24;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v17;
            _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "No service found for name: %@: removing this chat [%@]", buf, 0x16u);
          }

        }
        +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "accountsForService:", v22);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "lastObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v21, "accountID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setAccountID:", v32);

LABEL_38:
          -[IMDChatRegistry addChat:firstLoad:store:](self, "addChat:firstLoad:store:", v17, 1, 0);
          objc_msgSend(v17, "groupID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "length") == 0;

          if (v34)
          {
            objc_msgSend(v17, "generateNewGroupID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v37)
            {
              *(_OWORD *)buf = xmmword_1E922C730;
              *(_OWORD *)&buf[16] = *(_OWORD *)off_1E922C740;
              v97 = 2090;
              v38 = (void *)MEMORY[0x1E0CB3940];
              v39 = IMFileLocationTrimFileName();
              v40 = v97;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E92346B0);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "stringWithFormat:", CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), CFSTR("generatedGroupID"), "-[IMDChatRegistry loadChatsWithCompletionBlock:]", v39, v40, v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              v43 = (void (*)(void *))IMGetAssertionFailureHandler();
              if (v43)
              {
                v43(v42);
              }
              else if (IMOSLoggingEnabled(0))
              {
                OSLogHandleForIMFoundationCategory();
                v49 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v94 = 138412290;
                  v95 = v42;
                  _os_log_impl(&dword_1D1413000, v49, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", v94, 0xCu);
                }

              }
            }
            objc_msgSend(v17, "setGroupID:", v37);
          }
          else
          {
            if ((v85 & 1) != 0
              || (objc_msgSend(v17, "displayName"),
                  v35 = (void *)objc_claimAutoreleasedReturnValue(),
                  v36 = objc_msgSend(v35, "length") == 0,
                  v35,
                  !v36))
            {
              IMSetDomainBoolForKey();
              goto LABEL_59;
            }
            v45 = objc_alloc(MEMORY[0x1E0CB3A28]);
            objc_msgSend(v17, "groupID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = (void *)objc_msgSend(v45, "initWithUUIDString:", v46);

            if (v47)
            {

              IMSetDomainBoolForKey();
              goto LABEL_59;
            }
            if (IMOSLoggingEnabled(v48))
            {
              OSLogHandleForIMFoundationCategory();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v17;
                _os_log_impl(&dword_1D1413000, v52, OS_LOG_TYPE_INFO, "Unnamed group with non UUID style groupID, lets fix this chat: %@", buf, 0xCu);
              }

            }
            objc_msgSend(v17, "generateNewGroupID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v37)
            {
              *(_OWORD *)buf = xmmword_1E922C758;
              *(_OWORD *)&buf[16] = *(_OWORD *)off_1E922C768;
              v97 = 2102;
              v53 = (void *)MEMORY[0x1E0CB3940];
              v54 = IMFileLocationTrimFileName();
              v55 = v97;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E92346B0);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "stringWithFormat:", CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), CFSTR("generatedGroupID"), "-[IMDChatRegistry loadChatsWithCompletionBlock:]", v54, v55, v56);
              v57 = (void *)objc_claimAutoreleasedReturnValue();

              v58 = (void (*)(void *))IMGetAssertionFailureHandler();
              if (v58)
              {
                v58(v57);
              }
              else if (IMOSLoggingEnabled(0))
              {
                OSLogHandleForIMFoundationCategory();
                v59 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v94 = 138412290;
                  v95 = v57;
                  _os_log_impl(&dword_1D1413000, v59, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", v94, 0xCu);
                }

              }
            }
            if (IMOSLoggingEnabled(objc_msgSend(v17, "setGroupID:", v37)))
            {
              OSLogHandleForIMFoundationCategory();
              v60 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v37;
                _os_log_impl(&dword_1D1413000, v60, OS_LOG_TYPE_INFO, "    New groupID: %@", buf, 0xCu);
              }

            }
          }

          IMSetDomainBoolForKey();
          objc_msgSend(v17, "storeAndBroadcastChatChanges");
LABEL_59:
          v50 = objc_msgSend(v17, "isBlackholed");
          v51 = v89;
          if (v50)
            v51 = 1;
          v89 = v51;
          v22 = v21;
        }
        else
        {
          if (IMOSLoggingEnabled(v31))
          {
            OSLogHandleForIMFoundationCategory();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v17;
              _os_log_impl(&dword_1D1413000, v44, OS_LOG_TYPE_INFO, "No account: removing this chat [%@]", buf, 0xCu);
            }

          }
        }

      }
      objc_autoreleasePoolPop(v18);
      ++v16;
    }
    while (v15 != v16);
    v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
    v15 = v61;
  }
  while (v61);
LABEL_85:

  v62 = v89 & 1;
LABEL_86:
  self->_blackholedChatsExistCache = v62;
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "rebuildUnreadMessageCount");

  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "rebuildLastFailedMessageDate");

  if (IMOSLoggingEnabled(v65))
  {
    OSLogHandleForIMEventCategory();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      -[IMDChatRegistry cachedChats](self, "cachedChats");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "count");
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v68;
      _os_log_impl(&dword_1D1413000, v66, OS_LOG_TYPE_INFO, "=> Done Loading %d Chats", buf, 8u);

    }
  }
  self->_isLoading = 0;
  self->_doneLoadingAfterMerge = v82 ^ 1;
  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "isUnderFirstDataProtectionLock");

  if ((v70 & 1) != 0)
  {
    if (IMOSLoggingEnabled(v71))
    {
      OSLogHandleForIMEventCategory();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v72, OS_LOG_TYPE_INFO, "Not merging forks before first unlock", buf, 2u);
      }

    }
  }
  else
  {
    -[IMDChatRegistry repairDuplicateChatsIfNeeded](self, "repairDuplicateChatsIfNeeded");
  }
  if (IMSharedHelperContactsBasedMergingEnabled())
    -[IMDChatRegistry _populateContactIDOnHandles](self, "_populateContactIDOnHandles");
  if (IMSharedHelperPersistMergeIDMergedChats())
    -[IMDChatRegistry _persistMergeIDMergedChatsIfNeeded](self, "_persistMergeIDMergedChatsIfNeeded");
  if ((v82 & 1) == 0)
    -[IMDChatRegistry _markGroupPhotosAsUnpurgeableIfNecessary](self, "_markGroupPhotosAsUnpurgeableIfNecessary");
  v73 = self;
  if (!self->_messageProcessingController)
  {
    v74 = objc_alloc_init(IMDMessageProcessingController);
    messageProcessingController = self->_messageProcessingController;
    self->_messageProcessingController = v74;

    -[IMDMessageProcessingController scheduleInitialProcessingCheck](self->_messageProcessingController, "scheduleInitialProcessingCheck");
    v73 = self;
  }
  if (!v73->_messageHistorySyncController)
  {
    v76 = objc_alloc_init(IMDMessageHistorySyncTaskLiveFactory);
    v77 = -[IMDMessageHistorySyncController initWithMessageHistorySyncTaskFactory:]([IMDMessageHistorySyncController alloc], "initWithMessageHistorySyncTaskFactory:", v76);
    messageHistorySyncController = self->_messageHistorySyncController;
    self->_messageHistorySyncController = v77;

  }
  if (v83)
    v83[2](v83, 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "postNotificationName:object:", CFSTR("__kIMDChatsLoadedNotification"), 0);

  +[IMDCKExitManager sharedInstance](IMDCKExitManager, "sharedInstance");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "writeInitialSyncCompletedRecordIfNeeded");

  -[IMDChatRegistry setUpInitialConversationManager](self, "setUpInitialConversationManager");
  +[IMDChatVocabularyUpdater performInitialUpdateIfNeeded](IMDChatVocabularyUpdater, "performInitialUpdateIfNeeded");

  return 1;
}

- (void)_persistMergeIDMergedChatsIfNeeded
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((byte_1ED936000 & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1D17EA968](self, a2);
    -[IMDChatRegistry _allHandles](self, "_allHandles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMEventCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v18 = objc_msgSend(v4, "count");
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "try to persist mergeID merged chats for [%lu] handles", buf, 0xCu);
      }

    }
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[IMDChatRegistry allChats](self, "allChats", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1D17EA968]();
          objc_msgSend(v10, "_persistMergedIDMergedChatsIfNeeded:", v4);
          objc_autoreleasePoolPop(v11);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    byte_1ED936000 = 1;
    objc_autoreleasePoolPop(v3);
  }
}

- (BOOL)updateProperties:(id)a3 chat:(id)a4 style:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count") && objc_msgSend(v9, "length"))
  {
    -[IMDChatRegistry allExistingChatsWithIdentifier:style:](self, "allExistingChatsWithIdentifier:style:", v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v10);
          v13 |= objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "updateProperties:", v8);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }
    else
    {
      LOBYTE(v13) = 0;
    }

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13 & 1;
}

- (void)addIMDHandleToRegistry:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *idToHandlesMap;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSRecursiveLock lock](self->_handlesLock, "lock");
  if (v4
    && (objc_msgSend(v4, "ID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v7))
  {
    idToHandlesMap = self->_idToHandlesMap;
    objc_msgSend(v4, "ID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](idToHandlesMap, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v11 = self->_idToHandlesMap;
      objc_msgSend(v4, "ID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v10, v12);

    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v19;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v13);
          if (*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16) == v4)
          {

            goto LABEL_20;
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v14)
          continue;
        break;
      }
    }

    objc_msgSend(v13, "addObject:", v4, (_QWORD)v18);
LABEL_20:
    -[NSRecursiveLock unlock](self->_handlesLock, "unlock", (_QWORD)v18);
  }
  else
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v4;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Will not add malformed IMHandle:%@ to IMDHandleRegistry", buf, 0xCu);
      }

    }
    v13 = 0;
  }

}

- (BOOL)removeIMDHandleFromRegistry:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *idToHandlesMap;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSMutableDictionary *v13;
  void *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSRecursiveLock lock](self->_handlesLock, "lock");
  if (!v4)
    goto LABEL_12;
  objc_msgSend(v4, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    goto LABEL_15;
  idToHandlesMap = self->_idToHandlesMap;
  objc_msgSend(v4, "ID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](idToHandlesMap, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_12:
    LOBYTE(v6) = 0;
    goto LABEL_15;
  }
  v10 = objc_msgSend(v9, "indexOfObject:", v4);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v10;
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v4;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Removing IMDHandle:%@ from IMDHandleRegistry", (uint8_t *)&v16, 0xCu);
      }

    }
    objc_msgSend(v9, "removeObjectAtIndex:", v11);
  }
  LODWORD(v6) = objc_msgSend(v9, "count") == 0;
  v13 = self->_idToHandlesMap;
  objc_msgSend(v4, "ID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v6)
    -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v14);
  else
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v9, v14);

LABEL_15:
  -[NSRecursiveLock unlock](self->_handlesLock, "unlock");

  return v6;
}

- (id)allHandlesForID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSRecursiveLock lock](self->_handlesLock, "lock");
  if (objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_idToHandlesMap, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSRecursiveLock unlock](self->_handlesLock, "unlock");
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (void)_reloadChatsForDatabaseMergeOrDatabaseSwitch
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Received merge complete notification, re-syncing chats", v4, 2u);
    }

  }
  -[IMDChatRegistry _forceReloadChats:](self, "_forceReloadChats:", 1);
  -[IMDChatRegistry _performPostUnlockHousekeeping](self, "_performPostUnlockHousekeeping");
}

- (void)_performPostUnlockHousekeeping
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t MessagesSequenceNumber;
  int v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performInitialHousekeeping");

  +[IMDReplayController sharedInstance](IMDReplayController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replayMessages");

  +[IMDCKBackupController sharedInstance](IMDCKBackupController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ensureRestoredDatabaseToBackup");

  MessagesSequenceNumber = IMDMessageRecordGetMessagesSequenceNumber();
  v6 = IMOSLoggingEnabled(MessagesSequenceNumber);
  if (MessagesSequenceNumber == -1)
  {
    if (v6)
    {
      OSLogHandleForIMEventCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 134217984;
        v10 = -1;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Not Resetting LastBulletinboardPostedMessageRowID: %lld", (uint8_t *)&v9, 0xCu);
      }

    }
  }
  else
  {
    if (v6)
    {
      OSLogHandleForIMEventCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v9 = 134217984;
        v10 = MessagesSequenceNumber;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Resetting LastBulletinboardPostedMessageRowID: %lld", (uint8_t *)&v9, 0xCu);
      }

    }
    IMSetDomainIntForKey();
  }
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Device left first unlock, re-syncing chats", buf, 2u);
    }

  }
  self->_firstUnlockTriggered = 1;
  objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notifyFirstUnlockComplete");

  -[IMDChatRegistry _forceReloadChats:](self, "_forceReloadChats:", 0);
  -[IMDChatRegistry _makeAllAttachmentsClassC](self, "_makeAllAttachmentsClassC");
  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anySessionForServiceName:", *MEMORY[0x1E0D38F68]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (+[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "anySessionForServiceName:", *MEMORY[0x1E0D38F58]),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "calling update routing, expire and watch dog after first unlock", v19, 2u);
      }

    }
    objc_msgSend(v6, "_updateRoutingTimerWithInterval:", 120.0);
    objc_msgSend(v6, "_updateExpireStateTimerWithInterval:", 120.0);
    objc_msgSend(v6, "_updateWatchdogTimerWithInterval:", 120.0);
  }
  +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:", &unk_1E922C780);

  +[IMDCKRampManager sharedInstance](IMDCKRampManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchLatestRampStateFromCK:", 0);

  if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Performing one time account check after upgrade", v18, 2u);
    }

  }
  +[IMDCKSyncController sharedInstance](IMDCKSyncController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performOneTimeAccountUpgradeCheckIfNeeded");

  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activeAliases");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v16, *MEMORY[0x1E0D360D0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  IMDNotificationsRetractNotificationsFromFirstUnlockWithContext();

}

- (void)systemDidUnlock
{
  NSObject *v3;
  void *v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "systemDidUnlock", buf, 2u);
    }

  }
  if (!self->_firstUnlockTriggered)
  {
    objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isUnderFirstDataProtectionLock");

    if ((v5 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v6))
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Detected an unlock but first unlock notifications were missed, performing first unlock as if we did just now", v8, 2u);
        }

      }
      -[IMDChatRegistry systemDidLeaveFirstDataProtectionLock](self, "systemDidLeaveFirstDataProtectionLock");
    }
  }
  -[IMDChatRegistry _makeAllAttachmentsClassC](self, "_makeAllAttachmentsClassC");
}

- (void)_makeAllAttachmentsClassC
{
  if ((IMGetDomainBoolForKey() & 1) == 0)
    im_dispatch_after();
}

- (BOOL)_chat:(id)a3 isDuplicateOfChat:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "style") == 43 && objc_msgSend(v6, "style") == 43)
  {
    objc_msgSend(v5, "groupID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      objc_msgSend(v5, "serviceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serviceName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)_compareDuplicateChatsWithFirstChat:(id)a3 secondChat:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "groupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  if (!v9)
  {
    objc_msgSend(v5, "serviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "compare:", v11);

    if (!v9)
    {
      v12 = objc_msgSend(v5, "groupParticipantVersion");
      v13 = objc_msgSend(v6, "groupParticipantVersion");
      if (v12 >= v13)
      {
        if (v12 <= v13)
        {
          objc_msgSend(v5, "displayName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "displayName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "length") || !objc_msgSend(v15, "length"))
          {
            if (!objc_msgSend(v14, "length") || objc_msgSend(v15, "length"))
            {

              v9 = objc_msgSend(v5, "compareBySequenceNumberAndDateDescending:", v6);
              goto LABEL_15;
            }
            v9 = -1;
          }
          else
          {
            v9 = 1;
          }

          goto LABEL_15;
        }
        v9 = -1;
      }
      else
      {
        v9 = 1;
      }
    }
  }
LABEL_15:

  return v9;
}

- (id)_findChatWinnerInDuplicateChatArray:(id)a3 fixDisplayName:(BOOL *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (-[IMDChatRegistry _compareDuplicateChatsWithFirstChat:secondChat:](self, "_compareDuplicateChatsWithFirstChat:secondChat:", v12, v6) == -1)
        {
          objc_msgSend(v6, "displayName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "length"))
          {
            objc_msgSend(v12, "displayName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "length");

            if (!v15)
            {
              objc_msgSend(v6, "displayName");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setDisplayName:", v16);

              if (a4)
                *a4 = 1;
            }
          }
          else
          {

          }
          v17 = v12;

          v6 = v17;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)_findLosingChatGUIDsInArrayOfChats:(id)a3 withWinner:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count") - 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v9)
  {
    v10 = 0;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v13 == v6)
        {
          v10 = 1;
        }
        else
        {
          objc_msgSend(v13, "guid", (_QWORD)v21);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v9);

    if ((v10 & 1) != 0)
    {
      v16 = v7;
      goto LABEL_19;
    }
  }
  else
  {

  }
  if (IMOSLoggingEnabled(v15))
  {
    OSLogHandleForIMEventCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "description");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v18;
      v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "did not find winner %@ in list of duplicates %@", buf, 0x16u);

    }
  }
  v16 = 0;
LABEL_19:

  return v16;
}

- (id)_createGroupChatsArray
{
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMEventCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Finding group chats", buf, 2u);
    }

  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[IMDChatRegistry allChats](self, "allChats", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "style") == 43)
          objc_msgSend(v4, "addObject:", v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)_copyDuplicateChatsArrayWithLimit:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyDuplicateGroupChatsWithLimit:", a3);

  -[IMDChatRegistry _addChatsFromCacheMisses:preferExistingChats:](self, "_addChatsFromCacheMisses:preferExistingChats:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_copyGroupedDuplicateChatsSortedFromWinningToLosingWithLimit:(int64_t)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = -[IMDChatRegistry _copyDuplicateChatsArrayWithLimit:](self, "_copyDuplicateChatsArrayWithLimit:", a3);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1D1529E4C;
  v25[3] = &unk_1E922C7C8;
  v25[4] = self;
  objc_msgSend(v4, "sortedArrayUsingComparator:", v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
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
        objc_msgSend(v12, "groupID", (_QWORD)v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v12, "groupID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v16);

        }
        objc_msgSend(v12, "groupID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)_mergeDuplicateGroupsIfNeeded
{
  uint64_t v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  BOOL v44;
  id v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  char v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v45 = -[IMDChatRegistry _copyGroupedDuplicateChatsSortedFromWinningToLosingWithLimit:](self, "_copyGroupedDuplicateChatsSortedFromWinningToLosingWithLimit:", 500);
  v3 = objc_msgSend(v45, "count");
  v4 = IMOSLoggingEnabled(v3);
  if (!v3)
  {
    if (v4)
    {
      OSLogHandleForIMEventCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "No duplicate chats found to merge", buf, 2u);
      }

    }
    v8 = 0;
    goto LABEL_70;
  }
  if (v4)
  {
    OSLogHandleForIMEventCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_msgSend(v45, "count");
      objc_msgSend(v45, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v63 = v6;
      v64 = 2112;
      v65 = v7;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Found %ld duplicate chats needing merging: %@", buf, 0x16u);

    }
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v45;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
  v44 = v48 != 0;
  if (!v48)
    goto LABEL_49;
  v8 = 0;
  v47 = *(_QWORD *)v58;
  while (2)
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v58 != v47)
      {
        v10 = v9;
        objc_enumerationMutation(obj);
        v9 = v10;
      }
      v49 = v9;
      v11 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v9);
      v56 = 0;
      -[IMDChatRegistry _findChatWinnerInDuplicateChatArray:fixDisplayName:](self, "_findChatWinnerInDuplicateChatArray:fixDisplayName:", v11, &v56);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMEventCategory();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v39, OS_LOG_TYPE_INFO, "winningChat unexpectedly nil", buf, 2u);
          }

        }
        goto LABEL_69;
      }
      -[IMDChatRegistry _findLosingChatGUIDsInArrayOfChats:withWinner:](self, "_findLosingChatGUIDsInArrayOfChats:withWinner:", v11, v12);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = IMOSLoggingEnabled(v50);
      if (!v50)
      {
        if ((_DWORD)v13)
        {
          OSLogHandleForIMEventCategory();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v40, OS_LOG_TYPE_INFO, "losingChats is unexpectedly nil", buf, 2u);
          }

        }
        goto LABEL_68;
      }
      if ((_DWORD)v13)
      {
        OSLogHandleForIMEventCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v12, "description");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "description");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "description");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v63 = (uint64_t)v15;
          v64 = 2112;
          v65 = v16;
          v66 = 2112;
          v67 = v17;
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "found winning chat %@, and losing chats %@, in list of chat duplicates: %@", buf, 0x20u);

        }
      }
      if (IMOSLoggingEnabled(v13))
      {
        OSLogHandleForIMEventCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v50, "description");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "guid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v63 = (uint64_t)v19;
          v64 = 2112;
          v65 = v20;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "will merge losing chats %@ into winning chat id %@", buf, 0x16u);

        }
      }
      v21 = IMIsRunningInUnitTesting();
      if ((v21 & 1) == 0)
      {
        if (v56)
        {
          objc_msgSend(v12, "displayName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
        objc_msgSend(v12, "guid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0;
        IMDChatRecordRepairDuplicateChats();
        v24 = v55;

        if (!v24)
        {

          goto LABEL_27;
        }
        if (IMOSLoggingEnabled(v25))
        {
          OSLogHandleForIMEventCategory();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v24, "localizedDescription");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v63 = (uint64_t)v42;
            _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "repairing duplicate chats failed: %@", buf, 0xCu);

          }
        }

LABEL_68:
LABEL_69:

        goto LABEL_70;
      }
LABEL_27:
      if (IMOSLoggingEnabled(v21))
      {
        OSLogHandleForIMEventCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v50, "description");
          v27 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "guid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v63 = (uint64_t)v27;
          v64 = 2112;
          v65 = v28;
          _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "merged losing chats %@ into winning chat id %@", buf, 0x16u);

        }
      }
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v29 = v11;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v52 != v31)
              objc_enumerationMutation(v29);
            v33 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            if ((objc_msgSend(v33, "isEqual:", v12) & 1) == 0
              && IMOSLoggingEnabled(-[IMDChatRegistry removeChat:](self, "removeChat:", v33)))
            {
              OSLogHandleForIMEventCategory();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v63 = (uint64_t)v33;
                _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "Deleted unwanted chat %@", buf, 0xCu);
              }

            }
          }
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        }
        while (v30);
      }

      if (IMOSLoggingEnabled(v35))
      {
        OSLogHandleForIMEventCategory();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = objc_msgSend(v50, "count");
          *(_DWORD *)buf = 134217984;
          v63 = v37;
          _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "finished merging %ld duplicate chats", buf, 0xCu);
        }

      }
      v9 = v49 + 1;
      v8 = 1;
    }
    while (v49 + 1 != v48);
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
    if (v48)
      continue;
    break;
  }
LABEL_49:

  v8 = v44;
LABEL_70:

  return v8 & 1;
}

- (BOOL)repairDuplicateChatsIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void (*v8)(void *);
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  double v16;
  double v17;
  _BOOL8 v18;
  unsigned int v19;
  NSObject *v20;
  NSObject *v23;
  double v24;
  uint8_t buf[4];
  void *v27;
  uint8_t v28[16];
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17EA968](self, a2);
  if (self->_isLoading)
  {
    *(_OWORD *)v28 = xmmword_1E922C7E8;
    v29 = *(_OWORD *)off_1E922C7F8;
    v30 = 2649;
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = IMFileLocationTrimFileName();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E92346B0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Unexepectedly true '%@' in %s at %s:%d. %@"), CFSTR("_isLoading"), "-[IMDChatRegistry repairDuplicateChatsIfNeeded]", v5, 2649, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v8)
    {
      v8(v7);
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v7;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }

    }
  }
  v10 = *MEMORY[0x1E0D36FF8];
  IMGetCachedDomainValueForKey();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11 && (v11 = objc_msgSend((id)v11, "integerValue"), v11 > 3))
  {
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMEventCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v28 = 138412290;
        *(_QWORD *)&v28[4] = v10;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Will NOT check for duplicate chats after checking pref key %@:merged-duplicate-chats", v28, 0xCu);
      }
      goto LABEL_36;
    }
  }
  else
  {
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMEventCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v28 = 138412290;
        *(_QWORD *)&v28[4] = v10;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "will check for duplicate chats after checking pref key %@:merged-duplicate-chats", v28, 0xCu);
      }

    }
    v14 = IMSetDomainValueForKey();
    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMEventCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v28 = 138412290;
        *(_QWORD *)&v28[4] = v10;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Set pref for duplicate check (%@:merged-duplicate-chats) to YES", v28, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v17 = v16;
    v18 = -[IMDChatRegistry _mergeDuplicateGroupsIfNeeded](self, "_mergeDuplicateGroupsIfNeeded");
    if (v18)
    {
      v19 = 0;
      do
      {
        if (IMOSLoggingEnabled(v18))
        {
          OSLogHandleForIMEventCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v28 = 0;
            _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Finished repairing a batch of duplicate chats", v28, 2u);
          }

        }
        v18 = -[IMDChatRegistry _mergeDuplicateGroupsIfNeeded](self, "_mergeDuplicateGroupsIfNeeded");
      }
      while (v19++ < 9 && v18);
    }
    if (IMOSLoggingEnabled(v18))
    {
      OSLogHandleForIMEventCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        *(_DWORD *)v28 = 134217984;
        *(double *)&v28[4] = v24 - v17;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Finished repairing duplicate chats in %f seconds", v28, 0xCu);
      }
LABEL_36:

    }
  }

  objc_autoreleasePoolPop(v3);
  return 1;
}

- (void)_markGroupPhotosAsUnpurgeableIfNecessary
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((IMGetDomainBoolForKeyWithDefaultValue() & 1) == 0)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NSRecursiveLock lock](self->_chatsLock, "lock");
    -[NSMutableDictionary allValues](self->_chats, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v8), "groupPhotoGuid");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "length"))
            objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v6);
    }
    -[NSRecursiveLock unlock](self->_chatsLock, "unlock");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v3;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)IMDAttachmentRecordCopyAttachmentForGUID();
          if (v15)
          {
            v16 = (void *)IMDAttachmentRecordCopyFilename();
            if (objc_msgSend(v16, "length"))
            {
              +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "markAttachmentUnpurgeable:", v16);

            }
          }

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v12);
    }

    IMSetDomainBoolForKey();
  }
}

- (id)_allHandles
{
  __CFArray *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[IMDChatRegistry allChats](self, "allChats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v9, "participants", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              if (v3)
              {
                v15 = *(const void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
                if (v15)
                  CFArrayAppendValue(v3, v15);
              }
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)groupChatsBasedOnIdentity:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[16];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "NOT Using person centric grouped chats cache", buf, 2u);
    }

  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  v8 = v7;
  if (v7)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1D17EA968](v7);
        objc_msgSend(v11, "personCentricID", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v13);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v5, "setObject:forKey:", v14, v13);
        }
        objc_msgSend(v14, "addObject:", v11);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      v8 = v7;
    }
    while (v7);
  }

  return v5;
}

- (id)chatsToUploadToCloudKitWithLimit:(unint64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v24[4];
  id v25;
  unint64_t v26;
  SEL v27;
  uint8_t buf[4];
  uint64_t v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3528];
  v7 = (void *)MEMORY[0x1E0CB3880];
  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceNamesSupportingCapability:", *MEMORY[0x1E0D38E30]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "__im_chatPredicateForServiceNames:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3880], "__im_chatPredicateForSyncState:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[IMDChatRegistry chatStore](self, "chatStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1D152B3F8;
  v24[3] = &unk_1E922C8F0;
  v17 = v15;
  v25 = v17;
  v26 = a3;
  v27 = a2;
  objc_msgSend(v16, "enumerateBatchedChatsFilteredUsingPredicate:batchSize:block:", v14, a3, v24);

  objc_msgSend(v17, "allValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry _addChatsFromCacheMisses:preferExistingChats:](self, "_addChatsFromCacheMisses:preferExistingChats:", v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v20))
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = objc_msgSend(v19, "count");
      *(_DWORD *)buf = 134217984;
      v29 = v22;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Got %llu chats to upload", buf, 0xCu);
    }

  }
  return v19;
}

- (void)updateChatWithGUID:(id)a3 serverChangeToken:(id)a4 recordID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IMDChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setServerChangeToken:", v9);
    objc_msgSend(v12, "setCloudKitRecordID:", v10);
    objc_msgSend(v12, "storeAndBroadcastChatChanges");
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Did not find chat for GUID %@", (uint8_t *)&v14, 0xCu);
    }

  }
}

- (void)_insertChatUsingSyncData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  IMDChat *v10;

  v10 = +[IMDChat chatWithSyncData:](IMDChat, "chatWithSyncData:", a3);
  -[IMDChat guid](v10, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isMessagesIniCloudVersion2");

    if (v7)
    {
      +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "storeChat:", v10);

      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateStamp");

    }
    else
    {
      -[IMDChatRegistry addChat:](self, "addChat:", v10);
    }
  }

}

- (id)_uncachedNewestChatWithOriginalGroupID:(id)a3 onService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[IMDChatRegistry chatStore](self, "chatStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "newestChatWithOriginalGroupID:onService:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)newestExistingChatWithOriginalGroupID:(id)a3 onService:(id)a4
{
  void *v5;
  void *v6;

  -[IMDChatRegistry _uncachedNewestChatWithOriginalGroupID:onService:](self, "_uncachedNewestChatWithOriginalGroupID:onService:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry _addChatFromCacheMiss:preferExistingChat:](self, "_addChatFromCacheMiss:preferExistingChat:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_newestExistingChatWithGroupID:(id)a3 onService:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  NSObject *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v6;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Searching for the newest chat with groupID: %@ service: %@", buf, 0x16u);
    }

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v20 = v6;
  -[IMDChatRegistry existingChatsWithGroupID:](self, "existingChatsWithGroupID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "serviceName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "isEqualToString:", v7))
          goto LABEL_19;
        v16 = objc_msgSend(v14, "style") == 43;

        if (v16)
        {
          if (!v10 || (v17 = objc_msgSend(v14, "isNewerThan:", v10), (_DWORD)v17))
          {
            if (IMOSLoggingEnabled(v17))
            {
              OSLogHandleForIMFoundationCategory();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v27 = v14;
                _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Found newer chat match for groupID: %@", buf, 0xCu);
              }

            }
            v15 = v10;
            v10 = v14;
LABEL_19:

            continue;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  return v10;
}

- (id)_existingChatForSyncData:(id)a3 originalGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  int v27;
  id v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "numberForKey:", CFSTR("stl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (!v7 && v9 != 45)
  {
    objc_msgSend(v6, "stringForKey:", CFSTR("ogid"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringForKey:", CFSTR("svc"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v27 = 138412546;
        v28 = v10;
        v29 = 2112;
        v30 = (unint64_t)v11;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Looking for chat for CKRecord with originalGroupID: %@ service: %@", (uint8_t *)&v27, 0x16u);
      }

    }
    if (v10 && objc_msgSend(v10, "length"))
    {
      -[IMDChatRegistry _uncachedNewestChatWithOriginalGroupID:onService:](self, "_uncachedNewestChatWithOriginalGroupID:onService:", v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v6, "stringForKey:", CFSTR("gid"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v13 && v17)
    {
      v19 = objc_msgSend(v17, "length");
      if (!v19)
      {
        v13 = 0;
        if (v10)
        {
LABEL_31:
          if (!v13)
          {
            v22 = objc_msgSend(v10, "length");
            if (v22)
            {
              if (IMOSLoggingEnabled(v22))
              {
                OSLogHandleForIMFoundationCategory();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  v27 = 138412290;
                  v28 = v10;
                  _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Failed to find group chat with current group ID, trying with originalGroupID (%@) as groupID", (uint8_t *)&v27, 0xCu);
                }

              }
              -[IMDChatRegistry _newestExistingChatWithGroupID:onService:](self, "_newestExistingChatWithGroupID:onService:", v10, v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v13 = 0;
            }
          }
        }
LABEL_41:

        goto LABEL_42;
      }
      if (IMOSLoggingEnabled(v19))
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = -[IMDChatRegistry cachedChatCount](self, "cachedChatCount");
          v27 = 138412802;
          v28 = v10;
          v29 = 2048;
          v30 = v21;
          v31 = 2112;
          v32 = v18;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Failed to find group chat with originalGroupID as regular groupID (%@) in %llu chats, trying with client groupID (%@)", (uint8_t *)&v27, 0x20u);
        }

      }
      -[IMDChatRegistry _newestExistingChatWithGroupID:onService:](self, "_newestExistingChatWithGroupID:onService:", v18, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v10)
      goto LABEL_31;
    goto LABEL_41;
  }
  if (v7)
  {
    v10 = v7;
    v14 = IMOSLoggingEnabled(v10);
    if ((_DWORD)v14)
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v27 = 138412546;
        v28 = v10;
        v29 = 2112;
        v30 = (unint64_t)v6;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "We specified originalGUID %@ for sync data %@", (uint8_t *)&v27, 0x16u);
      }

    }
  }
  else
  {
    objc_msgSend(v6, "stringForKey:", CFSTR("guid"));
    v14 = objc_claimAutoreleasedReturnValue();
    v10 = (id)v14;
  }
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v27 = 138412290;
      v28 = v10;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Looking for chat for CKRecord with GUID: %@", (uint8_t *)&v27, 0xCu);
    }

  }
  -[IMDChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_42:

  if (IMOSLoggingEnabled(v24))
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v27 = 138412290;
      v28 = v13;
      _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Found existing chat for CKRecord: %@", (uint8_t *)&v27, 0xCu);
    }

  }
  return v13;
}

- (BOOL)_ensureNoExistingGroupForSyncData:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  _BYTE v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "numberForKey:", CFSTR("stl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "stringForKey:", CFSTR("gid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", CFSTR("ogid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", CFSTR("svc"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v6 == 45 || v8 == 0 || v9 == 0)
  {
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v25 = 67109634;
        *(_DWORD *)v26 = v6;
        *(_WORD *)&v26[4] = 2112;
        *(_QWORD *)&v26[6] = v8;
        *(_WORD *)&v26[14] = 2112;
        *(_QWORD *)&v26[16] = v10;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Won't _ensureNoExistingGroupForCKRecord style:%hhu, originalGroupID:%@ service:%@", (uint8_t *)&v25, 0x1Cu);
      }

    }
    v14 = 1;
  }
  else
  {
    -[IMDChatRegistry chatStore](self, "chatStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "newestChatWithOriginalGroupID:onService:", v8, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      goto LABEL_32;
    if (IMOSLoggingEnabled(v17))
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v25 = 138412546;
        *(_QWORD *)v26 = v8;
        *(_WORD *)&v26[8] = 2112;
        *(_QWORD *)&v26[10] = v7;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "No existing chat with originalGroupID (%@) found, checking client groupID (%@)", (uint8_t *)&v25, 0x16u);
      }

    }
    -[IMDChatRegistry chatStore](self, "chatStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "newestChatWithGroupID:onService:", v7, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
LABEL_32:
      if (IMOSLoggingEnabled(v17))
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v25 = 138412546;
          *(_QWORD *)v26 = v8;
          *(_WORD *)&v26[8] = 2112;
          *(_QWORD *)&v26[10] = v16;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "IMDChatRegistry: Found an existing chat that's not in the registry. This is likely because the registry failed it's chat load. OriginalGroupID:%@ Chat:%@", (uint8_t *)&v25, 0x16u);
        }

      }
      if (!-[IMDChatRegistry hasDumpedLogsForNoExisitingGroup](self, "hasDumpedLogsForNoExisitingGroup"))
      {
        -[IMDChatRegistry ckUtilities](self, "ckUtilities");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logCollectorAddress");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[IMDChatRegistry ckUtilities](self, "ckUtilities");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "reportMOCDebuggingErrorWithString:internalOnly:initialSync:sendToHandle:reasonString:", CFSTR("TriedToInsertDuplicateChat"), 1, 0, v22, CFSTR("TriedToInsertDuplicateChat"));

        -[IMDChatRegistry setHasDumpedLogsForNoExisitingGroup:](self, "setHasDumpedLogsForNoExisitingGroup:", 1);
      }
      v14 = 0;
    }
    else
    {
      v14 = 1;
    }

  }
  return v14;
}

- (void)_markForksAsSyncedForChat:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  IMDChatRegistry *v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "style") == 43)
  {
    v31 = self;
    objc_msgSend(v4, "serviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalGroupID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChatRegistry existingChatsWithGroupID:](v31, "existingChatsWithGroupID:", v30);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v39 != v7)
            objc_enumerationMutation(obj);
          v9 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v9, "serviceName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v5);
          if (v9 == v4)
            v12 = 0;
          else
            v12 = v11;

          if (v12)
          {
            v14 = IMOSLoggingEnabled(v13);
            if ((_DWORD)v14)
            {
              OSLogHandleForIMFoundationCategory();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v44 = v4;
                _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Found groupd_id fork for chat while applying changes from cloudKit %@", buf, 0xCu);
              }

            }
            if (IMOSLoggingEnabled(v14))
            {
              OSLogHandleForIMFoundationCategory();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v44 = v9;
                _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Marking fork as clean %@", buf, 0xCu);
              }

            }
            objc_msgSend(v9, "updateCloudKitSyncState:", 1);
          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      }
      while (v6);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[IMDChatRegistry allChats](v31, "allChats");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v17);
          v21 = *(id *)(*((_QWORD *)&v34 + 1) + 8 * j);
          if (objc_msgSend(v21, "style") == 43)
          {
            objc_msgSend(v21, "originalGroupID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v22, "isEqualToString:", v32) & 1) != 0)
            {
              objc_msgSend(v21, "serviceName");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "isEqualToString:", v5);
              if (v21 == v4)
                v25 = 0;
              else
                v25 = v24;

              if (v25)
              {
                v27 = IMOSLoggingEnabled(v26);
                if ((_DWORD)v27)
                {
                  OSLogHandleForIMFoundationCategory();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v44 = v4;
                    _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Found original_groupd_id fork for chat while applying changes from cloudKit %@", buf, 0xCu);
                  }

                }
                if (IMOSLoggingEnabled(v27))
                {
                  OSLogHandleForIMFoundationCategory();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v44 = v21;
                    _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Marking fork as clean %@", buf, 0xCu);
                  }

                }
                objc_msgSend(v21, "updateCloudKitSyncState:", 1);
              }
            }
            else
            {

            }
          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v18);
    }

  }
}

- (void)_updateChat:(id)a3 usingSyncData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "guid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Chat already exists: %@ to apply changes from CKRecord", (uint8_t *)&v10, 0xCu);

    }
  }
  objc_msgSend(v6, "applyChangesUsingSyncData:", v7);
  -[IMDChatRegistry _markForksAsSyncedForChat:](self, "_markForksAsSyncedForChat:", v6);

}

- (void)updateChatUsingSyncData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _BOOL8 v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("guid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry _existingChatForSyncData:originalGUID:](self, "_existingChatForSyncData:originalGUID:", v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 138412546;
        v12 = v5;
        v13 = 2112;
        v14 = v4;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Updating existing chat %@ with record %@", (uint8_t *)&v11, 0x16u);
      }

    }
    -[IMDChatRegistry _updateChat:usingSyncData:](self, "_updateChat:usingSyncData:", v7, v4);
  }
  else
  {
    v9 = -[IMDChatRegistry _ensureNoExistingGroupForSyncData:](self, "_ensureNoExistingGroupForSyncData:", v4);
    if (v9)
    {
      if (IMOSLoggingEnabled(v9))
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = 138412546;
          v12 = v5;
          v13 = 2112;
          v14 = v4;
          _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Creating new chat %@ with record %@", (uint8_t *)&v11, 0x16u);
        }

      }
      -[IMDChatRegistry _insertChatUsingSyncData:](self, "_insertChatUsingSyncData:", v4);
    }
  }

}

- (void)resolveChatConflictUsingSyncData:(id)a3 localGUID:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[IMDChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry _updateChat:usingSyncData:](self, "_updateChat:usingSyncData:", v7, v6);

}

- (void)updateCachedChatsSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[IMDChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
          objc_msgSend(v11, "setCloudKitSyncState:", a3);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)markChatAsDeferredForSyncingUsingSyncData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDChatRegistry _existingChatForSyncData:originalGUID:](self, "_existingChatForSyncData:originalGUID:", v4, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v6;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Marking existing chat %@ as deferred", (uint8_t *)&v8, 0xCu);
      }

    }
    objc_msgSend(v6, "updateCloudKitSyncState:", 2);
    objc_msgSend(v6, "updateServerChangeToken:", 0);
    objc_msgSend(v6, "updateCloudKitRecordID:", 0);
    -[IMDChatRegistry _markForksAsSyncedForChat:](self, "_markForksAsSyncedForChat:", v6);
  }

}

- (void)markDeferredChatsAsNeedingSync
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), *MEMORY[0x1E0D37758], 2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry chatStore](self, "chatStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateBatchedChatsFilteredUsingPredicate:block:", v4, &unk_1E922C930);

}

- (void)__addChatToGroupIDChatIndex:(id)a3
{
  id v4;
  NSMutableDictionary *chatsByGroupID;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v4 = a3;
  chatsByGroupID = self->_chatsByGroupID;
  v10 = v4;
  objc_msgSend(v4, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](chatsByGroupID, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v8 = self->_chatsByGroupID;
    objc_msgSend(v10, "groupID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v7, v9);

  }
  objc_msgSend(v7, "addObject:", v10);

}

- (void)__removeChatFromGroupIDChatIndex:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableDictionary *chatsByGroupID;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    chatsByGroupID = self->_chatsByGroupID;
    objc_msgSend(v4, "groupID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](chatsByGroupID, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "removeObject:", v4);
    if (!objc_msgSend(v10, "count"))
    {
      v11 = self->_chatsByGroupID;
      objc_msgSend(v4, "groupID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", v12);

    }
  }
  else if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Trying to remove chat with nil groupID: %@", (uint8_t *)&v14, 0xCu);
    }

  }
}

- (id)messagesToUploadToCloudKitWithLimit:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "messagesThatNeedSyncWithCloudKitWithFilter:limit:", 0, a3);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "guid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "chatForMessageGUID:enableVerboseLogging:", v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "cloudKitChatID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setParentChatID:", v15);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)messagesPendingUpdateT1ToCloudKitWithLimit:(unint64_t)a3
{
  void *v4;
  void *v5;

  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "messagesPendingUpdateT1ToCloudKitWithLimit:", a3);

  return v5;
}

- (id)messagesPendingUpdateT2ToCloudKitWithLimit:(unint64_t)a3
{
  void *v4;
  void *v5;

  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "messagesPendingUpdateT2ToCloudKitWithLimit:", a3);

  return v5;
}

- (id)_lookupChatUsingParentChatID:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  -[IMDChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[IMDChatRegistry _uncachedNewestChatWithOriginalGroupID:onService:](self, "_uncachedNewestChatWithOriginalGroupID:onService:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[IMDChatRegistry _newestExistingChatWithGroupID:onService:](self, "_newestExistingChatWithGroupID:onService:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (id)_itemFromCKRecord:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](MEMORY[0x1E0D398B8], sel_createItemWithCKRecord_);
}

- (id)_parentChatIDFromCKRecord:(id)a3
{
  return (id)objc_msgSend(a3, "_stringForKey:", CFSTR("chatID"));
}

- (void)_addItemToParentChatIfNotLocationItem:(id)a3 parentChat:(id)a4 updatedLastMessageCount:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t isKindOfClass;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "addLocationShareItemToMatchingChats:", v8);
  }
  else if (v9)
  {
    -[IMDChatRegistry addItem:toChat:](self, "addItem:toChat:", v8, v9);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (a5)
        -[IMDChatRegistry updateLastMessageForChat:hintMessage:historyQuery:](self, "updateLastMessageForChat:hintMessage:historyQuery:", v9, v8, 0);
      else
        -[IMDChatRegistry updateLastMessageForChat:hintMessage:](self, "updateLastMessageForChat:hintMessage:", v9, v8);
    }
  }
  else if (IMOSLoggingEnabled(isKindOfClass))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "guid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "No chat record found when adding message item %@, this may NOT be visible to the user!", (uint8_t *)&v13, 0xCu);

    }
  }

}

- (void)_setSortIDOnIncomingMessage:(id)a3 forChat:(id)a4
{
  id v5;
  id v6;
  IMDMessageSortOrderAssigner *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMSharedHelperSortUsingReplyToGUIDAlgorithm())
  {
    v7 = objc_alloc_init(IMDMessageSortOrderAssigner);
    if (IMOSLoggingEnabled(-[IMDMessageSortOrderAssigner assignSortIDToIncomingMessage:onChat:](v7, "assignSortIDToIncomingMessage:onChat:", v5, v6)))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "sortID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "guid");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412802;
        v13 = v9;
        v14 = 2112;
        v15 = v10;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Setting sort id %@ for message %@ on chat %@ synced from CloudKit", (uint8_t *)&v12, 0x20u);

      }
    }

  }
}

- (void)processMessageUsingCKRecord:(id)a3
{
  -[IMDChatRegistry processMessageUsingCKRecord:updatedLastMessageCount:](self, "processMessageUsingCKRecord:updatedLastMessageCount:", a3, 0xFFFFFFFFLL);
}

- (BOOL)_existingItemRequiresUpgrade:(id)a3 itemFromCKRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "messageSyncP2Enabled");

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v5;
    else
      v9 = 0;
    v10 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v6;
    else
      v11 = 0;
    v12 = v11;
    v13 = v12;
    if (v10)
      v14 = v12 == 0;
    else
      v14 = 1;
    if (v14)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v10, "threadIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
      {
        objc_msgSend(v13, "threadIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v18 == 0;

      }
      else
      {
        v15 = 0;
      }

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_adoptUpdatedStateForExistingItem:(id)a3 itemFromCKRecord:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "messageSyncP2Enabled");

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v16;
    else
      v8 = 0;
    v9 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v5;
    else
      v10 = 0;
    v11 = v10;
    v12 = v11;
    if (v9)
      v13 = v11 == 0;
    else
      v13 = 1;
    if (!v13)
    {
      objc_msgSend(v9, "threadIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_msgSend(v12, "threadIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setThreadIdentifier:", v15);

      }
    }

  }
}

- (void)processMessageUsingCKRecord:(id)a3 updatedLastMessageCount:(int)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  int v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  const __CFString *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17EA968]();
  v8 = -[IMDChatRegistry _itemFromCKRecord:](self, "_itemFromCKRecord:", v6);
  v9 = objc_msgSend(v8, "isCompatibleWithMiC");
  if ((v9 & 1) != 0)
  {
    -[IMDChatRegistry _sharedMessageStore](self, "_sharedMessageStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "hasStoredMessageWithGUID:", v11);

    -[IMDChatRegistry _parentChatIDFromCKRecord:](self, "_parentChatIDFromCKRecord:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_stringForKey:", CFSTR("svc"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChatRegistry _lookupChatUsingParentChatID:service:](self, "_lookupChatUsingParentChatID:service:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[IMDChatRegistry _sharedMessageStore](self, "_sharedMessageStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "guid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "itemWithGUID:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = -[IMDChatRegistry _existingItemRequiresUpgrade:itemFromCKRecord:](self, "_existingItemRequiresUpgrade:itemFromCKRecord:", v18, v8) ^ 1;
      -[IMDChatRegistry _adoptUpdatedStateForExistingItem:itemFromCKRecord:](self, "_adoptUpdatedStateForExistingItem:itemFromCKRecord:", v18, v8);
      objc_msgSend(v18, "setCloudKitSyncState:", v19);
      objc_msgSend(v6, "recordID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "recordName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCloudKitRecordID:", v21);

      objc_msgSend(v6, "recordChangeTag");
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCloudKitRecordChangeTag:", v22);

      objc_msgSend(v18, "setCloudKitServerChangeTokenBlob:", 0);
      objc_opt_class();
      LOBYTE(v22) = objc_opt_isKindOfClass();
      -[IMDChatRegistry _sharedMessageStore](self, "_sharedMessageStore");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if ((v22 & 1) != 0)
      {
        LOBYTE(v52) = 0;
        v25 = (id)objc_msgSend(v23, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:", v18, 0, 0, 0, 0x2000, 0, v52);
      }
      else
      {
        v36 = (id)objc_msgSend(v23, "storeItem:forceReplace:", v18, 0);
      }

LABEL_38:
      goto LABEL_39;
    }
    v29 = objc_msgSend(v8, "shouldStoreMessage");
    if (!(_DWORD)v29)
      goto LABEL_19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v15)
    {
      v30 = v8;
      +[IMDBackwardCompatibilityMessageIdentifier sharedIdentifier](IMDBackwardCompatibilityMessageIdentifier, "sharedIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isIgnorableBackwardCompatibilityMessage:inChat:", v30, v15);
      if ((_DWORD)v32)
      {
        if (IMOSLoggingEnabled(v32))
        {
          OSLogHandleForIMFoundationCategory();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v30, "guid");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v56 = v34;
            _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "Message %@ is an ignorable backward compatibility message, ignoring.", buf, 0xCu);

          }
        }

LABEL_19:
        v35 = 0;
LABEL_32:
        if (IMOSLoggingEnabled(v29))
        {
          OSLogHandleForIMFoundationCategory();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v8, "guid");
            v48 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "cloudKitSyncState"));
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = (void *)v49;
            v51 = CFSTR("NO");
            *(_DWORD *)buf = 138412802;
            v56 = v48;
            v57 = 2112;
            if (v35)
              v51 = CFSTR("YES");
            v58 = v49;
            v59 = 2112;
            v60 = v51;
            _os_log_impl(&dword_1D1413000, v47, OS_LOG_TYPE_INFO, "Updated msg %@ to have CKSyncState %@ stored message: %@", buf, 0x20u);

          }
        }
        goto LABEL_38;
      }

    }
    -[IMDChatRegistry _setSortIDOnIncomingMessage:forChat:](self, "_setSortIDOnIncomingMessage:forChat:", v8, v15);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "setFlags:", objc_msgSend(v8, "flags") | 0x2000);
      -[IMDChatRegistry _sharedMessageStore](self, "_sharedMessageStore");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v52) = 0;
      v38 = (id)objc_msgSend(v37, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:", v8, 0, 0, 0, 0x2000, 0, v52);

      objc_msgSend(v8, "guid");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = sub_1D152E1D0;
      v53[3] = &unk_1E922C958;
      v54 = v39;
      v40 = v39;
      objc_msgSend(v8, "enumerateAttachmentGUIDsWithBlock:", v53);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = v8;
        objc_msgSend(v41, "timeRead");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v42)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setTimeRead:", v43);

        }
        -[IMDChatRegistry _sharedMessageStore](self, "_sharedMessageStore");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (id)objc_msgSend(v44, "storeItem:forceReplace:", v41, 0);

      }
      else
      {
        -[IMDChatRegistry _sharedMessageStore](self, "_sharedMessageStore");
        v41 = (id)objc_claimAutoreleasedReturnValue();
        v46 = (id)objc_msgSend(v41, "storeItem:forceReplace:", v8, 0);
      }

    }
    v29 = -[IMDChatRegistry _addItemToParentChatIfNotLocationItem:parentChat:updatedLastMessageCount:](self, "_addItemToParentChatIfNotLocationItem:parentChat:updatedLastMessageCount:", v8, v15, a4);
    v35 = 1;
    goto LABEL_32;
  }
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v8;
      _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Found item that is incompatible with the current device version: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v8, "guid");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cloudKitRecordID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  IMDMessageRecordAddGUIDAndCKRecordIDToDeleteFromCloudKit();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:", CFSTR("__kCKRecordIMMessageIncompatibleDeleteNotification"), 0);
LABEL_39:

  objc_autoreleasePoolPop(v7);
}

- (BOOL)handleMessageUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *ThreadIdentifierWithComponents;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t isKindOfClass;
  void *v17;
  BOOL v18;
  void *v19;
  char v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  NSObject *v36;
  BOOL v37;
  NSObject *v38;
  void *v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v44;
  id v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_stringForKey:", CFSTR("ut"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_dataForKey:", CFSTR("up"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("UT1")))
  {
    objc_msgSend(MEMORY[0x1E0D398B8], "protobufForUpdateT1:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "msgid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "threadGuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "threadPart");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ThreadIdentifierWithComponents = (void *)IMMessageCreateThreadIdentifierWithComponents();
    v12 = IMOSLoggingEnabled(ThreadIdentifierWithComponents);
    if ((_DWORD)v12)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v48 = v8;
        v49 = 2112;
        v50 = ThreadIdentifierWithComponents;
        v51 = 2112;
        v52 = v9;
        v53 = 2112;
        v54 = v10;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "UpdateSyncT1 relating msgID %@ to thread %@ (threadGuid %@ threadPart %@)", buf, 0x2Au);
      }

    }
    if (!v7
      || (v12 = objc_msgSend(v8, "length")) == 0
      || (v12 = objc_msgSend(ThreadIdentifierWithComponents, "length")) == 0)
    {
      if (IMOSLoggingEnabled(v12))
      {
        OSLogHandleForIMFoundationCategory();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v7;
          _os_log_impl(&dword_1D1413000, v42, OS_LOG_TYPE_INFO, "Ignoring update message T1: no message ID or thread ID %@", buf, 0xCu);
        }

      }
      goto LABEL_56;
    }
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemWithGUID:", v8);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        v45 = v46;
        objc_msgSend(v45, "threadIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "length") == 0;

        if (v18)
        {
          objc_msgSend(v45, "setThreadIdentifier:", ThreadIdentifierWithComponents);
        }
        else
        {
          objc_msgSend(v45, "threadIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(ThreadIdentifierWithComponents, "isEqualToString:", v19);

          if ((v20 & 1) == 0 && IMOSLoggingEnabled(v21))
          {
            OSLogHandleForIMFoundationCategory();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v45, "threadIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v48 = v23;
              v49 = 2112;
              v50 = ThreadIdentifierWithComponents;
              _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "ThreadIdentifier update rejected, thread identifier already populated as %@, update would be %@", buf, 0x16u);

            }
          }
        }
        if (objc_msgSend(v45, "cloudKitSyncState") == 8)
          objc_msgSend(v45, "setCloudKitSyncState:", 1);
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v44) = 0;
        v40 = (id)objc_msgSend(v39, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:", v45, 0, 0, 0, 0x2000, 0, v44);

        goto LABEL_45;
      }
      if (IMOSLoggingEnabled(isKindOfClass))
      {
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "Update record for non-message type, ignoring", buf, 2u);
        }
LABEL_36:

      }
    }
    else if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v8;
        _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "Ignoring update T1 message: message not found for id %@ (it may have been deleted)", buf, 0xCu);
      }
      goto LABEL_36;
    }
LABEL_45:

LABEL_56:
LABEL_57:
    v37 = 1;
    goto LABEL_58;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("UT2")))
  {
    objc_msgSend(MEMORY[0x1E0D398B8], "protobufForUpdateT2:", v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "msgid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sr");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 && objc_msgSend(v25, "length"))
      -[IMDChatRegistry updateSyncedSyndicationRanges:forGUID:](self, "updateSyncedSyndicationRanges:forGUID:", v26, v25);

    goto LABEL_57;
  }
  v27 = objc_msgSend(v5, "isEqualToString:", CFSTR("UT3"));
  if ((_DWORD)v27)
  {
    objc_msgSend(MEMORY[0x1E0D398B8], "protobufForUpdateT3:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "msgid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "chatid");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28 && objc_msgSend(v29, "length") && objc_msgSend(v30, "length"))
    {
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "itemWithGUID:", v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        +[IMDaemonCoreBridgeImpl addItem:toParentChatID:updatedLastMessageCount:](IMDaemonCoreBridgeImpl, "addItem:toParentChatID:updatedLastMessageCount:", v32, v30, -1);
        objc_msgSend(v32, "setCloudKitSyncState:", 1);
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (id)objc_msgSend(v34, "storeItem:forceReplace:", v32, 0);

      }
      else if (IMOSLoggingEnabled(v33))
      {
        OSLogHandleForIMFoundationCategory();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v29;
          _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "Ignoring update T3 message: message not found for guid %@ (it may have been deleted)", buf, 0xCu);
        }

      }
    }

    goto LABEL_57;
  }
  if (IMOSLoggingEnabled(v27))
  {
    OSLogHandleForIMFoundationCategory();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v5;
      _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "Ignoring message update %@, unrecognized update type", buf, 0xCu);
    }

  }
  v37 = 0;
LABEL_58:

  return v37;
}

- (void)handleMessageUpdateConflictType:(id)a3 serverRecord:(id)a4 localRowID:(int64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("UT1")))
  {
    if (a5)
      goto LABEL_8;
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("UT2")))
  {
    -[IMDChatRegistry handleMessageUpdate:](self, "handleMessageUpdate:", v9);
  }
  else
  {
    v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("UT3"));
    if ((_DWORD)v10)
    {
      if (a5)
      {
LABEL_8:
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "markMessageAsCleanWithROWID:", a5);

      }
    }
    else if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = 138412546;
        v14 = v8;
        v15 = 2048;
        v16 = a5;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Failed to handle conflict for unknown update type %@, rowID %lu", (uint8_t *)&v13, 0x16u);
      }

    }
  }

}

- (BOOL)updateSyncedSyndicationRanges:(id)a3 forGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t isKindOfClass;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  NSObject *v21;
  BOOL v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMDChatRegistry _sharedMessageStore](self, "_sharedMessageStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemWithGUID:", v7);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v7;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Can't apply updated syndication ranges for %@, message not found!", buf, 0xCu);
      }
      goto LABEL_16;
    }
LABEL_17:
    v22 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    if (IMOSLoggingEnabled(isKindOfClass))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v31 = v7;
        v32 = 2112;
        v33 = v9;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Can't apply updated syndication ranges for %@, invalid message type for item %@", buf, 0x16u);
      }
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v12 = v9;
  objc_msgSend(MEMORY[0x1E0D39948], "rangesFromSerializedString:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39948], "maxStartDateForRanges:", v13);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D39948];
  -[__CFString syndicationRanges](v12, "syndicationRanges");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "maxStartDateForRanges:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString syndicationRanges](v12, "syndicationRanges");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_19;
  -[__CFString syndicationRanges](v12, "syndicationRanges");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "count") || !v16 || !v29)
  {

    goto LABEL_19;
  }
  v19 = objc_msgSend(v16, "compare:", v29);

  if (v19 == -1)
  {
LABEL_19:
    -[__CFString setSyndicationRanges:](v12, "setSyndicationRanges:", v13);
    v20 = CFSTR("YES");
    goto LABEL_20;
  }
  v20 = CFSTR("NO");
LABEL_20:
  -[__CFString setSyncedSyndicationRanges:](v12, "setSyncedSyndicationRanges:", v13);
  -[IMDChatRegistry _sharedMessageStore](self, "_sharedMessageStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v28) = 256;
  v24 = (id)objc_msgSend(v23, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v12, 0, 0, 0, 0, 0, v28);

  if (IMOSLoggingEnabled(v25))
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v7;
      v32 = 2112;
      v33 = v20;
      _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Applied updated syndicationRanges to %@, was newer data? %@)", buf, 0x16u);
    }

  }
  v22 = 1;
LABEL_25:

  return v22;
}

- (id)copyRecordIDsAndGUIDsPendingCloudKitDelete
{
  return (id)IMDChatCopyChatRecordIDsAndGUIDsToDeleteWithLimit();
}

- (void)clearPendingDeleteTable
{
  NSObject *v2;
  uint8_t v3[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D1413000, v2, OS_LOG_TYPE_INFO, "Clearing pending chat delete table", v3, 2u);
    }

  }
  IMDChatClearPendingDeleteChatsTable();
}

- (BOOL)doneLoadingAfterMerge
{
  return self->_doneLoadingAfterMerge;
}

- (BOOL)isBeingSetup
{
  return self->_isLoading;
}

- (id)_existingiMessageChatForChatIdentifier:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMDChatRegistry allExistingChatsWithIdentifier:style:](self, "allExistingChatsWithIdentifier:style:", v6, v4);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v25;
    v10 = (_QWORD *)MEMORY[0x1E0D38F68];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v12, "serviceName", (_QWORD)v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", *v10);

        if (v14)
        {
          if (IMOSLoggingEnabled(v15))
          {
            OSLogHandleForIMFoundationCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v12, "guid");
              v21 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v29 = v21;
              v30 = 2112;
              v31 = v6;
              v32 = 2112;
              v33 = v22;
              _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Found iMessage chat %@ for chatID %@ style %@", buf, 0x20u);

            }
          }
          v19 = v12;

          goto LABEL_19;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      if (v8)
        continue;
      break;
    }
  }

  if (IMOSLoggingEnabled(v16))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v6;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Did not find iMessage chat for ID %@ and style %@", buf, 0x16u);

    }
  }
  v19 = 0;
LABEL_19:

  return v19;
}

- (void)simulateMessageReceive:(id)a3 serviceName:(id)a4 groupID:(id)a5 handles:(id)a6 sender:(id)a7 date:(id)a8 associatedMessageType:(int64_t)a9 associatedMessageGuid:(id)a10
{
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  BOOL v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  unsigned int v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  id obj;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  uint8_t v83[128];
  uint8_t buf[4];
  id v85;
  __int16 v86;
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v16 = a4;
  v69 = a5;
  v17 = a6;
  v68 = a7;
  v70 = a8;
  v18 = a10;
  v72 = v17;
  v19 = objc_msgSend(v17, "count");
  v71 = v16;
  if (v19)
  {
    v19 = objc_msgSend(v16, "length");
    if (v19)
    {
      +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "anySessionForServiceName:", v16);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v66)
      {
        if (IMOSLoggingEnabled(v21))
        {
          OSLogHandleForIMFoundationCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v85 = v16;
            _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "No session for serviceName %@ -- can't simulate receive", buf, 0xCu);
          }

        }
        goto LABEL_53;
      }
      v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v67);
      if (a9 <= 0)
      {
        v28 = objc_alloc(MEMORY[0x1E0D39918]);
        v29 = v70;
        v23 = v70;
        if (!v70)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 0;
        }
        v30 = v29 == 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (void *)objc_msgSend(v28, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:threadIdentifier:", v68, v23, v63, 0, 0, 1, 0, v31, 0);

        if (!v30)
          goto LABEL_24;
      }
      else
      {
        v22 = objc_alloc(MEMORY[0x1E0D396C8]);
        v23 = v70;
        if (!v70)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        if (v18)
        {
          v65 = (void *)objc_msgSend(v22, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:", v68, v23, v63, 0, 0, 1, 0, v24, v18, a9, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = (void *)objc_msgSend(v22, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:", v68, v23, v63, 0, 0, 1, 0, v25, v32, a9, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0);

        }
        if (v70)
          goto LABEL_24;
      }

LABEL_24:
      if ((unint64_t)objc_msgSend(v17, "count") <= 1)
        v33 = 45;
      else
        v33 = 43;
      v64 = v33;
      objc_msgSend(v66, "service");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChatRegistry existingChatsForIDs:onService:style:](self, "existingChatsForIDs:onService:style:", v17, v62, v64);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChatRegistry existingChatsWithGroupID:](self, "existingChatsWithGroupID:", v69);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "arrayByAddingObjectsFromArray:", v35);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v61, "count"))
      {
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v36 = v61;
        v37 = 0;
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
        if (v38)
        {
          v39 = *(_QWORD *)v79;
          do
          {
            for (i = 0; i != v38; ++i)
            {
              if (*(_QWORD *)v79 != v39)
                objc_enumerationMutation(v36);
              v41 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
              if (objc_msgSend(v41, "lastMessageTimeStampOnLoad"))
              {
                v42 = v41;

                v37 = v42;
              }
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
          }
          while (v38);
        }

        objc_msgSend(v37, "chatIdentifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if ((unint64_t)objc_msgSend(v17, "count") < 2)
        {
          v53 = (void *)MEMORY[0x1E0C99D80];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "dictionaryWithObjectsAndKeys:", v54, *MEMORY[0x1E0D36C20], 0, *MEMORY[0x1E0D36D90], 0);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v37, "addObject:", v55);
          objc_msgSend(v17, "firstObject");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          obj = v17;
          v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
          if (v44)
          {
            v45 = *(_QWORD *)v75;
            v46 = *MEMORY[0x1E0D36C20];
            v47 = *MEMORY[0x1E0D36D90];
            do
            {
              for (j = 0; j != v44; ++j)
              {
                if (*(_QWORD *)v75 != v45)
                  objc_enumerationMutation(obj);
                v49 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j);
                v50 = (void *)MEMORY[0x1E0C99D80];
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "dictionaryWithObjectsAndKeys:", v51, v46, v49, v47, 0);
                v52 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v37, "addObject:", v52);
              }
              v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
            }
            while (v44);
          }

          objc_msgSend(MEMORY[0x1E0CB3940], "generatedRoomNameForGroupChat");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v56 = v69;
        v57 = v69;
        if (!v69)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = 0;
        }
        v58 = v56 == 0;
        objc_msgSend(v66, "account");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v60) = 0;
        objc_msgSend(v66, "didJoinChat:style:displayName:groupID:handleInfo:account:isBlackholed:", v43, v64, 0, v57, v37, v59, v60);

        if (v58)
      }

      objc_msgSend(v65, "setRoomName:", v43);
      objc_msgSend(v66, "didReceiveMessage:forChat:style:fromIDSID:", v65, v43, v64, 0);

LABEL_53:
      goto LABEL_54;
    }
  }
  if (IMOSLoggingEnabled(v19))
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v85 = v17;
      v86 = 2112;
      v87 = v16;
      _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "No handles or servicename to receive a message from: {handles: %@ serviceName: %@}", buf, 0x16u);
    }

  }
LABEL_54:

}

- (void)invalidatePersonCentricGroupedChatsCache
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Invalidating person centric grouped chats cache", v5, 2u);
    }

  }
  -[IMDChatRegistry personCentricGroupedChatsCache](self, "personCentricGroupedChatsCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (BOOL)_contactsBasedMerginEnabled
{
  if (qword_1ED936008 != -1)
    dispatch_once(&qword_1ED936008, &unk_1E922C978);
  return byte_1ED936001;
}

- (void)_updateCachedAliasToCNIDMap:(id)a3 withHistoryToken:(id)a4 completionHandler:(id)a5
{
  IMDCNRecordIDAndHistoryTokenForAliasesWithCompletionHandler();
}

- (id)_aliasToCNIDMapForAliases:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((IMIsRunningInUnitTesting() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    IMDCNRecordIDAndHistoryTokenForAliases();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D36160]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChatRegistry setHistoryToken:](self, "setHistoryToken:", v7);
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D36158]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)setHistoryToken:(id)a3
{
  id v5;
  NSData **p_historyToken;
  NSData *historyToken;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    historyToken = self->_historyToken;
    p_historyToken = &self->_historyToken;
    if (!-[NSData isEqualToData:](historyToken, "isEqualToData:", v5))
    {
      objc_storeStrong((id *)p_historyToken, a3);
      if (IMOSLoggingEnabled(v8))
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v10) = 0;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "ContactStore history token updated.", (uint8_t *)&v10, 2u);
        }
LABEL_10:

      }
    }
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = 0;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Not updating the ContactStore history token with %@", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_10;
  }

}

- (void)_updateCurrentAliasToCNIDDictionaryAndHistoryTokenWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IMDChatRegistry aliasToCNIDMap](self, "aliasToCNIDMap");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)-[NSData copy](self->_historyToken, "copy");
  -[IMDChatRegistry _updateCachedAliasToCNIDMap:withHistoryToken:completionHandler:](self, "_updateCachedAliasToCNIDMap:withHistoryToken:completionHandler:", v6, v5, v4);

}

- (id)_generateCurrentAliasToCNIDDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NSRecursiveLock lock](self->_handlesLock, "lock");
  -[IMDChatRegistry idToHandlesMap](self, "idToHandlesMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[NSRecursiveLock unlock](self->_handlesLock, "unlock");
  -[IMDChatRegistry _aliasToCNIDMapForAliases:](self, "_aliasToCNIDMapForAliases:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  return v7;
}

- (void)_populateContactIDOnHandles
{
  NSRecursiveLock **p_handlesLock;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[16];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  p_handlesLock = &self->_handlesLock;
  -[NSRecursiveLock lock](self->_handlesLock, "lock");
  -[IMDChatRegistry idToHandlesMap](self, "idToHandlesMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v5, "copy");

  -[NSRecursiveLock unlock](*p_handlesLock, "unlock");
  -[IMDChatRegistry _generateCurrentAliasToCNIDDictionary](self, "_generateCurrentAliasToCNIDDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mutableCopy");

  v23 = (void *)v7;
  if (IMOSLoggingEnabled(-[IMDChatRegistry setCachedAliasToCNIDMap:](self, "setCachedAliasToCNIDMap:", v7)))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "All handles and CachedAliasToCNIDMap", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D397A8], "logHandleIDs:checkAdditionalLoggingEnabled:", v24, 1);
  v9 = (void *)MEMORY[0x1E0D397A8];
  -[IMDChatRegistry cachedAliasToCNIDMap](self, "cachedAliasToCNIDMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logDictionary:", v10);

  -[NSRecursiveLock lock](self->_handlesLock, "lock");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[IMDChatRegistry cachedAliasToCNIDMap](self, "cachedAliasToCNIDMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v31;
    v14 = *MEMORY[0x1E0D35C18];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v15);
        -[IMDChatRegistry cachedAliasToCNIDMap](self, "cachedAliasToCNIDMap");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v18, "isEqualToString:", v14))
        {

          v18 = 0;
        }
        -[NSMutableDictionary objectForKey:](self->_idToHandlesMap, "objectForKey:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v27;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v27 != v21)
                objc_enumerationMutation(v19);
              objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v22++), "setCNContactID:", v18);
            }
            while (v20 != v22);
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
          }
          while (v20);
        }

        ++v15;
      }
      while (v15 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v12);
  }

  -[NSRecursiveLock unlock](self->_handlesLock, "unlock");
}

- (void)_updateCachedCNIDMapForHandles:(id)a3
{
  id v4;

  -[IMDChatRegistry _aliasToCNIDMapForAliases:](self, "_aliasToCNIDMapForAliases:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary addEntriesFromDictionary:](self->_cachedAliasToCNIDMap, "addEntriesFromDictionary:", v4);

}

- (id)_extractHandlesFromMap:(id)a3 usingCNID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "removeObject:", *MEMORY[0x1E0D35C18]);
  v7 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v13, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "containsObject:", v14))
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            v15 = (void *)objc_opt_new();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);
          }
          objc_msgSend(v15, "addObject:", v13);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_handlesWithChangedContactsOriginalMap:(id)a3 newMap:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  IMDChatRegistry *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v24 = self;
  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v13, v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqualToIgnoringCase:", v15) & 1) == 0)
        {
          objc_msgSend(v7, "addObject:", v13);
          objc_msgSend(v25, "addObject:", v14);
          if (v15)
            objc_msgSend(v25, "addObject:", v15);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }

  objc_msgSend(v25, "removeObject:", *MEMORY[0x1E0D35C18]);
  -[IMDChatRegistry _extractHandlesFromMap:usingCNID:](v24, "_extractHandlesFromMap:usingCNID:", v6, v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v16, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(v16, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j), v24);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v19);
  }

  return v7;
}

- (id)_potentialGUIDsForIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[IMDChatRegistry supportedServiceNames](IMDChatRegistry, "supportedServiceNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@;-;%@"),
          *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10),
          v3,
          (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)existingOneOnOneChatsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        -[IMDChatRegistry _potentialGUIDsForIdentifier:](self, "_potentialGUIDsForIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              -[IMDChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
                objc_msgSend(v5, "addObject:", v16);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)existingGroupChatsContainingHandles:(id)a3
{
  __CFArray *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __CFArray *v15;
  BOOL v16;
  __CFArray *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  int v33;
  int v34;
  __CFArray *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  int v50;
  int v51;
  void *v52;
  void *v53;
  __CFArray *v55;
  __CFArray *v56;
  __CFArray *obj;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  __CFArray *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v4 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v55 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  -[IMDChatRegistry allChats](self, "allChats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v99;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v99 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
        if (objc_msgSend(v10, "style") == 43)
        {
          objc_msgSend(v10, "displayName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "length");

          if (v12)
          {
            objc_msgSend(v10, "displayName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "length");

            v15 = v55;
            if (v14)
              v16 = v55 == 0;
            else
              v16 = 1;
            if (!v16 && v10 != 0)
            {
LABEL_19:
              CFArrayAppendValue(v15, v10);
              continue;
            }
          }
          else if (v4)
          {
            v15 = v4;
            if (v10)
              goto LABEL_19;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
    }
    while (v7);
  }

  v18 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  obj = v4;
  v60 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
  if (v60)
  {
    v58 = *(_QWORD *)v95;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v95 != v58)
          objc_enumerationMutation(obj);
        v62 = v19;
        v20 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v19);
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        v93 = 0u;
        v70 = v64;
        v21 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v90, v106, 16);
        if (v21)
        {
          v22 = v21;
          LOBYTE(v23) = 0;
          v24 = *(_QWORD *)v91;
          v66 = *(_QWORD *)v91;
          do
          {
            v25 = 0;
            v68 = v22;
            do
            {
              if (*(_QWORD *)v91 != v24)
                objc_enumerationMutation(v70);
              if ((v23 & 1) != 0)
              {
                LOBYTE(v23) = 1;
              }
              else
              {
                v72 = v25;
                v26 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v25);
                v88 = 0u;
                v89 = 0u;
                v86 = 0u;
                v87 = 0u;
                objc_msgSend(v20, "participants");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v86, v105, 16);
                if (v28)
                {
                  v29 = v28;
                  v23 = 0;
                  v30 = *(_QWORD *)v87;
                  do
                  {
                    for (j = 0; j != v29; ++j)
                    {
                      if (*(_QWORD *)v87 != v30)
                        objc_enumerationMutation(v27);
                      objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * j), "ID");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      v33 = objc_msgSend(v32, "isEqualToIgnoringCase:", v26);

                      v34 = v33 ^ 1 | v23;
                      v23 |= v34 ^ 1;
                      if ((v34 & 1) == 0 && v18 && v20)
                      {
                        CFArrayAppendValue(v18, v20);
                        v23 = 1;
                      }
                    }
                    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v86, v105, 16);
                  }
                  while (v29);
                }
                else
                {
                  LOBYTE(v23) = 0;
                }

                v24 = v66;
                v22 = v68;
                v25 = v72;
              }
              ++v25;
            }
            while (v25 != v22);
            v22 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v90, v106, 16);
          }
          while (v22);
        }

        v19 = v62 + 1;
      }
      while (v62 + 1 != v60);
      v60 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
    }
    while (v60);
  }

  v35 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v56 = v55;
  v61 = -[__CFArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v82, v104, 16);
  if (v61)
  {
    v59 = *(_QWORD *)v83;
    v65 = v18;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v83 != v59)
          objc_enumerationMutation(v56);
        v63 = v36;
        v37 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v36);
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v71 = v64;
        v38 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v78, v103, 16);
        if (v38)
        {
          v39 = v38;
          LOBYTE(v40) = 0;
          v41 = *(_QWORD *)v79;
          v67 = *(_QWORD *)v79;
          do
          {
            v42 = 0;
            v69 = v39;
            do
            {
              if (*(_QWORD *)v79 != v41)
                objc_enumerationMutation(v71);
              if ((v40 & 1) != 0)
              {
                LOBYTE(v40) = 1;
              }
              else
              {
                v73 = v42;
                v43 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * v42);
                v76 = 0u;
                v77 = 0u;
                v74 = 0u;
                v75 = 0u;
                objc_msgSend(v37, "participants");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v74, v102, 16);
                if (v45)
                {
                  v46 = v45;
                  v40 = 0;
                  v47 = *(_QWORD *)v75;
                  do
                  {
                    for (k = 0; k != v46; ++k)
                    {
                      if (*(_QWORD *)v75 != v47)
                        objc_enumerationMutation(v44);
                      objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * k), "ID");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      v50 = objc_msgSend(v49, "isEqualToIgnoringCase:", v43);

                      v51 = v50 ^ 1 | v40;
                      v40 |= v51 ^ 1;
                      if ((v51 & 1) == 0 && v35 && v37)
                      {
                        CFArrayAppendValue(v35, v37);
                        v40 = 1;
                      }
                    }
                    v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v74, v102, 16);
                  }
                  while (v46);
                }
                else
                {
                  LOBYTE(v40) = 0;
                }

                v18 = v65;
                v41 = v67;
                v39 = v69;
                v42 = v73;
              }
              ++v42;
            }
            while (v42 != v39);
            v39 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v78, v103, 16);
          }
          while (v39);
        }

        v36 = v63 + 1;
      }
      while (v63 + 1 != v61);
      v61 = -[__CFArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v82, v104, 16);
    }
    while (v61);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v52;
  if (v18)
    objc_msgSend(v52, "setObject:forKey:", v18, CFSTR("UnnamedGroupChats"));
  if (v35)
    objc_msgSend(v53, "setObject:forKey:", v35, CFSTR("NamedGroupChats"));

  return v53;
}

- (void)_contactsChanged:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = IMSharedHelperContactsBasedMergingEnabled();
  v6 = v5;
  v7 = IMOSLoggingEnabled(v5);
  if ((v6 & 1) != 0)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Contacts changed notification %@ ", (uint8_t *)&v11, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
    -[IMDChatRegistry performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__checkForContactChanges, 0, 0.0);
    +[IMDNicknameController sharedInstance](IMDNicknameController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "purgeUnknownSenderRecordInfoIfNeeded");

  }
  else if (v7)
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Contacts based merging is disabled.", (uint8_t *)&v11, 2u);
    }

  }
}

- (void)_checkForContactChanges
{
  MEMORY[0x1E0DE7D20](self, sel__chatGUIDsThatNeedRemergingWithCompletionHandler_);
}

- (void)_chatGUIDsThatNeedRemergingWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D15312EC;
  v6[3] = &unk_1E922C9E0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[IMDChatRegistry _updateCurrentAliasToCNIDDictionaryAndHistoryTokenWithCompletionHandler:](self, "_updateCurrentAliasToCNIDDictionaryAndHistoryTokenWithCompletionHandler:", v6);

}

- (void)_chatGUIDsThatNeedRemerging:(id *)a3 chatDictionaryArray:(id *)a4 aliasMap:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id obj;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  IMDChatRegistry *v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v52 = a5;
  v59 = self;
  -[IMDChatRegistry cachedAliasToCNIDMap](self, "cachedAliasToCNIDMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry _handlesWithChangedContactsOriginalMap:newMap:](v59, "_handlesWithChangedContactsOriginalMap:newMap:", v6, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v53, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChatRegistry existingOneOnOneChatsWithIdentifiers:](v59, "existingOneOnOneChatsWithIdentifiers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addObjectsFromArray:", v8);

    objc_msgSend(v53, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChatRegistry existingGroupChatsContainingHandles:](v59, "existingGroupChatsContainingHandles:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("UnnamedGroupChats"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addObjectsFromArray:", v11);

    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v51, "count"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v77 = v14;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "# chats that need update after contacts changed notification %@", buf, 0xCu);

      }
    }
    v50 = (void *)objc_msgSend(v52, "mutableCopy");
    -[IMDChatRegistry setCachedAliasToCNIDMap:](v59, "setCachedAliasToCNIDMap:", v50);
    -[IMDChatRegistry blackholedChats](v59, "blackholedChats");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    obj = v53;
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
    if (v57)
    {
      v56 = *(_QWORD *)v73;
      v63 = *MEMORY[0x1E0D35C18];
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v73 != v56)
          {
            v16 = v15;
            objc_enumerationMutation(obj);
            v15 = v16;
          }
          v58 = v15;
          v17 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v15);
          -[IMDChatRegistry idToHandlesMap](v59, "idToHandlesMap");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          -[IMDChatRegistry cachedAliasToCNIDMap](v59, "cachedAliasToCNIDMap");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          v62 = v19;
          v22 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
          if (v22)
          {
            v23 = *(_QWORD *)v69;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v69 != v23)
                  objc_enumerationMutation(v62);
                v25 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
                v26 = objc_msgSend(v21, "isEqualToString:", v63);
                if ((_DWORD)v26)
                {
                  if (IMOSLoggingEnabled(v26))
                  {
                    OSLogHandleForIMFoundationCategory();
                    v27 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                    {
                      objc_msgSend(v25, "ID");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v77 = v28;
                      _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "No CNContact for alias %@", buf, 0xCu);

                    }
                  }

                  if (IMOSLoggingEnabled(v29))
                  {
                    OSLogHandleForIMFoundationCategory();
                    v30 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v77 = v17;
                      _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Clean up nickname for alias %@", buf, 0xCu);
                    }

                  }
                  if (v17)
                    objc_msgSend(v61, "addObject:", v17);
                  v21 = 0;
                }
                objc_msgSend(v25, "setCNContactID:", v21);
              }
              v22 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
            }
            while (v22);
          }

          if ((objc_msgSend(v21, "isEqualToString:", v63) & 1) == 0)
          {
            v66 = 0u;
            v67 = 0u;
            v64 = 0u;
            v65 = 0u;
            v60 = v54;
            v31 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
            if (v31)
            {
              v32 = *(_QWORD *)v65;
              do
              {
                for (j = 0; j != v31; ++j)
                {
                  if (*(_QWORD *)v65 != v32)
                    objc_enumerationMutation(v60);
                  v34 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
                  objc_msgSend(v34, "participants");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "__imArrayByApplyingBlock:", &unk_1E922CA00);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  v37 = objc_msgSend(v36, "containsObject:", v17);
                  if ((_DWORD)v37)
                  {
                    if (IMOSLoggingEnabled(v37))
                    {
                      OSLogHandleForIMFoundationCategory();
                      v38 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                      {
                        objc_msgSend(v34, "guid");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412546;
                        v77 = v17;
                        v78 = 2112;
                        v79 = v39;
                        _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "Hawking: New contact (%@) added, removing chat (%@) from blackhole.", buf, 0x16u);

                      }
                    }
                    objc_msgSend(v34, "updateIsBlackholed:", 0);
                    -[IMDChatRegistry _sharedMessageStore](v59, "_sharedMessageStore");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "lastMessage");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "guid");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "markMessageGUIDUnread:", v42);

                    objc_msgSend(v34, "participants");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v40) = objc_msgSend(v43, "count") == 1;

                    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = v44;
                    if ((_DWORD)v40)
                      v46 = 24;
                    else
                      v46 = 25;
                    objc_msgSend(v44, "trackSpamEvent:", v46);

                  }
                }
                v31 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
              }
              while (v31);
            }

          }
          v15 = v58 + 1;
        }
        while (v58 + 1 != v57);
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
      }
      while (v57);
    }

    +[IMDNicknameController sharedInstance](IMDNicknameController, "sharedInstance");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "cleanUpNicknameForIDs:", v61);

    -[IMDChatRegistry _serializeChatsForRemerge:guidsThatNeedRemerging:chatDictionaryArray:](v59, "_serializeChatsForRemerge:guidsThatNeedRemerging:chatDictionaryArray:", v51, a3, a4);
  }

}

- (void)_chatGUIDsThatNeedRemerging:(id *)a3 chatDictionaryArray:(id *)a4 oldPersonCentricID:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a5;
  if (objc_msgSend(v13, "length"))
  {
    -[IMDChatRegistry personCentricGroupedChatsCache](self, "personCentricGroupedChatsCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMDChatRegistry personCentricGroupedChatsCache](self, "personCentricGroupedChatsCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v13);

    if (objc_msgSend(v9, "count"))
    {
      -[IMDChatRegistry groupChatsBasedOnIdentity:](self, "groupChatsBasedOnIdentity:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChatRegistry personCentricGroupedChatsCache](self, "personCentricGroupedChatsCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addEntriesFromDictionary:", v11);

      -[IMDChatRegistry _serializeChatsForRemerge:guidsThatNeedRemerging:chatDictionaryArray:](self, "_serializeChatsForRemerge:guidsThatNeedRemerging:chatDictionaryArray:", v9, a3, a4);
    }

  }
}

- (void)_serializeChatsForRemerge:(id)a3 guidsThatNeedRemerging:(id *)a4 chatDictionaryArray:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    if (a4)
    {
      v20 = v6;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      v9 = v8;
      if (v8)
      {
        v10 = *(_QWORD *)v24;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v24 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
            if (IMOSLoggingEnabled(v8))
            {
              OSLogHandleForIMFoundationCategory();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v12, "guid");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v28 = v14;
                _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Chat %@ needs to be merged / un-merged & updated in spotlight", buf, 0xCu);

              }
            }
            v15 = *a4;
            objc_msgSend(v12, "guid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v16);

            ++v11;
          }
          while (v9 != v11);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
          v9 = v8;
        }
        while (v8);
      }

      v6 = v20;
    }
    if (a5)
    {
      -[IMDChatRegistry personCentricGroupedChatsArrayWithMaximumNumberOfChats:skipsLastMessageLoading:usingChats:useCachedChatGroups:includingPinnedChatIdentifiers:repairInconsistentMergedChats:](self, "personCentricGroupedChatsArrayWithMaximumNumberOfChats:skipsLastMessageLoading:usingChats:useCachedChatGroups:includingPinnedChatIdentifiers:repairInconsistentMergedChats:", 0x7FFFFFFFFFFFFFFFLL, 0, v6, 0, 0, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      *a5 = v17;
      if (IMOSLoggingEnabled(v17))
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*a5, "count"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v28 = v19;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "No of entries in chat dictionary %@", buf, 0xCu);

        }
      }
    }
  }

}

- (void)updateMeCardHasUpdatedForAllChats
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t buf[8];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Update MeCard for all IMDChats", buf, 2u);
    }

  }
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[IMDChatRegistry allChats](self, "allChats", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "meCardHasUpdated");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void)moveMessagesWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0D360F0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "database");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moveMessageRecordsToRecoveryForMessageGUIDs:deleteDate:", v7, v6);

}

- (void)moveMessagesInChatsWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0D360F0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "database");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moveMessageRecordsToRecoveryForChatRecordsWithGUIDs:deleteDate:", v7, v6);

}

- (void)recoverMessagesWithChatGUIDs:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D360F0];
  v4 = a3;
  objc_msgSend(v3, "database");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recoverMessageRecordsForChatRecordsWithGUIDs:", v4);

}

- (id)_bestServiceSessionForService:(id)a3 accountID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    +[IMDServiceController sharedController](IMDServiceController, "sharedController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serviceWithName:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeAccountsForService:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v16, "session", (_QWORD)v22);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            if (!v6
              || (objc_msgSend(v8, "supportsOneSessionForAllAccounts") & 1) != 0
              || (objc_msgSend(v16, "accountID"),
                  v18 = (void *)objc_claimAutoreleasedReturnValue(),
                  v19 = objc_msgSend(v6, "isEqualToString:", v18),
                  v18,
                  (v19 & 1) != 0))
            {
              objc_msgSend(v16, "session");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_17;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v20 = 0;
        if (v13)
          continue;
        break;
      }
    }
    else
    {
      v20 = 0;
    }
LABEL_17:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D360F0];
  v8 = a3;
  objc_msgSend(v7, "synchronousDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D1532434;
  v11[3] = &unk_1E922CA28;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:completionHandler:", v8, v11);

}

- (id)recoverableMessagesMetadataPendingCloudKitSaveWithLimit:(unint64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recoverableMessagesMetadataPendingCloudKitSaveWithLimit:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)recoverableMessagesMetadataPendingCloudKitDeleteWithLimit:(unint64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recoverableMessagesMetadataPendingCloudKitDeleteWithLimit:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)clearRecoverableMessageTombStones
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D360F0], "database");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearRecoverableMessageTombStones");

}

- (void)updateRecoverableMessageSyncState:(int64_t)a3 forMessageRowID:(int64_t)a4 onPartIndex:(int64_t)a5
{
  id v8;

  objc_msgSend(MEMORY[0x1E0D360F0], "database");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateRecoverableMessageSyncState:forMessageRowID:onPartIndex:", a3, a4, a5);

}

- (void)_triggerRemergeForPersonCentricID:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0;
  v13 = 0;
  -[IMDChatRegistry _chatGUIDsThatNeedRemerging:chatDictionaryArray:oldPersonCentricID:](self, "_chatGUIDsThatNeedRemerging:chatDictionaryArray:oldPersonCentricID:", &v13, &v12, v4);
  v5 = v13;
  v6 = v12;
  v7 = objc_msgSend(v5, "count");
  if (v7)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = objc_msgSend(v5, "count");
        *(_DWORD *)buf = 67109378;
        v15 = v9;
        v16 = 2112;
        v17 = v4;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Broadcasting remerge for %d chats, invalidated personCentricID=%@", buf, 0x12u);
      }

    }
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "broadcasterForChatListeners");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "chatsNeedRemerging:groupedChats:", v5, v6);

  }
}

- (unint64_t)persistedChatCount
{
  return self->_persistedChatCount;
}

- (NSMutableDictionary)idToHandlesMap
{
  return self->_idToHandlesMap;
}

- (void)setIdToHandlesMap:(id)a3
{
  objc_storeStrong((id *)&self->_idToHandlesMap, a3);
}

- (NSData)historyToken
{
  return self->_historyToken;
}

- (void)setCkUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_ckUtilities, a3);
}

- (void)setChatStore:(id)a3
{
  objc_storeStrong((id *)&self->_chatStore, a3);
}

- (BOOL)hasDumpedLogsForNoExisitingGroup
{
  return self->_hasDumpedLogsForNoExisitingGroup;
}

- (void)setHasDumpedLogsForNoExisitingGroup:(BOOL)a3
{
  self->_hasDumpedLogsForNoExisitingGroup = a3;
}

- (IMDMessageProcessingController)messageProcessingController
{
  return self->_messageProcessingController;
}

- (IMDMessageHistorySyncController)messageHistorySyncController
{
  return self->_messageHistorySyncController;
}

- (void)setPersonCentricGroupedChatsCache:(id)a3
{
  objc_storeStrong((id *)&self->_personCentricGroupedChatsCache, a3);
}

- (NSMutableDictionary)cachedAliasToCNIDMap
{
  return self->_cachedAliasToCNIDMap;
}

- (void)setCachedAliasToCNIDMap:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAliasToCNIDMap, a3);
}

- (NSMutableDictionary)pendingChatBotHandleToAlternateID
{
  return self->_pendingChatBotHandleToAlternateID;
}

- (void)setPendingChatBotHandleToAlternateID:(id)a3
{
  objc_storeStrong((id *)&self->_pendingChatBotHandleToAlternateID, a3);
}

- (TUConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationManager, 0);
  objc_storeStrong((id *)&self->_pendingChatBotHandleToAlternateID, 0);
  objc_storeStrong((id *)&self->_cachedAliasToCNIDMap, 0);
  objc_storeStrong((id *)&self->_personCentricGroupedChatsCache, 0);
  objc_storeStrong((id *)&self->_messageHistorySyncController, 0);
  objc_storeStrong((id *)&self->_messageProcessingController, 0);
  objc_storeStrong((id *)&self->_chatStore, 0);
  objc_storeStrong((id *)&self->_ckUtilities, 0);
  objc_storeStrong((id *)&self->_historyToken, 0);
  objc_storeStrong((id *)&self->_idToHandlesMap, 0);
  objc_storeStrong((id *)&self->_chats, 0);
  objc_storeStrong((id *)&self->_handlesLock, 0);
  objc_storeStrong((id *)&self->_chatsLock, 0);
  objc_storeStrong((id *)&self->_chatsByGroupID, 0);
}

- (id)_preferredFileTransferFromGroupPhotoGUIDs:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  __int128 v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = a3;
  v3 = 0;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v32;
    *(_QWORD *)&v5 = 138412290;
    v29 = v5;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance", v29);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "attachmentWithGUID:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = IMOSLoggingEnabled(v11);
        if (v10)
        {
          if ((_DWORD)v12)
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v36 = v8;
              v37 = 2112;
              v38 = v10;
              _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Have file transfer matching groupPhotoGuid: %@. FileTransfer: %@", buf, 0x16u);
            }

          }
          if (v3)
          {
            objc_msgSend(v10, "createdDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              objc_msgSend(v3, "createdDate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15;
              if (!v15 || (v15 = (void *)objc_msgSend(v15, "compare:", v14), v15 == (void *)-1))
              {
                if (IMOSLoggingEnabled(v15))
                {
                  OSLogHandleForIMFoundationCategory();
                  v21 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v10, "guid");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v3, "guid");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v36 = v22;
                    v37 = 2112;
                    v38 = v23;
                    _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Preferring %@ over %@ because the creation date is newer.", buf, 0x16u);

                  }
                }
                v24 = v10;

                v3 = v24;
              }
              else if (IMOSLoggingEnabled(v15))
              {
                OSLogHandleForIMFoundationCategory();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v10, "guid");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "guid");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v36 = v18;
                  v37 = 2112;
                  v38 = v19;
                  _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Not preferring %@ over %@ because the creation date is older.", buf, 0x16u);

                }
              }

            }
            else if (IMOSLoggingEnabled(0))
            {
              OSLogHandleForIMFoundationCategory();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v10, "guid");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v29;
                v36 = v26;
                _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Not preferring %@ because it does not have a creation date", buf, 0xCu);

              }
            }

          }
          else
          {
            if (IMOSLoggingEnabled(v12))
            {
              OSLogHandleForIMFoundationCategory();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v29;
                v36 = v8;
                _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Accepting groupPhotoGuid %@ as the initial preferred group photo.", buf, 0xCu);
              }

            }
            v3 = v10;
          }
        }
        else if ((_DWORD)v12)
        {
          OSLogHandleForIMFoundationCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v29;
            v36 = v8;
            _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Could not find file transfer matching group photo guid: %@", buf, 0xCu);
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v4);
  }

  return v3;
}

- (void)setUpInitialConversationManager
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Setting up conversation manager for imagent", buf, 2u);
    }

  }
  -[IMDChatRegistry conversationManager](self, "conversationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1D15EBCEC;
  v5[3] = &unk_1E92287A0;
  v5[4] = self;
  objc_msgSend(v4, "registerWithCompletionHandler:", v5);

}

- (id)_activeTUConversations
{
  void *v2;
  void *v3;

  -[IMDChatRegistry conversationManager](self, "conversationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeConversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateFaceTimeGroupName:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[IMDChatRegistry _tuConversationForChat:](self, "_tuConversationForChat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[IMDChatRegistry conversationManager](self, "conversationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[IMDChatRegistry conversationManager](self, "conversationManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateMessagesGroupName:onConversation:", v8, v4);

    }
  }

}

- (void)updateFaceTimeGroupPhoto:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  -[IMDChatRegistry _tuConversationForChat:](self, "_tuConversationForChat:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    -[IMDChatRegistry conversationManager](self, "conversationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    v4 = v8;
    if ((v6 & 1) != 0)
    {
      -[IMDChatRegistry conversationManager](self, "conversationManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "conversationUpdateMessagesGroupPhoto:", v8);

      v4 = v8;
    }
  }

}

- (id)_oneToOneChatForRemoteHandle:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  uint64_t v11;
  _QWORD *v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  if (IMOSLoggingEnabled(v26))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      -[IMDChatRegistry chats](self, "chats");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v32 = v7;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Chats count: %@", buf, 0xCu);

    }
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[IMDChatRegistry chats](self, "chats");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (!v9)
    goto LABEL_22;
  v11 = *(_QWORD *)v28;
  v12 = (_QWORD *)MEMORY[0x1E0D38F68];
  *(_QWORD *)&v10 = 138412546;
  v25 = v10;
  while (2)
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v28 != v11)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v14, "serviceName", v25);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToString:", *v12))
      {
        objc_msgSend(v14, "participants");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count") == 1;

        if (!v17)
          continue;
        v18 = (void *)MEMORY[0x1E0DBD2F8];
        objc_msgSend(v14, "participants");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "ID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "normalizedHandleWithDestinationID:", v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (IMOSLoggingEnabled(v22))
        {
          OSLogHandleForIMFoundationCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v25;
            v32 = v15;
            v33 = 2112;
            v34 = v26;
            _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "chat handle %@ vs conversation handle %@", buf, 0x16u);
          }

        }
        if (TUHandlesAreCanonicallyEqual())
        {
          v9 = v14;

          goto LABEL_22;
        }
      }

    }
    v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v9)
      continue;
    break;
  }
LABEL_22:

  return v9;
}

- (id)_chatForTUGroupID:(id)a3 participants:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMDChatRegistry existingChatsWithGroupID:](self, "existingChatsWithGroupID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1D15EC78C;
  v32 = sub_1D15EC79C;
  v33 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1D15EC7A4;
  v27[3] = &unk_1E922C880;
  v27[4] = &v28;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v27);
  objc_msgSend((id)v29[5], "participants");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v29[5] && (v11 = objc_msgSend(v7, "count"), v9 = objc_msgSend(v10, "count"), v11 == v9))
  {
    v12 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v10, "__imArrayByApplyingBlock:", &unk_1E922F5B0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "__imSetByApplyingBlock:", &unk_1E922F5D0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "minusSet:", v15);
    v16 = objc_msgSend(v14, "count");
    if (v16)
    {
      v17 = IMOSLoggingEnabled(v16);
      if ((_DWORD)v17)
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v35 = v10;
          v36 = 2112;
          v37 = v7;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "While groupID matched, Messages participants (%@) did not equal TUConversation remoteMembers (%@)", buf, 0x16u);
        }

      }
      if (IMOSLoggingEnabled(v17))
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v14;
          _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "different handles: (%@)", buf, 0xCu);
        }

      }
      v20 = (void *)v29[5];
      v29[5] = 0;

    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)v29[5], "chatIdentifier");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v29[5], "groupID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v35 = v23;
        v36 = 2112;
        v37 = v6;
        v38 = 2112;
        v39 = v24;
        _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "We mapped a chat %@ to a TUConversation with messagesGroupUUID %@ for chat groupID %@", buf, 0x20u);

      }
    }

  }
  else
  {
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v35 = v10;
        v36 = 2112;
        v37 = v7;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "While groupID matched, Messages participants (%@) count did not equal TUConversation remoteMembers (%@)", buf, 0x16u);
      }

    }
    v14 = (void *)v29[5];
    v29[5] = 0;
  }

  v25 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v25;
}

- (id)_chatForTUConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "messagesGroupUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "messagesGroupUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "__im_filteredRemoteMembers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChatRegistry _chatForTUGroupID:participants:](self, "_chatForTUGroupID:participants:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAVLessSharePlayEnabled");

  if (!v11)
    goto LABEL_12;
  objc_msgSend(v4, "remoteMembers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") != 1)
  {

    goto LABEL_12;
  }
  v13 = objc_msgSend(v4, "avMode");

  if (v13)
  {
LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v20 = 138412290;
      v21 = v4;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Attempting to map 1x1 chat for conversation: %@", (uint8_t *)&v20, 0xCu);
    }

  }
  objc_msgSend(v4, "remoteMembers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "anyObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry _oneToOneChatForRemoteHandle:](self, "_oneToOneChatForRemoteHandle:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v9;
}

- (id)_tuConversationForChat:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, _BYTE *);
  void *v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1D15EC78C;
  v35 = sub_1D15EC79C;
  v36 = 0;
  -[IMDChatRegistry _activeTUConversations](self, "_activeTUConversations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = sub_1D15ECEC4;
  v28 = &unk_1E922F5F8;
  v6 = v4;
  v29 = v6;
  v30 = &v31;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v25);

  objc_msgSend((id)v32[5], "remoteMembers", v25, v26, v27, v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");
  v10 = objc_msgSend(v8, "count");
  if (v9 == v10)
  {
    v11 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v8, "__imArrayByApplyingBlock:", &unk_1E922F618);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "__imSetByApplyingBlock:", &unk_1E922F638);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "minusSet:", v14);
    v15 = objc_msgSend(v13, "count");
    if (v15)
    {
      if (IMOSLoggingEnabled(v15))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v38 = v8;
          v39 = 2112;
          v40 = v7;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "While groupID matched, Messages participants (%@) did not equal TUConversation remoteMembers (%@)", buf, 0x16u);
        }

      }
      v17 = (void *)v32[5];
      v32[5] = 0;

    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "chatIdentifier");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v32[5], "messagesGroupUUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "groupID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v38 = v20;
        v39 = 2112;
        v40 = v21;
        v41 = 2112;
        v42 = v22;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "We mapped a chat %@ to a TUConversation with messagesGroupUUID %@ for chat groupID %@", buf, 0x20u);

      }
    }

  }
  else
  {
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v38 = v8;
        v39 = 2112;
        v40 = v7;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "While groupID matched, Messages participants (%@) count did not equal TUConversation remoteMembers (%@)", buf, 0x16u);
      }

    }
    v13 = (void *)v32[5];
    v32[5] = 0;
  }

  v23 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v23;
}

- (id)_initiatorForConversation:(id)a3 chat:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isLocallyCreated"))
  {
    objc_msgSend(v6, "lastAddressedLocalHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (!v7)
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Not able to find lastAddressedLocalHandle, falling back to account's loginID", (uint8_t *)&v18, 2u);
        }

      }
      objc_msgSend(v6, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "loginID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_stripFZIDPrefix");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "performSelector:", sel_initiator);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "remoteMembers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "anyObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "handles");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "anyObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v12, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = 138412290;
      v19 = v8;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Conversation initiator handle value %@", (uint8_t *)&v18, 0xCu);
    }

  }
  return v8;
}

- (id)_conversationItemForChat:(id)a3 conversation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  void *v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = a4;
  -[IMDChatRegistry _initiatorForConversation:chat:](self, "_initiatorForConversation:chat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v33, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v42 = v32;
        v43 = 2112;
        v44 = v33;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "TUConversation UUID %@ for conversation %@", buf, 0x16u);
      }

    }
    v11 = objc_alloc(MEMORY[0x1E0D39B38]);
    v39 = *MEMORY[0x1E0D36D90];
    v40 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loginID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "loginID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "roomName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v11, "initWithSenderInfo:time:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:type:", v12, 0, v32, 0, v14, v16, v17, v7, v18, 0, 0, 6);

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v6, "participants");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v35 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v24, "ID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", v7);

          if (v26)
          {
            objc_msgSend(v24, "unformattedID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setUnformattedID:", v27);

            objc_msgSend(v24, "countryCode");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setCountryCode:", v28);

          }
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v21);
    }

    objc_msgSend(v6, "lastAddressedLocalHandle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDestinationCallerID:", v29);

    if (objc_msgSend(v33, "isLocallyCreated"))
      objc_msgSend(v19, "setFlags:", 4);
    objc_msgSend(v19, "setAvMode:", objc_msgSend(v33, "avMode"));

  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v42 = v6;
        v43 = 2112;
        v44 = v33;
        _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Not creating IMTUConversationItem - likely a nil lastAddressedHandle on chat: %@ or nil handles in conversation: %@", buf, 0x16u);
      }

    }
    v19 = 0;
  }

  return v19;
}

- (void)conversationManager:(id)a3 conversation:(id)a4 addedMembersLocally:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v7 = a4;
  v8 = a5;
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v50 = v7;
      v51 = 2112;
      v52 = v8;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Callback for addedMembersLocally conversation: %@ member: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v7, "__im_filteredRemoteMembers", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "minusSet:", v8);
  objc_msgSend(v7, "__im_filteredRemoteMembers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "minusSet:", v11);
  v14 = objc_msgSend(v13, "count");
  v15 = v14 == 0;
  v16 = IMOSLoggingEnabled(v14);
  if (!v15)
  {
    if (v16)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v13;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Proceeding with addedMembers: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v7, "groupUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_chatForTUGroupID:participants:", v19, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      if (objc_msgSend(v11, "count") != 1)
        goto LABEL_13;
      if (objc_msgSend(v7, "avMode"))
        goto LABEL_13;
      objc_msgSend(v11, "anyObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handle");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "_oneToOneChatForRemoteHandle:", v42);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
LABEL_13:
        IMLogHandleForCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_1D166CC68(v7, v21);

        v20 = 0;
      }
    }
    v22 = objc_msgSend(v20, "style");
    if ((_DWORD)v22 == 43)
    {
      if (IMOSLoggingEnabled(v22))
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v20;
          _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Found chat to potentially add members to: %@", buf, 0xCu);
        }

      }
      +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "anySessionForServiceName:", *MEMORY[0x1E0D38F68]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        IMLogHandleForCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          sub_1D166CBCC(v30, v34, v35, v36, v37, v38, v39, v40);
        goto LABEL_36;
      }
      objc_msgSend(v13, "__imSetByApplyingBlock:", &unk_1E922F678);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "allObjects");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v27, "count"))
      {
        v28 = (void *)MEMORY[0x1E0D39880];
        v29 = *MEMORY[0x1E0D34240];
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = sub_1D15EDC8C;
        v46[3] = &unk_1E922C020;
        v47 = v25;
        v48 = v20;
        objc_msgSend(v28, "refreshIDStatusForDestinations:service:listenerID:queue:completionBlock:", v27, v29, CFSTR("IMDChatRegistry_CallManagement"), MEMORY[0x1E0C80D38], v46);

      }
    }
    if (objc_msgSend(v20, "style") != 45)
    {
LABEL_37:

      goto LABEL_38;
    }
    objc_msgSend(v44, "_upgradeChatToGroupChat:forConversation:", v20, v7);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      IMLogHandleForCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        sub_1D166CC00((uint64_t)v7, v31, v32);

    }
LABEL_36:

    goto LABEL_37;
  }
  if (v16)
  {
    OSLogHandleForIMFoundationCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "Not processing addedMembersLocally since, after filtering, we don't have anyone to add.", buf, 2u);
    }

  }
LABEL_38:

}

- (id)_upgradeChatToGroupChat:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint8_t v28[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "style") != 45)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1D166CD78(v6, v9);
    v10 = 0;
    goto LABEL_22;
  }
  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anySessionForServiceName:", *MEMORY[0x1E0D38F68]);
  v9 = objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    IMLogHandleForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1D166CBCC(v17, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_20;
  }
  -[IMDChatRegistry _findExistingGroupChatForConversation:onSession:](self, "_findExistingGroupChatForConversation:onSession:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Couldn't find chat, trying to create a new one!", buf, 2u);
      }

    }
    -[IMDChatRegistry _createGroupChatForConversation:onSession:](self, "_createGroupChatForConversation:onSession:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      IMLogHandleForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1D166CD10((uint64_t)v7, v17, v27);
LABEL_20:
      v10 = 0;
LABEL_21:

      goto LABEL_22;
    }
  }
  objc_msgSend(v10, "guid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chatIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  -[NSObject invitePersonInfo:withMessage:toChatID:identifier:style:](v9, "invitePersonInfo:withMessage:toChatID:identifier:style:", &unk_1E9271970, 0, v12, v13, objc_msgSend(v10, "style"));

  -[IMDChatRegistry conversationManager](self, "conversationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Indicating to TU that we are now mapped to a messages group.", v28, 2u);
      }

    }
    -[IMDChatRegistry conversationManager](self, "conversationManager");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject registerMessagesGroupUUIDForConversationUUID:](v17, "registerMessagesGroupUUIDForConversationUUID:", v18);

    goto LABEL_21;
  }
LABEL_22:

  return v10;
}

- (id)_findExistingGroupChatForConversation:(id)a3 onSession:(id)a4
{
  id v6;
  id v7;
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

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "__im_filteredRemoteMembers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "__imSetByApplyingBlock:", &unk_1E922F698);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "initiator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "normalizedValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "internalName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry bestCandidateGroupChatWithFromIdentifier:toIdentifier:displayName:participants:groupID:serviceName:](self, "bestCandidateGroupChatWithFromIdentifier:toIdentifier:displayName:participants:groupID:serviceName:", v11, v13, 0, v10, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_createGroupChatForConversation:(id)a3 onSession:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  IMDHandle *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  IMDHandle *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  IMDChatRegistry *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id obj;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v25 = self;
  v39 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v27 = a4;
  objc_msgSend(v27, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry generateUnusedChatIdentifierForGroupChatWithAccount:](v25, "generateUnusedChatIdentifierForGroupChatWithAccount:", v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v28, "__im_filteredRemoteMembers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v6)
  {
    v31 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v31)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "isLightweightMember", v25);
        if ((_DWORD)v9)
        {
          if (IMOSLoggingEnabled(v9))
          {
            OSLogHandleForIMFoundationCategory();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v8;
              _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "This is a lightweight member - skipping: %@", buf, 0xCu);
            }

          }
        }
        else
        {
          v11 = [IMDHandle alloc];
          objc_msgSend(v8, "handle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "normalizedValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "handle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "handle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "isoCountryCode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[IMDHandle initWithID:unformattedID:countryCode:](v11, "initWithID:unformattedID:countryCode:", v13, v15, v17);
          -[IMDHandle handleInfo](v18, "handleInfo");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "addObject:", v19);
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v6);
  }

  objc_msgSend(v28, "groupUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "didJoinChat:style:displayName:groupID:handleInfo:", v26, 43, 0, v21, v29);

  objc_msgSend(v27, "account");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatRegistry existingChatWithIdentifier:account:](v25, "existingChatWithIdentifier:account:", v26, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_messageStore
{
  return +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
}

- (void)updateChatsUsingMessageGUIDsAndSummaries:(id)a3
{
  uint64_t v4;
  IMDChatRegistry *v5;

  sub_1D15FD3C0(0, &qword_1EFC61E10);
  v4 = sub_1D166DA30();
  v5 = self;
  sub_1D15FE364(v4);

  swift_bridgeObjectRelease();
}

@end
