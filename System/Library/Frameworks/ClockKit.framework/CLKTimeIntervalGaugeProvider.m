@implementation CLKTimeIntervalGaugeProvider

+ (CLKTimeIntervalGaugeProvider)gaugeProviderWithStyle:(CLKGaugeProviderStyle)style gaugeColors:(NSArray *)gaugeColors gaugeColorLocations:(NSArray *)gaugeColorLocations startDate:(NSDate *)startDate startFillFraction:(float)startFillFraction endDate:(NSDate *)endDate endFillFraction:(float)endFillFraction
{
  NSDate *v15;
  NSDate *v16;
  NSArray *v17;
  NSArray *v18;
  id v19;
  double v20;
  double v21;

  v15 = endDate;
  v16 = startDate;
  v17 = gaugeColorLocations;
  v18 = gaugeColors;
  v19 = -[CLKGaugeProvider _init]([CLKTimeIntervalGaugeProvider alloc], "_init");
  objc_msgSend(v19, "setStyle:", style);
  objc_msgSend(v19, "setGaugeColors:", v18);

  objc_msgSend(v19, "setGaugeColorLocations:", v17);
  objc_msgSend(v19, "setStartDate:", v16);

  objc_msgSend(v19, "setEndDate:", v15);
  *(float *)&v20 = startFillFraction;
  objc_msgSend(v19, "setStartFillFraction:", v20);
  *(float *)&v21 = endFillFraction;
  objc_msgSend(v19, "setEndFillFraction:", v21);
  return (CLKTimeIntervalGaugeProvider *)v19;
}

+ (CLKTimeIntervalGaugeProvider)gaugeProviderWithStyle:(CLKGaugeProviderStyle)style gaugeColors:(NSArray *)gaugeColors gaugeColorLocations:(NSArray *)gaugeColorLocations startDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  double v7;
  double v8;

  LODWORD(v7) = 0;
  LODWORD(v8) = 1.0;
  return (CLKTimeIntervalGaugeProvider *)objc_msgSend(a1, "gaugeProviderWithStyle:gaugeColors:gaugeColorLocations:startDate:startFillFraction:endDate:endFillFraction:", style, gaugeColors, gaugeColorLocations, startDate, endDate, v7, v8);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKTimeIntervalGaugeProvider;
  v4 = a3;
  -[CLKGaugeProvider encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, CFSTR("_StartDateKey"), v7.receiver, v7.super_class);
  *(float *)&v5 = self->_startFillFraction;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("_StartFillFractionKey"), v5);
  objc_msgSend(v4, "encodeObject:forKey:", self->_endDate, CFSTR("_EndDateKey"));
  *(float *)&v6 = self->_endFillFraction;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("_EndFillFractionKey"), v6);

}

- (CLKTimeIntervalGaugeProvider)initWithCoder:(id)a3
{
  id v4;
  CLKTimeIntervalGaugeProvider *v5;
  uint64_t v6;
  NSDate *startDate;
  float v8;
  uint64_t v9;
  NSDate *endDate;
  float v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLKTimeIntervalGaugeProvider;
  v5 = -[CLKGaugeProvider initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_StartDateKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_StartFillFractionKey"));
    v5->_startFillFraction = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_EndDateKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v9;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_EndFillFractionKey"));
    v5->_endFillFraction = v11;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[CLKTimeIntervalGaugeProvider _maybeStartOrStopUpdates](self, "_maybeStartOrStopUpdates");
  }
}

- (BOOL)paused
{
  return self->_paused;
}

- (BOOL)needsTimerUpdates
{
  return 1;
}

- (double)progressFractionForNow:(id)a3
{
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  float endFillFraction;
  double v10;
  double v11;

  objc_msgSend(a3, "timeIntervalSinceDate:", self->_startDate);
  v5 = v4;
  if (v4 < 0.00000011920929)
  {
    v6 = 76;
    return *(float *)((char *)&self->super.super.isa + v6);
  }
  -[NSDate timeIntervalSinceDate:](self->_endDate, "timeIntervalSinceDate:", self->_startDate);
  if (v7 < 0.00000011920929)
  {
    v6 = 80;
    return *(float *)((char *)&self->super.super.isa + v6);
  }
  v10 = v5 / v7;
  v11 = v7 + -0.00000011920929;
  endFillFraction = self->_endFillFraction;
  if (v10 > v11)
    return endFillFraction;
  return self->_startFillFraction + v10 * (float)(endFillFraction - self->_startFillFraction);
}

