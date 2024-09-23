@implementation NTKRichComplicationRectangularDailyGraphView

+ (NSString)dailyFormattedNoData
{
  return (NSString *)NTKClockFaceLocalizedString(CFSTR("DIGITAL_SIGNATURE_LARGE_RECTANGULAR_DAILY_HIGH_LOW_NO_DATA"), CFSTR("--"));
}

+ (CGSize)graphSize
{
  double v2;
  double v3;
  CGSize result;

  if (graphSize_onceToken != -1)
    dispatch_once(&graphSize_onceToken, &__block_literal_global_11);
  v2 = *(double *)&graphSize_Size_0;
  v3 = *(double *)&graphSize_Size_1;
  result.height = v3;
  result.width = v2;
  return result;
}

double __57__NTKRichComplicationRectangularDailyGraphView_graphSize__block_invoke()
{
  void *v0;
  double result;
  __int128 v2;
  __int128 v3;
  uint64_t v4;

  v4 = 0;
  v3 = 0u;
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice", 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_1(v0, (uint64_t)&v2);

  result = *((double *)&v3 + 1);
  graphSize_Size_0 = *((_QWORD *)&v3 + 1);
  graphSize_Size_1 = v4;
  return result;
}

- (NTKRichComplicationRectangularDailyGraphView)init
{
  NTKRichComplicationRectangularDailyGraphView *v2;
  NTKRichComplicationRectangularDailyGraphView *v3;
  uint64_t v4;
  UIColor *noDataTextColor;
  uint64_t v6;
  UIColor *graphLabelAndGridColor;
  CGSize v8;
  uint64_t v9;
  UIColor *accentColor;
  uint64_t v11;
  UIColor *nonAccentColor;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKRichComplicationRectangularDailyGraphView;
  v2 = -[NTKRichComplicationRectangularBaseView init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_timeLabelAndGridAlpha = 0.25;
    v2->_noDataAlpha = 0.5;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.5);
    v4 = objc_claimAutoreleasedReturnValue();
    noDataTextColor = v3->_noDataTextColor;
    v3->_noDataTextColor = (UIColor *)v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, v3->_timeLabelAndGridAlpha);
    v6 = objc_claimAutoreleasedReturnValue();
    graphLabelAndGridColor = v3->_graphLabelAndGridColor;
    v3->_graphLabelAndGridColor = (UIColor *)v6;

    v8 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v3->_cachedBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v3->_cachedBounds.size = v8;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = objc_claimAutoreleasedReturnValue();
    accentColor = v3->_accentColor;
    v3->_accentColor = (UIColor *)v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = objc_claimAutoreleasedReturnValue();
    nonAccentColor = v3->_nonAccentColor;
    v3->_nonAccentColor = (UIColor *)v11;

    -[NTKRichComplicationRectangularDailyGraphView _addSubviews](v3, "_addSubviews");
    -[NTKRichComplicationRectangularDailyGraphView _addConstraints](v3, "_addConstraints");
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  CGContextClearRect(CurrentContext, v18);
  CGContextSetAllowsAntialiasing(CurrentContext, 1);
  -[NTKRichComplicationRectangularDailyGraphView graphRect](self, "graphRect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[NTKRichComplicationRectangularDailyGraphView timeMarkerPadding](self, "timeMarkerPadding");
  -[NTKRichComplicationRectangularDailyGraphView _drawVerticalHourLines:rect:bottomLabelPadding:](self, "_drawVerticalHourLines:rect:bottomLabelPadding:", CurrentContext, v10, v12, v14, v16, v17);
  -[NTKRichComplicationRectangularDailyGraphView drawableGraphRect](self, "drawableGraphRect");
  -[NTKRichComplicationRectangularDailyGraphView drawGraph:rect:](self, "drawGraph:rect:", CurrentContext);
}

