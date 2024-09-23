@implementation _NSURLAttributeDescriptor

- (unint64_t)retainCount
{
  return -1;
}

- (id)attributeValueFromValue:(id)a3
{
  if (_NSIsNSString())
    return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
  else
    return 0;
}

@end
