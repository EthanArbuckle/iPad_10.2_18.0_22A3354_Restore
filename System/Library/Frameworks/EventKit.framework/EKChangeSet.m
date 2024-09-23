@implementation EKChangeSet

- (EKChangeSet)init
{
  return -[EKChangeSet initWithChangeSet:](self, "initWithChangeSet:", 0);
}

- (EKChangeSet)initWithChangeSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  EKChangeSet *v8;

  v4 = a3;
  objc_msgSend(v4, "singleValueChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiValueAdditions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiValueRemovals");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[EKChangeSet initWithSingleValueChanges:multiValueAdditions:multiValueRemovals:](self, "initWithSingleValueChanges:multiValueAdditions:multiValueRemovals:", v5, v6, v7);
  return v8;
}

- (EKChangeSet)initWithChangeSet:(id)a3 changesToSkip:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  EKChangeSet *v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__EKChangeSet_initWithChangeSet_changesToSkip___block_invoke;
  v12[3] = &unk_1E47862E0;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  v9 = (void *)MEMORY[0x1A85849D4](v12);
  v10 = -[EKChangeSet _initWithChangeSet:filter:](self, "_initWithChangeSet:filter:", v8, v9);

  return v10;
}

uint64_t __47__EKChangeSet_initWithChangeSet_changesToSkip___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (EKChangeSet)initWithChangeSet:(id)a3 changesToKeep:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  EKChangeSet *v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__EKChangeSet_initWithChangeSet_changesToKeep___block_invoke;
  v12[3] = &unk_1E47862E0;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  v9 = (void *)MEMORY[0x1A85849D4](v12);
  v10 = -[EKChangeSet _initWithChangeSet:filter:](self, "_initWithChangeSet:filter:", v8, v9);

  return v10;
}

uint64_t __47__EKChangeSet_initWithChangeSet_changesToKeep___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (EKChangeSet)initWithChangeSet:(id)a3 filter:(id)a4
{
  id v6;
  id v7;
  EKChangeSet *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__EKChangeSet_initWithChangeSet_filter___block_invoke;
  v10[3] = &unk_1E4786308;
  v11 = v6;
  v7 = v6;
  v8 = -[EKChangeSet _initWithChangeSet:filter:](self, "_initWithChangeSet:filter:", a3, v10);

  return v8;
}

uint64_t __40__EKChangeSet_initWithChangeSet_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_initWithChangeSet:(id)a3 filter:(id)a4
{
  id v6;
  id v7;
  EKChangeSet *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  EKChangeSet *v15;
  uint64_t v16;

  v6 = a4;
  v7 = a3;
  v8 = [EKChangeSet alloc];
  objc_msgSend(v7, "singleValueChanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredDictionaryPassingTest:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "multiValueAdditions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filteredDictionaryPassingTest:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "multiValueRemovals");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filteredDictionaryPassingTest:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[EKChangeSet initWithSingleValueChanges:multiValueAdditions:multiValueRemovals:](v8, "initWithSingleValueChanges:multiValueAdditions:multiValueRemovals:", v10, v12, v14);
  -[EKChangeSet setIsNew:](v15, "setIsNew:", objc_msgSend(v7, "isNew"));
  -[EKChangeSet setIsModified:](v15, "setIsModified:", objc_msgSend(v7, "isModified"));
  -[EKChangeSet setIsSaved:](v15, "setIsSaved:", objc_msgSend(v7, "isSaved"));
  -[EKChangeSet setIsDeleted:](v15, "setIsDeleted:", objc_msgSend(v7, "isDeleted"));
  -[EKChangeSet setIsUndeleted:](v15, "setIsUndeleted:", objc_msgSend(v7, "isUndeleted"));
  v16 = objc_msgSend(v7, "isUndetached");

  -[EKChangeSet setIsUndetached:](v15, "setIsUndetached:", v16);
  return v15;
}

