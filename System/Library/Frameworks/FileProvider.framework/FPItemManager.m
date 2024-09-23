@implementation FPItemManager

- (id)eligibleActionsForItems:(id)a3
{
  return -[FPItemManager eligibleActionsForItems:domainCachePolicy:](self, "eligibleActionsForItems:domainCachePolicy:", a3, 1);
}

- (id)eligibleActionsForItems:(id)a3 providerDomain:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  void *v31;
  const __CFString *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  char v39;
  const __CFString *v40;
  void *v41;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  id obj;
  void *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_116;
  }
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v49 = (void *)objc_opt_new();
  v9 = v6;
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isReadOnly") & 1) == 0)
    {
      if ((objc_msgSend(v10, "capabilities") & 8) != 0)
        objc_msgSend(v7, "addObject:", CFSTR("Rename"));
      if (objc_msgSend(v10, "isFolder") && (objc_msgSend(v10, "capabilities") & 2) != 0)
        objc_msgSend(v7, "addObject:", CFSTR("Import"));
    }
    if ((objc_msgSend(v10, "capabilities") & 0x40000000) != 0)
      objc_msgSend(v7, "addObject:", CFSTR("FetchPublishingURL"));

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Archive"), CFSTR("Unarchive"), CFSTR("Copy"), 0);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Delete"), CFSTR("Trash"), CFSTR("Untrash"), CFSTR("Favorite"), CFSTR("Tag"), CFSTR("ModifyFlags"), CFSTR("ExcludeFromSync"), CFSTR("Unignore"), 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v11;
  objc_msgSend(v7, "unionSet:", v11);
  v43 = (void *)v12;
  if ((objc_msgSend(v9, "isReadOnly") & 1) != 0)
  {
    objc_msgSend(v8, "addObject:", CFSTR("Archive"));
    objc_msgSend(v8, "addObject:", CFSTR("Unarchive"));
  }
  else
  {
    objc_msgSend(v7, "unionSet:", v12);
  }
  v44 = v6;
  v45 = v5;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v5;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (!v14)
  {
    v16 = 0;
    v52 = 0;
    v48 = 0;
    goto LABEL_105;
  }
  v15 = v14;
  v16 = 0;
  v52 = 0;
  v48 = 0;
  v17 = *(_QWORD *)v55;
  v47 = v7;
  do
  {
    v18 = 0;
    do
    {
      if (*(_QWORD *)v55 != v17)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v18);
      if (!objc_msgSend(v19, "isActionable"))
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        v6 = v44;
        v5 = v45;
        v38 = v43;
        goto LABEL_115;
      }
      if ((objc_msgSend(v19, "isBusy") & 1) != 0)
      {
        v48 = 1;
        goto LABEL_96;
      }
      objc_msgSend(v19, "itemIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier")))
      {

LABEL_27:
        objc_msgSend(v8, "addObject:", CFSTR("Tag"));
        objc_msgSend(v8, "addObject:", CFSTR("Favorite"));
        objc_msgSend(v8, "addObject:", CFSTR("Archive"));
        objc_msgSend(v8, "addObject:", CFSTR("Unarchive"));
        objc_msgSend(v8, "addObject:", CFSTR("Rename"));
        objc_msgSend(v8, "addObject:", CFSTR("Trash"));
        objc_msgSend(v8, "addObject:", CFSTR("Delete"));
        objc_msgSend(v8, "addObject:", CFSTR("ModifyFlags"));
        objc_msgSend(v8, "addObject:", CFSTR("Pin"));
        goto LABEL_28;
      }
      objc_msgSend(v19, "itemIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("NSFileProviderTrashContainerItemIdentifier"));

      if (v22)
        goto LABEL_27;
LABEL_28:
      if ((objc_msgSend(v19, "capabilities") & 1) == 0)
        objc_msgSend(v8, "unionSet:", v46);
      if (!-[FPItemManager _itemIsOfArchiveType:](self, "_itemIsOfArchiveType:", v19))
        objc_msgSend(v8, "addObject:", CFSTR("Unarchive"));
      if (v16)
      {
        v23 = v16;
      }
      else
      {
        objc_msgSend(v19, "providerDomainID");
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v23;

      if (v52)
      {
        v24 = v52;
      }
      else
      {
        objc_msgSend(v19, "parentItemIdentifier");
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v52 = v24;

      if (!v9
        || (objc_msgSend(v19, "providerDomainID"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v9, "identifier"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v27 = objc_msgSend(v25, "isEqualToString:", v26),
            v26,
            v25,
            (v27 & 1) == 0))
      {
        v53 = 0;
        +[FPProviderDomain providerDomainWithID:cachePolicy:error:](FPProviderDomain, "providerDomainWithID:cachePolicy:error:", v16, 1, &v53);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v53;

        if (!v28)
        {
          fp_current_or_default_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v29, "fp_prettyDescription");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v59 = v19;
            v60 = 2112;
            v61 = v36;
            _os_log_error_impl(&dword_1A0A34000, v30, OS_LOG_TYPE_ERROR, "[ERROR] Failed to fetch domain for FPItem %@, error: %@", buf, 0x16u);

          }
        }

        v9 = (id)v28;
      }
      objc_msgSend(v19, "providerDomainID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "addObject:", v31);

      v7 = v47;
      if (objc_msgSend(v19, "isCloudItem"))
      {
        if ((objc_msgSend(v19, "capabilities") & 0x40) != 0)
          objc_msgSend(v47, "addObject:", CFSTR("Evict"));
        if ((objc_msgSend(v19, "isDownloaded") & 1) == 0)
        {
          if (objc_msgSend(v19, "allowsContextualMenuDownloadEntry"))
            v32 = CFSTR("Download");
          else
            v32 = CFSTR("DownloadNoContextMenu");
          objc_msgSend(v47, "addObject:", v32);
        }
        if (objc_msgSend(v19, "isFolder") && (objc_msgSend(v19, "isRecursivelyDownloaded") & 1) == 0)
        {
          if (objc_msgSend(v19, "allowsContextualMenuDownloadEntry"))
            v33 = CFSTR("DownloadRecursively");
          else
            v33 = CFSTR("DownloadRecursivelyNoContextMenu");
          objc_msgSend(v47, "addObject:", v33);
        }
      }
      if (FPPinningSupportedForItem(v19))
        objc_msgSend(v47, "addObject:", CFSTR("Pin"));
      if ((objc_msgSend(v19, "capabilities") & 0x8000000) != 0)
        objc_msgSend(v47, "addObject:", CFSTR("Unpin"));
      if ((objc_msgSend(v19, "isFolder") & 1) == 0)
        objc_msgSend(v8, "addObject:", CFSTR("Favorite"));
      if (objc_msgSend(v19, "isContainer"))
        objc_msgSend(v8, "addObject:", CFSTR("ModifyFlags"));
      if ((objc_msgSend(v19, "exclusionType") & 1) != 0
        || (objc_msgSend(v8, "addObject:", CFSTR("Unignore")), (objc_msgSend(v19, "capabilities") & 0x80) == 0))
      {
        objc_msgSend(v8, "addObject:", CFSTR("ExcludeFromSync"));
      }
      if (!objc_msgSend(v19, "exclusionType") && objc_msgSend(v19, "isExcludedFromSync"))
      {
        objc_msgSend(v8, "addObject:", CFSTR("Unignore"));
        objc_msgSend(v8, "addObject:", CFSTR("ExcludeFromSync"));
      }
      if (objc_msgSend(v19, "exclusionType") || objc_msgSend(v19, "isExcludedFromSync"))
      {
        objc_msgSend(v8, "addObject:", CFSTR("Evict"));
        objc_msgSend(v8, "addObject:", CFSTR("Pin"));
        objc_msgSend(v8, "addObject:", CFSTR("Download"));
        objc_msgSend(v8, "addObject:", CFSTR("DownloadRecursively"));
      }
      if (objc_msgSend(v19, "isCollaborationInvitation"))
      {
        objc_msgSend(v8, "addObject:", CFSTR("Copy"));
        objc_msgSend(v8, "addObject:", CFSTR("Tag"));
      }
      if ((objc_msgSend(v19, "capabilities") & 0x10) == 0)
        goto LABEL_79;
      if (-[FPItemManager isItemInTrash:](self, "isItemInTrash:", v19))
      {
        objc_msgSend(v8, "addObject:", CFSTR("Trash"));
        objc_msgSend(v8, "addObject:", CFSTR("Favorite"));
        objc_msgSend(v8, "addObject:", CFSTR("Unarchive"));
        objc_msgSend(v8, "addObject:", CFSTR("Archive"));
        objc_msgSend(v8, "addObject:", CFSTR("ModifyFlags"));
        objc_msgSend(v8, "addObject:", CFSTR("Pin"));
        v34 = v47;
        v35 = CFSTR("Delete");
        goto LABEL_83;
      }
      if (v9 && (objc_msgSend(v9, "supportsSyncingTrash") & 1) == 0)
LABEL_79:
        objc_msgSend(v8, "addObject:", CFSTR("Trash"));
      v34 = v8;
      v35 = CFSTR("Untrash");
LABEL_83:
      objc_msgSend(v34, "addObject:", v35);
      if ((objc_msgSend(v19, "capabilities") & 4) == 0)
        objc_msgSend(v8, "addObject:", CFSTR("Move"));
      if ((objc_msgSend(v19, "capabilities") & 0x20) == 0
        && !-[FPItemManager isItemInTrash:](self, "isItemInTrash:", v19))
      {
        objc_msgSend(v8, "addObject:", CFSTR("Delete"));
      }
      if ((objc_msgSend(v19, "capabilities") & 0x20000000) == 0)
        objc_msgSend(v8, "addObject:", CFSTR("Tag"));
      if ((objc_msgSend(v19, "capabilities") & 2) == 0)
        objc_msgSend(v8, "addObject:", CFSTR("ModifyFlags"));
      if ((objc_msgSend(v19, "capabilities") & 0x4000000) == 0)
        objc_msgSend(v8, "addObject:", CFSTR("DownloadRecursively"));
      if ((objc_msgSend(v19, "capabilities") & 0x40) == 0)
        objc_msgSend(v8, "addObject:", CFSTR("Evict"));
LABEL_96:
      ++v18;
    }
    while (v15 != v18);
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    v15 = v37;
  }
  while (v37);
LABEL_105:

  if (objc_msgSend(obj, "count") == 1)
  {
    v39 = objc_msgSend(v8, "containsObject:", CFSTR("Unarchive"));
    v6 = v44;
    v5 = v45;
    v38 = v43;
    v40 = CFSTR("Archive");
    if ((v39 & 1) != 0)
      goto LABEL_110;
  }
  else
  {
    v40 = CFSTR("Unarchive");
    v6 = v44;
    v5 = v45;
    v38 = v43;
  }
  objc_msgSend(v8, "addObject:", v40);
LABEL_110:
  if ((unint64_t)objc_msgSend(v49, "count", v40) >= 2)
    objc_msgSend(v8, "addObject:", CFSTR("Move"));
  objc_msgSend(v7, "minusSet:", v8);
  if ((v48 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("Delete"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intersectSet:", v41);

  }
  v13 = v7;
LABEL_115:

LABEL_116:
  return v13;
}

- (BOOL)_itemIsOfArchiveType:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  char v7;

  v3 = _itemIsOfArchiveType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_itemIsOfArchiveType__onceToken, &__block_literal_global_83);
  v5 = (void *)_itemIsOfArchiveType__archiveTypes;
  objc_msgSend(v4, "typeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6);
  return v7;
}

+ (id)defaultManager
{
  if (defaultManager_onceToken_0 != -1)
    dispatch_once(&defaultManager_onceToken_0, &__block_literal_global_57);
  return (id)defaultManager_defaultManager_0;
}

- (id)eligibleActionsForItems:(id)a3 domainCachePolicy:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "providerDomainID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    +[FPProviderDomain providerDomainWithID:cachePolicy:error:](FPProviderDomain, "providerDomainWithID:cachePolicy:error:", v8, a4, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    if (!v9)
    {
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[FPItemManager eligibleActionsForItems:domainCachePolicy:].cold.1((uint64_t)v7, v10, v11);

    }
    -[FPItemManager eligibleActionsForItems:providerDomain:](self, "eligibleActionsForItems:providerDomain:", v6, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)appLibraryCollectionForProviderDomainID:(id)a3
{
  id v3;
  FPItemID *v4;
  void *v5;
  FPAppLibraryCollection *v6;

  v3 = a3;
  v4 = -[FPItemID initWithProviderDomainID:itemIdentifier:]([FPItemID alloc], "initWithProviderDomainID:itemIdentifier:", v3, CFSTR("NSFileProviderRootContainerItemIdentifier"));

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setBuildAndFilterAppLibraries:", 1);
  objc_msgSend(v5, "setEnumeratedItemID:", v4);
  v6 = -[FPExtensionCollection initWithSettings:]([FPAppLibraryCollection alloc], "initWithSettings:", v5);

  return v6;
}

- (BOOL)isItemInTrash:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v3 = a3;
  if ((objc_msgSend(v3, "isTrashed") & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_msgSend(v3, "providerID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage"));

    objc_msgSend(v3, "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isDiskIdentifier");

    if ((v7 & 1) != 0 || v4)
    {
      objc_msgSend(v3, "fileURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pathComponents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v4) = objc_msgSend(v9, "containsObject:", CFSTR(".Trash"));

    }
  }

  return v4;
}

uint64_t __37__FPItemManager_newRecentsCollection__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  FPRecencyQualifyingAttributes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7), (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {

          goto LABEL_12;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }

  if ((objc_msgSend(v2, "isTrashed") & 1) != 0)
LABEL_12:
    v9 = 0;
  else
    v9 = objc_msgSend(v2, "isFolder") ^ 1;

  return v9;
}

