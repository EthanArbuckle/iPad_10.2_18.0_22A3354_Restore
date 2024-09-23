@implementation NTKCScreenStyle

void __NTKCScreenStyle_block_invoke()
{
  void *v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentMode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "size");
  v3 = v2;
  v5 = v4;

  if (v3 >= v5)
    v6 = v5;
  else
    v6 = v3;
  v7 = -1;
  if (v6 >= 750.0)
    v7 = 1;
  if (v6 == 750.0)
    v7 = 0;
  NTKCScreenStyle_style = v7;
}

@end
