@implementation BLTPBSelectorItem

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (void)method
{
  return self->_method;
}

- (void)setMethod:(void *)a3
{
  self->_method = a3;
}

@end
