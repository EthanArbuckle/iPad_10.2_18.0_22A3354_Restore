@implementation BKPurchaseDAAPBackoff

- (BOOL)hasBackedOff
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[BKPurchaseDAAPBackoff backoffUntil](self, "backoffUntil");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[BKPurchaseDAAPBackoff backoffUntil](self, "backoffUntil");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5) == -1;

  return v6;
}

- (BOOL)failureIntervals:(unint64_t)a3
{
  int64_t v4;
  int64_t v5;
  void *v6;

  -[BKPurchaseDAAPBackoff setFailureCount:](self, "setFailureCount:", -[BKPurchaseDAAPBackoff failureCount](self, "failureCount") + a3);
  if (-[BKPurchaseDAAPBackoff failureCount](self, "failureCount") >= 4)
  {
    v4 = -[BKPurchaseDAAPBackoff failureCount](self, "failureCount");
    v5 = -[BKPurchaseDAAPBackoff failureCount](self, "failureCount");
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)(unint64_t)((60 * v4 - 120) * (v5 - 2)));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKPurchaseDAAPBackoff setBackoffUntil:](self, "setBackoffUntil:", v6);

  }
  return -[BKPurchaseDAAPBackoff hasBackedOff](self, "hasBackedOff");
}

- (void)clear
{
  -[BKPurchaseDAAPBackoff setFailureCount:](self, "setFailureCount:", 0);
  -[BKPurchaseDAAPBackoff setBackoffUntil:](self, "setBackoffUntil:", 0);
}

- (NSDate)backoffUntil
{
  return self->_backoffUntil;
}

- (void)setBackoffUntil:(id)a3
{
  objc_storeStrong((id *)&self->_backoffUntil, a3);
}

- (int64_t)failureCount
{
  return self->_failureCount;
}

- (void)setFailureCount:(int64_t)a3
{
  self->_failureCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backoffUntil, 0);
}

@end
