@implementation IMSimulatedChat

- (IMSimulatedChat)initWithIncomingIDs:(id)a3 messageIDOffset:(unint64_t)a4 account:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  IMSimulatedChat *v18;
  IMSimulatedChat *v19;
  uint64_t v20;
  NSMutableArray *simulatedAttachments;
  uint64_t v22;
  NSMutableDictionary *guidToMessageItemNeedingAckMap;
  int v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (qword_1EE65F558 != -1)
    dispatch_once(&qword_1EE65F558, &unk_1E471D818);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v9, "imHandleWithID:alreadyCanonical:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)IMSimulatedChat;
  BYTE2(v25) = 0;
  LOWORD(v25) = 0;
  if ((unint64_t)objc_msgSend(v10, "count") <= 1)
    v18 = -[IMChat _initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:](&v26, sel__initWithGUID_account_style_roomName_displayName_lastAddressedHandle_lastAddressedSIMID_items_participants_isFiltered_hasHadSuccessfulQuery_isRecovered_isDeletingIncomingMessages_, v17, v9, 45, 0, 0, 0, 0, 0, v10, 1, v25);
  else
    v18 = -[IMChat _initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:](&v26, sel__initWithGUID_account_style_roomName_displayName_lastAddressedHandle_lastAddressedSIMID_items_participants_isFiltered_hasHadSuccessfulQuery_isRecovered_isDeletingIncomingMessages_, v17, v9, 43, 0, 0, 0, 0, 0, v10, 1, v25);
  v19 = v18;

  if (v19)
  {
    objc_storeStrong((id *)&v19->_simulatedAccount, a5);
    v19->_currentMessageID = a4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    simulatedAttachments = v19->_simulatedAttachments;
    v19->_simulatedAttachments = (NSMutableArray *)v20;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    guidToMessageItemNeedingAckMap = v19->_guidToMessageItemNeedingAckMap;
    v19->_guidToMessageItemNeedingAckMap = (NSMutableDictionary *)v22;

  }
  return v19;
}

- (void)sendMessage:(id)a3
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  id v16;
  id obj;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  -[IMSimulatedChat _messagesToProcessFromMessage:](self, "_messagesToProcessFromMessage:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v20;
    *(_QWORD *)&v5 = 138412290;
    v15 = v5;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v16, "guid");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v15;
            v24 = v10;
            _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "sending demo message with messageGUID: %@", buf, 0xCu);

          }
        }
        v18.receiver = self;
        v18.super_class = (Class)IMSimulatedChat;
        -[IMChat sendMessage:](&v18, sel_sendMessage_, v8, v15);
        -[IMChat participants](self, "participants");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMSimulatedChat simulatedAccount](self, "simulatedAccount");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "loginHandle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMSimulatedChat _processMessage:receivingHandle:sendingHandle:](self, "_processMessage:receivingHandle:sendingHandle:", v8, v12, v14);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v4);
  }

}

- (void)receiveDemoMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "guid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "receiving demo message with messageGUID: %@", (uint8_t *)&v11, 0xCu);

    }
  }
  -[IMSimulatedChat simulatedAccount](self, "simulatedAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loginHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat participants](self, "participants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSimulatedChat _processMessage:receivingHandle:sendingHandle:](self, "_processMessage:receivingHandle:sendingHandle:", v4, v8, v10);

}

- (void)_processMessage:(id)a3 receivingHandle:(id)a4 sendingHandle:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  IMAttachment *v17;
  void *v18;
  IMAttachment *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  NSMutableDictionary *guidToMessageItemNeedingAckMap;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  dispatch_time_t v32;
  void *v33;
  id obj;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t i;
  void *v40;
  _QWORD block[5];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v36 = a4;
  v38 = a5;
  v33 = v8;
  -[IMSimulatedChat _messagesToProcessFromMessage:](self, "_messagesToProcessFromMessage:", v8);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v37)
  {
    v35 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v48 != v35)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "_imMessageItem");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        objc_msgSend(v40, "fileTransferGUIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v44;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v44 != v11)
                objc_enumerationMutation(v9);
              v13 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
              +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "transferForGUID:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              -[IMSimulatedChat simulatedAttachments](self, "simulatedAttachments");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = [IMAttachment alloc];
              objc_msgSend(v15, "localPath");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = -[IMAttachment initWithPath:guid:](v17, "initWithPath:guid:", v18, v13);
              objc_msgSend(v16, "addObject:", v19);

            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
          }
          while (v10);
        }

        -[IMSimulatedChat simulatedAccount](self, "simulatedAccount");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "loginHandle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v38, "isEqual:", v21);

        if (v22)
          v23 = 36869;
        else
          v23 = 36865;
        ++self->_currentMessageID;
        sub_1A20B4F64(v40, v23, -[IMSimulatedChat currentMessageID](self, "currentMessageID"), v38, v36, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        guidToMessageItemNeedingAckMap = self->_guidToMessageItemNeedingAckMap;
        objc_msgSend(v24, "guid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](guidToMessageItemNeedingAckMap, "setObject:forKeyedSubscript:", v24, v26);

        -[IMSimulatedChat delegate](self, "delegate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "simulatedChat:didSendMessage:", self, v24);

        if (-[IMSimulatedChat shouldUseTimedAck](self, "shouldUseTimedAck"))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "message");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "guid");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v52 = v29;
              v53 = 2112;
              v54 = v31;
              _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, "deliveryDelay: %@ for messageGUID: %@", buf, 0x16u);

            }
          }
          v32 = dispatch_time(0, 1000000000);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = sub_1A20B5610;
          block[3] = &unk_1E471E7C8;
          block[4] = self;
          v42 = v40;
          dispatch_after(v32, MEMORY[0x1E0C80D38], block);

        }
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v37);
  }

}

- (void)simulateMessageDeliveryForGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "simulateMessageDeliveryForGUID: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_guidToMessageItemNeedingAckMap, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[IMSimulatedChat _handleIncomingItem:](self, "_handleIncomingItem:", v6);
    -[IMSimulatedChat delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[IMSimulatedChat delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "simulatedChat:didHandleItem:", self, v6);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_guidToMessageItemNeedingAckMap, "removeObjectForKey:", v4);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Did not find messageItem for messageGUID: %@. Nothing to process", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (id)_messagesToProcessFromMessage:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hasDataDetectorResults"))
  {
    objc_msgSend(v4, "messagesBySeparatingRichLinks");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
          objc_msgSend(v4, "sender", (_QWORD)v17);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_updateSender:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v7);
    }

  }
  else
  {
    if (-[IMChat isStewieChat](self, "isStewieChat")
      && (objc_msgSend(v4, "text"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "string"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "lengthOfBytesUsingEncoding:", 4),
          v13,
          v12,
          v14 >= 0xA1))
    {
      objc_msgSend(v4, "messagesSeparatedByByteLength:", 160);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (id)v15;
  }

  return v5;
}

- (BOOL)_handleIncomingItem:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  void *v29;
  void *v30;
  id v31;
  id obj;
  objc_super v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v31;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Handling item: %@", buf, 0xCu);
    }

  }
  if (objc_msgSend(v31, "associatedMessageType") == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[IMItemsController _items](self, "_items");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (!v4)
      goto LABEL_32;
    v5 = *(_QWORD *)v40;
    while (1)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v40 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v31;
          v9 = v7;
          if (objc_msgSend(v9, "messageID"))
          {
            objc_msgSend(v9, "pluginSessionGUID");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "associatedMessageGUID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) == 0)
            {

              goto LABEL_18;
            }
            objc_msgSend(v9, "balloonBundleID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "balloonBundleID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "isEqualToString:", v13);

            if (v14)
            {
              if (objc_msgSend(v9, "associatedMessageType") == 3)
              {
                objc_msgSend(v9, "payloadData");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "addObject:", v10);
                goto LABEL_18;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v9, "associatedMessageType") == 2)
              {
                v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D396C8]), "initWithMessageItem:", v9);
                if (objc_msgSend(v9, "isFromMe"))
                {
                  -[IMSimulatedChat simulatedAccount](self, "simulatedAccount");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "loginHandle");
                }
                else
                {
                  -[IMChat participants](self, "participants");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "firstObject");
                }
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v9, "isFromMe") & 1) != 0)
                {
                  -[IMChat participants](self, "participants");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "firstObject");
                }
                else
                {
                  -[IMSimulatedChat simulatedAccount](self, "simulatedAccount");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "loginHandle");
                }
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "_updateContextWithSenderHandle:otherHandle:", v16, v18);

                objc_msgSend(v8, "associatedMessageGUID");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "setAssociatedMessageGUID:", v19);

                objc_msgSend(v10, "setAssociatedMessageType:", 3);
                objc_msgSend(v8, "breadcrumbText");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "setBody:", v20);

                objc_msgSend(v29, "addObject:", v10);
                objc_msgSend(v9, "payloadData");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "addObject:", v21);

LABEL_18:
              }
            }
          }

        }
        ++v6;
      }
      while (v4 != v6);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      v4 = v22;
      if (!v22)
      {
LABEL_32:

        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v23 = v29;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v36;
          do
          {
            v26 = 0;
            do
            {
              if (*(_QWORD *)v36 != v25)
                objc_enumerationMutation(v23);
              -[IMSimulatedChat _handleIncomingItem:](self, "_handleIncomingItem:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v26++));
            }
            while (v24 != v26);
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v24);
        }

        if (objc_msgSend(v30, "count"))
          objc_msgSend(v31, "setConsumedSessionPayloads:", v30);

        break;
      }
    }
  }
  v34.receiver = self;
  v34.super_class = (Class)IMSimulatedChat;
  v27 = -[IMChat _handleIncomingItem:](&v34, sel__handleIncomingItem_, v31);

  return v27;
}

