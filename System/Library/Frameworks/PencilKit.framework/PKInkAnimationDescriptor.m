@implementation PKInkAnimationDescriptor

- (PKInkAnimationDescriptor)initWithDuration:(double)a3 sizeDelta:(double)a4
{
  PKInkAnimationDescriptor *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKInkAnimationDescriptor;
  result = -[PKInkAnimationDescriptor init](&v7, sel_init);
  if (result)
  {
    result->_duration = a3;
    result->_sizeDelta = a4;
  }
  return result;
}

- (id)mutableCopy
{
  return -[PKInkAnimationDescriptor initWithDuration:sizeDelta:]([PKInkAnimationDescriptor alloc], "initWithDuration:sizeDelta:", self->_duration, self->_sizeDelta);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)sizeDelta
{
  return self->_sizeDelta;
}

- (void)setSizeDelta:(double)a3
{
  self->_sizeDelta = a3;
}

@end
