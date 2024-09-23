@implementation PDFAnnotationDrawing

+ (double)textInset
{
  return 3.0;
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withAnnotation:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  CGAffineTransform v16[2];
  CGRect v17;

  v8 = a5;
  objc_msgSend(v8, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "akAnnotationAdaptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "akAnnotation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1, "drawWithBox:inContext:withAKAnnotation:forAnnotation:", a3, a4, v11, v8);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("/Circle")))
  {
    objc_msgSend(a1, "drawWithBox:inContext:withCircleAnnotation:", a3, a4, v8);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("/FreeText")))
  {
    objc_msgSend(a1, "drawWithBox:inContext:withFreeTextAnnotation:", a3, a4, v8);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("/Ink")))
  {
    objc_msgSend(a1, "drawWithBox:inContext:withInkAnnotation:", a3, a4, v8);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("/Line")))
  {
    objc_msgSend(a1, "drawWithBox:inContext:withLineAnnotation:", a3, a4, v8);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("/Link")))
  {
    objc_msgSend(a1, "drawWithBox:inContext:withLinkAnnotation:", a3, a4, v8);
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("/Highlight")) & 1) != 0
         || (objc_msgSend(v9, "isEqualToString:", CFSTR("/StrikeOut")) & 1) != 0
         || objc_msgSend(v9, "isEqualToString:", CFSTR("/Underline")))
  {
    objc_msgSend(a1, "drawWithBox:inContext:withMarkupAnnotation:", a3, a4, v8);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("/Popup")))
  {
    objc_msgSend(a1, "drawWithBox:inContext:withPopupAnnotation:", a3, a4, v8);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("/Square")))
  {
    objc_msgSend(a1, "drawWithBox:inContext:withSquareAnnotation:", a3, a4, v8);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("/Stamp")))
  {
    objc_msgSend(a1, "drawWithBox:inContext:withStampAnnotation:", a3, a4, v8);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("/Text")))
  {
    objc_msgSend(a1, "drawWithBox:inContext:withTextAnnotation:", a3, a4, v8);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("/Redact")))
  {
    objc_msgSend(a1, "drawWithBox:inContext:withRedactAnnotation:", a3, a4, v8);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("/Widget")))
  {
    objc_msgSend(v8, "valueForAnnotationKey:", CFSTR("/FT"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("/Btn")))
    {
      objc_msgSend(a1, "drawWithBox:inContext:withButtonWidgetAnnotation:", a3, a4, v8);
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("/Tx")))
    {
      objc_msgSend(a1, "drawWithBox:inContext:withTextWidgetAnnotation:", a3, a4, v8);
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("/Ch")))
    {
      objc_msgSend(a1, "drawWithBox:inContext:withChoiceWidgetAnnotation:", a3, a4, v8);
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("/Sig")))
    {
      objc_msgSend(a1, "drawWithBox:inContext:withStampAnnotation:", a3, a4, v8);
    }

  }
  else
  {
    objc_msgSend(a1, "drawWithBox:inContext:withUnknownAnnotation:", a3, a4, v8);
  }
  if (GetDefaultsWriteHighlightAnnotations())
  {
    CGContextSaveGState(a4);
    objc_msgSend(v8, "bounds");
    objc_msgSend(v8, "page");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    memset(&v16[1], 0, sizeof(CGAffineTransform));
    if (v12)
      objc_msgSend(v12, "getDrawingTransformForBox:", a3);
    v16[0] = v16[1];
    CGContextConcatCTM(a4, v16);
    CGContextSetRGBStrokeColor(a4, 0.5, 0.0, 0.5, 1.0);
    CGContextSetLineWidth(a4, 1.0);
    v17.origin.x = PDFRectToCGRect(v14);
    CGContextStrokeRect(a4, v17);
    CGContextRestoreGState(a4);

  }
}

+ (void)drawAppearance:(int)a3 ofAnnotation:(id)a4 withBox:(int64_t)a5 inContext:(CGContext *)a6
{
  objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:scaleProportional:", *(_QWORD *)&a3, a4, a5, a6, 1);
}

+ (void)drawAppearance:(int)a3 ofAnnotation:(id)a4 withBox:(int64_t)a5 inContext:(CGContext *)a6 scaleProportional:(BOOL)a7
{
  objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:scaleProportional:suppressTextRendering:", *(_QWORD *)&a3, a4, a5, a6, a7, 0);
}

+ (void)drawAppearance:(int)a3 ofAnnotation:(id)a4 withBox:(int64_t)a5 inContext:(CGContext *)a6 scaleProportional:(BOOL)a7 suppressTextRendering:(BOOL)a8
{
  _BOOL8 v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v8 = a8;
  v11 = *(_QWORD *)&a3;
  v15 = a4;
  v12 = objc_msgSend(v15, "cachedAppearance:", v11);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v15, "bounds");
    objc_msgSend(v15, "drawCachedAppearance:withBox:inContext:inRect:scaleProportional:", v13, a5, a6, 1);
  }
  else
  {
    v14 = objc_msgSend(v15, "appearance:", v11);
    objc_msgSend(v15, "bounds");
    objc_msgSend(v15, "drawAppearance:withBox:inContext:inRect:scaleProportional:suppressTextRendering:", v14, a5, a6, 1, v8);
  }

}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withAKAnnotation:(id)a5 forAnnotation:(id)a6
{
  id v9;
  id v10;
  void *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinX;
  CGFloat MinY;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform transform;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v9 = a5;
  v10 = a6;
  CGContextSaveGState(a4);
  objc_msgSend(v10, "page");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v11, "getDrawingTransformForBox:", a3);
  else
    memset(&transform, 0, sizeof(transform));
  CGContextConcatCTM(a4, &transform);

  objc_msgSend(v9, "integralDrawingBounds");
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  if (!CGRectIsInfinite(v21))
  {
    memset(&v19, 0, sizeof(v19));
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    MinX = CGRectGetMinX(v22);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    MinY = CGRectGetMinY(v23);
    CGAffineTransformMakeTranslation(&v19, MinX, MinY);
    v18 = v19;
    CGContextConcatCTM(a4, &v18);
  }
  objc_msgSend(AKControllerClass(), "renderAnnotation:inContext:", v9, a4);
  CGContextRestoreGState(a4);

}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withCircleAnnotation:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v25;
  CGColorSpace *ColorSpace;
  const CGFloat *Components;
  id v28;
  CGColorSpace *v29;
  const CGFloat *v30;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v31 = a5;
  objc_msgSend(v31, "page");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bounds");
  objc_msgSend(v31, "valueForAnnotationKey:", CFSTR("/Border"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "valueForAnnotationKey:", CFSTR("/C"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "valueForAnnotationKey:", CFSTR("/IC"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = PDFRectToCGRect(v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if (objc_msgSend(v31, "appearance:", 0))
  {
    objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:", 0, v31, a3, CurrentContext);
  }
  else if ((unint64_t)a3 <= 4 && (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0))
  {
    CGContextSaveGState(CurrentContext);
    objc_msgSend(v8, "transformContext:forBox:", CurrentContext, a3);
    v19 = 1.0;
    if (v9)
    {
      objc_msgSend(v9, "lineWidth");
      if (v20 != 0.0)
        v19 = v20;
    }
    CGContextSetLineWidth(CurrentContext, v19);
    if (objc_msgSend(v9, "style") == 1)
      CGContextSetLineDash(CurrentContext, 0.0, (const CGFloat *)objc_msgSend(v9, "dashPatternRaw"), objc_msgSend(v9, "dashCountRaw"));
    v32.origin.x = v12;
    v32.origin.y = v14;
    v32.size.width = v16;
    v32.size.height = v18;
    v33 = CGRectInset(v32, v19 * 0.5, v19 * 0.5);
    x = v33.origin.x;
    y = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;
    if (v11)
    {
      v25 = objc_retainAutorelease(v11);
      ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v25, "CGColor"));
      Components = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(v25), "CGColor"));
      CGContextSetFillColorSpace(CurrentContext, ColorSpace);
      CGContextSetFillColor(CurrentContext, Components);
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = width;
      v34.size.height = height;
      CGContextFillEllipseInRect(CurrentContext, v34);
    }
    v28 = objc_retainAutorelease(v10);
    v29 = CGColorGetColorSpace((CGColorRef)objc_msgSend(v28, "CGColor"));
    v30 = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(v28), "CGColor"));
    CGContextSetStrokeColorSpace(CurrentContext, v29);
    CGContextSetStrokeColor(CurrentContext, v30);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    CGContextStrokeEllipseInRect(CurrentContext, v35);
    CGContextRestoreGState(CurrentContext);
  }

}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withFreeTextAnnotation:(id)a5
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  CGRect v26;
  CGRect v27;

  v25 = a5;
  objc_msgSend(v25, "page");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v25, "valueForAnnotationKey:", CFSTR("/C"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "valueForAnnotationKey:", CFSTR("/Contents"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "valueForAnnotationKey:", CFSTR("/Border"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "font");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fontColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v25, "alignment");
  v22 = objc_msgSend(v8, "rotation");
  if (objc_msgSend(v25, "appearance:", 0))
  {
    objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:", 0, v25, a3, CurrentContext);
  }
  else if ((unint64_t)a3 <= 4 && (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0))
  {
    CGContextSaveGState(CurrentContext);
    objc_msgSend(v8, "transformContext:forBox:", CurrentContext, a3);
    +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v24, CurrentContext, v10, v12, v14, v16);
    v26.origin.x = v10;
    v26.origin.y = v12;
    v26.size.width = v14;
    v26.size.height = v16;
    v27 = PDFRectInset(v26, 2.0, 2.0);
    +[PDFAnnotationDrawing renderString:forRect:font:color:alignment:rotation:breaks:context:withAnnotation:](PDFAnnotationDrawing, "renderString:forRect:font:color:alignment:rotation:breaks:context:withAnnotation:", v17, v19, v20, v21, v22, 1, v27.origin.x, v27.origin.y, v27.size.width, v27.size.height, CurrentContext, v25);
    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v23, "CGColor"));

      objc_msgSend(v18, "drawInRect:inContext:", CurrentContext, v10, v12, v14, v16);
    }
    CGContextRestoreGState(CurrentContext);
  }

}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withInkAnnotation:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const CGPath **v13;
  int v14;
  uint64_t v15;
  CGFloat v16;
  CGFloat v17;
  id v18;
  CGColorSpace *ColorSpace;
  const CGFloat *Components;
  double v21;
  double v22;
  const CGPath *v23;
  CGAffineTransform v24;

  v8 = a5;
  objc_msgSend(v8, "page");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForAnnotationKey:", CFSTR("/C"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForAnnotationKey:", CFSTR("/Border"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "appearance:", 0))
  {
    objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:", 0, v8, a3, CurrentContext);
  }
  else
  {
    objc_msgSend(v8, "valueForAnnotationKey:", CFSTR("/InkList"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (const CGPath **)objc_msgSend(v8, "cgPathArray");
      if (v13
        || (v13 = (const CGPath **)objc_msgSend(a1, "createCGPathArrayWithBezierPaths:", v12),
            objc_msgSend(v8, "setCGPathArray:", v13),
            v13))
      {
        v14 = objc_msgSend(v12, "count");
        if ((unint64_t)a3 <= 4)
        {
          LODWORD(v15) = v14;
          if (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0)
          {
            CGContextSaveGState(CurrentContext);
            objc_msgSend(v9, "transformContext:forBox:", CurrentContext, a3);
            objc_msgSend(v8, "bounds");
            CGAffineTransformMakeTranslation(&v24, v16, v17);
            CGContextConcatCTM(CurrentContext, &v24);
            if (v10)
            {
              v18 = objc_retainAutorelease(v10);
              ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v18, "CGColor"));
              Components = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(v18), "CGColor"));
              CGContextSetStrokeColorSpace(CurrentContext, ColorSpace);
              CGContextSetStrokeColor(CurrentContext, Components);
            }
            if (v11)
            {
              objc_msgSend(v11, "lineWidth");
              if (v21 == 0.0)
                v22 = 1.0;
              else
                v22 = v21;
              if (objc_msgSend(v11, "style") == 1)
                CGContextSetLineDash(CurrentContext, 0.0, (const CGFloat *)objc_msgSend(v11, "dashPatternRaw"), objc_msgSend(v11, "dashCountRaw"));
              else
                CGContextSetLineCap(CurrentContext, kCGLineCapRound);
            }
            else
            {
              v22 = 1.0;
            }
            CGContextSetLineWidth(CurrentContext, v22);
            CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
            v15 = v15;
            if ((_DWORD)v15)
            {
              do
              {
                CGContextSaveGState(CurrentContext);
                v23 = *v13++;
                CGContextAddPath(CurrentContext, v23);
                CGContextStrokePath(CurrentContext);
                CGContextRestoreGState(CurrentContext);
                --v15;
              }
              while (v15);
            }
            CGContextRestoreGState(CurrentContext);
          }
        }
      }
    }

  }
}

