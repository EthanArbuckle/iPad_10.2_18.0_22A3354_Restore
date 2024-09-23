@implementation NTKDualTimeDigitalTicksView

- (NTKDualTimeDigitalTicksView)initWithConfiguration:(id *)a3 timer:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize var1;
  _OWORD v10[3];

  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  var1 = a3->var1;
  v10[0] = a3->var0;
  v10[1] = var1;
  v10[2] = *(_OWORD *)&a3->var2;
  return -[NTKDualTimeDigitalTicksView initWithFrame:configuration:timer:](self, "initWithFrame:configuration:timer:", v10, a4, v4, v5, v6, v7);
}

- (NTKDualTimeDigitalTicksView)initWithFrame:(CGRect)a3 configuration:(id *)a4 timer:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  char *v13;
  NTKDualTimeDigitalTicksView *v14;
  CGSize var0;
  __int128 v16;
  void *v17;
  UIColor *inactiveTickColor;
  uint64_t v19;
  NSCalendar *calendar;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  objc_super v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)NTKDualTimeDigitalTicksView;
  v13 = -[NTKDualTimeDigitalTicksView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v14 = (NTKDualTimeDigitalTicksView *)v13;
  if (v13)
  {
    v13[514] = 0;
    var0 = a4->var0;
    v16 = *(_OWORD *)&a4->var2;
    *(CGSize *)(v13 + 456) = a4->var1;
    *(_OWORD *)(v13 + 472) = v16;
    *(CGSize *)(v13 + 440) = var0;
    v17 = (void *)*((_QWORD *)v13 + 66);
    *((_QWORD *)v13 + 66) = 0;

    inactiveTickColor = v14->_inactiveTickColor;
    v14->_inactiveTickColor = 0;

    objc_storeStrong((id *)&v14->_timer, a5);
    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v19 = objc_claimAutoreleasedReturnValue();
    calendar = v14->_calendar;
    v14->_calendar = (NSCalendar *)v19;

    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v14->_calendar, "setTimeZone:", v21);

    -[NTKDualTimeDigitalTicksView _configureTicks](v14, "_configureTicks");
    objc_msgSend((id)objc_opt_class(), "_sizeFromFrame:", x, y, width, height);
    v14->_lastSize.width = v22;
    v14->_lastSize.height = v23;
  }

  return v14;
}

- (void)setOverrideDate:(id)a3
{
  NSDate *v5;
  NSDate *v6;

  v5 = (NSDate *)a3;
  if (self->_overrideDate != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_overrideDate, a3);
    -[NTKDualTimeDigitalTicksView refreshTicks](self, "refreshTicks");
    v5 = v6;
  }

}

- (void)refreshTicks
{
  -[NTKDualTimeDigitalTicksView _refreshDigitalTicksWithNow:secondFraction:](self, "_refreshDigitalTicksWithNow:secondFraction:", 0, 0.0);
}

- (void)startAnimation
{
  CLKClockTimer *timer;
  CLKClockTimerToken *v4;
  CLKClockTimerToken *clockTimerToken;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, id *);
  void *v9;
  id v10;
  id location;

  if (!self->_clockTimerToken)
  {
    objc_initWeak(&location, self);
    timer = self->_timer;
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __45__NTKDualTimeDigitalTicksView_startAnimation__block_invoke;
    v9 = &unk_1E6BCED08;
    objc_copyWeak(&v10, &location);
    -[CLKClockTimer startUpdatesWithUpdateFrequency:withHandler:identificationLog:](timer, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 2, &v6, &__block_literal_global_73);
    v4 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = v4;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  -[NTKDualTimeDigitalTicksView refreshTicks](self, "refreshTicks", v6, v7, v8, v9);
}

void __45__NTKDualTimeDigitalTicksView_startAnimation__block_invoke(uint64_t a1, void *a2, id *a3)
{
  _BYTE *WeakRetained;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained && !WeakRetained[513] && !WeakRetained[512])
    objc_msgSend(WeakRetained, "_refreshDigitalTicksWithNow:secondFraction:", *a3, *((double *)a3 + 4));

}

