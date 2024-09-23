@implementation ObjectAnalytics

- (ObjectAnalytics)initWithWorkspace:(id)a3 entityName:(id)a4 withCache:(BOOL)a5
{
  id v8;
  id v9;
  ObjectAnalytics *v10;
  ObjectAnalytics *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ObjectAnalytics;
  v10 = -[ObjectAnalytics init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->wspace, a3);
    v11->managedCache = 0;
    objc_storeStrong((id *)&v11->entityName, a4);
  }

  return v11;
}

- (id)fetchEntitiesFreeForm:(id)a3 sortDesc:(id)a4
{
  return -[ObjectAnalytics _fetch:sortDesc:limit:](self, "_fetch:sortDesc:limit:", a3, a4, 0);
}

- (id)fetchAllEntityDictionariesWithProperties:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v5, "setName:", CFSTR("objectID"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExpression:", v6);

  objc_msgSend(v5, "setExpressionResultType:", 2000);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v7, "addObjectsFromArray:", v4);
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", self->entityName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResultType:", 2);
  objc_msgSend(v8, "setAllocationType:", 1);
  objc_msgSend(v8, "setPropertiesToFetch:", v7);
  -[AnalyticsWorkspace mainObjectContext](self->wspace, "mainObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v8, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  if (v11)
  {
    objectanalyticsHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_ERROR, "Failure to fetch object IDs %@", buf, 0xCu);
    }

    v13 = 0;
  }
  else
  {
    v13 = v10;
  }

  return v13;
}

- (id)fetchEntityDictionariesWithProperties:(id)a3 predicate:(id)a4
{
  return -[ObjectAnalytics fetchEntityDictionariesWithProperties:predicate:sortDescriptors:](self, "fetchEntityDictionariesWithProperties:predicate:sortDescriptors:", a3, a4, 0);
}

- (id)fetchEntityDictionariesWithProperties:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  return -[ObjectAnalytics fetchEntityDictionariesWithProperties:predicate:sortDescriptors:limit:](self, "fetchEntityDictionariesWithProperties:predicate:sortDescriptors:limit:", a3, a4, a5, 0);
}

- (id)fetchEntityDictionariesWithProperties:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v13, "setName:", CFSTR("objectID"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setExpression:", v14);

  objc_msgSend(v13, "setExpressionResultType:", 2000);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
    objc_msgSend(v15, "addObjectsFromArray:", v10);
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", self->entityName);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setResultType:", 2);
  objc_msgSend(v16, "setAllocationType:", 1);
  objc_msgSend(v16, "setPropertiesToFetch:", v15);
  if (v11)
    objc_msgSend(v16, "setPredicate:", v11);
  if (v12)
    objc_msgSend(v16, "setSortDescriptors:", v12);
  if (a6)
    objc_msgSend(v16, "setFetchLimit:", a6);
  -[AnalyticsWorkspace mainObjectContext](self->wspace, "mainObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v17, "executeFetchRequest:error:", v16, &v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v23;

  if (v19)
  {
    objectanalyticsHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_impl(&dword_1DBAE1000, v20, OS_LOG_TYPE_ERROR, "Failure to fetch object IDs %@", buf, 0xCu);
    }

    v21 = 0;
  }
  else
  {
    v21 = v18;
  }

  return v21;
}

- (id)_firstLastHappened:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[ObjectAnalytics _fetch:sortDesc:](self, "_fetch:sortDesc:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    if (a3)
      objc_msgSend(v5, "objectAtIndex:", 0);
    else
      objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)firstHappened
{
  return -[ObjectAnalytics _firstLastHappened:](self, "_firstLastHappened:", 1);
}

- (id)lastHappened
{
  return -[ObjectAnalytics _firstLastHappened:](self, "_firstLastHappened:", 0);
}

- (id)createEntity
{
  return -[ObjectAnalytics createEntityForEntityName:](self, "createEntityForEntityName:", self->entityName);
}

- (id)createEntityForEntityName:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;

  v4 = (NSString *)a3;
  -[AnalyticsWorkspace mainObjectContext](self->wspace, "mainObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (!v4)
      v4 = self->entityName;
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)createTemporaryEntity
{
  return -[ObjectAnalytics createTemporaryEntityForEntityName:](self, "createTemporaryEntityForEntityName:", self->entityName);
}

- (id)createTemporaryEntityForEntityName:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (NSString *)a3;
  -[AnalyticsWorkspace mainObjectContext](self->wspace, "mainObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (!v4)
      v4 = self->entityName;
    objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B80]), "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)moveTemporaryEntityToMainContext:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[AnalyticsWorkspace mainObjectContext](self->wspace, "mainObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject insertObject:](v5, "insertObject:", v4);
  }
  else
  {
    objectanalyticsHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "description");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = 136315138;
      v8 = objc_msgSend(v6, "UTF8String");
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_ERROR, "Invalid object %s", (uint8_t *)&v7, 0xCu);

    }
  }

}

- (id)getDescriptionForName:(id)a3
{
  void *v3;
  AnalyticsWorkspace *wspace;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C97B20];
  wspace = self->wspace;
  v5 = a3;
  -[AnalyticsWorkspace mainObjectContext](wspace, "mainObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityForName:inManagedObjectContext:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)refresh:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  -[AnalyticsWorkspace mainObjectContext](self->wspace, "mainObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (v4)
      objc_msgSend(v5, "refreshObject:mergeChanges:", v4, 0);
  }
  else
  {
    objectanalyticsHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "moc is nil", v8, 2u);
    }

  }
}

- (void)save
{
  -[AnalyticsWorkspace save](self->wspace, "save");
}

