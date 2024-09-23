@implementation HMDTriggerConfirmationTimer

- (HMDTriggerConfirmationTimer)initWithExecutionSessionID:(id)a3 timeoutInterval:(double)a4
{
  id v7;
  HMDTriggerConfirmationTimer *v8;
  HMDTriggerConfirmationTimer *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDTriggerConfirmationTimer;
  v8 = -[HMFTimer initWithTimeInterval:options:](&v11, sel_initWithTimeInterval_options_, 1, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_executionSessionID, a3);

  return v9;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[HMFTimer timeInterval](self, "timeInterval");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[Timeout interval: %@]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSUUID)executionSessionID
{
  return self->_executionSessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionSessionID, 0);
}

@end
