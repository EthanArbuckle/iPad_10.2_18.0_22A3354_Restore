@implementation NMSMusicRecommendationsRequestContext

- (void)setForYouResponse:(id)a3
{
  MPModelForYouRecommendationsResponse *v5;
  NSMutableOrderedSet *recentMusicModelObjects;
  MPModelForYouRecommendationsResponse *v7;

  v5 = (MPModelForYouRecommendationsResponse *)a3;
  if (self->_forYouResponse != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_forYouResponse, a3);
    recentMusicModelObjects = self->_recentMusicModelObjects;
    self->_recentMusicModelObjects = 0;

    v5 = v7;
  }

}

- (void)setHeavyRotationResponse:(id)a3
{
  MPModelResponse *v5;
  NSMutableOrderedSet *recentMusicModelObjects;
  MPModelResponse *v7;

  v5 = (MPModelResponse *)a3;
  if (self->_heavyRotationResponse != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_heavyRotationResponse, a3);
    recentMusicModelObjects = self->_recentMusicModelObjects;
    self->_recentMusicModelObjects = 0;

    v5 = v7;
  }

}

- (void)setLibraryRecentMusicResponse:(id)a3
{
  MPModelResponse *v5;
  NSMutableOrderedSet *recentMusicModelObjects;
  MPModelResponse *v7;

  v5 = (MPModelResponse *)a3;
  if (self->_libraryRecentMusicResponse != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_libraryRecentMusicResponse, a3);
    recentMusicModelObjects = self->_recentMusicModelObjects;
    self->_recentMusicModelObjects = 0;

    v5 = v7;
  }

}

- (void)setEditorialBrowseResponse:(id)a3
{
  MPModelStoreBrowseResponse *v5;
  NSMutableOrderedSet *recentMusicModelObjects;
  MPModelStoreBrowseResponse *v7;

  v5 = (MPModelStoreBrowseResponse *)a3;
  if (self->_editorialBrowseResponse != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_editorialBrowseResponse, a3);
    recentMusicModelObjects = self->_recentMusicModelObjects;
    self->_recentMusicModelObjects = 0;

    v5 = v7;
  }

}

- (void)setStarterPackResponse:(id)a3
{
  MPModelResponse *v5;
  NSMutableOrderedSet *recentMusicModelObjects;
  MPModelResponse *v7;

  v5 = (MPModelResponse *)a3;
  if (self->_starterPackResponse != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_starterPackResponse, a3);
    recentMusicModelObjects = self->_recentMusicModelObjects;
    self->_recentMusicModelObjects = 0;

    v5 = v7;
  }

}

- (unint64_t)numberOfRecentMusicModelObjects
{
  -[NMSMusicRecommendationsRequestContext _processResponsesIfNeeded](self, "_processResponsesIfNeeded");
  return -[NSMutableOrderedSet count](self->_recentMusicModelObjects, "count");
}

- (NSSet)modelObjects
{
  void *v3;
  void *v4;
  void *v5;

  -[NMSMusicRecommendationsRequestContext _processResponsesIfNeeded](self, "_processResponsesIfNeeded");
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet set](self->_recentMusicModelObjects, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  v5 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v5;
}

- (NSOrderedSet)recommendations
{
  void *v3;
  NMSMusicRecommendation *v4;
  NMSMusicRecommendation *v5;
  void *v6;

  -[NMSMusicRecommendationsRequestContext _processResponsesIfNeeded](self, "_processResponsesIfNeeded");
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableOrderedSet count](self->_recentMusicModelObjects, "count"))
  {
    v4 = [NMSMusicRecommendation alloc];
    v5 = -[NMSMusicRecommendation initWithIdentifier:title:items:](v4, "initWithIdentifier:title:items:", NMSRecommendationRecentMusicIdentifier, 0, self->_recentMusicModelObjects);
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSOrderedSet *)v6;
}

