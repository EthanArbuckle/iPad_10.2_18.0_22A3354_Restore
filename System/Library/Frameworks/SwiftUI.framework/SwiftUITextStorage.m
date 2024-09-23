@implementation SwiftUITextStorage

- (BOOL)_baselineMode
{
  return 0;
}

- (BOOL)_isStringDrawingTextStorage
{
  return 1;
}

- (BOOL)_shouldSetOriginalFontAttribute
{
  return 1;
}

- (double)defaultTighteningFactor
{
  return self->_defaultTighteningFactor;
}

- (void)setDefaultTighteningFactor:(double)a3
{
  self->_defaultTighteningFactor = a3;
}

- (double)_baselineDelta
{
  return self->_baselineDelta;
}

- (void)_setBaselineDelta:(double)a3
{
  self->_baselineDelta = a3;
}

- (BOOL)_forceWordWrapping
{
  return self->_forceWordWrapping;
}

- (void)_setForceWordWrapping:(BOOL)a3
{
  self->_forceWordWrapping = a3;
}

- (BOOL)_wrappedByCluster
{
  return self->_wrappedByCluster;
}

- (void)_setWrappedByCluster:(BOOL)a3
{
  self->_wrappedByCluster = a3;
}

@end
