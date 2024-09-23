@implementation ICFolderCoreDataIndexer

uint64_t __127__ICFolderCoreDataIndexer_sortedFolderItemIdentifiersForItemIdentifiers_legacyManagedObjectContext_modernManagedObjectContext___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

void __43__ICFolderCoreDataIndexer_isDefaultFolder___block_invoke(uint64_t a1)
{
  char isKindOfClass;
  void *v3;
  char v4;
  id v5;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    v5 = v3;
    v4 = objc_msgSend(v5, "isDefaultFolderForAccount");
  }
  else
  {
    if (!objc_msgSend(v3, "conformsToProtocol:", &unk_1EED6F370))
      return;
    objc_opt_class();
    ICClassAndProtocolCast();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isDefaultFolder", &unk_1EED6F370);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;

}

void __42__ICFolderCoreDataIndexer_isCustomFolder___block_invoke(uint64_t a1)
{
  char isKindOfClass;
  void *v3;
  char v4;
  id v5;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    v5 = v3;
    v4 = objc_msgSend(v5, "isSystemFolder");
  }
  else
  {
    if (!objc_msgSend(v3, "conformsToProtocol:", &unk_1EED6F370))
      return;
    objc_opt_class();
    ICClassAndProtocolCast();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isDefaultFolder", &unk_1EED6F370);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 ^ 1;

}

void __51__ICFolderCoreDataIndexer_addSystemSectionIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "overrideContainerIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v35 = (id)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v35);
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "virtualSmartFolderIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v35);
LABEL_20:

    goto LABEL_21;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldIncludeSystemPaper"))
  {
    objc_msgSend(MEMORY[0x1E0D639C8], "globalVirtualSystemPaperFolder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "modernManagedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isHiddenInContext:", v6);

    if ((v7 & 1) == 0)
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0D639C8], "globalVirtualSystemPaperFolder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "virtualSmartFolderIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D639C8], "globalVirtualSystemPaperFolder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldIncludeMathNotes"))
  {
    objc_msgSend(MEMORY[0x1E0D639C8], "globalVirtualMathNotesFolder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "modernManagedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isHiddenInContext:", v14);

    if ((v15 & 1) == 0)
    {
      v16 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0D639C8], "globalVirtualMathNotesFolder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

    }
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "virtualSmartFolderIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D639C8], "globalVirtualMathNotesFolder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v20);

  }
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldIncludeCallNotes"))
  {
    objc_msgSend(MEMORY[0x1E0D639C8], "globalVirtualCallNotesFolder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "modernManagedObjectContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isHiddenInContext:", v22);

    if ((v23 & 1) == 0)
    {
      v24 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0D639C8], "globalVirtualCallNotesFolder");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v25);

    }
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "virtualSmartFolderIdentifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D639C8], "globalVirtualCallNotesFolder");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v28);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "shouldIncludeSharedWithYou") != 2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "shouldIncludeSharedWithYou") == 1
      || (objc_msgSend(MEMORY[0x1E0D639C8], "globalVirtualSharedWithYouFolder"),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(*(id *)(a1 + 32), "modernManagedObjectContext"),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          v31 = objc_msgSend(v29, "isHiddenInContext:", v30),
          v30,
          v29,
          (v31 & 1) == 0))
    {
      v32 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0D639C8], "globalVirtualSharedWithYouFolder");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v33);

    }
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "virtualSmartFolderIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D639C8], "globalVirtualSharedWithYouFolder");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v34);

    goto LABEL_20;
  }
LABEL_21:

}

- (int64_t)shouldIncludeSharedWithYou
{
  return self->_shouldIncludeSharedWithYou;
}

- (NSMutableSet)virtualSmartFolderIdentifiers
{
  return self->_virtualSmartFolderIdentifiers;
}

- (ICFolderCoreDataIndexer)initWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  return -[ICFolderCoreDataIndexer initWithLegacyManagedObjectContext:modernManagedObjectContext:overrideContainerIdentifier:](self, "initWithLegacyManagedObjectContext:modernManagedObjectContext:overrideContainerIdentifier:", a3, a4, 0);
}

- (id)modernFolderFetchPredicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("         isHiddenNoteContainer != YES AND          owner.didChooseToMigrate == YES AND          markedForDeletion != YES AND          needsInitialFetchFromCloud != YES AND          (folderType != %d || SUBQUERY(notes, $n, $n.markedForDeletion != YES).@count > 0)"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[ICFolderCoreDataIndexer shouldIncludeSmartFolders](self, "shouldIncludeSmartFolders"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("folderType != %d"), 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  -[ICFolderCoreDataIndexer accountObjectID](self, "accountObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3880];
    -[ICFolderCoreDataIndexer accountObjectID](self, "accountObjectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithFormat:", CFSTR("account == %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

  }
  -[ICFolderCoreDataIndexer ancestorObjectID](self, "ancestorObjectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ICFolderCoreDataIndexer modernDescendantsPredicate](self, "modernDescendantsPredicate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)shouldIncludeSmartFolders
{
  return self->_shouldIncludeSmartFolders;
}

- (NSManagedObjectID)accountObjectID
{
  return self->_accountObjectID;
}

- (id)legacyFolderFetchPredicate
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[ICFolderCoreDataIndexer includeMigratedLocalLegacyAccounts](self, "includeMigratedLocalLegacyAccounts")
    || !-[ICFolderCoreDataIndexer includeMigratedICloudLegacyAccounts](self, "includeMigratedICloudLegacyAccounts"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("account.didChooseToMigrate == nil OR account.didChooseToMigrate == NO"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ICFolderCoreDataIndexer includeMigratedLocalLegacyAccounts](self, "includeMigratedLocalLegacyAccounts")
      || -[ICFolderCoreDataIndexer includeMigratedICloudLegacyAccounts](self, "includeMigratedICloudLegacyAccounts"))
    {
      v5 = -[ICFolderCoreDataIndexer includeMigratedLocalLegacyAccounts](self, "includeMigratedLocalLegacyAccounts");
      v6 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", !v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "predicateWithFormat:", CFSTR("account.type == %@"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0CB3528];
      v23[0] = v4;
      v23[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "orPredicateWithSubpredicates:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0CB3528];
      v22[0] = v3;
      v22[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = (void *)v11;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB3528];
      v24[0] = v3;
      v24[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "andPredicateWithSubpredicates:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!-[ICFolderCoreDataIndexer includeMigratedLocalLegacyAccounts](self, "includeMigratedLocalLegacyAccounts")
      && -[ICFolderCoreDataIndexer hideUnmigratedLocalLegacyAccounts](self, "hideUnmigratedLocalLegacyAccounts"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("account.type != %@"), &unk_1E5C71E38);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB3528];
      v21[0] = v14;
      v21[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "andPredicateWithSubpredicates:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v19;
    }

    v3 = v14;
  }
  return v3;
}

- (BOOL)includeMigratedLocalLegacyAccounts
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E0D64430]);

  return v3;
}

- (BOOL)includeMigratedICloudLegacyAccounts
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E0D64428]);

  return v3;
}

- (BOOL)hideUnmigratedLocalLegacyAccounts
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E0D643A8]) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E0D643A0]);

  return v3;
}

- (id)modernDescendantsPredicate
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__ICFolderCoreDataIndexer_modernDescendantsPredicate__block_invoke;
  v5[3] = &unk_1E5C21378;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D63B10], "ancestorFolderPredicatesWithBlock:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __127__ICFolderCoreDataIndexer_sortedFolderItemIdentifiersForItemIdentifiers_legacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v7, "ic_isModernAccountType", (_QWORD)v13))
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
          continue;
        }
        if (objc_msgSend(v7, "ic_isModernFolderType"))
        {
          objc_msgSend(*(id *)(a1 + 48), "ic_existingObjectWithID:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(*(id *)(a1 + 56), "isDefaultFolder:", v8))
          {
            v9 = *(void **)(a1 + 64);
            goto LABEL_13;
          }
          if (objc_msgSend(v8, "isTrashFolder"))
          {
            v9 = *(void **)(a1 + 72);
LABEL_13:
            objc_msgSend(v9, "addObject:", v7);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 80), "ic_addNonNilObject:", v8);
          }

          continue;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 80), "sortUsingSelector:", sel_compare_);
  objc_msgSend(*(id *)(a1 + 80), "ic_map:", &__block_literal_global_164);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (BOOL)isDefaultFolder:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__ICFolderCoreDataIndexer_isDefaultFolder___block_invoke;
  v7[3] = &unk_1E5C20078;
  v5 = v3;
  v8 = v5;
  v9 = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

