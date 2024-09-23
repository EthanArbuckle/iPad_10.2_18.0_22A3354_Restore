@implementation NTKUtilitySmallRingTextComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NTKUtilitySmallRingTextComplicationView)initWithFrame:(CGRect)a3
{
  NTKUtilitySmallRingTextComplicationView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  CLKUIColoringLabel *label;
  CLKUIColoringLabel *v8;
  void *v9;
  CLKUIColoringLabel *v10;
  void *v11;
  void *v12;
  _BYTE v14[80];
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NTKUtilitySmallRingTextComplicationView;
  v3 = -[NTKUtilitySmallRingComplicationView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", 8.5, *MEMORY[0x1E0DC1438]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUtilityComplicationView setFont:](v3, "setFont:", v4);

    -[NTKUtilityComplicationView font](v3, "font");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NTKUtilityComplicationView _newLabelSubviewWithFont:variant:](v3, "_newLabelSubviewWithFont:variant:", v5, 0);
    label = v3->_label;
    v3->_label = (CLKUIColoringLabel *)v6;

    v8 = v3->_label;
    -[NTKUtilityComplicationView device](v3, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v9, v14);
    -[CLKUIColoringLabel setMaxWidth:](v8, "setMaxWidth:", v15);

    v10 = v3->_label;
    -[NTKUtilityComplicationView timeTravelDate](v3, "timeTravelDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setInTimeTravel:](v10, "setInTimeTravel:", v11 != 0);

    -[NTKUtilityCircularComplicationView contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v3->_label);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BYTE v8[80];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKUtilitySmallRingTextComplicationView;
  -[NTKUtilitySmallRingComplicationView layoutSubviews](&v9, sel_layoutSubviews);
  -[NTKUtilityCircularComplicationView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v7 = v4;

  -[CLKUIColoringLabel sizeToFit](self->_label, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_label, "frame");
  -[NTKUtilityComplicationView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_49(v5, v8);

  -[NTKUtilityComplicationView device](self, "device", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredIntegralRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_label, "setFrame:");

}

- (void)_updateForTemplateChange
{
  void *v3;
  CLKUIColoringLabel *label;
  void *v5;
  NTKRing *v6;
  float v7;
  NTKRing *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKUtilitySmallRingTextComplicationView;
  -[NTKUtilityComplicationView _updateForTemplateChange](&v9, sel__updateForTemplateChange);
  -[NTKUtilityComplicationView complicationTemplate](self, "complicationTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  label = self->_label;
  objc_msgSend(v3, "textProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](label, "setTextProvider:", v5);

  v6 = [NTKRing alloc];
  objc_msgSend(v3, "fillFraction");
  v8 = -[NTKRing initWithFillFraction:style:](v6, "initWithFillFraction:style:", objc_msgSend(v3, "ringStyle"), v7);
  -[NTKUtilitySmallRingComplicationView updateRingWithRingDescription:](self, "updateRingWithRingDescription:", v8);

}

- (void)_setLabelText:(id)a3
{
  id v4;

  -[CLKUIColoringLabel setText:](self->_label, "setText:", a3);
  -[NTKUtilitySmallRingTextComplicationView setNeedsLayout](self, "setNeedsLayout");
  -[NTKUtilityComplicationView displayObserver](self, "displayObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "complicationDisplayNeedsResize:", self);

}

- (void)_enumerateColoringViewsWithBlock:(id)a3
{
  void (**v4)(id, CLKUIColoringLabel *);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKUtilitySmallRingTextComplicationView;
  v4 = (void (**)(id, CLKUIColoringLabel *))a3;
  -[NTKUtilitySmallRingComplicationView _enumerateColoringViewsWithBlock:](&v5, sel__enumerateColoringViewsWithBlock_, v4);
  v4[2](v4, self->_label);

}

- (CLKUIColoringLabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
