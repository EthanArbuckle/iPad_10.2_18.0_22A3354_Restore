@implementation AUInternalSettingsWarningTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AUInternalSettingsWarningTableCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v7, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "name", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSTableCell setTitle:](self, "setTitle:", v5);
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("exclamationmark.circle.fill"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell setIcon:](self, "setIcon:", v6);

}

@end
