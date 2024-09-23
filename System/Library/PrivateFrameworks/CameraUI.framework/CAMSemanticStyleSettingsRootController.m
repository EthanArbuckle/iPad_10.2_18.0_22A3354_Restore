@implementation CAMSemanticStyleSettingsRootController

- (void)loadView
{
  CAMSemanticStyleSettingsView *v3;
  CAMSemanticStyleSettingsView *settingsView;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_alloc_init(CAMSemanticStyleSettingsView);
  settingsView = self->__settingsView;
  self->__settingsView = v3;

  -[CAMSemanticStyleSettingsView setDelegate:](self->__settingsView, "setDelegate:", self);
  -[CAMSemanticStyleSettingsRootController setView:](self, "setView:", self->__settingsView);
  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  CAMLocalizedFrameworkString(CFSTR("SEMANTIC_STYLES_SETTINGS_CANCEL"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 2, self, sel__dismiss);

  -[CAMSemanticStyleSettingsRootController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v8);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMSemanticStyleSettingsRootController;
  -[CAMSemanticStyleSettingsRootController viewWillLayoutSubviews](&v9, sel_viewWillLayoutSubviews);
  -[CAMSemanticStyleSettingsRootController _settingsView](self, "_settingsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v6 = v4 / v5;
  if (v4 / v5 > 0.5615)
  {
    CAMLocalizedFrameworkString(CFSTR("SEMANTIC_STYLES_SETTINGS_TITLE"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[CAMSemanticStyleSettingsRootController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v7);

  if (v6 > 0.5615)
  objc_msgSend(v3, "setShowsTitle:", v6 <= 0.5615);

}

- (void)_dismiss
{
  void *v3;
  void (**v4)(void);
  id v5;

  -[CAMSemanticStyleSettingsRootController completionBlock](self, "completionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CAMSemanticStyleSettingsRootController completionBlock](self, "completionBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
  -[CAMSemanticStyleSettingsRootController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CAMSemanticStyleSettingsView)_settingsView
{
  return self->__settingsView;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->__settingsView, 0);
}

@end
