@implementation WDAppSourcesViewController

+ (id)tableViewSectionClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (WDAppSourcesViewController)initWithProfile:(id)a3 usingInsetStyling:(BOOL)a4
{
  WDAppSourcesViewController *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WDAppSourcesViewController;
  v4 = -[WDSourcesViewController initWithProfile:usingInsetStyling:](&v8, sel_initWithProfile_usingInsetStyling_, a3, a4);
  WDBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("APPS_LIST_HEADER"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAppSourcesViewController setTitle:](v4, "setTitle:", v6);

  return v4;
}

@end