- (EKChangeSet)initWithSingleValueChanges:(id)a3 multiValueAdditions:(id)a4 multiValueRemovals:(id)a5
{
  id v8;
  id v9;
  EKChangeSet *v10;
  EKChangeSet *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v40;
  id obj;
  id obja;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v43 = a5;
  v52.receiver = self;
  v52.super_class = (Class)EKChangeSet;
  v10 = -[EKChangeSet init](&v52, sel_init);
  v11 = v10;
  if (v10)
  {
    -[EKChangeSet setIsNew:](v10, "setIsNew:", 0);
    v40 = v8;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v8);
    -[EKChangeSet setSingleValueChanges:](v11, "setSingleValueChanges:", v12);

    v13 = (void *)objc_opt_new();
    -[EKChangeSet setMultiValueAdditions:](v11, "setMultiValueAdditions:", v13);

    if (v9)
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      objc_msgSend(v9, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v49 != v16)
              objc_enumerationMutation(obj);
            v18 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_msgSend(v9, "valueForKey:", v18);
            v19 = v9;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKChangeSet multiValueAdditions](v11, "multiValueAdditions");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v18);

            v9 = v19;
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
        }
        while (v15);
      }

    }
    v23 = (void *)objc_opt_new();
    -[EKChangeSet setMultiValueRemovals:](v11, "setMultiValueRemovals:", v23);

    if (v43)
    {
      obja = v9;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      objc_msgSend(v43, "allKeys");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v45;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v45 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
            objc_msgSend(v43, "valueForKey:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKChangeSet multiValueRemovals](v11, "multiValueRemovals");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, v29);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        }
        while (v26);
      }

      v9 = obja;
    }
    -[EKChangeSet singleValueChanges](v11, "singleValueChanges");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    -[EKChangeSet multiValueAdditions](v11, "multiValueAdditions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v34 | objc_msgSend(v35, "count");

    -[EKChangeSet multiValueRemovals](v11, "multiValueRemovals");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "count");

    -[EKChangeSet setIsModified:](v11, "setIsModified:", (v36 | v38) != 0);
    v8 = v40;
  }

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  EKChangeSet *v4;

  v4 = -[EKChangeSet initWithChangeSet:]([EKChangeSet alloc], "initWithChangeSet:", self);
  -[EKChangeSet setIsNew:](v4, "setIsNew:", -[EKChangeSet isNew](self, "isNew"));
  -[EKChangeSet setIsModified:](v4, "setIsModified:", -[EKChangeSet isModified](self, "isModified"));
  -[EKChangeSet setIsSaved:](v4, "setIsSaved:", -[EKChangeSet isSaved](self, "isSaved"));
  -[EKChangeSet setIsDeleted:](v4, "setIsDeleted:", -[EKChangeSet isDeleted](self, "isDeleted"));
  -[EKChangeSet setIsUndeleted:](v4, "setIsUndeleted:", -[EKChangeSet isUndeleted](self, "isUndeleted"));
  -[EKChangeSet setIsUndetached:](v4, "setIsUndetached:", -[EKChangeSet isUndetached](self, "isUndetached"));
  return v4;
}

- (void)rollbackChanges
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet setSingleValueChanges:](self, "setSingleValueChanges:", v3);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet setMultiValueAdditions:](self, "setMultiValueAdditions:", v4);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet setMultiValueRemovals:](self, "setMultiValueRemovals:", v5);

  -[EKChangeSet setIsModified:](self, "setIsModified:", 0);
}

- (void)rollbackChangesForKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[EKChangeSet singleValueChanges](self, "singleValueChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsForKeys:", v4);

  -[EKChangeSet multiValueAdditions](self, "multiValueAdditions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsForKeys:", v4);

  -[EKChangeSet multiValueRemovals](self, "multiValueRemovals");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectsForKeys:", v4);

}

- (void)markChangesAsSaved
{
  _BOOL8 v3;

  -[EKChangeSet setIsSaved:](self, "setIsSaved:", 1);
  -[EKChangeSet setIsNew:](self, "setIsNew:", 0);
  v3 = -[EKChangeSet isModified](self, "isModified");
  -[EKChangeSet rollbackChanges](self, "rollbackChanges");
  -[EKChangeSet setIsModified:](self, "setIsModified:", v3);
}

- (id)changedKeys
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet changedSingleValueKeys](self, "changedSingleValueKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[EKChangeSet changedMultiValueKeys](self, "changedMultiValueKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  return v3;
}

