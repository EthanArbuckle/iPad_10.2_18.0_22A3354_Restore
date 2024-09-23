@implementation CLKRelativeDateTextProvider

- (CLKRelativeDateTextProvider)initWithDate:(NSDate *)date style:(CLKRelativeDateStyle)style units:(NSCalendarUnit)calendarUnits
{
  return -[CLKRelativeDateTextProvider initWithDate:relativeToDate:style:units:](self, "initWithDate:relativeToDate:style:units:", date, 0, style, calendarUnits);
}

- (CLKRelativeDateTextProvider)initWithDate:(NSDate *)date relativeToDate:(NSDate *)relativeDate style:(CLKRelativeDateStyle)style units:(NSCalendarUnit)calendarUnits
{
  NSDate *v10;
  NSDate *v11;
  CLKRelativeDateTextProvider *v12;
  CLKRelativeDateTextProvider *v13;
  objc_super v15;

  v10 = date;
  v11 = relativeDate;
  v15.receiver = self;
  v15.super_class = (Class)CLKRelativeDateTextProvider;
  v12 = -[CLKTextProvider initPrivate](&v15, sel_initPrivate);
  v13 = v12;
  if (v12)
  {
    -[CLKRelativeDateTextProvider setDate:](v12, "setDate:", v10);
    -[CLKRelativeDateTextProvider setRelativeToDate:](v13, "setRelativeToDate:", v11);
    -[CLKRelativeDateTextProvider setRelativeDateStyle:](v13, "setRelativeDateStyle:", style);
    -[CLKRelativeDateTextProvider setCalendarUnits:](v13, "setCalendarUnits:", calendarUnits);
    -[CLKTextProvider setTimeTravelUpdateFrequency:](v13, "setTimeTravelUpdateFrequency:", 2 * (v13->_relativeToDate == 0));
    -[CLKRelativeDateTextProvider setTritiumDateStyle:](v13, "setTritiumDateStyle:", 5);
  }

  return v13;
}

+ (CLKRelativeDateTextProvider)textProviderWithDate:(NSDate *)date style:(CLKRelativeDateStyle)style units:(NSCalendarUnit)calendarUnits
{
  return (CLKRelativeDateTextProvider *)objc_msgSend(a1, "textProviderWithDate:relativeToDate:style:units:", date, 0, style, calendarUnits);
}

+ (CLKRelativeDateTextProvider)textProviderWithDate:(NSDate *)date relativeToDate:(NSDate *)relativeToDate style:(CLKRelativeDateStyle)style units:(NSCalendarUnit)calendarUnits
{
  NSDate *v10;
  NSDate *v11;
  void *v12;

  v10 = relativeToDate;
  v11 = date;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:relativeToDate:style:units:", v11, v10, style, calendarUnits);

  return (CLKRelativeDateTextProvider *)v12;
}

- (NSDate)overrideDate
{
  return self->_relativeToDate;
}

- (void)_startSessionWithDate:(id)a3
{
  NSDate *v4;
  NSDate *relativeToDate;
  NSDate *v6;
  void *v7;
  double v8;
  NSDateComponents *v9;
  NSDateComponents *sessionComponents;
  NSDate *v11;

  v4 = (NSDate *)a3;
  relativeToDate = self->_relativeToDate;
  v11 = v4;
  if (relativeToDate)
  {
    v6 = relativeToDate;

    v11 = v6;
  }
  -[CLKRelativeDateTextProvider date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v11);
  self->_elapsedTime = v8;

  self->_sessionTimePeriod = -[CLKRelativeDateTextProvider _timePeriodForElapsedTime:](self, "_timePeriodForElapsedTime:", self->_elapsedTime);
  -[CLKRelativeDateTextProvider _componentsForDate:visibleUnits:](self, "_componentsForDate:visibleUnits:", v11, &self->_sessionVisibleUnits);
  v9 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  sessionComponents = self->_sessionComponents;
  self->_sessionComponents = v9;

  self->_sessionInProgress = 1;
}

- (void)finalize
{
  objc_super v2;

  if (self->_relativeDateStyle == 2)
    self->_calendarUnits = 224;
  v2.receiver = self;
  v2.super_class = (Class)CLKRelativeDateTextProvider;
  -[CLKTextProvider finalize](&v2, sel_finalize);
}

