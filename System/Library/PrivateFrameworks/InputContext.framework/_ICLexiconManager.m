@implementation _ICLexiconManager

- (_ICLexiconManager)initWithLexiconSources:(id)a3
{
  id v5;
  _ICLexiconManager *v6;
  _ICLexiconManager *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *serialQueue;
  uint64_t v16;
  NSMutableDictionary *contacts;
  uint64_t v18;
  NSMutableArray *contactObservers;
  uint64_t v20;
  NSMutableArray *namedEntitiesUpdateObservers;
  _ICNamedEntityStore *v22;
  _ICNamedEntityStore *namedEntityStore;
  NSObject *v24;
  uint64_t v25;
  objc_super v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_ICLexiconManager;
  v6 = -[_ICLexiconManager init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    pthread_mutex_init(&v6->_contactsCallbackLock, 0);
    pthread_mutex_init(&v7->_namedEntityCallbackLock, 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.inputcontext.lexiconmanager."), "stringByAppendingString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_retainAutorelease(v12);
    v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), v9);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v7->_sources, a3);
    v16 = objc_opt_new();
    contacts = v7->_contacts;
    v7->_contacts = (NSMutableDictionary *)v16;

    v18 = objc_opt_new();
    contactObservers = v7->_contactObservers;
    v7->_contactObservers = (NSMutableArray *)v18;

    v20 = objc_opt_new();
    namedEntitiesUpdateObservers = v7->_namedEntitiesUpdateObservers;
    v7->_namedEntitiesUpdateObservers = (NSMutableArray *)v20;

    *(_QWORD *)&v7->_contactChangeCount = 0;
    v7->_namedEntityLoadState = 0;
    v22 = -[_ICNamedEntityStore initWithName:]([_ICNamedEntityStore alloc], "initWithName:", CFSTR("InputContext-NamedEntity"));
    namedEntityStore = v7->_namedEntityStore;
    v7->_namedEntityStore = v22;

    _ICPersNamedEntityOSLogFacility();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134218242;
      v29 = v25;
      v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_22716D000, v24, OS_LOG_TYPE_DEFAULT, "initialized lexicon manager with %lu sources and serial queue %@", buf, 0x16u);
    }

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_contactsCallbackLock);
  pthread_mutex_destroy(&self->_namedEntityCallbackLock);
  v3.receiver = self;
  v3.super_class = (Class)_ICLexiconManager;
  -[_ICLexiconManager dealloc](&v3, sel_dealloc);
}

- (void)doLoadLexicon
{
  NSObject *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[8];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  _ICPersNamedEntityOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22716D000, v3, OS_LOG_TYPE_DEFAULT, "_ICLexiconManager loading lexicons", buf, 2u);
  }

  -[_ICLexiconManager changeContactLoadingState:](self, "changeContactLoadingState:", 1);
  -[_ICLexiconManager changeNamedEntityLoadingState:](self, "changeNamedEntityLoadingState:", 1);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_sources;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "startLoadingWithManager:", self, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (id)stateName:(int)a3
{
  if ((a3 - 1) > 3)
    return CFSTR("Unloaded");
  else
    return off_24EF71948[a3 - 1];
}

- (void)changeContactLoadingState:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v3 = *(_QWORD *)&a3;
  v12 = *MEMORY[0x24BDAC8D0];
  _ICPersContactOSLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[_ICLexiconManager stateName:](self, "stateName:", self->_contactLoadState);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICLexiconManager stateName:](self, "stateName:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_22716D000, v5, OS_LOG_TYPE_INFO, "Contacts: State Change: %@ to %@", (uint8_t *)&v8, 0x16u);

  }
  self->_contactLoadState = v3;
}

- (void)changeNamedEntityLoadingState:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v3 = *(_QWORD *)&a3;
  v12 = *MEMORY[0x24BDAC8D0];
  _ICPersNamedEntityOSLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[_ICLexiconManager stateName:](self, "stateName:", self->_namedEntityLoadState);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICLexiconManager stateName:](self, "stateName:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_22716D000, v5, OS_LOG_TYPE_INFO, "Named Entities: State Change: %@ to %@", (uint8_t *)&v8, 0x16u);

  }
  self->_namedEntityLoadState = v3;
}