- (unint64_t)countOfModernAccounts
{
  void *v2;
  unint64_t v3;

  -[ICFolderCoreDataIndexer modernAccountManagedObjectIDs](self, "modernAccountManagedObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

BOOL __70__ICFolderCoreDataIndexer_rootFolderListSectionIdentifiersForSection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "folderItemIdentifiersToParentFolderItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 == 0;
}

- (NSMutableDictionary)folderItemIdentifiersToParentFolderItemIdentifier
{
  return self->_folderItemIdentifiersToParentFolderItemIdentifier;
}

void __87__ICFolderCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ICFolderListSectionIdentifier *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  ICButtonItemIdentifier *v19;
  ICButtonItemIdentifier *v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  ICFolderListSectionIdentifier *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  ICButtonItemIdentifier *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  char v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  id obj;
  uint64_t v130;
  void *v131;
  void *v132;
  NSObject *v133;
  void *v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint8_t buf[4];
  void *v140;
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tagIndexer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeFetchedResultsControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "tagIndexer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexObjectsInSection:sectionIndex:fetchedResultsController:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v6);
  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "modernFetchedResultsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "addSystemSectionIfNeeded");
    if (objc_msgSend(*(id *)(a1 + 32), "shouldIncludeNewFolderButton"))
    {
      v9 = (void *)MEMORY[0x1E0D639C8];
      objc_msgSend(*(id *)(a1 + 32), "modernManagedObjectContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "defaultAccountInContext:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v12 = -[ICFolderListSectionIdentifier initWithSectionType:]([ICFolderListSectionIdentifier alloc], "initWithSectionType:", 6);
        objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v12);

        objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiersToButtonIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = v15;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v18 = v17;

        v19 = -[ICButtonItemIdentifier initWithType:parentIdentifier:]([ICButtonItemIdentifier alloc], "initWithType:parentIdentifier:", 0, v12);
        objc_msgSend(v18, "addObject:", v19);
        v20 = -[ICButtonItemIdentifier initWithType:parentIdentifier:]([ICButtonItemIdentifier alloc], "initWithType:parentIdentifier:", 1, v12);
        objc_msgSend(v18, "addObject:", v20);
        objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiersToButtonIdentifiers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v18, v12);

      }
    }
  }
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "objects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v130 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v141, 16);
  if (v130)
  {
    v22 = *(_QWORD *)v136;
    v128 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v130; ++i)
      {
        if (*(_QWORD *)v136 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
        objc_msgSend(v24, "objectID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[ICFolderListSectionIdentifier initWithObject:]([ICFolderListSectionIdentifier alloc], "initWithObject:", v24);
        if (v26)
        {
          objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiersToButtonIdentifiers");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v28)
          {
            v30 = v28;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
            v30 = objc_claimAutoreleasedReturnValue();
          }
          v133 = v30;

          objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiersToVirtualSmartFolderIdentifiers");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", v26);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v33)
          {
            v35 = v33;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
            v35 = (id)objc_claimAutoreleasedReturnValue();
          }
          v134 = v35;

          objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiersToFolderItemIdentifiers");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v26);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v37;
          if (v37)
          {
            v39 = v37;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
            v39 = (id)objc_claimAutoreleasedReturnValue();
          }
          v131 = v39;
          v31 = v133;

          objc_opt_class();
          v132 = v25;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v40 = v24;
            v41 = v134;
            if (objc_msgSend(v40, "isVisible"))
            {
              v42 = v131;
              if (((objc_msgSend(*(id *)(a1 + 32), "shouldIncludeTrash") & 1) != 0
                 || (objc_msgSend(v40, "isTrashFolder") & 1) == 0)
                && ((objc_msgSend(*(id *)(a1 + 32), "shouldIncludeDefaultFolder") & 1) != 0
                 || (objc_msgSend(v40, "isDefaultFolderForAccount") & 1) == 0))
              {
                objc_msgSend(*(id *)(a1 + 32), "modernAccountManagedObjectIDs");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                -[ICFolderListSectionIdentifier accountObjectID](v26, "accountObjectID");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "ic_addNonNilObject:", v44);

                if (objc_msgSend(*(id *)(a1 + 32), "shouldIncludeNewFolderButton")
                  && -[ICFolderListSectionIdentifier sectionType](v26, "sectionType"))
                {
                  v45 = -[ICButtonItemIdentifier initWithType:parentIdentifier:]([ICButtonItemIdentifier alloc], "initWithType:parentIdentifier:", 0, v26);
                  -[NSObject addObject:](v133, "addObject:", v45);

                }
                if (objc_msgSend(*(id *)(a1 + 32), "shouldIncludeSystemPaper") == 1)
                {
                  objc_msgSend(v40, "account");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "virtualSystemPaperFolder");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v134, "addObject:", v47);

                  objc_opt_class();
                  objc_msgSend(*(id *)(a1 + 32), "virtualSmartFolderIdentifiers");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  ICCheckedDynamicCast();
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "account");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "virtualSystemPaperFolder");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "addObject:", v51);

                  v31 = v133;
                  v22 = v128;

                }
                if (objc_msgSend(*(id *)(a1 + 32), "shouldIncludeMathNotes") == 1)
                {
                  objc_msgSend(v40, "account");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "virtualMathNotesFolder");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v134, "addObject:", v53);

                  objc_opt_class();
                  objc_msgSend(*(id *)(a1 + 32), "virtualSmartFolderIdentifiers");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  ICCheckedDynamicCast();
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "account");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "virtualMathNotesFolder");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "addObject:", v57);

                  v22 = v128;
                  v31 = v133;
                }
                v41 = v134;
                if (objc_msgSend(*(id *)(a1 + 32), "shouldIncludeCallNotes") == 1)
                {
                  objc_msgSend(v40, "account");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "virtualCallNotesFolder");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v134, "addObject:", v59);

                  objc_opt_class();
                  objc_msgSend(*(id *)(a1 + 32), "virtualSmartFolderIdentifiers");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  ICCheckedDynamicCast();
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "account");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "virtualCallNotesFolder");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "addObject:", v63);

                  v22 = v128;
                  v41 = v134;

                  v31 = v133;
                }
                objc_msgSend(v40, "parent");
                v64 = objc_claimAutoreleasedReturnValue();
                if (v64)
                {
                  v65 = (void *)v64;
                  objc_msgSend(v40, "parent");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "objectID");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(a1 + 32), "ancestorObjectID");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  v69 = objc_msgSend(v67, "isEqual:", v68);

                  v22 = v128;
                  v41 = v134;

                  v31 = v133;
                  if ((v69 & 1) == 0)
                  {
                    objc_msgSend(*(id *)(a1 + 32), "folderItemIdentifiersToChildFolderItemIdentifiers");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "parent");
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "objectID");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "objectForKeyedSubscript:", v72);
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    v74 = v73;
                    if (v73)
                    {
                      v75 = v73;
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
                      v75 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    v96 = v75;

                    objc_msgSend(v40, "objectID");
                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v96, "addObject:", v97);

                    objc_msgSend(*(id *)(a1 + 32), "folderItemIdentifiersToChildFolderItemIdentifiers");
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "parent");
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v99, "objectID");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v98, "setObject:forKeyedSubscript:", v96, v100);

                    objc_msgSend(v40, "parent");
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v101, "objectID");
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(a1 + 32), "folderItemIdentifiersToParentFolderItemIdentifier");
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "objectID");
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v103, "setObject:forKeyedSubscript:", v102, v104);

                    v22 = v128;
                    v31 = v133;
                    v41 = v134;
                  }
                }
                if (objc_msgSend(v40, "isSmartFolder"))
                {
                  objc_msgSend(*(id *)(a1 + 32), "smartFolderManagedObjectIDs");
                  v105 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "objectID");
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v105, "ic_addNonNilObject:", v106);

                  v31 = v133;
                }
                objc_msgSend(*(id *)(a1 + 32), "modernManagedObjectContext");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "ic_refreshObject:mergeChanges:", v40, 1);
                goto LABEL_69;
              }
