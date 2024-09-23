@implementation DEDialogStateFamily

- (int)usageCount
{
  return -[DEDialogState getFamily](self, "getFamily");
}

- (double)lastTimestamp
{
  double v2;

  -[DEDialogState getFamily](self, "getFamily");
  return v2;
}

@end
