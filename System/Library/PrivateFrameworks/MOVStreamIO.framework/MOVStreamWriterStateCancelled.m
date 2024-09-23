@implementation MOVStreamWriterStateCancelled

- (void)activateWithContext:(id)a3
{
  objc_msgSend(a3, "deleteFileOnCancel");
}

- (id)criticalErrorOccurred:(id)a3 context:(id)a4
{
  objc_msgSend(a4, "setCriticalError:", a3);
  return (id)objc_opt_new();
}

- (int64_t)writerStatus
{
  return 7;
}

- (id)name
{
  return CFSTR("Cancelled");
}

@end
