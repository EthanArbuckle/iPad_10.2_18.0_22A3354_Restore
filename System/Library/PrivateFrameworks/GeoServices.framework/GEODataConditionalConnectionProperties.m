@implementation GEODataConditionalConnectionProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEODataConditionalConnectionProperties)initWithWorkload:(unint64_t)a3 timeWindowStartTime:(double)a4 timeWindowDuration:(double)a5
{
  GEODataConditionalConnectionProperties *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEODataConditionalConnectionProperties;
  result = -[GEODataConditionalConnectionProperties init](&v9, sel_init);
  if (result)
  {
    result->_workLoad = a3;
    result->_timeWindowStartTime = a4;
    result->_timeWindowDuration = a5;
  }
  return result;
}

- (GEODataConditionalConnectionProperties)initWithWorkload:(unint64_t)a3 timeWindowDuration:(double)a4
{
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return -[GEODataConditionalConnectionProperties initWithWorkload:timeWindowStartTime:timeWindowDuration:](self, "initWithWorkload:timeWindowStartTime:timeWindowDuration:", a3);
}

- (GEODataConditionalConnectionProperties)initWithCoder:(id)a3
{
  id v4;
  GEODataConditionalConnectionProperties *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEODataConditionalConnectionProperties;
  v5 = -[GEODataConditionalConnectionProperties init](&v9, sel_init);
  if (v5)
  {
    v5->_workLoad = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("workload"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startTime"));
    v5->_timeWindowStartTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->_timeWindowDuration = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t workLoad;
  id v5;

  workLoad = self->_workLoad;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", workLoad, CFSTR("workload"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("startTime"), self->_timeWindowStartTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("duration"), self->_timeWindowDuration);

}

- (unint64_t)workLoad
{
  return self->_workLoad;
}

- (double)timeWindowStartTime
{
  return self->_timeWindowStartTime;
}

- (double)timeWindowDuration
{
  return self->_timeWindowDuration;
}

@end
