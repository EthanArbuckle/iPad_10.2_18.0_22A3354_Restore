@implementation ATXSuggestedPagesStackLayoutTwoMediumTwoSmall

- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  _QWORD v32[2];
  _QWORD v33[2];
  void *v34;
  _QWORD v35[4];

  v35[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    v8 = (void *)objc_opt_new();
    +[ATXSuggestedPagesUtils filterWidgets:bySize:usedPersonalities:](ATXSuggestedPagesUtils, "filterWidgets:bySize:usedPersonalities:", v6, 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v9, "count") >= 2)
    {
      +[ATXSuggestedPagesUtils createMediumStack](ATXSuggestedPagesUtils, "createMediumStack");
      v11 = objc_claimAutoreleasedReturnValue();
      +[ATXSuggestedPagesUtils createMediumStack](ATXSuggestedPagesUtils, "createMediumStack");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXSuggestedPagesUtils sortWidgetsByDescendingScore:limit:](ATXSuggestedPagesUtils, "sortWidgetsByDescendingScore:limit:", v9, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v11;
      v35[0] = v11;
      v35[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tunableConstants");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)v13;
      +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v13, 0, 2, v14, v8, (int)objc_msgSend(v15, "maxWidgetsInStack"));

      +[ATXSuggestedPagesUtils filterWidgets:bySize:usedPersonalities:](ATXSuggestedPagesUtils, "filterWidgets:bySize:usedPersonalities:", v6, 0, v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      if ((unint64_t)objc_msgSend(v16, "count") >= 2)
      {
        +[ATXSuggestedPagesUtils createSmallStack](ATXSuggestedPagesUtils, "createSmallStack");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXSuggestedPagesUtils createSmallStack](ATXSuggestedPagesUtils, "createSmallStack");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sortedArrayUsingDescriptors:", v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v33[0] = v28;
        v33[1] = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "tunableConstants");
        v27 = v16;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v25, 0, 2, v19, v8, (int)objc_msgSend(v20, "maxWidgetsInStack"));

        v21 = objc_msgSend(v30, "count") - 2;
        v32[0] = v29;
        v32[1] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "tunableConstants");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v30, 2, v21, v22, v8, (int)objc_msgSend(v23, "maxWidgetsInStack"));

        v16 = v27;
        v31[0] = v26;
        v31[1] = v28;
        v31[2] = v12;
        v31[3] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
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
  return 4;
}

@end
