@implementation CLKTimeFormatter

- (CLKTimeFormatter)init
{
  return -[CLKTimeFormatter initWithForcesLatinNumbers:](self, "initWithForcesLatinNumbers:", 0);
}

- (CLKTimeFormatter)initWithForcesLatinNumbers:(BOOL)a3
{
  return -[CLKTimeFormatter initWithForcesLatinNumbers:clockTimer:](self, "initWithForcesLatinNumbers:clockTimer:", a3, 0);
}

- (CLKTimeFormatter)initWithForcedNumberSystem:(unint64_t)a3
{
  return -[CLKTimeFormatter initWithForcedNumberSystem:clockTimer:](self, "initWithForcedNumberSystem:clockTimer:", a3, 0);
}

- (CLKTimeFormatter)initWithForcesLatinNumbers:(BOOL)a3 clockTimer:(id)a4
{
  return -[CLKTimeFormatter initWithForcedNumberSystem:clockTimer:](self, "initWithForcedNumberSystem:clockTimer:", a3 - 1, a4);
}

- (CLKTimeFormatter)initWithForcedNumberSystem:(unint64_t)a3 clockTimer:(id)a4
{
  id v6;
  CLKTimeFormatter *v7;
  CLKTimeFormatter *v8;
  uint64_t v9;
  NSHashTable *observers;
  uint64_t v11;
  NSMutableSet *reasonsToPause;
  void *v13;
  CLKClockTimer *v14;
  CLKClockTimer *timer;
  _QWORD block[4];
  CLKTimeFormatter *v18;
  objc_super v19;

  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CLKTimeFormatter;
  v7 = -[CLKTimeFormatter init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_forcedNumberSystem = a3;
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v9 = objc_claimAutoreleasedReturnValue();
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    reasonsToPause = v8->_reasonsToPause;
    v8->_reasonsToPause = (NSMutableSet *)v11;

    -[CLKTimeFormatter _invalidateDate:](v8, "_invalidateDate:", 0);
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58__CLKTimeFormatter_initWithForcedNumberSystem_clockTimer___block_invoke;
      block[3] = &unk_24CBF9F60;
      v18 = v8;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      -[CLKTimeFormatter _startOrStopUpdatesIfNecessary](v8, "_startOrStopUpdatesIfNecessary");
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, sel__invalidateText, CFSTR("_FormatterCacheInvalidatedNotification"), 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, sel__handleSignificantTimeChange, *MEMORY[0x24BEBDFF0], 0);
    v8->_includeSeparatorInTimeSubstringFromSeparatorText = 1;
    if (v6)
    {
      v14 = (CLKClockTimer *)v6;
    }
    else
    {
      +[CLKClockTimer sharedInstance](CLKClockTimer, "sharedInstance");
      v14 = (CLKClockTimer *)objc_claimAutoreleasedReturnValue();
    }
    timer = v8->_timer;
    v8->_timer = v14;

  }
  return v8;
}

uint64_t __58__CLKTimeFormatter_initWithForcedNumberSystem_clockTimer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startOrStopUpdatesIfNecessary");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (self->_secondsUpdateToken)
    -[CLKClockTimer stopUpdatesForToken:](self->_timer, "stopUpdatesForToken:");
  if (self->_minutesUpdateToken)
    -[CLKClockTimer stopUpdatesForToken:](self->_timer, "stopUpdatesForToken:");
  v4.receiver = self;
  v4.super_class = (Class)CLKTimeFormatter;
  -[CLKTimeFormatter dealloc](&v4, sel_dealloc);
}

- (void)setPaused:(BOOL)a3 forReason:(id)a4
{
  NSMutableSet *reasonsToPause;

  reasonsToPause = self->_reasonsToPause;
  if (a3)
    -[NSMutableSet addObject:](reasonsToPause, "addObject:", a4);
  else
    -[NSMutableSet removeObject:](reasonsToPause, "removeObject:", a4);
  -[CLKTimeFormatter _startOrStopUpdatesIfNecessary](self, "_startOrStopUpdatesIfNecessary");
}

- (void)setOverrideDate:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToDate:", self->_overrideDate) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideDate, a3);
    -[CLKTimeFormatter _startOrStopUpdatesIfNecessary](self, "_startOrStopUpdatesIfNecessary");
    -[CLKTimeFormatter _invalidateDate:](self, "_invalidateDate:", 0);
  }

}

- (BOOL)reportingLiveTime
{
  return !self->_overrideDate && -[NSMutableSet count](self->_reasonsToPause, "count") == 0;
}

- (void)setTimeZone:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToTimeZone:", self->_timeZone) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_timeZone, a3);
    -[CLKTimeFormatter _invalidateText](self, "_invalidateText");
  }

}

- (void)setTimeOffset:(double)a3
{
  if (!CLKFloatEqualsFloat(a3, self->_timeOffset))
  {
    self->_timeOffset = a3;
    -[CLKTimeFormatter _invalidateDate:](self, "_invalidateDate:", 0);
  }
}

