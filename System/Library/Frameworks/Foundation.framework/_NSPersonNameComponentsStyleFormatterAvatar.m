@implementation _NSPersonNameComponentsStyleFormatterAvatar

- (id)fallbackStyleFormatter
{
  int64_t v3;
  __objc2_class **v4;

  v3 = -[_NSPersonNameComponentsStyleFormatter ordering](self, "ordering");
  v4 = off_1E0F11530;
  if (v3 != 1)
    v4 = off_1E0F11540;
  return (id)objc_msgSend(objc_alloc(*v4), "initWithMasterFormatter:", -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
}

- (BOOL)shouldFallBack
{
  return 1;
}

@end
