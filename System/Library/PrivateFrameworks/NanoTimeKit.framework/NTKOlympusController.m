@implementation NTKOlympusController

- (NTKOlympusController)initWithFaceView:(id)a3 olympusView:(id)a4
{
  id v6;
  id v7;
  NTKOlympusController *v8;
  NTKOlympusController *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKOlympusController;
  v8 = -[NTKOlympusController init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_faceView, v6);
    objc_storeWeak((id *)&v9->_olympusView, v7);
    -[NTKOlympusController _startClockUpdates](v9, "_startClockUpdates");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__handleSignificantTimeChanged, *MEMORY[0x1E0DC4838], 0);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NTKOlympusController _stopClockUpdates](self, "_stopClockUpdates");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4838], 0);

  v4.receiver = self;
  v4.super_class = (Class)NTKOlympusController;
  -[NTKOlympusController dealloc](&v4, sel_dealloc);
}

- (void)applyDataMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
      -[NTKOlympusController _startClockUpdates](self, "_startClockUpdates");
  }
  else
  {
    -[NTKOlympusController _stopClockUpdates](self, "_stopClockUpdates");
  }
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id WeakRetained;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  id v13;

  v13 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_olympusView);
  objc_msgSend(WeakRetained, "setOverrideDate:duration:", v13, a4);

  -[NTKOlympusController date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v13, "isEqualToDate:", v7);

  if ((v8 & 1) == 0)
  {
    v9 = (uint64_t)v13;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C94130], "now");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (id)v9;
    -[NTKOlympusController date](self, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKOlympusController _animateClockHandsFromDate:toDate:duration:](self, "_animateClockHandsFromDate:toDate:duration:", v10, v13, a4);

  }
  -[NTKOlympusController _updateHourComponentsWithDate:](self, "_updateHourComponentsWithDate:", v13);
  v11 = objc_loadWeakRetained((id *)&self->_olympusView);
  v12 = objc_msgSend(v11, "canUpdateWindrunnerMask");

  if (v12)
    -[NTKOlympusController _applyWindrunnerMask](self, "_applyWindrunnerMask");

}

- (void)_startClockUpdates
{
  void *v3;
  void *v4;
  CLKClockTimerToken *v5;
  CLKClockTimerToken *clockTimerToken;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, id *);
  void *v10;
  id v11;
  id location;

  if (!self->_clockTimerToken)
  {
    if (-[NTKOlympusController _hasWindrunnerWedge](self, "_hasWindrunnerWedge"))
    {
      objc_initWeak(&location, self);
      v7 = MEMORY[0x1E0C809B0];
      v8 = 3221225472;
      v9 = __42__NTKOlympusController__startClockUpdates__block_invoke;
      v10 = &unk_1E6BCED08;
      objc_copyWeak(&v11, &location);
      v3 = _Block_copy(&v7);
      objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance", v7, v8, v9, v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 1, v3, &__block_literal_global_14);
      v5 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
      clockTimerToken = self->_clockTimerToken;
      self->_clockTimerToken = v5;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __42__NTKOlympusController__startClockUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  int v21;
  id v22;

  v22 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = *a3;
    objc_msgSend(WeakRetained, "olympusView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDate:", v7);

    v9 = objc_msgSend(v6, "minute");
    objc_msgSend(v6, "_updateTimeComponentsWithDate:hour:minute:second:", *a3, NTK12HourTimeFrom24HourTime((uint64_t)a3[1]), a3[2], a3[3]);
    +[NTKOlympusMask angleForHour:minutes:](NTKOlympusMask, "angleForHour:minutes:", objc_msgSend(v6, "hour"), objc_msgSend(v6, "minute"));
    v11 = v10;
    +[NTKOlympusMask angleForMinute:seconds:](NTKOlympusMask, "angleForMinute:seconds:", objc_msgSend(v6, "minute"), objc_msgSend(v6, "second"));
    v13 = v12;
    objc_msgSend(v6, "olympusView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hourHandAngle");
    if (v11 - v15 > 1.0)
    {
      v18 = 1;
    }
    else
    {
      objc_msgSend(v6, "olympusView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "minuteHandAngle");
      v18 = v13 - v17 > 1.0;

    }
    v19 = objc_msgSend(v6, "minute");
    objc_msgSend(v6, "olympusView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "canUpdateWindrunnerMask"))
    {
      v21 = v9 != v19 || v18;

      if (v21 == 1)
        objc_msgSend(v6, "_applyWindrunnerMask");
    }
    else
    {

    }
  }

}

const __CFString *__42__NTKOlympusController__startClockUpdates__block_invoke_7()
{
  return CFSTR("NTKOlympusController second updates");
}

- (void)_stopClockUpdates
{
  void *v3;
  CLKClockTimerToken *clockTimerToken;

  if (self->_clockTimerToken)
  {
    objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopUpdatesForToken:", self->_clockTimerToken);

    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;

  }
}

- (void)_updateHourComponentsWithDate:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v4 = NTKDateHourIn12HourTime(v9);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "component:fromDate:", 64, v9);

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "component:fromDate:", 128, v9);

  -[NTKOlympusController _updateTimeComponentsWithDate:hour:minute:second:](self, "_updateTimeComponentsWithDate:hour:minute:second:", v9, v4, v6, v8);
}

