@implementation HFDurationEventBuilder

- (HFDurationEventBuilder)initWithEvent:(id)a3
{
  id v4;
  HFDurationEventBuilder *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFDurationEventBuilder;
  v5 = -[HFEventBuilder initWithEvent:](&v8, sel_initWithEvent_, v4);
  if (v5)
  {
    objc_msgSend(v4, "duration");
    v5->_duration = v6;
  }

  return v5;
}

- (id)buildNewEventsFromCurrentState
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_alloc(MEMORY[0x1E0CBA4A8]);
  -[HFDurationEventBuilder duration](self, "duration");
  v5 = (void *)objc_msgSend(v4, "initWithDuration:");
  objc_msgSend(v3, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDurationEventBuilder duration](self, "duration");
  v4 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("duration"), 1);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)eventType
{
  return CFSTR("HFEventTypeDuration");
}

- (id)comparisonKey
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HFDurationEventBuilder;
  -[HFEventBuilder comparisonKey](&v8, sel_comparisonKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDurationEventBuilder duration](self, "duration");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%f"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (id)compareToObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFDurationEventBuilder;
  -[HFEventBuilder compareToObject:](&v12, sel_compareToObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsCriticalDifference") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[HFDurationEventBuilder duration](self, "duration");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "duration");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v7, v9, CFSTR("duration"), 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "add:", v10);

  }
  return v5;
}

@end
