@implementation ASCJitterBackoff

- (ASCJitterBackoff)initWithBaseSleepTimeInterval:(double)a3 maxSleepTimeInterval:(double)a4
{
  ASCJitterBackoff *v6;
  ASCExponentialBackoff *v7;
  ASCExponentialBackoff *exponentialBackoff;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ASCJitterBackoff;
  v6 = -[ASCJitterBackoff init](&v10, sel_init);
  if (v6)
  {
    v7 = -[ASCExponentialBackoff initWithBaseSleepTimeInterval:maxSleepTimeInterval:]([ASCExponentialBackoff alloc], "initWithBaseSleepTimeInterval:maxSleepTimeInterval:", a3, a4);
    exponentialBackoff = v6->_exponentialBackoff;
    v6->_exponentialBackoff = v7;

  }
  return v6;
}

- (double)nextSleepTimeInterval
{
  double v3;
  void *v4;
  double v5;
  double v6;

  v3 = (double)arc4random() / 4294967300.0;
  -[ASCJitterBackoff exponentialBackoff](self, "exponentialBackoff");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextSleepTimeInterval");
  v6 = v3 * v5;

  return v6;
}

- (void)reset
{
  id v2;

  -[ASCJitterBackoff exponentialBackoff](self, "exponentialBackoff");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (ASCExponentialBackoff)exponentialBackoff
{
  return self->_exponentialBackoff;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exponentialBackoff, 0);
}

@end