void __84__FPItemManager__fetchItemForURL_synchronously_skipURLValidation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a2;
  +[FPItemManager _promoteItemToAppLibraryIfNeeded:](FPItemManager, "_promoteItemToAppLibraryIfNeeded:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (void)_promoteItemToAppLibraryIfNeeded:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isFolder"))
  {
    objc_msgSend(v7, "parentItemIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier"));

    if (v4)
    {
      +[FPAppRegistry sharedRegistry](FPAppRegistry, "sharedRegistry");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v5, "promoteItemToAppLibraryIfNeeded:", v7);

    }
  }

}

- (id)itemForURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__29;
  v21 = __Block_byref_object_dispose__29;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__29;
  v15 = __Block_byref_object_dispose__29;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__FPItemManager_itemForURL_error___block_invoke;
  v10[3] = &unk_1E444BEC0;
  v10[4] = &v17;
  v10[5] = &v11;
  -[FPItemManager _fetchItemForURL:synchronously:completionHandler:](self, "_fetchItemForURL:synchronously:completionHandler:", v6, 1, v10);
  v7 = (void *)v18[5];
  if (a4 && !v7)
  {
    *a4 = objc_retainAutorelease((id)v12[5]);
    v7 = (void *)v18[5];
  }
  v8 = v7;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void)_fetchItemForURL:(id)a3 synchronously:(BOOL)a4 skipURLValidation:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  if (!v8)
  {
    __FPMakeAsyncCompletionBlock((id *)&self->super.isa, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v12;
  }
  if (!a5)
  {
    v21 = 0;
    objc_msgSend(v10, "getResourceValue:forKey:error:", &v21, CFSTR("FPOriginalDocumentURL"), 0);
    v13 = v21;
    if (v13)
    {
      fp_current_or_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[FPItemManager _fetchItemForURL:synchronously:skipURLValidation:completionHandler:].cold.1((uint64_t)v13);

      v15 = v13;
      v10 = v15;
    }
    if (!FPURLMightBeInFileProvider(v10))
    {
      (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
      goto LABEL_13;
    }

  }
  +[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "connectionProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v8)
  {
    objc_msgSend(v16, "synchronousRemoteObjectProxy");
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v18;
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84__FPItemManager__fetchItemForURL_synchronously_skipURLValidation_completionHandler___block_invoke;
  v19[3] = &unk_1E444BFE0;
  v20 = v11;
  objc_msgSend(v17, "itemForURL:completionHandler:", v10, v19);

LABEL_13:
}

- (void)_fetchItemForURL:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  -[FPItemManager _fetchItemForURL:synchronously:skipURLValidation:completionHandler:](self, "_fetchItemForURL:synchronously:skipURLValidation:completionHandler:", a3, a4, 0, a5);
}

void __34__FPItemManager_itemForURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)newSearchCollection
{
  return objc_alloc_init(FPSearchCollection);
}

- (id)newSharedItemsCollection
{
  void *v2;
  FPQueryCollection *v3;

  FPItemPredicate(&__block_literal_global_60);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[FPQueryCollection initWithQueryDescriptorClass:predicate:]([FPQueryCollection alloc], "initWithQueryDescriptorClass:predicate:", objc_opt_class(), v2);
  -[FPQueryCollection setDescriptionName:](v3, "setDescriptionName:", CFSTR("all shared items"));

  return v3;
}

- (id)newFavoritesCollection
{
  void *v2;
  FPQueryCollection *v3;

  FPItemPredicate(&__block_literal_global_25_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[FPQueryCollection initWithQueryDescriptorClass:predicate:]([FPQueryCollection alloc], "initWithQueryDescriptorClass:predicate:", objc_opt_class(), v2);
  -[FPQueryCollection setDescriptionName:](v3, "setDescriptionName:", CFSTR("favorited items"));

  return v3;
}

- (id)newTrashCollection
{
  void *v2;
  FPQueryCollection *v3;
  FPTrashUnionCollection *v4;

  FPItemPredicate(&__block_literal_global_30);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[FPQueryCollection initWithQueryDescriptorClass:predicate:]([FPQueryCollection alloc], "initWithQueryDescriptorClass:predicate:", objc_opt_class(), v2);
  -[FPQueryCollection setDescriptionName:](v3, "setDescriptionName:", CFSTR("trashed items (CS)"));
  v4 = -[FPTrashUnionCollection initWithQueryCollection:]([FPTrashUnionCollection alloc], "initWithQueryCollection:", v3);

  return v4;
}

- (id)newRecentsCollection
{
  void *v2;
  FPQueryCollection *v3;
  void *v4;

  FPItemPredicate(&__block_literal_global_46_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[FPQueryCollection initWithQueryDescriptorClass:predicate:]([FPQueryCollection alloc], "initWithQueryDescriptorClass:predicate:", objc_opt_class(), v2);
  objc_msgSend(MEMORY[0x1E0C99D20], "fp_sortDescriptorByLastUsedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItemCollection reorderItemsWithSortDescriptors:](v3, "reorderItemsWithSortDescriptors:", v4);

  -[FPQueryCollection setDescriptionName:](v3, "setDescriptionName:", CFSTR("recent files"));
  return v3;
}

void __31__FPItemManager_defaultManager__block_invoke()
{
  FPItemManager *v0;
  void *v1;

  v0 = objc_alloc_init(FPItemManager);
  v1 = (void *)defaultManager_defaultManager_0;
  defaultManager_defaultManager_0 = (uint64_t)v0;

}

- (FPItemManager)init
{
  FPItemManager *v2;
  uint64_t v3;
  NSOperationQueue *operationQueue;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *completionQueue;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *notificationQueue;
  uint64_t v11;
  NSMutableSet *activeCollections;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FPItemManager;
  v2 = -[FPItemManager init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (NSOperationQueue *)v3;

    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", CFSTR("FPItemManager operation queue"));
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("FPItemManager completion queue", v5);
    completionQueue = v2->_completionQueue;
    v2->_completionQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("FPItemManager.notificationQueue", v8);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new();
    activeCollections = v2->_activeCollections;
    v2->_activeCollections = (NSMutableSet *)v11;

  }
  return v2;
}

void __91__FPItemManager__fetchURLForItemID_creatingPlaceholderIfMissing_completionHandlerWithInfo___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  objc_msgSend(a2, "url");
  if (objc_claimAutoreleasedReturnValue())
    FPMarkAsFileProviderBookmark();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __83__FPItemManager__fetchURLForItemID_creatingPlaceholderIfMissing_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__FPItemManager_fetchOperationServiceForProviderDomainID_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  unint64_t v11;
  id v12;
  id v13;
  id v14;
  FPService *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;

  v19 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14 && v19 | v11)
  {
    v15 = [FPService alloc];
    FPXOperationServiceXPCInterface();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      v17 = -[FPService initWithProxy:interface:lifetimeExtender:providerDomainID:](v15, "initWithProxy:interface:lifetimeExtender:providerDomainID:", v19, v16, v12, v13);
    else
      v17 = -[FPService initWithEndpoint:interface:lifetimeExtender:providerDomainID:](v15, "initWithEndpoint:interface:lifetimeExtender:providerDomainID:", v11, v16, v12, v13);
    v18 = (void *)v17;

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __54__FPItemManager_fetchItemForItemID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a2;
  +[FPItemManager _promoteItemToAppLibraryIfNeeded:](FPItemManager, "_promoteItemToAppLibraryIfNeeded:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __54__FPItemManager_fetchItemForItemID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (!v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      FPItemNotFoundError((uint64_t)v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v5, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__FPItemManager_fetchItemForItemID_completionHandler___block_invoke_2;
    v11[3] = &unk_1E444BFE0;
    v9 = *(_QWORD *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v8, "fetchItemID:reply:", v9, v11);

    v7 = v12;
  }

}

void __38__FPItemManager__itemIsOfArchiveType___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[12];

  v5[11] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC678], "identifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC500], "identifier", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend((id)*MEMORY[0x1E0CEC468], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  v5[3] = CFSTR("public.cpio-archive");
  v5[4] = CFSTR("com.apple.bom-compressed-cpio");
  v5[5] = CFSTR("org.gnu.gnu-tar-archive");
  v5[6] = CFSTR("public.tar-archive");
  v5[7] = CFSTR("org.gnu.gnu-zip-tar-archive");
  v5[8] = CFSTR("com.pkware.zip-archive");
  v5[9] = CFSTR("com.apple.archive");
  v5[10] = CFSTR("com.apple.encrypted-archive");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 11);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_itemIsOfArchiveType__archiveTypes;
  _itemIsOfArchiveType__archiveTypes = v3;

}

