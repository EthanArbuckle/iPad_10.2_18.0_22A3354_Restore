@implementation ABSAddressBookContextStorage

- (ABSAddressBookContextStorage)init
{
  ABSAddressBookContextStorage *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *addedMemberships;
  NSMutableDictionary *v5;
  NSMutableDictionary *records;
  NSMutableDictionary *v7;
  NSMutableDictionary *deletedRecords;
  NSMutableDictionary *v9;
  NSMutableDictionary *updatedRecords;
  NSMutableArray *v11;
  NSMutableArray *insertedRecords;
  NSMutableDictionary *v13;
  NSMutableDictionary *deletedMemberships;
  NSMutableDictionary *v15;
  NSMutableDictionary *revertedRecords;
  ABSAddressBookContextStorage *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ABSAddressBookContextStorage;
  v2 = -[ABSAddressBookContextStorage init](&v19, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    addedMemberships = v2->_addedMemberships;
    v2->_addedMemberships = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    records = v2->_records;
    v2->_records = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    deletedRecords = v2->_deletedRecords;
    v2->_deletedRecords = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    updatedRecords = v2->_updatedRecords;
    v2->_updatedRecords = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    insertedRecords = v2->_insertedRecords;
    v2->_insertedRecords = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    deletedMemberships = v2->_deletedMemberships;
    v2->_deletedMemberships = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    revertedRecords = v2->_revertedRecords;
    v2->_revertedRecords = v15;

    v17 = v2;
  }

  return v2;
}

- (BOOL)addRecord:(id)a3
{
  id v5;
  void *v6;

  if (a3)
  {
    v5 = a3;
    -[ABSAddressBookContextStorage insertedRecords](self, "insertedRecords");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

    -[ABSAddressBookContextStorage setHasUnsavedChanges:](self, "setHasUnsavedChanges:", 1);
  }
  return a3 != 0;
}

- (BOOL)recordUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBookContextStorage records](self, "records");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v7 == v4;
  if (v7 == v4)
  {
    if (!v4)
    {
      v8 = 0;
      goto LABEL_5;
    }
    -[ABSAddressBookContextStorage updatedRecords](self, "updatedRecords");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v4, v5);

    -[ABSAddressBookContextStorage setHasUnsavedChanges:](self, "setHasUnsavedChanges:", 1);
    v7 = v4;
  }

LABEL_5:
  return v8;
}

- (id)cnImplFetched:(id)a3 creationBlock:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (objc_msgSend(v6, "iOSLegacyIdentifier") == -1)
  {
    +[ABSLog log](ABSLog, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ABSAddressBookContextStorage cnImplFetched:creationBlock:].cold.1(v15);

    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v6, "iOSLegacyIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABSAddressBookContextStorage records](self, "records");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[ABSAddressBookContextStorage revertedRecords](self, "revertedRecords");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[ABSAddressBookContextStorage revertedRecords](self, "revertedRecords");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObjectForKey:", v8);

        objc_msgSend(v12, "replaceRecordStorageWithCNObject:", v6);
        v14 = v12;
      }
      else
      {
        v7[2](v7, v6);
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v14;
      -[ABSAddressBookContextStorage records](self, "records");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v10, v8);

    }
  }

  return v10;
}

- (id)recordFetched:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v4 = a3;
  if (objc_msgSend(v4, "id") == -1)
  {
    NSLog(CFSTR("Record with invalid id attempted merge into ABS context cache"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "id"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[ABSAddressBookContextStorage records](self, "records");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        -[ABSAddressBookContextStorage revertedRecords](self, "revertedRecords");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          -[ABSAddressBookContextStorage revertedRecords](self, "revertedRecords");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "removeObjectForKey:", v5);

          objc_msgSend(v4, "cnImpl");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "replaceRecordStorageWithCNObject:", v11);

          v12 = v9;
          v4 = v12;
        }
        -[ABSAddressBookContextStorage records](self, "records");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v4, v5);

      }
    }

  }
  return v4;
}

- (BOOL)deleteRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBookContextStorage records](self, "records");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v7)
  {
    -[ABSAddressBookContextStorage insertedRecords](self, "insertedRecords");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfObject:", v4);

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      -[ABSAddressBookContextStorage insertedRecords](self, "insertedRecords");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", v10);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v8 = v10;
    }
  }
  v12 = v7 == v4;
  if (v7 != v4)
    goto LABEL_12;
  if (v4)
  {
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[ABSAddressBookContextStorage records](self, "records");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectForKey:", v5);

      -[ABSAddressBookContextStorage deletedRecords](self, "deletedRecords");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v4, v5);
    }
    else
    {
      -[ABSAddressBookContextStorage insertedRecords](self, "insertedRecords");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectAtIndex:", v8);
    }

    -[ABSAddressBookContextStorage setHasUnsavedChanges:](self, "setHasUnsavedChanges:", 1);
    v7 = v4;
