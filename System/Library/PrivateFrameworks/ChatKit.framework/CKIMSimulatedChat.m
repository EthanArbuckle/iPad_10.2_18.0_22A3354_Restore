@implementation CKIMSimulatedChat

- (CKIMSimulatedChat)initWithIncomingIDs:(id)a3 outgoingID:(id)a4 messageIDOffset:(unint64_t)a5 service:(id)a6
{
  id v10;
  id v11;
  id v12;
  CKIMSimulatedChat *v13;
  CKIMSimulatedChat *v14;
  uint64_t v15;
  NSString *simulatedGUID;
  CKIMSimulatedAccount *v17;
  CKIMSimulatedAccount *simulatedAccount;
  uint64_t v19;
  IMHandle *outgoingHandle;
  uint64_t v21;
  NSArray *incomingHandles;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  NSArray *v28;
  void *v29;
  uint64_t v30;
  NSArray *v31;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v39.receiver = self;
  v39.super_class = (Class)CKIMSimulatedChat;
  v13 = -[IMItemsController init](&v39, sel_init);
  v14 = v13;
  if (initWithIncomingIDs_outgoingID_messageIDOffset_service__onceToken == -1)
  {
    if (!v13)
      goto LABEL_11;
  }
  else
  {
    dispatch_once(&initWithIncomingIDs_outgoingID_messageIDOffset_service__onceToken, &__block_literal_global_175);
    if (!v14)
      goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v15 = objc_claimAutoreleasedReturnValue();
  simulatedGUID = v14->_simulatedGUID;
  v14->_simulatedGUID = (NSString *)v15;

  v33 = v12;
  v17 = -[CKIMSimulatedAccount initWithService:]([CKIMSimulatedAccount alloc], "initWithService:", v12);
  simulatedAccount = v14->_simulatedAccount;
  v14->_simulatedAccount = v17;

  -[CKIMSimulatedAccount imHandleWithID:alreadyCanonical:](v14->_simulatedAccount, "imHandleWithID:alreadyCanonical:", v11, 0);
  v19 = objc_claimAutoreleasedReturnValue();
  outgoingHandle = v14->_outgoingHandle;
  v14->_outgoingHandle = (IMHandle *)v19;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v21 = objc_claimAutoreleasedReturnValue();
  incomingHandles = v14->_incomingHandles;
  v14->_incomingHandles = (NSArray *)v21;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v34 = v10;
  v23 = v10;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(v23);
        v28 = v14->_incomingHandles;
        -[CKIMSimulatedAccount imHandleWithID:alreadyCanonical:](v14->_simulatedAccount, "imHandleWithID:alreadyCanonical:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray arrayByAddingObject:](v28, "arrayByAddingObject:", v29);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v14->_incomingHandles;
        v14->_incomingHandles = (NSArray *)v30;

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v25);
  }

  -[CKIMSimulatedAccount setLoginHandle:](v14->_simulatedAccount, "setLoginHandle:", v14->_outgoingHandle);
  v10 = v34;
  v14->_currentMessageID = a5;
  v12 = v33;
LABEL_11:

  return v14;
}

void __76__CKIMSimulatedChat_initWithIncomingIDs_outgoingID_messageIDOffset_service___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D35918], "serviceWithInternalName:", *MEMORY[0x1E0D38F68]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0D36200];
  v3[0] = &unk_1E286F928;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setServiceProperties:", v1);

}

- (void)_sendMessage:(id)a3 adjustingSender:(BOOL)a4 shouldQueue:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKIMSimulatedChat;
  v8 = a3;
  -[CKIMSimulatedChat _sendMessage:adjustingSender:shouldQueue:](&v12, sel__sendMessage_adjustingSender_shouldQueue_, v8, v6, v5);
  objc_msgSend(v8, "_imMessageItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isTypingMessage"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__CKIMSimulatedChat__sendMessage_adjustingSender_shouldQueue___block_invoke;
    v10[3] = &unk_1E274A108;
    v10[4] = self;
    v11 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

void __62__CKIMSimulatedChat__sendMessage_adjustingSender_shouldQueue___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat:didSendMessage:finished:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

- (void)sendMessage:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t j;
  void *v18;
  void *v19;
  dispatch_time_t v20;
  id v21;
  void *v22;
  id obj;
  _QWORD block[4];
  id v25;
  CKIMSimulatedChat *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CKIMSimulatedChat;
  -[CKIMSimulatedChat sendMessage:](&v35, sel_sendMessage_, v4);
  if (objc_msgSend(v4, "hasDataDetectorResults"))
  {
    objc_msgSend(v4, "messagesBySeparatingRichLinks", v4);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          -[CKIMSimulatedChat outgoingHandle](self, "outgoingHandle");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_updateSender:", v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v7);
    }

  }
  else
  {
    v37 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v5;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    v15 = MEMORY[0x1E0C809B0];
    v16 = MEMORY[0x1E0C80D38];
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "_imMessageItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKIMSimulatedChat delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "chat:didSendMessage:finished:", self, v18, objc_msgSend(v18, "isTypingMessage") ^ 1);

        ++self->_currentMessageID;
        v20 = dispatch_time(0, 1000000000);
        block[0] = v15;
        block[1] = 3221225472;
        block[2] = __33__CKIMSimulatedChat_sendMessage___block_invoke;
        block[3] = &unk_1E274A108;
        v25 = v18;
        v26 = self;
        v21 = v18;
        dispatch_after(v20, v16, block);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v13);
  }

}

