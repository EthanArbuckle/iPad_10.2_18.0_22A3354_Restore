@implementation ICFolder

+ (id)ancestorFolderPredicatesWithBlock:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[ICFolder folderDepthLimit](ICFolder, "folderDepthLimit"))
  {
    v5 = 0;
    v6 = 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      do
      {
        objc_msgSend(v7, "addObject:", CFSTR("parent"));
        --v8;
      }
      while (v8);
      objc_msgSend(v7, "componentsJoinedByString:", CFSTR("."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v3[2](v3, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

      ++v5;
      ++v6;
    }
    while (v5 < +[ICFolder folderDepthLimit](ICFolder, "folderDepthLimit"));
  }

  return v4;
}

- (unint64_t)visibleNoteContainerChildrenCount
{
  void *v2;
  unint64_t v3;

  -[ICFolder visibleNoteContainerChildrenUnsorted](self, "visibleNoteContainerChildrenUnsorted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)visibleNoteContainerChildrenUnsorted
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ICFolder children](self, "children", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "markedForDeletion") & 1) == 0
          && (objc_msgSend(v9, "isUnsupported") & 1) == 0
          && (objc_msgSend(v9, "isHiddenNoteContainer") & 1) == 0)
        {
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

+ (unint64_t)folderDepthLimit
{
  return 4;
}

- (BOOL)isSystemFolder
{
  return -[ICFolder isDefaultFolderForAccount](self, "isDefaultFolderForAccount")
      || -[ICFolder isTrashFolder](self, "isTrashFolder");
}

- (BOOL)isDefaultFolderForAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  -[ICFolder account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardFolderIdentifierWithPrefix:", CFSTR("DefaultFolder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICFolder identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = objc_msgSend(v5, "isEqualToString:", v4);
  else
    v7 = objc_msgSend(v5, "hasPrefix:", CFSTR("DefaultFolder"));
  v8 = v7;

  return v8;
}

- (BOOL)isSmartFolder
{
  return !-[ICFolder isDefaultFolderForAccount](self, "isDefaultFolderForAccount")
      && !-[ICFolder isTrashFolder](self, "isTrashFolder")
      && -[ICFolder folderType](self, "folderType") == 2;
}

- (BOOL)isTrashFolder
{
  int v3;
  void *v4;
  char v5;

  v3 = -[ICFolder folderType](self, "folderType");
  if (v3 != 1)
  {
    -[ICFolder identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("TrashFolder"));

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)awakeFromFetch
{
  _BOOL8 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICFolder;
  -[ICCloudSyncingObject awakeFromFetch](&v4, sel_awakeFromFetch);
  -[ICFolder updateSortOrder](self, "updateSortOrder");
  if (-[ICFolder folderType](self, "folderType") == 1)
    v3 = -[ICFolder visibleNotesCount](self, "visibleNotesCount") == 0;
  else
    v3 = -[ICFolder isDeprecated](self, "isDeprecated");
  -[ICFolder setIsHiddenNoteContainer:](self, "setIsHiddenNoteContainer:", v3);
}

- (BOOL)isDeprecated
{
  return -[ICFolder folderType](self, "folderType") == 3;
}

- (void)updateSortOrder
{
  uint64_t v3;

  if (-[ICFolder isDefaultFolderOrDescendantOfDefaultFolder](self, "isDefaultFolderOrDescendantOfDefaultFolder"))
  {
    v3 = 1;
  }
  else if (-[ICFolder folderType](self, "folderType") == 1)
  {
    v3 = 3;
  }
  else
  {
    v3 = 2;
  }
  -[ICFolder setSortOrder:](self, "setSortOrder:", v3);
}

- (BOOL)isDefaultFolderOrDescendantOfDefaultFolder
{
  void *v3;
  void *v4;
  char v5;

  -[ICFolder parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return -[ICFolder isDefaultFolderForAccount](self, "isDefaultFolderForAccount");
  -[ICFolder parent](self, "parent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDefaultFolderOrDescendantOfDefaultFolder");

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  ICFolder *v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  unint64_t v40;
  BOOL v41;
  void *v42;
  void *v43;
  int v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[ICFolder isDefaultFolderForAccount](self, "isDefaultFolderForAccount"))
    {
      v6 = -1;
LABEL_57:

      goto LABEL_58;
    }
    if ((objc_msgSend(v5, "isDefaultFolderForAccount") & 1) != 0)
    {
      v6 = 1;
      goto LABEL_57;
    }
    v14 = -[ICFolder sortOrder](self, "sortOrder");
    if (v14 != objc_msgSend(v5, "sortOrder"))
    {
      v25 = -[ICFolder sortOrder](self, "sortOrder");
      if (v25 > (int)objc_msgSend(v5, "sortOrder"))
        v6 = 1;
      else
        v6 = -1;
      goto LABEL_57;
    }
    -[ICFolder parent](self, "parent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 != v16)
    {
      v17 = self;
      v18 = v5;
      v19 = -[ICFolder depth](v17, "depth");
      v20 = objc_msgSend(v18, "depth");
      v21 = v20;
      v22 = v17;
      if (v19 <= v20)
      {
        v24 = v18;
        if (v20 > v19)
        {
          v24 = v18;
          do
          {
            v27 = v24;
            objc_msgSend(v24, "parent");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            --v21;
          }
          while (v21 > v19);
          v22 = v17;
        }
      }
      else
      {
        do
        {
          v23 = v22;
          objc_msgSend(v22, "parent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          --v19;
        }
        while (v19 > v21);
        v24 = v18;
      }
      objc_msgSend(v22, "parent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "parent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28 == v29)
      {
        v30 = v22;
        v31 = v24;
      }
      else
      {
        do
        {
          objc_msgSend(v22, "parent");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "parent");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "parent");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "parent");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = v31;
          v22 = v30;
        }
        while (v32 != v33);
      }
      if (objc_msgSend(v30, "isEqual:", v31))
      {
        v34 = -[ICFolder depth](v17, "depth");
        if (v34 < objc_msgSend(v18, "depth"))
          v6 = -1;
        else
          v6 = 1;
      }
      else
      {
        v6 = objc_msgSend(v30, "compare:", v31);
      }

      goto LABEL_57;
    }
    -[ICFolder parent](self, "parent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      -[ICFolder parent](self, "parent");
    else
      -[ICFolder account](self, "account");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "subFolderIdentifiersOrderedSet");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36 && objc_msgSend(v36, "count"))
    {
      -[ICFolder identifier](self, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "indexOfObject:", v37);

      objc_msgSend(v5, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v36, "indexOfObject:", v39);

      if (v38 != 0x7FFFFFFFFFFFFFFFLL && v38 == v40)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "indexOfSelf != indexOfOther || indexOfSelf == NSNotFound", "-[ICFolder compare:]", 1, 0, CFSTR("trying to compare folders that have the same ordering index"));
      if (v38 != 0x7FFFFFFFFFFFFFFFLL && v40 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v38 < v40)
          v6 = -1;
        else
          v6 = 1;
        goto LABEL_56;
      }
      if (v38 == 0x7FFFFFFFFFFFFFFFLL)
        v6 = -1;
      else
        v6 = 1;
      v41 = v40 == 0x7FFFFFFFFFFFFFFFLL || v38 == 0x7FFFFFFFFFFFFFFFLL;
      if (v38 != v40 && v41)
        goto LABEL_56;
    }
    -[ICFolder localizedTitle](self, "localizedTitle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedTitle");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v42, "localizedStandardCompare:", v43);

LABEL_56:
    goto LABEL_57;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = 1;
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138412802;
      v46 = v9;
      v47 = 2112;
      v48 = v11;
      v49 = 2112;
      v50 = v13;
      _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEFAULT, "Trying to compare an %@ with a non-%@: %@", (uint8_t *)&v45, 0x20u);

    }
    v6 = 0;
  }
LABEL_58:

  return v6;
}

- (NSString)localizedTitle
{
  uint64_t v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  if (-[ICFolder isDefaultFolderForAccount](self, "isDefaultFolderForAccount"))
  {
    +[ICFolder localizedTitleForDefaultFolder](ICFolder, "localizedTitleForDefaultFolder");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = (__CFString *)v3;
    return (NSString *)v4;
  }
  if (-[ICFolder folderType](self, "folderType") == 1)
  {
    +[ICFolder localizedTitleForTrashFolder](ICFolder, "localizedTitleForTrashFolder");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[ICFolder title](self, "title");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E76DB108;
  if (v5)
    v7 = (__CFString *)v5;
  v4 = v7;

  return (NSString *)v4;
}

+ (NSString)localizedTitleForDefaultFolder
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Notes"), CFSTR("Notes"), 0, 1);
}

- (unint64_t)countOfVisibleNotesInFolder
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[ICFolder predicateForVisibleNotesInFolder](self, "predicateForVisibleNotesInFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFolder managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[ICNote countOfNotesMatchingPredicate:context:](ICNote, "countOfNotesMatchingPredicate:context:", v3, v4);

  return v5;
}

- (id)predicateForVisibleNotesInFolder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  if (!-[ICFolder isSmartFolder](self, "isSmartFolder"))
    goto LABEL_4;
  -[ICFolder smartFolderQuery](self, "smartFolderQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote entity](ICNote, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3528];
    -[ICFolder smartFolderQuery](self, "smartFolderQuery");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v10;
    -[ICFolder account](self, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICNote predicateForNotesInAccountWithIdentifier:](ICNote, "predicateForNotesInAccountWithIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v13;
    +[ICCloudSyncingObject predicateForFetchedFromCloudObjects](ICNote, "predicateForFetchedFromCloudObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "andPredicateWithSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v17 = -[ICFolder folderType](self, "folderType");
    if (v17 == 1)
    {
      v18 = 1;
      v19 = 1;
      v20 = 1;
    }
    else
    {
      v19 = +[ICAccount hidesSystemPaperNotesInCustomFolders](ICAccount, "hidesSystemPaperNotesInCustomFolders") ^ 1;
      v18 = +[ICAccount hidesMathNotesInCustomFolders](ICAccount, "hidesMathNotesInCustomFolders") ^ 1;
      v20 = +[ICAccount hidesCallNotesInCustomFolders](ICAccount, "hidesCallNotesInCustomFolders") ^ 1;
    }
    -[ICFolder predicateForNotesInFolder](self, "predicateForNotesInFolder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICFolder managedObjectContext](self, "managedObjectContext", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICNote predicateForVisibleNotesIncludingTrash:includingSystemPaper:includingMathNotes:includingCallNotes:inContext:](ICNote, "predicateForVisibleNotesIncludingTrash:includingSystemPaper:includingMathNotes:includingCallNotes:inContext:", v17 == 1, v19, v18, v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", 1, v9);
  }

  return v16;
}

- (id)predicateForNotesInFolder
{
  return (id)objc_msgSend((id)objc_opt_class(), "predicateForNotesInFolder:", self);
}

+ (id)predicateForNotesInFolder:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("folder == %@"), a3);
}

