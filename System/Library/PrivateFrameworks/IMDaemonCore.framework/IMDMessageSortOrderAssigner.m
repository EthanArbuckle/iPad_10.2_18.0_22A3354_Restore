@implementation IMDMessageSortOrderAssigner

- (id)messageWithGUID:(id)a3
{
  return -[IMDMessageStore itemWithGUID:](+[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"), "itemWithGUID:", a3);
}

- (id)copyOfMessagesWithReplyToGUID:(id)a3
{
  IMDMessageStore *v3;

  v3 = +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  return (id)MEMORY[0x1E0DE7D20](v3, sel_messagesWithReplyToGUID_);
}

- (void)compareMessageToOtherMessagesWithSameReplyToGUIDAndAssignSortID:(id)a3 existingMessagesWithSameReplyToGUID:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = 0;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (!v7)
    goto LABEL_23;
  v8 = 0;
  v9 = *(_QWORD *)v22;
  do
  {
    v10 = 0;
    v11 = v8;
    do
    {
      if (*(_QWORD *)v22 != v9)
        objc_enumerationMutation(a4);
      v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
      if (objc_msgSend(v12, "isOlderThanItem:", a3))
      {
        v8 = v12;
        if (v11)
        {
          if (objc_msgSend(v11, "isOlderThanItem:", v12))
            v8 = v12;
          else
            v8 = v11;
        }
      }
      else if (objc_msgSend((id)objc_msgSend(v12, "time"), "compare:", objc_msgSend(a3, "time")))
      {
        v8 = v11;
      }
      else if (!objc_msgSend(a3, "messageID")
             || (v13 = objc_msgSend(v12, "messageID"), v8 = v11, v13 < objc_msgSend(a3, "messageID")))
      {
        v8 = v12;
      }
      if (!v6 || objc_msgSend(v12, "isOlderThanItem:", v6))
        v6 = v12;
      ++v10;
      v11 = v8;
    }
    while (v7 != v10);
    v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  }
  while (v7);
  if (v8)
  {
    v14 = objc_msgSend(v8, "sortID");
  }
  else
  {
LABEL_23:
    v15 = -[IMDMessageSortOrderAssigner messageWithGUID:](self, "messageWithGUID:", objc_msgSend(a3, "replyToGUID"));
    if (!v15)
    {
      v14 = objc_msgSend(v6, "sortID");
      v16 = v14 - 50;
      goto LABEL_27;
    }
    v14 = objc_msgSend(v15, "sortID");
  }
  v16 = v14 + 50;
LABEL_27:
  if (IMOSLoggingEnabled(v14))
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend(a3, "guid");
      v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
      *(_DWORD *)buf = 136315650;
      v26 = "-[IMDMessageSortOrderAssigner compareMessageToOtherMessagesWithSameReplyToGUIDAndAssignSortID:existingMessag"
            "esWithSameReplyToGUID:]";
      v27 = 2112;
      v28 = v18;
      v29 = 2112;
      v30 = v19;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "%s assigning %@ sortID %@", buf, 0x20u);
    }
  }
  objc_msgSend(a3, "setSortID:", v16);
}

- (void)assignSortIDToIncomingMessageWithNoExistingMessagesWithSameReplyToGUID:(id)a3 onChat:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = -[IMDMessageSortOrderAssigner messageWithGUID:](self, "messageWithGUID:", objc_msgSend(a3, "replyToGUID"));
  v8 = -[IMDMessageSortOrderAssigner copyOfMessagesWithReplyToGUID:](self, "copyOfMessagesWithReplyToGUID:", objc_msgSend(a3, "guid"));
  if (!objc_msgSend(v8, "count")
    || (v22 = 0u,
        v23 = 0u,
        v20 = 0u,
        v21 = 0u,
        (v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v30, 16)) == 0))
  {
    if (!v7)
    {
LABEL_22:
      v15 = objc_msgSend((id)objc_msgSend(a4, "lastMessage"), "sortID");
      goto LABEL_23;
    }
LABEL_21:
    v15 = objc_msgSend(v7, "sortID");
LABEL_23:
    v16 = v15 + 100;
    goto LABEL_24;
  }
  v10 = 0;
  v11 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v21 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      if (!v10 || objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "isOlderThanItem:", v10))
        v10 = v13;
    }
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  }
  while (v9);
  if (v10)
    v14 = v7 == 0;
  else
    v14 = 1;
  if (v14)
  {
    if (!v7)
    {
      if (v10)
      {
        v15 = objc_msgSend(v10, "sortID");
        v16 = v15 - 50;
        goto LABEL_24;
      }
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  v15 = objc_msgSend(v7, "sortID");
  v16 = v15 + 50;
LABEL_24:
  if (IMOSLoggingEnabled(v15))
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend(a3, "guid");
      v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
      *(_DWORD *)buf = 136315650;
      v25 = "-[IMDMessageSortOrderAssigner assignSortIDToIncomingMessageWithNoExistingMessagesWithSameReplyToGUID:onChat:]";
      v26 = 2112;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "%s assigning %@ sortID %@", buf, 0x20u);
    }
  }
  objc_msgSend(a3, "setSortID:", v16);
  if (v8)

}

- (void)persistMessage:(id)a3
{
  -[IMDMessageStore storeItem:forceReplace:](+[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"), "storeItem:forceReplace:", a3, 0);
}

- (void)assignSortIDToIncomingMessage:(id)a3 onChat:(id)a4
{
  id v7;

  v7 = -[IMDMessageSortOrderAssigner copyOfMessagesWithReplyToGUID:](self, "copyOfMessagesWithReplyToGUID:", objc_msgSend(a3, "replyToGUID"));
  if (objc_msgSend(v7, "count"))
    -[IMDMessageSortOrderAssigner compareMessageToOtherMessagesWithSameReplyToGUIDAndAssignSortID:existingMessagesWithSameReplyToGUID:](self, "compareMessageToOtherMessagesWithSameReplyToGUIDAndAssignSortID:existingMessagesWithSameReplyToGUID:", a3, v7);
  else
    -[IMDMessageSortOrderAssigner assignSortIDToIncomingMessageWithNoExistingMessagesWithSameReplyToGUID:onChat:](self, "assignSortIDToIncomingMessageWithNoExistingMessagesWithSameReplyToGUID:onChat:", a3, a4);
  if (v7)

}

- (void)assignAndPersistSortIDForIncomingMessage:(id)a3 onChat:(id)a4
{
  -[IMDMessageSortOrderAssigner assignSortIDToIncomingMessage:onChat:](self, "assignSortIDToIncomingMessage:onChat:", a3, a4);
  MEMORY[0x1E0DE7D20](self, sel_persistMessage_);
}

@end
