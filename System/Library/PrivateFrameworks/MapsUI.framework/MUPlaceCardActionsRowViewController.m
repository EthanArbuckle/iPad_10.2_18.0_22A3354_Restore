@implementation MUPlaceCardActionsRowViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MUPlaceCardActionsRowViewController)initWithStyle:(unint64_t)a3
{
  MUPlaceCardActionsRowViewController *v4;
  void *v5;
  _BOOL4 v6;
  MUPlaceCardActionsRowView *v7;
  MUPlaceCardActionsRowView *actionsRowView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MUPlaceCardActionsRowViewController;
  v4 = -[MUPlaceCardActionsRowViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  if (v4)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userInterfaceIdiom") == 2;

      a3 = 2 * v6;
    }
    v7 = -[MUPlaceCardActionsRowView initWithStyle:]([MUPlaceCardActionsRowView alloc], "initWithStyle:", a3);
    actionsRowView = v4->_actionsRowView;
    v4->_actionsRowView = v7;

  }
  return v4;
}

- (void)updateActionsRowView
{
  -[MUPlaceCardActionsRowView reload](self->_actionsRowView, "reload");
}

- (void)setActionManager:(id)a3
{
  MKPlaceActionManagerProtocol **p_actionManager;
  id v5;

  p_actionManager = &self->_actionManager;
  v5 = a3;
  objc_storeWeak((id *)p_actionManager, v5);
  -[MUPlaceCardActionsRowView setActionManager:](self->_actionsRowView, "setActionManager:", v5);

}

- (void)setMenuProvider:(id)a3
{
  MUPlaceCardActionsRowViewMenuProvider **p_menuProvider;
  id v5;

  p_menuProvider = &self->_menuProvider;
  v5 = a3;
  objc_storeWeak((id *)p_menuProvider, v5);
  -[MUPlaceCardActionsRowView setMenuProvider:](self->_actionsRowView, "setMenuProvider:", v5);

}

- (NSArray)actionButtons
{
  return -[MUGroupedActionsRowView actionButtons](self->_actionsRowView, "actionButtons");
}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  uint8_t buf[8];
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  MUGetPlaceCardLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PlaceCardActionsRowViewDidLoad", ", buf, 2u);
  }

  v26.receiver = self;
  v26.super_class = (Class)MUPlaceCardActionsRowViewController;
  -[MUPlaceCardActionsRowViewController viewDidLoad](&v26, sel_viewDidLoad);
  -[MUPlaceCardActionsRowViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreservesSuperviewLayoutMargins:", 1);

  -[MUPlaceCardActionsRowView setTranslatesAutoresizingMaskIntoConstraints:](self->_actionsRowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUPlaceCardActionsRowView setPreservesSuperviewLayoutMargins:](self->_actionsRowView, "setPreservesSuperviewLayoutMargins:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionManager);
  -[MUPlaceCardActionsRowView setActionManager:](self->_actionsRowView, "setActionManager:", WeakRetained);

  -[MUPlaceCardActionsRowViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_actionsRowView);

  v18 = (void *)MEMORY[0x1E0CB3718];
  -[MUPlaceCardActionsRowView topAnchor](self->_actionsRowView, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCardActionsRowViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  -[MUPlaceCardActionsRowView leadingAnchor](self->_actionsRowView, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCardActionsRowViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v7;
  -[MUPlaceCardActionsRowView trailingAnchor](self->_actionsRowView, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCardActionsRowViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v11;
  -[MUPlaceCardActionsRowView bottomAnchor](self->_actionsRowView, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCardActionsRowViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v16);

  MUGetPlaceCardLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PlaceCardActionsRowViewDidLoad", ", buf, 2u);
  }

}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (MKPlaceActionManagerProtocol)actionManager
{
  return (MKPlaceActionManagerProtocol *)objc_loadWeakRetained((id *)&self->_actionManager);
}

- (MUPlaceCardActionsRowViewMenuProvider)menuProvider
{
  return (MUPlaceCardActionsRowViewMenuProvider *)objc_loadWeakRetained((id *)&self->_menuProvider);
}

- (MUPlaceCardActionsRowView)actionsRowView
{
  return self->_actionsRowView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsRowView, 0);
  objc_destroyWeak((id *)&self->_menuProvider);
  objc_destroyWeak((id *)&self->_actionManager);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
