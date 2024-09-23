@implementation GKCircleImageBrush

- (id)renderedImageIdentifier
{
  CGSize v3;

  -[GKCircleImageBrush sizeOverride](self, "sizeOverride");
  return NSStringFromCGSize(v3);
}

- (CGSize)sizeForInput:(id)a3
{
  double v3;
  double v4;
  void *v6;
  uint64_t v7;
  BOOL v8;
  CGSize result;

  -[GKCircleImageBrush sizeOverride](self, "sizeOverride", a3);
  if (v3 == *MEMORY[0x24BDBF148] && v4 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 != 1
      || ((v3 = 57.0, *MEMORY[0x24BE3A2C0]) ? (v8 = _GKIsRemoteUIUsingPadIdiom == 0) : (v8 = 0), v4 = 57.0, v8))
    {
      v3 = 42.0;
      v4 = 42.0;
    }
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)scaleForInput:(id)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  return v5;
}

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  objc_class *v22;
  const char *Name;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGContext *v32;
  _QWORD v33[4];
  _QWORD v34[4];
  _QWORD block[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  if (!a4)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Assertion failed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKThemeBrush.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ (context != ((void *)0))\n[%s (%s:%d)]"), v12, "-[GKCircleImageBrush drawInRect:withContext:input:]", objc_msgSend(v14, "UTF8String"), 499);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
  }
  v16 = v10;
  CGContextSaveGState(a4);
  CGContextTranslateCTM(a4, 0.0, height);
  CGContextScaleCTM(a4, 1.0, -1.0);
  CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  v19 = v18;

  v20 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__GKCircleImageBrush_drawInRect_withContext_input___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v19;
  if (drawInRect_withContext_input__onceToken != -1)
    dispatch_once(&drawInRect_withContext_input__onceToken, block);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v24[0] = v20;
  v24[1] = 3221225472;
  v24[2] = __51__GKCircleImageBrush_drawInRect_withContext_input___block_invoke_3;
  v24[3] = &unk_24DC27510;
  v26 = v33;
  v27 = v34;
  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  v32 = a4;
  v21 = v16;
  v25 = v21;
  objc_msgSend(v21, "_gkReadAtSize:ARGBHostEndianBytes:", v24, 350.0, 350.0);
  CGContextRestoreGState(a4);
  if (annotateOnceToken != -1)
    dispatch_once(&annotateOnceToken, &__block_literal_global_189);
  if (shouldAnnotateImageUsage)
  {
    v22 = (objc_class *)objc_opt_class();
    Name = class_getName(v22);
    _annotateDrawInRectWithContextAndInput((uint64_t)Name, a4, v21, x, y, width, height);
  }

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v34, 8);

}

id __51__GKCircleImageBrush_drawInRect_withContext_input___block_invoke(uint64_t a1)
{
  double v1;
  _QWORD v3[4];
  int64x2_t v4;

  v1 = *(double *)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__GKCircleImageBrush_drawInRect_withContext_input___block_invoke_2;
  v3[3] = &__block_descriptor_48_e24_v16__0__GKImageContext_8l;
  v4 = vdupq_n_s64(0x4075E00000000000uLL);
  return +[GKImageContext imageDrawnWithSize:scale:options:usingBlock:](GKImageContext, "imageDrawnWithSize:scale:options:usingBlock:", 0, v3, 350.0, 350.0, v1);
}

void __51__GKCircleImageBrush_drawInRect_withContext_input___block_invoke_2(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  CGContext *v8;
  id v9;
  id v10;
  CGRect v11;

  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v4 = *(double *)(a1 + 32);
  v5 = *(double *)(a1 + 40);
  v6 = (void *)MEMORY[0x24BDF6870];
  v7 = a2;
  objc_msgSend(v6, "bezierPathWithOvalInRect:", v2, v3, v4, v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (CGContext *)objc_msgSend(v7, "CGContext");

  v11.origin.x = v2;
  v11.origin.y = v3;
  v11.size.width = v4;
  v11.size.height = v5;
  CGContextClearRect(v8, v11);
  UIGraphicsPushContext(v8);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.2);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(v8, (CGColorRef)objc_msgSend(v9, "CGColor"));

  objc_msgSend(v10, "setLineWidth:", 1.0);
  objc_msgSend(v10, "stroke");
  UIGraphicsPopContext();
  CFRetain(v8);
  drawInRect_withContext_input__sTemplateContext = (uint64_t)v8;
  drawInRect_withContext_input__sTemplatePix = (uint64_t)CGBitmapContextGetData(v8);

}

void __51__GKCircleImageBrush_drawInRect_withContext_input___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned int v10;
  BOOL v11;
  void *v12;
  CGContext *v13;
  CGContext *v14;
  id v15;
  id v16;

  if (a5 > 0.0)
  {
    v6 = 0;
    v7 = drawInRect_withContext_input__sTemplatePix;
    v8 = a3 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      if (a4 > 0.0)
      {
        v9 = 0;
        do
        {
          if (*(_DWORD *)(v7 + 4 * v9))
          {
            v10 = *(_DWORD *)(a2 + 4 * v9);
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
            if (!(v10 >> 28)
              || (v10 >= 0xF5u ? (v11 = (v10 & 0xFF00) >= 0xF401) : (v11 = 0),
                  v11 && (v10 & 0xFF0000) > 0xF40000))
            {
              ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
            }
          }
          ++v9;
        }
        while (a4 > (double)(int)v9);
      }
      ++v6;
      a2 += v8;
      v7 += v8;
    }
    while (a5 > (double)(int)v6);
  }
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(CGContext **)(a1 + 88);
  v16 = objc_retainAutorelease(v12);
  CGContextAddPath(v13, (CGPathRef)objc_msgSend(v16, "CGPath"));
  CGContextClip(*(CGContextRef *)(a1 + 88));
  CGContextDrawImage(*(CGContextRef *)(a1 + 88), *(CGRect *)(a1 + 56), (CGImageRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGImage"));
  if ((double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
     / (double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > 0.2)
  {
    v14 = *(CGContext **)(a1 + 88);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(v14, (CGColorRef)objc_msgSend(v15, "CGColor"));

    UIGraphicsPushContext(*(CGContextRef *)(a1 + 88));
    objc_msgSend(v16, "setLineWidth:", 1.0);
    objc_msgSend(v16, "stroke");
    UIGraphicsPopContext();
  }

}

void __51__GKCircleImageBrush_drawInRect_withContext_input___block_invoke_4()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE3A260], "shared");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  shouldAnnotateImageUsage = objc_msgSend(v0, "shouldAnnotateImageUsage");

}

- (CGSize)sizeOverride
{
  double width;
  double height;
  CGSize result;

  width = self->_sizeOverride.width;
  height = self->_sizeOverride.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSizeOverride:(CGSize)a3
{
  self->_sizeOverride = a3;
}

@end
