@implementation IMReadReceiptProcessingPipelineComponent

- (IMReadReceiptProcessingPipelineComponent)initWithMessageStore:(id)a3 chatRegistry:(id)a4 recents:(id)a5 IDSService:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  IMReadReceiptProcessingPipelineComponent *v15;
  IMReadReceiptProcessingPipelineComponent *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IMReadReceiptProcessingPipelineComponent;
  v15 = -[IMReadReceiptProcessingPipelineComponent init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_messageStore, a3);
    objc_storeStrong((id *)&v16->_chatRegistry, a4);
    objc_storeStrong((id *)&v16->_recents, a5);
    objc_storeStrong((id *)&v16->_service, a6);
  }

  return v16;
}

- (id)runIndividuallyWithInput:(id)a3
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  IMDRecentsController *recents;
  void *v42;
  IMDRecentsController *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  int v50;
  void *v51;
  id v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  const __CFString *v67;
  __int16 v68;
  const __CFString *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  if (IMOSLoggingEnabled(v52))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v52, "GUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v65 = (uint64_t)v4;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "<IMReadReceiptProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);

    }
  }
  v5 = IMGetCachedDomainBoolForKey();
  if ((_DWORD)v5)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v52, "GUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v65 = (uint64_t)v7;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "    Ignoring read receipt for message: %@", buf, 0xCu);

      }
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v52);
  }
  else
  {
    v9 = objc_msgSend(v52, "isFromDefaultPairedDevice");
    v10 = objc_msgSend(v52, "isFromMe");
    v50 = v10;
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v52, "GUID");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        v14 = CFSTR("NO");
        if (v50)
          v15 = CFSTR("YES");
        else
          v15 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        v65 = v12;
        v66 = 2112;
        v67 = v15;
        if (v9)
          v14 = CFSTR("YES");
        v68 = 2112;
        v69 = v14;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Received read receipt for: %@ from me: %@ isDefaultPairedDevice: %@", buf, 0x20u);

      }
    }
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v52, "GUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDMessageStore chatsForMessageGUID:](self->_messageStore, "chatsForMessageGUID:", v17);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "count"))
    {
      v18 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v52, "timestamp");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "__im_iMessageDateFromTimeStamp:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
      {
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v21 = v51;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
        v23 = v22;
        if (v22)
        {
          v24 = *(_QWORD *)v59;
          while (2)
          {
            v25 = 0;
            do
            {
              if (*(_QWORD *)v59 != v24)
                objc_enumerationMutation(v21);
              v26 = *(const __CFString **)(*((_QWORD *)&v58 + 1) + 8 * v25);
              if (IMOSLoggingEnabled(v22))
              {
                OSLogHandleForIMFoundationCategory();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v65 = (uint64_t)v17;
                  v66 = 2112;
                  v67 = v26;
                  _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Found chat to mark as read for messageID: %@ chat: %@", buf, 0x16u);
                }

              }
              -[IMReadReceiptProcessingPipelineComponent _markMessagesUpToGUID:forChat:isFromMe:date:](self, "_markMessagesUpToGUID:forChat:isFromMe:date:", v17, v26, 0, v20);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addObjectsFromArray:", v28);

              v22 = objc_msgSend(v16, "count");
              if (!v22)
              {
                v22 = -[IMDMessageStore hasStoredMessageWithGUID:](self->_messageStore, "hasStoredMessageWithGUID:", v17);
                if (!(_DWORD)v22)
                {
                  -[IDSService _IMDTrackMetric:ForMessageGUID:](self->_service, "_IMDTrackMetric:ForMessageGUID:", 10401, v17);
                  -[IMDMessageStore addMissingMessageReadReceipt:](self->_messageStore, "addMissingMessageReadReceipt:", v17);
                  v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v48 = (void *)objc_msgSend(v47, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 5, 0);
                  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v48);

                  goto LABEL_59;
                }
              }
              ++v25;
            }
            while (v23 != v25);
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
            v23 = v22;
            if (v22)
              continue;
            break;
          }
        }
      }
      else
      {
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v31 = v51;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        v33 = v32;
        if (v32)
        {
          v34 = *(_QWORD *)v55;
          do
          {
            v35 = 0;
            do
            {
              if (*(_QWORD *)v55 != v34)
                objc_enumerationMutation(v31);
              v36 = *(const __CFString **)(*((_QWORD *)&v54 + 1) + 8 * v35);
              if (IMOSLoggingEnabled(v32))
              {
                OSLogHandleForIMFoundationCategory();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v65 = (uint64_t)v17;
                  v66 = 2112;
                  v67 = v36;
                  _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "Found chat to mark as read for messageID: %@ chat: %@", buf, 0x16u);
                }

              }
              -[IMReadReceiptProcessingPipelineComponent _markMessagesUpToGUID:forChat:isFromMe:date:](self, "_markMessagesUpToGUID:forChat:isFromMe:date:", v17, v36, 1, v20);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addObjectsFromArray:", v38);

              ++v35;
            }
            while (v33 != v35);
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
            v33 = v32;
          }
          while (v32);
        }

        objc_msgSend(v52, "fromPushID");
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "fromIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (v21 && v39)
        {
          recents = self->_recents;
          objc_msgSend(v39, "_stripFZIDPrefix");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDRecentsController updateLatestActiveDestination:ForHandle:incomingType:](recents, "updateLatestActiveDestination:ForHandle:incomingType:", v21, v42, 1);

          v43 = self->_recents;
          IMSingleObjectArray();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDRecentsController noteRecentMessageForPeople:](v43, "noteRecentMessageForPeople:", v44);

        }
      }

      objc_msgSend(v52, "setMessageItems:", v16);
      objc_msgSend(v51, "firstObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setChat:", v45);

      if (v50)
      {
        -[IDSService _IMDTrackMetric:ForMessageGUID:](self->_service, "_IMDTrackMetric:ForMessageGUID:", 10400, v17);
        objc_msgSend(v51, "firstObject");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMReadReceiptProcessingPipelineComponent _donateReadEventForChat:](self, "_donateReadEventForChat:", v46);

      }
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v52);
    }
    else
    {
      if (v50 && !-[IMDMessageStore hasStoredMessageWithGUID:](self->_messageStore, "hasStoredMessageWithGUID:", v17))
      {
        -[IDSService _IMDTrackMetric:ForMessageGUID:](self->_service, "_IMDTrackMetric:ForMessageGUID:", 10401, v17);
        -[IMDMessageStore addMissingMessageReadReceipt:](self->_messageStore, "addMissingMessageReadReceipt:", v17);
      }
      v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v30 = (void *)objc_msgSend(v29, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 8, 0);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v30);

    }