+ (CGPath)createCGPathArrayWithBezierPaths:(id)a3
{
  id v3;
  int64_t v4;
  int64_t v5;
  CGPath **v6;
  uint64_t i;
  id v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 < 1)
  {
    v6 = 0;
  }
  else
  {
    v5 = v4;
    v6 = (CGPath **)malloc_type_calloc(v4, 8uLL, 0x2004093837F09uLL);
    if (v6)
    {
      for (i = 0; i != v5; ++i)
      {
        objc_msgSend(v3, "objectAtIndex:", i);
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v6[i] = CGPathCreateMutableCopy((CGPathRef)objc_msgSend(v8, "CGPath"));

      }
    }
  }

  return v6;
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withLineAnnotation:(id)a5
{
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  uint64_t v25;
  uint64_t v26;
  CGFloat v27;
  double v28;
  id v29;
  CGColorSpace *ColorSpace;
  const CGFloat *Components;
  uint64_t v32;
  id v33;
  double v34;
  double v35;
  uint64_t v36;
  id v37;
  double v38;
  double v39;
  uint64_t v40;
  BOOL v41;
  CGPathDrawingMode v42;
  id v43;
  CGColorSpace *v44;
  const CGFloat *v45;
  uint64_t v46;
  void *v47;
  CGAffineTransform transform;

  v8 = a5;
  objc_msgSend(v8, "page");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v8, "valueForAnnotationKey:", CFSTR("/C"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForAnnotationKey:", CFSTR("/IC"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForAnnotationKey:", CFSTR("/Border"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForAnnotationKey:", CFSTR("/L"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v8, "startPoint");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v8, "endPoint");
    v22 = v21;
    v24 = v23;
    v25 = objc_msgSend(v8, "startLineStyle");
    v26 = objc_msgSend(v8, "endLineStyle");
    if (objc_msgSend(v8, "appearance:", 0))
    {
      objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:", 0, v8, a3, CurrentContext);
    }
    else if ((unint64_t)a3 <= 4 && (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0))
    {
      CGContextSaveGState(CurrentContext);
      objc_msgSend(v47, "transformContext:forBox:", CurrentContext, a3);
      CGAffineTransformMakeTranslation(&transform, v10, v12);
      CGContextConcatCTM(CurrentContext, &transform);
      v27 = 1.0;
      if (v15)
      {
        objc_msgSend(v15, "lineWidth");
        if (v28 != 0.0)
          v27 = v28;
      }
      v46 = v25;
      CGContextSetLineWidth(CurrentContext, v27);
      if (objc_msgSend(v15, "style") == 1)
        CGContextSetLineDash(CurrentContext, 0.0, (const CGFloat *)objc_msgSend(v15, "dashPatternRaw"), objc_msgSend(v15, "dashCountRaw"));
      CGContextMoveToPoint(CurrentContext, v18, v20);
      CGContextAddLineToPoint(CurrentContext, v22, v24);
      v29 = objc_retainAutorelease(v13);
      ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v29, "CGColor"));
      Components = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(v29), "CGColor"));
      CGContextSetStrokeColorSpace(CurrentContext, ColorSpace);
      CGContextSetStrokeColor(CurrentContext, Components);
      v32 = v46;
      if (v46 == 4)
        objc_msgSend(a1, "drawArrowFrom:to:open:inContext:withBorder:", 1, CurrentContext, v15, v22, v24, v18, v20);
      if (v26 == 4)
        objc_msgSend(a1, "drawArrowFrom:to:open:inContext:withBorder:", 1, CurrentContext, v15, v18, v20, v22, v24);
      CGContextDrawPath(CurrentContext, kCGPathStroke);
      if (((v46 | v26) & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        switch(v46)
        {
          case 1:
            v33 = a1;
            v34 = v18;
            v35 = v20;
            v36 = 0;
            goto LABEL_21;
          case 2:
            v33 = a1;
            v34 = v18;
            v35 = v20;
            v36 = 1;
            goto LABEL_21;
          case 3:
            v33 = a1;
            v34 = v18;
            v35 = v20;
            v36 = 2;
LABEL_21:
            objc_msgSend(v33, "drawBulletAtPoint:shape:inContext:withBorder:", v36, CurrentContext, v15, v34, v35, v46);
            break;
          case 5:
            objc_msgSend(a1, "drawArrowFrom:to:open:inContext:withBorder:", 0, CurrentContext, v15, v22, v24, v18, v20);
            break;
          default:
            break;
        }
        switch(v26)
        {
          case 1:
            v37 = a1;
            v38 = v22;
            v39 = v24;
            v40 = 0;
            goto LABEL_27;
          case 2:
            v37 = a1;
            v38 = v22;
            v39 = v24;
            v40 = 1;
            goto LABEL_27;
          case 3:
            v37 = a1;
            v38 = v22;
            v39 = v24;
            v40 = 2;
LABEL_27:
            objc_msgSend(v37, "drawBulletAtPoint:shape:inContext:withBorder:", v40, CurrentContext, v15, v38, v39, v46);
            break;
          case 5:
            objc_msgSend(a1, "drawArrowFrom:to:open:inContext:withBorder:", 0, CurrentContext, v15, v18, v20, v22, v24);
            break;
          default:
            break;
        }
        v41 = v26 <= 0 && v32 <= 0;
        v42 = kCGPathStroke;
        if (!v41 && v14)
        {
          v43 = objc_retainAutorelease(v14);
          v44 = CGColorGetColorSpace((CGColorRef)objc_msgSend(v43, "CGColor"));
          v45 = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(v43), "CGColor"));
          CGContextSetFillColorSpace(CurrentContext, v44);
          CGContextSetFillColor(CurrentContext, v45);
          v42 = kCGPathFillStroke;
        }
        CGContextDrawPath(CurrentContext, v42);
      }
      CGContextRestoreGState(CurrentContext);
    }
  }

}

+ (void)drawBulletAtPoint:(CGPoint)a3 shape:(int)a4 inContext:(CGContext *)a5 withBorder:(id)a6
{
  double y;
  double x;
  id v10;
  double v11;
  float v12;
  float v13;
  double v14;
  id v15;
  CGRect v16;
  CGRect v17;

  y = a3.y;
  x = a3.x;
  v10 = a6;
  v15 = v10;
  if (v10)
  {
    objc_msgSend(v10, "lineWidth");
    v12 = v11;
    if (v12 == 0.0)
      v13 = 1.5;
    else
      v13 = v12 * 1.5;
    v14 = v13;
  }
  else
  {
    v14 = 1.0;
  }
  switch(a4)
  {
    case 2:
      CGContextMoveToPoint(a5, x - v14 * 0.25, y + v14 + v14 * 0.25);
      CGContextAddLineToPoint(a5, x + v14, y);
      CGContextAddLineToPoint(a5, x, y - v14);
      CGContextAddLineToPoint(a5, x - v14, y);
      CGContextAddLineToPoint(a5, x, y + v14);
      break;
    case 1:
      v17.origin.x = x - v14;
      v17.origin.y = y - v14;
      v17.size.width = v14 + v14;
      v17.size.height = v14 + v14;
      CGContextAddEllipseInRect(a5, v17);
      break;
    case 0:
      v16.origin.x = x - v14;
      v16.origin.y = y - v14;
      v16.size.width = v14 + v14;
      v16.size.height = v14 + v14;
      CGContextAddRect(a5, v16);
      break;
  }

}

+ (void)drawArrowFrom:(CGPoint)a3 to:(CGPoint)a4 open:(BOOL)a5 inContext:(CGContext *)a6 withBorder:(id)a7
{
  double y;
  double x;
  double v11;
  double v12;
  id v13;
  float v14;
  float v15;
  float v16;
  double v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;

  y = a4.y;
  x = a4.x;
  v11 = a3.y;
  v12 = a3.x;
  v13 = a7;
  v14 = x - v12;
  v15 = y - v11;
  v16 = sqrtf((float)(v15 * v15) + (float)(v14 * v14));
  v26 = v13;
  if (v13)
  {
    objc_msgSend(v13, "lineWidth");
    v18 = v17;
    if (v18 == 0.0)
      v18 = 1.0;
  }
  else
  {
    v18 = 1.0;
  }
  v19 = (float)(v18 * v14);
  v20 = v16;
  v21 = x - v19 * 3.0 / v16;
  v22 = (float)(v18 * v15);
  v23 = y - v22 * 3.0 / v20;
  v24 = v22 * 1.5 / v20;
  v25 = v19 * 1.5 / v20;
  CGContextMoveToPoint(a6, v21 - v24, v25 + v23);
  CGContextAddLineToPoint(a6, x, y);
  CGContextAddLineToPoint(a6, v24 + v21, v23 - v25);
  if (!a5)
  {
    CGContextAddLineToPoint(a6, v21 - v24, v25 + v23);
    CGContextAddLineToPoint(a6, x, y);
  }

}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withLinkAnnotation:(id)a5
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  id v21;
  uint64_t v22;
  int v23;
  id v24;
  CGColorSpace *ColorSpace;
  id v26;
  const CGFloat *Components;
  uint64_t v28;
  id v29;
  CGColorSpace *v30;
  const CGFloat *v31;
  id v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v32 = a5;
  objc_msgSend(v32, "page");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v32, "valueForAnnotationKey:", CFSTR("/Border"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "valueForAnnotationKey:", CFSTR("/C"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v32, "isHighlighted");
  objc_msgSend(v32, "valueForAnnotationKey:", CFSTR("/H"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v19 & 1) != 0)
  {
    if (objc_msgSend(v32, "appearance:", 2))
    {
      v21 = a1;
      v22 = 2;
LABEL_6:
      objc_msgSend(v21, "drawAppearance:ofAnnotation:withBox:inContext:", v22, v32, a3, CurrentContext);
      goto LABEL_26;
    }
  }
  else if (objc_msgSend(v32, "appearance:", 0))
  {
    v21 = a1;
    v22 = 0;
    goto LABEL_6;
  }
  if (v17)
    v23 = 1;
  else
    v23 = v19;
  if ((unint64_t)a3 <= 4)
  {
    if (v23)
    {
      if (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0)
      {
        CGContextSaveGState(CurrentContext);
        objc_msgSend(v8, "transformContext:forBox:", CurrentContext, a3);
        if (!v19)
          goto LABEL_20;
        if (objc_msgSend(v20, "isEqualToString:", CFSTR("/I")))
        {
          +[PDFSelection defaultActiveColor](PDFSelection, "defaultActiveColor");
          v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v24, "CGColor"));
          v26 = objc_retainAutorelease(v24);
          Components = CGColorGetComponents((CGColorRef)objc_msgSend(v26, "CGColor"));
          CGContextSetFillColorSpace(CurrentContext, ColorSpace);
          CGContextSetFillColor(CurrentContext, Components);
          v28 = CGContextSetCompositeOperation();
          if (v17)
          {
            v33.origin.x = PDFRectToCGRect(v28);
            CGContextFillRect(CurrentContext, v33);
LABEL_22:
            if (!v18)
            {
              objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
              v18 = (id)objc_claimAutoreleasedReturnValue();
            }
            v18 = objc_retainAutorelease(v18);
            CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v18, "CGColor"));
            objc_msgSend(v17, "drawInRect:inContext:", CurrentContext, v10, v12, v14, v16);
            goto LABEL_25;
          }
          objc_msgSend(a1, "createPillBezier:inContext:", CurrentContext, v10, v12, v14, v16);
          CGContextFillPath(CurrentContext);
LABEL_25:
          CGContextRestoreGState(CurrentContext);

          goto LABEL_26;
        }
        if (objc_msgSend(v20, "isEqualToString:", CFSTR("/O")))
        {
          objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
          v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v30 = CGColorGetColorSpace((CGColorRef)objc_msgSend(v29, "CGColor"));
          v26 = objc_retainAutorelease(v29);
          v31 = CGColorGetComponents((CGColorRef)objc_msgSend(v26, "CGColor"));
          CGContextSetStrokeColorSpace(CurrentContext, v30);
          CGContextSetStrokeColor(CurrentContext, v31);
          CGContextSetCompositeOperation();
          v34.origin.x = v10;
          v34.origin.y = v12;
          v34.size.width = v14;
          v34.size.height = v16;
          v35 = PDFRectInset(v34, 0.5, 0.5);
          objc_msgSend(a1, "createPillBezier:inContext:", CurrentContext, v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
          CGContextStrokePath(CurrentContext);
        }
        else
        {
LABEL_20:
          v26 = 0;
        }
        if (v17)
          goto LABEL_22;
        goto LABEL_25;
      }
    }
  }
