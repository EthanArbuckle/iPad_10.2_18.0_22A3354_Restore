@implementation _NSThreadPerformInfo

- (int)wait
{
  int state;

  -[NSCondition lock](self->_waiter, "lock");
  while (1)
  {
    state = self->_state;
    if (state)
      break;
    -[NSCondition wait](self->_waiter, "wait");
  }
  -[NSCondition unlock](self->_waiter, "unlock");
  return state;
}

- (void)signal:(int)a3
{
  -[NSCondition lock](self->_waiter, "lock");
  self->_state = a3;
  -[NSCondition signal](self->_waiter, "signal");
  -[NSCondition unlock](self->_waiter, "unlock");
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSThreadPerformInfo;
  -[_NSThreadPerformInfo dealloc](&v3, sel_dealloc);
}

@end