- (id)_sessionCacheKey
{
  NSString *sessionCacheKey;
  void *v4;
  unint64_t sessionVisibleUnits;
  id v6;
  NSString *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  sessionCacheKey = self->_sessionCacheKey;
  if (!sessionCacheKey)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sessionVisibleUnits = self->_sessionVisibleUnits;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __47__CLKRelativeDateTextProvider__sessionCacheKey__block_invoke;
    v10[3] = &unk_24CBF9DD8;
    v10[4] = self;
    v6 = v4;
    v11 = v6;
    _EnumerateCalendarUnitsBackwardWithBlock(sessionVisibleUnits, (uint64_t)v10);
    if (self->_relativeDateStyle == 1)
      objc_msgSend(v6, "appendFormat:", CFSTR("%ld"), self->_sessionTimePeriod);
    v7 = self->_sessionCacheKey;
    self->_sessionCacheKey = (NSString *)v6;
    v8 = v6;

    sessionCacheKey = self->_sessionCacheKey;
  }
  return sessionCacheKey;
}

void __47__CLKRelativeDateTextProvider__sessionCacheKey__block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  int v5;
  void *v6;
  const __CFString *v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "valueForComponent:", a2);
  v5 = objc_msgSend(*(id *)(a1 + 32), "_timerIsPausedAtZero");
  v6 = *(void **)(a1 + 40);
  if (a2 > 63)
  {
    if (a2 > 4095)
    {
      if (a2 == 4096)
      {
        v7 = CFSTR("wk");
        goto LABEL_21;
      }
      if (a2 == 0x8000)
      {
        v7 = CFSTR("ss");
        goto LABEL_21;
      }
    }
    else
    {
      if (a2 == 64)
      {
        v7 = CFSTR("min");
        goto LABEL_21;
      }
      if (a2 == 128)
      {
        v7 = CFSTR("sec");
        goto LABEL_21;
      }
    }
  }
  else if (a2 > 15)
  {
    if (a2 == 16)
    {
      v7 = CFSTR("day");
      goto LABEL_21;
    }
    if (a2 == 32)
    {
      v7 = CFSTR("hr");
      goto LABEL_21;
    }
  }
  else
  {
    if (a2 == 4)
    {
      v7 = CFSTR("yr");
      goto LABEL_21;
    }
    if (a2 == 8)
    {
      v7 = CFSTR("mo");
      goto LABEL_21;
    }
  }
  v7 = CFSTR("?");
