@implementation NTKRichComplicationBezelBaseTextView

- (NTKRichComplicationBezelBaseTextView)init
{
  NTKRichComplicationBezelBaseTextView *v2;
  NTKRichComplicationBezelBaseTextView *v3;
  void *v4;
  uint64_t v5;
  CLKUIColoringView *label;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKRichComplicationBezelBaseTextView;
  v2 = -[NTKRichComplicationBezelView init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_labelScale = 1.0;
    -[NTKRichComplicationBezelBaseTextView _labelFont](v2, "_labelFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKRichComplicationBezelBaseTextView _createLabelViewWithFont:](v3, "_createLabelViewWithFont:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    label = v3->_label;
    v3->_label = (CLKUIColoringView *)v5;

    -[NTKRichComplicationBezelBaseTextView addSubview:](v3, "addSubview:", v3->_label);
  }
  return v3;
}

- (id)label
{
  return self->_label;
}

- (id)_labelFont
{
  void *v2;
  double v3;
  void *v4;
  void *v5;

  -[CDRichComplicationView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _LayoutConstants_31(v2);

  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], v3, *MEMORY[0x1E0DC1448]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CLKFontWithAlternativePunctuation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setForegroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBezelBaseTextView;
  v4 = a3;
  -[CDRichComplicationView setForegroundColor:](&v5, sel_setForegroundColor_, v4);
  -[CLKUIColoringView setColor:](self->_label, "setColor:", v4, v5.receiver, v5.super_class);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  double v8;
  void *v10;
  char v11;
  void *v12;
  objc_super v13;
  CGRect v14;

  v13.receiver = self;
  v13.super_class = (Class)NTKRichComplicationBezelBaseTextView;
  -[NTKRichComplicationBezelBaseTextView layoutSubviews](&v13, sel_layoutSubviews);
  -[NTKRichComplicationBezelBaseTextView _layoutLabel](self, "_layoutLabel");
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_31(v3);
  v5 = v4;

  -[CLKUIColoringView frame](self->_label, "frame");
  if (v8 < v5)
    v8 = v5;
  v14 = CGRectInset(*(CGRect *)&v6, -3.0, -3.0);
  -[NTKRichComplicationBezelView _updateHitTestShape:frame:](self, "_updateHitTestShape:frame:", 1, v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
  -[NTKRichComplicationBezelView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[NTKRichComplicationBezelView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didUpdateBezelTextForRichComplicationBezelView:", self);

  }
}

- (void)_layoutLabel
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CLKUIColoringView *label;
  __int128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  CLKUIColoringView *v18;
  CLKUIColoringView *v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  _OWORD v23[3];

  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_31(v3);
  v5 = v4;

  -[NTKRichComplicationBezelBaseTextView bounds](self, "bounds");
  v7 = v6;
  label = self->_label;
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v23[0] = *MEMORY[0x1E0C9BAA8];
  v23[1] = v9;
  v23[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[CLKUIColoringView setTransform:](label, "setTransform:", v23);
  -[CLKUIColoringView sizeToFit](self->_label, "sizeToFit");
  -[CLKUIColoringView frame](self->_label, "frame");
  v11 = v10;
  v13 = v12;
  v14 = (v7 - v10) * 0.5;
  -[NTKRichComplicationBezelBaseTextView _labelFont](self, "_labelFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ascender");
  *(float *)&v16 = v5 - v16;
  v17 = ceilf(*(float *)&v16);

  -[CLKUIColoringView setFrame:](self->_label, "setFrame:", 0.0, 0.0, v11, v13);
  -[NTKRichComplicationBezelView _setLayoutTransformToView:origin:rotationInDegree:centerScale:](self, "_setLayoutTransformToView:origin:rotationInDegree:centerScale:", self->_label, v14, v17, self->_labelRotationInDegree, 1.0);
  v18 = self->_label;
  if (v18)
  {
    -[CLKUIColoringView transform](v18, "transform");
    v19 = self->_label;
  }
  else
  {
    v19 = 0;
    memset(&v21, 0, sizeof(v21));
  }
  CGAffineTransformScale(&v22, &v21, self->_labelScale, self->_labelScale);
  v20 = v22;
  -[CLKUIColoringView setTransform:](v19, "setTransform:", &v20);
}

- (void)_setWhistlerAnalogEditingTransitonFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5
{
  void *v7;
  double v8;

  if ((unint64_t)a5 <= 1)
    CLKCompressFraction();
  -[CDRichComplicationView device](self, "device", a4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_31(v7);

  CLKInterpolateBetweenFloatsClipped();
  if (a5 == 1)
    v8 = -v8;
  self->_labelRotationInDegree = v8;
  -[NTKRichComplicationBezelBaseTextView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setEditingTransitionFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5 type:(int64_t)a6
{
  if (!a6)
    -[NTKRichComplicationBezelBaseTextView _setWhistlerAnalogEditingTransitonFraction:direction:position:](self, "_setWhistlerAnalogEditingTransitonFraction:direction:position:", a4, a5, a3);
}

- (void)_editingDidEnd
{
  self->_labelRotationInDegree = 0.0;
}

- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4
{
  double v5;

  CLKInterpolateBetweenFloatsClipped();
  self->_labelScale = v5;
  -[NTKRichComplicationBezelBaseTextView _layoutLabel](self, "_layoutLabel");
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
