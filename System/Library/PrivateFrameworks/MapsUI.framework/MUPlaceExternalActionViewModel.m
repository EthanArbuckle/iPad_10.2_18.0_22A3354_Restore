@implementation MUPlaceExternalActionViewModel

- (MUPlaceExternalActionViewModel)initWithExternalAction:(id)a3 amsResultProvider:(id)a4 iconCache:(id)a5 actionHandler:(id)a6 analyticsHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MUPlaceExternalActionViewModel *v18;
  MUPlaceExternalActionViewModel *v19;
  MUGroupedExternalActionController *v20;
  MUPlaceExternalActionMenuHelper *v21;
  MUPlaceExternalActionMenuHelper *menuHelper;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)MUPlaceExternalActionViewModel;
  v18 = -[MUActionRowItemViewModel init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_externalAction, a3);
    v20 = -[MUGroupedExternalActionController initWithGroupedExternalAction:amsResultProvider:supportsMultipleVendorSelection:actionHandler:analyticsHandler:]([MUGroupedExternalActionController alloc], "initWithGroupedExternalAction:amsResultProvider:supportsMultipleVendorSelection:actionHandler:analyticsHandler:", v13, v14, 1, v16, v17);
    -[MUGroupedExternalActionController setSingleVendorAnalyticsTarget:](v20, "setSingleVendorAnalyticsTarget:", 201);
    -[MUGroupedExternalActionController setMultipleVendorAnalyticsTarget:](v20, "setMultipleVendorAnalyticsTarget:", 57);
    -[MUGroupedExternalActionController setAnalyticsModuleType:](v20, "setAnalyticsModuleType:", 4);
    -[MUGroupedExternalActionController setSource:](v20, "setSource:", 9);
    v21 = -[MUPlaceExternalActionMenuHelper initWithExternalActionController:iconCache:]([MUPlaceExternalActionMenuHelper alloc], "initWithExternalActionController:iconCache:", v20, v15);
    menuHelper = v19->_menuHelper;
    v19->_menuHelper = v21;

  }
  return v19;
}

- (id)buildMenuWithPresentationOptions:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[GEOPlaceExternalAction actionProviders](self->_externalAction, "actionProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 2)
  {
    v8 = (void *)MEMORY[0x1E0DC39D0];
    -[MUPlaceExternalActionMenuHelper buildMenuElementsWithPresentationOptions:](self->_menuHelper, "buildMenuElementsWithPresentationOptions:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "menuWithChildren:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)performSingleVendorSelectionAction
{
  id v2;

  -[MUPlaceExternalActionMenuHelper actionController](self->_menuHelper, "actionController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openFirstPartnerAction");

}

- (id)symbolName
{
  return (id)-[GEOPlaceExternalAction symbolName](self->_externalAction, "symbolName");
}

- (id)titleText
{
  return (id)-[GEOPlaceExternalAction actionName](self->_externalAction, "actionName");
}

- (BOOL)isEnabled
{
  void *v3;
  BOOL v4;

  if (!-[GEOPlaceExternalAction possiblyHasSupportedIntegrations](self->_externalAction, "possiblyHasSupportedIntegrations"))return 0;
  -[GEOPlaceExternalAction actionProviders](self->_externalAction, "actionProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)accessibilityIdentifier
{
  return (id)objc_msgSend(CFSTR("ActionRowItemType"), "stringByAppendingString:", CFSTR("ExternalAction"));
}

- (id)analyticsButtonValues
{
  return MUExternalActionRevealedAnalyticsModuleButtonsForAction(self->_externalAction);
}

- (GEOPlaceExternalAction)externalAction
{
  return self->_externalAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalAction, 0);
  objc_storeStrong((id *)&self->_menuHelper, 0);
}

@end
