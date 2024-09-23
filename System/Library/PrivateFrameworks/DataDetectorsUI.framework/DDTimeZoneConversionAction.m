@implementation DDTimeZoneConversionAction

+ (id)timeZoneFromResult:(__DDResult *)a3 date:(id *)a4
{
  id v5;

  if (DDResultCopyExtractedDateFromReferenceDate())
  {
    if (a4)
      *a4 = 0;
    return 0;
  }
  if (!DDResultCopyExtractedStartDateEndDate())
    return 0;
  if (a4)
    *a4 = objc_retainAutorelease(0);
  v5 = 0;

  return v5;
}

+ (BOOL)actionAvailableForResult:(__DDResult *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  int v9;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeZoneFromResult:date:", a3, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
    LOBYTE(v9) = 0;
  else
    v9 = objc_msgSend(v5, "isEqualToTimeZone:", v6) ^ 1;

  return v9;
}

- (DDTimeZoneConversionAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  DDTimeZoneConversionAction *v6;
  uint64_t v7;
  NSDate *v8;
  NSTimeZone *tz;
  NSDate *date;
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DDTimeZoneConversionAction;
  v6 = -[DDConversionAction initWithURL:result:context:](&v13, sel_initWithURL_result_context_, a3, a4, a5);
  if (v6)
  {
    v12 = 0;
    +[DDTimeZoneConversionAction timeZoneFromResult:date:](DDTimeZoneConversionAction, "timeZoneFromResult:date:", a4, &v12);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (NSDate *)v12;
    tz = v6->_tz;
    v6->_tz = (NSTimeZone *)v7;

    date = v6->_date;
    v6->_date = v8;

  }
  return v6;
}

- (id)_titleWithValue
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateStyle:", 2);
  objc_msgSend(v3, "setTimeStyle:", 1);
  objc_msgSend(v3, "stringFromDate:", self->_date);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedName
{
  void *v3;
  void *v4;

  if (-[DDConversionAction calloutFlavor](self, "calloutFlavor"))
  {
    -[DDTimeZoneConversionAction _titleWithValue](self, "_titleWithValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName:locale:", 4, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_tz, 0);
}

@end
