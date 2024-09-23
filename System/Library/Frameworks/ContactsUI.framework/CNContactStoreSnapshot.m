@implementation CNContactStoreSnapshot

uint64_t __60__CNContactStoreSnapshot__loadContactsInRange_inBackground___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (NSArray)contacts
{
  return (NSArray *)-[CNContactStoreSnapshot valueForKey:](self, "valueForKey:", CFSTR("_contacts"));
}

- (unint64_t)countOf_contacts
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t contactsCount;

  -[CNContactStoreSnapshot dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contactsCount == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (-[CNContactStoreFilter showsEverything](self->_filter, "showsEverything"))
    {
      objc_msgSend(v3, "store");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "unifiedContactCountWithError:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      self->_contactsCount = objc_msgSend(v5, "unsignedIntegerValue");

    }
    else
    {
      -[CNContactStoreSnapshot _loadAllContacts](self, "_loadAllContacts");
    }
  }
  contactsCount = self->_contactsCount;

  return contactsCount;
}

- (CNContactStoreDataSource)dataSource
{
  return (CNContactStoreDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (NSArray)sections
{
  CNContactStoreSnapshot *v2;
  uint64_t v3;
  NSArray *sections;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  CNContactSection *v15;
  void *v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  CNContactSection *v37;
  CNContactSection *v38;
  void *v39;
  uint64_t v40;
  NSArray *v41;
  NSArray *v42;
  NSArray *v43;
  NSArray *v44;
  NSArray *v45;
  NSArray *v46;
  void *v48;
  CNContactStoreSnapshot *v49;
  NSArray *v50;
  void *v51;
  void *v52;
  id obj;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v2 = self;
  v60 = *MEMORY[0x1E0C80C00];
  if (!-[CNContactStoreFilter showsEverything](self->_filter, "showsEverything"))
    -[CNContactStoreSnapshot _loadAllContacts](v2, "_loadAllContacts");
  if (!v2->_sections)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
    sections = v2->_sections;
    v2->_sections = (NSArray *)v3;

    if (-[CNContactStoreFilter supportsSections](v2->_filter, "supportsSections"))
    {
      -[CNContactStoreSnapshot contacts](v2, "contacts");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6 >= 6)
      {
        -[CNContactStoreSnapshot dataSource](v2, "dataSource");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sectionHeadersDictionary");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNContactStoreSnapshot dataSource](v2, "dataSource");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedSectionHeaders");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNContactStoreSnapshot dataSource](v2, "dataSource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "store");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactStoreSnapshot dataSource](v2, "dataSource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sectionListOffsetsForSortOrder:error:", objc_msgSend(v11, "sortOrder"), 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v49 = v2;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
          v50 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          obj = v12;
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
          v48 = v12;
          if (v13)
          {
            v14 = v13;
            v15 = 0;
            v54 = *(_QWORD *)v56;
            v16 = v52;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v56 != v54)
                  objc_enumerationMutation(obj);
                v18 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
                objc_msgSend(v18, "first");
                v19 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectForKeyedSubscript:", v19);
                v20 = objc_claimAutoreleasedReturnValue();
                v21 = (void *)v20;
                v22 = CFSTR("#");
                if (v20)
                  v22 = (__CFString *)v20;
                v23 = v22;

                -[CNContactSection sortKey](v15, "sortKey");
                v24 = objc_claimAutoreleasedReturnValue();
                if (v19 | v24
                  && (v25 = (void *)v24,
                      -[CNContactSection sortKey](v15, "sortKey"),
                      v26 = (void *)objc_claimAutoreleasedReturnValue(),
                      v27 = objc_msgSend(v26, "isEqual:", v19),
                      v26,
                      v25,
                      !v27))
                {
                  if (v15)
                  {
                    v31 = -[CNContactSection range](v15, "range");
                    v28 = v31 + v32;
                  }
                  else
                  {
                    v28 = 0;
                  }
                  objc_msgSend(v51, "objectForKeyedSubscript:", v23);
                  v33 = objc_claimAutoreleasedReturnValue();
                  v34 = (void *)v33;
                  if (v33)
                    v35 = (void *)v33;
                  else
                    v35 = v23;
                  v36 = v35;

                  v37 = objc_alloc_init(CNContactSection);
                  -[CNContactSection setSortKey:](v37, "setSortKey:", v19);
                  -[CNContactSection setTitle:](v37, "setTitle:", v36);
                  -[CNContactSection setIdentifier:](v37, "setIdentifier:", v23);
                  v38 = v37;

                  -[NSArray addObject:](v50, "addObject:", v38);
                  v30 = 0;
                  v15 = v38;
                  v16 = v52;
                }
                else
                {
                  v28 = -[CNContactSection range](v15, "range");
                  v30 = v29;
                  v15 = v15;
                }
                objc_msgSend(v18, "second");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v39, "integerValue") + v30;

                -[CNContactSection setRange:](v15, "setRange:", v28, v40);
              }
              v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
            }
            while (v14);
          }
          else
          {
            v15 = 0;
          }

          v2 = v49;
          v41 = v49->_sections;
          v49->_sections = v50;
          v42 = v50;

          v12 = v48;
        }

      }
    }
  }
  v43 = v2->_sections;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v44 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v43 == v44)
    v45 = 0;
  else
    v45 = v2->_sections;
  v46 = v45;

  return v46;
}

