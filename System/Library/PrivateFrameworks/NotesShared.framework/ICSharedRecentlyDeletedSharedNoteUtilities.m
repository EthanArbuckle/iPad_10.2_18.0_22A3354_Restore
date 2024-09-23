@implementation ICSharedRecentlyDeletedSharedNoteUtilities

+ (void)showAlertsIfNecessaryForDeletingSharedNotes:(id)a3 noteDeleteType:(unint64_t)a4 displayWindow:(id)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(id, uint64_t);
  uint64_t v12;
  id v13;

  v13 = a3;
  v10 = a5;
  v11 = (void (**)(id, uint64_t))a6;
  if (a4 || (v12 = objc_msgSend(a1, "sharedNoteTypeForNotes:", v13), v12 == 1))
  {
    if (v11)
      v11[2](v11, 1);
  }
  else
  {
    objc_msgSend(a1, "showDeletingSharedNotesAlertWithType:displayWindow:completionHandler:", v12, v10, v11);
  }

}

+ (id)titleForSharedNotesType:(unint64_t)a3
{
  return 0;
}

+ (id)messageForSharedNotesType:(unint64_t)a3
{
  return 0;
}

+ (unint64_t)sharedNoteTypeForNotes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  unint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  id v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "notesSharedViaICloudFromNotes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    v11 = 1;
    goto LABEL_35;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (!v7)
    goto LABEL_10;
  v8 = v7;
  v9 = *(_QWORD *)v35;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v35 != v9)
        objc_enumerationMutation(v6);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "isSharedRootObject") & 1) != 0)
      {

        v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v14 = v6;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v31 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
              if (objc_msgSend(v19, "isOwnedByCurrentUser", (_QWORD)v30))
              {
                v20 = v12;
                v21 = v19;
              }
              else
              {
                v20 = v13;
                v21 = v4;
              }
              objc_msgSend(v20, "addObject:", v21);
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v16);
        }

        if (objc_msgSend(v4, "count") == 1)
        {
          v22 = objc_msgSend(v12, "count") == 1;
          v23 = 7;
          v24 = 4;
        }
        else
        {
          v25 = objc_msgSend(v4, "count");
          v26 = objc_msgSend(v14, "count");
          v27 = objc_msgSend(v12, "count");
          if (v25 == v26)
          {
            if (v27 == objc_msgSend(v14, "count"))
            {
              v11 = 5;
LABEL_34:

              goto LABEL_35;
            }
            v28 = objc_msgSend(v13, "count");
            v22 = v28 == objc_msgSend(v14, "count");
            v23 = 5;
            v24 = 8;
          }
          else
          {
            v22 = v27 == 0;
            v23 = 6;
            v24 = 9;
          }
        }
        if (v22)
          v11 = v24;
        else
          v11 = v23;
        goto LABEL_34;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v8)
      continue;
    break;
  }
LABEL_10:

  if (objc_msgSend(v6, "count") == 1)
    v11 = 2;
  else
    v11 = 3;
LABEL_35:

  return v11;
}

+ (id)notesSharedViaICloudFromNotes:(id)a3
{
  return (id)objc_msgSend(a3, "ic_objectsPassingTest:", &__block_literal_global_31);
}

uint64_t __76__ICSharedRecentlyDeletedSharedNoteUtilities_notesSharedViaICloudFromNotes___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_class();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "isSharedViaICloud");
  else
    v4 = 0;

  return v4;
}

@end