- (void)setSuppressesDesignatorWhitespace:(BOOL)a3
{
  if (self->_suppressesDesignatorWhitespace != a3)
  {
    self->_suppressesDesignatorWhitespace = a3;
    -[CLKTimeFormatter _invalidateText](self, "_invalidateText");
  }
}

- (BOOL)_useNarrowDesignatorTextForGerman
{
  return self->_useNarrowDesignatorTextForGerman;
}

- (void)_setUseNarrowDesignatorTextForGerman:(BOOL)a3
{
  if (self->_useNarrowDesignatorTextForGerman != a3)
  {
    self->_useNarrowDesignatorTextForGerman = a3;
    -[CLKTimeFormatter _invalidateText](self, "_invalidateText");
  }
}

- (void)setForcedNumberSystem:(unint64_t)a3
{
  if (self->_forcedNumberSystem != a3)
  {
    self->_forcedNumberSystem = a3;
    -[CLKTimeFormatter _invalidateText](self, "_invalidateText");
  }
}

- (NSString)timeText
{
  NSString *timeText;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  timeText = self->_timeText;
  if (!timeText)
  {
    +[_CLKTimeFormatterCache sharedInstance](_CLKTimeFormatterCache, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeOnlyFormatterForTimeZone:hasSeconds:forcedNumberSystem:", self->_timeZone, self->_showSeconds, self->_forcedNumberSystem);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", self->_date);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_timeText;
    self->_timeText = v6;

    timeText = self->_timeText;
  }
  return timeText;
}

- (NSString)designatorText
{
  NSString *designatorText;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  designatorText = self->_designatorText;
  if (!designatorText)
  {
    -[CLKTimeFormatter _designatorRangeInTimeAndDesignatorText](self, "_designatorRangeInTimeAndDesignatorText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKTimeFormatter timeAndDesignatorText](self, "timeAndDesignatorText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromString:", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_designatorText;
    self->_designatorText = v6;

    designatorText = self->_designatorText;
  }
  return designatorText;
}

- (NSString)timeAndDesignatorText
{
  NSString *timeAndDesignatorText;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSString *v12;

  timeAndDesignatorText = self->_timeAndDesignatorText;
  if (!timeAndDesignatorText)
  {
    -[CLKTimeFormatter _timeAndDesignatorFormatter](self, "_timeAndDesignatorFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", self->_date);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CLKTimeFormatter _timeAndDesignatorFormatter](self, "_timeAndDesignatorFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDBCB20]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isEqualToString:", CFSTR("th")))
    {
      objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ก่อนเที่ยง"), CFSTR("AM"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("หลังเที่ยง"), CFSTR("PM"));
      v10 = objc_claimAutoreleasedReturnValue();
      v5 = v9;
    }
    else
    {
      if (!self->_useNarrowDesignatorTextForGerman || !objc_msgSend(v8, "isEqualToString:", CFSTR("de")))
        goto LABEL_10;
      if (objc_msgSend(v5, "rangeOfString:", CFSTR("vorm.")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("vorm."), CFSTR("v."));
        v11 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v11;
      }
      if (objc_msgSend(v5, "rangeOfString:", CFSTR("nachm.")) == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_10;
      objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("nachm."), CFSTR("n."));
      v10 = objc_claimAutoreleasedReturnValue();
    }

    v5 = (void *)v10;
LABEL_10:
    v12 = self->_timeAndDesignatorText;
    self->_timeAndDesignatorText = (NSString *)v5;

    timeAndDesignatorText = self->_timeAndDesignatorText;
  }
  return timeAndDesignatorText;
}