const __CFString *__45__NTKDualTimeDigitalTicksView_startAnimation__block_invoke_2()
{
  return CFSTR("NTKDualTimeView");
}

- (void)stopAnimation
{
  CLKClockTimerToken *clockTimerToken;

  if (self->_clockTimerToken)
  {
    -[CLKClockTimer stopUpdatesForToken:](self->_timer, "stopUpdatesForToken:");
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKDualTimeDigitalTicksView;
  -[NTKDualTimeDigitalTicksView layoutSubviews](&v9, sel_layoutSubviews);
  v3 = (void *)objc_opt_class();
  -[NTKDualTimeDigitalTicksView frame](self, "frame");
  objc_msgSend(v3, "_sizeFromFrame:");
  v6 = v5;
  v7 = v4;
  if (self->_lastSize.width != v5 || self->_lastSize.height != v4)
  {
    -[NTKDualTimeDigitalTicksView _configureTicks](self, "_configureTicks");
    self->_lastSize.width = v6;
    self->_lastSize.height = v7;
  }
}

+ (CGSize)_sizeFromFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  double v8;
  double v9;
  CGSize result;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = CGRectGetWidth(a3);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  v8 = CGRectGetHeight(v11);
  v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)_configureTicks
{
  double v3;
  void *v4;
  unint64_t v5;
  double v6;
  void *v7;
  id v8;
  int v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __double2 v18;
  double v19;
  void *v20;
  NSArray *v21;
  NSArray *digitalTicks;
  double v23;
  double v24;
  double height;
  double width;
  double v27;
  CGAffineTransform v28;

  -[NTKDualTimeDigitalTicksView bounds](self, "bounds");
  width = self->_configuration.tickSize.width;
  v27 = v3;
  v24 = self->_configuration.cardinalTickSize.width;
  height = self->_configuration.tickSize.height;
  v23 = self->_configuration.cardinalTickSize.height;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 60);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = 0.0;
  do
  {
    if (v5 >= -[NSArray count](self->_digitalTicks, "count"))
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    else
      -[NSArray objectAtIndexedSubscript:](self->_digitalTicks, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (_disabledLayerActions_onceToken_1 != -1)
      dispatch_once(&_disabledLayerActions_onceToken_1, &__block_literal_global_84);
    objc_msgSend(v7, "setActions:", _disabledLayerActions__dictionary_1);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

    v9 = -15 * ((286331154 * (unint64_t)v5) >> 32) + v5;
    if (v9)
      v10 = height;
    else
      v10 = v23;
    if (v9)
      v11 = width;
    else
      v11 = v24;
    if (v9)
      v12 = 32;
    else
      v12 = 40;
    objc_msgSend(v7, "setBounds:", 0.0, 0.0, v11, v10);
    objc_msgSend(v7, "setCornerRadius:", v11 * 0.5);
    v13 = *(double *)((char *)&self->_configuration.tickSize.width + v12);
    objc_msgSend(v7, "bounds");
    v15 = (v27 - v14 - v13) * 0.5;
    -[NTKDualTimeDigitalTicksView bounds](self, "bounds");
    v17 = v16 * 0.5;
    v18 = __sincos_stret(v6 * 0.104719755 + -1.57079633);
    -[NTKDualTimeDigitalTicksView bounds](self, "bounds");
    objc_msgSend(v7, "setPosition:", v17 + v15 * v18.__cosval, v19 * 0.5 + v15 * v18.__sinval);
    CGAffineTransformMakeRotation(&v28, v6 * 0.104719755 + 3.14159265);
    objc_msgSend(v7, "setAffineTransform:", &v28);
    objc_msgSend(v4, "addObject:", v7);
    -[NTKDualTimeDigitalTicksView layer](self, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSublayer:", v7);

    v6 = (double)++v5;
  }
  while (v5 != 60);
  v21 = (NSArray *)objc_msgSend(v4, "copy");
  digitalTicks = self->_digitalTicks;
  self->_digitalTicks = v21;

}

- (void)_refreshDigitalTicksWithNow:(id)a3 secondFraction:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (self->_activeTickColor && self->_inactiveTickColor)
  {
    -[NTKDualTimeDigitalTicksView _colorizeDigitalTicksWithActiveColor:inactiveColor:now:secondFraction:](self, "_colorizeDigitalTicksWithActiveColor:inactiveColor:now:secondFraction:", a4);
  }
  else
  {
    -[NTKDualTimeDigitalTicksView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NTKDualTimeDigitalTicksView delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activeColorForDualTimeDigitalTicksView:", self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[NTKDualTimeDigitalTicksView delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "inactiveColorForDualTimeDigitalTicksView:", self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[NTKDualTimeDigitalTicksView _colorizeDigitalTicksWithActiveColor:inactiveColor:now:secondFraction:](self, "_colorizeDigitalTicksWithActiveColor:inactiveColor:now:secondFraction:", v8, v10, v11, a4);
    }
  }

}

