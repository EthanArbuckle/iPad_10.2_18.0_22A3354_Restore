@implementation HMDHAPAccessory(CHIP)

- (BOOL)requiresThreadRouter
{
  void *v2;
  char v3;

  -[HMDHAPAccessory chipAccessoryServer](self, "chipAccessoryServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresThreadRouter");

  return v3;
}

@end