- (NSString)timeAndDesignatorTextWithoutMinutesIfZero
{
  NSString *timeAndDesignatorTextWithoutMinutesIfZero;
  id *p_timeAndDesignatorTextWithoutMinutesIfZero;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  p_timeAndDesignatorTextWithoutMinutesIfZero = (id *)&self->_timeAndDesignatorTextWithoutMinutesIfZero;
  timeAndDesignatorTextWithoutMinutesIfZero = self->_timeAndDesignatorTextWithoutMinutesIfZero;
  if (!timeAndDesignatorTextWithoutMinutesIfZero)
  {
    -[CLKTimeFormatter timeAndDesignatorText](self, "timeAndDesignatorText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CLKTimeFormatter separatorRangeInTimeAndDesignatorText](self, "separatorRangeInTimeAndDesignatorText");
    v8 = v7;
    v9 = -[CLKTimeFormatter designatorRangeInTimeAndDesignatorText](self, "designatorRangeInTimeAndDesignatorText");
    if (v10)
    {
      if (v9 > v6)
      {
        -[CLKTimeFormatter timeSubstringFromSeparatorText](self, "timeSubstringFromSeparatorText");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        objc_msgSend(v5, "substringWithRange:", v6 + v8, v12 - v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = objc_msgSend(v13, "isEqualToString:", CFSTR("00"));

        if ((_DWORD)v11)
        {
          objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", v6, v12, &stru_24CBFCB28);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = *p_timeAndDesignatorTextWithoutMinutesIfZero;
          *p_timeAndDesignatorTextWithoutMinutesIfZero = (id)v14;

        }
      }
    }
    if (!*p_timeAndDesignatorTextWithoutMinutesIfZero)
      objc_storeStrong(p_timeAndDesignatorTextWithoutMinutesIfZero, v5);

    timeAndDesignatorTextWithoutMinutesIfZero = (NSString *)*p_timeAndDesignatorTextWithoutMinutesIfZero;
  }
  return timeAndDesignatorTextWithoutMinutesIfZero;
}

- (NSString)timeSubstringToSeparatorText
{
  uint64_t v3;
  NSString *v4;
  NSString *v5;
  void *timeSubstringToSeparatorText;
  NSString *v7;
  NSString *v8;

  if (!self->_timeSubstringToSeparatorText)
  {
    v3 = -[CLKTimeFormatter separatorRangeInTimeText](self, "separatorRangeInTimeText");
    -[CLKTimeFormatter timeText](self, "timeText");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      timeSubstringToSeparatorText = self->_timeSubstringToSeparatorText;
      self->_timeSubstringToSeparatorText = v4;
    }
    else
    {
      -[NSString substringToIndex:](v4, "substringToIndex:", v3);
      timeSubstringToSeparatorText = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_zeroPadTimeSubstringToSeparatorText)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("%02d"), objc_msgSend(timeSubstringToSeparatorText, "integerValue"));
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = timeSubstringToSeparatorText;
      }
      v8 = self->_timeSubstringToSeparatorText;
      self->_timeSubstringToSeparatorText = v7;

    }
  }
  return self->_timeSubstringToSeparatorText;
}

- (void)setZeroPadTimeSubstringToSeparatorText:(BOOL)a3
{
  NSString *timeSubstringToSeparatorText;

  if (self->_zeroPadTimeSubstringToSeparatorText != a3)
  {
    self->_zeroPadTimeSubstringToSeparatorText = a3;
    timeSubstringToSeparatorText = self->_timeSubstringToSeparatorText;
    self->_timeSubstringToSeparatorText = 0;

  }
}

- (NSString)timeSubstringFromSeparatorText
{
  uint64_t v3;
  uint64_t v4;
  NSString *timeSubstringFromSeparatorText;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 includeSeparatorInTimeSubstringFromSeparatorText;
  NSString *v9;
  uint64_t v10;
  NSString *v11;
  NSString *v12;

  if (!self->_timeSubstringFromSeparatorText)
  {
    v3 = -[CLKTimeFormatter separatorRangeInTimeText](self, "separatorRangeInTimeText");
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      timeSubstringFromSeparatorText = self->_timeSubstringFromSeparatorText;
      self->_timeSubstringFromSeparatorText = (NSString *)&stru_24CBFCB28;
    }
    else
    {
      v6 = v3;
      v7 = v4;
      includeSeparatorInTimeSubstringFromSeparatorText = self->_includeSeparatorInTimeSubstringFromSeparatorText;
      -[CLKTimeFormatter timeText](self, "timeText");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      timeSubstringFromSeparatorText = v9;
      if (includeSeparatorInTimeSubstringFromSeparatorText)
        v10 = v6;
      else
        v10 = v6 + v7;
      -[NSString substringFromIndex:](v9, "substringFromIndex:", v10);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      v12 = self->_timeSubstringFromSeparatorText;
      self->_timeSubstringFromSeparatorText = v11;

    }
  }
  return self->_timeSubstringFromSeparatorText;
}

- (void)setIncludeSeparatorInTimeSubstringFromSeparatorText:(BOOL)a3
{
  NSString *timeSubstringFromSeparatorText;

  if (self->_includeSeparatorInTimeSubstringFromSeparatorText != a3)
  {
    self->_includeSeparatorInTimeSubstringFromSeparatorText = a3;
    timeSubstringFromSeparatorText = self->_timeSubstringFromSeparatorText;
    self->_timeSubstringFromSeparatorText = 0;

  }
}

- (_NSRange)designatorRangeInTimeAndDesignatorText
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[CLKTimeFormatter _designatorRangeInTimeAndDesignatorText](self, "_designatorRangeInTimeAndDesignatorText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[CLKTimeFormatter _designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero](self, "_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)timeAndDesignatorTextHasDesignator
{
  return -[CLKTimeFormatter designatorRangeInTimeAndDesignatorText](self, "designatorRangeInTimeAndDesignatorText") != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)timeAndDesignatorTextStartsWithDesignator
{
  return -[CLKTimeFormatter designatorRangeInTimeAndDesignatorText](self, "designatorRangeInTimeAndDesignatorText") == 0;
}

