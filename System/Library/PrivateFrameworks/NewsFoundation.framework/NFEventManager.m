@implementation NFEventManager

- (void)attemptTriggersForCurrentEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NFEventManager triggers](self, "triggers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "fireOnce"))
          -[NFEventManager handleOnceTrigger:event:](self, "handleOnceTrigger:event:", v11, v4);
        else
          -[NFEventManager handleAlwaysTrigger:event:](self, "handleAlwaysTrigger:event:", v11, v4);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)triggerOnceWhenAllEventsHaveOccurred:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NFEventTrigger *v8;
  void *v9;
  void *v10;
  NFEventTrigger *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  if (v7 && objc_msgSend(v6, "count"))
  {
    v8 = [NFEventTrigger alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NFEventTrigger initWithKey:fireOnce:fireOnAny:events:block:](v8, "initWithKey:fireOnce:fireOnAny:events:block:", v10, 1, 0, v6, v7);

    -[NFEventManager triggers](self, "triggers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFEventTrigger key](v11, "key");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v13);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NFEventManager triggerOnceWhenAllEventsHaveOccurred:block:].cold.1();
  }

}

- (NSMutableDictionary)triggers
{
  return self->_triggers;
}

- (void)handleOnceTrigger:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void (**v10)(void);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "fireOnAny"))
  {
    objc_msgSend(v6, "events");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_15;
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v6, "events", 0);
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
LABEL_6:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14);
        -[NFEventManager events](self, "events");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15) = objc_msgSend(v16, "containsObject:", v15);

        if (!(_DWORD)v15)
          goto LABEL_14;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v12)
            goto LABEL_6;
          break;
        }
      }
    }

  }
  -[NFEventManager triggers](self, "triggers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObjectForKey:", v18);

  objc_msgSend(v6, "block");
  v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v10[2]();
LABEL_14:

LABEL_15:
}

- (void)fireEvent:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  if (v4)
  {
    -[NFEventManager events](self, "events");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

    -[NFEventManager attemptTriggersForCurrentEvent:](self, "attemptTriggersForCurrentEvent:", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NFEventManager fireEvent:].cold.1();
  }

}

- (NSMutableSet)events
{
  return self->_events;
}

- (NFEventManager)init
{
  NFEventManager *v2;
  NSMutableSet *v3;
  NSMutableSet *events;
  NSMutableDictionary *v5;
  NSMutableDictionary *triggers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NFEventManager;
  v2 = -[NFEventManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    events = v2->_events;
    v2->_events = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    triggers = v2->_triggers;
    v2->_triggers = v5;

  }
  return v2;
}

- (void)triggerAlwaysWhenAllEventsHaveOccurred:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NFEventTrigger *v8;
  void *v9;
  void *v10;
  NFEventTrigger *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  if (v7 && objc_msgSend(v6, "count"))
  {
    v8 = [NFEventTrigger alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NFEventTrigger initWithKey:fireOnce:fireOnAny:events:block:](v8, "initWithKey:fireOnce:fireOnAny:events:block:", v10, 0, 0, v6, v7);

    -[NFEventManager triggers](self, "triggers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFEventTrigger key](v11, "key");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v13);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NFEventManager triggerAlwaysWhenAllEventsHaveOccurred:block:].cold.1();
  }

}

- (void)triggerOnceWhenAnyEventHasOccurred:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NFEventTrigger *v8;
  void *v9;
  void *v10;
  NFEventTrigger *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  if (v7 && objc_msgSend(v6, "count"))
  {
    v8 = [NFEventTrigger alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NFEventTrigger initWithKey:fireOnce:fireOnAny:events:block:](v8, "initWithKey:fireOnce:fireOnAny:events:block:", v10, 1, 1, v6, v7);

    -[NFEventManager triggers](self, "triggers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFEventTrigger key](v11, "key");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v13);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NFEventManager triggerOnceWhenAnyEventHasOccurred:block:].cold.1();
  }

}

- (void)triggerOnEvent:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  if (v6 && v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFEventManager triggerOnAnyEvent:block:](self, "triggerOnAnyEvent:block:", v8, v7);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NFEventManager triggerOnEvent:block:].cold.1();
  }

}

- (void)triggerOnAnyEvent:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NFEventTrigger *v8;
  void *v9;
  void *v10;
  NFEventTrigger *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  if (v6 && v7 && objc_msgSend(v6, "count"))
  {
    v8 = [NFEventTrigger alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NFEventTrigger initWithKey:fireOnce:fireOnAny:events:block:](v8, "initWithKey:fireOnce:fireOnAny:events:block:", v10, 0, 1, v6, v7);

    -[NFEventManager triggers](self, "triggers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFEventTrigger key](v11, "key");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v13);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NFEventManager triggerOnAnyEvent:block:].cold.1();
  }

}

- (void)handleAlwaysTrigger:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void (**v10)(void);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "fireOnAny"))
  {
    objc_msgSend(v6, "events");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_15;
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v6, "events", 0);
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
LABEL_6:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14);
        -[NFEventManager events](self, "events");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15) = objc_msgSend(v16, "containsObject:", v15);

        if (!(_DWORD)v15)
          goto LABEL_14;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v12)
            goto LABEL_6;
          break;
        }
      }
    }

  }
  objc_msgSend(v6, "block");
  v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v10[2]();
LABEL_14:

LABEL_15:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

- (void)fireEvent:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("You cannot fire a nil event"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_212A0B000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)triggerOnceWhenAllEventsHaveOccurred:block:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("There is no point of creating a trigger without a block or events"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_212A0B000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)triggerAlwaysWhenAllEventsHaveOccurred:block:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("There is no point of creating a trigger without a block or events"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_212A0B000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)triggerOnceWhenAnyEventHasOccurred:block:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("There is no point of creating a trigger without a block or events"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_212A0B000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)triggerOnEvent:block:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("There is no point of creating a trigger without a block or event"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_212A0B000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)triggerOnAnyEvent:block:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("There is no point of creating a trigger without a block or event"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_212A0B000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_2();
}

@end
