@implementation CDPDBuddyStateObserver

- (CDPDBuddyStateObserver)init
{
  CDPDBuddyStateObserver *v2;
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *listeners;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPDBuddyStateObserver;
  v2 = -[CDPDBuddyStateObserver init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    listeners = v2->_listeners;
    v2->_listeners = v3;

  }
  return v2;
}

- (void)registerListener:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableOrderedSet addObject:](self->_listeners, "addObject:");
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "isBuddyFinished"))
    objc_msgSend(v4, "buddyFinished");

}

- (void)eventReceived:(const char *)a3 eventValue:(unint64_t)a4
{
  NSObject *v6;
  id *v7;
  id v8;
  int v9;
  NSObject *v10;
  NSMutableOrderedSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  uint64_t v20;
  void *(*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CDPDBuddyStateObserver eventReceived:eventValue:].cold.2((uint64_t)a3, v6);

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v7 = (id *)getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr;
  v27 = getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr;
  if (!getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_block_invoke;
    v22 = &unk_24C81D370;
    v23 = &v24;
    __getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_block_invoke((uint64_t)buf);
    v7 = (id *)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v7)
  {
    -[CDPDBuddyStateObserver eventReceived:eventValue:].cold.1();
    __break(1u);
  }
  v8 = objc_retainAutorelease(*v7);
  v9 = strcmp((const char *)objc_msgSend(v8, "UTF8String"), a3);

  if (!v9)
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "@\"CDPDBuddyStateObserver: Buddy Completed. Calling listeners.\", buf, 2u);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v11 = self->_listeners;
    v12 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v28, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "buddyFinished", (_QWORD)v15);
        }
        v12 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v28, 16);
      }
      while (v12);
    }

  }
}

- (NSMutableOrderedSet)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
}

- (uint64_t)eventReceived:eventValue:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[CDPDBuddyStateObserver eventReceived:eventValue:].cold.2(v0);
}

- (void)eventReceived:(uint64_t)a1 eventValue:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_debug_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_DEBUG, "\"CDPDBuddyStateObserver Received event %s\", (uint8_t *)&v2, 0xCu);
}

@end
