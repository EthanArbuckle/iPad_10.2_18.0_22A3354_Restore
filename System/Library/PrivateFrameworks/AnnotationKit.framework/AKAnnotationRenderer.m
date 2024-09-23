@implementation AKAnnotationRenderer

+ (CGRect)drawingBoundsOfAnnotation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_rendererClassForAnnotation:", v4), "_concreteDrawingBoundsOfAnnotation:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (CGSize)draggingBoundsInsetsForAnnotation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_rendererClassForAnnotation:", v4), "_concreteDraggingBoundsInsetsForAnnotation:", v4);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (CGRect)textBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  v12 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_rendererClassForAnnotation:", v12), "_concreteTextBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", v12, v11, x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

+ (CGRect)rectangleForAnnotation:(id)a3 withTextBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_rendererClassForAnnotation:", v9), "_concreteRectangleForAnnotation:withTextBounds:", v9, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

+ (CGPath)newTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CGPath *v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = (CGPath *)objc_msgSend((id)objc_msgSend(a1, "_rendererClassForAnnotation:", v9), "_newConcreteTextExclusionPathForAnnotation:withOptionalAnnotationRect:", v9, x, y, width, height);

  return v10;
}

+ (void)renderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
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
  double v35;
  double v36;
  double v37;
  double Height;
  CGFloat v39;
  void (**v40)(_QWORD, _QWORD);
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  __int128 v45;
  __int128 v46;
  CGFloat sx[2];
  double sxa;
  CGFloat sxb;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_msgSend(a1, "_rendererClassForAnnotation:", v10);
  objc_msgSend(v10, "appearanceOverride");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13 && (v14 = (void *)v13, v15 = objc_msgSend(v10, "shouldUseAppearanceOverride"), v14, v15))
  {
    CGContextSaveGState(a4);
    objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v10, v7, v11);
    *(_OWORD *)sx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v56.a = *MEMORY[0x24BDBD8B8];
    v46 = *(_OWORD *)&v56.a;
    *(_OWORD *)&v56.c = *(_OWORD *)sx;
    *(_OWORD *)&v56.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    v45 = *(_OWORD *)&v56.tx;
    objc_msgSend(v10, "initialDrawingBoundsForAppearanceOverride");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_msgSend(v10, "drawingBounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v41 = v19;
    v42 = v17;
    +[AKGeometryHelper centerOfRect:](AKGeometryHelper, "centerOfRect:", v17, v19, v21, v23);
    v33 = v32;
    v35 = v34;
    +[AKGeometryHelper centerOfRect:](AKGeometryHelper, "centerOfRect:", v25, v27, v29, v31);
    v43 = v37;
    v44 = v36;
    CGAffineTransformMakeTranslation(&t2, v36 - v33, v37 - v35);
    *(_OWORD *)&t1.a = v46;
    *(_OWORD *)&t1.c = *(_OWORD *)sx;
    *(_OWORD *)&t1.tx = v45;
    CGAffineTransformConcat(&v56, &t1, &t2);
    if ((objc_msgSend(v10, "editsDisableAppearanceOverride") & 1) == 0)
    {
      v57.origin.x = v25;
      v57.origin.y = v27;
      v57.size.width = v29;
      v57.size.height = v31;
      sxa = CGRectGetWidth(v57);
      v58.origin.x = v42;
      v58.origin.y = v41;
      v58.size.width = v21;
      v58.size.height = v23;
      sxb = sxa / CGRectGetWidth(v58);
      v59.origin.x = v25;
      v59.origin.y = v27;
      v59.size.width = v29;
      v59.size.height = v31;
      Height = CGRectGetHeight(v59);
      v60.origin.x = v42;
      v60.origin.y = v41;
      v60.size.width = v21;
      v60.size.height = v23;
      v39 = Height / CGRectGetHeight(v60);
      CGAffineTransformMakeTranslation(&v53, -v44, -v43);
      v52 = v56;
      CGAffineTransformConcat(&t1, &v52, &v53);
      v56 = t1;
      CGAffineTransformMakeScale(&v51, sxb, v39);
      v52 = v56;
      CGAffineTransformConcat(&t1, &v52, &v51);
      v56 = t1;
      CGAffineTransformMakeTranslation(&v50, v44, v43);
      v52 = v56;
      CGAffineTransformConcat(&t1, &v52, &v50);
      v56 = t1;
    }
    t1 = v56;
    CGContextConcatCTM(a4, &t1);
    objc_msgSend(v10, "appearanceOverride");
    v40 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, CGContext *))v40)[2](v40, a4);

    CGContextRestoreGState(a4);
  }
  else
  {
    objc_msgSend(v12, "_concreteRenderAnnotation:intoContext:forDisplay:pageControllerOrNil:", v10, a4, v7, v11);
  }

}

