@implementation AKSignatureAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v3;
  double x;
  double y;
  double width;
  double height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "rectangle");
  v15 = CGRectInset(v14, -1.0, -1.0);
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  objc_msgSend(v3, "rotationAngle");
  v9 = v8;

  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", x, y, width, height, v9);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = -5.0;
  v4 = -5.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4
{
  return 0;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  CGFloat v12;
  CGFloat v13;
  int64_t v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v62;
  double v63;
  double v64;
  int Type;
  void *v66;
  CGImage *v67;
  id v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  CGContext *v85;
  int64_t v86;
  double v87;
  CGAffineTransform v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  CGAffineTransform v93;
  CGAffineTransform transform;
  CGAffineTransform v95;
  _BYTE v96[128];
  uint64_t v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  v7 = a5;
  v97 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  CGContextSaveGState(a4);
  objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v10, v7, v11);
  memset(&v95, 0, sizeof(v95));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v10, 0);
  transform = v95;
  CGContextConcatCTM(a4, &transform);
  objc_msgSend(v10, "rectangle");
  CGContextTranslateCTM(a4, v12, v13);
  v14 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", objc_msgSend(v10, "originalExifOrientation"));
  memset(&transform, 0, sizeof(transform));
  objc_msgSend(v10, "rectangle");
  +[AKGeometryHelper affineTransformRecenteringAboutOriginForExifOrientation:withOriginalSize:](AKGeometryHelper, "affineTransformRecenteringAboutOriginForExifOrientation:withOriginalSize:", v14, v15, v16);
  v93 = transform;
  CGContextConcatCTM(a4, &v93);
  objc_msgSend(v10, "signature");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "drawing");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v7 && v18)
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "threadDictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "objectForKey:", CFSTR("AKAnnotationRendererIsFastPathRenderingOnCurrentThread"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    if (v22)
    {
      objc_msgSend(v10, "signature");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "path");

      if (v24)
      {

        goto LABEL_8;
      }
      if (qword_255A271E8 != -1)
        dispatch_once(&qword_255A271E8, &unk_24F1A7218);
    }

  }
  else if (!v18)
  {
LABEL_8:
    objc_msgSend(v10, "signature");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "path");

    if (v26)
    {
      objc_msgSend(v10, "strokeColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        objc_msgSend(v10, "strokeColor");
      else
        objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v68 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v68, "CGColor"));

      objc_msgSend(v10, "signature");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "pathBounds");
      v71 = v70;
      v73 = v72;
      v75 = v74;
      v77 = v76;

      objc_msgSend(v10, "rectangle");
      +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v14);
      v80 = v79 / v75;
      if (v79 / v75 >= v78 / v77)
        v80 = v78 / v77;
      CGContextScaleCTM(a4, v80, v80);
      CGContextTranslateCTM(a4, -v71, -v73);
      objc_msgSend(v10, "signature");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      CGContextAddPath(a4, (CGPathRef)objc_msgSend(v81, "path"));

      CGContextFillPath(a4);
    }
    goto LABEL_42;
  }
  objc_msgSend(v10, "signature");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "drawing");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "strokeColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v86 = v14;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
    {
      v33 = v29;
    }
    else
    {
      v83 = v11;
      v84 = v10;
      v85 = a4;
      v34 = objc_alloc(MEMORY[0x24BDBCF00]);
      objc_msgSend(v29, "strokes");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v34, "initWithArray:", v35);

      v82 = v29;
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE3380]), "initWithStrokes:fromDrawing:", v36, v29);
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      objc_msgSend(v33, "strokes");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v90;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v90 != v40)
              objc_enumerationMutation(v37);
            v42 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
            v43 = (void *)MEMORY[0x24BDE33B0];
            objc_msgSend(v42, "ink");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "inkFromInk:color:", v44, v30);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            v46 = (id)objc_msgSend(v33, "setStroke:ink:", v42, v45);
          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
        }
        while (v39);
      }

      v10 = v84;
      a4 = v85;
      v11 = v83;
    }
    v14 = v86;
  }
  else
  {
    v33 = v29;
  }
  objc_msgSend(v33, "bounds");
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;
  objc_msgSend(v10, "rectangle");
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v14);
  v57 = v56 / v52;
  if (v56 / v52 >= v55 / v54)
    v57 = v55 / v54;
  CGContextScaleCTM(a4, v57, v57);
  v87 = v48;
  CGContextTranslateCTM(a4, -v48, -v50);
  memset(&v93, 0, sizeof(v93));
  CGContextGetCTM(&v93, a4);
  v88 = v93;
  v98.origin.x = 0.0;
  v98.origin.y = 0.0;
  v98.size.width = 1.0;
  v98.size.height = 1.0;
  v99 = CGRectApplyAffineTransform(v98, &v88);
  x = v99.origin.x;
  y = v99.origin.y;
  width = v99.size.width;
  height = v99.size.height;
  v62 = CGRectGetWidth(v99);
  v100.origin.x = x;
  v100.origin.y = y;
  v100.size.width = width;
  v100.size.height = height;
  v63 = CGRectGetHeight(v100);
  if (v62 >= v63)
    v64 = v62;
  else
    v64 = v63;
  Type = CGContextGetType();
  if (Type == 6 || Type == 1)
    v64 = v64 + v64;
  +[AKInkRendererHelper renderDrawing:clippedToStrokeSpaceRect:scale:](AKInkRendererHelper, "renderDrawing:clippedToStrokeSpaceRect:scale:", v33, v87, v50, v52, v54, v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
    v67 = (CGImage *)objc_msgSend(v66, "akCGImage");
    v101.origin.x = v87;
    v101.origin.y = v50;
    v101.size.width = v52;
    v101.size.height = v54;
    CGContextDrawImage(a4, v101, v67);
  }

LABEL_42:
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
  CGFloat v12;
  CGFloat v13;
  CGFloat width;
  CGFloat height;
  const CGPath *v16;
  BOOL v17;
  CGAffineTransform v19;
  CGAffineTransform m;
  CGAffineTransform v21;
  char v22;
  CGPoint v23;
  CGPoint v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_concreteDraggingBoundsInsetsForAnnotation:", v7);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "rectangle");
  v26 = CGRectInset(v25, v9, v11);
  v12 = v26.origin.x;
  v13 = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  v22 = 0;
  memset(&v21, 0, sizeof(v21));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v7, &v22);

  if (v22)
  {
    v19 = v21;
    memset(&m, 0, sizeof(m));
    CGAffineTransformInvert(&m, &v19);
    v27.origin.x = v12;
    v27.origin.y = v13;
    v27.size.width = width;
    v27.size.height = height;
    v16 = CGPathCreateWithRect(v27, 0);
    v23.x = x;
    v23.y = y;
    v17 = CGPathContainsPoint(v16, &m, v23, 0);
    CGPathRelease(v16);
  }
  else
  {
    v28.origin.x = v12;
    v28.origin.y = v13;
    v28.size.width = width;
    v28.size.height = height;
    v24.x = x;
    v24.y = y;
    return CGRectContainsPoint(v28, v24);
  }
  return v17;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  return 0;
}

@end
