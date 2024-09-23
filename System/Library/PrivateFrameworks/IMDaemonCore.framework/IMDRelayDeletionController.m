@implementation IMDRelayDeletionController

- (IMDRelayDeletionController)init
{
  IMDRelayDeletionController *v2;
  IMDRelayDeletionController *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IMDRelayDeletionController;
  v2 = -[IMDRelayDeletionController init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    if (IMOSLoggingEnabled(v2))
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Setting up deletion controller", v10, 2u);
      }

    }
    +[IMDRelayPushHandler sharedInstance](IMDRelayPushHandler, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addListener:", v3);

    +[IMDRelayPushHandler sharedInstance](IMDRelayPushHandler, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRegistered:", 1);

    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Deletion controller created", v10, 2u);
      }

    }
  }
  return v3;
}

- (void)handler:(id)a3 deleteCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 fromIDSID:(id)a8 timeStamp:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12
{
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v18 = a4;
  v40 = a5;
  v41 = a6;
  v19 = a7;
  v20 = a8;
  v45 = a9;
  v42 = a10;
  v43 = a11;
  v44 = a12;
  -[IMDRelayDeletionController relayController](self, "relayController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "idsDeviceFromPushToken:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22
    || (-[IMDRelayDeletionController relayController](self, "relayController"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v23, "idsDeviceForFromID:", v20),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23,
        v22))
  {
    v25 = objc_msgSend(v22, "isActive");
    objc_msgSend(v18, "objectForKey:", CFSTR("chat"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndex:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKey:", CFSTR("wasReportedAsJunk"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "BOOLValue");

    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "cloudKitSyncingEnabled");

    v33 = IMOSLoggingEnabled(v32);
    if ((((v25 | v31) | v29) & 1) != 0)
    {
      if (v33)
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          v49 = v18;
          v50 = 1024;
          v51 = v31;
          v52 = 1024;
          v53 = v29;
          v54 = 1024;
          v55 = v25;
          _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "Handling delete command: %@ (cloudKitSyncEnabled: %d, wasReportedJunk: %d, senderIsPairedWatch: %d)", buf, 0x1Eu);
        }

      }
      if (-[IMDRelayDeletionController shouldInferRecoverableDeleteForCommandDictionary:](self, "shouldInferRecoverableDeleteForCommandDictionary:", v18))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "__im_iMessageDateFromTimeStamp:", v45);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDRelayDeletionController deleteCommandDictionaryWithIncomingDictionary:inferredRecoverableDeleteForLegacyCommandsWithDate:](self, "deleteCommandDictionaryWithIncomingDictionary:inferredRecoverableDeleteForLegacyCommandsWithDate:", v18, v35);
        v36 = objc_claimAutoreleasedReturnValue();

        v18 = (id)v36;
      }
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = sub_1D143C71C;
      v46[3] = &unk_1E9228818;
      v46[4] = self;
      v18 = v18;
      v47 = v18;
      -[IMDRelayDeletionController _enqueueBlock:withTimeout:](self, "_enqueueBlock:withTimeout:", v46, 45.0);

    }
    else if (v33)
    {
      OSLogHandleForIMFoundationCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v18;
        _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "iCloudSync not enabled and not reported as junk, dropping delete command: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled(v24))
    {
      OSLogHandleForIMFoundationCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v19;
        _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "Received a delete command, but it was not from one of our own devices From: %@", buf, 0xCu);
      }

    }
    v22 = 0;
  }

}

- (void)handler:(id)a3 recoverCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 fromIDSID:(id)a8 timeStamp:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v18 = a4;
  v36 = a5;
  v37 = a6;
  v19 = a7;
  v20 = a8;
  v38 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  -[IMDRelayDeletionController relayController](self, "relayController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "idsDeviceFromPushToken:", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25
    || (-[IMDRelayDeletionController relayController](self, "relayController", v35, v36, v37, v38),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v26, "idsDeviceForFromID:", v20),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v26,
        v25))
  {
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance", v35);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "cloudKitSyncingEnabled");

    v31 = IMOSLoggingEnabled(v30);
    if ((v29 & 1) != 0)
    {
      if (v31)
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v18;
          _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Handling recover command: %@ (cloudKitSyncEnabled: YES)", buf, 0xCu);
        }

      }
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = sub_1D143CAB8;
      v39[3] = &unk_1E9228818;
      v39[4] = self;
      v40 = v18;
      -[IMDRelayDeletionController _enqueueBlock:withTimeout:](self, "_enqueueBlock:withTimeout:", v39, 45.0);

    }
    else if (v31)
    {
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v18;
        _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "iCloudSync not enabled, dropping recover command: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled(v27))
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v19;
        _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "Received a recover command, but it was not from one of our own devices From: %@", buf, 0xCu);
      }

    }
    v25 = 0;
  }

}

