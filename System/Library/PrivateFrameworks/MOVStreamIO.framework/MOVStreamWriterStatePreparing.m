@implementation MOVStreamWriterStatePreparing

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

- (id)forceFinishRecording:(id)a3
{
  return (id)objc_opt_new();
}

- (id)finishRecording:(id)a3
{
  return (id)objc_opt_new();
}

- (id)prepareFinished:(id)a3
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
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "movMetadataItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executePrepareToRecordWithMovieMetadata:", v4);

}

- (int64_t)writerStatus
{
  return 2;
}

- (NSString)name
{
  return (NSString *)CFSTR("Preparing");
}

@end