- (id)changedSingleValueKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[EKChangeSet singleValueChanges](self, "singleValueChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)changedMultiValueKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99E20];
  -[EKChangeSet multiValueAdditions](self, "multiValueAdditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E60];
  -[EKChangeSet multiValueRemovals](self, "multiValueRemovals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v10);

  return v6;
}

- (BOOL)hasChanges
{
  if (-[EKChangeSet isDeleted](self, "isDeleted"))
    return 0;
  if (-[EKChangeSet isModified](self, "isModified"))
    return 1;
  return -[EKChangeSet isNew](self, "isNew");
}

- (BOOL)hasUnsavedChanges
{
  return -[EKChangeSet hasUnsavedChangeForKey:](self, "hasUnsavedChangeForKey:", 0);
}

- (BOOL)hasUnsavedChangeForKey:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;

  v4 = a3;
  if (-[EKChangeSet isDeleted](self, "isDeleted"))
  {
    v5 = 0;
  }
  else
  {
    v6 = -[EKChangeSet _isNewAndUnsaved](self, "_isNewAndUnsaved");
    if (v4 || !v6)
    {
      -[EKChangeSet singleValueChanges](self, "singleValueChanges");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v4)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9 != 0;

        -[EKChangeSet multiValueAdditions](self, "multiValueAdditions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        -[EKChangeSet multiValueRemovals](self, "multiValueRemovals");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

      }
      else
      {
        v10 = objc_msgSend(v7, "count") != 0;

        -[EKChangeSet multiValueAdditions](self, "multiValueAdditions");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v17, "count");

        -[EKChangeSet multiValueRemovals](self, "multiValueRemovals");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "count");
      }

      if (v13)
        v18 = 1;
      else
        v18 = v10;
      if (v16)
        v5 = 1;
      else
        v5 = v18;
    }
    else
    {
      v5 = 1;
    }
  }

  return v5;
}

- (BOOL)_isNewAndUnsaved
{
  _BOOL4 v3;

  v3 = -[EKChangeSet isNew](self, "isNew");
  if (v3)
    LOBYTE(v3) = !-[EKChangeSet isSaved](self, "isSaved");
  return v3;
}

- (BOOL)hasUnsavedMultiValueAdditionForKey:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[EKChangeSet isDeleted](self, "isDeleted"))
  {
    v5 = 0;
  }
  else
  {
    -[EKChangeSet multiValueAdditions](self, "multiValueAdditions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "count") != 0;

  }
  return v5;
}

- (id)unsavedMultiValueAddedObjectsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EKChangeSet multiValueAdditions](self, "multiValueAdditions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasUnsavedMultiValueRemovalForKey:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[EKChangeSet isDeleted](self, "isDeleted"))
  {
    v5 = 0;
  }
  else
  {
    -[EKChangeSet multiValueRemovals](self, "multiValueRemovals");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "count") != 0;

  }
  return v5;
}

- (id)unsavedMultiValueRemovedObjectsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EKChangeSet multiValueRemovals](self, "multiValueRemovals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)valueForSingleValueKey:(id)a3 basedOn:(id)a4
{
  return -[EKChangeSet valueForSingleValueKey:basedOn:and:](self, "valueForSingleValueKey:basedOn:and:", a3, a4, 0);
}

- (id)valueForSingleValueKey:(id)a3 basedOn:(id)a4 and:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EKChangeSet singleValueChanges](self, "singleValueChanges");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(v9, "valueForKey:", v8);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v15;

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v16)
    v17 = 0;
  else
    v17 = v12;
  v18 = v17;

  return v18;
}

- (void)changeSingleValue:(id)a3 forKey:(id)a4 basedOn:(id)a5
{
  -[EKChangeSet changeSingleValue:forKey:basedOn:and:](self, "changeSingleValue:forKey:basedOn:and:", a3, a4, a5, 0);
}

- (void)changeSingleValue:(id)a3 forKey:(id)a4 basedOn:(id)a5 and:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;

  v14 = (unint64_t)a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v11)
    goto LABEL_6;
  -[EKChangeSet valueForSingleValueKey:basedOn:and:](self, "valueForSingleValueKey:basedOn:and:", v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v14 | v13 && (objc_msgSend((id)v14, "isEqual:", v13) & 1) == 0)
  {

LABEL_6:
    -[EKChangeSet forceChangeValue:forKey:](self, "forceChangeValue:forKey:", v14, v10);
    goto LABEL_7;
  }

LABEL_7:
}

