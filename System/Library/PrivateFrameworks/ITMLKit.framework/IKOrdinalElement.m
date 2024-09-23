@implementation IKOrdinalElement

- (unint64_t)maxLength
{
  void *v2;
  unint64_t v3;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ordinalMaxLength");

  return v3;
}

@end
