@implementation ATXSuggestedPagesStackLayoutTwoMedium

- (id)makeStacksFromWidgets:(id)a3 pageType:(int64_t)a4 environment:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    +[ATXSuggestedPagesUtils filterWidgets:bySize:usedPersonalities:](ATXSuggestedPagesUtils, "filterWidgets:bySize:usedPersonalities:", v6, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      +[ATXSuggestedPagesUtils createMediumStack](ATXSuggestedPagesUtils, "createMediumStack");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXSuggestedPagesUtils createMediumStack](ATXSuggestedPagesUtils, "createMediumStack");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXSuggestedPagesUtils sortWidgetsByDescendingScore:limit:](ATXSuggestedPagesUtils, "sortWidgetsByDescendingScore:limit:", v8, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      v18[0] = v10;
      v18[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tunableConstants");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXSuggestedPagesUtils evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:](ATXSuggestedPagesUtils, "evenlyDistributeWidgets:inRange:amongStacks:usedPersonalities:maxWidgetsInStack:", v12, 0, v13, v14, 0, (int)objc_msgSend(v15, "maxWidgetsInStack"));

      v17[0] = v10;
      v17[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXSuggestedPagesStackLayoutTwoMedium.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stacks.count == 2"));

  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assignWidgetSpaceCoordinateWithRow:column:", 0, 0);

  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "assignWidgetSpaceCoordinateWithRow:column:", 0, 2);
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
  return 4;
}

@end
