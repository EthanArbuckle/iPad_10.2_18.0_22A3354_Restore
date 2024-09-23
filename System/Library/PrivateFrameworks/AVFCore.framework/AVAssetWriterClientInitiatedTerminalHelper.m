@implementation AVAssetWriterClientInitiatedTerminalHelper

- (AVAssetWriterClientInitiatedTerminalHelper)initWithConfigurationState:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not available.  Use %@ instead."), NSStringFromSelector(sel_initWithConfigurationState_terminalStatus_)), 0);
  objc_exception_throw(v3);
}

- (AVAssetWriterClientInitiatedTerminalHelper)initWithConfigurationState:(id)a3 terminalStatus:(int64_t)a4
{
  AVAssetWriterClientInitiatedTerminalHelper *result;
  objc_class *v7;
  AVAssetWriterClientInitiatedTerminalHelper *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVAssetWriterClientInitiatedTerminalHelper;
  result = -[AVAssetWriterTerminalHelper initWithConfigurationState:](&v15, sel_initWithConfigurationState_, a3);
  if (a4 != 2 && a4 != 4)
  {
    v7 = (objc_class *)result;
    v8 = result;
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(v7, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v9, v10, v11, v12, v13, (uint64_t)"(terminalStatus == AVAssetWriterStatusCompleted) || (terminalStatus == AVAssetWriterStatusCancelled)"), 0);
    objc_exception_throw(v14);
  }
  if (result)
    result->_terminalStatus = a4;
  return result;
}

- (int64_t)status
{
  return self->_terminalStatus;
}

- (BOOL)_isDefunct
{
  return 1;
}

@end
