@implementation NTKRichComplicationRectangularHeadlineLargeBodyView

- (NTKRichComplicationRectangularHeadlineLargeBodyView)init
{
  NTKRichComplicationRectangularHeadlineLargeBodyView *v2;
  NTKRichComplicationRectangularHeadlineLargeBodyView *v3;
  void *v4;
  uint64_t v5;
  CLKUIColoringLabel *headerLabel;
  uint64_t v7;
  UIView *body;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKRichComplicationRectangularHeadlineLargeBodyView;
  v2 = -[NTKRichComplicationRectangularBaseView init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CDRichComplicationView device](v2, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKRichComplicationRectangularBaseView _createAndAddColoringLabelWithFontSize:weight:usesTextProviderTintColoring:](v3, "_createAndAddColoringLabelWithFontSize:weight:usesTextProviderTintColoring:", 1, _LayoutConstants_39(v4), *MEMORY[0x1E0DC1448]);
    v5 = objc_claimAutoreleasedReturnValue();
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = (CLKUIColoringLabel *)v5;

    -[CLKUIColoringLabel setNumberOfLines:](v3->_headerLabel, "setNumberOfLines:", 1);
    -[NTKRichComplicationRectangularHeadlineLargeBodyView body](v3, "body");
    v7 = objc_claimAutoreleasedReturnValue();
    body = v3->_body;
    v3->_body = (UIView *)v7;

    -[NTKRichComplicationRectangularHeadlineLargeBodyView addSubview:](v3, "addSubview:", v3->_body);
  }
  return v3;
}

- (CGSize)_bodySize
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  os_unfair_lock_lock((os_unfair_lock_t)&_bodySize___lock);
  WeakRetained = objc_loadWeakRetained(&_bodySize___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  -[CDRichComplicationView device](self, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&_bodySize___cachedDevice);
  if (v5 != v6)
  {

LABEL_5:
    -[CDRichComplicationView device](self, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_bodySize___cachedDevice, v10);

    v11 = objc_loadWeakRetained(&_bodySize___cachedDevice);
    _bodySize___previousCLKDeviceVersion = objc_msgSend(v11, "version");

    -[CDRichComplicationView device](self, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CDGraphicLargeRectangularComplicationLargeImageHeight();
    _bodySize_sizeHeight = v13;

    goto LABEL_6;
  }
  -[CDRichComplicationView device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "version");
  v9 = _bodySize___previousCLKDeviceVersion;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_bodySize___lock);
  -[CDRichComplicationView device](self, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = NTKWhistlerLargeRectangularComplicationSize();

  -[NTKRichComplicationRectangularBaseView contentMargin](self, "contentMargin");
  v17 = v15 + v16 * -2.0;
  v18 = *(double *)&_bodySize_sizeHeight;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)NTKRichComplicationRectangularHeadlineLargeBodyView;
  -[NTKRichComplicationRectangularHeadlineLargeBodyView layoutSubviews](&v24, sel_layoutSubviews);
  -[NTKRichComplicationRectangularHeadlineLargeBodyView bounds](self, "bounds");
  v4 = v3;
  -[CDRichComplicationView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _LayoutConstants_39(v5);
  v8 = v7;
  v10 = v9;
  -[CLKUIColoringLabel font](self->_headerLabel, "font", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularBaseView contentMargin](self, "contentMargin");
  v13 = v4 + v12 * -2.0;
  objc_msgSend(v11, "ascender");
  CLKRoundForDevice();
  v15 = v14;
  -[NTKRichComplicationRectangularBaseView contentMargin](self, "contentMargin");
  v17 = v16;
  objc_msgSend(v11, "lineHeight");
  CLKRoundForDevice();
  -[CLKUIColoringLabel setFrame:](self->_headerLabel, "setFrame:", v17, v8 - v15, v13, v18);
  -[CLKUIColoringLabel setMaxWidth:](self->_headerLabel, "setMaxWidth:", v13);
  v19 = v8 + v10;
  -[NTKRichComplicationRectangularBaseView contentMargin](self, "contentMargin");
  v21 = v20;
  -[NTKRichComplicationRectangularHeadlineLargeBodyView _bodySize](self, "_bodySize");
  -[UIView setFrame:](self->_body, "setFrame:", v21, v19, v22, v23);

}

- (void)_editingDidEnd
{
  -[CLKUIColoringLabel editingDidEnd](self->_headerLabel, "editingDidEnd");
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  void *v5;
  CLKUIColoringLabel *headerLabel;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  _BOOL8 v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    headerLabel = self->_headerLabel;
    objc_msgSend(v14, "tintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setColor:](headerLabel, "setColor:", v7);

  }
  objc_msgSend(v14, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C94110]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[CLKUIColoringLabel setTwoToneStyleInMonochrome:](self->_headerLabel, "setTwoToneStyleInMonochrome:", objc_msgSend(v9, "integerValue"));
  -[NTKRichComplicationRectangularHeadlineLargeBodyView headerTextProviderFromTemplate:](self, "headerTextProviderFromTemplate:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](self->_headerLabel, "setTextProvider:", v10);
  v13 = 1;
  if (objc_msgSend(v14, "isLinkedOnOrAfterGrace"))
  {
    -[CDRichComplicationView device](self, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isRunningGraceOrLater");

    if ((v12 & 1) != 0)
      v13 = 0;
  }
  -[CLKUIColoringLabel setUppercase:](self->_headerLabel, "setUppercase:", v13);

}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_headerLabel, "transitionToMonochromeWithFraction:style:", 2, a3);
}

- (void)updateMonochromeColor
{
  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_headerLabel, "updateMonochromeColorWithStyle:", 2);
}

- (CLKUIColoringLabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

- (id)body
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  return 0;
}

- (id)headerTextProviderFromTemplate:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  return 0;
}

@end