- (_NSRange)separatorRangeInTimeText
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[CLKTimeFormatter _separatorRangeInTimeText](self, "_separatorRangeInTimeText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)separatorRangeInTimeAndDesignatorText
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[CLKTimeFormatter _separatorRangeInTimeAndDesignatorText](self, "_separatorRangeInTimeAndDesignatorText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)blinkerRangeInTimeText
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[CLKTimeFormatter _blinkerRangeInTimeText](self, "_blinkerRangeInTimeText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)lastBlinkerRangeInTimeText
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[CLKTimeFormatter _lastBlinkerRangeInTimeText](self, "_lastBlinkerRangeInTimeText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)blinkerRangeInTimeAndDesignatorText
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[CLKTimeFormatter _blinkerRangeInTimeAndDesignatorText](self, "_blinkerRangeInTimeAndDesignatorText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)blinkerRangeInTimeSubstringToSeparatorText
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[CLKTimeFormatter _blinkerRangeInTimeSubstringToSeparatorText](self, "_blinkerRangeInTimeSubstringToSeparatorText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)blinkerRangeInTimeSubstringFromSeparatorText
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[CLKTimeFormatter _blinkerRangeInTimeSubstringFromSeparatorText](self, "_blinkerRangeInTimeSubstringFromSeparatorText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)rangeInTimeSubstringFromSecondsSeparatorText
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[CLKTimeFormatter _rangeInTimeSubstringFromSecondsSeparatorText](self, "_rangeInTimeSubstringFromSecondsSeparatorText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)_designatorRangeInText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  -[CLKTimeFormatter _timeAndDesignatorFormatter](self, "_timeAndDesignatorFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "AMSymbol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PMSymbol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", CFSTR("th")))
  {
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ก่อนเที่ยง"), CFSTR("AM"));
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("หลังเที่ยง"), CFSTR("PM"));
    v11 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v10;
LABEL_3:

    v7 = (void *)v11;
    goto LABEL_9;
  }
  if (self->_useNarrowDesignatorTextForGerman && objc_msgSend(v9, "isEqualToString:", CFSTR("de")))
  {
    if (objc_msgSend(v6, "rangeOfString:", CFSTR("vorm.")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("vorm."), CFSTR("v."));
      v12 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v12;
    }
    if (objc_msgSend(v7, "rangeOfString:", CFSTR("nachm.")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("nachm."), CFSTR("n."));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
  }
LABEL_9:
  v13 = objc_msgSend(v4, "rangeOfString:", v6);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    v13 = objc_msgSend(v4, "rangeOfString:", v7);
  +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_designatorRangeInTimeAndDesignatorText
{
  _CLKTimeFormatterSubstringRange *designatorRangeInTimeAndDesignatorText;
  void *v4;
  _CLKTimeFormatterSubstringRange *v5;
  _CLKTimeFormatterSubstringRange *v6;

  designatorRangeInTimeAndDesignatorText = self->_designatorRangeInTimeAndDesignatorText;
  if (!designatorRangeInTimeAndDesignatorText)
  {
    -[CLKTimeFormatter timeAndDesignatorText](self, "timeAndDesignatorText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKTimeFormatter _designatorRangeInText:](self, "_designatorRangeInText:", v4);
    v5 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    v6 = self->_designatorRangeInTimeAndDesignatorText;
    self->_designatorRangeInTimeAndDesignatorText = v5;

    designatorRangeInTimeAndDesignatorText = self->_designatorRangeInTimeAndDesignatorText;
  }
  return designatorRangeInTimeAndDesignatorText;
}

- (id)_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero
{
  _CLKTimeFormatterSubstringRange *designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero;
  void *v4;
  _CLKTimeFormatterSubstringRange *v5;
  _CLKTimeFormatterSubstringRange *v6;

  designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero = self->_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero;
  if (!designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero)
  {
    -[CLKTimeFormatter timeAndDesignatorTextWithoutMinutesIfZero](self, "timeAndDesignatorTextWithoutMinutesIfZero");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKTimeFormatter _designatorRangeInText:](self, "_designatorRangeInText:", v4);
    v5 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    v6 = self->_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero;
    self->_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero = v5;

    designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero = self->_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero;
  }
  return designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero;
}

- (id)_separatorRangeInTimeText
{
  _CLKTimeFormatterSubstringRange *separatorRangeInTimeText;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _CLKTimeFormatterSubstringRange *v8;
  _CLKTimeFormatterSubstringRange *v9;

  separatorRangeInTimeText = self->_separatorRangeInTimeText;
  if (!separatorRangeInTimeText)
  {
    -[CLKTimeFormatter timeText](self, "timeText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CLKTimeFormatter separatorNSRangeInTimeText:](self, "separatorNSRangeInTimeText:", v4);
    v7 = v6;

    +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v5, v7);
    v8 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    v9 = self->_separatorRangeInTimeText;
    self->_separatorRangeInTimeText = v8;

    separatorRangeInTimeText = self->_separatorRangeInTimeText;
  }
  return separatorRangeInTimeText;
}

- (id)_separatorRangeInTimeAndDesignatorText
{
  _CLKTimeFormatterSubstringRange *separatorRangeInTimeAndDesignatorText;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _CLKTimeFormatterSubstringRange *v10;
  _CLKTimeFormatterSubstringRange *v11;

  separatorRangeInTimeAndDesignatorText = self->_separatorRangeInTimeAndDesignatorText;
  if (!separatorRangeInTimeAndDesignatorText)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invertedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CLKTimeFormatter timeAndDesignatorText](self, "timeAndDesignatorText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v5);
    v9 = v8;

    +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v7, v9);
    v10 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    v11 = self->_separatorRangeInTimeAndDesignatorText;
    self->_separatorRangeInTimeAndDesignatorText = v10;

    separatorRangeInTimeAndDesignatorText = self->_separatorRangeInTimeAndDesignatorText;
  }
  return separatorRangeInTimeAndDesignatorText;
}

- (id)_blinkerRangeInTimeText
{
  _CLKTimeFormatterSubstringRange *blinkerRangeInTimeText;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _CLKTimeFormatterSubstringRange *v8;
  _CLKTimeFormatterSubstringRange *v9;

  blinkerRangeInTimeText = self->_blinkerRangeInTimeText;
  if (!blinkerRangeInTimeText)
  {
    -[CLKTimeFormatter timeText](self, "timeText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_clkBlinkerRange");
    v7 = v6;

    +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v5, v7);
    v8 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    v9 = self->_blinkerRangeInTimeText;
    self->_blinkerRangeInTimeText = v8;

    blinkerRangeInTimeText = self->_blinkerRangeInTimeText;
  }
  return blinkerRangeInTimeText;
}

- (id)_lastBlinkerRangeInTimeText
{
  _CLKTimeFormatterSubstringRange *lastBlinkerRangeInTimeText;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _CLKTimeFormatterSubstringRange *v8;
  _CLKTimeFormatterSubstringRange *v9;

  lastBlinkerRangeInTimeText = self->_lastBlinkerRangeInTimeText;
  if (!lastBlinkerRangeInTimeText)
  {
    -[CLKTimeFormatter timeText](self, "timeText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_clkBlinkerRangeByBackwardsSearch");
    v7 = v6;

    +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v5, v7);
    v8 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    v9 = self->_lastBlinkerRangeInTimeText;
    self->_lastBlinkerRangeInTimeText = v8;

    lastBlinkerRangeInTimeText = self->_lastBlinkerRangeInTimeText;
  }
  return lastBlinkerRangeInTimeText;
}

- (id)_blinkerRangeInTimeAndDesignatorText
{
  _CLKTimeFormatterSubstringRange *blinkerRangeInTimeAndDesignatorText;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _CLKTimeFormatterSubstringRange *v8;
  _CLKTimeFormatterSubstringRange *v9;

  blinkerRangeInTimeAndDesignatorText = self->_blinkerRangeInTimeAndDesignatorText;
  if (!blinkerRangeInTimeAndDesignatorText)
  {
    -[CLKTimeFormatter timeAndDesignatorText](self, "timeAndDesignatorText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_clkBlinkerRange");
    v7 = v6;

    +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v5, v7);
    v8 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    v9 = self->_blinkerRangeInTimeAndDesignatorText;
    self->_blinkerRangeInTimeAndDesignatorText = v8;

    blinkerRangeInTimeAndDesignatorText = self->_blinkerRangeInTimeAndDesignatorText;
  }
  return blinkerRangeInTimeAndDesignatorText;
}

- (id)_blinkerRangeInTimeSubstringToSeparatorText
{
  _CLKTimeFormatterSubstringRange *blinkerRangeInTimeSubstringToSeparatorText;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _CLKTimeFormatterSubstringRange *v8;
  _CLKTimeFormatterSubstringRange *v9;

  blinkerRangeInTimeSubstringToSeparatorText = self->_blinkerRangeInTimeSubstringToSeparatorText;
  if (!blinkerRangeInTimeSubstringToSeparatorText)
  {
    -[CLKTimeFormatter timeSubstringToSeparatorText](self, "timeSubstringToSeparatorText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_clkBlinkerRange");
    v7 = v6;

    +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v5, v7);
    v8 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    v9 = self->_blinkerRangeInTimeSubstringToSeparatorText;
    self->_blinkerRangeInTimeSubstringToSeparatorText = v8;

    blinkerRangeInTimeSubstringToSeparatorText = self->_blinkerRangeInTimeSubstringToSeparatorText;
  }
  return blinkerRangeInTimeSubstringToSeparatorText;
}