LABEL_73:

              v25 = v132;
              goto LABEL_74;
            }
LABEL_49:
            v42 = v131;
            goto LABEL_73;
          }
          v41 = v134;
          if (objc_msgSend(v24, "conformsToProtocol:", &unk_1EED6F370))
          {
            objc_opt_class();
            ICClassAndProtocolCast();
            v40 = (id)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(*(id *)(a1 + 32), "shouldIncludeTrash", &unk_1EED6F370) & 1) == 0
              && (objc_msgSend(v40, "isTrashFolder") & 1) != 0)
            {
              goto LABEL_49;
            }
            v42 = v131;
            if ((objc_msgSend(*(id *)(a1 + 32), "shouldIncludeDefaultFolder") & 1) == 0
              && (objc_msgSend(v40, "isDefaultFolder") & 1) != 0)
            {
              goto LABEL_73;
            }
            objc_msgSend(v40, "ancestorFolders");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "valueForKey:", CFSTR("objectID"));
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "ancestorObjectID");
            v78 = objc_claimAutoreleasedReturnValue();
            if (v78)
            {
              v79 = (void *)v78;
              objc_msgSend(*(id *)(a1 + 32), "ancestorObjectID");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = objc_msgSend(v77, "containsObject:", v80);

              if (!v81)
              {

                v22 = v128;
                v31 = v133;
                v41 = v134;
                goto LABEL_73;
              }
            }
            objc_msgSend(*(id *)(a1 + 32), "legacyAccountManagedObjectIDs");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICFolderListSectionIdentifier accountObjectID](v26, "accountObjectID");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "ic_addNonNilObject:", v83);

            objc_msgSend(v40, "parentFolder");
            v84 = objc_claimAutoreleasedReturnValue();
            if (v84)
            {
              v85 = (void *)v84;
              v127 = v77;
              objc_msgSend(v40, "parentFolder");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "objectID");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "ancestorObjectID");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = objc_msgSend(v87, "isEqual:", v88);

              if ((v89 & 1) == 0)
              {
                objc_msgSend(*(id *)(a1 + 32), "folderItemIdentifiersToChildFolderItemIdentifiers");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "parentFolder");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "objectID");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "objectForKeyedSubscript:", v92);
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                v94 = v93;
                if (v93)
                {
                  v95 = v93;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
                  v95 = (id)objc_claimAutoreleasedReturnValue();
                }
                v107 = v95;

                objc_msgSend(v40, "objectID");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "addObject:", v108);

                objc_msgSend(*(id *)(a1 + 32), "folderItemIdentifiersToChildFolderItemIdentifiers");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "parentFolder");
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v110, "objectID");
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "setObject:forKeyedSubscript:", v107, v111);

                objc_msgSend(v40, "parentFolder");
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v112, "objectID");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 32), "folderItemIdentifiersToParentFolderItemIdentifier");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "objectID");
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "setObject:forKeyedSubscript:", v113, v115);

              }
              v77 = v127;
              v22 = v128;
            }
            else
            {
              v22 = v128;
            }
            v31 = v133;
            v41 = v134;
LABEL_69:

            v25 = v132;
          }
          -[ICFolderListSectionIdentifier accountObjectID](v26, "accountObjectID");
          v116 = (void *)objc_claimAutoreleasedReturnValue();

          if (v116)
          {
            objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiers");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "ic_addNonNilObject:", v26);

          }
          v42 = v131;
          objc_msgSend(v131, "ic_addNonNilObject:", v25);
          objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiersToButtonIdentifiers");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "setObject:forKeyedSubscript:", v31, v26);

          objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiersToVirtualSmartFolderIdentifiers");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "setObject:forKeyedSubscript:", v41, v26);

          objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiersToFolderItemIdentifiers");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "setObject:forKeyedSubscript:", v131, v26);

          objc_msgSend(*(id *)(a1 + 32), "addAccountItemsIfNeededForFolderSectionIdentifier:", v26);
          v121 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          objc_msgSend(v24, "objectID");
          v40 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "addObject:", v40);
          goto LABEL_73;
        }
        v31 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v140 = v24;
          _os_log_debug_impl(&dword_1AC7A1000, v31, OS_LOG_TYPE_DEBUG, "Cannot create folder list section identifier from object %@", buf, 0xCu);
        }
LABEL_74:

      }
      v130 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v141, 16);
    }
    while (v130);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "shouldIncludeTags"))
  {
    objc_msgSend(*(id *)(a1 + 32), "tagIndexer");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "objectIDs");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend(v123, "count");

    if (v124)
    {
      objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiers");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICFolderListSectionIdentifier tagSectionIdentifier](ICFolderListSectionIdentifier, "tagSectionIdentifier");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "ic_addNonNilObject:", v126);

    }
  }
}

- (NSMutableDictionary)folderListSectionIdentifiersToVirtualSmartFolderIdentifiers
{
  return self->_folderListSectionIdentifiersToVirtualSmartFolderIdentifiers;
}

- (NSMutableDictionary)folderListSectionIdentifiersToButtonIdentifiers
{
  return self->_folderListSectionIdentifiersToButtonIdentifiers;
}

- (NSMutableSet)modernAccountManagedObjectIDs
{
  return self->_modernAccountManagedObjectIDs;
}

- (NSMutableOrderedSet)folderListSectionIdentifiers
{
  return self->_folderListSectionIdentifiers;
}

- (int64_t)shouldIncludeSystemPaper
{
  return self->_shouldIncludeSystemPaper;
}

- (BOOL)shouldIncludeNewFolderButton
{
  return self->_shouldIncludeNewFolderButton;
}