- (id)chatRegistry
{
  return +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
}

- (id)relayController
{
  return +[IMDRelayServiceController sharedInstance](IMDRelayServiceController, "sharedInstance");
}

- (id)broadcasterForChatListenersForService:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "broadcasterForChatListenersSupportingService:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)broadcasterForChatListenersForService:(id)a3 withBlackholeStatus:(BOOL)a4
{
  id v4;
  id v5;
  void *v6;

  if (a4)
  {
    v4 = a3;
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "broadcasterForBlackholeChatListenersSupportingService:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = a3;
    -[IMDRelayDeletionController broadcasterForChatListenersForService:](self, "broadcasterForChatListenersForService:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)shouldInferRecoverableDeleteForCommandDictionary:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isPermanentDelete"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("recoverableDeleteDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 == 0;

  }
  return v6;
}

- (id)deleteCommandDictionaryWithIncomingDictionary:(id)a3 inferredRecoverableDeleteForLegacyCommandsWithDate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("permanentDeleteChatMetadataArray"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("permanentDeleteChatMetadataArray"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("chat"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("isPermanentDelete"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("recoverableDeleteDate"));

  v8 = (void *)objc_msgSend(v6, "copy");
  return v8;
}

- (void)deleteChatsForCommandDictionary:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  id v35;
  int v36;
  _QWORD v37[4];
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
  void *v48;
  void *v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  const __CFString *v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("isPermanentDelete"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  v36 = v5;
  if (v5)
  {
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("permanentDeleteChatMetadataArray"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
  }
  else
  {
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("chat"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("recoverableDeleteDate"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v6;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v31)
  {
    v7 = CFSTR("NO");
    v30 = *(_QWORD *)v45;
    if (v5)
      v7 = CFSTR("YES");
    v33 = v7;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v45 != v30)
        {
          v9 = v8;
          objc_enumerationMutation(obj);
          v8 = v9;
        }
        v32 = v8;
        v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v8);
        -[IMDRelayDeletionController _blocklistIfNeededForChatDict:](self, "_blocklistIfNeededForChatDict:", v10);
        -[IMDRelayDeletionController _chatsForDeleteAndRecoveryChatMetadataDictionary:](self, "_chatsForDeleteAndRecoveryChatMetadataDictionary:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("deleteIncomingMessages"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "BOOLValue");

        if (!objc_msgSend(v11, "count") && IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v10;
            _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "IMDRelayDeletionController | Deletion: did not find any chats for chat metadata %@", buf, 0xCu);
          }

        }
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v35 = v11;
        v15 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
        v16 = v15;
        if (v15)
        {
          v17 = *(_QWORD *)v41;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v41 != v17)
                objc_enumerationMutation(v35);
              v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v18);
              if (IMOSLoggingEnabled(v15))
              {
                OSLogHandleForIMFoundationCategory();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v52 = v19;
                  v53 = 2112;
                  v54 = v33;
                  _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "removing chat: %@, permanently: %@", buf, 0x16u);
                }

              }
              objc_msgSend(v19, "guid");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "service");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMDRelayDeletionController broadcasterForChatListenersForService:withBlackholeStatus:](self, "broadcasterForChatListenersForService:withBlackholeStatus:", v22, objc_msgSend(v19, "isBlackholed"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              -[IMDRelayDeletionController chatRegistry](self, "chatRegistry");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v36)
              {
                v50 = v21;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v37[0] = MEMORY[0x1E0C809B0];
                v37[1] = 3221225472;
                v37[2] = sub_1D143D2B4;
                v37[3] = &unk_1E9228840;
                v38 = v23;
                v39 = v21;
                objc_msgSend(v24, "permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:completionHandler:", v25, v37);

                v26 = v38;
              }
              else
              {
                v49 = v21;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "moveMessagesInChatsWithGUIDsToRecentlyDeleted:deleteDate:", v27, v34);

                -[IMDRelayDeletionController _updateLastMessageTimeStampForChat:broadcaster:](self, "_updateLastMessageTimeStampForChat:broadcaster:", v19, v23);
                v48 = v21;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "movedMessagesToRecentlyDeletedForChatsWithGUIDs:queryID:", v26, 0);
              }

              objc_msgSend(v19, "setDeletingIncomingMessages:", v13);
              ++v18;
            }
            while (v16 != v18);
            v15 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
            v16 = v15;
          }
          while (v15);
        }

        v8 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v31);
  }

}

