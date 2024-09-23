@implementation CNContactAsyncDataSource

- (CNContactAsyncDataSource)initWithStore:(id)a3
{
  id v4;
  CNContactAsyncDataSource *v5;
  CNContactAsyncDataSource *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CNContactStoreFilter *filter;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNContactAsyncDataSource;
  v5 = -[CNContactAsyncDataSource init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CNContactAsyncDataSource setStore:](v5, "setStore:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactAsyncDataSource setResultingContacts:](v6, "setResultingContacts:", v7);

    objc_msgSend(MEMORY[0x1E0D13B70], "providerWithBackgroundConcurrencyLimit:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactAsyncDataSource setReloadSchedulerProvider:](v6, "setReloadSchedulerProvider:", v8);

    v9 = objc_alloc_init(MEMORY[0x1E0D13B30]);
    -[CNContactAsyncDataSource setReloadStream:](v6, "setReloadStream:", v9);

    -[CNContactAsyncDataSource reloadStream](v6, "reloadStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactAsyncDataSource reloadSchedulerProvider](v6, "reloadSchedulerProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "throttle:schedulerProvider:", v11, 0.75);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13AF0], "observerWithWeakTarget:resultSelector:", v6, sel_reloadWithRequest_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subscribe:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactAsyncDataSource setReloadStreamCancelationToken:](v6, "setReloadStreamCancelationToken:", v14);

    v15 = objc_opt_new();
    filter = v6->_filter;
    v6->_filter = (CNContactStoreFilter *)v15;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc((Class)objc_opt_class());
  -[CNContactAsyncDataSource store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithStore:", v5);

  -[CNContactAsyncDataSource resultingContacts](self, "resultingContacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v6, "setResultingContacts:", v8);

  -[CNContactAsyncDataSource contactFormatter](self, "contactFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContactFormatter:", v9);

  -[CNContactAsyncDataSource allKeysToFetchForTransientContacts](self, "allKeysToFetchForTransientContacts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllKeysToFetchForTransientContacts:", v10);

  -[CNContactAsyncDataSource filter](self, "filter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilter:", v11);

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CNContactAsyncDataSource invalidateSearch](self, "invalidateSearch");
  -[CNContactAsyncDataSource reloadStreamCancelationToken](self, "reloadStreamCancelationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CNContactAsyncDataSource setReloadStreamCancelationToken:](self, "setReloadStreamCancelationToken:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CNContactAsyncDataSource;
  -[CNContactAsyncDataSource dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldReturnToAccountsAndGroupsViewAfterSearchIsCanceled
{
  return 1;
}

- (void)setDelegate:(id)a3
{
  id v4;
  CNContactDataSourceSafeDelegate *v5;
  CNContactDataSourceSafeDelegate *delegate;
  id v7;

  v7 = a3;
  -[CNContactDataSourceSafeDelegate delegate](self->_delegate, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v7)
  {
    v5 = -[CNContactDataSourceSafeDelegate initWithDelegate:]([CNContactDataSourceSafeDelegate alloc], "initWithDelegate:", v7);
    delegate = self->_delegate;
    self->_delegate = v5;

  }
}

- (CNContactDataSourceDelegate)delegate
{
  return -[CNContactDataSourceSafeDelegate delegate](self->_delegate, "delegate");
}

- (NSArray)contacts
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  -[CNContactAsyncDataSource resultingContacts](self, "resultingContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)preferredForNameMeContactIdentifier
{
  return 0;
}

- (NSDictionary)contactMatchInfos
{
  return 0;
}

- (NSArray)sections
{
  return 0;
}

- (NSArray)indexSections
{
  return 0;
}

- (BOOL)canReload
{
  return 1;
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SEARCH_NAV_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)completeContactFromContact:(id)a3 fromMainStoreOnly:(BOOL)a4 keysToFetch:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;

  v7 = a3;
  v8 = a5;
  -[CNContactAsyncDataSource filter](self, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isServerFilter") & 1) != 0)
  {
    -[CNContactAsyncDataSource resultingContacts](self, "resultingContacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v7);

    if (v11)
    {
      v12 = v7;
      goto LABEL_8;
    }
  }
  else
  {

  }
  -[CNContactAsyncDataSource store](self, "store");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v13, "unifiedContactWithIdentifier:keysToFetch:error:", v14, v8, &v21);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v21;

  if (v15)
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactAsyncDataSource.m", 165, 3, CFSTR("Error completing contact: %@"), v16, v17, v18, v19, (uint64_t)v15);

LABEL_8:
  return v12;
}

- (id)indexPathForContact:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v4 = a3;
  -[CNContactAsyncDataSource contacts](self, "contacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v10)
        break;

      if (++v6 >= (unint64_t)objc_msgSend(v5, "count"))
        goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v11 = 0;
  }

  return v11;
}

- (void)reload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[CNContactAsyncDataSource filter](self, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isServerFilter") & 1) != 0)
  {
    -[CNContactAsyncDataSource allKeysToFetchForTransientContacts](self, "allKeysToFetchForTransientContacts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNContactAsyncDataSource contactFormatter](self, "contactFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptorForRequiredKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v4);
  -[CNContactStoreFilter predicate](self->_filter, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  -[CNContactAsyncDataSource reloadStream](self, "reloadStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "observerDidReceiveResult:", v7);

}

- (void)reloadWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD aBlock[5];
  id v19;
  _QWORD v20[3];
  char v21;
  id location;

  v4 = a3;
  -[CNContactAsyncDataSource invalidateSearch](self, "invalidateSearch");
  -[CNContactAsyncDataSource filter](self, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isServerFilter"))
    goto LABEL_4;
  objc_msgSend(v5, "fullTextString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[CNContactAsyncDataSource setNetworkActivityIndicatorVisible:](self, "setNetworkActivityIndicatorVisible:", 1);
LABEL_4:
    objc_initWeak(&location, self);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v21 = 1;
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__CNContactAsyncDataSource_reloadWithRequest___block_invoke;
    aBlock[3] = &unk_1E204F070;
    objc_copyWeak(&v19, &location);
    aBlock[4] = v20;
    v9 = _Block_copy(aBlock);
    -[CNContactAsyncDataSource store](self, "store");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __46__CNContactAsyncDataSource_reloadWithRequest___block_invoke_2;
    v15[3] = &unk_1E204F0C0;
    objc_copyWeak(&v17, &location);
    v16 = v9;
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __46__CNContactAsyncDataSource_reloadWithRequest___block_invoke_4;
    v13[3] = &unk_1E204F0E8;
    v11 = v16;
    v13[4] = self;
    v14 = v11;
    objc_msgSend(v10, "executeFetchRequest:progressiveResults:completion:", v4, v15, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactAsyncDataSource setSearchCancelationToken:](self, "setSearchCancelationToken:", v12);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    _Block_object_dispose(v20, 8);
    objc_destroyWeak(&location);
  }

}

- (void)invalidateResults
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAsyncDataSource setResultingContacts:](self, "setResultingContacts:", v3);

  -[CNContactAsyncDataSource delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactDataSourceDidChange:", self);

}

- (void)invalidateSearch
{
  void *v3;

  -[CNContactAsyncDataSource searchCancelationToken](self, "searchCancelationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CNContactAsyncDataSource setNetworkActivityIndicatorVisible:](self, "setNetworkActivityIndicatorVisible:", 0);
}

- (void)invalidate
{
  -[CNContactAsyncDataSource invalidateSearch](self, "invalidateSearch");
  -[CNContactAsyncDataSource invalidateResults](self, "invalidateResults");
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (CNContactStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (CNContactStoreFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)allKeysToFetchForTransientContacts
{
  return self->_allKeysToFetchForTransientContacts;
}

- (void)setAllKeysToFetchForTransientContacts:(id)a3
{
  objc_storeStrong((id *)&self->_allKeysToFetchForTransientContacts, a3);
}

- (CNCancelable)searchCancelationToken
{
  return self->_searchCancelationToken;
}

- (void)setSearchCancelationToken:(id)a3
{
  objc_storeStrong((id *)&self->_searchCancelationToken, a3);
}

- (CNCancelable)reloadStreamCancelationToken
{
  return self->_reloadStreamCancelationToken;
}

- (void)setReloadStreamCancelationToken:(id)a3
{
  objc_storeStrong((id *)&self->_reloadStreamCancelationToken, a3);
}

- (CNSchedulerProvider)reloadSchedulerProvider
{
  return self->_reloadSchedulerProvider;
}

- (void)setReloadSchedulerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_reloadSchedulerProvider, a3);
}

- (CNPublishingSubject)reloadStream
{
  return self->_reloadStream;
}

- (void)setReloadStream:(id)a3
{
  objc_storeStrong((id *)&self->_reloadStream, a3);
}

- (NSMutableArray)resultingContacts
{
  return self->_resultingContacts;
}

- (void)setResultingContacts:(id)a3
{
  objc_storeStrong((id *)&self->_resultingContacts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultingContacts, 0);
  objc_storeStrong((id *)&self->_reloadStream, 0);
  objc_storeStrong((id *)&self->_reloadSchedulerProvider, 0);
  objc_storeStrong((id *)&self->_reloadStreamCancelationToken, 0);
  objc_storeStrong((id *)&self->_searchCancelationToken, 0);
  objc_storeStrong((id *)&self->_allKeysToFetchForTransientContacts, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

void __46__CNContactAsyncDataSource_reloadWithRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "invalidateResults");
    WeakRetained = v3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

void __46__CNContactAsyncDataSource_reloadWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CNContactAsyncDataSource_reloadWithRequest___block_invoke_3;
  block[3] = &unk_1E204F098;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  block[4] = WeakRetained;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __46__CNContactAsyncDataSource_reloadWithRequest___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setNetworkActivityIndicatorVisible:", 0);
}

void __46__CNContactAsyncDataSource_reloadWithRequest___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "resultingContacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactDataSourceDidChange:", *(_QWORD *)(a1 + 32));

}

@end
