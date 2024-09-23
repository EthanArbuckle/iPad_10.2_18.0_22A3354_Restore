@implementation AFUIDelayedActionCommandCache

- (AFUIDelayedActionCommandCache)init
{
  AFUIDelayedActionCommandCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *delayedActionTimersByIdentifier;
  NSMutableDictionary *v5;
  NSMutableDictionary *dismissalDelayedActionCommandsByIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AFUIDelayedActionCommandCache;
  v2 = -[AFUIDelayedActionCommandCache init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    delayedActionTimersByIdentifier = v2->_delayedActionTimersByIdentifier;
    v2->_delayedActionTimersByIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dismissalDelayedActionCommandsByIdentifier = v2->_dismissalDelayedActionCommandsByIdentifier;
    v2->_dismissalDelayedActionCommandsByIdentifier = v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AFUIDelayedActionCommandCache invalidatePendingCommands](self, "invalidatePendingCommands");
  v3.receiver = self;
  v3.super_class = (Class)AFUIDelayedActionCommandCache;
  -[AFUIDelayedActionCommandCache dealloc](&v3, sel_dealloc);
}

- (void)enqueueDelayedActionCommand:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _AFUIAssertingDelayedActionCommand *v26;
  void *v27;
  os_log_t v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  double v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[AFUIDelayedActionCommandCache enqueueDelayedActionCommand:completion:]";
    _os_log_impl(&dword_217514000, v9, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  objc_msgSend(v6, "aceId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timerValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "timerValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13 / 1000.0;

    v15 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v6, "commands");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v34 = "-[AFUIDelayedActionCommandCache enqueueDelayedActionCommand:completion:]";
      v35 = 2112;
      v36 = v6;
      v37 = 2048;
      v38 = v14;
      v39 = 2112;
      v40 = v17;
      _os_log_impl(&dword_217514000, v16, OS_LOG_TYPE_DEFAULT, "%s Enqueue delayed action command: %@, delay: %f, commands: %@", buf, 0x2Au);

    }
    v18 = objc_alloc(MEMORY[0x24BE08A10]);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "processIdentifier");
    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "aceId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("SiriDelayedActionCommandAssertion-%@"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v18, "initWithPID:flags:reason:name:withHandler:", v20, 1, 4, v23, 0);

    v25 = (void *)MEMORY[0x24BDBCF40];
    v26 = -[_AFUIAssertingDelayedActionCommand initWithCommand:assertion:]([_AFUIAssertingDelayedActionCommand alloc], "initWithCommand:assertion:", v6, v24);
    objc_msgSend(v25, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__performDelayedActionCommandTimerAction_, v26, 0, v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKey:](self->_delayedActionTimersByIdentifier, "setObject:forKey:", v27, v10);
  }
  else
  {
    v28 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      objc_msgSend(v6, "commands");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v34 = "-[AFUIDelayedActionCommandCache enqueueDelayedActionCommand:completion:]";
      v35 = 2112;
      v36 = v6;
      v37 = 2112;
      v38 = *(double *)&v30;
      _os_log_impl(&dword_217514000, v29, OS_LOG_TYPE_DEFAULT, "%s Enqueue dismissal action command: %@, commands: %@", buf, 0x20u);

    }
    -[NSMutableDictionary setObject:forKey:](self->_dismissalDelayedActionCommandsByIdentifier, "setObject:forKey:", v6, v10);
  }
  v31 = objc_alloc_init(MEMORY[0x24BE811B8]);
  objc_msgSend(v6, "aceId");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setRefId:", v32);

  if (v7)
    v7[2](v7, v31);

}

- (void)cancelDelayedActionWithDelayedActionCancelCommand:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  Class *v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[AFUIDelayedActionCommandCache cancelDelayedActionWithDelayedActionCancelCommand:completion:]";
    _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v15, 0xCu);
  }
  objc_msgSend(v6, "delayedActionAceId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_delayedActionTimersByIdentifier, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[AFUIDelayedActionCommandCache _invalidateDelayedActionTimer:withKey:](self, "_invalidateDelayedActionTimer:withKey:", v10, v9);
    v11 = objc_alloc_init(MEMORY[0x24BE811B8]);
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_dismissalDelayedActionCommandsByIdentifier, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_dismissalDelayedActionCommandsByIdentifier, "removeObjectForKey:", v9);
      v13 = (Class *)0x24BE811B8;
    }
    else
    {
      v13 = (Class *)0x24BE811A8;
    }
    v11 = objc_alloc_init(*v13);

  }
  objc_msgSend(v6, "aceId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRefId:", v14);

  if (v7)
    v7[2](v7, v11);

}

