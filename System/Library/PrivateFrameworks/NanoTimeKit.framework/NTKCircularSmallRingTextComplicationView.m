@implementation NTKCircularSmallRingTextComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 4 || *MEMORY[0x1E0C93E90] == a3;
}

- (NTKCircularSmallRingTextComplicationView)initWithFrame:(CGRect)a3
{
  NTKCircularSmallRingTextComplicationView *v3;
  NTKCircularSmallRingTextComplicationView *v4;
  void *v5;
  uint64_t v6;
  CLKUIColoringLabel *label;
  CLKUIColoringLabel *v8;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NTKCircularSmallRingTextComplicationView;
  v3 = -[NTKCircularSmallRingComplicationView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NTKCircularComplicationView _fontForDynamicFontSize:](v3, "_fontForDynamicFontSize:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NTKCircularComplicationView _newLabelSubviewWithFont:](v4, "_newLabelSubviewWithFont:", v5);
    label = v4->_label;
    v4->_label = (CLKUIColoringLabel *)v6;

    v8 = v4->_label;
    -[NTKCircularComplicationView _layoutConstants](v4, "_layoutConstants");
    -[CLKUIColoringLabel setMaxWidth:](v8, "setMaxWidth:", v10);
    -[NTKCircularComplicationView setWantsPlatter:](v4, "setWantsPlatter:", 0);

  }
  return v4;
}

- (void)_updateLabelsForFontChange
{
  CLKUIColoringLabel *label;
  id v3;

  label = self->_label;
  -[NTKCircularComplicationView _fontForDynamicFontSize:](self, "_fontForDynamicFontSize:", 2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setFont:](label, "setFont:", v3);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKCircularSmallRingTextComplicationView;
  -[NTKCircularSmallRingComplicationView layoutSubviews](&v12, sel_layoutSubviews);
  -[NTKCircularSmallRingTextComplicationView bounds](self, "bounds");
  -[CLKUIColoringLabel sizeToFit](self->_label, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_label, "frame");
  -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
  -[NTKCircularComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredIntegralRectForDevice();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CLKUIColoringLabel setFrame:](self->_label, "setFrame:", v5, v7, v9, v11);
}

- (void)updateLabelWithString:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:shortText:", a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKCircularSmallRingTextComplicationView _updateLabelWithTextProvider:](self, "_updateLabelWithTextProvider:", v4);

}

- (void)_updateLabelWithTextProvider:(id)a3
{
  -[CLKUIColoringLabel setTextProvider:](self->_label, "setTextProvider:", a3);
  -[NTKCircularSmallRingTextComplicationView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateForTemplateChange
{
  NTKRing *v3;
  float v4;
  NTKRing *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[NTKCircularComplicationView complicationTemplate](self, "complicationTemplate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [NTKRing alloc];
  objc_msgSend(v9, "fillFraction");
  v5 = -[NTKRing initWithFillFraction:style:](v3, "initWithFillFraction:style:", objc_msgSend(v9, "ringStyle"), v4);
  -[NTKCircularSmallRingComplicationView updateRingWithRingDescription:](self, "updateRingWithRingDescription:", v5);
  objc_msgSend(v9, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v9, "tintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCircularSmallRingComplicationView updateRingWithOverrideColor:](self, "updateRingWithOverrideColor:", v7);

  }
  objc_msgSend(v9, "textProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCircularSmallRingTextComplicationView _updateLabelWithTextProvider:](self, "_updateLabelWithTextProvider:", v8);

}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  void (**v4)(id, CLKUIColoringLabel *);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKCircularSmallRingTextComplicationView;
  v4 = (void (**)(id, CLKUIColoringLabel *))a3;
  -[NTKCircularSmallRingComplicationView _enumerateForegroundColoringViewsWithBlock:](&v5, sel__enumerateForegroundColoringViewsWithBlock_, v4);
  v4[2](v4, self->_label);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
