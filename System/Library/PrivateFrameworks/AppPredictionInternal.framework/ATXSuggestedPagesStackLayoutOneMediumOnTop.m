@implementation ATXSuggestedPagesStackLayoutOneMediumOnTop

- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  v8 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v14, "size", (_QWORD)v20) == 1)
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
  {
    +[ATXSuggestedPagesUtils createMediumStack](ATXSuggestedPagesUtils, "createMediumStack");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tunableConstants");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXSuggestedPagesUtils sortWidgetsByDescendingScore:limit:](ATXSuggestedPagesUtils, "sortWidgetsByDescendingScore:limit:", v8, (int)objc_msgSend(v16, "maxWidgetsInStack"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWidgets:", v17);

    v24 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3
{
  return 1;
}

- (unint64_t)minNecessaryLeafIconsForPageType:(int64_t)a3
{
  return 0;
}

- (unint64_t)maxAppRowsForPageType:(int64_t)a3
{
  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad", a3))
    return 4;
  else
    return 3;
}

@end