- (id)newCollectionWithItemID:(id)a3
{
  id v3;
  void *v4;
  FPExtensionCollection *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setEnumeratedItemID:", v3);

  v5 = -[FPExtensionCollection initWithSettings:]([FPExtensionCollection alloc], "initWithSettings:", v4);
  return v5;
}

- (void)fetchURLForItemID:(id)a3 completionHandler:(id)a4
{
  -[FPItemManager _fetchURLForItemID:creatingPlaceholderIfMissing:completionHandler:](self, "_fetchURLForItemID:creatingPlaceholderIfMissing:completionHandler:", a3, 1, a4);
}

- (void)fetchOperationServiceForProviderDomainID:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__FPItemManager_fetchOperationServiceForProviderDomainID_handler___block_invoke;
  v9[3] = &unk_1E444FB40;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "startAccessingOperationServiceForProviderDomainID:handler:", v6, v9);

}

- (void)fetchItemForURL:(id)a3 completionHandler:(id)a4
{
  -[FPItemManager _fetchItemForURL:synchronously:skipURLValidation:completionHandler:](self, "_fetchItemForURL:synchronously:skipURLValidation:completionHandler:", a3, 0, 0, a4);
}

- (void)fetchItemForItemID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  __FPMakeAsyncCompletionBlock((id *)&self->super.isa, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "providerDomainID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__FPItemManager_fetchItemForItemID_completionHandler___block_invoke;
  v11[3] = &unk_1E444FAD0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[FPItemManager fetchOperationServiceForProviderDomainID:handler:](self, "fetchOperationServiceForProviderDomainID:handler:", v8, v11);

}

