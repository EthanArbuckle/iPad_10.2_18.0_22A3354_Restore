@implementation _NSPersonNameComponentsStyleFormatterShortNameSimpleFallback

- (id)stringFromComponents:(id)a3 attributesByRange:(id)a4
{
  id v7;
  void *v8;

  if (!-[_NSPersonNameComponentsStyleFormatter fullComponentsAreValid:](self, "fullComponentsAreValid:"))
    return 0;
  v7 = -[_NSPersonNameComponentsStyleFormatter _formattedStringFromOrderedKeys:components:attributesByRange:](self, "_formattedStringFromOrderedKeys:components:attributesByRange:", -[_NSPersonNameComponentsStyleFormatter _orderedNonEmptyKeysFromComponents:](self, "_orderedNonEmptyKeysFromComponents:", a3), a3, a4);
  if (!v7)
    return -[_NSPersonNameComponentsStyleFormatter stringFromComponents:attributesByRange:](-[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]([_NSPersonNameComponentsStyleFormatterMedium alloc], "initWithMasterFormatter:", -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter")), "stringFromComponents:attributesByRange:", a3, a4);
  v8 = v7;
  if (!objc_msgSend(v7, "length"))
    return -[_NSPersonNameComponentsStyleFormatter stringFromComponents:attributesByRange:](-[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]([_NSPersonNameComponentsStyleFormatterMedium alloc], "initWithMasterFormatter:", -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter")), "stringFromComponents:attributesByRange:", a3, a4);
  return v8;
}

- (id)keysOfInterest
{
  id result;

  result = self->super.super._keysOfInterest;
  if (!result)
  {
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("familyName"), CFSTR("givenName"), 0);
    self->super.super._keysOfInterest = (NSSet *)result;
  }
  return result;
}

- (id)fallbackStyleFormatter
{
  return -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]([_NSPersonNameComponentsStyleFormatterMedium alloc], "initWithMasterFormatter:", -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
}

@end
