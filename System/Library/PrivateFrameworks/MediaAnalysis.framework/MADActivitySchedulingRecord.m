@implementation MADActivitySchedulingRecord

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  VCPTaskIDDescription(-[MADActivitySchedulingRecord activityID](self, "activityID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("activityID: %@, "), v6);

  -[MADActivitySchedulingRecord startTime](self, "startTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("startTime: %@, "), v7);

  -[MADActivitySchedulingRecord duration](self, "duration");
  objc_msgSend(v3, "appendFormat:", CFSTR("duration: %f(sec), "), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR("exitStatus: %d>"), -[MADActivitySchedulingRecord exitStatus](self, "exitStatus"));
  return v3;
}

- (unint64_t)activityID
{
  return self->_activityID;
}

- (void)setActivityID:(unint64_t)a3
{
  self->_activityID = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  self->_startTime = (NSDate *)a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int)exitStatus
{
  return self->_exitStatus;
}

- (void)setExitStatus:(int)a3
{
  self->_exitStatus = a3;
}

- (NSString)sessionLog
{
  return self->_sessionLog;
}

- (void)setSessionLog:(id)a3
{
  objc_storeStrong((id *)&self->_sessionLog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionLog, 0);
}

@end