- (void)_actuallyLoadLexicons
{
  NSObject *serialQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42___ICLexiconManager__actuallyLoadLexicons__block_invoke;
  v4[3] = &unk_24EF717F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)loadLexicons:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = 0;
  serialQueue = self->_serialQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34___ICLexiconManager_loadLexicons___block_invoke;
  v8[3] = &unk_24EF71848;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(serialQueue, v8);
  -[_ICLexiconManager _actuallyLoadLexicons](self, "_actuallyLoadLexicons");
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)loadLexicons
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  -[_ICLexiconManager _actuallyLoadLexicons](self, "_actuallyLoadLexicons");
  -[_ICNamedEntityStore wordLexicon](self->_namedEntityStore, "wordLexicon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[_ICNamedEntityStore phraseLexicon](self->_namedEntityStore, "phraseLexicon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)unloadLexicons
{
  NSObject *v3;
  void *v4;
  NSObject *serialQueue;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _ICPersNamedEntityOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[_ICLexiconManager stateName:](self, "stateName:", self->_contactLoadState);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_22716D000, v3, OS_LOG_TYPE_INFO, " Unloading, state = %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35___ICLexiconManager_unloadLexicons__block_invoke;
  v6[3] = &unk_24EF71650;
  objc_copyWeak(&v7, (id *)buf);
  v6[4] = self;
  dispatch_async(serialQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (id)addContactObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *serialQueue;
  id v7;
  id v8;
  void *v9;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40___ICLexiconManager_addContactObserver___block_invoke;
  block[3] = &unk_24EF71870;
  objc_copyWeak(&v14, &location);
  block[4] = self;
  v12 = v5;
  v13 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(serialQueue, block);
  v9 = (void *)MEMORY[0x2276AC454](v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v9;
}

- (void)removeContactObserver:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43___ICLexiconManager_removeContactObserver___block_invoke;
  block[3] = &unk_24EF71898;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)addNamedEntitiesUpdateObserver:(id)a3
{
  void *v4;
  NSObject *serialQueue;
  id v6;
  void *v7;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v4 = (void *)objc_msgSend(a3, "copy");
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52___ICLexiconManager_addNamedEntitiesUpdateObserver___block_invoke;
  block[3] = &unk_24EF71898;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v6 = v4;
  dispatch_async(serialQueue, block);
  v7 = (void *)MEMORY[0x2276AC454](v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

- (void)removeNamedEntitiesUpdateObserver:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55___ICLexiconManager_removeNamedEntitiesUpdateObserver___block_invoke;
  block[3] = &unk_24EF71898;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_notifyNamedEntitiesUpdateObservers
{
  NSObject *v3;
  uint64_t v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  _ICLexiconManager *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  _ICPersNamedEntityOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSMutableArray count](self->_namedEntitiesUpdateObservers, "count");
    *(_DWORD *)buf = 134218240;
    v16 = self;
    v17 = 2048;
    v18 = v4;
    _os_log_impl(&dword_22716D000, v3, OS_LOG_TYPE_DEFAULT, "%p Calling %ld named entities update observers", buf, 0x16u);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_namedEntitiesUpdateObservers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)addContact:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *contacts;
  void *v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "source");
  _ICPersNamedEntityOSLogFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 == 1)
  {
    if (v7)
      -[_ICLexiconManager addContact:].cold.1((uint64_t)v4, v6, v8, v9, v10, v11, v12, v13);

    objc_msgSend(v4, "contact");
    v6 = objc_claimAutoreleasedReturnValue();
    contacts = self->_contacts;
    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](contacts, "setObject:forKeyedSubscript:", v6, v15);

  }
  else if (v7)
  {
    -[_ICLexiconManager addContact:].cold.2((uint64_t)v4, v6, v8, v9, v10, v11, v12, v13);
  }

}

- (void)removeContact:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableDictionary *contacts;
  void *v13;

  v4 = a3;
  _ICPersNamedEntityOSLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_ICLexiconManager removeContact:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  contacts = self->_contacts;
  objc_msgSend(v4, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](contacts, "removeObjectForKey:", v13);

}

