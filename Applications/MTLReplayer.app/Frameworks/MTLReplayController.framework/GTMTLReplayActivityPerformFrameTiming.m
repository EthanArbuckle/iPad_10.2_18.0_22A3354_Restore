@implementation GTMTLReplayActivityPerformFrameTiming

- (GTMTLReplayActivityPerformFrameTiming)initWithIndex:(int)a3
{
  GTMTLReplayActivityPerformFrameTiming *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTMTLReplayActivityPerformFrameTiming;
  result = -[GTMTLReplayActivity initWithType:](&v5, "initWithType:", CFSTR("performFrameTiming"));
  if (result)
    result->_index = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTMTLReplayActivityPerformFrameTiming;
  result = -[GTMTLReplayActivity copyWithZone:](&v5, "copyWithZone:", a3);
  if (result)
    *((_DWORD *)result + 10) = self->_index;
  return result;
}

- (unsigned)messageSerial
{
  return self->_index;
}

- (id)summary
{
  return CFSTR("Performing frame timing");
}

- (id)jsonObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[4];

  v9[0] = self->super._activityType;
  v8[0] = CFSTR("activityType");
  v8[1] = CFSTR("index");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_index));
  v9[1] = v3;
  v8[2] = CFSTR("activityStartTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&time_scale * (double)self->super._activityStartTime));
  v9[2] = v4;
  v8[3] = CFSTR("activityEndTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&time_scale * (double)self->super._activityEndTime));
  v9[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 4));

  return v6;
}

- (void)outputToLog:(id)a3
{
  NSString *activityType;
  int index;
  int v7;
  NSString *v8;
  __int16 v9;
  int v10;

  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    index = self->_index;
    v7 = 138543618;
    v8 = activityType;
    v9 = 1024;
    v10 = index;
    _os_log_impl(&dword_0, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@:\t%d", (uint8_t *)&v7, 0x12u);
  }
}

@end
