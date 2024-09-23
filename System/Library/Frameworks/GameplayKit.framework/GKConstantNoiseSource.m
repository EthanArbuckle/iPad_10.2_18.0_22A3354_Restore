@implementation GKConstantNoiseSource

+ (GKConstantNoiseSource)constantNoiseWithValue:(double)value
{
  return (GKConstantNoiseSource *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValue:", value);
}

- (GKConstantNoiseSource)init
{
  return -[GKConstantNoiseSource initWithValue:](self, "initWithValue:", 0.0);
}

- (GKConstantNoiseSource)initWithValue:(double)value
{
  GKConstantNoiseSource *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKConstantNoiseSource;
  result = -[GKConstantNoiseSource init](&v5, sel_init);
  if (result)
    result->_value = value;
  return result;
}

- (double)valueAt:(GKConstantNoiseSource *)self
{
  return self->_value;
}

- (id)cloneModule
{
  return +[GKConstantNoiseSource constantNoiseWithValue:](GKConstantNoiseSource, "constantNoiseWithValue:", self->_value);
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)value
{
  self->_value = value;
}

@end
