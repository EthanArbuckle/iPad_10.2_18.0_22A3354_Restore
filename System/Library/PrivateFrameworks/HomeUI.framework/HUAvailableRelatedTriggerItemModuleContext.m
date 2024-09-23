@implementation HUAvailableRelatedTriggerItemModuleContext

- (HUAvailableRelatedTriggerItemModuleContext)init
{
  HUAvailableRelatedTriggerItemModuleContext *v2;
  HUAvailableRelatedTriggerItemModuleContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUAvailableRelatedTriggerItemModuleContext;
  v2 = -[HUAvailableRelatedTriggerItemModuleContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HUAvailableRelatedTriggerItemModuleContext setShowsIcons:](v2, "setShowsIcons:", 0);
    -[HUAvailableRelatedTriggerItemModuleContext setHidesAddAutomationItem:](v3, "setHidesAddAutomationItem:", 0);
    -[HUAvailableRelatedTriggerItemModuleContext setCommitsAutomatically:](v3, "setCommitsAutomatically:", 1);
    -[HUAvailableRelatedTriggerItemModuleContext setItemsAreEditable:](v3, "setItemsAreEditable:", 1);
    -[HUAvailableRelatedTriggerItemModuleContext setErrorHandlingStrategy:](v3, "setErrorHandlingStrategy:", 1);
    -[HUAvailableRelatedTriggerItemModuleContext setHidesCustomTriggers:](v3, "setHidesCustomTriggers:", 0);
    -[HUAvailableRelatedTriggerItemModuleContext setAnalyticsPresentationContext:](v3, "setAnalyticsPresentationContext:", 0);
    -[HUAvailableRelatedTriggerItemModuleContext setDefaultActiveValue:](v3, "setDefaultActiveValue:", 0);
    -[HUAvailableRelatedTriggerItemModuleContext setEngineOptions:](v3, "setEngineOptions:", 83);
    -[HUAvailableRelatedTriggerItemModuleContext setShowNaturalLightingItem:](v3, "setShowNaturalLightingItem:", 0);
  }
  return v3;
}

- (HUAvailableRelatedTriggerItemModuleContext)initWithContext:(id)a3
{
  id v4;
  HUAvailableRelatedTriggerItemModuleContext *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = -[HUAvailableRelatedTriggerItemModuleContext init](self, "init");
  -[HUAvailableRelatedTriggerItemModuleContext setShowsIcons:](v5, "setShowsIcons:", objc_msgSend(v4, "showsIcons"));
  -[HUAvailableRelatedTriggerItemModuleContext setHidesAddAutomationItem:](v5, "setHidesAddAutomationItem:", objc_msgSend(v4, "hidesAddAutomationItem"));
  -[HUAvailableRelatedTriggerItemModuleContext setCommitsAutomatically:](v5, "setCommitsAutomatically:", objc_msgSend(v4, "commitsAutomatically"));
  -[HUAvailableRelatedTriggerItemModuleContext setItemsAreEditable:](v5, "setItemsAreEditable:", objc_msgSend(v4, "itemsAreEditable"));
  -[HUAvailableRelatedTriggerItemModuleContext setErrorHandlingStrategy:](v5, "setErrorHandlingStrategy:", objc_msgSend(v4, "errorHandlingStrategy"));
  -[HUAvailableRelatedTriggerItemModuleContext setHidesCustomTriggers:](v5, "setHidesCustomTriggers:", objc_msgSend(v4, "hidesCustomTriggers"));
  objc_msgSend(v4, "analyticsPresentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvailableRelatedTriggerItemModuleContext setAnalyticsPresentationContext:](v5, "setAnalyticsPresentationContext:", v6);

  objc_msgSend(v4, "defaultActiveValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvailableRelatedTriggerItemModuleContext setDefaultActiveValue:](v5, "setDefaultActiveValue:", v7);

  -[HUAvailableRelatedTriggerItemModuleContext setEngineOptions:](v5, "setEngineOptions:", objc_msgSend(v4, "engineOptions"));
  v8 = objc_msgSend(v4, "showNaturalLightingItem");

  -[HUAvailableRelatedTriggerItemModuleContext setShowNaturalLightingItem:](v5, "setShowNaturalLightingItem:", v8);
  return v5;
}

- (BOOL)showsIcons
{
  return self->_showsIcons;
}

- (void)setShowsIcons:(BOOL)a3
{
  self->_showsIcons = a3;
}

- (BOOL)hidesAddAutomationItem
{
  return self->_hidesAddAutomationItem;
}

- (void)setHidesAddAutomationItem:(BOOL)a3
{
  self->_hidesAddAutomationItem = a3;
}

- (BOOL)commitsAutomatically
{
  return self->_commitsAutomatically;
}

- (void)setCommitsAutomatically:(BOOL)a3
{
  self->_commitsAutomatically = a3;
}

- (BOOL)itemsAreEditable
{
  return self->_itemsAreEditable;
}

- (void)setItemsAreEditable:(BOOL)a3
{
  self->_itemsAreEditable = a3;
}

- (BOOL)hidesCustomTriggers
{
  return self->_hidesCustomTriggers;
}

- (void)setHidesCustomTriggers:(BOOL)a3
{
  self->_hidesCustomTriggers = a3;
}

- (unint64_t)errorHandlingStrategy
{
  return self->_errorHandlingStrategy;
}

- (void)setErrorHandlingStrategy:(unint64_t)a3
{
  self->_errorHandlingStrategy = a3;
}

- (BOOL)showNaturalLightingItem
{
  return self->_showNaturalLightingItem;
}

- (void)setShowNaturalLightingItem:(BOOL)a3
{
  self->_showNaturalLightingItem = a3;
}

- (NSString)analyticsPresentationContext
{
  return self->_analyticsPresentationContext;
}

- (void)setAnalyticsPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsPresentationContext, a3);
}

- (NSNumber)defaultActiveValue
{
  return self->_defaultActiveValue;
}

- (void)setDefaultActiveValue:(id)a3
{
  objc_storeStrong((id *)&self->_defaultActiveValue, a3);
}

- (unint64_t)engineOptions
{
  return self->_engineOptions;
}

- (void)setEngineOptions:(unint64_t)a3
{
  self->_engineOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultActiveValue, 0);
  objc_storeStrong((id *)&self->_analyticsPresentationContext, 0);
}

@end
