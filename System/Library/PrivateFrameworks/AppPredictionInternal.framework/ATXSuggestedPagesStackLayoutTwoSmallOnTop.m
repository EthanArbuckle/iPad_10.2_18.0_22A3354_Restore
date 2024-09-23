@implementation ATXSuggestedPagesStackLayoutTwoSmallOnTop

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
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  v8 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (!objc_msgSend(v14, "size", (_QWORD)v23))
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v11);
  }

  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    +[ATXSuggestedPagesUtils createSmallStack](ATXSuggestedPagesUtils, "createSmallStack");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXSuggestedPagesUtils createSmallStack](ATXSuggestedPagesUtils, "createSmallStack");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXSuggestedPagesUtils sortWidgetsByDescendingScore:limit:](ATXSuggestedPagesUtils, "sortWidgetsByDescendingScore:limit:", v8, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");
    v28[0] = v16;
    v28[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tunableConstants");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v18, 0, v19, v20, 0, (int)objc_msgSend(v21, "maxWidgetsInStack"));

    v27[0] = v16;
    v27[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)layOutStacks:(id)a3 numberOfColumns:(unint64_t)a4 forPageType:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a3;
  if (objc_msgSend(v7, "count") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXSuggestedPagesStackLayoutTwoSmallOnTop.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stacks.count == 2"));

  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assignWidgetSpaceCoordinateWithRow:column:", 0, 0);

  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "assignWidgetSpaceCoordinateWithRow:column:", 0, 1);
}

- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3
{
  return 2;
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
