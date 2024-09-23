@implementation ATXSuggestedPagesStackLayoutTwoLargeTwoSmallOneMedium

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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  _QWORD v40[2];
  _QWORD v41[2];
  void *v42;
  uint64_t v43;
  _QWORD v44[4];

  v44[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    v8 = (void *)objc_opt_new();
    +[ATXSuggestedPagesUtils filterWidgets:bySize:usedPersonalities:](ATXSuggestedPagesUtils, "filterWidgets:bySize:usedPersonalities:", v6, 2, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v9, "count") >= 2)
    {
      +[ATXSuggestedPagesUtils createLargeStack](ATXSuggestedPagesUtils, "createLargeStack");
      v11 = objc_claimAutoreleasedReturnValue();
      +[ATXSuggestedPagesUtils createLargeStack](ATXSuggestedPagesUtils, "createLargeStack");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXSuggestedPagesUtils sortWidgetsByDescendingScore:limit:](ATXSuggestedPagesUtils, "sortWidgetsByDescendingScore:limit:", v9, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v11;
      v44[0] = v11;
      v44[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tunableConstants");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)v13;
      +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v13, 0, 2, v14, v8, (int)objc_msgSend(v15, "maxWidgetsInStack"));

      +[ATXSuggestedPagesUtils filterWidgets:bySize:usedPersonalities:](ATXSuggestedPagesUtils, "filterWidgets:bySize:usedPersonalities:", v6, 1, v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count"))
      {
        v36 = v12;
        +[ATXSuggestedPagesUtils createMediumStack](ATXSuggestedPagesUtils, "createMediumStack");
        v17 = objc_claimAutoreleasedReturnValue();
        v34 = v16;
        +[ATXSuggestedPagesUtils sortWidgetsByDescendingScore:limit:](ATXSuggestedPagesUtils, "sortWidgetsByDescendingScore:limit:", v16, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)v17;
        v43 = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "tunableConstants");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v18, 0, 1, v19, v8, (int)objc_msgSend(v20, "maxWidgetsInStack"));

        +[ATXSuggestedPagesUtils filterWidgets:bySize:usedPersonalities:](ATXSuggestedPagesUtils, "filterWidgets:bySize:usedPersonalities:", v6, 0, v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 0;
        if ((unint64_t)objc_msgSend(v21, "count") >= 2)
        {
          +[ATXSuggestedPagesUtils createSmallStack](ATXSuggestedPagesUtils, "createSmallStack");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[ATXSuggestedPagesUtils createSmallStack](ATXSuggestedPagesUtils, "createSmallStack");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 1);
          v33 = v21;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v22;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "sortedArrayUsingDescriptors:", v23);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v41[0] = v32;
          v41[1] = v31;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "tunableConstants");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v30, 0, 2, v24, v8, (int)objc_msgSend(v25, "maxWidgetsInStack"));

          v26 = objc_msgSend(v37, "count") - 2;
          v40[0] = v38;
          v40[1] = v36;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "tunableConstants");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v37, 2, v26, v27, v8, (int)objc_msgSend(v28, "maxWidgetsInStack"));

          v39[0] = v31;
          v39[1] = v32;
          v39[2] = v35;
          v39[3] = v36;
          v39[4] = v38;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 5);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = v33;
        }

        v12 = v36;
        v16 = v34;
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

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)maxAllowableStacksForPageType:(int64_t)a3
{
  return 5;
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
