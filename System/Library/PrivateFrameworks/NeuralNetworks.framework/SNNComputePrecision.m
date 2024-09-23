@implementation SNNComputePrecision

- (SNNComputePrecision)initWithComputePrecisionKind:(int64_t)a3
{
  SNNComputePrecision *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SNNComputePrecision;
  result = -[SNNComputePrecision init](&v5, sel_init);
  if (result)
    result->_kind = a3;
  return result;
}

- (int)storageType
{
  if (-[SNNComputePrecision kind](self, "kind") == 1)
    return 65568;
  else
    return 65552;
}

- (int64_t)kind
{
  return self->_kind;
}

@end
