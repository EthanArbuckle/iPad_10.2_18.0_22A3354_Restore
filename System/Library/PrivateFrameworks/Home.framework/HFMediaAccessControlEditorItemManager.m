@implementation HFMediaAccessControlEditorItemManager

- (HFMediaAccessControlEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_home_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaAccessControlEditorItemManager.m"), 16, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFMediaAccessControlEditorItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HFMediaAccessControlEditorItemManager)initWithDelegate:(id)a3 home:(id)a4
{
  id v6;
  HFMediaAccessControlEditorItemManager *v7;
  HFMediaAccessControlEditorItemModule *v8;
  HFMediaAccessControlEditorItemModule *accessControlEditorItemModule;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFMediaAccessControlEditorItemManager;
  v7 = -[HFItemManager initWithDelegate:sourceItem:](&v11, sel_initWithDelegate_sourceItem_, a3, 0);
  if (v7)
  {
    v8 = -[HFMediaAccessControlEditorItemModule initWithItemUpdater:home:]([HFMediaAccessControlEditorItemModule alloc], "initWithItemUpdater:home:", v7, v6);
    accessControlEditorItemModule = v7->_accessControlEditorItemModule;
    v7->_accessControlEditorItemModule = v8;

  }
  return v7;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HFMediaAccessControlEditorItemManager accessControlEditorItemModule](self, "accessControlEditorItemModule", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[HFMediaAccessControlEditorItemManager accessControlEditorItemModule](self, "accessControlEditorItemModule");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buildSectionsWithDisplayedItems:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (HFMediaAccessControlEditorItemModule)accessControlEditorItemModule
{
  return self->_accessControlEditorItemModule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessControlEditorItemModule, 0);
}

@end
