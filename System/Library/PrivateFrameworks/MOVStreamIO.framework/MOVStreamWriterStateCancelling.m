@implementation MOVStreamWriterStateCancelling

- (BOOL)canConfigure:(id)a3
{
  return 0;
}

- (BOOL)canAppendData:(id)a3
{
  return 0;
}

- (BOOL)canWriteData:(id)a3
{
  return 0;
}

- (BOOL)stopWriterWhenFifosAreEmpty:(id)a3
{
  return 1;
}

- (BOOL)canFinishRecording:(id)a3
{
  return 0;
}

- (id)finishRecording:(id)a3
{
  return (id)objc_opt_new();
}

- (id)nextFinishStep:(id)a3
{
  return (id)objc_opt_new();
}

- (id)prepareFinished:(id)a3
{
  return (id)objc_opt_new();
}

- (id)prepareRecording:(id)a3
{
  return (id)objc_opt_new();
}

- (id)finishedCancelRecording:(id)a3
{
  return (id)objc_opt_new();
}

- (id)criticalErrorOccurred:(id)a3 context:(id)a4
{
  objc_msgSend(a4, "setCriticalError:", a3);
  return (id)objc_opt_new();
}

- (void)activateWithContext:(id)a3
{
  objc_msgSend(a3, "processCancelRecording");
}

- (int64_t)writerStatus
{
  return 6;
}

- (NSString)name
{
  return (NSString *)CFSTR("Cancelling");
}

@end
