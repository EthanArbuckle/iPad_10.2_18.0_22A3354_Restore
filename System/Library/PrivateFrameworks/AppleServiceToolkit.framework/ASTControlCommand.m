@implementation ASTControlCommand

- (ASTControlCommand)init
{
  ASTControlCommand *v2;
  uint64_t v3;
  NSMutableDictionary *actionStorage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASTControlCommand;
  v2 = -[ASTControlCommand init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    actionStorage = v2->_actionStorage;
    v2->_actionStorage = (NSMutableDictionary *)v3;

    *(_WORD *)&v2->_forceSequential = 0;
  }
  return v2;
}

- (id)requestWithData:(id)a3 session:(id)a4 queue:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  ASTAction *v17;
  void *v18;
  ASTAction *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *queue;
  id v30;
  id v31;
  id v32;
  id obj;
  _QWORD block[5];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  v30 = a4;
  queue = a5;
  +[ASTRequest request](ASTRequest, "request");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("forceSequential"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("forceSequential"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTControlCommand setForceSequential:](self, "setForceSequential:", objc_msgSend(v9, "BOOLValue"));

  }
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("haltOnError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("haltOnError"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTControlCommand setHaltOnError:](self, "setHaltOnError:", objc_msgSend(v11, "BOOLValue"));

  }
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("actions"));
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("action"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = [ASTAction alloc];
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("action"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[ASTAction initWithAction:data:](v17, "initWithAction:data:", v18, v15);

          -[ASTControlCommand actionStorage](self, "actionStorage");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_sync_enter(v20);
          -[ASTControlCommand actionStorage](self, "actionStorage");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASTAction identifier](v19, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, v22);

          objc_sync_exit(v20);
        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v12);
  }

  -[ASTControlCommand actionStorage](self, "actionStorage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count") == 0;

  if (v24)
  {
    ASTLogHandleForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[ASTControlCommand requestWithData:session:queue:].cold.1(v27);

    objc_msgSend(v31, "setClientStatus:", 8);
  }
  else
  {
    objc_msgSend(v31, "setClientStatus:", 13);
    -[ASTControlCommand requestData](self, "requestData");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setData:", v25);

    objc_msgSend(v30, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v25) = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __51__ASTControlCommand_requestWithData_session_queue___block_invoke;
      block[3] = &unk_24F969B48;
      block[4] = self;
      v35 = v30;
      dispatch_async(queue, block);

    }
  }

  return v31;
}

void __51__ASTControlCommand_requestWithData_session_queue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "actionStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "actionStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "session:performActions:sequentially:stopOnError:", v4, v6, objc_msgSend(*(id *)(a1 + 32), "forceSequential"), objc_msgSend(*(id *)(a1 + 32), "haltOnError"));

  }
}

- (void)performActionsWithSession:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  _QWORD block[4];
  id v19;
  id v20;
  ASTControlCommand *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTControlCommand actionStorage](self, "actionStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v9);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[ASTControlCommand actionStorage](self, "actionStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isFinished") & 1) == 0)
          objc_msgSend(v8, "addObject:", v15);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  objc_sync_exit(v9);
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v6, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __53__ASTControlCommand_performActionsWithSession_queue___block_invoke;
      block[3] = &unk_24F969B70;
      v19 = v6;
      v20 = v8;
      v21 = self;
      dispatch_async(v7, block);

    }
  }

}

void __53__ASTControlCommand_performActionsWithSession_queue___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:performActions:sequentially:stopOnError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "forceSequential"), objc_msgSend(*(id *)(a1 + 48), "haltOnError"));

}

- (id)requestData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  const __CFString *v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTControlCommand actionStorage](self, "actionStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ASTControlCommand actionStorage](self, "actionStorage", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "dictionaryValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }

  objc_sync_exit(v4);
  v17 = CFSTR("actions");
  v18 = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)updateAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ASTControlCommand actionStorage](self, "actionStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[ASTControlCommand actionStorage](self, "actionStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

  objc_sync_exit(v4);
}

- (BOOL)allActionsFinished
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[ASTControlCommand actionStorage](self, "actionStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ASTControlCommand actionStorage](self, "actionStorage", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isFinished") & 1) == 0)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  objc_sync_exit(v3);
  return v9;
}

- (BOOL)reset
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[ASTControlCommand actionStorage](self, "actionStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTControlCommand setActionStorage:](self, "setActionStorage:", v5);

    -[ASTControlCommand setForceSequential:](self, "setForceSequential:", 0);
    -[ASTControlCommand setHaltOnError:](self, "setHaltOnError:", 0);
  }
  return v4 != 0;
}

- (ASTControlCommand)initWithCoder:(id)a3
{
  id v4;
  ASTControlCommand *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *actionStorage;

  v4 = a3;
  v5 = -[ASTControlCommand init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("actionStorage"));
    v10 = objc_claimAutoreleasedReturnValue();
    actionStorage = v5->_actionStorage;
    v5->_actionStorage = (NSMutableDictionary *)v10;

    v5->_forceSequential = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceSequential"));
    v5->_haltOnError = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("haltOnError"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ASTControlCommand actionStorage](self, "actionStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("actionStorage"));

  objc_msgSend(v5, "encodeBool:forKey:", -[ASTControlCommand forceSequential](self, "forceSequential"), CFSTR("forceSequential"));
  objc_msgSend(v5, "encodeBool:forKey:", -[ASTControlCommand haltOnError](self, "haltOnError"), CFSTR("haltOnError"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSMutableDictionary copyWithZone:](self->_actionStorage, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_BYTE *)(v5 + 8) = self->_forceSequential;
  *(_BYTE *)(v5 + 9) = self->_haltOnError;
  return (id)v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASTControlCommand forceSequential](self, "forceSequential");
  v7 = -[ASTControlCommand haltOnError](self, "haltOnError");
  -[ASTControlCommand actionStorage](self, "actionStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; forceSequential = %d, haltOnError = %d, actionStorage = %@>"),
    v5,
    self,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)forceSequential
{
  return self->_forceSequential;
}

- (void)setForceSequential:(BOOL)a3
{
  self->_forceSequential = a3;
}

- (BOOL)haltOnError
{
  return self->_haltOnError;
}

- (void)setHaltOnError:(BOOL)a3
{
  self->_haltOnError = a3;
}

- (NSMutableDictionary)actionStorage
{
  return self->_actionStorage;
}

- (void)setActionStorage:(id)a3
{
  objc_storeStrong((id *)&self->_actionStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionStorage, 0);
}

- (void)requestWithData:(os_log_t)log session:queue:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D91B000, log, OS_LOG_TYPE_ERROR, "No valid actions on Control command", v1, 2u);
}

@end
