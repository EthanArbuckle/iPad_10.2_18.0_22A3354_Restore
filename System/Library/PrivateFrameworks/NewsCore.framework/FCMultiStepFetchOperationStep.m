@implementation FCMultiStepFetchOperationStep

- (void)setIsCritical:(BOOL)a3
{
  self->_isCritical = a3;
}

- (void)setFetchSelector:(SEL)a3
{
  self->_fetchSelector = a3;
}

- (SEL)fetchSelector
{
  return self->_fetchSelector;
}

- (BOOL)isCritical
{
  return self->_isCritical;
}

@end
