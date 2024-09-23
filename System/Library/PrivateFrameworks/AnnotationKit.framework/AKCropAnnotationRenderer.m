@implementation AKCropAnnotationRenderer

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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const CGPath *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  const CGPath *v22;
  double v23;
  CGPoint points;
  double v25;
  double y;
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
  double v38;
  uint64_t v39;
  CGRect v40;

  v7 = a5;
  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  if ((objc_msgSend(v10, "hidden") & 1) == 0)
  {
    CGContextSaveGState(a4);
    objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v10, v7, v11);
    v23 = 1.0;
    objc_msgSend(a1, "_pixelAlignedBaseRect:interiorRect:scaleFactor:forAnnotation:withPageController:", 0, 0, &v23, v10, v11);
    objc_msgSend(v10, "rectangle");
    if (CGRectIsInfinite(v40))
    {
      objc_msgSend(v11, "controller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "undoController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "undoManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "isUndoRegistrationEnabled");
      if (v15)
        objc_msgSend(v14, "disableUndoRegistration");
      objc_msgSend(v11, "maxPageRect");
      objc_msgSend(v10, "setRectangle:");
      if (v15)
        objc_msgSend(v14, "enableUndoRegistration");

    }
    v16 = (const CGPath *)objc_msgSend(a1, "_newClipMaskEOPathForAnnotation:withPageController:", v10, v11);
    objc_msgSend(MEMORY[0x24BDF6950], "akColorWithWhite:alpha:", 0.2, 0.8);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v17, "CGColor"));

    CGContextAddPath(a4, v16);
    CGContextEOFillPath(a4);
    CGPathRelease(v16);
    if (objc_msgSend(v10, "isDraggingHandle"))
    {
      objc_msgSend(v10, "rectangle");
      points.x = v19;
      points.y = v20 + v18 / 3.0;
      v25 = v19 + v21;
      y = points.y;
      v27 = v19;
      v28 = v20 + (v18 + v18) / 3.0;
      v29 = v19 + v21;
      v30 = v28;
      v31 = v19 + v21 / 3.0;
      v32 = v20 + v18;
      v33 = v31;
      v34 = v20;
      v35 = v19 + (v21 + v21) / 3.0;
      v36 = v20 + v18;
      v37 = v35;
      v38 = v20;
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v10, "color"));
      CGContextSetLineWidth(a4, 1.0 / v23);
      CGContextStrokeLineSegments(a4, &points, 8uLL);
    }
    if (objc_msgSend(v10, "cropApplied") && (objc_msgSend(v10, "showHandles") & 1) == 0)
    {
      points.x = 1.0;
      v22 = (const CGPath *)objc_msgSend(a1, "_newRectanglePathForAnnotation:withPageController:outLineWidth:", v10, v11, &points);
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v10, "color"));
      CGContextSetLineWidth(a4, points.x);
      CGContextSetLineJoin(a4, kCGLineJoinMiter);
      CGContextAddPath(a4, v22);
      CGContextStrokePath(a4);
      CGPathRelease(v22);
    }
    CGContextRestoreGState(a4);
  }

}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  return 0;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  return 1;
}

