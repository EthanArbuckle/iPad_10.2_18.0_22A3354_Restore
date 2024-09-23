@implementation WDHealthTableViewController

- (WDHealthTableViewController)initWithStyle:(int64_t)a3 profile:(id)a4
{
  id v6;
  WDHealthTableViewController *v7;
  WDHealthTableViewController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)WDHealthTableViewController;
  v7 = -[WDTableViewController initWithStyle:](&v10, sel_initWithStyle_, a3);
  v8 = v7;
  if (v7)
    -[WDTableViewController setProfile:](v7, "setProfile:", v6);

  return v8;
}

- (WDHealthTableViewController)initWithProfile:(id)a3 usingInsetStyling:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  WDHealthTableViewController *v7;
  WDHealthTableViewController *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDHealthTableViewController;
  v7 = -[HKTableViewController initWithUsingInsetStyling:](&v10, sel_initWithUsingInsetStyling_, v4);
  v8 = v7;
  if (v7)
    -[WDTableViewController setProfile:](v7, "setProfile:", v6);

  return v8;
}

@end
