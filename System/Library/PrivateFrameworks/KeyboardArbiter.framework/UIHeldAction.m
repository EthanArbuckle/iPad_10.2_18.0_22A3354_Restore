@implementation UIHeldAction

- (void)hold
{
  NSDate *v3;
  NSDate *holdBegan;
  NSDate *v5;
  void *v6;
  double v7;

  if (-[UIDelayedAction scheduled](self, "scheduled"))
  {
    if (!self->_holding)
    {
      -[UIHeldAction unschedule](self, "unschedule");
      self->_holding = 1;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
      holdBegan = self->_holdBegan;
      self->_holdBegan = v3;

      v5 = self->_holdBegan;
      -[UIDelayedAction _startDate](self, "_startDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate timeIntervalSinceDate:](v5, "timeIntervalSinceDate:", v6);
      self->_timeBalance = v7 + self->_timeBalance;

      self->_timeBalance = fmin(self->_timeBalance, self->_baseDelay);
    }
  }
}

- (void)resume
{
  void *v3;
  double v4;
  double v5;
  double baseDelay;

  if (self->_holding && !-[UIDelayedAction _canceled](self, "_canceled"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", self->_holdBegan);
    self->_timeBalance = self->_timeBalance - v4;

    v5 = fmax(self->_timeBalance, 0.0);
    self->_timeBalance = v5;
    baseDelay = self->_baseDelay;
    -[UIHeldAction touchWithDelay:](self, "touchWithDelay:", fmin(baseDelay - v5, baseDelay));
    self->_baseDelay = baseDelay;
  }
}

- (BOOL)isHolding
{
  return self->_holding;
}

- (void)touchWithDelay:(double)a3
{
  NSDate *holdBegan;
  objc_super v6;

  self->_holding = 0;
  holdBegan = self->_holdBegan;
  self->_holdBegan = 0;

  self->_baseDelay = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIHeldAction;
  -[UIDelayedAction touchWithDelay:](&v6, sel_touchWithDelay_, a3);
}

- (void)unschedule
{
  NSDate *holdBegan;
  objc_super v4;

  self->_holding = 0;
  holdBegan = self->_holdBegan;
  self->_holdBegan = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIHeldAction;
  -[UIDelayedAction unschedule](&v4, sel_unschedule);
}

- (void)cancel
{
  objc_super v2;

  self->_timeBalance = 0.0;
  v2.receiver = self;
  v2.super_class = (Class)UIHeldAction;
  -[UIDelayedAction cancel](&v2, sel_cancel);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdBegan, 0);
}

@end