+ (CGPath)cropHandle:(int64_t)a3 forAnnotation:(id)a4 withPageController:(id)a5
{
  __int128 v8;
  id v9;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  CGPath *Mutable;
  CGPath *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGPath *v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  double v72;
  double v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  __int128 v78;
  double v79[3];
  double v80;

  v80 = 1.0;
  v8 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v78 = *MEMORY[0x24BDBF090];
  *(_OWORD *)v79 = v8;
  v9 = a5;
  objc_msgSend(a1, "_pixelAlignedBaseRect:interiorRect:scaleFactor:forAnnotation:withPageController:", &v78, 0, &v80, a4, v9);
  v10 = v78;
  v11 = *((double *)&v78 + 1) + v79[1];
  v12 = *(double *)&v78 + v79[0];
  objc_msgSend(v9, "convertPointFromModelToOverlay:", v78);
  v14 = v13;
  v16 = v15;
  objc_msgSend(v9, "convertPointFromModelToOverlay:", *(double *)&v10, v11);
  v18 = v17;
  v20 = v19;
  objc_msgSend(v9, "convertPointFromModelToOverlay:", v12, *((double *)&v10 + 1));
  v22 = v21;
  v24 = v23;
  objc_msgSend(v9, "convertPointFromModelToOverlay:", v12, v11);
  v26 = v25;
  v28 = v27;

  Mutable = CGPathCreateMutable();
  v30 = Mutable;
  v31 = 19.0 / v80;
  v32 = 3.0 / v80;
  switch(a3)
  {
    case 0:
      v33 = 19.0 / v80;
      CGPathMoveToPoint(Mutable, 0, v18, v20 - v31);
      v34 = v16 + v33;
      v35 = v30;
      v36 = v14;
      goto LABEL_12;
    case 1:
      v37 = 19.0 / v80;
      CGPathMoveToPoint(Mutable, 0, v26, v28 - v31);
      v34 = v24 + v37;
      v35 = v30;
      v36 = v22;
      goto LABEL_12;
    case 2:
      v38 = 19.0 / v80;
      CGPathMoveToPoint(Mutable, 0, v18 + v31, v20);
      v36 = v26 - v38;
      v35 = v30;
      v34 = v28;
      goto LABEL_12;
    case 3:
      v39 = v16;
      v40 = 19.0 / v80;
      CGPathMoveToPoint(Mutable, 0, v14 + v31, v39);
      v36 = v22 - v40;
      v35 = v30;
      v34 = v24;
      goto LABEL_12;
    case 4:
      v41 = v18 + v32;
      v42 = v20 - v32;
      v43 = 3.0 / v80;
      v44 = 19.0 / v80;
      v45 = 22.0 / v80;
      CGPathMoveToPoint(Mutable, 0, v18 + v32, v42);
      v46 = v42 - v44;
      CGPathAddLineToPoint(v30, 0, v41, v46);
      v47 = v41 - v43;
      CGPathAddLineToPoint(v30, 0, v47, v46);
      v48 = v45 + v46;
      CGPathAddLineToPoint(v30, 0, v47, v48);
      v49 = v45 + v47;
      CGPathAddLineToPoint(v30, 0, v49, v48);
      v50 = v48 - v43;
      CGPathAddLineToPoint(v30, 0, v49, v50);
      v36 = v49 - v44;
      goto LABEL_11;
    case 5:
      v51 = v26 - v32;
      v52 = v28 - v32;
      v53 = 3.0 / v80;
      v54 = 19.0 / v80;
      v55 = 22.0 / v80;
      CGPathMoveToPoint(Mutable, 0, v26 - v32, v28 - v32);
      v56 = v52 - v54;
      CGPathAddLineToPoint(v30, 0, v51, v56);
      v57 = v53 + v51;
      CGPathAddLineToPoint(v30, 0, v57, v56);
      v58 = v55 + v56;
      CGPathAddLineToPoint(v30, 0, v57, v58);
      v59 = v57 - v55;
      CGPathAddLineToPoint(v30, 0, v59, v58);
      v50 = v58 - v53;
      goto LABEL_10;
    case 6:
      v60 = v14 + v32;
      v61 = v16 + v32;
      v62 = 3.0 / v80;
      v63 = 19.0 / v80;
      v64 = 22.0 / v80;
      CGPathMoveToPoint(Mutable, 0, v60, v61);
      v65 = v63 + v61;
      CGPathAddLineToPoint(v30, 0, v60, v65);
      v66 = v60 - v62;
      CGPathAddLineToPoint(v30, 0, v66, v65);
      v67 = v65 - v64;
      CGPathAddLineToPoint(v30, 0, v66, v67);
      v68 = v64 + v66;
      CGPathAddLineToPoint(v30, 0, v68, v67);
      v69 = v62 + v67;
      CGPathAddLineToPoint(v30, 0, v68, v69);
      v36 = v68 - v63;
      v35 = v30;
      v34 = v69;
      goto LABEL_12;
    case 7:
      v70 = v22 - v32;
      v71 = v24 + v32;
      v72 = 3.0 / v80;
      v54 = 19.0 / v80;
      v73 = 22.0 / v80;
      CGPathMoveToPoint(Mutable, 0, v70, v71);
      v74 = v54 + v71;
      CGPathAddLineToPoint(v30, 0, v70, v74);
      v75 = v72 + v70;
      CGPathAddLineToPoint(v30, 0, v75, v74);
      v76 = v74 - v73;
      CGPathAddLineToPoint(v30, 0, v75, v76);
      v59 = v75 - v73;
      CGPathAddLineToPoint(v30, 0, v59, v76);
      v50 = v72 + v76;
LABEL_10:
      CGPathAddLineToPoint(v30, 0, v59, v50);
      v36 = v54 + v59;
LABEL_11:
      v35 = v30;
      v34 = v50;
LABEL_12:
      CGPathAddLineToPoint(v35, 0, v36, v34);
      break;
    default:
      return v30;
  }
  return v30;
}