void __33__CKIMSimulatedChat_sendMessage___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "currentMessageID");
  objc_msgSend(*(id *)(a1 + 40), "outgoingHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "incomingHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  messageItemCopyForMessageItem(v2, 36869, v3, v4, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_handleIncomingItem:", v7);
}

- (BOOL)_handleIncomingItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  char v20;
  uint64_t outgoingHandle;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  BOOL v32;
  void *v34;
  void *v35;
  CKIMSimulatedChat *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  objc_super v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "associatedMessageType") != 2)
    goto LABEL_42;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = self;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[IMItemsController _items](self, "_items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (!v6)
    goto LABEL_32;
  v7 = v6;
  v8 = *(_QWORD *)v46;
  v38 = v5;
  v39 = *(_QWORD *)v46;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v46 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v4;
        v12 = v10;
        if (objc_msgSend(v12, "messageID"))
        {
          objc_msgSend(v12, "pluginSessionGUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "associatedMessageGUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isEqualToString:", v14) & 1) == 0)
          {

            goto LABEL_14;
          }
          v15 = v4;
          objc_msgSend(v12, "balloonBundleID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "balloonBundleID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if (v18)
          {
            if (objc_msgSend(v12, "associatedMessageType") == 3)
            {
              objc_msgSend(v12, "payloadData");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addObject:", v13);
              v4 = v15;
              v5 = v38;
              v8 = v39;
              goto LABEL_14;
            }
            objc_opt_class();
            v4 = v15;
            v8 = v39;
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "associatedMessageType") != 2)
            {
              v5 = v38;
            }
            else
            {
              v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D396C8]), "initWithMessageItem:", v12);
              v19 = objc_msgSend(v12, "isFromMe");
              v20 = v19;
              v5 = v38;
              if (v19)
              {
                outgoingHandle = (uint64_t)v36->_outgoingHandle;
              }
              else
              {
                -[NSArray firstObject](v36->_incomingHandles, "firstObject");
                outgoingHandle = objc_claimAutoreleasedReturnValue();
                v34 = (void *)outgoingHandle;
              }
              if ((objc_msgSend(v12, "isFromMe", v34) & 1) != 0)
              {
                -[NSArray firstObject](v36->_incomingHandles, "firstObject");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "_updateContextWithSenderHandle:otherHandle:", outgoingHandle, v22);

              }
              else
              {
                objc_msgSend(v13, "_updateContextWithSenderHandle:otherHandle:", outgoingHandle, v36->_outgoingHandle);
              }
              if ((v20 & 1) == 0)

              objc_msgSend(v11, "associatedMessageGUID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setAssociatedMessageGUID:", v23);

              objc_msgSend(v13, "setAssociatedMessageType:", 3);
              objc_msgSend(v11, "breadcrumbText");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setBody:", v24);

              objc_msgSend(v35, "addObject:", v13);
              objc_msgSend(v12, "payloadData");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addObject:", v25);

              v8 = v39;
LABEL_14:

            }
          }
          else
          {
            v4 = v15;
            v5 = v38;
            v8 = v39;
          }
        }

      }
      ++v9;
    }
    while (v7 != v9);
    v26 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    v7 = v26;
  }
  while (v26);
LABEL_32:

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v27 = v35;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  self = v36;
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v42 != v30)
          objc_enumerationMutation(v27);
        -[CKIMSimulatedChat _handleIncomingItem:](v36, "_handleIncomingItem:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v29);
  }

  if (objc_msgSend(v37, "count"))
    objc_msgSend(v4, "setConsumedSessionPayloads:", v37);

LABEL_42:
  v40.receiver = self;
  v40.super_class = (Class)CKIMSimulatedChat;
  v32 = -[CKIMSimulatedChat _handleIncomingItem:](&v40, sel__handleIncomingItem_, v4);

  return v32;
}

- (id)chatIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CKIMSimulatedChat simulatedChatIdentifier](self, "simulatedChatIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CKIMSimulatedChat incomingHandles](self, "incomingHandles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") == 1)
    {
      -[CKIMSimulatedChat incomingHandles](self, "incomingHandles");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKIMSimulatedChat setSimulatedChatIdentifier:](self, "setSimulatedChatIdentifier:", v7);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKIMSimulatedChat setSimulatedChatIdentifier:](self, "setSimulatedChatIdentifier:", v5);
    }

  }
  return -[CKIMSimulatedChat simulatedChatIdentifier](self, "simulatedChatIdentifier");
}

- (id)account
{
  return self->_simulatedAccount;
}

- (id)guid
{
  return self->_simulatedGUID;
}

