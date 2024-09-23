@implementation NTKKaleidoscopeSecondHandColor

void ___NTKKaleidoscopeSecondHandColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.898039216, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKKaleidoscopeSecondHandColor___color;
  _NTKKaleidoscopeSecondHandColor___color = v0;

}

@end
