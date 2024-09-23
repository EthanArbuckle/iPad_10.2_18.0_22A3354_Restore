@implementation BMTextInputSessionEvent

- (BMTextInputSessionEvent)initWithDateInterval:(id)a3 bundleID:(id)a4 sessionType:(unint64_t)a5
{
  id v9;
  id v10;
  BMTextInputSessionEvent *v11;
  BMTextInputSessionEvent *v12;
  uint64_t v13;
  NSDate *startDate;
  double v15;
  NSString *sessionID;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BMTextInputSessionEvent;
  v11 = -[BMEventBase init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dateInterval, a3);
    objc_msgSend(v9, "startDate");
    v13 = objc_claimAutoreleasedReturnValue();
    startDate = v12->_startDate;
    v12->_startDate = (NSDate *)v13;

    objc_msgSend(v9, "duration");
    v12->_duration = v15;
    objc_storeStrong((id *)&v12->_bundleID, a4);
    sessionID = v12->_sessionID;
    v12->_sessionID = 0;

    v12->_sessionType = a5;
  }

  return v12;
}

- (BMTextInputSessionEvent)initWithDateInterval:(id)a3 bundleID:(id)a4 sessionID:(id)a5 sessionType:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  BMTextInputSessionEvent *v14;
  BMTextInputSessionEvent *v15;
  uint64_t v16;
  NSDate *startDate;
  double v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)BMTextInputSessionEvent;
  v14 = -[BMEventBase init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_dateInterval, a3);
    objc_msgSend(v11, "startDate");
    v16 = objc_claimAutoreleasedReturnValue();
    startDate = v15->_startDate;
    v15->_startDate = (NSDate *)v16;

    objc_msgSend(v11, "duration");
    v15->_duration = v18;
    objc_storeStrong((id *)&v15->_bundleID, a4);
    objc_storeStrong((id *)&v15->_sessionID, a5);
    v15->_sessionType = a6;
  }

  return v15;
}

- (NSString)description
{
  id v3;
  NSDateInterval *dateInterval;
  NSString *bundleID;
  NSString *sessionID;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  dateInterval = self->_dateInterval;
  bundleID = self->_bundleID;
  sessionID = self->_sessionID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sessionType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("TextInputSessionEvent event with dateInterval: %@, bundleID: %@, sessionID: %@, sessionType: %@"), dateInterval, bundleID, sessionID, v7);

  return (NSString *)v8;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;

  if (a4 == 1)
    v4 = (objc_class *)BMTextInputSessionEvent_v1;
  else
    v4 = (objc_class *)a1;
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithProtoData:", v5);

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMTextInputSessionEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMTextInputSessionEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BMTextInputSessionEvent *v15;
  NSObject *v16;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = objc_alloc(MEMORY[0x1E0CB3588]);
      v7 = (void *)MEMORY[0x1E0C99D68];
      -[NSObject timestamp](v5, "timestamp");
      objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject duration](v5, "duration");
      v9 = (void *)objc_msgSend(v6, "initWithStartDate:duration:", v8);
      -[NSObject bundleID](v5, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject sessionID](v5, "sessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSObject sessionType](v5, "sessionType");
      v13 = v12;
      if (v12 >= 4)
      {
        __biome_log_for_category();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[BMTextInputSessionEvent initWithProto:].cold.1(v13);

        v14 = 4;
      }
      else
      {
        v14 = v12;
      }
      self = -[BMTextInputSessionEvent initWithDateInterval:bundleID:sessionID:sessionType:](self, "initWithDateInterval:bundleID:sessionID:sessionType:", v9, v10, v11, v14);

      v15 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMTextInputSessionEvent initWithProto:].cold.2();
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BMTextInputSessionEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBTextInputSessionEvent *v5;
  BMTextInputSessionEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBTextInputSessionEvent initWithData:]([BMPBTextInputSessionEvent alloc], "initWithData:", v4);

    self = -[BMTextInputSessionEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  NSObject *v9;

  v3 = (void *)objc_opt_new();
  -[BMTextInputSessionEvent duration](self, "duration");
  objc_msgSend(v3, "setDuration:");
  -[BMTextInputSessionEvent bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleID:", v4);

  -[BMTextInputSessionEvent sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionID:", v5);

  -[BMTextInputSessionEvent startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x193FECB28]();
  objc_msgSend(v3, "setTimestamp:");

  v7 = -[BMTextInputSessionEvent sessionType](self, "sessionType");
  if (v7 >= 4)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMTextInputSessionEvent proto].cold.1(v7);

    v8 = 0;
  }
  else
  {
    objc_msgSend(v3, "setSessionType:", v7);
    v8 = v3;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSDateInterval *dateInterval;
  void *v7;
  NSString *bundleID;
  void *v9;
  NSString *sessionID;
  void *v11;
  unint64_t sessionType;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    dateInterval = self->_dateInterval;
    objc_msgSend(v5, "dateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSDateInterval isEqualToDateInterval:](dateInterval, "isEqualToDateInterval:", v7))
    {
      bundleID = self->_bundleID;
      objc_msgSend(v5, "bundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](bundleID, "isEqualToString:", v9))
      {
        sessionID = self->_sessionID;
        objc_msgSend(v5, "sessionID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](sessionID, "isEqualToString:", v11))
        {
          sessionType = self->_sessionType;
          v13 = sessionType == objc_msgSend(v5, "sessionType");
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(unint64_t)a3
{
  self->_sessionType = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMTextInputSessionEvent: unable to convert BMPBTextInputSessionType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithProto:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v2, v3, "%@: tried to initialize with a non-BMPBTextInputSessionDataVersion proto", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)proto
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMTextInputSessionEvent: unable to convert BMTextInputSessionType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
