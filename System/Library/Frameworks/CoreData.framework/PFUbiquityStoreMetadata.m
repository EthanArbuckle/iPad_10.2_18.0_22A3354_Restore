@implementation PFUbiquityStoreMetadata

- (PFUbiquityStoreMetadata)initWithUbiquityName:(id)a3 andUbiquityRootLocation:(id)a4 insertIntoManagedObjectContext:(id)a5
{
  uint64_t v9;
  PFUbiquityStoreMetadata *v10;
  PFUbiquityStoreMetadata *v11;

  v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "valueForKey:", CFSTR("PFUbiquityStoreMetadata"));
  if (v9)
  {
    v10 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:](self, "initWithEntity:insertIntoManagedObjectContext:", v9, a5);
    v11 = v10;
    if (v10)
    {
      -[PFUbiquityStoreMetadata setUbiquityName:](v10, "setUbiquityName:", a3);
      self = (PFUbiquityStoreMetadata *)-[PFUbiquityLocation createFullURL]((uint64_t)a4);
      -[PFUbiquityStoreMetadata setUbiquityRootURLString:](v11, "setUbiquityRootURLString:", -[PFUbiquityStoreMetadata absoluteString](self, "absoluteString"));
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (uint64_t)storeMetadatasWithName:(void *)a3 inManagedObjectContext:
{
  NSFetchRequest *v5;
  uint64_t v6;
  uint64_t v8;

  objc_opt_self();
  v5 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("PFUbiquityStoreMetadata"));
  if (!objc_msgSend(a2, "length") || !objc_msgSend(a3, "persistentStoreCoordinator"))
    return 0;
  -[NSFetchRequest setPredicate:](v5, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ubiquityName == %@"), a2));
  v8 = 0;
  v6 = objc_msgSend(a3, "executeFetchRequest:error:", v5, &v8);
  if (v8)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error locating metadata for local persistent store: %@, stores: %@"), "+[PFUbiquityStoreMetadata(UbiquityMethods) storeMetadatasWithName:inManagedObjectContext:]", 94, v8, v6);
    return 0;
  }
  return v6;
}

+ (uint64_t)metadataForStoreWithName:(void *)a3 inManagedObjectContext:
{
  void *v5;

  objc_opt_self();
  if (objc_msgSend(a3, "persistentStoreCoordinator")
    && (v5 = (void *)+[PFUbiquityStoreMetadata storeMetadatasWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, a2, a3), objc_msgSend(v5, "count")))
  {
    return objc_msgSend(v5, "objectAtIndex:", 0);
  }
  else
  {
    return 0;
  }
}

- (void)updateWithStore:(uint64_t)a3 andRootLocation:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  if (!a1)
    return;
  objc_msgSend(a1, "setStoreURLString:", objc_msgSend((id)objc_msgSend(a2, "URL"), "absoluteString"));
  objc_msgSend(a1, "setStoreIdentifier:", objc_msgSend(a2, "identifier"));
  objc_msgSend(a1, "setStoreType:", objc_msgSend(a2, "type"));
  v6 = objc_msgSend(a2, "options");
  if (!v6)
    goto LABEL_6;
  v7 = v6;
  v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", *MEMORY[0x1E0CB2CD8]), "reverseTransformedValue:", v6);
  if (!v8)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error setting store options on store metadata: %@, options: %@\nNSKeyedUnarchiveFromData transformer returned nil"), "-[PFUbiquityStoreMetadata(UbiquityMethods) setStoreOptions:]", 334, a1, v7);
LABEL_6:
    v8 = 0;
  }
  objc_msgSend(a1, "setStoreOptionsBinaryPlistData:", v8);
  v9 = -[PFUbiquityLocation createFullPath](a3);
  v10 = (void *)objc_msgSend(a1, "ubiquityRootURLString");
  if (v10)
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", objc_msgSend(a1, "ubiquityRootURLString"));
  v11 = objc_msgSend(v10, "path");
  if (v9)
  {
    v12 = v11;
    if ((objc_msgSend(v9, "isEqualToString:", v11) & 1) == 0)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Looks like the container URL moved for store metadata: %@\nNew Container URL: %@\nOld: %@"), "-[PFUbiquityStoreMetadata(UbiquityMethods) updateWithStore:andRootLocation:]", 122, a1, a3, v12);
      objc_msgSend(a1, "setUbiquityRootURLString:", v9);
    }
  }

  v13 = (void *)objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel");
  if (v13)
  {
    v14 = (id)+[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, v13);
    objc_msgSend(a1, "setModelVersionHashString:", v14);

  }
}

