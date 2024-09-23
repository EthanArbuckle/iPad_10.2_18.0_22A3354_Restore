@implementation HFAnalyticsCCPredictionEvent

+ (void)sendMetricsForPredictionEventAtStage:(unint64_t)a3 withCount:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("predictionStage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("predictionCount"));

  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 1, v8);
}

- (HFAnalyticsCCPredictionEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  HFAnalyticsCCPredictionEvent *v9;
  HFAnalyticsCCPredictionEvent *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("predictionStage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (!v6)
    NSLog(CFSTR("HFAnalyticsCCPredictionEvent predictionStage is invalid"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("predictionCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  v12.receiver = self;
  v12.super_class = (Class)HFAnalyticsCCPredictionEvent;
  v9 = -[HFAnalyticsEvent initWithEventType:](&v12, sel_initWithEventType_, 1);
  v10 = v9;
  if (v9)
  {
    v9->_predictionStage = v6;
    v9->_predictionCount = v8;
  }

  return v10;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsCCPredictionEvent;
  -[HFAnalyticsEvent payload](&v8, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HFAnalyticsCCPredictionEvent predictionStage](self, "predictionStage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("predictionStage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HFAnalyticsCCPredictionEvent predictionCount](self, "predictionCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("predictionCount"));

  return v4;
}

- (unint64_t)predictionStage
{
  return self->_predictionStage;
}

- (unint64_t)predictionCount
{
  return self->_predictionCount;
}

- (void)setPredictionStage:(unint64_t)a3
{
  self->_predictionStage = a3;
}

- (void)setPredictionCount:(unint64_t)a3
{
  self->_predictionCount = a3;
}

@end