LABEL_12:

    goto LABEL_13;
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (BOOL)addMemberRecord:(id)a3 toRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v7, "id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CNIdentifierString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (v6 && v7)
  {
    -[ABSAddressBookContextStorage records](self, "records");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 == v7)
    {
      -[ABSAddressBookContextStorage addedMemberships](self, "addedMemberships");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v8);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        -[ABSAddressBookContextStorage addedMemberships](self, "addedMemberships");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v14, v8);

      }
      objc_msgSend(v14, "objectForKey:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v16 == 0;

      objc_msgSend(v14, "setObject:forKey:", v6, v9);
      -[ABSAddressBookContextStorage deletedMemberships](self, "deletedMemberships");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "removeObjectForKey:", v9);
      -[ABSAddressBookContextStorage setHasUnsavedChanges:](self, "setHasUnsavedChanges:", 1);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)removeMemberRecord:(id)a3 fromRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v7, "id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CNIdentifierString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (v6 && v7)
  {
    -[ABSAddressBookContextStorage records](self, "records");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 == v7)
    {
      -[ABSAddressBookContextStorage deletedMemberships](self, "deletedMemberships");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v8);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        -[ABSAddressBookContextStorage deletedMemberships](self, "deletedMemberships");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v14, v8);

      }
      objc_msgSend(v14, "objectForKey:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v16 == 0;

      objc_msgSend(v14, "setObject:forKey:", v6, v9);
      -[ABSAddressBookContextStorage addedMemberships](self, "addedMemberships");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "removeObjectForKey:", v9);
      -[ABSAddressBookContextStorage setHasUnsavedChanges:](self, "setHasUnsavedChanges:", 1);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSArray)recordsWithPendingMembershipAdditions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSArray *v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBookContextStorage addedMemberships](self, "addedMemberships");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__ABSAddressBookContextStorage_recordsWithPendingMembershipAdditions__block_invoke;
  v9[3] = &unk_24C2F4C58;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  v6 = v10;
  v7 = (NSArray *)v5;

  return v7;
}

void __69__ABSAddressBookContextStorage_recordsWithPendingMembershipAdditions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    v6 = v7;
  }

}

- (NSArray)recordsWithPendingMembershipDeletions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSArray *v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBookContextStorage deletedMemberships](self, "deletedMemberships");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__ABSAddressBookContextStorage_recordsWithPendingMembershipDeletions__block_invoke;
  v9[3] = &unk_24C2F4C58;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  v6 = v10;
  v7 = (NSArray *)v5;

  return v7;
}

void __69__ABSAddressBookContextStorage_recordsWithPendingMembershipDeletions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    v6 = v7;
  }

}

- (id)addedMembersForRecord:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a3, "id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBookContextStorage addedMemberships](self, "addedMemberships");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)removedMembersForRecord:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a3, "id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBookContextStorage deletedMemberships](self, "deletedMemberships");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_resetIncludingLivingRecords:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  -[ABSAddressBookContextStorage deletedRecords](self, "deletedRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[ABSAddressBookContextStorage insertedRecords](self, "insertedRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[ABSAddressBookContextStorage updatedRecords](self, "updatedRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[ABSAddressBookContextStorage deletedMemberships](self, "deletedMemberships");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[ABSAddressBookContextStorage addedMemberships](self, "addedMemberships");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  if (v3)
  {
    -[ABSAddressBookContextStorage records](self, "records");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllObjects");

  }
  -[ABSAddressBookContextStorage setHasUnsavedChanges:](self, "setHasUnsavedChanges:", 0);
}

- (void)commitPendingChanges
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
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
  -[ABSAddressBookContextStorage insertedRecords](self, "insertedRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v8, "id") != -1)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v8, "id"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[ABSAddressBookContextStorage records](self, "records");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v8, v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ABSAddressBookContextStorage deletedRecords](self, "deletedRecords", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
        if (objc_msgSend(v16, "intValue") != -1)
        {
          -[ABSAddressBookContextStorage records](self, "records");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeObjectForKey:", v16);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

  -[ABSAddressBookContextStorage _resetIncludingLivingRecords:](self, "_resetIncludingLivingRecords:", 0);
}

- (void)revert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ABSAddressBookContextStorage records](self, "records");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_8);

  -[ABSAddressBookContextStorage revertedRecords](self, "revertedRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBookContextStorage records](self, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

  -[ABSAddressBookContextStorage deletedRecords](self, "deletedRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_6);

  -[ABSAddressBookContextStorage revertedRecords](self, "revertedRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBookContextStorage deletedRecords](self, "deletedRecords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v8);

  -[ABSAddressBookContextStorage _resetIncludingLivingRecords:](self, "_resetIncludingLivingRecords:", 1);
}

uint64_t __38__ABSAddressBookContextStorage_revert__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "replaceRecordStorageWithCNObject:", 0);
}

uint64_t __38__ABSAddressBookContextStorage_revert__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "replaceRecordStorageWithCNObject:", 0);
}

- (NSMutableDictionary)records
{
  return self->_records;
}

- (NSMutableDictionary)deletedRecords
{
  return self->_deletedRecords;
}

- (NSMutableArray)insertedRecords
{
  return self->_insertedRecords;
}

- (NSMutableDictionary)updatedRecords
{
  return self->_updatedRecords;
}

- (BOOL)hasUnsavedChanges
{
  return self->_hasUnsavedChanges;
}

- (void)setHasUnsavedChanges:(BOOL)a3
{
  self->_hasUnsavedChanges = a3;
}

- (NSMutableDictionary)deletedMemberships
{
  return self->_deletedMemberships;
}

- (NSMutableDictionary)addedMemberships
{
  return self->_addedMemberships;
}

- (NSMutableDictionary)revertedRecords
{
  return self->_revertedRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revertedRecords, 0);
  objc_storeStrong((id *)&self->_addedMemberships, 0);
  objc_storeStrong((id *)&self->_deletedMemberships, 0);
  objc_storeStrong((id *)&self->_updatedRecords, 0);
  objc_storeStrong((id *)&self->_insertedRecords, 0);
  objc_storeStrong((id *)&self->_deletedRecords, 0);
  objc_storeStrong((id *)&self->_records, 0);
}

- (void)cnImplFetched:(os_log_t)log creationBlock:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20A301000, log, OS_LOG_TYPE_ERROR, "Record with invalid id attempted merge into ABS context cache", v1, 2u);
}

@end
