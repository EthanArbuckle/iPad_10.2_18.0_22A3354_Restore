@implementation _MTLAllocation

- (_MTLAllocation)initWithAllocationType:(unint64_t)a3
{
  _MTLAllocation *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MTLAllocation;
  result = -[_MTLObjectWithLabel init](&v5, sel_init);
  if (result)
    result->_allocationType = a3;
  return result;
}

@end
