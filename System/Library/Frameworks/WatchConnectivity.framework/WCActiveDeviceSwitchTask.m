@implementation WCActiveDeviceSwitchTask

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WCActiveDeviceSwitchTask clientReadyForSessionState](self, "clientReadyForSessionState"))
    v6 = "YES";
  else
    v6 = "NO";
  objc_msgSend((id)objc_opt_class(), "taskStateToString:", -[WCActiveDeviceSwitchTask taskState](self, "taskState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, clientReadyForSessionState: %s, taskState: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)clientReadyForSessionState
{
  return self->_clientReadyForSessionState;
}

- (unint64_t)taskState
{
  return self->_taskState;
}

+ (id)taskStateToString:(unint64_t)a3
{
  id result;
  __CFString *v4;

  result = CFSTR("Queued");
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      result = CFSTR("Started");
      break;
    case 2uLL:
      result = CFSTR("AwaitingActivationRequest");
      break;
    case 3uLL:
      result = CFSTR("ActivationRequested");
      break;
    case 4uLL:
      result = CFSTR("ActivationCompleted");
      break;
    default:
      v4 = CFSTR("Halted");
      if (a3 != 999)
        v4 = CFSTR("Unknown");
      if (a3 == 888)
        result = CFSTR("ActivationFailed");
      else
        result = v4;
      break;
  }
  return result;
}

- (void)setTaskState:(unint64_t)a3
{
  self->_taskState = a3;
}

- (void)setClientReadyForSessionState:(BOOL)a3
{
  self->_clientReadyForSessionState = a3;
}

@end
