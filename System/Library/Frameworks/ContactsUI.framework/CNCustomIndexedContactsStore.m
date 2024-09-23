@implementation CNCustomIndexedContactsStore

- (CNCustomIndexedContactsStore)initWithContactIdentifiers:(id)a3
{
  id v4;
  CNCustomIndexedContactsStore *v5;
  uint64_t v6;
  CNContactStore *contactStore;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *sortedContacts;
  NSArray *indexTitles;
  NSMutableDictionary *v14;
  NSMutableDictionary *indexedContactsAndItsSegments;
  id v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CNSegment *v23;
  CNCustomIndexedContactsStore *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CNCustomIndexedContactsStore;
  v5 = -[CNCustomIndexedContactsStore init](&v31, sel_init);
  if (v5)
  {
    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "contactStore");
    v6 = objc_claimAutoreleasedReturnValue();
    contactStore = v5->_contactStore;
    v5->_contactStore = (CNContactStore *)v6;

    objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "sortOrder");

    v10 = 2;
    if (v9 == 3)
      v10 = 3;
    v5->_preferredSortOrder = v10;
    -[CNCustomIndexedContactsStore fetchAndSortContactsByUserPreferredSortOrderForIdentifiers:](v5, "fetchAndSortContactsByUserPreferredSortOrderForIdentifiers:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    sortedContacts = v5->_sortedContacts;
    v5->_sortedContacts = (NSArray *)v11;

    indexTitles = v5->_indexTitles;
    v5->_indexTitles = (NSArray *)&unk_1E20D38E0;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    indexedContactsAndItsSegments = v5->_indexedContactsAndItsSegments;
    v5->_indexedContactsAndItsSegments = v14;

    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v17 = v5->_indexTitles;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v21);
          v23 = -[CNSegment initWithStart:end:]([CNSegment alloc], "initWithStart:end:", -1, -1);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_indexedContactsAndItsSegments, "setObject:forKeyedSubscript:", v23, v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v19);
    }

    -[CNCustomIndexedContactsStore createIndexedContacts:](v5, "createIndexedContacts:", v5->_sortedContacts);
    v24 = v5;

  }
  return v5;
}

- (void)updateStoreWithContactIdentifiers:(id)a3
{
  void *v4;

  -[CNCustomIndexedContactsStore fetchAndSortContactsByUserPreferredSortOrderForIdentifiers:](self, "fetchAndSortContactsByUserPreferredSortOrderForIdentifiers:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCustomIndexedContactsStore setSortedContacts:](self, "setSortedContacts:", v4);

  -[CNCustomIndexedContactsStore createIndexedContacts:](self, "createIndexedContacts:", self->_sortedContacts);
}

- (id)fetchAndSortContactsByUserPreferredSortOrderForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CNContactStore *contactStore;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsWithIdentifiers:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  contactStore = self->_contactStore;
  v17 = 0;
  -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v7, v6, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  v11 = v10;
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134349056;
      v19 = v13;
      _os_log_impl(&dword_18AC56000, v12, OS_LOG_TYPE_INFO, "Fetched %{public}ld contacts", buf, 0xCu);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = (uint64_t)v11;
      _os_log_error_impl(&dword_18AC56000, v12, OS_LOG_TYPE_ERROR, "Encountered Error while fetching Error: %{public}@", buf, 0xCu);
    }
    goto LABEL_7;
  }
LABEL_8:
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__CNCustomIndexedContactsStore_fetchAndSortContactsByUserPreferredSortOrderForIdentifiers___block_invoke;
  v16[3] = &unk_1E204E170;
  v16[4] = self;
  objc_msgSend(v9, "sortedArrayUsingComparator:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)getNameFromContactAccordingToUserPrefferedSortOrder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  if (-[CNCustomIndexedContactsStore preferredSortOrder](self, "preferredSortOrder") == 2)
  {
    objc_msgSend(v4, "firstName");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "firstName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (v8)
      {
        objc_msgSend(v4, "firstName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "lastName");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(v4, "lastName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "length");

          if (v13)
          {
            v14 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v4, "lastName");
            v15 = objc_claimAutoreleasedReturnValue();
LABEL_12:
            v24 = (void *)v15;
            objc_msgSend(v14, "stringWithFormat:", CFSTR("%@%@"), v9, v15);
            v25 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v25;
            goto LABEL_16;
          }
        }
        goto LABEL_16;
      }
    }
    objc_msgSend(v4, "lastName");
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v9 = (void *)v26;
    goto LABEL_16;
  }
  objc_msgSend(v4, "lastName");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16
    || (v17 = (void *)v16,
        objc_msgSend(v4, "lastName"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "length"),
        v18,
        v17,
        !v19))
  {
    objc_msgSend(v4, "firstName");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend(v4, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    objc_msgSend(v4, "firstName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");

    if (v23)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "firstName");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
LABEL_16:

  return v9;
}

