@implementation FaceSize

void __FaceSize_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "screenBounds");
  objc_msgSend(v2, "screenBounds");

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  v5 = v4;

  FaceSize__FaceSize_0 = v5;
  FaceSize__FaceSize_1 = 0x4060400000000000;
}

@end
