@implementation BLSHTimeoutTimer

- (BOOL)reactivateIfPossible
{
  NSObject *v3;

  bls_assertions_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[BLSHTimeoutTimer reactivateIfPossible].cold.1(self, v3);

  -[BLSHTimeoutTimer restartTimer](self, "restartTimer");
  return 1;
}

- (void)timerFired
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[BLSHAssertionAttributeTimer service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHAssertionAttributeTimer assertion](self, "assertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BE0B778];
  v9 = *MEMORY[0x24BDD0FC8];
  v10[0] = CFSTR("timeout duration expired");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 11, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAssertion:withError:", v4, v8);

  -[BLSHAssertionAttributeTimer cancel](self, "cancel");
}

- (void)restartTimer
{
  -[BLSHAssertionAttributeTimer cancel](self, "cancel");
  -[BLSHAssertionAttributeTimer startTimer]((uint64_t)self);
}

- (void)reactivateIfPossible
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "attribute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "assertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218754;
  v7 = a1;
  v8 = 2114;
  v9 = a1;
  v10 = 2112;
  v11 = v4;
  v12 = 2112;
  v13 = v5;
  _os_log_debug_impl(&dword_2145AC000, a2, OS_LOG_TYPE_DEBUG, "%p will restart timer:%{public}@ for attribute:%{pubic}@ assertion:%{pubic}@", (uint8_t *)&v6, 0x2Au);

}

@end
