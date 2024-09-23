@implementation SHMediaLibrarySnapshot

- (SHMediaLibrarySnapshot)init
{
  void *v3;
  SHMediaLibrarySnapshot *v4;

  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SHMediaLibrarySnapshot initWithChanges:](self, "initWithChanges:", v3);

  return v4;
}

- (SHMediaLibrarySnapshot)initWithChanges:(id)a3
{
  id v4;
  SHMediaLibrarySnapshot *v5;
  uint64_t v6;
  NSMutableOrderedSet *changeset;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHMediaLibrarySnapshot;
  v5 = -[SHMediaLibrarySnapshot init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    changeset = v5->_changeset;
    v5->_changeset = (NSMutableOrderedSet *)v6;

  }
  return v5;
}

- (NSArray)changes
{
  void *v2;
  void *v3;

  -[SHMediaLibrarySnapshot changeset](self, "changeset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)hasChanges
{
  void *v2;
  BOOL v3;

  -[SHMediaLibrarySnapshot changeset](self, "changeset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)trackChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibrarySnapshot changes](self, "changes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = (void *)MEMORY[0x219A21784]();
  objc_msgSend(v5, "filterUsingPredicate:", v3);
  objc_autoreleasePoolPop(v6);
  v7 = (void *)objc_msgSend(v5, "copy");

  return (NSArray *)v7;
}

uint64_t __38__SHMediaLibrarySnapshot_trackChanges__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "libraryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSArray)allItemIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[SHMediaLibrarySnapshot changes](self, "changes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SHMediaLibrarySnapshot changes](self, "changes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "libraryItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return (NSArray *)v14;
}

- (void)addItem:(id)a3
{
  id v4;
  SHMediaLibraryChange *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SHMediaLibraryChange initWithLibraryItem:changeType:]([SHMediaLibraryChange alloc], "initWithLibraryItem:changeType:", v4, 1);

  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibrarySnapshot addChanges:](self, "addChanges:", v6);

}

- (void)removeItem:(id)a3
{
  id v4;
  SHMediaLibraryChange *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SHMediaLibraryChange initWithLibraryItem:changeType:]([SHMediaLibraryChange alloc], "initWithLibraryItem:changeType:", v4, 3);

  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibrarySnapshot addChanges:](self, "addChanges:", v6);

}

- (void)addChanges:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    *(_QWORD *)&v6 = 138412290;
    v17 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (-[SHMediaLibrarySnapshot isConflictingChange:](self, "isConflictingChange:", v10, v17))
        {
          sh_log_object();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v10, "libraryItem");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v17;
            v23 = v13;
            _os_log_impl(&dword_218BF1000, v11, OS_LOG_TYPE_ERROR, "Should not try to modify and remove the same library item (%@)", buf, 0xCu);

          }
        }
        else
        {
          -[SHMediaLibrarySnapshot changeset](self, "changeset");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "indexOfObject:", v10);

          -[SHMediaLibrarySnapshot changeset](self, "changeset");
          v16 = objc_claimAutoreleasedReturnValue();
          v11 = v16;
          if (v15 == 0x7FFFFFFFFFFFFFFFLL)
            -[NSObject addObject:](v16, "addObject:", v10);
          else
            -[NSObject replaceObjectAtIndex:withObject:](v16, "replaceObjectAtIndex:withObject:", v15, v10);
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v7);
  }

}

- (void)mergeSnapshot:(id)a3
{
  id v4;

  if (self != a3)
  {
    objc_msgSend(a3, "changes");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SHMediaLibrarySnapshot addChanges:](self, "addChanges:", v4);

  }
}

- (BOOL)containsLibraryItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1758];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__SHMediaLibrarySnapshot_containsLibraryItem___block_invoke;
  v9[3] = &unk_24D9B7BF8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "predicateWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SHMediaLibrarySnapshot evaluateUsingPredicate:](self, "evaluateUsingPredicate:", v7);

  return (char)self;
}

uint64_t __46__SHMediaLibrarySnapshot_containsLibraryItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "libraryItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)isConflictingChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1758];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__SHMediaLibrarySnapshot_isConflictingChange___block_invoke;
  v9[3] = &unk_24D9B7BF8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "predicateWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SHMediaLibrarySnapshot evaluateUsingPredicate:](self, "evaluateUsingPredicate:", v7);

  return (char)self;
}

