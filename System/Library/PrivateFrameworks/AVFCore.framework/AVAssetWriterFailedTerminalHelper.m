@implementation AVAssetWriterFailedTerminalHelper

- (AVAssetWriterFailedTerminalHelper)initWithConfigurationState:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not available.  Use %@ instead."), NSStringFromSelector(sel_initWithConfigurationState_terminalError_)), 0);
  objc_exception_throw(v3);
}

- (AVAssetWriterFailedTerminalHelper)initWithConfigurationState:(id)a3 terminalError:(id)a4
{
  AVAssetWriterFailedTerminalHelper *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  AVAssetWriterFailedTerminalHelper *v12;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVAssetWriterFailedTerminalHelper;
  v6 = -[AVAssetWriterTerminalHelper initWithConfigurationState:](&v15, sel_initWithConfigurationState_, a3);
  v12 = v6;
  if (!a4)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v7, v8, v9, v10, v11, (uint64_t)"terminalError != nil"), 0);
    objc_exception_throw(v14);
  }
  if (v6)
    v6->_terminalError = (NSError *)objc_msgSend(a4, "copyWithZone:", -[AVAssetWriterFailedTerminalHelper zone](v6, "zone"));
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterFailedTerminalHelper;
  -[AVAssetWriterHelper dealloc](&v3, sel_dealloc);
}

- (int64_t)status
{
  return 3;
}

- (id)error
{
  return self->_terminalError;
}

- (void)finishWritingWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (BOOL)_isDefunct
{
  return 1;
}

@end
