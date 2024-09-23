@implementation FPSearchCollection

- (FPSearchCollection)init
{
  uint64_t v3;
  objc_super v5;

  v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)FPSearchCollection;
  return -[FPQueryCollection initWithQueryDescriptorClass:predicate:paced:](&v5, sel_initWithQueryDescriptorClass_predicate_paced_, v3, 0, 0);
}

- (id)createDataSourceWithSortDescriptors:(id)a3
{
  id v5;
  FPSearchCollection *v6;
  void *v7;
  void *v8;
  FPSearchQueryDataSource *v9;
  void *v10;
  FPSearchQueryDataSource *v11;
  void *v13;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[FPSearchCollection _enumerationSettingsPredicate](v6, "_enumerationSettingsPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItemCollection setAdditionalItemFilteringPredicate:](v6, "setAdditionalItemFilteringPredicate:", v7);

  -[FPSearchCollection _createDescriptorWithSortDescriptors:](v6, "_createDescriptorWithSortDescriptors:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("FPSearchCollection.m"), 42, CFSTR("invalid kind of descriptor class"));

    }
  }
  v9 = [FPSearchQueryDataSource alloc];
  -[FPQueryCollection predicate](v6, "predicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FPSearchQueryDataSource initWithQueryDescriptor:predicate:](v9, "initWithQueryDescriptor:predicate:", v8, v10);

  objc_sync_exit(v6);
  return v11;
}

- (id)_createDescriptorWithSortDescriptors:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FPSearchCollection;
  -[FPQueryCollection _createDescriptorWithSortDescriptors:](&v14, sel__createDescriptorWithSortDescriptors_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSearchCollection searchQuery](self, "searchQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSearchQuery:", v5);

  -[FPSearchCollection searchQuery](self, "searchQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldPerformSemanticSearch");
  objc_msgSend(v4, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowSemanticSearchResults:", v8);

  objc_msgSend(v4, "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "toSpotlightQueryString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchQueryString:", v12);

  objc_msgSend(v4, "setThirdPartySearchOnServer:", objc_msgSend(v11, "shouldPerformThirdPartyServerSearch"));
  objc_msgSend(v4, "setAvoidCoreSpotlightSearch:", objc_msgSend(v11, "avoidCoreSpotlightSearch"));

  return v4;
}

- (id)_enumerationSettingsPredicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  id location;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  location = 0;
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0CB3880];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__FPSearchCollection__enumerationSettingsPredicate__block_invoke;
  v11[3] = &unk_1E444FDC0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "predicateWithBlock:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3528];
  v14[0] = v4;
  v10.receiver = self;
  v10.super_class = (Class)FPSearchCollection;
  -[FPQueryCollection _enumerationSettingsPredicate](&v10, sel__enumerationSettingsPredicate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v8;
}

uint64_t __51__FPSearchCollection__enumerationSettingsPredicate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v12;
  void *v13;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);

  if (!WeakRetained)
  {
    v6 = objc_loadWeakRetained(v4);

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[FPSearchCollection _enumerationSettingsPredicate]_block_invoke");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("FPSearchCollection.m"), 73, CFSTR("weakSelf is nil while evaluating isTrashedPredicate"));

    }
  }
  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v7, "searchQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v8, "trashedItemsMembership"))
  {
    v9 = objc_msgSend(v8, "trashedItemsMembership") == 1;
    v10 = objc_msgSend(v3, "isTrashed") ^ v9;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)isCollectionValidForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  v4 = a3;
  v8 = objc_msgSend(v4, "enumerationOrigin") == 2
    || !self->_filterPredicate
    || (-[FPQueryCollection settings](self, "settings"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "searchQuery"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "shouldPerformThirdPartyServerSearch"),
        v6,
        v5,
        (v7 & 1) != 0)
    || -[NSPredicate evaluateWithObject:](self->_filterPredicate, "evaluateWithObject:", v4);

  return v8;
}

- (void)setSearchQuery:(id)a3
{
  id v4;
  FPSearchCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSPredicate *filterPredicate;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(v4, "filenamePredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(v4, "allowedContentTypesPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  filterPredicate = v5->_filterPredicate;
  v5->_filterPredicate = (NSPredicate *)v10;

  -[FPQueryCollection settings](v5, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSearchQuery:", v4);

  objc_msgSend(v4, "allowedContentTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPQueryCollection settings](v5, "settings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowedFileTypes:", v14);

  objc_sync_exit(v5);
}

- (NSFileProviderSearchQuery)searchQuery
{
  FPSearchCollection *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[FPQueryCollection settings](v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSFileProviderSearchQuery *)v4;
}

- (id)scopedSearchQuery
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPSearchCollection.m"), 135, CFSTR("UNREACHABLE: A search collection should not provide a search query."));

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterPredicate, 0);
}

@end