- (id)_blinkerRangeInTimeSubstringFromSeparatorText
{
  _CLKTimeFormatterSubstringRange *blinkerRangeInTimeSubstringFromSeparatorText;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _CLKTimeFormatterSubstringRange *v8;
  _CLKTimeFormatterSubstringRange *v9;

  blinkerRangeInTimeSubstringFromSeparatorText = self->_blinkerRangeInTimeSubstringFromSeparatorText;
  if (!blinkerRangeInTimeSubstringFromSeparatorText)
  {
    -[CLKTimeFormatter timeSubstringFromSeparatorText](self, "timeSubstringFromSeparatorText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_clkBlinkerRange");
    v7 = v6;

    +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v5, v7);
    v8 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    v9 = self->_blinkerRangeInTimeSubstringFromSeparatorText;
    self->_blinkerRangeInTimeSubstringFromSeparatorText = v8;

    blinkerRangeInTimeSubstringFromSeparatorText = self->_blinkerRangeInTimeSubstringFromSeparatorText;
  }
  return blinkerRangeInTimeSubstringFromSeparatorText;
}

- (id)_rangeInTimeSubstringFromSecondsSeparatorText
{
  _CLKTimeFormatterSubstringRange *rangeInTimeSubstringFromSecondsSeparatorText;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _CLKTimeFormatterSubstringRange *v11;
  _CLKTimeFormatterSubstringRange *v12;

  rangeInTimeSubstringFromSecondsSeparatorText = self->_rangeInTimeSubstringFromSecondsSeparatorText;
  if (!rangeInTimeSubstringFromSecondsSeparatorText)
  {
    -[CLKTimeFormatter timeText](self, "timeText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_clkBlinkerRangeByBackwardsSearch");
    v7 = v6;

    v8 = v5 + v7;
    -[CLKTimeFormatter timeText](self, "timeText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length") - v8;

    +[_CLKTimeFormatterSubstringRange rangeWithRange:](_CLKTimeFormatterSubstringRange, "rangeWithRange:", v8, v10);
    v11 = (_CLKTimeFormatterSubstringRange *)objc_claimAutoreleasedReturnValue();
    v12 = self->_rangeInTimeSubstringFromSecondsSeparatorText;
    self->_rangeInTimeSubstringFromSecondsSeparatorText = v11;

    rangeInTimeSubstringFromSecondsSeparatorText = self->_rangeInTimeSubstringFromSecondsSeparatorText;
  }
  return rangeInTimeSubstringFromSecondsSeparatorText;
}

