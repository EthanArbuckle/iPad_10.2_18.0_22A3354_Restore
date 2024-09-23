@implementation CLKCurrentTimeTextProvider

- (CLKCurrentTimeTextProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKCurrentTimeTextProvider;
  return (CLKCurrentTimeTextProvider *)-[CLKTextProvider initPrivate](&v3, sel_initPrivate);
}

+ (id)textProviderWithTimeZone:(id)a3
{
  id v3;
  CLKCurrentTimeTextProvider *v4;

  v3 = a3;
  v4 = objc_alloc_init(CLKCurrentTimeTextProvider);
  -[CLKTimeTextProvider setTimeZone:](v4, "setTimeZone:", v3);

  -[CLKTextProvider setTimeTravelUpdateFrequency:](v4, "setTimeTravelUpdateFrequency:", 2);
  v4->_calendarUnits = 96;
  return v4;
}

- (int64_t)_updateFrequency
{
  return self->_overrideDate == 0;
}

- (void)_startSessionWithDate:(id)a3
{
  NSDate *v4;
  NSDate *v5;
  NSDate *overrideDate;
  NSDate *v7;
  void *v8;
  NSDateComponents *v9;
  NSDateComponents *sessionComponents;
  NSDate *v11;
  NSDate *v12;

  v4 = (NSDate *)a3;
  v5 = v4;
  overrideDate = self->_overrideDate;
  if (overrideDate)
  {
    v11 = v4;
    v7 = overrideDate;

    v5 = v7;
  }
  v12 = v5;
  -[CLKTimeTextProvider setDate:](self, "setDate:", v5);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", self->_calendarUnits, v12);
  v9 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  sessionComponents = self->_sessionComponents;
  self->_sessionComponents = v9;

  self->_sessionInProgress = 1;
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKCurrentTimeTextProvider;
  -[CLKTimeTextProvider _sessionAttributedTextForIndex:withStyle:](&v5, sel__sessionAttributedTextForIndex_withStyle_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_sessionCacheKey
{
  NSString *sessionCacheKey;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  NSString *v8;

  sessionCacheKey = self->_sessionCacheKey;
  if (!sessionCacheKey)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSDateComponents valueForComponent:](self->_sessionComponents, "valueForComponent:", 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("%@%@"), CFSTR("hr"), v5);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSDateComponents valueForComponent:](self->_sessionComponents, "valueForComponent:", 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("%@%@"), CFSTR("min"), v6);

    if (self->_overrideDate)
      v7 = CFSTR("override");
    else
      v7 = CFSTR("no_override");
    objc_msgSend(v4, "appendFormat:", CFSTR("%@"), v7);
    v8 = self->_sessionCacheKey;
    self->_sessionCacheKey = (NSString *)v4;

    sessionCacheKey = self->_sessionCacheKey;
  }
  return sessionCacheKey;
}

- (void)_endSession
{
  NSString *sessionCacheKey;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLKCurrentTimeTextProvider;
  -[CLKTextProvider _endSession](&v4, sel__endSession);
  sessionCacheKey = self->_sessionCacheKey;
  self->_sessionCacheKey = 0;

  self->_sessionInProgress = 0;
}

- (BOOL)_validate
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLKCurrentTimeTextProvider *v4;
  CLKCurrentTimeTextProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKCurrentTimeTextProvider;
  v4 = -[CLKTimeTextProvider copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4 != self)
  {
    v4->_calendarUnits = self->_calendarUnits;
    objc_storeStrong((id *)&v4->_overrideDate, self->_overrideDate);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  char v5;
  objc_super v7;

  v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKCurrentTimeTextProvider;
  if (-[CLKTimeTextProvider isEqual:](&v7, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (void *)self->_calendarUnits == v4[21])
  {
    v5 = CLKEqualObjects(self->_overrideDate, v4[25]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  char *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKCurrentTimeTextProvider;
  v3 = (char *)-[CLKTimeTextProvider hash](&v5, sel_hash) + 4 * self->_calendarUnits;
  return (unint64_t)&v3[16 * -[NSDate hash](self->_overrideDate, "hash")];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLKCurrentTimeTextProvider)initWithCoder:(id)a3
{
  id v4;
  CLKCurrentTimeTextProvider *v5;
  uint64_t v6;
  NSDate *overrideDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKCurrentTimeTextProvider;
  v5 = -[CLKTimeTextProvider initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_calendarUnits = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_units"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_overrideDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    overrideDate = v5->_overrideDate;
    v5->_overrideDate = (NSDate *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKCurrentTimeTextProvider;
  v4 = a3;
  -[CLKTimeTextProvider encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_calendarUnits, CFSTR("_units"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideDate, CFSTR("_overrideDate"));

}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKCurrentTimeTextProvider;
  v5 = -[CLKTimeTextProvider _initWithJSONObjectRepresentation:](&v8, sel__initWithJSONObjectRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("calendarUnits"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("calendarUnits"), v6);
    v5[21] = (int)objc_msgSend(v6, "intValue");
    objc_msgSend(v5, "setTimeTravelUpdateFrequency:", 2);

  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKCurrentTimeTextProvider;
  -[CLKTimeTextProvider JSONObjectRepresentation](&v6, sel_JSONObjectRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_calendarUnits);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("calendarUnits"));

  return v3;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_sessionCacheKey, 0);
  objc_storeStrong((id *)&self->_sessionComponents, 0);
}

@end
