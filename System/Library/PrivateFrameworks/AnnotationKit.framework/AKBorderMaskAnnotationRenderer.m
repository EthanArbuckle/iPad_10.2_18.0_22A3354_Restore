@implementation AKBorderMaskAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF028];
  v4 = *(double *)(MEMORY[0x24BDBF028] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF028] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF028] + 24);
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
  uint64_t v11;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  CGFloat x;
  double v21;
  CGFloat y;
  double v23;
  CGFloat width;
  double v25;
  CGFloat height;
  void *v27;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  const CGPath *v41;
  void *v42;
  void *v43;
  double v44;
  uint64_t v45;
  id v46;
  id v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v7 = a5;
  v47 = a3;
  v10 = a6;
  CGContextSaveGState(a4);
  objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v47, v7, v10);
  objc_msgSend(v47, "rectangle");
  if (v10 && CGRectIsInfinite(*(CGRect *)&v11))
  {
    objc_msgSend(v10, "controller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "undoController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "undoManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "isUndoRegistrationEnabled");
    if (v18)
      objc_msgSend(v17, "disableUndoRegistration");
    objc_msgSend(v10, "maxPageRect");
    x = v19;
    y = v21;
    width = v23;
    height = v25;
    objc_msgSend(v10, "pageModelController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "cropAnnotation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v28, "rectangle");
      v55.origin.x = v29;
      v55.origin.y = v30;
      v55.size.width = v31;
      v55.size.height = v32;
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      v49 = CGRectIntersection(v48, v55);
      x = v49.origin.x;
      y = v49.origin.y;
      width = v49.size.width;
      height = v49.size.height;
    }
    objc_msgSend(v47, "originalModelBaseScaleFactor");
    v34 = v33 * 50.0;
    objc_msgSend(v47, "originalModelBaseScaleFactor");
    v36 = v35 * 10.0;
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    v37 = CGRectGetWidth(v50) * 0.5 - v36;
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    v38 = CGRectGetHeight(v51) * 0.5 - v36;
    if (v34 >= v37)
      v39 = v37;
    else
      v39 = v34;
    if (v34 >= v38)
      v40 = v38;
    else
      v40 = v34;
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = height;
    v53 = CGRectInset(v52, v39, v40);
    v54 = CGRectStandardize(v53);
    objc_msgSend(v47, "setRectangle:", v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
    if (v18)
      objc_msgSend(v17, "enableUndoRegistration");

  }
  v41 = (const CGPath *)objc_msgSend(a1, "_newClipMaskEOPathForAnnotation:", v47);
  objc_msgSend(v47, "fillColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (!v42 || (objc_msgSend(v42, "akAlphaComponent"), v44 < 0.01))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "akColorWithWhite:alpha:", 0.0, 0.33);
    v45 = objc_claimAutoreleasedReturnValue();

    v43 = (void *)v45;
  }
  v46 = objc_retainAutorelease(v43);
  CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v46, "CGColor"));
  CGContextAddPath(a4, v41);
  CGContextEOFillPath(a4);
  CGPathRelease(v41);
  CGContextRestoreGState(a4);

}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  return 0;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a4, "rectangle");
  v7.x = x;
  v7.y = y;
  return !CGRectContainsPoint(v8, v7);
}

+ (CGPath)_newClipMaskEOPathForAnnotation:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGPath *Mutable;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  objc_msgSend(a3, "rectangle");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  v14 = CGRectInset(v13, -100000000.0, -100000000.0);
  v7 = v14.origin.x;
  v8 = v14.origin.y;
  v9 = v14.size.width;
  v10 = v14.size.height;
  Mutable = CGPathCreateMutable();
  v15.origin.x = v7;
  v15.origin.y = v8;
  v15.size.width = v9;
  v15.size.height = v10;
  CGPathAddRect(Mutable, 0, v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  CGPathAddRect(Mutable, 0, v16);
  return Mutable;
}

@end