- (id)valuesForMultiValueKey:(id)a3 basedOn:(id)a4 and:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v9, "valueForKey:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  -[EKChangeSet valuesForMultiValueKey:basedOnSet:](self, "valuesForMultiValueKey:basedOnSet:", v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)valuesForMultiValueKey:(id)a3 basedOnSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v35;
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
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v14, "uniqueIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v11);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[EKChangeSet multiValueRemovals](self, "multiValueRemovals");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v40 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "uniqueIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectForKey:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v19);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[EKChangeSet multiValueAdditions](self, "multiValueAdditions", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * k);
        objc_msgSend(v29, "uniqueIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, v30);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v26);
  }

  v31 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v8, "allValues");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (BOOL)isUniqueAddedObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_multiValueAdditions, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "uniqueIdentifier", (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v8);

          if ((v14 & 1) != 0)
          {
            LOBYTE(v10) = 1;
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)replaceMultiChangeAddedObject:(id)a3 withObject:(id)a4 forKey:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_multiValueAdditions, "objectForKeyedSubscript:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "containsObject:", v10))
  {
    objc_msgSend(v9, "removeObject:", v10);
    objc_msgSend(v9, "addObject:", v8);
  }

}

- (void)addChanges:(id)a3
{
  -[EKChangeSet addChanges:shouldCopyKeyCallback:](self, "addChanges:shouldCopyKeyCallback:", a3, 0);
}

- (void)addChanges:(id)a3 shouldCopyKeyCallback:(id)a4
{
  -[EKChangeSet addChanges:shouldCopyKeyCallback:objectIdentifierBlock:](self, "addChanges:shouldCopyKeyCallback:objectIdentifierBlock:", a3, a4, 0);
}

- (void)addChanges:(id)a3 shouldCopyKeyCallback:(id)a4 objectIdentifierBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v29 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "isModified"))
  {
    -[EKChangeSet setIsModified:](self, "setIsModified:", 1);
    objc_msgSend(v8, "singleValueChanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!self->_skipsPersistentObjectCopy)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __70__EKChangeSet_addChanges_shouldCopyKeyCallback_objectIdentifierBlock___block_invoke;
      v34[3] = &unk_1E4786330;
      v36 = v29;
      v13 = v12;
      v35 = v13;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v34);
      v14 = v13;

      v11 = v14;
    }
    -[EKChangeSet singleValueChanges](self, "singleValueChanges");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v11;
    objc_msgSend(v15, "addEntriesFromDictionary:", v11);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v8, "changedMultiValueKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v8, "multiValueRemovals");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v22, "copy");
          -[EKChangeSet removeFromChanges:forMultiValueKey:basedOn:and:objectIdentifierBlock:](self, "removeFromChanges:forMultiValueKey:basedOn:and:objectIdentifierBlock:", v23, v20, 0, 0, v9);

          objc_msgSend(v8, "multiValueAdditions");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v25, "copy");
          -[EKChangeSet addToChanges:forMultiValueKey:basedOn:and:shouldCopyKeyCallback:objectIdentifierBlock:](self, "addToChanges:forMultiValueKey:basedOn:and:shouldCopyKeyCallback:objectIdentifierBlock:", v26, v20, 0, 0, v29, v9);

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      }
      while (v17);
    }

  }
}

void __70__EKChangeSet_addChanges_shouldCopyKeyCallback_objectIdentifierBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (!v6 || (*(unsigned int (**)(uint64_t, id))(v6 + 16))(v6, v8))
    {
      v7 = objc_msgSend(v5, "copy");

      v5 = (id)v7;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v8);

}

- (void)addToChanges:(id)a3 forMultiValueKey:(id)a4 basedOn:(id)a5 and:(id)a6
{
  -[EKChangeSet addToChanges:forMultiValueKey:basedOn:and:shouldCopyKeyCallback:objectIdentifierBlock:](self, "addToChanges:forMultiValueKey:basedOn:and:shouldCopyKeyCallback:objectIdentifierBlock:", a3, a4, a5, a6, 0, 0);
}