+ (CGPath)newLeftEdgePathForAnnotation:(id)a3 withPageController:(id)a4
{
  CGSize v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat MinX;
  CGFloat v10;
  CGRect v12;
  CGRect v13;
  uint64_t v14;
  CGRect v15;
  CGRect v16;

  *(double *)&v14 = 1.0;
  v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v13.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v13.size = v4;
  v12.origin = v13.origin;
  v12.size = v4;
  objc_msgSend(a1, "_pixelAlignedBaseRect:interiorRect:scaleFactor:forAnnotation:withPageController:", &v13, &v12, &v14, a3, a4);
  v5 = *(double *)&v14;
  v6 = 20.0 / v5 + 20.0 / v5;
  v7 = CGRectGetHeight(v12) + -20.0;
  if (v6 > v7)
    v6 = v7;
  if (v6 <= 0.0)
    return 0;
  v8 = 4.0 / v5;
  MinX = CGRectGetMinX(v13);
  v10 = CGRectGetMidY(v13) + v6 * -0.5;
  v13 = CGRectInset(v13, -v8, -v8);
  v16.origin.x = MinX;
  v16.origin.y = v10;
  v16.size.width = v8;
  v16.size.height = v6;
  v15 = CGRectIntersection(v13, v16);
  return CGPathCreateWithRect(v15, 0);
}

+ (CGPath)newRightEdgePathForAnnotation:(id)a3 withPageController:(id)a4
{
  CGSize v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGRect v12;
  CGRect v13;
  uint64_t v14;
  CGRect v15;
  CGRect v16;

  v14 = 0x3FF0000000000000;
  v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v13.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v13.size = v4;
  v12.origin = v13.origin;
  v12.size = v4;
  objc_msgSend(a1, "_pixelAlignedBaseRect:interiorRect:scaleFactor:forAnnotation:withPageController:", &v13, &v12, &v14, a3, a4);
  v5 = *(double *)&v14;
  v6 = 20.0 / v5 + 20.0 / v5;
  v7 = CGRectGetHeight(v12) + -20.0;
  if (v6 > v7)
    v6 = v7;
  if (v6 <= 0.0)
    return 0;
  v8 = 4.0 / v5;
  v9 = CGRectGetMaxX(v13) - v8;
  v10 = CGRectGetMidY(v13) + v6 * -0.5;
  v13 = CGRectInset(v13, -v8, -v8);
  v16.origin.x = v9;
  v16.origin.y = v10;
  v16.size.width = v8;
  v16.size.height = v6;
  v15 = CGRectIntersection(v13, v16);
  return CGPathCreateWithRect(v15, 0);
}

+ (CGPath)newBottomEdgePathForAnnotation:(id)a3 withPageController:(id)a4
{
  CGSize v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat MinY;
  CGRect v12;
  CGRect v13;
  uint64_t v14;
  CGRect v15;
  CGRect v16;

  *(double *)&v14 = 1.0;
  v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v13.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v13.size = v4;
  v12.origin = v13.origin;
  v12.size = v4;
  objc_msgSend(a1, "_pixelAlignedBaseRect:interiorRect:scaleFactor:forAnnotation:withPageController:", &v13, &v12, &v14, a3, a4);
  v5 = *(double *)&v14;
  v6 = 20.0 / v5 + 20.0 / v5;
  v7 = CGRectGetWidth(v12) + -20.0;
  if (v6 > v7)
    v6 = v7;
  if (v6 <= 0.0)
    return 0;
  v8 = 4.0 / v5;
  v9 = CGRectGetMidX(v13) + v6 * -0.5;
  MinY = CGRectGetMinY(v13);
  v13 = CGRectInset(v13, -v8, -v8);
  v16.origin.x = v9;
  v16.origin.y = MinY;
  v16.size.width = v6;
  v16.size.height = v8;
  v15 = CGRectIntersection(v13, v16);
  return CGPathCreateWithRect(v15, 0);
}

