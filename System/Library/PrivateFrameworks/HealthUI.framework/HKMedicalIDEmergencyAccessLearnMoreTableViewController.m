@implementation HKMedicalIDEmergencyAccessLearnMoreTableViewController

- (HKMedicalIDEmergencyAccessLearnMoreTableViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEmergencyAccessLearnMoreTableViewController;
  return -[HKMedicalIDEmergencyAccessLearnMoreTableViewController initWithStyle:](&v3, sel_initWithStyle_, 2);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKMedicalIDEmergencyAccessLearnMoreTableViewController;
  -[HKMedicalIDEmergencyAccessLearnMoreTableViewController viewDidLoad](&v10, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("emergency_access_learn_more_navigation_title"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEmergencyAccessLearnMoreTableViewController setTitle:](self, "setTitle:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEmergencyAccessLearnMoreTableViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_didTapDone_);
  -[HKMedicalIDEmergencyAccessLearnMoreTableViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  -[HKMedicalIDEmergencyAccessLearnMoreTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("LearnMoreCell"));

}

- (void)didTapDone:(id)a3
{
  -[HKMedicalIDEmergencyAccessLearnMoreTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 90.0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  LearnMoreItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LearnMoreItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(LearnMoreItem);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("emergency_access_learn_more_share_title"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LearnMoreItem setTitle:](v7, "setTitle:", v9);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("emergency_access_learn_more_share_body"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LearnMoreItem setBody:](v7, "setBody:", v11);

  v12 = objc_alloc_init(LearnMoreItem);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("emergency_access_learn_more_privacy_title"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LearnMoreItem setTitle:](v12, "setTitle:", v14);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("emergency_access_learn_more_privacy_body"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LearnMoreItem setBody:](v12, "setBody:", v16);

  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("LearnMoreCell"), v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v7;
  v20[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setItems:", v18);

  return v17;
}

@end