- (void)addToChanges:(id)a3 forMultiValueKey:(id)a4 basedOn:(id)a5 and:(id)a6 shouldCopyKeyCallback:(id)a7 objectIdentifierBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  unsigned int (**v17)(void);
  void (**v18)(id, void *);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  unsigned int (**v45)(void);
  EKChangeSet *v46;
  void *v47;
  id v48;
  void *v49;
  id obj;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v48 = a5;
  v16 = a6;
  v17 = (unsigned int (**)(void))a7;
  v18 = (void (**)(id, void *))a8;
  if (objc_msgSend(v14, "count"))
  {
    -[EKChangeSet multiValueAdditions](self, "multiValueAdditions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v15);
    v20 = objc_claimAutoreleasedReturnValue();

    v47 = (void *)v20;
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v21 = objc_claimAutoreleasedReturnValue();
      -[EKChangeSet multiValueAdditions](self, "multiValueAdditions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)v21;
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v15);

    }
    if (!v18)
      v18 = (void (**)(id, void *))&__block_literal_global_41;
    objc_msgSend(v16, "objectForKeyedSubscript:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v45 = v17;
    v42 = v16;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      objc_msgSend(v48, "valueForKey:", v15);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v26 = v25;

    v49 = v26;
    -[EKChangeSet _uniqueIdentifierToObjectMapForObjects:identifierBlock:](self, "_uniqueIdentifierToObjectMapForObjects:identifierBlock:", v26, v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKChangeSet multiValueRemovals](self, "multiValueRemovals");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v15;
    objc_msgSend(v28, "objectForKeyedSubscript:", v15);
    v29 = objc_claimAutoreleasedReturnValue();

    v46 = self;
    v51 = (void *)v29;
    -[EKChangeSet _uniqueIdentifierToObjectMapForObjects:identifierBlock:](self, "_uniqueIdentifierToObjectMapForObjects:identifierBlock:", v29, v18);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v43 = v14;
    obj = v14;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v53 != v33)
            objc_enumerationMutation(obj);
          v35 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          v18[2](v18, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKey:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v18[2](v18, v35);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKey:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            objc_msgSend(v51, "removeObject:", v37);
          }
          else if (!v49 || (objc_msgSend(v39, "isEqual:", v35) & 1) == 0)
          {
            objc_msgSend(v35, "frozenObject", v42);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v48 && !v46->_skipsPersistentObjectCopy)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && (!v45 || v45[2]()))
              {
                v41 = objc_msgSend(v40, "copy");

                v40 = (void *)v41;
              }
            }
            objc_msgSend(v47, "addObject:", v40);

          }
        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v32);
    }

    -[EKChangeSet setIsModified:](v46, "setIsModified:", 1);
    v15 = v44;
    -[EKChangeSet _cleanupEmptySetsForMultiValueKey:](v46, "_cleanupEmptySetsForMultiValueKey:", v44);

    v16 = v42;
    v14 = v43;
    v17 = v45;
  }

}

uint64_t __101__EKChangeSet_addToChanges_forMultiValueKey_basedOn_and_shouldCopyKeyCallback_objectIdentifierBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

- (void)removeFromChanges:(id)a3 forMultiValueKey:(id)a4 basedOn:(id)a5 and:(id)a6
{
  -[EKChangeSet removeFromChanges:forMultiValueKey:basedOn:and:objectIdentifierBlock:](self, "removeFromChanges:forMultiValueKey:basedOn:and:objectIdentifierBlock:", a3, a4, a5, a6, 0);
}

