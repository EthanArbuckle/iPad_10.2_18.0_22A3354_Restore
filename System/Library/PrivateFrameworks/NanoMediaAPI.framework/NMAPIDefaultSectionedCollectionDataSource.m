@implementation NMAPIDefaultSectionedCollectionDataSource

- (NMAPIDefaultSectionedCollectionDataSource)initWithRequest:(id)a3 results:(id)a4 storeURLBag:(id)a5
{
  id v9;
  id v10;
  id v11;
  NMAPIDefaultSectionedCollectionDataSource *v12;
  NMAPIDefaultSectionedCollectionDataSource *v13;
  NSCache *v14;
  NSCache *cachedSections;
  NSCache *v16;
  NSCache *cachedItems;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NMAPIDefaultSectionedCollectionDataSource;
  v12 = -[NMAPIDefaultSectionedCollectionDataSource init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_results, a4);
    objc_storeStrong((id *)&v13->_storeURLBag, a5);
    v14 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    cachedSections = v13->_cachedSections;
    v13->_cachedSections = v14;

    v16 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    cachedItems = v13->_cachedItems;
    v13->_cachedItems = v16;

    -[NMAPIDefaultSectionedCollectionDataSource _parseResults](v13, "_parseResults");
  }

  return v13;
}

- (unint64_t)numberOfSections
{
  return -[NSMutableArray count](self->_sectionResultIDs, "count");
}

- (id)sectionAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionResultIDs, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](self->_cachedSections, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSMutableDictionary objectForKey:](self->_importedIdentifierSets, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDDCBC8], "sharedServerObjectDatabase");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NMAPIRequest sectionProperties](self->_request, "sectionProperties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "modelObjectMatchingIdentifierSet:propertySet:", v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "anyObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_sectionResults, "objectForKey:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[NMAPIDefaultSectionedCollectionDataSource _storeBrowseSectionWithDictionary:](self, "_storeBrowseSectionWithDictionary:", v7);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
          -[NSCache setObject:forKey:](self->_cachedSections, "setObject:forKey:", v5, v4);
      }
      else
      {
        v5 = 0;
      }
    }

  }
  return v5;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableArray objectAtIndexedSubscript:](self->_sectionedItemResultIDs, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)itemAtIndexPath:(id)a3
{
  NSMutableArray *sectionedItemResultIDs;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  sectionedItemResultIDs = self->_sectionedItemResultIDs;
  v5 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](sectionedItemResultIDs, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "item");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCache objectForKey:](self->_cachedItems, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[NSMutableDictionary objectForKey:](self->_importedIdentifierSets, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDDCBC8], "sharedServerObjectDatabase");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NMAPIRequest itemProperties](self->_request, "itemProperties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "modelObjectMatchingIdentifierSet:propertySet:", v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "anyObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_itemResults, "objectForKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[NMAPIDefaultSectionedCollectionDataSource _storeBrowseSectionWithDictionary:](self, "_storeBrowseSectionWithDictionary:", v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          -[NSCache setObject:forKey:](self->_cachedItems, "setObject:forKey:", v9, v8);
      }
      else
      {
        v9 = 0;
      }
    }

  }
  return v9;
}

- (void)_parseResults
{
  NSMutableArray *v3;
  NSMutableArray *sectionResultIDs;
  NSMutableDictionary *v5;
  NSMutableDictionary *sectionResults;
  NSMutableArray *v7;
  NSMutableArray *sectionedItemResultIDs;
  NSMutableDictionary *v9;
  NSMutableDictionary *itemResults;
  NSMutableDictionary *v11;
  NSMutableDictionary *importedIdentifierSets;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSMutableArray *v24;
  NSMutableDictionary *v25;
  NSMutableArray *v26;
  NSMutableDictionary *v27;
  NSArray *obj;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  NSMutableArray *v35;
  __int16 v36;
  NSMutableDictionary *v37;
  __int16 v38;
  NSMutableArray *v39;
  __int16 v40;
  NSMutableDictionary *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  sectionResultIDs = self->_sectionResultIDs;
  self->_sectionResultIDs = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  sectionResults = self->_sectionResults;
  self->_sectionResults = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  sectionedItemResultIDs = self->_sectionedItemResultIDs;
  self->_sectionedItemResultIDs = v7;

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  itemResults = self->_itemResults;
  self->_itemResults = v9;

  v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  importedIdentifierSets = self->_importedIdentifierSets;
  self->_importedIdentifierSets = v11;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = self->_results;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v17, "itemsArray");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __58__NMAPIDefaultSectionedCollectionDataSource__parseResults__block_invoke;
        v29[3] = &unk_24DD29788;
        v29[4] = self;
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v29);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "filteredArrayUsingPredicate:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v20, "count"))
        {
          objc_msgSend(v17, "sectionIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "sectionDictionary");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NMAPIDefaultSectionedCollectionDataSource _addSectionWithIdentifier:dictionary:](self, "_addSectionWithIdentifier:dictionary:", v21, v22);

          -[NMAPIDefaultSectionedCollectionDataSource _addItemsFromArray:](self, "_addItemsFromArray:", v20);
        }

      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v14);
  }

  NMLogForCategory(10);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = self->_sectionResultIDs;
    v25 = self->_sectionResults;
    v26 = self->_sectionedItemResultIDs;
    v27 = self->_itemResults;
    *(_DWORD *)buf = 138413058;
    v35 = v24;
    v36 = 2112;
    v37 = v25;
    v38 = 2112;
    v39 = v26;
    v40 = 2112;
    v41 = v27;
    _os_log_debug_impl(&dword_21A803000, v23, OS_LOG_TYPE_DEBUG, "[NanoMediaAPI] _sectionResultIDs: %@, _sectionResults: %@, _sectionedItemResultIDs: %@, _itemResults: %@", buf, 0x2Au);
  }

}