uint64_t __62__ICFolderCoreDataIndexer_itemIdentifiersContainCustomFolder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v3 = a2;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (objc_msgSend(v3, "ic_isModernFolderType"))
  {
    objc_msgSend(*(id *)(a1 + 32), "modernManagedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__ICFolderCoreDataIndexer_itemIdentifiersContainCustomFolder___block_invoke_2;
    v13[3] = &unk_1E5C1E190;
    v5 = *(_QWORD *)(a1 + 32);
    v15 = &v16;
    v13[4] = v5;
    v14 = v3;
    objc_msgSend(v4, "performBlockAndWait:", v13);

  }
  if (objc_msgSend(v3, "ic_isLegacyFolderType"))
  {
    objc_msgSend(*(id *)(a1 + 32), "legacyManagedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__ICFolderCoreDataIndexer_itemIdentifiersContainCustomFolder___block_invoke_3;
    v10[3] = &unk_1E5C1E190;
    v7 = *(_QWORD *)(a1 + 32);
    v12 = &v16;
    v10[4] = v7;
    v11 = v3;
    objc_msgSend(v6, "performBlockAndWait:", v10);

  }
  v8 = *((unsigned __int8 *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __62__ICFolderCoreDataIndexer_itemIdentifiersContainCustomFolder___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "modernManagedObjectContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_existingObjectWithID:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "isCustomFolder:", v3);

}

- (BOOL)shouldIncludeTrash
{
  return self->_shouldIncludeTrash;
}

- (BOOL)isCustomFolder:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__ICFolderCoreDataIndexer_isCustomFolder___block_invoke;
  v7[3] = &unk_1E5C20078;
  v5 = v3;
  v8 = v5;
  v9 = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

- (void)addAccountItemsIfNeededForFolderSectionIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[ICFolderCoreDataIndexer shouldIncludeAccount](self, "shouldIncludeAccount") != 2)
  {
    -[ICFolderCoreDataIndexer folderListSectionIdentifiersToFolderItemIdentifiers](self, "folderListSectionIdentifiersToFolderItemIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    if (-[ICFolderCoreDataIndexer shouldIncludeAccount](self, "shouldIncludeAccount") == 1
      || -[ICFolderCoreDataIndexer itemIdentifiersContainCustomFolder:](self, "itemIdentifiersContainCustomFolder:", v8))
    {
      objc_msgSend(v11, "accountObjectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ic_addNonNilObject:", v9);

    }
    -[ICFolderCoreDataIndexer folderListSectionIdentifiersToFolderItemIdentifiers](self, "folderListSectionIdentifiersToFolderItemIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, v11);

  }
}

- (NSMutableDictionary)folderListSectionIdentifiersToFolderItemIdentifiers
{
  return self->_folderListSectionIdentifiersToFolderItemIdentifiers;
}

- (int64_t)shouldIncludeAccount
{
  return self->_shouldIncludeAccount;
}

- (BOOL)itemIdentifiersContainCustomFolder:(id)a3
{
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__ICFolderCoreDataIndexer_itemIdentifiersContainCustomFolder___block_invoke;
  v6[3] = &unk_1E5C20248;
  v6[4] = self;
  LOBYTE(self) = objc_msgSend(v4, "ic_containsObjectPassingTest:", v6);

  return (char)self;
}

- (ICTagCoreDataIndexer)tagIndexer
{
  return self->_tagIndexer;
}

- (id)activeFetchedResultsControllers
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFolderCoreDataIndexer modernFetchedResultsController](self, "modernFetchedResultsController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[ICFolderCoreDataIndexer ancestorObjectID](self, "ancestorObjectID");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[ICFolderCoreDataIndexer ancestorObjectID](self, "ancestorObjectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "ic_isModernContainerType");

      if (!v9)
        goto LABEL_7;
    }
    else
    {

    }
    -[ICFolderCoreDataIndexer modernFetchedResultsController](self, "modernFetchedResultsController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
LABEL_7:
  -[ICFolderCoreDataIndexer legacyFetchedResultsController](self, "legacyFetchedResultsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 || !-[ICFolderCoreDataIndexer shouldIncludeLegacyAccounts](self, "shouldIncludeLegacyAccounts"))
    goto LABEL_14;
  -[ICFolderCoreDataIndexer ancestorObjectID](self, "ancestorObjectID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    goto LABEL_13;
  }
  v13 = (void *)v12;
  -[ICFolderCoreDataIndexer ancestorObjectID](self, "ancestorObjectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "ic_isLegacyContainerType");

  if (v15)
  {
LABEL_13:
    -[ICFolderCoreDataIndexer legacyFetchedResultsController](self, "legacyFetchedResultsController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);
LABEL_14:

  }
  if (-[ICFolderCoreDataIndexer shouldIncludeTags](self, "shouldIncludeTags"))
  {
    -[ICFolderCoreDataIndexer tagIndexer](self, "tagIndexer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activeFetchedResultsControllers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v18);

  }
  v19 = (void *)objc_msgSend(v3, "copy");

  return v19;
}

- (NSManagedObjectID)ancestorObjectID
{
  return self->_ancestorObjectID;
}

- (NSFetchedResultsController)modernFetchedResultsController
{
  return self->_modernFetchedResultsController;
}

- (NSFetchedResultsController)legacyFetchedResultsController
{
  return self->_legacyFetchedResultsController;
}

- (BOOL)shouldIncludeTags
{
  return self->_shouldIncludeTags;
}

- (BOOL)shouldIncludeLegacyAccounts
{
  return self->_shouldIncludeLegacyAccounts;
}

- (void)addSystemSectionIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  -[ICFolderCoreDataIndexer folderListSectionIdentifiersToVirtualSmartFolderIdentifiers](self, "folderListSectionIdentifiersToVirtualSmartFolderIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICFolderListSectionIdentifier systemSectionIdentifier](ICFolderListSectionIdentifier, "systemSectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__ICFolderCoreDataIndexer_addSystemSectionIfNeeded__block_invoke;
  v15[3] = &unk_1E5C1D9A8;
  v15[4] = self;
  v14 = v8;
  v16 = v14;
  objc_msgSend(v9, "performBlockAndWait:", v15);

  if (objc_msgSend(v14, "count"))
  {
    -[ICFolderCoreDataIndexer folderListSectionIdentifiers](self, "folderListSectionIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICFolderListSectionIdentifier systemSectionIdentifier](ICFolderListSectionIdentifier, "systemSectionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    -[ICFolderCoreDataIndexer folderListSectionIdentifiersToVirtualSmartFolderIdentifiers](self, "folderListSectionIdentifiersToVirtualSmartFolderIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICFolderListSectionIdentifier systemSectionIdentifier](ICFolderListSectionIdentifier, "systemSectionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v13);

  }
}

void __127__ICFolderCoreDataIndexer_sortedFolderItemIdentifiersForItemIdentifiers_legacyManagedObjectContext_modernManagedObjectContext___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v7, "ic_isLegacyAccountType", (_QWORD)v15))
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
        }
        else if (objc_msgSend(v7, "ic_isLegacyFolderType"))
        {
          objc_msgSend(*(id *)(a1 + 48), "objectWithID:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(*(id *)(a1 + 56), "isDefaultFolder:", v8);
          if (v9)
            v10 = 64;
          else
            v10 = 72;
          if (v9)
            v11 = v7;
          else
            v11 = v8;
          objc_msgSend(*(id *)(a1 + v10), "addObject:", v11);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 72), "sortUsingSelector:", sel_compare_);
  objc_msgSend(*(id *)(a1 + 72), "ic_map:", &__block_literal_global_165);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

- (unint64_t)countOfLegacyAccounts
{
  void *v2;
  unint64_t v3;

  -[ICFolderCoreDataIndexer legacyAccountManagedObjectIDs](self, "legacyAccountManagedObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSMutableSet)legacyAccountManagedObjectIDs
{
  return self->_legacyAccountManagedObjectIDs;
}

void __36__ICFolderCoreDataIndexer_willIndex__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "tagIndexer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willIndex");

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setFolderListSectionIdentifiers:", v3);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setFolderListSectionIdentifiersToButtonIdentifiers:", v4);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setFolderListSectionIdentifiersToVirtualSmartFolderIdentifiers:", v5);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setFolderListSectionIdentifiersToFolderItemIdentifiers:", v6);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setFolderItemIdentifiersToParentFolderItemIdentifier:", v7);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setFolderItemIdentifiersToChildFolderItemIdentifiers:", v8);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLegacyAccountManagedObjectIDs:", v9);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setModernAccountManagedObjectIDs:", v10);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSmartFolderManagedObjectIDs:", v11);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setVirtualSmartFolderIdentifiers:", v12);

}

- (void)setVirtualSmartFolderIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_virtualSmartFolderIdentifiers, a3);
}

- (void)setSmartFolderManagedObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_smartFolderManagedObjectIDs, a3);
}

- (void)setModernAccountManagedObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_modernAccountManagedObjectIDs, a3);
}

- (void)setLegacyAccountManagedObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_legacyAccountManagedObjectIDs, a3);
}

- (void)setFolderListSectionIdentifiersToVirtualSmartFolderIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_folderListSectionIdentifiersToVirtualSmartFolderIdentifiers, a3);
}

- (void)setFolderListSectionIdentifiersToFolderItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_folderListSectionIdentifiersToFolderItemIdentifiers, a3);
}

- (void)setFolderListSectionIdentifiersToButtonIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_folderListSectionIdentifiersToButtonIdentifiers, a3);
}

