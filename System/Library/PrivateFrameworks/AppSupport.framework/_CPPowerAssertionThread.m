@implementation _CPPowerAssertionThread

- (void)main
{
  void *v3;
  NSTimer *v4;

  self->_earliest = (NSDate *)(id)objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v4 = (NSTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", self->_earliest, self, sel_didTimeOut_, 0, 1, 60.0);
  self->_timer = v4;
  objc_msgSend(v3, "addTimer:forMode:", v4, *MEMORY[0x1E0C99748]);
  objc_msgSend(v3, "run");
}

- (void)addAssertion:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSDate *earliest;
  double v9;
  double v10;
  CFIndex v11;
  CFIndex v12;
  CFIndex i;
  void *ValueAtIndex;
  double v15;
  CFIndex Count;
  CFIndex v17;
  CFRange v18;

  pthread_mutex_lock(&_PowerAssertionsLock);
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a3, "timeout");
  v6 = (void *)objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  v7 = objc_msgSend(v6, "earlierDate:", self->_earliest);
  earliest = self->_earliest;
  if ((NSDate *)v7 == earliest)
  {
    objc_msgSend(v6, "timeIntervalSinceDate:");
    objc_msgSend(a3, "setTimeout:");
    Count = CFArrayGetCount((CFArrayRef)_PowerAssertions);
    v18.location = 0;
    v18.length = Count;
    v17 = CFArrayBSearchValues((CFArrayRef)_PowerAssertions, v18, a3, (CFComparatorFunction)_CompareAssertionTimeouts, 0);
    if (v17 <= Count)
      CFArrayInsertValueAtIndex((CFMutableArrayRef)_PowerAssertions, v17, a3);
    else
      CFArrayAppendValue((CFMutableArrayRef)_PowerAssertions, a3);
  }
  else
  {
    -[NSDate timeIntervalSinceDate:](earliest, "timeIntervalSinceDate:", v6);
    v10 = v9;
    v11 = CFArrayGetCount((CFArrayRef)_PowerAssertions);
    if (v11 >= 1)
    {
      v12 = v11;
      for (i = 0; i != v12; ++i)
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex((CFArrayRef)_PowerAssertions, i);
        objc_msgSend(ValueAtIndex, "timeout");
        objc_msgSend(ValueAtIndex, "setTimeout:", v10 + v15);
      }
    }

    self->_earliest = (NSDate *)v6;
    objc_msgSend(a3, "setTimeout:", 0.0);
    CFArrayInsertValueAtIndex((CFMutableArrayRef)_PowerAssertions, 0, a3);
    -[NSTimer setFireDate:](self->_timer, "setFireDate:", v6);
  }
  pthread_mutex_unlock(&_PowerAssertionsLock);
}

- (void)didTimeOut:(id)a3
{
  CFIndex Count;
  CFIndex v5;
  double v6;
  CFIndex v7;
  void *ValueAtIndex;
  double v9;
  double v10;
  double v11;
  CFRange v12;

  pthread_mutex_lock(&_PowerAssertionsLock);
  Count = CFArrayGetCount((CFArrayRef)_PowerAssertions);

  self->_earliest = (NSDate *)(id)objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  if (Count >= 1)
  {
    v5 = 0;
    v6 = 0.0;
    v7 = -1;
    do
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex((CFArrayRef)_PowerAssertions, v5);
      objc_msgSend(ValueAtIndex, "timeout");
      if (v9 == 0.0)
      {
        objc_msgSend(ValueAtIndex, "timedout");
      }
      else
      {
        if (v6 == 0.0)
        {
          objc_msgSend(ValueAtIndex, "timeout");
          v6 = v10;

          self->_earliest = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", v6);
          v7 = v5;
        }
        objc_msgSend(ValueAtIndex, "timeout");
        objc_msgSend(ValueAtIndex, "setTimeout:", v11 - v6);
      }
      ++v5;
    }
    while (Count != v5);
    if (v7 != -1)
    {
      v12.location = 0;
      v12.length = v7;
      CFArrayReplaceValues((CFMutableArrayRef)_PowerAssertions, v12, 0, 0);
    }
  }
  -[NSTimer setFireDate:](self->_timer, "setFireDate:", self->_earliest);
  pthread_mutex_unlock(&_PowerAssertionsLock);
}

@end