- (id)_timeAndDesignatorFormatter
{
  void *v3;
  void *v4;

  +[_CLKTimeFormatterCache sharedInstance](_CLKTimeFormatterCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeAndDesignatorFormatterForTimeZone:suppressWhitespace:forcedNumberSystem:", self->_timeZone, self->_suppressesDesignatorWhitespace, self->_forcedNumberSystem);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_notifyTextDidChange
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_observers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "timeFormatterTextDidChange:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_notifyReportingLiveTimeDidChange
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_observers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "timeFormatterReportingLiveTimeDidChange:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_stopMinuteUpdates:(BOOL)a3
{
  _BOOL4 v3;
  CLKClockTimerToken *minutesUpdateToken;

  v3 = a3;
  if (self->_minutesUpdateToken)
  {
    -[CLKClockTimer stopUpdatesForToken:](self->_timer, "stopUpdatesForToken:");
    minutesUpdateToken = self->_minutesUpdateToken;
    self->_minutesUpdateToken = 0;

    if (v3)
      -[CLKTimeFormatter _notifyReportingLiveTimeDidChange](self, "_notifyReportingLiveTimeDidChange");
  }
}

- (void)_stopSecondsUpdates:(BOOL)a3
{
  _BOOL4 v3;
  CLKClockTimerToken *secondsUpdateToken;

  v3 = a3;
  if (self->_secondsUpdateToken)
  {
    -[CLKClockTimer stopUpdatesForToken:](self->_timer, "stopUpdatesForToken:");
    secondsUpdateToken = self->_secondsUpdateToken;
    self->_secondsUpdateToken = 0;

    if (v3)
      -[CLKTimeFormatter _notifyReportingLiveTimeDidChange](self, "_notifyReportingLiveTimeDidChange");
  }
}

- (void)_startOrStopUpdatesIfNecessary
{
  uint64_t v3;
  void *v4;
  void *v5;
  CLKClockTimerToken *v6;
  CLKClockTimerToken *secondsUpdateToken;
  CLKClockTimerToken *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (!-[CLKTimeFormatter reportingLiveTime](self, "reportingLiveTime"))
  {
    -[CLKTimeFormatter _stopMinuteUpdates:](self, "_stopMinuteUpdates:", 1);
    -[CLKTimeFormatter _stopSecondsUpdates:](self, "_stopSecondsUpdates:", 1);
    return;
  }
  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__CLKTimeFormatter__startOrStopUpdatesIfNecessary__block_invoke;
  v11[3] = &unk_24CBF9D60;
  objc_copyWeak(&v12, &location);
  v4 = (void *)MEMORY[0x212BDBEAC](v11);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __50__CLKTimeFormatter__startOrStopUpdatesIfNecessary__block_invoke_47;
  v9[3] = &unk_24CBF9D88;
  objc_copyWeak(&v10, &location);
  v5 = (void *)MEMORY[0x212BDBEAC](v9);
  if (self->_showSeconds)
  {
    -[CLKTimeFormatter _stopMinuteUpdates:](self, "_stopMinuteUpdates:", 0);
    if (!self->_secondsUpdateToken)
    {
      -[CLKClockTimer startUpdatesWithUpdateFrequency:withHandler:identificationLog:](self->_timer, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 1, v4, v5);
      v6 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
      secondsUpdateToken = self->_secondsUpdateToken;
      self->_secondsUpdateToken = v6;
LABEL_8:

      -[CLKTimeFormatter _notifyReportingLiveTimeDidChange](self, "_notifyReportingLiveTimeDidChange");
    }
  }
  else
  {
    -[CLKTimeFormatter _stopSecondsUpdates:](self, "_stopSecondsUpdates:", 0);
    if (!self->_minutesUpdateToken)
    {
      -[CLKClockTimer startUpdatesWithUpdateFrequency:withHandler:identificationLog:](self->_timer, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 0, v4, v5);
      v8 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
      secondsUpdateToken = self->_minutesUpdateToken;
      self->_minutesUpdateToken = v8;
      goto LABEL_8;
    }
  }
  -[CLKTimeFormatter _invalidateDate:](self, "_invalidateDate:", 0);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __50__CLKTimeFormatter__startOrStopUpdatesIfNecessary__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id WeakRetained;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateDate:", *a3);

}

__CFString *__50__CLKTimeFormatter__startOrStopUpdatesIfNecessary__block_invoke_47(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  __CFString *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 31);
    objc_msgSend(v3, "identifyingInfoForTimeFormatter:", v2);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("ERROR - nil self");
  }

  return v4;
}

