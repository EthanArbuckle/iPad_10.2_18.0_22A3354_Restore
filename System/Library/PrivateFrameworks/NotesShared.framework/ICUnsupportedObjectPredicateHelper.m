@implementation ICUnsupportedObjectPredicateHelper

+ (id)predicateForSupportedFoldersInContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "unsupportedFolderIdentifiersWithContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("NOT (identifier IN %@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForSupportedNotesInContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("minimumSupportedNotesVersion <= %d"), +[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "unsupportedFolderIdentifiersWithContext:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "predicateWithFormat:", CFSTR("NOT (folder.identifier IN %@)"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3528];
  v14[0] = v6;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)predicateForSupportedAttachmentsInContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = a3;
  objc_msgSend(a1, "unsupportedAttachmentIdentifiersWithContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("NOT (identifier IN %@)"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("note.minimumSupportedNotesVersion <= %d"), +[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "unsupportedFolderIdentifiersWithContext:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "predicateWithFormat:", CFSTR("NOT (note.folder.identifier IN %@)"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3528];
  v16[0] = v7;
  v16[1] = v8;
  v16[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)predicateForSupportedInlineAttachmentsInContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = a3;
  objc_msgSend(a1, "unsupportedInlineAttachmentIdentifiersWithContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("NOT (identifier IN %@)"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("note.minimumSupportedNotesVersion <= %d"), +[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "unsupportedFolderIdentifiersWithContext:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "predicateWithFormat:", CFSTR("NOT (note.folder.identifier IN %@)"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3528];
  v16[0] = v7;
  v16[1] = v8;
  v16[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (void)recursivelyAddFolder:(id)a3 toMutableSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "markedForDeletion") & 1) == 0 && (objc_msgSend(v6, "needsInitialFetchFromCloud") & 1) == 0)
  {
    objc_msgSend(v7, "addObject:", v6);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v6, "children", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(a1, "recursivelyAddFolder:toMutableSet:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), v7);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

+ (id)unsupportedFolderIdentifiersWithContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__47;
  v16 = __Block_byref_object_dispose__47;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__ICUnsupportedObjectPredicateHelper_unsupportedFolderIdentifiersWithContext___block_invoke;
  v8[3] = &unk_1E76C9E70;
  v5 = v4;
  v10 = &v12;
  v11 = a1;
  v9 = v5;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = (void *)objc_msgSend((id)v13[5], "copy");

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __78__ICUnsupportedObjectPredicateHelper_unsupportedFolderIdentifiersWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  +[ICFolder predicateForVisibleObjects](ICFolder, "predicateForVisibleObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("minimumSupportedNotesVersion > %d"), +[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICFolder ic_objectsMatchingPredicate:context:](ICFolder, "ic_objectsMatchingPredicate:context:", v5, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 48), "recursivelyAddFolder:toMutableSet:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12++), v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v10);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v19);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

}

+ (void)recursivelyAddAttachment:(id)a3 toMutableSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "markedForDeletion") & 1) == 0 && (objc_msgSend(v6, "needsInitialFetchFromCloud") & 1) == 0)
  {
    objc_msgSend(v6, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "needsInitialFetchFromCloud");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v7, "addObject:", v6);
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      objc_msgSend(v6, "subAttachments", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(a1, "recursivelyAddAttachment:toMutableSet:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), v7);
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v12);
      }

    }
  }

}

+ (id)unsupportedAttachmentIdentifiersWithContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__47;
  v16 = __Block_byref_object_dispose__47;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__ICUnsupportedObjectPredicateHelper_unsupportedAttachmentIdentifiersWithContext___block_invoke;
  v8[3] = &unk_1E76C9E70;
  v5 = v4;
  v10 = &v12;
  v11 = a1;
  v9 = v5;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = (void *)objc_msgSend((id)v13[5], "copy");

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __82__ICUnsupportedObjectPredicateHelper_unsupportedAttachmentIdentifiersWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  +[ICBaseAttachment predicateForVisibleObjects](ICAttachment, "predicateForVisibleObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("minimumSupportedNotesVersion > %d"), +[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAttachment ic_objectsMatchingPredicate:context:](ICAttachment, "ic_objectsMatchingPredicate:context:", v5, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 48), "recursivelyAddAttachment:toMutableSet:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12++), v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v10);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v19);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

}

+ (id)unsupportedInlineAttachmentIdentifiersWithContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__47;
  v17 = __Block_byref_object_dispose__47;
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __88__ICUnsupportedObjectPredicateHelper_unsupportedInlineAttachmentIdentifiersWithContext___block_invoke;
  v10 = &unk_1E76C76B0;
  v4 = v3;
  v11 = v4;
  v12 = &v13;
  objc_msgSend(v4, "performBlockAndWait:", &v7);
  v5 = (void *)objc_msgSend((id)v14[5], "copy", v7, v8, v9, v10);

  _Block_object_dispose(&v13, 8);
  return v5;
}

void __88__ICUnsupportedObjectPredicateHelper_unsupportedInlineAttachmentIdentifiersWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  +[ICBaseAttachment predicateForVisibleObjects](ICInlineAttachment, "predicateForVisibleObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("minimumSupportedNotesVersion > %d"), +[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICInlineAttachment ic_objectsMatchingPredicate:context:](ICInlineAttachment, "ic_objectsMatchingPredicate:context:", v5, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

@end
