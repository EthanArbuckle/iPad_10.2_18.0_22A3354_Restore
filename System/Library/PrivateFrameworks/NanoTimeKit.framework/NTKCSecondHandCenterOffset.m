@implementation NTKCSecondHandCenterOffset

void __NTKCSecondHandCenterOffset_block_invoke()
{
  double v0;
  BOOL v1;
  double v2;
  double v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v1 = v0 <= 2.0;
  v2 = 1.33333333;
  if (v1)
    v2 = 1.5;
  v3 = 7.33333333;
  if (v1)
    v3 = 7.5;
  NTKCSecondHandCenterOffset_offset_0 = *(_QWORD *)&v2;
  NTKCSecondHandCenterOffset_offset_1 = *(_QWORD *)&v3;

}

@end
