@implementation CDPSingleICSCEntryPane

- (void)setTitle:(id)a3
{
  CDPPaneHeaderView *headerView;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  headerView = self->super.super._headerView;
  v5 = a3;
  -[CDPPaneHeaderView detailTextLabel](headerView, "detailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  CDPLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPPaneHeaderView textLabel](self->super.super._headerView, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[CDPPaneHeaderView makeAllTheTextFits](self->super.super._headerView, "makeAllTheTextFits");
  -[CDPPaneHeaderView sizeToFit](self->super.super._headerView, "sizeToFit");
}

@end