- (void)_performDelayedActionCommandTimerAction:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableDictionary *delayedActionTimersByIdentifier;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[AFUIDelayedActionCommandCache _performDelayedActionCommandTimerAction:]";
    _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v14, 0xCu);
  }
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "command");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUIDelayedActionCommandCache _performCommandsWithDelayedActionCommand:](self, "_performCommandsWithDelayedActionCommand:", v9);
    delayedActionTimersByIdentifier = self->_delayedActionTimersByIdentifier;
    objc_msgSend(v9, "aceId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](delayedActionTimersByIdentifier, "removeObjectForKey:", v11);

    objc_msgSend(v8, "assertion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315650;
      v15 = "-[AFUIDelayedActionCommandCache _performDelayedActionCommandTimerAction:]";
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_217514000, v13, OS_LOG_TYPE_DEFAULT, "%s Invalidating assertion: %@ for delayed action command: %@", (uint8_t *)&v14, 0x20u);
    }
    objc_msgSend(v12, "invalidate");

  }
  objc_msgSend(v4, "invalidate");

}

- (void)invalidatePendingCommands
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[AFUIDelayedActionCommandCache invalidatePendingCommands]";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[NSMutableDictionary allKeys](self->_delayedActionTimersByIdentifier, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_delayedActionTimersByIdentifier, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          -[AFUIDelayedActionCommandCache _invalidateDelayedActionTimer:withKey:](self, "_invalidateDelayedActionTimer:withKey:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_invalidateDelayedActionTimer:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  NSObject **v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (NSObject **)MEMORY[0x24BE08FB0];
  v9 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v6, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315394;
    v19 = "-[AFUIDelayedActionCommandCache _invalidateDelayedActionTimer:withKey:]";
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_217514000, v10, OS_LOG_TYPE_DEFAULT, "%s Invalidating delayed action timer with userInfo: %@", (uint8_t *)&v18, 0x16u);

  }
  objc_msgSend(v6, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;
    objc_msgSend(v13, "assertion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *v8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v13, "command");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136315650;
      v19 = "-[AFUIDelayedActionCommandCache _invalidateDelayedActionTimer:withKey:]";
      v20 = 2112;
      v21 = v14;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_217514000, v16, OS_LOG_TYPE_DEFAULT, "%s Invalidating assertion: %@ for delayed action command: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_msgSend(v14, "invalidate");

  }
  objc_msgSend(v6, "invalidate");

  -[NSMutableDictionary removeObjectForKey:](self->_delayedActionTimersByIdentifier, "removeObjectForKey:", v7);
}

- (void)performDismissalCommands
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[AFUIDelayedActionCommandCache performDismissalCommands]";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[NSMutableDictionary allKeys](self->_dismissalDelayedActionCommandsByIdentifier, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_dismissalDelayedActionCommandsByIdentifier, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[AFUIDelayedActionCommandCache _performCommandsWithDelayedActionCommand:](self, "_performCommandsWithDelayedActionCommand:", v10);
          -[NSMutableDictionary removeObjectForKey:](self->_dismissalDelayedActionCommandsByIdentifier, "removeObjectForKey:", v9);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)_commandHandler
{
  return objc_alloc_init(MEMORY[0x24BE09130]);
}

- (void)_performCommandsWithDelayedActionCommand:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "commands");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v14 = "-[AFUIDelayedActionCommandCache _performCommandsWithDelayedActionCommand:]";
    v15 = 2112;
    v16 = v4;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s Performing delayed action command: %@ with commands: %@", buf, 0x20u);

  }
  -[AFUIDelayedActionCommandCache _commandHandler](self, "_commandHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commands");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__AFUIDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke;
  v11[3] = &unk_24D7A3010;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

}

void __74__AFUIDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = *(void **)(a1 + 32);
    v6 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __74__AFUIDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_2;
    v9[3] = &unk_24D7A2FC0;
    v10 = v4;
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __74__AFUIDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_30;
    v7[3] = &unk_24D7A2FE8;
    v8 = v10;
    objc_msgSend(v5, "handleCommand:commandHandler:completion:", v10, v9, v7);

  }
}

void __74__AFUIDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[AFUIDelayedActionCommandCache _performCommandsWithDelayedActionCommand:]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_217514000, v4, OS_LOG_TYPE_INFO, "%s Received response for delayed command: %@, response: %@", (uint8_t *)&v6, 0x20u);
  }

}

void __74__AFUIDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_30(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *MEMORY[0x24BE08FB0];
  v7 = *MEMORY[0x24BE08FB0];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 136315394;
      v10 = "-[AFUIDelayedActionCommandCache _performCommandsWithDelayedActionCommand:]_block_invoke";
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_INFO, "%s Delayed command succeeded: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __74__AFUIDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_30_cold_1(a1, (uint64_t)v5, v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalDelayedActionCommandsByIdentifier, 0);
  objc_storeStrong((id *)&self->_delayedActionTimersByIdentifier, 0);
}

void __74__AFUIDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_30_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 136315650;
  v5 = "-[AFUIDelayedActionCommandCache _performCommandsWithDelayedActionCommand:]_block_invoke";
  v6 = 2112;
  v7 = v3;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_217514000, log, OS_LOG_TYPE_ERROR, "%s Delayed command failed: %@ with error: %@", (uint8_t *)&v4, 0x20u);
}

@end
