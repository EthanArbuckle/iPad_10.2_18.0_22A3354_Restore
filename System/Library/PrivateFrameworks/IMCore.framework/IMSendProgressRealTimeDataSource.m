@implementation IMSendProgressRealTimeDataSource

- (double)timeIntervalSinceReferenceDate
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

@end
