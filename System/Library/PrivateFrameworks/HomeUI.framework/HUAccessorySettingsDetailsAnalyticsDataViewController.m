@implementation HUAccessorySettingsDetailsAnalyticsDataViewController

- (HUAccessorySettingsDetailsAnalyticsDataViewController)initWithAccessoryGroupItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUAccessorySettingsDetailsAnalyticsDataViewController;
  return -[HUAccessorySettingsDetailsAnalyticsDataViewController init](&v4, sel_init, a3);
}

- (id)hu_preloadContent
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  float v15;
  double v16;
  void *v17;
  double v18;
  float v19;
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUAccessorySettingsDetailsAnalyticsDataViewController;
  -[HUAccessorySettingsDetailsAnalyticsDataViewController viewDidLoad](&v21, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessorySettingsDetailsAnalyticsDataViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setText:", CFSTR("👷UNDER CONSTRUCTION👷\nENGINEERING UI"));
  objc_msgSend(v5, "setNumberOfLines:", 2);
  objc_msgSend(v5, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v7);

  objc_msgSend(v5, "sizeToFit");
  -[HUAccessorySettingsDetailsAnalyticsDataViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v5);

  objc_msgSend(v5, "frame");
  v10 = v9;
  v12 = v11;
  -[HUAccessorySettingsDetailsAnalyticsDataViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14 * 0.5 - v10 * 0.5;
  v16 = ceilf(v15);

  -[HUAccessorySettingsDetailsAnalyticsDataViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v18 * 0.5 - v12 * 0.5;
  v20 = ceilf(v19);

  objc_msgSend(v5, "setFrame:", v16, v20, v10, v12);
}

@end
