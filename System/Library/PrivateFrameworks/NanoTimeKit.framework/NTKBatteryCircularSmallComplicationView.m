@implementation NTKBatteryCircularSmallComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "isCompatibleWithFamily:", 4);
  else
    v4 = 0;

  return v4;
}

- (void)_updateForTemplateChange
{
  NTKRing *v3;
  NTKRing *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  -[NTKCircularComplicationView complicationTemplate](self, "complicationTemplate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [NTKRing alloc];
  objc_msgSend(v9, "level");
  v4 = -[NTKRing initWithFillFraction:style:](v3, "initWithFillFraction:style:", 0);
  -[NTKCircularSmallRingComplicationView updateRingWithRingDescription:](self, "updateRingWithRingDescription:", v4);
  if (objc_msgSend(v9, "charging"))
    v5 = 2;
  else
    v5 = 1;
  objc_msgSend(v9, "level");
  *(float *)&v6 = v6;
  +[NTKBatteryUtilities colorForLevel:andState:](NTKBatteryUtilities, "colorForLevel:andState:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCircularSmallRingComplicationView updateRingWithOverrideColor:](self, "updateRingWithOverrideColor:", v7);
  objc_msgSend(v9, "textProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCircularSmallRingTextComplicationView _updateLabelWithTextProvider:](self, "_updateLabelWithTextProvider:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