+ (BOOL)pointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  double y;
  double x;
  id v9;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  LOBYTE(a1) = objc_msgSend((id)objc_msgSend(a1, "_rendererClassForAnnotation:", v9), "_concretePointIsOnBorder:ofAnnotation:minimumBorderThickness:", v9, x, y, a5);

  return (char)a1;
}

+ (BOOL)pointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  double y;
  double x;
  id v7;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  LOBYTE(a1) = objc_msgSend((id)objc_msgSend(a1, "_rendererClassForAnnotation:", v7), "_concretePointIsOnInside:ofAnnotation:", v7, x, y);

  return (char)a1;
}

+ (BOOL)annotationShouldAvoidRedrawDuringLiveResize:(id)a3
{
  return 0;
}

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), "+[AKAnnotationRenderer _concreteDrawingBoundsOfAnnotation:]");
  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), "+[AKAnnotationRenderer _concreteDraggingBoundsInsetsForAnnotation:]");
  v3 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGRect)_concreteTextBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, "+[AKAnnotationRenderer _concreteTextBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:]");
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (CGRect)_concreteRectangleForAnnotation:(id)a3 withTextBounds:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, "+[AKAnnotationRenderer _concreteRectangleForAnnotation:withTextBounds:]");
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, "+[AKAnnotationRenderer _newConcreteTextExclusionPathForAnnotation:withOptionalAnnotationRect:]");
  return 0;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), a5, a6, "+[AKAnnotationRenderer _concreteRenderAnnotation:intoContext:forDisplay:pageControllerOrNil:]");
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), a3.x, a3.y, a5, "+[AKAnnotationRenderer _concretePointIsOnBorder:ofAnnotation:minimumBorderThickness:]");
  return 0;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), a3.x, a3.y, "+[AKAnnotationRenderer _concretePointIsOnInside:ofAnnotation:]");
  return 0;
}

+ (void)_transformContextToModelCoordinates:(CGContext *)a3 forAnnotation:(id)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat sx;

  sx = 0.0;
  +[AKGeometryHelper effectiveDrawingBoundsForAnnotation:forDisplay:pageControllerOrNil:outScaleFactor:](AKGeometryHelper, "effectiveDrawingBoundsForAnnotation:forDisplay:pageControllerOrNil:outScaleFactor:", a4, a5, a6, &sx);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  CGContextScaleCTM(a3, sx, sx);
  if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", v8, v10, v12, v14))CGContextTranslateCTM(a3, -v8, -v10);
}

