@implementation IRBiomeProvider

- (IRBiomeProvider)init
{
  IRBiomeProvider *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *internalQueue;
  uint64_t v6;
  NSMapTable *eventTypeToObservers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IRBiomeProvider;
  v2 = -[IRBiomeProvider init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.intelligentroutingd.biomeProvider", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    eventTypeToObservers = v2->_eventTypeToObservers;
    v2->_eventTypeToObservers = (NSMapTable *)v6;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)subscribe:(int64_t)a3
{
  id v4;

  -[IRBiomeProvider biomeInterface](self, "biomeInterface");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribeEvent:", a3);

}

- (void)unsubscribe:(int64_t)a3
{
  id v4;

  -[IRBiomeProvider biomeInterface](self, "biomeInterface");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unsubscribeEvent:", a3);

}

- (void)addObserver:(id)a3 forEvent:(int64_t)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  NSMapTable *eventTypeToObservers;
  void *v9;
  void *v10;
  void *v11;
  NSMapTable *v12;
  void *v13;
  NSMapTable *v14;
  void *v15;
  void *v16;
  NSMapTable *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const void **v21;
  id *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  NSMapTable *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  int v34;
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  eventTypeToObservers = self->_eventTypeToObservers;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](eventTypeToObservers, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_eventTypeToObservers;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v12, "setObject:forKey:", v11, v13);

  }
  v14 = self->_eventTypeToObservers;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](v14, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v6);

  v17 = self->_eventTypeToObservers;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](v17, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  v21 = (const void **)MEMORY[0x24BE5B328];
  v22 = (id *)MEMORY[0x24BE5B270];
  if (v20 == 1)
  {
    -[IRBiomeProvider subscribe:](self, "subscribe:", a4);
    dispatch_get_specific(*v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *v22;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      IRBiomeEventTypeToString((const char *)a4);
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v34 = 136315650;
      v35 = "#biome-provider, ";
      v36 = 2112;
      v37 = v23;
      v38 = 2080;
      v39 = objc_msgSend(v25, "UTF8String");
      _os_log_impl(&dword_23FFBA000, v24, OS_LOG_TYPE_DEFAULT, "%s[%@], subscribing to context notification event, %s", (uint8_t *)&v34, 0x20u);

    }
  }
  dispatch_get_specific(*v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *v22;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    IRBiomeEventTypeToString((const char *)a4);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = objc_msgSend(v28, "UTF8String");
    v30 = self->_eventTypeToObservers;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](v30, "objectForKey:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");
    v34 = 136315906;
    v35 = "#biome-provider, ";
    v36 = 2112;
    v37 = v26;
    v38 = 2080;
    v39 = v29;
    v40 = 2048;
    v41 = v33;
    _os_log_impl(&dword_23FFBA000, v27, OS_LOG_TYPE_DEBUG, "%s[%@], added an observer to context notification event, %s, current number of observers, %lu", (uint8_t *)&v34, 0x2Au);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)removeObserver:(id)a3 forEvent:(int64_t)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  NSMapTable *eventTypeToObservers;
  void *v9;
  void *v10;
  NSMapTable *v11;
  void *v12;
  void *v13;
  NSMapTable *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const void **v18;
  id *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  NSMapTable *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  int v32;
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  eventTypeToObservers = self->_eventTypeToObservers;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](eventTypeToObservers, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = self->_eventTypeToObservers;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](v11, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v6);

    v14 = self->_eventTypeToObservers;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](v14, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    v18 = (const void **)MEMORY[0x24BE5B328];
    v19 = (id *)MEMORY[0x24BE5B270];
    if (!v17)
    {
      dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *v19;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        IRBiomeEventTypeToString((const char *)a4);
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v32 = 136315650;
        v33 = "#biome-provider, ";
        v34 = 2112;
        v35 = v20;
        v36 = 2080;
        v37 = objc_msgSend(v22, "UTF8String");
        _os_log_impl(&dword_23FFBA000, v21, OS_LOG_TYPE_DEFAULT, "%s[%@], unsubscribing to context notification event, %s", (uint8_t *)&v32, 0x20u);

      }
      -[IRBiomeProvider unsubscribe:](self, "unsubscribe:", a4);
    }
    dispatch_get_specific(*v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *v19;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      IRBiomeEventTypeToString((const char *)a4);
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26 = objc_msgSend(v25, "UTF8String");
      v27 = self->_eventTypeToObservers;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](v27, "objectForKey:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");
      v32 = 136315906;
      v33 = "#biome-provider, ";
      v34 = 2112;
      v35 = v23;
      v36 = 2080;
      v37 = v26;
      v38 = 2048;
      v39 = v30;
      _os_log_impl(&dword_23FFBA000, v24, OS_LOG_TYPE_DEBUG, "%s[%@], removed an observer to context notification event, %s, current number of observers, %lu", (uint8_t *)&v32, 0x2Au);

    }
  }
  else
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      IRBiomeEventTypeToString((const char *)a4);
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v32 = 136315650;
      v33 = "#biome-provider, ";
      v34 = 2112;
      v35 = v23;
      v36 = 2080;
      v37 = objc_msgSend(v31, "UTF8String");
      _os_log_impl(&dword_23FFBA000, v24, OS_LOG_TYPE_DEFAULT, "%s[%@], asked to remove an observer but no observer registered for event: %s", (uint8_t *)&v32, 0x20u);

    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)notifyObserversOfEvent:(int64_t)a3 withValue:(id)a4
{
  id v6;
  NSMapTable *eventTypeToObservers;
  void *v8;
  void *v9;
  IRBiomeParameters *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  os_unfair_lock_t lock;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE buf[12];
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  eventTypeToObservers = self->_eventTypeToObservers;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](eventTypeToObservers, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[IRBiomeParameters initWithBiomeEventType:]([IRBiomeParameters alloc], "initWithBiomeEventType:", a3);
  objc_msgSend(v6, "eventBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRBiomeParameters biomeEventClass](v10, "biomeEventClass");
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    switch(a3)
    {
      case 0:
      case 3:
      case 4:
        dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (id)*MEMORY[0x24BE5B270];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          IRBiomeEventTypeToString((const char *)a3);
          v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "#biome-provider, ";
          v45 = 2112;
          v46 = v28;
          v47 = 2080;
          v48 = objc_msgSend(v30, "UTF8String");
          _os_log_impl(&dword_23FFBA000, v29, OS_LOG_TYPE_FAULT, "%s[%@], [ErrorId - Biome unsupported event on notify] IRBiome, can't notify clients of biome event type %s", buf, 0x20u);

        }
        -[IRBiomeProvider notifyObserversOfEvent:withValue:].cold.1(v29, v28, (uint64_t *)buf);

        abort();
      case 1:
        objc_msgSend(v6, "eventBody");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *MEMORY[0x24BE5B270];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "#biome-provider, ";
          v45 = 2112;
          v46 = v14;
          _os_log_impl(&dword_23FFBA000, v15, OS_LOG_TYPE_DEBUG, "%s[%@], Notify clients of a DeviceWiFi event", buf, 0x16u);
        }

        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v16 = v9;
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (!v17)
          goto LABEL_29;
        v31 = v9;
        v32 = v6;
        v18 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v39 != v18)
              objc_enumerationMutation(v16);
            v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v20, "provider:didUpdateDeviceWiFi:", self, v13);
          }
          v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v17);
        break;
      case 2:
        objc_msgSend(v6, "eventBody");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *MEMORY[0x24BE5B270];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "#biome-provider, ";
          v45 = 2112;
          v46 = v22;
          _os_log_impl(&dword_23FFBA000, v23, OS_LOG_TYPE_DEBUG, "%s[%@], Notify clients of a MediaRoute event", buf, 0x16u);
        }

        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v16 = v9;
        v24 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (!v24)
          goto LABEL_29;
        v31 = v9;
        v32 = v6;
        v25 = *(_QWORD *)v35;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v35 != v25)
              objc_enumerationMutation(v16);
            v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v27, "provider:didUpdateMediaRoute:", self, v13);
          }
          v24 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        }
        while (v24);
        break;
      default:
        goto LABEL_30;
    }
    v9 = v31;
    v6 = v32;
  }
  else
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      IRBiomeEventTypeToString((const char *)a3);
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "#biome-provider, ";
      v45 = 2112;
      v46 = v13;
      v47 = 2080;
      v48 = objc_msgSend(v21, "UTF8String");
      _os_log_impl(&dword_23FFBA000, v16, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Biome event missmatch] received biome event data doesn't match event type, %s", buf, 0x20u);

    }
  }
