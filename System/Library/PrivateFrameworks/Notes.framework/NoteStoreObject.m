@implementation NoteStoreObject

- (NoteStoreObject)parentStore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[NoteStoreObject externalIdentifier](self, "externalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    -[NoteStoreObject externalIdentifier](self, "externalIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasSuffix:", CFSTR("/")))
    {
      objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 1);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    -[NoteStoreObject account](self, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "storeForExternalId:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "defaultStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v13)
      v14 = 0;
    else
      v14 = v11;

  }
  else
  {
    v14 = 0;
  }
  return (NoteStoreObject *)v14;
}

- (NSArray)ancestorStores
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteStoreObject parentStore](self, "parentStore");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_msgSend(v3, "addObject:", v5);
      objc_msgSend(v5, "parentStore");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v7;
}

- (id)notesForServerIds:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x1E0C97B48];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x1E0C97B20];
  -[NoteStoreObject managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entityForName:inManagedObjectContext:", CFSTR("Note"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setEntity:", v9);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(store == %@) AND (serverId IN %@)"), self, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPredicate:", v10);
  -[NoteStoreObject managedObjectContext](self, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "executeFetchRequest:error:", v6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)notesForIntegerIds:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x1E0C97B48];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x1E0C97B20];
  -[NoteStoreObject managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entityForName:inManagedObjectContext:", CFSTR("Note"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setEntity:", v9);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(store == %@) AND (integerId IN %@)"), self, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPredicate:", v10);
  -[NoteStoreObject managedObjectContext](self, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "executeFetchRequest:error:", v6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)notesForGUIDs:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x1E0C97B48];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x1E0C97B20];
  -[NoteStoreObject managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entityForName:inManagedObjectContext:", CFSTR("Note"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setEntity:", v9);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(store == %@) AND (guid IN %@)"), self, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPredicate:", v10);
  -[NoteStoreObject managedObjectContext](self, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "executeFetchRequest:error:", v6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)notesForServerIntIds:(id)a3 ascending:(BOOL)a4 limit:(unint64_t)a5
{
  _BOOL8 v6;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  v8 = (objc_class *)MEMORY[0x1E0C97B48];
  v9 = a3;
  v10 = objc_alloc_init(v8);
  v11 = (void *)MEMORY[0x1E0C97B20];
  -[NoteStoreObject managedObjectContext](self, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entityForName:inManagedObjectContext:", CFSTR("Note"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setEntity:", v13);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(store == %@) AND (externalServerIntId IN %@)"), self, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredicate:", v14);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("externalServerIntId"), v6);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortDescriptors:", v16);

  objc_msgSend(v10, "setFetchLimit:", a5);
  -[NoteStoreObject managedObjectContext](self, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "executeFetchRequest:error:", v10, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)notesForServerIntIdsInRange:(_NSRange)a3 ascending:(BOOL)a4 limit:(unint64_t)a5
{
  _BOOL8 v6;
  NSUInteger length;
  NSUInteger location;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  length = a3.length;
  location = a3.location;
  v10 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  v11 = (void *)MEMORY[0x1E0C97B20];
  -[NoteStoreObject managedObjectContext](self, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entityForName:inManagedObjectContext:", CFSTR("Note"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setEntity:", v13);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(store == %@) AND (externalServerIntId >= %d) AND (externalServerIntId < %d)"), self, location, location + length);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v14);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("externalServerIntId"), v6);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortDescriptors:", v16);

  objc_msgSend(v10, "setFetchLimit:", a5);
  -[NoteStoreObject managedObjectContext](self, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "executeFetchRequest:error:", v10, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)notesForServerIntIds:(id)a3
{
  return -[NoteStoreObject notesForServerIntIds:ascending:limit:](self, "notesForServerIntIds:ascending:limit:", a3, 1, 0);
}

- (id)notesForServerIntIdsInRange:(_NSRange)a3
{
  return -[NoteStoreObject notesForServerIntIdsInRange:ascending:limit:](self, "notesForServerIntIdsInRange:ascending:limit:", a3.location, a3.length, 1, 0);
}

