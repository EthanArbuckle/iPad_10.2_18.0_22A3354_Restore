@implementation HUUtilityOnboardingConnectionTableViewController

- (HUUtilityOnboardingConnectionTableViewController)initWithData:(id)a3 withItemManager:(id)a4 tableViewStyle:(int64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUUtilityOnboardingConnectionTableViewController;
  return -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v6, sel_initWithItemManager_tableViewStyle_, a4, a5);
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUUtilityOnboardingConnectionTableViewController;
  v9 = a4;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v14, sel_setupCell_forItem_indexPath_, v8, v9, a5);
  v10 = v8;
  objc_msgSend(v9, "latestResults", v14.receiver, v14.super_class);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValueText:", v12);

  objc_msgSend(v10, "setHideIcon:", 1);
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.Utility.SubscriptionInfoCell"));
  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemFillColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v13);

}

@end