+ (CGPath)newTopEdgePathForAnnotation:(id)a3 withPageController:(id)a4
{
  CGSize v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGRect v12;
  CGRect v13;
  uint64_t v14;
  CGRect v15;
  CGRect v16;

  v14 = 0x3FF0000000000000;
  v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v13.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v13.size = v4;
  v12.origin = v13.origin;
  v12.size = v4;
  objc_msgSend(a1, "_pixelAlignedBaseRect:interiorRect:scaleFactor:forAnnotation:withPageController:", &v13, &v12, &v14, a3, a4);
  v5 = *(double *)&v14;
  v6 = 20.0 / v5 + 20.0 / v5;
  v7 = CGRectGetWidth(v12) + -20.0;
  if (v6 > v7)
    v6 = v7;
  if (v6 <= 0.0)
    return 0;
  v8 = 4.0 / v5;
  v9 = CGRectGetMidX(v13) + v6 * -0.5;
  v10 = CGRectGetMaxY(v13) - v8;
  v13 = CGRectInset(v13, -v8, -v8);
  v16.origin.x = v9;
  v16.origin.y = v10;
  v16.size.width = v6;
  v16.size.height = v8;
  v15 = CGRectIntersection(v13, v16);
  return CGPathCreateWithRect(v15, 0);
}

+ (CGPath)newTopLeftCornerPathForAnnotation:(id)a3 withPageController:(id)a4
{
  CGSize v4;
  CGFloat v5;
  CGFloat MinX;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat MaxY;
  double v12;
  CGFloat v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGPath *Mutable;
  CGRect v24;
  CGRect v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v26 = 1.0;
  v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v25.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v25.size = v4;
  v24.origin = v25.origin;
  v24.size = v4;
  objc_msgSend(a1, "_pixelAlignedBaseRect:interiorRect:scaleFactor:forAnnotation:withPageController:", &v25, &v24, &v26, a3, a4);
  v5 = 4.0 / v26;
  MinX = CGRectGetMinX(v25);
  v7 = CGRectGetMaxY(v25) - v5;
  v8 = CGRectGetMinX(v24);
  v9 = v8 - CGRectGetMinX(v25);
  v10 = CGRectGetMinX(v25);
  MaxY = CGRectGetMaxY(v24);
  v12 = CGRectGetMaxY(v25);
  v13 = v12 - CGRectGetMaxY(v24);
  v31.origin.x = MinX;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v5;
  v27 = CGRectIntersection(v25, v31);
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  v32.origin.x = v10;
  v32.origin.y = MaxY;
  v32.size.width = v5;
  v32.size.height = v13;
  v28 = CGRectIntersection(v25, v32);
  v18 = v28.origin.x;
  v19 = v28.origin.y;
  v20 = v28.size.width;
  v21 = v28.size.height;
  Mutable = CGPathCreateMutable();
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  CGPathAddRect(Mutable, 0, v29);
  v30.origin.x = v18;
  v30.origin.y = v19;
  v30.size.width = v20;
  v30.size.height = v21;
  CGPathAddRect(Mutable, 0, v30);
  return Mutable;
}

