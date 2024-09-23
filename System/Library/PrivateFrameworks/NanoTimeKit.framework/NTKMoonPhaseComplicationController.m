@implementation NTKMoonPhaseComplicationController

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 11;
}

- (void)_activate
{
  void *v3;
  void *v4;
  void (**v5)(void *, void *, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, void *);
  void *v12;
  id v13;
  id location;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateDisplay, *MEMORY[0x1E0DC4838], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__asyncUpdateDisplay, *MEMORY[0x1E0C99690], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateDisplay, *MEMORY[0x1E0C99720], 0);
  +[NTKLocationManager sharedLocationManager](NTKLocationManager, "sharedLocationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __47__NTKMoonPhaseComplicationController__activate__block_invoke;
  v12 = &unk_1E6BD0A28;
  objc_copyWeak(&v13, &location);
  v5 = (void (**)(void *, void *, void *, _QWORD))_Block_copy(&v9);
  objc_msgSend(v4, "startLocationUpdatesWithIdentifier:handler:", CFSTR("ntk.moonPhaseComplication"), v5, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKMoonPhaseComplicationController setToken:](self, "setToken:", v6);

  objc_msgSend(v4, "currentLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v7, v8, 0);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __47__NTKMoonPhaseComplicationController__activate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *WeakRetained;
  void *v5;
  _BOOL8 v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[22] == 0;
    objc_msgSend(WeakRetained, "setLocation:", v7);
    objc_msgSend(v5, "_updateDisplayForced:", v6);
  }

}

- (void)_deactivate
{
  void *v3;
  NSString *token;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4838], 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0C99690], 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);
  if (self->_token)
  {
    +[NTKLocationManager sharedLocationManager](NTKLocationManager, "sharedLocationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopLocationUpdatesForToken:", self->_token);

    token = self->_token;
    self->_token = 0;

  }
  -[NTKMoonPhaseComplicationController _invalidateEventTimer](self, "_invalidateEventTimer");

}

- (void)_configureForLegacyDisplay:(id)a3
{
  id v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;

  v4 = a3;
  *(_BYTE *)&self->_displayFlags = *(_BYTE *)&self->_displayFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 2;
  else
    v5 = 0;
  *(_BYTE *)&self->_displayFlags = *(_BYTE *)&self->_displayFlags & 0xFD | v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 4;
  else
    v6 = 0;
  *(_BYTE *)&self->_displayFlags = *(_BYTE *)&self->_displayFlags & 0xFB | v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 8;
  else
    v7 = 0;
  *(_BYTE *)&self->_displayFlags = *(_BYTE *)&self->_displayFlags & 0xF7 | v7;
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
    v9 = 16;
  else
    v9 = 0;
  *(_BYTE *)&self->_displayFlags = *(_BYTE *)&self->_displayFlags & 0xEF | v9;
  -[NTKMoonPhaseComplicationController _updateDisplayForced:](self, "_updateDisplayForced:", 1);
}

- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4
{
  _BOOL4 paused;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKMoonPhaseComplicationController;
  -[NTKComplicationController setDisplayProperties:forDisplayWrapper:](&v7, sel_setDisplayProperties_forDisplayWrapper_, a3, a4);
  paused = -[NTKComplicationController effectiveFaceDataMode](self, "effectiveFaceDataMode") != 1;
  self->_paused = paused;
  if ((*(_BYTE *)&self->_displayFlags & 0x10) != 0)
  {
    -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPaused:", self->_paused);

    paused = self->_paused;
  }
  if (!paused && self->_missedUpdateWhilePaused)
  {
    self->_missedUpdateWhilePaused = 0;
    -[NTKMoonPhaseComplicationController _updateDisplay](self, "_updateDisplay");
  }
}

- (void)setShowsLockedUI:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[NTKComplicationController showsLockedUI](self, "showsLockedUI");
  v6.receiver = self;
  v6.super_class = (Class)NTKMoonPhaseComplicationController;
  -[NTKComplicationController setShowsLockedUI:](&v6, sel_setShowsLockedUI_, v3);
  if (v5 != -[NTKComplicationController showsLockedUI](self, "showsLockedUI"))
    -[NTKMoonPhaseComplicationController _updateDisplay](self, "_updateDisplay");
}

- (BOOL)hasTapAction
{
  return 0;
}

- (void)_updateDisplay
{
  -[NTKMoonPhaseComplicationController _updateDisplayForced:](self, "_updateDisplayForced:", 0);
}

- (void)_asyncUpdateDisplay
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__NTKMoonPhaseComplicationController__asyncUpdateDisplay__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __57__NTKMoonPhaseComplicationController__asyncUpdateDisplay__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplay");
}

- (void)_updateDisplayForced:(BOOL)a3
{
  uint64_t v4;
  char displayFlags;
  void *v6;
  void *v7;
  id v8;

  if (!self->_paused || a3)
  {
    -[NTKComplicationController legacyDisplay](self, "legacyDisplay", a3);
    v4 = objc_claimAutoreleasedReturnValue();
    displayFlags = (char)self->_displayFlags;
    v8 = (id)v4;
    if ((displayFlags & 1) != 0)
    {
      NUNILocalizedString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPhaseName:", v6);

      displayFlags = (char)self->_displayFlags;
    }
    if ((displayFlags & 2) != 0)
    {
      objc_msgSend(v8, "setPhaseNumber:hemisphere:", 88, 0);
      displayFlags = (char)self->_displayFlags;
    }
    v7 = v8;
    if ((displayFlags & 8) != 0)
    {
      objc_msgSend(v8, "setLocked:", -[NTKComplicationController showsLockedUI](self, "showsLockedUI"));
      v7 = v8;
    }

  }
  else
  {
    self->_missedUpdateWhilePaused = 1;
  }
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToDate:", self->_timeTravelDate) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_timeTravelDate, a3);
    -[NTKMoonPhaseComplicationController _updateDisplay](self, "_updateDisplay");
  }

}

- (void)_invalidateEventTimer
{
  if (-[NSTimer isValid](self->_afterEventTimer, "isValid"))
    -[NSTimer invalidate](self->_afterEventTimer, "invalidate");
}

- (void)_scheduleAfterEventTimer:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  NSTimer *v9;
  NSTimer *afterEventTimer;
  void *v11;
  id v12;

  objc_msgSend(a3, "dateByAddingTimeInterval:", 60.0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (a3
    && (*(_BYTE *)&self->_displayFlags & 4) != 0
    && (+[CLKDate complicationDate](NTKDate, "complicationDate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v12, "compare:", v5),
        v5,
        v6 == 1))
  {
    -[NSTimer fireDate](self->_afterEventTimer, "fireDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v12, "isEqualToDate:", v7);

    if ((v8 & 1) == 0)
    {
      -[NTKMoonPhaseComplicationController _invalidateEventTimer](self, "_invalidateEventTimer");
      v9 = (NSTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v12, self, sel__afterEventTimerFired_, 0, 0, 0.0);
      afterEventTimer = self->_afterEventTimer;
      self->_afterEventTimer = v9;

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addTimer:forMode:", self->_afterEventTimer, *MEMORY[0x1E0C99860]);

    }
  }
  else
  {
    -[NTKMoonPhaseComplicationController _invalidateEventTimer](self, "_invalidateEventTimer");
  }

}

- (void)_afterEventTimerFired:(id)a3
{
  if ((*(_BYTE *)&self->_displayFlags & 4) != 0)
    -[NTKMoonPhaseComplicationController _updateDisplay](self, "_updateDisplay", a3);
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_afterEventTimer, 0);
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
}

@end
