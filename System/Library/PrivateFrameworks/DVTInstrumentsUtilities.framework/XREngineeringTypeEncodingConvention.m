@implementation XREngineeringTypeEncodingConvention

- (XREngineeringTypeEncodingConvention)init
{
  XREngineeringTypeEncodingConvention *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)XREngineeringTypeEncodingConvention;
  result = -[XREngineeringTypeEncodingConvention init](&v3, sel_init);
  if (result)
    result->_bitWidth = -1;
  return result;
}

- (int)sentinel
{
  return self->_sentinel;
}

- (void)setSentinel:(int)a3
{
  self->_sentinel = a3;
}

- (int64_t)bitWidth
{
  return self->_bitWidth;
}

- (void)setBitWidth:(int64_t)a3
{
  self->_bitWidth = a3;
}

@end
