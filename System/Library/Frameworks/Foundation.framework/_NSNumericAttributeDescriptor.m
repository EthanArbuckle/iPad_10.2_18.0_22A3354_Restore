@implementation _NSNumericAttributeDescriptor

- (unint64_t)retainCount
{
  return -1;
}

- (id)attributeValueFromValue:(id)a3
{
  if (_NSIsNSNumber())
    return a3;
  else
    return 0;
}

@end