- (void)setFolderListSectionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_folderListSectionIdentifiers, a3);
}

- (void)setFolderItemIdentifiersToParentFolderItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_folderItemIdentifiersToParentFolderItemIdentifier, a3);
}

- (void)setFolderItemIdentifiersToChildFolderItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_folderItemIdentifiersToChildFolderItemIdentifiers, a3);
}

- (void)addChildFoldersOfParentFolder:(id)a3 toSectionSnapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ICFolderCoreDataIndexer folderItemIdentifiersToChildFolderItemIdentifiers](self, "folderItemIdentifiersToChildFolderItemIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendItems:intoParent:", v10, v6);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[ICFolderCoreDataIndexer addChildFoldersOfParentFolder:toSectionSnapshot:](self, "addChildFoldersOfParentFolder:toSectionSnapshot:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), v7, (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (NSMutableDictionary)folderItemIdentifiersToChildFolderItemIdentifiers
{
  return self->_folderItemIdentifiersToChildFolderItemIdentifiers;
}

void __105__ICFolderCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  id obj;
  id obja;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  _BYTE v70[128];
  _BYTE v71[128];
  void *v72;
  uint64_t v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sortIdentifiersWithLegacyManagedObjectContext:modernManagedObjectContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
  if (v2)
  {
    v3 = v2;
    v55 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v66 != v55)
          objc_enumerationMutation(obj);
        v6 = *(void **)(a1 + 56);
        v73 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
        v5 = v73;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendSectionsWithIdentifiers:", v7);

        objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiersToButtonIdentifiers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          v11 = v9;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v11;

        v13 = *(void **)(a1 + 56);
        objc_msgSend(v12, "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v14, v5);

        objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiersToVirtualSmartFolderIdentifiers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = v16;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        v19 = v18;

        v20 = *(void **)(a1 + 56);
        objc_msgSend(v19, "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v21, v5);

        objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiersToFolderItemIdentifiers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          v25 = v23;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
          v25 = (id)objc_claimAutoreleasedReturnValue();
        }
        v26 = v25;

        v27 = *(void **)(a1 + 56);
        objc_msgSend(v26, "array");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v28, v5);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    }
    while (v3);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "shouldIncludeTags"))
  {
    objc_msgSend(*(id *)(a1 + 32), "tagIndexer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "newSnapshotFromIndexWithLegacyManagedObjectContext:modernManagedObjectContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    if (objc_msgSend(*(id *)(a1 + 32), "shouldIncludeTagOperator"))
    {
      v32 = *(void **)(a1 + 56);
      +[ICTagOperatorItemIdentifier sharedItemIdentifier](ICTagOperatorItemIdentifier, "sharedItemIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "itemIdentifiers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "insertItemsWithIdentifiers:beforeItemWithIdentifier:", v34, v36);

    }
    objc_msgSend(v29, "ic_addNonNilObject:", v31);

  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v51 = v29;
  obja = (id)objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
  if (obja)
  {
    v52 = *(_QWORD *)v62;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v62 != v52)
          objc_enumerationMutation(v51);
        v56 = v37;
        v38 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v37);
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        objc_msgSend(v38, "sectionIdentifiers");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v58;
          do
          {
            for (j = 0; j != v41; ++j)
            {
              if (*(_QWORD *)v58 != v42)
                objc_enumerationMutation(v39);
              v44 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
              objc_msgSend(*(id *)(a1 + 56), "sectionIdentifiers");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v45, "containsObject:", v44);

              if ((v46 & 1) == 0)
              {
                v47 = *(void **)(a1 + 56);
                v69 = v44;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "appendSectionsWithIdentifiers:", v48);

              }
              v49 = *(void **)(a1 + 56);
              objc_msgSend(v38, "itemIdentifiersInSectionWithIdentifier:", v44);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v50, v44);

            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
          }
          while (v41);
        }

        v37 = v56 + 1;
      }
      while ((id)(v56 + 1) != obja);
      obja = (id)objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    }
    while (obja);
  }

}

- (id)expansionStateContext
{
  void *v2;
  void *v3;
  void *v4;

  -[ICFolderCoreDataIndexer ancestorObjectID](self, "ancestorObjectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URIRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldIncludeSubfolders
{
  return self->_shouldIncludeSubfolders;
}

- (BOOL)shouldAutoExpandSingleSection
{
  return self->_shouldAutoExpandSingleSection;
}

- (id)rootFolderListSectionIdentifiersForSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v4 = a3;
  -[ICFolderCoreDataIndexer folderListSectionIdentifiersToFolderItemIdentifiers](self, "folderListSectionIdentifiersToFolderItemIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(v8, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__ICFolderCoreDataIndexer_rootFolderListSectionIdentifiersForSection___block_invoke;
  v14[3] = &unk_1E5C20248;
  v14[4] = self;
  objc_msgSend(v10, "ic_objectsPassingTest:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orderedSetWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)willIndex
{
  NSObject *v3;
  _QWORD block[5];

  -[ICFolderCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ICFolderCoreDataIndexer_willIndex__block_invoke;
  block[3] = &unk_1E5C1D540;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __35__ICFolderCoreDataIndexer_didIndex__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tagIndexer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didIndex");

}

- (void)didIndex
{
  NSObject *v3;
  _QWORD block[5];

  -[ICFolderCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__ICFolderCoreDataIndexer_didIndex__block_invoke;
  block[3] = &unk_1E5C1D540;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)setShouldIncludeSubfolders:(BOOL)a3
{
  self->_shouldIncludeSubfolders = a3;
}

- (unint64_t)totalFolderCount
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ICFolderCoreDataIndexer folderListSectionIdentifiersToFolderItemIdentifiers](self, "folderListSectionIdentifiersToFolderItemIdentifiers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "count");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  -[ICFolderCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __105__ICFolderCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke;
  v16[3] = &unk_1E5C1F1B0;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v10 = v8;
  v19 = v10;
  v11 = v7;
  v12 = v6;
  dispatch_sync(v9, v16);

  v13 = v19;
  v14 = v10;

  return v14;
}

- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__45;
  v24 = __Block_byref_object_dispose__45;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[ICFolderCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__ICFolderCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke;
  block[3] = &unk_1E5C212E0;
  block[4] = self;
  v11 = v9;
  v16 = v11;
  v12 = v8;
  v18 = &v20;
  v19 = a4;
  v17 = v12;
  dispatch_sync(v10, block);

  v13 = (void *)objc_msgSend((id)v21[5], "copy");
  _Block_object_dispose(&v20, 8);

  return v13;
}

- (OS_dispatch_queue)indexAccessQueue
{
  return self->_indexAccessQueue;
}

- (void)sortIdentifiersWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  id obja;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v6 = a4;
  -[ICFolderCoreDataIndexer folderListSectionIdentifiers](self, "folderListSectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICFolderListSectionIdentifier sortDescriptors](ICFolderListSectionIdentifier, "sortDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortUsingDescriptors:", v8);

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[ICFolderCoreDataIndexer folderListSectionIdentifiersToFolderItemIdentifiers](self, "folderListSectionIdentifiersToFolderItemIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  obj = v10;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v45 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v15, "accountObjectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __100__ICFolderCoreDataIndexer_sortIdentifiersWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke;
          v41[3] = &unk_1E5C1D9A8;
          v42 = v6;
          v43 = v15;
          objc_msgSend(v42, "performBlockAndWait:", v41);

        }
        -[ICFolderCoreDataIndexer folderListSectionIdentifiersToFolderItemIdentifiers](self, "folderListSectionIdentifiersToFolderItemIdentifiers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICFolderCoreDataIndexer sortedFolderItemIdentifiersForItemIdentifiers:legacyManagedObjectContext:modernManagedObjectContext:](self, "sortedFolderItemIdentifiersForItemIdentifiers:legacyManagedObjectContext:modernManagedObjectContext:", v18, v36, v6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "mutableCopy");
        -[ICFolderCoreDataIndexer folderListSectionIdentifiersToFolderItemIdentifiers](self, "folderListSectionIdentifiersToFolderItemIdentifiers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v15);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v12);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[ICFolderCoreDataIndexer folderItemIdentifiersToChildFolderItemIdentifiers](self, "folderItemIdentifiersToChildFolderItemIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");

  obja = v23;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(obja);
        v28 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
        -[ICFolderCoreDataIndexer folderItemIdentifiersToChildFolderItemIdentifiers](self, "folderItemIdentifiersToChildFolderItemIdentifiers");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICFolderCoreDataIndexer sortedFolderItemIdentifiersForItemIdentifiers:legacyManagedObjectContext:modernManagedObjectContext:](self, "sortedFolderItemIdentifiersForItemIdentifiers:legacyManagedObjectContext:modernManagedObjectContext:", v30, v36, v6);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v31, "mutableCopy");
        -[ICFolderCoreDataIndexer folderItemIdentifiersToChildFolderItemIdentifiers](self, "folderItemIdentifiersToChildFolderItemIdentifiers");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, v28);

      }
      v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    }
    while (v25);
  }

}

- (id)sortedFolderItemIdentifiersForItemIdentifiers:(id)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  ICFolderCoreDataIndexer *v37;
  id v38;
  id v39;
  uint64_t *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  ICFolderCoreDataIndexer *v45;
  id v46;
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__45;
  v60 = __Block_byref_object_dispose__45;
  v61 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__45;
  v54 = __Block_byref_object_dispose__45;
  v55 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v12;
  v14 = v9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __127__ICFolderCoreDataIndexer_sortedFolderItemIdentifiersForItemIdentifiers_legacyManagedObjectContext_modernManagedObjectContext___block_invoke;
  v41[3] = &unk_1E5C213E0;
  v18 = v8;
  v42 = v18;
  v19 = v13;
  v43 = v19;
  v20 = v10;
  v44 = v20;
  v45 = self;
  v21 = v15;
  v46 = v21;
  v22 = v16;
  v47 = v22;
  v23 = v11;
  v48 = v23;
  v49 = &v56;
  objc_msgSend(v20, "performBlockAndWait:", v41);
  v33[0] = v17;
  v33[1] = 3221225472;
  v33[2] = __127__ICFolderCoreDataIndexer_sortedFolderItemIdentifiersForItemIdentifiers_legacyManagedObjectContext_modernManagedObjectContext___block_invoke_3;
  v33[3] = &unk_1E5C21428;
  v24 = v18;
  v34 = v24;
  v25 = v19;
  v35 = v25;
  v26 = v14;
  v36 = v26;
  v37 = self;
  v27 = v21;
  v38 = v27;
  v28 = v32;
  v39 = v28;
  v40 = &v50;
  objc_msgSend(v26, "performBlockAndWait:", v33);
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObjectsFromArray:", v25);
  objc_msgSend(v29, "addObjectsFromArray:", v27);
  objc_msgSend(v29, "addObjectsFromArray:", v57[5]);
  objc_msgSend(v29, "addObjectsFromArray:", v51[5]);
  objc_msgSend(v29, "addObjectsFromArray:", v22);
  v30 = (void *)objc_msgSend(v29, "copy");

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  return v30;
}