- (BOOL)isMovable
{
  void *v3;
  ICFolder *v4;
  void *v5;
  ICFolder *v6;
  _BOOL4 v7;

  -[ICFolder account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultFolder");
  v4 = (ICFolder *)objc_claimAutoreleasedReturnValue();
  if (v4 == self)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    -[ICFolder account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trashFolder");
    v6 = (ICFolder *)objc_claimAutoreleasedReturnValue();
    if (v6 == self)
      LOBYTE(v7) = 0;
    else
      v7 = !-[ICFolder isSubfolderOfReadonlyFolder](self, "isSubfolderOfReadonlyFolder");

  }
  return v7;
}

- (BOOL)isSubfolderOfReadonlyFolder
{
  void *v3;
  BOOL v4;

  -[ICCloudSyncingObject serverShare](self, "serverShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 0;
  else
    v4 = -[ICNoteContainer isSharedReadOnly](self, "isSharedReadOnly");

  return v4;
}

+ (id)predicateForVisibleFoldersIncludingHiddenNoteContainers:(BOOL)a3 inContext:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "predicateForVisibleObjects", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("owner != self && isHiddenNoteContainer == NO"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("owner == self && SUBQUERY(owner.ownerInverse, $noteContainer, $noteContainer.markedForDeletion != YES).@count > 3"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)predicateForVisibleObjects
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___ICFolder;
  objc_msgSendSuper2(&v8, sel_predicateForVisibleObjects);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("owner.didChooseToMigrate == YES"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForVisibleFoldersInContext:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForVisibleFoldersIncludingHiddenNoteContainers:inContext:", 0, a3);
}

+ (id)predicateForDeprecatedObjects
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___ICFolder;
  objc_msgSendSuper2(&v8, sel_predicateForDeprecatedObjects);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("folderType != %d"), 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)supportsEditingNotes
{
  return -[ICFolder folderType](self, "folderType") != 1;
}

- (int64_t)visibilityTestingType
{
  return 1;
}

- (unint64_t)searchResultsSection
{
  return 4;
}

- (unint64_t)searchResultType
{
  return 4;
}

- (NSArray)authorsExcludingCurrentUser
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)searchResultCanBeDeletedFromNoteContext
{
  return 0;
}

- (BOOL)isHiddenFromIndexing
{
  return !-[ICCloudSyncingObject isVisible](self, "isVisible");
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)CFSTR("Modern");
}

- (NSString)searchIndexingIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[ICFolder objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URIRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)searchDomainIdentifier
{
  void *v2;
  void *v3;

  -[ICFolder account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CSSearchableItemAttributeSet)userActivityContentAttributeSet
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithItemContentType:", CFSTR("com.apple.notes.spotlightrecord"));
  -[ICFolder dateForLastTitleModification](self, "dateForLastTitleModification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentModificationDate:", v4);

  return (CSSearchableItemAttributeSet *)v3;
}

- (CSSearchableItemAttributeSet)searchableItemAttributeSet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICFolder userActivityContentAttributeSet](self, "userActivityContentAttributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFolder title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayName:", v4);
  objc_msgSend(v3, "setTextContent:", v4);
  objc_msgSend(v3, "setIc_searchResultType:", 4);
  objc_msgSend(v3, "ic_populateValuesForSpecializedFields");
  -[ICFolder account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isManaged"))
    v6 = &unk_1E771A588;
  else
    v6 = &unk_1E771A5A0;
  objc_msgSend(v3, "setDataOwnerType:", v6);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICFolder associateAppEntityWithSearchableItemAttributeSet:](self, "associateAppEntityWithSearchableItemAttributeSet:", v3);

  return (CSSearchableItemAttributeSet *)v3;
}

- (id)searchableTextContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFolder title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[ICFolder localizedTitle](self, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dataForTypeIdentifier:(id)a3
{
  return 0;
}

- (id)fileURLForTypeIdentifier:(id)a3
{
  return 0;
}

- (void)unmarkForDeletionIncludingParentHierarchy
{
  id v3;

  -[ICCloudSyncingObject unmarkForDeletion](self, "unmarkForDeletion");
  -[ICFolder parent](self, "parent");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unmarkForDeletionIncludingParentHierarchy");

}

- (id)recordZoneName
{
  return CFSTR("Notes");
}

- (NSString)recordType
{
  return (NSString *)CFSTR("Folder");
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[16];
  objc_super v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!a5)
  {
    v64.receiver = self;
    v64.super_class = (Class)ICFolder;
    if (!-[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:](&v64, sel_mergeCloudKitRecord_accountID_approach_mergeableFieldState_, v10, a4, 0, a6))goto LABEL_6;
    -[ICFolder unmarkForDeletionIncludingParentHierarchy](self, "unmarkForDeletionIncludingParentHierarchy");
    objc_msgSend(v10, "recordID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "recordName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICFolder setIdentifier:](self, "setIdentifier:", v15);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TitleModificationDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICFolder needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud");
    -[ICFolder title](self, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    -[ICFolder dateForLastTitleModification](self, "dateForLastTitleModification");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[ICFolder dateForLastTitleModification](self, "dateForLastTitleModification");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v16, "ic_isLaterThanDate:", v20);

    }
    else
    {
      v21 = 1;
    }

    -[ICCloudSyncingObject userSpecificServerRecord](self, "userSpecificServerRecord");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v25 = -[ICCloudSyncingObject isSharedRootObject](self, "isSharedRootObject");
    else
      v25 = 0;

    if (v18 && ((v25 | v21 ^ 1) & 1) != 0)
    {
LABEL_20:
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ImportedFromLegacy"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ImportedFromLegacy"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICFolder setImportedFromLegacy:](self, "setImportedFromLegacy:", objc_msgSend(v35, "BOOLValue"));

      }
      -[ICFolder identifier](self, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "hasPrefix:", CFSTR("TrashFolder")))
      {
        v37 = -[ICFolder folderType](self, "folderType");

        if (v37 != 1)
        {
          -[ICFolder identifier](self, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("TrashFolder"));

          if (v39)
          {
            v58 = v10;
            v40 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BD918000, v40, OS_LOG_TYPE_DEFAULT, "Downloaded the old trash folder from the cloud. Deleting it now.", buf, 2u);
            }

            v61 = 0u;
            v62 = 0u;
            v59 = 0u;
            v60 = 0u;
            -[ICFolder notes](self, "notes");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)objc_msgSend(v41, "copy");

            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
            if (v43)
            {
              v44 = v43;
              v45 = *(_QWORD *)v60;
              do
              {
                for (i = 0; i != v44; ++i)
                {
                  if (*(_QWORD *)v60 != v45)
                    objc_enumerationMutation(v42);
                  v47 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
                  objc_msgSend(v47, "account");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "trashFolder");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "setFolder:", v49);

                  objc_msgSend(MEMORY[0x1E0C99D68], "date");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "setFolderModificationDate:", v50);

                  objc_msgSend(v47, "updateChangeCountWithReason:", CFSTR("Moved to trash folder"));
                }
                v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
              }
              while (v44);
            }

            +[ICFolder deleteFolder:](ICFolder, "deleteFolder:", self);
            v22 = 0;
            v10 = v58;
LABEL_46:

            goto LABEL_7;
          }
          -[ICFolder setFolderType:](self, "setFolderType:", 1);
        }
      }
      else
      {

      }
      -[ICFolder identifier](self, "identifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "hasPrefix:", CFSTR("SystemPaper"));

      if (v52)
      {
        v53 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BD918000, v53, OS_LOG_TYPE_DEFAULT, "Downloaded the old System Paper folder from the cloud. Deleting it now.", buf, 2u);
        }

        +[ICFolder deleteFolder:](ICFolder, "deleteFolder:", self);
        v22 = 0;
      }
      else
      {
        objc_msgSend(v10, "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("MergeableData"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          -[ICFolder mergeWithMergeableData:](self, "mergeWithMergeableData:", v54);
          -[ICFolder saveMergeableDataIfNeeded](self, "saveMergeableDataIfNeeded");
        }
        objc_msgSend(v10, "encryptedValues");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("SmartFolderQueryJSONEncrypted"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v56, "ic_stringValue");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICFolder setSmartFolderQueryJSON:](self, "setSmartFolderQueryJSON:", v57);
        if (v57)
          -[ICFolder setFolderType:](self, "setFolderType:", 2);
        -[ICFolder mergeParentFromRecord:](self, "mergeParentFromRecord:", v10);

        v22 = 1;
      }
      goto LABEL_46;
    }
    -[ICFolder setDateForLastTitleModification:](self, "setDateForLastTitleModification:", v16);
    objc_msgSend(v10, "encryptedValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("TitleEncrypted"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v27, "ic_stringValue");
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Title"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
LABEL_19:
        -[ICFolder title](self, "title");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICFolder account](self, "account");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICFolder deduplicatingTitle:forFolder:ofAccount:](ICFolder, "deduplicatingTitle:forFolder:ofAccount:", v31, self, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICFolder setTitle:](self, "setTitle:", v33);

        goto LABEL_20;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Title"));
      v28 = objc_claimAutoreleasedReturnValue();
    }
    v30 = (void *)v28;
    -[ICFolder setTitle:](self, "setTitle:", v28);

    goto LABEL_19;
  }
  v11 = (void *)MEMORY[0x1E0D641A0];
  -[ICFolder className](self, "className");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ICStringFromSyncingApproach(a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICFolder(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:]", 1, 0, CFSTR("Object %@ does not support sync approach: %@"), v12, v13);

LABEL_6:
  v22 = 0;
LABEL_7:

  return v22;
}

