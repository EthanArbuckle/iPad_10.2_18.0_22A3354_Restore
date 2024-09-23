@implementation ICFilterSelection

+ (NSSet)cloudSpecificFilterTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E771AC68);
}

- (ICFilterSelection)init
{
  return -[ICFilterSelection initWithFilterTypeSelections:joinOperator:](self, "initWithFilterTypeSelections:joinOperator:", MEMORY[0x1E0C9AA60], 0);
}

- (ICFilterSelection)initWithFilterTypeSelections:(id)a3 joinOperator:(unint64_t)a4
{
  id v7;
  ICFilterSelection *v8;
  ICFilterSelection *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICFilterSelection;
  v8 = -[ICFilterSelection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_includeRecentlyDeleted = 0;
    objc_storeStrong((id *)&v8->_filterTypeSelections, a3);
    v9->_joinOperator = a4;
  }

  return v9;
}

- (ICFilterSelection)initWithFilterTypeSelection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  ICFilterSelection *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ICFilterSelection initWithFilterTypeSelections:joinOperator:](self, "initWithFilterTypeSelections:joinOperator:", v6, 0, v9, v10);
  return v7;
}

- (id)filterTypeSelectionForFilterType:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[ICFilterSelection filterTypeSelections](self, "filterTypeSelections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__ICFilterSelection_filterTypeSelectionForFilterType___block_invoke;
  v7[3] = &__block_descriptor_40_e38_B32__0__ICFilterTypeSelection_8Q16_B24l;
  v7[4] = a3;
  objc_msgSend(v4, "ic_objectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __54__ICFilterSelection_filterTypeSelectionForFilterType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "filterType") == *(_QWORD *)(a1 + 32);
}

- (void)setSelection:(id)a3 forFilterType:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v11 = a3;
  -[ICFilterSelection filterTypeSelections](self, "filterTypeSelections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[ICFilterSelection filterTypeSelections](self, "filterTypeSelections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__ICFilterSelection_setSelection_forFilterType___block_invoke;
  v12[3] = &__block_descriptor_40_e38_B32__0__ICFilterTypeSelection_8Q16_B24l;
  v12[4] = a4;
  v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v12);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v7, "removeObjectAtIndex:", v9);
  objc_msgSend(v7, "ic_addNonNilObject:", v11);
  v10 = (void *)objc_msgSend(v7, "copy");
  -[ICFilterSelection setFilterTypeSelections:](self, "setFilterTypeSelections:", v10);

}

BOOL __48__ICFilterSelection_setSelection_forFilterType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "filterType") == *(_QWORD *)(a1 + 32);
}

+ (id)keyPathsForValuesAffectingIsEmpty
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  NSStringFromSelector(sel_filterTypeSelections);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[ICFilterSelection filterTypeSelections](self, "filterTypeSelections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingIsValid
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  NSStringFromSelector(sel_filterTypeSelections);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isValid
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[ICFilterSelection incompatibleLockedNotesFilterTypeSelections](self, "incompatibleLockedNotesFilterTypeSelections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[ICFilterSelection invalidFilterTypeSelectionCombinations](self, "invalidFilterTypeSelectionCombinations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") || -[ICFilterSelection hasEmptySelection](self, "hasEmptySelection"))
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      -[ICFilterSelection filterTypeSelections](self, "filterTypeSelections");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "ic_containsObjectPassingTest:", &__block_literal_global_69) ^ 1;

    }
  }

  return v4;
}

uint64_t __28__ICFilterSelection_isValid__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isValid") ^ 1;
}

