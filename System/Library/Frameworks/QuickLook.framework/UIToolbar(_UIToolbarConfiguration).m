@implementation UIToolbar(_UIToolbarConfiguration)

- (void)configureWithConfiguration:()_UIToolbarConfiguration
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(a1, "setTranslucent:", 1);
    objc_msgSend(a1, "setBarStyle:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setTintColor:", v4);

    v5 = (void *)objc_opt_new();
    objc_msgSend(a1, "setBackgroundImage:forToolbarPosition:barMetrics:", v5, 0, 0);

    v6 = objc_opt_new();
  }
  else
  {
    objc_msgSend(a1, "setBarStyle:", objc_msgSend(v11, "barStyle"));
    objc_msgSend(a1, "setTranslucent:", objc_msgSend(v11, "isTranslucent"));
    objc_msgSend(v11, "barTintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setBarTintColor:", v7);

    objc_msgSend(v11, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setBackgroundColor:", v8);

    objc_msgSend(v11, "backgroundImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setBackgroundImage:forToolbarPosition:barMetrics:", v9, 0, 0);

    objc_msgSend(v11, "shadowImage");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v6;
  objc_msgSend(a1, "setShadowImage:forToolbarPosition:", v6, 0);

}

- (id)configuration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setBarStyle:", objc_msgSend(a1, "barStyle"));
  objc_msgSend(v2, "setTranslucent:", objc_msgSend(a1, "isTranslucent"));
  objc_msgSend(a1, "shadowImageForToolbarPosition:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShadowImage:", v3);

  objc_msgSend(a1, "barTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBarTintColor:", v4);

  objc_msgSend(a1, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v5);

  objc_msgSend(a1, "backgroundImageForToolbarPosition:barMetrics:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundImage:", v6);

  return v2;
}

- (void)configureTransparent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "setBarStyle:", 0);
  objc_msgSend(v6, "setTranslucent:", 1);
  v2 = (void *)objc_opt_new();
  objc_msgSend(v6, "setShadowImage:", v2);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBarTintColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

  v5 = (void *)objc_opt_new();
  objc_msgSend(v6, "setBackgroundImage:", v5);

  objc_msgSend(a1, "configureWithConfiguration:", v6);
}

@end