- (void)deleteMessagesForCommandDictionary:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = v7;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Deleting %@: messages", (uint8_t *)&v25, 0xCu);

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPermanentDelete"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chatForMessageGUID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDRelayDeletionController broadcasterForChatListenersForService:withBlackholeStatus:](self, "broadcasterForChatListenersForService:withBlackholeStatus:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDRelayDeletionController broadcasterForChatListenersForService:withBlackholeStatus:](self, "broadcasterForChatListenersForService:withBlackholeStatus:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = IMOSLoggingEnabled(v17);
  if ((v9 & 1) != 0)
  {
    if (v18)
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v25 = 138412290;
        v26 = v5;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Permanently deleting messages with GUID %@: ", (uint8_t *)&v25, 0xCu);
      }

    }
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v20, "deleteMessageGUIDs:", v5);
  }
  else
  {
    if (v18)
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v25 = 138412290;
        v26 = v5;
        _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Recoverably deleting messages with GUID %@: ", (uint8_t *)&v25, 0xCu);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recoverableDeleteDate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v20))
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v25 = 138412290;
        v26 = v20;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Recently Deleted | messages delete date: %@", (uint8_t *)&v25, 0xCu);
      }

    }
    -[IMDRelayDeletionController chatRegistry](self, "chatRegistry");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "moveMessagesWithGUIDsToRecentlyDeleted:deleteDate:", v5, v20);

  }
  -[IMDRelayDeletionController _updateLastMessageTimeStampForChat:broadcaster:](self, "_updateLastMessageTimeStampForChat:broadcaster:", v12, v14);
  objc_msgSend(v14, "historicalMessageGUIDsDeleted:chatGUIDs:queryID:", v5, 0, 0);
  objc_msgSend(v16, "historicalMessageGUIDsDeleted:chatGUIDs:queryID:", v5, 0, 0);

}

