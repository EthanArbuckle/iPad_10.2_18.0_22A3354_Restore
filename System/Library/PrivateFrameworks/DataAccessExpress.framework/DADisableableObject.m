@implementation DADisableableObject

- (void)disable
{
  self->_isDisabled = 1;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

@end
