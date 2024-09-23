@implementation ICFoldersFilterTypeSelection

- (ICFoldersFilterTypeSelection)initWithManagedObjectContext:(id)a3 inclusionType:(unint64_t)a4 folderIdentifiers:(id)a5
{
  id v9;
  id v10;
  ICFoldersFilterTypeSelection *v11;
  ICFoldersFilterTypeSelection *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICFoldersFilterTypeSelection;
  v11 = -[ICFoldersFilterTypeSelection init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_managedObjectContext, a3);
    v12->_inclusionType = a4;
    objc_storeStrong((id *)&v12->_folderIdentifiers, a5);
  }

  return v12;
}

- (id)debugDescription
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[ICFoldersFilterTypeSelection inclusionType](self, "inclusionType");
  v5 = CFSTR("Exclude");
  if (!v4)
    v5 = CFSTR("Include");
  v6 = v5;
  -[ICFoldersFilterTypeSelection folderIdentifiers](self, "folderIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("inclusionType: %@\nfolder identifiers: %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)addFolderIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ICFoldersFilterTypeSelection folderIdentifiers](self, "folderIdentifiers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICFoldersFilterTypeSelection setFolderIdentifiers:](self, "setFolderIdentifiers:", v5);
}

- (void)removeFolderIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ICFoldersFilterTypeSelection folderIdentifiers](self, "folderIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "removeObject:", v4);
  v6 = (void *)objc_msgSend(v7, "copy");
  -[ICFoldersFilterTypeSelection setFolderIdentifiers:](self, "setFolderIdentifiers:", v6);

}

