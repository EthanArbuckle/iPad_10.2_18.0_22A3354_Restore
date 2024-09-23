@implementation TabGroupLibrarySectionController

- (TabGroupLibrarySectionController)initWithConfiguration:(id)a3 forNamedGroups:(BOOL)a4
{
  TabGroupLibrarySectionController *v5;
  TabGroupLibrarySectionController *v6;
  TabGroupLibrarySectionController *v7;

  v5 = -[LibrarySectionController initWithConfiguration:](self, "initWithConfiguration:", a3);
  v6 = v5;
  if (v5)
  {
    v5->_showNamedGroups = a4;
    v7 = v5;
  }

  return v6;
}

- (id)itemControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int showNamedGroups;
  TabGroupLibraryItemController *v14;
  void *v15;
  TabGroupLibraryItemController *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[LibrarySectionController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabGroupProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          showNamedGroups = self->_showNamedGroups;
          if (showNamedGroups == objc_msgSend(v12, "isNamed"))
          {
            v14 = [TabGroupLibraryItemController alloc];
            -[LibrarySectionController configuration](self, "configuration");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[TabGroupLibraryItemController initWithConfiguration:sectionController:tabGroup:tab:](v14, "initWithConfiguration:sectionController:tabGroup:tab:", v15, self, v12, 0);

            objc_msgSend(v6, "addObject:", v16);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v19;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

- (id)itemControllerToHandleDropItemsFromSession:(id)a3 withProposedDestinationItemController:(id)a4 atIndex:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int64_t v17;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (a5 && v11 < 2)
  {
    objc_msgSend(v8, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "safari_localWBTab");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    if (!v14)
    {
LABEL_18:

      goto LABEL_19;
    }
    -[TabGroupLibrarySectionController _allItemControllers](self, "_allItemControllers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __125__TabGroupLibrarySectionController_itemControllerToHandleDropItemsFromSession_withProposedDestinationItemController_atIndex___block_invoke;
    v25[3] = &unk_1E9CF5538;
    v26 = v14;
    v17 = objc_msgSend(v16, "indexOfObjectPassingTest:", v25);
    v19 = v17 == 0x7FFFFFFFFFFFFFFFLL || v17 > a5;
    objc_msgSend(v16, "objectAtIndexedSubscript:", a5 - 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tab");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19 || v21)
    {
      if (!v19)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend(v20, "tab");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        goto LABEL_17;
    }
    v23 = v20;

    v15 = v23;
    goto LABEL_17;
  }
  v15 = v9;
LABEL_19:

  return v15;
}

uint64_t __125__TabGroupLibrarySectionController_itemControllerToHandleDropItemsFromSession_withProposedDestinationItemController_atIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "tab");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WBSIsEqual();

  return v3;
}

- (id)_allItemControllers
{
  void *v2;
  void *v3;
  void *v4;

  -[LibrarySectionController filteredItemControllers](self, "filteredItemControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mapObjectsUsingBlock:", &__block_literal_global_21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_flattenedArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __55__TabGroupLibrarySectionController__allItemControllers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "isExpanded"))
  {
    v8[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "subitems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "safari_arrayByAddingObjectsFromArrayIfNotDuplicates:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = v3;
  }
  else
  {
    v7 = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end