- (void)_updateTimeComponentsWithDate:(id)a3 hour:(int64_t)a4 minute:(int64_t)a5 second:(int64_t)a6
{
  -[NTKOlympusController setDate:](self, "setDate:", a3);
  -[NTKOlympusController setHour:](self, "setHour:", a4);
  -[NTKOlympusController setMinute:](self, "setMinute:", a5);
  -[NTKOlympusController setSecond:](self, "setSecond:", a6);
}

- (void)_animateClockHandsFromDate:(id)a3 toDate:(id)a4 duration:(double)a5
{
  id v8;
  id WeakRetained;
  id v10;

  v10 = a3;
  v8 = a4;
  if (-[NTKOlympusController _hasWindrunnerWedge](self, "_hasWindrunnerWedge"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_olympusView);
    objc_msgSend(WeakRetained, "animateClockHandsFromDate:toDate:duration:", v10, v8, a5);

  }
}

- (BOOL)_hasWindrunnerWedge
{
  NTKOlympusTimeView **p_olympusView;
  id WeakRetained;
  id v4;
  BOOL v5;

  p_olympusView = &self->_olympusView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_olympusView);
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_olympusView);
    v5 = objc_msgSend(v4, "currentStyle") == 2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_handleSignificantTimeChanged
{
  if (-[NTKOlympusController _hasWindrunnerWedge](self, "_hasWindrunnerWedge"))
    -[NTKOlympusController _applyWindrunnerMask](self, "_applyWindrunnerMask");
}

- (void)_applyWindrunnerMask
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_olympusView);
  -[NTKOlympusController faceView](self, "faceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDisplayDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "applyWindrunnerMaskWithDate:", v4);

}

- (NTKOlympusTimeView)olympusView
{
  return (NTKOlympusTimeView *)objc_loadWeakRetained((id *)&self->_olympusView);
}

- (void)setOlympusView:(id)a3
{
  objc_storeWeak((id *)&self->_olympusView, a3);
}

- (CLKClockTimerToken)clockTimerToken
{
  return self->_clockTimerToken;
}

- (void)setClockTimerToken:(id)a3
{
  objc_storeStrong((id *)&self->_clockTimerToken, a3);
}

- (NTKFaceView)faceView
{
  return (NTKFaceView *)objc_loadWeakRetained((id *)&self->_faceView);
}

- (void)setFaceView:(id)a3
{
  objc_storeWeak((id *)&self->_faceView, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (unint64_t)hour
{
  return self->_hour;
}

- (void)setHour:(unint64_t)a3
{
  self->_hour = a3;
}

- (unint64_t)minute
{
  return self->_minute;
}

- (void)setMinute:(unint64_t)a3
{
  self->_minute = a3;
}

- (unint64_t)second
{
  return self->_second;
}

- (void)setSecond:(unint64_t)a3
{
  self->_second = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_faceView);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_destroyWeak((id *)&self->_olympusView);
}

@end
