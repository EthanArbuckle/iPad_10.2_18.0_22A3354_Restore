@implementation HFSignificantTimeEventBuilder

- (id)compareToObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFSignificantTimeEventBuilder;
  -[HFEventBuilder compareToObject:](&v13, sel_compareToObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsCriticalDifference") & 1) == 0)
  {
    -[HFSignificantTimeEventBuilder significantEvent](self, "significantEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "significantEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v6, v7, CFSTR("significantEvent"), 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "add:", v8);

    -[HFSignificantTimeEventBuilder significantEventOffset](self, "significantEventOffset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "significantEventOffset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v9, v10, CFSTR("significantEventOffset"), 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "add:", v11);

  }
  return v5;
}

- (HFSignificantTimeEventBuilder)initWithEvent:(id)a3
{
  id v4;
  HFSignificantTimeEventBuilder *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFSignificantTimeEventBuilder;
  v5 = -[HFEventBuilder initWithEvent:](&v9, sel_initWithEvent_, v4);
  if (v5)
  {
    objc_msgSend(v4, "significantEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSignificantTimeEventBuilder setSignificantEvent:](v5, "setSignificantEvent:", v6);

    objc_msgSend(v4, "offset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSignificantTimeEventBuilder setSignificantEventOffset:](v5, "setSignificantEventOffset:", v7);

  }
  return v5;
}

- (id)buildNewEventsFromCurrentState
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_alloc(MEMORY[0x1E0CBA850]);
  -[HFSignificantTimeEventBuilder significantEvent](self, "significantEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSignificantTimeEventBuilder significantEventOffset](self, "significantEventOffset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithSignificantEvent:offset:", v5, v6);
  objc_msgSend(v3, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)naturalLanguageNameOfType:(unint64_t)a3 withHome:(id)a4 recurrences:(id)a5
{
  id v8;
  id v9;
  HFTriggerNaturalLanguageOptions *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = -[HFTriggerNaturalLanguageOptions initWithHome:nameType:]([HFTriggerNaturalLanguageOptions alloc], "initWithHome:nameType:", v9, a3);

  -[HFSignificantTimeEventBuilder naturalLanguageNameWithOptions:recurrences:](self, "naturalLanguageNameWithOptions:recurrences:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)naturalLanguageNameWithOptions:(id)a3 recurrences:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0CBA910];
  v7 = a4;
  v8 = a3;
  -[HFSignificantTimeEventBuilder significantEvent](self, "significantEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSignificantTimeEventBuilder significantEventOffset](self, "significantEventOffset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_naturalLanguageNameWithOptions:significantEvent:offset:recurrences:", v8, v9, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  return -[HFSignificantTimeEventBuilder naturalLanguageNameWithOptions:recurrences:](self, "naturalLanguageNameWithOptions:recurrences:", a3, MEMORY[0x1E0C9AA60]);
}

- (id)performValidation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HFSignificantTimeEventBuilder significantEvent](self, "significantEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x1E0D519C0];
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "futureWithError:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSignificantTimeEventBuilder significantEvent](self, "significantEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("significantEvent"));

  -[HFSignificantTimeEventBuilder significantEventOffset](self, "significantEventOffset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("offset"));

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)eventType
{
  return CFSTR("HFEventTypeTime");
}

- (id)comparisonKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)HFSignificantTimeEventBuilder;
  -[HFEventBuilder comparisonKey](&v9, sel_comparisonKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSignificantTimeEventBuilder significantEvent](self, "significantEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSignificantTimeEventBuilder significantEventOffset](self, "significantEventOffset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@:%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)significantEvent
{
  return self->_significantEvent;
}

- (void)setSignificantEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDateComponents)significantEventOffset
{
  return self->_significantEventOffset;
}

- (void)setSignificantEventOffset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantEventOffset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
}

@end