LABEL_21:
  v8 = v4 / 0x989680;
  if (a2 != 0x8000)
    v8 = v4;
  if (v5)
    v9 = 0;
  else
    v9 = v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@%@"), v7, v10);

}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  NSObject *v6;
  int64_t relativeDateStyle;
  unint64_t sessionVisibleUnits;
  _BOOL4 disableSmallCapUnits;
  int v10;
  NSRelativeDateTimeFormatter *relativeDateTimeFormatter;
  NSRelativeDateTimeFormatter *v12;
  NSRelativeDateTimeFormatter *v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 wantsSubsecondsAsDashes;
  void *v17;
  int v18;
  double elapsedTime;
  double v20;
  int v21;
  char v22;
  NSDateComponentsFormatter *formatter;
  NSDateComponentsFormatter *v24;
  NSDateComponentsFormatter *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  CTFontSymbolicTraits SymbolicTraits;
  _BOOL4 v37;
  _BOOL4 v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  void *v44;
  uint64_t v45;
  _BOOL4 v46;
  _BOOL4 v47;
  __CFString *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  int v59;
  id v60;
  void *v61;
  uint64_t v62;
  char v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  _BOOL4 v72;
  void *v73;
  __CFString *v74;
  id v75;
  id v76;
  uint64_t v77;
  _QWORD v78[2];

  v78[1] = *MEMORY[0x24BDAC8D0];
  v75 = a4;
  if (!self->_date)
    goto LABEL_48;
  if (!self->_sessionInProgress)
  {
    CLKLoggingObjectForDomain(4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CLKRelativeDateTextProvider _sessionAttributedTextForIndex:withStyle:].cold.1(v6);

  }
  relativeDateStyle = self->_relativeDateStyle;
  sessionVisibleUnits = self->_sessionVisibleUnits;
  disableSmallCapUnits = self->_disableSmallCapUnits;
  if (relativeDateStyle == 2)
  {
    v10 = self->_wantsSubseconds || self->_twoDigitMinuteZeroPadding;
    LODWORD(v15) = 0;
    wantsSubsecondsAsDashes = self->_wantsSubsecondsAsDashes;
    v17 = 0;
    v18 = 0;
    switch(a3)
    {
      case 0uLL:
        v18 = 0;
        LODWORD(v15) = self->_wantsSubseconds;
        goto LABEL_25;
      case 1uLL:
        goto LABEL_25;
      case 2uLL:
        LODWORD(v15) = 0;
        v18 = 1;
        goto LABEL_25;
      case 3uLL:
        if (self->_showLeadingMinutes
          || -[NSDateComponents hour](self->_sessionComponents, "hour")
          || -[NSDateComponents minute](self->_sessionComponents, "minute")
          || !self->_sessionComponents)
        {
          LODWORD(v15) = 0;
        }
        else
        {
          -[CLKRelativeDateTextProvider _configureFormatterForTimerStyle](self, "_configureFormatterForTimerStyle");
          -[NSDateComponentsFormatter setAllowedUnits:](self->_formatter, "setAllowedUnits:", sessionVisibleUnits & 0xFFFFFFFFFFFF7FFFLL);
          -[NSDateComponentsFormatter stringFromDateComponents:](self->_formatter, "stringFromDateComponents:", self->_sessionComponents);
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
            goto LABEL_45;
        }
        v18 = 0;
LABEL_25:
        elapsedTime = self->_elapsedTime;
        if (elapsedTime >= 0.0)
          v20 = self->_elapsedTime;
        else
          v20 = -elapsedTime;
        if (-[CLKRelativeDateTextProvider _timerIsPausedAtZero](self, "_timerIsPausedAtZero"))
          v20 = 0.0;
        if (!self->_relativeToDate && v20 * 1000.0 <= 1.84467441e19)
        {
          v21 = _TimeAdjustedForDigitalDisplay_leastSignificantDigits[(121 * ((unint64_t)(v20 * 1000.0) % 0x64)) >> 12];
          v20 = (double)(unint64_t)((double)(int)(10 * (arc4random_uniform(3u) + v21)) + floor(v20 * 10.0)
                                                                                              * 100.0)
              / 1000.0;
        }
        v22 = v15 ^ 1;
        if (!wantsSubsecondsAsDashes)
          v22 = 1;
        if ((v22 & 1) != 0)
          CLKFormatTimeIntervalSeconds(0, 0, v15, 1, v10, v18, v20);
        else
          CLKFormatTimeIntervalSecondsForLowerFidelity(0, 0, v20 < 3600.0, 1, 1, 0, v20);
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
          goto LABEL_39;
        goto LABEL_45;
      case 4uLL:
        goto LABEL_94;
      default:
        v18 = 0;
        goto LABEL_25;
    }
  }
  if ((relativeDateStyle & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    relativeDateTimeFormatter = self->_relativeDateTimeFormatter;
    if (!relativeDateTimeFormatter)
    {
      v12 = (NSRelativeDateTimeFormatter *)objc_alloc_init(MEMORY[0x24BDD17A0]);
      v13 = self->_relativeDateTimeFormatter;
      self->_relativeDateTimeFormatter = v12;

      relativeDateTimeFormatter = self->_relativeDateTimeFormatter;
    }
    if (+[CLKRelativeDateTextProvider _configureRelativeFormatter:fallbackIndex:style:](CLKRelativeDateTextProvider, "_configureRelativeFormatter:fallbackIndex:style:", relativeDateTimeFormatter, a3, relativeDateStyle)&& self->_sessionComponents)
    {
      -[NSRelativeDateTimeFormatter localizedStringFromDateComponents:](self->_relativeDateTimeFormatter, "localizedStringFromDateComponents:");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    }
LABEL_48:
    v17 = 0;
    goto LABEL_94;
  }
LABEL_39:
  formatter = self->_formatter;
  if (!formatter)
  {
    v24 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x24BDD14F8]);
    v25 = self->_formatter;
    self->_formatter = v24;

    formatter = self->_formatter;
  }
  if (!+[CLKRelativeDateTextProvider _configureComponentsFormatter:fallbackIndex:style:](CLKRelativeDateTextProvider, "_configureComponentsFormatter:fallbackIndex:style:", formatter, a3, relativeDateStyle)|| !self->_sessionComponents)
  {
    goto LABEL_48;
  }
  -[NSDateComponentsFormatter setAllowedUnits:](self->_formatter, "setAllowedUnits:", sessionVisibleUnits);
  -[NSDateComponentsFormatter stringFromDateComponents:](self->_formatter, "stringFromDateComponents:", self->_sessionComponents);
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_44:
  v15 = v14;
