@implementation HMDVideoStreamReconfigureEvent

- (HMDVideoStreamReconfigureEvent)initWithEventType:(unint64_t)a3
{
  HMDVideoStreamReconfigureEvent *v4;
  HMDVideoStreamReconfigureEvent *v5;
  uint64_t v6;
  NSDate *timestamp;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDVideoStreamReconfigureEvent;
  v4 = -[HMDVideoStreamReconfigureEvent init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_eventType = a3;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

  }
  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[HMDVideoStreamReconfigureEvent timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HMDVideoStreamReconfigureEvent *v4;
  HMDVideoStreamReconfigureEvent *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HMDVideoStreamReconfigureEvent *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMDVideoStreamReconfigureEvent timestamp](self, "timestamp");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDVideoStreamReconfigureEvent timestamp](v5, "timestamp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDVideoStreamReconfigureEvent timestamp](self, "timestamp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[HMDVideoStreamReconfigureEvent eventType](self, "eventType");
  if (v4 == 1)
  {
    v5 = CFSTR("HMDVideoStreamReconfigureEventTypeImprove");
  }
  else if (v4 == 2)
  {
    v5 = CFSTR("HMDVideoStreamReconfigureEventTypeDeteriorate");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown reconfig event: %tu"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[HMDVideoStreamReconfigureEvent timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_localTimeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Event: %@, Timestamp %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
