@implementation UIImage

void __63__UIImage_AppleAccountUI__circularImageFromCGImage_size_scale___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v6 = *(double *)(a1 + 40);
  v7 = *(double *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", *MEMORY[0x1E0C9D538], v5, v6, v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextAddPath(v3, (CGPathRef)objc_msgSend(v8, "CGPath"));
  CGContextClip(v3);
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v4, v5, v6, v7);

}

uint64_t __76__UIImage_AppleAccountUI__addBackgroundForImage_withBackgroundColor_yShift___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CGContext *v4;
  CGFloat v5;
  CGAffineTransform v7;

  v3 = a2;
  v4 = (CGContext *)objc_msgSend(v3, "CGContext");
  objc_msgSend(*(id *)(a1 + 32), "setFill");
  objc_msgSend(v3, "fillRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

  v5 = *(double *)(a1 + 80);
  v7.b = 0.0;
  v7.c = 0.0;
  v7.a = 1.0;
  *(_OWORD *)&v7.d = xmmword_1DB639160;
  v7.ty = v5;
  CGContextConcatCTM(v4, &v7);
  return objc_msgSend(*(id *)(a1 + 40), "drawInRect:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
}

void __76__UIImage_AppleAccountUI__addBackgroundForImage_withBackgroundColor_yShift___block_invoke_2(uint64_t a1, void *a2)
{
  CGContext *v3;
  id v4;
  const CGPath *v5;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSaveGState(v3);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), 5.0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const CGPath *)objc_msgSend(v4, "CGPath");

  CGContextAddPath(v3, v5);
  CGContextClip(v3);
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  CGContextRestoreGState(v3);
}

@end