LABEL_45:
  if (self->_relativeToDate || (sessionVisibleUnits & 0x80) == 0)
  {
    objc_msgSend(v75, "font");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v75, "monospacedDigitsFont");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v26;
  -[CLKTextProvider fontFeatures](self, "fontFeatures");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[CLKTextProvider fontFeatures](self, "fontFeatures");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "CLKFontByApplyingFeatureSettings:", v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v30;
  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v15, "lowercaseStringWithLocale:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (relativeDateStyle != 2 && !disableSmallCapUnits)
  {
    objc_msgSend(v27, "CLKFontWithLocalizedLowerCaseSmallCaps");
    v33 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "uppercaseStringWithLocale:", v34);
    v35 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v33;
    v32 = (void *)v35;
  }
  SymbolicTraits = CTFontGetSymbolicTraits((CTFontRef)v27);
  v37 = CLKSmallCapsAllowed();
  if (v32)
    v38 = v37;
  else
    v38 = 0;
  if (relativeDateStyle == 2)
    v38 = 0;
  if (disableSmallCapUnits)
    v38 = 0;
  v39 = v38 & SymbolicTraits;
  if (self->_shrinkUnitsInCJK)
    v40 = CLKIsCurrentLocaleCJK();
  else
    v40 = 0;
  v41 = objc_msgSend(v75, "uppercase");
  if (disableSmallCapUnits)
    v42 = v41;
  else
    v42 = 0;
  v43 = v42 | v39;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43 == 1)
    objc_msgSend(v32, "uppercaseStringWithLocale:", v44);
  else
    objc_msgSend(v32, "lowercaseStringWithLocale:", v44);
  v45 = objc_claimAutoreleasedReturnValue();

  v46 = relativeDateStyle == 1 && !self->_disableOffsetPrefix;
  if (v45)
    v47 = v46;
  else
    v47 = 0;
  if (v45)
    v48 = (__CFString *)v45;
  else
    v48 = CFSTR("---");
  v49 = *MEMORY[0x24BEBD270];
  v77 = *MEMORY[0x24BEBD270];
  v78[0] = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, &v77, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v48, v50);
  if ((v39 | v40) == 1)
  {
    v72 = v47;
    v73 = v50;
    objc_msgSend(MEMORY[0x24BDD1690], "whitespaceAndNewlineCharacterSet");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "formUnionWithCharacterSet:", v53);

    v74 = v48;
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v48);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setCharactersToBeSkipped:", v52);
    objc_msgSend(v27, "pointSize");
    v56 = v55 + -2.0;
    v57 = v55 * 0.75;
    if (v40)
      v57 = v56;
    objc_msgSend(v27, "fontWithSize:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = 0;
    v59 = objc_msgSend(v54, "scanUpToCharactersFromSet:intoString:", v52, &v76);
    v60 = v76;
    v61 = v60;
    if (v59)
    {
      do
      {
        v62 = objc_msgSend(v61, "length");
        objc_msgSend(v51, "addAttribute:value:range:", v49, v58, objc_msgSend(v54, "scanLocation") - v62, v62);
        v76 = v61;
        v63 = objc_msgSend(v54, "scanUpToCharactersFromSet:intoString:", v52, &v76);
        v64 = v76;

        v61 = v64;
      }
      while ((v63 & 1) != 0);
    }
    else
    {
      v64 = v60;
    }

    v50 = v73;
    v48 = v74;
    v47 = v72;
  }
  if (v47)
  {
    v65 = objc_alloc(MEMORY[0x24BDD1458]);
    -[CLKRelativeDateTextProvider _signPrefixString](self, "_signPrefixString");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)objc_msgSend(v65, "initWithString:attributes:", v66, v50);

    objc_msgSend(v51, "insertAttributedString:atIndex:", v67, 0);
  }
  if (objc_msgSend(v75, "shouldEmbedTintColors"))
  {
    -[CLKTextProvider tintColor](self, "tintColor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      v69 = *MEMORY[0x24BEBD278];
      -[CLKTextProvider tintColor](self, "tintColor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addAttribute:value:range:", v69, v70, 0, objc_msgSend(v51, "length"));

    }
  }
  objc_msgSend(v51, "_attributedStringWithOtherAttributesFromStyle:", v75);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_94:
  return v17;
}

- (int64_t)_timePeriodForElapsedTime:(double)a3
{
  if (a3 >= 0.0)
    return 3;
  else
    return 1;
}

- (id)_signPrefixString
{
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  int64_t sessionTimePeriod;

  v3 = CLKLocaleCurrentNumberSystem();
  v4 = &stru_24CBFCB28;
  v5 = CFSTR("\u200F");
  if (v3 != 1)
    v5 = &stru_24CBFCB28;
  sessionTimePeriod = self->_sessionTimePeriod;
  if (sessionTimePeriod == 3)
    v4 = CFSTR("−");
  if (sessionTimePeriod == 1)
    v4 = CFSTR("+");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v5, v4);
}

- (void)_endSession
{
  NSDateComponents *sessionComponents;
  NSString *sessionCacheKey;

  sessionComponents = self->_sessionComponents;
  self->_sessionComponents = 0;

  self->_sessionVisibleUnits = 0;
  sessionCacheKey = self->_sessionCacheKey;
  self->_sessionCacheKey = 0;

  self->_sessionInProgress = 0;
}

