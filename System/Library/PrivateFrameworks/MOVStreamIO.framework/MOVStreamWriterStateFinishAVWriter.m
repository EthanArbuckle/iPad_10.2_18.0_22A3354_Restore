@implementation MOVStreamWriterStateFinishAVWriter

- (void)activateWithContext:(id)a3
{
  objc_msgSend(a3, "finishAVWriter");
}

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
  return 0;
}

- (BOOL)canFinishRecording:(id)a3
{
  return 0;
}

- (id)cancelRecording:(id)a3
{
  return (id)objc_opt_new();
}

- (id)nextFinishStep:(id)a3
{
  return (id)objc_opt_new();
}

- (id)criticalErrorOccurred:(id)a3 context:(id)a4
{
  objc_msgSend(a4, "setCriticalError:", a3);
  return (id)objc_opt_new();
}

- (int64_t)writerStatus
{
  return 4;
}

- (NSString)name
{
  return (NSString *)CFSTR("Finishing AVWriter");
}

@end
