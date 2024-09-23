@implementation FSResourceManager

- (FSResourceManager)init
{
  FSResourceManager *v2;
  uint64_t v3;
  NSMutableDictionary *resourceTasks;
  uint64_t v5;
  NSMutableDictionary *resources;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FSResourceManager;
  v2 = -[FSResourceManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    resourceTasks = v2->_resourceTasks;
    v2->_resourceTasks = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    resources = v2->_resources;
    v2->_resources = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)removeResource:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  fskit_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FSResourceManager removeResource:].cold.1(v4, v5);

  objc_msgSend(v4, "getResourceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_resourceTasks, "removeObjectForKey:", v6);
    -[NSMutableDictionary removeObjectForKey:](self->_resources, "removeObjectForKey:", v6);
  }

}

- (void)removeTaskUUID:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *resourceTasks;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = self->_resourceTasks;
  objc_sync_enter(v5);
  resourceTasks = self->_resourceTasks;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__FSResourceManager_removeTaskUUID___block_invoke;
  v8[3] = &unk_250C32870;
  v7 = v4;
  v9 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](resourceTasks, "enumerateKeysAndObjectsUsingBlock:", v8);

  objc_sync_exit(v5);
}

void __36__FSResourceManager_removeTaskUUID___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  NSObject *v11;

  v7 = a2;
  v8 = a3;
  v10 = *(_QWORD *)(a1 + 32);
  v9 = (uint64_t *)(a1 + 32);
  if (objc_msgSend(v8, "containsObject:", v10))
  {
    fskit_std_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __36__FSResourceManager_removeTaskUUID___block_invoke_cold_1((uint64_t)v7, v9, v11);

    objc_msgSend(v8, "removeObject:", *v9);
    *a4 = 1;
  }

}

- (id)getResource:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_resources, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fskit_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      -[FSResourceManager getResource:].cold.2();
  }
  else if (v7)
  {
    -[FSResourceManager getResource:].cold.1();
  }

  return v5;
}

- (int)getResourceState:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_resources, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fskit_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      -[FSResourceManager getResourceState:].cold.2();

    v8 = objc_msgSend(v5, "state");
  }
  else
  {
    if (v7)
      -[FSResourceManager getResourceState:].cold.1();

    v8 = 0;
  }

  return v8;
}

- (id)getResources
{
  return (id)-[NSMutableDictionary copy](self->_resources, "copy");
}

- (void)addResource:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *resources;
  void *v7;
  void *v8;
  NSObject *v9;
  NSMutableDictionary *v10;

  v4 = a3;
  fskit_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FSResourceManager addResource:].cold.2(v4, v5);

  resources = self->_resources;
  objc_msgSend(v4, "getResourceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](resources, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    fskit_std_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[FSResourceManager addResource:].cold.1(v4, v9);
  }
  else
  {
    v10 = self->_resources;
    objc_msgSend(v4, "getResourceID");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v4, v9);
  }

}

- (void)updateResource:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSMutableDictionary *resources;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "getResourceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fskit_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      -[FSResourceManager updateResource:].cold.3(v4, v6);

    resources = self->_resources;
    objc_msgSend(v4, "getResourceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](resources, "setObject:forKey:", v4, v9);

    fskit_std_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[FSResourceManager updateResource:].cold.2(v4, v6);
  }
  else if (v7)
  {
    -[FSResourceManager updateResource:].cold.1(v6);
  }

}

- (void)addTaskUUID:(id)a3 resource:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableDictionary *resourceTasks;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  fskit_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FSResourceManager addTaskUUID:resource:].cold.1(v7, (uint64_t)v6, v8);

  resourceTasks = self->_resourceTasks;
  objc_msgSend(v7, "getResourceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](resourceTasks, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = self->_resourceTasks;
    v13 = (void *)objc_opt_new();
    objc_msgSend(v7, "getResourceID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, v14);

    v15 = self->_resourceTasks;
    objc_msgSend(v7, "getResourceID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v15, "objectForKey:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v11, "addObject:", v6);

}

- (id)getTaskUUIDs:(id)a3
{
  NSMutableDictionary *resourceTasks;
  void *v4;
  void *v5;

  resourceTasks = self->_resourceTasks;
  objc_msgSend(a3, "getResourceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](resourceTasks, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSMutableDictionary)resourceTasks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResourceTasks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)resources
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResources:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_resourceTasks, 0);
}

- (void)removeResource:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "getResourceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v4, "%s:start:%@", (uint8_t *)v5);

  OUTLINED_FUNCTION_7();
}

void __36__FSResourceManager_removeTaskUUID___block_invoke_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
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
  v3 = *a2;
  v4 = 136315650;
  v5 = "-[FSResourceManager removeTaskUUID:]_block_invoke";
  v6 = 2112;
  v7 = a1;
  v8 = 2112;
  v9 = v3;
  OUTLINED_FUNCTION_4_2(&dword_23B2A6000, a3, (uint64_t)a3, "%s:found:%@:%@", (uint8_t *)&v4);
}

- (void)getResource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s:not_found:%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)getResource:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s:found:%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)getResourceState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s:not_found:%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)getResourceState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s:found:%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)addResource:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "getResourceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v4, "%s: Resource %@, already exists", (uint8_t *)v5);

  OUTLINED_FUNCTION_7();
}

- (void)addResource:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "getResourceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v4, "%s:start:%@", (uint8_t *)v5);

  OUTLINED_FUNCTION_7();
}

- (void)updateResource:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[FSResourceManager updateResource:]";
  _os_log_debug_impl(&dword_23B2A6000, log, OS_LOG_TYPE_DEBUG, "%s:error: resourceID is nil", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)updateResource:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "getResourceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v4, "%s:end:%@", (uint8_t *)v5);

  OUTLINED_FUNCTION_7();
}

- (void)updateResource:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "getResourceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v4, "%s:start:%@", (uint8_t *)v5);

  OUTLINED_FUNCTION_7();
}

- (void)addTaskUUID:(NSObject *)a3 resource:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  __int16 v6;
  uint64_t v7;
  int v8[5];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "getResourceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 136315650;
  OUTLINED_FUNCTION_1_0();
  v9 = v6;
  v10 = a2;
  OUTLINED_FUNCTION_4_2(&dword_23B2A6000, a3, v7, "%s:%@: Adding task (%@)", (uint8_t *)v8);

}

@end