- (BOOL)_validate
{
  _BOOL4 v3;
  unint64_t calendarUnits;
  uint64_t v5;
  NSObject *v6;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)CLKRelativeDateTextProvider;
  v3 = -[CLKTextProvider _validate](&v8, sel__validate);
  if (v3)
  {
    if (self->_date)
    {
      calendarUnits = self->_calendarUnits;
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v13 = 0;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = ___HighestOrderUnit_block_invoke;
      v9[3] = &unk_24CBF9E28;
      v9[4] = &v10;
      _EnumerateCalendarUnitsBackwardWithBlock(calendarUnits, (uint64_t)v9);
      v5 = v11[3];
      _Block_object_dispose(&v10, 8);
      if (v5)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
      CLKLoggingObjectForDomain(10);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[CLKRelativeDateTextProvider _validate].cold.2((uint64_t)self, v6);
    }
    else
    {
      CLKLoggingObjectForDomain(10);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[CLKRelativeDateTextProvider _validate].cold.1((uint64_t)self, v6);
    }

    LOBYTE(v3) = 0;
  }
  return v3;
}

- (int64_t)_updateFrequency
{
  void *v4;
  id v5;
  uint64_t v6;

  if (self->_relativeToDate)
    return 0;
  if (self->_relativeDateStyle == 2 && self->_wantsSubseconds && !self->_wantsSubsecondsAsDashes)
    return 3;
  if ((self->_calendarUnits & 0x80) != 0)
  {
    v6 = 0;
    +[CLKDate complicationDate](CLKDate, "complicationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CLKRelativeDateTextProvider _componentsForDate:visibleUnits:](self, "_componentsForDate:visibleUnits:", v4, &v6);

    if ((v6 & 0x80) != 0)
      return 2;
  }
  return 1;
}

- (id)_componentsForDate:(id)a3 visibleUnits:(unint64_t *)a4
{
  id v6;
  void *v7;
  unint64_t calendarUnits;
  _BOOL4 wantsSubseconds;
  int64_t relativeDateStyle;
  id v11;
  NSDate *v12;
  NSDate *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t *v33;
  _QWORD *v34;
  _QWORD *v35;
  unint64_t v36;
  _QWORD v37[4];
  _QWORD v38[4];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  v6 = a3;
  v7 = v6;
  calendarUnits = self->_calendarUnits;
  wantsSubseconds = self->_wantsSubseconds;
  relativeDateStyle = self->_relativeDateStyle;
  switch(relativeDateStyle)
  {
    case 0:
    case 3:
    case 5:
      calendarUnits |= (calendarUnits >> 1) & 0x40;
      goto LABEL_8;
    case 2:
      if (self->_wantsSubseconds)
        calendarUnits = 32992;
      else
        calendarUnits = 224;
      goto LABEL_8;
    default:
      if ((relativeDateStyle & 0xFFFFFFFFFFFFFFFELL) == 6)
      {
        v11 = v6;
        v12 = self->_date;
      }
      else
      {
LABEL_8:
        objc_msgSend(v6, "earlierDate:", self->_date);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "laterDate:", self->_date);
        v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "components:fromDate:toDate:options:", calendarUnits, v11, v13, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!wantsSubseconds)
      {
        objc_msgSend(v15, "setNanosecond:", 0);
        if ((calendarUnits & 0x80) == 0 && objc_msgSend(v15, "minute") >= 1)
          objc_msgSend(v15, "setSecond:", 0);
      }
      v25 = 0;
      v26 = &v25;
      v27 = 0x2020000000;
      v28 = 0;
      v16 = MEMORY[0x24BDAC760];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __63__CLKRelativeDateTextProvider__componentsForDate_visibleUnits___block_invoke;
      v22[3] = &unk_24CBF9E00;
      v17 = v15;
      v23 = v17;
      v24 = &v25;
      _EnumerateCalendarUnitsBackwardWithBlock(calendarUnits, (uint64_t)v22);
      v18 = v26[3];
      if (v18)
      {
        if (!a4)
          goto LABEL_26;
      }
      else
      {
        v39 = 0;
        v40 = &v39;
        v41 = 0x2020000000;
        v42 = 0;
        v29 = v16;
        v30 = 3221225472;
        v31 = ___LowestOrderUnit_block_invoke;
        v32 = &unk_24CBF9E28;
        v33 = &v39;
        _EnumerateCalendarUnitsWithBlock(calendarUnits, (uint64_t)&v29);
        v18 = v40[3];
        _Block_object_dispose(&v39, 8);
        v26[3] = v18;
        if (!a4)
          goto LABEL_26;
      }
      switch(self->_relativeDateStyle)
      {
        case 0:
        case 3:
        case 5:
          v39 = 0;
          v40 = &v39;
          v41 = 0x2020000000;
          v42 = 0;
          v38[0] = 0;
          v38[1] = v38;
          v38[2] = 0x2020000000;
          v38[3] = 0;
          v37[0] = 0;
          v37[1] = v37;
          v37[2] = 0x2020000000;
          v37[3] = 0;
          v29 = v16;
          v30 = 3221225472;
          v31 = ___GetNeighboringUnits_block_invoke;
          v32 = &unk_24CBF9E50;
          v33 = &v39;
          v34 = v37;
          v35 = v38;
          v36 = v18;
          _EnumerateCalendarUnitsWithBlock(calendarUnits, (uint64_t)&v29);
          v19 = v40[3];
          _Block_object_dispose(v37, 8);
          _Block_object_dispose(v38, 8);
          _Block_object_dispose(&v39, 8);
          if (objc_msgSend(v17, "valueForComponent:", v19) | (unsigned __int16)v19 & 0x80E0)
            v20 = v19;
          else
            v20 = 0;
          v18 = v26[3] | v20;
          break;
        case 2:
          if (v18 == 32)
            v18 = calendarUnits;
          else
            v18 = calendarUnits & 0xFFFFFFFFFFFFFFDFLL;
          break;
        default:
          break;
      }
      *a4 = v18;
LABEL_26:

      _Block_object_dispose(&v25, 8);
      return v17;
  }
}

