@implementation SFTintImage

void __SFTintImage_block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;

  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 40), "set");
  UIRectFillUsingBlendMode(*(CGRect *)(a1 + 48), kCGBlendModeSourceIn);
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "userInterfaceStyle") == 2;

    objc_msgSend(*(id *)(a1 + 32), "drawInRect:blendMode:alpha:", 15, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), dbl_18BAD4DF0[v3]);
  }
}

@end
