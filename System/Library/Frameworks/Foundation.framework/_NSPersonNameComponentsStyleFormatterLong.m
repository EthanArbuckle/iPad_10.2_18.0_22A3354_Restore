@implementation _NSPersonNameComponentsStyleFormatterLong

- (id)keysOfInterest
{
  id result;

  result = self->super._keysOfInterest;
  if (!result)
  {
    result = +[NSPersonNameComponents _allComponents](NSPersonNameComponents, "_allComponents");
    self->super._keysOfInterest = (NSSet *)result;
  }
  return result;
}

- (id)fallbackStyleFormatter
{
  return -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]([_NSPersonNameComponentsStyleFormatterNicknameVariant alloc], "initWithMasterFormatter:", -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
}

@end