- (void)_processResponsesIfNeeded
{
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *recentMusicModelObjects;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  if (!self->_recentMusicModelObjects)
  {
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v3 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    recentMusicModelObjects = self->_recentMusicModelObjects;
    self->_recentMusicModelObjects = v3;

    -[MPModelForYouRecommendationsResponse results](self->_forYouResponse, "results");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke;
    v15[3] = &unk_24D6473C8;
    v15[4] = self;
    objc_msgSend(v5, "enumerateSectionsUsingBlock:", v15);

    -[MPModelResponse results](self->_heavyRotationResponse, "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_176;
    v14[3] = &unk_24D647418;
    v14[4] = self;
    objc_msgSend(v7, "enumerateSectionsUsingBlock:", v14);

    -[MPModelResponse results](self->_libraryRecentMusicResponse, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_2;
    v13[3] = &unk_24D647440;
    v13[4] = self;
    objc_msgSend(v8, "enumerateItemsUsingBlock:", v13);

    -[MPModelStoreBrowseResponse results](self->_editorialBrowseResponse, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_185;
    v12[3] = &unk_24D647418;
    v12[4] = self;
    objc_msgSend(v9, "enumerateSectionsUsingBlock:", v12);

    -[MPModelResponse results](self->_starterPackResponse, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_190;
    v11[3] = &unk_24D647418;
    v11[4] = self;
    objc_msgSend(v10, "enumerateSectionsUsingBlock:", v11);

  }
}

void __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  NMLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v5;
    v13 = 2050;
    v14 = objc_msgSend(v3, "groupType");
    _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (ForYou) Section %@ with type: %{public}lu", (uint8_t *)&v11, 0x16u);

  }
  if (objc_msgSend(v3, "groupType") == 6)
  {
    if (objc_msgSend(v3, "numberOfItems") >= 1)
    {
      v6 = 0;
      do
      {
        objc_msgSend(v3, "itemAtIndex:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "itemType") == 2)
        {
          objc_msgSend(v7, "playlist");
          v8 = (id)objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v7, "itemType") == 1)
        {
          objc_msgSend(v7, "album");
          v8 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v8 = v7;
        }
        v9 = v8;
        objc_msgSend(*(id *)(a1 + 32), "_processRecentMusicItem:section:identifier:", v8, v3, CFSTR("ForYou"));

        ++v6;
      }
      while (v6 < objc_msgSend(v3, "numberOfItems"));
    }
  }
  else
  {
    NMLogForCategory(5);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v3;
      _os_log_impl(&dword_216E27000, v10, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (ForYou) Ignored section: %{public}@", (uint8_t *)&v11, 0xCu);
    }

  }
}

void __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_176(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  NMLogForCategory(5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = v7;
    v14 = 2050;
    v15 = objc_msgSend(v5, "sectionType");
    _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (Heavy Rotation) Section %@ with type: %{public}lu", buf, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_177;
  v10[3] = &unk_24D6473F0;
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v10);

}

uint64_t __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_177(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processRecentMusicItem:section:identifier:", a2, *(_QWORD *)(a1 + 40), CFSTR("Heavy Rotation"));
}

void __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  if (v7 >= objc_msgSend(*(id *)(a1 + 32), "minimumNumberOfRecentMusicModelObjects"))
  {
    NMLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "minimumNumberOfRecentMusicModelObjects");
      v10 = 134217984;
      v11 = v9;
      _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (Library) Reached maximum of %lu items.", (uint8_t *)&v10, 0xCu);
    }

    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_processRecentMusicItem:section:identifier:", v6, 0, CFSTR("Library"));
  }

}

void __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_185(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  NMLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v9;
    v18 = 2050;
    v19 = objc_msgSend(v7, "sectionType");
    _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (Editorial) Section %@ with type: %{public}lu", buf, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_186;
  v13[3] = &unk_24D647468;
  v11 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v15 = a4;
  v13[4] = v11;
  v12 = v7;
  objc_msgSend(v10, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v13);

}

void __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_186(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  if (v7 >= objc_msgSend(*(id *)(a1 + 32), "minimumNumberOfRecentMusicModelObjects"))
  {
    NMLogForCategory(5);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "minimumNumberOfRecentMusicModelObjects");
      v12 = 134217984;
      v13 = v11;
      _os_log_impl(&dword_216E27000, v10, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (Editorial) Reached maximum of %lu items.", (uint8_t *)&v12, 0xCu);
    }

    *a4 = 1;
    **(_BYTE **)(a1 + 48) = 1;
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v6, "innerObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_processRecentMusicItem:section:identifier:", v9, *(_QWORD *)(a1 + 40), CFSTR("Editorial"));

  }
}

void __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_190(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  NMLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v9;
    v18 = 2050;
    v19 = objc_msgSend(v7, "sectionType");
    _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (Starter Pack) Section %@ with type: %{public}lu", buf, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_191;
  v13[3] = &unk_24D647490;
  v11 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v15 = a4;
  v13[4] = v11;
  v12 = v7;
  objc_msgSend(v10, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v13);

}

void __66__NMSMusicRecommendationsRequestContext__processResponsesIfNeeded__block_invoke_191(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  if (v7 >= objc_msgSend(*(id *)(a1 + 32), "minimumNumberOfRecentMusicModelObjects"))
  {
    NMLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "minimumNumberOfRecentMusicModelObjects");
      v10 = 134217984;
      v11 = v9;
      _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (Starter Pack) Reached maximum of %lu items.", (uint8_t *)&v10, 0xCu);
    }

    *a4 = 1;
    **(_BYTE **)(a1 + 48) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_processRecentMusicItem:section:identifier:", v6, *(_QWORD *)(a1 + 40), CFSTR("Starter Pack"));
  }

}

