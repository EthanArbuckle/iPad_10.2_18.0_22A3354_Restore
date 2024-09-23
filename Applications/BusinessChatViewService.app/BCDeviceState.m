@implementation BCDeviceState

- (BOOL)isLocked
{
  int v2;

  v2 = sub_10000825C();
  if (v2 != 1)
    LOBYTE(v2) = sub_10000825C() == 2;
  return v2;
}

@end
