@implementation IMMockChat

- (IMMockChat)init
{
  IMMockChat *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMMockChat;
  v2 = -[IMItemsController init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D35730]);
    objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithService:", v4);

    objc_msgSend(v5, "imHandleWithID:alreadyCanonical:", CFSTR("5034222074"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMockChat setIncomingHandle:](v2, "setIncomingHandle:", v6);

    objc_msgSend(v5, "imHandleWithID:alreadyCanonical:", CFSTR("8082698799"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMockChat setOutgoingHandle:](v2, "setOutgoingHandle:", v7);

  }
  return v2;
}

- (NSArray)mockChatItems
{
  NSArray **p_mockChatItems;
  NSArray *mockChatItems;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  p_mockChatItems = &self->_mockChatItems;
  mockChatItems = self->_mockChatItems;
  if (!mockChatItems)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", CFSTR("CHAT_ITEM_INFO"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[IMMockItemInfo decodedMockItemInfoArray:](IMMockItemInfo, "decodedMockItemInfoArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[IMMockItemInfo defaultMockInfoArray](IMMockItemInfo, "defaultMockInfoArray");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__24;
    v15 = __Block_byref_object_dispose__24;
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __27__IMMockChat_mockChatItems__block_invoke;
    v10[3] = &unk_1E274F5E0;
    v10[4] = self;
    v10[5] = &v11;
    objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v10);
    objc_storeStrong((id *)p_mockChatItems, (id)v12[5]);
    _Block_object_dispose(&v11, 8);

    mockChatItems = *p_mockChatItems;
  }
  return mockChatItems;
}

void __27__IMMockChat_mockChatItems__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void (*v17)(void *);

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_chatItemFromMockItemInfo:atIndex:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 664);
    if (v8)
    {
      v9 = v8;
      v10 = *(void **)(v7 + 664);
      *(_QWORD *)(v7 + 664) = v9;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_messageFromMockItemInfo:", v5);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v12 + 664);
      *(_QWORD *)(v12 + 664) = v11;
    }

    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 664))
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = IMFileLocationTrimFileName();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E276D870);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("_lastMockIMMessage"), "-[IMMockChat mockChatItems]_block_invoke", v14, 145, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void (*)(void *))IMGetAssertionFailureHandler();
      if (v17)
        v17(v16);
      else
        _IMWarn();

    }
  }

}

- (id)participants
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[IMMockChat incomingHandle](self, "incomingHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IMMockChat incomingHandle](self, "incomingHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[IMMockChat extraParticipants](self, "extraParticipants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IMMockChat extraParticipants](self, "extraParticipants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)displayName
{
  return CFSTR("MockChat");
}

- (id)lastFinishedMessageDate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (id)lastFinishedMessage
{
  return self->_lastMockIMMessage;
}

- (id)lastMessage
{
  return self->_lastMockIMMessage;
}

- (unint64_t)messageCount
{
  void *v2;
  unint64_t v3;

  -[IMMockChat chatItems](self, "chatItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)loadMessagesBeforeDate:(id)a3 limit:(unint64_t)a4 loadImmediately:(BOOL)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID", a3, a4, a5);
}

- (BOOL)deleteAllHistory
{
  -[IMMockChat deleteChatItems:](self, "deleteChatItems:", self->_mockChatItems);
  return 1;
}

- (void)deleteChatItems:(id)a3
{
  id v4;
  NSArray *mockChatItems;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  mockChatItems = self->_mockChatItems;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __30__IMMockChat_deleteChatItems___block_invoke;
  v20[3] = &unk_1E274F608;
  v21 = v4;
  v19 = v4;
  -[NSArray indexesOfObjectsPassingTest:](mockChatItems, "indexesOfObjectsPassingTest:", v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_mockChatItems;
  v8 = (NSArray *)-[NSArray mutableCopy](v7, "mutableCopy");
  -[NSArray removeObjectsAtIndexes:](v8, "removeObjectsAtIndexes:", v6);
  v9 = self->_mockChatItems;
  self->_mockChatItems = v8;
  v10 = v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D35328];
  v22[0] = *MEMORY[0x1E0D35330];
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0D35358];
  v23[0] = v13;
  v23[1] = v6;
  v15 = *MEMORY[0x1E0D35350];
  v22[1] = v14;
  v22[2] = v15;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v16;
  v22[3] = *MEMORY[0x1E0D35348];
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = *MEMORY[0x1E0D35340];
  v23[3] = v17;
  v23[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "postNotificationName:object:userInfo:", v12, self, v18);
}

uint64_t __30__IMMockChat_deleteChatItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (void)setupWithMockItemInfoArray:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  IMMessage *v10;
  IMMessage *lastMockIMMessage;
  id v12;

  v12 = a3;
  v4 = objc_msgSend(v12, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMockChat _chatItemFromMockItemInfo:atIndex:](self, "_chatItemFromMockItemInfo:atIndex:", v7, i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

    }
  }
  objc_msgSend(v12, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMockChat _messageFromMockItemInfo:](self, "_messageFromMockItemInfo:", v9);
  v10 = (IMMessage *)objc_claimAutoreleasedReturnValue();
  lastMockIMMessage = self->_lastMockIMMessage;
  self->_lastMockIMMessage = v10;

  -[IMMockChat setMockChatItems:](self, "setMockChatItems:", v5);
}

