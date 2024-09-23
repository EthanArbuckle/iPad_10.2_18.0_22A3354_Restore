@implementation CPImageRegion

- (BOOL)isImageRegion
{
  return 1;
}

- (void)accept:(id)a3
{
  objc_msgSend(a3, "visitImageRegion:", self);
}

@end