- (void)mergeParentFromRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  BOOL v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  BOOL v29;
  void *v30;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ParentModificationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (-[ICFolder parentModificationDate](self, "parentModificationDate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    -[ICFolder parentModificationDate](self, "parentModificationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = os_log_create("com.apple.notes", "Cloud");
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12)
        -[ICFolder(CloudKit) mergeParentFromRecord:].cold.3(self);

      goto LABEL_31;
    }
    if (v12)
      -[ICFolder(CloudKit) mergeParentFromRecord:].cold.2(self);

LABEL_14:
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ParentFolder"));
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "share");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject recordID](v11, "recordID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "ic_isOwnedByCurrentUser");

    objc_msgSend(v4, "recordID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[ICUserSpecificRecordIDParser isUserSpecificRecordID:](ICUserSpecificRecordIDParser, "isUserSpecificRecordID:", v16);

    if (v11)
    {
      if (v13)
        v18 = v15;
      else
        v18 = 1;
      if (v18 != 1)
        goto LABEL_31;
      -[ICFolder account](self, "account");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = objc_claimAutoreleasedReturnValue();

      -[NSObject recordID](v11, "recordID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICFolder managedObjectContext](self, "managedObjectContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)v20;
      +[ICFolder existingCloudObjectForRecordID:accountID:context:](ICFolder, "existingCloudObjectForRecordID:accountID:context:", v21, v20, v22);
      v24 = (id)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        v30 = v23;
        -[NSObject recordID](v11, "recordID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "recordName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[ICFolder(CloudKit) mergeParentFromRecord:].cold.1(self, (uint64_t)v26, v27);

        -[ICFolder account](self, "account");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = +[ICFolder newFolderWithIdentifier:account:](ICFolder, "newFolderWithIdentifier:account:", v26, v28);

        objc_msgSend(v24, "setNeedsInitialFetchFromCloud:", 1);
        v23 = v30;
      }
      -[ICFolder setParent:](self, "setParent:", v24);

    }
    else
    {
      if (!-[ICCloudSyncingObject isOwnedByCurrentUser](self, "isOwnedByCurrentUser"))
      {
LABEL_31:

        goto LABEL_32;
      }
      -[ICFolder setParent:](self, "setParent:", 0);
    }
    if (v13)
      v29 = 0;
    else
      v29 = v17;
    if (!v29)
      -[ICFolder setParentModificationDate:](self, "setParentModificationDate:", v5);
    goto LABEL_31;
  }
  -[ICFolder parentModificationDate](self, "parentModificationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "ic_isLaterThanDate:", v7);

  v9 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ICFolder(CloudKit) mergeParentFromRecord:].cold.4(self, (uint64_t)v5, v9);

  if ((v8 & 1) != 0)
    goto LABEL_14;
LABEL_32:

}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)ICFolder;
  -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:](&v33, sel_makeCloudKitRecordForApproach_mergeableFieldState_, a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICCloudSyncingObject isOwnedByCurrentUser](self, "isOwnedByCurrentUser")
    || !-[ICCloudSyncingObject isSharedRootObject](self, "isSharedRootObject"))
  {
    -[ICFolder dateForLastTitleModification](self, "dateForLastTitleModification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ICFolder dateForLastTitleModification](self, "dateForLastTitleModification");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("TitleModificationDate"));

    }
    -[ICFolder title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[ICFolder title](self, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dataUsingEncoding:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "encryptedValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("TitleEncrypted"));

    }
    -[ICFolder parent](self, "parent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "zoneID");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_25;
    v16 = (void *)v15;
    objc_msgSend(v14, "zoneID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "zoneID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqual:", v19);

    if (v20)
    {
      v21 = objc_alloc(MEMORY[0x1E0C950C0]);
      v22 = (void *)objc_msgSend(v21, "initWithRecordID:action:", v14, *MEMORY[0x1E0C94A40]);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("ParentFolder"));

    }
    else
    {
LABEL_25:
      if (-[ICCloudSyncingObject isOwnedByCurrentUser](self, "isOwnedByCurrentUser"))
        objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("ParentFolder"));
    }
    -[ICFolder parentModificationDate](self, "parentModificationDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[ICFolder parentModificationDate](self, "parentModificationDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("ParentModificationDate"));

    }
    -[ICFolder mergeableData](self, "mergeableData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[ICFolder mergeableData](self, "mergeableData");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v26, CFSTR("MergeableData"), a3);

    }
  }
  if (!a3)
  {
    objc_msgSend(v6, "setWantsChainPCS:", 1);
    if (-[ICFolder importedFromLegacy](self, "importedFromLegacy"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICFolder importedFromLegacy](self, "importedFromLegacy"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("ImportedFromLegacy"));

    }
    -[ICFolder smartFolderQueryJSON](self, "smartFolderQueryJSON");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[ICFolder smartFolderQueryJSON](self, "smartFolderQueryJSON");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "dataUsingEncoding:", 4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "encryptedValues");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, CFSTR("SmartFolderQueryJSONEncrypted"));

    }
  }
  return v6;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a3;
  +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "folderWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a4;
  v8 = a3;
  +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[ICFolder newFolderWithIdentifier:account:](ICFolder, "newFolderWithIdentifier:account:", v11, v9);

  objc_msgSend(v12, "mergeCloudKitRecord:accountID:approach:", v8, v7, 0);
  objc_msgSend(v12, "setServerRecord:", v8);

  objc_msgSend(v12, "setInCloud:", 1);
  objc_msgSend(v12, "clearChangeCountWithReason:", CFSTR("Created folder"));
  objc_msgSend(v12, "updateParentReferenceIfNecessary");

  return v12;
}

+ (id)newPlaceholderObjectForRecordName:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___ICFolder;
  v7 = a5;
  v8 = a4;
  v9 = objc_msgSendSuper2(&v12, sel_newPlaceholderObjectForRecordName_accountID_context_, a3, v8, v7);
  +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v8, v7, v12.receiver, v12.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAccount:", v10);
  return v9;
}

- (BOOL)isInICloudAccount
{
  ICFolder *v2;
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
  -[ICFolder managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__ICFolder_CloudKit__isInICloudAccount__block_invoke;
  v5[3] = &unk_1E76C7730;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __39__ICFolder_CloudKit__isInICloudAccount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "account");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "accountType") == 1;

}

- (void)fixBrokenReferences
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  ICFolder *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  _BYTE v54[18];
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ICCloudSyncingObject loggingDescription](self, "loggingDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICFolder parent](self, "parent");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "loggingDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICFolder notes](self, "notes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:", CFSTR("loggingDescription"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICFolder children](self, "children");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKey:", CFSTR("loggingDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v54 = v4;
    *(_WORD *)&v54[8] = 2112;
    *(_QWORD *)&v54[10] = v5;
    v55 = 2112;
    v56 = v8;
    v57 = 2112;
    v58 = v11;
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_DEFAULT, "Fixing broken references for folder: %@\n\tParent: %@\n\tNotes: %@\n\tChildren: %@", buf, 0x2Au);

  }
  if (!-[ICFolder markedForDeletion](self, "markedForDeletion"))
  {
    -[ICCloudSyncingObject serverShare](self, "serverShare");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

    }
    else
    {
      -[ICCloudSyncingObject serverRecord](self, "serverRecord");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "share");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v38)
        return;
    }
    -[ICCloudSyncingObject setServerShare:](self, "setServerShare:", 0);
    -[ICCloudSyncingObject setNeedsToBeFetchedFromCloud:](self, "setNeedsToBeFetchedFromCloud:", 1);
    return;
  }
  if (-[ICFolder visibleNotesCount](self, "visibleNotesCount"))
  {
    v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[ICFolder visibleNotesCount](self, "visibleNotesCount");
      -[ICFolder identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v54 = v13;
      *(_WORD *)&v54[4] = 2112;
      *(_QWORD *)&v54[6] = v14;
      _os_log_impl(&dword_1BD918000, v12, OS_LOG_TYPE_DEFAULT, "Found a deleted folder with %d undeleted notes: %@", buf, 0x12u);

    }
    v15 = v12;
LABEL_36:

    -[ICCloudSyncingObject unmarkForDeletion](self, "unmarkForDeletion");
    if (-[ICFolder importedFromLegacy](self, "importedFromLegacy"))
      +[ICLegacyTombstone removeLegacyTombstoneForFolder:](ICLegacyTombstone, "removeLegacyTombstoneForFolder:", self);
  }
  else
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v42 = self;
    -[ICFolder children](self, "children");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v48 != v19)
            objc_enumerationMutation(v15);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "markedForDeletion") & 1) == 0)
          {
            v12 = os_log_create("com.apple.notes", "Cloud");
            self = v42;
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              -[ICFolder identifier](v42, "identifier");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v54 = v39;
              _os_log_impl(&dword_1BD918000, v12, OS_LOG_TYPE_DEFAULT, "Found a deleted folder with at least one undeleted child folder: %@", buf, 0xCu);

            }
            goto LABEL_36;
          }
        }
        v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        if (v18)
          continue;
        break;
      }
    }

    -[ICFolder notes](v42, "notes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    v23 = os_log_create("com.apple.notes", "Cloud");
    v24 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[ICFolder identifier](v42, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v54 = v25;
        _os_log_impl(&dword_1BD918000, v24, OS_LOG_TYPE_DEFAULT, "Broken references because we still have notes in folder (%@)", buf, 0xCu);

      }
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      -[ICFolder notes](v42, "notes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "copy");

      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v44;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v44 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v31);
            v33 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              -[ICFolder(CloudKit) fixBrokenReferences].cold.1(buf, v32, v54, v33);

            -[ICFolder account](v42, "account");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "trashFolder");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setFolder:", v35);

            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setFolderModificationDate:", v36);

            objc_msgSend(v32, "updateChangeCountWithReason:", CFSTR("Moved to trash folder"));
            ++v31;
          }
          while (v29 != v31);
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        }
        while (v29);
      }

    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        -[ICCloudSyncingObject shortLoggingDescription](v42, "shortLoggingDescription");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v54 = v40;
        _os_log_impl(&dword_1BD918000, v24, OS_LOG_TYPE_INFO, "Broken reference for %@, but not un-deleting or moving any notes", buf, 0xCu);

      }
    }
  }
}

