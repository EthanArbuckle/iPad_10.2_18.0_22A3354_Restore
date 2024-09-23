@implementation NPTMetadataEvent

- (NPTMetadataEvent)initWithType:(Class)a3 eventType:(int)a4 timeStamp:(id)a5 data:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = a5;
  -[NPTMetadataEvent setCollectorType:](self, "setCollectorType:", a3);
  -[NPTMetadataEvent setEventType:](self, "setEventType:", v7);
  -[NPTMetadataEvent setTimeStamp:](self, "setTimeStamp:", v11);

  -[NPTMetadataEvent setData:](self, "setData:", v10);
  return self;
}

- (NSDictionary)asDictionary
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSxxx"));
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTMetadataEvent collectorType](self, "collectorType");
  if (objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_254A41758))
  {
    -[NPTMetadataEvent collectorType](self, "collectorType");
    objc_msgSend((id)objc_opt_class(), "collectorName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("collector_type"));

  }
  +[NPTMetadataEventTypeConverter getTypeAsString:](NPTMetadataEventTypeConverter, "getTypeAsString:", -[NPTMetadataEvent eventType](self, "eventType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("event_type"));

  -[NPTMetadataEvent timeSinceStart](self, "timeSinceStart");
  if (v7 <= 0.0)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("time_since_start"));
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BDD16E0]);
    -[NPTMetadataEvent timeSinceStart](self, "timeSinceStart");
    v9 = (void *)objc_msgSend(v8, "initWithDouble:");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("time_since_start"));

  }
  -[NPTMetadataEvent timeStamp](self, "timeStamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("time_stamp"));

  -[NPTMetadataEvent data](self, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("data"));

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v13;
}

- (Class)collectorType
{
  return self->_collectorType;
}

- (void)setCollectorType:(Class)a3
{
  objc_storeStrong((id *)&self->_collectorType, a3);
}

- (int)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int)a3
{
  self->_eventType = a3;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
  objc_storeStrong((id *)&self->_timeStamp, a3);
}

- (double)timeSinceStart
{
  return self->_timeSinceStart;
}

- (void)setTimeSinceStart:(double)a3
{
  self->_timeSinceStart = a3;
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_collectorType, 0);
}

@end
