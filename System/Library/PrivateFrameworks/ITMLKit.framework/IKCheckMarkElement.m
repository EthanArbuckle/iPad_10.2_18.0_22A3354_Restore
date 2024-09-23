@implementation IKCheckMarkElement

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (unint64_t)alignment
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IKViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("alignment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("left")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("right"));

  return v4;
}

@end