- (NSArray)indexSections
{
  CNContactStoreSnapshot *v2;
  NSArray *indexSections;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  unsigned int v25;
  NSArray *v26;
  NSArray *v27;
  NSArray *v28;
  CNContactStoreSnapshot *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v2 = self;
  v41 = *MEMORY[0x1E0C80C00];
  indexSections = self->_indexSections;
  if (!indexSections)
  {
    -[CNContactStoreSnapshot sections](self, "sections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[CNContactStoreSnapshot dataSource](v2, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexSectionsArray");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "initWithArray:copyItems:", v7, 1);
    v9 = v2->_indexSections;
    v2->_indexSections = (NSArray *)v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v13);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v30 = v2;
    v17 = v2->_indexSections;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
      v21 = -1;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v17);
          v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v23, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v10, "containsObject:", v24);

          v21 += v25;
          objc_msgSend(v23, "setRange:", v21 & ~(v21 >> 63), 0);
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v19);
    }

    v2 = v30;
    indexSections = v30->_indexSections;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (indexSections == v26)
    v27 = 0;
  else
    v27 = v2->_indexSections;
  v28 = v27;

  return v28;
}

- (id)objectIn_contactsAtIndex:(unint64_t)a3
{
  unint64_t contactsCount;
  unint64_t v6;
  uint64_t v7;
  unint64_t lastRequestedIndex;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  unint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  const void *v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  NSUInteger location;
  _BOOL4 v24;
  NSObject *v25;
  NSMutableDictionary *contactMatchInfos;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  _QWORD block[7];

  contactsCount = self->_contactsCount;
  if (contactsCount <= a3)
    return 0;
  if (a3 >= 0x32)
    v6 = a3 - 50;
  else
    v6 = 0;
  if (v6 + 100 <= contactsCount)
    v7 = 100;
  else
    v7 = contactsCount - v6;
  lastRequestedIndex = self->_lastRequestedIndex;
  v9 = v7 + v6;
  v10 = 100;
  if (v7 + v6 + 100 > contactsCount)
    v10 = contactsCount - (v7 + v6);
  if (lastRequestedIndex >= a3)
  {
    v9 = 0;
    v10 = 0;
  }
  if ((uint64_t)(v6 - 100) >= 0)
    v11 = v6 - 99;
  else
    v11 = 0;
  v12 = contactsCount - v11;
  v13 = v11 + 100 > contactsCount;
  v14 = 100;
  if (v13)
    v14 = v12;
  if (lastRequestedIndex > a3)
    v15 = v6;
  else
    v15 = v9;
  if (lastRequestedIndex > a3)
    v16 = v14;
  else
    v16 = v10;
  if (lastRequestedIndex > a3)
    v17 = v11;
  else
    v17 = v9;
  self->_lastRequestedIndex = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_cacheAccessSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v18 = (const void *)(a3 + 1);
  NSMapGet(self->_contactsCache, (const void *)(a3 + 1));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (self->_currentlyLoadingBackgroundRange.length)
  {
    v21 = 0;
    if (v19)
      goto LABEL_32;
  }
  else
  {
    v21 = NSMapGet(self->_contactsCache, (const void *)(v15 + 1)) == 0;
    if (v20)
      goto LABEL_32;
  }
  location = self->_currentlyLoadingBackgroundRange.location;
  if (location > a3)
  {
LABEL_32:
    v24 = 0;
    if (!v21)
      goto LABEL_34;
    goto LABEL_33;
  }
  v24 = self->_currentlyLoadingBackgroundRange.length + location >= a3;
  if (v21)
  {
LABEL_33:
    self->_currentlyLoadingBackgroundRange.location = v17;
    self->_currentlyLoadingBackgroundRange.length = v16;
  }
LABEL_34:
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_cacheAccessSemaphore);
  if (!v20)
  {
    if (!v24)
    {
      -[CNContactStoreSnapshot _loadContactsInRange:inBackground:](self, "_loadContactsInRange:inBackground:", v6, v7, 0);
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_cacheAccessSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      NSMapGet(self->_contactsCache, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_cacheAccessSemaphore);
      if (!v21)
        goto LABEL_39;
      goto LABEL_38;
    }
    do
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_cacheAccessSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      NSMapGet(self->_contactsCache, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_cacheAccessSemaphore);
    }
    while (!v20);
  }
  if (v21)
  {
LABEL_38:
    dispatch_get_global_queue(2, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__CNContactStoreSnapshot_objectIn_contactsAtIndex___block_invoke;
    block[3] = &unk_1E204E668;
    block[4] = self;
    block[5] = v17;
    block[6] = v16;
    dispatch_async(v25, block);

  }
LABEL_39:
  if (-[NSMutableDictionary count](self->_contactMatchInfos, "count"))
  {
    contactMatchInfos = self->_contactMatchInfos;
    objc_msgSend(v20, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](contactMatchInfos, "objectForKey:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v28, "excerpt");
      v29 = objc_claimAutoreleasedReturnValue();
      if (!v29)
        goto LABEL_43;
      v30 = (void *)v29;
      objc_msgSend(v28, "excerpt");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "future");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isFinished");

      if ((v33 & 1) == 0)
LABEL_43:
        -[CNContactStoreSnapshot _generateExcerptsInRange:](self, "_generateExcerptsInRange:", v6, v7);
    }

  }
  return v20;
}

