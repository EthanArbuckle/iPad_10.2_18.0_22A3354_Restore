@implementation ATXScheduledPinnedTimeEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXScheduledPinnedTimeEvent)initWithPinnedTimeEvent:(id)a3 granularity:(int64_t)a4 dateComponents:(id)a5 fuzzyTime:(int64_t)a6 fuzzyTimeRangeStart:(id)a7 fuzzyTimeRangeEnd:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  ATXScheduledPinnedTimeEvent *v20;

  v14 = (void *)MEMORY[0x1E0CB3A28];
  v15 = a8;
  v16 = a7;
  v17 = a5;
  v18 = a3;
  objc_msgSend(v14, "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[ATXScheduledPinnedTimeEvent initWithPinnedTimeEvent:granularity:dateComponents:fuzzyTime:fuzzyTimeRangeStart:fuzzyTimeRangeEnd:uuid:eventIdentifier:](self, "initWithPinnedTimeEvent:granularity:dateComponents:fuzzyTime:fuzzyTimeRangeStart:fuzzyTimeRangeEnd:uuid:eventIdentifier:", v18, a4, v17, a6, v16, v15, v19, 0);

  return v20;
}

- (ATXScheduledPinnedTimeEvent)initWithPinnedTimeEvent:(id)a3 granularity:(int64_t)a4 dateComponents:(id)a5 fuzzyTime:(int64_t)a6 fuzzyTimeRangeStart:(id)a7 fuzzyTimeRangeEnd:(id)a8 uuid:(id)a9 eventIdentifier:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  ATXScheduledPinnedTimeEvent *v20;
  ATXScheduledPinnedTimeEvent *v21;
  uint64_t v22;
  NSDateComponents *dateComponents;
  uint64_t v24;
  NSString *eventIdentifier;
  ATXScheduledPinnedTimeEvent *v26;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v16 = a5;
  v29 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v31.receiver = self;
  v31.super_class = (Class)ATXScheduledPinnedTimeEvent;
  v20 = -[ATXScheduledPinnedTimeEvent init](&v31, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_uuid, a9);
    objc_storeStrong((id *)&v21->_pinnedTimeEvent, a3);
    v21->_granularity = a4;
    v22 = objc_msgSend(v16, "copy");
    dateComponents = v21->_dateComponents;
    v21->_dateComponents = (NSDateComponents *)v22;

    v21->_fuzzyTime = a6;
    objc_storeStrong((id *)&v21->_fuzzyTimeRangeStart, a7);
    objc_storeStrong((id *)&v21->_fuzzyTimeRangeEnd, a8);
    v24 = objc_msgSend(v19, "copy");
    eventIdentifier = v21->_eventIdentifier;
    v21->_eventIdentifier = (NSString *)v24;

    v26 = v21;
  }

  return v21;
}

- (ATXScheduledPinnedTimeEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  ATXScheduledPinnedTimeEvent *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pinnedTimeEvent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("granularity"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateComponents"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fuzzyTime"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fuzzyTimeRangeStart"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fuzzyTimeRangeEnd"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[ATXScheduledPinnedTimeEvent initWithPinnedTimeEvent:granularity:dateComponents:fuzzyTime:fuzzyTimeRangeStart:fuzzyTimeRangeEnd:uuid:eventIdentifier:](self, "initWithPinnedTimeEvent:granularity:dateComponents:fuzzyTime:fuzzyTimeRangeStart:fuzzyTimeRangeEnd:uuid:eventIdentifier:", v6, v7, v8, v9, v10, v11, v5, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;

  uuid = self->_uuid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pinnedTimeEvent, CFSTR("pinnedTimeEvent"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_granularity, CFSTR("granularity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateComponents, CFSTR("dateComponents"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fuzzyTime, CFSTR("fuzzyTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fuzzyTimeRangeStart, CFSTR("fuzzyTimeRangeStart"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fuzzyTimeRangeEnd, CFSTR("fuzzyTimeRangeEnd"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventIdentifier, CFSTR("eventIdentifier"));

}

- (id)copyWithEventIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPinnedTimeEvent:granularity:dateComponents:fuzzyTime:fuzzyTimeRangeStart:fuzzyTimeRangeEnd:uuid:eventIdentifier:", self->_pinnedTimeEvent, self->_granularity, self->_dateComponents, self->_fuzzyTime, self->_fuzzyTimeRangeStart, self->_fuzzyTimeRangeEnd, self->_uuid, v4);

  return v5;
}

- (id)copyWithGranularity:(int64_t)a3 dateComponents:(id)a4 fuzzyTime:(int64_t)a5 fuzzyTimeRangeStart:(id)a6 fuzzyTimeRangeEnd:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPinnedTimeEvent:granularity:dateComponents:fuzzyTime:fuzzyTimeRangeStart:fuzzyTimeRangeEnd:uuid:eventIdentifier:", self->_pinnedTimeEvent, a3, v14, a5, v13, v12, self->_uuid, self->_eventIdentifier);

  return v15;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (ATXPinnedTimeEvent)pinnedTimeEvent
{
  return self->_pinnedTimeEvent;
}

- (int64_t)granularity
{
  return self->_granularity;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (int64_t)fuzzyTime
{
  return self->_fuzzyTime;
}

- (ATXTime)fuzzyTimeRangeStart
{
  return self->_fuzzyTimeRangeStart;
}

- (ATXTime)fuzzyTimeRangeEnd
{
  return self->_fuzzyTimeRangeEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fuzzyTimeRangeEnd, 0);
  objc_storeStrong((id *)&self->_fuzzyTimeRangeStart, 0);
  objc_storeStrong((id *)&self->_dateComponents, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_pinnedTimeEvent, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
