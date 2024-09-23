@implementation NewRingCapShadowImage

uint64_t __NewRingCapShadowImage_block_invoke(uint64_t a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat Width;
  CGFloat Height;
  CGContext *v15;
  void *v16;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v3 = *(double *)(a1 + 64);
  v4 = *(double *)(a1 + 72) * 0.5;
  v5 = *(double *)(a1 + 40);
  v6 = *(double *)(a1 + 48);
  v7 = *(double *)(a1 + 56);
  v8 = a2;
  v18.origin.x = v5;
  v18.origin.y = v6;
  v18.size.width = v7;
  v18.size.height = v3;
  v19 = CGRectInset(v18, v4, v4);
  CoordinatesOfPointAtArcFraction(v19.origin.x, v19.origin.y, v19.size.width, v19.size.height, 0.75);
  UIPointRoundToScale();
  v10 = *(double *)(a1 + 88) * 0.5 - v9;
  v12 = *(double *)(a1 + 96) * 0.5 - v11;
  Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
  Height = CGRectGetHeight(*(CGRect *)(a1 + 40));
  v15 = (CGContext *)objc_msgSend(v8, "CGContext");

  v20.origin.x = v10;
  v20.origin.y = v12;
  v20.size.width = Width;
  v20.size.height = Height;
  CGContextClipToMask(v15, v20, *(CGImageRef *)(a1 + 104));
  CGImageRelease(*(CGImageRef *)(a1 + 104));
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.560784314, 0.560784314, 0.560784314, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "set");

  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

@end