- (id)collectionForFolderItem:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v9;

  v5 = a3;
  if ((objc_msgSend(v5, "state") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItemManager.m"), 130, CFSTR("this operation isn't supported for placeholder items"));

  }
  objc_msgSend(v5, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FPItemManager newCollectionWithItemID:](self, "newCollectionWithItemID:", v6);

  return v7;
}

- (void)_fetchURLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 completionHandlerWithInfo:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__FPItemManager__fetchURLForItemID_creatingPlaceholderIfMissing_completionHandlerWithInfo___block_invoke;
  v11[3] = &unk_1E444D3C8;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:", v8, v5, 0, v11);

}

- (void)_fetchURLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__FPItemManager__fetchURLForItemID_creatingPlaceholderIfMissing_completionHandler___block_invoke;
  v10[3] = &unk_1E444FA58;
  v11 = v8;
  v9 = v8;
  -[FPItemManager _fetchURLForItemID:creatingPlaceholderIfMissing:completionHandlerWithInfo:](self, "_fetchURLForItemID:creatingPlaceholderIfMissing:completionHandlerWithInfo:", a3, v5, v10);

}

- (id)collectionWithIdentifier:(id)a3 domainIdentifier:(id)a4 providerIdentifier:(id)a5 sortDescriptors:(id)a6
{
  return 0;
}

- (id)collectionWithIdentifier:(id)a3 providerIdentifier:(id)a4 fileTypes:(id)a5
{
  return -[FPItemManager collectionWithIdentifier:domainIdentifier:providerIdentifier:fileTypes:](self, "collectionWithIdentifier:domainIdentifier:providerIdentifier:fileTypes:", a3, 0, a4, a5);
}

- (id)collectionWithIdentifier:(id)a3 domainIdentifier:(id)a4 providerIdentifier:(id)a5 fileTypes:(id)a6
{
  return -[FPItemManager collectionWithIdentifier:domainIdentifier:providerIdentifier:fileTypes:](self, "collectionWithIdentifier:domainIdentifier:providerIdentifier:fileTypes:", a3, a4, a5, MEMORY[0x1E0C9AA60]);
}

- (id)rootCollectionForProviderDomain:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPItemID rootItemIDWithProviderDomainID:](FPItemID, "rootItemIDWithProviderDomainID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[FPItemManager newCollectionWithItemID:](self, "newCollectionWithItemID:", v5);
  return v6;
}

- (id)serverCollectionForFolderItem:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v9;

  v5 = a3;
  if ((objc_msgSend(v5, "state") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItemManager.m"), 141, CFSTR("this operation isn't supported for placeholder items"));

  }
  objc_msgSend(v5, "formerItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FPItemManager newCollectionWithItemID:](self, "newCollectionWithItemID:", v6);

  return v7;
}

- (id)trashCollectionForProviderDomain:(id)a3
{
  id v3;
  void *v4;
  FPItemID *v5;
  void *v6;
  FPItemID *v7;
  FPExtensionCollection *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = [FPItemID alloc];
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[FPItemID initWithProviderDomainID:itemIdentifier:](v5, "initWithProviderDomainID:itemIdentifier:", v6, CFSTR("NSFileProviderTrashContainerItemIdentifier"));
  objc_msgSend(v4, "setEnumeratedItemID:", v7);

  v8 = -[FPExtensionCollection initWithSettings:]([FPExtensionCollection alloc], "initWithSettings:", v4);
  return v8;
}

- (id)newCollectionWithItemAtURL:(id)a3 skipValidation:(BOOL)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  FPExtensionCollection *v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[6];

  v29[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a4)
  {
LABEL_15:
    if (!objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", a5))
    {
      v20 = 0;
      goto LABEL_19;
    }
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setEnumeratedURL:", v7);
    objc_msgSend(v8, "setRequireSandboxAccess:", 1);
    v20 = -[FPExtensionCollection initWithSettings:]([FPExtensionCollection alloc], "initWithSettings:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fp_lmdURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("com~apple~CloudDocs"), 1);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("Desktop"), 1);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("Documents"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v8;
    v29[1] = v9;
    v22 = (void *)v11;
    v23 = (void *)v9;
    v29[2] = v11;
    v29[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v7, "fp_relativePathWithRealpath:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18 && !objc_msgSend(v18, "length"))
          {

            goto LABEL_15;
          }

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v15)
          continue;
        break;
      }
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", 22);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    v20 = 0;
  }

LABEL_19:
  return v20;
}

- (id)newCollectionWithItemAtURL:(id)a3 error:(id *)a4
{
  return -[FPItemManager newCollectionWithItemAtURL:skipValidation:error:](self, "newCollectionWithItemAtURL:skipValidation:error:", a3, 0, a4);
}

- (id)appLibraryCollectionForProviderDomain:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItemManager appLibraryCollectionForProviderDomainID:](self, "appLibraryCollectionForProviderDomainID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __39__FPItemManager_newFavoritesCollection__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "favoriteRank");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_msgSend(v2, "isTrashed") & 1) == 0)
    v4 = objc_msgSend(v2, "isFolder");
  else
    v4 = 0;

  return v4;
}

uint64_t __35__FPItemManager_newTrashCollection__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isTrashed");
}

- (id)newEvictableCollection
{
  void *v2;
  FPQueryCollection *v3;
  void *v4;
  void *v5;

  FPItemPredicate(&__block_literal_global_35);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[FPQueryCollection initWithQueryDescriptorClass:predicate:]([FPQueryCollection alloc], "initWithQueryDescriptorClass:predicate:", objc_opt_class(), v2);
  objc_msgSend(MEMORY[0x1E0C99D20], "fp_sortDescriptorByLastUsedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fp_map:", &__block_literal_global_38_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItemCollection reorderItemsWithSortDescriptors:](v3, "reorderItemsWithSortDescriptors:", v5);

  -[FPQueryCollection setDescriptionName:](v3, "setDescriptionName:", CFSTR("evictable files"));
  return v3;
}

