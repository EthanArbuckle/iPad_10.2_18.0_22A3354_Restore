@implementation NTKRichComplicationCircularStackContentTextView

- (NTKRichComplicationCircularStackContentTextView)initWithFamily:(int64_t)a3
{
  NTKRichComplicationCircularStackContentTextView *v4;
  NTKRichComplicationCircularStackContentTextView *v5;
  uint64_t v6;
  UIView *line1View;
  void *v8;
  void *v9;
  CLKUIColoringLabel *v10;
  CLKUIColoringLabel *line2Label;
  void *v12;
  CLKUIColoringLabel *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NTKRichComplicationCircularStackContentTextView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v20, sel_initWithFamily_);
  v5 = v4;
  if (v4)
  {
    -[NTKRichComplicationCircularStackContentTextView line1View](v4, "line1View");
    v6 = objc_claimAutoreleasedReturnValue();
    line1View = v5->_line1View;
    v5->_line1View = (UIView *)v6;

    -[NTKRichComplicationCircularBaseView contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v5->_line1View);

    v18 = 0u;
    v19 = 0u;
    -[CDRichComplicationView device](v5, "device", 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_30(v9, a3, (uint64_t)&v17);

    v10 = (CLKUIColoringLabel *)objc_alloc_init((Class)off_1E6BCA6E0);
    line2Label = v5->_line2Label;
    v5->_line2Label = v10;

    v12 = (void *)*((_QWORD *)&v18 + 1);
    -[CLKUIColoringLabel setFont:](v5->_line2Label, "setFont:", *((_QWORD *)&v18 + 1));
    -[CLKUIColoringLabel setTextAlignment:](v5->_line2Label, "setTextAlignment:", 1);
    v13 = v5->_line2Label;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v13, "setTextColor:", v14);

    -[CLKUIColoringLabel setUsesTextProviderTintColoring:](v5->_line2Label, "setUsesTextProviderTintColoring:", 1);
    -[CLKUIColoringLabel setMaxWidth:](v5->_line2Label, "setMaxWidth:", *(double *)&v18);
    -[CLKUIColoringLabel setFilterProvider:](v5->_line2Label, "setFilterProvider:", v5);
    -[NTKRichComplicationCircularBaseView contentView](v5, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v5->_line2Label);

  }
  return v5;
}

- (CLKUIColoringLabel)line2Label
{
  return self->_line2Label;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  UIView *line1View;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NTKRichComplicationCircularStackContentTextView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v19, sel_layoutSubviews);
  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");

  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  -[CDRichComplicationView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_30(v4, -[CDRichComplicationView family](self, "family"), (uint64_t)&v16);

  -[CLKUIColoringLabel sizeToFit](self->_line2Label, "sizeToFit");
  line1View = self->_line1View;
  -[CDRichComplicationView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectIntegralForDevice();
  -[UIView ntk_setBoundsAndPositionFromFrame:](line1View, "ntk_setBoundsAndPositionFromFrame:");

  -[CLKUIColoringLabel frame](self->_line2Label, "frame");
  -[CLKUIColoringLabel _lastLineBaseline](self->_line2Label, "_lastLineBaseline");
  -[CDRichComplicationView device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredXInRectForDevice();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[CLKUIColoringLabel setFrame:](self->_line2Label, "setFrame:", v9, v11, v13, v15);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  CLKUIColoringLabel *line2Label;
  id v5;

  line2Label = self->_line2Label;
  -[NTKRichComplicationCircularStackContentTextView line2TextProviderFromTemplate:](self, "line2TextProviderFromTemplate:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](line2Label, "setTextProvider:", v5);

}

- (void)_editingDidEnd
{
  -[CLKUIColoringLabel editingDidEnd](self->_line2Label, "editingDidEnd");
}

- (int64_t)_line2FilterStyle
{
  void *v2;
  int v3;

  -[CDRichComplicationView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = NTKShowGossamerUI(v2);

  if (v3)
    return 0;
  else
    return 2;
}

- (BOOL)templateWantsPlatter
{
  return 1;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationCircularStackContentTextView;
  -[NTKRichComplicationCircularBaseView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_line2Label, "transitionToMonochromeWithFraction:style:", -[NTKRichComplicationCircularStackContentTextView _line2FilterStyle](self, "_line2FilterStyle"), a3);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationCircularStackContentTextView;
  -[NTKRichComplicationCircularBaseView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_line2Label, "updateMonochromeColorWithStyle:", -[NTKRichComplicationCircularStackContentTextView _line2FilterStyle](self, "_line2FilterStyle"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2Label, 0);
  objc_storeStrong((id *)&self->_line1View, 0);
}

- (id)line1View
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  return 0;
}

- (id)line2TextProviderFromTemplate:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  return 0;
}

@end