- (void)setShouldIncludeSystemPaper:(int64_t)a3
{
  self->_shouldIncludeSystemPaper = a3;
}

- (void)setShouldIncludeSharedWithYou:(int64_t)a3
{
  self->_shouldIncludeSharedWithYou = a3;
}

- (void)setShouldIncludeAccount:(int64_t)a3
{
  self->_shouldIncludeAccount = a3;
}

- (void)setShouldAutoExpandSingleSection:(BOOL)a3
{
  self->_shouldAutoExpandSingleSection = a3;
}

- (void)setShouldIncludeTags:(BOOL)a3
{
  self->_shouldIncludeTags = a3;
}

id __53__ICFolderCoreDataIndexer_modernDescendantsPredicate__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3880];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "ancestorObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K == %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setAncestorObjectID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_storeStrong((id *)&self->_ancestorObjectID, a3);
  -[ICFolderCoreDataIndexer modernFolderFetchPredicate](self, "modernFolderFetchPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFolderCoreDataIndexer modernFetchedResultsController](self, "modernFetchedResultsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v4);

  -[ICFolderCoreDataIndexer legacyFolderFetchPredicate](self, "legacyFolderFetchPredicate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ICFolderCoreDataIndexer legacyFetchedResultsController](self, "legacyFetchedResultsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

}

void __100__ICFolderCoreDataIndexer_sortIdentifiersWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "accountObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "ic_refreshObject:mergeChanges:", v4, 1);
}

- (BOOL)shouldIncludeTagOperator
{
  return self->_shouldIncludeTagOperator;
}

- (ICFolderCoreDataIndexer)initWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4 overrideContainerIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICFolderCoreDataIndexer *v11;
  ICFolderCoreDataIndexer *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *indexAccessQueue;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSFetchedResultsController *legacyFetchedResultsController;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSFetchedResultsController *modernFetchedResultsController;
  ICTagCoreDataIndexer *v34;
  void *v35;
  uint64_t v36;
  ICTagCoreDataIndexer *tagIndexer;
  objc_super v39;
  _QWORD v40[2];
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v39.receiver = self;
  v39.super_class = (Class)ICFolderCoreDataIndexer;
  v11 = -[ICCoreDataIndexer initWithLegacyManagedObjectContext:modernManagedObjectContext:](&v39, sel_initWithLegacyManagedObjectContext_modernManagedObjectContext_, v8, v9);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_overrideContainerIdentifier, a5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.notes.folder-list-index-access-queue", v13);
    indexAccessQueue = v12->_indexAccessQueue;
    v12->_indexAccessQueue = (OS_dispatch_queue *)v14;

    v12->_shouldIncludeTags = 0;
    v12->_shouldIncludeTagOperator = 0;
    v12->_shouldIncludeSystemPaper = 0;
    v12->_shouldIncludeMathNotes = 0;
    v12->_shouldIncludeCallNotes = 0;
    v12->_shouldIncludeSmartFolders = 1;
    v12->_shouldIncludeSharedWithYou = 0;
    v12->_shouldIncludeAccount = 0;
    v12->_shouldIncludeDefaultFolder = 1;
    *(_WORD *)&v12->_shouldIncludeTrash = 1;
    v12->_shouldIncludeSubfolders = 1;
    v12->_shouldIncludeLegacyAccounts = 1;
    v12->_shouldAutoExpandSingleSection = 1;
    if (v8)
    {
      v16 = (void *)MEMORY[0x1E0C97B48];
      ICLegacyEntityNameFolder();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fetchRequestWithEntityName:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICFolderCoreDataIndexer legacyFolderFetchPredicate](v12, "legacyFolderFetchPredicate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPredicate:", v19);

      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("name"), 1);
      v41[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSortDescriptors:", v21);

      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97B68]), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v18, v8, 0, 0);
      legacyFetchedResultsController = v12->_legacyFetchedResultsController;
      v12->_legacyFetchedResultsController = (NSFetchedResultsController *)v22;

    }
    if (v9)
    {
      v24 = (void *)MEMORY[0x1E0C97B48];
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "fetchRequestWithEntityName:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "setReturnsObjectsAsFaults:", 0);
      -[ICFolderCoreDataIndexer modernFolderFetchPredicate](v12, "modernFolderFetchPredicate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setPredicate:", v28);

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("folderType"), 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v29;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("title"), 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setSortDescriptors:", v31);

      v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97B68]), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v27, v9, 0, 0);
      modernFetchedResultsController = v12->_modernFetchedResultsController;
      v12->_modernFetchedResultsController = (NSFetchedResultsController *)v32;

      v34 = [ICTagCoreDataIndexer alloc];
      +[ICFolderListSectionIdentifier tagSectionIdentifier](ICFolderListSectionIdentifier, "tagSectionIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[ICTagCoreDataIndexer initWithModernManagedObjectContext:sectionIdentifier:](v34, "initWithModernManagedObjectContext:sectionIdentifier:", v9, v35);
      tagIndexer = v12->_tagIndexer;
      v12->_tagIndexer = (ICTagCoreDataIndexer *)v36;

    }
  }

  return v12;
}