- (void)_colorizeDigitalTicksWithActiveColor:(id)a3 inactiveColor:(id)a4 now:(id)a5 secondFraction:(double)a6
{
  id v10;
  id v11;
  NSDate *v12;
  uint64_t v13;
  NSDate *overrideDate;
  NSDate *v15;
  NSDate *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSArray *digitalTicks;
  id v22;
  id v23;
  id v24;
  NSDate *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t v30;

  v10 = a3;
  v11 = a4;
  v12 = (NSDate *)a5;
  v25 = v12;
  if (self->_hideActiveTicks)
  {
    v13 = -1;
  }
  else
  {
    overrideDate = self->_overrideDate;
    if (overrideDate || (overrideDate = v12) != 0)
    {
      v15 = overrideDate;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C94130], "now");
      v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;
    -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 128, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v17, "second");

    if (self->_overrideDate)
      a6 = 0.0;

  }
  v18 = v11;
  v19 = v18;
  v20 = v18;
  if (!self->_hideActiveTicks)
  {
    v20 = v18;
    if (!self->_frozen)
    {
      v20 = v18;
      if (!self->_editing)
      {
        v20 = v18;
        if (a6 >= *(double *)off_1E6BC9FD0)
        {
          CLKCompressFraction();
          NTKInterpolateBetweenColors(v19, v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
  }
  digitalTicks = self->_digitalTicks;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __101__NTKDualTimeDigitalTicksView__colorizeDigitalTicksWithActiveColor_inactiveColor_now_secondFraction___block_invoke;
  v26[3] = &unk_1E6BD3460;
  v27 = v20;
  v28 = v10;
  v29 = v19;
  v30 = v13;
  v22 = v19;
  v23 = v10;
  v24 = v20;
  -[NSArray enumerateObjectsUsingBlock:](digitalTicks, "enumerateObjectsUsingBlock:", v26);

}

void __101__NTKDualTimeDigitalTicksView__colorizeDigitalTicksWithActiveColor_inactiveColor_now_secondFraction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  id *v8;
  id v9;

  v9 = a2;
  v5 = *(_QWORD *)(a1 + 56);
  v6 = v5 + 1;
  v7 = v5 < a3;
  v8 = (id *)(a1 + 48);
  if (!v7)
    v8 = (id *)(a1 + 40);
  if (v6 == a3)
    v8 = (id *)(a1 + 32);
  objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(*v8), "CGColor"));

}

- (void)setHideActiveTicks:(BOOL)a3
{
  self->_hideActiveTicks = a3;
  -[NTKDualTimeDigitalTicksView refreshTicks](self, "refreshTicks");
}

- (NTKDualTimeDigitalTicksViewPaletteDelegate)delegate
{
  return (NTKDualTimeDigitalTicksViewPaletteDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (UIColor)activeTickColor
{
  return self->_activeTickColor;
}

- (void)setActiveTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_activeTickColor, a3);
}

- (UIColor)inactiveTickColor
{
  return self->_inactiveTickColor;
}

- (void)setInactiveTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveTickColor, a3);
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (BOOL)hideActiveTicks
{
  return self->_hideActiveTicks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_inactiveTickColor, 0);
  objc_storeStrong((id *)&self->_activeTickColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_digitalTicks, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
