@implementation PFUbiquityTransactionEntry

- (id)initAndInsertIntoManagedObjectContext:(id)a3
{
  id result;
  objc_super v6;

  if (objc_msgSend(a3, "persistentStoreCoordinator"))
  {
    v6.receiver = self;
    v6.super_class = (Class)PFUbiquityTransactionEntry;
    result = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:](&v6, sel_initWithEntity_insertIntoManagedObjectContext_, +[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("PFUbiquityTransactionEntry"), a3), a3);
    if (result)
      return result;
  }
  else
  {

  }
  return 0;
}

- (void)setTransactionType:(void *)a1
{
  id v3;

  if (a1)
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a2);
    objc_msgSend(a1, "setTransactionTypeNum:", v3);

  }
}

+ (void)createTransactionEntriesForCompressedObjectIDs:(uint64_t)a3 withTransactionType:(uint64_t)a4 withImportContext:
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PFUbiquityTransactionEntry *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a2, "count"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = a2;
  v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v11);
        objc_opt_self();
        v13 = [PFUbiquityTransactionEntry alloc];
        if (a4)
          v14 = *(void **)(a4 + 16);
        else
          v14 = 0;
        v15 = -[PFUbiquityTransactionEntry initAndInsertIntoManagedObjectContext:](v13, "initAndInsertIntoManagedObjectContext:", objc_msgSend(v14, "managedObjectContext"));
        -[PFUbiquityTransactionEntry setTransactionType:](v15, a3);
        if (a4)
        {
          v16 = *(_QWORD *)(a4 + 64);
          if (v16)
            v17 = *(_QWORD *)(v16 + 120);
          else
            v17 = 0;
          objc_msgSend(v15, "setTransactionNumber:", v17);
          v18 = *(_QWORD *)(a4 + 56);
          if (v18 && (v19 = *(_QWORD *)(v18 + 72)) != 0)
            v20 = *(_QWORD *)(v19 + 8);
          else
            v20 = 0;
          objc_msgSend(v15, "setTransactionDate:", v20);
          v21 = *(_QWORD *)(a4 + 56);
          if (v21 && (v22 = *(_QWORD *)(v21 + 24)) != 0)
            v23 = *(_QWORD *)(v22 + 56);
          else
            v23 = 0;
          objc_msgSend(v15, "setTransactionLogFilename:", v23);
          objc_msgSend(v15, "setActingPeer:", *(_QWORD *)(a4 + 24));
          objc_msgSend(v15, "setStoreMetadata:", *(_QWORD *)(a4 + 16));
          v24 = *(_QWORD *)(a4 + 64);
        }
        else
        {
          objc_msgSend(v15, "setTransactionNumber:", 0);
          objc_msgSend(v15, "setTransactionDate:", 0);
          objc_msgSend(v15, "setTransactionLogFilename:", 0);
          objc_msgSend(v15, "setActingPeer:", 0);
          objc_msgSend(v15, "setStoreMetadata:", 0);
          v24 = 0;
        }
        v25 = (_QWORD *)-[PFUbiquityStoreSaveSnapshot globalObjectIDFromCompressedObjectID:](v24, v12);
        v26 = -[PFUbiquityGlobalObjectID createGlobalIDString](v25);
        objc_msgSend(v15, "setGlobalIDStr:", v26);

        if (a4)
        {
          objc_msgSend(v15, "setLocalIDStr:", objc_msgSend(*(id *)(a4 + 72), "objectForKey:", v25));
          v27 = *(_QWORD *)(a4 + 56);
          if (v27)
          {
            v28 = *(_QWORD *)(v27 + 64);
            goto LABEL_21;
          }
        }
        else
        {
          objc_msgSend(v15, "setLocalIDStr:", objc_msgSend(0, "objectForKey:", v25));
        }
        v28 = 0;
LABEL_21:
        v29 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString](v28);
        objc_msgSend(v15, "setKnowledgeVectorString:", v29);

        objc_msgSend(v7, "addObject:", v15);
        ++v11;
      }
      while (v9 != v11);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v9 = v30;
    }
    while (v30);
  }
  return v7;
}