- (id)chatIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[IMSimulatedChat simulatedChatIdentifier](self, "simulatedChatIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
    -[IMChat participants](self, "participants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMSimulatedChat setSimulatedChatIdentifier:](self, "setSimulatedChatIdentifier:", v7);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMSimulatedChat setSimulatedChatIdentifier:](self, "setSimulatedChatIdentifier:", v6);
    }

  }
  return -[IMSimulatedChat simulatedChatIdentifier](self, "simulatedChatIdentifier");
}

- (id)account
{
  return self->_simulatedAccount;
}

- (id)displayName
{
  return self->_simulatedDisplayName;
}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSString *simulatedDisplayName;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  NSString *v10;

  v4 = (NSString *)a3;
  simulatedDisplayName = self->_simulatedDisplayName;
  if (simulatedDisplayName != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](simulatedDisplayName, "isEqualToString:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      v8 = self->_simulatedDisplayName;
      self->_simulatedDisplayName = v7;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("__kIMChatDisplayNameChangedNotification"), self);

      v4 = v10;
    }
  }

}

- (int64_t)joinState
{
  return 3;
}

- (id)loadMessagesBeforeDate:(id)a3 limit:(unint64_t)a4 loadImmediately:(BOOL)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID", a3, a4, a5);
}

- (void)simulatedChat:(id)a3 didSendMessage:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  ++self->_currentMessageID;
  v5 = a4;
  v6 = -[IMSimulatedChat currentMessageID](self, "currentMessageID");
  -[IMChat participants](self, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSimulatedChat simulatedAccount](self, "simulatedAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "loginHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1A20B4F64(v5, 1, v6, v8, v10, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[IMSimulatedChat _handleIncomingItem:](self, "_handleIncomingItem:", v11);
}

- (void)simulatedDaemon:(id)a3 willSendBalloonPayload:(id)a4 attachments:(id)a5 messageGUID:(id)a6 bundleID:(id)a7
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  IMSimulatedChat *v29;
  id v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  -[IMSimulatedChat _messageWithGUID:](self, "_messageWithGUID:", a6);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    v28 = (void *)v12;
    v29 = self;
    v31 = v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v30 = v11;
    obj = v11;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v34;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v18);
          IMSafeTemporaryDirectory();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "URLByAppendingPathComponent:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "path");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "writeToFile:atomically:", v23, 1);
          +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "createNewOutgoingTransferWithLocalFileURL:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v26);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v16);
    }

    v13 = v28;
    v10 = v31;
    objc_msgSend(v28, "setPayloadData:", v31);
    objc_msgSend(v28, "setFileTransferGUIDs:", v14);
    -[IMSimulatedChat _handleIncomingItem:](v29, "_handleIncomingItem:", v28);
    -[IMSimulatedChat delegate](v29, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "simulatedChat:didSendMessage:", v29, v28);

    v11 = v30;
  }

}

- (id)_messageWithGUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char isKindOfClass;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[IMItemsController _items](self, "_items", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "guid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v4))
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
LABEL_12:

  return v6;
}

- (id)daemonController
{
  return 0;
}

- (id)beginObservingHandleStatuses
{
  return 0;
}

- (IMSimulatedChatDelegate)delegate
{
  return (IMSimulatedChatDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldUseTimedAck
{
  return self->_useTimedAck;
}

- (void)setUseTimedAck:(BOOL)a3
{
  self->_useTimedAck = a3;
}

- (IMSimulatedAccount)simulatedAccount
{
  return self->_simulatedAccount;
}

- (unint64_t)currentMessageID
{
  return self->_currentMessageID;
}

- (NSString)simulatedChatIdentifier
{
  return self->_simulatedChatIdentifier;
}

- (void)setSimulatedChatIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (NSMutableArray)simulatedAttachments
{
  return self->_simulatedAttachments;
}

- (NSString)simulatedDisplayName
{
  return self->_simulatedDisplayName;
}

- (void)setSimulatedDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (NSMutableDictionary)guidToMessageItemNeedingAckMap
{
  return self->_guidToMessageItemNeedingAckMap;
}

- (void)setGuidToMessageItemNeedingAckMap:(id)a3
{
  objc_storeStrong((id *)&self->_guidToMessageItemNeedingAckMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidToMessageItemNeedingAckMap, 0);
  objc_storeStrong((id *)&self->_simulatedDisplayName, 0);
  objc_storeStrong((id *)&self->_simulatedAttachments, 0);
  objc_storeStrong((id *)&self->_simulatedChatIdentifier, 0);
  objc_storeStrong((id *)&self->_simulatedAccount, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
