@implementation _CLKTimeFormatData

+ (void)resetTimeFormatData
{
  void *v2;
  id v3;

  objc_msgSend(a1, "_timeFormatDataAccessLock");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");
  v2 = (void *)__currentTimeFormatData;
  __currentTimeFormatData = 0;

  objc_msgSend(v3, "unlock");
}

+ (id)instanceForCurrentLocale
{
  void *v2;
  void *v3;
  _CLKTimeFormatData *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "_timeFormatDataAccessLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lock");
  v3 = (void *)__currentTimeFormatData;
  if (!__currentTimeFormatData)
  {
    v4 = objc_alloc_init(_CLKTimeFormatData);
    v5 = (void *)__currentTimeFormatData;
    __currentTimeFormatData = (uint64_t)v4;

    v3 = (void *)__currentTimeFormatData;
  }
  v6 = v3;
  objc_msgSend(v2, "unlock");

  return v6;
}

+ (id)_timeFormatDataAccessLock
{
  if (_timeFormatDataAccessLock_onceToken != -1)
    dispatch_once(&_timeFormatDataAccessLock_onceToken, &__block_literal_global_15);
  return (id)_timeFormatDataAccessLock_accessLock;
}

+ (id)_timeLocale
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BDBCEA0]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithLocaleIdentifier:", v4);

  return v5;
}

- (_CLKTimeFormatData)init
{
  _CLKTimeFormatData *v2;
  void *v3;
  uint64_t v4;
  NSString *formatHourMin;
  uint64_t v6;
  NSString *formatHourMinSecSubsec;
  uint64_t v8;
  NSString *formatHourMinSec;
  uint64_t v10;
  NSString *formatMinSecSubsec;
  uint64_t v12;
  NSString *formatMinSec;
  uint64_t v14;
  NSString *formatMin;
  void *v16;
  int v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  NSString *v21;
  NSNumberFormatter *v22;
  NSNumberFormatter *singleWidthNumberFormatter;
  NSNumberFormatter *v24;
  NSNumberFormatter *doubleWidthNumberFormatter;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)_CLKTimeFormatData;
  v2 = -[_CLKTimeFormatData init](&v27, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "_timeLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1500], "dateFormatFromTemplate:options:locale:", CFSTR("HHmm"), 0, v3);
    v4 = objc_claimAutoreleasedReturnValue();
    formatHourMin = v2->_formatHourMin;
    v2->_formatHourMin = (NSString *)v4;

    objc_msgSend(MEMORY[0x24BDD1500], "dateFormatFromTemplate:options:locale:", CFSTR("HHmmssSS"), 0, v3);
    v6 = objc_claimAutoreleasedReturnValue();
    formatHourMinSecSubsec = v2->_formatHourMinSecSubsec;
    v2->_formatHourMinSecSubsec = (NSString *)v6;

    objc_msgSend(MEMORY[0x24BDD1500], "dateFormatFromTemplate:options:locale:", CFSTR("HHmmss"), 0, v3);
    v8 = objc_claimAutoreleasedReturnValue();
    formatHourMinSec = v2->_formatHourMinSec;
    v2->_formatHourMinSec = (NSString *)v8;

    objc_msgSend(MEMORY[0x24BDD1500], "dateFormatFromTemplate:options:locale:", CFSTR("mmssSS"), 0, v3);
    v10 = objc_claimAutoreleasedReturnValue();
    formatMinSecSubsec = v2->_formatMinSecSubsec;
    v2->_formatMinSecSubsec = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDD1500], "dateFormatFromTemplate:options:locale:", CFSTR("mmss"), 0, v3);
    v12 = objc_claimAutoreleasedReturnValue();
    formatMinSec = v2->_formatMinSec;
    v2->_formatMinSec = (NSString *)v12;

    objc_msgSend(MEMORY[0x24BDD1500], "dateFormatFromTemplate:options:locale:", CFSTR("m"), 0, v3);
    v14 = objc_claimAutoreleasedReturnValue();
    formatMin = v2->_formatMin;
    v2->_formatMin = (NSString *)v14;

    objc_msgSend(v3, "localeIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasPrefix:", CFSTR("ee_"));

    if (v17)
    {
      if (-[NSString hasPrefix:](v2->_formatMinSecSubsec, "hasPrefix:", CFSTR("'aɖabaƒoƒo' ")))
      {
        -[NSString substringFromIndex:](v2->_formatMinSecSubsec, "substringFromIndex:", objc_msgSend(CFSTR("'aɖabaƒoƒo' "), "length"));
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v2->_formatMinSecSubsec;
        v2->_formatMinSecSubsec = (NSString *)v18;

      }
      if (-[NSString hasPrefix:](v2->_formatMinSec, "hasPrefix:", CFSTR("'aɖabaƒoƒo' ")))
      {
        -[NSString substringFromIndex:](v2->_formatMinSec, "substringFromIndex:", objc_msgSend(CFSTR("'aɖabaƒoƒo' "), "length"));
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v2->_formatMinSec;
        v2->_formatMinSec = (NSString *)v20;

      }
    }
    v22 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    singleWidthNumberFormatter = v2->_singleWidthNumberFormatter;
    v2->_singleWidthNumberFormatter = v22;

    -[NSNumberFormatter setNumberStyle:](v2->_singleWidthNumberFormatter, "setNumberStyle:", 0);
    -[NSNumberFormatter setPositiveFormat:](v2->_singleWidthNumberFormatter, "setPositiveFormat:", CFSTR("0"));
    v24 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    doubleWidthNumberFormatter = v2->_doubleWidthNumberFormatter;
    v2->_doubleWidthNumberFormatter = v24;

    -[NSNumberFormatter setNumberStyle:](v2->_doubleWidthNumberFormatter, "setNumberStyle:", 0);
    -[NSNumberFormatter setPositiveFormat:](v2->_doubleWidthNumberFormatter, "setPositiveFormat:", CFSTR("00"));

  }
  return v2;
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

- (void).cxx_destruct
{
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
