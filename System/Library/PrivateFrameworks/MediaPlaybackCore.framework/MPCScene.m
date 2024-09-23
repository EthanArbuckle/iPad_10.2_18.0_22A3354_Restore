@implementation MPCScene

- (MPCScene)init
{
  MPCScene *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPCScene;
  result = -[MPCScene init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_endFrame = xmmword_210ED9480;
  return result;
}

- (int64_t)startFrame
{
  return self->_startFrame;
}

- (void)setStartFrame:(int64_t)a3
{
  self->_startFrame = a3;
}

- (int64_t)endFrame
{
  return self->_endFrame;
}

- (void)setEndFrame:(int64_t)a3
{
  self->_endFrame = a3;
}

- (int64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(int64_t)a3
{
  self->_iterations = a3;
}

@end
