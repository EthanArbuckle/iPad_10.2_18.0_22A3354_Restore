@implementation NTKUtilityBatteryComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "isCompatibleWithFamily:", 2);
  else
    v4 = 0;

  return v4;
}

- (void)_updateForTemplateChange
{
  void *v3;
  void *v4;
  NTKRing *v5;
  NTKRing *v6;
  void *v7;
  void *v8;
  id v9;

  -[NTKUtilityComplicationView complicationTemplate](self, "complicationTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUtilityComplicationView setOverrideColor:](self, "setOverrideColor:", v4);

  -[NTKUtilityComplicationView complicationTemplate](self, "complicationTemplate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [NTKRing alloc];
  objc_msgSend(v9, "level");
  v6 = -[NTKRing initWithFillFraction:style:](v5, "initWithFillFraction:style:", 0);
  -[NTKUtilitySmallRingComplicationView updateRingWithRingDescription:](self, "updateRingWithRingDescription:", v6);
  -[NTKUtilitySmallRingTextComplicationView label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextProvider:", v8);

}

- (void)updateRingWithRingDescription:(id)a3 backgroundRingAlpha:(double)a4
{
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKUtilityBatteryComplicationView;
  -[NTKUtilitySmallRingComplicationView updateRingWithRingDescription:backgroundRingAlpha:](&v12, sel_updateRingWithRingDescription_backgroundRingAlpha_, a3, a4);
  -[NTKUtilityComplicationView complicationTemplate](self, "complicationTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "charging"))
    v6 = 2;
  else
    v6 = 1;
  objc_msgSend(v5, "level");
  *(float *)&v7 = v7;
  +[NTKBatteryUtilities colorForLevel:andState:](NTKBatteryUtilities, "colorForLevel:andState:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUtilitySmallRingComplicationView fillFractionRing](self, "fillFractionRing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "setColor:", v8);
  }
  else
  {
    -[NTKUtilityComplicationView _computedForegroundColor](self, "_computedForegroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColor:", v11);

  }
}

@end