LABEL_26:

}

+ (void)createPillBezier:(CGRect)a3 inContext:(CGContext *)a4
{
  double height;
  double width;
  double y;
  double v8;
  double v9;
  float v10;
  double v11;
  float v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double x;
  double v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  v8 = a3.origin.x;
  CGContextSetLineJoin(a4, kCGLineJoinRound);
  v19 = width;
  if (height >= width)
    v9 = width;
  else
    v9 = height;
  v10 = v9 * 0.1;
  v11 = v10;
  v12 = 0.55228 * v10;
  x = v8 + v10;
  CGContextMoveToPoint(a4, x, y);
  v13 = v12;
  v14 = v8 + v12;
  CGContextAddCurveToPoint(a4, v14, y, v8, y + v13, v8, y + v11);
  v15 = y + height;
  CGContextAddLineToPoint(a4, v8, v15 - v11);
  CGContextAddCurveToPoint(a4, v8, v15 - v13, v14, v15, x, v15);
  v16 = v8 + v19;
  v17 = v8 + v19 - v11;
  CGContextAddLineToPoint(a4, v17, v15);
  CGContextAddCurveToPoint(a4, v16 - v13, v15, v16, v15 - v13, v16, v15 - v11);
  CGContextAddLineToPoint(a4, v16, y + v11);
  CGContextAddCurveToPoint(a4, v16, y + v13, v16 - v13, y, v17, y);
  CGContextAddLineToPoint(a4, x, y);
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withMarkupAnnotation:(id)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  id v13;
  CGColorSpace *ColorSpace;
  const CGFloat *Components;
  void *v16;
  unsigned int v17;
  int v18;
  void *v19;
  double v20;
  float64_t v21;
  double v22;
  float64_t v23;
  void *v24;
  double v25;
  float64_t v26;
  double v27;
  float64_t v28;
  void *v29;
  double v30;
  float64_t v31;
  double v32;
  float64_t v33;
  void *v34;
  double v35;
  float64_t v36;
  double v37;
  float64_t v38;
  void *v39;
  id v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;

  v40 = a5;
  objc_msgSend(v40, "page");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "valueForAnnotationKey:", CFSTR("/C"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v40, "markupType");
  objc_msgSend(v40, "valueForAnnotationKey:", CFSTR("/QuadPoints"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  if (objc_msgSend(v40, "appearance:", 0))
  {
    objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:", 0, v40, a3, CurrentContext);
    goto LABEL_25;
  }
  if ((unint64_t)a3 <= 4 && (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0))
  {
    CGContextSaveGState(CurrentContext);
    objc_msgSend(v8, "transformContext:forBox:", CurrentContext, a3);
    v13 = objc_retainAutorelease(v9);
    ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v13, "CGColor"));
    Components = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(v13), "CGColor"));
    if (v10)
    {
      CGContextSetStrokeColorSpace(CurrentContext, ColorSpace);
      CGContextSetStrokeColor(CurrentContext, Components);
    }
    else
    {
      CGContextSetCompositeOperation();
      CGContextSetFillColorSpace(CurrentContext, ColorSpace);
      CGContextSetFillColor(CurrentContext, Components);
    }
    v16 = v40;
    if (v12 >= 4)
    {
      v17 = 0;
      if (v12 >> 2 <= 1)
        v18 = 1;
      else
        v18 = v12 >> 2;
      while (1)
      {
        v42 = 0uLL;
        v41 = 0uLL;
        objc_msgSend(v11, "objectAtIndex:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "PDFKitPDFPointValue");
        v21 = v20;
        v23 = v22;

        v44.f64[0] = v21;
        v44.f64[1] = v23;
        objc_msgSend(v11, "objectAtIndex:", v17 + 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "PDFKitPDFPointValue");
        v26 = v25;
        v28 = v27;

        v43.f64[0] = v26;
        v43.f64[1] = v28;
        objc_msgSend(v11, "objectAtIndex:", v17 + 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "PDFKitPDFPointValue");
        v31 = v30;
        v33 = v32;

        v42.f64[0] = v31;
        v42.f64[1] = v33;
        objc_msgSend(v11, "objectAtIndex:", v17 + 3);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "PDFKitPDFPointValue");
        v36 = v35;
        v38 = v37;

        v16 = v40;
        v41.f64[0] = v36;
        v41.f64[1] = v38;
        v17 += 4;
        if (!v10)
          break;
        if (v10 == 2)
        {
          underlinePath(CurrentContext, v44.f64, v42.f64, v41.f64);
LABEL_19:
          CGContextStrokePath(CurrentContext);
LABEL_20:
          v16 = v40;
          goto LABEL_21;
        }
        if (v10 == 1)
        {
          strikeOutPath(CurrentContext, v44.f64, v43.f64, v42.f64, v41.f64);
          goto LABEL_19;
        }
LABEL_21:
        if (!--v18)
          goto LABEL_22;
      }
      highlightPath(CurrentContext, &v44, &v43, &v42, &v41);
      CGContextFillPath(CurrentContext);
      goto LABEL_20;
    }
LABEL_22:
    objc_msgSend(v16, "popup");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
      +[PDFAnnotationDrawing drawNoteInContext:withParentAnnotation:](PDFAnnotationDrawing, "drawNoteInContext:withParentAnnotation:", CurrentContext, v40);
    CGContextRestoreGState(CurrentContext);
  }
LABEL_25:

}

+ (void)drawNoteInContext:(CGContext *)a3 withParentAnnotation:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  CGColor *v8;
  id v9;
  CGColor *v10;
  CGColorSpace *ColorSpace;
  const CGFloat *Components;
  CGColorSpace *v13;
  const CGFloat *v14;
  id v15;

  v5 = a4;
  v6 = objc_msgSend(v5, "markupStyle");
  +[PDFAnnotation PDFTextColorForMarkupStyle:](PDFAnnotation, "PDFTextColorForMarkupStyle:", v6);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (CGColor *)objc_msgSend(v7, "CGColor");

  +[PDFAnnotation PDFTextBorderColorForMarkupStyle:](PDFAnnotation, "PDFTextBorderColorForMarkupStyle:", v6);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (CGColor *)objc_msgSend(v9, "CGColor");

  objc_msgSend(v5, "noteBounds");
  PDFKitBezierPathWithRoundedRect();
  v15 = (id)objc_claimAutoreleasedReturnValue();
  ColorSpace = CGColorGetColorSpace(v8);
  Components = CGColorGetComponents(v8);
  CGContextSetFillColorSpace(a3, ColorSpace);
  CGContextSetFillColor(a3, Components);
  objc_msgSend(v15, "fill");
  v13 = CGColorGetColorSpace(v10);
  v14 = CGColorGetComponents(v10);
  CGContextSetStrokeColorSpace(a3, v13);
  CGContextSetStrokeColor(a3, v14);
  objc_msgSend(v15, "stroke");

}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withPopupAnnotation:(id)a5
{
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(v9, "page");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 <= 4)
  {
    CGContextSaveGState(a4);
    objc_msgSend(v8, "transformContext:forBox:", a4, a3);
    objc_msgSend(a1, "adjustedRectForBox:withAnnotation:", a3, v9);
    objc_msgSend(a1, "drawInContext:withBounds:withPopupAnnotation:", a4, v9);
    CGContextRestoreGState(a4);
  }

}

+ (CGRect)adjustedRectForBox:(int64_t)a3 withAnnotation:(id)a4
{
  id v5;
  double v6;
  CGFloat x;
  double v8;
  double y;
  double v10;
  double width;
  double v12;
  double height;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MinX;
  double v25;
  double v26;
  double v27;
  double MaxX;
  double MinY;
  double MaxY;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double r2;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect result;
  CGRect v46;

  v5 = a4;
  objc_msgSend(v5, "bounds");
  x = v6;
  y = v8;
  width = v10;
  height = v12;
  objc_msgSend(v5, "page");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "boundsForBox:", a3);
    v16 = v15;
    v17 = x;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v39 = v17;
    MinX = PDFRectGetMinX(v17, y, width);
    r2 = v16;
    v25 = v16;
    v26 = v19;
    if (MinX >= PDFRectGetMaxX(v25, v19, v21) + -72.0)
    {
      v27 = PDFRectGetMaxX(r2, v19, v21) + -72.0;
    }
    else
    {
      v27 = v39;
      MaxX = PDFRectGetMaxX(v39, y, width);
      if (MaxX > PDFRectGetMinX(r2, v26, v21) + 72.0)
        goto LABEL_7;
      v27 = PDFRectGetMinX(r2, v26, v21);
    }
    width = 72.0;
LABEL_7:
    MinY = PDFRectGetMinY(v27, y, width, height);
    if (MinY >= PDFRectGetMaxY(r2, v26, v21, v23) + -36.0)
    {
      y = PDFRectGetMaxY(r2, v26, v21, v23) + -36.0;
    }
    else
    {
      MaxY = PDFRectGetMaxY(v27, y, width, height);
      if (MaxY > PDFRectGetMinY(r2, v26, v21, v23) + 36.0)
      {
LABEL_12:
        v41.origin.x = v27;
        v41.origin.y = y;
        v41.size.width = width;
        v41.size.height = height;
        v46.origin.x = r2;
        v46.origin.y = v26;
        v46.size.width = v21;
        v46.size.height = v23;
        v42 = PDFRectIntersection(v41, v46);
        x = v42.origin.x;
        y = v42.origin.y;
        width = v42.size.width;
        height = v42.size.height;
        goto LABEL_13;
      }
      y = PDFRectGetMinY(r2, v26, v21, v23);
    }
    height = 36.0;
    goto LABEL_12;
  }
