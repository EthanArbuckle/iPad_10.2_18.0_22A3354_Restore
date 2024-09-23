@implementation NTKDateComplicationController

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 1 || a3 == 16;
}

- (void)_activate
{
  void *v3;
  NSObject *v4;
  int v5;
  NTKDateComplicationController *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleTimeChangeNotification, *MEMORY[0x1E0C99720], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleTimeChangeNotification, *MEMORY[0x1E0DC4838], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleTimeChangeNotification, *MEMORY[0x1E0C99690], 0);
  _NTKLoggingObjectForDomain(15, (uint64_t)"NTKLoggingDomainSignificantTimeChange");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134218242;
    v6 = self;
    v7 = 2080;
    v8 = "-[NTKDateComplicationController _activate]";
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "%p: %s", (uint8_t *)&v5, 0x16u);
  }

}

- (void)_deactivate
{
  void *v3;
  NSObject *v4;
  int v5;
  NTKDateComplicationController *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4838], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99690], 0);
  _NTKLoggingObjectForDomain(15, (uint64_t)"NTKLoggingDomainSignificantTimeChange");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134218242;
    v6 = self;
    v7 = 2080;
    v8 = "-[NTKDateComplicationController _deactivate]";
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "%p: %s", (uint8_t *)&v5, 0x16u);
  }

}

- (void)_configureForLegacyDisplay:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    self->_displayDateStyle = objc_msgSend(v5, "desiredDateComplicationDateStyle");
  }
  else
  {
    -[NTKComplicationController complication](self, "complication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_displayDateStyle = objc_msgSend(v4, "dateStyle");

  }
  -[NTKDateComplicationController _updateDisplay](self, "_updateDisplay");

}

- (BOOL)hasTapAction
{
  return 0;
}

- (void)performTapActionForDisplayWrapper:(id)a3
{
  -[NTKComplicationController _openAppWithURL:forDisplayWrapper:](self, "_openAppWithURL:forDisplayWrapper:", 0, a3);
}

- (id)complicationApplicationIdentifier
{
  return CFSTR("com.apple.NanoCalendar");
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToDate:", self->_timeTravelDate) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_timeTravelDate, a3);
    -[NTKDateComplicationController _updateDisplay](self, "_updateDisplay");
  }

}

- (void)_handleTimeChangeNotification
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  NTKDateComplicationController *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(15, (uint64_t)"NTKLoggingDomainSignificantTimeChange");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v6 = self;
    v7 = 2080;
    v8 = "-[NTKDateComplicationController _handleTimeChangeNotification]";
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "%p: %s", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__NTKDateComplicationController__handleTimeChangeNotification__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __62__NTKDateComplicationController__handleTimeChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 144);
  *(_QWORD *)(v2 + 144) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplay");
}

- (void)_updateDisplay
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSDate *timeTravelDate;
  NSDate *v7;
  int v8;
  NTKDateComplicationController *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(15, (uint64_t)"NTKLoggingDomainSignificantTimeChange");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218242;
    v9 = self;
    v10 = 2080;
    v11 = "-[NTKDateComplicationController _updateDisplay]";
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "%p: %s", (uint8_t *)&v8, 0x16u);
  }

  -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    CLKForcedTime();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      timeTravelDate = self->_timeTravelDate;
      if (timeTravelDate)
      {
        v7 = timeTravelDate;
      }
      else
      {
        +[CLKDate complicationDate](NTKDate, "complicationDate");
        v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
      }
      v5 = v7;
    }
    -[NTKDateComplicationController _setTextInDisplayIfNeededWithDate:](self, "_setTextInDisplayIfNeededWithDate:", v5);

  }
}

+ (id)textForDateStyle:(unint64_t)a3
{
  void *v5;
  void *v6;

  +[CLKDate complicationDate](NTKDate, "complicationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_textForDate:dateStyle:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_textForDate:(id)a3 dateStyle:(unint64_t)a4
{
  if (!a4)
    return 0;
  +[NTKComplicationDateFormatter stringForDate:withStyle:](NTKComplicationDateFormatter, "stringForDate:withStyle:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setTextInDisplayIfNeededWithDate:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t displayDateStyle;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  if (self->_displayDateStyle)
  {
    v4 = a3;
    -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
    v5 = objc_claimAutoreleasedReturnValue();
    displayDateStyle = self->_displayDateStyle;
    v14 = (id)v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend(v14, "overrideDateStyle");
    else
      v7 = 0;
    if (v7)
      v8 = displayDateStyle == 8;
    else
      v8 = 0;
    if (v8)
      displayDateStyle = v7;
    objc_msgSend((id)objc_opt_class(), "_textForDate:dateStyle:", v4, displayDateStyle);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKComplicationDateFormatter _localizedDayDateFormatter](NTKComplicationDateFormatter, "_localizedDayDateFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v9, "rangeOfString:", v11);
    objc_msgSend(v14, "setDateComplicationText:withDayRange:forDateStyle:", v9, v12, v13, self->_displayDateStyle);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
}

@end