uint64_t __63__CLKRelativeDateTextProvider__componentsForDate_visibleUnits___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "valueForComponent:", a2);
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

+ (BOOL)_configureComponentsFormatter:(id)a3 fallbackIndex:(unint64_t)a4 style:(int64_t)a5
{
  id v7;
  void *v8;
  BOOL v9;
  unint64_t v10;
  uint64_t v11;

  v7 = a3;
  v8 = v7;
  v9 = 0;
  switch(a5)
  {
    case 0:
      ++a4;
      goto LABEL_4;
    case 1:
      goto LABEL_7;
    case 3:
      a4 += 2;
      goto LABEL_4;
    case 4:
      ++a4;
LABEL_7:
      objc_msgSend(v7, "setZeroFormattingBehavior:", 2);
      if (a4 >= 3)
        goto LABEL_10;
      v10 = 3 - a4;
      v11 = 1;
      goto LABEL_9;
    case 5:
LABEL_4:
      objc_msgSend(v7, "setZeroFormattingBehavior:", 2);
      if (a4 >= 4)
      {
LABEL_10:
        v9 = 0;
      }
      else
      {
        v10 = qword_211565588[a4];
        v11 = qword_2115655A8[a4];
LABEL_9:
        objc_msgSend(v8, "setUnitsStyle:", v10);
        objc_msgSend(v8, "setMaximumUnitCount:", v11);
        v9 = 1;
      }
LABEL_11:

      return v9;
    default:
      goto LABEL_11;
  }
}

+ (BOOL)_configureRelativeFormatter:(id)a3 fallbackIndex:(unint64_t)a4 style:(int64_t)a5
{
  id v7;
  void *v8;
  unint64_t v9;

  v7 = a3;
  v8 = v7;
  if (a5 == 7)
    v9 = a4 + 1;
  else
    v9 = a4;
  objc_msgSend(v7, "setDateTimeStyle:", 0);
  if (v9 <= 2)
    objc_msgSend(v8, "setUnitsStyle:", qword_2115655C8[v9]);

  return v9 < 3;
}

- (void)_configureFormatterForTimerStyle
{
  NSDateComponentsFormatter *formatter;
  NSDateComponentsFormatter *v4;
  NSDateComponentsFormatter *v5;

  formatter = self->_formatter;
  if (!formatter)
  {
    v4 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x24BDD14F8]);
    v5 = self->_formatter;
    self->_formatter = v4;

    formatter = self->_formatter;
  }
  -[NSDateComponentsFormatter setZeroFormattingBehavior:](formatter, "setZeroFormattingBehavior:", 1);
  -[NSDateComponentsFormatter setUnitsStyle:](self->_formatter, "setUnitsStyle:", 0);
  -[NSDateComponentsFormatter setMaximumUnitCount:](self->_formatter, "setMaximumUnitCount:", 1);
}