- (BOOL)hasAllMandatoryFields
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICFolder;
  if (!-[ICCloudSyncingObject hasAllMandatoryFields](&v6, sel_hasAllMandatoryFields))
    return 0;
  -[ICFolder title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (void)deleteFromLocalDatabase
{
  +[ICFolder purgeFolder:](ICFolder, "purgeFolder:", self);
}

- (id)objectsToBeDeletedBeforeThisObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICFolder;
  -[ICCloudSyncingObject objectsToBeDeletedBeforeThisObject](&v11, sel_objectsToBeDeletedBeforeThisObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ICFolder notes](self, "notes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  -[ICFolder children](self, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  v9 = (void *)objc_msgSend(v4, "copy");
  return v9;
}

- (void)objectWasDeletedFromCloudByAnotherDevice
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)ICFolder;
  -[ICCloudSyncingObject objectWasDeletedFromCloudByAnotherDevice](&v21, sel_objectWasDeletedFromCloudByAnotherDevice);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ICFolder children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
      if ((objc_msgSend(v8, "hasSuccessfullyPushedLatestVersionToCloud") & 1) == 0
        && (objc_msgSend(v8, "isInCloud") & 1) != 0)
      {
        break;
      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[ICFolder notes](self, "notes", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v22, 16);
    if (!v9)
    {
LABEL_18:

      return;
    }
    v10 = v9;
    v11 = *(_QWORD *)v14;
LABEL_12:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v11)
        objc_enumerationMutation(v3);
      if (!objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12), "hasSuccessfullyPushedLatestVersionToCloud"))break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v22, 16);
        if (v10)
          goto LABEL_12;
        goto LABEL_18;
      }
    }
  }

  -[ICFolder unmarkForDeletionIncludingParentHierarchy](self, "unmarkForDeletionIncludingParentHierarchy");
}

+ (BOOL)supportsUserSpecificRecords
{
  return 1;
}

- (BOOL)wantsUserSpecificRecord
{
  _BOOL4 v3;

  v3 = -[ICNoteContainer isSharedViaICloud](self, "isSharedViaICloud");
  if (v3)
    LOBYTE(v3) = !-[ICCloudSyncingObject isOwnedByCurrentUser](self, "isOwnedByCurrentUser");
  return v3;
}

- (id)makeUserSpecificCloudKitRecordForApproach:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ICFolder;
  -[ICCloudSyncingObject makeUserSpecificCloudKitRecordForApproach:](&v15, sel_makeUserSpecificCloudKitRecordForApproach_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFolder title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICFolder title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encryptedValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("TitleEncrypted"));

  }
  -[ICFolder parent](self, "parent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v10, "ic_isOwnedByCurrentUser"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v10, 1);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("ParentFolder"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("ParentFolder"));
  }
  -[ICFolder parentModificationDate](self, "parentModificationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ICFolder parentModificationDate](self, "parentModificationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("ParentModificationDate"));

  }
  return v4;
}

- (BOOL)mergeDataFromUserSpecificRecord:(id)a3 accountID:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICFolder;
  v7 = -[ICCloudSyncingObject mergeDataFromUserSpecificRecord:accountID:](&v12, sel_mergeDataFromUserSpecificRecord_accountID_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "encryptedValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TitleEncrypted"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "ic_stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICFolder setTitle:](self, "setTitle:", v10);

    }
    -[ICFolder mergeParentFromRecord:](self, "mergeParentFromRecord:", v6);

  }
  return v7;
}

+ (id)reservedFolderTitles
{
  if (reservedFolderTitles_onceToken != -1)
    dispatch_once(&reservedFolderTitles_onceToken, &__block_literal_global_44);
  return (id)reservedFolderTitles_reservedFolderTitles;
}

void __32__ICFolder_reservedFolderTitles__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id obj;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CB34D0];
  ICSharedFrameworkBundleIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = v3;
  objc_msgSend(v3, "localizations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(v19, "URLForResource:withExtension:subdirectory:localization:", CFSTR("Localizable"), CFSTR("strings"), 0, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICFolder englishTitleForDefaultFolder](ICFolder, "englishTitleForDefaultFolder");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v0, "addObject:", v11);
        +[ICFolder englishTitleForTrashFolder](ICFolder, "englishTitleForTrashFolder");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v0, "addObject:", v13);
        +[ICFolder englishTitleForSystemPaperFolder](ICFolder, "englishTitleForSystemPaperFolder");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v0, "addObject:", v15);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

  v16 = objc_msgSend(v0, "copy");
  v17 = (void *)reservedFolderTitles_reservedFolderTitles;
  reservedFolderTitles_reservedFolderTitles = v16;

}

+ (id)deduplicatingTitle:(id)a3 account:(id)a4
{
  return (id)objc_msgSend(a1, "deduplicatingTitle:forFolder:ofAccount:", a3, 0, a4);
}

+ (id)deduplicatingTitle:(id)a3 forFolder:(id)a4 ofAccount:(id)a5
{
  return (id)objc_msgSend(a1, "deduplicatingTitle:forFolder:forNewFolderParent:ofAccount:", a3, a4, 0, a5);
}

+ (id)deduplicatingTitle:(id)a3 forFolder:(id)a4 forNewFolderParent:(id)a5 ofAccount:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (!v10 && !v11 && !v12)
  {
    v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[ICFolder deduplicatingTitle:forFolder:forNewFolderParent:ofAccount:].cold.2(v13);
    v14 = 0;
    goto LABEL_30;
  }
  if (v12)
  {
    if (!v11)
      goto LABEL_18;
LABEL_12:
    if (v13)
    {
      objc_msgSend(v11, "account");
      v15 = objc_claimAutoreleasedReturnValue();

      if (v15 != v13)
      {
        v16 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          +[ICFolder deduplicatingTitle:forFolder:forNewFolderParent:ofAccount:].cold.1((uint64_t)v13, v11);

      }
    }
    goto LABEL_18;
  }
  if (v11)
  {
    objc_msgSend(v11, "account");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v10, "account");
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_18:
  -[NSObject visibleFoldersWithParent:](v13, "visibleFoldersWithParent:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if (v10)
    objc_msgSend(v18, "removeObject:", v10);
  v28 = v18;
  objc_msgSend(v18, "valueForKey:", CFSTR("title"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject reservedAccountFolderTitles](v13, "reservedAccountFolderTitles");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setByAddingObjectsFromSet:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v9;
  if (objc_msgSend(v21, "containsObject:", v22))
  {
    v23 = 1;
    v24 = v22;
    do
    {
      v25 = v24;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%@ %lu"), v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_msgSend(v21, "containsObject:", v24);
      if (v23 == -1)
        break;
      ++v23;
    }
    while ((v26 & 1) != 0);
  }
  else
  {
    v24 = v22;
  }
  if ((objc_msgSend(v21, "containsObject:", v24) & 1) != 0)
    v14 = 0;
  else
    v14 = v24;

LABEL_30:
  return v14;
}

+ (id)localizedNewFolderName
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("New Folder"), CFSTR("New Folder"), 0, 1);
}

+ (id)stringByScrubbingStringForFolderName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v4);

  v6 = v3;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((unint64_t)objc_msgSend(v6, "length") >= 0x81)
  {
    objc_msgSend(v6, "ic_substringToIndex:", 128);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }

  return v6;
}

+ (id)keyPathsForValuesAffectingCustomNoteSortType
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("customNoteSortTypeValue"));
}

- (id)cacheKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICFolder account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFolder identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setCustomNoteSortType:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "valueRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFolder setCustomNoteSortTypeValue:](self, "setCustomNoteSortTypeValue:", v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICFolder setCustomNoteSortTypeModificationDate:](self, "setCustomNoteSortTypeModificationDate:", v5);

}

- (id)customNoteSortType
{
  void *v3;
  void *v4;
  void *v5;

  if (-[ICFolder supportsCustomNoteSortType](self, "supportsCustomNoteSortType"))
  {
    v3 = (void *)MEMORY[0x1E0D64200];
    -[ICFolder customNoteSortTypeValue](self, "customNoteSortTypeValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "folderNoteSortTypeFromValue:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)keyPathsForValuesAffectingSupportsCustomNoteSortType
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("isTrashFolder"), 0);
}

- (BOOL)supportsCustomNoteSortType
{
  return !-[ICFolder isTrashFolder](self, "isTrashFolder");
}

- (BOOL)isRenamable
{
  if (-[ICFolder isSystemFolder](self, "isSystemFolder"))
    return 0;
  else
    return !-[ICNoteContainer isSharedReadOnly](self, "isSharedReadOnly");
}

- (BOOL)isDeletable
{
  if (-[ICFolder isSystemFolder](self, "isSystemFolder"))
    return 0;
  else
    return !-[ICFolder isSubfolderOfReadonlyFolder](self, "isSubfolderOfReadonlyFolder");
}

+ (id)keyPathsForValuesAffectingIsLeaf
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("visibleNoteContainerChildren"));
}

- (BOOL)isLeaf
{
  void *v2;
  BOOL v3;

  -[ICFolder visibleNoteContainerChildren](self, "visibleNoteContainerChildren");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingDepth
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("parent"));
}

