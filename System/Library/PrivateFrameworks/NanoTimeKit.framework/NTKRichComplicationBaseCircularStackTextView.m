@implementation NTKRichComplicationBaseCircularStackTextView

- (NTKRichComplicationBaseCircularStackTextView)initWithFamily:(int64_t)a3
{
  NTKRichComplicationBaseCircularStackTextView *v3;
  NTKRichComplicationBaseCircularStackTextView *v4;
  uint64_t v5;
  CLKUIColoringLabel *line1Label;
  uint64_t v7;
  CLKUIColoringLabel *line2Label;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKRichComplicationBaseCircularStackTextView;
  v3 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v10, sel_initWithFamily_, a3);
  v4 = v3;
  if (v3)
  {
    -[NTKRichComplicationBaseCircularStackTextView _createAndAddLabel](v3, "_createAndAddLabel");
    v5 = objc_claimAutoreleasedReturnValue();
    line1Label = v4->_line1Label;
    v4->_line1Label = (CLKUIColoringLabel *)v5;

    -[NTKRichComplicationBaseCircularStackTextView _createAndAddLabel](v4, "_createAndAddLabel");
    v7 = objc_claimAutoreleasedReturnValue();
    line2Label = v4->_line2Label;
    v4->_line2Label = (CLKUIColoringLabel *)v7;

  }
  return v4;
}

- (id)_createAndAddLabel
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = 0;
  v11 = 0u;
  -[CDRichComplicationView device](self, "device", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_28(v3, -[CDRichComplicationView family](self, "family"), (uint64_t)&v10);

  v4 = objc_alloc((Class)off_1E6BCA6E0);
  v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = (void *)*((_QWORD *)&v11 + 1);
  objc_msgSend(v5, "setFont:", *((_QWORD *)&v11 + 1));
  objc_msgSend(v5, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v7);

  objc_msgSend(v5, "setUsesTextProviderTintColoring:", 1);
  objc_msgSend(v5, "setMaxWidth:", *(double *)&v11);
  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v5);

  objc_msgSend(v5, "setFilterProvider:", self);
  return v5;
}

- (id)_desiredFontForLabel:(id)a3
{
  id v4;
  void *v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *i;
  double v15;
  double v16;
  _QWORD *v17;
  uint64_t v19;
  double v20;
  __int128 v22;
  __int128 v23;
  double v24;

  v4 = a3;
  v24 = 0.0;
  v23 = 0u;
  -[CDRichComplicationView device](self, "device", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_28(v5, -[CDRichComplicationView family](self, "family"), (uint64_t)&v22);

  v6 = *(double *)&v23;
  v7 = *((id *)&v23 + 1);
  objc_msgSend(v7, "pointSize");
  v9 = v8;
  objc_msgSend(v4, "widthForMaxWidth:withFont:", v7, v6);
  v11 = v10;
  objc_msgSend(v4, "textProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "shrinkTextPreference");

  i = v7;
  if (v13)
  {
    if (v13 == 1)
      v15 = v24;
    else
      v15 = 0.0;
    v16 = *MEMORY[0x1E0DC1438];
    v17 = (_QWORD *)MEMORY[0x1E0C940A8];
    for (i = v7; v11 > v6 && v9 > v15; i = (void *)v19)
    {
      v9 = v9 + -1.0;
      objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *v17, v9, v16);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "widthForMaxWidth:withFont:", v19, v6);
      v11 = v20;
    }
  }

  return i;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)NTKRichComplicationBaseCircularStackTextView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v32, sel_layoutSubviews);
  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v27 = v4;
  v28 = v5;

  v31 = 0;
  v29 = 0u;
  v30 = 0u;
  -[CDRichComplicationView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_28(v6, -[CDRichComplicationView family](self, "family"), (uint64_t)&v29);

  -[NTKRichComplicationBaseCircularStackTextView _desiredFontForLabel:](self, "_desiredFontForLabel:", self->_line1Label);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setFont:](self->_line1Label, "setFont:", v7);
  -[CLKUIColoringLabel sizeToFit](self->_line1Label, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_line1Label, "frame");
  -[CLKUIColoringLabel _lastLineBaseline](self->_line1Label, "_lastLineBaseline");
  -[CDRichComplicationView device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredXInRectForDevice();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[CLKUIColoringLabel setFrame:](self->_line1Label, "setFrame:", v10, v12, v14, v16);
  -[NTKRichComplicationBaseCircularStackTextView _desiredFontForLabel:](self, "_desiredFontForLabel:", self->_line2Label);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setFont:](self->_line2Label, "setFont:", v17);
  -[CLKUIColoringLabel sizeToFit](self->_line2Label, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_line2Label, "frame");
  -[CLKUIColoringLabel _lastLineBaseline](self->_line2Label, "_lastLineBaseline", v27, v28);
  -[CDRichComplicationView device](self, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredXInRectForDevice();
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  -[CLKUIColoringLabel setFrame:](self->_line2Label, "setFrame:", v20, v22, v24, v26);
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  id v5;
  double var2;
  id v7;
  double v8;
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
  v9.super_class = (Class)NTKRichComplicationBaseCircularStackTextView;
  -[CDRichComplicationView _setFontConfiguration:](&v9, sel__setFontConfiguration_, v10);
  v7 = a3->var1;
  if (v7)
  {
    v8 = a3->var2;
    -[CDRichComplicationView _updateColoringLabel:withFontDescriptor:andSizeFactor:](self, "_updateColoringLabel:withFontDescriptor:andSizeFactor:", self->_line1Label, v7, v8);
    -[CDRichComplicationView _updateColoringLabel:withFontDescriptor:andSizeFactor:](self, "_updateColoringLabel:withFontDescriptor:andSizeFactor:", self->_line2Label, v7, v8);
  }

}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10 || a3 == 12;
}

