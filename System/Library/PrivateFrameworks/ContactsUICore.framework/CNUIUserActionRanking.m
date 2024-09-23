@implementation CNUIUserActionRanking

uint64_t __57__CNUIUserActionRanking_selectMostRecentActionFromItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "targetHandle");
}

id __59__CNUIUserActionRanking_sortActionItems_schedulerProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[CNUIUserActionItemComparator comparatorWithActionItemGrouping](CNUIUserActionItemComparator, "comparatorWithActionItemGrouping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CNComparatorForSortingByAuxiliaryValues();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNUIUserActionItemComparator comparatorWithPreferredLabelsFirst](CNUIUserActionItemComparator, "comparatorWithPreferredLabelsFirst", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  +[CNUIUserActionItemComparator comparatorWithAlphabeticalOrderByLabel](CNUIUserActionItemComparator, "comparatorWithAlphabeticalOrderByLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v7;
  +[CNUIUserActionItemComparator comparatorWithAlphabeticalOrderByTargetHandle](CNUIUserActionItemComparator, "comparatorWithAlphabeticalOrderByTargetHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CNAggregateComparator();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "sortedArrayUsingComparator:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __57__CNUIUserActionRanking_selectMostRecentActionFromItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  sSortKeyForUserActionItem_block_invoke_2(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)sortKeyWithUsername:(id)a3 bundleIdentifier:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), a3, a4);
}

id __67__CNUIUserActionRanking_selectRecentActionItems_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D13AE8];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__CNUIUserActionRanking_selectRecentActionItems_schedulerProvider___block_invoke_2;
  v10[3] = &unk_1EA605278;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = v6;
  v13 = v3;
  v7 = v3;
  objc_msgSend(v4, "observableWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)constrainMechanismsForActionType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96618]) & 1) != 0)
  {
    v5 = &unk_1EA61C508;
LABEL_11:
    objc_msgSend(v4, "addObject:", v5);
    goto LABEL_12;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96620]) & 1) != 0)
  {
    v5 = &unk_1EA61C550;
    v6 = &unk_1EA61C538;
    v7 = &unk_1EA61C520;
LABEL_9:
    objc_msgSend(v4, "addObject:", v7);
    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96658]) & 1) != 0)
  {
    v5 = &unk_1EA61C580;
    v6 = &unk_1EA61C568;
LABEL_10:
    objc_msgSend(v4, "addObject:", v6);
    goto LABEL_11;
  }
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C965F8]))
  {
    objc_msgSend(v4, "addObject:", &unk_1EA61C598);
    v5 = &unk_1EA61C5E0;
    v6 = &unk_1EA61C5C8;
    v7 = &unk_1EA61C5B0;
    goto LABEL_9;
  }
LABEL_12:

  return v4;
}

- (id)sortActionItems:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    objc_msgSend(v6, "_cn_map:", &__block_literal_global_78);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIUserActionRanking sortKeysByRankingAddresses:actionType:scheduler:](self, "sortKeysByRankingAddresses:actionType:scheduler:", v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __59__CNUIUserActionRanking_sortActionItems_schedulerProvider___block_invoke;
    v24[3] = &unk_1EA604F20;
    v15 = v6;
    v25 = v15;
    objc_msgSend(v13, "recover:", v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = v14;
    v22[1] = 3221225472;
    v22[2] = __59__CNUIUserActionRanking_sortActionItems_schedulerProvider___block_invoke_2;
    v22[3] = &unk_1EA605790;
    v17 = v15;
    v23 = v17;
    objc_msgSend(v16, "flatMap:", v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __59__CNUIUserActionRanking_sortActionItems_schedulerProvider___block_invoke_3;
    v20[3] = &unk_1EA604F20;
    v21 = v17;
    objc_msgSend(v18, "recover:", v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)selectRecentActionItems:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  CNUIUserActionRanking *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __67__CNUIUserActionRanking_selectRecentActionItems_schedulerProvider___block_invoke;
  v16 = &unk_1EA6048B8;
  v17 = v6;
  v18 = self;
  v7 = v6;
  objc_msgSend(a3, "switchMap:schedulerProvider:", &v13, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "array", v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startWith:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)sortKeysByRankingAddresses:(id)a3 actionType:(id)a4 scheduler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0D13A68];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__CNUIUserActionRanking_sortKeysByRankingAddresses_actionType_scheduler___block_invoke;
  v15[3] = &unk_1EA6057D8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "futureWithBlock:scheduler:", v15, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addFailureBlock:", &__block_literal_global_9_2);

  return v13;
}

void __67__CNUIUserActionRanking_selectRecentActionItems_schedulerProvider___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "selectMostRecentActionFromItems:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "isCanceled");

  if ((v4 & 1) == 0)
  {
    if (v6)
    {
      v7 = *(void **)(a1 + 48);
      v9[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "observerDidReceiveResult:", v8);

    }
    objc_msgSend(*(id *)(a1 + 48), "observerDidComplete");
  }

}

