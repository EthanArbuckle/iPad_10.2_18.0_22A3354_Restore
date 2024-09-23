@implementation MOVStreamWriterStateRecording

- (BOOL)canConfigure:(id)a3
{
  return 0;
}

- (BOOL)canAppendData:(id)a3
{
  return 1;
}

- (BOOL)canWriteData:(id)a3
{
  return 1;
}

- (BOOL)stopWriterWhenFifosAreEmpty:(id)a3
{
  return 0;
}

- (BOOL)canFinishRecording:(id)a3
{
  return 1;
}

- (id)cancelRecording:(id)a3
{
  return (id)objc_opt_new();
}

- (id)finishRecording:(id)a3
{
  return (id)objc_opt_new();
}

- (id)forceFinishRecording:(id)a3
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
  return 3;
}

- (NSString)name
{
  return (NSString *)CFSTR("Recording");
}

@end
