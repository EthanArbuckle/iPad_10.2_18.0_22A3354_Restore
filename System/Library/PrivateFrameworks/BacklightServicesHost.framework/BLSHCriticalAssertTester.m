@implementation BLSHCriticalAssertTester

- (BLSHCriticalAssertTester)initWithNotificationName:(id)a3
{
  __CFString *v4;
  BLSHCriticalAssertTester *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v8;

  v4 = (__CFString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)BLSHCriticalAssertTester;
  v5 = -[BLSHCriticalAssertTester init](&v8, sel_init);
  if (v5)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_triggerTestCriticalAssert, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v5;
}

- (void)_triggerTestCriticalAssert:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void (**v8)(_QWORD);
  dispatch_time_t v9;
  _QWORD v10[4];
  id v11;
  BLSHCriticalAssertTester *v12;
  SEL v13;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Test Critical Assert did fail: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BLSHRecordCriticalAssertFailure(v6);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__BLSHCriticalAssertTester__triggerTestCriticalAssert___block_invoke;
  v10[3] = &unk_24D1BC070;
  v12 = self;
  v13 = a2;
  v11 = v5;
  v7 = v5;
  v8 = (void (**)(_QWORD))MEMORY[0x2199D2BD8](v10);
  if (BLSHIsUnitTestRunning())
  {
    v8[2](v8);
  }
  else
  {
    v9 = dispatch_time(0, 1000000000);
    dispatch_after(v9, MEMORY[0x24BDAC9B8], v8);
  }

}

void __55__BLSHCriticalAssertTester__triggerTestCriticalAssert___block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("BLSHCriticalAssertDidFailNotification"), 0, 0, 4u);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Test Critical Assert did fail: %@"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544642;
    v9 = v4;
    v10 = 2114;
    v11 = v6;
    v12 = 2048;
    v13 = v7;
    v14 = 2114;
    v15 = CFSTR("BLSHCriticalAssertTester.m");
    v16 = 1024;
    v17 = 27;
    v18 = 2114;
    v19 = v3;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

@end
