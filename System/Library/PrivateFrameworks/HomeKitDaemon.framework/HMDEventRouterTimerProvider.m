@implementation HMDEventRouterTimerProvider

- (id)currentDate
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "now");
}

- (id)dateWithTimeIntervalSinceNow:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a3);
}

- (id)timerWithQueue:(id)a3 interval:(double)a4 timerFireHandler:(id)a5
{
  id v7;
  id v8;
  HMDEventRouterTimer *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[HMDEventRouterTimer initWithQueue:interval:timerFireHandler:]([HMDEventRouterTimer alloc], "initWithQueue:interval:timerFireHandler:", v8, v7, a4);

  return v9;
}

@end
