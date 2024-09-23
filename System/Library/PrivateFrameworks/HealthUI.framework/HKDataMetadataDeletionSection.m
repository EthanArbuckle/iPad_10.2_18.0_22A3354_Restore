@implementation HKDataMetadataDeletionSection

- (HKDataMetadataDeletionSection)init
{
  void *v3;
  void *v4;
  HKDataMetadataDeletionSection *v5;

  HKHealthKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DELETE_SAMPLE"), &stru_1E9C4C428, *MEMORY[0x1E0CB5158]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HKDataMetadataDeletionSection initWithTitle:](self, "initWithTitle:", v4);

  return v5;
}

- (HKDataMetadataDeletionSection)initWithTitle:(id)a3
{
  id v5;
  HKDataMetadataDeletionSection *v6;
  HKDataMetadataDeletionSection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDataMetadataDeletionSection;
  v6 = -[HKDataMetadataDeletionSection init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_title, a3);
    v7->_enabled = 1;
  }

  return v7;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[HKDataMetadataDeletionSection _updateCellForEnabledState](self, "_updateCellForEnabledState");
}

- (void)_updateCellForEnabledState
{
  void *v3;
  void *v4;
  id v5;

  if (-[HKDataMetadataDeletionSection isEnabled](self, "isEnabled"))
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_appErrorColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_appInteractionDisabledColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataDeletionSection cell](self, "cell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (unint64_t)numberOfRowsInSection
{
  return 1;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("HKDataMetadataDeletionSectionCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("HKDataMetadataDeletionSectionCell"));
  objc_msgSend(v5, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  objc_msgSend(v5, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);

  -[HKDataMetadataDeletionSection title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  -[HKDataMetadataDeletionSection setCell:](self, "setCell:", v5);
  -[HKDataMetadataDeletionSection delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilityIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataDeletionSection cell](self, "cell");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityIdentifier:", v13);

  -[HKDataMetadataDeletionSection _updateCellForEnabledState](self, "_updateCellForEnabledState");
  return v5;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  id v6;

  if (-[HKDataMetadataDeletionSection isEnabled](self, "isEnabled", a3, a4, a5))
  {
    -[HKDataMetadataDeletionSection delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deletionSectionDidSelectRow:", self);

  }
}

- (HKDataMetadataDeletionSectionDelegate)delegate
{
  return (HKDataMetadataDeletionSectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UITableViewCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
  objc_storeStrong((id *)&self->_cell, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