- (NSMutableDictionary)contactMatchInfos
{
  return self->_contactMatchInfos;
}

- (void)_loadContactsInRange:(_NSRange)a3 inBackground:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger length;
  int64_t location;
  CNContactStoreSnapshot *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSMapTable *identifiersToIndexPath;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSMapTable *v36;
  void *v37;
  char v38;
  NSObject *v39;
  char v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  CNContactStoreSnapshot *v49;
  uint64_t v50;
  int64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  id v62;
  uint8_t buf[4];
  id v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v4 = a4;
  length = a3.length;
  location = a3.location;
  v7 = self;
  v67 = *MEMORY[0x1E0C80C00];
  -[CNContactStoreSnapshot dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactStoreFilter showsEverything](v7->_filter, "showsEverything"))
  {
    v42 = v4;
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForPreferredNameInRange:", location, length);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0C97210]);
    -[CNContactStoreSnapshot _keysToFetch](v7, "_keysToFetch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithKeysToFetch:", v11);

    objc_msgSend(v12, "setSortOrder:", objc_msgSend(v8, "sortOrder"));
    v43 = (void *)v9;
    objc_msgSend(v12, "setPredicate:", v9);
    objc_msgSend(v12, "setUnifyResults:", objc_msgSend(v8, "fetchUnified"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v8;
    objc_msgSend(v8, "store");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __60__CNContactStoreSnapshot__loadContactsInRange_inBackground___block_invoke;
    v60[3] = &unk_1E204E690;
    v15 = v13;
    v61 = v15;
    v41 = v12;
    v40 = objc_msgSend(v14, "enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:", v12, &v62, v60);
    v44 = v62;

    dispatch_semaphore_wait((dispatch_semaphore_t)v7->_cacheAccessSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    -[CNContactStoreSnapshot sections](v7, "sections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v57;
      v48 = v16;
      v49 = v7;
      v46 = *(_QWORD *)v57;
      v47 = v17;
      do
      {
        v21 = 0;
        v50 = v19;
        do
        {
          if (*(_QWORD *)v57 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v21);
          identifiersToIndexPath = v7->_identifiersToIndexPath;
          objc_msgSend(v22, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable objectForKey:](identifiersToIndexPath, "objectForKey:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            ++location;
          }
          else
          {
            if (v16)
            {
              v54 = 0u;
              v55 = 0u;
              v52 = 0u;
              v53 = 0u;
              v26 = v16;
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
              v51 = location;
              if (v27)
              {
                v28 = v27;
                v29 = 0;
                v30 = *(_QWORD *)v53;
                v31 = location;
                while (2)
                {
                  v32 = 0;
                  v33 = v29 + v28;
                  location = v31;
                  do
                  {
                    if (*(_QWORD *)v53 != v30)
                      objc_enumerationMutation(v26);
                    objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v32), "range");
                    v31 = location - v34;
                    if (location < v34)
                    {
                      v33 = v29 + v32;
                      goto LABEL_22;
                    }
                    ++v32;
                    location -= v34;
                  }
                  while (v28 != v32);
                  v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
                  v29 = v33;
                  if (v28)
                    continue;
                  break;
                }
              }
              else
              {
                v33 = 0;
LABEL_22:
                v31 = location;
              }

              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v31, v33);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v48;
              v7 = v49;
              location = v51;
              v20 = v46;
              v17 = v47;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", location, 0);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v36 = v7->_identifiersToIndexPath;
            objc_msgSend(v22, "identifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMapTable setObject:forKey:](v36, "setObject:forKey:", v35, v37);

            NSMapInsert(v7->_contactsCache, (const void *)++location, v22);
            v19 = v50;
          }
          ++v21;
        }
        while (v21 != v19);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      }
      while (v19);
    }

    if (v42)
    {
      v7->_currentlyLoadingBackgroundRange.location = 0;
      v7->_currentlyLoadingBackgroundRange.length = 0;
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)v7->_cacheAccessSemaphore);

    v38 = v40;
    if (!v44)
      v38 = 1;
    if ((v38 & 1) == 0)
    {
      CNUILogContactStoreDataSource();
      v39 = objc_claimAutoreleasedReturnValue();
      v8 = v45;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v44;
        _os_log_error_impl(&dword_18AC56000, v39, OS_LOG_TYPE_ERROR, "Error fetching contacts: %@", buf, 0xCu);
      }
      goto LABEL_37;
    }
    v8 = v45;
    if (v44)
    {
      CNUILogContactStoreDataSource();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v44;
        _os_log_impl(&dword_18AC56000, v39, OS_LOG_TYPE_INFO, "Non fatal error during contacts fetching: %@", buf, 0xCu);
      }
LABEL_37:

    }
  }

}

