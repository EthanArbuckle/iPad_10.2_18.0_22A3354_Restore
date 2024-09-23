@implementation WFBannerPrototypeSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFBannerPrototypeSettings;
  -[WFBannerPrototypeSettings setDefaultValues](&v3, "setDefaultValues");
  -[WFBannerPrototypeSettings setBannerFramesEnabled:](self, "setBannerFramesEnabled:", 0);
  -[WFBannerPrototypeSettings setShadowDebuggingEnabled:](self, "setShadowDebuggingEnabled:", 0);
  -[WFBannerPrototypeSettings setBlurFilterEnabled:](self, "setBlurFilterEnabled:", 1);
  -[WFBannerPrototypeSettings setTestStatusBanners:](self, "setTestStatusBanners:", 0);
}

- (WFBannerTransitionSettings)transitionSettings
{
  return self->_transitionSettings;
}

- (void)setTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_transitionSettings, a3);
}

- (WFBannerGestureSettings)gestureSettings
{
  return self->_gestureSettings;
}

- (void)setGestureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_gestureSettings, a3);
}

- (BOOL)bannerFramesEnabled
{
  return self->_bannerFramesEnabled;
}

- (void)setBannerFramesEnabled:(BOOL)a3
{
  self->_bannerFramesEnabled = a3;
}

- (BOOL)shadowDebuggingEnabled
{
  return self->_shadowDebuggingEnabled;
}

- (void)setShadowDebuggingEnabled:(BOOL)a3
{
  self->_shadowDebuggingEnabled = a3;
}

- (BOOL)blurFilterEnabled
{
  return self->_blurFilterEnabled;
}

- (void)setBlurFilterEnabled:(BOOL)a3
{
  self->_blurFilterEnabled = a3;
}

- (BOOL)testStatusBanners
{
  return self->_testStatusBanners;
}

- (void)setTestStatusBanners:(BOOL)a3
{
  self->_testStatusBanners = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureSettings, 0);
  objc_storeStrong((id *)&self->_transitionSettings, 0);
}

+ (id)sharedSettings
{
  if (qword_10003FEE0 != -1)
    dispatch_once(&qword_10003FEE0, &stru_1000348C0);
  return (id)qword_10003FED8;
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[2];
  void *v25;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PTRestoreDefaultSettingsRowAction actionWithSettingsKeyPath:](PTRestoreDefaultSettingsRowAction, "actionWithSettingsKeyPath:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PTButtonRow rowWithTitle:action:](PTButtonRow, "rowWithTitle:action:", CFSTR("Restore Defaults"), v2));
  v25 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:](PTModule, "sectionWithRows:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PTDrillDownRow rowWithTitle:childSettingsKeyPath:](PTDrillDownRow, "rowWithTitle:childSettingsKeyPath:", CFSTR("Transition"), CFSTR("transitionSettings")));
  v24[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PTDrillDownRow rowWithTitle:childSettingsKeyPath:](PTDrillDownRow, "rowWithTitle:childSettingsKeyPath:", CFSTR("Gesture"), CFSTR("gestureSettings")));
  v24[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v8, 0));

  v10 = objc_alloc((Class)NSMutableArray);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PTSwitchRow rowWithTitle:valueKeyPath:](PTSwitchRow, "rowWithTitle:valueKeyPath:", CFSTR("Show Banner Frames"), CFSTR("bannerFramesEnabled")));
  v23[0] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PTSwitchRow rowWithTitle:valueKeyPath:](PTSwitchRow, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Debugging"), CFSTR("shadowDebuggingEnabled")));
  v23[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PTSwitchRow rowWithTitle:valueKeyPath:](PTSwitchRow, "rowWithTitle:valueKeyPath:", CFSTR("Blur Filter"), CFSTR("blurFilterEnabled")));
  v23[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 3));
  v15 = objc_msgSend(v10, "initWithArray:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[WFDevice currentDevice](WFDevice, "currentDevice"));
  LODWORD(v12) = objc_msgSend(v16, "hasSystemAperture");

  if ((_DWORD)v12)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[PTSwitchRow rowWithTitle:valueKeyPath:](PTSwitchRow, "rowWithTitle:valueKeyPath:", CFSTR("Test Status Banners"), CFSTR("testStatusBanners")));
    objc_msgSend(v15, "addObject:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v15, CFSTR("Debug")));
  v22[0] = v5;
  v22[1] = v9;
  v22[2] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 3));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule moduleWithTitle:contents:](PTModule, "moduleWithTitle:contents:", CFSTR("Custom Banner Transitions"), v19));

  return v20;
}

@end