uint64_t __46__SHMediaLibrarySnapshot_isConflictingChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isConflictingChange:", *(_QWORD *)(a1 + 32));
}

- (BOOL)evaluateUsingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SHMediaLibrarySnapshot changes](self, "changes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = (void *)MEMORY[0x219A21784]();
  objc_msgSend(v6, "filterUsingPredicate:", v4);
  objc_autoreleasePoolPop(v7);
  LOBYTE(v7) = objc_msgSend(v6, "count") != 0;

  return (char)v7;
}

- (BOOL)validateWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SHMediaLibrarySnapshot changes](self, "changes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "libraryItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = objc_msgSend(v10, "changeType");

          if (v12 == 3)
          {
            objc_msgSend(v10, "libraryItem");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "providerIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", v4);

            if ((v15 & 1) == 0)
            {
              v16 = 0;
              goto LABEL_14;
            }
          }
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
  v16 = 1;
LABEL_14:

  return v16;
}

- (id)tracksForChangeType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char isKindOfClass;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDBCEB8];
  -[SHMediaLibrarySnapshot changes](self, "changes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SHMediaLibrarySnapshot changes](self, "changes", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "libraryItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        v16 = objc_msgSend(v13, "changeType");
        if ((isKindOfClass & 1) != 0 && v16 == a3)
        {
          objc_msgSend(v13, "libraryItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v17);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v18 = (void *)objc_msgSend(v7, "copy");
  return v18;
}

+ (id)remapSnapshot:(id)a3 withBundleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SHMediaLibrarySnapshot *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD1758];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __61__SHMediaLibrarySnapshot_remapSnapshot_withBundleIdentifier___block_invoke;
  v16[3] = &unk_24D9B7BF8;
  v8 = v6;
  v17 = v8;
  objc_msgSend(v7, "predicateWithBlock:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v12 = (void *)MEMORY[0x219A21784]();
  objc_msgSend(v11, "filterUsingPredicate:", v9);
  objc_autoreleasePoolPop(v12);
  v13 = objc_alloc_init(SHMediaLibrarySnapshot);
  v14 = (void *)objc_msgSend(v11, "copy");
  -[SHMediaLibrarySnapshot addChanges:](v13, "addChanges:", v14);

  return v13;
}

uint64_t __61__SHMediaLibrarySnapshot_remapSnapshot_withBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "libraryItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "libraryItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "providerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)removeSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SHMediaLibrarySnapshot changeset](self, "changeset");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v7, "minusOrderedSet:", v6);

}

- (id)filteredSnapshotUsingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SHMediaLibrarySnapshot *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x219A21784]();
  -[SHMediaLibrarySnapshot changeset](self, "changeset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredOrderedSetUsingPredicate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  v8 = -[SHMediaLibrarySnapshot initWithChanges:]([SHMediaLibrarySnapshot alloc], "initWithChanges:", v7);

  return v8;
}

- (SHMediaLibrarySnapshot)initWithCoder:(id)a3
{
  id v4;
  SHMediaLibrarySnapshot *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableOrderedSet *changeset;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SHMediaLibrarySnapshot;
  v5 = -[SHMediaLibrarySnapshot init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x219A21784]();
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("SHLibraryDifferenceCodingChanges"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mutableCopy");
    changeset = v5->_changeset;
    v5->_changeset = (NSMutableOrderedSet *)v11;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x219A21784]();
  objc_msgSend(v5, "encodeObject:forKey:", self->_changeset, CFSTR("SHLibraryDifferenceCodingChanges"));
  objc_autoreleasePoolPop(v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SHMediaLibrarySnapshot *v5;
  void *v6;
  void *v7;
  SHMediaLibrarySnapshot *v8;

  v5 = +[SHMediaLibrarySnapshot allocWithZone:](SHMediaLibrarySnapshot, "allocWithZone:");
  -[SHMediaLibrarySnapshot changeset](self, "changeset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = -[SHMediaLibrarySnapshot initWithChanges:](v5, "initWithChanges:", v7);

  return v8;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SHMediaLibrarySnapshot changes](self, "changes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SNAPSHOT: %lu"), objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSMutableOrderedSet)changeset
{
  return self->_changeset;
}

- (void)setChangeset:(id)a3
{
  objc_storeStrong((id *)&self->_changeset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeset, 0);
}

@end
