@implementation NTKRichComplicationCircularMonogramView

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
  void *v5;
  void *v6;

  objc_msgSend(a3, "textProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](self->_textLabel, "setTextProvider:", v5);

  -[NTKRichComplicationCircularMonogramView _labelFont](self, "_labelFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setFont:](self->_textLabel, "setFont:", v6);

  -[NTKRichComplicationCircularMonogramView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_labelFont
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  unint64_t v10;
  double v11;
  void *v12;
  void *v13;

  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _LayoutConstants_44(v3);
  v6 = v5;
  v8 = v7;

  -[CLKUIColoringLabel text](self->_textLabel, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10 == 2)
    v11 = v6;
  else
    v11 = v4;
  if (v10 > 2)
    v11 = v8;
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], v11, *MEMORY[0x1E0DC1448]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "CLKFontWithAlternativePunctuation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_createLabelViewWithFont:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc_init((Class)off_1E6BCA6E0);
  objc_msgSend(v5, "setInTimeTravel:", 0);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__NTKRichComplicationCircularMonogramView__createLabelViewWithFont___block_invoke;
  v13[3] = &unk_1E6BCD7C8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v5, "setNowProvider:", v13);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __68__NTKRichComplicationCircularMonogramView__createLabelViewWithFont___block_invoke_2;
  v11[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "setNeedsResizeHandler:", v11);
  -[CDRichComplicationView device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_44(v7);
  objc_msgSend(v5, "setMaxWidth:", v8);

  objc_msgSend(v5, "setUppercase:", 1);
  objc_msgSend(v5, "setFont:", v4);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v9);

  objc_storeStrong((id *)&self->_textLabel, v5);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v5;
}

id __68__NTKRichComplicationCircularMonogramView__createLabelViewWithFont___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = (id)MEMORY[0x1E0C944A0];
  objc_msgSend(WeakRetained, "complicationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __68__NTKRichComplicationCircularMonogramView__createLabelViewWithFont___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