- (void)dealloc
{
  NSPointerArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
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
  v3 = self->_summarizationFutures;
  v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "cancel");
      }
      while (v5 != v7);
      v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)CNContactStoreSnapshot;
  -[CNContactStoreSnapshot dealloc](&v8, sel_dealloc);
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (void)setFilter:(id)a3
{
  objc_storeStrong((id *)&self->_filter, a3);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void)prepareEnoughContacts
{
  NSObject *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  CNUILogContactStoreDataSource();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v7 = 134217984;
    v8 = 100;
    _os_log_debug_impl(&dword_18AC56000, v3, OS_LOG_TYPE_DEBUG, "preparationSize: %ld", (uint8_t *)&v7, 0xCu);
  }

  -[CNContactStoreSnapshot contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 0x64)
    v6 = 100;
  else
    v6 = v5;
  -[CNContactStoreSnapshot _loadContactsInRange:inBackground:](self, "_loadContactsInRange:inBackground:", 0, v6, 0);
}

- (CNContactStoreSnapshot)init
{
  CNContactStoreSnapshot *v2;
  uint64_t v3;
  NSMapTable *contactsCache;
  uint64_t v5;
  NSMapTable *identifiersToIndexPath;
  uint64_t v7;
  NSMutableAttributedString *emptyExcerptInstanceMarker;
  dispatch_semaphore_t v9;
  OS_dispatch_semaphore *cacheAccessSemaphore;
  CNContactDataSourceLIFOScheduler *v11;
  CNContactDataSourceLIFOScheduler *summarizationQueue;
  uint64_t v13;
  NSPointerArray *summarizationFutures;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CNContactStoreSnapshot;
  v2 = -[CNContactStoreSnapshot init](&v16, sel_init);
  v2->_contactsCount = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  contactsCache = v2->_contactsCache;
  v2->_contactsCache = (NSMapTable *)v3;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v5 = objc_claimAutoreleasedReturnValue();
  identifiersToIndexPath = v2->_identifiersToIndexPath;
  v2->_identifiersToIndexPath = (NSMapTable *)v5;

  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", &stru_1E20507A8, 0);
  emptyExcerptInstanceMarker = v2->_emptyExcerptInstanceMarker;
  v2->_emptyExcerptInstanceMarker = (NSMutableAttributedString *)v7;

  v9 = dispatch_semaphore_create(1);
  cacheAccessSemaphore = v2->_cacheAccessSemaphore;
  v2->_cacheAccessSemaphore = (OS_dispatch_semaphore *)v9;

  v11 = objc_alloc_init(CNContactDataSourceLIFOScheduler);
  summarizationQueue = v2->_summarizationQueue;
  v2->_summarizationQueue = v11;

  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v13 = objc_claimAutoreleasedReturnValue();
  summarizationFutures = v2->_summarizationFutures;
  v2->_summarizationFutures = (NSPointerArray *)v13;

  return v2;
}