- (void)_editingDidEnd
{
  -[CLKUIColoringLabel editingDidEnd](self->_line1Label, "editingDidEnd");
  -[CLKUIColoringLabel editingDidEnd](self->_line2Label, "editingDidEnd");
}

- (BOOL)templateWantsPlatter
{
  return 1;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularStackTextView;
  -[NTKRichComplicationCircularBaseView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_line1Label, "transitionToMonochromeWithFraction:style:", -[NTKRichComplicationBaseCircularStackTextView _line1FilterStyle](self, "_line1FilterStyle"), a3);
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_line2Label, "transitionToMonochromeWithFraction:style:", -[NTKRichComplicationBaseCircularStackTextView _line2FilterStyle](self, "_line2FilterStyle"), a3);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBaseCircularStackTextView;
  -[NTKRichComplicationCircularBaseView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_line1Label, "updateMonochromeColorWithStyle:", -[NTKRichComplicationBaseCircularStackTextView _line1FilterStyle](self, "_line1FilterStyle"));
  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_line2Label, "updateMonochromeColorWithStyle:", -[NTKRichComplicationBaseCircularStackTextView _line2FilterStyle](self, "_line2FilterStyle"));
}

- (int64_t)_line1FilterStyle
{
  void *v3;
  char v4;

  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = NTKShowGossamerUI(v3);

  if ((v4 & 1) != 0)
    return 2;
  else
    return 2 * (self->_highlightMode != 0);
}

- (int64_t)_line2FilterStyle
{
  void *v3;
  char v4;

  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = NTKShowGossamerUI(v3);

  if ((v4 & 1) != 0)
    return 0;
  else
    return 2 * (self->_highlightMode == 0);
}

- (CLKUIColoringLabel)line1Label
{
  return self->_line1Label;
}

- (void)setLine1Label:(id)a3
{
  objc_storeStrong((id *)&self->_line1Label, a3);
}

- (CLKUIColoringLabel)line2Label
{
  return self->_line2Label;
}

- (void)setLine2Label:(id)a3
{
  objc_storeStrong((id *)&self->_line2Label, a3);
}

- (unint64_t)highlightMode
{
  return self->_highlightMode;
}

- (void)setHighlightMode:(unint64_t)a3
{
  self->_highlightMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2Label, 0);
  objc_storeStrong((id *)&self->_line1Label, 0);
}

@end
