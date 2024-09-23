@implementation NTKSimpleTextComplicationView

- (NTKSimpleTextComplicationView)init
{
  NTKSimpleTextComplicationView *v2;
  void *v3;
  uint64_t v4;
  CLKDevice *device;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKSimpleTextComplicationView;
  v2 = -[NTKSimpleTextComplicationView init](&v9, sel_init);
  if (v2)
  {
    +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "device");
    v4 = objc_claimAutoreleasedReturnValue();
    device = v2->_device;
    v2->_device = (CLKDevice *)v4;

    -[NTKSimpleTextComplicationView label](v2, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSimpleTextComplicationView addSubview:](v2, "addSubview:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSimpleTextComplicationView setBackgroundColor:](v2, "setBackgroundColor:", v7);

  }
  return v2;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKSimpleTextComplicationView;
  -[NTKSimpleTextComplicationView layoutSubviews](&v3, sel_layoutSubviews);
  -[NTKSimpleTextComplicationView _updateLabelFrame](self, "_updateLabelFrame");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  CGSize result;

  -[CLKUIColoringLabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  -[NTKSimpleTextComplicationView device](self, "device", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_42(v8, (uint64_t)&v11);

  v9 = v5 + *((double *)&v12 + 1);
  if (v5 + *((double *)&v12 + 1) < *((double *)&v11 + 1))
    v9 = *((double *)&v11 + 1);
  if (v7 >= *(double *)&v12)
    v10 = v7;
  else
    v10 = *(double *)&v12;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_updateLabelFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _BYTE v8[32];
  double v9;
  CGRect v10;

  -[CLKUIColoringLabel sizeToFit](self->_label, "sizeToFit");
  -[NTKSimpleTextComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_42(v3, (uint64_t)v8);
  v4 = v9;

  -[CLKUIColoringLabel bounds](self->_label, "bounds");
  if (CGRectGetWidth(v10) > v4)
  {
    -[CLKUIColoringLabel frame](self->_label, "frame");
    -[CLKUIColoringLabel setFrame:](self->_label, "setFrame:");
  }
  -[NTKSimpleTextComplicationView bounds](self, "bounds");
  v6 = v5 * 0.5;
  -[NTKSimpleTextComplicationView bounds](self, "bounds");
  -[CLKUIColoringLabel setCenter:](self->_label, "setCenter:", v6, v7 * 0.5);
}

- (CLKUIColoringLabel)label
{
  CLKUIColoringLabel **p_label;
  CLKUIColoringLabel *label;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v11[5];
  _QWORD v12[4];
  id v13;
  id from;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  p_label = &self->_label;
  label = self->_label;
  if (!label)
  {
    v5 = objc_alloc_init((Class)off_1E6BCA6E0);
    -[NTKSimpleTextComplicationView _defaultFont](self, "_defaultFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v6);

    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __38__NTKSimpleTextComplicationView_label__block_invoke;
    v17[3] = &unk_1E6BCD7C8;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v5, "setNowProvider:", v17);
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __38__NTKSimpleTextComplicationView_label__block_invoke_2;
    v15[3] = &unk_1E6BCD7F0;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v5, "setNeedsResizeHandler:", v15);
    objc_msgSend(v5, "setTextAlignment:", 1);
    objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 1);
    objc_storeStrong((id *)p_label, v5);
    objc_initWeak(&from, self);
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __38__NTKSimpleTextComplicationView_label__block_invoke_3;
    v12[3] = &unk_1E6BCD7F0;
    objc_copyWeak(&v13, &from);
    objc_msgSend(v5, "setNeedsResizeHandler:", v12);
    -[NTKSimpleTextComplicationView device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_42(v8, (uint64_t)v11);
    objc_msgSend(v5, "setMaxWidth:", v11[4]);

    -[NTKSimpleTextComplicationView timeTravelDate](self, "timeTravelDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInTimeTravel:", v9 != 0);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

    label = *p_label;
  }
  return label;
}

id __38__NTKSimpleTextComplicationView_label__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "timeTravelDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

void __38__NTKSimpleTextComplicationView_label__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

void __38__NTKSimpleTextComplicationView_label__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (id)_defaultFont
{
  void *v2;
  void *v3;
  void *v4;
  _OWORD v6[2];
  uint64_t v7;

  v7 = 0;
  memset(v6, 0, sizeof(v6));
  -[NTKSimpleTextComplicationView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_42(v2, (uint64_t)v6);

  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], *(double *)v6, *MEMORY[0x1E0DC1448]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CLKFontWithAlternativePunctuation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setFont:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[CLKUIColoringLabel font](self->_label, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
  {
    -[CLKUIColoringLabel setFont:](self->_label, "setFont:", v6);
    -[NTKSimpleTextComplicationView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CLKFont)font
{
  return -[CLKUIColoringLabel font](self->_label, "font");
}

- (unint64_t)complicationType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CLKComplicationTemplateSimpleText metadata](self->_template, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NTKSimpleTextComplicationTypeMetadataKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
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

- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;

  objc_storeStrong((id *)&self->_template, a3);
  v6 = a3;
  objc_msgSend(v6, "textProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](self->_label, "setTextProvider:", v7);

  -[NTKSimpleTextComplicationView setNeedsLayout](self, "setNeedsLayout");
}

- (id)complicationTemplate
{
  return self->_template;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return *MEMORY[0x1E0C93EA8] == a3;
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  id v6;
  NSDate *timeTravelDate;
  NSDate *v8;
  _BOOL4 v10;
  CLKUIColoringLabel *label;
  void *v12;
  CLKUIColoringLabel *v13;
  void *v14;
  id v15;

  v6 = a3;
  timeTravelDate = self->_timeTravelDate;
  v15 = v6;
  if (v6)
  {
    if ((objc_msgSend(v6, "isEqual:", timeTravelDate) & 1) != 0)
      goto LABEL_14;
    v8 = self->_timeTravelDate;
    v10 = -[CLKComplicationTemplateSimpleText timeTravelUpdateFrequency](self->_template, "timeTravelUpdateFrequency") == 2
       || v8 == 0;
  }
  else
  {
    if (!timeTravelDate || (objc_msgSend(0, "isEqual:") & 1) != 0)
      goto LABEL_14;
    v10 = 1;
  }
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
  label = self->_label;
  -[NTKSimpleTextComplicationView timeTravelDate](self, "timeTravelDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setInTimeTravel:](label, "setInTimeTravel:", v12 != 0);

  if (v10)
  {
    v13 = self->_label;
    -[CLKComplicationTemplateSimpleText textProvider](self->_template, "textProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextProvider:](v13, "setTextProvider:", v14);

  }
LABEL_14:

}

- (CDComplicationDisplayObserver)displayObserver
{
  return (CDComplicationDisplayObserver *)objc_loadWeakRetained((id *)&self->displayObserver);
}

- (void)setDisplayObserver:(id)a3
{
  objc_storeWeak((id *)&self->displayObserver, a3);
}

- (unint64_t)textLayoutStyle
{
  return self->textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->textLayoutStyle = a3;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (CLKComplicationTemplateSimpleText)template
{
  return self->_template;
}

- (void)setTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_template, a3);
}

- (NSDate)timeTravelDate
{
  return self->_timeTravelDate;
}

- (void)setTimeTravelDate:(id)a3
{
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
  objc_storeStrong((id *)&self->_template, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->displayObserver);
}

@end