- (int64_t)numberOfSections
{
  void *v4;
  int64_t v5;

  if (-[CNCustomIndexedContactsStore isFilterActive](self, "isFilterActive"))
    return 1;
  -[CNCustomIndexedContactsStore indexTitles](self, "indexTitles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)numberOFItemsInSection:(int64_t)a3
{
  NSArray *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[CNCustomIndexedContactsStore isFilterActive](self, "isFilterActive"))
  {
    -[CNCustomIndexedContactsStore filteredSortedContacts](self, "filteredSortedContacts");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSArray count](v5, "count");
  }
  else
  {
    v5 = self->_indexTitles;
    if (-[NSArray count](v5, "count") <= a3)
    {
      v6 = 0;
    }
    else
    {
      -[NSArray objectAtIndex:](v5, "objectAtIndex:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNCustomIndexedContactsStore indexedContactsAndItsSegments](self, "indexedContactsAndItsSegments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 && objc_msgSend(v9, "isValid"))
        v6 = objc_msgSend(v9, "count");
      else
        v6 = 0;

    }
  }

  return v6;
}

- (id)contactAt:(int64_t)a3 section:(int64_t)a4
{
  NSArray *v7;
  NSArray *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  if (-[CNCustomIndexedContactsStore isFilterActive](self, "isFilterActive"))
  {
    -[CNCustomIndexedContactsStore filteredIndexTitles](self, "filteredIndexTitles");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = self->_indexTitles;
  }
  v8 = v7;
  -[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNCustomIndexedContactsStore isFilterActive](self, "isFilterActive"))
  {
    -[CNCustomIndexedContactsStore filteredSortedContacts](self, "filteredSortedContacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNCustomIndexedContactsStore indexedContactsAndItsSegments](self, "indexedContactsAndItsSegments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "isValid"))
    {
      v13 = objc_msgSend(v10, "indexOffsetFrom:", a3);
      -[CNCustomIndexedContactsStore sortedContacts](self, "sortedContacts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)titleForSection:(int64_t)a3
{
  NSArray *v5;
  NSArray *v6;
  __CFString *v7;

  if (-[CNCustomIndexedContactsStore isFilterActive](self, "isFilterActive"))
  {
    -[CNCustomIndexedContactsStore filteredIndexTitles](self, "filteredIndexTitles");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self->_indexTitles;
  }
  v6 = v5;
  if (-[CNCustomIndexedContactsStore isFilterActive](self, "isFilterActive"))
  {
    v7 = CFSTR("MATCHES");
  }
  else if (-[NSArray count](v6, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", a3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)sectionIndexTitles
{
  void *v3;

  if (-[CNCustomIndexedContactsStore isFilterActive](self, "isFilterActive"))
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[CNCustomIndexedContactsStore indexTitles](self, "indexTitles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)createIndexedContacts:(id)a3
{
  NSMutableDictionary *v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  CNSegment *v12;
  __CFString *v13;
  CNSegment *v14;
  id v15;

  v15 = a3;
  v4 = self->_indexedContactsAndItsSegments;
  if (objc_msgSend(v15, "count"))
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNCustomIndexedContactsStore getNameFromContactAccordingToUserPrefferedSortOrder:](self, "getNameFromContactAccordingToUserPrefferedSortOrder:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "substringToIndex:", 1);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 && -[__CFString length](v10, "length"))
      {
        if (v5)
          goto LABEL_6;
      }
      else
      {

        v11 = CFSTR("#");
        if (v5)
        {
LABEL_6:
          if ((-[__CFString isEqualToString:](v11, "isEqualToString:", v5) & 1) == 0)
          {
            v12 = -[CNSegment initWithStart:end:]([CNSegment alloc], "initWithStart:end:", v6, v7 - 1);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, v5);
            v13 = v11;

            v6 = v7;
            v5 = v13;
          }
          goto LABEL_10;
        }
      }
      v5 = v11;
LABEL_10:

      if (++v7 >= (unint64_t)objc_msgSend(v15, "count"))
      {
        v14 = -[CNSegment initWithStart:end:]([CNSegment alloc], "initWithStart:end:", v6, objc_msgSend(v15, "count") - 1);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v14, v5);

        break;
      }
    }
  }

}

- (void)setFilterString:(id)a3
{
  NSString *v4;
  NSString *filterString;
  NSString *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_filterString, "isEqualToString:"))
  {
    if (objc_msgSend(v7, "length"))
    {
      self->_isFilterActive = 1;
      v4 = (NSString *)objc_msgSend(v7, "copy");
      filterString = self->_filterString;
      self->_filterString = v4;

      -[CNCustomIndexedContactsStore filterContactsForString:](self, "filterContactsForString:", v7);
    }
    else
    {
      self->_isFilterActive = 0;
      v6 = self->_filterString;
      self->_filterString = 0;

    }
  }

}

- (void)filterContactsForString:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSArray *sortedContacts;
  void *v8;
  NSArray *v9;
  NSArray *filteredSortedContacts;
  NSArray *filteredIndexTitles;
  NSArray *v12;
  id v13;
  _QWORD v14[4];
  NSArray *v15;

  v4 = a3;
  objc_msgSend(v4, "localizedLowercaseString");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "componentsSeparatedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_filter:", &__block_literal_global_96_49421);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))();
  if ((v5 & 1) != 0 || !objc_msgSend(v13, "count"))
  {
    objc_storeStrong((id *)&self->_filteredSortedContacts, self->_sortedContacts);
    v12 = self->_indexTitles;
    filteredIndexTitles = self->_filteredIndexTitles;
    self->_filteredIndexTitles = v12;
  }
  else
  {
    sortedContacts = self->_sortedContacts;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__CNCustomIndexedContactsStore_filterContactsForString___block_invoke_2;
    v14[3] = &unk_1E2050520;
    v15 = (NSArray *)v13;
    -[NSArray _cn_filter:](sortedContacts, "_cn_filter:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSArray *)objc_msgSend(v8, "copy");
    filteredSortedContacts = self->_filteredSortedContacts;
    self->_filteredSortedContacts = v9;

    filteredIndexTitles = v15;
  }

}

