@implementation _CPPowerAssertion

- (_CPPowerAssertion)initWithIdentifier:(id)a3 timeout:(double)a4
{
  _CPPowerAssertion *v6;
  _CPPowerAssertion *v7;
  uint64_t v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_CPPowerAssertion;
  v6 = -[_CPPowerAssertion init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a4 <= 0.0)
    {
      v8 = IOPMAssertionCreateWithName(CFSTR("NoIdleSleepAssertion"), 0xFFu, (CFStringRef)a3, &v6->_assertion);
      if ((_DWORD)v8)
        goto LABEL_4;
    }
    else
    {
      v8 = IOPMAssertionCreateWithDescription(CFSTR("NoIdleSleepAssertion"), (CFStringRef)a3, 0, 0, 0, a4 + 60.0, CFSTR("TimeoutActionTurnOff"), &v6->_assertion);
      if ((_DWORD)v8)
      {
LABEL_4:
        v7->_assertion = 0;
        NSLog((NSString *)CFSTR("Unable to create the power assertion for \"%@\" (%d)."), a3, v8);

        return 0;
      }
    }
    v7->_identifier = (NSString *)objc_msgSend(a3, "copy");
    v7->_timeout = a4;
    v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v7->_stack = (NSArray *)(id)objc_msgSend(MEMORY[0x1E0CB3978], "callStackReturnAddresses");
    if (a4 > 0.0)
    {
      pthread_mutex_lock(&_PowerAssertionsLock);
      if (!_PowerAssertions)
        _PowerAssertions = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
      if (!_PowerAssertionTimerThread)
      {
        _PowerAssertionTimerThread = objc_alloc_init(_CPPowerAssertionThread);
        objc_msgSend((id)_PowerAssertionTimerThread, "start");
      }
      pthread_mutex_unlock(&_PowerAssertionsLock);
      objc_msgSend((id)_PowerAssertionTimerThread, "performSelector:onThread:withObject:waitUntilDone:", sel_addAssertion_, _PowerAssertionTimerThread, v7, 0);
    }
    objc_msgSend(v9, "drain");
  }
  return v7;
}

- (void)dealloc
{
  const __CFArray *v3;
  CFIndex FirstIndexOfValue;
  IOPMAssertionID assertion;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  CFRange v9;

  pthread_mutex_lock(&_PowerAssertionsLock);
  v3 = (const __CFArray *)_PowerAssertions;
  if (_PowerAssertions)
  {
    v9.length = CFArrayGetCount((CFArrayRef)_PowerAssertions);
    v9.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v3, v9, self);
    if (FirstIndexOfValue != -1)
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)_PowerAssertions, FirstIndexOfValue);
  }
  pthread_mutex_unlock(&_PowerAssertionsLock);
  assertion = self->_assertion;
  if (assertion)
  {
    v6 = IOPMAssertionRelease(assertion);
    if ((_DWORD)v6)
    {
      NSLog((NSString *)CFSTR("Unable to properly release the power assertion for \"%@\" (%d).  Dropping it instead."), self->_identifier, v6);
      v7 = getpid();
      NSLog((NSString *)CFSTR("Backtrace for power assertion: pid %d %@"), v7, self->_stack);
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)_CPPowerAssertion;
  -[_CPPowerAssertion dealloc](&v8, sel_dealloc);
}

- (void)timedout
{
  uint64_t v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Power assertion timeout for \"%@\".  Simply releasing it now.\nBacktrace for power assertion: pid %d %@"), self->_identifier, getpid(), self->_stack);
  NSLog((NSString *)CFSTR("%@"), v4);
  v3 = IOPMAssertionRelease(self->_assertion);
  if ((_DWORD)v3)
    NSLog((NSString *)CFSTR("Unable to properly release the power assertion though (%d).  Just dropping it."), v3);
  self->_assertion = 0;

}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

@end
