@implementation AKLoupeAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double x;
  double y;
  double width;
  double height;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "rectangle");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "strokeWidth");
  v13 = v12 * -0.5;
  v30.origin.x = v5;
  v30.origin.y = v7;
  v30.size.width = v9;
  v30.size.height = v11;
  v31 = CGRectInset(v30, v13, v13);
  x = v31.origin.x;
  y = v31.origin.y;
  width = v31.size.width;
  height = v31.size.height;
  if (objc_msgSend(v3, "hasShadow"))
  {
    +[AKAnnotationRendererUtilities outsetRectForShadow:onAnnotation:](AKAnnotationRendererUtilities, "outsetRectForShadow:onAnnotation:", v3, x, y, width, height);
    x = v18;
    y = v19;
    width = v20;
    height = v21;
  }
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v33 = CGRectInset(v32, -1.0, -1.0);
  v22 = v33.origin.x;
  v23 = v33.origin.y;
  v24 = v33.size.width;
  v25 = v33.size.height;

  v26 = v22;
  v27 = v23;
  v28 = v24;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  int v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  CGPDFPage *Page;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  id v31;
  id v32;
  CGColor *v33;
  id v34;
  CGImage *v35;
  const __CFData *v36;
  void *v37;
  void *v38;
  const __CFData *v39;
  CGDataProvider *v40;
  CGDataProvider *v41;
  CGPDFDocument *v42;
  AKPDFDocumentWrapper *v43;
  void *v44;
  void *v45;
  CGPDFDocument *v46;
  id v47;
  CGFloat MinX;
  CGFloat MinY;
  CGInterpolationQuality v50;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v55;
  double v56;
  void *v57;
  const CGPath *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  AKTSDShape *v63;
  id v64;
  _QWORD v65[2];
  _QWORD v66[3];
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect BoxRect;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v7 = a5;
  v66[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  CGContextSaveGState(a4);
  objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v10, v7, v11);

  v12 = objc_msgSend(v10, "hasShadow");
  if (v12)
    +[AKAnnotationRendererUtilities beginShadowInContext:forAnnotation:](AKAnnotationRendererUtilities, "beginShadowInContext:forAnnotation:", a4, v10);
  objc_msgSend(v10, "rectangle");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_getAssociatedObject(v10, off_255A24928);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_setAssociatedObject(v10, CFSTR("AKLoupeAnnotationRendererPDFDocumentWrapperDict"), 0, (void *)0x301);
    Page = 0;
