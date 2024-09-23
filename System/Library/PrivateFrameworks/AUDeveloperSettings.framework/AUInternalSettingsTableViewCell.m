@implementation AUInternalSettingsTableViewCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AUInternalSettingsTableViewCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v7, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D50], v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSTableCell setTitle:](self, "setTitle:", v5);
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("checkmark"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell setIcon:](self, "setIcon:", v6);

  -[AUInternalSettingsTableViewCell setAccessoryType:](self, "setAccessoryType:", 4);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v5;

  v4 = a3;
  -[PSTableCell iconImageView](self, "iconImageView", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", !v4);

}

@end
