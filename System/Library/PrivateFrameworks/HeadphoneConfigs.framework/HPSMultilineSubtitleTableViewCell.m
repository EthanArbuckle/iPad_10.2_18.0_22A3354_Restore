@implementation HPSMultilineSubtitleTableViewCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[HPSMultilineSubtitleTableViewCell detailTextLabel](self, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 0);

  v6.receiver = self;
  v6.super_class = (Class)HPSMultilineSubtitleTableViewCell;
  -[PSSubtitleSwitchTableCell refreshCellContentsWithSpecifier:](&v6, sel_refreshCellContentsWithSpecifier_, v4);

}

@end