- (void)resetToNoDataState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularDailyGraphView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextProvider:", v4);

  -[NTKRichComplicationRectangularDailyGraphView noDataTextColor](self, "noDataTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularDailyGraphView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v6);

  +[NTKRichComplicationRectangularDailyGraphView dailyFormattedNoData](NTKRichComplicationRectangularDailyGraphView, "dailyFormattedNoData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularDailyGraphView dailyHighLabel](self, "dailyHighLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[NTKRichComplicationRectangularDailyGraphView noDataTextColor](self, "noDataTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularDailyGraphView dailyHighLabel](self, "dailyHighLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  +[NTKRichComplicationRectangularDailyGraphView dailyFormattedNoData](NTKRichComplicationRectangularDailyGraphView, "dailyFormattedNoData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularDailyGraphView dailyLowLabel](self, "dailyLowLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  -[NTKRichComplicationRectangularDailyGraphView noDataTextColor](self, "noDataTextColor");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularDailyGraphView dailyLowLabel](self, "dailyLowLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v15);

}

- (void)_addConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  _QWORD v39[5];
  id v40;
  double v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = 0;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v48 = 0u;
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_1(v3, (uint64_t)&v48);

  -[NTKRichComplicationRectangularDailyGraphView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularDailyGraphView leadingAnchor](self, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularBaseView contentMargin](self, "contentMargin");
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6);
  v38 = (id)objc_claimAutoreleasedReturnValue();

  -[NTKRichComplicationRectangularDailyGraphView trailingAnchor](self, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularDailyGraphView titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularBaseView contentMargin](self, "contentMargin");
  objc_msgSend(v7, "constraintGreaterThanOrEqualToAnchor:constant:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = 1148829696;
  objc_msgSend(v10, "setPriority:", v11);
  -[NTKRichComplicationRectangularDailyGraphView titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstBaselineAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularDailyGraphView topAnchor](self, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, *((double *)&v48 + 1));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKRichComplicationRectangularDailyGraphView dailyHighLabel](self, "dailyHighLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularDailyGraphView leadingAnchor](self, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularBaseView contentMargin](self, "contentMargin");
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKRichComplicationRectangularDailyGraphView dailyHighLabel](self, "dailyHighLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstBaselineAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularDailyGraphView topAnchor](self, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, *((double *)&v49 + 1));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKRichComplicationRectangularDailyGraphView dailyLowLabel](self, "dailyLowLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularDailyGraphView dailyHighLabel](self, "dailyHighLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKRichComplicationRectangularDailyGraphView dailyLowLabel](self, "dailyLowLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "firstBaselineAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularDailyGraphView dailyHighLabel](self, "dailyHighLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "firstBaselineAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, *((double *)&v50 + 1));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v38, v10, v37, v18, v22, v27, v32, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = *((double *)&v52 + 1) * 0.25;
  -[NTKRichComplicationRectangularDailyGraphView timeMarkerLabels](self, "timeMarkerLabels");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __63__NTKRichComplicationRectangularDailyGraphView__addConstraints__block_invoke;
  v39[3] = &unk_1E6BCEC90;
  v41 = v34;
  v44 = v50;
  v45 = v51;
  v46 = v52;
  v47 = v53;
  v42 = v48;
  v43 = v49;
  v39[4] = self;
  v40 = v33;
  v36 = v33;
  objc_msgSend(v35, "enumerateObjectsUsingBlock:", v39);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v36);
}

void __63__NTKRichComplicationRectangularDailyGraphView__addConstraints__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a2;
  v5 = 0.0;
  if (a3)
    v5 = 1.0;
  v6 = 2.0 - v5;
  v7 = 2.0 - v5 + (double)a3 * *(double *)(a1 + 48);
  if ((CLKLayoutIsRTL() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "contentMargin");
    v9 = v7 + v8;
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v24, "leftAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);
  }
  else
  {
    v13 = *(double *)(a1 + 128);
    objc_msgSend(*(id *)(a1 + 32), "contentMargin");
    v9 = v13 + v14 - v7;
    v10 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "rightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v24;
  }
  objc_msgSend(v12, "leftAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v15, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v16);

  v17 = *(void **)(a1 + 40);
  objc_msgSend(v24, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToConstant:", *(double *)(a1 + 48) + v6 * -2.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v19);

  v20 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstBaselineAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, *(double *)(a1 + 112));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v23);

}

