@implementation IKProgressIndicatorElement

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (NSString)type
{
  void *v2;
  void *v3;

  -[IKViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)percentage
{
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;

  -[IKViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("percentage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "integerValue");
    if (v4 >= 0x64)
      v5 = 100;
    else
      v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
