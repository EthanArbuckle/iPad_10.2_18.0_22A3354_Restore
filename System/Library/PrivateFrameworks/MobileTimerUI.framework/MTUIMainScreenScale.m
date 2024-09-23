@implementation MTUIMainScreenScale

void __MTUIMainScreenScale_block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  MTUIMainScreenScale_screenScale = v0;

}

@end
