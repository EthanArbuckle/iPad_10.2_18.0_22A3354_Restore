@implementation CNUIContactsAuthorizationController

- (CNUIContactsAuthorizationController)init
{
  CNUIContactsAuthorizationController *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUIContactsAuthorizationController)initWithBundleIdentifier:(id)a3
{
  id v4;
  CNUIContactsAuthorizationController *v5;
  CNUIContactsAuthorizationStore *v6;
  CNUIContactsAuthorizationStore *store;
  CNUIContactsAuthorizationController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIContactsAuthorizationController;
  v5 = -[CNUIContactsAuthorizationController init](&v10, sel_init);
  if (v5)
  {
    v6 = -[CNUIContactsAuthorizationStore initWithBundleIdentifier:]([CNUIContactsAuthorizationStore alloc], "initWithBundleIdentifier:", v4);
    store = v5->_store;
    v5->_store = v6;

    v8 = v5;
  }

  return v5;
}

- (CNUICoreContactsAuthorizationModel)model
{
  CNUICoreContactsAuthorizationModel *model;
  CNUICoreContactsAuthorizationModel *v4;
  CNUICoreContactsAuthorizationModel *v5;

  model = self->_model;
  if (!model)
  {
    -[CNUIContactsAuthorizationController createModel](self, "createModel");
    v4 = (CNUICoreContactsAuthorizationModel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_model;
    self->_model = v4;

    model = self->_model;
  }
  return model;
}

- (id)createModel
{
  void *v2;
  void *v3;
  void *v4;

  -[CNUIContactsAuthorizationController store](self, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactsAuthorizationModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "result:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)lazilyLoadIconsForRemoteItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[CNUIContactsAuthorizationController store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIContactsAuthorizationController model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactsAuthorizationModelByLoadingIconsOfRemoteItemsInModel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__CNUIContactsAuthorizationController_lazilyLoadIconsForRemoteItems__block_invoke;
  v6[3] = &unk_1E204D7C0;
  v6[4] = self;
  objc_msgSend(v5, "addSuccessBlock:", v6);

}

- (void)saveModel
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[CNUIContactsAuthorizationController store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIContactsAuthorizationController model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveContactsAuthorizationModel:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (id)objc_msgSend(v6, "result:", 0);
}

- (BOOL)foundAppsWithContactsAccessInfo
{
  void *v2;
  char v3;

  -[CNUIContactsAuthorizationController model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEmpty") ^ 1;

  return v3;
}

- (NSArray)bundleIdentifiersOfAppsWithContactsAccessInfo
{
  void *v2;
  void *v3;

  -[CNUIContactsAuthorizationController model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)authorizationLevelOfAppWithBundleIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  -[CNUIContactsAuthorizationController model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemWithMatchingBundleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v7, "authorization"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)nameOfAppWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CNUIContactsAuthorizationController model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemWithMatchingBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)iconOfAppWithBundleIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0DC3870];
  v5 = a3;
  -[CNUIContactsAuthorizationController model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemWithMatchingBundleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setAuthorizationLevel:(id)a3 ofAppWithBundleIdentifier:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = objc_msgSend(a3, "unsignedIntegerValue");
  -[CNUIContactsAuthorizationController model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemWithMatchingBundleIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAuthorization:", v7);
  -[CNUIContactsAuthorizationController saveModel](self, "saveModel");
}

- (CNUIContactsAuthorizationControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNUIContactsAuthorizationControllerDelegate *)a3;
}

- (CNUIContactsAuthorizationStore)store
{
  return self->_store;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

void __68__CNUIContactsAuthorizationController_lazilyLoadIconsForRemoteItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelByCopyingIconsOfRemoteItemsFromModel:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setModel:", v6);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "bundleIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "controller:didRefreshInfoForAppsWithBundleIdentifiers:", v7, v8);
}

+ (NSString)authorizationPaneFooterLabel
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CONTACTS_FOOTER"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)authorizationPaneHeaderLabel
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CONTACTS_AUTH_HEADER"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)authorizationPaneContactsAppLabel
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CONTACTS"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSArray)validAuthorizationValues
{
  return (NSArray *)&unk_1E20D38B0;
}

+ (NSArray)validAuthorizationLabelsForValues
{
  return (NSArray *)&unk_1E20D38C8;
}

@end
