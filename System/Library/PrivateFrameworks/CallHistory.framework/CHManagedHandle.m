@implementation CHManagedHandle

- (CHHandle)chHandle
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  CHHandle *v6;
  void *v7;
  CHHandle *v8;

  -[CHManagedHandle value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (v4 = -[CHManagedHandle type](self, "type") - 1, v4 <= 2))
  {
    v5 = v4 + 1;
    v6 = [CHHandle alloc];
    -[CHManagedHandle normalizedValue](self, "normalizedValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CHHandle initWithType:value:normalizedValue:](v6, "initWithType:value:normalizedValue:", v5, v3, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)managedHandleForHandle:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "persistentStoreCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "entitiesByName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Handle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEntity:insertIntoManagedObjectContext:", v10, v6);
    }
    else
    {
      ch_framework_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543618;
        v18 = CFSTR("Handle");
        v19 = 2114;
        v20 = v6;
        _os_log_impl(&dword_1B3FA4000, v13, OS_LOG_TYPE_DEFAULT, "Could not find entity description with name %{public}@ in managed object context %{public}@. Falling back to convenience initializer.", (uint8_t *)&v17, 0x16u);
      }

      v11 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:", v6);
    }
    v12 = (void *)v11;
    objc_msgSend(v5, "normalizedValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNormalizedValue:", v14);

    objc_msgSend(v12, "setType:", (__int16)objc_msgSend(v5, "type"));
    objc_msgSend(v5, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:", v15);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)managedHandlesForHandles:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(a1, "managedHandleForHandle:inManagedObjectContext:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), v7, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(v8, "copy");
  return v15;
}

- (id)copyWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  +[DBManager entityDescriptionHavingName:forContext:](DBManager, "entityDescriptionHavingName:forContext:", CFSTR("Handle"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEntity:insertIntoManagedObjectContext:", v5, v4);
  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logHandleForDomain:", "CHManagedHandle");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CHManagedHandle(Additions) copyWithContext:].cold.1((uint64_t)v4, v8);

    v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:", v4);
  }
  v9 = (void *)v6;
  -[CHManagedHandle normalizedValue](self, "normalizedValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNormalizedValue:", v10);

  objc_msgSend(v9, "setType:", -[CHManagedHandle type](self, "type"));
  -[CHManagedHandle value](self, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:", v11);

  return v9;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Handle"));
}

@end
