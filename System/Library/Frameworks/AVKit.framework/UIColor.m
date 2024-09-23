@implementation UIColor

id __58__UIColor_AVAdditions__avkit_traitCollectionControlsColor__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 1)
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __51__UIColor_AVAdditions__AV_indicatorForegroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AV_indicatorForegroundColor__indicatorForegroundColor;
  AV_indicatorForegroundColor__indicatorForegroundColor = v0;

}

void __51__UIColor_AVAdditions__AV_indicatorBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AV_indicatorBackgroundColor__indicatorBackgroundColor;
  AV_indicatorBackgroundColor__indicatorBackgroundColor = v0;

}

@end
