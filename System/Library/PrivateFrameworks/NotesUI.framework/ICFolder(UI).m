@implementation ICFolder(UI)

- (__CFString)systemImageName
{
  __CFString *v2;

  if ((objc_msgSend(a1, "isTrashFolder") & 1) != 0)
  {
    v2 = CFSTR("trash");
  }
  else if ((objc_msgSend(a1, "isSmartFolder") & 1) != 0)
  {
    v2 = CFSTR("gearshape");
  }
  else if ((objc_msgSend(a1, "isSharedViaICloud") & 1) != 0)
  {
    v2 = CFSTR("folder.badge.person.crop");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultSystemImageName");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (const)defaultSystemImageName
{
  return CFSTR("folder");
}

+ (void)removeUsageOfHashtag:()UI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D63B10];
  objc_msgSend(v3, "standardizedContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleSmartFoldersForHashtagStandardizedContent:account:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "smartFolderQuery", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "standardizedContent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removingTagIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSmartFolderQuery:", v16);

        objc_msgSend(v13, "updateChangeCountWithReason:", CFSTR("Removed tag"));
        objc_msgSend(v13, "smartFolderQuery");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
          objc_msgSend(v13, "markForDeletion");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

+ (id)foldersWithHashtagAsOnlyFilter:()UI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D63B10];
  objc_msgSend(v3, "standardizedContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleSmartFoldersForHashtagStandardizedContent:account:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__ICFolder_UI__foldersWithHashtagAsOnlyFilter___block_invoke;
  v11[3] = &unk_1E5C23DB8;
  v12 = v3;
  v8 = v3;
  objc_msgSend(v7, "ic_objectsPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)smartFoldersThatWillBeDeletedAfterDeletingHashtags:()UI
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  id obj;
  id obja;
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
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v37 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v36 = v3;
    obj = v3;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v46 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1E0D63B10];
          objc_msgSend(v10, "standardizedContent", v36);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "account");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "visibleSmartFoldersForHashtagStandardizedContent:account:", v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "ic_addObjectsFromNonNilArray:", v14);
          objc_msgSend(v10, "standardizedContent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "ic_addNonNilObject:", v15);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v7);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v38 = v4;
    v16 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v16)
    {
      v17 = v16;
      obja = *(id *)v42;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(id *)v42 != obja)
            objc_enumerationMutation(v38);
          v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v19, "smartFolderQuery", v36);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "managedObjectContext");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "account");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "filterSelectionWithManagedObjectContext:account:", v21, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          objc_msgSend(v24, "filterTypeSelectionForFilterType:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          ICDynamicCast();
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v26, "tagIdentifiers");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setWithArray:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v29, "isSubsetOfSet:", v30);

          if (v31)
          {
            objc_msgSend(v24, "filterTypeSelections");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "count");

            if (v33 == 1)
              objc_msgSend(v37, "ic_addNonNilObject:", v19);
          }

        }
        v17 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v17);
    }

    v34 = (void *)objc_msgSend(v37, "copy");
    v3 = v36;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v34;
}

+ (const)defaultFilledSystemImageName
{
  return CFSTR("folder.fill");
}

- (__CFString)filledSystemImageName
{
  __CFString *v2;

  if ((objc_msgSend(a1, "isTrashFolder") & 1) != 0)
  {
    v2 = CFSTR("trash.fill");
  }
  else if ((objc_msgSend(a1, "isSmartFolder") & 1) != 0)
  {
    v2 = CFSTR("gearshape.fill");
  }
  else if ((objc_msgSend(a1, "isSharedViaICloud") & 1) != 0)
  {
    v2 = CFSTR("folder.fill.badge.person.crop");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultFilledSystemImageName");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (uint64_t)defaultNavigationBarIcon
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("NavigationBarIcons/Folder"));
}

- (id)navigationBarIconOverlaySystemImage
{
  const __CFString *v2;
  void *v3;

  if ((objc_msgSend(a1, "isTrashFolder") & 1) != 0)
  {
    v2 = CFSTR("trash.fill");
  }
  else if ((objc_msgSend(a1, "isSmartFolder") & 1) != 0)
  {
    v2 = CFSTR("gearshape.fill");
  }
  else
  {
    if (!objc_msgSend(a1, "isSharedViaICloud"))
    {
      v3 = 0;
      return v3;
    }
    v2 = CFSTR("person.crop.circle.fill");
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "ic_systemImageNamed:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (id)navigationBarIconWithSize:()UI
{
  void *v6;
  void *v7;
  _QWORD v9[7];

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", a2, a3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__ICFolder_UI__navigationBarIconWithSize___block_invoke;
  v9[3] = &unk_1E5C1D680;
  v9[4] = a1;
  *(double *)&v9[5] = a2;
  *(double *)&v9[6] = a3;
  objc_msgSend(v6, "imageWithActions:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
