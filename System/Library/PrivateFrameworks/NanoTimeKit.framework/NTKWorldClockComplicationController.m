@implementation NTKWorldClockComplicationController

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 5;
}

- (void)_activate
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAbbreviationStoreChange_, CFSTR("NTKCustomWorldCityAbbreviationsChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleLocaleChange, *MEMORY[0x1E0C99720], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleTimeZoneChange, *MEMORY[0x1E0C998A0], 0);

}

- (void)_deactivate
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("NTKCustomWorldCityAbbreviationsChangedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C998A0], 0);

}

- (void)_configureForLegacyDisplay:(id)a3
{
  id v4;
  char v5;
  char v6;

  v4 = a3;
  *(_BYTE *)&self->_displayFlags = *(_BYTE *)&self->_displayFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)&self->_displayFlags = *(_BYTE *)&self->_displayFlags & 0xFD | v6;
  -[NTKWorldClockComplicationController _updateDisplay](self, "_updateDisplay");
}

- (void)setPauseDate:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NTKWorldClockComplicationController;
  -[NTKComplicationController setPauseDate:](&v6, sel_setPauseDate_, v4);
  if (-[NTKComplicationController effectiveFaceDataMode](self, "effectiveFaceDataMode") == 2)
  {
    -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOverrideDate:", v4);

  }
}

- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4
{
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKWorldClockComplicationController;
  -[NTKComplicationController setDisplayProperties:forDisplayWrapper:](&v9, sel_setDisplayProperties_forDisplayWrapper_, a3, a4);
  v5 = -[NTKComplicationController effectiveFaceDataMode](self, "effectiveFaceDataMode");
  if (v5 == 2)
  {
    -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKComplicationController pauseDate](self, "pauseDate");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 == 3)
    {
      -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NTKIdealizedDate();
    }
    else
    {
      -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NTKNilOrDateOverrideInDemoMode();
    }
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  objc_msgSend(v6, "setOverrideDate:", v7);

}

- (BOOL)hasTapAction
{
  return 1;
}

- (void)performTapActionForDisplayWrapper:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  -[NTKComplicationController complication](self, "complication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "city");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alCityId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("nwc://id/%@"), v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKComplicationController _openAppWithURL:forDisplayWrapper:](self, "_openAppWithURL:forDisplayWrapper:", v9, v5);

}

- (id)complicationApplicationIdentifier
{
  return CFSTR("com.apple.NanoWorldClock");
}

- (void)_updateDisplay
{
  void *v3;
  char displayFlags;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[NTKComplicationController complication](self, "complication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "city");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  displayFlags = (char)self->_displayFlags;
  if ((displayFlags & 1) != 0)
  {
    -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NTKWorldClockCityAbbreviation(v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShortCity:", v6);

    displayFlags = (char)self->_displayFlags;
  }
  if ((displayFlags & 2) != 0)
  {
    -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLongCity:", v8);

  }
  -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v10 = (void *)MEMORY[0x1E0C99E80];
    objc_msgSend(v13, "timeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeZoneWithName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimeZone:", v12);

  }
  else
  {
    objc_msgSend(v9, "setTimeZone:", 0);
  }

}

- (void)_handleAbbreviationStoreChange:(id)a3
{
  if ((*(_BYTE *)&self->_displayFlags & 1) != 0)
    -[NTKWorldClockComplicationController _updateDisplay](self, "_updateDisplay", a3);
}

- (void)_handleLocaleChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__NTKWorldClockComplicationController__handleLocaleChange__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __58__NTKWorldClockComplicationController__handleLocaleChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplay");
}

- (void)_handleTimeZoneChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__NTKWorldClockComplicationController__handleTimeZoneChange__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __60__NTKWorldClockComplicationController__handleTimeZoneChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplay");
}

- (void)_startTimeTravelAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startTimeTravelAnimated:", v3);

  }
}

- (void)_endTimeTravelAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endTimeTravelAnimated:", v3);

  }
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSDate *v6;
  NSDate *v7;
  NSDate *timeTravelDate;
  NSDate *v9;
  NSDate *v10;
  id v11;

  v4 = a4;
  v6 = (NSDate *)a3;
  v7 = v6;
  timeTravelDate = self->_timeTravelDate;
  if (!v6 || timeTravelDate)
  {
    if (!v6 && timeTravelDate)
      -[NTKWorldClockComplicationController _endTimeTravelAnimated:](self, "_endTimeTravelAnimated:", v4);
  }
  else
  {
    -[NTKWorldClockComplicationController _startTimeTravelAnimated:](self, "_startTimeTravelAnimated:", v4);
  }
  v9 = self->_timeTravelDate;
  self->_timeTravelDate = v7;
  v10 = v7;

  -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOverrideDate:", self->_timeTravelDate);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
}

@end
