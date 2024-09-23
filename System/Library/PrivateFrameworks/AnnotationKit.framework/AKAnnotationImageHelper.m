@implementation AKAnnotationImageHelper

+ (id)imageForShapeTag:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((unint64_t)(a3 - 764000) > 0x15)
    v3 = 0;
  else
    v3 = off_24F1A7EE0[a3 - 764000];
  v4 = (void *)MEMORY[0x24BDF6AC8];
  +[AKController akBundle](AKController, "akBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", v3, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)imageOfSize:(CGSize)a3 forAnnotationTag:(int64_t)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  AKOvalAnnotation *v9;
  int64_t v10;
  uint64_t v11;
  AKOvalAnnotation *v12;
  double MinX;
  double MidX;
  double MaxX;
  void *v16;
  CGFloat v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = a4 - 764000;
  v11 = 0;
  switch(v10)
  {
    case 0:
      v12 = (AKOvalAnnotation *)objc_opt_new();
      v9 = v12;
      goto LABEL_4;
    case 2:
      v9 = objc_alloc_init(AKOvalAnnotation);
      -[AKStrokedAnnotation setHasShadow:](v9, "setHasShadow:", 0);
      v12 = v9;
LABEL_4:
      -[AKShapeAnnotation setFillColor:](v12, "setFillColor:", v8);
      -[AKStrokedAnnotation setStrokeWidth:](v9, "setStrokeWidth:", 1.5);
      -[AKStrokedAnnotation setStrokeColor:](v9, "setStrokeColor:", v7);
      -[AKRectangularShapeAnnotation setRectangle:](v9, "setRectangle:", 0.0, 0.0, width, height);
      break;
    case 3:
      goto LABEL_7;
    case 4:
      v11 = 1;
      goto LABEL_7;
    case 5:
      v11 = 2;
LABEL_7:
      v9 = (AKOvalAnnotation *)objc_opt_new();
      -[AKOvalAnnotation setArrowHeadStyle:](v9, "setArrowHeadStyle:", v11);
      -[AKStrokedAnnotation setStrokeWidth:](v9, "setStrokeWidth:", 1.5);
      -[AKStrokedAnnotation setStrokeColor:](v9, "setStrokeColor:", v7);
      v19.origin.x = 0.0;
      v19.origin.y = 0.0;
      v19.size.width = width;
      v19.size.height = height;
      MinX = CGRectGetMinX(v19);
      v20.origin.x = 0.0;
      v20.origin.y = 0.0;
      v20.size.width = width;
      v20.size.height = height;
      -[AKOvalAnnotation setStartPoint:](v9, "setStartPoint:", MinX, CGRectGetMinY(v20));
      v21.origin.x = 0.0;
      v21.origin.y = 0.0;
      v21.size.width = width;
      v21.size.height = height;
      MidX = CGRectGetMidX(v21);
      v22.origin.x = 0.0;
      v22.origin.y = 0.0;
      v22.size.width = width;
      v22.size.height = height;
      -[AKOvalAnnotation setMidPoint:](v9, "setMidPoint:", MidX, CGRectGetMidY(v22));
      v23.origin.x = 0.0;
      v23.origin.y = 0.0;
      v23.size.width = width;
      v23.size.height = height;
      MaxX = CGRectGetMaxX(v23);
      v24.origin.x = 0.0;
      v24.origin.y = 0.0;
      v24.size.width = width;
      v24.size.height = height;
      -[AKOvalAnnotation setEndPoint:](v9, "setEndPoint:", MaxX, CGRectGetMaxY(v24));
      break;
    case 7:
      v9 = (AKOvalAnnotation *)objc_opt_new();
      -[AKRectangularShapeAnnotation setRectangle:](v9, "setRectangle:", 0.0, 0.0, width, height);
      -[AKRectangularShapeAnnotation rectangle](v9, "rectangle");
      v18 = CGRectGetMinX(v25) + -10.0;
      -[AKRectangularShapeAnnotation rectangle](v9, "rectangle");
      -[AKOvalAnnotation setPointyBitPoint:](v9, "setPointyBitPoint:", v18, CGRectGetMinY(v26) + -10.0);
      -[AKShapeAnnotation setFillColor:](v9, "setFillColor:", v8);
      -[AKStrokedAnnotation setStrokeColor:](v9, "setStrokeColor:", v7);
      -[AKStrokedAnnotation setStrokeWidth:](v9, "setStrokeWidth:", 1.5);
      -[AKOvalAnnotation setPointyBitBaseWidthAngle:](v9, "setPointyBitBaseWidthAngle:", 25.0);
      break;
    case 8:
      v9 = (AKOvalAnnotation *)objc_opt_new();
      -[AKRectangularShapeAnnotation setRectangle:](v9, "setRectangle:", 0.0, 0.0, width, height);
      -[AKShapeAnnotation setFillColor:](v9, "setFillColor:", v8);
      -[AKStrokedAnnotation setStrokeWidth:](v9, "setStrokeWidth:", 1.5);
      -[AKStrokedAnnotation setStrokeColor:](v9, "setStrokeColor:", v7);
      -[AKOvalAnnotation setPointCount:](v9, "setPointCount:", 5);
      +[AKStarAnnotationRenderer defaultInnerRadiusForStar:](AKStarAnnotationRenderer, "defaultInnerRadiusForStar:", v9);
      -[AKOvalAnnotation setInnerRadiusFactor:](v9, "setInnerRadiusFactor:");
      break;
    default:
      break;
  }
  -[AKAnnotation setOriginalModelBaseScaleFactor:](v9, "setOriginalModelBaseScaleFactor:", 1.0);
  -[AKAnnotation setOriginalExifOrientation:](v9, "setOriginalExifOrientation:", 1);
  objc_msgSend((id)objc_opt_class(), "_imageOfSize:forAnnotation:strokeWidth:withFillColor:", v9, 0, width, height, 1.5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)imageOfSize:(CGSize)a3 forAnnotation:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;

  height = a3.height;
  width = a3.width;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "_imageOfSize:forAnnotation:strokeWidth:withFillColor:", v6, 1, width, height, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_imageOfSize:(CGSize)a3 forAnnotation:(id)a4 strokeWidth:(double)a5 withFillColor:(BOOL)a6
{
  _BOOL4 v6;
  CGFloat height;
  double width;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  CGContext *CurrentContext;
  void *v18;
  CGSize v20;

  v6 = a6;
  height = a3.height;
  width = a3.width;
  v10 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "setHasShadow:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "setStrokeWidth:", a5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "setDashed:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performSelector:withObject:", sel_setStrokeColor_, v11);

    }
    if (v6
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "akColorWithWhite:alpha:", 0.2, 0.2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performSelector:withObject:", sel_setFillColor_, v12);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6778]), "initWithString:", &stru_24F1A83D0);
      objc_msgSend(v10, "performSelector:withObject:", sel_setAnnotationText_, v13);

    }
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  v16 = v15;
  v20.width = width;
  v20.height = height;
  UIGraphicsBeginImageContextWithOptions(v20, 0, v16);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, 0.0, height);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  objc_msgSend((id)objc_opt_class(), "_drawFilledShapeImageForAnnotation:inRect:inContext:", v10, CurrentContext, 0.0, 0.0, width, height);
  UIGraphicsGetImageFromCurrentImageContext();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v18;
}

