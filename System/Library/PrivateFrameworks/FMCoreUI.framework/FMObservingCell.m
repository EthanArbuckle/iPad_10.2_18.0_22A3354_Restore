@implementation FMObservingCell

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMObservingCell;
  -[FMObservingCell prepareForReuse](&v3, sel_prepareForReuse);
  -[FMObservingCell removeKVOObservationTokens](self, "removeKVOObservationTokens");
  -[FMObservingCell removeNotificationTokens](self, "removeNotificationTokens");
  -[FMObservingCell setRepresentedObject:](self, "setRepresentedObject:", 0);
}

- (void)setRepresentedObject:(id)a3
{
  id obj;

  obj = a3;
  -[FMObservingCell removeKVOObservationTokens](self, "removeKVOObservationTokens");
  -[FMObservingCell removeNotificationTokens](self, "removeNotificationTokens");
  objc_storeWeak(&self->_representedObject, obj);
  if (obj)
  {
    -[FMObservingCell addObserversForRepresentedObject:](self, "addObserversForRepresentedObject:");
  }
  else
  {
    -[FMObservingCell removeKVOObservationTokens](self, "removeKVOObservationTokens");
    -[FMObservingCell removeNotificationTokens](self, "removeNotificationTokens");
  }
  -[FMObservingCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)addKVOObservationToken:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[FMObservingCell kvoObservationTokens](self, "kvoObservationTokens");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMObservingCell setKvoObservationTokens:](self, "setKvoObservationTokens:", v10);

    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[FMObservingCell kvoObservationTokens](self, "kvoObservationTokens", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
LABEL_7:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
        objc_msgSend(v17, "object");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 == v8)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v14)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
      v20 = v17;

      if (v20)
        goto LABEL_18;
    }
    else
    {
LABEL_13:

    }
    v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE2FE50]), "initWithObject:", v8);
LABEL_18:
    -[FMObservingCell kvoObservationTokens](self, "kvoObservationTokens");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v20);
    v19 = objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v19 = objc_claimAutoreleasedReturnValue();
      -[FMObservingCell kvoObservationTokens](self, "kvoObservationTokens");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, v20);

    }
    -[NSObject addObject:](v19, "addObject:", v6);

  }
  else
  {
    LogCategory_Unspecified();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[FMObservingCell addKVOObservationToken:forObject:].cold.1(v19);
  }

}

- (void)removeKVOObservationTokens
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[FMObservingCell kvoObservationTokens](self, "kvoObservationTokens");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v6);
        -[FMObservingCell kvoObservationTokens](self, "kvoObservationTokens");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "object");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v20 = 0u;
          v21 = 0u;
          v18 = 0u;
          v19 = 0u;
          v11 = v9;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v19;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v19 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(v10, "removeKVOBlockForToken:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++));
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v13);
          }

        }
        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v4);
  }

  -[FMObservingCell kvoObservationTokens](self, "kvoObservationTokens");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeAllObjects");

}

- (void)addNotificationToken:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMObservingCell.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[inToken class] respondsToSelector:@selector(isAnObserver:)]"));

  }
  -[FMObservingCell notificationTokens](self, "notificationTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMObservingCell setNotificationTokens:](self, "setNotificationTokens:", v7);

  }
  -[FMObservingCell notificationTokens](self, "notificationTokens");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v5);

}

- (void)removeNotificationTokens
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[FMObservingCell notificationTokens](self, "notificationTokens", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "removeObserver:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[FMObservingCell notificationTokens](self, "notificationTokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

- (id)representedObject
{
  return objc_loadWeakRetained(&self->_representedObject);
}

- (NSMutableDictionary)kvoObservationTokens
{
  return self->_kvoObservationTokens;
}

- (void)setKvoObservationTokens:(id)a3
{
  objc_storeStrong((id *)&self->_kvoObservationTokens, a3);
}

- (NSMutableSet)notificationTokens
{
  return self->_notificationTokens;
}

- (void)setNotificationTokens:(id)a3
{
  objc_storeStrong((id *)&self->_notificationTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationTokens, 0);
  objc_storeStrong((id *)&self->_kvoObservationTokens, 0);
  objc_destroyWeak(&self->_representedObject);
}

- (void)addKVOObservationToken:(os_log_t)log forObject:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DBDA000, log, OS_LOG_TYPE_ERROR, "Attempted to add nil KVO token!", v1, 2u);
}

@end
