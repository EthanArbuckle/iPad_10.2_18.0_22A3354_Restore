@implementation CDRichComplicationCornerGaugeCustomView

- (CDRichComplicationCornerGaugeCustomView)initWithFontFallback:(int64_t)a3
{
  CDRichComplicationCornerGaugeCustomView *v3;
  CDRichComplicationCornerGaugeCustomView *v4;
  uint64_t v5;
  UIView *outerView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CDRichComplicationCornerGaugeCustomView;
  v3 = -[CDRichComplicationCornerBaseGaugeView initWithFontFallback:](&v8, sel_initWithFontFallback_, a3);
  v4 = v3;
  if (v3)
  {
    -[CDRichComplicationCornerGaugeCustomView _outerView](v3, "_outerView");
    v5 = objc_claimAutoreleasedReturnValue();
    outerView = v4->_outerView;
    v4->_outerView = (UIView *)v5;

    -[CDRichComplicationCornerGaugeCustomView addSubview:](v4, "addSubview:", v4->_outerView);
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
  double v9;
  double v10;
  double v11;
  id v12;
  id WeakRetained;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  double v20;
  double v21;
  UIView *outerView;
  __int128 v23;
  UIView *v24;
  double v25;
  _OWORD v26[3];
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CDRichComplicationCornerGaugeCustomView;
  -[CDRichComplicationCornerBaseGaugeView layoutSubviews](&v27, sel_layoutSubviews);
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDRichComplicationCornerUtilities cornerGaugeCustomViewRectWithPosition:forDevice:](CDRichComplicationCornerUtilities, "cornerGaugeCustomViewRectWithPosition:forDevice:", -[CDRichComplicationCornerView cornerComplicationPosition](self, "cornerComplicationPosition"), v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CDRichComplicationView device](self, "device");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_1);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_1);
  if (!WeakRetained)
    goto LABEL_5;
  v14 = WeakRetained;
  v15 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_1);
  if (v15 != v12)
  {

LABEL_5:
    v18 = objc_storeWeak(&_LayoutConstants___cachedDevice_1, v12);
    _LayoutConstants___previousCLKDeviceVersion_1 = objc_msgSend(v12, "version");

    ___LayoutConstants_block_invoke_1(v19, (uint64_t)v12);
    goto LABEL_6;
  }
  v16 = objc_msgSend(v12, "version");
  v17 = _LayoutConstants___previousCLKDeviceVersion_1;

  if (v16 != v17)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_1);
  v20 = *(double *)&_LayoutConstants___constants_0_0;
  v21 = *(double *)&_LayoutConstants___constants_1_0;

  outerView = self->_outerView;
  v23 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v26[0] = *MEMORY[0x24BDBD8B8];
  v26[1] = v23;
  v26[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[UIView setTransform:](outerView, "setTransform:", v26);
  -[UIView setFrame:](self->_outerView, "setFrame:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v9, v11);
  v24 = self->_outerView;
  -[CDRichComplicationCornerView outerComponentRotationInDegree](self, "outerComponentRotationInDegree");
  -[CDRichComplicationCornerView _layoutView:origin:editingTranslation:editingRotationInDegree:](self, "_layoutView:origin:editingTranslation:editingRotationInDegree:", v24, v5, v7, v20, v21, v25);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerView, 0);
}

- (id)_outerView
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
