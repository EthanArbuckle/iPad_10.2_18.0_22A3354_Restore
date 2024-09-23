@implementation DMCRFFakeSnapshot

- (NSDate)date
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
}

- (NSDate)dateCreated
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
}

- (NSDate)dateModified
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
}

- (NSString)deviceName
{
  return (NSString *)CFSTR("Fake Device");
}

- (DMCRFSnapshotIdentifier)identifier
{
  return (DMCRFSnapshotIdentifier *)objc_alloc_init(DMCRFFakeSnapshotIdentifier);
}

@end