unint64_t __39__FPItemManager_newEvictableCollection__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 6) & 1;
}

uint64_t __39__FPItemManager_newEvictableCollection__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reversedSortDescriptor");
}

- (id)newNonAutoEvictableCollection
{
  void *v2;
  FPQueryCollection *v3;
  void *v4;
  void *v5;

  FPItemPredicate(&__block_literal_global_41_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[FPQueryCollection initWithQueryDescriptorClass:predicate:]([FPQueryCollection alloc], "initWithQueryDescriptorClass:predicate:", objc_opt_class(), v2);
  objc_msgSend(MEMORY[0x1E0C99D20], "fp_sortDescriptorByDocumentSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fp_map:", &__block_literal_global_43);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItemCollection reorderItemsWithSortDescriptors:](v3, "reorderItemsWithSortDescriptors:", v5);

  -[FPQueryCollection setDescriptionName:](v3, "setDescriptionName:", CFSTR("all files that aren't autoevictable"));
  return v3;
}

BOOL __46__FPItemManager_newNonAutoEvictableCollection__block_invoke(uint64_t a1, void *a2)
{
  return (objc_msgSend(a2, "capabilities") & 0x40) == 0;
}

uint64_t __46__FPItemManager_newNonAutoEvictableCollection__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reversedSortDescriptor");
}

- (id)newCollectionForProvider:(id)a3
{
  id v3;
  id v4;
  void *v5;
  FPQueryCollection *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  id v14;

  v3 = a3;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __42__FPItemManager_newCollectionForProvider___block_invoke;
  v13 = &unk_1E444FA08;
  v14 = v3;
  v4 = v3;
  FPItemPredicate(&v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FPQueryCollection initWithQueryDescriptorClass:predicate:]([FPQueryCollection alloc], "initWithQueryDescriptorClass:predicate:", objc_opt_class(), v5);
  objc_msgSend(MEMORY[0x1E0C99D20], "fp_sortDescriptorByLastUsedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItemCollection reorderItemsWithSortDescriptors:](v6, "reorderItemsWithSortDescriptors:", v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("all items for %@"), v4, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPQueryCollection setDescriptionName:](v6, "setDescriptionName:", v8);

  return v6;
}

uint64_t __42__FPItemManager_newCollectionForProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "providerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)newTagCollection
{
  void *v2;
  FPQueryCollection *v3;

  FPItemPredicate(&__block_literal_global_54_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[FPQueryCollection initWithQueryDescriptorClass:predicate:]([FPQueryCollection alloc], "initWithQueryDescriptorClass:predicate:", objc_opt_class(), v2);
  -[FPQueryCollection setDescriptionName:](v3, "setDescriptionName:", CFSTR("all tagged files"));

  return v3;
}

BOOL __33__FPItemManager_newTagCollection__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "tags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)newCollectionForTag:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  FPQueryCollection *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  id v14;

  v3 = a3;
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __37__FPItemManager_newCollectionForTag___block_invoke;
  v13 = &unk_1E444FA08;
  v14 = v4;
  v5 = v4;
  FPItemPredicate(&v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FPQueryCollection initWithQueryDescriptorClass:predicate:]([FPQueryCollection alloc], "initWithQueryDescriptorClass:predicate:", objc_opt_class(), v6);
  -[FPQueryCollection setTagIdentifier:](v7, "setTagIdentifier:", v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("files tagged %@"), v3, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPQueryCollection setDescriptionName:](v7, "setDescriptionName:", v8);
  return v7;
}

uint64_t __37__FPItemManager_newCollectionForTag___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a2, "tagData", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FPGetTagsFromTagsData(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "label");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lowercaseString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if ((v11 & 1) != 0)
        {
          v12 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

uint64_t __41__FPItemManager_newSharedItemsCollection__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isTrashed") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isShared");

  return v3;
}

- (id)newSearchTrashCollection
{
  return objc_alloc_init(FPSearchTrashCollection);
}

+ (BOOL)isAnyDocumentRecentlyUsed:(id)a3 excludedFileTypes:(id)a4 allowedFileProviderIdentifiers:(id)a5
{
  return FPIsAnyDocumentRecentlyUsed(a3, a4, a5);
}

- (id)thumbnailsFetchOperationForItems:(id)a3 withSize:(CGSize)a4 scale:(double)a5
{
  double height;
  double width;
  id v9;
  FPFetchThumbnailsOperation *v10;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = -[FPFetchThumbnailsOperation initWithItems:desiredSize:screenScale:itemManager:]([FPFetchThumbnailsOperation alloc], "initWithItems:desiredSize:screenScale:itemManager:", v9, self, width, height, a5);

  return v10;
}

- (id)thumbnailsFetchOperationForItem:(id)a3 withVersions:(id)a4 withSize:(CGSize)a5 scale:(double)a6
{
  double height;
  double width;
  id v11;
  id v12;
  FPFetchThumbnailsOperation *v13;

  height = a5.height;
  width = a5.width;
  v11 = a4;
  v12 = a3;
  v13 = -[FPFetchThumbnailsOperation initWithItem:versions:desiredSize:screenScale:itemManager:]([FPFetchThumbnailsOperation alloc], "initWithItem:versions:desiredSize:screenScale:itemManager:", v12, v11, self, width, height, a6);

  return v13;
}

- (void)fetchURLForItem:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  int v10;
  FPItemID *v11;
  FPItemID *v12;
  void *v13;
  void *v14;
  void *v15;
  FPItemID *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);

  v6 = a4;
  v8 = a3;
  __FPMakeAsyncCompletionBlock((id *)&self->super.isa, a5);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isPlaceholder");
  objc_msgSend(v8, "fileURL");
  v11 = (FPItemID *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v10)
  {
    if (v6 || !v11)
    {
      objc_msgSend(v8, "itemID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __80__FPItemManager_fetchURLForItem_creatingPlaceholderIfMissing_completionHandler___block_invoke;
      v20[3] = &unk_1E444FA30;
      v21 = v8;
      v22 = v9;
      -[FPItemManager _fetchURLForItemID:creatingPlaceholderIfMissing:completionHandlerWithInfo:](self, "_fetchURLForItemID:creatingPlaceholderIfMissing:completionHandlerWithInfo:", v14, v6, v20);

    }
    else
    {
      ((void (**)(_QWORD, FPItemID *, _QWORD))v9)[2](v9, v11, 0);
    }
    goto LABEL_11;
  }

  if (!v12)
  {
    objc_msgSend(v8, "placeholderIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(v8, "itemIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      FPItemNotFoundError((uint64_t)v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v19);

      goto LABEL_4;
    }
    v16 = [FPItemID alloc];
    objc_msgSend(v8, "providerDomainID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "placeholderIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[FPItemID initWithProviderDomainID:itemIdentifier:](v16, "initWithProviderDomainID:itemIdentifier:", v17, v18);

    -[FPItemManager _fetchURLForItemID:creatingPlaceholderIfMissing:completionHandler:](self, "_fetchURLForItemID:creatingPlaceholderIfMissing:completionHandler:", v12, 0, v9);
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v8, "fileURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v13, 0);
LABEL_4:

LABEL_12:
}

void __80__FPItemManager_fetchURLForItem_creatingPlaceholderIfMissing_completionHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a4;
  if (v8 && (a3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setFileURL:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchURLForItem:(id)a3 completionHandler:(id)a4
{
  -[FPItemManager fetchURLForItem:creatingPlaceholderIfMissing:completionHandler:](self, "fetchURLForItem:creatingPlaceholderIfMissing:completionHandler:", a3, 1, a4);
}

- (id)evictItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:completionHandler:", v6, 1, 0, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)fetchIndexPropertiesForItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;

  v6 = a3;
  v7 = a4;
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    -[FPItemManager fetchIndexPropertiesForItemAtURL:completionHandler:].cold.1(v6);

  __FPMakeAsyncCompletionBlock((id *)&self->super.isa, v7);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  FPNotSupportedError();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, void *))v9)[2](v9, 0, 0, 0, v10);

}