LABEL_13:
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  v44 = PDFRectInset(v43, 1.0, 1.0);
  v31 = v44.origin.x;
  v32 = v44.origin.y;
  v33 = v44.size.width;
  v34 = v44.size.height + 1.0;

  v35 = v31;
  v36 = v32;
  v37 = v33;
  v38 = v34;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withSquareAnnotation:(id)a5
{
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v26;
  CGColorSpace *ColorSpace;
  const CGFloat *Components;
  id v29;
  CGColorSpace *v30;
  const CGFloat *v31;
  id v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v32 = a5;
  objc_msgSend(v32, "page");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v32, "valueForAnnotationKey:", CFSTR("/C"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "valueForAnnotationKey:", CFSTR("/IC"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "valueForAnnotationKey:", CFSTR("/Border"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "appearance:", 0))
  {
    objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:", 0, v32, a3, CurrentContext);
  }
  else if ((unint64_t)a3 <= 4 && (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0))
  {
    CGContextSaveGState(CurrentContext);
    objc_msgSend(v8, "transformContext:forBox:", CurrentContext, a3);
    v20 = 1.0;
    if (v19)
    {
      objc_msgSend(v19, "lineWidth");
      if (v21 != 0.0)
        v20 = v21;
    }
    CGContextSetLineWidth(CurrentContext, v20);
    if (objc_msgSend(v19, "style") == 1)
      CGContextSetLineDash(CurrentContext, 0.0, (const CGFloat *)objc_msgSend(v19, "dashPatternRaw"), objc_msgSend(v19, "dashCountRaw"));
    v33.origin.x = v10;
    v33.origin.y = v12;
    v33.size.width = v14;
    v33.size.height = v16;
    v34 = CGRectInset(v33, v20 * 0.5, v20 * 0.5);
    x = v34.origin.x;
    y = v34.origin.y;
    width = v34.size.width;
    height = v34.size.height;
    if (v18)
    {
      v26 = objc_retainAutorelease(v18);
      ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v26, "CGColor"));
      Components = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(v26), "CGColor"));
      CGContextSetFillColorSpace(CurrentContext, ColorSpace);
      CGContextSetFillColor(CurrentContext, Components);
      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = width;
      v35.size.height = height;
      CGContextFillRect(CurrentContext, v35);
    }
    v29 = objc_retainAutorelease(v17);
    v30 = CGColorGetColorSpace((CGColorRef)objc_msgSend(v29, "CGColor"));
    v31 = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(v29), "CGColor"));
    CGContextSetStrokeColorSpace(CurrentContext, v30);
    CGContextSetStrokeColor(CurrentContext, v31);
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    CGContextStrokeRect(CurrentContext, v36);
    CGContextRestoreGState(CurrentContext);
  }

}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withStampAnnotation:(id)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGColorSpace *DeviceRGB;
  CGColorSpace *v19;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  CGFloat components[4];
  CGPoint points;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  CGRect v38;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_msgSend(v8, "page");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  if ((unint64_t)a3 <= 4)
  {
    v14 = v10;
    v15 = v11;
    v16 = v12;
    v17 = v13;
    if (objc_msgSend(v8, "appearance:", 0))
    {
      objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:", 0, v8, a3, CurrentContext);
    }
    else if (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0)
    {
      CGContextSaveGState(CurrentContext);
      objc_msgSend(v9, "transformContext:forBox:", CurrentContext, a3);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      if (DeviceRGB)
      {
        v19 = DeviceRGB;
        CGContextSetStrokeColorSpace(CurrentContext, DeviceRGB);
        memset(components, 0, 24);
        components[3] = 1.0;
        CGContextSetStrokeColor(CurrentContext, components);
        MinX = PDFRectGetMinX(v14, v15, v16);
        MinY = PDFRectGetMinY(v14, v15, v16, v17);
        points.x = MinX;
        points.y = MinY;
        MaxX = PDFRectGetMaxX(v14, v15, v16);
        MaxY = PDFRectGetMaxY(v14, v15, v16, v17);
        v31 = MaxX;
        v32 = MaxY;
        v24 = PDFRectGetMinX(v14, v15, v16);
        v25 = PDFRectGetMaxY(v14, v15, v16, v17);
        v33 = v24;
        v34 = v25;
        v26 = PDFRectGetMaxX(v14, v15, v16);
        v27 = PDFRectGetMinY(v14, v15, v16, v17);
        v35 = v26;
        v36 = v27;
        v38.origin.x = PDFRectToCGRect(v28);
        CGContextStrokeRect(CurrentContext, v38);
        CGContextStrokeLineSegments(CurrentContext, &points, 4uLL);
        CGContextRestoreGState(CurrentContext);
        CGColorSpaceRelease(v19);
      }
      else
      {
        CGContextRestoreGState(CurrentContext);
      }
    }
  }

}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withTextAnnotation:(id)a5
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double x;
  double y;
  double width;
  double height;
  id v31;
  void *v32;
  id v33;
  id v34;
  CGRect v35;
  CGRect v36;

  v34 = a5;
  objc_msgSend(v34, "page");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v34, "color");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "popup");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v34, "iconType");
  if (objc_msgSend(v34, "appearance:", 0))
  {
    objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:", 0, v34, a3, CurrentContext);
    if (objc_msgSend(v34, "isSelected"))
      objc_msgSend(a1, "drawNoteAsSelected:rect:", CurrentContext, v10, v12, v14, v16);
  }
  else if ((unint64_t)a3 <= 4 && (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0))
  {
    CGContextSaveGState(CurrentContext);
    objc_msgSend(v8, "transformContext:forBox:", CurrentContext, a3);
    if (!v17)
    {
      objc_msgSend(v18, "color");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v18, "color");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[PDFAnnotation PDFTextColors](PDFAnnotation, "PDFTextColors");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndex:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    if (GetDefaultsWriteAKEnabled())
    {
      v22 = v17;
      +[PDFAnnotation PDFTextColors](PDFAnnotation, "PDFTextColors");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "indexOfObject:", v22);

      if (v24 == 0x7FFFFFFFFFFFFFFFLL)
      {
        +[PDFAnnotationDrawing createLigtherColor:withIntensity:](PDFAnnotationDrawing, "createLigtherColor:withIntensity:", objc_msgSend(objc_retainAutorelease(v22), "CGColor"), 0.05);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[PDFAnnotation PDFTextBorderColors](PDFAnnotation, "PDFTextBorderColors");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndex:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v35.origin.x = v10;
      v35.origin.y = v12;
      v35.size.width = v14;
      v35.size.height = v16;
      v36 = PDFRectInset(v35, 1.0, 1.0);
      x = v36.origin.x;
      y = v36.origin.y;
      width = v36.size.width;
      height = v36.size.height;
      v31 = objc_retainAutorelease(v22);
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v31, "CGColor"));
      +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v31, CurrentContext, x, y, width, height);
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, 1.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_retainAutorelease(v25);
      CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v33, "CGColor"));
      objc_msgSend(v32, "stroke");
      if (objc_msgSend(v34, "isSelected"))
        objc_msgSend(a1, "drawNoteAsSelected:rect:", CurrentContext, v10, v12, v14, v16);

    }
    else
    {
      switch(v19)
      {
        case 0:
          objc_msgSend(a1, "drawCommentIconInRect:withColor:inContext:", v17, CurrentContext, v10, v12, v14, v16);
          break;
        case 1:
          objc_msgSend(a1, "drawKeyIconInRect:withColor:inContext:", v17, CurrentContext, v10, v12, v14, v16);
          break;
        case 2:
          objc_msgSend(a1, "drawNoteIconInRect:withColor:inContext:", v17, CurrentContext, v10, v12, v14, v16);
          break;
        case 3:
          objc_msgSend(a1, "drawHelpIconInRect:withColor:inContext:", v17, CurrentContext, v10, v12, v14, v16);
          break;
        case 4:
          objc_msgSend(a1, "drawNewParagraphIconInRect:withColor:inContext:", v17, CurrentContext, v10, v12, v14, v16);
          break;
        case 5:
          objc_msgSend(a1, "drawParagraphIconInRect:withColor:inContext:", v17, CurrentContext, v10, v12, v14, v16);
          break;
        case 6:
          objc_msgSend(a1, "drawInsertIconInRect:withColor:inContext:", v17, CurrentContext, v10, v12, v14, v16);
          break;
        default:
          break;
      }
    }
    CGContextRestoreGState(CurrentContext);
  }

}

+ (void)drawNoteAsSelected:(CGContext *)a3 rect:(CGRect)a4
{
  id v5;
  CGColorSpace *ColorSpace;
  id v7;
  const CGFloat *Components;
  id v9;
  CGRect v10;

  v10 = PDFRectInset(a4, 1.0, 1.0);
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height, 1.0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v5, "CGColor"));
  v7 = objc_retainAutorelease(v5);
  Components = CGColorGetComponents((CGColorRef)objc_msgSend(v7, "CGColor"));
  CGContextSetStrokeColorSpace(a3, ColorSpace);
  CGContextSetStrokeColor(a3, Components);
  objc_msgSend(v9, "stroke");

}

+ (void)drawCommonCommentNoteIconToContext:(CGContext *)a3 colorComponents:(double *)a4 rect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  CGContextSetFillColor(a3, a4);
  v10 = x + width * 0.1;
  v11.origin.y = y + height * 0.78;
  v11.origin.x = v10;
  v11.size.width = width * 0.8;
  v11.size.height = height * 0.11;
  CGContextFillRect(a3, v11);
  v12.origin.y = y + height * 0.57;
  v12.origin.x = v10;
  v12.size.width = width * 0.8;
  v12.size.height = height * 0.11;
  CGContextFillRect(a3, v12);
  v13.origin.y = y + height * 0.36;
  v13.size.width = width * 0.6;
  v13.origin.x = v10;
  v13.size.height = height * 0.11;
  CGContextFillRect(a3, v13);
}

+ (void)setupDrawColor:(id)a3 withComponents:(double *)a4 forContext:(CGContext *)a5
{
  id v7;
  CGColorSpace *DeviceRGB;
  id v9;
  CGColor *v10;
  const CGFloat *Components;

  v7 = a3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGContextSetFillColorSpace(a5, DeviceRGB);
  v9 = objc_retainAutorelease(v7);
  v10 = (CGColor *)objc_msgSend(v9, "CGColor");

  Components = CGColorGetComponents(v10);
  CGContextSetFillColor(a5, Components);
  CGContextSetStrokeColorSpace(a5, DeviceRGB);
  *a4 = 0.0;
  a4[1] = 0.0;
  a4[2] = 0.0;
  a4[3] = 1.0;
  CGContextSetStrokeColor(a5, a4);
  if (DeviceRGB)
    CGColorSpaceRelease(DeviceRGB);
}

+ (void)drawCommentIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat v8;
  CGFloat x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double y;
  double v22;
  double cp1y;
  double v24;
  double v25;
  CGFloat v26;
  _BYTE v27[32];
  uint64_t v28;
  CGRect v29;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  v8 = a3.origin.y;
  x = a3.origin.x;
  v28 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v29.origin.x = x;
  v29.origin.y = v8;
  v29.size.width = width;
  v29.size.height = height;
  v30 = PDFRectInset(v29, 0.5, 0.5);
  v12 = v30.origin.x;
  v13 = v30.origin.y;
  v14 = v30.size.width;
  v15 = v30.size.height;
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetLineCap(a5, kCGLineCapRound);
  CGContextSetLineJoin(a5, kCGLineJoinRound);
  v26 = v13 + v15 * 0.0;
  CGContextMoveToPoint(a5, v12 + v14 * 0.25, v26);
  v16 = v13 + v15 * 0.25;
  CGContextAddLineToPoint(a5, v12 + v14 * 0.33, v16);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.1, v16);
  v17 = v12 + v14 * 0.0;
  cp1y = v13 + v15 * 0.28;
  v22 = v13 + v15 * 0.35;
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.03, v16, v17, cp1y, v17, v22);
  y = v13 + v15 * 0.9;
  CGContextAddLineToPoint(a5, v17, y);
  v24 = v13;
  v25 = v15;
  v18 = v15;
  v19 = v13 + v15 * 0.97;
  v20 = v18 + v13;
  CGContextAddCurveToPoint(a5, v17, v19, v12 + v14 * 0.03, v20, v12 + v14 * 0.1, v20);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.9, v20);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.97, v20, v14 + v12, v19, v14 + v12, y);
  CGContextAddLineToPoint(a5, v14 + v12, v22);
  CGContextAddCurveToPoint(a5, v14 + v12, cp1y, v12 + v14 * 0.97, v16, v12 + v14 * 0.9, v16);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.5, v16);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.25, v26);
  objc_msgSend(a1, "setupDrawColor:withComponents:forContext:", v11, v27, a5);

  CGContextDrawPath(a5, kCGPathFillStroke);
  objc_msgSend(a1, "drawCommonCommentNoteIconToContext:colorComponents:rect:", a5, v27, v12, v24, v14, v25);
}

