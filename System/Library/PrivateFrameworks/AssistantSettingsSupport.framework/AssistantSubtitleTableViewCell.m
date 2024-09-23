@implementation AssistantSubtitleTableViewCell

- (BOOL)canReload
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AssistantSubtitleTableViewCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v9, sel_refreshCellContentsWithSpecifier_, v4);
  -[AssistantSubtitleTableViewCell textLabel](self, "textLabel", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  -[AssistantSubtitleTableViewCell detailTextLabel](self, "detailTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D28]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setText:", v8);
  -[AssistantSubtitleTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

@end
