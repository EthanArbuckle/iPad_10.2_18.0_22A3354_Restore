@implementation PHTextCycleLabel

- (void)startCyclingStrings
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSTimer *v8;
  NSTimer *cycleTimer;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHTextCycleLabel cycleStrings](self, "cycleStrings"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[PHTextCycleLabel setCurrentCycleStringIndex:](self, "setCurrentCycleStringIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_cycleStrings, "objectAtIndex:", -[PHTextCycleLabel currentCycleStringIndex](self, "currentCycleStringIndex")));
    v10.receiver = self;
    v10.super_class = (Class)PHTextCycleLabel;
    -[PHTextCycleLabel setText:](&v10, "setText:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHTextCycleLabel cycleTimer](self, "cycleTimer"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHTextCycleLabel cycleTimer](self, "cycleTimer"));
      objc_msgSend(v7, "invalidate");

      -[PHTextCycleLabel setCycleTimer:](self, "setCycleTimer:", 0);
    }
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "cycleToNextString", 0, 1, 2.5));
    cycleTimer = self->_cycleTimer;
    self->_cycleTimer = v8;

  }
}

- (void)cycleToNextString
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHTextCycleLabel cycleStrings](self, "cycleStrings"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[PHTextCycleLabel setCurrentCycleStringIndex:](self, "setCurrentCycleStringIndex:", (char *)-[PHTextCycleLabel currentCycleStringIndex](self, "currentCycleStringIndex") + 1);
    if (-[PHTextCycleLabel currentCycleStringIndex](self, "currentCycleStringIndex") >= (uint64_t)v4)
      -[PHTextCycleLabel setCurrentCycleStringIndex:](self, "setCurrentCycleStringIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHTextCycleLabel cycleStrings](self, "cycleStrings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", -[PHTextCycleLabel currentCycleStringIndex](self, "currentCycleStringIndex")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CATransition animation](CATransition, "animation"));
    objc_msgSend(v7, "setDuration:", 0.699999988);
    objc_msgSend(v7, "setType:", kCATransitionFade);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    objc_msgSend(v7, "setTimingFunction:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHTextCycleLabel layer](self, "layer"));
    objc_msgSend(v9, "addAnimation:forKey:", v7, CFSTR("labelTextChangeTransition"));

    v10.receiver = self;
    v10.super_class = (Class)PHTextCycleLabel;
    -[PHTextCycleLabel setText:](&v10, "setText:", v6);

  }
}

- (void)setText:(id)a3
{
  NSTimer *cycleTimer;
  NSTimer *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHTextCycleLabel;
  -[PHTextCycleLabel setText:](&v6, "setText:", a3);
  -[PHTextCycleLabel setNumberOfLines:](self, "setNumberOfLines:", 2);
  -[PHTextCycleLabel setAdjustsFontSizeToFitWidth:](self, "setAdjustsFontSizeToFitWidth:", 1);
  cycleTimer = self->_cycleTimer;
  if (cycleTimer)
  {
    -[NSTimer invalidate](cycleTimer, "invalidate");
    v5 = self->_cycleTimer;
    self->_cycleTimer = 0;

    self->_currentCycleStringIndex = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_cycleTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PHTextCycleLabel;
  -[PHTextCycleLabel dealloc](&v3, "dealloc");
}

- (NSArray)cycleStrings
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCycleStrings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSTimer)cycleTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCycleTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)currentCycleStringIndex
{
  return self->_currentCycleStringIndex;
}

- (void)setCurrentCycleStringIndex:(int64_t)a3
{
  self->_currentCycleStringIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cycleTimer, 0);
  objc_storeStrong((id *)&self->_cycleStrings, 0);
}

@end