- (void)loadFromBaselineMetadata:(uint64_t)a3 withLocalPeerID:
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PFUbiquityPeerState *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSEntityDescription *v15;
  NSEntityDescription *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  PFUbiquityPeerRange *v28;
  uint64_t v29;
  id obj;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    if (a2 && (v4 = *(_QWORD *)(a2 + 48)) != 0)
      v5 = (void *)objc_msgSend(*(id *)(v4 + 8), "allKeys");
    else
      v5 = 0;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v45;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v45 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v9);
          v11 = -[PFUbiquityStoreMetadata peerStateForPeerID:](a1, v10);
          if (a2 && (v12 = *(_QWORD *)(a2 + 48)) != 0)
            v13 = objc_msgSend(*(id *)(v12 + 8), "objectForKey:", v10);
          else
            v13 = 0;
          -[PFUbiquityPeerState setTransactionNumber:](v11, "setTransactionNumber:", v13);
          if ((objc_msgSend((id)objc_msgSend(a1, "peerStates"), "containsObject:", v11) & 1) == 0)
            objc_msgSend(a1, "addPeerStatesObject:", v11);
          ++v9;
        }
        while (v7 != v9);
        v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        v7 = v14;
      }
      while (v14);
    }
    v15 = +[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("PFUbiquityPeerRange"), objc_msgSend(a1, "managedObjectContext"));
    if (v15)
    {
      v16 = v15;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      if (a2)
        v17 = *(void **)(a2 + 56);
      else
        v17 = 0;
      obj = (id)objc_msgSend(v17, "allKeys");
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      if (v34)
      {
        v32 = *(_QWORD *)v41;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v41 != v32)
              objc_enumerationMutation(obj);
            v35 = v18;
            v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v18);
            if ((objc_msgSend(v19, "isEqualToString:", a3) & 1) == 0)
            {
              v20 = a2 ? *(void **)(a2 + 56) : 0;
              v21 = (void *)objc_msgSend(v20, "valueForKey:", v19);
              v22 = +[PFUbiquityPeer peerForPeerID:inManagedObjectContext:createIfMissing:]((uint64_t)PFUbiquityPeer, v19, (void *)objc_msgSend(a1, "managedObjectContext"), 1);
              v36 = 0u;
              v37 = 0u;
              v38 = 0u;
              v39 = 0u;
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v37;
                do
                {
                  for (i = 0; i != v24; ++i)
                  {
                    if (*(_QWORD *)v37 != v25)
                      objc_enumerationMutation(v21);
                    v27 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                    v28 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:]([PFUbiquityPeerRange alloc], "initWithEntity:insertIntoManagedObjectContext:", v16, objc_msgSend(a1, "managedObjectContext"));
                    -[PFUbiquityPeerRange setPeer:](v28, "setPeer:", v22);
                    -[PFUbiquityPeerRange setStoreMetadata:](v28, "setStoreMetadata:", a1);
                    -[PFUbiquityPeerRange loadFromBaselineDictionary:](v28, v27);

                  }
                  v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
                }
                while (v24);
              }
            }
            v18 = v35 + 1;
          }
          while (v35 + 1 != v34);
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          v34 = v29;
        }
        while (v29);
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  loadFromBaselineMetadata: lost its stack and failed."), "-[PFUbiquityStoreMetadata(UbiquityMethods) loadFromBaselineMetadata:withLocalPeerID:]", 160);
    }
  }
}

- (PFUbiquityPeerState)peerStateForPeerID:(void *)a1
{
  NSFetchRequest *v4;
  void *v5;
  PFUbiquityPeerState *v6;
  void *v7;
  PFUbiquityPeerState *v8;
  uint64_t v10;

  if (!a1
    || !objc_msgSend(a2, "length")
    || !objc_msgSend((id)objc_msgSend(a1, "managedObjectContext"), "persistentStoreCoordinator"))
  {
    return 0;
  }
  v4 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("PFUbiquityPeerState"));
  -[NSFetchRequest setPredicate:](v4, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("peer.peerKey == %@ AND storeName == %@"), a2, objc_msgSend(a1, "ubiquityName")));
  v10 = 0;
  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "managedObjectContext"), "executeFetchRequest:error:", v4, &v10);
  if (v10)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error fetching peer state for peerID: %@, error: %@"), "-[PFUbiquityStoreMetadata(UbiquityMethods) peerStateForPeerID:]", 201, a2, v10);
LABEL_13:
    v6 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:]([PFUbiquityPeerState alloc], "initWithEntity:insertIntoManagedObjectContext:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "managedObjectContext"), "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("PFUbiquityPeerState")), objc_msgSend(a1, "managedObjectContext"));
    v8 = v6;
    -[PFUbiquityPeerState setPeer:](v6, "setPeer:", +[PFUbiquityPeer peerForPeerID:inManagedObjectContext:createIfMissing:]((uint64_t)PFUbiquityPeer, a2, (void *)objc_msgSend(a1, "managedObjectContext"), 1));
    -[PFUbiquityPeerState setStoreMetadata:](v6, "setStoreMetadata:", a1);
    -[PFUbiquityPeerState setStoreName:](v6, "setStoreName:", objc_msgSend(a1, "ubiquityName"));
    return v6;
  }
  v7 = v5;
  if (!objc_msgSend(v5, "count"))
    goto LABEL_13;
  if ((unint64_t)objc_msgSend(v7, "count") >= 2
    && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error fetching peer state for peerID: %@, too many peer states found: %@"), "-[PFUbiquityStoreMetadata(UbiquityMethods) peerStateForPeerID:]", 204, a2, v7);
  }
  v6 = (PFUbiquityPeerState *)objc_msgSend(v7, "objectAtIndex:", 0);
  if (!v6)
    goto LABEL_13;
  return v6;
}

- (void)updatePeerStatesToMatchKnowledgeVector:(void *)result
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(result, "peerStates");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v9, "setStoreName:", 0);
          objc_msgSend((id)objc_msgSend(v3, "managedObjectContext"), "deleteObject:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v6);
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    if (a2)
      v10 = (void *)objc_msgSend(*(id *)(a2 + 8), "allKeys", (_QWORD)v16);
    else
      v10 = 0;
    result = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (result)
    {
      v11 = result;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          if (a2)
          {
            v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13);
            v15 = objc_msgSend(*(id *)(a2 + 8), "objectForKey:", v14);
            if (v15)
              -[PFUbiquityPeerState setTransactionNumber:](-[PFUbiquityStoreMetadata peerStateForPeerID:](v3, v14), "setTransactionNumber:", v15);
          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        result = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        v11 = result;
      }
      while (result);
    }
  }
  return result;
}

@end
