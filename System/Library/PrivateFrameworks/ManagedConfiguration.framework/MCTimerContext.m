@implementation MCTimerContext

- (MCTimerContext)init
{
  MCTimerContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MCTimerContext;
  result = -[MCTimerContext init](&v3, sel_init);
  if (result)
    result->_enabled = 1;
  return result;
}

- (void)disable
{
  self->_enabled = 0;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end