- (NSMapTable)identifiersToIndexPath
{
  return self->_identifiersToIndexPath;
}

- (id)_keysToFetch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactStoreSnapshot dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keysToFetch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "keysToFetch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  objc_msgSend(v4, "contactFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "contactFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptorForRequiredKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  if (!objc_msgSend(v3, "count"))
  {
    +[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiersToIndexPath, 0);
  objc_storeStrong((id *)&self->_summarizationFutures, 0);
  objc_storeStrong((id *)&self->_summarizationQueue, 0);
  objc_storeStrong((id *)&self->_contactMatchInfos, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_emptyExcerptInstanceMarker, 0);
  objc_storeStrong((id *)&self->_summarizer, 0);
  objc_storeStrong((id *)&self->_indexSections, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_cacheAccessSemaphore, 0);
  objc_storeStrong((id *)&self->_contactsCache, 0);
}

uint64_t __51__CNContactStoreSnapshot_objectIn_contactsAtIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadContactsInRange:inBackground:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

- (void)_generateExcerptsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  char *v7;
  void *v8;
  NSMutableDictionary *contactMatchInfos;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  CNContactMatchSummarizer *summarizer;
  CNContactMatchSummarizer *v23;
  CNContactMatchSummarizer *v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableAttributedString *v29;
  NSMutableAttributedString *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  NSMutableAttributedString *v36;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_opt_new();
  v33 = (void *)objc_opt_new();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_cacheAccessSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (location < location + length)
  {
    v7 = (char *)(location + 1);
    do
    {
      NSMapGet(self->_contactsCache, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      contactMatchInfos = self->_contactMatchInfos;
      objc_msgSend(v8, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](contactMatchInfos, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "excerpt");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_6;
        v13 = (void *)v12;
        objc_msgSend(v11, "excerpt");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "future");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isFinished");

        if ((v16 & 1) == 0)
        {
LABEL_6:
          objc_msgSend(v8, "identifier", v32);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v17);

          objc_msgSend(v8, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKey:", v8, v18);

          objc_msgSend(v11, "excerpt");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            v20 = objc_alloc_init(MEMORY[0x1E0D13B20]);
            objc_msgSend(v11, "setExcerpt:", v20);

          }
          objc_msgSend(v8, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKey:", v11, v21);

        }
      }

      ++v7;
      --length;
    }
    while (length);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_cacheAccessSemaphore);
  if (objc_msgSend(v6, "count"))
  {
    summarizer = self->_summarizer;
    if (!summarizer)
    {
      v23 = (CNContactMatchSummarizer *)objc_alloc_init(MEMORY[0x1E0C97250]);
      v24 = self->_summarizer;
      self->_summarizer = v23;

      summarizer = self->_summarizer;
    }
    v25 = self->_contactMatchInfos;
    -[CNContactStoreSnapshot dataSource](self, "dataSource", v32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "store");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactMatchSummarizer summariesFutureForContactsIdentifiers:matchInfos:contactStore:scheduler:](summarizer, "summariesFutureForContactsIdentifiers:matchInfos:contactStore:scheduler:", v6, v25, v27, self->_summarizationQueue);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = self->_emptyExcerptInstanceMarker;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __51__CNContactStoreSnapshot__generateExcerptsInRange___block_invoke;
    v34[3] = &unk_1E204E6E0;
    v35 = v33;
    v36 = v29;
    v30 = v29;
    objc_msgSend(v28, "addSuccessBlock:", v34);
    -[CNContactStoreSnapshot summarizationFutures](self, "summarizationFutures");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addPointer:", v28);

  }
}

