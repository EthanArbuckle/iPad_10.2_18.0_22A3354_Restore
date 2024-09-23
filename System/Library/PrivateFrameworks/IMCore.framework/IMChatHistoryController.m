@implementation IMChatHistoryController

- (IMChatHistoryController)init
{
  IMChatHistoryController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMChatHistoryController;
  v2 = -[IMChatHistoryController init](&v6, sel_init);
  if (v2)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "listener");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addHandler:", v2);

  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1ECF125C0 != -1)
    dispatch_once(&qword_1ECF125C0, &unk_1E471DA98);
  return (id)qword_1ECF12620;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeHandler:", self);

  v5.receiver = self;
  v5.super_class = (Class)IMChatHistoryController;
  -[IMChatHistoryController dealloc](&v5, sel_dealloc);
}

- (void)loadMessageWithGUID:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *runningQueries;
  void *v18;
  NSMutableDictionary *v19;
  id v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = v7;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cachedChats");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "messageForGUID:", v6);
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v21 = (void *)v15;
            v22 = (void *)objc_msgSend(v8, "copy");

            v20 = v21;
            v8 = v22;
            im_dispatch_after();

            goto LABEL_14;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v12)
          continue;
        break;
      }
    }

    if (!self->_runningQueries)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      runningQueries = self->_runningQueries;
      self->_runningQueries = Mutable;

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loadMessageWithGUID:queryID:", v6, v10);

    v19 = self->_runningQueries;
    v20 = (id)objc_msgSend(v8, "copy");
    -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v20, v10);
LABEL_14:

  }
}

- (void)loadItemWithGUID:(id)a3 completionBlock:(id)a4
{
  id v6;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *runningQueries;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (v6)
  {
    if (!self->_runningQueries)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      runningQueries = self->_runningQueries;
      self->_runningQueries = Mutable;

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteDaemon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loadItemWithGUID:queryID:", v14, v9);

    v12 = self->_runningQueries;
    v13 = (void *)objc_msgSend(v6, "copy");
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, v9);

  }
}

- (void)loadMessageItemWithGUID:(id)a3 completionBlock:(id)a4
{
  id v6;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *runningQueries;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (v6)
  {
    if (!self->_runningQueries)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      runningQueries = self->_runningQueries;
      self->_runningQueries = Mutable;

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteDaemon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loadMessageItemWithGUID:queryID:", v14, v9);

    v12 = self->_runningQueries;
    v13 = (void *)objc_msgSend(v6, "copy");
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, v9);

  }
}

- (void)messageQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
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
  id v28;
  id v29;
  IMChatHistoryController *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableDictionary objectForKey:](self->_runningQueries, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v30 = self;
    v32 = v8;
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v31 = v10;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry", v30);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "existingChatWithGUID:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
            objc_msgSend(v12, "addObject:", v20);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v15);
    }

    objc_msgSend(v12, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "account");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sender");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imHandleWithID:alreadyCanonical:", v23, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "handle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imHandleWithID:alreadyCanonical:", v25, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    +[IMMessage messageFromIMMessageItem:sender:subject:](IMMessage, "messageFromIMMessageItem:sender:subject:", v9, v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v12;
    v35 = v11;
    v33 = v27;
    v28 = v12;
    v29 = v27;
    im_dispatch_after();
    v8 = v32;
    -[NSMutableDictionary removeObjectForKey:](v30->_runningQueries, "removeObjectForKey:", v32);

    v10 = v31;
  }

}

- (void)itemQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  IMChatHistoryController *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableDictionary objectForKey:](self->_runningQueries, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v22 = self;
    v23 = v9;
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry", v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "existingChatWithGUID:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
            objc_msgSend(v12, "addObject:", v20);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v15);
    }

    v26 = v11;
    v9 = v23;
    v24 = v23;
    v25 = v12;
    v21 = v12;
    im_dispatch_after();
    -[NSMutableDictionary removeObjectForKey:](v22->_runningQueries, "removeObjectForKey:", v8);

  }
}

- (void)messageItemQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  IMChatHistoryController *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableDictionary objectForKey:](self->_runningQueries, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v22 = self;
    v23 = v9;
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry", v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "existingChatWithGUID:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
            objc_msgSend(v12, "addObject:", v20);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v15);
    }

    v26 = v11;
    v9 = v23;
    v24 = v23;
    v25 = v12;
    v21 = v12;
    im_dispatch_after();
    -[NSMutableDictionary removeObjectForKey:](v22->_runningQueries, "removeObjectForKey:", v8);

  }
}

- (NSMutableDictionary)_runningQueries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)set_runningQueries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningQueries, 0);
}

@end