- (void)fetchFSItemsForItemIdentifiers:(id)a3 providerIdentifier:(id)a4 domainIdentifier:(id)a5 materializingIfNeeded:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a6;
  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fetchFSItemsForItemIdentifiers:providerIdentifier:domainIdentifier:materializingIfNeeded:completionHandler:", v14, v13, v12, v7, v11);

}

- (void)extendBookmarkForItem:(id)a3 receivingBundleID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v8 = a4;
  v9 = a3;
  __FPMakeAsyncCompletionBlock((id *)&self->super.isa, a5);
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] cannot extend bookmark for nil item", v15, 2u);
    }

    FPItemNotFoundError(0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v10)[2](v10, 0, v12);

  }
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "extendBookmarkForItemID:consumerID:completionHandler:", v14, v8, v10);
}

- (void)_fetchParentsForItemID:(id)a3 recursively:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__FPItemManager__fetchParentsForItemID_recursively_completionHandler___block_invoke;
  v10[3] = &unk_1E444E840;
  v11 = v8;
  v9 = v8;
  -[FPItemManager _fetchHierarchyForItemID:recursively:completionHandler:](self, "_fetchHierarchyForItemID:recursively:completionHandler:", a3, v5, v10);

}

void __70__FPItemManager__fetchParentsForItemID_recursively_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = objc_msgSend(v9, "count");
  v7 = *(_QWORD *)(a1 + 32);
  if (v6 < 2)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, MEMORY[0x1E0C9AA60], v5);
  }
  else
  {
    objc_msgSend(v9, "subarrayWithRange:", 1, objc_msgSend(v9, "count") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);

  }
}

- (void)_fetchHierarchyForItemID:(id)a3 recursively:(BOOL)a4 completionHandler:(id)a5
{
  -[FPItemManager _fetchHierarchyForItemID:recursively:depth:completionHandler:](self, "_fetchHierarchyForItemID:recursively:depth:completionHandler:", a3, a4, 0, a5);
}

- (void)_fetchHierarchyForItemID:(id)a3 recursively:(BOOL)a4 depth:(unint64_t)a5 completionHandler:(id)a6
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  FPItemManager *v33;
  id v34;
  unint64_t v35;
  BOOL v36;

  v11 = a3;
  v18 = a6;
  if (v11)
  {
    if (a5 < 6)
    {
      objc_msgSend(v11, "providerDomainID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __78__FPItemManager__fetchHierarchyForItemID_recursively_depth_completionHandler___block_invoke;
      v31[3] = &unk_1E444FAA8;
      v34 = v18;
      v36 = a4;
      v32 = v11;
      v33 = self;
      v35 = a5;
      -[FPItemManager fetchOperationServiceForProviderDomainID:handler:](self, "fetchOperationServiceForProviderDomainID:handler:", v30, v31);

      goto LABEL_9;
    }
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    fp_simulate_crash(CFSTR("Recursion too deep in %@"), v20, v21, v22, v23, v24, v25, v26, (uint64_t)v19);

    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      -[FPItemManager _fetchHierarchyForItemID:recursively:depth:completionHandler:].cold.1(a2);

    v28 = CFSTR("depth");
  }
  else
  {
    v28 = CFSTR("itemID");
  }
  FPInvalidParameterError((uint64_t)v28, 0, v12, v13, v14, v15, v16, v17);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v18 + 2))(v18, 0, v29);

LABEL_9:
}

void __78__FPItemManager__fetchHierarchyForItemID_recursively_depth_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  char v12;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(a2, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(unsigned __int8 *)(a1 + 64);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78__FPItemManager__fetchHierarchyForItemID_recursively_depth_completionHandler___block_invoke_2;
    v9[3] = &unk_1E444FA80;
    v12 = v5;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v9[4] = *(_QWORD *)(a1 + 40);
    v11 = v7;
    v10 = v8;
    objc_msgSend(v4, "fetchHierarchyForItemID:recursively:ignoreAlternateContentURL:reply:", v6, v5, 0, v9);

  }
}

void __78__FPItemManager__fetchHierarchyForItemID_recursively_depth_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  FPItemID *v15;
  void *v16;
  void *v17;
  void *v18;
  FPItemID *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v5 = a2;
  v6 = a3;
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v5, "count") - 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPItemManager _promoteItemToAppLibraryIfNeeded:](FPItemManager, "_promoteItemToAppLibraryIfNeeded:", v7);

  }
  objc_msgSend(v5, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_8;
  objc_msgSend(v8, "fp_parentDomainIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_8;
  v11 = (void *)v10;
  objc_msgSend(v9, "fp_parentDomainIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "domainIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if (v6 || (v14 & 1) != 0)
  {
LABEL_8:
    if (v5)
      v23 = v5;
    else
      v23 = (id)MEMORY[0x1E0C9AA60];
    (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v23, v6);
  }
  else
  {
    v15 = [FPItemID alloc];
    objc_msgSend(v9, "providerID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fp_parentDomainIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parentItemIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[FPItemID initWithProviderID:domainIdentifier:itemIdentifier:](v15, "initWithProviderID:domainIdentifier:itemIdentifier:", v16, v17, v18);

    v20 = *(unsigned __int8 *)(a1 + 56);
    v21 = *(_QWORD *)(a1 + 48) + 1;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __78__FPItemManager__fetchHierarchyForItemID_recursively_depth_completionHandler___block_invoke_3;
    v24[3] = &unk_1E444C7F0;
    v22 = *(void **)(a1 + 32);
    v26 = *(id *)(a1 + 40);
    v25 = v5;
    objc_msgSend(v22, "_fetchHierarchyForItemID:recursively:depth:completionHandler:", v19, v20, v21, v24);

  }
}

void __78__FPItemManager__fetchHierarchyForItemID_recursively_depth_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __78__FPItemManager__fetchHierarchyForItemID_recursively_depth_completionHandler___block_invoke_3_cold_1(a1);

    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

  }
}

- (void)fetchParentForItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  objc_msgSend(a3, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__FPItemManager_fetchParentForItem_completionHandler___block_invoke;
  v9[3] = &unk_1E444E840;
  v10 = v6;
  v8 = v6;
  -[FPItemManager _fetchParentsForItemID:recursively:completionHandler:](self, "_fetchParentsForItemID:recursively:completionHandler:", v7, 0, v9);

}

void __54__FPItemManager_fetchParentForItem_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)fetchAllParentsForItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "itemID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FPItemManager _fetchParentsForItemID:recursively:completionHandler:](self, "_fetchParentsForItemID:recursively:completionHandler:", v7, 1, v6);

}

