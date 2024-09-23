@implementation CDRichComplicationCornerGaugeTextView

- (CDRichComplicationCornerGaugeTextView)initWithFontFallback:(int64_t)a3
{
  CDRichComplicationCornerGaugeTextView *v3;
  CDRichComplicationCornerGaugeTextView *v4;
  void *v5;
  uint64_t v6;
  CLKUICurvedColoringLabel *outerLabel;
  void *v8;
  uint64_t v10;
  double v11[11];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CDRichComplicationCornerGaugeTextView;
  v3 = -[CDRichComplicationCornerBaseGaugeView initWithFontFallback:](&v12, sel_initWithFontFallback_, a3);
  v4 = v3;
  if (v3)
  {
    -[CDRichComplicationView device](v3, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants(v5, (uint64_t)v11);
    -[CDRichComplicationCornerView _createAndAddColoringLabelWithFontSize:](v4, "_createAndAddColoringLabelWithFontSize:", v11[0]);
    v6 = objc_claimAutoreleasedReturnValue();
    outerLabel = v4->_outerLabel;
    v4->_outerLabel = (CLKUICurvedColoringLabel *)v6;

    -[CDRichComplicationView device](v4, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants(v8, (uint64_t)&v10);
    CLKDegreesToRadians();
    -[CLKUICurvedColoringLabel setMaxAngularWidth:](v4->_outerLabel, "setMaxAngularWidth:");

    -[CLKUICurvedColoringLabel setUsesTextProviderTintColoring:](v4->_outerLabel, "setUsesTextProviderTintColoring:", 0);
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CLKUICurvedColoringLabel *outerLabel;
  double v6;
  double v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CDRichComplicationCornerGaugeTextView;
  -[CDRichComplicationCornerBaseGaugeView layoutSubviews](&v14, sel_layoutSubviews);
  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CDRichComplicationView device](self, "device", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants(v3, (uint64_t)&v8);

  switch(-[CDRichComplicationCornerView cornerComplicationPosition](self, "cornerComplicationPosition"))
  {
    case 0:
    case 1:
      -[CLKUICurvedColoringLabel setCircleRadius:](self->_outerLabel, "setCircleRadius:", *(double *)&v9);
      -[CLKUICurvedColoringLabel setInterior:](self->_outerLabel, "setInterior:", 0);
      v4 = *((double *)&v11 + 1);
      goto LABEL_4;
    case 2:
    case 3:
      -[CLKUICurvedColoringLabel setCircleRadius:](self->_outerLabel, "setCircleRadius:", *((double *)&v9 + 1));
      -[CLKUICurvedColoringLabel setInterior:](self->_outerLabel, "setInterior:", 1);
      v4 = *(double *)&v12;
LABEL_4:
      -[CLKUICurvedColoringLabel setTracking:](self->_outerLabel, "setTracking:", v4);
      break;
    default:
      break;
  }
  outerLabel = self->_outerLabel;
  v6 = *(double *)&v11;
  -[CDRichComplicationCornerView outerComponentRotationInDegree](self, "outerComponentRotationInDegree");
  -[CDRichComplicationCornerView _layoutCurvedLabel:centerAngleInDegree:editingRotationInDegree:](self, "_layoutCurvedLabel:centerAngleInDegree:editingRotationInDegree:", outerLabel, v6, v7);
}

- (void)setFontStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDRichComplicationCornerGaugeTextView;
  -[CDRichComplicationView setFontStyle:](&v3, sel_setFontStyle_, a3);
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  id v5;
  double var2;
  double *v7;
  objc_super v8;
  BOOL v9[8];
  id v10;
  double v11;

  v9[0] = a3->var0;
  v5 = a3->var1;
  var2 = a3->var2;
  v10 = v5;
  v11 = var2;
  v8.receiver = self;
  v8.super_class = (Class)CDRichComplicationCornerGaugeTextView;
  -[CDRichComplicationCornerBaseGaugeView _setFontConfiguration:](&v8, sel__setFontConfiguration_, v9);
  if (a3->var1)
  {
    -[CDRichComplicationView _updateColoringLabel:withFontDescriptor:andSizeFactor:](self, "_updateColoringLabel:withFontDescriptor:andSizeFactor:", self->_outerLabel, a3->var2);
  }
  else
  {
    if (a3->var0)
      v7 = (double *)MEMORY[0x24BEBB608];
    else
      v7 = (double *)MEMORY[0x24BEBB610];
    -[CDRichComplicationCornerView _updateColoringLabel:withFontWeight:](self, "_updateColoringLabel:withFontWeight:", self->_outerLabel, *v7);
  }

}

- (void)setOuterLabelProviders:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_outerLabelProviders, a3);
  if (-[NSArray count](self->_outerLabelProviders, "count"))
  {
    v14 = v5;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_outerLabelProviders;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      v10 = MEMORY[0x24BDAC760];
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "textProvider", v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLKUICurvedColoringLabel setTextProvider:](self->_outerLabel, "setTextProvider:", v12);
        v15[0] = v10;
        v15[1] = 3221225472;
        v15[2] = __64__CDRichComplicationCornerGaugeTextView_setOuterLabelProviders___block_invoke;
        v15[3] = &unk_24CF21410;
        v15[4] = self;
        objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v15);
        v13 = -[CLKUICurvedColoringLabel isTextTruncated](self->_outerLabel, "isTextTruncated");

        if (!v13)
          break;
        if (v8 == ++v11)
        {
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

    v5 = v14;
  }
  else
  {
    -[CLKUICurvedColoringLabel setImageView:](self->_outerLabel, "setImageView:", 0);
    -[CLKUICurvedColoringLabel setTextProvider:](self->_outerLabel, "setTextProvider:", 0);
  }

}