- (id)recipient
{
  void *v2;
  void *v3;

  -[CKIMSimulatedChat incomingHandles](self, "incomingHandles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)chatStyle
{
  void *v2;
  unint64_t v3;

  -[CKIMSimulatedChat incomingHandles](self, "incomingHandles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 <= 1)
    return 45;
  else
    return 43;
}

- (id)loadMessagesBeforeDate:(id)a3 limit:(unint64_t)a4 loadImmediately:(BOOL)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID", a3, a4, a5);
}

- (BOOL)allowedByScreenTime
{
  return 1;
}

- (BOOL)allowedToShowConversationSync
{
  return 1;
}

- (BOOL)allowedToShowConversation
{
  return 1;
}

- (void)chat:(id)a3 didSendMessage:(id)a4 finished:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  ++self->_currentMessageID;
  v7 = a4;
  if ((objc_msgSend(v7, "isTypingMessage") & 1) != 0)
    v8 = 0;
  else
    v8 = -[CKIMSimulatedChat currentMessageID](self, "currentMessageID");
  -[CKIMSimulatedChat incomingHandles](self, "incomingHandles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKIMSimulatedChat outgoingHandle](self, "outgoingHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  messageItemCopyForMessageItem(v7, v5, v8, v10, v11, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[CKIMSimulatedChat _handleIncomingItem:](self, "_handleIncomingItem:", v12);
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
  CKIMSimulatedChat *v29;
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
  -[CKIMSimulatedChat _messageWithGUID:](self, "_messageWithGUID:", a6);
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
          v20 = (void *)MEMORY[0x1E0CB3940];
          NSTemporaryDirectory();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("%@/%@"), v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "writeToFile:atomically:", v23, 1);
          objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
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
    -[CKIMSimulatedChat _handleIncomingItem:](v29, "_handleIncomingItem:", v28);
    -[CKIMSimulatedChat delegate](v29, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "chat:didSendMessage:finished:", v29, v28, 1);

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

- (CKIMSimulatedChatDelegate)delegate
{
  return (CKIMSimulatedChatDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKIMSimulatedAccount)simulatedAccount
{
  return self->_simulatedAccount;
}

- (NSString)simulatedGUID
{
  return self->_simulatedGUID;
}

- (NSArray)incomingHandles
{
  return self->_incomingHandles;
}

- (IMHandle)outgoingHandle
{
  return self->_outgoingHandle;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedChatIdentifier, 0);
  objc_storeStrong((id *)&self->_outgoingHandle, 0);
  objc_storeStrong((id *)&self->_incomingHandles, 0);
  objc_storeStrong((id *)&self->_simulatedGUID, 0);
  objc_storeStrong((id *)&self->_simulatedAccount, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)prepopulatedChat
{
  uint64_t v2;
  CKIMSimulatedChat *v3;
  void *v4;
  CKIMSimulatedChat *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CKIMSimulatedChat *v17;
  void *v19;
  void *v20;
  _QWORD v21[4];
  CKIMSimulatedChat *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D35918], "serviceWithInternalName:", *MEMORY[0x1E0D38F68]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = [CKIMSimulatedChat alloc];
  v23[0] = CFSTR("+15555228243");
  v23[1] = CFSTR("+1555648584");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)v2;
  v5 = -[CKIMSimulatedChat initWithIncomingIDs:outgoingID:messageIDOffset:service:](v3, "initWithIncomingIDs:outgoingID:messageIDOffset:service:", v4, CFSTR("+15555648583"), 800000, v2);

  v6 = objc_alloc_init(MEMORY[0x1E0D398C8]);
  objc_msgSend(v6, "setStatus:", 0);
  objc_msgSend(v6, "setDirection:", 0);
  objc_msgSend(v6, "setOtherHandle:", CFSTR("+15555228243"));
  v19 = v6;
  -[CKIMSimulatedChat _handleIncomingItem:](v5, "_handleIncomingItem:", v6);
  v7 = 0;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Message %d"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);
    v10 = objc_alloc(MEMORY[0x1E0D35870]);
    -[CKIMSimulatedChat outgoingHandle](v5, "outgoingHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithSender:time:text:fileTransferGUIDs:flags:error:guid:subject:threadIdentifier:", v11, v12, v9, 0, 0, 0, v13, 0, 0);

    -[CKIMSimulatedChat sendMessage:](v5, "sendMessage:", v14);
    v7 = (v7 + 1);
  }
  while ((_DWORD)v7 != 30);
  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("WhatsNew_Photos2"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v15);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __51__CKIMSimulatedChat_Prepopulated__prepopulatedChat__block_invoke;
  v21[3] = &unk_1E274C848;
  v17 = v5;
  v22 = v17;
  +[CKComposition requestCompositionFromItemProvider:completion:](CKComposition, "requestCompositionFromItemProvider:completion:", v16, v21);

  return v17;
}

void __51__CKIMSimulatedChat_Prepopulated__prepopulatedChat__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messagesFromCompositionFirstGUIDForMessage:sendingService:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "sendMessage:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

@end