- (void)_loadAllContacts
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  int v26;
  NSArray *v27;
  NSObject *v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CNContactSection *v34;
  void *v35;
  void *v36;
  CNContactSection *v37;
  void *v38;
  void *v39;
  CNContactSection *v40;
  void *v41;
  void *v42;
  NSArray *v43;
  NSArray *v44;
  NSArray *indexSections;
  NSArray *v46;
  NSArray *sections;
  unint64_t contactsCount;
  NSArray *obj;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  CNContactStoreSnapshot *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t *v67;
  _QWORD *v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t *v72;
  BOOL v73;
  BOOL v74;
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  _QWORD v82[5];
  id v83;
  _QWORD v84[4];
  _QWORD v85[5];
  id v86;
  _QWORD v87[4];
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  char v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint8_t buf[4];
  id v109;
  _QWORD v110[2];
  _QWORD v111[5];

  v111[2] = *MEMORY[0x1E0C80C00];
  if (self->_contactsCount == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CNContactStoreSnapshot dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStoreSnapshot _keysToFetch](self, "_keysToFetch");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CNContactStoreFilter supportsSections](self->_filter, "supportsSections"))
    {
      v4 = *MEMORY[0x1E0C96848];
      v111[0] = *MEMORY[0x1E0C96850];
      v111[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "arrayByAddingObjectsFromArray:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v54 = (void *)v6;
    }
    if (-[CNContactStoreFilter limitedAccessFilterMode](self->_filter, "limitedAccessFilterMode") == 2)
    {
      v7 = *MEMORY[0x1E0C966A8];
      v110[0] = *MEMORY[0x1E0C967C0];
      v110[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "arrayByAddingObjectsFromArray:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v54 = (void *)v9;
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v54);
    objc_msgSend(v10, "setUnifyResults:", objc_msgSend(v3, "fetchUnified"));
    objc_msgSend(v10, "setSortOrder:", objc_msgSend(v3, "sortOrder"));
    -[CNContactStoreFilter predicate](self->_filter, "predicate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPredicate:", v11);

    objc_msgSend(v10, "setRankSort:", -[CNContactFilter rankSortedResults](self->_filter, "rankSortedResults"));
    -[CNContactFilter fullTextString](self->_filter, "fullTextString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length") != 0;

    v104 = 0;
    v105 = &v104;
    v106 = 0x2020000000;
    v107 = 0;
    v100 = 0;
    v101 = &v100;
    v102 = 0x2020000000;
    v103 = 0x7FFFFFFFFFFFFFFFLL;
    v96 = 0;
    v97 = &v96;
    v98 = 0x2020000000;
    v99 = 0x7FFFFFFFFFFFFFFFLL;
    v92 = 0;
    v93 = &v92;
    v94 = 0x2020000000;
    v95 = 0;
    v88 = 0;
    v89 = &v88;
    v90 = 0x2020000000;
    v91 = 0;
    v87[0] = 0;
    v87[1] = v87;
    v87[2] = 0x2020000000;
    v87[3] = 0;
    v85[0] = 0;
    v85[1] = v85;
    v85[2] = 0x3032000000;
    v85[3] = __Block_byref_object_copy__52190;
    v85[4] = __Block_byref_object_dispose__52191;
    v86 = 0;
    v84[0] = 0;
    v84[1] = v84;
    v84[2] = 0x2020000000;
    v84[3] = 0;
    v82[0] = 0;
    v82[1] = v82;
    v82[2] = 0x3032000000;
    v82[3] = __Block_byref_object_copy__52190;
    v82[4] = __Block_byref_object_dispose__52191;
    v83 = 0;
    v76 = 0;
    v77 = &v76;
    v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__52190;
    v80 = __Block_byref_object_dispose__52191;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v81 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStoreSnapshot dataSource](self, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sectionHeadersDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactStoreSnapshot dataSource](self, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedSectionHeaders");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStoreSnapshot filter](self, "filter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "limitedAccessIdentifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "store");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0;
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __42__CNContactStoreSnapshot__loadAllContacts__block_invoke;
    v55[3] = &unk_1E204E728;
    v73 = v21 != 0;
    v50 = v3;
    v56 = v50;
    v74 = v13;
    v63 = &v100;
    v64 = &v104;
    v65 = &v88;
    v66 = &v96;
    v52 = v21;
    v57 = v52;
    v58 = self;
    v67 = &v92;
    v68 = v85;
    v69 = v87;
    v70 = v82;
    v51 = v14;
    v59 = v51;
    v23 = v16;
    v60 = v23;
    v24 = v18;
    v61 = v24;
    v71 = v84;
    v72 = &v76;
    v25 = v19;
    v62 = v25;
    v26 = objc_msgSend(v22, "enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:", v10, &v75, v55);
    v53 = v75;

    if (!v26)
    {
      self->_contactsCount = 0;
      CNUILogContactStoreDataSource();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v109 = v53;
        _os_log_error_impl(&dword_18AC56000, v28, OS_LOG_TYPE_ERROR, "Error fetching contacts: %@", buf, 0xCu);
      }
      goto LABEL_29;
    }
    self->_contactsCount = v105[3];
    objc_storeStrong((id *)&self->_contactMatchInfos, v19);
    if (-[CNContactStoreFilter supportsSections](self->_filter, "supportsSections"))
    {
      if (v105[3] < 6)
      {
        objc_storeStrong((id *)&self->_identifiersToIndexPath, (id)v77[5]);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v46 = (NSArray *)objc_claimAutoreleasedReturnValue();
        sections = self->_sections;
        self->_sections = v46;

        objc_msgSend(MEMORY[0x1E0C99E38], "null");
      }
      else
      {
        objc_storeStrong((id *)&self->_sections, v14);
        -[CNContactStoreSnapshot indexSections](self, "indexSections");
      }
      v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
      indexSections = self->_indexSections;
      self->_indexSections = v27;
    }
    else
    {
      v29 = *((unsigned __int8 *)v93 + 24);
      v30 = *((unsigned __int8 *)v89 + 24);
      v31 = v101[3];
      if (v31 == 0x7FFFFFFFFFFFFFFFLL)
        v32 = (v30 + v29);
      else
        v32 = (v30 + v29) + 1;
      if (!v32)
        goto LABEL_26;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v33 = objc_claimAutoreleasedReturnValue();
      contactsCount = self->_contactsCount;
      obj = (NSArray *)v33;
      if (v31 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v34 = objc_alloc_init(CNContactSection);
        -[CNContactSection setIdentifier:](v34, "setIdentifier:", CFSTR("suggested"));
        CNContactsUIBundle();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("SUGGESTIONS_SEARCH_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactSection setTitle:](v34, "setTitle:", v36);

        -[CNContactSection setRange:](v34, "setRange:", v101[3], contactsCount - v101[3]);
        contactsCount = v101[3];
        -[NSArray insertObject:atIndex:](obj, "insertObject:atIndex:", v34, 0);

      }
      if (v30)
      {
        v37 = objc_alloc_init(CNContactSection);
        -[CNContactSection setIdentifier:](v37, "setIdentifier:", CFSTR("realOther"));
        CNContactsUIBundle();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("OTHER_LOCAL_SEARCH_MATCHES_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactSection setTitle:](v37, "setTitle:", v39);

        -[CNContactSection setRange:](v37, "setRange:", v97[3], contactsCount - v97[3]);
        contactsCount = v97[3];
        -[NSArray insertObject:atIndex:](obj, "insertObject:atIndex:", v37, 0);

      }
      if (v29)
      {
        v40 = objc_alloc_init(CNContactSection);
        -[CNContactSection setIdentifier:](v40, "setIdentifier:", CFSTR("realRelevancePromoted"));
        CNContactsUIBundle();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("RELEVANCE_RANKED_SECTION_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactSection setTitle:](v40, "setTitle:", v42);

        -[CNContactSection setRange:](v40, "setRange:", 0, contactsCount);
        -[NSArray insertObject:atIndex:](obj, "insertObject:atIndex:", v40, 0);

      }
      objc_storeStrong((id *)&self->_sections, obj);
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v43 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v44 = self->_indexSections;
      self->_indexSections = v43;

      indexSections = obj;
    }

LABEL_26:
    if (!v53)
    {
LABEL_30:

      _Block_object_dispose(&v76, 8);
      _Block_object_dispose(v82, 8);

      _Block_object_dispose(v84, 8);
      _Block_object_dispose(v85, 8);

      _Block_object_dispose(v87, 8);
      _Block_object_dispose(&v88, 8);
      _Block_object_dispose(&v92, 8);
      _Block_object_dispose(&v96, 8);
      _Block_object_dispose(&v100, 8);
      _Block_object_dispose(&v104, 8);

      return;
    }
    CNUILogContactStoreDataSource();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v109 = v53;
      _os_log_impl(&dword_18AC56000, v28, OS_LOG_TYPE_INFO, "Non fatal error during contacts fetching: %@", buf, 0xCu);
    }
LABEL_29:

    goto LABEL_30;
  }
}

- (void)prepareAllContacts
{
  id v3;

  -[CNContactStoreSnapshot contacts](self, "contacts");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactStoreSnapshot _loadContactsInRange:inBackground:](self, "_loadContactsInRange:inBackground:", 0, objc_msgSend(v3, "count"), 0);

}