- (void)removeFromChanges:(id)a3 forMultiValueKey:(id)a4 basedOn:(id)a5 and:(id)a6 objectIdentifierBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  EKChangeSet *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id obj;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD))a7;
  if (objc_msgSend(v12, "count"))
  {
    -[EKChangeSet multiValueRemovals](self, "multiValueRemovals");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v13);
    v18 = objc_claimAutoreleasedReturnValue();

    v45 = (void *)v18;
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v19 = objc_claimAutoreleasedReturnValue();
      -[EKChangeSet multiValueRemovals](self, "multiValueRemovals");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)v19;
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v13);

    }
    if (!v16)
      v16 = (void (**)(id, _QWORD))&__block_literal_global_9_0;
    objc_msgSend(v15, "objectForKeyedSubscript:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v41 = v15;
    v42 = v14;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      objc_msgSend(v14, "valueForKey:", v13);
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v23;

    v46 = v24;
    -[EKChangeSet _uniqueIdentifierToObjectMapForObjects:identifierBlock:](self, "_uniqueIdentifierToObjectMapForObjects:identifierBlock:", v24, v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKChangeSet multiValueAdditions](self, "multiValueAdditions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v13;
    objc_msgSend(v26, "objectForKeyedSubscript:", v13);
    v27 = objc_claimAutoreleasedReturnValue();

    v40 = self;
    v48 = (void *)v27;
    -[EKChangeSet _uniqueIdentifierToObjectMapForObjects:identifierBlock:](self, "_uniqueIdentifierToObjectMapForObjects:identifierBlock:", v27, v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v44 = v12;
    obj = v12;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v50 != v31)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          ((void (**)(id, void *))v16)[2](v16, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKey:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          ((void (**)(id, void *))v16)[2](v16, v33);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKey:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            objc_msgSend(v48, "removeObject:", v35);
            goto LABEL_21;
          }
          if (v46)
          {
            if (!v37)
              goto LABEL_21;
            v38 = v45;
            v39 = v37;
          }
          else
          {
            v38 = v45;
            v39 = v33;
          }
          objc_msgSend(v38, "addObject:", v39);
LABEL_21:

        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v30);
    }

    -[EKChangeSet setIsModified:](v40, "setIsModified:", 1);
    v13 = v43;
    -[EKChangeSet _cleanupEmptySetsForMultiValueKey:](v40, "_cleanupEmptySetsForMultiValueKey:", v43);

    v12 = v44;
    v15 = v41;
    v14 = v42;
  }

}

uint64_t __84__EKChangeSet_removeFromChanges_forMultiValueKey_basedOn_and_objectIdentifierBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

- (void)replaceUniqueMultiValueObjectsWithUpdatedObjects:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *j;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  id obj;
  uint64_t v31;
  EKChangeSet *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
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
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v32 = self;
  -[EKChangeSet multiValueAdditions](self, "multiValueAdditions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v5)
  {
    v6 = v5;
    v31 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v46 != v31)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        -[EKChangeSet multiValueAdditions](v32, "multiValueAdditions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v11 = v10;
        v12 = (void *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v42;
          while (2)
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v42 != v13)
                objc_enumerationMutation(v11);
              v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
              objc_msgSend(v15, "uniqueIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectForKeyedSubscript:", v16);
              v17 = objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                v19 = (void *)v17;
                v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
                v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
                objc_msgSend(v18, "addObject:", v15);
                objc_msgSend(v12, "addObject:", v19);

                goto LABEL_16;
              }

            }
            v12 = (void *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
            if (v12)
              continue;
            break;
          }
        }
        v18 = 0;
LABEL_16:

        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v20 = v18;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v38;
          do
          {
            for (k = 0; k != v22; ++k)
            {
              if (*(_QWORD *)v38 != v23)
                objc_enumerationMutation(v20);
              objc_msgSend(v11, "removeObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k));
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
          }
          while (v22);
        }

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v25 = v12;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v34;
          do
          {
            for (m = 0; m != v27; ++m)
            {
              if (*(_QWORD *)v34 != v28)
                objc_enumerationMutation(v25);
              objc_msgSend(v11, "addObject:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * m));
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
          }
          while (v27);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v6);
  }

}

- (void)addChangesAndUpdateUniqueMultiValueObjects:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKChangeSet addChanges:](self, "addChanges:", v4);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = v4;
  objc_msgSend(v4, "multiValueAdditions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v21, "multiValueAdditions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v23 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              if (!v7)
                v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend(v17, "uniqueIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v18);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v14);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  -[EKChangeSet replaceUniqueMultiValueObjectsWithUpdatedObjects:](self, "replaceUniqueMultiValueObjectsWithUpdatedObjects:", v7);
}

- (void)_cleanupEmptySetsForMultiValueKey:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  -[EKChangeSet multiValueAdditions](self, "multiValueAdditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    -[EKChangeSet multiValueAdditions](self, "multiValueAdditions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v12);

  }
  -[EKChangeSet multiValueRemovals](self, "multiValueRemovals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    -[EKChangeSet multiValueRemovals](self, "multiValueRemovals");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v12);

  }
}

