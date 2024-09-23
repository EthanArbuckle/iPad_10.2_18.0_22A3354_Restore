@implementation HUNetworkConfigurationSettingsMismatchViewController

- (HUNetworkConfigurationSettingsMismatchViewController)initWithProfiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HUNetworkConfigurationMismatchViewController *v7;
  HUNetworkConfigurationSettingsMismatchViewController *v8;
  objc_super v10;

  v4 = a3;
  _HULocalizedStringWithDefaultValue(CFSTR("HUNetworkConfigurationSettingsMismatchTitle"), CFSTR("HUNetworkConfigurationSettingsMismatchTitle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUNetworkConfigurationSettingsMismatchDescription"), CFSTR("HUNetworkConfigurationSettingsMismatchDescription"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUNetworkConfigurationMismatchViewController initWithProfiles:]([HUNetworkConfigurationMismatchViewController alloc], "initWithProfiles:", v4);

  v10.receiver = self;
  v10.super_class = (Class)HUNetworkConfigurationSettingsMismatchViewController;
  v8 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:itemTableViewController:](&v10, sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_, v5, v6, 0, 2, v7);

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)HUNetworkConfigurationSettingsMismatchViewController;
  -[HUItemTableOBWelcomeController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__donePressed_);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", 1);

  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItems:", v5);

}

- (void)_donePressed:(id)a3
{
  -[HUNetworkConfigurationSettingsMismatchViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
