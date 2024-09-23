@implementation MUIMailboxFilterProvider

- (MUIMailboxFilterProvider)initWithFilterContext:(id)a3 mailboxFilterClass:(Class)a4
{
  id v6;
  MUIMailboxFilterProvider *v7;
  void *v8;
  uint64_t v9;
  NSArray *mailboxes;
  uint64_t v11;
  EMFocus *focus;
  void *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MUIMailboxFilterProvider;
  v7 = -[MUIMailboxFilterProvider init](&v15, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "mailboxes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    mailboxes = v7->_mailboxes;
    v7->_mailboxes = (NSArray *)v9;

    objc_msgSend(v6, "focus");
    v11 = objc_claimAutoreleasedReturnValue();
    focus = v7->_focus;
    v7->_focus = (EMFocus *)v11;

    if (!a4)
      a4 = (Class)objc_opt_class();
    objc_storeStrong((id *)&v7->_mailboxFilterClass, a4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel__vipsDidChange_, *MEMORY[0x1E0D1E0A8], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel__contentSizeCategoryChanged_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MUIMailboxFilterProvider;
  -[MUIMailboxFilterProvider dealloc](&v4, sel_dealloc);
}

- (NSArray)filtersGroups
{
  NSArray *filtersGroups;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;

  filtersGroups = self->_filtersGroups;
  if (!filtersGroups)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[MUIMailboxFilterProvider accountsFilterGroup](self, "accountsFilterGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_addOptionalObject:", v5);

    -[MUIMailboxFilterProvider _flagsFilterGroup](self, "_flagsFilterGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_addOptionalObject:", v6);

    -[MUIMailboxFilterProvider _addressedGroup](self, "_addressedGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_addOptionalObject:", v7);

    -[MUIMailboxFilterProvider _andFilterGroup](self, "_andFilterGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_addOptionalObject:", v8);

    v9 = (NSArray *)objc_msgSend(v4, "copy");
    v10 = self->_filtersGroups;
    self->_filtersGroups = v9;

    filtersGroups = self->_filtersGroups;
  }
  return filtersGroups;
}

- (NSArray)allFilters
{
  void *v2;
  void *v3;

  -[MUIMailboxFilterProvider filtersGroups](self, "filtersGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_flatMap:", &__block_literal_global_22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __38__MUIMailboxFilterProvider_allFilters__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "filters");
}

- (NSArray)defaultFilters
{
  objc_class *v4;
  _BOOL4 v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[4];
  id v18;

  v4 = -[MUIMailboxFilterProvider mailboxFilterClass](self, "mailboxFilterClass");
  v5 = -[MUIMailboxFilterProvider _isMailboxOfSmartMailboxType:](self, "_isMailboxOfSmartMailboxType:", 2);
  v6 = [v4 alloc];
  if (v5)
    v7 = objc_msgSend(v6, "initForFlaggedMessages");
  else
    v7 = objc_msgSend(v6, "initForUnreadMessages");
  v8 = (void *)v7;
  -[MUIMailboxFilterProvider allFilters](self, "allFilters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __42__MUIMailboxFilterProvider_defaultFilters__block_invoke;
  v17[3] = &unk_1E99E2CC8;
  v10 = v8;
  v18 = v10;
  objc_msgSend(v9, "ef_filter:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MUIMailboxFilterProvider.m"), 93, CFSTR("Should always return a default filter"));

  }
  -[MUIMailboxFilterProvider focus](self, "focus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[MUIMailboxFilterProvider focusFilters](self, "focusFilters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v11, "ef_filter:", &__block_literal_global_14_0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return (NSArray *)v11;
}

uint64_t __42__MUIMailboxFilterProvider_defaultFilters__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  int v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  LODWORD(v2) = objc_msgSend(v3, "isEqualToFilter:", v2);
  v4 = objc_msgSend(v3, "hasMailboxPredicate");

  return v2 | v4;
}

uint64_t __42__MUIMailboxFilterProvider_defaultFilters__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasMailboxPredicate") ^ 1;
}

- (id)groupContainingFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[MUIMailboxFilterProvider individualVIPFilterGroup](self, "individualVIPFilterGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    v8 = v5;
  }
  else
  {
    -[MUIMailboxFilterProvider filtersGroups](self, "filtersGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__MUIMailboxFilterProvider_groupContainingFilter___block_invoke;
    v11[3] = &unk_1E99E2D30;
    v12 = v4;
    objc_msgSend(v9, "ef_firstObjectPassingTest:", v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t __50__MUIMailboxFilterProvider_groupContainingFilter___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "filters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)reduce:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "ef_partition:", &__block_literal_global_16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIMailboxFilterProvider accountFilters](self, "accountFilters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(v5, "first");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 == v9)
  {
    objc_msgSend(v5, "second");
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v10;
  }

  return v4;
}

uint64_t __35__MUIMailboxFilterProvider_reduce___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasMailboxPredicate");
}

