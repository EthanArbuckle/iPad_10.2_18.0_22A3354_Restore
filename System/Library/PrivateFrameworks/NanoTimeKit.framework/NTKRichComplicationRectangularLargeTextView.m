@implementation NTKRichComplicationRectangularLargeTextView

- (NTKRichComplicationRectangularLargeTextView)init
{
  NTKRichComplicationRectangularLargeTextView *v2;
  NTKRichComplicationRectangularLargeTextView *v3;
  void *v4;
  uint64_t v5;
  CLKUIColoringLabel *line1Label;
  void *v7;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKRichComplicationRectangularLargeTextView;
  v2 = -[NTKRichComplicationRectangularLargeHeadlineBaseView init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v11 = 0;
    v10 = 0u;
    -[CDRichComplicationView device](v2, "device", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_53(v4, (uint64_t)&v9);

    -[NTKRichComplicationRectangularBaseView _createAndAddColoringLabelWithFontSize:weight:usesTextProviderTintColoring:](v3, "_createAndAddColoringLabelWithFontSize:weight:usesTextProviderTintColoring:", 0, v10);
    v5 = objc_claimAutoreleasedReturnValue();
    line1Label = v3->_line1Label;
    v3->_line1Label = (CLKUIColoringLabel *)v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v3->_line1Label, "setTextColor:", v7);

  }
  return v3;
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
  void *v10;
  void *v11;
  _OWORD v12[2];
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKRichComplicationRectangularLargeTextView;
  -[NTKRichComplicationRectangularLargeHeadlineBaseView layoutSubviews](&v14, sel_layoutSubviews);
  v13 = 0.0;
  memset(v12, 0, sizeof(v12));
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_53(v3, (uint64_t)v12);

  -[NTKRichComplicationRectangularLargeTextView bounds](self, "bounds");
  v5 = v4;
  -[NTKRichComplicationRectangularBaseView contentMargin](self, "contentMargin");
  v7 = v5 + v6 * -2.0;
  -[CLKUIColoringLabel sizeToFit](self->_line1Label, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_line1Label, "frame");
  -[NTKRichComplicationRectangularBaseView contentMargin](self, "contentMargin");
  v8 = v13;
  -[CLKUIColoringLabel font](self->_line1Label, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ascender");

  -[CLKUIColoringLabel font](self->_line1Label, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lineHeight");

  -[CDRichComplicationView device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_line1Label, "setFrame:");

  -[CLKUIColoringLabel setMaxWidth:](self->_line1Label, "setMaxWidth:", v7 + v8 * -2.0);
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
  return a3 == 11;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  objc_msgSend(v6, "headerTextProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerImageProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularLargeHeadlineBaseView _updateTemplateHeaderWithTextProvider:imageProvider:viewData:reason:](self, "_updateTemplateHeaderWithTextProvider:imageProvider:viewData:reason:", v7, v8, 0, a4);

  objc_msgSend(v6, "bodyTextProvider");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[CLKUIColoringLabel setTextProvider:](self->_line1Label, "setTextProvider:", v9);
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  void (**v4)(id, CLKUIColoringLabel *);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularLargeTextView;
  v4 = (void (**)(id, CLKUIColoringLabel *))a3;
  -[NTKRichComplicationRectangularLargeHeadlineBaseView _enumerateLabelsWithBlock:](&v5, sel__enumerateLabelsWithBlock_, v4);
  v4[2](v4, self->_line1Label);

}

- (void)_editingDidEnd
{
  -[CLKUIColoringLabel editingDidEnd](self->_line1Label, "editingDidEnd");
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularLargeTextView;
  -[NTKRichComplicationRectangularLargeHeadlineBaseView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_line1Label, "transitionToMonochromeWithFraction:style:", 0, a3);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationRectangularLargeTextView;
  -[NTKRichComplicationRectangularLargeHeadlineBaseView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_line1Label, "updateMonochromeColorWithStyle:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line1Label, 0);
}

@end
