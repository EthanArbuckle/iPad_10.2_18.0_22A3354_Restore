@implementation NTKStandAdjustmentButtonBackgroundColor

void __NTKStandAdjustmentButtonBackgroundColor_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CF51B0], "sedentaryColors");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adjustmentButtonBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKStandAdjustmentButtonBackgroundColor___color;
  NTKStandAdjustmentButtonBackgroundColor___color = v0;

}

@end