+ (uint64_t)deleteTransactionEntriesAfterPeerState:(uint64_t)a3 forStoreName:(void *)a4 inManagedObjectContext:
{
  NSFetchRequest *v7;
  NSFetchRequest *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSBatchDeleteRequest *v18;
  uint64_t v19;
  void *v21;
  NSFetchRequest *v22;
  id v23;

  objc_opt_self();
  v23 = 0;
  v7 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("PFUbiquityTransactionEntry"));
  if (!a3)
    return 0;
  v8 = v7;
  if (!objc_msgSend(a4, "persistentStoreCoordinator"))
    return 0;
  v21 = a4;
  v22 = v8;
  v9 = (void *)objc_msgSend(a2, "allKeys");
  v10 = objc_msgSend(v9, "count");
  v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v10)
  {
    v13 = 0;
    v14 = 0;
    while (1)
    {
      v15 = objc_msgSend(v9, "objectAtIndex:", v13);
      v16 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", v15), "objectForKey:", CFSTR("YTRANSACTIONNUMBER"));
      if (!v15)
        break;
      v17 = v16;
      if (!v16)
        break;
      if ((v14 & 1) != 0)
        objc_msgSend(v11, "appendString:", CFSTR(" OR "));
      objc_msgSend(v11, "appendString:", CFSTR("(actingPeer.peerKey == %@ AND transactionNumber > %@ AND storeMetadata.ubiquityName == %@)"));
      objc_msgSend(v12, "addObject:", v15);
      objc_msgSend(v12, "addObject:", v17);
      objc_msgSend(v12, "addObject:", a3);
      ++v13;
      v14 = 1;
      if (v10 == v13)
        goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    if (objc_msgSend(v12, "count"))
      -[NSFetchRequest setPredicate:](v22, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:argumentArray:", v11, v12));
    v18 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", v22);
    v19 = objc_msgSend(v21, "executeRequest:error:", v18, &v23);

    if (v19)
      goto LABEL_16;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Conflict metadata fetch failed with error: %@\nuserInfo: %@\n Conflict resolution will not work. Original Fetch Request: %@"), "+[PFUbiquityTransactionEntry(UbiquityMethods) deleteTransactionEntriesAfterPeerState:forStoreName:inManagedObjectContext:]", 320, v23, objc_msgSend(v23, "userInfo"), v22);
  v19 = 0;
LABEL_16:

  return v19;
}

+ (uint64_t)transactionEntriesForPeerID:(uint64_t)a3 beforeTransacationNumber:(void *)a4 forStoreNamed:(void *)a5 inManagedObjectContext:
{
  uint64_t v9;
  uint64_t result;
  NSFetchRequest *v11;
  void *v12;
  id v13;

  objc_opt_self();
  v13 = 0;
  v9 = objc_msgSend(a2, "length");
  result = 0;
  if (a3)
  {
    if (v9)
    {
      result = objc_msgSend(a4, "length");
      if (result)
      {
        result = objc_msgSend(a5, "persistentStoreCoordinator");
        if (result)
        {
          v11 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("PFUbiquityTransactionEntry"));
          -[NSFetchRequest setPredicate:](v11, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(actingPeer.peerKey == %@ AND transactionNumber < %@ AND storeMetadata.ubiquityName == %@)"), a2, a3, a4));
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("transactionDate"), 1);
          -[NSFetchRequest setSortDescriptors:](v11, "setSortDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v12, 0));

          result = objc_msgSend(a5, "executeFetchRequest:error:", v11, &v13);
          if (!result)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Got nil transaction entries for fetch request: %@\nError: %@\nuserInfo: %@\n"), "+[PFUbiquityTransactionEntry(UbiquityMethods) transactionEntriesForPeerID:beforeTransacationNumber:forStoreNamed:inManagedObjectContext:]", 385, v11, v13, objc_msgSend(v13, "userInfo"));
            }
            return 0;
          }
        }
      }
    }
  }
  return result;
}

@end
