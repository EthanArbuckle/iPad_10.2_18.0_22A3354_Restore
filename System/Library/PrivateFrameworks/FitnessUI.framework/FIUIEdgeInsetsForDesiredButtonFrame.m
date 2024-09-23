@implementation FIUIEdgeInsetsForDesiredButtonFrame

void __FIUIEdgeInsetsForDesiredButtonFrame_block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  FIUIEdgeInsetsForDesiredButtonFrame_screenScale = v0;

}

@end
