@implementation HRAtrialFibrillationConfirmationCycleMetric

- (HRAtrialFibrillationConfirmationCycleMetric)initWithAgeBin:(unint64_t)a3 numberOfPositiveTachograms:(int64_t)a4 numberOfNegativeTachograms:(int64_t)a5 algorithmVersion:(int64_t)a6 biologicalSex:(int64_t)a7 userShouldBeAlerted:(BOOL)a8 cycleDuration:(double)a9 additionalMetrics:(id)a10
{
  _BOOL4 v11;
  id v17;
  HRAtrialFibrillationConfirmationCycleMetric *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableDictionary *eventPayload;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  objc_super v32;

  v11 = a8;
  v17 = a10;
  v32.receiver = self;
  v32.super_class = (Class)HRAtrialFibrillationConfirmationCycleMetric;
  v18 = -[HRAtrialFibrillationConfirmationCycleMetric init](&v32, sel_init);
  if (v18)
  {
    if (a4 >= 1)
      v19 = 0;
    else
      v19 = -1;
    if (v11)
      v20 = 1;
    else
      v20 = v19;
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v17);
    eventPayload = v18->_eventPayload;
    v18->_eventPayload = (NSMutableDictionary *)v21;

    NSStringFromHKHRAnalyticsAgeBin();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18->_eventPayload, "setObject:forKeyedSubscript:", v23, CFSTR("age"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18->_eventPayload, "setObject:forKeyedSubscript:", v24, CFSTR("numberOfPositiveTachograms"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18->_eventPayload, "setObject:forKeyedSubscript:", v25, CFSTR("numberOfNegativeTachograms"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18->_eventPayload, "setObject:forKeyedSubscript:", v26, CFSTR("algorithmVersionIRN"));

    if ((unint64_t)a7 > 3)
      v27 = CFSTR("Unknown");
    else
      v27 = off_1E87EFD20[a7];
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18->_eventPayload, "setObject:forKeyedSubscript:", v27, CFSTR("sex"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18->_eventPayload, "setObject:forKeyedSubscript:", v28, CFSTR("cycleResult"));

    if (a4 > 0 || v11)
      v29 = (uint64_t)(a9 / 60.0);
    else
      v29 = -1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18->_eventPayload, "setObject:forKeyedSubscript:", v30, CFSTR("cycleDuration"));

  }
  return v18;
}

- (NSDictionary)payload
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D80];
  -[HRAtrialFibrillationConfirmationCycleMetric eventPayload](self, "eventPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSMutableDictionary)eventPayload
{
  return self->_eventPayload;
}

- (void)setEventPayload:(id)a3
{
  objc_storeStrong((id *)&self->_eventPayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPayload, 0);
}

@end