- (unint64_t)depth
{
  void *v2;
  unint64_t v3;
  void *v4;

  -[ICFolder parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v2;
    do
    {
      ++v3;
      objc_msgSend(v4, "parent");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v4 = v2;
    }
    while ((objc_opt_isKindOfClass() & 1) != 0);
  }

  return v3;
}

+ (unint64_t)maximumDepthOfFolders:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  unint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "maximumDepthIncludingChildFolders");
        if (v6 <= v9)
          v6 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)maximumDepthIncludingChildFolders
{
  void *v4;
  unint64_t v5;

  if (-[ICFolder isLeaf](self, "isLeaf"))
    return -[ICFolder depth](self, "depth");
  -[ICFolder visibleSubFolders](self, "visibleSubFolders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[ICFolder maximumDepthOfFolders:](ICFolder, "maximumDepthOfFolders:", v4);

  return v5;
}

- (unint64_t)maximumDistanceToLeafFolder
{
  unint64_t v4;

  if (-[ICFolder isLeaf](self, "isLeaf"))
    return 0;
  v4 = -[ICFolder maximumDepthIncludingChildFolders](self, "maximumDepthIncludingChildFolders");
  return v4 - -[ICFolder depth](self, "depth");
}

+ (unint64_t)maximumDistanceToLeafFolderOfFolders:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  unint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "maximumDistanceToLeafFolder");
        if (v6 <= v9)
          v6 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isDescendantOfFolder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;

  v4 = a3;
  if (v4 && (-[ICFolder parent](self, "parent"), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    do
    {
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

      if ((v9 & 1) != 0)
        break;
      objc_msgSend(v6, "parent");
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }
    while (v10);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)associatedNoteParticipants
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICFolder notes](self, "notes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "participants");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "allObjects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)canMoveAddOrDeleteContents
{
  if (-[ICNoteContainer isSharedReadOnly](self, "isSharedReadOnly"))
    return 0;
  else
    return !-[ICFolder isSmartFolder](self, "isSmartFolder");
}

- (BOOL)canAddSubfolder
{
  _BOOL4 v3;

  v3 = -[ICFolder canMoveAddOrDeleteContents](self, "canMoveAddOrDeleteContents");
  if (v3)
  {
    if (-[ICFolder isDefaultFolderForAccount](self, "isDefaultFolderForAccount")
      || -[ICFolder isTrashFolder](self, "isTrashFolder"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = !-[ICFolder isSmartFolder](self, "isSmartFolder");
    }
  }
  return v3;
}

+ (id)keyPathsForValuesAffectingIsTrashFolder
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("folderType"), CFSTR("identifier"), 0);
}

+ (id)keyPathsForValuesAffectingVisibleNoteContainerChildren
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("children"));
}

- (id)visibleNoteContainerChildren
{
  void *v2;
  void *v3;

  -[ICFolder visibleNoteContainerChildrenUnsorted](self, "visibleNoteContainerChildrenUnsorted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)indexOfVisibleChild:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v4 = a3;
  -[ICNoteContainer subFolderIdentifiersOrderedSet](self, "subFolderIdentifiersOrderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexOfObject:", v6);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ICFolder visibleSubFolders](self, "visibleSubFolders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "indexOfObject:", v4);

  }
  return v7;
}

- (void)setNeedsInitialFetchFromCloud:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  if (-[ICFolder needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") != a3)
  {
    -[ICFolder account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willChangeValueForKey:", CFSTR("visibleFolders"));

    -[ICFolder account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "willChangeValueForKey:", CFSTR("visibleNoteContainers"));

    v9.receiver = self;
    v9.super_class = (Class)ICFolder;
    -[ICCloudSyncingObject setNeedsInitialFetchFromCloud:](&v9, sel_setNeedsInitialFetchFromCloud_, v3);
    -[ICFolder account](self, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didChangeValueForKey:", CFSTR("visibleFolders"));

    -[ICFolder account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didChangeValueForKey:", CFSTR("visibleNoteContainers"));

  }
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[ICFolder title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    -[ICFolder willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("title"));
    -[ICFolder setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("title"));
    -[ICFolder didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("title"));
  }

}

- (void)setParent:(id)a3
{
  ICFolder *v4;
  ICFolder *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICFolder *v13;

  v13 = (ICFolder *)a3;
  -[ICFolder parent](self, "parent");
  v4 = (ICFolder *)objc_claimAutoreleasedReturnValue();

  v5 = v13;
  if (v4 != v13)
  {
    if (v13 == self)
    {
      v6 = (void *)MEMORY[0x1E0D641A0];
      v7 = CFSTR("Cannot set a folder's parent to be itself");
    }
    else
    {
      if (!-[ICFolder isDescendantOfFolder:](v13, "isDescendantOfFolder:", self))
      {
        -[ICFolder parent](self, "parent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICFolder account](self, "account");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "willChangeValueForKey:", CFSTR("visibleNoteContainerChildren"));

        -[ICFolder willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("parent"));
        -[ICFolder willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("parentCloudObject"));
        objc_msgSend(v8, "willChangeValueForKey:", CFSTR("children"));
        -[ICFolder willChangeValueForKey:](v13, "willChangeValueForKey:", CFSTR("children"));
        -[ICFolder setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v13, CFSTR("parent"));
        objc_msgSend(v8, "mutableSetValueForKey:", CFSTR("children"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObject:", self);

        -[ICFolder mutableSetValueForKey:](v13, "mutableSetValueForKey:", CFSTR("children"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", self);

        objc_msgSend(v8, "didChangeValueForKey:", CFSTR("children"));
        -[ICFolder didChangeValueForKey:](v13, "didChangeValueForKey:", CFSTR("children"));
        -[ICFolder didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("parent"));
        -[ICFolder didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("parentCloudObject"));
        -[ICFolder account](self, "account");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "didChangeValueForKey:", CFSTR("visibleNoteContainerChildren"));

        -[ICFolder updateSortOrder](self, "updateSortOrder");
        -[ICCloudSyncingObject resetToIntrinsicNotesVersionAndPropagateToChildObjects](self, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
        objc_msgSend(v8, "markShareDirtyIfNeededWithReason:", CFSTR("Reparented folder"));
        -[ICCloudSyncingObject markShareDirtyIfNeededWithReason:](v13, "markShareDirtyIfNeededWithReason:", CFSTR("Reparented folder"));

        goto LABEL_8;
      }
      v6 = (void *)MEMORY[0x1E0D641A0];
      v7 = CFSTR("Cannot set a folder's parent to be its descendant");
    }
    objc_msgSend(v6, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:", "NO", "-[ICFolder setParent:]", 1, 1, CFSTR("An issue occured when moving a folder. Do you want to file a radar?"), v7);
LABEL_8:
    v5 = v13;
  }

}

+ (id)keyPathsForValuesAffectingIsDefaultFolderForAccount
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("identifier"));
}

- (BOOL)isAncestorOfFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  ICFolder *v8;
  ICFolder *v9;

  v4 = a3;
  -[ICFolder account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    objc_msgSend(v4, "parent");
    v8 = (ICFolder *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v7 = v8 == self || -[ICFolder isAncestorOfFolder:](self, "isAncestorOfFolder:", v8);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)ancestorFolderObjectIDs
{
  void *v2;
  void *v3;

  -[ICCloudSyncingObject ancestorCloudObjects](self, "ancestorCloudObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_compactMap:", &__block_literal_global_76_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __35__ICFolder_ancestorFolderObjectIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
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
  -[ICFolder account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
  {
    -[ICFolder willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("account"));
    -[ICFolder setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("account"));
    objc_msgSend(v5, "mutableSetValueForKey:", CFSTR("folders"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", self);

    objc_msgSend(v4, "mutableSetValueForKey:", CFSTR("folders"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", self);

    -[ICFolder didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("account"));
    -[ICFolder setOwner:](self, "setOwner:", v4);
    objc_msgSend(v4, "accountNameForAccountListSorting");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICFolder setAccountNameForAccountListSorting:](self, "setAccountNameForAccountListSorting:", v8);

    -[ICFolder updateSortOrder](self, "updateSortOrder");
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[ICFolder children](self, "children");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v14++), "setAccount:", v4);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v12);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[ICFolder notes](self, "notes", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20++), "setAccount:", v4);
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v18);
    }

    v21 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[ICFolder setAccount:].cold.1(v4, self, v21);

  }
}

- (int64_t)intrinsicNotesVersionForScenario:(unint64_t)a3
{
  int64_t result;
  void *v6;
  uint64_t v7;
  objc_super v8;

  if (-[ICCloudSyncingObject isUnsupported](self, "isUnsupported")
    || -[ICCloudSyncingObject needsInitialFetchFromCloudCheckingParent](self, "needsInitialFetchFromCloudCheckingParent"))
  {
    return -[ICFolder minimumSupportedNotesVersion](self, "minimumSupportedNotesVersion");
  }
  if (-[ICFolder isSmartFolder](self, "isSmartFolder"))
  {
    -[ICFolder smartFolderQuery](self, "smartFolderQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "minimumSupportedVersion");

  }
  else if (-[ICCloudSyncingObject isSharedRootObject](self, "isSharedRootObject"))
  {
    v7 = 4;
  }
  else
  {
    v7 = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)ICFolder;
  result = -[ICCloudSyncingObject intrinsicNotesVersionForScenario:](&v8, sel_intrinsicNotesVersionForScenario_, a3);
  if (v7 > result)
    return v7;
  return result;
}

- (BOOL)shouldSyncMinimumSupportedNotesVersion
{
  return 1;
}

+ (id)contentInfoTextWithNoteCount:(int64_t)a3 subfolderCount:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%lu Folders"), CFSTR("%lu Folders"), 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v9);
  }
  if (a3)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%lu Notes"), CFSTR("%lu Notes"), 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v12);
  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" · "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)markForDeletion
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "serverShare");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "A shared folder is deleted but may have not been unshared yet: %@, share: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)setMarkedForDeletion:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  id v7;

  v3 = a3;
  if (a3 && !-[ICFolder isDeletable](self, "isDeletable"))
  {
    v6 = os_log_create("com.apple.notes", "Delete");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICFolder setMarkedForDeletion:].cold.1(self);

  }
  else
  {
    -[ICFolder willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("markedForDeletion"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICFolder setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("markedForDeletion"));

    -[ICFolder didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("markedForDeletion"));
    -[ICFolder account](self, "account");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMarkedForDeletion:", 0);

  }
}

- (void)updateChangeCountWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICFolder;
  -[ICCloudSyncingObject updateChangeCountWithReason:](&v11, sel_updateChangeCountWithReason_, v4);
  -[ICFolder changedValues](self, "changedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_title);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

LABEL_4:
    -[ICCloudSyncingObject updateUserSpecificChangeCountWithReason:](self, "updateUserSpecificChangeCountWithReason:", v4);
    goto LABEL_5;
  }
  -[ICFolder changedValues](self, "changedValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_parent);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_4;
LABEL_5:

}

- (BOOL)supportsDateHeaders
{
  BOOL v3;
  void *v4;

  if (-[ICFolder isTrashFolder](self, "isTrashFolder"))
    return 0;
  -[ICFolder customNoteSortType](self, "customNoteSortType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "resolvedCustomSortTypeOrder") != 3;

  return v3;
}

- (BOOL)isShowingDateHeaders
{
  int v3;

  v3 = -[ICFolder supportsDateHeaders](self, "supportsDateHeaders");
  if (v3)
  {
    v3 = -[ICFolder dateHeadersType](self, "dateHeadersType");
    if (v3)
      LOBYTE(v3) = v3 == 2;
    else
      LOBYTE(v3) = objc_msgSend(MEMORY[0x1E0D641D8], "defaultDateHeadersType") == 2;
  }
  return v3;
}

- (BOOL)validateForInsert:(id *)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICFolder;
  v4 = -[ICFolder validateForInsert:](&v6, sel_validateForInsert_, a3);
  if (v4)
    LOBYTE(v4) = -[ICFolder validate](self, "validate");
  return v4;
}

- (BOOL)validateForUpdate:(id *)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICFolder;
  v4 = -[ICFolder validateForUpdate:](&v6, sel_validateForUpdate_, a3);
  if (v4)
    LOBYTE(v4) = -[ICFolder validate](self, "validate");
  return v4;
}

- (BOOL)validate
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
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

  v3 = -[ICFolder depth](self, "depth");
  if (v3 > +[ICFolder folderDepthLimit](ICFolder, "folderDepthLimit"))
  {
    -[ICFolder parent](self, "parent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICFolder setParent:](self, "setParent:", v5);

  }
  -[ICFolder title](self, "title");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
  v7 = (void *)v6;
  -[ICFolder title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (!v11)
  {
LABEL_5:
    v12 = (void *)objc_opt_class();
    objc_msgSend((id)objc_opt_class(), "localizedNewFolderName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICFolder parent](self, "parent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICFolder account](self, "account");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deduplicatingTitle:forFolder:forNewFolderParent:ofAccount:", v13, self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICFolder setTitle:](self, "setTitle:", v16);

  }
  return 1;
}

- (BOOL)isTitleValid:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[ICFolder account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFolder parent](self, "parent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[ICFolder isTitleValid:account:folder:parentFolder:error:](ICFolder, "isTitleValid:account:folder:parentFolder:error:", v6, v7, self, v8, a4);

  return (char)a4;
}

+ (BOOL)isTitleValid:(id)a3 account:(id)a4 parentFolder:(id)a5 error:(id *)a6
{
  return objc_msgSend(a1, "isTitleValid:account:folder:parentFolder:error:", a3, a4, 0, a5, a6);
}

+ (BOOL)isTitleValid:(id)a3 account:(id)a4 folder:(id)a5 parentFolder:(id)a6 error:(id *)a7
{
  __CFString *v11;
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v11 = (__CFString *)a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
    v15 = v11;
  else
    v15 = &stru_1E76DB108;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByTrimmingCharactersInSet:](v15, "stringByTrimmingCharactersInSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v17, "length"))
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Please choose a different name."), CFSTR("Please choose a different name."), 0, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Folder names can’t be blank."), CFSTR("Folder names can’t be blank."), 0, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_19:
    v22 = 0;
    v18 = 0;
    v21 = 0;
    goto LABEL_20;
  }
  if ((unint64_t)objc_msgSend(v17, "length") >= 0x81)
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Please choose a different name."), CFSTR("Please choose a different name."), 0, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Folder names can’t be longer than %d characters."), CFSTR("Folder names can’t be longer than %d characters."), 0, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithFormat:", v20, 128);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
      v22 = 0;
LABEL_17:
      if ((v22 & 1) == 0)
      {
        v30 = *MEMORY[0x1E0CB2D80];
        v33[0] = *MEMORY[0x1E0CB2D50];
        v33[1] = v30;
        v34[0] = v18;
        v34[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 1024, v31);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

        v22 = 0;
      }
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  objc_msgSend(v12, "visibleFoldersWithParent:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");

  if (v13)
    objc_msgSend(v24, "removeObject:", v13);
  objc_msgSend(v24, "valueForKey:", CFSTR("title"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  +[ICFolder reservedFolderTitles](ICFolder, "reservedFolderTitles");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "unionSet:", v27);

  objc_msgSend(v12, "reservedAccountFolderTitles");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "unionSet:", v28);

  v29 = objc_msgSend(v26, "containsObject:", v17);
  v21 = 0;
  v22 = v29 ^ 1;
  v18 = 0;
  if (a7 && v29)
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Name Taken"), CFSTR("Name Taken"), 0, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Please choose a different name."), CFSTR("Please choose a different name."), 0, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a7)
    goto LABEL_17;
LABEL_20:

  return v22;
}