- (id)startUpdatesWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *updateHandlersByToken;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_nextUpdateToken);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ++self->_nextUpdateToken;
  if (!self->_updateHandlersByToken)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    updateHandlersByToken = self->_updateHandlersByToken;
    self->_updateHandlersByToken = v6;

  }
  v8 = (void *)objc_msgSend(v4, "copy");
  v9 = (void *)MEMORY[0x212BDBEAC]();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_updateHandlersByToken, "setObject:forKeyedSubscript:", v9, v5);

  -[CLKTimeIntervalGaugeProvider _maybeStartOrStopUpdates](self, "_maybeStartOrStopUpdates");
  return v5;
}

- (void)stopUpdatesForToken:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_updateHandlersByToken, "removeObjectForKey:", a3);
  -[CLKTimeIntervalGaugeProvider _maybeStartOrStopUpdates](self, "_maybeStartOrStopUpdates");
}

- (void)_maybeStartOrStopUpdates
{
  void *v3;
  CLKClockTimerToken *v4;
  void *v5;
  uint64_t v6;
  CLKClockTimerToken *v7;
  CLKClockTimerToken *timerToken;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (-[NSMutableDictionary count](self->_updateHandlersByToken, "count")
    && !-[CLKTimeIntervalGaugeProvider paused](self, "paused"))
  {
    if (!self->_timerToken)
    {
      objc_initWeak(&location, self);
      +[CLKClockTimer sharedInstance](CLKClockTimer, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = MEMORY[0x24BDAC760];
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __56__CLKTimeIntervalGaugeProvider__maybeStartOrStopUpdates__block_invoke;
      v11[3] = &unk_24CBF9D60;
      objc_copyWeak(&v12, &location);
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __56__CLKTimeIntervalGaugeProvider__maybeStartOrStopUpdates__block_invoke_14;
      v9[3] = &unk_24CBF9D88;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v5, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 1, v11, v9);
      v7 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
      timerToken = self->_timerToken;
      self->_timerToken = v7;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  else if (self->_timerToken)
  {
    +[CLKClockTimer sharedInstance](CLKClockTimer, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopUpdatesForToken:", self->_timerToken);

    v4 = self->_timerToken;
    self->_timerToken = 0;

  }
}

void __56__CLKTimeIntervalGaugeProvider__maybeStartOrStopUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id WeakRetained;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_update");

}

id __56__CLKTimeIntervalGaugeProvider__maybeStartOrStopUpdates__block_invoke_14(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_update
{
  NSMutableDictionary *updateHandlersByToken;
  _QWORD v4[5];

  updateHandlersByToken = self->_updateHandlersByToken;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__CLKTimeIntervalGaugeProvider__update__block_invoke;
  v4[3] = &unk_24CBF9DB0;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](updateHandlersByToken, "enumerateKeysAndObjectsUsingBlock:", v4);
  -[CLKTimeIntervalGaugeProvider _maybeStartOrStopUpdates](self, "_maybeStartOrStopUpdates");
}

uint64_t __39__CLKTimeIntervalGaugeProvider__update__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, *(_QWORD *)(a1 + 32));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSDate *startDate;
  NSDate *v6;
  BOOL v7;
  NSDate *endDate;
  NSDate *v9;
  float startFillFraction;
  float v11;
  float endFillFraction;
  float v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLKTimeIntervalGaugeProvider;
  if (-[CLKGaugeProvider isEqual:](&v15, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    startDate = self->_startDate;
    objc_msgSend(v4, "startDate");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (startDate == v6)
    {
      endDate = self->_endDate;
      objc_msgSend(v4, "endDate");
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
      if (endDate == v9
        && (startFillFraction = self->_startFillFraction, objc_msgSend(v4, "startFillFraction"),
                                                          startFillFraction == v11))
      {
        endFillFraction = self->_endFillFraction;
        objc_msgSend(v4, "endFillFraction");
        v7 = endFillFraction == v13;
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  unint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLKTimeIntervalGaugeProvider;
  v3 = (double)-[CLKGaugeProvider hash](&v13, sel_hash);
  *(float *)&v4 = self->_startFillFraction;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)(unint64_t)objc_msgSend(v5, "hash");
  v7 = v3 + v6 * 100000.0;
  *(float *)&v6 = self->_endFillFraction;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 + (double)(unint64_t)objc_msgSend(v8, "hash") * 10000.0;
  v10 = v9 + (double)(unint64_t)-[NSDate hash](self->_startDate, "hash") * 1000.0;
  v11 = (unint64_t)(v10 + (double)(unint64_t)-[NSDate hash](self->_endDate, "hash") * 100.0);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLKTimeIntervalGaugeProvider *v4;
  CLKTimeIntervalGaugeProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKTimeIntervalGaugeProvider;
  v4 = -[CLKGaugeProvider copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4 != self)
  {
    objc_storeStrong((id *)&v4->_startDate, self->_startDate);
    objc_storeStrong((id *)&v5->_endDate, self->_endDate);
    v5->_startFillFraction = self->_startFillFraction;
    v5->_endFillFraction = self->_endFillFraction;
  }
  return v5;
}

- (CLKTimeIntervalGaugeProvider)initWithJSONObjectRepresentation:(id)a3
{
  id v4;
  CLKTimeIntervalGaugeProvider *v5;
  void *v6;
  uint64_t v7;
  NSDate *startDate;
  void *v9;
  uint64_t v10;
  NSDate *endDate;
  void *v12;
  float v13;
  void *v14;
  float v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CLKTimeIntervalGaugeProvider;
  v5 = -[CLKGaugeProvider initWithJSONObjectRepresentation:](&v17, sel_initWithJSONObjectRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gaugeStartDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithJSONObjectRepresentation:", v6);
      startDate = v5->_startDate;
      v5->_startDate = (NSDate *)v7;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gaugeEndDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithJSONObjectRepresentation:", v9);
      endDate = v5->_endDate;
      v5->_endDate = (NSDate *)v10;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gaugeStartFillFraction"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      v5->_startFillFraction = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("gaugeColorLocations"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("gaugeStartFillFraction"), v12);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gaugeEndFillFraction"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "floatValue");
      v5->_endFillFraction = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("gaugeColorLocations"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("gaugeEndFillFraction"), v14);
    }

  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  void *v3;
  void *v4;
  double v5;
  NSDate *startDate;
  void *v7;
  NSDate *endDate;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLKTimeIntervalGaugeProvider;
  -[CLKGaugeProvider JSONObjectRepresentation](&v14, sel_JSONObjectRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  startDate = self->_startDate;
  if (startDate)
  {
    -[NSDate JSONObjectRepresentation](startDate, "JSONObjectRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("gaugeStartDate"));

  }
  endDate = self->_endDate;
  if (endDate)
  {
    -[NSDate JSONObjectRepresentation](endDate, "JSONObjectRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("gaugeEndDate"));

  }
  *(float *)&v5 = self->_startFillFraction;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("gaugeStartFillFraction"));

  *(float *)&v11 = self->_endFillFraction;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("gaugeEndFillFraction"));

  return v4;
}

- (BOOL)validate
{
  _BOOL4 v3;
  NSDate *startDate;
  NSObject *v5;
  float startFillFraction;
  float endFillFraction;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLKTimeIntervalGaugeProvider;
  v3 = -[CLKGaugeProvider validate](&v11, sel_validate);
  if (v3)
  {
    startDate = self->_startDate;
    if (!startDate)
    {
      CLKLoggingObjectForDomain(10);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[CLKTimeIntervalGaugeProvider validate].cold.1();
      goto LABEL_23;
    }
    if (!self->_endDate)
    {
      CLKLoggingObjectForDomain(10);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[CLKTimeIntervalGaugeProvider validate].cold.2();
      goto LABEL_23;
    }
    if (-[NSDate compare:](startDate, "compare:") != NSOrderedAscending)
    {
      CLKLoggingObjectForDomain(10);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[CLKTimeIntervalGaugeProvider validate].cold.5((uint64_t)self, v5);
LABEL_23:

      LOBYTE(v3) = 0;
      return v3;
    }
    startFillFraction = self->_startFillFraction;
    if (startFillFraction < 0.0 || startFillFraction > 1.0)
    {
      CLKLoggingObjectForDomain(10);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[CLKTimeIntervalGaugeProvider validate].cold.3();
      goto LABEL_23;
    }
    endFillFraction = self->_endFillFraction;
    if (endFillFraction < 0.0 || endFillFraction > 1.0)
    {
      CLKLoggingObjectForDomain(10);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[CLKTimeIntervalGaugeProvider validate].cold.4();
      goto LABEL_23;
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (float)startFillFraction
{
  return self->_startFillFraction;
}

- (void)setStartFillFraction:(float)a3
{
  self->_startFillFraction = a3;
}

- (float)endFillFraction
{
  return self->_endFillFraction;
}

- (void)setEndFillFraction:(float)a3
{
  self->_endFillFraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timerToken, 0);
  objc_storeStrong((id *)&self->_updateHandlersByToken, 0);
}

- (void)validate
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_fault_impl(&dword_2114F4000, a2, OS_LOG_TYPE_FAULT, "Value of 'startDate' must be earlier than 'endDate' on %@.", (uint8_t *)&v4, 0xCu);

}

@end
