@implementation CNContactCustomDataSource

- (CNContactCustomDataSource)initWithContacts:(id)a3 keysToFetch:(id)a4
{
  return -[CNContactCustomDataSource initWithContacts:keysToFetch:filter:](self, "initWithContacts:keysToFetch:filter:", a3, a4, 0);
}

- (CNContactCustomDataSource)initWithContacts:(id)a3 keysToFetch:(id)a4 filter:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNContactCustomDataSource *v11;
  void *v12;
  CNContactFilter *v13;
  id v14;
  NSMapTable *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CNContactCustomDataSource;
  v11 = -[CNContactCustomDataSource init](&v29, sel_init);
  v12 = (void *)objc_msgSend(v8, "mutableCopy");
  -[CNContactCustomDataSource setAllContacts:](v11, "setAllContacts:", v12);

  v24 = v9;
  -[CNContactCustomDataSource setKeysToFetch:](v11, "setKeysToFetch:", v9);
  if (v10)
  {
    -[CNContactCustomDataSource setFilter:](v11, "setFilter:", v10);
  }
  else
  {
    v13 = objc_alloc_init(CNContactFilter);
    -[CNContactCustomDataSource setFilter:](v11, "setFilter:", v13);

  }
  v14 = objc_alloc_init(MEMORY[0x1E0C97218]);
  -[CNContactCustomDataSource setContactFormatterImpl:](v11, "setContactFormatterImpl:", v14);

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 1282);
  v15 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v26;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v21), "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        ++v21;
        NSMapInsert(v15, v22, (const void *)(v19 + v21));

      }
      while (v18 != v21);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v19 += v21;
    }
    while (v18);
  }

  -[CNContactCustomDataSource setIdentifiersToIndexes:](v11, "setIdentifiersToIndexes:", v15);
  -[CNContactCustomDataSource setAutoUpdateContacts:](v11, "setAutoUpdateContacts:", 1);

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[CNContactCustomDataSource _stopObservingContacts](self, "_stopObservingContacts");
  v3.receiver = self;
  v3.super_class = (Class)CNContactCustomDataSource;
  -[CNContactCustomDataSource dealloc](&v3, sel_dealloc);
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
  void *v12;

  v4 = objc_alloc((Class)objc_opt_class());
  -[CNContactCustomDataSource contacts](self, "contacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[CNContactCustomDataSource keysToFetch](self, "keysToFetch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[CNContactCustomDataSource filter](self, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = (void *)objc_msgSend(v4, "initWithContacts:keysToFetch:filter:", v6, v8, v10);

  -[CNContactCustomDataSource contactFormatter](self, "contactFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContactFormatter:", v12);

  return v11;
}

- (id)preferredForNameMeContactIdentifier
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

- (NSDictionary)contactMatchInfos
{
  return 0;
}

- (id)completeContactFromContact:(id)a3 fromMainStoreOnly:(BOOL)a4 keysToFetch:(id)a5
{
  return a3;
}

- (id)indexPathForContact:(id)a3
{
  void *v4;
  void *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CNContactCustomDataSource contacts](self, "contacts", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (char *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      v9 = 0;
      v10 = &v6[(_QWORD)v7];
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isEqual:", v11);

        if ((v12 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", &v9[(_QWORD)v7], 0);
          v6 = (char *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = (char *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 = v10;
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setFilter:(id)a3
{
  CNContactFilter *v5;
  void *v6;
  CNContactFilter *v7;

  v5 = (CNContactFilter *)a3;
  if (self->_filter != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_filter, a3);
    -[CNContactCustomDataSource _updateFilter](self, "_updateFilter");
    -[CNContactCustomDataSource delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactDataSourceDidChange:", self);

    v5 = v7;
  }

}

- (void)_updateFilter
{
  void *v3;
  NSMutableArray *allContacts;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  -[CNContactFilter predicate](self->_filter, "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  allContacts = self->_allContacts;
  v7 = v3;
  if (v3)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__CNContactCustomDataSource__updateFilter__block_invoke;
    v9[3] = &unk_1E204C658;
    v10 = v3;
    -[NSMutableArray indexesOfObjectsPassingTest:](allContacts, "indexesOfObjectsPassingTest:", v9, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      -[NSMutableArray objectsAtIndexes:](self->_allContacts, "objectsAtIndexes:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactCustomDataSource setFilteredContacts:](self, "setFilteredContacts:", v6);

    }
    else
    {
      -[CNContactCustomDataSource setFilteredContacts:](self, "setFilteredContacts:", MEMORY[0x1E0C9AA60]);
    }

  }
  else
  {
    -[CNContactCustomDataSource setFilteredContacts:](self, "setFilteredContacts:", allContacts, 0);
  }

}

- (BOOL)canReload
{
  return 0;
}

- (void)setAutoUpdateContacts:(BOOL)a3
{
  if (self->_autoUpdateContacts != a3)
  {
    self->_autoUpdateContacts = a3;
    -[CNContactCustomDataSource _updateContactsObserving](self, "_updateContactsObserving");
  }
}

- (void)_startObservingContacts
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CNContactCustomDataSource allContacts](self, "allContacts", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "contactChangesNotifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactCustomDataSource keysToFetch](self, "keysToFetch");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "registerObserver:forContact:keysToFetch:", self, v8, v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)_stopObservingContacts
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CNContactCustomDataSource allContacts](self, "allContacts", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "contactChangesNotifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "unregisterObserver:forContact:", self, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_updateContactsObserving
{
  if (self->_autoUpdateContacts != self->_observingContacts)
  {
    if (self->_autoUpdateContacts)
      -[CNContactCustomDataSource _startObservingContacts](self, "_startObservingContacts");
    else
      -[CNContactCustomDataSource _stopObservingContacts](self, "_stopObservingContacts");
    self->_observingContacts = self->_autoUpdateContacts;
  }
}

- (void)contactDidChange:(id)a3
{
  id v4;
  void *v5;
  NSMapTable *v6;
  void *v7;
  _BOOL4 v8;
  void *value;

  v4 = a3;
  -[CNContactCustomDataSource delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    value = 0;
    -[CNContactCustomDataSource identifiersToIndexes](self, "identifiersToIndexes");
    v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = NSMapMember(v6, v7, 0, &value);

    if (v8)
    {
      value = (char *)value - 1;
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_allContacts, "replaceObjectAtIndex:withObject:");
    }
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__sendDataSourceDidChange, 0);
    -[CNContactCustomDataSource performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__sendDataSourceDidChange, 0, 0.0);
  }

}

- (void)_sendDataSourceDidChange
{
  id v3;

  -[CNContactCustomDataSource delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactDataSourceDidChange:", self);

}

- (CNContactDataSourceDelegate)delegate
{
  return (CNContactDataSourceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (CNContactFilter)filter
{
  return self->_filter;
}

- (BOOL)autoUpdateContacts
{
  return self->_autoUpdateContacts;
}

- (NSMutableArray)allContacts
{
  return self->_allContacts;
}

- (void)setAllContacts:(id)a3
{
  objc_storeStrong((id *)&self->_allContacts, a3);
}

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

- (void)setKeysToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_keysToFetch, a3);
}

- (NSMapTable)identifiersToIndexes
{
  return self->_identifiersToIndexes;
}

- (void)setIdentifiersToIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersToIndexes, a3);
}

- (NSArray)filteredContacts
{
  return self->_filteredContacts;
}

- (void)setFilteredContacts:(id)a3
{
  objc_storeStrong((id *)&self->_filteredContacts, a3);
}

- (BOOL)observingContacts
{
  return self->_observingContacts;
}

- (void)setObservingContacts:(BOOL)a3
{
  self->_observingContacts = a3;
}

- (CNContactFormatter)contactFormatterImpl
{
  return self->_contactFormatterImpl;
}

- (void)setContactFormatterImpl:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatterImpl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFormatterImpl, 0);
  objc_storeStrong((id *)&self->_filteredContacts, 0);
  objc_storeStrong((id *)&self->_identifiersToIndexes, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_allContacts, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_destroyWeak((id *)&self->delegate);
}

uint64_t __42__CNContactCustomDataSource__updateFilter__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", a2);
}

- (CNContactCustomDataSource)initWithContacts:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CNContactCustomDataSource *v14;
  void *v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C97218];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setStyle:", 1001);
  objc_msgSend(v6, "setFallbackStyle:", -1);
  v7 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(v6, "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  +[CNAvatarView descriptorForRequiredKeys](CNAvatarView, "descriptorForRequiredKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  +[CNQuickActionsView descriptorForRequiredKeys](CNQuickActionsView, "descriptorForRequiredKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptorWithKeyDescriptors:description:", v11, CFSTR("Temporary Descriptor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CNContactCustomDataSource initWithContacts:keysToFetch:filter:](self, "initWithContacts:keysToFetch:filter:", v5, v13, 0);

  return v14;
}

@end
