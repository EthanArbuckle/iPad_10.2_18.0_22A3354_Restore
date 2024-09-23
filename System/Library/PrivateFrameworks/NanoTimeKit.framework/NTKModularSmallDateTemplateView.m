@implementation NTKModularSmallDateTemplateView

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
  return !a3 || a3 == 7;
}

- (NTKModularSmallDateTemplateView)initWithFrame:(CGRect)a3
{
  NTKModularSmallDateTemplateView *v3;
  NTKModularSmallDateTemplateView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKModularSmallDateTemplateView;
  v3 = -[NTKModuleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[NTKModularSmallDateTemplateView _configureContentSubviews](v3, "_configureContentSubviews");
  return v4;
}

- (void)_configureContentSubviews
{
  void *v3;
  void *v4;
  void *v5;
  CLKUIColoringLabel *v6;
  CLKUIColoringLabel *weekdayLabel;
  void *v8;
  CLKUIColoringLabel *v9;
  CLKUIColoringLabel *dayLabel;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  -[CLKUIColoringLabel textProvider](self->_weekdayLabel, "textProvider");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel textProvider](self->_dayLabel, "textProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel removeFromSuperview](self->_weekdayLabel, "removeFromSuperview");
  -[CLKUIColoringLabel removeFromSuperview](self->_dayLabel, "removeFromSuperview");
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  -[NTKModuleView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_27(v4, -[NTKComplicationModuleView isXL](self, "isXL"), &v12);

  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NTKModularSmallDateTemplateView _newLabelSubviewWithFont:](self, "_newLabelSubviewWithFont:", v5);
  weekdayLabel = self->_weekdayLabel;
  self->_weekdayLabel = v6;

  -[CLKUIColoringLabel setUppercase:](self->_weekdayLabel, "setUppercase:", 1);
  -[CLKUIColoringLabel setTextProvider:](self->_weekdayLabel, "setTextProvider:", v11);
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", *(double *)&v13, *MEMORY[0x1E0DC1430]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NTKModularSmallDateTemplateView _newLabelSubviewWithFont:](self, "_newLabelSubviewWithFont:", v8);
  dayLabel = self->_dayLabel;
  self->_dayLabel = v9;

  -[CLKUIColoringLabel setTextProvider:](self->_dayLabel, "setTextProvider:", v3);
}

- (void)setIsXL:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKModularSmallDateTemplateView;
  -[NTKComplicationModuleView setIsXL:](&v4, sel_setIsXL_, a3);
  -[NTKModularSmallDateTemplateView _configureContentSubviews](self, "_configureContentSubviews");
  -[NTKModularSmallDateTemplateView _layoutContentView](self, "_layoutContentView");
  -[NTKModuleView _updateColors](self, "_updateColors");
}

- (id)_newLabelSubviewWithFont:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  __int128 v9;
  double v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  v5 = objc_alloc_init((Class)off_1E6BCA6E0);
  objc_msgSend(v5, "setNowProvider:", &__block_literal_global_104);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__NTKModularSmallDateTemplateView__newLabelSubviewWithFont___block_invoke_2;
  v11[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "setNeedsResizeHandler:", v11);
  objc_msgSend(v5, "setFont:", v4);
  -[NTKModuleView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_27(v6, -[NTKComplicationModuleView isXL](self, "isXL"), &v9);
  objc_msgSend(v5, "setMaxWidth:", v10);

  -[NTKModuleView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v5);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v5;
}

uint64_t __60__NTKModularSmallDateTemplateView__newLabelSubviewWithFont___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
}

void __60__NTKModularSmallDateTemplateView__newLabelSubviewWithFont___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(a3, self->_dayLabel);
}

- (void)_enumerateSecondaryForegroundColoringViewsWithBlock:(id)a3
{
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(a3, self->_weekdayLabel);
}

- (void)_layoutContentView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  double v25;
  __int128 v26;
  double v27;

  -[NTKModuleView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");

  -[NTKModuleView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_27(v4, -[NTKComplicationModuleView isXL](self, "isXL"), &v26);
  v22 = v27;

  -[NTKModuleView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_27(v5, -[NTKComplicationModuleView isXL](self, "isXL"), &v24);
  v23 = v25;

  -[CLKUIColoringLabel sizeToFit](self->_weekdayLabel, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_weekdayLabel, "frame");
  -[NTKModuleView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredXInRectForDevice();
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[CLKUIColoringLabel _lastLineBaseline](self->_weekdayLabel, "_lastLineBaseline");
  -[CLKUIColoringLabel setFrame:](self->_weekdayLabel, "setFrame:", v8, v22 - v13, v10, v12);
  -[CLKUIColoringLabel sizeToFit](self->_dayLabel, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_dayLabel, "frame");
  -[NTKModuleView device](self, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredXInRectForDevice();
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[CLKUIColoringLabel _lastLineBaseline](self->_dayLabel, "_lastLineBaseline");
  -[CLKUIColoringLabel setFrame:](self->_dayLabel, "setFrame:", v16, v22 + v23 - v21, v18, v20);
}

- (void)_update
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKModularTemplateView setHighlightMode:](self, "setHighlightMode:", objc_msgSend(v6, "highlightMode"));
  objc_msgSend(v6, "weekdayTextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](self->_weekdayLabel, "setTextProvider:", v3);

  objc_msgSend(v6, "dayTextProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](self->_dayLabel, "setTextProvider:", v4);

  -[NTKModuleView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_weekdayLabel, 0);
}

@end