- (unsigned)maximumServerIntId
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  id v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  v4 = (void *)MEMORY[0x1E0C97B20];
  -[NoteStoreObject managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityForName:inManagedObjectContext:", CFSTR("Note"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setEntity:", v6);
  -[NoteStoreObject predicateForNotes](self, "predicateForNotes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("externalServerIntId"), 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v9);

  objc_msgSend(v3, "setFetchLimit:", 1);
  -[NoteStoreObject managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v3, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;

  if (v12)
  {
    objc_msgSend(v12, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unresolved error while getting max server int id in store %@.\nError: %@, %@"), self, v12, v13);

    v14 = 0;
  }
  else
  {
    objc_msgSend(v11, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "serverIntId");

    v14 = v16 & ~(v16 >> 63);
  }

  return v14;
}

- (unint64_t)minimumSequenceNumberForServerIntIds:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  id v19;

  v4 = (objc_class *)MEMORY[0x1E0C97B48];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x1E0C97B20];
  -[NoteStoreObject managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entityForName:inManagedObjectContext:", CFSTR("Note"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setEntity:", v9);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(store == %@) AND (externalServerIntId IN %@)"), self, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPredicate:", v10);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("externalSequenceNumber"), 1);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v12);

  objc_msgSend(v6, "setFetchLimit:", 1);
  -[NoteStoreObject managedObjectContext](self, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v13, "executeFetchRequest:error:", v6, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;

  if (v15)
  {
    objc_msgSend(v15, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unresolved error while getting min sequence number in store %@.\nError: %@, %@"), self, v15, v16);
    v17 = 0;
  }
  else
  {
    objc_msgSend(v14, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "sequenceNumber");
  }

  return v17;
}

- (id)predicateForNotes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("store == %@"), self);
}

- (id)collectionInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", CFSTR("Store"), CFSTR("NoteCollectionType"));
  -[NoteStoreObject account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("NoteCollectionPrimaryIdentifier"));

  -[NoteStoreObject externalIdentifier](self, "externalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("NoteCollectionSecondaryIdentifier"));

  return v3;
}

- (id)basicAccountIdentifier
{
  void *v2;
  void *v3;

  -[NoteStoreObject account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)searchDomainIdentifier
{
  void *v2;
  void *v3;

  -[NoteStoreObject account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchDomainIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)titleForTableViewCell
{
  void *v3;
  void *v4;
  int v5;

  -[NoteStoreObject account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NoteStoreObject isEqual:](self, "isEqual:", v4);

  if (v5)
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Notes"), CFSTR("Notes"), 0, 1);
  else
    -[NoteStoreObject name](self, "name");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)creationDate
{
  return 0;
}

- (NSDate)modificationDate
{
  return 0;
}

- (BOOL)isDeletable
{
  return 0;
}

- (BOOL)isMovable
{
  return 0;
}

- (int64_t)visibilityTestingType
{
  return 2;
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)CFSTR("Legacy");
}

- (unint64_t)searchResultsSection
{
  return 4;
}

- (unint64_t)searchResultType
{
  return 4;
}

- (BOOL)searchResultCanBeDeletedFromNoteContext
{
  return 0;
}

- (BOOL)isHiddenFromIndexing
{
  void *v2;
  char v3;

  -[NoteStoreObject account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "didChooseToMigrate");

  return v3;
}

- (NSArray)authorsExcludingCurrentUser
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSString)searchIndexingIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[NoteStoreObject objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URIRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (CSSearchableItemAttributeSet)userActivityContentAttributeSet
{
  return (CSSearchableItemAttributeSet *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithItemContentType:", CFSTR("com.apple.notes.spotlightrecord"));
}

- (CSSearchableItemAttributeSet)searchableItemAttributeSet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NoteStoreObject userActivityContentAttributeSet](self, "userActivityContentAttributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteStoreObject name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayName:", v4);

  -[NoteStoreObject name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextContent:", v5);

  objc_msgSend(v3, "setIc_searchResultType:", 3);
  -[NoteStoreObject account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "preventMovingNotesToOtherAccounts"))
    v7 = &unk_1E81F0288;
  else
    v7 = &unk_1E81F02A0;
  objc_msgSend(v3, "setDataOwnerType:", v7);

  objc_msgSend(v3, "ic_populateValuesForSpecializedFields");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NoteStoreObject associateAppEntityWithSearchableItemAttributeSet:](self, "associateAppEntityWithSearchableItemAttributeSet:", v3);
  return (CSSearchableItemAttributeSet *)v3;
}

- (id)dataForTypeIdentifier:(id)a3
{
  return 0;
}

@end