- (void)_addSubviews
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  CLKUIColoringLabel *v7;
  void *v8;
  CLKUIColoringLabel *titleLabel;
  UILabel *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  UILabel *dailyHighLabel;
  UILabel *v16;
  void *v17;
  void *v18;
  void *v19;
  UILabel *dailyLowLabel;
  uint64_t v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  NSArray *v27;
  NSArray *timeMarkerLabels;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = 0;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_1(v3, (uint64_t)&v29);

  v4 = (_QWORD *)MEMORY[0x1E0C940A8];
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], *(double *)&v29, *MEMORY[0x1E0DC1438]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CLKFontWithLocalizedSmallCaps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (CLKUIColoringLabel *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](v7, "setTextColor:", v8);

  -[CLKUIColoringLabel setFont:](v7, "setFont:", v6);
  -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CLKUIColoringLabel setUsesTextProviderTintColoring:](v7, "setUsesTextProviderTintColoring:", 1);
  -[CLKUIColoringLabel setTwoToneStyleInMonochrome:](v7, "setTwoToneStyleInMonochrome:", 1);
  -[CLKUIColoringLabel setFilterProvider:](v7, "setFilterProvider:", self);
  -[NTKRichComplicationRectangularDailyGraphView addSubview:](self, "addSubview:", v7);

  titleLabel = self->_titleLabel;
  self->_titleLabel = v7;

  v10 = (UILabel *)objc_opt_new();
  v11 = *MEMORY[0x1E0DC1448];
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *v4, *(double *)&v30, *MEMORY[0x1E0DC1448]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "CLKFontWithAlternativePunctuation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v10, "setFont:", v13);

  -[NTKRichComplicationRectangularDailyGraphView accentColor](self, "accentColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v10, "setTextColor:", v14);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[NTKRichComplicationRectangularDailyGraphView addSubview:](self, "addSubview:", v10);
  dailyHighLabel = self->_dailyHighLabel;
  self->_dailyHighLabel = v10;

  v16 = (UILabel *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *v4, *(double *)&v31, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "CLKFontWithAlternativePunctuation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v16, "setFont:", v18);

  -[NTKRichComplicationRectangularDailyGraphView accentColor](self, "accentColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v16, "setTextColor:", v19);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[NTKRichComplicationRectangularDailyGraphView addSubview:](self, "addSubview:", v16);
  dailyLowLabel = self->_dailyLowLabel;
  self->_dailyLowLabel = v16;

  v21 = 4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(double *)&v32;
  do
  {
    v24 = (void *)objc_opt_new();
    objc_msgSend(v24, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *v4, v23, v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v25);

    objc_msgSend(v24, "setMinimumScaleFactor:", 0.85);
    -[NTKRichComplicationRectangularDailyGraphView graphLabelAndGridColor](self, "graphLabelAndGridColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTextColor:", v26);

    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v24, "setTextAlignment:", 0);
    -[NTKRichComplicationRectangularDailyGraphView addSubview:](self, "addSubview:", v24);
    objc_msgSend(v22, "addObject:", v24);

    --v21;
  }
  while (v21);
  v27 = (NSArray *)objc_msgSend(v22, "copy");

  timeMarkerLabels = self->_timeMarkerLabels;
  self->_timeMarkerLabels = v27;

}

- (double)_calculateGraphXBasedOnRect:(CGRect)a3 constants:(id *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double result;
  double v11;
  double v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((CLKLayoutIsRTL() & 1) != 0)
  {
    -[NTKRichComplicationRectangularBaseView contentMargin](self, "contentMargin");
  }
  else
  {
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    v11 = CGRectGetWidth(v13);
    -[NTKRichComplicationRectangularBaseView contentMargin](self, "contentMargin");
    return v11 - (v12 + a4->var9);
  }
  return result;
}

- (id)_datesForGraphInTimezone:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[3];
  int v20;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsInTimeZone:fromDate:", v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", (double)objc_msgSend(v6, "minute") * -60.0+ (double)objc_msgSend(v6, "hour") * -3600.0- (double)objc_msgSend(v6, "second")+ -1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 192, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSecond:", 0);
  objc_msgSend(v8, "setMinute:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __73__NTKRichComplicationRectangularDailyGraphView__datesForGraphInTimezone___block_invoke;
  v16 = &unk_1E6BCECB8;
  v10 = v9;
  v17 = v10;
  v18 = v19;
  objc_msgSend(v5, "enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:", v7, v8, 2, &v13);
  v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16);

  _Block_object_dispose(v19, 8);
  return v11;
}

uint64_t __73__NTKRichComplicationRectangularDailyGraphView__datesForGraphInTimezone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v7;
  int v8;

  result = objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(_DWORD *)(v7 + 24);
  *(_DWORD *)(v7 + 24) = v8 + 1;
  if (v8 >= 23)
    *a4 = 1;
  return result;
}

