@implementation ULHomeSlamTimer

- (ULHomeSlamTimer)initWithTimeout:(double)a3 andStartTime:(id)a4
{
  id v6;
  ULHomeSlamTimer *v7;
  ULHomeSlamTimer *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ULHomeSlamTimer;
  v7 = -[ULHomeSlamTimer init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[ULHomeSlamTimer setTimeoutSeconds:](v7, "setTimeoutSeconds:", a3);
    -[ULHomeSlamTimer setStartTime:](v8, "setStartTime:", v6);
  }

  return v8;
}

- (id)checkTimeoutAtDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[ULHomeSlamTimer startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  -[ULHomeSlamTimer timeoutSeconds](self, "timeoutSeconds");
  v9 = v8;

  if (v7 <= v9)
  {
    v11 = 0;
  }
  else
  {
    -[ULHomeSlamTimer startTime](self, "startTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULHomeSlamTimer timeoutSeconds](self, "timeoutSeconds");
    objc_msgSend(v10, "dateByAddingTimeInterval:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
