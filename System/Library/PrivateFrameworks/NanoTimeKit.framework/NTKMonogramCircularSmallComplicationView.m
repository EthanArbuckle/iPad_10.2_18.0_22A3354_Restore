@implementation NTKMonogramCircularSmallComplicationView

- (NTKMonogramCircularSmallComplicationView)initWithFrame:(CGRect)a3
{
  NTKMonogramCircularSmallComplicationView *v3;
  NTKMonogramCircularSmallComplicationView *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CLKUIColoringLabel *label;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKMonogramCircularSmallComplicationView;
  v3 = -[NTKCircularComplicationView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NTKCircularComplicationView device](v3, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NTKColorMonogramComplicationFontForCharacterCount(1, v5, -[NTKCircularComplicationView useRoundedFontDesign](v4, "useRoundedFontDesign"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NTKCircularComplicationView _newLabelSubviewWithFont:](v4, "_newLabelSubviewWithFont:", v6);
    label = v4->_label;
    v4->_label = (CLKUIColoringLabel *)v7;

    -[CLKUIColoringLabel setTextAlignment:](v4->_label, "setTextAlignment:", 1);
    -[NTKCircularComplicationView setWantsPlatter:](v4, "setWantsPlatter:", 0);
  }
  return v4;
}

- (void)setForegroundColor:(id)a3
{
  CLKUIColoringLabel *label;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKMonogramCircularSmallComplicationView;
  -[NTKCircularComplicationView setForegroundColor:](&v6, sel_setForegroundColor_, a3);
  label = self->_label;
  -[NTKCircularComplicationView _computedForegroundColor](self, "_computedForegroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setColor:](label, "setColor:", v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[CLKUIColoringLabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants", 0, 0, 0, 0, 0, 0, 0);
  v8 = 0.0;
  v9 = 0.0;
  if (v5 >= 0.0)
    v8 = v5;
  if (v7 >= 0.0)
    v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  CLKUIColoringLabel *label;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKMonogramCircularSmallComplicationView;
  -[NTKCircularComplicationView layoutSubviews](&v5, sel_layoutSubviews);
  -[NTKMonogramCircularSmallComplicationView bounds](self, "bounds");
  -[CLKUIColoringLabel sizeToFit](self->_label, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_label, "frame");
  label = self->_label;
  -[NTKCircularComplicationView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredIntegralRectForDevice();
  -[CLKUIColoringLabel setFrame:](label, "setFrame:");

}

- (void)setMonogramText:(id)a3
{
  id v4;

  -[CLKUIColoringLabel setText:](self->_label, "setText:", a3);
  -[NTKMonogramCircularSmallComplicationView _updateLabelsForFontChange](self, "_updateLabelsForFontChange");
  -[NTKMonogramCircularSmallComplicationView setNeedsLayout](self, "setNeedsLayout");
  -[NTKCircularComplicationView displayObserver](self, "displayObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "complicationDisplayNeedsResize:", self);

}

- (void)_updateLabelsForFontChange
{
  CLKUIColoringLabel *label;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[CLKUIColoringLabel text](self->_label, "text");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  label = self->_label;
  v4 = objc_msgSend(v7, "length");
  -[NTKCircularComplicationView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NTKColorMonogramComplicationFontForCharacterCount(v4, v5, -[NTKCircularComplicationView useRoundedFontDesign](self, "useRoundedFontDesign"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setFont:](label, "setFont:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
