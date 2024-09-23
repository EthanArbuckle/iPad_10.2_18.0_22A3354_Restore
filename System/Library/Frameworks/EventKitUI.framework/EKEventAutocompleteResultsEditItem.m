@implementation EKEventAutocompleteResultsEditItem

- (void)setResults:(id)a3
{
  id v5;
  NSArray *results;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  _BOOL4 v10;
  char v11;
  BOOL v12;
  unint64_t v13;
  id v14;

  v5 = a3;
  results = self->_results;
  v14 = v5;
  if (!results)
  {
    v8 = 1;
    if (v5)
      goto LABEL_3;
LABEL_9:
    v10 = 1;
    goto LABEL_10;
  }
  v7 = -[NSArray count](results, "count");
  v5 = v14;
  v8 = v7 == 0;
  if (!v14)
    goto LABEL_9;
LABEL_3:
  v9 = objc_msgSend(v5, "count");
  v10 = v9 == 0;
  if (v9)
    v11 = v8;
  else
    v11 = 1;
  if ((v11 & 1) == 0)
  {
    v12 = -[NSArray isEqualToArray:](self->_results, "isEqualToArray:", v14);
    v5 = v14;
    if (v12)
      goto LABEL_17;
    goto LABEL_13;
  }
  v5 = v14;
LABEL_10:
  if (v8 && v10)
    goto LABEL_17;
LABEL_13:
  if (self->_suggestionApplied)
  {
    objc_storeStrong((id *)&self->_results, a3);
  }
  else
  {
    v13 = -[EKEventAutocompleteResultsEditItem numberOfSubitems](self, "numberOfSubitems");
    objc_storeStrong((id *)&self->_results, a3);
    -[EKEventAutocompleteResultsEditItem _updateTableWithOldCount:newCount:](self, "_updateTableWithOldCount:newCount:", v13, -[EKEventAutocompleteResultsEditItem numberOfSubitems](self, "numberOfSubitems"));
  }
  v5 = v14;
LABEL_17:

}

- (void)_updateTableWithOldCount:(int64_t)a3 newCount:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  id v26;

  v26 = (id)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  if (!a3 || !a4)
  {
    -[EKCalendarItemEditItem delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[EKCalendarItemEditItem delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "editItemVisibilityChanged:", self);

    }
  }
  if (a3 == a4)
  {
    if (a3)
    {
      v12 = 0;
      do
        objc_msgSend(v8, "addIndex:", v12++);
      while (a3 != v12);
    }
  }
  else if (a3 <= a4)
  {
    if (a4)
    {
      v15 = 0;
      do
      {
        v16 = v26;
        if (v15 < a3)
          v16 = v8;
        objc_msgSend(v16, "addIndex:", v15++);
      }
      while (a4 != v15);
    }
  }
  else if (a3)
  {
    v13 = 0;
    do
    {
      if (v13 >= a4)
        v14 = v7;
      else
        v14 = v8;
      objc_msgSend(v14, "addIndex:", v13++);
    }
    while (a3 != v13);
  }
  -[EKCalendarItemEditItem delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[EKCalendarItemEditItem delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "editItem:wantsRowInsertions:rowDeletions:rowReloads:", self, v26, v7, v8);

  }
  if ((a3 == 0) != (a4 == 0))
  {
    if (!a3)
    {
      -[EKCalendarItemEditItem delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_opt_respondsToSelector();

      if ((v21 & 1) != 0)
      {
        -[EKCalendarItemEditItem delegate](self, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "autocompleteResultsEditItemDidShowResults:", self);

      }
    }
    if (!a4)
    {
      -[EKCalendarItemEditItem delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_opt_respondsToSelector();

      if ((v24 & 1) != 0)
      {
        -[EKCalendarItemEditItem delegate](self, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "autocompleteResultsEditItemDidHideResults:", self);

      }
    }
  }

}

- (unint64_t)numberOfSubitems
{
  if (self->_suggestionApplied)
    return 0;
  else
    return -[NSArray count](self->_results, "count");
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  -[NSArray objectAtIndexedSubscript:](self->_results, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pasteboardResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "count");

  v6 = (void *)objc_opt_class();
  -[EKCalendarItemEditItem delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
    goto LABEL_3;
  -[EKCalendarItemEditItem delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellWithReuseIdentifier:forEditItem:", v10, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_3:
    v12 = objc_alloc((Class)v6);
    objc_msgSend(v6, "reuseIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v12, "initWithStyle:reuseIdentifier:", 0, v13);

  }
  objc_msgSend(v11, "updateWithResult:", v4);

  return v11;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  __objc2_class **v8;
  double v9;
  double v10;

  -[NSArray objectAtIndexedSubscript:](self->_results, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pasteboardResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = off_1E6016020;
  if (v7 <= 1)
    v8 = off_1E6015DB0;
  -[__objc2_class cellHeightForResult:forWidth:](*v8, "cellHeightForResult:forWidth:", v5, a4);
  v10 = v9;

  return v10;
}

- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4
{
  return 1;
}

- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  -[NSArray objectAtIndexedSubscript:](self->_results, "objectAtIndexedSubscript:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pasteboardResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_suggestionApplied = (unint64_t)objc_msgSend(v5, "count") < 2;

  -[EKCalendarItemEditItem delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[EKCalendarItemEditItem delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "autocompleteResultsEditItem:resultSelected:", self, v9);

  }
}

- (BOOL)editor:(id)a3 shouldClearSelectionFromSubitem:(unint64_t)a4
{
  return 1;
}

- (BOOL)shouldAppear
{
  return -[EKEventAutocompleteResultsEditItem numberOfSubitems](self, "numberOfSubitems") != 0;
}

- (BOOL)hasSuggestedLocationResult
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  char v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_results;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "preferredLocation", (_QWORD)v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isPrediction");

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)results
{
  return self->_results;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

@end
