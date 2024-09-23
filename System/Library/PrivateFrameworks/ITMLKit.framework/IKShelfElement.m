@implementation IKShelfElement

- (unint64_t)columnCount
{
  void *v2;
  uint64_t v3;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "columnCount");

  return v3 & ~(v3 >> 63);
}

- (BOOL)isCentered
{
  void *v2;
  BOOL v3;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "elementAlignment") == 2;

  return v3;
}

- (NSString)rowHeight
{
  void *v2;
  void *v3;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowHeight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
