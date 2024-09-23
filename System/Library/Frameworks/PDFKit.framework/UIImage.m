@implementation UIImage

void __57__UIImage_PDFMarkupMenuUtilities__largeColorPotForColor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CGContext *v4;
  void *v5;
  CGRect v6;

  v3 = a2;
  v4 = (CGContext *)objc_msgSend(v3, "CGContext");
  objc_msgSend(*(id *)(a1 + 32), "setFill");
  objc_msgSend(v3, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bounds");
  CGContextAddEllipseInRect(v4, v6);

  CGContextFillPath(v4);
}

uint64_t __65__UIImage_PDFMarkupMenuUtilities___largePotWithSystemImageNamed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CGContext *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  CGRect v18;

  v3 = a2;
  v4 = (CGContext *)objc_msgSend(v3, "CGContext");
  objc_msgSend(v3, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemFillColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFill");

  v18.origin.x = v7;
  v18.origin.y = v9;
  v18.size.width = v11;
  v18.size.height = v13;
  CGContextAddEllipseInRect(v4, v18);
  CGContextFillPath(v4);
  objc_msgSend(*(id *)(a1 + 32), "size");
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", (v11 - v15) * 0.5, (v13 - v16) * 0.5);
}

@end