+ (CGPath)newTopRightCornerPathForAnnotation:(id)a3 withPageController:(id)a4
{
  CGSize v4;
  CGFloat v5;
  CGFloat MaxX;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat MaxY;
  double v12;
  CGFloat v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGPath *Mutable;
  CGRect v24;
  CGRect v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v26 = 1.0;
  v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v25.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v25.size = v4;
  v24.origin = v25.origin;
  v24.size = v4;
  objc_msgSend(a1, "_pixelAlignedBaseRect:interiorRect:scaleFactor:forAnnotation:withPageController:", &v25, &v24, &v26, a3, a4);
  v5 = 4.0 / v26;
  MaxX = CGRectGetMaxX(v24);
  v7 = CGRectGetMaxY(v25) - v5;
  v8 = CGRectGetMaxX(v25);
  v9 = v8 - CGRectGetMaxX(v24);
  v10 = CGRectGetMaxX(v25) - v5;
  MaxY = CGRectGetMaxY(v24);
  v12 = CGRectGetMaxY(v25);
  v13 = v12 - CGRectGetMaxY(v24);
  v31.origin.x = MaxX;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v5;
  v27 = CGRectIntersection(v25, v31);
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  v32.origin.x = v10;
  v32.origin.y = MaxY;
  v32.size.width = v5;
  v32.size.height = v13;
  v28 = CGRectIntersection(v25, v32);
  v18 = v28.origin.x;
  v19 = v28.origin.y;
  v20 = v28.size.width;
  v21 = v28.size.height;
  Mutable = CGPathCreateMutable();
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  CGPathAddRect(Mutable, 0, v29);
  v30.origin.x = v18;
  v30.origin.y = v19;
  v30.size.width = v20;
  v30.size.height = v21;
  CGPathAddRect(Mutable, 0, v30);
  return Mutable;
}

+ (CGPath)newBottomLeftCornerPathForAnnotation:(id)a3 withPageController:(id)a4
{
  CGSize v4;
  CGFloat v5;
  double MinX;
  CGFloat MinY;
  CGFloat v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGPath *Mutable;
  CGRect v22;
  CGRect v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v24 = 1.0;
  v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v23.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v23.size = v4;
  v22.origin = v23.origin;
  v22.size = v4;
  objc_msgSend(a1, "_pixelAlignedBaseRect:interiorRect:scaleFactor:forAnnotation:withPageController:", &v23, &v22, &v24, a3, a4);
  v5 = 4.0 / v24;
  MinX = CGRectGetMinX(v23);
  MinY = CGRectGetMinY(v23);
  v8 = CGRectGetMinX(v22) - MinX;
  v9 = CGRectGetMinX(v23);
  v10 = CGRectGetMinY(v23);
  v11 = CGRectGetMinY(v22) - v10;
  v29.origin.x = MinX;
  v29.origin.y = MinY;
  v29.size.width = v8;
  v29.size.height = v5;
  v25 = CGRectIntersection(v23, v29);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  v30.origin.x = v9;
  v30.origin.y = v10;
  v30.size.width = v5;
  v30.size.height = v11;
  v26 = CGRectIntersection(v23, v30);
  v16 = v26.origin.x;
  v17 = v26.origin.y;
  v18 = v26.size.width;
  v19 = v26.size.height;
  Mutable = CGPathCreateMutable();
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  CGPathAddRect(Mutable, 0, v27);
  v28.origin.x = v16;
  v28.origin.y = v17;
  v28.size.width = v18;
  v28.size.height = v19;
  CGPathAddRect(Mutable, 0, v28);
  return Mutable;
}

+ (CGPath)newBottomRightCornerPathForAnnotation:(id)a3 withPageController:(id)a4
{
  CGSize v4;
  CGFloat v5;
  double MaxX;
  CGFloat MinY;
  CGFloat v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGPath *Mutable;
  CGRect v22;
  CGRect v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v24 = 1.0;
  v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v23.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v23.size = v4;
  v22.origin = v23.origin;
  v22.size = v4;
  objc_msgSend(a1, "_pixelAlignedBaseRect:interiorRect:scaleFactor:forAnnotation:withPageController:", &v23, &v22, &v24, a3, a4);
  v5 = 4.0 / v24;
  MaxX = CGRectGetMaxX(v22);
  MinY = CGRectGetMinY(v23);
  v8 = CGRectGetMaxX(v23) - MaxX;
  v9 = CGRectGetMaxX(v23) - v5;
  v10 = CGRectGetMinY(v23);
  v11 = CGRectGetMinY(v22) - v10;
  v29.origin.x = MaxX;
  v29.origin.y = MinY;
  v29.size.width = v8;
  v29.size.height = v5;
  v25 = CGRectIntersection(v23, v29);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  v30.origin.x = v9;
  v30.origin.y = v10;
  v30.size.width = v5;
  v30.size.height = v11;
  v26 = CGRectIntersection(v23, v30);
  v16 = v26.origin.x;
  v17 = v26.origin.y;
  v18 = v26.size.width;
  v19 = v26.size.height;
  Mutable = CGPathCreateMutable();
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  CGPathAddRect(Mutable, 0, v27);
  v28.origin.x = v16;
  v28.origin.y = v17;
  v28.size.width = v18;
  v28.size.height = v19;
  CGPathAddRect(Mutable, 0, v28);
  return Mutable;
}

