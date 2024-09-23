@implementation _NSAssumedFallbackInflectionAttributeDescriptor

- (unint64_t)retainCount
{
  return -1;
}

- (id)attributeValueFromValue:(id)a3
{
  if (_NSIsNSDictionary())
    return -[_NSAttributedStringGrammarInflection initWithExternalRepresentationDictionary:error:]([_NSAttributedStringGrammarInflection alloc], "initWithExternalRepresentationDictionary:error:", a3, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
  }
  return a3;
}

@end
