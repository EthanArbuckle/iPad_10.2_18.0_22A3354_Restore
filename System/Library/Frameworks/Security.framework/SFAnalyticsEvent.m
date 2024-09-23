@implementation SFAnalyticsEvent

- (id)initFromRow:(id)a3
{
  id v4;
  SFAnalyticsEvent *v5;
  uint64_t v6;
  NSDictionary *record;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSNumber *timestamp;
  SFAnalyticsEvent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFAnalyticsEvent;
  v5 = -[SFAnalyticsEvent init](&v14, sel_init);
  if (v5)
  {
    deserializedRecordFromRow(v4);
    v6 = objc_claimAutoreleasedReturnValue();
    record = v5->_record;
    v5->_record = (NSDictionary *)v6;

    if (!v5->_record)
    {
      v12 = 0;
      goto LABEL_6;
    }
    v8 = objc_msgSend(v4, "indexForColumnName:", CFSTR("timestamp"));
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "doubleAtIndex:", v8);
    objc_msgSend(v9, "numberWithDouble:");
    v10 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v10;

  }
  v12 = v5;
LABEL_6:

  return v12;
}

- (NSDictionary)record
{
  return self->_record;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
