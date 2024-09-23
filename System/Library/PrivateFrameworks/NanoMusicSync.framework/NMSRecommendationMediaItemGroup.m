@implementation NMSRecommendationMediaItemGroup

- (id)identifiersForContainerType:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a3 > 1)
    v4 = 0;
  else
    v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NMSRecommendationMediaItemGroup recommendation](self, "recommendation", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        if (!v4 || (objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "identifiers");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(v5, "addObject:", v14);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  return v15;
}

- (id)itemList
{
  id v3;
  NMSDownloadableItem *v4;
  void *v5;
  uint64_t v6;
  NMSDownloadableItem *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!-[NMSMediaItemGroup type](self, "type") || -[NMSMediaItemGroup type](self, "type") == 1)
  {
    v4 = [NMSDownloadableItem alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", arc4random());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NMSMediaItemGroup type](self, "type"))
      v6 = 4;
    else
      v6 = 3;
    v7 = -[NMSDownloadableItem initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:](v4, "initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:", v5, 0, 175000000, v6, -[NMSMediaItemGroup manuallyAdded](self, "manuallyAdded"));
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (id)_fetchDownloadableItemsForIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7;
  v17 = __Block_byref_object_dispose__7;
  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  objc_msgSend(MEMORY[0x24BE6B1B0], "predicateWithProperty:values:", *MEMORY[0x24BE6B108], v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE6B1F8];
  objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", v7, v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = *MEMORY[0x24BE6B158];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__NMSRecommendationMediaItemGroup__fetchDownloadableItemsForIDs___block_invoke;
  v12[3] = &unk_24D648040;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v8, "enumeratePersistentIDsAndProperties:usingBlock:", v9, v12);

  v10 = (void *)objc_msgSend((id)v14[5], "copy");
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __65__NMSRecommendationMediaItemGroup__fetchDownloadableItemsForIDs___block_invoke(uint64_t a1, uint64_t a2, id *a3)
{
  void *v5;
  NMSDownloadableItem *v6;
  void *v7;
  NMSDownloadableItem *v8;
  id v9;

  v9 = *a3;
  if (!objc_msgSend(v9, "unsignedLongLongValue"))
  {

    v9 = &unk_24D655BF0;
  }
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v6 = [NMSDownloadableItem alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NMSDownloadableItem initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:](v6, "initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:", v7, 0, objc_msgSend(v9, "unsignedIntegerValue"), 0, objc_msgSend(*(id *)(a1 + 32), "manuallyAdded"));
  objc_msgSend(v5, "addObject:", v8);

}

- (BOOL)isEstimate
{
  return 1;
}

@end
