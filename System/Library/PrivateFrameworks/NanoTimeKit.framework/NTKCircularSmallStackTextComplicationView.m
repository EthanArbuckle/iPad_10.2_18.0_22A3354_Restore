@implementation NTKCircularSmallStackTextComplicationView

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

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 4 || *MEMORY[0x1E0C93E90] == a3;
}

- (NTKCircularSmallStackTextComplicationView)initWithFrame:(CGRect)a3
{
  NTKCircularSmallStackTextComplicationView *v3;
  NTKCircularSmallStackTextComplicationView *v4;
  void *v5;
  uint64_t v6;
  CLKUIColoringLabel *firstLineLabel;
  uint64_t v8;
  CLKUIColoringLabel *secondLineLabel;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKCircularSmallStackTextComplicationView;
  v3 = -[NTKCircularComplicationView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NTKCircularComplicationView _fontForDynamicFontSize:](v3, "_fontForDynamicFontSize:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NTKCircularComplicationView _newLabelSubviewWithFont:](v4, "_newLabelSubviewWithFont:", v5);
    firstLineLabel = v4->_firstLineLabel;
    v4->_firstLineLabel = (CLKUIColoringLabel *)v6;

    v8 = -[NTKCircularComplicationView _newLabelSubviewWithFont:](v4, "_newLabelSubviewWithFont:", v5);
    secondLineLabel = v4->_secondLineLabel;
    v4->_secondLineLabel = (CLKUIColoringLabel *)v8;

    -[NTKCircularComplicationView _layoutConstants](v4, "_layoutConstants");
    -[CLKUIColoringLabel setMaxWidth:](v4->_firstLineLabel, "setMaxWidth:", v11);
    -[CLKUIColoringLabel setMaxWidth:](v4->_secondLineLabel, "setMaxWidth:", v11);

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
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)NTKCircularSmallStackTextComplicationView;
  -[NTKCircularComplicationView layoutSubviews](&v21, sel_layoutSubviews);
  -[NTKCircularSmallStackTextComplicationView bounds](self, "bounds");
  -[CLKUIColoringLabel sizeToFit](self->_firstLineLabel, "sizeToFit");
  -[CLKUIColoringLabel sizeToFit](self->_secondLineLabel, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_firstLineLabel, "frame");
  -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
  -[CLKUIColoringLabel _lastLineBaseline](self->_firstLineLabel, "_lastLineBaseline");
  -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
  -[NTKCircularComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredXInRectForDevice();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CLKUIColoringLabel setFrame:](self->_firstLineLabel, "setFrame:", v5, v7, v9, v11);
  -[CLKUIColoringLabel frame](self->_secondLineLabel, "frame");
  -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
  -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
  -[CLKUIColoringLabel _lastLineBaseline](self->_secondLineLabel, "_lastLineBaseline");
  -[NTKCircularComplicationView device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredXInRectForDevice();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[CLKUIColoringLabel setFrame:](self->_secondLineLabel, "setFrame:", v14, v16, v18, v20);
}

- (void)_updateForTemplateChange
{
  CLKUIColoringLabel *firstLineLabel;
  void *v4;
  CLKUIColoringLabel *secondLineLabel;
  void *v6;
  id v7;

  -[NTKCircularComplicationView complicationTemplate](self, "complicationTemplate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  firstLineLabel = self->_firstLineLabel;
  objc_msgSend(v7, "line1TextProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](firstLineLabel, "setTextProvider:", v4);

  secondLineLabel = self->_secondLineLabel;
  objc_msgSend(v7, "line2TextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](secondLineLabel, "setTextProvider:", v6);

  if (-[NTKCircularComplicationView usesMediumLayout](self, "usesMediumLayout"))
    -[NTKCircularSmallStackTextComplicationView _updateLabelsForFontChange](self, "_updateLabelsForFontChange");
  -[NTKCircularSmallStackTextComplicationView _updateLabelColors](self, "_updateLabelColors");
  -[NTKCircularSmallStackTextComplicationView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateLabelColors
{
  -[NTKCircularComplicationView _updateLabelViewColor:](self, "_updateLabelViewColor:", self->_firstLineLabel);
  -[NTKCircularComplicationView _updateLabelViewColor:](self, "_updateLabelViewColor:", self->_secondLineLabel);
}

- (void)setForegroundColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKCircularSmallStackTextComplicationView;
  -[NTKCircularComplicationView setForegroundColor:](&v4, sel_setForegroundColor_, a3);
  -[NTKCircularSmallStackTextComplicationView _updateLabelColors](self, "_updateLabelColors");
}

- (void)setUsesMultiColor:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKCircularSmallStackTextComplicationView;
  -[NTKCircularComplicationView setUsesMultiColor:](&v4, sel_setUsesMultiColor_, a3);
  -[NTKCircularSmallStackTextComplicationView _updateLabelColors](self, "_updateLabelColors");
}

- (void)_updateLabelsForFontChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;

  if (-[NTKCircularComplicationView usesMediumLayout](self, "usesMediumLayout"))
  {
    -[CLKUIColoringLabel text](self->_firstLineLabel, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCircularComplicationView _mediumStackFontForText:](self, "_mediumStackFontForText:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[CLKUIColoringLabel text](self->_secondLineLabel, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCircularComplicationView _mediumStackFontForText:](self, "_mediumStackFontForText:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NTKCircularComplicationView _fontForDynamicFontSize:](self, "_fontForDynamicFontSize:", 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v6;
  }
  -[CLKUIColoringLabel setFont:](self->_firstLineLabel, "setFont:", v4);
  -[CLKUIColoringLabel setFont:](self->_secondLineLabel, "setFont:", v6);
  -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
  -[CLKUIColoringLabel setMaxWidth:](self->_firstLineLabel, "setMaxWidth:", v7);
  -[CLKUIColoringLabel setMaxWidth:](self->_secondLineLabel, "setMaxWidth:", v7);

}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(v6, self->_secondLineLabel);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondLineLabel, 0);
  objc_storeStrong((id *)&self->_firstLineLabel, 0);
}

@end