- (NSArray)accountFilters
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  NSArray *v11;
  NSArray *accountFilters;
  _QWORD v14[4];
  id v15;
  objc_class *v16;

  if (!self->_accountFilters)
  {
    -[MUIMailboxFilterProvider mailboxes](self, "mailboxes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count") != 1)
    {
LABEL_5:

      return self->_accountFilters;
    }
    -[MUIMailboxFilterProvider mailboxes](self, "mailboxes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSmartMailbox");

    if (v6)
    {
      -[MUIMailboxFilterProvider _accountsInSmartMailboxScope](self, "_accountsInSmartMailboxScope");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUIMailboxFilterProvider mailboxes](self, "mailboxes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = -[MUIMailboxFilterProvider mailboxFilterClass](self, "mailboxFilterClass");
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __42__MUIMailboxFilterProvider_accountFilters__block_invoke;
      v14[3] = &unk_1E99E2D78;
      v15 = v8;
      v16 = v9;
      v10 = v8;
      objc_msgSend(v3, "ef_map:", v14);
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
      accountFilters = self->_accountFilters;
      self->_accountFilters = v11;

      goto LABEL_5;
    }
  }
  return self->_accountFilters;
}

id __42__MUIMailboxFilterProvider_accountFilters__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = *(objc_class **)(a1 + 40);
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithAccount:iconFromSmartMailbox:", v4, *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)_accountsInSmartMailboxScope
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
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
  NSArray *v21;
  NSArray *accountsInSmartMailboxScope;
  char v24;

  if (!self->_accountsInSmartMailboxScope)
  {
    -[MUIMailboxFilterProvider mailboxes](self, "mailboxes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count") != 1)
    {
LABEL_5:

      return self->_accountsInSmartMailboxScope;
    }
    -[MUIMailboxFilterProvider mailboxes](self, "mailboxes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSmartMailbox");

    if (v6)
    {
      -[MUIMailboxFilterProvider mailboxes](self, "mailboxes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = 0;
      objc_msgSend(v3, "mailboxScope");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "repository");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allMailboxObjectIDsWithMailboxTypeResolver:forExclusion:", v9, &v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0D1EEC0];
      objc_msgSend(v3, "repository");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mailboxesForObjectIDs:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "join:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "result");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v16, "ef_compactMapSelector:", sel_account);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "allObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "sortedArrayUsingComparator:", &__block_literal_global_23_0);
      v21 = (NSArray *)objc_claimAutoreleasedReturnValue();

      accountsInSmartMailboxScope = self->_accountsInSmartMailboxScope;
      self->_accountsInSmartMailboxScope = v21;

      goto LABEL_5;
    }
  }
  return self->_accountsInSmartMailboxScope;
}

uint64_t __56__MUIMailboxFilterProvider__accountsInSmartMailboxScope__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (MUIMailboxFilterGroup)accountsFilterGroup
{
  void *v3;
  void *v4;
  void *v5;
  MUIMailboxFilterGroup *v6;
  MUIMailboxFilterGroup *accountsFilterGroup;

  if (!self->_accountsFilterGroup)
  {
    self->_accountsFilterGroup = 0;
    -[MUIMailboxFilterProvider accountFilters](self, "accountFilters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      _EFLocalizedString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUIMailboxFilterProvider accountFilters](self, "accountFilters");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[MUIMailboxFilterGroup groupWithName:combinator:selectionCardinality:filters:](MUIMailboxFilterGroup, "groupWithName:combinator:selectionCardinality:filters:", v4, 1, 0, v5);
      v6 = (MUIMailboxFilterGroup *)objc_claimAutoreleasedReturnValue();
      accountsFilterGroup = self->_accountsFilterGroup;
      self->_accountsFilterGroup = v6;

    }
  }
  return self->_accountsFilterGroup;
}

- (NSArray)focusFilters
{
  -[MUIMailboxFilterProvider doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMailboxFilterProvider focusFilters]", "MUIMailboxFilterProvider.m", 189, "0");
}

- (id)_flagsFilterGroup
{
  void *v3;
  objc_class *v4;
  id v5;
  void (**v6)(void *, uint64_t);
  void *v7;
  void *v8;
  _QWORD aBlock[5];
  id v11;
  objc_class *v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MUIMailboxFilterProvider mailboxFilterClass](self, "mailboxFilterClass");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__MUIMailboxFilterProvider__flagsFilterGroup__block_invoke;
  aBlock[3] = &unk_1E99E2DE0;
  aBlock[4] = self;
  v11 = v3;
  v12 = v4;
  v5 = v3;
  v6 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v6[2](v6, 2);
  v6[2](v6, 1);
  _EFLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUIMailboxFilterGroup groupWithName:combinator:selectionCardinality:filters:](MUIMailboxFilterGroup, "groupWithName:combinator:selectionCardinality:filters:", v7, 1, 1, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __45__MUIMailboxFilterProvider__flagsFilterGroup__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "_isMailboxOfSmartMailboxType:", a2) & 1) == 0)
  {
    v4 = *(void **)(a1 + 40);
    v5 = (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initForSmartMailboxType:", a2);
    objc_msgSend(v4, "ef_addOptionalObject:", v5);

  }
}