+ (void)drawKeyIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BYTE v16[32];
  uint64_t v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v19 = PDFRectInset(v18, 0.5, 0.5);
  v12 = v19.origin.x;
  v13 = v19.origin.y;
  v14 = v19.size.width;
  v15 = v19.size.height;
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetLineCap(a5, kCGLineCapRound);
  CGContextSetLineJoin(a5, kCGLineJoinRound);
  CGContextMoveToPoint(a5, v12 + v14 * 0.0, v13 + v15 * 0.61);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.0, v13 + v15 * 0.75);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.0, v13 + v15 * 0.9, v12 + v14 * 0.1, v15 + v13, v12 + v14 * 0.25, v15 + v13);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.38, v15 + v13);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.48, v15 + v13, v12 + v14 * 0.55, v13 + v15 * 0.95, v12 + v14 * 0.55, v13 + v15 * 0.85);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.55, v13 + v15 * 0.61);
  CGContextAddLineToPoint(a5, v14 + v12, v13 + v15 * 0.15);
  CGContextAddLineToPoint(a5, v14 + v12, v13 + v15 * 0.0);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.7, v13 + v15 * 0.0);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.7, v13 + v15 * 0.15);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.55, v13 + v15 * 0.15);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.55, v13 + v15 * 0.3);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.4, v13 + v15 * 0.3);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.4, v13 + v15 * 0.45);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.15, v13 + v15 * 0.45);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.05, v13 + v15 * 0.45, v12 + v14 * 0.0, v13 + v15 * 0.51, v12 + v14 * 0.0, v13 + v15 * 0.61);
  v20.origin.x = v12 + v14 * 0.12;
  v20.origin.y = v13 + v15 * 0.72;
  v20.size.width = v14 * 0.16;
  v20.size.height = v15 * 0.16;
  CGContextAddEllipseInRect(a5, v20);
  objc_msgSend(a1, "setupDrawColor:withComponents:forContext:", v11, v16, a5);

  CGContextDrawPath(a5, kCGPathEOFillStroke);
}

+ (void)drawNoteIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  _BYTE v19[32];
  uint64_t v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v22 = PDFRectInset(v21, 0.5, 0.5);
  v23 = PDFRectInset(v22, v22.size.width * 0.08, 0.0);
  v12 = v23.origin.x;
  v13 = v23.origin.y;
  v14 = v23.size.width;
  v15 = v23.size.height;
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetLineCap(a5, kCGLineCapRound);
  CGContextSetLineJoin(a5, kCGLineJoinRound);
  v16 = v12 + v14 * 0.0;
  v17 = v13 + v15 * 0.0;
  CGContextMoveToPoint(a5, v16, v17);
  CGContextAddLineToPoint(a5, v16, v15 + v13);
  CGContextAddLineToPoint(a5, v14 + v12, v15 + v13);
  v18 = v13 + v15 * 0.25;
  CGContextAddLineToPoint(a5, v14 + v12, v18);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.75, v17);
  CGContextAddLineToPoint(a5, v16, v17);
  objc_msgSend(a1, "setupDrawColor:withComponents:forContext:", v11, v19, a5);

  CGContextDrawPath(a5, kCGPathFillStroke);
  CGContextMoveToPoint(a5, v14 + v12, v18);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.75, v18);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.75, v17);
  CGContextStrokePath(a5);
  objc_msgSend(a1, "drawCommonCommentNoteIconToContext:colorComponents:rect:", a5, v19, v12, v13, v14, v15);
}

+ (void)drawHelpIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  _BYTE v17[32];
  uint64_t v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v20 = PDFRectInset(v19, 0.5, 0.5);
  v12 = v20.origin.x;
  v13 = v20.origin.y;
  v14 = v20.size.width;
  v15 = v20.size.height;
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetLineCap(a5, kCGLineCapRound);
  CGContextSetLineJoin(a5, kCGLineJoinRound);
  CGContextMoveToPoint(a5, v12 + v14 * 0.3, v13 + v15 * 0.65);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.3, v13 + v15 * 0.78, v12 + v14 * 0.37, v13 + v15 * 0.85, v12 + v14 * 0.5, v13 + v15 * 0.85);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.63, v13 + v15 * 0.85, v12 + v14 * 0.7, v13 + v15 * 0.78, v12 + v14 * 0.7, v13 + v15 * 0.65);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.68, v13 + v15 * 0.45, v12 + v14 * 0.55, v13 + v15 * 0.5, v12 + v14 * 0.55, v13 + v15 * 0.35);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.45, v13 + v15 * 0.35);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.44, v13 + v15 * 0.55, v12 + v14 * 0.6, v13 + v15 * 0.52, v12 + v14 * 0.6, v13 + v15 * 0.65);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.6, v13 + v15 * 0.71, v12 + v14 * 0.56, v13 + v15 * 0.75, v12 + v14 * 0.5, v13 + v15 * 0.75);
  v16 = v13 + v15 * 0.65;
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.44, v13 + v15 * 0.75, v12 + v14 * 0.4, v13 + v15 * 0.71, v12 + v14 * 0.4, v16);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.3, v16);
  v21.origin.x = v12 + v14 * 0.42;
  v21.origin.y = v13 + v15 * 0.11;
  v21.size.width = v14 * 0.16;
  v21.size.height = v15 * 0.16;
  CGContextAddEllipseInRect(a5, v21);
  v22.origin.x = v12 + v14 * 0.0;
  v22.origin.y = v13 + v15 * 0.0;
  v22.size.width = v14;
  v22.size.height = v15;
  CGContextAddEllipseInRect(a5, v22);
  objc_msgSend(a1, "setupDrawColor:withComponents:forContext:", v11, v17, a5);

  CGContextDrawPath(a5, kCGPathEOFillStroke);
}

+ (void)drawNewParagraphIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  _BYTE v19[32];
  uint64_t v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v22 = PDFRectInset(v21, 0.5, 0.5);
  v23 = PDFRectInset(v22, v22.size.width * 0.1, 0.0);
  v12 = v23.origin.x;
  v13 = v23.origin.y;
  v14 = v23.size.width;
  v15 = v23.size.height;
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetLineCap(a5, kCGLineCapRound);
  CGContextSetLineJoin(a5, kCGLineJoinRound);
  CGContextMoveToPoint(a5, v12 + v14 * 0.0, v13 + v15 * 0.5);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.5, v15 + v13);
  CGContextAddLineToPoint(a5, v14 + v12, v13 + v15 * 0.5);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.0, v13 + v15 * 0.5);
  objc_msgSend(a1, "setupDrawColor:withComponents:forContext:", v11, v19, a5);

  CGContextDrawPath(a5, kCGPathFillStroke);
  v16 = v13 + v15 * 0.0;
  CGContextMoveToPoint(a5, v12 + v14 * 0.0, v16);
  v17 = v13 + v15 * 0.4;
  CGContextAddLineToPoint(a5, v12 + v14 * 0.0, v17);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.4, v16);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.4, v17);
  CGContextMoveToPoint(a5, v12 + v14 * 0.6, v16);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.6, v17);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.9, v17);
  v18 = v13 + v15 * 0.2;
  CGContextAddCurveToPoint(a5, v12 + v14 * 1.1, v17, v12 + v14 * 1.1, v18, v12 + v14 * 0.9, v18);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.6, v18);
  CGContextStrokePath(a5);
}

+ (void)drawParagraphIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  _BYTE v21[32];
  uint64_t v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v24 = PDFRectInset(v23, 0.5, 0.5);
  v25 = PDFRectInset(v24, v24.size.width * 0.1, 0.0);
  v12 = v25.origin.x;
  v13 = v25.origin.y;
  v14 = v25.size.width;
  v15 = v25.size.height;
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetLineCap(a5, kCGLineCapRound);
  CGContextSetLineJoin(a5, kCGLineJoinRound);
  v16 = v13 + v15 * 0.0;
  CGContextMoveToPoint(a5, v12 + v14 * 0.5, v16);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.5, v13 + v15 * 0.5);
  v17 = v12 + v14 * 0.0;
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.15, v13 + v15 * 0.5, v17, v13 + v15 * 0.55, v17, v13 + v15 * 0.7);
  v18 = v12 + v14 * 0.5;
  CGContextAddCurveToPoint(a5, v17, v13 + v15 * 0.95, v12 + v14 * 0.15, v15 + v13, v18, v15 + v13);
  CGContextAddLineToPoint(a5, v14 + v12, v15 + v13);
  CGContextAddLineToPoint(a5, v14 + v12, v16);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.8, v16);
  v19 = v13 + v15 * 0.8;
  CGContextAddLineToPoint(a5, v12 + v14 * 0.8, v19);
  v20 = v12 + v14 * 0.65;
  CGContextAddLineToPoint(a5, v20, v19);
  CGContextAddLineToPoint(a5, v20, v16);
  CGContextAddLineToPoint(a5, v18, v16);
  objc_msgSend(a1, "setupDrawColor:withComponents:forContext:", v11, v21, a5);

  CGContextDrawPath(a5, kCGPathFillStroke);
}

