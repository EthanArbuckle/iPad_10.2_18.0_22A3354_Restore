@implementation AUInternalSettingsInProgressTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AUInternalSettingsInProgressTableCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v9, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "name", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell setTitle:](self, "setTitle:", v5);

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("arrow.clockwise.circle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell setIcon:](self, "setIcon:", v6);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AUSettingsProgressActiveUpdate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSTableCell iconImageView](self, "iconImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", objc_msgSend(v7, "BOOLValue") ^ 1);

}

@end