- (void)deleteMessagePartsForCommandDictionary:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  id obj;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("parts"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v33;
  if (objc_msgSend(v33, "count"))
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("isPermanentDelete"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (!v5)
    {
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("recoverableDeleteDate"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled(v34))
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = objc_msgSend(v33, "count");
          objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v50 = v9;
          v51 = 2112;
          v52 = v10;
          _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Recently Deleted | Deleting message parts from %lu messages: %@", buf, 0x16u);

        }
      }
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      obj = v33;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v11)
      {
        v37 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v45 != v37)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("messageGuid"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("deleteSubject"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "BOOLValue");

            +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "messageWithGUID:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              v42 = 0;
              v43 = 0;
              +[IMDDeletePartsHelper _convertDeletedPartsDict:toIndexSet:toMap:](IMDDeletePartsHelper, "_convertDeletedPartsDict:toIndexSet:toMap:", v13, &v43, &v42);
              v20 = v43;
              v21 = v42;
              if (objc_msgSend(v20, "count"))
              {
                objc_msgSend(MEMORY[0x1E0D39918], "_messageItemWithIndexesDeleted:subRangesToDeleteMapping:deleteSubject:deleteTransferCallback:createItemCallback:fromMessageItem:", v20, v21, v16, 0, 0, v18);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (IMOSLoggingEnabled(v22))
                {
                  OSLogHandleForIMFoundationCategory();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v50 = (uint64_t)v18;
                    v51 = 2112;
                    v52 = v22;
                    _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Recently Deleted | Removed parts from old item %@, got new item: %@", buf, 0x16u);
                  }

                }
                objc_msgSend(v18, "body");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v38[0] = MEMORY[0x1E0C809B0];
                v38[1] = 3221225472;
                v38[2] = sub_1D143DE24;
                v38[3] = &unk_1E9228868;
                v39 = v20;
                v40 = v18;
                v41 = v34;
                objc_msgSend(v24, "__im_visitMessageParts:", v38);

                +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "chatForMessageGUID:", v14);
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v26, "service");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[IMDRelayDeletionController broadcasterForChatListenersForService:](self, "broadcasterForChatListenersForService:", v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                -[IMDRelayDeletionController _updateLastMessageTimeStampForChat:broadcaster:](self, "_updateLastMessageTimeStampForChat:broadcaster:", v26, v28);
                objc_msgSend(v22, "accountID");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "account:chat:style:chatProperties:messageUpdated:", v29, 0, 0, 0, v22);

              }
              else if (IMOSLoggingEnabled(0))
              {
                OSLogHandleForIMFoundationCategory();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v50 = (uint64_t)v14;
                  _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "IMDRelayDeletionController: Recently Deleted | did not find indexes to delete at for GUID: %@", buf, 0xCu);
                }

              }
            }
            else if (IMOSLoggingEnabled(v19))
            {
              OSLogHandleForIMFoundationCategory();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v50 = (uint64_t)v14;
                _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "IMDRelayDeletionController: Recently Deleted | could not find messageItem for GUID: %@", buf, 0xCu);
              }

            }
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v11);
      }

      goto LABEL_39;
    }
    v3 = v33;
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "IMDRelayDeletionController: Recently Deleted | Received permanent delete command. This is unsupported", buf, 2u);
      }
LABEL_6:

LABEL_39:
      v3 = v33;
    }
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "IMDRelayDeletionController: Recently Deleted | Received empty parts-mardid command", buf, 2u);
    }
    goto LABEL_6;
  }

}

- (void)_handleDeleteCommandWithMessageDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDRelayDeletionController deleteChatsForCommandDictionary:](self, "deleteChatsForCommandDictionary:", v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("chat-clear"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        -[IMDRelayDeletionController _chatsForDeleteAndRecoveryChatMetadataDictionary:](self, "_chatsForDeleteAndRecoveryChatMetadataDictionary:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
        {
          v11 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v10, "arrayByApplyingSelector:", sel_guid);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setWithArray:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          -[IMDRelayDeletionController _doClearChats:](self, "_doClearChats:", v13);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    -[IMDRelayDeletionController deleteMessagesForCommandDictionary:](self, "deleteMessagesForCommandDictionary:", v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parts"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
    -[IMDRelayDeletionController deleteMessagePartsForCommandDictionary:](self, "deleteMessagePartsForCommandDictionary:", v4);

}

- (void)recoverChatsForCommandDictionary:(id)a3
{
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("recoverChatMetadataArray"));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[IMDRelayDeletionController _chatsForDeleteAndRecoveryChatMetadataDictionary:](self, "_chatsForDeleteAndRecoveryChatMetadataDictionary:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "count"))
        {
          objc_msgSend(v6, "arrayByApplyingSelector:", sel_guid);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDRelayDeletionController chatRegistry](self, "chatRegistry");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "recoverMessagesWithChatGUIDs:", v21);

          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v8 = v6;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v9; ++j)
              {
                if (*(_QWORD *)v24 != v10)
                  objc_enumerationMutation(v8);
                v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
                objc_msgSend(v12, "service");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                -[IMDRelayDeletionController broadcasterForChatListenersForService:withBlackholeStatus:](self, "broadcasterForChatListenersForService:withBlackholeStatus:", v13, 0);
                v14 = (void *)objc_claimAutoreleasedReturnValue();

                -[IMDRelayDeletionController _updateLastMessageTimeStampForChat:broadcaster:](self, "_updateLastMessageTimeStampForChat:broadcaster:", v12, v14);
                objc_msgSend(v12, "setDeletingIncomingMessages:", 0);

              }
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v9);
          }

          -[IMDRelayDeletionController _groupChatsByService:](self, "_groupChatsByService:", v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = sub_1D143E49C;
          v22[3] = &unk_1E9228890;
          v22[4] = self;
          objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v22);

        }
        else if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v5;
            _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "IMDRelayDeletionController | Recovery: did not find any chats for chat metadata %@", buf, 0xCu);
          }

        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v20);
  }

}

