@implementation HSPCSuggestedAutomationsItemManager

- (HSPCSuggestedAutomationsItemManager)initWithDelegate:(id)a3 serviceLikeItems:(id)a4
{
  id v7;
  uint64_t v8;
  HSPCSuggestedAutomationsItemManager *v9;
  uint64_t v10;
  NSObject *v11;
  HUAvailableRelatedTriggerItemModuleContext *v12;
  HUAvailableRelatedTriggerItemModuleContext *context;
  uint8_t v15[16];
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HSPCSuggestedAutomationsItemManager;
  v9 = -[HSPCSuggestedAutomationsItemManager initWithDelegate:](&v16, "initWithDelegate:", a3);
  if (v9)
  {
    v10 = HFLogForCategory(62, v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Using following service items:", v15, 2u);
    }

    objc_msgSend(v7, "na_each:", &stru_1000A17C0);
    objc_storeStrong((id *)&v9->_serviceLikeItems, a4);
    v12 = (HUAvailableRelatedTriggerItemModuleContext *)objc_alloc_init((Class)HUAvailableRelatedTriggerItemModuleContext);
    context = v9->_context;
    v9->_context = v12;

    -[HUAvailableRelatedTriggerItemModuleContext setEngineOptions:](v9->_context, "setEngineOptions:", (unint64_t)-[HUAvailableRelatedTriggerItemModuleContext engineOptions](v9->_context, "engineOptions") & 0xFFFFFFFFFFFFFFEFLL);
    -[HUAvailableRelatedTriggerItemModuleContext setShowsIcons:](v9->_context, "setShowsIcons:", 1);
    -[HUAvailableRelatedTriggerItemModuleContext setHidesAddAutomationItem:](v9->_context, "setHidesAddAutomationItem:", 1);
    -[HUAvailableRelatedTriggerItemModuleContext setCommitsAutomatically:](v9->_context, "setCommitsAutomatically:", 0);
    -[HUAvailableRelatedTriggerItemModuleContext setItemsAreEditable:](v9->_context, "setItemsAreEditable:", 0);
    -[HUAvailableRelatedTriggerItemModuleContext setHidesCustomTriggers:](v9->_context, "setHidesCustomTriggers:", 1);
    -[HUAvailableRelatedTriggerItemModuleContext setErrorHandlingStrategy:](v9->_context, "setErrorHandlingStrategy:", 0);
    -[HUAvailableRelatedTriggerItemModuleContext setAnalyticsPresentationContext:](v9->_context, "setAnalyticsPresentationContext:", CFSTR("setup"));
    -[HUAvailableRelatedTriggerItemModuleContext setShowNaturalLightingItem:](v9->_context, "setShowNaturalLightingItem:", 1);
  }

  return v9;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationsItemManager serviceLikeItems](self, "serviceLikeItems", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  v5 = objc_msgSend(objc_alloc((Class)HFStaticItemProvider), "initWithItems:", v4);
  v8 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  return v6;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  objc_super v19;
  uint8_t buf[4];
  void *v21;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HSPCSuggestedAutomationsItemManager;
  v5 = -[HSPCSuggestedAutomationsItemManager _itemsToHideInSet:](&v19, "_itemsToHideInSet:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v6, "mutableCopy");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationsItemManager serviceLikeItems](self, "serviceLikeItems"));
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationsItemManager recommendationModule](self, "recommendationModule"));
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationsItemManager recommendationModule](self, "recommendationModule"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemsToHideInSet:", v4));
    objc_msgSend(v7, "unionSet:", v12);

  }
  v13 = HFLogForCategory(62, v10);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100018048;
    v18[3] = &unk_1000A17E8;
    v18[4] = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_map:", v18));
    *(_DWORD *)buf = 138412290;
    v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Hiding items: %@", buf, 0xCu);

  }
  v16 = objc_msgSend(v7, "copy");

  return v16;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  HUAvailableRelatedTriggerItemModule *v8;
  HUAvailableRelatedTriggerItemModule *recommendationModule;
  void *v10;
  void *v11;
  void *v13;

  v4 = a3;
  v5 = objc_alloc((Class)HUAvailableRelatedTriggerItemModule);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationsItemManager serviceLikeItems](self, "serviceLikeItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationsItemManager context](self, "context"));
  v8 = (HUAvailableRelatedTriggerItemModule *)objc_msgSend(v5, "initWithItems:itemUpdater:home:context:", v6, self, v4, v7);

  recommendationModule = self->_recommendationModule;
  self->_recommendationModule = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationsItemManager recommendationModule](self, "recommendationModule"));
  v13 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));

  return v11;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationsItemManager recommendationModule](self, "recommendationModule"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "buildSectionsWithDisplayedItems:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v8 = objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setFooterTitle:", 0);
  objc_msgSend(v8, "setHeaderTitle:", 0);
  objc_msgSend(v8, "setAttributedFooterTitle:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray na_arrayWithSafeObject:](NSArray, "na_arrayWithSafeObject:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HFItemSection filterSections:toDisplayedItems:](HFItemSection, "filterSections:toDisplayedItems:", v9, v4));

  return v10;
}

- (NSArray)serviceLikeItems
{
  return self->_serviceLikeItems;
}

- (void)setServiceLikeItems:(id)a3
{
  objc_storeStrong((id *)&self->_serviceLikeItems, a3);
}

- (HUAvailableRelatedTriggerItemModule)recommendationModule
{
  return self->_recommendationModule;
}

- (void)setRecommendationModule:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationModule, a3);
}

- (HUAvailableRelatedTriggerItemModuleContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_recommendationModule, 0);
  objc_storeStrong((id *)&self->_serviceLikeItems, 0);
}

@end