- (void)_invalidateDate:(id)a3
{
  id v4;
  NSDate *overrideDate;
  NSDate *v6;
  void *v7;
  id v8;

  v4 = a3;
  overrideDate = self->_overrideDate;
  v8 = v4;
  if (overrideDate)
  {
    v6 = overrideDate;
  }
  else
  {
    v7 = v4;
    if (!v4)
    {
      +[CLKClockTimer now](CLKClockTimer, "now");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "dateByAddingTimeInterval:", self->_timeOffset);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (!v8)

  }
  if (!-[NSDate isEqualToDate:](v6, "isEqualToDate:", self->_date))
  {
    objc_storeStrong((id *)&self->_date, v6);
    -[CLKTimeFormatter _invalidateText](self, "_invalidateText");
  }

}

- (void)_invalidateText
{
  NSString *timeText;
  NSString *designatorText;
  NSString *timeAndDesignatorText;
  NSString *timeAndDesignatorTextWithoutMinutesIfZero;
  NSString *timeSubstringToSeparatorText;
  NSString *timeSubstringFromSeparatorText;
  _CLKTimeFormatterSubstringRange *timeRange;
  _CLKTimeFormatterSubstringRange *designatorRangeInTimeAndDesignatorText;
  _CLKTimeFormatterSubstringRange *designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero;
  _CLKTimeFormatterSubstringRange *blinkerRangeInTimeText;
  _CLKTimeFormatterSubstringRange *lastBlinkerRangeInTimeText;
  _CLKTimeFormatterSubstringRange *blinkerRangeInTimeAndDesignatorText;
  _CLKTimeFormatterSubstringRange *separatorRangeInTimeText;
  _CLKTimeFormatterSubstringRange *separatorRangeInTimeAndDesignatorText;
  _CLKTimeFormatterSubstringRange *rangeInTimeSubstringFromSecondsSeparatorText;
  _CLKTimeFormatterSubstringRange *v18;

  timeText = self->_timeText;
  self->_timeText = 0;

  designatorText = self->_designatorText;
  self->_designatorText = 0;

  timeAndDesignatorText = self->_timeAndDesignatorText;
  self->_timeAndDesignatorText = 0;

  timeAndDesignatorTextWithoutMinutesIfZero = self->_timeAndDesignatorTextWithoutMinutesIfZero;
  self->_timeAndDesignatorTextWithoutMinutesIfZero = 0;

  timeSubstringToSeparatorText = self->_timeSubstringToSeparatorText;
  self->_timeSubstringToSeparatorText = 0;

  timeSubstringFromSeparatorText = self->_timeSubstringFromSeparatorText;
  self->_timeSubstringFromSeparatorText = 0;

  timeRange = self->_timeRange;
  self->_timeRange = 0;

  designatorRangeInTimeAndDesignatorText = self->_designatorRangeInTimeAndDesignatorText;
  self->_designatorRangeInTimeAndDesignatorText = 0;

  designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero = self->_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero;
  self->_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero = 0;

  blinkerRangeInTimeText = self->_blinkerRangeInTimeText;
  self->_blinkerRangeInTimeText = 0;

  lastBlinkerRangeInTimeText = self->_lastBlinkerRangeInTimeText;
  self->_lastBlinkerRangeInTimeText = 0;

  blinkerRangeInTimeAndDesignatorText = self->_blinkerRangeInTimeAndDesignatorText;
  self->_blinkerRangeInTimeAndDesignatorText = 0;

  separatorRangeInTimeText = self->_separatorRangeInTimeText;
  self->_separatorRangeInTimeText = 0;

  separatorRangeInTimeAndDesignatorText = self->_separatorRangeInTimeAndDesignatorText;
  self->_separatorRangeInTimeAndDesignatorText = 0;

  rangeInTimeSubstringFromSecondsSeparatorText = self->_rangeInTimeSubstringFromSecondsSeparatorText;
  self->_rangeInTimeSubstringFromSecondsSeparatorText = 0;

  v18 = self->_lastBlinkerRangeInTimeText;
  self->_lastBlinkerRangeInTimeText = 0;

  -[CLKTimeFormatter _notifyTextDidChange](self, "_notifyTextDidChange");
}

