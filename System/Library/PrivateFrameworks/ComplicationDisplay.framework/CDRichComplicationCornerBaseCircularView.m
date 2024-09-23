@implementation CDRichComplicationCornerBaseCircularView

- (CDRichComplicationCornerBaseCircularView)initWithFontFallback:(int64_t)a3
{
  CDRichComplicationCornerBaseCircularView *v3;
  CDRichComplicationCornerBaseCircularView *v4;
  uint64_t v5;
  UIView *circularView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CDRichComplicationCornerBaseCircularView;
  v3 = -[CDRichComplicationCornerView initWithFontFallback:](&v8, sel_initWithFontFallback_, a3);
  v4 = v3;
  if (v3)
  {
    -[CDRichComplicationCornerBaseCircularView _circularView](v3, "_circularView");
    v5 = objc_claimAutoreleasedReturnValue();
    circularView = v4->_circularView;
    v4->_circularView = (UIView *)v5;

    -[CDRichComplicationCornerBaseCircularView addSubview:](v4, "addSubview:", v4->_circularView);
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIView *circularView;
  __int128 v18;
  void *v19;
  UIView *v20;
  double v21;
  _OWORD v22[3];
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CDRichComplicationCornerBaseCircularView;
  -[CDRichComplicationCornerBaseCircularView layoutSubviews](&v23, sel_layoutSubviews);
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _LayoutConstants_4(v3);
  v6 = v5;
  v8 = v7;

  -[CDRichComplicationView device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CDRichComplicationCornerBaseCircularViewRect(v9, -[CDRichComplicationCornerView cornerComplicationPosition](self, "cornerComplicationPosition"));
  v12 = v11;
  v14 = v13;
  v16 = v15;

  circularView = self->_circularView;
  v18 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v22[0] = *MEMORY[0x24BDBD8B8];
  v22[1] = v18;
  v22[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[UIView setTransform:](circularView, "setTransform:", v22);
  -[UIView setFrame:](self->_circularView, "setFrame:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v14, v16);
  -[UIView layer](self->_circularView, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCornerRadius:", v4 * 0.5);

  v20 = self->_circularView;
  -[CDRichComplicationCornerView outerComponentRotationInDegree](self, "outerComponentRotationInDegree");
  -[CDRichComplicationCornerView _layoutView:origin:editingTranslation:editingRotationInDegree:](self, "_layoutView:origin:editingTranslation:editingRotationInDegree:", v20, v10, v12, v6, v8, v21);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularView, 0);
}

- (id)_circularView
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
