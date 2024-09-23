@implementation HMFTimerManagerDefaultDataSource

- (double)currentTime
{
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  return -[HMFTimer initWithTimeInterval:options:]([HMFTimer alloc], "initWithTimeInterval:options:", a4, a3);
}

@end
