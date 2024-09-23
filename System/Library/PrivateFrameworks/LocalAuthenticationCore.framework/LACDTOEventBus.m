@implementation LACDTOEventBus

- (LACDTOEventBus)init
{
  LACDTOEventBus *v2;
  uint64_t v3;
  NSHashTable *eventHandlers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LACDTOEventBus;
  v2 = -[LACDTOEventBus init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    eventHandlers = v2->_eventHandlers;
    v2->_eventHandlers = (NSHashTable *)v3;

  }
  return v2;
}

- (void)addEventHandler:(id)a3
{
  -[NSHashTable addObject:](self->_eventHandlers, "addObject:", a3);
}

- (void)removeEventHandler:(id)a3
{
  -[NSHashTable removeObject:](self->_eventHandlers, "removeObject:", a3);
}

- (void)dispatchEvent:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  LACLogDTOEvent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[LACDTOEventBus dispatchEvent:sender:].cold.1((uint64_t)v6, (uint64_t)v7, v8);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSHashTable allObjects](self->_eventHandlers, "allObjects", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if (v14 != v7)
          objc_msgSend(v14, "handleEvent:sender:", v6, v7);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventHandlers, 0);
}

- (void)dispatchEvent:(os_log_t)log sender:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_2409DC000, log, OS_LOG_TYPE_DEBUG, "Will dispatch event: %@ from: %@", (uint8_t *)&v3, 0x16u);
}

@end