- (BOOL)_isMailboxOfSmartMailboxType:(int64_t)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;

  -[MUIMailboxFilterProvider mailboxes](self, "mailboxes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1
    && (objc_msgSend(v4, "objectAtIndexedSubscript:", 0),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isSmartMailbox"),
        v5,
        v6))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "smartMailboxType") == a3;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_addressedGroup
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = -[MUIMailboxFilterProvider mailboxFilterClass](self, "mailboxFilterClass");
  v3 = (void *)objc_msgSend([v2 alloc], "initForToMeMessages");
  v9[0] = v3;
  v4 = (void *)objc_msgSend([v2 alloc], "initForCCMeMessages");
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _EFLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUIMailboxFilterGroup groupWithName:combinator:selectionCardinality:filters:](MUIMailboxFilterGroup, "groupWithName:combinator:selectionCardinality:filters:", v6, 1, 1, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_andFilterGroup
{
  void *v3;
  objc_class *v4;
  id v5;
  void (**v6)(void *, uint64_t);
  void *v7;
  _QWORD aBlock[5];
  id v10;
  objc_class *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MUIMailboxFilterProvider mailboxFilterClass](self, "mailboxFilterClass");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__MUIMailboxFilterProvider__andFilterGroup__block_invoke;
  aBlock[3] = &unk_1E99E2DE0;
  aBlock[4] = self;
  v5 = v3;
  v10 = v5;
  v11 = v4;
  v6 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v6[2](v6, 4);
  v6[2](v6, 0);
  v6[2](v6, 6);
  if (objc_msgSend(v5, "count"))
  {
    +[MUIMailboxFilterGroup groupWithName:combinator:selectionCardinality:filters:](MUIMailboxFilterGroup, "groupWithName:combinator:selectionCardinality:filters:", 0, 0, 1, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __43__MUIMailboxFilterProvider__andFilterGroup__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "_isMailboxOfSmartMailboxType:", a2) & 1) == 0)
  {
    v4 = *(void **)(a1 + 40);
    v5 = (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initForSmartMailboxType:", a2);
    objc_msgSend(v4, "ef_addOptionalObject:", v5);

  }
}

- (BOOL)_isInbox
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  -[MUIMailboxFilterProvider mailboxes](self, "mailboxes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
    return 1;
  -[MUIMailboxFilterProvider mailboxes](self, "mailboxes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInboxMailbox");

  return v7;
}

- (id)_onlyFilterGroup
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = -[MUIMailboxFilterProvider mailboxFilterClass](self, "mailboxFilterClass");
  v3 = (void *)objc_msgSend([v2 alloc], "initForTodayMessages");
  v4 = (void *)objc_msgSend([v2 alloc], "initForMessagesWithAttachments", v3);
  v9[1] = v4;
  v5 = (void *)objc_msgSend([v2 alloc], "initForVIPMessages");
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MUIMailboxFilterGroup groupWithName:combinator:selectionCardinality:filters:](MUIMailboxFilterGroup, "groupWithName:combinator:selectionCardinality:filters:", 0, 0, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MUIMailboxFilterGroup)individualVIPFilterGroup
{
  return 0;
}

- (void)_vipsDidChange:(id)a3
{
  -[MUIMailboxFilterProvider setIndividualVIPFilterGroup:](self, "setIndividualVIPFilterGroup:", 0);
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  NSArray *filtersGroups;

  filtersGroups = self->_filtersGroups;
  self->_filtersGroups = 0;

}

- (void)setFiltersGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setAccountFilters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)accountsInSmartMailboxScope
{
  return self->_accountsInSmartMailboxScope;
}

- (void)setAccountsInSmartMailboxScope:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (EMFocus)focus
{
  return self->_focus;
}

- (void)setFocus:(id)a3
{
  objc_storeStrong((id *)&self->_focus, a3);
}

- (void)setAccountsFilterGroup:(id)a3
{
  objc_storeStrong((id *)&self->_accountsFilterGroup, a3);
}

- (Class)mailboxFilterClass
{
  return self->_mailboxFilterClass;
}

- (void)setMailboxFilterClass:(Class)a3
{
  objc_storeStrong((id *)&self->_mailboxFilterClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxFilterClass, 0);
  objc_storeStrong((id *)&self->_accountsFilterGroup, 0);
  objc_storeStrong((id *)&self->_focus, 0);
  objc_storeStrong((id *)&self->_accountsInSmartMailboxScope, 0);
  objc_storeStrong((id *)&self->_accountFilters, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_filtersGroups, 0);
}

@end