LABEL_5:
    CGContextSaveGState(a4);
    objc_msgSend((id)objc_opt_class(), "innerClipRect:", v10);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v31, "CGColor"));

    v67.origin.x = v14;
    v67.origin.y = v16;
    v67.size.width = v18;
    v67.size.height = v20;
    CGContextFillRect(a4, v67);
    v68.origin.x = v24;
    v68.origin.y = v26;
    v68.size.width = v28;
    v68.size.height = v30;
    CGContextAddEllipseInRect(a4, v68);
    CGContextClip(a4);
    objc_msgSend(v10, "strokeColor");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = (CGColor *)objc_msgSend(v32, "CGColor");

    if (!v33 || vabdd_f64(0.0, CGColorGetAlpha(v33)) < 0.0005)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
      v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v33 = (CGColor *)objc_msgSend(v34, "CGColor");

    }
    CGContextSetStrokeColorWithColor(a4, v33);
    v69.origin.x = v14;
    v69.origin.y = v16;
    v69.size.width = v18;
    v69.size.height = v20;
    CGContextStrokeEllipseInRect(a4, v69);
    if (v21)
    {
      CGContextSetInterpolationQuality(a4, kCGInterpolationNone);
      v35 = (CGImage *)objc_msgSend(v21, "akCGImage");
      v70.origin.x = v14;
      v70.origin.y = v16;
      v70.size.width = v18;
      v70.size.height = v20;
      CGContextDrawImage(a4, v70, v35);
    }
    else
    {
      CGContextSaveGState(a4);
      v71.origin.x = v24;
      v71.origin.y = v26;
      v71.size.width = v28;
      v71.size.height = v30;
      v72 = CGRectInset(v71, 0.1, 0.1);
      CGContextAddEllipseInRect(a4, v72);
      CGContextClip(a4);
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v47, "CGColor"));

      v73.origin.x = v14;
      v73.origin.y = v16;
      v73.size.width = v18;
      v73.size.height = v20;
      CGContextFillRect(a4, v73);
      CGContextRestoreGState(a4);
      v74.origin.x = v14;
      v74.origin.y = v16;
      v74.size.width = v18;
      v74.size.height = v20;
      MinX = CGRectGetMinX(v74);
      v75.origin.x = v14;
      v75.origin.y = v16;
      v75.size.width = v18;
      v75.size.height = v20;
      MinY = CGRectGetMinY(v75);
      CGContextTranslateCTM(a4, MinX, MinY);
      v50 = kCGInterpolationNone;
      BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
      x = BoxRect.origin.x;
      y = BoxRect.origin.y;
      width = BoxRect.size.width;
      height = BoxRect.size.height;
      CGContextScaleCTM(a4, v18 / BoxRect.size.width, v20 / BoxRect.size.height);
      v77.origin.x = x;
      v77.origin.y = y;
      v77.size.width = width;
      v77.size.height = height;
      CGContextClipToRect(a4, v77);
      objc_msgSend(v10, "magnification");
      if (v55 < 3.0)
      {
        objc_msgSend(v10, "magnification");
        if (v56 == 2.0)
          v50 = kCGInterpolationNone;
        else
          v50 = kCGInterpolationHigh;
      }
      CGContextSetInterpolationQuality(a4, v50);
      CGContextSetShouldSmoothFonts(a4, 0);
      CGContextSetShouldSubpixelPositionFonts(a4, 1);
      CGContextSetShouldSubpixelQuantizeFonts(a4, 1);
      CGContextDrawPDFPage(a4, Page);
    }
    CGContextRestoreGState(a4);
    goto LABEL_28;
  }
  objc_msgSend(v10, "imageData");
  v36 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v10, CFSTR("AKLoupeAnnotationRendererPDFDocumentWrapperDict"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (!v37
    || (objc_msgSend(v37, "objectForKey:", CFSTR("imageData")),
        v39 = (const __CFData *)objc_claimAutoreleasedReturnValue(),
        v39,
        v39 != v36))
  {
    if (v36)
    {
      v40 = CGDataProviderCreateWithCFData(v36);
      if (v40)
      {
        v41 = v40;
        v42 = CGPDFDocumentCreateWithProvider(v40);
        CGDataProviderRelease(v41);
        if (v42)
        {
          v43 = -[AKPDFDocumentWrapper initWithPDF:]([AKPDFDocumentWrapper alloc], "initWithPDF:", v42);
          CGPDFDocumentRelease(v42);
          v65[0] = CFSTR("imageData");
          v65[1] = CFSTR("pdfDocumentWrapper");
          v66[0] = v36;
          v66[1] = v43;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          objc_setAssociatedObject(v10, CFSTR("AKLoupeAnnotationRendererPDFDocumentWrapperDict"), v44, (void *)0x301);
          v38 = v44;
        }
      }
    }
    if (!v38)
      goto LABEL_21;
  }
  objc_msgSend(v38, "objectForKey:", CFSTR("pdfDocumentWrapper"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (CGPDFDocument *)objc_msgSend(v45, "pdfDocument");

  if (!v46 || !CGPDFDocumentGetNumberOfPages(v46))
  {
LABEL_21:

    goto LABEL_28;
  }
  Page = CGPDFDocumentGetPage(v46, 1uLL);

  if (Page)
    goto LABEL_5;
LABEL_28:
  objc_msgSend(v10, "strokeColor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    if (!objc_msgSend(v10, "brushStyle"))
    {
      objc_msgSend(v10, "strokeColor");
      v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v64, "CGColor"));

      objc_msgSend(v10, "strokeWidth");
      +[AKAnnotationRendererUtilities setStandardLineStateInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineStateInContext:forLineWidth:", a4);
      if (objc_msgSend(v10, "isDashed"))
      {
        objc_msgSend(v10, "strokeWidth");
        +[AKAnnotationRendererUtilities setStandardLineDashInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineDashInContext:forLineWidth:", a4);
      }
      v79.origin.x = v14;
      v79.origin.y = v16;
      v79.size.width = v18;
      v79.size.height = v20;
      CGContextStrokeEllipseInRect(a4, v79);
      if (v12)
        goto LABEL_32;
      goto LABEL_33;
    }
    v78.origin.x = v14;
    v78.origin.y = v16;
    v78.size.width = v18;
    v78.size.height = v20;
    v58 = CGPathCreateWithEllipseInRect(v78, 0);
    v59 = objc_msgSend(v10, "brushStyle");
    objc_msgSend(v10, "strokeColor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "strokeWidth");
    +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    +[AKTSDBezierPath bezierPathWithCGPath:](AKTSDBezierPath, "bezierPathWithCGPath:", v58);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_alloc_init(AKTSDShape);
    -[AKTSDShape setStroke:](v63, "setStroke:", v61);
    -[AKTSDShape setPath:](v63, "setPath:", v62);
    -[AKTSDShape drawInContext:](v63, "drawInContext:", a4);
    CGPathRelease(v58);

  }
  if (v12)
LABEL_32:
    +[AKAnnotationRendererUtilities endShadowInContext:](AKAnnotationRendererUtilities, "endShadowInContext:", a4);
LABEL_33:
  CGContextRestoreGState(a4);

}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  CGFloat y;
  CGFloat x;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  const CGPath *v18;
  BOOL v19;
  CGPoint v21;
  CGRect v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_msgSend(v7, "strokeWidth");
  v9 = v8 * -0.5;
  objc_msgSend(v7, "rectangle");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v22.origin.x = v11;
  v22.origin.y = v13;
  v22.size.width = v15;
  v22.size.height = v17;
  v23 = CGRectInset(v22, v9, v9);
  v18 = CGPathCreateWithEllipseInRect(v23, 0);
  v21.x = x;
  v21.y = y;
  v19 = CGPathContainsPoint(v18, 0, v21, 0);
  CGPathRelease(v18);
  return v19;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  return 0;
}

+ (CGRect)innerClipRect:(id)a3
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  CGRect v14;

  v3 = a3;
  objc_msgSend(v3, "rectangle");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "strokeWidth");
  v13 = v12;

  v14.origin.x = v5;
  v14.origin.y = v7;
  v14.size.width = v9;
  v14.size.height = v11;
  return CGRectInset(v14, v13 * 0.5, v13 * 0.5);
}

@end
