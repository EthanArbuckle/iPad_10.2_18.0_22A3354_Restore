@implementation GTMTLReplayActivity

- (GTMTLReplayActivity)initWithType:(id)a3
{
  id v5;
  GTMTLReplayActivity *v6;
  GTMTLReplayActivity *v7;
  uint64_t v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTMTLReplayActivity;
  v6 = -[GTMTLReplayActivity init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activityType, a3);
    v8 = mach_absolute_time();
    v7->_activityStartTime = v8;
    v7->_activityEndTime = v8;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_alloc_init((Class)objc_opt_class(self, a2));
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)v5 + 1, self->_activityType);
    v6[2] = self->_activityStartTime;
    v6[3] = self->_activityEndTime;
    v7 = -[GTMTLReplayActivity copyWithZone:](self->_previousActivity, "copyWithZone:", a3);
    v8 = (void *)v6[4];
    v6[4] = v7;

  }
  return v6;
}

- (unsigned)messageSerial
{
  return -[GTMTLReplayActivity messageSerial](self->_previousActivity, "messageSerial");
}

- (id)summary
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Activity: %@"), self->_activityType);
}

- (id)jsonObject
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[3];

  v8[0] = self->_activityType;
  v7[0] = CFSTR("activityType");
  v7[1] = CFSTR("activityStartTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&time_scale * (double)self->_activityStartTime));
  v8[1] = v3;
  v7[2] = CFSTR("activityEndTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&time_scale * (double)self->_activityEndTime));
  v8[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 3));

  return v5;
}

- (void)outputToLog:(id)a3
{
  NSString *activityType;
  int v6;
  NSString *v7;

  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->_activityType;
    v6 = 138543362;
    v7 = activityType;
    _os_log_impl(&dword_0, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)signpostIntervalBegin:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  unsigned int v7;
  NSString *activityType;
  _DWORD v9[2];
  __int16 v10;
  NSString *v11;

  v5 = g_signpostLog;
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v5))
  {
    v7 = -[GTMTLReplayActivity messageSerial](self, "messageSerial");
    activityType = self->_activityType;
    v9[0] = 67109378;
    v9[1] = v7;
    v10 = 2112;
    v11 = activityType;
    _os_signpost_emit_with_name_impl(&dword_0, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "Replayer-3-commandQueue", "%u. %@", (uint8_t *)v9, 0x12u);
  }

}

- (unint64_t)endTime
{
  return self->_activityEndTime;
}

- (void)setEndTime:(unint64_t)a3
{
  self->_activityEndTime = a3;
}

- (GTMTLReplayActivity)previousActivity
{
  return self->_previousActivity;
}

- (void)setPreviousActivity:(id)a3
{
  objc_storeStrong((id *)&self->_previousActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousActivity, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end
