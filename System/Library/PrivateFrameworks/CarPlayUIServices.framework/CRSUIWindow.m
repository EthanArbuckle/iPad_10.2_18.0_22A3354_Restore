@implementation CRSUIWindow

- (CRSUIWindow)initWithWindowScene:(id)a3
{
  CRSUIWindow *v3;
  CRSUIWindow *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRSUIWindow;
  v3 = -[CRSUIWindow initWithWindowScene:](&v6, sel_initWithWindowScene_, a3);
  v4 = v3;
  if (v3)
    -[CRSUIWindow commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  UILayoutGuide *v3;
  UILayoutGuide *notificationLayoutGuide;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CRSUIApplicationSceneSettingsDiffInspector *v15;
  CRSUIApplicationSceneSettingsDiffInspector *settingsDiffInspector;
  CRSUIApplicationSceneSettingsDiffInspector *v17;
  uint64_t v18;
  CRSUIApplicationSceneSettingsDiffInspector *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id obj;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  uint8_t buf[4];
  CRSUIWindow *v35;
  __int16 v36;
  void *v37;
  CRSUIWindow *v38;
  _QWORD v39[6];

  v39[4] = *MEMORY[0x24BDAC8D0];
  v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
  notificationLayoutGuide = self->_notificationLayoutGuide;
  self->_notificationLayoutGuide = v3;

  -[CRSUIWindow addLayoutGuide:](self, "addLayoutGuide:", self->_notificationLayoutGuide);
  -[UILayoutGuide heightAnchor](self->_notificationLayoutGuide, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToConstant:", 0.0);
  obj = (id)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_heightConstraint, obj);
  v26 = (void *)MEMORY[0x24BDD1628];
  v39[0] = obj;
  -[CRSUIWindow leftAnchor](self, "leftAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leftAnchor](self->_notificationLayoutGuide, "leftAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v7;
  -[CRSUIWindow bottomAnchor](self, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_notificationLayoutGuide, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v10;
  -[CRSUIWindow rightAnchor](self, "rightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide rightAnchor](self->_notificationLayoutGuide, "rightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "activateConstraints:", v14);

  v15 = objc_alloc_init(CRSUIApplicationSceneSettingsDiffInspector);
  settingsDiffInspector = self->_settingsDiffInspector;
  self->_settingsDiffInspector = v15;

  objc_initWeak(&location, self);
  v17 = self->_settingsDiffInspector;
  v18 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __25__CRSUIWindow_commonInit__block_invoke;
  v31[3] = &unk_24C76A028;
  objc_copyWeak(&v32, &location);
  -[CRSUIApplicationSceneSettingsDiffInspector observeBannerFrameWithBlock:](v17, "observeBannerFrameWithBlock:", v31);
  v19 = self->_settingsDiffInspector;
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = __25__CRSUIWindow_commonInit__block_invoke_2;
  v29[3] = &unk_24C76A028;
  objc_copyWeak(&v30, &location);
  -[CRSUIApplicationSceneSettingsDiffInspector observeMapStyleWithBlock:](v19, "observeMapStyleWithBlock:", v29);
  -[CRSUIWindow windowScene](self, "windowScene");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = self;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_registerSettingsDiffActionArray:forKey:", v21, CFSTR("bannerFrameObserver"));

  -[CRSUIWindow _mapSettings](self, "_mapSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "mapStyle");

  objc_msgSend((id)objc_opt_class(), "_stringForStyle:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CRSUILogForCategory(4uLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v35 = self;
    v36 = 2114;
    v37 = v24;
    _os_log_impl(&dword_20D6CC000, v25, OS_LOG_TYPE_DEFAULT, "Initial map style for: %{public}@ is: %{public}@", buf, 0x16u);
  }

  -[CRSUIWindow _setMapStyle:](self, "_setMapStyle:", v23);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

void __25__CRSUIWindow_commonInit__block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bannerHeight");
  v3 = v2;
  objc_msgSend(WeakRetained, "bannerHeight");
  if (v4 != v3)
  {
    objc_msgSend(WeakRetained, "setBannerHeight:", v3);
    objc_msgSend(WeakRetained, "heightConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setConstant:", v3);

    objc_msgSend(WeakRetained, "notificationLayoutGuideDidChange");
  }

}

void __25__CRSUIWindow_commonInit__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateMapStyleTrait");

}

- (void)_setMapStyle:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  CRSUIWindow *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "_stringForStyle:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CRSUILogForCategory(4uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_20D6CC000, v6, OS_LOG_TYPE_DEFAULT, "Updating map style for %{public}@, to style: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDF6F30], "crsui_traitCollectionWithMapStyle:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRSUIWindow _setLocalOverrideTraitCollection:](self, "_setLocalOverrideTraitCollection:", v7);
  v8 = (void *)objc_opt_class();
  -[CRSUIWindow traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_stringForStyle:", objc_msgSend(v9, "crsui_mapStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CRSUILogForCategory(4uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_20D6CC000, v11, OS_LOG_TYPE_DEFAULT, "Trait collection for %{public}@, is style: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("CRSUIWindowMapStyleChangedNotification"), self);

}

- (void)_updateMapStyleTrait
{
  void *v3;
  uint64_t v4;

  -[CRSUIWindow _mapSettings](self, "_mapSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mapStyle");

  -[CRSUIWindow _setMapStyle:](self, "_setMapStyle:", v4);
}

- (id)_settings
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_opt_class();
  -[CRSUIWindow windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (id)_mapSettings
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  -[CRSUIWindow windowScene](self, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_2549C8B80))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v9;
  id v10;

  v9 = a5;
  -[CRSUIWindow settingsDiffInspector](self, "settingsDiffInspector");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inspectDiff:withContext:", v9, 0);

}

+ (id)_stringForStyle:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("unknown");
  if (a3 == 1)
    v3 = CFSTR("light");
  if (a3 == 2)
    return CFSTR("dark");
  else
    return (id)v3;
}

- (UILayoutGuide)notificationLayoutGuide
{
  return self->_notificationLayoutGuide;
}

- (CRSUIApplicationSceneSettingsDiffInspector)settingsDiffInspector
{
  return self->_settingsDiffInspector;
}

- (void)setSettingsDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_settingsDiffInspector, a3);
}

- (double)bannerHeight
{
  return self->_bannerHeight;
}

- (void)setBannerHeight:(double)a3
{
  self->_bannerHeight = a3;
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_settingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_notificationLayoutGuide, 0);
}

@end
