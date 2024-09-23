@implementation MUIMailboxFilterViewModel

- (MUIMailboxFilterViewModel)initWithProvider:(id)a3 formatter:(id)a4
{
  return -[MUIMailboxFilterViewModel initWithProvider:formatter:selectedFilters:](self, "initWithProvider:formatter:selectedFilters:", a3, a4, 0);
}

- (MUIMailboxFilterViewModel)initWithProvider:(id)a3 formatter:(id)a4 selectedFilters:(id)a5
{
  return -[MUIMailboxFilterViewModel initWithProvider:formatter:selectedFilters:sortedFilters:](self, "initWithProvider:formatter:selectedFilters:sortedFilters:", a3, a4, a5, 0);
}

- (MUIMailboxFilterViewModel)initWithProvider:(id)a3 formatter:(id)a4 selectedFilters:(id)a5 sortedFilters:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  MUIMailboxFilterViewModel *v16;
  MUIMailboxFilterViewModel *v17;
  uint64_t v18;
  NSArray *selectedFilters;
  uint64_t v20;
  EFObserver *selectedFiltersObservable;
  void *v23;
  void *v24;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MUIMailboxFilterViewModel.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provider"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MUIMailboxFilterViewModel.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("formatter"));

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)MUIMailboxFilterViewModel;
  v16 = -[MUIMailboxFilterViewModel init](&v25, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_provider, a3);
    objc_storeStrong((id *)&v17->_formatter, a4);
    v18 = objc_msgSend(v14, "copy");
    selectedFilters = v17->_selectedFilters;
    v17->_selectedFilters = (NSArray *)v18;

    objc_msgSend(MEMORY[0x1E0D1EF28], "observableObserver");
    v20 = objc_claimAutoreleasedReturnValue();
    selectedFiltersObservable = v17->_selectedFiltersObservable;
    v17->_selectedFiltersObservable = (EFObserver *)v20;

  }
  return v17;
}

- (id)selectedFiltersDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[MUIMailboxFilterViewModel formatter](self, "formatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIMailboxFilterViewModel reducedSelectedFilters](self, "reducedSelectedFilters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForObjectValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)reducedSelectedFilters
{
  void *v3;
  void *v4;
  void *v5;

  -[MUIMailboxFilterViewModel provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIMailboxFilterViewModel selectedFilters](self, "selectedFilters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reduce:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)selectedFilters
{
  void *v3;
  NSArray *v4;
  NSArray *selectedFilters;

  if (!-[NSArray count](self->_selectedFilters, "count"))
  {
    -[MUIMailboxFilterViewModel provider](self, "provider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultFilters");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    selectedFilters = self->_selectedFilters;
    self->_selectedFilters = v4;

  }
  return self->_selectedFilters;
}

- (void)setSelectedFilters:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;

  if (a3)
    v4 = a3;
  else
    v4 = (id)MEMORY[0x1E0C9AA60];
  v5 = (NSArray *)v4;
  if (self->_selectedFilters != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedFilters, v4);
    -[MUIMailboxFilterViewModel _notifySelectedFiltersObserver](self, "_notifySelectedFiltersObserver");
    v5 = v6;
  }

}

- (void)reselectFocusFilters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MUIMailboxFilterViewModel provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusFilters");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    -[MUIMailboxFilterViewModel selectedFilters](self, "selectedFilters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_filter:", &__block_literal_global_24);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUIMailboxFilterViewModel setSelectedFilters:](self, "setSelectedFilters:", v6);
  }

}

uint64_t __49__MUIMailboxFilterViewModel_reselectFocusFilters__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasMailboxPredicate") ^ 1;
}

- (id)predicateForSelectedFilters
{
  void *v3;
  void *v4;

  -[MUIMailboxFilterViewModel selectedFilters](self, "selectedFilters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIMailboxFilterViewModel _compoundPredicateForFilters:](self, "_compoundPredicateForFilters:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_compoundPredicateForFilters:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[5];

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v6 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __58__MUIMailboxFilterViewModel__compoundPredicateForFilters___block_invoke;
    v18[3] = &unk_1E99E2E88;
    v18[4] = self;
    objc_msgSend(v5, "ef_groupBy:", v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v6;
    v14 = 3221225472;
    v15 = __58__MUIMailboxFilterViewModel__compoundPredicateForFilters___block_invoke_2;
    v16 = &unk_1E99E2EF0;
    v17 = v7;
    v9 = v7;
    objc_msgSend(v8, "ef_map:", &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v10, v13, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __58__MUIMailboxFilterViewModel__compoundPredicateForFilters___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupContainingFilter:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __58__MUIMailboxFilterViewModel__compoundPredicateForFilters___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_map:", &__block_literal_global_11_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "combinator");

  if (v6)
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v5);
  else
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __58__MUIMailboxFilterViewModel__compoundPredicateForFilters___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "predicate");
}

- (void)_notifySelectedFiltersObserver
{
  void *v3;
  id v4;

  -[MUIMailboxFilterViewModel selectedFiltersObservable](self, "selectedFiltersObservable");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MUIMailboxFilterViewModel selectedFilters](self, "selectedFilters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "observerDidReceiveResult:", v3);

}

- (BOOL)isFilterEnabled
{
  return self->_filterEnabled;
}

- (void)setFilterEnabled:(BOOL)a3
{
  self->_filterEnabled = a3;
}

- (MUIMailboxFilterProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (MUIMailboxFilterContext)filterContext
{
  return self->_filterContext;
}

- (void)setFilterContext:(id)a3
{
  objc_storeStrong((id *)&self->_filterContext, a3);
}

- (NSFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_formatter, a3);
}

- (EFObserver)selectedFiltersObservable
{
  return self->_selectedFiltersObservable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedFiltersObservable, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_filterContext, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_selectedFilters, 0);
}

@end
