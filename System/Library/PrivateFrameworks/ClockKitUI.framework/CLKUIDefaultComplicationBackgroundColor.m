@implementation CLKUIDefaultComplicationBackgroundColor

void __CLKUIDefaultComplicationBackgroundColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CLKUIDefaultComplicationBackgroundColor___backgroundColor;
  CLKUIDefaultComplicationBackgroundColor___backgroundColor = v0;

}

@end
