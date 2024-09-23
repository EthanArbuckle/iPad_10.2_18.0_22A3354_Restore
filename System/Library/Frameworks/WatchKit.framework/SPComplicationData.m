@implementation SPComplicationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", timestamp, CFSTR("_TimestampKey"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_TimeToLiveKey"), self->_timeToLive);

}

- (SPComplicationData)initWithCoder:(id)a3
{
  id v4;
  SPComplicationData *v5;
  uint64_t v6;
  NSDate *timestamp;
  double v8;

  v4 = a3;
  v5 = -[SPComplicationData init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_TimestampKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_TimeToLiveKey"));
    v5->_timeToLive = v8;
  }

  return v5;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (double)timeToLive
{
  return self->_timeToLive;
}

- (void)setTimeToLive:(double)a3
{
  self->_timeToLive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
