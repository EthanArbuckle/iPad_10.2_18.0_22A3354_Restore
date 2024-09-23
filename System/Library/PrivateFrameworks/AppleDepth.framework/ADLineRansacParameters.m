@implementation ADLineRansacParameters

- (ADLineRansacParameters)init
{
  ADLineRansacParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ADLineRansacParameters;
  result = -[ADLineRansacParameters init](&v3, sel_init);
  if (result)
  {
    result->_seed = 42;
    result->_maxIterations = 100;
    *(_QWORD *)&result->_threshold = 0x3F00000000000000;
    *(_WORD *)&result->_constantSlope = 0;
  }
  return result;
}

- (BOOL)constantSlope
{
  return self->_constantSlope;
}

- (void)setConstantSlope:(BOOL)a3
{
  self->_constantSlope = a3;
}

- (int)maxIterations
{
  return self->_maxIterations;
}

- (void)setMaxIterations:(int)a3
{
  self->_maxIterations = a3;
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (float)minInlinersRatio
{
  return self->_minInlinersRatio;
}

- (void)setMinInlinersRatio:(float)a3
{
  self->_minInlinersRatio = a3;
}

- (unsigned)seed
{
  return self->_seed;
}

- (void)setSeed:(unsigned int)a3
{
  self->_seed = a3;
}

- (BOOL)errorByY
{
  return self->_errorByY;
}

- (void)setErrorByY:(BOOL)a3
{
  self->_errorByY = a3;
}

@end