- (void)removeEntities:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AnalyticsWorkspace mainObjectContext](self->wspace, "mainObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
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
          objc_msgSend(v5, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }

    -[AnalyticsWorkspace save](self->wspace, "save");
  }
  else
  {
    objectanalyticsHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_ERROR, "moc is nil", buf, 2u);
    }

  }
}

- (unint64_t)countEntitiesMatching:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->entityName)
  {
    -[AnalyticsWorkspace mainObjectContext](self->wspace, "mainObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objectanalyticsHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "moc is nil", buf, 2u);
      }
      v8 = 0;
      goto LABEL_17;
    }
    v6 = objc_alloc_init(MEMORY[0x1E0C97B48]);
    objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", self->entityName, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEntity:", v7);

    objc_msgSend(v6, "setPredicate:", v4);
    v15 = 0;
    v8 = -[NSObject countForFetchRequest:error:](v5, "countForFetchRequest:error:", v6, &v15);
    v9 = v15;
    if (v9)
    {
      objectanalyticsHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        -[NSObject description](v9, "description");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v12 = objc_msgSend(v11, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v17 = v12;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "error counting entities: %s", buf, 0xCu);

      }
    }
    else
    {
      objectanalyticsHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      v10 = v13;
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v17 = v8;
          _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "counted %ld entities", buf, 0xCu);
        }
        goto LABEL_16;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = (unint64_t)v4;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "an error occrred counting entities matching: %@", buf, 0xCu);
      }
    }
    v8 = 0;
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
  objectanalyticsHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_ERROR, "entityName is nil", buf, 2u);
  }
  v8 = 0;
LABEL_18:

  return v8;
}

- (int64_t)removeEntitiesMatching:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  int64_t v14;
  void *v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->entityName)
  {
    -[AnalyticsWorkspace mainObjectContext](self->wspace, "mainObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C97B48]);
      objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", self->entityName, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEntity:", v7);

      objc_msgSend(v6, "setPredicate:", v4);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v6);
      objc_msgSend(v8, "setResultType:", 2);
      v18 = 0;
      -[NSObject executeRequest:error:](v5, "executeRequest:error:", v8, &v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v18;
      if (v10)
      {
        objectanalyticsHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          -[NSObject description](v10, "description");
          v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v13 = objc_msgSend(v12, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v20 = v13;
          _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_ERROR, "error batch deleting: %s", buf, 0xCu);

        }
        v14 = 0;
      }
      else
      {
        objc_msgSend(v9, "result");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v15, "integerValue");

        objectanalyticsHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v20 = v14;
          _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_DEFAULT, "batch deleted %ld entities", buf, 0xCu);
        }

        -[AnalyticsWorkspace save](self->wspace, "save");
      }

    }
    else
    {
      objectanalyticsHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "moc is nil", buf, 2u);
      }
      v14 = 0;
    }

  }
  else
  {
    objectanalyticsHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_ERROR, "entityName is nil", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
}

- (unint64_t)updateEntitiesMatching:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->entityName)
  {
    -[AnalyticsWorkspace mainObjectContext](self->wspace, "mainObjectContext");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objectanalyticsHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "moc is nil", buf, 2u);
      }
      v15 = 0;
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0C97AB0], "batchUpdateRequestWithEntityName:", self->entityName);
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject setPropertiesToUpdate:](v9, "setPropertiesToUpdate:", v7);
    -[NSObject setPredicate:](v9, "setPredicate:", v6);
    -[NSObject setResultType:](v9, "setResultType:", 2);
    v20 = 0;
    -[NSObject executeRequest:error:](v8, "executeRequest:error:", v9, &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;
    if (v11)
    {
      objectanalyticsHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "description");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = objc_msgSend(v13, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v22 = v14;
        _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_ERROR, "batch update return error: %s", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v10, "result");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "result");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17 != 1)
        {
          v15 = 0;
          goto LABEL_17;
        }
        objc_msgSend(v10, "result");
        v12 = objc_claimAutoreleasedReturnValue();
        -[NSObject objectAtIndex:](v12, "objectAtIndex:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v18, "unsignedIntegerValue");

LABEL_16:
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
    }
    v15 = 0;
    goto LABEL_16;
  }
  objectanalyticsHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_ERROR, "entityName is nil", buf, 2u);
  }
  v15 = 0;
LABEL_19:

  return v15;
}

- (id)_fetch:(id)a3 sortDesc:(id)a4
{
  return -[ObjectAnalytics _fetch:sortDesc:limit:](self, "_fetch:sortDesc:limit:", a3, a4, 0);
}

- (id)_fetch:(id)a3 sortDesc:(id)a4 limit:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[AnalyticsWorkspace mainObjectContext](self->wspace, "mainObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (!v9)
      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("timeStamp"), 1);
    if (self->managedCache)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", self->entityName, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc_init(MEMORY[0x1E0C97B48]);
      objc_msgSend(v17, "setEntity:", v16);
      if (v8)
        objc_msgSend(v17, "setPredicate:", v8);
      else
        objc_msgSend(v17, "setReturnsObjectsAsFaults:", 0);
      v23[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSortDescriptors:", v18);

      if (a5)
        objc_msgSend(v17, "setFetchLimit:", a5);
      v20 = 0;
      objc_msgSend(v10, "executeFetchRequest:error:", v17, &v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v20;

      if (v15)
        goto LABEL_16;
    }
    objectanalyticsHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "description");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = objc_msgSend(v13, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v22 = v14;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_ERROR, "fetch failed, err %s", buf, 0xCu);

    }
    v15 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v15 = 0;
LABEL_17:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->entityName, 0);
  objc_storeStrong((id *)&self->wspace, 0);
}

@end