LABEL_29:

LABEL_30:
  os_unfair_lock_unlock(lock);

}

- (id)fetchLatestEventsOfEventType:(int64_t)a3 numEvents:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[IRBiomeProvider biomeInterface](self, "biomeInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchLatestEventsOfEventType:numEvents:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)createStandardBiomeInterface
{
  os_unfair_lock_s *p_lock;
  IRBiomeBridge *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[IRBiomeBridge initWithBiomeProvider:targetQueue:]([IRBiomeBridge alloc], "initWithBiomeProvider:targetQueue:", self, self->_internalQueue);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (IRBiomeProviderInterface)biomeInterface
{
  return self->_biomeInterface;
}

- (void)setBiomeInterface:(id)a3
{
  objc_storeStrong((id *)&self->_biomeInterface, a3);
}

- (NSMapTable)eventTypeToObservers
{
  return self->_eventTypeToObservers;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_eventTypeToObservers, 0);
  objc_storeStrong((id *)&self->_biomeInterface, 0);
}

- (void)notifyObserversOfEvent:(uint64_t *)a3 withValue:.cold.1(void *a1, void *a2, uint64_t *a3)
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];

  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v5 = objc_claimAutoreleasedReturnValue();
  *a3 = v5;
  v6 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v8 = 136316162;
    v9 = "#biome-provider, ";
    v10 = 2112;
    v11 = v5;
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/IntelligentRouting/IntelligentRoutingDaemon/DataProviders/Biome/IRBiomeProvider.m";
    v14 = 1024;
    v15 = 138;
    v16 = 2080;
    v17 = "-[IRBiomeProvider notifyObserversOfEvent:withValue:]";
    OUTLINED_FUNCTION_0_3(&dword_23FFBA000, v6, v7, "%s[%@], %s:%d: assertion failure in %s", (uint8_t *)&v8);
  }
}

@end
