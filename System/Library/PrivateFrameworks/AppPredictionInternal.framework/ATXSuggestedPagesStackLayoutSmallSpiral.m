@implementation ATXSuggestedPagesStackLayoutSmallSpiral

- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
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
  id v21;
  id v22;
  id v23;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[3];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  if ((objc_msgSend(MEMORY[0x1E0D81588], "isiPad") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (!objc_msgSend(v15, "size"))
            objc_msgSend(v9, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v12);
    }

    if ((unint64_t)objc_msgSend(v9, "count") >= 3)
    {
      v16 = (void *)objc_opt_new();
      v17 = (void *)objc_opt_new();
      v18 = (void *)objc_opt_new();
      +[ATXSuggestedPagesUtils createSmallStack](ATXSuggestedPagesUtils, "createSmallStack");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXSuggestedPagesUtils createSmallStack](ATXSuggestedPagesUtils, "createSmallStack");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXSuggestedPagesUtils createSmallStack](ATXSuggestedPagesUtils, "createSmallStack");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXSuggestedPagesUtils sortWidgetsByDescendingScore:limit:](ATXSuggestedPagesUtils, "sortWidgetsByDescendingScore:limit:", v9, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __86__ATXSuggestedPagesStackLayoutSmallSpiral_makeStacksFromWidgets_pageType_environment___block_invoke;
      v27[3] = &unk_1E82E7EE0;
      v28 = v17;
      v29 = v18;
      v30 = v16;
      v31 = v7;
      v21 = v16;
      v22 = v18;
      v23 = v17;
      objc_msgSend(v26, "enumerateObjectsUsingBlock:", v27);
      objc_msgSend(v25, "setWidgets:", v21);
      objc_msgSend(v19, "setWidgets:", v23);
      objc_msgSend(v20, "setWidgets:", v22);
      v36[0] = v25;
      v36[1] = v19;
      v36[2] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

void __86__ATXSuggestedPagesStackLayoutSmallSpiral_makeStacksFromWidgets_pageType_environment___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  unint64_t v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  if (a3 == 2)
  {
    v5 = a1 + 5;
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    v5 = a1 + 4;
LABEL_6:
    objc_msgSend(*v5, "addObject:", v11);
    v10 = v11;
    goto LABEL_7;
  }
  v6 = a1[6];
  v5 = a1 + 6;
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(v5[1], "tunableConstants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "maxWidgetsInStack");

  v10 = v11;
  if (v7 < v9)
    goto LABEL_6;
LABEL_7:

}

- (void)layOutStacks:(id)a3 numberOfColumns:(unint64_t)a4 forPageType:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a3;
  if (objc_msgSend(v7, "count") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXSuggestedPagesStackLayoutSmallSpiral.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stacks.count == 3"));

  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCoordinateRow:", 0);

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCoordinateColumn:", 0);

  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCoordinateRow:", 2);

  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCoordinateColumn:", 2);

  objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCoordinateRow:", 4);

  objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setCoordinateColumn:", 0);
}

- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3
{
  return 3;
}

- (unint64_t)minNecessaryLeafIconsForPageType:(int64_t)a3
{
  return 12;
}

- (unint64_t)maxAppRowsForPageType:(int64_t)a3
{
  return 0;
}

@end
