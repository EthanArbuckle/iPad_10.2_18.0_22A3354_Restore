@implementation NTKRichComplicationCircularBaseTextView

- (NTKRichComplicationCircularBaseTextView)init
{
  return -[NTKRichComplicationCircularBaseTextView initWithFamily:](self, "initWithFamily:", 10);
}

- (NTKRichComplicationCircularBaseTextView)initWithFamily:(int64_t)a3
{
  NTKRichComplicationCircularBaseTextView *v3;
  NTKRichComplicationCircularBaseTextView *v4;
  void *v5;
  uint64_t v6;
  CLKUIColoringView *label;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKRichComplicationCircularBaseTextView;
  v3 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v14, sel_initWithFamily_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_labelScale = 1.0;
    -[NTKRichComplicationCircularBaseTextView _labelFont](v3, "_labelFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKRichComplicationCircularBaseTextView _createLabelViewWithFont:](v4, "_createLabelViewWithFont:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    label = v4->_label;
    v4->_label = (CLKUIColoringView *)v6;

    -[NTKRichComplicationCircularBaseView contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v4->_label);

    -[NTKRichComplicationCircularBaseView framingView](v4, "framingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    -[NTKRichComplicationCircularBaseView contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v12);

  }
  return v4;
}

- (id)label
{
  return self->_label;
}

- (id)_labelFont
{
  id v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;

  -[CDRichComplicationView device](self, "device");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_49);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_49);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  v5 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_49);
  if (v5 != v2)
  {

LABEL_5:
    v8 = objc_storeWeak(&_LayoutConstants___cachedDevice_49, v2);
    _LayoutConstants___previousCLKDeviceVersion_49 = objc_msgSend(v2, "version");

    ___LayoutConstants_block_invoke_47(v9, (uint64_t)v2);
    goto LABEL_6;
  }
  v6 = objc_msgSend(v2, "version");
  v7 = _LayoutConstants___previousCLKDeviceVersion_49;

  if (v6 != v7)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_49);
  v10 = *(double *)&_LayoutConstants___constants_0_8;

  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], v10, *MEMORY[0x1E0DC1448]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CLKFontWithAlternativePunctuation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  id v5;
  double var2;
  char isKindOfClass;
  id var1;
  objc_super v9;
  BOOL v10[8];
  id v11;
  double v12;

  v10[0] = a3->var0;
  v5 = a3->var1;
  var2 = a3->var2;
  v11 = v5;
  v12 = var2;
  v9.receiver = self;
  v9.super_class = (Class)NTKRichComplicationCircularBaseTextView;
  -[CDRichComplicationView _setFontConfiguration:](&v9, sel__setFontConfiguration_, v10);
  if (a3->var1)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    var1 = a3->var1;
    if ((isKindOfClass & 1) != 0)
    {
      -[CDRichComplicationView _updateColoringLabel:withFontDescriptor:andSizeFactor:](self, "_updateColoringLabel:withFontDescriptor:andSizeFactor:", self->_label, var1, a3->var2);
      var1 = a3->var1;
    }
  }
  else
  {
    var1 = 0;
  }

}

- (void)setForegroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationCircularBaseTextView;
  v4 = a3;
  -[CDRichComplicationView setForegroundColor:](&v5, sel_setForegroundColor_, v4);
  -[CLKUIColoringView setColor:](self->_label, "setColor:", v4, v5.receiver, v5.super_class);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationCircularBaseTextView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v3, sel_layoutSubviews);
  -[NTKRichComplicationCircularBaseTextView _layoutLabel](self, "_layoutLabel");
}

- (void)_layoutLabel
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CLKUIColoringView *label;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CLKUIColoringView *v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  _OWORD v28[3];
  CGRect v29;

  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  label = self->_label;
  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v28[0] = *MEMORY[0x1E0C9BAA8];
  v28[1] = v13;
  v28[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[CLKUIColoringView setTransform:](label, "setTransform:", v28);
  -[CLKUIColoringView sizeToFit](self->_label, "sizeToFit");
  -[CLKUIColoringView frame](self->_label, "frame");
  -[NTKRichComplicationCircularBaseTextView _labelFont](self, "_labelFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ascender");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CLKUIColoringView _firstLineBaseline](self->_label, "_firstLineBaseline");
LABEL_5:
    -[NTKRichComplicationCircularBaseTextView _labelFont](self, "_labelFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "capHeight");

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CLKUIColoringView _lastLineBaseline](self->_label, "_lastLineBaseline");
    goto LABEL_5;
  }
LABEL_6:
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  CGRectGetMidY(v29);
  -[CDRichComplicationView device](self, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredXInRectForDevice();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  -[CLKUIColoringView setFrame:](self->_label, "setFrame:", v18, v20, v22, v24);
  CGAffineTransformMakeScale(&v27, self->_labelScale, self->_labelScale);
  v25 = self->_label;
  v26 = v27;
  -[CLKUIColoringView setTransform:](v25, "setTransform:", &v26);
}

- (void)_setLayoutTransformToView:(id)a3 origin:(CGPoint)a4 centerScale:(double)a5
{
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  -[NTKRichComplicationCircularBaseTextView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v22.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v22.c = v14;
  *(_OWORD *)&v22.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v21.a = *(_OWORD *)&v22.a;
  *(_OWORD *)&v21.c = v14;
  *(_OWORD *)&v21.tx = *(_OWORD *)&v22.tx;
  CGAffineTransformTranslate(&v22, &v21, x, y);
  objc_msgSend(v9, "center");
  v16 = v11 * 0.5 - x - v15;
  objc_msgSend(v9, "center");
  v18 = v13 * 0.5 - y - v17;
  v20 = v22;
  CGAffineTransformTranslate(&v21, &v20, v16, v18);
  v22 = v21;
  v20 = v21;
  CGAffineTransformScale(&v21, &v20, a5, a5);
  v22 = v21;
  v20 = v21;
  CGAffineTransformTranslate(&v21, &v20, -v16, -v18);
  v22 = v21;
  v19 = v21;
  objc_msgSend(v9, "setTransform:", &v19);

}

- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4
{
  double v5;

  CLKInterpolateBetweenFloatsClipped();
  self->_labelScale = v5;
  -[NTKRichComplicationCircularBaseTextView _layoutLabel](self, "_layoutLabel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

- (id)_createLabelViewWithFont:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
