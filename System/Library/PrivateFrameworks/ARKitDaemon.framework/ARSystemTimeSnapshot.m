@implementation ARSystemTimeSnapshot

+ (id)timeSinceSnapshot:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "timeSinceSnapshot:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (ARSystemTimeSnapshot)init
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  ARGetSystemUpTime();
  v4 = v3;
  ARGetSystemUpTimeIncludingSleep();
  v6 = v5;
  ARGetSystemUpTimeIncludingSleepAndDriftCorrection();
  return -[ARSystemTimeSnapshot initWithUpTime:upTimeIncludingSleep:upTimeIncludingSleepAndDriftCorrection:](self, "initWithUpTime:upTimeIncludingSleep:upTimeIncludingSleepAndDriftCorrection:", v4, v6, v7);
}

- (ARSystemTimeSnapshot)initWithUpTime:(double)a3 upTimeIncludingSleep:(double)a4 upTimeIncludingSleepAndDriftCorrection:(double)a5
{
  ARSystemTimeSnapshot *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ARSystemTimeSnapshot;
  result = -[ARSystemTimeSnapshot init](&v9, sel_init);
  if (result)
  {
    result->_upTime = a3;
    result->_upTimeIncludingSleep = a4;
    result->_upTimeIncludingSleepAndDriftCorrection = a5;
  }
  return result;
}

- (id)timeSinceSnapshot:(id)a3
{
  id v4;
  ARSystemTimeSnapshot *v5;
  double upTime;
  double v7;
  double v8;
  double upTimeIncludingSleep;
  double v10;
  double v11;
  double upTimeIncludingSleepAndDriftCorrection;
  double v13;
  double v14;

  v4 = a3;
  v5 = [ARSystemTimeSnapshot alloc];
  upTime = self->_upTime;
  objc_msgSend(v4, "upTime");
  v8 = upTime - v7;
  upTimeIncludingSleep = self->_upTimeIncludingSleep;
  objc_msgSend(v4, "upTimeIncludingSleep");
  v11 = upTimeIncludingSleep - v10;
  upTimeIncludingSleepAndDriftCorrection = self->_upTimeIncludingSleepAndDriftCorrection;
  objc_msgSend(v4, "upTimeIncludingSleepAndDriftCorrection");
  v14 = v13;

  return -[ARSystemTimeSnapshot initWithUpTime:upTimeIncludingSleep:upTimeIncludingSleepAndDriftCorrection:](v5, "initWithUpTime:upTimeIncludingSleep:upTimeIncludingSleepAndDriftCorrection:", v8, v11, upTimeIncludingSleepAndDriftCorrection - v14);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p upTime=%f upTimeIncludingSleep=%f upTimeIncludingSleepAndDriftCorrection=%f>"), v5, self, *(_QWORD *)&self->_upTime, *(_QWORD *)&self->_upTimeIncludingSleep, *(_QWORD *)&self->_upTimeIncludingSleepAndDriftCorrection);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)upTime
{
  return self->_upTime;
}

- (double)upTimeIncludingSleep
{
  return self->_upTimeIncludingSleep;
}

- (double)upTimeIncludingSleepAndDriftCorrection
{
  return self->_upTimeIncludingSleepAndDriftCorrection;
}

@end
