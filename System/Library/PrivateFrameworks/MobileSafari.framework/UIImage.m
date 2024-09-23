@implementation UIImage

uint64_t __92__UIImage_MobileSafariFrameworkExtras__sf_registerFaviconForDarkUserInterfaceStyleWithSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48), 3.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fill");

  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

void __104__UIImage_MobileSafariFrameworkExtras__sf_chicletStyleImageWithImage_backgroundColor_size_cornerRadius___block_invoke(uint64_t a1)
{
  CGContext *CurrentContext;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "setFill");
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addClip");
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextFillRect(CurrentContext, *(CGRect *)(a1 + 48));
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithTintColor:renderingMode:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "size");
  v8 = _SFCGRectOfSizeAlignedWithinRect(0, 0, v6, v7, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
  objc_msgSend(v5, "drawInRect:", _SFRoundRectToPixels(v8));

}

@end
