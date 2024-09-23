@implementation HMDDate

- (double)timeIntervalSince1970
{
  double v2;

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  return v2 + 978307200.0;
}

- (NSDate)now
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "now");
}

@end
