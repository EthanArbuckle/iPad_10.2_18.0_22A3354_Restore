@implementation GTMTLReplayActivityDebugFuncStop

- (GTMTLReplayActivityDebugFuncStop)initWithCurrentIndex:(id)a3 targetIndex:(id)a4
{
  GTMTLReplayActivityDebugFuncStop *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GTMTLReplayActivityDebugFuncStop;
  result = -[GTMTLReplayActivity initWithType:](&v7, "initWithType:", CFSTR("debugFuncStop"));
  if (result)
  {
    result->_currentIndex = ($0F314FFEF57EDD05BD6D642B3ED39160)a3;
    result->_targetIndex = ($0F314FFEF57EDD05BD6D642B3ED39160)a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTMTLReplayActivityDebugFuncStop;
  result = -[GTMTLReplayActivity copyWithZone:](&v5, "copyWithZone:", a3);
  if (result)
  {
    *((_QWORD *)result + 5) = self->_currentIndex;
    *((_QWORD *)result + 6) = self->_targetIndex;
  }
  return result;
}

- (id)summary
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Replaying from (index: %d, subCommand: %d) to (index: %d, subCommand: %d)"), self->_currentIndex.function, self->_currentIndex.subCommand, self->_targetIndex.function, self->_targetIndex.subCommand);
}

- (id)jsonObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];
  _QWORD v12[7];

  v12[0] = self->super._activityType;
  v11[0] = CFSTR("activityType");
  v11[1] = CFSTR("currentFunctionIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_currentIndex.function));
  v12[1] = v3;
  v11[2] = CFSTR("currentSubCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_currentIndex.subCommand));
  v12[2] = v4;
  v11[3] = CFSTR("targetFunctionIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_targetIndex.function));
  v12[3] = v5;
  v11[4] = CFSTR("targetSubCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_targetIndex.subCommand));
  v12[4] = v6;
  v11[5] = CFSTR("activityStartTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&time_scale * (double)self->super._activityStartTime));
  v12[5] = v7;
  v11[6] = CFSTR("activityEndTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&time_scale * (double)self->super._activityEndTime));
  v12[6] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 7));

  return v9;
}

- (void)outputToLog:(id)a3
{
  NSString *activityType;
  unsigned int subCommand;
  unsigned int function;
  unsigned int v8;
  unsigned int v9;
  int v10;
  NSString *v11;
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  unsigned int v19;

  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    function = self->_currentIndex.function;
    subCommand = self->_currentIndex.subCommand;
    v9 = self->_targetIndex.function;
    v8 = self->_targetIndex.subCommand;
    v10 = 138544386;
    v11 = activityType;
    v12 = 1024;
    v13 = function;
    v14 = 1024;
    v15 = subCommand;
    v16 = 1024;
    v17 = v9;
    v18 = 1024;
    v19 = v8;
    _os_log_impl(&dword_0, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@:\t%u:%u -> %u:%u", (uint8_t *)&v10, 0x24u);
  }
}

@end
