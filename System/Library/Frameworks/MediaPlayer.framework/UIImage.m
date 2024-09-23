@implementation UIImage

uint64_t __56__UIImage_MPUtilities__imageWithRoundedCornersOfRadius___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(*(id *)(a1 + 32), "size");
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v2, v3, v4, v6, *(double *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addClip");

  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v2, v3, v5, v7);
}

void __40__UIImage_MPUtilities__imageWithShadow___block_invoke(uint64_t a1, CGContext *a2)
{
  void *v4;
  void *v5;
  char v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGColor *v13;
  CGImage *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGImage *v23;
  CGAffineTransform v24;
  CGSize v25;
  CGRect v26;

  objc_msgSend(*(id *)(a1 + 32), "shadowColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      v7 = *(double *)(a1 + 56);
      v8 = *(double *)(a1 + 48) * v7;
      CGAffineTransformMakeScale(&v24, v7, v7);
      v9 = *(double *)(a1 + 64);
      v10 = *(double *)(a1 + 72);
      v11 = v10 * v24.c + v24.a * v9;
      v12 = v10 * v24.d + v24.b * v9;
      v13 = (CGColor *)objc_msgSend(objc_retainAutorelease(v4), "CGColor");
      v25.width = v11;
      v25.height = v12;
      CGContextSetShadowWithColor(a2, v25, v8, v13);
    }
  }
  v14 = (CGImage *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGImage");
  CGImageGetWidth(v14);
  CGImageGetHeight(v14);
  UIRectCenteredIntegralRect();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = (CGImage *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGImage");
  v26.origin.x = v16;
  v26.origin.y = v18;
  v26.size.width = v20;
  v26.size.height = v22;
  CGContextDrawImage(a2, v26, v23);

}

void __60__UIImage_MPUtilities__imageWithEtchedBorderOfColor_radius___block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGImage *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGImage *Image;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v12 = (CGImage *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGImage");
  CGImageGetWidth(v12);
  CGImageGetHeight(v12);
  UIRectCenteredIntegralRect();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  CGContextSaveGState(a2);
  v22.origin.x = a3;
  v22.origin.y = a4;
  v22.size.width = a5;
  v22.size.height = a6;
  CGContextDrawImage(a2, v22, v12);
  v23.origin.x = v14;
  v23.origin.y = v16;
  v23.size.width = v18;
  v23.size.height = v20;
  CGContextClipToMask(a2, v23, v12);
  v24.origin.x = a3;
  v24.origin.y = a4;
  v24.size.width = a5;
  v24.size.height = a6;
  CGContextClearRect(a2, v24);
  CGContextRestoreGState(a2);
  Image = CGBitmapContextCreateImage(a2);
  v25.origin.x = a3;
  v25.origin.y = a4;
  v25.size.width = a5;
  v25.size.height = a6;
  CGContextClearRect(a2, v25);
  v26.origin.x = v14;
  v26.origin.y = v16;
  v26.size.width = v18;
  v26.size.height = v20;
  CGContextDrawImage(a2, v26, v12);
  v27.origin.x = a3;
  v27.origin.y = a4;
  v27.size.width = a5;
  v27.size.height = a6;
  CGContextClipToMask(a2, v27, Image);
  CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGColor"));
  v28.origin.x = a3;
  v28.origin.y = a4;
  v28.size.width = a5;
  v28.size.height = a6;
  CGContextFillRect(a2, v28);
  CGImageRelease(Image);
}

uint64_t __56__UIImage_MPUtilities__initWithContentsOfExactFilePath___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D51270], "deviceSupportsASTC");
  initWithContentsOfExactFilePath__deviceSupportsASTC = result;
  return result;
}

@end
