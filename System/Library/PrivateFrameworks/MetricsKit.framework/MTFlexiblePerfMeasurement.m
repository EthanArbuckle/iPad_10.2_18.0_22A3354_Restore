@implementation MTFlexiblePerfMeasurement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventType, 0);
}

- (MTFlexiblePerfMeasurement)initWithMeasurementTransformer:(id)a3 eventType:(id)a4 eventData:(id)a5
{
  id v8;
  MTFlexiblePerfMeasurement *v9;
  uint64_t v10;
  NSString *eventType;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MTFlexiblePerfMeasurement;
  v9 = -[MTPerfBaseMeasurement initWithMeasurementTransformer:eventData:](&v13, sel_initWithMeasurementTransformer_eventData_, a3, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    eventType = v9->_eventType;
    v9->_eventType = (NSString *)v10;

  }
  return v9;
}

- (void)mark:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  -[MTFlexiblePerfMeasurement mark:time:](self, "mark:time:", v5, objc_msgSend(v4, "mt_longMillisecondsSince1970"));

}

- (void)mark:(id)a3 time:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithLongLong:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPerfBaseMeasurement timestamps](self, "timestamps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);

}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setXpSamplingForced:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("xpSamplingForced"));

}

- (void)setXpSamplingPercentage:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("xpSamplingPercentage"));

}

- (void)setEventType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)mark:(id)a3 date:(id)a4
{
  id v6;

  v6 = a3;
  -[MTFlexiblePerfMeasurement mark:time:](self, "mark:time:", v6, objc_msgSend(a4, "mt_longMillisecondsSince1970"));

}

@end