id __73__CNUIUserActionRanking_sortKeysByRankingAddresses_actionType_scheduler___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend((id)objc_opt_class(), "advisorSettingsForSortingAddresses:actionType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "interactionAdvisor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adviseInteractionsUsingSettings:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "_cn_map:", &__block_literal_global_34);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 301);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a2)
      *a2 = objc_retainAutorelease(v8);

    v7 = 0;
  }

  return v7;
}

- (id)selectMostRecentActionFromItems:(id)a3
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
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_39);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_distinctObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "advisorSettingsForIdentifyingMostRecentAction:actionType:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionRanking interactionAdvisor](self, "interactionAdvisor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "adviseInteractionsUsingSettings:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sSortKeyForAdvisedInteraction_block_invoke_3((uint64_t)v12, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__CNUIUserActionRanking_selectMostRecentActionFromItems___block_invoke_2;
  v17[3] = &unk_1EA6039B0;
  v18 = v13;
  v14 = v13;
  objc_msgSend(v4, "_cn_firstObjectPassingTest:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (CNUIInteractionAdvisor)interactionAdvisor
{
  return self->_interactionAdvisor;
}

+ (id)advisorSettingsForSortingAddresses:(id)a3 actionType:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0D158C8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "interactionAdvisorSettingsDefault");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInteractionDate:", v9);

  objc_msgSend((id)objc_opt_class(), "constrainMechanismsForActionType:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setConstrainMechanisms:", v10);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setConstrainIdentifiers:", v11);
  objc_msgSend(v8, "setResultLimit:", 10);
  return v8;
}

+ (id)advisorSettingsForIdentifyingMostRecentAction:(id)a3 actionType:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0D158C8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "interactionAdvisorSettingsDefault");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInteractionDate:", v9);

  objc_msgSend((id)objc_opt_class(), "constrainMechanismsForActionType:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setConstrainMechanisms:", v10);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setConstrainIdentifiers:", v11);
  objc_msgSend(v8, "setConsumerIdentifier:", CFSTR("recency"));
  objc_msgSend(v8, "setResultLimit:", 1);
  return v8;
}

id __67__CNUIUserActionRanking_selectRecentActionItems_schedulerProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "backgroundScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__CNUIUserActionRanking_selectRecentActionItems_schedulerProvider___block_invoke_3;
  v9[3] = &unk_1EA605250;
  v5 = *(void **)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v3;
  v6 = v3;
  objc_msgSend(v4, "performCancelableBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CNUIUserActionRanking)init
{
  void *v3;
  CNUIUserActionRanking *v4;

  objc_msgSend(MEMORY[0x1E0D158C0], "interactionAdvisor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNUIUserActionRanking initWithInteractionAdvisor:](self, "initWithInteractionAdvisor:", v3);

  return v4;
}

- (CNUIUserActionRanking)initWithInteractionAdvisor:(id)a3
{
  id v5;
  CNUIUserActionRanking *v6;
  CNUIUserActionRanking *v7;
  CNUIUserActionRanking *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIUserActionRanking;
  v6 = -[CNUIUserActionRanking init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_interactionAdvisor, a3);
    v8 = v7;
  }

  return v7;
}

id __59__CNUIUserActionRanking_sortActionItems_schedulerProvider___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D13A68];
  objc_msgSend(*(id *)(a1 + 32), "_cn_map:", &__block_literal_global_78);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __59__CNUIUserActionRanking_sortActionItems_schedulerProvider___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

void __73__CNUIUserActionRanking_sortKeysByRankingAddresses_actionType_scheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Error ranking addresses: %@"), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionAdvisor, 0);
}

@end