- (BOOL)visibleChildFoldersContainsFolderWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[ICFolder account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleFoldersWithParent:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForKey:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v4);

  return v8;
}

- (id)accountName
{
  void *v2;
  void *v3;

  -[ICFolder account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)visibleNotesIncludingChildFolders
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[ICFolder visibleNotes](self, "visibleNotes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICFolder children](self, "children", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "visibleNotesIncludingChildFolders");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)recursiveVisibleSubfolders
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  -[ICFolder visibleNoteContainerChildrenUnsorted](self, "visibleNoteContainerChildrenUnsorted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[ICFolder recursivelyAddSubfoldersToArray:](self, "recursivelyAddSubfoldersToArray:", v5);
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v6;
}

- (void)recursivelyAddSubfoldersToArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[ICFolder visibleNoteContainerChildrenUnsorted](self, "visibleNoteContainerChildrenUnsorted");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ICFolder_recursivelyAddSubfoldersToArray___block_invoke;
  v7[3] = &unk_1E76CCE60;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __44__ICFolder_recursivelyAddSubfoldersToArray___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(v4, "recursivelyAddSubfoldersToArray:", *(_QWORD *)(a1 + 32));

}

+ (id)keyPathsForValuesAffectingVisibleNotesCount
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("notes"), 0);
}

+ (id)keyPathsForValuesAffectingTitleForTableViewCell
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), CFSTR("parent"), 0);
}

+ (id)keyPathsForValuesAffectingSupportsEditingNotes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("folderType"));
}

+ (NSString)englishTitleForDefaultFolder
{
  return (NSString *)CFSTR("Notes");
}

+ (NSString)localizedTitleForTrashFolder
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Recently Deleted"), CFSTR("Recently Deleted"), 0, 1);
}

+ (NSString)englishTitleForTrashFolder
{
  return (NSString *)CFSTR("Recently Deleted");
}

+ (NSString)localizedTitleForSystemPaperFolder
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Quick Notes"), CFSTR("Quick Notes"), 0, 1);
}

+ (NSString)englishTitleForSystemPaperFolder
{
  return (NSString *)CFSTR("Quick Notes");
}

- (id)ic_loggingValues
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  ICFolder *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICFolder;
  -[ICCloudSyncingObject ic_loggingValues](&v12, sel_ic_loggingValues);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ICFolder managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__ICFolder_ic_loggingValues__block_invoke;
  v9[3] = &unk_1E76C73B0;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = v6;
  return v7;
}

void __28__ICFolder_ic_loggingValues__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  objc_msgSend(*(id *)(a1 + 40), "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = &stru_1E76DB108;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("account"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(*(id *)(a1 + 40), "folderType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("folderType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSmartFolder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, CFSTR("isSmartFolder"));

  objc_msgSend(*(id *)(a1 + 40), "smartFolderQueryJSON");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "smartFolderQueryJSON");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, CFSTR("smartFolderQueryJSON"));

  }
  objc_msgSend(*(id *)(a1 + 40), "parent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "parent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, CFSTR("parent"));

  }
  objc_msgSend(*(id *)(a1 + 40), "children");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 40), "children");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForKey:", CFSTR("recordName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v18, CFSTR("children"));

  }
  objc_msgSend(*(id *)(a1 + 40), "notes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 40), "notes");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "valueForKey:", CFSTR("recordName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v22, CFSTR("notes"));

  }
}

- (BOOL)containsSharedDescendantFolders:(BOOL *)a3
{
  void *v4;
  char v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[ICFolder recursiveVisibleSubfolders](self, "recursiveVisibleSubfolders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ICFolder_containsSharedDescendantFolders___block_invoke;
  v7[3] = &unk_1E76CCE88;
  v7[4] = &v8;
  v7[5] = &v12;
  v7[6] = a3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  if (a3)
    *a3 = *((_BYTE *)v13 + 24);
  v5 = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

void __44__ICFolder_containsSharedDescendantFolders___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v6 = objc_msgSend(v8, "isSharedViaICloud");
  v7 = *(_QWORD *)(a1[4] + 8);
  if (*(_BYTE *)(v7 + 24))
  {
    if (!v6)
      goto LABEL_7;
  }
  else
  {
    *(_BYTE *)(v7 + 24) = v6;
    if (!v6)
      goto LABEL_7;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v8, "isOwnedByCurrentUser");
LABEL_7:
  if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) && (!a1[6] || !*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24)))
    *a4 = 1;

}

