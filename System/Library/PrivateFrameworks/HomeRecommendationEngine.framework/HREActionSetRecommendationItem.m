@implementation HREActionSetRecommendationItem

- (HREActionSetRecommendationItem)initWithRecommendationItem:(id)a3
{
  id v5;
  HREActionSetRecommendationItem *v6;
  HREActionSetRecommendationItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HREActionSetRecommendationItem;
  v6 = -[HREActionSetRecommendationItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_recommendationItem, a3);

  return v7;
}

- (HREActionSetRecommendationItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithRecommendationItem_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HREActionSetRecommendationItem.m"), 25, CFSTR("%s is unavailable; use %@ instead"),
    "-[HREActionSetRecommendationItem init]",
    v5);

  return 0;
}

- (HREActionSetRecommendation)recommendation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_opt_class();
  -[HREActionSetRecommendationItem recommendationItem](self, "recommendationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recommendation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return (HREActionSetRecommendation *)v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[HREActionSetRecommendationItem recommendationItem](self, "recommendationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithOptions:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__HREActionSetRecommendationItem__subclass_updateWithOptions___block_invoke;
  v10[3] = &unk_24F217408;
  v10[4] = self;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __62__HREActionSetRecommendationItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "recommendation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedActionSetBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE4CF40]);

  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "recommendation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "containsMeaningfulChanges") ^ 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE4CF88]);

  objc_msgSend(*(id *)(a1 + 32), "serviceLikeItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x24BE4D030]);
    objc_msgSend(*(id *)(a1 + 32), "recommendation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectedActionSetBuilder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithActionSetBuilder:", v12);

    objc_msgSend(*(id *)(a1 + 32), "serviceLikeItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copyWithValueSource:", v13);

    v16 = objc_alloc(MEMORY[0x24BE4D158]);
    objc_msgSend(*(id *)(a1 + 32), "recommendation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithHome:containingItem:", v18, v15);

    v20 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(*(id *)(a1 + 32), "recommendation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "selectedActionSetBuilder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "actions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActionBuilders:", v24);

    objc_msgSend(v19, "updateWithOptions:", *(_QWORD *)(a1 + 40));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __62__HREActionSetRecommendationItem__subclass_updateWithOptions___block_invoke_2;
    v28[3] = &unk_24F2173E0;
    v29 = v3;
    objc_msgSend(v25, "flatMap:", v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

uint64_t __62__HREActionSetRecommendationItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  v3 = *MEMORY[0x24BE4CF58];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BE4CF58]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);

  return objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

- (HRERecommendationItem)recommendationItem
{
  return self->_recommendationItem;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (void)setServiceLikeItem:(id)a3
{
  objc_storeStrong((id *)&self->_serviceLikeItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
  objc_storeStrong((id *)&self->_recommendationItem, 0);
}

@end