- (void)appendMockItemWithInfo:(id)a3
{
  id v4;
  void *v5;
  IMMessage *v6;
  IMMessage *lastMockIMMessage;
  NSArray *v8;
  NSArray *mockChatItems;
  id v10;

  v4 = a3;
  -[IMMockChat mockChatItems](self, "mockChatItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMockChat _chatItemFromMockItemInfo:atIndex:](self, "_chatItemFromMockItemInfo:atIndex:", v4, objc_msgSend(v5, "count"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[IMMockChat _messageFromMockItemInfo:](self, "_messageFromMockItemInfo:", v4);
  v6 = (IMMessage *)objc_claimAutoreleasedReturnValue();

  lastMockIMMessage = self->_lastMockIMMessage;
  self->_lastMockIMMessage = v6;

  -[NSArray arrayByAddingObject:](self->_mockChatItems, "arrayByAddingObject:", v10);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  mockChatItems = self->_mockChatItems;
  self->_mockChatItems = v8;

}

- (id)_messageFromMockItemInfo:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v4 = a3;
  v5 = objc_msgSend(v4, "outgoing");
  if (!objc_msgSend(v4, "type"))
  {
    if (v5)
      v7 = 5;
    else
      v7 = 1;
    v8 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Outgoing"), &stru_1E276D870, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v8, "initWithString:", v11);

      -[IMMockChat outgoingHandle](self, "outgoingHandle");
    }
    else
    {
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Incoming"), &stru_1E276D870, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v8, "initWithString:", v14);

      -[IMMockChat incomingHandle](self, "incomingHandle");
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0D35870]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "initWithSender:time:text:fileTransferGUIDs:flags:error:guid:subject:threadIdentifier:", v15, v17, v12, 0, v7, 0, v18, 0, 0);
    goto LABEL_18;
  }
  if (objc_msgSend(v4, "type") == 1)
  {
    if (v5)
      v6 = 1048581;
    else
      v6 = 1048577;
    if ((v5 & 1) != 0)
      -[IMMockChat outgoingHandle](self, "outgoingHandle");
    else
      -[IMMockChat incomingHandle](self, "incomingHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:", &unk_1E2871CE0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0D35870]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v20, "initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:balloonBundleID:payloadData:expressiveSendStyleID:threadIdentifier:", v12, v17, 0, 0, 0, v6, 0, v18, 0, CFSTR("com.apple.messages.CKTicTacToeBalloonProvider"), v15, 0, 0);
LABEL_18:
    v13 = (void *)v19;

    goto LABEL_19;
  }
  v13 = 0;
LABEL_19:

  return v13;
}

- (id)_chatItemFromMockItemInfo:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = a3;
  -[IMMockChat _messageFromMockItemInfo:](self, "_messageFromMockItemInfo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_imMessageItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (!objc_msgSend(v6, "type"))
    {
      v14 = objc_alloc(MEMORY[0x1E0D35948]);
      objc_msgSend(v8, "body");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v14, "_initWithItem:text:index:messagePartRange:subject:", v8, v9, a4, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
      goto LABEL_7;
    }
    if (objc_msgSend(v6, "type") == 1)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0D358D8]);
      objc_msgSend(v8, "guid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setMessageGUID:", v10);

      objc_msgSend(v8, "payloadData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setData:", v11);

      objc_msgSend(v9, "setPluginBundleID:", CFSTR("com.apple.messages.CKTicTacToeBalloonProvider"));
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35968]), "_initWithItem:initialPayload:messagePartRange:", v8, v9, 0, 0x7FFFFFFFFFFFFFFFLL);
LABEL_7:
      v13 = (void *)v12;

      goto LABEL_8;
    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (void)setMockChatItems:(id)a3
{
  objc_storeStrong((id *)&self->_mockChatItems, a3);
}

- (IMHandle)incomingHandle
{
  return self->_incomingHandle;
}

- (void)setIncomingHandle:(id)a3
{
  objc_storeStrong((id *)&self->_incomingHandle, a3);
}

- (IMHandle)outgoingHandle
{
  return self->_outgoingHandle;
}

- (void)setOutgoingHandle:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingHandle, a3);
}

- (IMMessage)lastMockIMMessage
{
  return self->_lastMockIMMessage;
}

- (void)setLastMockIMMessage:(id)a3
{
  objc_storeStrong((id *)&self->_lastMockIMMessage, a3);
}

- (NSArray)extraParticipants
{
  return self->_extraParticipants;
}

- (void)setExtraParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_extraParticipants, a3);
}

- (unint64_t)mockUnreadMessageCount
{
  return self->_mockUnreadMessageCount;
}

- (void)setMockUnreadMessageCount:(unint64_t)a3
{
  self->_mockUnreadMessageCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraParticipants, 0);
  objc_storeStrong((id *)&self->_lastMockIMMessage, 0);
  objc_storeStrong((id *)&self->_outgoingHandle, 0);
  objc_storeStrong((id *)&self->_incomingHandle, 0);
  objc_storeStrong((id *)&self->_mockChatItems, 0);
}

@end
