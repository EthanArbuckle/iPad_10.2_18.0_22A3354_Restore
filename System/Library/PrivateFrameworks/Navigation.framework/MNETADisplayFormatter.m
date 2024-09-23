@implementation MNETADisplayFormatter

- (MNETADisplayFormatter)initWithTimeZone:(id)a3
{
  id v5;
  MNETADisplayFormatter *v6;
  MNETADisplayFormatter *v7;
  MNETADisplayFormatter *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNETADisplayFormatter;
  v6 = -[MNETADisplayFormatter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_timeZone, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MNWeakTimer invalidate](self->_updateTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MNETADisplayFormatter;
  -[MNETADisplayFormatter dealloc](&v3, sel_dealloc);
}

- (void)setRemainingTimeToEndOfRoute:(double)a3
{
  self->_remainingTimeToEndOfRoute = a3;
  -[MNETADisplayFormatter _updateDisplayETA](self, "_updateDisplayETA");
}

- (void)setRemainingTimeToEndOfLeg:(double)a3
{
  self->_remainingTimeToEndOfLeg = a3;
  -[MNETADisplayFormatter _updateDisplayETA](self, "_updateDisplayETA");
}

- (void)_updateDisplayETA
{
  double v3;
  double v4;
  NSDate *v5;
  double v6;
  double v7;
  NSDate *v8;
  NSDate *displayETAToEndOfLeg;
  id WeakRetained;
  NSDate *v11;
  NSDate *displayETAToEndOfRoute;
  MNDisplayETAInfo *v13;

  -[MNETADisplayFormatter _displayTimeIntervalForTimeInterval:](self, "_displayTimeIntervalForTimeInterval:", self->_remainingTimeToEndOfLeg);
  v4 = v3;
  -[MNETADisplayFormatter _displayDateWithRemainingTime:](self, "_displayDateWithRemainingTime:");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  -[MNETADisplayFormatter _displayTimeIntervalForTimeInterval:](self, "_displayTimeIntervalForTimeInterval:", self->_remainingTimeToEndOfRoute);
  v7 = v6;
  -[MNETADisplayFormatter _displayDateWithRemainingTime:](self, "_displayDateWithRemainingTime:");
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v13 = -[MNDisplayETAInfo initWithDisplayETAToEndOfLeg:displayRemainingMinutesToEndOfLeg:displayETAToEndOfRoute:displayRemainingMinutesToEndOfRoute:]([MNDisplayETAInfo alloc], "initWithDisplayETAToEndOfLeg:displayRemainingMinutesToEndOfLeg:displayETAToEndOfRoute:displayRemainingMinutesToEndOfRoute:", v5, (unint64_t)v4, v8, (unint64_t)v7);
  if (self->_displayETAToEndOfLeg != v5
    || self->_displayRemainingTimeToEndOfLeg != v4
    || self->_displayETAToEndOfRoute != v8
    || (displayETAToEndOfLeg = v5, self->_displayRemainingTimeToEndOfRoute != v7))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "etaDisplayFormatter:didUpdateDisplayETA:", self, v13);

    displayETAToEndOfLeg = self->_displayETAToEndOfLeg;
  }
  self->_displayRemainingTimeToEndOfLeg = v4;
  self->_displayETAToEndOfLeg = v5;
  v11 = v5;

  self->_displayRemainingTimeToEndOfRoute = v7;
  displayETAToEndOfRoute = self->_displayETAToEndOfRoute;
  self->_displayETAToEndOfRoute = v8;

  if (!self->_updateTimer)
    -[MNETADisplayFormatter _scheduleUpdateTimer](self, "_scheduleUpdateTimer");

}

- (void)_scheduleUpdateTimer
{
  void *v3;
  double v4;
  double v5;
  MNWeakTimer *v6;
  MNWeakTimer *updateTimer;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  +[MNWeakTimer scheduledTimerWithTimeInterval:target:selector:](MNWeakTimer, "scheduledTimerWithTimeInterval:target:selector:", self, sel__updateTimerFired, 60.0 - (double)((unint64_t)v5 % 0x3C));
  v6 = (MNWeakTimer *)objc_claimAutoreleasedReturnValue();
  updateTimer = self->_updateTimer;
  self->_updateTimer = v6;

}

- (void)_updateTimerFired
{
  MNWeakTimer *updateTimer;

  -[MNWeakTimer invalidate](self->_updateTimer, "invalidate");
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

  -[MNETADisplayFormatter _updateDisplayETA](self, "_updateDisplayETA");
}

- (double)_displayTimeIntervalForTimeInterval:(double)a3
{
  return ceil(a3 / 60.0) * 60.0;
}

- (id)_displayDateWithRemainingTime:(double)a3
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = floor(v5 / 60.0) * 60.0;

  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v6 + a3);
}

- (MNETADisplayFormatterDelegate)delegate
{
  return (MNETADisplayFormatterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)remainingTimeToEndOfRoute
{
  return self->_remainingTimeToEndOfRoute;
}

- (double)remainingTimeToEndOfLeg
{
  return self->_remainingTimeToEndOfLeg;
}

- (double)displayRemainingTimeToEndOfLeg
{
  return self->_displayRemainingTimeToEndOfLeg;
}

- (NSDate)displayETAToEndOfLeg
{
  return self->_displayETAToEndOfLeg;
}

- (double)displayRemainingTimeToEndOfRoute
{
  return self->_displayRemainingTimeToEndOfRoute;
}

- (NSDate)displayETAToEndOfRoute
{
  return self->_displayETAToEndOfRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayETAToEndOfRoute, 0);
  objc_storeStrong((id *)&self->_displayETAToEndOfLeg, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