- (void)_drawVerticalHourLines:(CGContext *)a3 rect:(CGRect)a4 bottomLabelPadding:(double)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v12;
  unint64_t v13;
  double v14;
  double v15;
  unint64_t v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  CGContextSaveGState(a3);
  CGContextSetLineWidth(a3, 1.0);
  -[NTKRichComplicationRectangularDailyGraphView graphLabelAndGridColor](self, "graphLabelAndGridColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(v12, "CGColor"));

  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v13 = 0;
  v14 = CGRectGetHeight(v20) - a5;
  do
  {
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v15 = CGRectGetWidth(v21);
    HIDWORD(v16) = -1431655765 * v13;
    LODWORD(v16) = HIDWORD(v16);
    v17 = v14;
    if ((v16 >> 1) <= 0x2AAAAAAA)
    {
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v17 = CGRectGetHeight(v22);
    }
    v18 = x + (double)v13 / 24.0 * v15;
    v19 = y + v17;
    CGContextBeginPath(a3);
    CGContextMoveToPoint(a3, v18, y);
    CGContextAddLineToPoint(a3, v18, v19);
    CGContextStrokePath(a3);
    ++v13;
  }
  while (v13 != 25);
  CGContextRestoreGState(a3);
}

- (double)_lineStrokeWidthGivenRect:(CGRect)a3
{
  return (CGRectGetWidth(a3) + -25.0) / 24.0;
}

- (void)_updateTimeMarkerLabelsForDates:(id)a3 timezone:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  id v35;

  v35 = a3;
  v6 = a4;
  if (!_updateTimeMarkerLabelsForDates_timezone__TimeFormatter)
  {
    v7 = objc_opt_new();
    v8 = (void *)_updateTimeMarkerLabelsForDates_timezone__TimeFormatter;
    _updateTimeMarkerLabelsForDates_timezone__TimeFormatter = v7;

  }
  v9 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredLocalizations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localeWithLocaleIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "languageCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(CFSTR("zh"), "isEqualToString:", v14);

  if ((_DWORD)v11)
    v15 = CFSTR("J");
  else
    v15 = CFSTR("j");
  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", v15, 0, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_updateTimeMarkerLabelsForDates_timezone__TimeFormatter, "setDateFormat:", v16);

  v34 = v6;
  objc_msgSend((id)_updateTimeMarkerLabelsForDates_timezone__TimeFormatter, "setTimeZone:", v6);
  v17 = objc_msgSend(v35, "count");
  -[NTKRichComplicationRectangularDailyGraphView timeMarkerLabels](self, "timeMarkerLabels");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  -[NTKRichComplicationRectangularDailyGraphView timeMarkerLabels](self, "timeMarkerLabels");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    v22 = 0;
    v23 = v17 / v19;
    do
    {
      objc_msgSend(v35, "objectAtIndexedSubscript:", v22 * v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_updateTimeMarkerLabelsForDates_timezone__TimeFormatter, "stringFromDate:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "uppercaseStringWithLocale:", v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "languageCode");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(CFSTR("hi"), "isEqualToString:", v27);

      if ((v28 & 1) == 0)
      {
        objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E6BDC918);
        v29 = objc_claimAutoreleasedReturnValue();

        v26 = (void *)v29;
      }
      -[NTKRichComplicationRectangularDailyGraphView timeMarkerLabels](self, "timeMarkerLabels");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", v22);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setText:", v26);

      ++v22;
      -[NTKRichComplicationRectangularDailyGraphView timeMarkerLabels](self, "timeMarkerLabels");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

    }
    while (v22 < v33);
  }

}

- (void)_applyPausedUpdate
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = -[CDRichComplicationView paused](self, "paused");
  -[NTKRichComplicationRectangularDailyGraphView titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaused:", v3);

}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "metadata");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NTKDailyGraphRichComplicationMetadataKeyTimeZone"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[NTKRichComplicationRectangularDailyGraphView _datesForGraphInTimezone:](self, "_datesForGraphInTimezone:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularDailyGraphView _updateTimeMarkerLabelsForDates:timezone:](self, "_updateTimeMarkerLabelsForDates:timezone:", v9, v8);

  -[NTKRichComplicationRectangularDailyGraphView loadWithMetadata:](self, "loadWithMetadata:", v10);
}