- (BOOL)_timerIsPausedAtZero
{
  return self->_elapsedTime < 0.0 && self->_pauseTimerAtZero && self->_relativeDateStyle == 2;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKRelativeDateTextProvider;
  -[CLKTextProvider description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLKRelativeDateTextProvider *v4;
  CLKRelativeDateTextProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKRelativeDateTextProvider;
  v4 = -[CLKTextProvider copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4 != self)
  {
    objc_storeStrong((id *)&v4->_date, self->_date);
    v5->_relativeDateStyle = self->_relativeDateStyle;
    v5->_calendarUnits = self->_calendarUnits;
    objc_storeStrong((id *)&v5->_relativeToDate, self->_relativeToDate);
    v5->_twoDigitMinuteZeroPadding = self->_twoDigitMinuteZeroPadding;
    v5->_showLeadingMinutes = self->_showLeadingMinutes;
    v5->_wantsSubsecondsAsDashes = self->_wantsSubsecondsAsDashes;
    v5->_wantsSubseconds = self->_wantsSubseconds;
    v5->_disableSmallCapUnits = self->_disableSmallCapUnits;
    v5->_shrinkUnitsInCJK = self->_shrinkUnitsInCJK;
    v5->_disableOffsetPrefix = self->_disableOffsetPrefix;
    v5->_pauseTimerAtZero = self->_pauseTimerAtZero;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  BOOL v5;
  objc_super v7;

  v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKRelativeDateTextProvider;
  v5 = -[CLKTextProvider isEqual:](&v7, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && CLKEqualObjects(self->_date, v4[25])
    && (void *)self->_relativeDateStyle == v4[27]
    && (void *)self->_calendarUnits == v4[28]
    && CLKEqualObjects(self->_relativeToDate, v4[26])
    && self->_twoDigitMinuteZeroPadding == *((unsigned __int8 *)v4 + 188)
    && self->_showLeadingMinutes == *((unsigned __int8 *)v4 + 189)
    && self->_wantsSubseconds == *((unsigned __int8 *)v4 + 190)
    && self->_wantsSubsecondsAsDashes == *((unsigned __int8 *)v4 + 191)
    && self->_disableSmallCapUnits == *((unsigned __int8 *)v4 + 185)
    && self->_shrinkUnitsInCJK == *((unsigned __int8 *)v4 + 186)
    && self->_disableOffsetPrefix == *((unsigned __int8 *)v4 + 187)
    && self->_pauseTimerAtZero == *((unsigned __int8 *)v4 + 192);

  return v5;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKRelativeDateTextProvider;
  v3 = -[CLKTextProvider hash](&v6, sel_hash);
  v4 = (unint64_t)v3
     + 16 * self->_calendarUnits
     + 4 * self->_relativeDateStyle
     + -[NSDate hash](self->_date, "hash");
  return v4
       + (-[NSDate hash](self->_relativeToDate, "hash") << 8)
       + ((unint64_t)self->_twoDigitMinuteZeroPadding << 9)
       + ((unint64_t)self->_showLeadingMinutes << 10)
       + ((unint64_t)self->_wantsSubseconds << 11)
       + ((unint64_t)self->_disableSmallCapUnits << 12)
       + ((unint64_t)self->_disableOffsetPrefix << 13)
       + ((unint64_t)self->_pauseTimerAtZero << 14)
       + ((unint64_t)self->_shrinkUnitsInCJK << 15);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLKRelativeDateTextProvider)initWithCoder:(id)a3
{
  id v4;
  CLKRelativeDateTextProvider *v5;
  uint64_t v6;
  NSDate *date;
  uint64_t v8;
  NSDate *relativeToDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKRelativeDateTextProvider;
  v5 = -[CLKTextProvider initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    v5->_relativeDateStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_style"));
    v5->_calendarUnits = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_units"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_relativeToDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    relativeToDate = v5->_relativeToDate;
    v5->_relativeToDate = (NSDate *)v8;

    v5->_twoDigitMinuteZeroPadding = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_twoDigitiMinuteZeroPadding"));
    v5->_showLeadingMinutes = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_showLeadingMinutes"));
    v5->_wantsSubseconds = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_wantsSubseconds"));
    v5->_disableSmallCapUnits = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_disableSmallCapUnits"));
    v5->_shrinkUnitsInCJK = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shrinkUnitsInCJK"));
    v5->_disableOffsetPrefix = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_disableOffsetPrefix"));
    v5->_pauseTimerAtZero = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_pauseTimerAtZero"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKRelativeDateTextProvider;
  v4 = a3;
  -[CLKTextProvider encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_date, CFSTR("_date"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_relativeDateStyle, CFSTR("_style"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_calendarUnits, CFSTR("_units"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_relativeToDate, CFSTR("_relativeToDate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_twoDigitMinuteZeroPadding, CFSTR("_twoDigitiMinuteZeroPadding"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_showLeadingMinutes, CFSTR("_showLeadingMinutes"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_wantsSubseconds, CFSTR("_wantsSubseconds"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_disableSmallCapUnits, CFSTR("_disableSmallCapUnits"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shrinkUnitsInCJK, CFSTR("_shrinkUnitsInCJK"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_disableOffsetPrefix, CFSTR("_disableOffsetPrefix"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_pauseTimerAtZero, CFSTR("_pauseTimerAtZero"));

}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLKRelativeDateTextProvider;
  v5 = -[CLKTextProvider _initWithJSONObjectRepresentation:](&v15, sel__initWithJSONObjectRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithJSONObjectRepresentation:", v6);
    v8 = (void *)v5[25];
    v5[25] = v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("relativeToDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithJSONObjectRepresentation:", v9);
      v11 = (void *)v5[26];
      v5[26] = v10;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("relativeDateStyle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("relativeDateStyle"), v12);
    v5[27] = (int)objc_msgSend(v12, "intValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("calendarUnits"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("calendarUnits"), v13);
    v5[28] = (int)objc_msgSend(v13, "intValue");
    objc_msgSend(v5, "setTimeTravelUpdateFrequency:", 2 * (v5[26] == 0));

  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSDate *relativeToDate;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLKRelativeDateTextProvider;
  -[CLKTextProvider JSONObjectRepresentation](&v10, sel_JSONObjectRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate JSONObjectRepresentation](self->_date, "JSONObjectRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("date"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_relativeDateStyle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("relativeDateStyle"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_calendarUnits);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("calendarUnits"));

  relativeToDate = self->_relativeToDate;
  if (relativeToDate)
  {
    -[NSDate JSONObjectRepresentation](relativeToDate, "JSONObjectRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("relativeToDate"));

  }
  return v3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(NSDate *)date
{
  objc_storeStrong((id *)&self->_date, date);
}

- (NSDate)relativeToDate
{
  return self->_relativeToDate;
}

- (void)setRelativeToDate:(NSDate *)relativeToDate
{
  objc_storeStrong((id *)&self->_relativeToDate, relativeToDate);
}

- (CLKRelativeDateStyle)relativeDateStyle
{
  return self->_relativeDateStyle;
}

- (void)setRelativeDateStyle:(CLKRelativeDateStyle)relativeDateStyle
{
  self->_relativeDateStyle = relativeDateStyle;
}

- (NSCalendarUnit)calendarUnits
{
  return self->_calendarUnits;
}

- (void)setCalendarUnits:(NSCalendarUnit)calendarUnits
{
  self->_calendarUnits = calendarUnits;
}

- (BOOL)disableSmallCapUnits
{
  return self->_disableSmallCapUnits;
}

- (void)setDisableSmallCapUnits:(BOOL)a3
{
  self->_disableSmallCapUnits = a3;
}

- (BOOL)shrinkUnitsInCJK
{
  return self->_shrinkUnitsInCJK;
}

- (void)setShrinkUnitsInCJK:(BOOL)a3
{
  self->_shrinkUnitsInCJK = a3;
}

- (BOOL)disableOffsetPrefix
{
  return self->_disableOffsetPrefix;
}

- (void)setDisableOffsetPrefix:(BOOL)a3
{
  self->_disableOffsetPrefix = a3;
}

- (BOOL)twoDigitMinuteZeroPadding
{
  return self->_twoDigitMinuteZeroPadding;
}

- (void)setTwoDigitMinuteZeroPadding:(BOOL)a3
{
  self->_twoDigitMinuteZeroPadding = a3;
}

- (BOOL)showLeadingMinutes
{
  return self->_showLeadingMinutes;
}

- (void)setShowLeadingMinutes:(BOOL)a3
{
  self->_showLeadingMinutes = a3;
}

- (BOOL)wantsSubseconds
{
  return self->_wantsSubseconds;
}

- (void)setWantsSubseconds:(BOOL)a3
{
  self->_wantsSubseconds = a3;
}

- (BOOL)wantsSubsecondsAsDashes
{
  return self->_wantsSubsecondsAsDashes;
}

- (void)setWantsSubsecondsAsDashes:(BOOL)a3
{
  self->_wantsSubsecondsAsDashes = a3;
}

- (BOOL)pauseTimerAtZero
{
  return self->_pauseTimerAtZero;
}

- (void)setPauseTimerAtZero:(BOOL)a3
{
  self->_pauseTimerAtZero = a3;
}

- (int64_t)tritiumDateStyle
{
  return self->_tritiumDateStyle;
}

- (void)setTritiumDateStyle:(int64_t)a3
{
  self->_tritiumDateStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeToDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_sessionCacheKey, 0);
  objc_storeStrong((id *)&self->_sessionComponents, 0);
  objc_storeStrong((id *)&self->_relativeDateTimeFormatter, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

- (void)_sessionAttributedTextForIndex:(NSObject *)a1 withStyle:.cold.1(NSObject *a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_2114F4000, a1, OS_LOG_TYPE_ERROR, "CLKRelativeDateTextProvider _sessionAttributedTextForIndex:withStyle: called outside of session.\n%@", (uint8_t *)&v3, 0xCu);

}

- (void)_validate
{
  void *v3;
  id v4;
  id v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_class();
  v4 = v3;
  v6 = 138412546;
  v7 = v3;
  v8 = 2112;
  v9 = (id)objc_opt_class();
  v5 = v9;
  _os_log_fault_impl(&dword_2114F4000, a2, OS_LOG_TYPE_FAULT, "Property ‘calendarUnits’ is empty on %@. This property must have at least one value when passing %@ to the complication data handler.", (uint8_t *)&v6, 0x16u);

}

@end