- (NSString)filterString
{
  return self->_filterString;
}

- (int64_t)preferredSortOrder
{
  return self->_preferredSortOrder;
}

- (void)setPreferredSortOrder:(int64_t)a3
{
  self->_preferredSortOrder = a3;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (NSMutableDictionary)indexedContactsAndItsSegments
{
  return self->_indexedContactsAndItsSegments;
}

- (void)setIndexedContactsAndItsSegments:(id)a3
{
  objc_storeStrong((id *)&self->_indexedContactsAndItsSegments, a3);
}

- (NSArray)indexTitles
{
  return self->_indexTitles;
}

- (void)setIndexTitles:(id)a3
{
  objc_storeStrong((id *)&self->_indexTitles, a3);
}

- (NSArray)filteredIndexTitles
{
  return self->_filteredIndexTitles;
}

- (void)setFilteredIndexTitles:(id)a3
{
  objc_storeStrong((id *)&self->_filteredIndexTitles, a3);
}

- (NSArray)sortedContacts
{
  return self->_sortedContacts;
}

- (void)setSortedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_sortedContacts, a3);
}

- (NSArray)filteredSortedContacts
{
  return self->_filteredSortedContacts;
}

- (void)setFilteredSortedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_filteredSortedContacts, a3);
}

- (BOOL)isFilterActive
{
  return self->_isFilterActive;
}

- (void)setIsFilterActive:(BOOL)a3
{
  self->_isFilterActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredSortedContacts, 0);
  objc_storeStrong((id *)&self->_sortedContacts, 0);
  objc_storeStrong((id *)&self->_filteredIndexTitles, 0);
  objc_storeStrong((id *)&self->_indexTitles, 0);
  objc_storeStrong((id *)&self->_indexedContactsAndItsSegments, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_filterString, 0);
}

uint64_t __56__CNCustomIndexedContactsStore_filterContactsForString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__CNCustomIndexedContactsStore_filterContactsForString___block_invoke_3;
  v8[3] = &unk_1E204E1D8;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "_cn_any:", v8);

  return v6;
}

uint64_t __56__CNCustomIndexedContactsStore_filterContactsForString___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedLowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasPrefix:", v3) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "familyName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedLowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "hasPrefix:", v3);

  }
  return v6;
}

uint64_t __56__CNCustomIndexedContactsStore_filterContactsForString___block_invoke()
{
  return (*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))() ^ 1;
}

uint64_t __91__CNCustomIndexedContactsStore_fetchAndSortContactsByUserPreferredSortOrderForIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  v7 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_opt_class();
  v10 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "getNameFromContactAccordingToUserPrefferedSortOrder:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "getNameFromContactAccordingToUserPrefferedSortOrder:", v12);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v13)
    v16 = v14 == 0;
  else
    v16 = 1;
  if (v16)
  {
    if (v13)
      v17 = 1;
    else
      v17 = -1;
  }
  else
  {
    v17 = objc_msgSend(v13, "localizedCaseInsensitiveCompare:", v14);
  }

  return v17;
}

+ (id)log
{
  if (log_cn_once_token_1_49496 != -1)
    dispatch_once(&log_cn_once_token_1_49496, &__block_literal_global_49497);
  return (id)log_cn_once_object_1_49498;
}

void __35__CNCustomIndexedContactsStore_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "CNCustomIndexedContactsStore");
  v1 = (void *)log_cn_once_object_1_49498;
  log_cn_once_object_1_49498 = (uint64_t)v0;

}

@end
