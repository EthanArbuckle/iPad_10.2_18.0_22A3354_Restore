@implementation NTKUtilityComplicationPlatterColor

void __NTKUtilityComplicationPlatterColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.12, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKUtilityComplicationPlatterColor_color;
  NTKUtilityComplicationPlatterColor_color = v0;

}

@end
