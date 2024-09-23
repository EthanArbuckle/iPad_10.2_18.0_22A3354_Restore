@implementation NTKWorldClockRichComplicationHandsBaseView

- (id)initForDevice:(id)a3
{
  id v4;
  double *v5;
  double *v6;
  double *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NTKWorldClockRichComplicationHandsBaseView;
  v5 = -[NTKAnalogHandsView initForDevice:](&v20, sel_initForDevice_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5 + 78;
    _LayoutConstants_35(v4, objc_msgSend(v5, "complicationFamily"), (uint64_t)&v17);
    *(_QWORD *)v7 = v17;
    v8 = v18;
    v18 = 0;
    v9 = (void *)*((_QWORD *)v6 + 79);
    *((_QWORD *)v6 + 79) = v8;

    v10 = v19;
    v19 = 0;
    v11 = (void *)*((_QWORD *)v6 + 80);
    *((_QWORD *)v6 + 80) = v10;

    objc_msgSend(v6, "setMinuteHandDotDiameter:", *v7);
    objc_msgSend(v6, "minuteHandDot");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.898039222, 0.427450985, 0.0, 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v13);

    *((_BYTE *)v6 + 648) = NTKShowGossamerUI(v4);
    objc_msgSend(v6, "minuteHandDot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", *((unsigned __int8 *)v6 + 648));

    objc_msgSend(v6, "secondHandDot");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", *((unsigned __int8 *)v6 + 648));

  }
  return v6;
}

- (id)hourHandConfiguration
{
  void *v3;
  id v4;
  _BYTE v6[8];
  id v7;
  id v8;

  -[CLKUIAnalogHandsView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_35(v3, -[NTKWorldClockRichComplicationHandsBaseView complicationFamily](self, "complicationFamily"), (uint64_t)v6);
  v4 = v7;

  return v4;
}

- (id)minuteHandConfiguration
{
  void *v3;
  id v4;
  _BYTE v6[8];
  id v7;
  id v8;

  -[CLKUIAnalogHandsView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_35(v3, -[NTKWorldClockRichComplicationHandsBaseView complicationFamily](self, "complicationFamily"), (uint64_t)v6);
  v4 = v8;

  return v4;
}

- (id)secondHandConfiguration
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  id v12;
  id v13;

  -[CLKUIAnalogHandsView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0.0;
  v12 = 0;
  v13 = 0;
  _LayoutConstants_35(v3, -[NTKWorldClockRichComplicationHandsBaseView complicationFamily](self, "complicationFamily"), (uint64_t)&v11);
  if (-[NTKWorldClockRichComplicationHandsBaseView complicationFamily](self, "complicationFamily") == 10)
  {
    -[CLKUIAnalogHandsView device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E6BCA6C0, "defaultSubdialConfigurationForDevice:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setExcludePeg:", 0);
    objc_msgSend(v13, "handLength");
    objc_msgSend(v5, "setHandLength:");
  }
  else
  {
    v5 = objc_alloc_init((Class)off_1E6BCA6C0);
    objc_msgSend(v5, "setType:", 1);
    objc_msgSend(v13, "handLength");
    v7 = v6;
    objc_msgSend(v13, "handWidth");
    v9 = v8;
    objc_msgSend(v5, "setTailLength:", floor(v7 / 3.0));
    objc_msgSend(v5, "setPegRadius:", round(v11 / 3.0));
    objc_msgSend(v5, "setPegStrokeWidth:", ceil(v9 / 5.0));
    objc_msgSend(v5, "setExcludePeg:", 0);
    objc_msgSend(v5, "setHandLength:", v7);
    objc_msgSend(v5, "setHandWidth:", ceil(v9 / 3.0));
    objc_msgSend(v5, "setRoundedSecondHand:", 1);
  }

  return v5;
}

+ (BOOL)showsSecondHand
{
  return 0;
}

- (id)createSecondHandView
{
  void *v3;
  objc_super v5;

  if (objc_msgSend((id)objc_opt_class(), "showsSecondHand"))
  {
    v5.receiver = self;
    v5.super_class = (Class)NTKWorldClockRichComplicationHandsBaseView;
    -[CLKUIAnalogHandsView createSecondHandView](&v5, sel_createSecondHandView);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (double)_timeAnimationFramesPerSecondForDevice:(id)a3
{
  return 6.0;
}

- (void)layoutHandViews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKWorldClockRichComplicationHandsBaseView;
  -[CLKUIAnalogHandsView layoutHandViews](&v10, sel_layoutHandViews);
  -[NTKWorldClockRichComplicationHandsBaseView bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[NTKWorldClockRichComplicationHandsBaseView bounds](self, "bounds");
  v6 = v5 * 0.5;
  -[CLKUIAnalogHandsView hourHandView](self, "hourHandView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCenter:", v4, v6);

  -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCenter:", v4, v6);

  -[CLKUIAnalogHandsView secondHandView](self, "secondHandView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCenter:", v4, v6);

}

- (void)setFilterProvider:(id)a3
{
  CLKMonochromeFilterProvider **p_filterProvider;
  id v5;
  void *v6;
  id v7;

  p_filterProvider = &self->_filterProvider;
  v5 = a3;
  objc_storeWeak((id *)p_filterProvider, v5);
  if (objc_msgSend((id)objc_opt_class(), "showsSecondHand"))
  {
    -[CLKUIAnalogHandsView secondHandView](self, "secondHandView");
  }
  else
  {
    -[CLKUIAnalogHandsView hourHandView](self, "hourHandView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilterProvider:", v5);

    -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
  }
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilterProvider:", v5);

}

- (int64_t)displayedHour
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[NTKAnalogHandsView overrideDate](self, "overrideDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NTKAnalogHandsView displayTime](self, "displayTime");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  -[CLKUIAnalogHandsView calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "component:fromDate:", 32, v6);

  return v8;
}

- (UIColor)pegDotColor
{
  void *v2;
  void *v3;

  -[CLKUIAnalogHandsView minuteHandDot](self, "minuteHandDot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setPegDotColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CLKUIAnalogHandsView minuteHandDot](self, "minuteHandDot");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void).cxx_destruct
{
  NTKWorldClockRichComplicationHandsBaseView *v2;

  v2 = self;
  objc_destroyWeak((id *)&self->_filterProvider);
  v2 = (NTKWorldClockRichComplicationHandsBaseView *)((char *)v2 + 624);

}

- (int64_t)complicationFamily
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 10;
}

@end
