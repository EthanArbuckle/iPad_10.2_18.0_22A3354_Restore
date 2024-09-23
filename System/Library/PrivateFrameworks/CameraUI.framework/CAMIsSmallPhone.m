@implementation CAMIsSmallPhone

void __CAMIsSmallPhone_block_invoke()
{
  double v0;
  BOOL v1;
  double v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  v1 = v0 == 568.0;
  if (v2 != 320.0)
    v1 = 0;
  CAMIsSmallPhone_isSmallPhone = v1;

}

@end