- (CNContactStoreFilter)filter
{
  return self->_filter;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (CNContactDataSourceLIFOScheduler)summarizationQueue
{
  return self->_summarizationQueue;
}

- (NSPointerArray)summarizationFutures
{
  return self->_summarizationFutures;
}

- (NSMutableArray)batchContactIdentifiers
{
  return self->_batchContactIdentifiers;
}

void __42__CNContactStoreSnapshot__loadAllContacts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  CNContactSection *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD block[4];
  char v51;

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 168))
  {
    objc_msgSend(*(id *)(a1 + 32), "filter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "limitedAccessFilterMode") == 1)
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(v5, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = objc_msgSend(v8, "containsObject:", v9);

      if (!(_DWORD)v8)
        goto LABEL_55;
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "filter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "limitedAccessFilterMode") == 2)
    {
      v11 = *(void **)(a1 + 40);
      objc_msgSend(v5, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v11) = objc_msgSend(v11, "containsObject:", v12);

      if ((v11 & 1) != 0)
        goto LABEL_55;
    }
    else
    {

    }
  }
  v13 = objc_msgSend(v5, "isSuggested");
  v14 = v13;
  if (*(_BYTE *)(a1 + 169))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__CNContactStoreSnapshot__loadAllContacts__block_invoke_2;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    v51 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  if (v14)
  {
    v15 = *(_QWORD *)(a1 + 88);
  }
  else
  {
    objc_msgSend(v6, "relevanceScore");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17
      || (v18 = (void *)v17,
          objc_msgSend(v6, "relevanceScore"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "integerValue"),
          v19,
          v18,
          v20))
    {
      objc_msgSend(v6, "relevanceScore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "integerValue");

      if (v22 >= 1)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = 1;
      goto LABEL_20;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 1;
    v15 = *(_QWORD *)(a1 + 112);
  }
  v16 = *(_QWORD *)(v15 + 8);
  if (*(_QWORD *)(v16 + 24) == 0x7FFFFFFFFFFFFFFFLL)
    *(_QWORD *)(v16 + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
LABEL_20:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "supportsSections") & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "sortOrder") == 3)
      objc_msgSend(v5, "sectionForSortingByFamilyName");
    else
      objc_msgSend(v5, "sectionForSortingByGivenName");
    v23 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v23;
    if (v23 | *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40)
      && (objc_msgSend((id)v23, "isEqual:") & 1) == 0)
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40))
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24);
      v26 = objc_alloc_init(CNContactSection);
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8);
      v28 = *(void **)(v27 + 40);
      *(_QWORD *)(v27 + 40) = v26;

      objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setSortKey:", v25);
      objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v25);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v29;
      if (v29)
        v31 = (const __CFString *)v29;
      else
        v31 = CFSTR("#");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setIdentifier:", v31);

      v32 = *(void **)(a1 + 72);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (!v34)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setTitle:", v35);
      if (!v34)

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), v25);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                               + 24);
    }
    v36 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "range");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "range");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setRange:", v36, v37 + 1);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24)- *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((objc_msgSend(v5, "isSuggested") & 1) != 0)
    {
      v24 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24)
          + (unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);
    }
    else
    {
      objc_msgSend(v6, "relevanceScore");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "integerValue"))
        v24 = 0;
      else
        v24 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);

    }
    if ((objc_msgSend(v5, "isSuggested") & 1) != 0)
    {
      v40 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24)
          - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    }
    else
    {
      objc_msgSend(v6, "relevanceScore");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "integerValue");
      v40 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
      if (v42 <= 0)
        v40 -= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);

    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v40, v24);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 48) + 24), 0xFFFFFFFFFFFFFFFFLL);
  NSMapInsert(*(NSMapTable **)(*(_QWORD *)(a1 + 48) + 16), (const void *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) + 1), v5);
  v43 = *(void **)(*(_QWORD *)(a1 + 48) + 136);
  objc_msgSend(v5, "identifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKey:", v38, v44);

  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) <= 6)
  {
    v45 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKey:", v46, v47);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 48) + 24));
  if (v6)
  {
    v48 = *(void **)(a1 + 80);
    objc_msgSend(v5, "identifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setObject:forKey:", v6, v49);

  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);

LABEL_55:
}

void __42__CNContactStoreSnapshot__loadAllContacts__block_invoke_2(uint64_t a1)
{
  id v2;

  +[CNUIDataCollectionSearchSession currentSession](CNUIDataCollectionSearchSession, "currentSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didFetchResultSuggested:", *(unsigned __int8 *)(a1 + 32));

}

void __51__CNContactStoreSnapshot__generateExcerptsInRange___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__CNContactStoreSnapshot__generateExcerptsInRange___block_invoke_2;
  v4[3] = &unk_1E204E6B8;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __51__CNContactStoreSnapshot__generateExcerptsInRange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "excerpt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "length");
  v9 = v6;
  if (!v8)
    v9 = *(id *)(a1 + 40);
  objc_msgSend(v7, "finishWithResult:", v9);

}

@end
