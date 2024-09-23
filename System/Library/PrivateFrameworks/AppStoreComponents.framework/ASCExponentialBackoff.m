@implementation ASCExponentialBackoff

- (ASCExponentialBackoff)initWithBaseSleepTimeInterval:(double)a3 maxSleepTimeInterval:(double)a4
{
  ASCExponentialBackoff *v6;
  ASCExponentialBackoff *v7;
  JEUnfairLock *v8;
  JEUnfairLock *attemptLock;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ASCExponentialBackoff;
  v6 = -[ASCExponentialBackoff init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_baseSleepTimeInterval = a3;
    v6->_maxSleepTimeInterval = a4;
    v8 = (JEUnfairLock *)objc_alloc_init(MEMORY[0x1E0D41860]);
    attemptLock = v7->_attemptLock;
    v7->_attemptLock = v8;

    v7->_attemptsMade = 0;
  }
  return v7;
}

- (double)nextSleepTimeInterval
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double result;

  -[ASCExponentialBackoff attemptLock](self, "attemptLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = exp2((double)-[ASCExponentialBackoff attemptsMade](self, "attemptsMade"));
  -[ASCExponentialBackoff baseSleepTimeInterval](self, "baseSleepTimeInterval");
  v6 = v5 * v4;
  -[ASCExponentialBackoff setAttemptsMade:](self, "setAttemptsMade:", -[ASCExponentialBackoff attemptsMade](self, "attemptsMade") + 1);
  -[ASCExponentialBackoff attemptLock](self, "attemptLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  -[ASCExponentialBackoff maxSleepTimeInterval](self, "maxSleepTimeInterval");
  if (result >= v6)
    return v6;
  return result;
}

- (void)reset
{
  void *v3;
  id v4;

  -[ASCExponentialBackoff attemptLock](self, "attemptLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[ASCExponentialBackoff setAttemptsMade:](self, "setAttemptsMade:", 0);
  -[ASCExponentialBackoff attemptLock](self, "attemptLock");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

}

- (double)baseSleepTimeInterval
{
  return self->_baseSleepTimeInterval;
}

- (double)maxSleepTimeInterval
{
  return self->_maxSleepTimeInterval;
}

- (JEUnfairLock)attemptLock
{
  return self->_attemptLock;
}

- (int64_t)attemptsMade
{
  return self->_attemptsMade;
}

- (void)setAttemptsMade:(int64_t)a3
{
  self->_attemptsMade = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attemptLock, 0);
}

@end
