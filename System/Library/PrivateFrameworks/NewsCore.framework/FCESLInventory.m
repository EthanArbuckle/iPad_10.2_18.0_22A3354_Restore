@implementation FCESLInventory

- (FCESLInventory)initWithGlobalInventory:(id)a3 tagInventory:(id)a4
{
  id v7;
  id v8;
  FCESLInventory *v9;
  FCESLInventory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCESLInventory;
  v9 = -[FCESLInventory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_globalInventory, a3);
    objc_storeStrong((id *)&v10->_tagInventory, a4);
  }

  return v10;
}

- (void)prewarmScoreCache:(id)a3 configuration:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v6 = a3;
  objc_msgSend(a4, "personalizationTreatment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "scoringVersion");

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__FCESLInventory_prewarmScoreCache_configuration___block_invoke;
  v10[3] = &unk_1E4640E18;
  v11 = v6;
  v12 = v8;
  v9 = v6;
  -[FCESLInventory _enumerateChildInventories:](self, "_enumerateChildInventories:", v10);

}

void __50__FCESLInventory_prewarmScoreCache_configuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "allFeedItemScoreProfilesForConfigurationSet:scoringVersion:", 0, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addScoreProfiles:configurationSet:", v6, 0);
  objc_msgSend(v4, "allFeedItemScoreProfilesForConfigurationSet:scoringVersion:", 11, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addScoreProfiles:configurationSet:", v5, 11);
}

- (NSArray)allFeedItems
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSArray *v10;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[4];
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__FCESLInventory_allFeedItems__block_invoke;
  aBlock[3] = &unk_1E4640E40;
  v15 = v4;
  v6 = v3;
  v16 = v6;
  v7 = v4;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __30__FCESLInventory_allFeedItems__block_invoke_2;
  v12[3] = &unk_1E4640E68;
  v13 = _Block_copy(aBlock);
  v8 = v13;
  -[FCESLInventory _enumerateChildInventories:](self, "_enumerateChildInventories:", v12);
  v9 = v13;
  v10 = (NSArray *)v6;

  return v10;
}

void __30__FCESLInventory_allFeedItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8 = v3;
  objc_msgSend(v3, "articleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v8, "articleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

void __30__FCESLInventory_allFeedItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "allFeedItems");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", *(_QWORD *)(a1 + 32));

}

- (id)allFeedItemScoreProfilesForConfigurationSet:(int64_t)a3 scoringVersion:(unint64_t)a4
{
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  int64_t v12;
  unint64_t v13;

  +[FCMapTable mapTableWithKeyOptions:valueOptions:](FCMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__FCESLInventory_allFeedItemScoreProfilesForConfigurationSet_scoringVersion___block_invoke;
  v10[3] = &unk_1E4640E90;
  v8 = v7;
  v11 = v8;
  v12 = a3;
  v13 = a4;
  -[FCESLInventory _enumerateChildInventories:](self, "_enumerateChildInventories:", v10);

  return v8;
}

void __77__FCESLInventory_allFeedItemScoreProfilesForConfigurationSet_scoringVersion___block_invoke(_QWORD *a1, void *a2)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  objc_msgSend(a2, "allFeedItemScoreProfilesForConfigurationSet:scoringVersion:", a1[5], a1[6]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromMapTable:", v3);

}

- (id)allFeedItemsWithTopic:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD aBlock[4];
  id v19;
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__FCESLInventory_allFeedItemsWithTopic___block_invoke;
  aBlock[3] = &unk_1E4640E40;
  v19 = v6;
  v8 = v5;
  v20 = v8;
  v9 = v6;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __40__FCESLInventory_allFeedItemsWithTopic___block_invoke_2;
  v15[3] = &unk_1E4640EB8;
  v16 = v4;
  v17 = _Block_copy(aBlock);
  v10 = v17;
  v11 = v4;
  -[FCESLInventory _enumerateChildInventories:](self, "_enumerateChildInventories:", v15);
  v12 = v17;
  v13 = v8;

  return v13;
}

void __40__FCESLInventory_allFeedItemsWithTopic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8 = v3;
  objc_msgSend(v3, "articleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v8, "articleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

void __40__FCESLInventory_allFeedItemsWithTopic___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "allFeedItemsWithTopic:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", *(_QWORD *)(a1 + 40));

}

- (void)refreshIfNeededWithCompletion:(id)a3
{
  id v4;
  dispatch_group_t v5;
  uint64_t v6;
  NSObject *v7;
  void (**v8)(id, _QWORD);
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  void (**v12)(id, _QWORD);
  uint64_t *v13;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  v5 = dispatch_group_create();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__FCESLInventory_refreshIfNeededWithCompletion___block_invoke;
  v14[3] = &unk_1E4640F08;
  v7 = v5;
  v15 = v7;
  v16 = &v17;
  -[FCESLInventory _enumerateChildInventories:](self, "_enumerateChildInventories:", v14);
  if (FCDispatchGroupIsEmpty(v7))
  {
    v8 = (void (**)(id, _QWORD))v4;
    v8[2](v8, *((unsigned __int8 *)v18 + 24));
  }
  else
  {
    v9 = FCCurrentQoS();
    FCDispatchQueueForQualityOfService(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __48__FCESLInventory_refreshIfNeededWithCompletion___block_invoke_4;
    v11[3] = &unk_1E463B8F8;
    v12 = (void (**)(id, _QWORD))v4;
    v13 = &v17;
    dispatch_group_notify(v7, v10, v11);

    v8 = v12;
  }

  _Block_object_dispose(&v17, 8);
}

void __48__FCESLInventory_refreshIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__FCESLInventory_refreshIfNeededWithCompletion___block_invoke_2;
  v7[3] = &unk_1E4640EE0;
  v6 = *(_OWORD *)(a1 + 32);
  v5 = (id)v6;
  v8 = v6;
  objc_msgSend(v4, "refreshIfNeededWithCompletion:", v7);

}

void __48__FCESLInventory_refreshIfNeededWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    a2 = 1;
  *(_BYTE *)(v2 + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __48__FCESLInventory_refreshIfNeededWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (id)_childInventories
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[FCESLInventory globalInventory](self, "globalInventory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[FCESLInventory tagInventory](self, "tagInventory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_enumerateChildInventories:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[FCESLInventory _childInventories](self, "_childInventories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1A8580B64]();
        v4[2](v4, v10);
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (FCFeedItemInventoryType)globalInventory
{
  return self->_globalInventory;
}

- (FCFeedItemInventoryType)tagInventory
{
  return self->_tagInventory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagInventory, 0);
  objc_storeStrong((id *)&self->_globalInventory, 0);
}

@end