+ (void)drawInsertIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BYTE v16[32];
  uint64_t v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v19 = PDFRectInset(v18, 0.5, 0.5);
  v12 = v19.origin.x;
  v13 = v19.origin.y;
  v14 = v19.size.width;
  v15 = v19.size.height;
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetLineCap(a5, kCGLineCapRound);
  CGContextSetLineJoin(a5, kCGLineJoinRound);
  CGContextMoveToPoint(a5, v12 + v14 * 0.0, v13 + v15 * 0.0);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.5, v15 + v13);
  CGContextAddLineToPoint(a5, v14 + v12, v13 + v15 * 0.0);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.0, v13 + v15 * 0.0);
  objc_msgSend(a1, "setupDrawColor:withComponents:forContext:", v11, v16, a5);

  CGContextDrawPath(a5, kCGPathFillStroke);
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withRedactAnnotation:(id)a5
{
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t i;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  CGFloat MinX;
  CGFloat MaxX;
  CGFloat v40;
  CGFloat v41;
  double v42[2];
  double v43[2];
  double v44[2];
  CGPoint points;
  CGFloat v46;
  CGFloat MaxY;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat MinY;
  uint64_t v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  if ((unint64_t)a3 <= 4 && (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0))
  {
    CGContextSaveGState(CurrentContext);
    objc_msgSend(v7, "page");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transformContext:forBox:", CurrentContext, a3);
    if (objc_msgSend(v7, "isTransparent"))
      v9 = 0.65;
    else
      v9 = 1.0;
    objc_msgSend(v7, "valueForAnnotationKey:", CFSTR("/QuadPoints"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = objc_msgSend(v10, "count");
      if (v12)
      {
        v13 = v12;
        for (i = 0; i < v13; i += 4)
        {
          objc_msgSend(v11, "objectAtIndex:", i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "PDFKitPDFPointValue");
          points.x = v16;
          points.y = v17;

          objc_msgSend(v11, "objectAtIndex:", i + 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "PDFKitPDFPointValue");
          v44[0] = v19;
          v44[1] = v20;

          objc_msgSend(v11, "objectAtIndex:", i + 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "PDFKitPDFPointValue");
          v43[0] = v22;
          v43[1] = v23;

          objc_msgSend(v11, "objectAtIndex:", i + 3);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "PDFKitPDFPointValue");
          v42[0] = v25;
          v42[1] = v26;

          redactPath(CurrentContext, &points.x, v44, v43, v42, v9);
        }
      }
    }
    else
    {
      objc_msgSend(v7, "bounds");
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      if (GetDefaultsWriteHighlightRedactions())
      {
        CGContextSetLineWidth(CurrentContext, 1.0);
        objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[PDFAnnotationDrawing strokeRect:color:context:](PDFAnnotationDrawing, "strokeRect:color:context:", v35, CurrentContext, v28, v30, v32, v34);

      }
      else
      {
        v53.origin.x = v28;
        v53.origin.y = v30;
        v53.size.width = v32;
        v53.size.height = v34;
        CGContextClipToRect(CurrentContext, v53);
        objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "colorWithAlphaComponent:", 0.5);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v37, CurrentContext, v28, v30, v32, v34);

        CGContextSetRGBStrokeColor(CurrentContext, 0.333333, 0.333333, 0.333333, 1.0);
        CGContextSetLineWidth(CurrentContext, 1.0);
        v54.origin.x = v28;
        v54.origin.y = v30;
        v54.size.width = v32;
        v54.size.height = v34;
        MinX = CGRectGetMinX(v54);
        v55.origin.x = v28;
        v55.origin.y = v30;
        v55.size.width = v32;
        v55.size.height = v34;
        points.x = MinX;
        points.y = CGRectGetMinY(v55);
        v56.origin.x = v28;
        v56.origin.y = v30;
        v56.size.width = v32;
        v56.size.height = v34;
        MaxX = CGRectGetMaxX(v56);
        v57.origin.x = v28;
        v57.origin.y = v30;
        v57.size.width = v32;
        v57.size.height = v34;
        v46 = MaxX;
        MaxY = CGRectGetMaxY(v57);
        v58.origin.x = v28;
        v58.origin.y = v30;
        v58.size.width = v32;
        v58.size.height = v34;
        v40 = CGRectGetMinX(v58);
        v59.origin.x = v28;
        v59.origin.y = v30;
        v59.size.width = v32;
        v59.size.height = v34;
        v48 = v40;
        v49 = CGRectGetMaxY(v59);
        v60.origin.x = v28;
        v60.origin.y = v30;
        v60.size.width = v32;
        v60.size.height = v34;
        v41 = CGRectGetMaxX(v60);
        v61.origin.x = v28;
        v61.origin.y = v30;
        v61.size.width = v32;
        v61.size.height = v34;
        v50 = v41;
        MinY = CGRectGetMinY(v61);
        CGContextSetLineWidth(CurrentContext, 1.0);
        CGContextStrokeLineSegments(CurrentContext, &points, 4uLL);
      }
    }
    CGContextRestoreGState(CurrentContext);

  }
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withButtonWidgetAnnotation:(id)a5
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  id v22;
  CGColorSpace *ColorSpace;
  const CGFloat *Components;
  uint64_t v25;
  _BOOL4 v26;
  _BOOL4 v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v46;
  CGRect v47;

  v46 = a5;
  objc_msgSend(v46, "page");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v46, "interactiveBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "valueForAnnotationKey:", CFSTR("/MK"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v46, "buttonWidgetState");
  v19 = objc_msgSend(v46, "widgetControlType");
  v20 = objc_msgSend(v46, "isHighlighted");
  if ((unint64_t)a3 > 4)
    goto LABEL_35;
  v21 = v20;
  if (!CurrentContext)
  {
    CurrentContext = PDFGraphicsGetCurrentContext();
    if (!CurrentContext)
      goto LABEL_35;
  }
  if (v16)
  {
    v22 = objc_retainAutorelease(v16);
    ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v22, "CGColor"));
    Components = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(v22), "CGColor"));
    CGContextSetFillColorSpace(CurrentContext, ColorSpace);
    CGContextSetFillColor(CurrentContext, Components);
    v47.origin.x = PDFRectToCGRect(v25);
    CGContextFillRect(CurrentContext, v47);
  }
  if ((v21 & 1) == 0)
  {
    if (!objc_msgSend(v46, "appearance:", 0))
      goto LABEL_24;
    v33 = objc_msgSend(v46, "appearance:", 0);
    v34 = objc_msgSend(v46, "appearance:", 3);
    v29 = 0;
    if (v19)
    {
      if (!v18)
      {
        v29 = 3;
        if (v33)
        {
          if (!v34)
            goto LABEL_35;
        }
      }
    }
    if (!objc_msgSend(v46, "appearance:", v29))
      goto LABEL_24;
LABEL_23:
    objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:scaleProportional:", v29, v46, a3, CurrentContext, objc_msgSend(v17, "scaleProportional"));
    goto LABEL_35;
  }
  v26 = v19 != 0;
  v27 = v18 == 0;
  v28 = v26 && v27;
  if (v26 && v27)
    v29 = 5;
  else
    v29 = 2;
  if (objc_msgSend(v46, "appearance:", v29))
    goto LABEL_23;
  v43 = objc_msgSend(v46, "appearance:", 0);
  v30 = objc_msgSend(v46, "appearance:", 3);
  v31 = 0;
  if (v28)
  {
    v31 = 3;
    if (v43)
    {
      if (!v30)
        goto LABEL_35;
    }
  }
  if (objc_msgSend(v46, "appearance:", v31))
  {
    objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:scaleProportional:", v31, v46, a3, CurrentContext, objc_msgSend(v17, "scaleProportional"));
    CGContextSaveGState(CurrentContext);
    PDFColorCreateFromWhiteAlpha(objc_msgSend(v7, "transformContext:forBox:", CurrentContext, a3), 0.0, 0.25);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == 1)
      objc_msgSend(a1, "fillOval:color:context:", v32, CurrentContext, v9, v11, v13, v15);
    else
      objc_msgSend(a1, "fillRect:color:context:", v32, CurrentContext, v9, v11, v13, v15);

    CGContextRestoreGState(CurrentContext);
    goto LABEL_35;
  }
LABEL_24:
  CGContextSaveGState(CurrentContext);
  objc_msgSend(v7, "transformContext:forBox:", CurrentContext, a3);
  objc_msgSend(v17, "backgroundColor");
  v42 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "borderColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "caption");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "font");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "fontColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v36)
  {
    objc_msgSend(v46, "valueForAnnotationKey:", CFSTR("/Contents"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v19 == 2)
  {
    LOBYTE(v41) = v21;
    v39 = v18;
    v38 = (void *)v42;
    objc_msgSend(a1, "drawCheckBox:inContext:withState:withBackgroundColor:withBorderColor:withFontColor:isHighlighted:", v46, CurrentContext, v39, v42, v35, v37, v41);
  }
  else if (v19 == 1)
  {
    LOBYTE(v41) = v21;
    v40 = v18;
    v38 = (void *)v42;
    objc_msgSend(a1, "drawRadioButton:inContext:withState:withBackgroundColor:withBorderColor:withFontColor:isHighlighted:", v46, CurrentContext, v40, v42, v35, v37, v41);
  }
  else
  {
    v38 = (void *)v42;
    if (!v19)
    {
      LOBYTE(v41) = v21;
      objc_msgSend(a1, "drawPushButton:inContext:withBackgroundColor:withCaption:withFont:withFontColor:isHighlighted:", v46, CurrentContext, v42, v36, v44, v37, v41);
    }
  }
  CGContextRestoreGState(CurrentContext);

LABEL_35:
}

+ (void)drawPushButton:(id)a3 inContext:(CGContext *)a4 withBackgroundColor:(id)a5 withCaption:(id)a6 withFont:(id)a7 withFontColor:(id)a8 isHighlighted:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;

  v35 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  objc_msgSend(v35, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v35, "page");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "rotation");

  if (v14)
    +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v14, a4, v19, v21, v23, v25);
  if (v15)
  {
    objc_msgSend(v16, "pointSize");
    v29 = (v25 - v28) * -0.5;
    if (!v16)
    {
      v30 = (void *)MEMORY[0x24BDF6A70];
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
      objc_msgSend(v30, "systemFontOfSize:");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v31 = v25 + v29;
    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[PDFAnnotationDrawing renderString:forRect:font:color:alignment:rotation:breaks:context:withAnnotation:](PDFAnnotationDrawing, "renderString:forRect:font:color:alignment:rotation:breaks:context:withAnnotation:", v15, v16, v17, 1, v27, 0, v19, v21, v23, v31, a4, v35);
  }
  objc_msgSend(v35, "valueForAnnotationKey:", CFSTR("/C"));
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v32)
    v32 = +[PDFAnnotationDrawing strokeRect:color:context:](PDFAnnotationDrawing, "strokeRect:color:context:", v32, a4, v19, v21, v23, v25);
  if (a9)
  {
    PDFColorCreateFromWhiteAlpha(v32, 0.0, 0.25);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v34, a4, v19, v21, v23, v25);

  }
}

