@implementation LabelFont

void ___LabelFont_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 15.0, *MEMORY[0x24BEBB600]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_LabelFont_font;
  _LabelFont_font = v0;

}

@end