+ (void)_testRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double MinX;
  double v28;
  CGFloat MinY;
  CGFloat MaxY;
  id v31;
  double v32;
  CGFloat v33;
  CGFloat MaxX;
  id v35;
  id v36;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  CGAffineTransform v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  memset(&v49, 0, sizeof(v49));
  CGContextGetCTM(&v49, a4);
  v12 = sqrt(v49.c * v49.c + v49.a * v49.a);
  v13 = sqrt(v49.d * v49.d + v49.b * v49.b);
  objc_msgSend(v10, "drawingBounds");
  v46 = v15;
  v47 = v14;
  v44 = v17;
  v45 = v16;
  objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v10, v7, v11);
  CGContextScaleCTM(a4, 1.0 / v12, 1.0 / v13);
  CGContextTranslateCTM(a4, 0.5, 0.5);
  CGContextScaleCTM(a4, v12, v13);
  v48 = 0.0;
  +[AKGeometryHelper effectiveDrawingBoundsForAnnotation:forDisplay:pageControllerOrNil:outScaleFactor:](AKGeometryHelper, "effectiveDrawingBoundsForAnnotation:forDisplay:pageControllerOrNil:outScaleFactor:", v10, v7, v11, &v48);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v42 = v48;
  v26 = v12 * v48;
  CGContextSetLineWidth(a4, 1.0 / (v12 * v48));
  v50.origin.x = v19;
  v50.origin.y = v21;
  v50.size.width = v23;
  v50.size.height = v25;
  MinX = CGRectGetMinX(v50);
  v51.origin.x = v19;
  v51.origin.y = v21;
  v51.size.width = v23;
  v51.size.height = v25;
  if (MinX < CGRectGetMaxX(v51))
  {
    v28 = 3.0 / v26;
    do
    {
      v52.origin.x = v19;
      v52.origin.y = v21;
      v52.size.width = v23;
      v52.size.height = v25;
      MinY = CGRectGetMinY(v52);
      CGContextMoveToPoint(a4, MinX, MinY);
      v53.origin.x = v19;
      v53.origin.y = v21;
      v53.size.width = v23;
      v53.size.height = v25;
      MaxY = CGRectGetMaxY(v53);
      CGContextAddLineToPoint(a4, MinX, MaxY);
      MinX = v28 + MinX;
      v54.origin.x = v19;
      v54.origin.y = v21;
      v54.size.width = v23;
      v54.size.height = v25;
    }
    while (MinX < CGRectGetMaxX(v54));
  }
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor", *(_QWORD *)&v42);
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v31, "CGColor"));

  CGContextStrokePath(a4);
  v55.origin.x = v19;
  v55.origin.y = v21;
  v55.size.width = v23;
  v55.size.height = v25;
  v32 = CGRectGetMinY(v55);
  v56.origin.x = v19;
  v56.origin.y = v21;
  v56.size.width = v23;
  v56.size.height = v25;
  if (v32 < CGRectGetMaxY(v56))
  {
    do
    {
      v57.origin.x = v19;
      v57.origin.y = v21;
      v57.size.width = v23;
      v57.size.height = v25;
      v33 = CGRectGetMinX(v57);
      CGContextMoveToPoint(a4, v33, v32);
      v58.origin.x = v19;
      v58.origin.y = v21;
      v58.size.width = v23;
      v58.size.height = v25;
      MaxX = CGRectGetMaxX(v58);
      CGContextAddLineToPoint(a4, MaxX, v32);
      v32 = 3.0 / (v13 * v43) + v32;
      v59.origin.x = v19;
      v59.origin.y = v21;
      v59.size.width = v23;
      v59.size.height = v25;
    }
    while (v32 < CGRectGetMaxY(v59));
  }
  objc_msgSend(MEMORY[0x24BDF6950], "blueColor");
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v35, "CGColor"));

  CGContextStrokePath(a4);
  objc_msgSend(MEMORY[0x24BDF6950], "redColor");
  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v36, "CGColor"));

  v60.origin.x = v47;
  v60.origin.y = v46;
  v60.size.width = v45;
  v60.size.height = v44;
  CGContextStrokeRect(a4, v60);
  v61.origin.x = v47;
  v61.origin.y = v46;
  v61.size.width = v45;
  v61.size.height = v44;
  v62 = CGRectInset(v61, 5.0, 5.0);
  x = v62.origin.x;
  y = v62.origin.y;
  width = v62.size.width;
  height = v62.size.height;
  objc_msgSend(MEMORY[0x24BDF6950], "yellowColor");
  v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v41, "CGColor"));

  v63.origin.x = x;
  v63.origin.y = y;
  v63.size.width = width;
  v63.size.height = height;
  CGContextStrokeRect(a4, v63);

}

+ (Class)_rendererClassForAnnotation:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_10:
    v4 = (void *)objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

@end