- (void)fetchPathComponentsForURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;
  NSObject *v9;
  id v10;
  OS_dispatch_queue *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(_QWORD, _QWORD, _QWORD);
  id v16;

  v6 = a3;
  __FPMakeAsyncCompletionBlock((id *)&self->super.isa, a4);
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v6, "getResourceValue:forKey:error:", &v16, CFSTR("FPOriginalDocumentURL"), 0);
  v8 = v16;
  if (v8)
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[FPItemManager _fetchItemForURL:synchronously:skipURLValidation:completionHandler:].cold.1((uint64_t)v8);

    v10 = v8;
    v6 = v10;
  }
  v11 = self->_completionQueue;
  if (FPURLMightBeInFileProvider(v6))
  {
    +[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "connectionProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__FPItemManager_fetchPathComponentsForURL_completionHandler___block_invoke;
    v14[3] = &unk_1E444E840;
    v15 = v7;
    objc_msgSend(v13, "fetchPathComponentsForURL:completionHandler:", v6, v14);

  }
  else
  {
    v7[2](v7, 0, 0);
  }

}

uint64_t __61__FPItemManager_fetchPathComponentsForURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchRootItemForProviderDomain:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPItemID rootItemIDWithProviderDomainID:](FPItemID, "rootItemIDWithProviderDomainID:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[FPItemManager fetchItemForItemID:completionHandler:](self, "fetchItemForItemID:completionHandler:", v8, v6);
}

- (void)fetchDefaultLocationForApplication:(id)a3 defaultProviderDomain:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "correspondingApplicationRecord");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[FPItemManager fetchDefaultLocationForApplicationRecord:defaultProviderDomain:completionHandler:](self, "fetchDefaultLocationForApplicationRecord:defaultProviderDomain:completionHandler:", v10, v9, v8);

}

- (void)fetchDefaultLocationForApplicationRecord:(id)a3 defaultProviderDomain:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[FPFetchDefaultContainerOperation initForApplicationRecord:providerDomain:]([FPFetchDefaultContainerOperation alloc], "initForApplicationRecord:providerDomain:", v10, v9);

  objc_msgSend(v11, "setFetchCompletionBlock:", v8);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v11);

}

- (BOOL)_isValidDestination:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isPending") & 1) != 0 || !objc_msgSend(v3, "isFolder"))
    LOBYTE(v4) = 0;
  else
    v4 = ((unint64_t)objc_msgSend(v3, "capabilities") >> 1) & 1;

  return v4;
}

- (id)eligibleActionsForDroppingItems:(id)a3 underItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  id v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "providerDomainID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") && -[FPItemManager _isValidDestination:](self, "_isValidDestination:", v7))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("Move"), CFSTR("Copy"), CFSTR("Untrash"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v9 = v6;
    v29 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v29)
    {
      v26 = v6;
      obj = v9;
      v28 = *(_QWORD *)v32;
      v10 = 1;
LABEL_5:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
        if ((objc_msgSend(v12, "isPending") & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v24 = (id)objc_claimAutoreleasedReturnValue();

          v6 = v26;
          goto LABEL_37;
        }
        objc_msgSend(v12, "providerDomainID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v30);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v8, "removeObject:", CFSTR("Move"));
          objc_msgSend(v8, "removeObject:", CFSTR("Untrash"));
        }
        if ((objc_msgSend(v12, "capabilities") & 0x20) != 0)
          goto LABEL_17;
        objc_msgSend(v12, "providerDomainID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", v30))
        {
          v16 = objc_msgSend(v7, "isExcludedFromSync");

          if ((v16 & 1) == 0)
            goto LABEL_17;
        }
        else
        {

        }
        objc_msgSend(v8, "removeObject:", CFSTR("Move"));
        objc_msgSend(v8, "removeObject:", CFSTR("Untrash"));
LABEL_17:
        objc_msgSend(v12, "itemID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "itemID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqualToItemID:", v18);

        if (v19)
        {
          objc_msgSend(v8, "removeObject:", CFSTR("Move"));
          objc_msgSend(v8, "removeObject:", CFSTR("Copy"));
        }
        if ((objc_msgSend(v12, "capabilities") & 4) == 0)
          objc_msgSend(v8, "removeObject:", CFSTR("Move"));
        if ((objc_msgSend(v12, "capabilities") & 1) == 0)
          objc_msgSend(v8, "removeObject:", CFSTR("Copy"));
        if (-[FPItemManager isItemInTrash:](self, "isItemInTrash:", v12))
          v20 = CFSTR("Move");
        else
          v20 = CFSTR("Untrash");
        objc_msgSend(v8, "removeObject:", v20);
        objc_msgSend(v12, "parentItemID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "itemID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqualToItemID:", v22);

        v10 &= v23;
        if (v29 == ++v11)
        {
          v9 = obj;
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (v29)
            goto LABEL_5;

          v6 = v26;
          if (!v10)
            goto LABEL_34;
          goto LABEL_33;
        }
      }
    }

LABEL_33:
    objc_msgSend(v8, "removeObject:", CFSTR("Move"));
LABEL_34:
    if (objc_msgSend(v8, "count"))
      FPFilterActionsForDroppingItems(v9, v7, v8);
    v24 = v8;
LABEL_37:

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (id)eligibleActionsForDroppingUTIs:(id)a3 underItem:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (!-[FPItemManager _isValidDestination:](self, "_isValidDestination:", v7))
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    goto LABEL_5;
  }
  v8 = FPAreUTIsImportable(v6, v7);
  v9 = (void *)MEMORY[0x1E0C99E60];
  if ((v8 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(v9, "set");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Move"), CFSTR("Copy"), 0);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v11 = (void *)v10;

  return v11;
}

- (id)operationForAction:(id)a3 items:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __objc2_class *v14;
  FPUntrashOperation *v15;
  FPFetchPublishingURLOperation *v16;
  FPDownloadOperation *v17;
  uint64_t v18;
  FPFetchPublishingURLOperation *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12), "state") & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItemManager.m"), 1150, CFSTR("this operation isn't supported for placeholder items"));

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Delete")))
  {
    v14 = FPDeleteOperation;
    goto LABEL_12;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Download")))
  {
    v17 = -[FPDownloadOperation initWithItems:]([FPDownloadOperation alloc], "initWithItems:", v8);
    v16 = (FPFetchPublishingURLOperation *)v17;
    v18 = 0;
LABEL_18:
    -[FPDownloadOperation setRecursively:](v17, "setRecursively:", v18);
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("DownloadRecursively")))
  {
    v17 = -[FPDownloadOperation initWithItems:]([FPDownloadOperation alloc], "initWithItems:", v8);
    v16 = (FPFetchPublishingURLOperation *)v17;
    v18 = 1;
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Evict")))
  {
    v14 = FPEvictOperation;
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("Trash")))
  {
    v14 = FPTrashOperation;
  }
  else
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("Untrash")))
    {
      v15 = -[FPUntrashOperation initWithItems:restoreDirectory:]([FPUntrashOperation alloc], "initWithItems:restoreDirectory:", v8, 0);
      goto LABEL_13;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("FetchPublishingURL")))
    {
      v20 = [FPFetchPublishingURLOperation alloc];
      objc_msgSend(v8, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[FPFetchPublishingURLOperation initWithItem:](v20, "initWithItem:", v21);

      goto LABEL_19;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("ExcludeFromSync")))
    {
      v14 = FPIgnoreItemsOperation;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("Unignore")))
    {
      v14 = FPUnignoreItemsOperation;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("Pin")))
    {
      v14 = FPPinOperation;
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("Unpin")))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItemManager.m"), 1179, CFSTR("UNREACHABLE: build your own %@ operation!"), v7);

        v16 = 0;
        goto LABEL_19;
      }
      v14 = FPUnpinOperation;
    }
  }
