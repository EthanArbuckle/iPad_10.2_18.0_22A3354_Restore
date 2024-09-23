@implementation _NSStringAttributeDescriptor

- (unint64_t)retainCount
{
  return -1;
}

- (id)attributeValueFromValue:(id)a3
{
  if (_NSIsNSString())
    return a3;
  else
    return 0;
}

@end
