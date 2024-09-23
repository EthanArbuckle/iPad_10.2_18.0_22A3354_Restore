@implementation CAAnimation(LPExtras)

- (id)_lp_copyWithBeginTime:()LPExtras
{
  void *v3;

  v3 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(v3, "setBeginTime:", a2);
  return v3;
}

@end
