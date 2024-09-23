@implementation NTKSwatchTwoColorImage

void __NTKSwatchTwoColorImage_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGContext *v13;
  void *v14;
  id v15;
  CGRect v16;

  v3 = a2;
  objc_msgSend(v3, "format");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "setFill");
  v13 = (CGContext *)objc_msgSend(v3, "CGContext");

  v16.origin.x = v6;
  v16.origin.y = v8;
  v16.size.width = v10;
  v16.size.height = v12;
  CGContextFillEllipseInRect(v13, v16);
  if (*(_QWORD *)(a1 + 40))
  {
    v14 = (void *)MEMORY[0x1E0DC3508];
    MEMORY[0x1BCCA72B8](v6, v8, v10, v12);
    objc_msgSend(v14, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "closePath");
    objc_msgSend(*(id *)(a1 + 40), "setFill");
    objc_msgSend(v15, "fill");

  }
}

@end