- (id)_uniqueIdentifierToObjectMapForObjects:(id)a3 identifierBlock:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_msgSend(v7, "frozenClass"), "propertyKeyForUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("uniqueIdentifier")) & 1) == 0)
    {
      objc_msgSend(v5, "anyObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "eventStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v36[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ensureLoadedProperties:forObjects:", v11, v5);

    }
    v25 = v8;
    v12 = (void *)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v5;
    v13 = v5;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v6[2](v6, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v12, "setObject:forKey:", v18, v19);
          }
          else
          {
            v20 = (void *)EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
            {
              v21 = (void *)MEMORY[0x1E0CB3978];
              v22 = v20;
              objc_msgSend(v21, "callStackSymbols", v25);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v32 = v18;
              v33 = 2112;
              v34 = v23;
              _os_log_error_impl(&dword_1A2318000, v22, OS_LOG_TYPE_ERROR, "Object %@ has no unique identifier: %@", buf, 0x16u);

            }
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v15);
    }

    v5 = v26;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v12;
}

- (void)forceChangeValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v7 = v10;
    else
      v7 = (id)objc_msgSend(v10, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  -[EKChangeSet singleValueChanges](self, "singleValueChanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

  -[EKChangeSet setIsModified:](self, "setIsModified:", 1);
}

- (BOOL)skipsPersistentObjectCopy
{
  return self->_skipsPersistentObjectCopy;
}

- (void)setSkipsPersistentObjectCopy:(BOOL)a3
{
  self->_skipsPersistentObjectCopy = a3;
}

- (void)removeAllChangesExceptRemovals
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary removeAllObjects](self->_multiValueAdditions, "removeAllObjects");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allKeys](self->_singleValueChanges, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_singleValueChanges, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if ((isKindOfClass & 1) != 0)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_singleValueChanges, "setObject:forKeyedSubscript:", v10, v7);

        }
        else
        {

          if (v8 != v11)
            -[NSMutableDictionary removeObjectForKey:](self->_singleValueChanges, "removeObjectForKey:", v7);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet singleValueChanges](self, "singleValueChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("singleValueChanges: %@ \n"), v4);

  -[EKChangeSet multiValueAdditions](self, "multiValueAdditions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("multiValueAdditions: %@ \n"), v5);

  -[EKChangeSet multiValueRemovals](self, "multiValueRemovals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("multiValueRemovals: %@ \n"), v6);

  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("is new: %d is deleted: %d is saved: %d is modified: %d"), -[EKChangeSet isNew](self, "isNew"), -[EKChangeSet isDeleted](self, "isDeleted"), -[EKChangeSet isSaved](self, "isSaved"), -[EKChangeSet isModified](self, "isModified"));
  if (-[EKChangeSet isUndeleted](self, "isUndeleted"))
  {
    objc_msgSend(v3, "appendString:", CFSTR("\n"));
    objc_msgSend(v3, "appendFormat:", CFSTR("is undeleted: %d"), -[EKChangeSet isUndeleted](self, "isUndeleted"));
  }
  if (-[EKChangeSet isUndetached](self, "isUndetached"))
  {
    objc_msgSend(v3, "appendString:", CFSTR("\n"));
    objc_msgSend(v3, "appendFormat:", CFSTR("is undetached: %d"), -[EKChangeSet isUndetached](self, "isUndetached"));
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  EKChangeSet *v4;
  EKChangeSet *v5;
  EKChangeSet *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v20;

  v4 = (EKChangeSet *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v18) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[EKChangeSet singleValueChanges](self, "singleValueChanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKChangeSet singleValueChanges](v6, "singleValueChanges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[EKChangeSet multiValueAdditions](self, "multiValueAdditions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKChangeSet multiValueAdditions](v6, "multiValueAdditions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[EKChangeSet multiValueRemovals](self, "multiValueRemovals");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKChangeSet multiValueRemovals](v6, "multiValueRemovals");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12)
          && (v13 = -[EKChangeSet isNew](self, "isNew"), v13 == -[EKChangeSet isNew](v6, "isNew"))
          && (v14 = -[EKChangeSet isModified](self, "isModified"), v14 == -[EKChangeSet isModified](v6, "isModified"))
          && (v15 = -[EKChangeSet isSaved](self, "isSaved"), v15 == -[EKChangeSet isSaved](v6, "isSaved"))
          && (v16 = -[EKChangeSet isDeleted](self, "isDeleted"), v16 == -[EKChangeSet isDeleted](v6, "isDeleted"))
          && (v17 = -[EKChangeSet isUndeleted](self, "isUndeleted"), v17 == -[EKChangeSet isUndeleted](v6, "isUndeleted")))
        {
          v20 = -[EKChangeSet isUndetached](self, "isUndetached");
          v18 = v20 ^ -[EKChangeSet isUndetached](v6, "isUndetached") ^ 1;
        }
        else
        {
          LOBYTE(v18) = 0;
        }

      }
      else
      {
        LOBYTE(v18) = 0;
      }

    }
    else
    {
      LOBYTE(v18) = 0;
    }

  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)isEffectivelyEqual:(id)a3
{
  EKChangeSet *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  char v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v4 = (EKChangeSet *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    v5 = -[EKChangeSet isNew](self, "isNew");
    if (v5 == -[EKChangeSet isNew](v4, "isNew")
      && (v6 = -[EKChangeSet isSaved](self, "isSaved"), v6 == -[EKChangeSet isSaved](v4, "isSaved"))
      && (v7 = -[EKChangeSet isDeleted](self, "isDeleted"), v7 == -[EKChangeSet isDeleted](v4, "isDeleted"))
      && (v8 = -[EKChangeSet isUndeleted](self, "isUndeleted"), v8 == -[EKChangeSet isUndeleted](v4, "isUndeleted"))
      && (v9 = -[EKChangeSet isUndetached](self, "isUndetached"), v9 == -[EKChangeSet isUndetached](v4, "isUndetached")))
    {
      v12 = (void *)objc_opt_new();
      -[EKChangeSet singleValueChanges](self, "singleValueChanges");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "CalDictionaryWithEmptyObjectsRemoved");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        -[EKChangeSet singleValueChanges](v4, "singleValueChanges");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "CalDictionaryWithEmptyObjectsRemoved");
        v16 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = v12;
      }
      if (objc_msgSend(v14, "isEqual:", v16))
      {
        -[EKChangeSet multiValueAdditions](self, "multiValueAdditions");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "CalDictionaryWithEmptyObjectsRemoved");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4)
        {
          -[EKChangeSet multiValueAdditions](v4, "multiValueAdditions");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "CalDictionaryWithEmptyObjectsRemoved");
          v20 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v20 = v12;
        }
        if (objc_msgSend(v18, "isEqual:", v20))
        {
          -[EKChangeSet multiValueRemovals](self, "multiValueRemovals");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "CalDictionaryWithEmptyObjectsRemoved");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v4)
          {
            -[EKChangeSet multiValueRemovals](v4, "multiValueRemovals");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "CalDictionaryWithEmptyObjectsRemoved");
            v24 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v24 = v12;
          }
          v10 = objc_msgSend(v22, "isEqual:", v24);

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (void)setIsNew:(BOOL)a3
{
  self->_isNew = a3;
}

