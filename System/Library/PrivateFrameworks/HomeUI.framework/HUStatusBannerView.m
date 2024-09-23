@implementation HUStatusBannerView

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HUBannerView iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVibrancyEffect:", 0);

  -[HUBannerView iconView](self, "iconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", 0);

  v5.receiver = self;
  v5.super_class = (Class)HUStatusBannerView;
  -[HUBannerView prepareForReuse](&v5, sel_prepareForReuse);
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v3 = a3;
  -[HUBannerView item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CF8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUBannerView iconView](self, "iconView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTintColor:", v10);

      v12 = (void *)MEMORY[0x1E0CEA480];
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "colorEffectMonochromeTint:blendingAmount:brightnessAdjustment:", v13, 1.0, 0.45);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUBannerView iconView](self, "iconView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setVibrancyEffect:", v14);

    }
  }
  v16.receiver = self;
  v16.super_class = (Class)HUStatusBannerView;
  -[HUBannerView updateUIWithAnimation:](&v16, sel_updateUIWithAnimation_, v3);

}

@end
