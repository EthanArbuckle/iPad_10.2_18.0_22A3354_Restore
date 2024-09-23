@implementation BMScreenSharing_v1

- (int)type
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMScreenSharing_v1;
  v2 = -[BMScreenSharing type](&v4, sel_type);
  if (v2)
    return 2 * (v2 == 1);
  else
    return 1;
}

@end
