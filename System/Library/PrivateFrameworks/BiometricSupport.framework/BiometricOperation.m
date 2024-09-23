@implementation BiometricOperation

- (BiometricOperation)init
{
  BiometricOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BiometricOperation;
  result = -[BiometricOperation init](&v3, sel_init);
  if (result)
    result->_status = 0;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)BiometricOperation;
  -[BiometricOperation description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: client=<%p>, status=%u, priority=%ld"), v4, self->_client, self->_status, self->_priority);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)type
{
  return 0;
}

- (unsigned)taskPausedMessage
{
  return 60;
}

- (unsigned)taskResumedMessage
{
  return 61;
}

- (unsigned)taskResumeFailedMessage
{
  return 62;
}

- (BiometricKitXPCExportedClientObject)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (unsigned)cancelledMessage
{
  return self->_cancelledMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

@end
