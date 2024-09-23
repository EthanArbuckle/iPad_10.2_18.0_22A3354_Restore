@implementation _NSNumberFormattingAttributeDescriptor

- (unint64_t)retainCount
{
  return -1;
}

- (id)attributeValueFromValue:(id)a3
{
  if (_NSIsNSNumber() && objc_msgSend(a3, "BOOLValue"))
    return +[NSLocalizedNumberFormatRule automatic](NSLocalizedNumberFormatRule, "automatic");
  else
    return 0;
}

@end
