@implementation _SUITimeFormatData

+ (id)instanceForLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _SUITimeFormatData *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_timeFormatDataAccessLock"));
  objc_msgSend(v5, "lock");
  v6 = (void *)qword_1000B31B0;
  if (!qword_1000B31B0)
  {
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = (void *)qword_1000B31B0;
    qword_1000B31B0 = (uint64_t)v7;

    v6 = (void *)qword_1000B31B0;
  }
  v9 = (_SUITimeFormatData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));
  if (!v9)
  {
    v9 = -[_SUITimeFormatData initWithLocale:]([_SUITimeFormatData alloc], "initWithLocale:", v4);
    objc_msgSend((id)qword_1000B31B0, "setObject:forKeyedSubscript:", v9, v4);
  }
  objc_msgSend(v5, "unlock");

  return v9;
}

+ (id)_timeFormatDataAccessLock
{
  if (qword_1000B31C0[0] != -1)
    dispatch_once(qword_1000B31C0, &stru_10009DF48);
  return (id)qword_1000B31B8;
}

+ (id)_timeLocaleForLocale:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = objc_alloc((Class)NSLocale);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localeIdentifier"));

  v6 = objc_msgSend(v4, "initWithLocaleIdentifier:", v5);
  return v6;
}

- (_SUITimeFormatData)initWithLocale:(id)a3
{
  id v4;
  _SUITimeFormatData *v5;
  _SUITimeFormatData *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSString *formatHourMin;
  uint64_t v11;
  NSString *formatHourMinSecSubsec;
  uint64_t v13;
  NSString *formatHourMinSec;
  uint64_t v15;
  NSString *formatMinSecSubsec;
  uint64_t v17;
  NSString *formatMinSec;
  uint64_t v19;
  NSString *formatMin;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  NSString *v24;
  uint64_t v25;
  NSString *v26;
  NSNumberFormatter *v27;
  NSNumberFormatter *singleWidthNumberFormatter;
  NSNumberFormatter *v29;
  NSNumberFormatter *doubleWidthNumberFormatter;
  NSDateComponentsFormatter *v31;
  NSDateComponentsFormatter *abbreviatedHourDateFormatter;
  NSDateComponentsFormatter *v33;
  NSDateComponentsFormatter *abbreviatedHourMinuteDateFormatter;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)_SUITimeFormatData;
  v5 = -[_SUITimeFormatData init](&v36, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend((id)objc_opt_class(v5), "_timeLocaleForLocale:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("HHmm"), 0, v8));
    formatHourMin = v6->_formatHourMin;
    v6->_formatHourMin = (NSString *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("HHmmssSS"), 0, v8));
    formatHourMinSecSubsec = v6->_formatHourMinSecSubsec;
    v6->_formatHourMinSecSubsec = (NSString *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("HHmmss"), 0, v8));
    formatHourMinSec = v6->_formatHourMinSec;
    v6->_formatHourMinSec = (NSString *)v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("mmssSS"), 0, v8));
    formatMinSecSubsec = v6->_formatMinSecSubsec;
    v6->_formatMinSecSubsec = (NSString *)v15;

    v17 = objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("mmss"), 0, v8));
    formatMinSec = v6->_formatMinSec;
    v6->_formatMinSec = (NSString *)v17;

    v19 = objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("m"), 0, v8));
    formatMin = v6->_formatMin;
    v6->_formatMin = (NSString *)v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localeIdentifier"));
    v22 = objc_msgSend(v21, "hasPrefix:", CFSTR("ee_"));

    if (v22)
    {
      if (-[NSString hasPrefix:](v6->_formatMinSecSubsec, "hasPrefix:", CFSTR("'aɖabaƒoƒo' ")))
      {
        v23 = objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v6->_formatMinSecSubsec, "substringFromIndex:", objc_msgSend(CFSTR("'aɖabaƒoƒo' "), "length")));
        v24 = v6->_formatMinSecSubsec;
        v6->_formatMinSecSubsec = (NSString *)v23;

      }
      if (-[NSString hasPrefix:](v6->_formatMinSec, "hasPrefix:", CFSTR("'aɖabaƒoƒo' ")))
      {
        v25 = objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v6->_formatMinSec, "substringFromIndex:", objc_msgSend(CFSTR("'aɖabaƒoƒo' "), "length")));
        v26 = v6->_formatMinSec;
        v6->_formatMinSec = (NSString *)v25;

      }
    }
    v27 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    singleWidthNumberFormatter = v6->_singleWidthNumberFormatter;
    v6->_singleWidthNumberFormatter = v27;

    -[NSNumberFormatter setNumberStyle:](v6->_singleWidthNumberFormatter, "setNumberStyle:", 0);
    -[NSNumberFormatter setPositiveFormat:](v6->_singleWidthNumberFormatter, "setPositiveFormat:", CFSTR("0"));
    -[NSNumberFormatter setLocale:](v6->_singleWidthNumberFormatter, "setLocale:", v4);
    v29 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    doubleWidthNumberFormatter = v6->_doubleWidthNumberFormatter;
    v6->_doubleWidthNumberFormatter = v29;

    -[NSNumberFormatter setNumberStyle:](v6->_doubleWidthNumberFormatter, "setNumberStyle:", 0);
    -[NSNumberFormatter setPositiveFormat:](v6->_doubleWidthNumberFormatter, "setPositiveFormat:", CFSTR("00"));
    -[NSNumberFormatter setLocale:](v6->_doubleWidthNumberFormatter, "setLocale:", v4);
    v31 = (NSDateComponentsFormatter *)objc_alloc_init((Class)NSDateComponentsFormatter);
    abbreviatedHourDateFormatter = v6->_abbreviatedHourDateFormatter;
    v6->_abbreviatedHourDateFormatter = v31;

    -[NSDateComponentsFormatter setUnitsStyle:](v6->_abbreviatedHourDateFormatter, "setUnitsStyle:", 1);
    -[NSDateComponentsFormatter setAllowedUnits:](v6->_abbreviatedHourDateFormatter, "setAllowedUnits:", 32);
    v33 = (NSDateComponentsFormatter *)objc_alloc_init((Class)NSDateComponentsFormatter);
    abbreviatedHourMinuteDateFormatter = v6->_abbreviatedHourMinuteDateFormatter;
    v6->_abbreviatedHourMinuteDateFormatter = v33;

    -[NSDateComponentsFormatter setUnitsStyle:](v6->_abbreviatedHourMinuteDateFormatter, "setUnitsStyle:", 1);
    -[NSDateComponentsFormatter setAllowedUnits:](v6->_abbreviatedHourMinuteDateFormatter, "setAllowedUnits:", 96);

  }
  return v6;
}

