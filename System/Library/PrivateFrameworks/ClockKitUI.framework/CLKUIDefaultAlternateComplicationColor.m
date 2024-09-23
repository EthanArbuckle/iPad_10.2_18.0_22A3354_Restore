@implementation CLKUIDefaultAlternateComplicationColor

void __CLKUIDefaultAlternateComplicationColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.9, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CLKUIDefaultAlternateComplicationColor___color;
  CLKUIDefaultAlternateComplicationColor___color = v0;

}

@end
