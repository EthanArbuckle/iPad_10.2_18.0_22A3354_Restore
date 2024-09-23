@implementation _NSInflectionAttributeDescriptor

- (unint64_t)retainCount
{
  return -1;
}

- (id)attributeValueFromValue:(id)a3
{
  if (_NSIsNSNumber())
  {
    if (objc_msgSend(a3, "BOOLValue"))
      return a3;
    else
      return 0;
  }
  else if (_NSIsNSDictionary())
  {
    return -[NSInflectionRuleExplicit initWithMorphology:]([NSInflectionRuleExplicit alloc], "initWithMorphology:", -[NSMorphology _initWithExternalRepresentationDictionary:]([NSMorphology alloc], "_initWithExternalRepresentationDictionary:", a3));
  }
  else
  {
    return 0;
  }
}

@end
