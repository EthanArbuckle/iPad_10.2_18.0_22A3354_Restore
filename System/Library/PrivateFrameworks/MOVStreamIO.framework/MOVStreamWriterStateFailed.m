@implementation MOVStreamWriterStateFailed

- (void)activateWithContext:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "closeEncodersAfterFailure");
  objc_msgSend(v3, "deleteMOVFile");

}

- (int64_t)writerStatus
{
  return 8;
}

- (id)name
{
  return CFSTR("Failed");
}

@end
