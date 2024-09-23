@implementation EDInteractionEventLogMultiplexer

- (EDInteractionEventLogMultiplexer)initWithLogs:(id)a3
{
  id v5;
  EDInteractionEventLogMultiplexer *v6;
  EDInteractionEventLogMultiplexer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDInteractionEventLogMultiplexer;
  v6 = -[EDInteractionEventLogMultiplexer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_logs, a3);

  return v7;
}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 data:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[EDInteractionEventLogMultiplexer logs](self, "logs", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "persistEvent:date:message:data:", v10, v11, v12, v13);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (void)persistEvent:(id)a3 date:(id)a4 conversationID:(int64_t)a5 data:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[EDInteractionEventLogMultiplexer logs](self, "logs", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "persistEvent:date:conversationID:data:", v10, v11, a5, v12);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)persistEvent:(id)a3 dataFromMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[EDInteractionEventLogMultiplexer logs](self, "logs", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "persistEvent:dataFromMessage:", v6, v7);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)persistEvent:(id)a3 dataFromMessage:(id)a4 account:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[EDInteractionEventLogMultiplexer logs](self, "logs", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "persistEvent:dataFromMessage:account:", v8, v9, v10);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailbox:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[EDInteractionEventLogMultiplexer logs](self, "logs", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "persistEvent:date:message:mailbox:", v10, v11, v12, v13);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailboxType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[EDInteractionEventLogMultiplexer logs](self, "logs", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "persistEvent:date:message:mailboxType:", v10, v11, v12, a6);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[EDInteractionEventLogMultiplexer logs](self, "logs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p: %@>"), v4, self, v5);

  return v6;
}

- (NSArray)logs
{
  return self->_logs;
}

- (void)setLogs:(id)a3
{
  objc_storeStrong((id *)&self->_logs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logs, 0);
}

@end
