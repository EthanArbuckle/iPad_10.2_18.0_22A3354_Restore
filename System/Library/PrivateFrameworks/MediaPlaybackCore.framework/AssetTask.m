@implementation AssetTask

- (BOOL)isCancelled
{
  char v2;
  char v3;

  swift_retain();
  sub_210D34560();
  v3 = v2;
  swift_release();
  return v3 & 1;
}

@end
