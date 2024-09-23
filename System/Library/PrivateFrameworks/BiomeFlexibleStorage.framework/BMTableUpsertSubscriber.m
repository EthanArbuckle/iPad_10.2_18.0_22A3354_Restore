@implementation BMTableUpsertSubscriber

- (BMTableUpsertSubscriber)initWithTableName:(id)a3 identifier:(id)a4 keyValueStore:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMTableUpsertSubscriber *v12;
  void *v13;
  void *v14;
  void *v15;
  BMTableStore *v16;
  BMTableStore *store;
  NSError *tableSetupError;
  uint64_t v19;
  NSString *identifier;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BMTableUpsertSubscriber;
  v12 = -[BMTableUpsertSubscriber init](&v22, sel_init);
  if (v12)
  {
    +[BiomeFlexibleStorageDirectory directoryForPrivateTable](BiomeFlexibleStorageDirectory, "directoryForPrivateTable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[BiomeFlexibleStorageDirectory privateDBPathWithIdentifier:directory:create:](BiomeFlexibleStorageDirectory, "privateDBPathWithIdentifier:directory:create:", v10, v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[BMTableStore initWithURL:]([BMTableStore alloc], "initWithURL:", v15);
    store = v12->_store;
    v12->_store = v16;

    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_tableName, a3);
    tableSetupError = v12->_tableSetupError;
    v12->_tableSetupError = 0;

    v19 = objc_msgSend(v10, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v19;

    objc_storeStrong((id *)&v12->_keyValueStore, a5);
  }

  return v12;
}

- (BMTableUpsertSubscriber)initWithTableName:(id)a3 identifier:(id)a4
{
  return -[BMTableUpsertSubscriber initWithTableName:identifier:keyValueStore:](self, "initWithTableName:identifier:keyValueStore:", a3, a4, 0);
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  void *v3;
  BMTableUpsertSubscriber *v4;

  p_lock = &self->_lock;
  v4 = self;
  os_unfair_lock_lock(p_lock);
  -[BMTableUpsertSubscriber store](v4, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "closeDB");

  os_unfair_lock_unlock(p_lock);
  -[BMTableUpsertSubscriber setSubscription:](v4, "setSubscription:", 0);

}

- (void)receiveCompletion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  BMTableUpsertSubscriber *v10;

  v10 = self;
  os_unfair_lock_lock(&v10->_lock);
  -[BMTableUpsertSubscriber store](v10, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "closeDB");

  os_unfair_lock_unlock(&v10->_lock);
  -[BMTableUpsertSubscriber store](v10, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BMTableUpsertSubscriber subscription](v10, "subscription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EF07B4E8);

    if (v6)
    {
      v7 = -[BMTableUpsertSubscriber newBookmark](v10, "newBookmark");
      -[BMTableUpsertSubscriber keyValueStore](v10, "keyValueStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMTableUpsertSubscriber identifier](v10, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "insertValue:forKey:", v7, v9);

    }
  }
  -[BMTableUpsertSubscriber setSubscription:](v10, "setSubscription:", 0);

}

- (id)newBookmark
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  objc_class *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[BMTableUpsertSubscriber subscription](self, "subscription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EF07B4E8) & 1) != 0)
        {
          v11 = objc_msgSend(v10, "newBookmark");
          if (v11)
            goto LABEL_13;
        }
        else
        {
          __biome_log_for_category();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v10;
            _os_log_error_impl(&dword_1B399A000, v12, OS_LOG_TYPE_ERROR, "Subscription %@ could not create bookmark", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v13 = (void *)v11;
        objc_msgSend(v4, "addObject:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v7);
  }

  v14 = objc_alloc(MEMORY[0x1E0D02420]);
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithValue:upstreams:name:", 0, v4, v16);

  return v17;
}

- (int64_t)receiveInput:(id)a3
{
  id v4;
  BMTableUpsertSubscriber *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  id v23;
  NSObject *v24;
  int64_t v25;
  id v27;
  id v28;

  v4 = a3;
  v5 = self;
  os_unfair_lock_lock(&v5->_lock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    -[NSObject rows](v6, "rows");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[BMTableUpsertSubscriber tableSetupComplete](v5, "tableSetupComplete"))
    {
      -[BMTableUpsertSubscriber tableSetupError](v5, "tableSetupError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        -[BMTableUpsertSubscriber store](v5, "store");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMTableUpsertSubscriber tableName](v5, "tableName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        v11 = objc_msgSend(v9, "addTable:named:error:", v6, v10, &v28);
        v12 = v28;
        v5->_tableSetupComplete = v11;

        if (v12)
        {
          -[BMTableUpsertSubscriber setTableSetupError:](v5, "setTableSetupError:", v12);
          __biome_log_for_category();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[BMTableUpsertSubscriber receiveInput:].cold.2(v5, v13);

        }
      }
    }
  }
  else
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BMTableUpsertSubscriber receiveInput:].cold.3(v6, v14, v15, v16, v17, v18, v19, v20);
    v7 = 0;
  }

  if (-[BMTableUpsertSubscriber tableSetupComplete](v5, "tableSetupComplete"))
  {
    -[BMTableUpsertSubscriber store](v5, "store");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v22 = objc_msgSend(v21, "upsertRows:error:", v7, &v27);
    v23 = v27;

    if ((v22 & 1) == 0)
    {
      __biome_log_for_category();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[BMTableUpsertSubscriber receiveInput:].cold.1();

    }
  }
  os_unfair_lock_unlock(&v5->_lock);
  v25 = *MEMORY[0x1E0D02400];

  return v25;
}