- (NSString)invalidSummaryTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[ICFilterSelection incompatibleLockedNotesFilterTypeSelections](self, "incompatibleLockedNotesFilterTypeSelections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D64218];
    v6 = CFSTR("About the Locked Notes Filter");
LABEL_5:
    objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v9;
  }
  -[ICFilterSelection invalidFilterTypeSelectionCombinations](self, "invalidFilterTypeSelectionCombinations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v5 = (void *)MEMORY[0x1E0D64218];
    v6 = CFSTR("Conflicting Filter Settings");
    goto LABEL_5;
  }
  if (-[ICFilterSelection hasEmptySelection](self, "hasEmptySelection"))
  {
    -[ICFilterSelection emptySummaryTitle](self, "emptySummaryTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return (NSString *)v9;
}

- (NSString)invalidSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  -[ICFilterSelection incompatibleLockedNotesFilterTypeSelections](self, "incompatibleLockedNotesFilterTypeSelections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    NSStringFromSelector(sel_filterName);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "filterType");

      v8 = 0;
      switch(v7)
      {
        case -1:
        case 1:
        case 2:
        case 9:
        case 10:
          goto LABEL_20;
        case 0:
          v9 = (void *)MEMORY[0x1E0D64218];
          v10 = CFSTR("Since the content of a locked note is encrypted, combining the Locked Notes filter with the Tags filter will not return any results.");
          break;
        case 3:
          v9 = (void *)MEMORY[0x1E0D64218];
          v10 = CFSTR("Since the content of a locked note is encrypted, combining the Locked Notes filter with the Shared filter will not return any results.");
          break;
        case 4:
          v9 = (void *)MEMORY[0x1E0D64218];
          v10 = CFSTR("Since the content of a locked note is encrypted, combining the Locked Notes filter with the Mentions filter will not return any results.");
          break;
        case 5:
          v9 = (void *)MEMORY[0x1E0D64218];
          v10 = CFSTR("Since the content of a locked note is encrypted, combining the Locked Notes filter with the Checklists filter will not return any results.");
          break;
        case 6:
          v9 = (void *)MEMORY[0x1E0D64218];
          v10 = CFSTR("Since the content of a locked note is encrypted, combining the Locked Notes filter with the Attachments filter will not return any results.");
          break;
        case 7:
          v9 = (void *)MEMORY[0x1E0D64218];
          v10 = CFSTR("Since the content of a locked note is encrypted, combining the Locked Notes filter with the Folders filter will not return any results.");
          break;
        case 8:
          v9 = (void *)MEMORY[0x1E0D64218];
          v10 = CFSTR("Since the content of a locked note is encrypted, combining the Locked Notes filter with the Quick Notes filter will not return any results.");
          break;
        default:

          goto LABEL_12;
      }
      objc_msgSend(v9, "localizedFrameworkStringForKey:value:table:allowSiri:", v10, v10, 0, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Since the content of a locked note is encrypted, combining the Locked Notes filter with the following filters will not return any results:\n\n%@"), CFSTR("Since the content of a locked note is encrypted, combining the Locked Notes filter with the following filters will not return any results:\n\n%@"), 0, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringWithFormat:", v15, v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_20:

  }
  else
  {
    -[ICFilterSelection invalidFilterTypeSelectionCombinations](self, "invalidFilterTypeSelectionCombinations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Your selected filters have conflicting settings and will not return any results."), CFSTR("Your selected filters have conflicting settings and will not return any results."), 0, 1);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[ICFilterSelection hasEmptySelection](self, "hasEmptySelection"))
      {
LABEL_12:
        v8 = 0;
        goto LABEL_21;
      }
      -[ICFilterSelection emptySummary](self, "emptySummary");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v13;
  }
LABEL_21:

  return (NSString *)v8;
}

- (BOOL)hasEmptySelection
{
  void *v2;
  BOOL v3;

  -[ICFilterSelection emptyFilterTypeSelections](self, "emptyFilterTypeSelections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingHasEmptySelection
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  NSStringFromSelector(sel_filterTypeSelections);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)emptySummaryTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[ICFilterSelection emptyFilterTypeSelections](self, "emptyFilterTypeSelections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    if (objc_msgSend(v2, "count") == 1)
    {
      objc_msgSend(v2, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "emptySummaryTitle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Multiple Filters Incomplete"), CFSTR("Multiple Filters Incomplete"), 0, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)emptySummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ICFilterSelection emptyFilterTypeSelections](self, "emptyFilterTypeSelections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "emptySummary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ICFilterSelection emptyFilterTypeSelections](self, "emptyFilterTypeSelections");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ic_compactMap:", &__block_literal_global_46);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("You must select at least one: \n\n %@"), CFSTR("You must select at least one: \n\n %@"), 0, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v9, v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

uint64_t __33__ICFilterSelection_emptySummary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortEmptySummary");
}

