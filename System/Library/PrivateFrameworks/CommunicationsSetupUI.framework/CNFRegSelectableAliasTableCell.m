@implementation CNFRegSelectableAliasTableCell

- (CNFRegSelectableAliasTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  CNFRegSelectableAliasTableCell *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNFRegSelectableAliasTableCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v11, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  if (v5)
  {
    +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend(v6, "tableCellCheckmarkImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithImage:", v8);

    -[CNFRegSelectableAliasTableCell setAccessoryView:](v5, "setAccessoryView:", v9);
  }
  return v5;
}

- (BOOL)usesStandardBackgroundImage
{
  return 1;
}

- (void)setChecked:(BOOL)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNFRegSelectableAliasTableCell;
  -[PSTableCell setChecked:](&v13, sel_setChecked_, a3);
  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PSTableCell isChecked](self, "isChecked");
  -[CNFRegSelectableAliasTableCell accessoryView](self, "accessoryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "setHidden:", 0);

    if (-[CNFRegSelectableAliasTableCell isEnabled](self, "isEnabled"))
      objc_msgSend(v4, "tableCellCheckmarkImage");
    else
      objc_msgSend(v4, "tableCellCheckmarkImageDisabled");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSelectableAliasTableCell accessoryView](self, "accessoryView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v7);

  }
  else
  {
    objc_msgSend(v6, "setHidden:", 1);
  }

  if (objc_msgSend(v4, "styleUsesCustomTableStyle")
    && (objc_msgSend(v4, "tableCellTextLabelColor"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    objc_msgSend(v4, "tableCellTextLabelColor");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  -[CNFRegSelectableAliasTableCell textLabel](self, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v11);

}

@end