- (void)setShouldIncludeSmartFolders:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  self->_shouldIncludeSmartFolders = a3;
  -[ICFolderCoreDataIndexer modernFolderFetchPredicate](self, "modernFolderFetchPredicate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICFolderCoreDataIndexer modernFetchedResultsController](self, "modernFetchedResultsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

}

- (NSSet)allSmartFolderObjectIDs
{
  void *v2;
  void *v3;

  -[ICFolderCoreDataIndexer smartFolderManagedObjectIDs](self, "smartFolderManagedObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

- (NSSet)allVirtualSmartFolderIdentifiers
{
  void *v2;
  void *v3;

  -[ICFolderCoreDataIndexer virtualSmartFolderIdentifiers](self, "virtualSmartFolderIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

- (id)firstRelevantItemIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  -[ICFolderCoreDataIndexer folderListSectionIdentifiers](self, "folderListSectionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "sectionType"))
  {
    -[ICFolderCoreDataIndexer folderListSectionIdentifiers](self, "folderListSectionIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 >= 2)
    {
      -[ICFolderCoreDataIndexer folderListSectionIdentifiers](self, "folderListSectionIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", 1);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
    }
  }
  -[ICFolderCoreDataIndexer folderListSectionIdentifiersToVirtualSmartFolderIdentifiers](self, "folderListSectionIdentifiersToVirtualSmartFolderIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[ICFolderCoreDataIndexer rootFolderListSectionIdentifiersForSection:](self, "rootFolderListSectionIdentifiersForSection:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)sectionIdentifiersForSectionType:(unint64_t)a3
{
  void *v3;
  void *v4;

  if (a3 == 1)
  {
    -[ICFolderCoreDataIndexer folderListSectionIdentifiers](self, "folderListSectionIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v4;
}

- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v8 = a4;
  v9 = a5;
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICFolderCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __112__ICFolderCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke;
    block[3] = &unk_1E5C201D8;
    block[4] = self;
    v16 = v8;
    v18 = v10;
    v19 = 1;
    v17 = v9;
    v12 = v10;
    dispatch_sync(v11, block);

    v13 = (void *)objc_msgSend(v12, "copy");
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v13;
}

void __112__ICFolderCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  uint64_t i;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  int v37;
  char v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  void *v54;
  _BYTE v55[128];
  void *v56;
  id v57;
  void *v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sortIdentifiersWithLegacyManagedObjectContext:modernManagedObjectContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiersForSectionType:", *(_QWORD *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v45 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v45)
  {
    v43 = v2;
    v44 = *(_QWORD *)v51;
    v3 = 0x1E0C99000uLL;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v51 != v44)
          objc_enumerationMutation(v2);
        v5 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
        objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiersToButtonIdentifiers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          v10 = v8;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        v11 = v10;

        objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiersToVirtualSmartFolderIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;

        if (objc_msgSend(v5, "sectionType"))
        {
          if (objc_msgSend(v5, "sectionType") == 8)
          {
            v59 = v5;
            objc_msgSend(*(id *)(v3 + 3360), "arrayWithObjects:count:", &v59, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "appendItems:", v17);

            if (objc_msgSend(*(id *)(a1 + 32), "shouldIncludeTagOperator"))
            {
              +[ICTagOperatorItemIdentifier sharedItemIdentifier](ICTagOperatorItemIdentifier, "sharedItemIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = v18;
              objc_msgSend(*(id *)(v3 + 3360), "arrayWithObjects:count:", &v58, 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendItems:intoParent:", v19, v5);

            }
            objc_msgSend(v11, "array");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "appendItems:intoParent:", v20, v5);

            objc_msgSend(v16, "array");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "appendItems:intoParent:", v21, v5);

            +[ICTagContainerItemIdentifier sharedItemIdentifier](ICTagContainerItemIdentifier, "sharedItemIdentifier");
            v22 = (id)objc_claimAutoreleasedReturnValue();
            v57 = v22;
            objc_msgSend(*(id *)(v3 + 3360), "arrayWithObjects:count:", &v57, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "appendItems:intoParent:", v23, v5);

          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "rootFolderListSectionIdentifiersForSection:", v5);
            v22 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(*(id *)(a1 + 32), "shouldIncludeOutlineParentItems"))
            {
              v56 = v5;
              objc_msgSend(*(id *)(v3 + 3360), "arrayWithObjects:count:", &v56, 1);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendItems:", v25);

              objc_msgSend(v11, "array");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendItems:intoParent:", v26, v5);

              objc_msgSend(v16, "array");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendItems:intoParent:", v27, v5);

              objc_msgSend(v22, "array");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendItems:intoParent:", v28, v5);
            }
            else
            {
              objc_msgSend(v11, "array");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendItems:", v29);

              objc_msgSend(v16, "array");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendItems:", v30);

              objc_msgSend(v22, "array");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendItems:", v28);
            }

            if (objc_msgSend(*(id *)(a1 + 32), "shouldIncludeSubfolders"))
            {
              v48 = 0u;
              v49 = 0u;
              v46 = 0u;
              v47 = 0u;
              v22 = v22;
              v31 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
              if (v31)
              {
                v32 = v31;
                v33 = *(_QWORD *)v47;
                do
                {
                  for (j = 0; j != v32; ++j)
                  {
                    if (*(_QWORD *)v47 != v33)
                      objc_enumerationMutation(v22);
                    objc_msgSend(*(id *)(a1 + 32), "addChildFoldersOfParentFolder:toSectionSnapshot:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j), v6);
                  }
                  v32 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
                }
                while (v32);
              }

              v2 = v43;
              v3 = 0x1E0C99000;
            }
          }
        }
        else
        {
          objc_msgSend(v11, "array");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendItems:", v24);

          objc_msgSend(v16, "array");
          v22 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendItems:", v22);
        }

        if (objc_msgSend(*(id *)(a1 + 32), "shouldIncludeOutlineParentItems"))
        {
          +[ICExpansionState sharedExpansionState](ICExpansionState, "sharedExpansionState");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "expansionStateContext");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v35, "isSectionIdentiferExpanded:inContext:", v5, v36);

          if (objc_msgSend(*(id *)(a1 + 32), "shouldAutoExpandSingleSection")
            && (objc_msgSend(v2, "count") != 1 ? (v38 = 1) : (v38 = v37), (v38 & 1) == 0))
          {
            objc_msgSend(*(id *)(a1 + 32), "expansionStateContext");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "expandItemIdentifier:context:", v5, v39);

          }
          else if (!v37)
          {
LABEL_41:

            v3 = 0x1E0C99000;
            goto LABEL_42;
          }
          objc_msgSend(v6, "items");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "containsObject:", v5);

          if (v41)
          {
            v54 = v5;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "expandItems:", v42);

          }
          goto LABEL_41;
        }
LABEL_42:
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v6, v5);

      }
      v45 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v45);
  }

}