- (void)resetNamedEntities
{
  _opaque_pthread_mutex_t *p_namedEntityCallbackLock;
  NSObject *serialQueue;
  _QWORD v5[4];
  id v6;
  id location;

  p_namedEntityCallbackLock = &self->_namedEntityCallbackLock;
  pthread_mutex_lock(&self->_namedEntityCallbackLock);
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39___ICLexiconManager_resetNamedEntities__block_invoke;
  v5[3] = &unk_24EF717F8;
  objc_copyWeak(&v6, &location);
  dispatch_async(serialQueue, v5);
  pthread_mutex_unlock(p_namedEntityCallbackLock);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)setupNamedEntities
{
  NSObject *serialQueue;
  _QWORD v4[4];
  id v5;
  id location;

  pthread_mutex_lock(&self->_namedEntityCallbackLock);
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39___ICLexiconManager_setupNamedEntities__block_invoke;
  v4[3] = &unk_24EF717F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)handleNamedEntity:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39___ICLexiconManager_handleNamedEntity___block_invoke;
  block[3] = &unk_24EF718C0;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(serialQueue, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)completeNamedEntities
{
  NSObject *serialQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42___ICLexiconManager_completeNamedEntities__block_invoke;
  v4[3] = &unk_24EF717F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  pthread_mutex_unlock(&self->_namedEntityCallbackLock);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setupRecentNamedEntities
{
  NSObject *serialQueue;
  _QWORD v4[4];
  id v5;
  id location;

  pthread_mutex_lock(&self->_namedEntityCallbackLock);
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45___ICLexiconManager_setupRecentNamedEntities__block_invoke;
  v4[3] = &unk_24EF717F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)handleRecentNamedEntity:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45___ICLexiconManager_handleRecentNamedEntity___block_invoke;
  block[3] = &unk_24EF718C0;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(serialQueue, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)completeRecentNamedEntities
{
  NSObject *serialQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48___ICLexiconManager_completeRecentNamedEntities__block_invoke;
  v4[3] = &unk_24EF717F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  pthread_mutex_unlock(&self->_namedEntityCallbackLock);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setupContacts
{
  NSObject *serialQueue;
  _QWORD v4[4];
  id v5;
  id location;

  pthread_mutex_lock(&self->_contactsCallbackLock);
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34___ICLexiconManager_setupContacts__block_invoke;
  v4[3] = &unk_24EF717F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)handleContact:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35___ICLexiconManager_handleContact___block_invoke;
  block[3] = &unk_24EF718C0;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(serialQueue, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)completeContacts
{
  NSObject *serialQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37___ICLexiconManager_completeContacts__block_invoke;
  block[3] = &unk_24EF718C0;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, block);
  pthread_mutex_unlock(&self->_contactsCallbackLock);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setupRecentContacts
{
  NSObject *serialQueue;
  _QWORD v4[4];
  id v5;
  id location;

  pthread_mutex_lock(&self->_contactsCallbackLock);
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40___ICLexiconManager_setupRecentContacts__block_invoke;
  v4[3] = &unk_24EF717F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)handleRecentContact:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41___ICLexiconManager_handleRecentContact___block_invoke;
  v7[3] = &unk_24EF716A0;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)completeRecentContacts
{
  NSObject *serialQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43___ICLexiconManager_completeRecentContacts__block_invoke;
  block[3] = &unk_24EF718C0;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, block);
  pthread_mutex_unlock(&self->_contactsCallbackLock);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)warmUp
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_sources;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "warmUp", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)hibernate
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_sources;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "hibernate", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)printLexiconToNSLog:(_LXLexicon *)a3
{
  const void *RootCursor;
  NSObject *v4;
  _QWORD v5[5];
  __CFString *v6;

  RootCursor = (const void *)LXLexiconCreateRootCursor();
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__1;
  v5[4] = __Block_byref_object_dispose__1;
  v6 = CFSTR("IC-DICT: ");
  LXCursorEnumerateEntriesRecursively();
  CFRelease(RootCursor);
  _ICPersNamedEntityOSLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[_ICLexiconManager printLexiconToNSLog:].cold.1();

  _Block_object_dispose(v5, 8);
}

+ (unint64_t)countWords:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "indexesOfObjectsPassingTest:", &__block_literal_global_2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "count");
  v9 = v8 - objc_msgSend(v7, "count");

  return v9;
}

- (unint64_t)getContactCount
{
  NSObject *serialQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36___ICLexiconManager_getContactCount__block_invoke;
  v5[3] = &unk_24EF71848;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)debugEntityLoadState
{
  NSObject *serialQueue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41___ICLexiconManager_debugEntityLoadState__block_invoke;
  v5[3] = &unk_24EF71848;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v5 = a5;
  v6 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = self->_sources;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "provideFeedbackForString:type:style:", v8, v6, v5, (_QWORD)v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (int)contactLoadState
{
  return self->_contactLoadState;
}

- (void)setContactLoadState:(int)a3
{
  self->_contactLoadState = a3;
}

- (int)namedEntityLoadState
{
  return self->_namedEntityLoadState;
}

- (void)setNamedEntityLoadState:(int)a3
{
  self->_namedEntityLoadState = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (_ICNamedEntityStore)namedEntityStore
{
  return self->_namedEntityStore;
}

- (void)setNamedEntityStore:(id)a3
{
  objc_storeStrong((id *)&self->_namedEntityStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_namedEntitiesUpdateObservers, 0);
  objc_storeStrong((id *)&self->_contactObservers, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_sources, 0);
}

- (void)addContact:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22716D000, a2, a3, " Adding contact %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)addContact:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22716D000, a2, a3, " Rejecting contact %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)removeContact:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22716D000, a2, a3, " Removing contact %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)printLexiconToNSLog:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_22716D000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
