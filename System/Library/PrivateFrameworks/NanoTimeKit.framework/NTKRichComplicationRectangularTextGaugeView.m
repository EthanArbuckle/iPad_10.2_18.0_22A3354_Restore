@implementation NTKRichComplicationRectangularTextGaugeView

+ (BOOL)isMeteredProgressView
{
  objc_msgSend(a1, "progressFillStyle");
  return CDRichComplicationProgressFillStyleIsMetered();
}

+ (int64_t)progressFillStyle
{
  return 0;
}

- (NTKRichComplicationRectangularTextGaugeView)init
{
  NTKRichComplicationRectangularTextGaugeView *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  CLKUIColoringLabel *bodyLabel;
  void *v7;
  NTKRichComplicationLineProgressView *v8;
  void *v9;
  uint64_t v10;
  NTKRichComplicationLineProgressView *progressView;
  _OWORD v13[2];
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NTKRichComplicationRectangularTextGaugeView;
  v2 = -[NTKRichComplicationRectangularLargeHeadlineBaseView init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_msgSend((id)objc_opt_class(), "progressFillStyle");
    v14 = 0;
    memset(v13, 0, sizeof(v13));
    -[CDRichComplicationView device](v2, "device", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_19(v4, (uint64_t)v13);

    -[NTKRichComplicationRectangularBaseView _createAndAddColoringLabelWithFontSize:weight:usesTextProviderTintColoring:](v2, "_createAndAddColoringLabelWithFontSize:weight:usesTextProviderTintColoring:", 1, *((double *)v13 + 1), *MEMORY[0x1E0DC1440]);
    v5 = objc_claimAutoreleasedReturnValue();
    bodyLabel = v2->_bodyLabel;
    v2->_bodyLabel = (CLKUIColoringLabel *)v5;

    -[CLKUIColoringLabel setNumberOfLines:](v2->_bodyLabel, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v2->_bodyLabel, "setTextColor:", v7);

    v8 = [NTKRichComplicationLineProgressView alloc];
    -[CDRichComplicationView device](v2, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NTKRichComplicationLineProgressView initForFamily:device:progressFillStyle:](v8, "initForFamily:device:progressFillStyle:", 11, v9, v3);
    progressView = v2->_progressView;
    v2->_progressView = (NTKRichComplicationLineProgressView *)v10;

    -[CDRichComplicationProgressView setFilterProvider:](v2->_progressView, "setFilterProvider:", v2);
    -[NTKRichComplicationRectangularTextGaugeView addSubview:](v2, "addSubview:", v2->_progressView);
  }
  return v2;
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
  void *v11;
  void *v12;
  void *v13;
  double *v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NTKRichComplicationRectangularTextGaugeView;
  -[NTKRichComplicationRectangularLargeHeadlineBaseView layoutSubviews](&v18, sel_layoutSubviews);
  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_19(v3, (uint64_t)&v15);

  -[NTKRichComplicationRectangularTextGaugeView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  -[NTKRichComplicationRectangularBaseView contentMargin](self, "contentMargin");
  v9 = v8;
  v10 = v5 + v8 * -2.0;
  -[CLKUIColoringLabel sizeToFit](self->_bodyLabel, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_bodyLabel, "frame");
  -[CLKUIColoringLabel font](self->_bodyLabel, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ascender");

  -[CLKUIColoringLabel font](self->_bodyLabel, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lineHeight");

  -[CDRichComplicationView device](self, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_bodyLabel, "setFrame:");

  -[CLKUIColoringLabel setMaxWidth:](self->_bodyLabel, "setMaxWidth:", v10);
  if (objc_msgSend((id)objc_opt_class(), "isMeteredProgressView"))
    v14 = (double *)&v17;
  else
    v14 = (double *)&v16;
  -[NTKRichComplicationLineProgressView setFrame:](self->_progressView, "setFrame:", v9, v7 - *((double *)&v16 + 1) - *v14, v10);
}

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

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v12;
    objc_msgSend(v6, "headerLabelData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bodyTextProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
  }
  else
  {
    objc_msgSend(v12, "headerImageProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "body1TextProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
  }
  objc_msgSend(v12, "headerTextProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "gaugeProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularTextGaugeView _handleTemplateUpdateWithReason:headerViewData:headerImageProvider:headerTextProvider:bodyTextProvider:gaugeProvider:](self, "_handleTemplateUpdateWithReason:headerViewData:headerImageProvider:headerTextProvider:bodyTextProvider:gaugeProvider:", a4, v7, v9, v10, v8, v11);

}

- (void)_handleTemplateUpdateWithReason:(int64_t)a3 headerViewData:(id)a4 headerImageProvider:(id)a5 headerTextProvider:(id)a6 bodyTextProvider:(id)a7 gaugeProvider:(id)a8
{
  id v14;
  id v15;

  v15 = a8;
  v14 = a7;
  -[NTKRichComplicationRectangularLargeHeadlineBaseView _updateTemplateHeaderWithTextProvider:imageProvider:viewData:reason:](self, "_updateTemplateHeaderWithTextProvider:imageProvider:viewData:reason:", a6, a5, a4, a3);
  -[CLKUIColoringLabel setTextProvider:](self->_bodyLabel, "setTextProvider:", v14);

  -[CDRichComplicationProgressView setGaugeProvider:](self->_progressView, "setGaugeProvider:", v15);
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  void (**v4)(id, CLKUIColoringLabel *);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularTextGaugeView;
  v4 = (void (**)(id, CLKUIColoringLabel *))a3;
  -[NTKRichComplicationRectangularLargeHeadlineBaseView _enumerateLabelsWithBlock:](&v5, sel__enumerateLabelsWithBlock_, v4);
  v4[2](v4, self->_bodyLabel);

}

- (void)_editingDidEnd
{
  -[CLKUIColoringLabel editingDidEnd](self->_bodyLabel, "editingDidEnd");
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularTextGaugeView;
  -[NTKRichComplicationRectangularLargeHeadlineBaseView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_bodyLabel, "transitionToMonochromeWithFraction:style:", 0, a3);
  -[CDRichComplicationProgressView transitionToMonochromeWithFraction:](self->_progressView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationRectangularTextGaugeView;
  -[NTKRichComplicationRectangularLargeHeadlineBaseView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_bodyLabel, "updateMonochromeColorWithStyle:", 0);
  -[CDRichComplicationProgressView updateMonochromeColor](self->_progressView, "updateMonochromeColor");
}

- (CLKUIColoringLabel)bodyLabel
{
  return self->_bodyLabel;
}

- (NTKRichComplicationLineProgressView)progressView
{
  return self->_progressView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
}

@end
