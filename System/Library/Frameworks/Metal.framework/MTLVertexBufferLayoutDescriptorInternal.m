@implementation MTLVertexBufferLayoutDescriptorInternal

- (unint64_t)stride
{
  return self->_stride;
}

- (unint64_t)stepRate
{
  return self->_instanceStepRate;
}

- (unint64_t)stepFunction
{
  return self->_stepFunction;
}

- (MTLVertexBufferLayoutDescriptorInternal)init
{
  MTLVertexBufferLayoutDescriptorInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLVertexBufferLayoutDescriptorInternal;
  result = -[MTLVertexBufferLayoutDescriptorInternal init](&v3, sel_init);
  if (result)
  {
    result->_stride = 0;
    result->_stepFunction = 1;
    result->_instanceStepRate = 1;
  }
  return result;
}

- (void)setStride:(unint64_t)a3
{
  self->_stride = a3;
}

- (void)setStepFunction:(unint64_t)a3
{
  self->_stepFunction = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_stride;
  *((_QWORD *)result + 2) = self->_stepFunction;
  *((_QWORD *)result + 3) = self->_instanceStepRate;
  return result;
}

- (void)setStepRate:(unint64_t)a3
{
  self->_instanceStepRate = a3;
}

- (BOOL)isStrideDynamic
{
  return -[MTLVertexBufferLayoutDescriptorInternal stride](self, "stride") == -1;
}

@end
