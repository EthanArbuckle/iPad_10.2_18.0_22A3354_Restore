@implementation IKBadgeElement

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (NSString)textContent
{
  void *v2;
  void *v3;

  -[IKViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("content"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