- (NSString)folderSummaryList
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  -[ICFoldersFilterTypeSelection folderIdentifiers](self, "folderIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("0 selected"), CFSTR("0 selected"), 0, 1);
    return (NSString *)(id)objc_claimAutoreleasedReturnValue();
  }
  -[ICFoldersFilterTypeSelection folderIdentifiers](self, "folderIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[ICFoldersFilterTypeSelection folderIdentifiers](self, "folderIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 == 1)
  {
    -[ICFoldersFilterTypeSelection folderTitlesForIdentifiers:](self, "folderTitlesForIdentifiers:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_msgSend(v7, "count");

    -[ICFoldersFilterTypeSelection folderIdentifiers](self, "folderIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 != 2)
    {
      objc_msgSend(v13, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICFoldersFilterTypeSelection folderTitlesForIdentifiers:](self, "folderTitlesForIdentifiers:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("FOLDERS_%@_AND_%lu_OTHERS"), CFSTR("FOLDERS_%@_AND_%lu_OTHERS"), 0, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICFoldersFilterTypeSelection folderIdentifiers](self, "folderIdentifiers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithFormat:", v20, v8, objc_msgSend(v21, "count") - 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    -[ICFoldersFilterTypeSelection folderTitlesForIdentifiers:](self, "folderTitlesForIdentifiers:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x1E0CB3738]);
    objc_msgSend(v9, "stringFromItems:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v10;

LABEL_9:
  return (NSString *)v15;
}

- (BOOL)containsSharedFolder
{
  ICFoldersFilterTypeSelection *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ICFoldersFilterTypeSelection managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__ICFoldersFilterTypeSelection_containsSharedFolder__block_invoke;
  v5[3] = &unk_1E76C76B0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __52__ICFoldersFilterTypeSelection_containsSharedFolder__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;

  +[ICFolder fetchRequest](ICFolder, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "folderIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("identifier in %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v5);

  objc_msgSend(v2, "setResultType:", 0);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v2, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;

  if (v8)
  {
    v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __52__ICFoldersFilterTypeSelection_containsSharedFolder__block_invoke_cold_1((id *)(a1 + 32), (uint64_t)v8, v9);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "ic_containsObjectPassingTest:", &__block_literal_global_39);

}

uint64_t __52__ICFoldersFilterTypeSelection_containsSharedFolder__block_invoke_26(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSharedViaICloud");
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICFoldersFilterTypeSelection *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  ICFoldersFilterTypeSelection *v10;

  v5 = +[ICFoldersFilterTypeSelection allocWithZone:](ICFoldersFilterTypeSelection, "allocWithZone:");
  -[ICFoldersFilterTypeSelection managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICFoldersFilterTypeSelection inclusionType](self, "inclusionType");
  -[ICFoldersFilterTypeSelection folderIdentifiers](self, "folderIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  v10 = -[ICFoldersFilterTypeSelection initWithManagedObjectContext:inclusionType:folderIdentifiers:](v5, "initWithManagedObjectContext:inclusionType:folderIdentifiers:", v6, v7, v9);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  ICFoldersFilterTypeSelection *v4;
  ICFoldersFilterTypeSelection *v5;
  BOOL v6;

  v4 = (ICFoldersFilterTypeSelection *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ICFoldersFilterTypeSelection isEqualToICFoldersFilterTypeSelection:](self, "isEqualToICFoldersFilterTypeSelection:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  id v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICFoldersFilterTypeSelection inclusionType](self, "inclusionType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ICFoldersFilterTypeSelection folderIdentifiers](self, "folderIdentifiers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v8 = ICHashWithObject(*(void **)(*((_QWORD *)&v23 + 1) + 8 * i)) - v8 + 32 * v8;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  v21 = ICHashWithHashKeys(v4, v14, v15, v16, v17, v18, v19, v20, v8);
  return v21;
}

- (int64_t)filterType
{
  return 7;
}

- (id)filterName
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Folders"), CFSTR("Folders"), 0, 1);
}

- (id)rawFilterValue
{
  if (-[ICFoldersFilterTypeSelection inclusionType](self, "inclusionType"))
    return CFSTR("Exclude");
  else
    return CFSTR("Include");
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[ICFoldersFilterTypeSelection folderIdentifiers](self, "folderIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingIsEmpty
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ICFoldersFilterTypeSelection;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingIsValid);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObjectsFromArray:", &unk_1E771AB78);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)isValid
{
  return !-[ICFoldersFilterTypeSelection isEmpty](self, "isEmpty");
}

- (id)emptySummaryTitle
{
  void *v2;

  if (-[ICFoldersFilterTypeSelection isEmpty](self, "isEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Folders Filter Incomplete"), CFSTR("Folders Filter Incomplete"), 0, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)emptySummary
{
  void *v2;

  if (-[ICFoldersFilterTypeSelection isEmpty](self, "isEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("You must select at least one folder for the Folders filter."), CFSTR("You must select at least one folder for the Folders filter."), 0, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)shortEmptySummary
{
  void *v2;

  if (-[ICFoldersFilterTypeSelection isEmpty](self, "isEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Folder for the Folders filter"), CFSTR("Folder for the Folders filter"), 0, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)folderTitlesForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  __CFString *v11;
  ICFoldersFilterTypeSelection *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__34;
  v18 = __Block_byref_object_dispose__34;
  v19 = 0;
  -[ICFoldersFilterTypeSelection managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__ICFoldersFilterTypeSelection_folderTitlesForIdentifiers___block_invoke;
  v9[3] = &unk_1E76C93F0;
  v6 = v4;
  v10 = v6;
  v11 = CFSTR("title");
  v12 = self;
  v13 = &v14;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __59__ICFoldersFilterTypeSelection_folderTitlesForIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  +[ICFolder fetchRequest](ICFolder, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier in %@"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  v13[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToFetch:", v4);

  objc_msgSend(v2, "setResultType:", 0);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v2, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;

  if (v7)
  {
    v8 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __59__ICFoldersFilterTypeSelection_folderTitlesForIdentifiers___block_invoke_cold_1((uint64_t *)(a1 + 32), (uint64_t)v7, v8);

  }
  objc_msgSend(v6, "ic_compactMap:", &__block_literal_global_48_0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

uint64_t __59__ICFoldersFilterTypeSelection_folderTitlesForIdentifiers___block_invoke_46(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedTitle");
}

- (BOOL)isEqualToICFoldersFilterTypeSelection:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = -[ICFoldersFilterTypeSelection inclusionType](self, "inclusionType");
  if (v5 == objc_msgSend(v4, "inclusionType"))
  {
    -[ICFoldersFilterTypeSelection folderIdentifiers](self, "folderIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "folderIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToArray:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (unint64_t)inclusionType
{
  return self->_inclusionType;
}

- (void)setInclusionType:(unint64_t)a3
{
  self->_inclusionType = a3;
}

- (NSArray)folderIdentifiers
{
  return self->_folderIdentifiers;
}

- (void)setFolderIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_folderIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderIdentifiers, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

void __52__ICFoldersFilterTypeSelection_containsSharedFolder__block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "folderIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_10(&dword_1BD918000, a3, v6, "Error fetching folders for identifiers: %@ : %@", (uint8_t *)&v7);

}

void __59__ICFoldersFilterTypeSelection_folderTitlesForIdentifiers___block_invoke_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_10(&dword_1BD918000, a3, (uint64_t)a3, "Error fetching folder titles for identifiers: %@ : %@", (uint8_t *)&v4);
}

@end