LABEL_59:

  }
  return v8;
}

- (id)_markMessagesUpToGUID:(id)a3 forChat:(id)a4 isFromMe:(BOOL)a5 date:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  IMDMessageStore *messageStore;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  id v34;
  id v36;
  void *v37;
  void *v38;
  id v39;
  IMReadReceiptProcessingPipelineComponent *v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  _QWORD v54[3];

  v7 = a5;
  v54[1] = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v10 = a4;
  v11 = a6;
  v37 = v10;
  if (v10)
  {
    v40 = self;
    v39 = v11;
    messageStore = self->_messageStore;
    objc_msgSend(v10, "guid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDMessageStore markMessagesAsReadWithChatGUIDs:upToGUID:readDate:fromMe:](messageStore, "markMessagesAsReadWithChatGUIDs:upToGUID:readDate:fromMe:", v14, v36, v39, v7);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v38;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Found messages guids to mark as read: %@", buf, 0xCu);
      }

    }
    if (!objc_msgSend(v38, "count"))
    {
      obj = 0;
LABEL_40:

      v11 = v39;
      goto LABEL_41;
    }
    -[IMDMessageStore retractPostedNotificationsForMessageGUIDs:](self->_messageStore, "retractPostedNotificationsForMessageGUIDs:", v38);
    -[IMDMessageStore messagesWithGUIDs:](self->_messageStore, "messagesWithGUIDs:", v38);
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v17)
    {
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v47 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          if (v7)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "timeDelivered");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24 == 0;

            if (v25)
            {
              if (v39)
              {
                objc_msgSend(v23, "setTimeDelivered:");
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setTimeDelivered:", v26);

              }
              v20 = 1;
            }
          }
          if (objc_msgSend(v23, "errorCode"))
          {
            objc_msgSend(v23, "setErrorCode:", 0);
            v20 = 1;
          }
          objc_msgSend(v23, "timeRead");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "__im_nanosecondTimeInterval");

          if (v28 >= v18)
          {
            objc_msgSend(v23, "guid");
            v29 = objc_claimAutoreleasedReturnValue();

            v18 = v28;
            v19 = (void *)v29;
          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v17);

      if ((v20 & 1) == 0)
        goto LABEL_37;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v30 = obj;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v43 != v32)
              objc_enumerationMutation(v30);
            v34 = -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:](v40->_messageStore, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j), 0, 1, 0, 0);
          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        }
        while (v31);
      }
    }
    else
    {
      v19 = 0;
      v18 = 0;
    }

LABEL_37:
    if (!v7)
    {
      objc_msgSend(v37, "updateLastReadMessageTimeStampIfNeeded:", v18);
      objc_msgSend(v37, "updateLastSeenMessageGuidIfNeeded:", v19);
    }
    -[IMDChatRegistry updateStateForChat:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:](v40->_chatRegistry, "updateStateForChat:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:", v37, 0, 0, 1);

    goto LABEL_40;
  }
  obj = 0;
LABEL_41:

  return obj;
}

- (void)_donateReadEventForChat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "chatIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    if (objc_msgSend(v6, "length"))
    {
      IMBiomeQueue();
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D1456D5C;
      block[3] = &unk_1E92287A0;
      v12 = v6;
      dispatch_async(v7, block);

    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "guid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v10;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Cannot donate read receipt due to nil chat identifier for chat %@", buf, 0xCu);

      }
    }

  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Cannot donate read receipt due to nil chat", buf, 2u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_chatRegistry, 0);
  objc_storeStrong((id *)&self->_messageStore, 0);
}

@end
