@implementation GTMTLReplayActivityRestoreCommandBuffer

- (GTMTLReplayActivityRestoreCommandBuffer)initWithIndex:(unsigned int)a3
{
  GTMTLReplayActivityRestoreCommandBuffer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTMTLReplayActivityRestoreCommandBuffer;
  result = -[GTMTLReplayActivity initWithType:](&v5, "initWithType:", CFSTR("restoreCommandBuffer"));
  if (result)
    result->_functionIndex = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTMTLReplayActivityRestoreCommandBuffer;
  result = -[GTMTLReplayActivity copyWithZone:](&v5, "copyWithZone:", a3);
  if (result)
    *((_DWORD *)result + 10) = self->_functionIndex;
  return result;
}

- (id)summary
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Restoring a command buffer at function index %d"), self->_functionIndex);
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
  v8[1] = CFSTR("functionIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_functionIndex));
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
  unsigned int functionIndex;
  int v7;
  NSString *v8;
  __int16 v9;
  unsigned int v10;

  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    functionIndex = self->_functionIndex;
    v7 = 138543618;
    v8 = activityType;
    v9 = 1024;
    v10 = functionIndex;
    _os_log_impl(&dword_0, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@:\t%u", (uint8_t *)&v7, 0x12u);
  }
}

@end
