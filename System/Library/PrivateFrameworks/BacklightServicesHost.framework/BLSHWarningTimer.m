@implementation BLSHWarningTimer

- (void)timerFired
{
  void *v3;
  void *v4;

  -[BLSHAssertionAttributeTimer service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHAssertionAttributeTimer assertion](self, "assertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willCancelAssertion:", v4);

  -[BLSHAssertionAttributeTimer invalidate](self, "invalidate");
}

@end