+ (CGPath)_newClipMaskEOPathForAnnotation:(id)a3 withPageController:(id)a4
{
  CGSize v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGPath *Mutable;
  CGRect v18;
  uint64_t v19;
  CGRect v20;

  v19 = 0x3FF0000000000000;
  v6 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v18.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v18.size = v6;
  v7 = a4;
  objc_msgSend(a1, "_pixelAlignedBaseRect:interiorRect:scaleFactor:forAnnotation:withPageController:", &v18, 0, &v19, a3, v7);
  objc_msgSend(v7, "maxPageRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  Mutable = CGPathCreateMutable();
  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  CGPathAddRect(Mutable, 0, v20);
  CGPathAddRect(Mutable, 0, v18);
  return Mutable;
}

+ (CGPath)_newRectanglePathForAnnotation:(id)a3 withPageController:(id)a4 outLineWidth:(double *)a5
{
  CGSize v6;
  double v7;
  CGPath *result;
  CGRect v9;
  double v10;

  v10 = 1.0;
  v6 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v9.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v9.size = v6;
  objc_msgSend(a1, "_pixelAlignedBaseRect:interiorRect:scaleFactor:forAnnotation:withPageController:", &v9, 0, &v10, a3, a4);
  v7 = 1.0 / v10;
  v9 = CGRectInset(v9, 1.0 / v10 * -0.5, 1.0 / v10 * -0.5);
  result = CGPathCreateWithRect(v9, 0);
  *a5 = v7;
  return result;
}

+ (void)_pixelAlignedBaseRect:(CGRect *)a3 interiorRect:(CGRect *)a4 scaleFactor:(double *)a5 forAnnotation:(id)a6 withPageController:(id)a7
{
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v11 = a7;
  objc_msgSend(a6, "rectangle");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v11, "geometryHelper");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "screenPixelAlignedRectForRect:", v13, v15, v17, v19);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  objc_msgSend(v11, "currentModelToScreenScaleFactor");
  v30 = v29;

  if (a4)
  {
    v37.origin.x = v22;
    v37.origin.y = v24;
    v37.size.width = v26;
    v37.size.height = v28;
    v31 = v30 * CGRectGetWidth(v37);
    v38.origin.x = v22;
    v38.origin.y = v24;
    v38.size.width = v26;
    v38.size.height = v28;
    v32 = v30 * CGRectGetHeight(v38);
    v33 = fmax((v31 + -10.0) * 0.5, 4.0);
    if (v31 + -40.0 >= 10.0)
      v33 = 20.0;
    v34 = v32 + -40.0;
    v35 = fmax((v32 + -10.0) * 0.5, 4.0);
    if (v34 >= 10.0)
      v35 = 20.0;
    v36 = v35 / v30;
    v39.origin.x = v22;
    v39.origin.y = v24;
    v39.size.width = v26;
    v39.size.height = v28;
    v40 = CGRectInset(v39, v33 / v30, v36);
    if (a3)
      goto LABEL_7;
  }
  else
  {
    v40.size.height = 0.0;
    v40.size.width = 0.0;
    v40.origin.y = 0.0;
    v40.origin.x = 0.0;
    if (a3)
    {
LABEL_7:
      a3->origin.x = v22;
      a3->origin.y = v24;
      a3->size.width = v26;
      a3->size.height = v28;
    }
  }
  if (a4)
    *a4 = v40;
  if (a5)
    *a5 = v30;
}

@end