- (BOOL)_recentMusicContainsModelObject:(id)a3
{
  id v4;
  NSMutableOrderedSet *recentMusicModelObjects;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  recentMusicModelObjects = self->_recentMusicModelObjects;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__NMSMusicRecommendationsRequestContext__recentMusicContainsModelObject___block_invoke;
  v8[3] = &unk_24D6474B8;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](recentMusicModelObjects, "enumerateObjectsUsingBlock:", v8);
  LOBYTE(recentMusicModelObjects) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)recentMusicModelObjects;
}

void __73__NMSMusicRecommendationsRequestContext__recentMusicContainsModelObject___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v8, "intersectsSet:", v9);
  if ((_DWORD)v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)_processRecentMusicItem:(id)a3 section:(id)a4 identifier:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NMLogForCategory(5);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412546;
        v15 = v8;
        v16 = 2114;
        v17 = v7;
        v10 = "[Recommendation] (Processing) (Recent Music) (%@) Ignored unsupported item: %{public}@";
        goto LABEL_16;
      }
      goto LABEL_17;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "type") == 1)
  {
    NMLogForCategory(5);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v8;
      v16 = 2114;
      v17 = v7;
      v10 = "[Recommendation] (Processing) (Recent Music) (%@) Ignored smart playlist: %{public}@";
LABEL_16:
      _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, 0x16u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (!-[NMSMusicRecommendationsRequestContext _hasDownloadableSongsForModelObject:](self, "_hasDownloadableSongsForModelObject:", v7))
  {
    NMLogForCategory(5);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v8;
      v16 = 2114;
      v17 = v7;
      v10 = "[Recommendation] (Processing) (RecentMusic) (%@) Ignored item without any downloadable songs: %{public}@";
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  v11 = -[NMSMusicRecommendationsRequestContext _recentMusicContainsModelObject:](self, "_recentMusicContainsModelObject:", v7);
  NMLogForCategory(5);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v14 = 138412546;
      v15 = v8;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_216E27000, v12, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (RecentMusic) (%@) Ignored duplicate item: %{public}@", (uint8_t *)&v14, 0x16u);
    }

  }
  else
  {
    if (v13)
    {
      v14 = 138412546;
      v15 = v8;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_216E27000, v12, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Processing) (Recent Music) (%@) Picked item: %{public}@", (uint8_t *)&v14, 0x16u);
    }

    -[NSMutableOrderedSet addObject:](self->_recentMusicModelObjects, "addObject:", v7);
  }
LABEL_18:

}

- (BOOL)_hasDownloadableSongsForModelObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "persistentID");

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BE6B180];
    v8 = (void *)MEMORY[0x24BE6B1A8];
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v10 = (uint64_t *)MEMORY[0x24BE6B128];
    if ((isKindOfClass & 1) == 0)
      v10 = (uint64_t *)MEMORY[0x24BE6B130];
    v11 = *v10;
    v12 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithProperty:values:", v11, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v26[0] = v15;
    v16 = (void *)MEMORY[0x24BE6B1E0];
    objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:equalToInt64:", *MEMORY[0x24BE6B0F8], -1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateWithPredicate:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateMatchingPredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    LOBYTE(v15) = objc_opt_isKindOfClass();
    v21 = (void *)MEMORY[0x24BE6B1F8];
    objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v15 & 1) != 0)
      objc_msgSend(v21, "queryWithLibrary:predicate:orderingTerms:usingSections:", v22, v20, 0, 0);
    else
      objc_msgSend(v21, "allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:", v22, v20, 0, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v24, "hasEntities");
  }
  else
  {
    v23 = 1;
  }

  return v23;
}

- (unint64_t)minimumNumberOfRecentMusicModelObjects
{
  return self->_minimumNumberOfRecentMusicModelObjects;
}

- (void)setMinimumNumberOfRecentMusicModelObjects:(unint64_t)a3
{
  self->_minimumNumberOfRecentMusicModelObjects = a3;
}

- (MPModelResponse)heavyRotationResponse
{
  return self->_heavyRotationResponse;
}

- (MPModelResponse)libraryRecentMusicResponse
{
  return self->_libraryRecentMusicResponse;
}

- (MPModelResponse)starterPackResponse
{
  return self->_starterPackResponse;
}

- (MPModelForYouRecommendationsResponse)forYouResponse
{
  return self->_forYouResponse;
}

- (MPModelStoreBrowseResponse)editorialBrowseResponse
{
  return self->_editorialBrowseResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorialBrowseResponse, 0);
  objc_storeStrong((id *)&self->_forYouResponse, 0);
  objc_storeStrong((id *)&self->_starterPackResponse, 0);
  objc_storeStrong((id *)&self->_libraryRecentMusicResponse, 0);
  objc_storeStrong((id *)&self->_heavyRotationResponse, 0);
  objc_storeStrong((id *)&self->_recentMusicModelObjects, 0);
}

@end