LABEL_12:
  v15 = (FPUntrashOperation *)objc_msgSend([v14 alloc], "initWithItems:", v8);
LABEL_13:
  v16 = (FPFetchPublishingURLOperation *)v15;
LABEL_19:

  return v16;
}

- (void)scheduleAction:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t section;

  v4 = a3;
  section = __fp_create_section();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPItemManager scheduleAction:].cold.1(&section);

  objc_msgSend(v4, "presendNotifications");
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v4);
  __fp_leave_section_Debug((uint64_t)&section);

}

- (void)recursivelyExportItem:(id)a3 toURL:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  FPCopyOperation *v16;
  void *v17;
  FPCopyOperation *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItemManager.m"), 1200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

    if (v12)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!v11)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItemManager.m"), 1201, CFSTR("%s must be called with completion handler"), "-[FPItemManager recursivelyExportItem:toURL:completionHandler:]");

  }
LABEL_4:
  objc_msgSend(v10, "URLByDeletingLastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [FPCopyOperation alloc];
  v26[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[FPMoveOperation initWithItems:destinationURL:](v16, "initWithItems:destinationURL:", v17, v14);

  v24 = v9;
  v25 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPMoveOperation setTargetFilenamesByItem:](v18, "setTargetFilenamesByItem:", v19);

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __63__FPItemManager_recursivelyExportItem_toURL_completionHandler___block_invoke;
  v22[3] = &unk_1E4449A88;
  v23 = v12;
  v20 = v12;
  -[FPActionOperation setActionCompletionBlock:](v18, "setActionCompletionBlock:", v22);
  -[FPItemManager scheduleAction:](self, "scheduleAction:", v18);

}

uint64_t __63__FPItemManager_recursivelyExportItem_toURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchRemoteDomainForProviderDomainID:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  +[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__FPItemManager_fetchRemoteDomainForProviderDomainID_handler___block_invoke;
  v9[3] = &unk_1E444FB18;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "fetchDomainServicerForProviderDomainID:handler:", v6, v9);

}

void __62__FPItemManager_fetchRemoteDomainForProviderDomainID_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  FPXPCAutomaticErrorProxy *v12;
  id v13;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a4;
  v9 = a2;
  objc_msgSend(a3, "fp_obfuscatedProviderDomainID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromProtocol((Protocol *)&unk_1EE5F7E00);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("proxy to %@ for interface %@"), v10, v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = -[FPXPCAutomaticErrorProxy initWithConnection:protocol:orError:name:requestPid:]([FPXPCAutomaticErrorProxy alloc], "initWithConnection:protocol:orError:name:requestPid:", v9, &unk_1EE5F7E00, 0, v13, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchVendorServiceForProviderDomainID:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__FPItemManager_fetchVendorServiceForProviderDomainID_handler___block_invoke;
  v9[3] = &unk_1E444FB68;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "startAccessingExtensionForProviderDomainID:handler:", v6, v9);

}

void __63__FPItemManager_fetchVendorServiceForProviderDomainID_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  FPService *v11;
  void *v12;
  FPService *v13;
  id v14;

  v14 = a2;
  v9 = a3;
  v10 = a4;
  if (!v14 || a5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v11 = [FPService alloc];
    FPXVendorXPCInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[FPService initWithEndpoint:interface:lifetimeExtender:providerDomainID:](v11, "initWithEndpoint:interface:lifetimeExtender:providerDomainID:", v14, v12, v9, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)fetchServicesWithName:(id)a3 itemAtURL:(id)a4 synchronously:(BOOL)a5 handler:(id)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  if (v6)
    +[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy");
  else
    +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__FPItemManager_fetchServicesWithName_itemAtURL_synchronously_handler___block_invoke;
  v14[3] = &unk_1E444FB90;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "startAccessingServiceWithName:itemURL:completionHandler:", v11, v10, v14);

}

void __71__FPItemManager_fetchServicesWithName_itemAtURL_synchronously_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  FPService *v14;
  void *v15;
  FPService *v16;
  id v17;

  v17 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v17 || a6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v14 = [FPService alloc];
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5D4C98);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[FPService initWithEndpoint:interface:lifetimeExtender:providerDomainID:](v14, "initWithEndpoint:interface:lifetimeExtender:providerDomainID:", v17, v15, v11, v12);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)servicesForItemAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v21;
  _QWORD block[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(_QWORD *, void *, void *, void *);
  void *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__29;
  v50 = __Block_byref_object_dispose__29;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__29;
  v44 = __Block_byref_object_dispose__29;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__29;
  v38 = __Block_byref_object_dispose__29;
  v39 = 0;
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __44__FPItemManager_servicesForItemAtURL_error___block_invoke;
  v30 = &unk_1E444FBB8;
  v31 = &v40;
  v32 = &v34;
  v33 = &v46;
  v21 = v6;
  -[FPItemManager fetchServicesWithName:itemAtURL:synchronously:handler:](self, "fetchServicesWithName:itemAtURL:synchronously:handler:", 0);
  if (v41[5] && v35[5] && !v47[5])
  {
    v8 = dispatch_group_create();
    v9 = objc_alloc(MEMORY[0x1E0C99E08]);
    v10 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend((id)v35[5], "count"));
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = (id)v35[5];
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v52, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v16 = objc_alloc(MEMORY[0x1E0CB3630]);
          objc_msgSend((id)v41[5], "remoteObjectProxyCreating");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithName:endpointCreatingProxy:requestFinishedGroup:", v15, v17, v8);

          objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v15);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v52, 16);
      }
      while (v12);
    }

    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__FPItemManager_servicesForItemAtURL_error___block_invoke_2;
    block[3] = &unk_1E444B188;
    block[4] = &v40;
    dispatch_group_notify(v8, v19, block);

    v7 = (void *)objc_msgSend(v10, "copy");
  }
  else
  {
    v7 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)v47[5]);
  }
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v7;
}

void __44__FPItemManager_servicesForItemAtURL_error___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v17 = v7;

  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;

}

uint64_t __44__FPItemManager_servicesForItemAtURL_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCollections, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)fetchIndexPropertiesForItemAtURL:(void *)a1 completionHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_6(&dword_1A0A34000, v2, v3, "[CRIT] Deprecated method fetchIndexPropertiesForItemAtURL used for %@.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_1();
}

- (void)_fetchItemForURL:(uint64_t)a1 synchronously:skipURLValidation:completionHandler:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v1, v2, "[DEBUG] found %@ as original URL to %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (void)_fetchHierarchyForItemID:(const char *)a1 recursively:depth:completionHandler:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_6(&dword_1A0A34000, v2, v3, "[SIMCRASH] Recursion too deep in %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_1();
}

void __78__FPItemManager__fetchHierarchyForItemID_recursively_depth_completionHandler___block_invoke_3_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v1, v2, "[DEBUG] adding %@ to %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (void)eligibleActionsForItems:(NSObject *)a3 domainCachePolicy:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Failed to fetch domain for FPItem %@, error: %@", (uint8_t *)&v6, 0x16u);

}

- (void)scheduleAction:(_QWORD *)a1 .cold.1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v1, v2, "[DEBUG] ┏%llx scheduling action: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

@end
