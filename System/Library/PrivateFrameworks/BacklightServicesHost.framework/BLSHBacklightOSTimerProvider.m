@implementation BLSHBacklightOSTimerProvider

- (NSDate)now
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "now");
}

- (id)dateWithTimeIntervalSinceNow:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a3);
}

- (id)scheduledTimerWithIdentifier:(id)a3 interval:(double)a4 leewayInterval:(double)a5 handler:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  void *v12;

  v9 = (objc_class *)MEMORY[0x24BE0BDE8];
  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithIdentifier:", v11);

  objc_msgSend(v12, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x24BDAC9B8], v10, a4, a5);
  return v12;
}

- (id)scheduledWakingTimerWithIdentifier:(id)a3 interval:(double)a4 leewayInterval:(double)a5 handler:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  void *v12;

  v9 = (objc_class *)MEMORY[0x24BEB3748];
  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithIdentifier:", v11);

  objc_msgSend(v12, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x24BDAC9B8], v10, a4, a5);
  return v12;
}

- (void)dispatchToMainQueueAfterSecondsDelay:(double)a3 identifier:(id)a4 block:(id)a5
{
  int64_t v5;
  dispatch_time_t v6;
  dispatch_block_t block;

  v5 = (uint64_t)(a3 * 1000000000.0);
  block = a5;
  v6 = dispatch_time(0, v5);
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);

}

@end