- (id)sectionIdentifierForHeaderInSection:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  -[ICFolderCoreDataIndexer folderListSectionIdentifiers](self, "folderListSectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= (unint64_t)a3)
  {
    v8 = 0;
  }
  else
  {
    -[ICFolderCoreDataIndexer folderListSectionIdentifiers](self, "folderListSectionIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 < 2)
    {
      v8 = 0;
      return v8;
    }
    -[ICFolderCoreDataIndexer folderListSectionIdentifiers](self, "folderListSectionIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *, _BYTE *);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v4 = a3;
  -[ICFolderCoreDataIndexer firstRelevantItemIdentifier](self, "firstRelevantItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
    v9 = v8;
    do
    {
      v10 = v9;
      v9 = v8;

      -[ICFolderCoreDataIndexer folderItemIdentifiersToParentFolderItemIdentifier](self, "folderItemIdentifiersToParentFolderItemIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v9);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    while (v8);
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__45;
    v30 = __Block_byref_object_dispose__45;
    v31 = 0;
    -[ICFolderCoreDataIndexer folderListSectionIdentifiersToFolderItemIdentifiers](self, "folderListSectionIdentifiersToFolderItemIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __59__ICFolderCoreDataIndexer_nextRelevantItemIdentifierAfter___block_invoke;
    v23 = &unk_1E5C21308;
    v13 = v9;
    v24 = v13;
    v25 = &v26;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", &v20);

    if (v27[5])
    {
      -[ICFolderCoreDataIndexer rootFolderListSectionIdentifiersForSection:](self, "rootFolderListSectionIdentifiersForSection:", v20, v21, v22, v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "indexOfObject:", v13);
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v14, "count") > (unint64_t)(v15 + 1))
          v16 = v15 + 1;
        else
          v16 = 0;
        objc_msgSend(v14, "objectAtIndex:", v16);
        v17 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v17;
      }

    }
    v18 = v5;

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v18 = v5;
  }

  return v18;
}

void __59__ICFolderCoreDataIndexer_nextRelevantItemIdentifierAfter___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)deleteObjectWithIDFromIndex:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSObject *v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[ICFolderCoreDataIndexer folderItemIdentifiersToChildFolderItemIdentifiers](self, "folderItemIdentifiersToChildFolderItemIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          -[ICFolderCoreDataIndexer deleteObjectWithIDFromIndex:inSection:](self, "deleteObjectWithIDFromIndex:inSection:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v8);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    -[ICFolderCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__ICFolderCoreDataIndexer_deleteObjectWithIDFromIndex_inSection___block_invoke;
    block[3] = &unk_1E5C1D7C0;
    block[4] = self;
    v18 = v6;
    v19 = v8;
    dispatch_sync(v15, block);

  }
  else
  {
    v16 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[ICFolderCoreDataIndexer deleteObjectWithIDFromIndex:inSection:].cold.1((uint64_t)v6, (uint64_t)v7, v16);

  }
}

void __65__ICFolderCoreDataIndexer_deleteObjectWithIDFromIndex_inSection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "folderItemIdentifiersToParentFolderItemIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "folderItemIdentifiersToChildFolderItemIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiersToFolderItemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v7;

  objc_msgSend(v10, "removeObject:", *(_QWORD *)(a1 + 40));
  if ((objc_msgSend(*(id *)(a1 + 32), "itemIdentifiersContainCustomFolder:", v10) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "accountObjectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "folderListSectionIdentifiersToFolderItemIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 48));

}

- (void)deleteWithDecisionController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  ICFolderCoreDataIndexer *v19;
  id v20;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "sourceObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("objectID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sourceObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ic_compactMap:", &__block_literal_global_51);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__ICFolderCoreDataIndexer_deleteWithDecisionController_completion___block_invoke_2;
  v16[3] = &unk_1E5C21350;
  v17 = v9;
  v18 = v12;
  v19 = self;
  v20 = v6;
  v13 = v12;
  v14 = v9;
  v15 = v6;
  objc_msgSend(v7, "performDecisionWithCompletion:", v16);

}

ICFolderListSectionIdentifier *__67__ICFolderCoreDataIndexer_deleteWithDecisionController_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ICFolderListSectionIdentifier *v3;
  ICFolderListSectionIdentifier *v4;
  ICFolderListSectionIdentifier *v5;

  v2 = a2;
  v3 = -[ICFolderListSectionIdentifier initWithObject:]([ICFolderListSectionIdentifier alloc], "initWithObject:", v2);

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (ICFolderListSectionIdentifier *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

uint64_t __67__ICFolderCoreDataIndexer_deleteWithDecisionController_completion___block_invoke_2(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8, (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "ic_isFolderType"))
            v10 = v9 == 0;
          else
            v10 = 1;
          if (!v10)
            objc_msgSend(*(id *)(a1 + 48), "deleteObjectWithIDFromIndex:inSection:", v8, v9);

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

    result = *(_QWORD *)(a1 + 56);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  else
  {
    result = *(_QWORD *)(a1 + 56);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __127__ICFolderCoreDataIndexer_sortedFolderItemIdentifiersForItemIdentifiers_legacyManagedObjectContext_modernManagedObjectContext___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

void __62__ICFolderCoreDataIndexer_itemIdentifiersContainCustomFolder___block_invoke_3(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "legacyManagedObjectContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_existingObjectWithID:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "isCustomFolder:", v3);

}

- (void)setAccountObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_accountObjectID, a3);
}

- (void)setShouldIncludeLegacyAccounts:(BOOL)a3
{
  self->_shouldIncludeLegacyAccounts = a3;
}

- (void)setShouldIncludeTagOperator:(BOOL)a3
{
  self->_shouldIncludeTagOperator = a3;
}

- (int64_t)shouldIncludeMathNotes
{
  return self->_shouldIncludeMathNotes;
}

- (void)setShouldIncludeMathNotes:(int64_t)a3
{
  self->_shouldIncludeMathNotes = a3;
}

- (int64_t)shouldIncludeCallNotes
{
  return self->_shouldIncludeCallNotes;
}

- (void)setShouldIncludeCallNotes:(int64_t)a3
{
  self->_shouldIncludeCallNotes = a3;
}

- (BOOL)shouldIncludeDefaultFolder
{
  return self->_shouldIncludeDefaultFolder;
}

- (void)setShouldIncludeDefaultFolder:(BOOL)a3
{
  self->_shouldIncludeDefaultFolder = a3;
}

- (void)setShouldIncludeTrash:(BOOL)a3
{
  self->_shouldIncludeTrash = a3;
}

- (void)setShouldIncludeNewFolderButton:(BOOL)a3
{
  self->_shouldIncludeNewFolderButton = a3;
}

- (ICItemIdentifier)overrideContainerIdentifier
{
  return self->_overrideContainerIdentifier;
}

- (void)setOverrideContainerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_overrideContainerIdentifier, a3);
}

- (void)setLegacyFetchedResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_legacyFetchedResultsController, a3);
}

- (void)setModernFetchedResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_modernFetchedResultsController, a3);
}

- (void)setIndexAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_indexAccessQueue, a3);
}

- (NSMutableSet)smartFolderManagedObjectIDs
{
  return self->_smartFolderManagedObjectIDs;
}

- (void)setTagIndexer:(id)a3
{
  objc_storeStrong((id *)&self->_tagIndexer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagIndexer, 0);
  objc_storeStrong((id *)&self->_virtualSmartFolderIdentifiers, 0);
  objc_storeStrong((id *)&self->_smartFolderManagedObjectIDs, 0);
  objc_storeStrong((id *)&self->_modernAccountManagedObjectIDs, 0);
  objc_storeStrong((id *)&self->_legacyAccountManagedObjectIDs, 0);
  objc_storeStrong((id *)&self->_folderListSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_folderItemIdentifiersToChildFolderItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_folderItemIdentifiersToParentFolderItemIdentifier, 0);
  objc_storeStrong((id *)&self->_folderListSectionIdentifiersToFolderItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_folderListSectionIdentifiersToVirtualSmartFolderIdentifiers, 0);
  objc_storeStrong((id *)&self->_folderListSectionIdentifiersToButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->_indexAccessQueue, 0);
  objc_storeStrong((id *)&self->_modernFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_legacyFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_overrideContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_accountObjectID, 0);
  objc_storeStrong((id *)&self->_ancestorObjectID, 0);
}

- (void)deleteObjectWithIDFromIndex:(os_log_t)log inSection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_FAULT, "Invalid folder list section identifier — not deleting object from index {objectID: %@, section: %@}", (uint8_t *)&v3, 0x16u);
}

@end
