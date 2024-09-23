@implementation NTKRichComplicationRectangularStandardBodyView

- (NTKRichComplicationRectangularStandardBodyView)init
{
  NTKRichComplicationRectangularStandardBodyView *v2;
  NTKRichComplicationRectangularStandardBodyView *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  CLKUIColoringLabel *line1Label;
  void *v12;
  uint64_t v13;
  CLKUIColoringLabel *line2Label;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NTKRichComplicationRectangularStandardBodyView;
  v2 = -[NTKRichComplicationRectangularLargeHeadlineBaseView init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CDRichComplicationView device](v2, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_7(v4);
    v6 = v5;
    v8 = v7;

    v9 = *MEMORY[0x1E0DC1440];
    -[NTKRichComplicationRectangularBaseView _createAndAddColoringLabelWithFontSize:weight:usesTextProviderTintColoring:](v3, "_createAndAddColoringLabelWithFontSize:weight:usesTextProviderTintColoring:", 1, v6, *MEMORY[0x1E0DC1440]);
    v10 = objc_claimAutoreleasedReturnValue();
    line1Label = v3->_line1Label;
    v3->_line1Label = (CLKUIColoringLabel *)v10;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v3->_line1Label, "setTextColor:", v12);

    -[NTKRichComplicationRectangularBaseView _createAndAddColoringLabelWithFontSize:weight:usesTextProviderTintColoring:](v3, "_createAndAddColoringLabelWithFontSize:weight:usesTextProviderTintColoring:", 1, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    line2Label = v3->_line2Label;
    v3->_line2Label = (CLKUIColoringLabel *)v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v3->_line2Label, "setTextColor:", v15);

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
  CGFloat v8;
  double v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  CGRect v21;

  v20.receiver = self;
  v20.super_class = (Class)NTKRichComplicationRectangularStandardBodyView;
  -[NTKRichComplicationRectangularLargeHeadlineBaseView layoutSubviews](&v20, sel_layoutSubviews);
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _LayoutConstants_7(v3);

  -[NTKRichComplicationRectangularStandardBodyView bounds](self, "bounds");
  v6 = v5;
  -[NTKRichComplicationRectangularBaseView contentMargin](self, "contentMargin");
  v8 = v7;
  v9 = v6 + v7 * -2.0;
  -[CLKUIColoringLabel setMaxWidth:](self->_line1Label, "setMaxWidth:", v9);
  -[CLKUIColoringLabel sizeThatFits:](self->_line1Label, "sizeThatFits:", v9, 0.0);
  v11 = v10;
  -[CLKUIColoringLabel font](self->_line1Label, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ascender");
  v14 = -(v13 - v4 * 2.0);

  if (-[CLKUIColoringLabel isHidden](self->_line2Label, "isHidden"))
  {
    v21.origin.x = v8;
    v21.origin.y = v14;
    v21.size.width = v9;
    v21.size.height = v11;
    CGRectGetHeight(v21);
    -[CLKUIColoringLabel font](self->_line1Label, "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lineHeight");

  }
  -[CDRichComplicationView device](self, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_line1Label, "setFrame:");

  -[CLKUIColoringLabel font](self->_line2Label, "font");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ascender");

  -[CLKUIColoringLabel font](self->_line2Label, "font");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lineHeight");

  -[CDRichComplicationView device](self, "device");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_line2Label, "setFrame:");

  -[CLKUIColoringLabel setMaxWidth:](self->_line2Label, "setMaxWidth:", v9);
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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CLKUIColoringLabel *line1Label;
  void *v12;
  CLKUIColoringLabel **p_line2Label;
  id v14;

  v14 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "headerLabelData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
  }
  else
  {
    objc_msgSend(v14, "headerImageProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }
  objc_msgSend(v14, "headerTextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularLargeHeadlineBaseView _updateTemplateHeaderWithTextProvider:imageProvider:viewData:reason:](self, "_updateTemplateHeaderWithTextProvider:imageProvider:viewData:reason:", v8, v7, v6, a4);

  objc_msgSend(v14, "body1TextProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](self->_line1Label, "setTextProvider:", v9);

  objc_msgSend(v14, "body2TextProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  line1Label = self->_line1Label;
  if (v10)
  {
    -[CLKUIColoringLabel setNumberOfLines:](line1Label, "setNumberOfLines:", 1);
    objc_msgSend(v14, "body2TextProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    p_line2Label = &self->_line2Label;
    -[CLKUIColoringLabel setTextProvider:](self->_line2Label, "setTextProvider:", v12);

  }
  else
  {
    -[CLKUIColoringLabel setNumberOfLines:](line1Label, "setNumberOfLines:", 2);
    p_line2Label = &self->_line2Label;
    -[CLKUIColoringLabel setTextProvider:](self->_line2Label, "setTextProvider:", 0);
  }
  -[CLKUIColoringLabel setHidden:](*p_line2Label, "setHidden:", v10 == 0);
  -[NTKRichComplicationRectangularStandardBodyView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  void (**v4)(id, CLKUIColoringLabel *);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularStandardBodyView;
  v4 = (void (**)(id, CLKUIColoringLabel *))a3;
  -[NTKRichComplicationRectangularLargeHeadlineBaseView _enumerateLabelsWithBlock:](&v5, sel__enumerateLabelsWithBlock_, v4);
  v4[2](v4, self->_line1Label);
  v4[2](v4, self->_line2Label);

}

- (void)_editingDidEnd
{
  -[CLKUIColoringLabel editingDidEnd](self->_line1Label, "editingDidEnd");
  -[CLKUIColoringLabel editingDidEnd](self->_line2Label, "editingDidEnd");
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularStandardBodyView;
  -[NTKRichComplicationRectangularLargeHeadlineBaseView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_line1Label, "transitionToMonochromeWithFraction:style:", 0, a3);
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_line2Label, "transitionToMonochromeWithFraction:style:", 0, a3);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationRectangularStandardBodyView;
  -[NTKRichComplicationRectangularLargeHeadlineBaseView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_line1Label, "updateMonochromeColorWithStyle:", 0);
  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_line2Label, "updateMonochromeColorWithStyle:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2Label, 0);
  objc_storeStrong((id *)&self->_line1Label, 0);
}

@end
