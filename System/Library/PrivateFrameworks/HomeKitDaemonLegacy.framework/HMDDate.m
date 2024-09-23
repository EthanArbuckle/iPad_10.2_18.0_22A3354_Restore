@implementation HMDDate

- (double)timeIntervalSince1970
{
  double v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return v2 + 978307200.0;
}

- (NSDate)now
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "now");
}

@end