- (NSString)formatHourMinSecSubsec
{
  return self->_formatHourMinSecSubsec;
}

- (NSString)formatHourMinSec
{
  return self->_formatHourMinSec;
}

- (NSString)formatHourMin
{
  return self->_formatHourMin;
}

- (NSString)formatMinSecSubsec
{
  return self->_formatMinSecSubsec;
}

- (NSString)formatMinSec
{
  return self->_formatMinSec;
}

- (NSString)formatMin
{
  return self->_formatMin;
}

- (NSNumberFormatter)singleWidthNumberFormatter
{
  return self->_singleWidthNumberFormatter;
}

- (NSNumberFormatter)doubleWidthNumberFormatter
{
  return self->_doubleWidthNumberFormatter;
}

- (NSDateComponentsFormatter)abbreviatedHourDateFormatter
{
  return self->_abbreviatedHourDateFormatter;
}

- (NSDateComponentsFormatter)abbreviatedHourMinuteDateFormatter
{
  return self->_abbreviatedHourMinuteDateFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abbreviatedHourMinuteDateFormatter, 0);
  objc_storeStrong((id *)&self->_abbreviatedHourDateFormatter, 0);
  objc_storeStrong((id *)&self->_doubleWidthNumberFormatter, 0);
  objc_storeStrong((id *)&self->_singleWidthNumberFormatter, 0);
  objc_storeStrong((id *)&self->_formatMin, 0);
  objc_storeStrong((id *)&self->_formatMinSec, 0);
  objc_storeStrong((id *)&self->_formatMinSecSubsec, 0);
  objc_storeStrong((id *)&self->_formatHourMin, 0);
  objc_storeStrong((id *)&self->_formatHourMinSec, 0);
  objc_storeStrong((id *)&self->_formatHourMinSecSubsec, 0);
}

@end