+ (void)drawRadioButton:(id)a3 inContext:(CGContext *)a4 withState:(int64_t)a5 withBackgroundColor:(id)a6 withBorderColor:(id)a7 withFontColor:(id)a8 isHighlighted:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  double v17;
  double x;
  double v19;
  double y;
  double v21;
  double width;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  BOOL v28;
  double v29;
  uint64_t v30;
  double height;
  id v32;
  void *v33;
  id v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v34 = a6;
  v14 = a7;
  v15 = a8;
  v16 = a3;
  objc_msgSend(v16, "bounds");
  x = v17;
  y = v19;
  width = v21;
  v24 = v23;
  objc_msgSend(v16, "valueForAnnotationKey:", CFSTR("/Border"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  CGContextSaveGState(a4);
  LODWORD(v26) = 1.0;
  if (v25)
  {
    objc_msgSend(v25, "lineWidth", v26);
    *(float *)&v26 = v26;
    if (*(float *)&v26 == 0.0)
      LODWORD(v26) = 1.0;
  }
  v27 = *(float *)&v26;
  CGContextSetLineWidth(a4, *(float *)&v26);
  v28 = width < v24;
  v29 = x + (width - v24) * 0.5;
  if (width < v24)
    y = y + (v24 - width) * 0.5;
  else
    width = v24;
  if (!v28)
    x = v29;
  if (v34)
    +[PDFAnnotationDrawing fillOval:color:context:](PDFAnnotationDrawing, "fillOval:color:context:", v34, a4, x, y, width, width);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = width;
  v36 = PDFRectInset(v35, v27 * 0.5, v27 * 0.5);
  v30 = +[PDFAnnotationDrawing strokeOval:color:context:](PDFAnnotationDrawing, "strokeOval:color:context:", v14, a4, v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
  if (a5 != 1)
  {
    height = width;
    if (!a9)
      goto LABEL_20;
LABEL_19:
    PDFColorCreateFromWhiteAlpha(v30, 0.0, 0.25);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[PDFAnnotationDrawing fillOval:color:context:](PDFAnnotationDrawing, "fillOval:color:context:", v33, a4, x, y, width, height);

    goto LABEL_20;
  }
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = width;
  v38 = PDFRectInset(v37, width * 0.25, width * 0.25);
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;
  v32 = v15;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[PDFAnnotationDrawing fillOval:color:context:](PDFAnnotationDrawing, "fillOval:color:context:", v32, a4, x, y, width, height);

  if (a9)
    goto LABEL_19;
LABEL_20:
  CGContextRestoreGState(a4);

}

+ (void)drawCheckBox:(id)a3 inContext:(CGContext *)a4 withState:(int64_t)a5 withBackgroundColor:(id)a6 withBorderColor:(id)a7 withFontColor:(id)a8 isHighlighted:(BOOL)a9
{
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  id v25;
  CGColor *v26;
  CGColorSpace *ColorSpace;
  const CGFloat *Components;
  float v29;
  double v30;
  float v31;
  double v32;
  double v33;
  double v34;
  double v35;
  float v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  void *v41;
  id v42;

  v42 = a6;
  v14 = a7;
  v15 = a8;
  objc_msgSend(a3, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  CGContextSaveGState(a4);
  v24 = (uint64_t)v42;
  if (v42)
    v24 = +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v42, a4, v17, v19, v21, v23);
  if (!v15)
  {
    PDFColorCreateFromWhiteAlpha(v24, 0.0, 1.0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = objc_retainAutorelease(v15);
  v26 = (CGColor *)objc_msgSend(v25, "CGColor");
  ColorSpace = CGColorGetColorSpace(v26);
  Components = CGColorGetComponents(v26);
  CGContextSetStrokeColorSpace(a4, ColorSpace);
  CGContextSetStrokeColor(a4, Components);
  if (a5 == 1)
  {
    v29 = (v21 - v23) * 0.5;
    v30 = v29;
    v31 = (v23 - v21) * 0.5;
    v32 = v31;
    if (v21 < v23)
      v33 = v21;
    else
      v33 = v23;
    if (v21 < v23)
      v34 = 0.0;
    else
      v34 = v30;
    if (v21 < v23)
      v35 = v32;
    else
      v35 = 0.0;
    v36 = v33;
    CGContextBeginPath(a4);
    v37 = v17 + v34;
    v38 = v36;
    v39 = v19 + v35;
    CGContextMoveToPoint(a4, v37 + v38 * 0.15, v39 + v38 * 0.45);
    CGContextAddLineToPoint(a4, v37 + v38 * 0.35, v39 + v38 * 0.25);
    CGContextAddLineToPoint(a4, v37 + v38 * 0.85, v39 + v38 * 0.75);
    CGContextSetLineWidth(a4, 1.5);
    CGContextStrokePath(a4);
  }
  CGContextRestoreGState(a4);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v40 = +[PDFAnnotationDrawing strokeRect:color:context:](PDFAnnotationDrawing, "strokeRect:color:context:", v14, a4, v17, v19, v21, v23);
  if (a9)
  {
    PDFColorCreateFromWhiteAlpha(v40, 0.0, 0.25);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v41, a4, v17, v19, v21, v23);

  }
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withChoiceWidgetAnnotation:(id)a5
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a5;
  objc_msgSend(v30, "page");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v30, "interactiveBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "widgetStringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "widgetDefaultStringValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v17, CurrentContext, v10, v12, v14, v16);
  if (objc_msgSend(v30, "appearance:", 0) && v19 && objc_msgSend(v19, "isEqualToString:", v18))
  {
    objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:", 0, v30, a3, CurrentContext);
    goto LABEL_22;
  }
  if ((unint64_t)a3 <= 4 && (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0))
  {
    CGContextSaveGState(CurrentContext);
    objc_msgSend(v8, "transformContext:forBox:", CurrentContext, a3);
    objc_msgSend(v30, "valueForAnnotationKey:", CFSTR("/MK"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "backgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v30, "isListChoice");
    objc_msgSend(v30, "choices");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "font");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fontColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "valueForAnnotationKey:", CFSTR("/Border"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v21, CurrentContext, v10, v12, v14, v16);
    if (v22)
    {
      objc_msgSend(a1, "drawListBox:inContext:withAnnotation:withOptions:withStringValue:withFont:withFontColor:", CurrentContext, v30, v27, v18, v29, v28, v10, v12, v14, v16);
      if (!v23)
        goto LABEL_19;
    }
    else
    {
      objc_msgSend(a1, "drawComboBox:inContext:withAnnotation:withStringValue:withFont:withFontColor:", CurrentContext, v30, v18, v29, v28, v10, v12, v14, v16);
      if (!v23)
      {
LABEL_19:
        if ((v22 & 1) == 0)
          objc_msgSend(a1, "drawDisclosureBox:inContext:", CurrentContext, v10, v12, v14, v16);
        CGContextRestoreGState(CurrentContext);

        goto LABEL_22;
      }
    }
    v26 = v20;
    objc_msgSend(v20, "borderColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v25 = objc_retainAutorelease(v24);
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v25, "CGColor"));
    objc_msgSend(v23, "drawInRect:inContext:", CurrentContext, v10, v12, v14, v16);

    v20 = v26;
    goto LABEL_19;
  }
LABEL_22:

}

+ (void)drawListBox:(CGRect)a3 inContext:(CGContext *)a4 withAnnotation:(id)a5 withOptions:(id)a6 withStringValue:(id)a7 withFont:(id)a8 withFontColor:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  CGColorSpace *ColorSpace;
  id v33;
  const CGFloat *Components;
  CGFloat v35;
  id v36;
  id v37;
  CGRect v38;
  CGRect v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v37 = a5;
  v18 = a6;
  v36 = a7;
  v19 = a8;
  v20 = a9;
  if (v18)
  {
    v21 = objc_msgSend(v18, "count");
    if (v21 >= 1)
    {
      v22 = v21;
      v23 = x + 1.0;
      v24 = width + -1.0;
      objc_msgSend(v19, "pointSize");
      v25 = 0;
      v27 = v26 + 2.0;
      v28 = y + height - (v26 + 2.0);
      do
      {
        objc_msgSend(v18, "objectAtIndex:", v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v36, "isEqualToString:", v29) & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDF6950], "groupTableViewBackgroundColor");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v30, a4, v23, v28, v24, v27 + -0.1);

        }
        +[PDFAnnotationDrawing renderString:forRect:font:color:alignment:rotation:breaks:context:withAnnotation:](PDFAnnotationDrawing, "renderString:forRect:font:color:alignment:rotation:breaks:context:withAnnotation:", v29, v19, v20, 0, 0, 0, v23, v28, v24, v27, a4, v37);
        CGContextSaveGState(a4);
        objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v31, "CGColor"));
        v33 = objc_retainAutorelease(v31);
        Components = CGColorGetComponents((CGColorRef)objc_msgSend(v33, "CGColor"));
        CGContextSetStrokeColorSpace(a4, ColorSpace);
        CGContextSetStrokeColor(a4, Components);
        CGContextSetLineWidth(a4, 0.2);
        CGContextMoveToPoint(a4, v23, v28);
        CGContextAddLineToPoint(a4, v24 + v23, v28);
        CGContextStrokePath(a4);
        CGContextRestoreGState(a4);
        v38.origin.x = v23;
        v38.origin.y = v28;
        v38.size.width = v24;
        v38.size.height = v27;
        v39 = PDFRectOffset(v38, 0.0, -v27);
        v23 = v39.origin.x;
        v28 = v39.origin.y;
        v24 = v39.size.width;
        v27 = v39.size.height;
        v35 = v39.origin.y + v39.size.height;

        if (v35 < y)
          break;
        ++v25;
      }
      while (v22 > v25);
    }
  }

}

+ (void)drawComboBox:(CGRect)a3 inContext:(CGContext *)a4 withAnnotation:(id)a5 withStringValue:(id)a6 withFont:(id)a7 withFontColor:(id)a8
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  id v18;
  double v19;
  CGFloat v20;
  id v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v21 = a5;
  objc_msgSend(v17, "pointSize");
  v20 = ceil((height - v19) * 0.5);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v23 = PDFRectInset(v22, 2.0, v20);
  +[PDFAnnotationDrawing renderString:forRect:font:color:alignment:rotation:breaks:context:withAnnotation:](PDFAnnotationDrawing, "renderString:forRect:font:color:alignment:rotation:breaks:context:withAnnotation:", v18, v17, v16, 0, 0, 0, v23.origin.x, v23.origin.y - (height - v23.size.height), v23.size.width, v23.size.height + height - v23.size.height, a4, v21);

}

+ (void)drawDisclosureBox:(CGRect)a3 inContext:(CGContext *)a4
{
  double height;
  double width;
  double y;
  double x;
  CGColorSpace *DeviceRGB;
  CGColorSpace *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22 = *MEMORY[0x24BDAC8D0];
  CGContextSaveGState(a4);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    v10 = DeviceRGB;
    CGContextSetFillColorSpace(a4, DeviceRGB);
    v11 = PDFRectGetMaxX(x, y, width) + -8.0;
    v12 = PDFRectGetMidY(x, y, width, height) + -2.5;
    __asm { FMOV            V1.2D, #0.5 }
    v20 = _Q1;
    v21 = xmmword_209DC0740;
    CGContextSetFillColor(a4, (const CGFloat *)&v20);
    v23.origin.x = v11 + -4.5;
    v23.origin.y = v12 + -2.0;
    v23.size.width = 9.0;
    v23.size.height = 9.0;
    CGContextFillEllipseInRect(a4, v23);
    __asm { FMOV            V0.2D, #1.0 }
    v20 = _Q0;
    v21 = _Q0;
    CGContextSetFillColor(a4, (const CGFloat *)&v20);
    CGContextBeginPath(a4);
    CGContextMoveToPoint(a4, v11, v12);
    v19 = v12 + 4.0;
    CGContextAddLineToPoint(a4, v11 + -3.0, v19);
    CGContextAddLineToPoint(a4, v11 + 3.0, v19);
    CGContextClosePath(a4);
    CGContextFillPath(a4);
    CGContextRestoreGState(a4);
    CGColorSpaceRelease(v10);
  }
  else
  {
    CGContextRestoreGState(a4);
  }
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withTextWidgetAnnotation:(id)a5
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t Property;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;
  double x;
  double y;
  double width;
  double height;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  PDFBorder *v31;
  void *v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  id v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v44 = a5;
  objc_msgSend(v44, "page");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bounds");
  if ((unint64_t)a3 <= 4)
  {
    v13 = v9;
    v14 = v10;
    v15 = v11;
    v16 = v12;
    if (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0)
    {
      Property = CGContextGetProperty();
      v18 = *MEMORY[0x24BDBD270];
      v19 = objc_msgSend(v44, "appearance:", 0);
      if (v19)
        objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:scaleProportional:suppressTextRendering:", 0, v44, a3, CurrentContext, 1, 1);
      CGContextSaveGState(CurrentContext);
      objc_msgSend(v8, "transformContext:forBox:", CurrentContext, a3);
      UIGraphicsPushContext(CurrentContext);
      objc_msgSend(v8, "boundsForBox:", a3);
      CGContextTranslateCTM(CurrentContext, 0.0, v20 + v14 - (v20 - v14 - v16));
      CGContextScaleCTM(CurrentContext, 1.0, -1.0);
      if (Property == v18)
      {
        objc_msgSend(v44, "interactiveBackgroundColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }
      v45.origin.x = v13;
      v45.origin.y = v14;
      v45.size.width = v15;
      v45.size.height = v16;
      v46 = PDFRectInset(v45, 1.0, 1.0);
      x = v46.origin.x;
      y = v46.origin.y;
      width = v46.size.width;
      height = v46.size.height;
      if (v19)
      {
        if (v21)
          +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v21, CurrentContext, v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
      }
      else
      {
        objc_msgSend(v44, "backgroundColor");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v26;
        v28 = v21;
        if (v21 || (v28 = (void *)v26) != 0)
          +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v28, CurrentContext, x, y, width, height);

        objc_msgSend(v44, "valueForAnnotationKey:", CFSTR("/MK"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "borderColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(v30), "CGColor"));
          v31 = objc_alloc_init(PDFBorder);
          -[PDFBorder drawInRect:inContext:](v31, "drawInRect:inContext:", CurrentContext, v13, v14, v15, v16);

        }
      }
      objc_msgSend(v44, "control");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
        objc_msgSend(v44, "createAttributedStringForTextWidget");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "length"))
        {
          +[PDFAnnotationDrawing textInset](PDFAnnotationDrawing, "textInset");
          v35 = v34;
          +[PDFAnnotationDrawing textInset](PDFAnnotationDrawing, "textInset");
          v37 = v36;
          if ((objc_msgSend(v44, "isMultiline") & 1) == 0)
          {
            objc_msgSend(v33, "boundingRectWithSize:options:context:", 1, 0, v15, v16);
            if ((v16 - v38) * 0.5 >= 0.0)
              v37 = (v16 - v38) * 0.5;
            else
              v37 = 0.0;
          }
          v47.origin.x = v13;
          v47.origin.y = v14;
          v47.size.width = v15;
          v47.size.height = v16;
          v48 = CGRectInset(v47, v35, v37);
          v39 = v48.origin.x;
          v40 = v48.origin.y;
          v41 = v48.size.width;
          v42 = v48.size.height;
          v43 = floor(CGRectGetMaxY(v48));
          v49.origin.x = v39;
          v49.origin.y = v40;
          v49.size.width = v41;
          v49.size.height = v42;
          objc_msgSend(v33, "drawWithRect:options:context:", 1, 0, v39, v43 - CGRectGetHeight(v49), v41, v42);
        }

      }
      UIGraphicsPopContext();
      CGContextRestoreGState(CurrentContext);

    }
  }

}