- (BOOL)containsSharedDescendantFolders
{
  return -[ICFolder containsSharedDescendantFolders:](self, "containsSharedDescendantFolders:", 0);
}

- (BOOL)containsSharedNotesOrSharedDescendantFolders:(BOOL *)a3
{
  _BOOL4 v5;
  void *v6;
  char v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13[0] = 1;
  v5 = -[ICFolder containsSharedDescendantFolders:](self, "containsSharedDescendantFolders:", v13);
  *((_BYTE *)v15 + 24) = v5;
  if (v5)
  {
    if (!a3)
      goto LABEL_6;
    if (!*((_BYTE *)v11 + 24))
    {
LABEL_5:
      *a3 = *((_BYTE *)v11 + 24);
      goto LABEL_6;
    }
  }
  -[ICFolder visibleNotesIncludingChildFolders](self, "visibleNotesIncludingChildFolders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__ICFolder_containsSharedNotesOrSharedDescendantFolders___block_invoke;
  v9[3] = &unk_1E76CCEB0;
  v9[4] = &v14;
  v9[5] = &v10;
  v9[6] = a3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  if (a3)
    goto LABEL_5;
LABEL_6:
  v7 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

void __57__ICFolder_containsSharedNotesOrSharedDescendantFolders___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v6 = objc_msgSend(v8, "isSharedViaICloud");
  v7 = *(_QWORD *)(a1[4] + 8);
  if (*(_BYTE *)(v7 + 24))
  {
    if (!v6)
      goto LABEL_7;
  }
  else
  {
    *(_BYTE *)(v7 + 24) = v6;
    if (!v6)
      goto LABEL_7;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v8, "isOwnedByCurrentUser");
LABEL_7:
  if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) && (!a1[6] || !*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24)))
    *a4 = 1;

}

- (BOOL)containsSharedNotesOrSharedDescendantFolders
{
  return -[ICFolder containsSharedNotesOrSharedDescendantFolders:](self, "containsSharedNotesOrSharedDescendantFolders:", 0);
}

- (id)rootSharedFoldersInDescendantsIncludingSelf
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICCloudSyncingObject isSharedRootObject](self, "isSharedRootObject"))
    objc_msgSend(v3, "addObject:", self);
  -[ICFolder recursiveVisibleSubfolders](self, "recursiveVisibleSubfolders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_objectsPassingTest:", &__block_literal_global_138);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

uint64_t __55__ICFolder_rootSharedFoldersInDescendantsIncludingSelf__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSharedRootObject");
}

- (id)rootSharedNotesIncludingChildFolders
{
  void *v2;
  void *v3;

  -[ICFolder visibleNotesIncludingChildFolders](self, "visibleNotesIncludingChildFolders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_objectsPassingTest:", &__block_literal_global_140);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __48__ICFolder_rootSharedNotesIncludingChildFolders__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSharedRootObject");
}

- (id)rootSharingFolder
{
  ICFolder *v3;
  uint64_t v4;

  if (-[ICNoteContainer isSharedViaICloud](self, "isSharedViaICloud"))
  {
    v3 = self;
    if (v3)
    {
      do
      {
        if (-[ICCloudSyncingObject isSharedRootObject](v3, "isSharedRootObject"))
          break;
        -[ICFolder parent](v3, "parent");
        v4 = objc_claimAutoreleasedReturnValue();

        v3 = (ICFolder *)v4;
      }
      while (v4);
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)rootSharingFolderForNote:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "folder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootSharingFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isSharedViaSharedFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (-[ICNoteContainer isSharedViaICloud](self, "isSharedViaICloud")
    && objc_msgSend(v4, "isSharedViaICloud"))
  {
    -[ICFolder rootSharingFolder](self, "rootSharingFolder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
      v8 = 1;
    else
      v8 = objc_msgSend(v4, "isDescendantOfFolder:", v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasSharedContentsNotSharedViaSharedFolder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (-[ICNoteContainer isSharedViaICloud](self, "isSharedViaICloud")
    && !-[ICFolder isSharedViaSharedFolder:](self, "isSharedViaSharedFolder:", v4)
    || (-[ICFolder rootSharedNotesIncludingChildFolders](self, "rootSharedNotesIncludingChildFolders"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    v7 = 1;
  }
  else
  {
    -[ICFolder rootSharedFoldersInDescendantsIncludingSelf](self, "rootSharedFoldersInDescendantsIncludingSelf");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__ICFolder_hasSharedContentsNotSharedViaSharedFolder___block_invoke;
    v10[3] = &unk_1E76CCF18;
    v11 = v4;
    v7 = objc_msgSend(v8, "ic_containsObjectPassingTest:", v10);

  }
  return v7;
}

uint64_t __54__ICFolder_hasSharedContentsNotSharedViaSharedFolder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSharedViaSharedFolder:", *(_QWORD *)(a1 + 32)) ^ 1;
}

- (id)childCloudObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFolder notes](self, "notes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[ICFolder children](self, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  return v3;
}

- (BOOL)canBeRootShareObject
{
  return !-[ICFolder isDefaultFolderForAccount](self, "isDefaultFolderForAccount")
      && -[ICFolder folderType](self, "folderType") == 0;
}

+ (id)shareType
{
  return CFSTR("com.apple.notes.folder");
}

- (id)shareType
{
  return (id)objc_msgSend((id)objc_opt_class(), "shareType");
}

+ (id)keyPathsForValuesAffectingCanBeSharedViaICloud
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICFolder;
  objc_msgSendSuper2(&v5, sel_keyPathsForValuesAffectingCanBeSharedViaICloud);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("folderType"));
  objc_msgSend(v3, "addObject:", CFSTR("isDefaultFolderForAccount"));
  objc_msgSend(v3, "addObject:", CFSTR("isSharedThroughParent"));
  return v3;
}

- (BOOL)canBeSharedViaICloud
{
  _BOOL4 v3;
  objc_super v5;

  v3 = -[ICFolder isModernCustomFolder](self, "isModernCustomFolder");
  if (v3)
  {
    if (-[ICFolder isSmartFolder](self, "isSmartFolder"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v5.receiver = self;
      v5.super_class = (Class)ICFolder;
      LOBYTE(v3) = -[ICNoteContainer canBeSharedViaICloud](&v5, sel_canBeSharedViaICloud);
    }
  }
  return v3;
}

- (BOOL)isModernCustomFolder
{
  return !-[ICFolder isSystemFolder](self, "isSystemFolder");
}

- (void)setFolderType:(signed __int16)a3
{
  uint64_t v3;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  if (-[ICFolder folderType](self, "folderType") != a3)
  {
    if ((v3 & 0xFFFFFFFE) == 2
      && (-[ICFolder isDefaultFolderForAccount](self, "isDefaultFolderForAccount")
       || -[ICFolder isTrashFolder](self, "isTrashFolder")))
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICFolder setFolderType:]", 1, 1, CFSTR("Attempting to set the default or trash folder as a smart folder"));
    }
    else
    {
      v5 = -[ICCloudSyncingObject intrinsicNotesVersion](self, "intrinsicNotesVersion");
      -[ICFolder willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("folderType"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICFolder setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("folderType"));

      -[ICFolder didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("folderType"));
      if (-[ICCloudSyncingObject intrinsicNotesVersion](self, "intrinsicNotesVersion") != v5)
        -[ICCloudSyncingObject resetToIntrinsicNotesVersionAndPropagateToChildObjects](self, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
      if ((_DWORD)v3 == 2)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        -[ICFolder account](self, "account");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", self, CFSTR("ICAccountDidAddSmartFolderNotificationFolderKey"), 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("ICSmartFolderAddedNotification"), v7, v8);

      }
    }
  }
}

- (void)setSmartFolderQueryJSON:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[ICFolder smartFolderQueryJSON](self, "smartFolderQueryJSON");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    -[ICFolder willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("smartFolderQueryJSON"));
    -[ICFolder setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("smartFolderQueryJSON"));
    -[ICFolder didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("smartFolderQueryJSON"));
    if (v6)
      -[ICFolder setFolderType:](self, "setFolderType:", 2);
    -[ICCloudSyncingObject resetToIntrinsicNotesVersionAndPropagateToChildObjects](self, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
  }

}

- (BOOL)isEditableSmartFolder
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[ICFolder isSmartFolder](self, "isSmartFolder");
  if (v3)
  {
    -[ICFolder smartFolderQuery](self, "smartFolderQuery");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canBeEdited");

    LOBYTE(v3) = v5;
  }
  return v3;
}