uint64_t __64__CDRichComplicationCornerGaugeTextView_setOuterLabelProviders___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutSubviews");
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 8;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  CLKUICurvedColoringLabel *outerLabel;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  outerLabel = self->_outerLabel;
  v6 = a3;
  objc_msgSend(v6, "outerTextProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUICurvedColoringLabel setTextProvider:](outerLabel, "setTextProvider:", v7);

  objc_msgSend(v6, "gaugeProvider");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingTextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingTextProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDRichComplicationCornerBaseGaugeView handleGaugeProvider:leftTextProvider:rightTextProvider:](self, "handleGaugeProvider:leftTextProvider:rightTextProvider:", v10, v8, v9);
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  void (**v4)(id, CLKUICurvedColoringLabel *);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationCornerGaugeTextView;
  v4 = (void (**)(id, CLKUICurvedColoringLabel *))a3;
  -[CDRichComplicationCornerBaseGaugeView _enumerateLabelsWithBlock:](&v5, sel__enumerateLabelsWithBlock_, v4);
  v4[2](v4, self->_outerLabel);

}

- (void)_editingDidEnd
{
  -[CLKUICurvedColoringLabel editingDidEnd](self->_outerLabel, "editingDidEnd");
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationCornerGaugeTextView;
  -[CDRichComplicationCornerBaseGaugeView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  -[CLKUICurvedColoringLabel transitionToMonochromeWithFraction:style:](self->_outerLabel, "transitionToMonochromeWithFraction:style:", 0, a3);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDRichComplicationCornerGaugeTextView;
  -[CDRichComplicationCornerBaseGaugeView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  -[CLKUICurvedColoringLabel updateMonochromeColorWithStyle:](self->_outerLabel, "updateMonochromeColorWithStyle:", 0);
}

- (NSArray)outerLabelProviders
{
  return self->_outerLabelProviders;
}

- (CLKUICurvedColoringLabel)outerLabel
{
  return self->_outerLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerLabel, 0);
  objc_storeStrong((id *)&self->_outerLabelProviders, 0);
}

@end