+ (void)_drawFilledShapeImageForAnnotation:(id)a3 inRect:(CGRect)a4 inContext:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double MidX;
  CGSize v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  CGAffineTransform transform;
  CGAffineTransform v41;
  CGSize v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  CGContextSaveGState(a5);
  v11 = objc_msgSend(v10, "originalExifOrientation");
  objc_getAssociatedObject(v10, CFSTR("com.apple.AnnotationKit.AnnotationImageHelperAdditionalExifHintKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v11 = objc_msgSend(v12, "integerValue");
  memset(&v41, 0, sizeof(v41));
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  MidX = CGRectGetMidX(v43);
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v11, MidX, CGRectGetMidY(v44));
  transform = v41;
  CGContextConcatCTM(a5, &transform);
  v42.width = 1.0;
  v42.height = 1.0;
  v15 = CGContextConvertSizeToDeviceSpace(a5, v42);
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  v46 = CGRectInset(v45, 4.0, 4.0);
  v16 = v46.size.width;
  v17 = v46.size.height;
  +[AKAnnotationRenderer drawingBoundsOfAnnotation:](AKAnnotationRenderer, "drawingBoundsOfAnnotation:", v10, v46.origin.x, v46.origin.y);
  v37 = width;
  v38 = height;
  v22 = v18;
  v23 = v19;
  v24 = v20;
  v25 = v21;
  if (v16 / v20 >= v17 / v21)
    v26 = v17 / v21;
  else
    v26 = v16 / v20;
  v27 = CGRectGetWidth(*(CGRect *)&v18) * v26;
  v39 = v22;
  v47.origin.x = v22;
  v47.origin.y = v23;
  v47.size.width = v24;
  v47.size.height = v25;
  v28 = CGRectGetHeight(v47) * v26;
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = v37;
  v48.size.height = v38;
  v29 = (CGRectGetWidth(v48) - v27) * 0.5;
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = v37;
  v49.size.height = v38;
  v30 = CGRectGetHeight(v49);
  CGContextTranslateCTM(a5, v29, (v30 - v28) * 0.5);
  CGContextScaleCTM(a5, v26, v26);
  *(_QWORD *)&v31 = *(_OWORD *)&CGContextConvertSizeToUserSpace(a5, v15);
  v32 = v10;
  v33 = v32;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v33 = (void *)objc_msgSend(v32, "copy");

    objc_msgSend(v33, "strokeWidth");
    if (v34 == 0.0)
      v34 = 1.0;
    objc_msgSend(v33, "setStrokeWidth:", v31 * v34, *(_QWORD *)&v37, *(_QWORD *)&v38);
  }
  +[AKAnnotationRenderer drawingBoundsOfAnnotation:](AKAnnotationRenderer, "drawingBoundsOfAnnotation:", v33, *(_QWORD *)&v37, *(_QWORD *)&v38);
  CGContextTranslateCTM(a5, v35 - v39, v36 - v23);
  +[AKAnnotationRenderer renderAnnotation:intoContext:forDisplay:pageControllerOrNil:](AKAnnotationRenderer, "renderAnnotation:intoContext:forDisplay:pageControllerOrNil:", v33, a5, 0, 0);
  CGContextRestoreGState(a5);

}

