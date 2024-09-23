@implementation CKResizableBalloonMaskWithMinHeight

void __CKResizableBalloonMaskWithMinHeight_block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");

  UIRectFillUsingBlendMode(*(CGRect *)(a1 + 40), kCGBlendModeSourceIn);
}

@end
