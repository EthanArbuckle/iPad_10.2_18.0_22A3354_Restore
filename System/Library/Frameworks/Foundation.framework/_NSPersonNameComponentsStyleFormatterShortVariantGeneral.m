@implementation _NSPersonNameComponentsStyleFormatterShortVariantGeneral

- (id)fallbackStyleFormatter
{
  return -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]([_NSPersonNameComponentsStyleFormatterShortNameSimpleFallback alloc], "initWithMasterFormatter:", -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
}

- (int64_t)shortNameFormat
{
  return 0;
}

@end