- (void)_handleSignificantTimeChange
{
  if (!self->_timeZone)
    -[CLKTimeFormatter _invalidateText](self, "_invalidateText");
}

- (void)setShowSeconds:(BOOL)a3
{
  if (self->_showSeconds != a3)
  {
    self->_showSeconds = a3;
    -[CLKTimeFormatter _invalidateText](self, "_invalidateText");
  }
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (BOOL)suppressesDesignatorWhitespace
{
  return self->_suppressesDesignatorWhitespace;
}

- (NSNumber)fontTrackingAttribute
{
  return self->_fontTrackingAttribute;
}

- (void)setFontTrackingAttribute:(id)a3
{
  objc_storeStrong((id *)&self->_fontTrackingAttribute, a3);
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (unint64_t)forcedNumberSystem
{
  return self->_forcedNumberSystem;
}

- (BOOL)zeroPadTimeSubstringToSeparatorText
{
  return self->_zeroPadTimeSubstringToSeparatorText;
}

- (BOOL)includeSeparatorInTimeSubstringFromSeparatorText
{
  return self->_includeSeparatorInTimeSubstringFromSeparatorText;
}

- (BOOL)showSeconds
{
  return self->_showSeconds;
}

- (BOOL)forcesLatinNumbers
{
  return self->_forcesLatinNumbers;
}

- (CLKTimeFormatterDelegate)delegate
{
  return (CLKTimeFormatterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_fontTrackingAttribute, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_minutesUpdateToken, 0);
  objc_storeStrong((id *)&self->_secondsUpdateToken, 0);
  objc_storeStrong((id *)&self->_reasonsToPause, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_rangeInTimeSubstringFromSecondsSeparatorText, 0);
  objc_storeStrong((id *)&self->_blinkerRangeInTimeSubstringFromSeparatorText, 0);
  objc_storeStrong((id *)&self->_blinkerRangeInTimeSubstringToSeparatorText, 0);
  objc_storeStrong((id *)&self->_blinkerRangeInTimeAndDesignatorText, 0);
  objc_storeStrong((id *)&self->_lastBlinkerRangeInTimeText, 0);
  objc_storeStrong((id *)&self->_blinkerRangeInTimeText, 0);
  objc_storeStrong((id *)&self->_separatorRangeInTimeAndDesignatorText, 0);
  objc_storeStrong((id *)&self->_separatorRangeInTimeText, 0);
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero, 0);
  objc_storeStrong((id *)&self->_designatorRangeInTimeAndDesignatorText, 0);
  objc_storeStrong((id *)&self->_timeSubstringFromSeparatorText, 0);
  objc_storeStrong((id *)&self->_timeSubstringToSeparatorText, 0);
  objc_storeStrong((id *)&self->_timeAndDesignatorTextWithoutMinutesIfZero, 0);
  objc_storeStrong((id *)&self->_timeAndDesignatorText, 0);
  objc_storeStrong((id *)&self->_designatorText, 0);
  objc_storeStrong((id *)&self->_timeText, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (id)timeTextForNumberSystem:(unint64_t)a3
{
  void *v4;
  void *v6;
  void *v7;

  if (self->_forcedNumberSystem == a3)
  {
    -[CLKTimeFormatter timeText](self, "timeText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_CLKTimeFormatterCache sharedInstance](_CLKTimeFormatterCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeOnlyFormatterForTimeZone:hasSeconds:forcedNumberSystem:", self->_timeZone, self->_showSeconds, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate:", self->_date);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (_NSRange)separatorNSRangeInTimeText:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "decimalDigitCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v6);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

@end
