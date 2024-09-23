@implementation HREActionSetRecommendationItemProvider

- (HREActionSetRecommendationItemProvider)initWithHome:(id)a3 andServiceLikeItems:(id)a4
{
  id v7;
  id v8;
  HREActionSetRecommendationItemProvider *v9;
  HREActionSetRecommendationItemProvider *v10;
  HRERecommendationItemProvider *v11;
  HRERecommendationItemProvider *recommendationProvider;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  HFTransformItemProvider *transformItemProvider;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HREActionSetRecommendationItemProvider;
  v9 = -[HFItemProvider init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_serviceLikeItems, a4);
    v11 = -[HRERecommendationItemProvider initWithHome:andServiceLikeItems:]([HRERecommendationItemProvider alloc], "initWithHome:andServiceLikeItems:", v7, v8);
    recommendationProvider = v10->_recommendationProvider;
    v10->_recommendationProvider = v11;

    -[HRERecommendationItemProvider setEngineOptions:](v10->_recommendationProvider, "setEngineOptions:", 1);
    objc_initWeak(&location, v10);
    v13 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __75__HREActionSetRecommendationItemProvider_initWithHome_andServiceLikeItems___block_invoke;
    v21[3] = &unk_24F218630;
    objc_copyWeak(&v22, &location);
    -[HRERecommendationItemProvider setFilter:](v10->_recommendationProvider, "setFilter:", v21);
    v14 = objc_alloc(MEMORY[0x24BE4D180]);
    -[HREActionSetRecommendationItemProvider recommendationProvider](v10, "recommendationProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __75__HREActionSetRecommendationItemProvider_initWithHome_andServiceLikeItems___block_invoke_2;
    v19[3] = &unk_24F218658;
    objc_copyWeak(&v20, &location);
    v16 = objc_msgSend(v14, "initWithSourceProvider:transformationBlock:", v15, v19);
    transformItemProvider = v10->_transformItemProvider;
    v10->_transformItemProvider = (HFTransformItemProvider *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v10;
}

uint64_t __75__HREActionSetRecommendationItemProvider_initWithHome_andServiceLikeItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "filter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(WeakRetained, "filter");
      v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v7 = ((uint64_t (**)(_QWORD, id))v6)[2](v6, v3);

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __75__HREActionSetRecommendationItemProvider_initWithHome_andServiceLikeItems___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "suggestionItemTransformingRecommendationItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)engineOptions
{
  void *v2;
  unint64_t v3;

  -[HREActionSetRecommendationItemProvider recommendationProvider](self, "recommendationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "engineOptions");

  return v3;
}

- (void)setEngineOptions:(unint64_t)a3
{
  id v4;

  -[HREActionSetRecommendationItemProvider recommendationProvider](self, "recommendationProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEngineOptions:", a3);

}

- (id)items
{
  void *v2;
  void *v3;

  -[HREActionSetRecommendationItemProvider transformItemProvider](self, "transformItemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)reloadItems
{
  void *v2;
  void *v3;

  -[HREActionSetRecommendationItemProvider transformItemProvider](self, "transformItemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)suggestionItemTransformingRecommendationItem:(id)a3
{
  id v4;
  HREActionSetRecommendationItem *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[HREActionSetRecommendationItem initWithRecommendationItem:]([HREActionSetRecommendationItem alloc], "initWithRecommendationItem:", v4);

  -[HREActionSetRecommendationItemProvider serviceLikeItems](self, "serviceLikeItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HREActionSetRecommendationItem setServiceLikeItem:](v5, "setServiceLikeItem:", v7);

  return v5;
}

- (HMHome)home
{
  return self->_home;
}

- (NSArray)serviceLikeItems
{
  return self->_serviceLikeItems;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (HRERecommendationItemProvider)recommendationProvider
{
  return self->_recommendationProvider;
}

- (void)setRecommendationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationProvider, a3);
}

- (HFTransformItemProvider)transformItemProvider
{
  return self->_transformItemProvider;
}

- (void)setTransformItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_transformItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformItemProvider, 0);
  objc_storeStrong((id *)&self->_recommendationProvider, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_serviceLikeItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
