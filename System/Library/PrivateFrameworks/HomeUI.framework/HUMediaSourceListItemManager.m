@implementation HUMediaSourceListItemManager

- (id)initForMediaProfileContainers:(id)a3 delegate:(id)a4 forTarget:(unint64_t)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *sources;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  id v21;
  HUMediaSourceListItemManager *val;
  id v25;
  _QWORD v26[5];
  id v27[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id location;
  objc_super v33;
  _BYTE v34[128];
  _QWORD v35[4];

  v35[2] = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v33.receiver = self;
  v33.super_class = (Class)HUMediaSourceListItemManager;
  v21 = a4;
  val = -[HFItemManager initWithDelegate:](&v33, sel_initWithDelegate_);
  if (val)
  {
    objc_storeStrong((id *)&val->_containers, a3);
    +[HUMediaSourceItem appleMusicSource](HUMediaSourceItem, "appleMusicSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v8;
    +[HUMediaSourceItem soundScapesSource](HUMediaSourceItem, "soundScapesSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v10 = objc_claimAutoreleasedReturnValue();
    sources = val->_sources;
    val->_sources = (NSArray *)v10;

    objc_initWeak(&location, val);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[HUMediaSourceListItemManager sources](val, "sources");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v29;
      v15 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v17, "resolveForMediaProfiles:forTarget:", v25, a5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = v15;
          v26[1] = 3221225472;
          v26[2] = __81__HUMediaSourceListItemManager_initForMediaProfileContainers_delegate_forTarget___block_invoke;
          v26[3] = &unk_1E6F4FFE0;
          objc_copyWeak(v27, &location);
          v26[4] = v17;
          v27[1] = (id)a2;
          v19 = (id)objc_msgSend(v18, "addCompletionBlock:", v26);
          objc_destroyWeak(v27);

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v13);
    }

    objc_destroyWeak(&location);
  }

  return val;
}

void __81__HUMediaSourceListItemManager_initForMediaProfileContainers_delegate_forTarget___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(WeakRetained, "updateResultsForItems:senderSelector:", v2, *(_QWORD *)(a1 + 48));

}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0D31848]);
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[HUMediaSourceListItemManager sources](self, "sources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithItems:", v7);
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D31570];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithIdentifier:", CFSTR("HUMediaSourceListItemManager"));
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_226);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v7);

  objc_msgSend(v5, "setHeaderTitle:", 0);
  objc_msgSend(v5, "setFooterTitle:", 0);
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __65__HUMediaSourceListItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 1);
  return v7;
}

- (NSArray)mediaSourceItems
{
  return self->_mediaSourceItems;
}

- (unint64_t)target
{
  return self->_target;
}

- (NSSet)containers
{
  return self->_containers;
}

- (void)setContainers:(id)a3
{
  objc_storeStrong((id *)&self->_containers, a3);
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
  objc_storeStrong((id *)&self->_sources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_mediaSourceItems, 0);
}

@end