+ (id)createLigtherColor:(CGColor *)a3 withIntensity:(double)a4
{
  CGColorSpace *ColorSpace;
  const CGFloat *Components;
  double v8;
  double v9;
  double v10;

  if (a3
    && CGColorGetNumberOfComponents(a3) == 4
    && (ColorSpace = CGColorGetColorSpace(a3), CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelRGB))
  {
    Components = CGColorGetComponents(a3);
    v8 = *Components - a4;
    v9 = 0.0;
    if (v8 < 0.0)
      v8 = 0.0;
    v10 = Components[1] - a4;
    if (v10 < 0.0)
      v10 = 0.0;
    if (Components[2] - a4 >= 0.0)
      v9 = Components[2] - a4;
  }
  else
  {
    v8 = 0.996;
    v10 = 0.933;
    v9 = 0.737;
  }
  PDFCGColorCreateGenericRGB(v8, v10, v9, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)stringByTrimmingTrailingCharactersInSet:(id)a3 forString:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;

  v5 = a4;
  objc_msgSend(a3, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:", v6, 4);
  v9 = v8;

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = &stru_24C25F170;
  }
  else
  {
    objc_msgSend(v5, "substringToIndex:", v7 + v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (BOOL)renderString:(id)a3 forRect:(CGRect)a4 font:(id)a5 color:(id)a6 alignment:(int64_t)a7 rotation:(int)a8 breaks:(BOOL)a9 context:(CGContext *)c withAnnotation:(id)a11
{
  _BOOL4 v11;
  double height;
  double width;
  double y;
  double x;
  __CFString *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  __CFDictionary *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  const __CFAllocator *v35;
  CFNumberRef v36;
  CFNumberRef v37;
  double v38;
  BOOL v39;
  const __CFAttributedString *v40;
  const __CFAttributedString *v41;
  CTTypesetterRef v42;
  const __CTTypesetter *v43;
  CFIndex Length;
  double v45;
  double v46;
  double v47;
  double v48;
  __int128 v49;
  CFIndex v50;
  double v51;
  CFIndex v52;
  const __CTLine *Line;
  const __CTLine *v54;
  double TypographicBounds;
  double v56;
  double v57;
  double v58;
  double v59;
  id v61;
  id v62;
  __CFDictionary *cf;
  id v64;
  CGFloat leading;
  CGFloat descent;
  CGAffineTransform valuePtr;
  uint64_t v69;
  _QWORD v70[3];
  CFRange v71;
  CGRect v72;
  CGRect v73;

  v11 = a9;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v70[1] = *MEMORY[0x24BDAC8D0];
  v20 = (__CFString *)a3;
  v21 = a5;
  v22 = a6;
  v23 = a11;
  if (!v20)
  {
    v39 = 1;
    goto LABEL_45;
  }
  CGContextSaveGState(c);
  v72.origin.x = x;
  v72.origin.y = y;
  v72.size.width = width;
  v72.size.height = height;
  PDFRectIntegral(v72);
  v73.origin.x = PDFRectToCGRect(v24);
  CGContextClipToRect(c, v73);
  v25 = objc_msgSend(v23, "gcCreateAttributesForFont:color:", v21, v22);
  if (!v25)
  {
    v39 = height >= 0.0;
    CGContextRestoreGState(c);
    goto LABEL_45;
  }
  v26 = (__CFDictionary *)v25;
  if (a7 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringByTrimmingTrailingCharactersInSet:forString:", v27, v20);
    v28 = objc_claimAutoreleasedReturnValue();

    v20 = (__CFString *)v28;
  }
  v64 = v23;
  if ((objc_msgSend(v23, "shouldComb") & 1) != 0)
  {
    objc_msgSend(v23, "valueForAnnotationKey:", CFSTR("/MaxLen"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (double)objc_msgSend(v29, "integerValue");

    if (!v21)
    {
      v31 = (void *)MEMORY[0x24BDF6A70];
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
      objc_msgSend(v31, "systemFontOfSize:");
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v69 = *MEMORY[0x24BDF65F8];
    v70[0] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString sizeWithAttributes:](v20, "sizeWithAttributes:", v32);
    v34 = v33;

    valuePtr.a = (width + -v34 / (double)(unint64_t)-[__CFString length](v20, "length") * v30) / v30;
    v35 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v36 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCGFloatType, &valuePtr);
    CFDictionarySetValue(v26, (const void *)*MEMORY[0x24BDC4F08], v36);
    CFRelease(v36);
    LODWORD(descent) = 0;
    v37 = CFNumberCreate(v35, kCFNumberIntType, &descent);
    CFDictionarySetValue(v26, (const void *)*MEMORY[0x24BDC4F18], v37);
    CFRelease(v37);
    v38 = valuePtr.a * 0.5;
  }
  else
  {
    v35 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v38 = 0.0;
  }
  cf = v26;
  v40 = CFAttributedStringCreate(v35, v20, v26);
  v41 = v40;
  if (v40)
  {
    v42 = CTTypesetterCreateWithAttributedString(v40);
    if (v42)
    {
      v43 = v42;
      Length = CFAttributedStringGetLength(v41);
      v45 = 0.0;
      v61 = v21;
      v62 = v22;
      if (a8 > 179)
      {
        if (a8 != 180)
        {
          if (a8 != 270)
            goto LABEL_26;
          CGContextTranslateCTM(c, x + width, y + height);
          v46 = -90.0;
          goto LABEL_22;
        }
        CGContextTranslateCTM(c, x + width, y);
        v48 = PDFDegToRad(180.0);
        CGContextRotateCTM(c, v48);
      }
      else
      {
        if (a8)
        {
          if (a8 != 90)
            goto LABEL_26;
          CGContextTranslateCTM(c, x, y);
          v46 = 90.0;
LABEL_22:
          v47 = PDFDegToRad(v46);
          CGContextRotateCTM(c, v47);
          v45 = height;
          goto LABEL_26;
        }
        CGContextTranslateCTM(c, x, y + height);
      }
      v45 = width;
LABEL_26:
      v49 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&valuePtr.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&valuePtr.c = v49;
      *(_OWORD *)&valuePtr.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      CGContextSetTextMatrix(c, &valuePtr);
      v50 = 0;
      v51 = 0.0;
      do
      {
        v52 = Length;
        if (v11)
          v52 = CTTypesetterSuggestLineBreak(v43, v50, v45);
        v71.location = v50;
        v71.length = v52;
        Line = CTTypesetterCreateLine(v43, v71);
        if (Line)
        {
          v54 = Line;
          descent = 0.0;
          valuePtr.a = 0.0;
          leading = 0.0;
          TypographicBounds = CTLineGetTypographicBounds(Line, &valuePtr.a, &descent, &leading);
          v56 = ceil(valuePtr.a);
          if (v51 == 0.0)
            v51 = v56 + 1.0;
          else
            v51 = v51 + v56 + ceil(descent);
          v57 = v45 - TypographicBounds;
          v58 = v57 * 0.5;
          v59 = v38 + v57;
          if (a7 != 2)
            v59 = v58;
          if (!a7)
            v59 = v38;
          CGContextSetTextPosition(c, round(v59), round(-v51));
          CTLineDraw(v54, c);
          CFRelease(v54);
        }
        v50 += v52;
      }
      while (v50 < Length);
      v39 = v51 <= height;
      v21 = v61;
      v22 = v62;
      goto LABEL_40;
    }
  }
  v43 = 0;
  v39 = height >= 0.0;
LABEL_40:
  CGContextRestoreGState(c);
  CFRelease(cf);
  if (v41)
    CFRelease(v41);
  if (v43)
    CFRelease(v43);
  v23 = v64;
LABEL_45:

  return v39;
}

+ (void)fillRect:(CGRect)a3 color:(id)a4 context:(CGContext *)a5
{
  id v6;
  id v7;
  CGColorSpace *ColorSpace;
  id v9;
  CGColor *v10;
  const CGFloat *Components;
  uint64_t v12;
  CGRect v13;

  if (a4)
  {
    v6 = a4;
    CGContextSaveGState(a5);
    v7 = objc_retainAutorelease(v6);
    ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v7, "CGColor"));
    v9 = objc_retainAutorelease(v7);
    v10 = (CGColor *)objc_msgSend(v9, "CGColor");

    Components = CGColorGetComponents(v10);
    CGContextSetFillColorSpace(a5, ColorSpace);
    CGContextSetFillColor(a5, Components);
    v13.origin.x = PDFRectToCGRect(v12);
    CGContextFillRect(a5, v13);
    CGContextRestoreGState(a5);
  }
}

+ (void)strokeRect:(CGRect)a3 color:(id)a4 context:(CGContext *)a5
{
  id v6;
  id v7;
  CGColorSpace *ColorSpace;
  id v9;
  CGColor *v10;
  const CGFloat *Components;
  uint64_t v12;
  CGRect v13;

  if (a4)
  {
    v6 = a4;
    CGContextSaveGState(a5);
    v7 = objc_retainAutorelease(v6);
    ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v7, "CGColor"));
    v9 = objc_retainAutorelease(v7);
    v10 = (CGColor *)objc_msgSend(v9, "CGColor");

    Components = CGColorGetComponents(v10);
    CGContextSetStrokeColorSpace(a5, ColorSpace);
    CGContextSetStrokeColor(a5, Components);
    v13.origin.x = PDFRectToCGRect(v12);
    CGContextStrokeRect(a5, v13);
    CGContextRestoreGState(a5);
  }
}

+ (void)fillOval:(CGRect)a3 color:(id)a4 context:(CGContext *)a5
{
  id v6;
  id v7;
  CGColorSpace *ColorSpace;
  id v9;
  CGColor *v10;
  const CGFloat *Components;
  uint64_t v12;
  CGRect v13;

  if (a4)
  {
    v6 = a4;
    CGContextSaveGState(a5);
    v7 = objc_retainAutorelease(v6);
    ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v7, "CGColor"));
    v9 = objc_retainAutorelease(v7);
    v10 = (CGColor *)objc_msgSend(v9, "CGColor");

    Components = CGColorGetComponents(v10);
    CGContextSetFillColorSpace(a5, ColorSpace);
    CGContextSetFillColor(a5, Components);
    v13.origin.x = PDFRectToCGRect(v12);
    CGContextFillEllipseInRect(a5, v13);
    CGContextRestoreGState(a5);
  }
}

+ (void)strokeOval:(CGRect)a3 color:(id)a4 context:(CGContext *)a5
{
  id v6;
  id v7;
  CGColorSpace *ColorSpace;
  id v9;
  CGColor *v10;
  const CGFloat *Components;
  uint64_t v12;
  CGRect v13;

  if (a4)
  {
    v6 = a4;
    CGContextSaveGState(a5);
    v7 = objc_retainAutorelease(v6);
    ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v7, "CGColor"));
    v9 = objc_retainAutorelease(v7);
    v10 = (CGColor *)objc_msgSend(v9, "CGColor");

    Components = CGColorGetComponents(v10);
    CGContextSetStrokeColorSpace(a5, ColorSpace);
    CGContextSetStrokeColor(a5, Components);
    v13.origin.x = PDFRectToCGRect(v12);
    CGContextStrokeEllipseInRect(a5, v13);
    CGContextRestoreGState(a5);
  }
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withUnknownAnnotation:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v8 = a5;
  v9 = v8;
  if ((unint64_t)a3 <= 4)
  {
    v11 = v8;
    v10 = objc_msgSend(v8, "appearance:", 0);
    v9 = v11;
    if (v10)
    {
      objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:", 0, v11, a3, a4);
      v9 = v11;
    }
  }

}

@end
