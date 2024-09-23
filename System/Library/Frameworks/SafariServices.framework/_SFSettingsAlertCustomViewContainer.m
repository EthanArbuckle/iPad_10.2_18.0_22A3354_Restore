@implementation _SFSettingsAlertCustomViewContainer

- (_SFSettingsAlertCustomViewContainer)initWithContentView:(id)a3
{
  id v4;
  _SFSettingsAlertCustomViewContainer *v5;
  _SFSettingsAlertItemBackgroundView *v6;
  uint64_t v7;
  _SFSettingsAlertItemBackgroundView *backgroundView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _SFSettingsAlertCustomViewContainer *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bounds");
  v25.receiver = self;
  v25.super_class = (Class)_SFSettingsAlertCustomViewContainer;
  v5 = -[_SFSettingsAlertCustomViewContainer initWithFrame:](&v25, sel_initWithFrame_);
  if (v5)
  {
    v6 = [_SFSettingsAlertItemBackgroundView alloc];
    -[_SFSettingsAlertCustomViewContainer bounds](v5, "bounds");
    v7 = -[_SFSettingsAlertItemBackgroundView initWithFrame:](v6, "initWithFrame:");
    backgroundView = v5->_backgroundView;
    v5->_backgroundView = (_SFSettingsAlertItemBackgroundView *)v7;

    -[_SFSettingsAlertItemBackgroundView setAutoresizingMask:](v5->_backgroundView, "setAutoresizingMask:", 18);
    -[_SFSettingsAlertCustomViewContainer addSubview:](v5, "addSubview:", v5->_backgroundView);
    -[_SFSettingsAlertCustomViewContainer addSubview:](v5, "addSubview:", v4);
    v19 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v4, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSettingsAlertCustomViewContainer topAnchor](v5, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    objc_msgSend(v4, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSettingsAlertCustomViewContainer leadingAnchor](v5, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v9;
    objc_msgSend(v4, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSettingsAlertCustomViewContainer bottomAnchor](v5, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v12;
    objc_msgSend(v4, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSettingsAlertCustomViewContainer trailingAnchor](v5, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v16);

    v17 = v5;
  }

  return v5;
}

- (void)setHidesSeparator:(BOOL)a3
{
  int64_t defaultBackgroundMode;

  if (self->_hidesSeparator != a3)
  {
    self->_hidesSeparator = a3;
    if (a3)
      defaultBackgroundMode = 0;
    else
      defaultBackgroundMode = self->_defaultBackgroundMode;
    -[_SFSettingsAlertItemBackgroundView setMode:](self->_backgroundView, "setMode:", defaultBackgroundMode);
  }
}

- (void)setDefaultBackgroundMode:(int64_t)a3
{
  if (self->_defaultBackgroundMode != a3)
  {
    self->_defaultBackgroundMode = a3;
    if (self->_hidesSeparator)
      a3 = 0;
    -[_SFSettingsAlertItemBackgroundView setMode:](self->_backgroundView, "setMode:", a3);
  }
}

- (int64_t)backgroundMode
{
  return -[_SFSettingsAlertItemBackgroundView mode](self->_backgroundView, "mode");
}

- (NSString)text
{
  return self->text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSAttributedString)attributedText
{
  return self->attributedText;
}

- (void)setAttributedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSString)detailText
{
  return self->detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSAttributedString)attributedDetailText
{
  return self->attributedDetailText;
}

- (void)setAttributedDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (UIImage)image
{
  return self->image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->image, a3);
}

- (BOOL)isSelected
{
  return self->selected;
}

- (void)setSelected:(BOOL)a3
{
  self->selected = a3;
}

- (BOOL)isEnabled
{
  return self->enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->enabled = a3;
}

- (SFSettingsAlertItemViewDelegate)delegate
{
  return (SFSettingsAlertItemViewDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (_SFSettingsAlertItem)item
{
  return (_SFSettingsAlertItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
}

- (BOOL)hidesSeparator
{
  return self->_hidesSeparator;
}

- (int64_t)defaultBackgroundMode
{
  return self->_defaultBackgroundMode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->image, 0);
  objc_storeStrong((id *)&self->attributedDetailText, 0);
  objc_storeStrong((id *)&self->detailText, 0);
  objc_storeStrong((id *)&self->attributedText, 0);
  objc_storeStrong((id *)&self->text, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
