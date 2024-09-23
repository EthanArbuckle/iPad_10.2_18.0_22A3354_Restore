@implementation MUIMailboxFilterController

- (MUIMailboxFilterController)initWithMailboxes:(id)a3 focus:(id)a4 baseStoragePath:(id)a5 defaultsRepresentationProvider:(id)a6 filterRepresentationProvider:(id)a7 mailboxFilterClass:(Class)a8 filterProviderClass:(Class)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  MUIMailboxFilterController *v20;
  MUIMailboxFilterContext *v21;
  MUIMailboxFilterPersistedStore *v22;
  MUIMailboxFilterPersistedStore *store;
  uint64_t v24;
  MUIMailboxFilterViewModel *viewModel;
  objc_super v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MUIMailboxFilterController;
  v20 = -[MUIMailboxFilterController init](&v27, sel_init);
  if (v20)
  {
    v21 = -[MUIMailboxFilterContext initWithMailboxes:focus:]([MUIMailboxFilterContext alloc], "initWithMailboxes:focus:", v15, v16);
    v22 = -[MUIMailboxFilterPersistedStore initWithBaseStoragePath:defaultsRepresentationProvider:filterRepresentationProvider:mailboxFilterClass:filterProviderClass:]([MUIMailboxFilterPersistedStore alloc], "initWithBaseStoragePath:defaultsRepresentationProvider:filterRepresentationProvider:mailboxFilterClass:filterProviderClass:", v17, v18, v19, a8, a9);
    store = v20->_store;
    v20->_store = v22;

    -[MUIMailboxFilterPersistedStore filterViewModelForContext:](v20->_store, "filterViewModelForContext:", v21);
    v24 = objc_claimAutoreleasedReturnValue();
    viewModel = v20->_viewModel;
    v20->_viewModel = (MUIMailboxFilterViewModel *)v24;

  }
  return v20;
}

- (void)updateWithFilterContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  MUIMailboxFilterViewModel *v7;
  MUIMailboxFilterViewModel *viewModel;
  id v9;

  v9 = a3;
  -[MUIMailboxFilterController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v9)
  {
    -[MUIMailboxFilterController store](self, "store");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filterViewModelForContext:", v9);
    v7 = (MUIMailboxFilterViewModel *)objc_claimAutoreleasedReturnValue();
    viewModel = self->_viewModel;
    self->_viewModel = v7;

  }
}

- (void)reselectFocusedAccounts
{
  id v2;

  -[MUIMailboxFilterController viewModel](self, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reselectFocusFilters");

}

- (MUIMailboxFilterViewModel)viewModel
{
  return self->_viewModel;
}

- (MUIMailboxFilterPersistedStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
