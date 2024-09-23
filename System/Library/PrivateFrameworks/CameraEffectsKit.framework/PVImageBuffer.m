@implementation PVImageBuffer

void __75__PVImageBuffer_JTAdditions__copyOfUIImageFromRectInPixels_atSizeInPixels___block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  copyOfUIImageFromRectInPixels_atSizeInPixels__screenScale = v0;

}

void __75__PVImageBuffer_JTAdditions__copyOfUIImageFromRectInPixels_atSizeInPixels___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  CGContext *v4;
  void *v5;
  CGFloat Height;
  CGContext *v7;
  CGRect v8;
  CGRect v9;

  v3 = a2;
  v4 = (CGContext *)objc_msgSend(v3, "CGContext");
  objc_msgSend(v3, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  Height = CGRectGetHeight(v8);
  CGContextTranslateCTM(v4, 0.0, Height);

  CGContextScaleCTM((CGContextRef)objc_msgSend(v3, "CGContext"), 1.0, -1.0);
  v7 = (CGContext *)objc_msgSend(v3, "CGContext");

  v9.size.width = *(CGFloat *)(a1 + 32);
  v9.size.height = *(CGFloat *)(a1 + 40);
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  CGContextDrawImage(v7, v9, *(CGImageRef *)(a1 + 48));
}

@end