- (CGRect)drawableGraphRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int IsRTL;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[NTKRichComplicationRectangularDailyGraphView graphRect](self, "graphRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  IsRTL = CLKLayoutIsRTL();
  v12 = -0.5;
  if (IsRTL)
    v12 = 0.5;
  v13 = v4 + v12;
  -[NTKRichComplicationRectangularDailyGraphView timeMarkerPadding](self, "timeMarkerPadding");
  v15 = v10 - v14;
  v16 = v13;
  v17 = v6;
  v18 = v8;
  result.size.height = v15;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)graphRect
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double x;
  double y;
  double width;
  double height;
  _OWORD v30[5];
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  double v37;
  CGRect v38;
  CGRect v39;
  CGRect result;
  CGRect v41;

  -[NTKRichComplicationRectangularDailyGraphView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NTKRichComplicationRectangularDailyGraphView cachedBounds](self, "cachedBounds");
  v41.origin.x = v11;
  v41.origin.y = v12;
  v41.size.width = v13;
  v41.size.height = v14;
  v38.origin.x = v4;
  v38.origin.y = v6;
  v38.size.width = v8;
  v38.size.height = v10;
  if (!CGRectEqualToRect(v38, v41))
  {
    -[NTKRichComplicationRectangularDailyGraphView bounds](self, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v37 = 0.0;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v32 = 0u;
    -[CDRichComplicationView device](self, "device");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_1(v23, (uint64_t)&v32);

    v30[2] = v34;
    v30[3] = v35;
    v30[4] = v36;
    v31 = v37;
    v30[0] = v32;
    v30[1] = v33;
    -[NTKRichComplicationRectangularDailyGraphView _calculateGraphXBasedOnRect:constants:](self, "_calculateGraphXBasedOnRect:constants:", v30, v16, v18, v20, v22);
    v25 = v24;
    v39.origin.x = v16;
    v39.origin.y = v18;
    v39.size.width = v20;
    v39.size.height = v22;
    -[NTKRichComplicationRectangularDailyGraphView setGraphRect:](self, "setGraphRect:", v25, CGRectGetHeight(v39) - (*((double *)&v35 + 1) + v37), *((double *)&v36 + 1));
    -[NTKRichComplicationRectangularDailyGraphView setCachedBounds:](self, "setCachedBounds:", v16, v18, v20, v22);
  }
  x = self->_graphRect.origin.x;
  y = self->_graphRect.origin.y;
  width = self->_graphRect.size.width;
  height = self->_graphRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)timeMarkerPadding
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  CGRect v11;

  v10 = 0;
  v9 = 0u;
  -[CDRichComplicationView device](self, "device", 0, 0, 0, 0, 0, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_1(v3, (uint64_t)&v8);

  -[NTKRichComplicationRectangularDailyGraphView timeMarkerLabels](self, "timeMarkerLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v6 = CGRectGetHeight(v11) - *(double *)&v9;

  return v6;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v4;
  UIColor *v5;
  UIColor *accentColor;
  void *v7;
  UIColor *v8;
  UIColor *nonAccentColor;
  UIColor *v10;
  UIColor *noDataTextColor;
  UIColor *v12;
  UIColor *graphLabelAndGridColor;
  void *v14;
  UIColor *v15;
  void *v16;
  UIColor *v17;
  void *v18;
  _QWORD v19[5];

  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_titleLabel, "transitionToMonochromeWithFraction:style:", 2, a3);
  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorForView:accented:", self, 1);
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  accentColor = self->_accentColor;
  self->_accentColor = v5;

  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorForView:accented:", self, 0);
  v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
  nonAccentColor = self->_nonAccentColor;
  self->_nonAccentColor = v8;

  -[UIColor colorWithAlphaComponent:](self->_nonAccentColor, "colorWithAlphaComponent:", self->_noDataAlpha);
  v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
  noDataTextColor = self->_noDataTextColor;
  self->_noDataTextColor = v10;

  -[UIColor colorWithAlphaComponent:](self->_nonAccentColor, "colorWithAlphaComponent:", self->_timeLabelAndGridAlpha);
  v12 = (UIColor *)objc_claimAutoreleasedReturnValue();
  graphLabelAndGridColor = self->_graphLabelAndGridColor;
  self->_graphLabelAndGridColor = v12;

  -[NTKRichComplicationRectangularDailyGraphView timeMarkerLabels](self, "timeMarkerLabels");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__NTKRichComplicationRectangularDailyGraphView_transitionToMonochromeWithFraction___block_invoke;
  v19[3] = &unk_1E6BCECE0;
  v19[4] = self;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v19);

  v15 = self->_accentColor;
  -[NTKRichComplicationRectangularDailyGraphView dailyLowLabel](self, "dailyLowLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v15);

  v17 = self->_accentColor;
  -[NTKRichComplicationRectangularDailyGraphView dailyHighLabel](self, "dailyHighLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v17);

  -[NTKRichComplicationRectangularDailyGraphView setNeedsDisplay](self, "setNeedsDisplay");
}

void __83__NTKRichComplicationRectangularDailyGraphView_transitionToMonochromeWithFraction___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "graphLabelAndGridColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

}