- (NSString)summaryWithJoinOperatorMenu
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Include notes matching INLINE_MENU_PLEASE_READ_COMMENTS filters."), CFSTR("Include notes matching INLINE_MENU_PLEASE_READ_COMMENTS filters."), 0, 1);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromICFilterSelectionJoinOperator((void *)-[ICFilterSelection joinOperator](self, "joinOperator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("operator:%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICFilterSelection filterTypeSelections](self, "filterTypeSelections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "debugDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("\n%@"), v12);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  ICFilterSelection *v7;
  _QWORD v9[5];

  -[ICFilterSelection filterTypeSelections](self, "filterTypeSelections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__ICFilterSelection_copyWithZone___block_invoke;
  v9[3] = &__block_descriptor_40_e54___ICFilterTypeSelection_16__0__ICFilterTypeSelection_8l;
  v9[4] = a3;
  objc_msgSend(v5, "ic_compactMap:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ICFilterSelection initWithFilterTypeSelections:joinOperator:](+[ICFilterSelection allocWithZone:](ICFilterSelection, "allocWithZone:", a3), "initWithFilterTypeSelections:joinOperator:", v6, -[ICFilterSelection joinOperator](self, "joinOperator"));
  return v7;
}

id __34__ICFilterSelection_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyWithZone:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isEqual:(id)a3
{
  ICFilterSelection *v4;
  ICFilterSelection *v5;
  BOOL v6;

  v4 = (ICFilterSelection *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ICFilterSelection isEqualToICFilterSelection:](self, "isEqualToICFilterSelection:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  id v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICFilterSelection joinOperator](self, "joinOperator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICFilterSelection includeRecentlyDeleted](self, "includeRecentlyDeleted"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[ICFilterSelection filterTypeSelections](self, "filterTypeSelections");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v10 = ICHashWithObject(*(void **)(*((_QWORD *)&v25 + 1) + 8 * i)) - v10 + 32 * v10;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  v23 = ICHashWithHashKeys(v4, v16, v17, v18, v19, v20, v21, v22, v6);
  return v23;
}

- (BOOL)isEqualToICFilterSelection:(id)a3
{
  id v4;
  unint64_t v5;
  int v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[ICFilterSelection joinOperator](self, "joinOperator");
  if (v5 == objc_msgSend(v4, "joinOperator")
    && (v6 = -[ICFilterSelection includeRecentlyDeleted](self, "includeRecentlyDeleted"),
        v6 == objc_msgSend(v4, "includeRecentlyDeleted")))
  {
    -[ICFilterSelection filterTypeSelections](self, "filterTypeSelections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filterTypeSelections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqualToArray:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)emptyFilterTypeSelections
{
  void *v2;
  void *v3;

  -[ICFilterSelection filterTypeSelections](self, "filterTypeSelections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_objectsPassingTest:", &__block_literal_global_59);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __46__ICFilterSelection_emptyFilterTypeSelections__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEmpty");
}

- (NSArray)invalidFilterTypeSelectionCombinations
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  _QWORD v21[2];
  void *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (-[ICFilterSelection joinOperator](self, "joinOperator"))
    return (NSArray *)MEMORY[0x1E0C9AA60];
  objc_opt_class();
  -[ICFilterSelection filterTypeSelectionForFilterType:](self, "filterTypeSelectionForFilterType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "selectionType") == 3)
  {
    objc_opt_class();
    -[ICFilterSelection filterTypeSelectionForFilterType:](self, "filterTypeSelectionForFilterType:", 7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    -[ICFilterSelection filterTypeSelectionForFilterType:](self, "filterTypeSelectionForFilterType:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && !objc_msgSend(v7, "inclusionType") && objc_msgSend(v7, "containsSharedFolder"))
    {
      v23[0] = v5;
      v10 = (void **)v23;
      v11 = v7;
LABEL_23:
      v10[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_21;
    }
    if (v9 && objc_msgSend(v9, "selectionType") != 3)
    {
      v22 = v5;
      v10 = &v22;
      v11 = v9;
      goto LABEL_23;
    }

  }
  objc_opt_class();
  -[ICFilterSelection filterTypeSelectionForFilterType:](self, "filterTypeSelectionForFilterType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_20;
  if (objc_msgSend(v7, "selectionType") != 8)
    goto LABEL_20;
  -[ICFilterSelection filterTypeSelections](self, "filterTypeSelections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14 < 2)
    goto LABEL_20;
  objc_opt_class();
  -[ICFilterSelection filterTypeSelectionForFilterType:](self, "filterTypeSelectionForFilterType:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16
    || objc_msgSend(v7, "selectionType") != 8
    || (objc_msgSend(v16, "primaryDate"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "primaryDate"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v17, "ic_isEarlierThanDate:", v18),
        v18,
        v17,
        (v19 & 1) == 0))
  {

LABEL_20:
    v20 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_21;
  }
  v21[0] = v7;
  v21[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
  return (NSArray *)v20;
}

- (NSArray)incompatibleLockedNotesFilterTypeSelections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[ICFilterSelection filterTypeSelectionForFilterType:](self, "filterTypeSelectionForFilterType:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!objc_msgSend(v5, "inclusionType"))
    {
      -[ICFilterSelection filterTypeSelections](self, "filterTypeSelections");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7 >= 2)
      {
        objc_opt_class();
        -[ICFilterSelection filterTypeSelectionForFilterType:](self, "filterTypeSelectionForFilterType:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 && objc_msgSend(v9, "mode") != 2)
          objc_msgSend(v3, "addObject:", v9);
        objc_opt_class();
        -[ICFilterSelection filterTypeSelectionForFilterType:](self, "filterTypeSelectionForFilterType:", 3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 && objc_msgSend(v11, "selectionType") != 3)
          objc_msgSend(v3, "addObject:", v11);
        objc_opt_class();
        -[ICFilterSelection filterTypeSelectionForFilterType:](self, "filterTypeSelectionForFilterType:", 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 && objc_msgSend(v13, "selectionType") != 3)
          objc_msgSend(v3, "addObject:", v13);
        objc_opt_class();
        -[ICFilterSelection filterTypeSelectionForFilterType:](self, "filterTypeSelectionForFilterType:", 8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 && !objc_msgSend(v15, "inclusionType"))
          objc_msgSend(v3, "addObject:", v15);
        v25 = v11;
        objc_opt_class();
        -[ICFilterSelection filterTypeSelectionForFilterType:](self, "filterTypeSelectionForFilterType:", 7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 && !objc_msgSend(v17, "inclusionType") && objc_msgSend(v17, "containsSharedFolder"))
          objc_msgSend(v3, "addObject:", v17);
        v18 = v9;
        objc_opt_class();
        -[ICFilterSelection filterTypeSelectionForFilterType:](self, "filterTypeSelectionForFilterType:", 5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20 && objc_msgSend(v20, "selectionType") != 3)
          objc_msgSend(v3, "addObject:", v20);
        objc_opt_class();
        -[ICFilterSelection filterTypeSelectionForFilterType:](self, "filterTypeSelectionForFilterType:", 6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22 && objc_msgSend(v22, "selectionType") != 9)
          objc_msgSend(v3, "addObject:", v22);

      }
    }
  }
  v23 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v23;
}

- (unint64_t)joinOperator
{
  return self->_joinOperator;
}

- (void)setJoinOperator:(unint64_t)a3
{
  self->_joinOperator = a3;
}

- (NSArray)filterTypeSelections
{
  return self->_filterTypeSelections;
}

- (void)setFilterTypeSelections:(id)a3
{
  objc_storeStrong((id *)&self->_filterTypeSelections, a3);
}

- (BOOL)includeRecentlyDeleted
{
  return self->_includeRecentlyDeleted;
}

- (void)setIncludeRecentlyDeleted:(BOOL)a3
{
  self->_includeRecentlyDeleted = a3;
}

- (NSString)primaryDateSummary
{
  return self->_primaryDateSummary;
}

- (NSString)secondaryDateSummary
{
  return self->_secondaryDateSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryDateSummary, 0);
  objc_storeStrong((id *)&self->_primaryDateSummary, 0);
  objc_storeStrong((id *)&self->_filterTypeSelections, 0);
}

@end
