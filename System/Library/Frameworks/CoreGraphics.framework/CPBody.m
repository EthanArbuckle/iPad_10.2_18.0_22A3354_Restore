@implementation CPBody

- (BOOL)isBodyZone
{
  return 1;
}

- (void)accept:(id)a3
{
  objc_msgSend(a3, "visitBody:", self);
}

@end
