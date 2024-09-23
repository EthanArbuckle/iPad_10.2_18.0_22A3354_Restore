@implementation HMDBackgroundOperationDataSource

- (id)currentDate
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "now");
}

- (id)dateWithTimeIntervalSinceNow:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a3);
}

- (double)timeIntervalSinceNowToDate:(id)a3
{
  double result;

  objc_msgSend(a3, "timeIntervalSinceNow");
  return result;
}

@end