+ (id)visibleSmartFoldersForHashtagStandardizedContent:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(a1, "fetchRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("folderType == %d"), 2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("account.identifier == %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "predicateForVisibleObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB3528];
    v22 = (void *)v9;
    v27[0] = v9;
    v27[1] = v12;
    v27[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setPredicate:", v16);
    objc_msgSend(v8, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(v7, "managedObjectContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v17, "executeFetchRequest:error:", v8, &v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v26;
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICFolder visibleSmartFoldersForHashtagStandardizedContent:account:]", 1, 0, CFSTR("Failed to fetch count of smart folders for hashtag standardized content: %@"), v19);
      v20 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __69__ICFolder_visibleSmartFoldersForHashtagStandardizedContent_account___block_invoke;
      v23[3] = &unk_1E76CCF68;
      v24 = v7;
      v25 = v6;
      objc_msgSend(v18, "ic_compactMap:", v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v20;
}

id __69__ICFolder_visibleSmartFoldersForHashtagStandardizedContent_account___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  objc_msgSend(v3, "smartFolderQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tagSelectionWithManagedObjectContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "tagIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__ICFolder_visibleSmartFoldersForHashtagStandardizedContent_account___block_invoke_2;
  v12[3] = &unk_1E76CCF40;
  v13 = *(id *)(a1 + 40);
  LODWORD(v5) = objc_msgSend(v7, "ic_containsObjectPassingTest:", v12);
  objc_msgSend(v6, "unresolvedTagIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v8, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v5 | a1)
    v9 = v3;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

uint64_t __69__ICFolder_visibleSmartFoldersForHashtagStandardizedContent_account___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

- (BOOL)allowsExporting
{
  return 1;
}

- (BOOL)allowsImporting
{
  return -[ICFolder folderType](self, "folderType") - 4 < 0xFFFFFFFD;
}

+ (id)newFolderInAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(a1, "newFolderWithIdentifier:account:", v7, v5);

  return v8;
}

+ (id)newFolderWithIdentifier:(id)a3 account:(id)a4
{
  return (id)objc_msgSend(a1, "newFolderWithIdentifier:account:query:", a3, a4, 0);
}

+ (id)newFolderWithIdentifier:(id)a3 account:(id)a4 query:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    v11 = (void *)MEMORY[0x1E0D641A0];
    NSStringFromClass((Class)a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "account", "+[ICFolder(Management) newFolderWithIdentifier:account:query:]", 1, 0, CFSTR("Trying to create a %@ with no account"), v12);

  }
  objc_msgSend(v9, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(a1, "newObjectWithIdentifier:context:", v8, v13);

  objc_msgSend(v9, "persistentStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assignToPersistentStore:", v15);

  objc_msgSend(v14, "setAccount:", v9);
  if (v10)
    objc_msgSend(v14, "setSmartFolderQuery:", v10);

  return v14;
}

+ (id)newFolderInParentFolder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(a1, "newFolderWithIdentifier:parentFolder:", v7, v5);

  return v8;
}

+ (id)newFolderWithIdentifier:(id)a3 parentFolder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0D641A0];
    NSStringFromClass((Class)a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "parentFolder", "+[ICFolder(Management) newFolderWithIdentifier:parentFolder:]", 1, 0, CFSTR("Trying to create a %@ with no parent folder"), v9);

  }
  objc_msgSend(v7, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(a1, "newFolderWithIdentifier:account:", v6, v10);

  objc_msgSend(v11, "setParent:", v7);
  return v11;
}

+ (void)deleteFolder:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _UNKNOWN **v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v28 = a1;
  v49 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = os_log_create("com.apple.notes", "Delete");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[ICFolder(Management) deleteFolder:].cold.1(v3, v4);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v29 = v3;
  objc_msgSend(v3, "notes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    v10 = &off_1E76C5000;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v10[465], "deleteNote:", v12, v28);
        v13 = os_log_create("com.apple.notes", "Delete");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v12, "account");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "trashFolder");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "account");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "identifier");
          v19 = v6;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v43 = v30;
          v44 = 2112;
          v45 = v17;
          v46 = 2112;
          v47 = v20;
          _os_log_debug_impl(&dword_1BD918000, v13, OS_LOG_TYPE_DEBUG, "Setting trash folder %@ to note %@ in account %@", buf, 0x20u);

          v6 = v19;
          v10 = &off_1E76C5000;

        }
        objc_msgSend(v12, "account");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "trashFolder");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setFolder:", v15);

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setFolderModificationDate:", v16);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    }
    while (v8);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v29, "children");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  v24 = v28;
  if (v23)
  {
    v25 = v23;
    v26 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(v22);
        objc_msgSend(v24, "deleteFolder:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j), v28);
      }
      v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v25);
  }

  objc_msgSend(v29, "markForDeletion");
  if (objc_msgSend(v29, "importedFromLegacy"))
    +[ICLegacyTombstone addLegacyTombstoneForFolder:](ICLegacyTombstone, "addLegacyTombstoneForFolder:", v29);

}

+ (id)purgableFoldersFetchRequest
{
  void *v2;
  void *v3;

  +[ICFolder fetchRequest](ICFolder, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("title MATCHES \"(^%@|^%@).*\"), CFSTR("DefaultFolder"), CFSTR("TrashFolder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  return v2;
}

+ (void)purgeFolder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteObject:", v3);

}

+ (id)defaultFolderInContext:(id)a3
{
  void *v3;
  void *v4;

  +[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (ICFolder)folderWithIdentifier:(id)a3 context:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "foldersMatchingPredicate:context:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICFolder *)v10;
}

+ (id)allFoldersInContext:(id)a3
{
  return (id)objc_msgSend(a1, "foldersMatchingPredicate:context:", 0, a3);
}

+ (id)visibleFoldersInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "predicateForVisibleFoldersInContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "foldersMatchingPredicate:context:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unint64_t)countOfFoldersMatchingPredicate:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  NSObject *v11;
  id v13;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a4;
  objc_msgSend(v6, "fetchRequestWithEntityName:", CFSTR("ICFolder"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v5);
  v13 = 0;
  v9 = objc_msgSend(v7, "countForFetchRequest:error:", v8, &v13);

  v10 = v13;
  if (v10)
  {
    v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[ICFolder(Management) countOfFoldersMatchingPredicate:context:].cold.1((uint64_t)v5, (uint64_t)v10, v11);

  }
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = 0;

  return v9;
}

+ (id)predicateForVisibleCustomFolders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("folderType == %d AND identifier != '%@*' AND identifier != '@%*'"), 0, CFSTR("TrashFolder"), CFSTR("DefaultFolder"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3528];
  +[ICFolder predicateForVisibleObjects](ICFolder, "predicateForVisibleObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForFoldersInFolder:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ == %K"), a3, CFSTR("parent"));
}

- (NSArray)visibleNotesInFolder
{
  void *v3;
  void *v4;
  void *v5;

  -[ICFolder predicateForVisibleNotesInFolder](self, "predicateForVisibleNotesInFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFolder managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote notesMatchingPredicate:context:](ICNote, "notesMatchingPredicate:context:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (id)pinnedNotesInFolder
{
  void *v3;
  void *v4;
  void *v5;

  -[ICFolder predicateForPinnedNotesInFolder](self, "predicateForPinnedNotesInFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFolder managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote notesMatchingPredicate:context:](ICNote, "notesMatchingPredicate:context:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)foldersInFolder
{
  void *v3;
  void *v4;
  void *v5;

  -[ICFolder predicateForFoldersInFolder](self, "predicateForFoldersInFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFolder managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICFolder foldersMatchingPredicate:context:](ICFolder, "foldersMatchingPredicate:context:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (id)predicateForFoldersInFolder
{
  return (id)objc_msgSend((id)objc_opt_class(), "predicateForFoldersInFolder:", self);
}

- (id)predicateForPinnedNotesInFolder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[ICFolder predicateForNotesInFolder](self, "predicateForNotesInFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  +[ICNote predicateForPinnedNotes](ICNote, "predicateForPinnedNotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", 1, v4);
  return v5;
}

- (id)predicateForAttachmentsInFolder
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("note.folder == %@"), self);
}

- (id)predicateForVisibleAttachmentsInFolder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[ICFolder managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICBaseAttachment predicateForVisibleAttachmentsInContext:](ICAttachment, "predicateForVisibleAttachmentsInContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  -[ICFolder predicateForAttachmentsInFolder](self, "predicateForAttachmentsInFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", 1, v6);
  return v7;
}

+ (BOOL)supportsActivityEvents
{
  return 1;
}

- (void)associateAppEntityWithSearchableItemAttributeSet:(id)a3
{
  id v4;
  ICFolder *v5;

  v4 = a3;
  v5 = self;
  ICFolder.associateAppEntity(with:)((CSSearchableItemAttributeSet)v4);

}

- (ICQueryObjC)smartFolderQueryObjC
{
  ICFolder *v2;
  id v3;

  v2 = self;
  v3 = ICFolder.smartFolderQuery.getter();

  return (ICQueryObjC *)v3;
}

- (void)setSmartFolderQueryObjC:(id)a3
{
  id v5;
  ICFolder *v6;

  v5 = a3;
  v6 = self;
  ICFolder.smartFolderQuery.setter(a3);

}

- (NSString)smartFolderDescriptionObjC
{
  return (NSString *)sub_1BDB8EDEC(self, (uint64_t)a2, (void (*)(void))ICFolder.smartFolderDescription.getter);
}

- (NSString)smartFolderShortDescriptionObjC
{
  return (NSString *)sub_1BDB8EDEC(self, (uint64_t)a2, (void (*)(void))ICFolder.smartFolderShortDescription.getter);
}

+ (id)objc_smartFolderWithQuery:(id)a3 titleComponents:(id)a4 account:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v8 = sub_1BDBFD9E0();
  v9 = a3;
  v10 = a5;
  v11 = objc_msgSend(a1, sel_newFolderInAccount_, v10);
  objc_msgSend(v11, sel_setSmartFolderQueryObjC_, v9);
  if (*(_QWORD *)(v8 + 16))
  {
    v12 = (void *)objc_opt_self();
    v13 = (void *)sub_1BDBFD9C8();
    v14 = objc_msgSend(v12, sel_objc_defaultSmartFolderTitleWithComponents_, v13);

    objc_msgSend(v11, sel_setTitle_, v14);
    swift_bridgeObjectRelease();

  }
  else
  {

    swift_bridgeObjectRelease();
  }

  return v11;
}

+ (id)objc_smartFolderWithQuery:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)sub_1BDBFD9C8();
  v9 = objc_msgSend(a1, sel_objc_smartFolderWithQuery_titleComponents_account_, v6, v8, v7);

  return v9;
}

+ (id)objc_defaultSmartFolderTitleWithComponents:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = sub_1BDBFD9E0();
  _sSo8ICFolderC11NotesSharedE23defaultSmartFolderTitle10componentsSSSaySSG_tFZ_0(v3);
  swift_bridgeObjectRelease();
  v4 = (void *)sub_1BDBFD6C8();
  swift_bridgeObjectRelease();
  return v4;
}

+ (void)deduplicatingTitle:(uint64_t)a1 forFolder:(void *)a2 forNewFolderParent:ofAccount:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "Folder account mismatch %@ expects %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)deduplicatingTitle:(os_log_t)log forFolder:forNewFolderParent:ofAccount:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Must supply at least a folder, the new folder parent, or account", v1, 2u);
}

- (void)setAccount:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "Setting account (%@) on folder (%@)", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_2();
}

- (void)setMarkedForDeletion:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "Trying to mark an un-deletable folder (%@) for deletion: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
