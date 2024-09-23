@implementation AFMyriadGoodnessScoreOverrideContext

- (BOOL)overrideContext
{
  return self->_overrideContext;
}

- (void)setOverrideContext:(BOOL)a3
{
  self->_overrideContext = a3;
}

- (unsigned)overriddenAdjustedScore
{
  return self->_overriddenAdjustedScore;
}

- (void)setOverriddenAdjustedScore:(unsigned __int8)a3
{
  self->_overriddenAdjustedScore = a3;
}

@end