- (id)_chatsForDeleteAndRecoveryChatMetadataDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("guid"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("groupID"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("ptcpts"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v49 = (uint64_t)v38;
      v50 = 2112;
      v51 = v37;
      v52 = 2112;
      v53 = v39;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Finding chats for delete or recovery using guid %@ groupID %@ participants %@", buf, 0x20u);
    }

  }
  -[IMDRelayDeletionController chatRegistry](self, "chatRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "existingChatWithGUID:", v38);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "service");
  v8 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v8;
  if (v7)
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "guid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v49 = (uint64_t)v10;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Found chat with specific guid %@ for chat metadata", buf, 0xCu);

      }
    }
    objc_msgSend(v7, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

  }
  -[IMDRelayDeletionController chatRegistry](self, "chatRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "existingChatsWithGroupID:", v37);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  if (v14)
  {
    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = objc_msgSend(v13, "count");
        *(_DWORD *)buf = 134218498;
        v49 = v16;
        v50 = 2112;
        v51 = v37;
        v52 = 2112;
        v53 = v13;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Found %llu chats with specific group ID %@ for chat metadata: %@", buf, 0x20u);
      }

    }
    objc_msgSend(v13, "arrayByApplyingSelector:", sel_guid);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v17);

  }
  if ((unint64_t)objc_msgSend(v39, "count") >= 2)
  {
    -[IMDRelayDeletionController chatRegistry](self, "chatRegistry");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "existingChatsForIDs:onService:style:", v39, v36, 43);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = sub_1D143EB7C;
    v45[3] = &unk_1E92288B8;
    v46 = v36;
    objc_msgSend(v19, "__imArrayByFilteringWithBlock:", v45);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "count");
    if (v21)
    {
      if (IMOSLoggingEnabled(v21))
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = objc_msgSend(v20, "count");
          *(_DWORD *)buf = 134218498;
          v49 = v23;
          v50 = 2112;
          v51 = v39;
          v52 = 2112;
          v53 = v20;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Found %llu chats with handles: %@ chats: %@", buf, 0x20u);
        }

      }
      objc_msgSend(v20, "arrayByApplyingSelector:", sel_guid);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v24);

    }
  }
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v26 = v4;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v42;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v26);
        v30 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v29);
        -[IMDRelayDeletionController chatRegistry](self, "chatRegistry");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "existingChatWithGUID:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
          objc_msgSend(v25, "addObject:", v32);

        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v27);
  }

  if (IMOSLoggingEnabled(v33))
  {
    OSLogHandleForIMFoundationCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v49 = (uint64_t)v25;
      v50 = 2112;
      v51 = v38;
      _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "Found %llu chats for delete command with guid %@", buf, 0x16u);
    }

  }
  return v25;
}

- (void)_doClearChats:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  __int128 v27;
  id obj;
  id v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v34;
    v10 = 45;
    *(_QWORD *)&v8 = 138412290;
    v27 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[IMDRelayDeletionController chatRegistry](self, "chatRegistry", v27);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "existingChatWithGUID:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v14, "chatIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v16);

          objc_msgSend(v14, "serviceName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v17);

          v10 = objc_msgSend(v14, "style");
          objc_msgSend(v6, "addObject:", v14);
        }
        else if (IMOSLoggingEnabled(v15))
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v27;
            v38 = v12;
            _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Handling chat-clear, could not find chat by GUID: %@", buf, 0xCu);
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v7);
  }
  else
  {
    v10 = 45;
  }

  if (IMOSLoggingEnabled(v19))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v29;
      v39 = 2112;
      v40 = v5;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "clearing messages for chat IDS:%@ on services:%@", buf, 0x16u);
    }

  }
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "deleteMessagesWithChatIdentifiers:style:onServices:", v29, v10, v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_1D143F06C;
  v31[3] = &unk_1E92288B8;
  v32 = v22;
  v24 = v22;
  objc_msgSend(v6, "__imArrayByFilteringWithBlock:", v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDRelayDeletionController _groupChatsByService:](self, "_groupChatsByService:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v23;
  v30[1] = 3221225472;
  v30[2] = sub_1D143F0B0;
  v30[3] = &unk_1E9228890;
  v30[4] = self;
  objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v30);

}

