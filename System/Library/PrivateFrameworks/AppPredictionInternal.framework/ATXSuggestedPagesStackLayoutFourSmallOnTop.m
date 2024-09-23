@implementation ATXSuggestedPagesStackLayoutFourSmallOnTop

- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (a4 == 4 || (objc_msgSend(MEMORY[0x1E0D81588], "isiPad") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (!objc_msgSend(v16, "size"))
            objc_msgSend(v10, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v13);
    }

    if ((unint64_t)objc_msgSend(v10, "count") >= 4)
    {
      +[ATXSuggestedPagesUtils createSmallStack](ATXSuggestedPagesUtils, "createSmallStack");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXSuggestedPagesUtils createSmallStack](ATXSuggestedPagesUtils, "createSmallStack");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXSuggestedPagesUtils createSmallStack](ATXSuggestedPagesUtils, "createSmallStack");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXSuggestedPagesUtils createSmallStack](ATXSuggestedPagesUtils, "createSmallStack");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v17;
      v30[1] = v18;
      v30[2] = v19;
      v30[3] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXSuggestedPagesUtils sortWidgetsByDescendingScore:limit:](ATXSuggestedPagesUtils, "sortWidgetsByDescendingScore:limit:", v10, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __89__ATXSuggestedPagesStackLayoutFourSmallOnTop_makeStacksFromWidgets_pageType_environment___block_invoke;
      v24[3] = &unk_1E82E2790;
      v9 = v21;
      v25 = v9;
      objc_msgSend(v22, "enumerateObjectsUsingBlock:", v24);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

void __89__ATXSuggestedPagesStackLayoutFourSmallOnTop_makeStacksFromWidgets_pageType_environment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a2;
  objc_msgSend(v5, "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3, v9, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setWidgets:", v7);
}

- (void)layOutStacks:(id)a3 numberOfColumns:(unint64_t)a4 forPageType:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a3;
  if (objc_msgSend(v7, "count") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXSuggestedPagesStackLayoutFourSmallOnTop.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stacks.count == 4"));

  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assignWidgetSpaceCoordinateWithRow:column:", 0, 0);

  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assignWidgetSpaceCoordinateWithRow:column:", 0, 1);

  objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assignWidgetSpaceCoordinateWithRow:column:", 1, 0);

  objc_msgSend(v7, "objectAtIndexedSubscript:", 3);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "assignWidgetSpaceCoordinateWithRow:column:", 1, 1);
}

- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3
{
  return 4;
}

- (unint64_t)minNecessaryLeafIconsForPageType:(int64_t)a3
{
  return 0;
}

- (unint64_t)maxAppRowsForPageType:(int64_t)a3
{
  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad", a3))
    return 3;
  else
    return 1;
}

@end
