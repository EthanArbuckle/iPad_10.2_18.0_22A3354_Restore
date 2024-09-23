@implementation UIView(MPUAdditions)

- (uint64_t)MPU_applyBoundsAndCenterForUntransformedFrame:()MPUAdditions
{
  double MidX;
  CGRect v12;
  CGRect v13;

  objc_msgSend(a1, "setBounds:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8));
  v12.origin.x = a2;
  v12.origin.y = a3;
  v12.size.width = a4;
  v12.size.height = a5;
  MidX = CGRectGetMidX(v12);
  v13.origin.x = a2;
  v13.origin.y = a3;
  v13.size.width = a4;
  v13.size.height = a5;
  return objc_msgSend(a1, "setCenter:", MidX, CGRectGetMidY(v13));
}

@end
