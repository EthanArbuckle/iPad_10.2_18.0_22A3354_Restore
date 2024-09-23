@implementation _HKWorkoutEvent

- (_HKWorkoutEvent)initWithEventType:(int64_t)a3 sessionId:(id)a4 dateInterval:(id)a5 metadata:(id)a6
{
  id v11;
  id v12;
  id v13;
  _HKWorkoutEvent *v14;
  _HKWorkoutEvent *v15;
  uint64_t v16;
  NSDictionary *metadata;
  objc_super v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_HKWorkoutEvent;
  v14 = -[_HKWorkoutEvent init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_eventType = a3;
    objc_storeStrong((id *)&v14->_sessionId, a4);
    objc_storeStrong((id *)&v15->_dateInterval, a5);
    v16 = objc_msgSend(v13, "copy");
    metadata = v15->_metadata;
    v15->_metadata = (NSDictionary *)v16;

  }
  return v15;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t eventType;
  const __CFString *v13;
  void *v14;
  objc_class *v15;
  void *v16;

  if (self->_eventType == 4)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: ERROR %@"), v5, self->_error);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (description_onceToken_0 != -1)
      dispatch_once(&description_onceToken_0, &__block_literal_global_122);
    v7 = (void *)description___formatter;
    -[NSDateInterval startDate](self->_dateInterval, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)description___formatter;
    -[NSDateInterval endDate](self->_dateInterval, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    eventType = self->_eventType;
    if (eventType > 0xB)
      v13 = &stru_1E37FD4C0;
    else
      v13 = off_1E37F68B8[eventType];
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: %@ %@ %@-%@"), v16, v13, self->_sessionId, v5, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t eventType;
  void *v5;
  id v6;

  eventType = self->_eventType;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", eventType, CFSTR("eventType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sessionId, CFSTR("sessionId"));
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("date"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_error, CFSTR("error"));

}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
}

- (_HKWorkoutEvent)initWithSessionId:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  _HKWorkoutEvent *v9;
  _HKWorkoutEvent *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKWorkoutEvent;
  v9 = -[_HKWorkoutEvent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_eventType = 4;
    objc_storeStrong((id *)&v9->_sessionId, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (_HKWorkoutEvent)initWithWorkoutEventType:(int64_t)a3 sessionUUID:(id)a4 dateInterval:(id)a5 metadata:(id)a6 error:(id)a7
{
  _HKWorkoutEvent *v7;
  _HKWorkoutEvent *v8;

  if (a7)
    v7 = -[_HKWorkoutEvent initWithSessionId:error:](self, "initWithSessionId:error:", a4, a7, a5, a6);
  else
    v7 = -[_HKWorkoutEvent initWithEventType:sessionId:dateInterval:metadata:](self, "initWithEventType:sessionId:dateInterval:metadata:", a3, a4, a5, a6);
  v8 = v7;

  return v8;
}

+ (int64_t)internalEventTypeWithPublicEvent:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "type");
  if ((unint64_t)(v3 - 2) > 6)
    return 2;
  else
    return qword_19A44CD18[v3 - 2];
}

- (NSUUID)sessionUUID
{
  return self->_sessionId;
}

- (int64_t)workoutEventType
{
  return self->_eventType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKWorkoutEvent)initWithCoder:(id)a3
{
  id v4;
  _HKWorkoutEvent *v5;
  uint64_t v6;
  NSUUID *sessionId;
  uint64_t v8;
  NSDateInterval *dateInterval;
  void *v10;
  uint64_t v11;
  NSDateInterval *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *metadata;
  uint64_t v19;
  NSError *error;
  objc_super v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_HKWorkoutEvent;
  v5 = -[_HKWorkoutEvent init](&v22, sel_init);
  if (v5)
  {
    v5->_eventType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eventType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionId"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionId = v5->_sessionId;
    v5->_sessionId = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
    v8 = objc_claimAutoreleasedReturnValue();
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v8;

    if (!v5->_dateInterval)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v10, 0.0);
        v12 = v5->_dateInterval;
        v5->_dateInterval = (NSDateInterval *)v11;

      }
    }
    v13 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v23[3] = objc_opt_class();
    v23[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("metadata"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hk_replaceKeysFromSharedStringCache");
    v17 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v19 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v19;

  }
  return v5;
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

@end