- (id)_groupChatsByService:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "serviceName", (_QWORD)v22);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v10, "guid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v10, "serviceName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15)
              v17 = v15;
            else
              v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v18 = v17;

            objc_msgSend(v10, "guid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v19);

            objc_msgSend(v10, "serviceName");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v20);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_blocklistIfNeededForChatDict:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wasReportedAsJunk"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("groupID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D39868], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "blocklistGroupId:", v6);

      if (IMOSLoggingEnabled(v8))
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = 138412290;
          v11 = v6;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Blocklisted GroupID: %@", (uint8_t *)&v10, 0xCu);
        }
LABEL_10:

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
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "IMDRelayDeletionController | Expected to blocklist chat for chatDict: %@ but groupID nil", (uint8_t *)&v10, 0xCu);
      }
      goto LABEL_10;
    }

  }
}

- (void)_updateLastMessageTimeStampForChat:(id)a3 broadcaster:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  NSObject *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastMessageForChatWithRowID:", objc_msgSend(v5, "rowID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLastMessage:", v9);

    objc_msgSend(v5, "lastMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "lastMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "time");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      objc_msgSend(v5, "setLastMessageTimeStampOnLoad:", (uint64_t)v13);

    }
    else
    {
      objc_msgSend(v5, "setLastMessageTimeStampOnLoad:", 0);
    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isAVLessSharePlayEnabled");

    if (v16)
    {
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastTUConversationItemForChat:", v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v19, "time");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v19, "time");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setLastTUConversationCreatedDate:", v21);

        }
        else
        {
          IMLogHandleForCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            sub_1D1666194((uint64_t)v19, v22);

        }
      }
      else
      {
        objc_msgSend(v5, "setLastTUConversationCreatedDate:", 0);
      }

    }
    if (IMOSLoggingEnabled(v17))
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "guid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "lastMessage");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "time");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSinceReferenceDate");
        objc_msgSend(v25, "numberWithDouble:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138412546;
        v31 = v24;
        v32 = 2112;
        v33 = v28;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Recently Deleted | IMDChat: %@, updating last message timestamp on load: %@", (uint8_t *)&v30, 0x16u);

      }
    }
    objc_msgSend(v5, "guid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat:lastMessageTimeStampOnLoadUpdated:", v29, (double)objc_msgSend(v5, "lastMessageTimeStampOnLoad"));

  }
  else if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Recently Deleted | _updateLastMessageTimeStampForChat received nil chat", (uint8_t *)&v30, 2u);
    }

  }
}

- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4
{
  id v6;
  NSObject *v7;
  IMMultiQueue *incomingMessageMultiQueue;
  IMMultiQueue *v9;
  IMMultiQueue **p_incomingMessageMultiQueue;
  IMMultiQueue *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = CFSTR("IMDRelayDeletionController");
      v14 = 2048;
      v15 = a4;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, " Enqueued item for key: %@    timeout: %f", (uint8_t *)&v12, 0x16u);
    }

  }
  incomingMessageMultiQueue = self->_incomingMessageMultiQueue;
  if (!incomingMessageMultiQueue)
  {
    v9 = (IMMultiQueue *)objc_alloc_init(MEMORY[0x1E0D36A78]);
    v11 = self->_incomingMessageMultiQueue;
    p_incomingMessageMultiQueue = &self->_incomingMessageMultiQueue;
    *p_incomingMessageMultiQueue = v9;

    incomingMessageMultiQueue = *p_incomingMessageMultiQueue;
  }
  -[IMMultiQueue addBlock:withTimeout:forKey:description:](incomingMessageMultiQueue, "addBlock:withTimeout:forKey:description:", v6, CFSTR("IMDRelayDeletionController"), 0, a4);

}

- (IMMultiQueue)incomingMessageMultiQueue
{
  return self->_incomingMessageMultiQueue;
}

- (void)setIncomingMessageMultiQueue:(id)a3
{
  objc_storeStrong((id *)&self->_incomingMessageMultiQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingMessageMultiQueue, 0);
}

@end
