@implementation UIDevice(CAMLayoutStyle)

- (uint64_t)cam_initialLayoutStyle
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v7 = CAMInitialLayoutStyle(objc_msgSend(a1, "userInterfaceIdiom"), v3, v4, v5, v6);

  return v7;
}

@end