- (void)receiveSubscription:(id)a3
{
  id v4;

  v4 = a3;
  -[BMTableUpsertSubscriber setSubscription:](self, "setSubscription:", v4);
  objc_msgSend(v4, "requestDemand:", *MEMORY[0x1E0D02408]);

}

- (void)subscribeTo:(id)a3
{
  void *v4;
  id v5;

  -[BMTableUpsertSubscriber setPublisher:](self, "setPublisher:", a3);
  -[BMTableUpsertSubscriber publisher](self, "publisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startWithSubscriber:", self);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[BMTableUpsertSubscriber completeWithError:](self, "completeWithError:", v5);
  else
    -[BMTableUpsertSubscriber requestNextEvents](self, "requestNextEvents");

}

- (void)handleInput:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[NSObject rows](v5, "rows");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[BMTableUpsertSubscriber tableSetupComplete](self, "tableSetupComplete"))
    {
      -[BMTableUpsertSubscriber tableSetupError](self, "tableSetupError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        -[BMTableUpsertSubscriber store](self, "store");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMTableUpsertSubscriber tableName](self, "tableName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        v10 = objc_msgSend(v8, "addTable:named:error:", v5, v9, &v25);
        v11 = v25;
        self->_tableSetupComplete = v10;

        if (v11)
        {
          -[BMTableUpsertSubscriber setTableSetupError:](self, "setTableSetupError:", v11);
          __biome_log_for_category();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            -[BMTableUpsertSubscriber receiveInput:].cold.2(self, v12);

        }
      }
    }
  }
  else
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BMTableUpsertSubscriber receiveInput:].cold.3(v5, v13, v14, v15, v16, v17, v18, v19);
    v6 = 0;
  }

  if (-[BMTableUpsertSubscriber tableSetupComplete](self, "tableSetupComplete"))
  {
    -[BMTableUpsertSubscriber store](self, "store");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v21 = objc_msgSend(v20, "upsertRows:error:", v6, &v24);
    v22 = v24;

    if ((v21 & 1) == 0)
    {
      __biome_log_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[BMTableUpsertSubscriber receiveInput:].cold.1();

    }
  }

}

- (void)requestNextEvents
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;

  -[BMTableUpsertSubscriber publisher](self, "publisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    do
    {
      -[BMTableUpsertSubscriber handleInput:](self, "handleInput:", v4);
      -[BMTableUpsertSubscriber publisher](self, "publisher");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nextEvent");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    while (v6);
  }
  -[BMTableUpsertSubscriber publisher](self, "publisher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "completed");

  if (v8)
    -[BMTableUpsertSubscriber completeWithError:](self, "completeWithError:", 0);
}

- (void)completeWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[BMTableUpsertSubscriber store](self, "store", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closeDB");

  -[BMTableUpsertSubscriber store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BMTableUpsertSubscriber publisher](self, "publisher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EF07B720);

    if (v7)
    {
      -[BMTableUpsertSubscriber publisher](self, "publisher");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bookmarkNode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[BMTableUpsertSubscriber keyValueStore](self, "keyValueStore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMTableUpsertSubscriber identifier](self, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "insertValue:forKey:", v9, v11);

      }
    }
  }
  -[BMTableUpsertSubscriber setPublisher:](self, "setPublisher:", 0);
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BMTableStore)store
{
  return self->_store;
}

- (BOOL)tableSetupComplete
{
  return self->_tableSetupComplete;
}

- (void)setTableSetupComplete:(BOOL)a3
{
  self->_tableSetupComplete = a3;
}

- (BPSSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
  self->_subscription = (BPSSubscription *)a3;
}

- (NSError)tableSetupError
{
  return self->_tableSetupError;
}

- (void)setTableSetupError:(id)a3
{
  objc_storeStrong((id *)&self->_tableSetupError, a3);
}

- (BMFlexibleSimpleKeyValueStorage)keyValueStore
{
  return self->_keyValueStore;
}

- (BPSPublisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_tableSetupError, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
}

- (void)receiveInput:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_1B399A000, v0, v1, "Error inserting rows in upsert subscriber: %@", v2);
}

- (void)receiveInput:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "tableSetupError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_1B399A000, a2, v4, "Error setting up table in upsert subscriber: %@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)receiveInput:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1B399A000, a1, a3, "BMTableUpsertSubscriber: Expecting a BMTable.", a5, a6, a7, a8, 0);
}

@end
