@implementation CPShapeRegion

- (BOOL)isShapeRegion
{
  return 1;
}

- (void)accept:(id)a3
{
  objc_msgSend(a3, "visitShapeRegion:", self);
}

@end
