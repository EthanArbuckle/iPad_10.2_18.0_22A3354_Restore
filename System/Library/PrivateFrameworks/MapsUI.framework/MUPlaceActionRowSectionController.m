@implementation MUPlaceActionRowSectionController

- (MUPlaceActionRowSectionController)initWithMapItem:(id)a3 actionManager:(id)a4 menuProvider:(id)a5
{
  id v8;
  id v9;
  MUPlaceActionRowSectionController *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MUPlaceActionRowSectionController;
  v10 = -[MUPlaceSectionController initWithMapItem:](&v15, sel_initWithMapItem_, a3);
  if (v10)
  {
    MUGetPlaceCardLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceActionRowSectionControllerInit", ", v14, 2u);
    }

    objc_storeWeak((id *)&v10->_actionManager, v8);
    objc_storeWeak((id *)&v10->_menuProvider, v9);
    -[MUPlaceActionRowSectionController _setupButtons](v10, "_setupButtons");
    MUGetPlaceCardLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceActionRowSectionControllerInit", ", v14, 2u);
    }

  }
  return v10;
}

- (void)_setupButtons
{
  MUPlaceCardActionsRowViewController *v3;
  MUPlaceCardActionsRowViewController *actionsRowViewController;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  MUPlaceSectionView *v14;
  MUPlaceSectionView *sectionView;
  MUPlaceSectionView *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  MUPlaceholderGridCache *v21;
  MUPlaceholderGridCache *placeholderGridCache;

  v3 = -[MUPlaceCardActionsRowViewController initWithStyle:]([MUPlaceCardActionsRowViewController alloc], "initWithStyle:", 0);
  actionsRowViewController = self->_actionsRowViewController;
  self->_actionsRowViewController = v3;

  if (MapKitIdiomIsMacCatalyst())
    -[MUPlaceCardActionsRowViewController setMenuProvider:](self->_actionsRowViewController, "setMenuProvider:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionManager);
  -[MUPlaceCardActionsRowViewController setActionManager:](self->_actionsRowViewController, "setActionManager:", WeakRetained);

  -[MUPlaceCardActionsRowViewController view](self->_actionsRowViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreservesSuperviewLayoutMargins:", 0);

  -[MUPlaceCardActionsRowViewController view](self->_actionsRowViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInsetsLayoutMarginsFromSafeArea:", 0);

  -[MUPlaceCardActionsRowViewController actionsRowView](self->_actionsRowViewController, "actionsRowView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreservesSuperviewLayoutMargins:", 0);

  v9 = *MEMORY[0x1E0DC49E8];
  v10 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v11 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v12 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[MUPlaceCardActionsRowViewController actionsRowView](self->_actionsRowViewController, "actionsRowView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLayoutMargins:", v9, v10, v11, v12);

  v14 = -[MUPlaceSectionView initWithStyle:sectionHeaderViewModel:]([MUPlaceSectionView alloc], "initWithStyle:sectionHeaderViewModel:", 1, 0);
  sectionView = self->_sectionView;
  self->_sectionView = v14;

  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
  v16 = self->_sectionView;
  -[MUPlaceCardActionsRowViewController view](self->_actionsRowViewController, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionView attachViewToContentView:](v16, "attachViewToContentView:", v17);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D26D08]);

  if ((v20 & 1) == 0)
  {
    +[MUPlaceholderGridCache unretainedInstance](MUPlaceholderGridCache, "unretainedInstance");
    v21 = (MUPlaceholderGridCache *)objc_claimAutoreleasedReturnValue();
    placeholderGridCache = self->_placeholderGridCache;
    self->_placeholderGridCache = v21;

    -[MUPlaceholderGridCache loadPlaceholderGridImages](self->_placeholderGridCache, "loadPlaceholderGridImages");
  }
}

- (id)menuForActionItem:(id)a3
{
  void *v3;
  id v4;

  -[MUPlaceActionRowSectionController menuElementForActionItem:](self, "menuElementForActionItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)menuElementForActionItem:(id)a3
{
  MUPlaceActionRowMenuProvider **p_menuProvider;
  id v4;
  id WeakRetained;
  void *v6;

  p_menuProvider = &self->_menuProvider;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_menuProvider);
  objc_msgSend(WeakRetained, "menuElementForActionItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sectionView
{
  return self->_sectionView;
}

- (void)updateForActionRowInfoChange
{
  -[MUPlaceCardActionsRowViewController updateActionsRowView](self->_actionsRowViewController, "updateActionsRowView");
}

- (BOOL)hasContent
{
  void *v2;
  BOOL v3;

  -[MUPlaceCardActionsRowViewController actionButtons](self->_actionsRowViewController, "actionButtons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)analyticsModule
{
  return (id)objc_msgSend(MEMORY[0x1E0D26EB0], "moduleFromModuleType:", -[MUPlaceActionRowSectionController analyticsModuleType](self, "analyticsModuleType"));
}

- (int)analyticsModuleType
{
  return 12;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menuProvider);
  objc_storeStrong((id *)&self->_placeholderGridCache, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_actionsRowViewController, 0);
  objc_destroyWeak((id *)&self->_actionManager);
}

@end
