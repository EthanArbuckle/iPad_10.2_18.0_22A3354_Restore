@implementation BLSHInvalidationTimer

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
  v10[0] = CFSTR("invalidation duration expired");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAssertion:withError:", v4, v8);

  -[BLSHAssertionAttributeTimer invalidate](self, "invalidate");
}

@end