+ (id)imageOfSize:(CGSize)a3 forPath:(id)a4
{
  double height;
  double width;
  void *v6;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  CGContextRef CurrentContext;
  void *v12;
  CGSize v14;

  height = a3.height;
  width = a3.width;
  v6 = (void *)MEMORY[0x24BDF6D38];
  v7 = a4;
  objc_msgSend(v6, "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;
  v14.width = width;
  v14.height = height;
  UIGraphicsBeginImageContextWithOptions(v14, 0, v10);

  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend((id)objc_opt_class(), "_drawImageForPath:inRect:inContext:", v7, CurrentContext, 0.0, 0.0, width, height);

  UIGraphicsGetImageFromCurrentImageContext();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v12;
}

+ (void)_drawImageForPath:(id)a3 inRect:(CGRect)a4 inContext:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize v18;
  CGFloat MidX;
  CGFloat MidY;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  void *v25;
  CGFloat v26;
  CGSize v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  objc_msgSend(v10, "bounds");
  v26 = v11;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  CGContextSaveGState(a5);
  v27.width = 1.0;
  v27.height = 1.0;
  v18 = CGContextConvertSizeToDeviceSpace(a5, v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  MidX = CGRectGetMidX(v28);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  MidY = CGRectGetMidY(v29);
  CGContextTranslateCTM(a5, MidX, MidY);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v31 = CGRectInset(v30, 3.0, 3.0);
  v21 = v31.size.width / v15;
  if (v31.size.width / v15 >= v31.size.height / v17)
    v21 = v31.size.height / v17;
  CGContextScaleCTM(a5, v21, v21);
  v32.origin.x = v26;
  v32.origin.y = v13;
  v32.size.width = v15;
  v32.size.height = v17;
  v22 = -CGRectGetMidX(v32);
  v33.origin.x = v26;
  v33.origin.y = v13;
  v33.size.width = v15;
  v33.size.height = v17;
  v23 = CGRectGetMidY(v33);
  CGContextTranslateCTM(a5, v22, -v23);
  *(_QWORD *)&v24 = *(_OWORD *)&CGContextConvertSizeToUserSpace(a5, v18);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "set");

  objc_msgSend(v10, "setLineWidth:", v24);
  objc_msgSend(v10, "stroke");

  CGContextRestoreGState(a5);
}