uint64_t __58__NMAPIDefaultSectionedCollectionDataSource__parseResults__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isSupportedItem:", a2);
}

- (void)_addSectionWithIdentifier:(id)a3 dictionary:(id)a4
{
  NSMutableArray *sectionResultIDs;
  id v7;
  id v8;

  sectionResultIDs = self->_sectionResultIDs;
  v7 = a4;
  v8 = a3;
  -[NSMutableArray addObject:](sectionResultIDs, "addObject:", v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sectionResults, "setObject:forKeyedSubscript:", v7, v8);
  -[NMAPIDefaultSectionedCollectionDataSource _updateImportedIdentifierSetsWithIdentifier:dictionary:](self, "_updateImportedIdentifierSetsWithIdentifier:dictionary:", v8, v7);

}

- (void)_addItemsFromArray:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  NSMutableArray *sectionedItemResultIDs;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  NMAPIDefaultSectionedCollectionDataSource *v12;

  v4 = (objc_class *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__NMAPIDefaultSectionedCollectionDataSource__addItemsFromArray___block_invoke;
  v10[3] = &unk_24DD297B0;
  v11 = v6;
  v12 = self;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  sectionedItemResultIDs = self->_sectionedItemResultIDs;
  v8 = (void *)objc_msgSend(v9, "copy");
  -[NSMutableArray addObject:](sectionedItemResultIDs, "addObject:", v8);

}

void __64__NMAPIDefaultSectionedCollectionDataSource__addItemsFromArray___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v11 = a2;
  objc_msgSend(v11, "valueForKeyPath:", CFSTR("attributes.editorialElementKind"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("489")))
  {
    objc_msgSend(v11, "valueForKeyPath:", CFSTR("relationships.contents.data"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v5;
  }
  else
  {
    v6 = v11;
  }
  v12 = v6;
  objc_msgSend(v6, "objectForKey:", CFSTR("id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("label"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setValue:forKey:", v12, v10);
  objc_msgSend(*(id *)(a1 + 40), "_updateImportedIdentifierSetsWithIdentifier:dictionary:", v10, v12);

}

- (BOOL)_isSupportedItem:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("attributes.mediaKind"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("video"));

  objc_msgSend(v3, "valueForKeyPath:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v6, "isEqualToString:", CFSTR("music-movies"));
  return (v5 | v3) ^ 1;
}

- (void)_updateImportedIdentifierSetsWithIdentifier:(id)a3 dictionary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDDC5A8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDDC5B0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](self->_importedIdentifierSets, "setValue:forKey:", v8, v9);

  }
}

- (id)_musicURLWithPartialURLString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    MusicURLComponentsWithURLBag(self->_storeURLBag, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setScheme:", v7);

  }
  objc_msgSend(v4, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    MusicURLComponentsWithURLBag(self->_storeURLBag, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHost:", v10);

  }
  objc_msgSend(v4, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_storeBrowseSectionWithDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  NMAPIDefaultSectionedCollectionDataSource *v12;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDDCA18]);
  objc_msgSend(MEMORY[0x24BDDC758], "emptyIdentifierSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__NMAPIDefaultSectionedCollectionDataSource__storeBrowseSectionWithDictionary___block_invoke;
  v10[3] = &unk_24DD297D8;
  v11 = v4;
  v12 = self;
  v7 = v4;
  v8 = (void *)objc_msgSend(v5, "initWithIdentifiers:block:", v6, v10);

  return v8;
}

void __79__NMAPIDefaultSectionedCollectionDataSource__storeBrowseSectionWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;

  v21 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("attributes.name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5 = v6;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("attributes.title"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("label"));
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v10;

    }
  }

  objc_msgSend(v21, "setTitle:", v5);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("href"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("url"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "performSelector:", sel_resultsPerSection) >= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("next"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {

      v14 = 0;
    }

  }
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "_musicURLWithPartialURLString:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLoadAdditionalContentURL:", v16);

  }
  else
  {
    objc_msgSend(v21, "setLoadAdditionalContentURL:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("attributes.editorialElementKind"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("488")) & 1) != 0)
  {
    v18 = 13;
  }
  else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("388")) & 1) != 0)
  {
    v18 = 10;
  }
  else if (objc_msgSend(v17, "isEqualToString:", CFSTR("391")))
  {
    v18 = 11;
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("isRecentlyPlayed"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = 9;
  else
    v20 = v18;
  objc_msgSend(v21, "setSectionType:", v20);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importedIdentifierSets, 0);
  objc_storeStrong((id *)&self->_cachedItems, 0);
  objc_storeStrong((id *)&self->_cachedSections, 0);
  objc_storeStrong((id *)&self->_itemResults, 0);
  objc_storeStrong((id *)&self->_sectionedItemResultIDs, 0);
  objc_storeStrong((id *)&self->_sectionResults, 0);
  objc_storeStrong((id *)&self->_sectionResultIDs, 0);
  objc_storeStrong((id *)&self->_storeURLBag, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