- (BOOL)isModified
{
  return self->_isModified;
}

- (void)setIsModified:(BOOL)a3
{
  self->_isModified = a3;
}

- (BOOL)isSaved
{
  return self->_isSaved;
}

- (void)setIsSaved:(BOOL)a3
{
  self->_isSaved = a3;
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_isDeleted = a3;
}

- (BOOL)isUndeleted
{
  return self->_isUndeleted;
}

- (void)setIsUndeleted:(BOOL)a3
{
  self->_isUndeleted = a3;
}

- (BOOL)isUndetached
{
  return self->_isUndetached;
}

- (void)setIsUndetached:(BOOL)a3
{
  self->_isUndetached = a3;
}

- (NSMutableDictionary)singleValueChanges
{
  return self->_singleValueChanges;
}

- (void)setSingleValueChanges:(id)a3
{
  objc_storeStrong((id *)&self->_singleValueChanges, a3);
}

- (NSMutableDictionary)multiValueAdditions
{
  return self->_multiValueAdditions;
}

- (void)setMultiValueAdditions:(id)a3
{
  objc_storeStrong((id *)&self->_multiValueAdditions, a3);
}

- (NSMutableDictionary)multiValueRemovals
{
  return self->_multiValueRemovals;
}

- (void)setMultiValueRemovals:(id)a3
{
  objc_storeStrong((id *)&self->_multiValueRemovals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiValueRemovals, 0);
  objc_storeStrong((id *)&self->_multiValueAdditions, 0);
  objc_storeStrong((id *)&self->_singleValueChanges, 0);
}

@end