+ (id)imageOfSize:(CGSize)a3 withFillColor:(id)a4 forSignature:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGContext *CurrentContext;
  CGAffineTransform v21;
  CGSize v22;

  height = a3.height;
  width = a3.width;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "path") && !CGPathIsEmpty((CGPathRef)objc_msgSend(v9, "path")))
  {
    objc_msgSend(v9, "pathBounds");
    v14 = v13;
    v16 = v15;
    if (width / v11 >= height / v12)
      v17 = height / v12;
    else
      v17 = width / v11;
    v22.width = (double)(uint64_t)ceil(v11 * v17);
    v18 = (double)(uint64_t)ceil(v12 * v17);
    v22.height = v18;
    UIGraphicsBeginImageContextWithOptions(v22, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    v21.b = 0.0;
    v21.c = 0.0;
    v21.a = 1.0;
    *(_OWORD *)&v21.d = xmmword_2290937C0;
    v21.ty = v18;
    CGContextConcatCTM(CurrentContext, &v21);
    objc_msgSend((id)objc_opt_class(), "_drawImageForSignature:withFillColor:scale:pathOffset:inContext:", v9, v8, CurrentContext, v17, v14, v16);
    UIGraphicsGetImageFromCurrentImageContext();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)_drawImageForSignature:(id)a3 withFillColor:(id)a4 scale:(double)a5 pathOffset:(CGPoint)a6 inContext:(CGContext *)a7
{
  double y;
  double x;
  id v12;
  id v13;
  CGColor *v14;
  id v15;

  y = a6.y;
  x = a6.x;
  v15 = a3;
  v12 = a4;
  CGContextSaveGState(a7);
  CGContextScaleCTM(a7, a5, a5);
  CGContextTranslateCTM(a7, -x, -y);
  v13 = objc_retainAutorelease(v12);
  v14 = (CGColor *)objc_msgSend(v13, "CGColor");

  CGContextSetFillColorWithColor(a7, v14);
  if (objc_msgSend(v15, "path"))
  {
    CGContextAddPath(a7, (CGPathRef)objc_msgSend(v15, "path"));
    CGContextFillPath(a7);
  }
  CGContextRestoreGState(a7);

}

+ (CGImage)createImageOfAnnotation:(id)a3 withScale:(double)a4
{
  id v5;
  CGColorSpaceRef v6;
  CGColorSpace *v7;
  double v8;
  size_t v9;
  double v10;
  CGContext *v11;
  CGContext *v12;
  CGImage *Image;

  v5 = a3;
  v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v5, "drawingBounds");
    v9 = vcvtpd_u64_f64(v8 * a4);
    v11 = CGBitmapContextCreate(0, v9, vcvtpd_u64_f64(v10 * a4), 8uLL, 4 * v9, v7, 2u);
    if (v11)
    {
      v12 = v11;
      CGContextScaleCTM(v11, a4, a4);
      +[AKAnnotationRenderer renderAnnotation:intoContext:forDisplay:pageControllerOrNil:](AKAnnotationRenderer, "renderAnnotation:intoContext:forDisplay:pageControllerOrNil:", v5, v12, 0, 0);
      Image = CGBitmapContextCreateImage(v12);
      CGContextRelease(v12);
    }
    else
    {
      Image = 0;
    }
    CGColorSpaceRelease(v7);
  }
  else
  {
    Image = 0;
  }

  return Image;
}

@end
