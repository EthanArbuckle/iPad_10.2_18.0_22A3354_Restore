@implementation GTMTLReplayActivityDisplayAttachment

- (GTMTLReplayActivityDisplayAttachment)initWithIndex:(id)a3
{
  GTMTLReplayActivityDisplayAttachment *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTMTLReplayActivityDisplayAttachment;
  result = -[GTMTLReplayActivity initWithType:](&v5, "initWithType:", CFSTR("displayAttachment"));
  if (result)
    result->_currentIndex = ($0F314FFEF57EDD05BD6D642B3ED39160)a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTMTLReplayActivityDisplayAttachment;
  result = -[GTMTLReplayActivity copyWithZone:](&v5, "copyWithZone:", a3);
  if (result)
    *((_QWORD *)result + 5) = self->_currentIndex;
  return result;
}

- (id)summary
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Displaying attachment at (index: %d, subCommand: %d)"), self->_currentIndex.function, self->_currentIndex.subCommand);
}

- (id)jsonObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v10[0] = self->super._activityType;
  v9[0] = CFSTR("activityType");
  v9[1] = CFSTR("functionIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_currentIndex.function));
  v10[1] = v3;
  v9[2] = CFSTR("subCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_currentIndex.subCommand));
  v10[2] = v4;
  v9[3] = CFSTR("activityStartTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&time_scale * (double)self->super._activityStartTime));
  v10[3] = v5;
  v9[4] = CFSTR("activityEndTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&time_scale * (double)self->super._activityEndTime));
  v10[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 5));

  return v7;
}

- (void)outputToLog:(id)a3
{
  NSString *activityType;
  unsigned int subCommand;
  unsigned int function;
  int v8;
  NSString *v9;
  __int16 v10;
  unsigned int v11;
  __int16 v12;
  unsigned int v13;

  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    function = self->_currentIndex.function;
    subCommand = self->_currentIndex.subCommand;
    v8 = 138543874;
    v9 = activityType;
    v10 = 1024;
    v11 = function;
    v12 = 1024;
    v13 = subCommand;
    _os_log_impl(&dword_0, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@:\t%u:%u", (uint8_t *)&v8, 0x18u);
  }
}

@end
