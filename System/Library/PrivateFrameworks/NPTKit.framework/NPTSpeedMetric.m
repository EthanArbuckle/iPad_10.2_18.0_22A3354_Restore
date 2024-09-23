@implementation NPTSpeedMetric

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTSpeedMetric)initWithPointInTime:(id)a3 timeSinceStart:(double)a4 bytesTransferred:(int64_t)a5 totalBytesExpected:(int64_t)a6
{
  id v11;
  NPTSpeedMetric *v12;
  NPTSpeedMetric *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NPTSpeedMetric;
  v12 = -[NPTSpeedMetric init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pointInTime, a3);
    v13->_timeSinceStart = a4;
    v13->_bytesTransferred = a5;
    v13->_totalBytesExpected = a6;
    v13->_responsiveness = 0;
  }

  return v13;
}

- (NPTSpeedMetric)initWithPointInTime:(id)a3 timeSinceStart:(double)a4 bytesTransferred:(int64_t)a5 totalBytesExpected:(int64_t)a6 speed:(double)a7 responsiveness:(int64_t)a8
{
  id v15;
  NPTSpeedMetric *v16;
  NPTSpeedMetric *v17;
  objc_super v19;

  v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NPTSpeedMetric;
  v16 = -[NPTSpeedMetric init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_pointInTime, a3);
    v17->_timeSinceStart = a4;
    v17->_bytesTransferred = a5;
    v17->_totalBytesExpected = a6;
    v17->_responsiveness = a8;
    v17->privateSpeed = a7;
  }

  return v17;
}

- (double)speed
{
  double result;
  double v4;
  double v5;

  result = self->privateSpeed;
  if (result <= 0.0)
  {
    v4 = (double)-[NPTSpeedMetric bytesTransferred](self, "bytesTransferred") * 8.0;
    -[NPTSpeedMetric timeSinceStart](self, "timeSinceStart");
    return v4 / v5 / 1000000.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NPTSpeedMetric *v4;
  void *v5;

  v4 = -[NPTSpeedMetric init](+[NPTSpeedMetric allocWithZone:](NPTSpeedMetric, "allocWithZone:", a3), "init");
  -[NPTSpeedMetric pointInTime](self, "pointInTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTSpeedMetric setPointInTime:](v4, "setPointInTime:", v5);

  -[NPTSpeedMetric timeSinceStart](self, "timeSinceStart");
  -[NPTSpeedMetric setTimeSinceStart:](v4, "setTimeSinceStart:");
  -[NPTSpeedMetric setBytesTransferred:](v4, "setBytesTransferred:", -[NPTSpeedMetric bytesTransferred](self, "bytesTransferred"));
  -[NPTSpeedMetric setTotalBytesExpected:](v4, "setTotalBytesExpected:", -[NPTSpeedMetric totalBytesExpected](self, "totalBytesExpected"));
  -[NPTSpeedMetric setResponsiveness:](v4, "setResponsiveness:", -[NPTSpeedMetric responsiveness](self, "responsiveness"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[NPTSpeedMetric bytesTransferred](self, "bytesTransferred"), CFSTR("bytesTransferred"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[NPTSpeedMetric totalBytesExpected](self, "totalBytesExpected"), CFSTR("totalBytesExpected"));
  -[NPTSpeedMetric timeSinceStart](self, "timeSinceStart");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timeSinceStart"));
  -[NPTSpeedMetric pointInTime](self, "pointInTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("pointInTime"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[NPTSpeedMetric responsiveness](self, "responsiveness"), CFSTR("responsiveness"));
}

- (NPTSpeedMetric)initWithCoder:(id)a3
{
  id v3;
  NPTSpeedMetric *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NPTSpeedMetric;
  v3 = a3;
  v4 = -[NPTSpeedMetric init](&v7, sel_init);
  -[NPTSpeedMetric setBytesTransferred:](v4, "setBytesTransferred:", (int)objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("bytesTransferred"), v7.receiver, v7.super_class));
  -[NPTSpeedMetric setTotalBytesExpected:](v4, "setTotalBytesExpected:", (int)objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("totalBytesExpected")));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("timeSinceStart"));
  -[NPTSpeedMetric setTimeSinceStart:](v4, "setTimeSinceStart:");
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pointInTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTSpeedMetric setPointInTime:](v4, "setPointInTime:", v5);

  LODWORD(v5) = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("responsiveness"));
  -[NPTSpeedMetric setResponsiveness:](v4, "setResponsiveness:", (int)v5);
  return v4;
}

- (NSDate)pointInTime
{
  return self->_pointInTime;
}

- (void)setPointInTime:(id)a3
{
  objc_storeStrong((id *)&self->_pointInTime, a3);
}

- (double)timeSinceStart
{
  return self->_timeSinceStart;
}

- (void)setTimeSinceStart:(double)a3
{
  self->_timeSinceStart = a3;
}

- (int64_t)bytesTransferred
{
  return self->_bytesTransferred;
}

- (void)setBytesTransferred:(int64_t)a3
{
  self->_bytesTransferred = a3;
}

- (int64_t)totalBytesExpected
{
  return self->_totalBytesExpected;
}

- (void)setTotalBytesExpected:(int64_t)a3
{
  self->_totalBytesExpected = a3;
}

- (int64_t)responsiveness
{
  return self->_responsiveness;
}

- (void)setResponsiveness:(int64_t)a3
{
  self->_responsiveness = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointInTime, 0);
}

@end
