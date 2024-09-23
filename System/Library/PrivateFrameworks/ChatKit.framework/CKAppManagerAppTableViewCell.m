@implementation CKAppManagerAppTableViewCell

+ (id)reuseIdentifier
{
  return CFSTR("AppCell");
}

- (CKAppManagerAppTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKAppManagerAppTableViewCell *v4;
  CKAppManagerAppTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKAppManagerAppTableViewCell;
  v4 = -[CKAppManagerAppTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[CKAppManagerAppTableViewCell configureCellFromInitializer](v4, "configureCellFromInitializer");
  return v5;
}

- (CKAppManagerAppTableViewCell)initWithCoder:(id)a3
{
  CKAppManagerAppTableViewCell *v3;
  CKAppManagerAppTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKAppManagerAppTableViewCell;
  v3 = -[CKAppManagerAppTableViewCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[CKAppManagerAppTableViewCell configureCellFromInitializer](v3, "configureCellFromInitializer");
  return v4;
}

- (void)configureCellFromInitializer
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA478], "tableCellGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppManagerAppTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[CKAppManagerAppTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKAppManagerAppTableViewCell;
  -[CKAppManagerAppTableViewCell layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[CKAppManagerAppTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKAppManagerAppTableViewCell;
  -[CKAppManagerAppTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKAppManagerAppTableViewCell setToggleVisible:editable:isOn:](self, "setToggleVisible:editable:isOn:", 0, 1, 0);
  -[CKAppManagerAppTableViewCell setShowsReorderControl:](self, "setShowsReorderControl:", 0);
}

- (void)setToggleVisible:(BOOL)a3 editable:(BOOL)a4 isOn:(BOOL)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v8;
  void *v9;

  if (a3)
  {
    v6 = a5;
    v7 = a4;
    -[CKAppManagerAppTableViewCell appToggle](self, "appToggle");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CEAA38]);
      objc_msgSend(v8, "addTarget:action:forEvents:", self, sel_appToggleTapped_, 4096);
      -[CKAppManagerAppTableViewCell setAppToggle:](self, "setAppToggle:", v8);
    }
    objc_msgSend(v8, "setOn:", v6);
    objc_msgSend(v8, "setEnabled:", v7);
    -[CKAppManagerAppTableViewCell accessoryView](self, "accessoryView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      -[CKAppManagerAppTableViewCell setAccessoryView:](self, "setAccessoryView:", v8);

  }
  else
  {
    -[CKAppManagerAppTableViewCell setAccessoryView:](self, "setAccessoryView:", 0, a4, a5);
  }
  -[CKAppManagerAppTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
}

- (void)appToggleTapped:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[CKAppManagerAppTableViewCell delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isOn");

  objc_msgSend(v6, "appCell:wasToggledOn:", self, v5);
}

- (void)updateCellWithPluginInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppManagerAppTableViewCell setCurrentPluginIdentifierForIconLoading:](self, "setCurrentPluginIdentifierForIconLoading:", v5);

  v6 = (void *)MEMORY[0x1E0D35760];
  -[CKAppManagerAppTableViewCell traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__ck_placeholderImageForInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "browserDisplayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppManagerAppTableViewCell _updateConfigurationWithImage:text:](self, "_updateConfigurationWithImage:text:", v8, v9);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    location = 0;
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__CKAppManagerAppTableViewCell_updateCellWithPluginInfo___block_invoke;
    v12[3] = &unk_1E274B4A8;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    objc_msgSend(v13, "__ck_generateStatusImage:", v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v4, "__ck_badgeImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "browserDisplayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAppManagerAppTableViewCell _updateConfigurationWithImage:text:](self, "_updateConfigurationWithImage:text:", v10, v11);

  }
}

void __57__CKAppManagerAppTableViewCell_updateCellWithPluginInfo___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "currentPluginIdentifierForIconLoading");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "browserDisplayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_updateConfigurationWithImage:text:", v9, v8);

    }
  }

}

- (void)_updateConfigurationWithImage:(id)a3 text:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[CKAppManagerAppTableViewCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:", v7);

  objc_msgSend(v14, "setText:", v6);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iMessageAppIconSize");
  v10 = v9;
  v12 = v11;

  objc_msgSend(v14, "imageProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMaximumSize:", v10, v12);

  -[CKAppManagerAppTableViewCell setContentConfiguration:](self, "setContentConfiguration:", v14);
}

- (CKAppManagerAppTableViewCellDelegate)delegate
{
  return (CKAppManagerAppTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISwitch)appToggle
{
  return self->_appToggle;
}

- (void)setAppToggle:(id)a3
{
  objc_storeStrong((id *)&self->_appToggle, a3);
}

- (NSString)currentPluginIdentifierForIconLoading
{
  return self->_currentPluginIdentifierForIconLoading;
}

- (void)setCurrentPluginIdentifierForIconLoading:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPluginIdentifierForIconLoading, 0);
  objc_storeStrong((id *)&self->_appToggle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
