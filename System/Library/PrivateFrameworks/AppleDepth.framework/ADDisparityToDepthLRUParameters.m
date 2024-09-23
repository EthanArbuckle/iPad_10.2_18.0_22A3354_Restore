@implementation ADDisparityToDepthLRUParameters

- (ADDisparityToDepthLRUParameters)init
{
  ADDisparityToDepthLRUParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ADDisparityToDepthLRUParameters;
  result = -[ADDisparityToDepthLRUParameters init](&v3, sel_init);
  if (result)
  {
    result->_capacity = 900;
    result->_threshold = 0.1;
  }
  return result;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

@end
