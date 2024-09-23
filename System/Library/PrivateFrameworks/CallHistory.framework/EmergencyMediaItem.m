@implementation EmergencyMediaItem

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("EmergencyMediaItem"));
}

+ (id)managedEmergencyMediaItemForEmergencyMediaItem:(id)a3 inManagedObjectContext:(id)a4
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
  int v16;
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
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
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("EmergencyMediaItem"));
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
        v16 = 138543618;
        v17 = CFSTR("EmergencyMediaItem");
        v18 = 2114;
        v19 = v6;
        _os_log_impl(&dword_1B3FA4000, v13, OS_LOG_TYPE_DEFAULT, "Could not find entity description with name %{public}@ in managed object context %{public}@. Falling back to convenience initializer.", (uint8_t *)&v16, 0x16u);
      }

      v11 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:", v6);
    }
    v12 = (void *)v11;
    objc_msgSend(v5, "assetId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAssetId:", v14);

    objc_msgSend(v12, "setEmergencyMediaType:", objc_msgSend(v5, "emergencyMediaType"));
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)managedEmergencyMediaItemsForEmergencyMediaItems:(id)a3 inManagedObjectContext:(id)a4
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
        objc_msgSend(a1, "managedEmergencyMediaItemForEmergencyMediaItem:inManagedObjectContext:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), v7, (_QWORD)v17);
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

- (CHEmergencyMediaItem)chEmergencyMediaItem
{
  void *v3;
  CHEmergencyMediaItem *v4;
  void *v5;
  CHEmergencyMediaItem *v6;

  -[EmergencyMediaItem assetId](self, "assetId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [CHEmergencyMediaItem alloc];
    -[EmergencyMediaItem assetId](self, "assetId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CHEmergencyMediaItem initWithAssetId:mediaType:](v4, "initWithAssetId:mediaType:", v5, -[EmergencyMediaItem emergencyMediaType](self, "emergencyMediaType"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
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

  v4 = a3;
  +[DBManager entityDescriptionHavingName:forContext:](DBManager, "entityDescriptionHavingName:forContext:", CFSTR("EmergencyMediaItem"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEntity:insertIntoManagedObjectContext:", v5, v4);
  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logHandleForDomain:", "EmergencyMediaItem");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[EmergencyMediaItem(Additions) copyWithContext:].cold.1((uint64_t)v4, v8);

    v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:", v4);
  }
  v9 = (void *)v6;
  -[EmergencyMediaItem assetId](self, "assetId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAssetId:", v10);

  objc_msgSend(v9, "setEmergencyMediaType:", -[EmergencyMediaItem emergencyMediaType](self, "emergencyMediaType"));
  return v9;
}

@end
