@implementation _NSMorphologyAttributeDescriptor

- (unint64_t)retainCount
{
  return -1;
}

- (id)attributeValueFromValue:(id)a3
{
  if (_NSIsNSDictionary())
    return -[NSMorphology _initWithExternalRepresentationDictionary:]([NSMorphology alloc], "_initWithExternalRepresentationDictionary:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a3;
  else
    return 0;
}

@end
