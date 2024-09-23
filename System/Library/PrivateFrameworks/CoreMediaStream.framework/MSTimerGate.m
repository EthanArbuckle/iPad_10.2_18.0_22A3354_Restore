@implementation MSTimerGate

- (MSTimerGate)init
{
  MSTimerGate *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSTimerGate;
  result = -[MSTimerGate init](&v3, sel_init);
  if (result)
    result->_enabled = 1;
  return result;
}

- (void)disable
{
  self->_enabled = 0;
}

- (void)enable
{
  self->_enabled = 1;
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
