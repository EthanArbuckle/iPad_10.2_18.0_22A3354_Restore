@implementation NTKModularSmallBatteryTemplateView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v3, "isCompatibleWithFamily:", 0) & 1) != 0)
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "isCompatibleWithFamily:", 7);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return !a3 || a3 == 7;
}

- (NTKModularSmallBatteryTemplateView)initWithFrame:(CGRect)a3
{
  NTKModularSmallBatteryTemplateView *v3;
  NTKModularSmallBatteryTemplateView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKModularSmallBatteryTemplateView;
  v3 = -[NTKModularSmallRingTemplateView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NTKModularSmallRingTemplateView label](v3, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);

  }
  return v4;
}

- (void)_update
{
  void *v3;
  void *v4;
  NTKRing *v5;
  NTKRing *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKModularSmallRingTemplateView label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextProvider:", v4);

  v5 = [NTKRing alloc];
  objc_msgSend(v15, "level");
  v6 = -[NTKRing initWithFillFraction:style:](v5, "initWithFillFraction:style:", 0);
  -[NTKModularSmallRingTemplateView _updateRingWithRingDescription:](self, "_updateRingWithRingDescription:", v6);
  -[NTKModularSmallBatteryTemplateView forcedRingColor](self, "forcedRingColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKModularSmallBatteryTemplateView preferredRingColor](self, "preferredRingColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKModuleView colorScheme](self, "colorScheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKModularSmallRingTemplateView stateRing](self, "stateRing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    v12 = v7;
  }
  else
  {
    if (!objc_msgSend(v9, "containsOverrideFaceColor") || !v8)
    {
      objc_msgSend(v9, "foregroundColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setColor:", v13);

      goto LABEL_8;
    }
    v10 = v11;
    v12 = v8;
  }
  objc_msgSend(v10, "setColor:", v12);
LABEL_8:
  -[NTKModuleView contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsLayout");

}

- (void)_refreshRingImage
{
  NTKRing *v3;
  NTKRing *v4;
  id v5;

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [NTKRing alloc];
  objc_msgSend(v5, "level");
  v4 = -[NTKRing initWithFillFraction:style:](v3, "initWithFillFraction:style:", 0);
  -[NTKModularSmallRingTemplateView _refreshRingImageWithRing:](self, "_refreshRingImageWithRing:", v4);

}

- (void)applyColorScheme:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKModularSmallBatteryTemplateView;
  -[NTKModuleView applyColorScheme:](&v9, sel_applyColorScheme_, v4);
  -[NTKModularSmallRingTemplateView stateRing](self, "stateRing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKModularSmallBatteryTemplateView forcedRingColor](self, "forcedRingColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKModularSmallBatteryTemplateView preferredRingColor](self, "preferredRingColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v6 || objc_msgSend(v4, "containsOverrideFaceColor") && (v8 = v7) != 0)
    objc_msgSend(v5, "setColor:", v8);

}

- (id)forcedRingColor
{
  void *v2;
  uint64_t v3;
  double v4;
  void *v5;

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "charging"))
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(v2, "level");
  *(float *)&v4 = v4;
  +[NTKBatteryUtilities colorForLevel:andState:](NTKBatteryUtilities, "colorForLevel:andState:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)preferredRingColor
{
  void *v2;
  double v3;
  void *v4;

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "level");
  *(float *)&v3 = v3;
  +[NTKBatteryUtilities modularRingColorForLevel:](NTKBatteryUtilities, "modularRingColorForLevel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
