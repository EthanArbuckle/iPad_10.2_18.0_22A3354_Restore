@implementation LSInstallProgressList

- (LSInstallProgressList)init
{
  LSInstallProgressList *v2;
  uint64_t v3;
  NSMutableDictionary *progresses;
  uint64_t v5;
  NSMutableDictionary *subscriptions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LSInstallProgressList;
  v2 = -[LSInstallProgressList init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    progresses = v2->_progresses;
    v2->_progresses = (NSMutableDictionary *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    subscriptions = v2->_subscriptions;
    v2->_subscriptions = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (id)progressForBundleID:(id)a3
{
  id v4;
  LSInstallProgressList *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](v5->_progresses, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v7 = v6;
  else
    v7 = 0;

  objc_sync_exit(v5);
  return v7;
}

- (void)setProgress:(id)a3 forBundleID:(id)a4
{
  id v6;
  LSInstallProgressList *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    -[NSMutableDictionary allKeys](v7->_progresses, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v6);

    if ((v9 & 1) == 0)
      MEMORY[0x186DAF208]();
  }
  -[NSMutableDictionary setObject:forKey:](v7->_progresses, "setObject:forKey:", v10, v6);
  objc_sync_exit(v7);

}

- (void)addSubscriber:(id)a3 forPublishingKey:(id)a4 andBundleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  LSInstallProgressList *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  _LSProgressLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_DEFAULT, "#LSInstallProgressList add subscriber: %@ publishingString: %@", (uint8_t *)&v14, 0x16u);
  }

  -[NSMutableDictionary objectForKey:](v11->_subscriptions, "objectForKey:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v11->_subscriptions, "setObject:forKey:", v13, v9);
  }
  objc_msgSend(v13, "addObject:", v8);

  objc_sync_exit(v11);
}

- (id)subscriberForBundleID:(id)a3 andPublishingKey:(id)a4
{
  id v6;
  id v7;
  LSInstallProgressList *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKeyedSubscript:](v8->_subscriptions, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v8);

  return v9;
}

- (void)removeSubscriberForPublishingKey:(id)a3 andBundleID:(id)a4
{
  id v6;
  LSInstallProgressList *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKeyedSubscript:](v7->_subscriptions, "objectForKeyedSubscript:", v6);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        _LSProgressLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v20 = v12;
          v21 = 2112;
          v22 = v6;
          _os_log_impl(&dword_182882000, v13, OS_LOG_TYPE_DEFAULT, "#LSInstallProgressList remove subscriber: %@ publishingString: %@", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB38A8], "_removeSubscriber:", v12, v14);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v9);
  }

  -[NSMutableDictionary removeObjectForKey:](v7->_subscriptions, "removeObjectForKey:", v6);
  objc_sync_exit(v7);

}

- (void)removeProgressForBundleID:(id)a3
{
  LSInstallProgressList *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    -[NSMutableDictionary allKeys](v4->_progresses, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v7);

    if (v6)
      MEMORY[0x186DAF214]();
  }
  -[NSMutableDictionary removeObjectForKey:](v4->_progresses, "removeObjectForKey:", v7);
  objc_sync_exit(v4);

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LSInstallProgressList: %@, %@"), self->_progresses, self->_subscriptions);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_progresses, 0);
}

@end