- (void)updateMonochromeColor
{
  void *v3;
  UIColor *v4;
  UIColor *accentColor;
  void *v6;
  UIColor *v7;
  UIColor *nonAccentColor;
  UIColor *v9;
  UIColor *noDataTextColor;
  UIColor *v11;
  UIColor *graphLabelAndGridColor;
  void *v13;
  UIColor *v14;
  void *v15;
  UIColor *v16;
  void *v17;
  _QWORD v18[5];

  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_titleLabel, "updateMonochromeColorWithStyle:", 2);
  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorForView:accented:", self, 1);
  v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  accentColor = self->_accentColor;
  self->_accentColor = v4;

  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorForView:accented:", self, 0);
  v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
  nonAccentColor = self->_nonAccentColor;
  self->_nonAccentColor = v7;

  -[UIColor colorWithAlphaComponent:](self->_nonAccentColor, "colorWithAlphaComponent:", self->_noDataAlpha);
  v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
  noDataTextColor = self->_noDataTextColor;
  self->_noDataTextColor = v9;

  -[UIColor colorWithAlphaComponent:](self->_nonAccentColor, "colorWithAlphaComponent:", self->_timeLabelAndGridAlpha);
  v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  graphLabelAndGridColor = self->_graphLabelAndGridColor;
  self->_graphLabelAndGridColor = v11;

  -[NTKRichComplicationRectangularDailyGraphView timeMarkerLabels](self, "timeMarkerLabels");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__NTKRichComplicationRectangularDailyGraphView_updateMonochromeColor__block_invoke;
  v18[3] = &unk_1E6BCECE0;
  v18[4] = self;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v18);

  v14 = self->_accentColor;
  -[NTKRichComplicationRectangularDailyGraphView dailyLowLabel](self, "dailyLowLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v14);

  v16 = self->_accentColor;
  -[NTKRichComplicationRectangularDailyGraphView dailyHighLabel](self, "dailyHighLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextColor:", v16);

  -[NTKRichComplicationRectangularDailyGraphView setNeedsDisplay](self, "setNeedsDisplay");
}

void __69__NTKRichComplicationRectangularDailyGraphView_updateMonochromeColor__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "graphLabelAndGridColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

}

- (CLKUIColoringLabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)dailyHighLabel
{
  return self->_dailyHighLabel;
}

- (UILabel)dailyLowLabel
{
  return self->_dailyLowLabel;
}

- (UIColor)accentColor
{
  return self->_accentColor;
}

- (void)setAccentColor:(id)a3
{
  objc_storeStrong((id *)&self->_accentColor, a3);
}

- (UIColor)nonAccentColor
{
  return self->_nonAccentColor;
}

- (void)setNonAccentColor:(id)a3
{
  objc_storeStrong((id *)&self->_nonAccentColor, a3);
}

- (CGRect)cachedBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cachedBounds.origin.x;
  y = self->_cachedBounds.origin.y;
  width = self->_cachedBounds.size.width;
  height = self->_cachedBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedBounds:(CGRect)a3
{
  self->_cachedBounds = a3;
}

- (void)setGraphRect:(CGRect)a3
{
  self->_graphRect = a3;
}

- (UIColor)noDataTextColor
{
  return self->_noDataTextColor;
}

- (UIColor)graphLabelAndGridColor
{
  return self->_graphLabelAndGridColor;
}

- (NSArray)timeMarkerLabels
{
  return self->_timeMarkerLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeMarkerLabels, 0);
  objc_storeStrong((id *)&self->_graphLabelAndGridColor, 0);
  objc_storeStrong((id *)&self->_noDataTextColor, 0);
  objc_storeStrong((id *)&self->_nonAccentColor, 0);
  objc_storeStrong((id *)&self->_accentColor, 0);
  objc_storeStrong((id *)&self->_dailyLowLabel, 0);
  objc_storeStrong((id *)&self->_dailyHighLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
