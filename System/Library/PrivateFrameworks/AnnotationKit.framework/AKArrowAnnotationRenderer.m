@implementation AKArrowAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v4;
  const CGPath *Mutable;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGRect BoundingBox;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect result;
  CGRect v49;

  v4 = a3;
  Mutable = CGPathCreateMutable();
  objc_msgSend(a1, "_drawPathForArrow:inContext:inPath:pageControllerForPixelAlignmentOrNil:minimumGrabbableBorderThickness:", v4, 0, Mutable, 0, 1.0);
  BoundingBox = CGPathGetBoundingBox(Mutable);
  x = BoundingBox.origin.x;
  y = BoundingBox.origin.y;
  width = BoundingBox.size.width;
  height = BoundingBox.size.height;
  CGPathRelease(Mutable);
  objc_msgSend(v4, "strokeWidth");
  v11 = -v10;
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  v42 = CGRectInset(v41, v11, v11);
  v12 = v42.origin.x;
  v13 = v42.origin.y;
  v14 = v42.size.width;
  v15 = v42.size.height;
  if (objc_msgSend(v4, "hasShadow"))
  {
    +[AKAnnotationRendererUtilities outsetRectForShadow:onAnnotation:](AKAnnotationRendererUtilities, "outsetRectForShadow:onAnnotation:", v4, v12, v13, v14, v15);
    v12 = v16;
    v13 = v17;
    v14 = v18;
    v15 = v19;
  }
  +[AKTextAnnotationAttributeHelper actualOrPlaceholderTextOfAnnotation:](AKTextAnnotationAttributeHelper, "actualOrPlaceholderTextOfAnnotation:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length")
    || (objc_msgSend(v4, "fillColor"), v21 = (void *)objc_claimAutoreleasedReturnValue(), v21, v21))
  {
    objc_msgSend(a1, "_concreteTextBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", v4, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    if (+[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", objc_msgSend(v4, "originalExifOrientation")))
    {
      v30 = -1.0;
      v31 = -5.0;
    }
    else
    {
      v30 = -5.0;
      v31 = -1.0;
    }
    v43.origin.x = v23;
    v43.origin.y = v25;
    v43.size.width = v27;
    v43.size.height = v29;
    v49 = CGRectInset(v43, v30, v31);
    v44.origin.x = v12;
    v44.origin.y = v13;
    v44.size.width = v14;
    v44.size.height = v15;
    v45 = CGRectUnion(v44, v49);
    v12 = v45.origin.x;
    v13 = v45.origin.y;
    v14 = v45.size.width;
    v15 = v45.size.height;
  }
  v46.origin.x = v12;
  v46.origin.y = v13;
  v46.size.width = v14;
  v46.size.height = v15;
  v47 = CGRectInset(v46, -1.0, -1.0);
  v32 = v47.origin.x;
  v33 = v47.origin.y;
  v34 = v47.size.width;
  v35 = v47.size.height;

  v36 = v32;
  v37 = v33;
  v38 = v34;
  v39 = v35;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
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

+ (CGRect)_concreteTextBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
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
  uint64_t v31;
  int64_t v32;
  _BOOL4 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double MinX;
  double v52;
  double MidY;
  double MaxX;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  uint64_t v68;
  double v69;
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
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  long double v87;
  CGFloat v88;
  CGFloat v89;
  double MidX;
  double v91;
  uint64_t v92;
  double v96;
  double v97;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  _QWORD v121[2];
  double v122;
  double v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect result;

  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    +[AKTextAnnotationAttributeHelper actualOrPlaceholderTextOfAnnotation:](AKTextAnnotationAttributeHelper, "actualOrPlaceholderTextOfAnnotation:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_8:
      objc_msgSend(v7, "typingAttributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:attributes:](AKTextAnnotationAttributeHelper, "newTextStorageOriginalFontSavvyWithString:attributes:", CFSTR("fg"), v17);

      v14 = v18;
      v10 = v14;
      goto LABEL_9;
    }
  }
  if (!objc_msgSend(v10, "length"))
    goto LABEL_8;
  objc_msgSend(v10, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByTrimmingTrailingWhitespaceFromEachLine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "typingAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:attributes:](AKTextAnnotationAttributeHelper, "newTextStorageOriginalFontSavvyWithString:attributes:", v12, v13);

  if (!objc_msgSend(v14, "length"))
  {
    objc_msgSend(v7, "typingAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:attributes:](AKTextAnnotationAttributeHelper, "newTextStorageOriginalFontSavvyWithString:attributes:", CFSTR("fg"), v15);

    v14 = v16;
  }

LABEL_9:
  objc_msgSend(v7, "originalModelBaseScaleFactor");
  v19 = +[AKTextAnnotationAttributeHelper newTextStorage:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "newTextStorage:byApplyingScaleFactor:", v10);

  objc_msgSend(v7, "originalModelBaseScaleFactor");
  v20 = +[AKTextAnnotationAttributeHelper newTextStorage:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "newTextStorage:byApplyingScaleFactor:", v14);

  +[AKTextAnnotationRenderHelper unconstrainedSizeForText:](AKTextAnnotationRenderHelper, "unconstrainedSizeForText:", v19);
  v22 = v21;
  +[AKTextAnnotationRenderHelper unconstrainedSizeForText:](AKTextAnnotationRenderHelper, "unconstrainedSizeForText:", v20);
  v24 = v23;
  v26 = v25;
  v116 = v22 - v23;
  objc_msgSend(v7, "strokeWidth");
  v28 = v27 * -1.5 * 0.5;
  v119 = v28 + -1.0;
  v120 = v28 + -5.0;
  v29 = v26 + (v28 + -1.0) * -2.0;
  if (v29 <= v24 + (v28 + -5.0) * -2.0)
    v30 = v24 + (v28 + -5.0) * -2.0;
  else
    v30 = v26 + (v28 + -1.0) * -2.0;
  v31 = objc_msgSend(v7, "originalExifOrientation");
  v32 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", v31);
  v33 = +[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", v31);
  objc_msgSend(v7, "startPoint");
  v36 = v34;
  v37 = v35;
  if (v33)
    v38 = v30;
  else
    v38 = v29;
  if (v33)
    v39 = v29;
  else
    v39 = v30;
  v114 = v35 - v38 * 0.5;
  v115 = v34 - v39 * 0.5;
  v117 = v39;
  v118 = v38;
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v31);
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v122 = 0.0;
  v123 = 0.0;
  v121[0] = 0;
  v121[1] = 0;
  objc_msgSend(a1, "_controlPointsForArrow:outControlPoint1:outControlPoint2:", v7, &v122, v121);
  v108 = v36;
  +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v36 - v122, v37 - v123);
  v112 = v49;
  v113 = v48;
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v31);
  +[AKGeometryHelper angleOfVector:](AKGeometryHelper, "angleOfVector:");
  if (v50 > 3.14159265)
    v50 = 6.28318531 - v50;
  v106 = v50;
  v124.origin.x = v41;
  v124.origin.y = v43;
  v124.size.width = v45;
  v124.size.height = v47;
  MinX = CGRectGetMinX(v124);
  v125.origin.x = v41;
  v125.origin.y = v43;
  v125.size.width = v45;
  v125.size.height = v47;
  v52 = MinX + CGRectGetHeight(v125) * 0.5;
  v126.origin.x = v41;
  v126.origin.y = v43;
  v126.size.width = v45;
  v126.size.height = v47;
  MidY = CGRectGetMidY(v126);
  v127.origin.x = v41;
  v127.origin.y = v43;
  v127.size.width = v45;
  v127.size.height = v47;
  MaxX = CGRectGetMaxX(v127);
  v128.origin.x = v41;
  v128.origin.y = v43;
  v128.size.width = v45;
  v128.size.height = v47;
  v55 = MaxX - CGRectGetHeight(v128) * 0.5;
  v129.origin.x = v41;
  v129.origin.y = v43;
  v129.size.width = v45;
  v129.size.height = v47;
  v56 = CGRectGetMidY(v129);
  v109 = MidY;
  v110 = v52;
  v107 = v55;
  v57 = v55 - v52;
  v58 = v56 - MidY;
  v59 = v56;
  v60 = pow((v106 + -0.785398163) / 1.57079633 * 2.0 + -1.0, 7.0);
  v61 = 1.0;
  if (v60 <= 1.0)
    v62 = v60;
  else
    v62 = 1.0;
  if (v60 >= -1.0)
    v63 = v62;
  else
    v63 = -1.0;
  if (v63 + 1.0 <= 1.0)
    v64 = v63 + 1.0;
  else
    v64 = 1.0;
  if (v63 + 1.0 >= 0.0)
    v65 = v64;
  else
    v65 = 0.0;
  if (1.0 - v63 <= 1.0)
    v61 = 1.0 - v63;
  if (1.0 - v63 >= 0.0)
    v66 = v61;
  else
    v66 = 0.0;
  objc_msgSend(v19, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BDF6628], 0, 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v67)
  {
    objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v68 = objc_msgSend(v67, "alignment");
  if (v63 <= 0.0)
    v69 = v63;
  else
    v69 = 0.0;
  v70 = v59 + v69 * v58;
  v71 = v108 + v63 * 0.5 * v57;
  if (v65 >= v66)
    v72 = v66;
  else
    v72 = v65;
  v73 = v116 * (v72 * 0.5);
  v74 = fmax(v63, 0.0);
  v75 = v110 + v74 * v57;
  v76 = v109 + v74 * v58;
  if (v68)
    v76 = v37 + v63 * 0.5 * v58;
  else
    v71 = v75;
  if (v68)
    v77 = v73;
  else
    v77 = 0.0;
  if (!v68)
    v73 = v116 * v66;
  if (v68 == 2)
    v78 = v107 + v69 * v57;
  else
    v78 = v71;
  if (v68 == 2)
    v79 = v70;
  else
    v79 = v76;
  if (v68 == 2)
    v80 = v116 * v65;
  else
    v80 = v77;
  v111 = fmax(v80, 0.0);
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v32, v78, v79, v108, v37, v71, v73, v76, v77);
  v82 = v115 + v108 - v81;
  v84 = v114 + v37 - v83;
  +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withRect:andRoundedCornerRadius:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withRect:andRoundedCornerRadius:", v108, v37, v108 - v113 * 1000000.0, v37 - v112 * 1000000.0, v82, v84, v117, v118, 0);
  v87 = hypot(v85 - v108, v86 - v37);
  v88 = v82 + v87 * v113;
  v89 = v84 + v87 * v112;
  v130.origin.x = v88;
  v130.origin.y = v89;
  v130.size.width = v117;
  v130.size.height = v118;
  MidX = CGRectGetMidX(v130);
  v131.origin.x = v88;
  v131.origin.y = v89;
  v131.size.width = v117;
  v131.size.height = v118;
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v31, v88, v89, v117, v118, MidX, CGRectGetMidY(v131));
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v32, v91 - v111);
  v96 = v120;
  if (v33)
    v97 = v119;
  else
    v97 = v120;
  if (!v33)
    v96 = v119;
  v132 = CGRectInset(*(CGRect *)&v92, -v97, -v96);
  x = v132.origin.x;
  y = v132.origin.y;
  width = v132.size.width;
  height = v132.size.height;

  v102 = x;
  v103 = y;
  v104 = width;
  v105 = height;
  result.size.height = v105;
  result.size.width = v104;
  result.origin.y = v103;
  result.origin.x = v102;
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
  int v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  double Alpha;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  id v37;
  id v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v7 = a5;
  v38 = a3;
  v10 = a6;
  CGContextSaveGState(a4);
  objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v38, v7, v10);
  v11 = objc_msgSend(v38, "hasShadow");
  if (v11)
    +[AKAnnotationRendererUtilities beginShadowInContext:forAnnotation:](AKAnnotationRendererUtilities, "beginShadowInContext:forAnnotation:", a4, v38);
  CGContextSaveGState(a4);
  objc_msgSend(v38, "strokeColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v38, "strokeColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v13, "CGColor"));

    objc_msgSend(v38, "strokeColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v14, "CGColor"));

    objc_msgSend(v38, "strokeWidth");
    +[AKAnnotationRendererUtilities setStandardLineStateInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineStateInContext:forLineWidth:", a4);
    if (objc_msgSend(v38, "isDashed"))
    {
      objc_msgSend(v38, "strokeWidth");
      +[AKAnnotationRendererUtilities setStandardLineDashInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineDashInContext:forLineWidth:", a4);
    }
    objc_msgSend(a1, "_drawPathForArrow:inContext:inPath:pageControllerForPixelAlignmentOrNil:minimumGrabbableBorderThickness:", v38, a4, 0, v10, 1.0);
  }
  CGContextRestoreGState(a4);
  objc_msgSend(v38, "fillColor");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v38, "fillColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    Alpha = CGColorGetAlpha((CGColorRef)objc_msgSend(v17, "CGColor"));

    if (Alpha != 0.0)
    {
      objc_msgSend(a1, "_concreteTextBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", v38, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      if (+[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", objc_msgSend(v38, "originalExifOrientation")))
      {
        v27 = -1.0;
        v28 = -5.0;
      }
      else
      {
        v27 = -5.0;
        v28 = -1.0;
      }
      v39.origin.x = v20;
      v39.origin.y = v22;
      v39.size.width = v24;
      v39.size.height = v26;
      v40 = CGRectInset(v39, v27, v28);
      v41 = CGRectInset(v40, 1.0, 1.0);
      +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v10, a4, v38, v41.origin.x, v41.origin.y, v41.size.width, v41.size.height, 0.0);
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;
      objc_msgSend(v38, "fillColor");
      v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v37, "CGColor"));

      v42.origin.x = v30;
      v42.origin.y = v32;
      v42.size.width = v34;
      v42.size.height = v36;
      CGContextFillRect(a4, v42);
    }
  }
  +[AKTextAnnotationRenderHelper renderAnnotationText:intoContext:isForScreen:pageControllerOrNil:](AKTextAnnotationRenderHelper, "renderAnnotationText:intoContext:isForScreen:pageControllerOrNil:", v38, a4, v7, v10);
  if (v11)
    +[AKAnnotationRendererUtilities endShadowInContext:](AKAnnotationRendererUtilities, "endShadowInContext:", a4);
  CGContextRestoreGState(a4);

}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  const CGPath *Mutable;
  CGPoint v12;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  Mutable = CGPathCreateMutable();
  objc_msgSend(a1, "_drawPathForArrow:inContext:inPath:pageControllerForPixelAlignmentOrNil:minimumGrabbableBorderThickness:", v9, 0, Mutable, 0, a5);

  v12.x = x;
  v12.y = y;
  LOBYTE(a1) = CGPathContainsPoint(Mutable, 0, v12, 0);
  CGPathRelease(Mutable);
  return (char)a1;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a1, "_concreteTextBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", a4, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

+ (void)_drawPathForArrow:(id)a3 inContext:(CGContext *)a4 inPath:(CGPath *)a5 pageControllerForPixelAlignmentOrNil:(id)a6 minimumGrabbableBorderThickness:(double)a7
{
  id v12;
  id v13;
  double v14;
  double v15;
  const CGPath *Mutable;
  const CGPath *v17;
  uint64_t v18;
  const CGPath *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  AKTSDShape *v24;
  void *v25;
  uint64_t v26;
  const CGPath *v27;
  double v28;
  CGPath *v29;
  CGPath *v30;
  const CGPath *v31;
  uint64_t v32;
  const CGPath *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;

  v12 = a3;
  v13 = a6;
  objc_msgSend(v12, "strokeWidth");
  v15 = v14;
  v36 = 1.0;
  v37 = 0.0;
  Mutable = CGPathCreateMutable();
  v17 = CGPathCreateMutable();
  objc_msgSend(a1, "_arrowHeadPathsForArrow:inOutStartArrowHead:outBezierStartParameter:inOutEndArrowHead:outBezierEndParameter:", v12, Mutable, &v37, v17, &v36);
  if (!a4)
  {
    if (!a5
      || (CGPathAddPath(a5, 0, Mutable),
          CGPathAddPath(a5, 0, v17),
          (v26 = objc_msgSend(a1, "_newLinePathForArrow:withHeads:fromBezierParameter:toBezierParameter:optionalPageController:optionalContext:", v12, 1, v13, 0, v37, v36)) == 0))
    {
LABEL_21:
      if (!Mutable)
        goto LABEL_23;
      goto LABEL_22;
    }
    v27 = (const CGPath *)v26;
    if (v15 >= a7)
      v28 = v15;
    else
      v28 = a7;
    v29 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:withStrokeWidth:](AKAnnotationRendererUtilities, "newStandardStrokedBorderPathWithPath:withStrokeWidth:", v26, v28, *(_QWORD *)&v36, *(_QWORD *)&v37);
    if (v29)
    {
      v30 = v29;
      CGPathAddPath(a5, 0, v29);
      CFRelease(v30);
    }
    v31 = v27;
LABEL_20:
    CFRelease(v31);
    goto LABEL_21;
  }
  if (!objc_msgSend(v12, "brushStyle"))
  {
    CGContextBeginPath(a4);
    CGContextAddPath(a4, Mutable);
    CGContextAddPath(a4, v17);
    CGContextFillPath(a4);
    CGContextStrokePath(a4);
  }
  if (!objc_msgSend(v12, "brushStyle", *(_QWORD *)&v36, *(_QWORD *)&v37))
  {
    v32 = objc_msgSend(a1, "_newLinePathForArrow:withHeads:fromBezierParameter:toBezierParameter:optionalPageController:optionalContext:", v12, 1, v13, a4, v37, v36);
    if (!v32)
      goto LABEL_21;
    v33 = (const CGPath *)v32;
    CGContextBeginPath(a4);
    CGContextAddPath(a4, v33);
    CGContextStrokePath(a4);
    v31 = v33;
    goto LABEL_20;
  }
  v18 = objc_msgSend(a1, "_newLinePathForArrow:withHeads:fromBezierParameter:toBezierParameter:optionalPageController:optionalContext:", v12, 0, 0, 0, v37, v36);
  if (!v18)
    goto LABEL_21;
  v19 = (const CGPath *)v18;
  v20 = objc_msgSend(v12, "brushStyle");
  objc_msgSend(v12, "strokeColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "strokeWidth");
  +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[AKTSDBezierPath bezierPathWithCGPath:](AKTSDBezierPath, "bezierPathWithCGPath:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(AKTSDShape);
  -[AKTSDShape setStroke:](v24, "setStroke:", v22);
  -[AKTSDShape setPath:](v24, "setPath:", v23);
  if (objc_msgSend(v12, "arrowHeadStyle") == 1)
  {
    if (CGPathIsEmpty(Mutable))
      goto LABEL_35;
    -[AKTSDShape setHeadLineEnd:](v24, "setHeadLineEnd:", 0);
    goto LABEL_9;
  }
  if (objc_msgSend(v12, "arrowHeadStyle") == 2)
  {
    if (CGPathIsEmpty(v17))
      goto LABEL_35;
    +[AKTSDLineEnd lineEndWithType:](AKTSDLineEnd, "lineEndWithType:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTSDShape setHeadLineEnd:](v24, "setHeadLineEnd:", v34);

  }
  else
  {
    if (objc_msgSend(v12, "arrowHeadStyle") != 3)
      goto LABEL_35;
    if (CGPathIsEmpty(v17))
    {
      -[AKTSDShape setHeadLineEnd:](v24, "setHeadLineEnd:", 0);
    }
    else
    {
      +[AKTSDLineEnd lineEndWithType:](AKTSDLineEnd, "lineEndWithType:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKTSDShape setHeadLineEnd:](v24, "setHeadLineEnd:", v35);

    }
    if (!CGPathIsEmpty(Mutable))
    {
LABEL_9:
      +[AKTSDLineEnd lineEndWithType:](AKTSDLineEnd, "lineEndWithType:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKTSDShape setTailLineEnd:](v24, "setTailLineEnd:", v25);

      goto LABEL_35;
    }
  }
  -[AKTSDShape setTailLineEnd:](v24, "setTailLineEnd:", 0);
LABEL_35:
  -[AKTSDShape drawInContext:](v24, "drawInContext:", a4);
  CGPathRelease(v19);

  if (Mutable)
LABEL_22:
    CFRelease(Mutable);
LABEL_23:
  if (v17)
    CFRelease(v17);

}

+ (unint64_t)_drawableArrowHeads:(id)a3
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  char v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  long double v12;
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
  double v25;
  long double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  v3 = a3;
  objc_msgSend(v3, "strokeWidth");
  v5 = v4 * 5.0;
  v6 = ~objc_msgSend(v3, "arrowHeadStyle") & 3;
  v7 = objc_msgSend(v3, "arrowHeadStyle");
  if (v6)
  {
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v3, "startPoint");
      v24 = v23;
      objc_msgSend(v3, "endPoint");
      v26 = v24 - v25;
      objc_msgSend(v3, "startPoint");
      v28 = v27;
      objc_msgSend(v3, "endPoint");
      v8 = hypot(v26, v28 - v29) > v5;
    }
    else
    {
      v8 = 0;
    }
    if ((objc_msgSend(v3, "arrowHeadStyle") & 2) != 0)
    {
      objc_msgSend(v3, "startPoint");
      v31 = v30;
      objc_msgSend(v3, "endPoint");
      v19 = v31 - v32;
      objc_msgSend(v3, "startPoint");
      v21 = v33;
      objc_msgSend(v3, "endPoint");
LABEL_12:
      if (hypot(v19, v21 - v22) > v5)
        v8 |= 2uLL;
    }
  }
  else
  {
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v3, "startPoint");
      v10 = v9;
      objc_msgSend(v3, "midPoint");
      v12 = v10 - v11;
      objc_msgSend(v3, "startPoint");
      v14 = v13;
      objc_msgSend(v3, "midPoint");
      v8 = hypot(v12, v14 - v15) > v5;
    }
    else
    {
      v8 = 0;
    }
    if ((objc_msgSend(v3, "arrowHeadStyle") & 2) != 0)
    {
      objc_msgSend(v3, "endPoint");
      v17 = v16;
      objc_msgSend(v3, "midPoint");
      v19 = v17 - v18;
      objc_msgSend(v3, "endPoint");
      v21 = v20;
      objc_msgSend(v3, "midPoint");
      goto LABEL_12;
    }
  }

  return v8;
}

+ (void)_arrowHeadPathsForArrow:(id)a3 inOutStartArrowHead:(CGPath *)a4 outBezierStartParameter:(double *)a5 inOutEndArrowHead:(CGPath *)a6 outBezierEndParameter:(double *)a7
{
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  double v23;
  char v24;
  char v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  int64x2_t v43;
  int64x2_t v44;

  v12 = a3;
  objc_msgSend(v12, "strokeWidth");
  v14 = v13;
  objc_msgSend(v12, "endPoint");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v12, "startPoint");
  if (v19 != v16 || v20 != v18)
  {
    v22 = v19;
    v23 = v20;
    v42 = v14;
    v43 = vdupq_n_s64(0x43E0000000000000uLL);
    v44 = v43;
    objc_msgSend(a1, "_arrowHeadLineIntersection:outStartIntersection:outBezierStartParameter:outEndIntersection:outBezierEndParameter:", v12, &v44, a5, &v43, a7);
    v24 = objc_msgSend(a1, "_drawableArrowHeads:", v12);
    v25 = v24;
    if (a4)
    {
      if ((v24 & 1) != 0)
      {
        v27 = *(double *)&v44.i64[1];
        v26 = *(double *)v44.i64;
        v28 = v22 - *(double *)v44.i64;
        v29 = v23 - *(double *)&v44.i64[1];
        v30 = hypot(v22 - *(double *)v44.i64, v23 - *(double *)&v44.i64[1]);
        if (fabs(v30) >= 0.0005)
        {
          v31 = v42 * v29 * 2.5 / v30;
          v32 = v26 - v31;
          v33 = v42 * v28 * 2.5 / v30;
          CGPathMoveToPoint(a4, 0, v32, v27 + v33);
          CGPathAddLineToPoint(a4, 0, v22, v23);
          CGPathAddLineToPoint(a4, 0, v31 + *(double *)v44.i64, *(double *)&v44.i64[1] - v33);
          CGPathCloseSubpath(a4);
        }
      }
    }
    if (a6)
    {
      if ((v25 & 2) != 0)
      {
        v35 = *(double *)&v43.i64[1];
        v34 = *(double *)v43.i64;
        v36 = v16 - *(double *)v43.i64;
        v37 = v18 - *(double *)&v43.i64[1];
        v38 = hypot(v16 - *(double *)v43.i64, v18 - *(double *)&v43.i64[1]);
        if (fabs(v38) >= 0.0005)
        {
          v39 = v42 * v37 * 2.5 / v38;
          v40 = v34 - v39;
          v41 = v42 * v36 * 2.5 / v38;
          CGPathMoveToPoint(a6, 0, v40, v35 + v41);
          CGPathAddLineToPoint(a6, 0, v16, v18);
          CGPathAddLineToPoint(a6, 0, v39 + *(double *)v43.i64, *(double *)&v43.i64[1] - v41);
          CGPathCloseSubpath(a6);
        }
      }
    }
  }

}

+ (void)_controlPointsForArrow:(id)a3 outControlPoint1:(CGPoint *)a4 outControlPoint2:(CGPoint *)a5
{
  id v7;
  double v8;
  double v9;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  long double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;

  v7 = a3;
  objc_msgSend(v7, "endPoint");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "startPoint");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "midPoint");
  v17 = v16;
  v19 = v18;

  v34 = hypot(v9 - v13, v11 - v15);
  +[AKGeometryHelper normalizeVector:](AKGeometryHelper, "normalizeVector:", v9 - v13, v11 - v15);
  v21 = v20;
  v23 = v22;
  v24 = (v9 + v13) * 0.5;
  v25 = (v11 + v15) * 0.5;
  v26 = v19 - v25;
  v27 = hypot(v17 - v24, v19 - v25);
  v28 = v27 / 0.75;
  if (v27 == 0.0)
  {
    v29 = 0.0;
    v30 = 1.0;
  }
  else
  {
    +[AKGeometryHelper normalizeVector:](AKGeometryHelper, "normalizeVector:", v17 - v24, v26);
  }
  v31 = v24 + v28 * v30;
  v32 = v25 + v28 * v29;
  v33 = v34 * 0.166666667;
  if (a4)
  {
    a4->x = v31 - v33 * v21;
    a4->y = v32 - v33 * v23;
  }
  if (a5)
  {
    a5->x = v31 + v33 * v21;
    a5->y = v32 + v33 * v23;
  }
}

+ (double)_oneDimensionalCubicBezierValueForParameter:(double)a3 start:(double)a4 controlPt1:(double)a5 controlPt2:(double)a6 end:(double)a7
{
  double v7;

  v7 = 1.0 - a3;
  return v7 * v7 * (a5 * 3.0) * a3 + a4 * (v7 * (v7 * v7)) + v7 * (a6 * 3.0) * (a3 * a3) + a7 * (a3 * a3 * a3);
}

+ (CGPoint)_cubicBezierPointForParameter:(double)a3 start:(CGPoint)a4 controlPt1:(CGPoint)a5 controlPt2:(CGPoint)a6 end:(CGPoint)a7
{
  double y;
  double v8;
  double v9;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  y = a6.y;
  v8 = a5.y;
  v9 = a4.y;
  objc_msgSend(a1, "_oneDimensionalCubicBezierValueForParameter:start:controlPt1:controlPt2:end:", a3, a4.x, a5.x, a6.x, a7.x);
  v13 = v12;
  objc_msgSend(a1, "_oneDimensionalCubicBezierValueForParameter:start:controlPt1:controlPt2:end:", a3, v9, v8, y, a7.y);
  v15 = v14;
  v16 = v13;
  result.y = v15;
  result.x = v16;
  return result;
}

+ (void)_arrowHeadLineIntersection:(id)a3 outStartIntersection:(CGPoint *)a4 outBezierStartParameter:(double *)a5 outEndIntersection:(CGPoint *)a6 outBezierEndParameter:(double *)a7
{
  id v12;
  char v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v26;
  double v27;
  double v28;
  double v30;
  double v31;
  double v32;
  double v33;

  v12 = a3;
  v13 = objc_msgSend(a1, "_drawableArrowHeads:", v12);
  objc_msgSend(v12, "startPoint");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v12, "endPoint");
  v19 = v18;
  v21 = v20;
  objc_msgSend(v12, "strokeWidth");
  objc_msgSend(v12, "brushStyle");
  v32 = 0.0;
  v33 = 0.0;
  v30 = 0.0;
  v31 = 0.0;
  objc_msgSend(a1, "_controlPointsForArrow:outControlPoint1:outControlPoint2:", v12, &v32, &v30);
  if ((v13 & 2) != 0)
  {
    objc_msgSend(v12, "endPoint");
    v22 = 1.0;
    while (v22 > 0.0)
    {
      v22 = v22 + -0.025;
      objc_msgSend(a1, "_cubicBezierPointForParameter:start:controlPt1:controlPt2:end:", v22, v15, v17, v32, v33, v30, v31, v19, v21);
      +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", 0);
      if (v23 != 9.22337204e18 && v24 != 9.22337204e18)
      {
        if (a6)
        {
          a6->x = v23;
          a6->y = v24;
        }
        if (a7)
          *a7 = v22 + 0.025;
        break;
      }
    }
  }
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v12, "startPoint");
    v26 = 0.0;
    while (v26 < 1.0)
    {
      v26 = v26 + 0.025;
      objc_msgSend(a1, "_cubicBezierPointForParameter:start:controlPt1:controlPt2:end:", v26, v15, v17, v32, v33, v30, v31, v19, v21);
      +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", 0);
      if (v27 != 9.22337204e18 && v28 != 9.22337204e18)
      {
        if (a4)
        {
          a4->x = v27;
          a4->y = v28;
        }
        if (a5)
          *a5 = v26 + -0.025;
        break;
      }
    }
  }

}

+ (CGPath)_newLinePathForArrow:(id)a3 withHeads:(BOOL)a4 fromBezierParameter:(double)a5 toBezierParameter:(double)a6 optionalPageController:(id)a7 optionalContext:(CGContext *)a8
{
  _BOOL4 v12;
  id v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat MinX;
  CGFloat MinY;
  uint64_t v25;
  CGPath *Mutable;
  CGPath *v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double MaxY;
  double x;
  double y;
  double width;
  double height;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  double MaxX;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v12 = a4;
  v14 = a3;
  v15 = (unint64_t)a7;
  v70 = 0.0;
  v71 = 0.0;
  v68 = 0.0;
  v69 = 0.0;
  objc_msgSend(v14, "endPoint");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v14, "startPoint");
  MinX = v21;
  MinY = v20;
  if (v21 == v17 && v20 == v19)
  {
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, MinX, MinY);
    v27 = Mutable;
    v28 = MinX;
    v29 = MinY;
    goto LABEL_8;
  }
  objc_msgSend(a1, "_controlPointsForArrow:outControlPoint1:outControlPoint2:", v14, &v70, &v68);
  if (v12)
    v25 = objc_msgSend(a1, "_drawableArrowHeads:", v14) & 3;
  else
    v25 = 0;
  if (v15 | (unint64_t)a8)
  {
    if (vabdd_f64(MinX, v17) >= 0.0005 || vabdd_f64(v17, v70) >= 0.0005 || vabdd_f64(v70, v68) >= 0.0005)
    {
      if (vabdd_f64(MinY, v19) < 0.0005 && vabdd_f64(v19, v71) < 0.0005 && vabdd_f64(v71, v69) < 0.0005)
      {
        v77.size.width = v17 - MinX;
        v77.size.height = v19 - MinY;
        v77.origin.x = MinX;
        v77.origin.y = MinY;
        v78 = CGRectStandardize(v77);
        x = v78.origin.x;
        y = v78.origin.y;
        width = v78.size.width;
        height = v78.size.height;
        objc_msgSend(v14, "strokeWidth");
        +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v15, a8, v14, x, y, width, height, v48);
        v53 = v49;
        v54 = v50;
        v55 = v51;
        if (MinX <= v17)
        {
          v56 = v52;
          MinX = CGRectGetMinX(*(CGRect *)&v49);
          v83.origin.x = v53;
          v83.origin.y = v54;
          v83.size.width = v55;
          v83.size.height = v56;
          MinY = CGRectGetMinY(v83);
          v84.origin.x = v53;
          v84.origin.y = v54;
          v84.size.width = v55;
          v84.size.height = v56;
          MaxX = CGRectGetMaxX(v84);
        }
        else
        {
          v56 = v52;
          MinX = CGRectGetMaxX(*(CGRect *)&v49);
          v79.origin.x = v53;
          v79.origin.y = v54;
          v79.size.width = v55;
          v79.size.height = v56;
          MinY = CGRectGetMinY(v79);
          v80.origin.x = v53;
          v80.origin.y = v54;
          v80.size.width = v55;
          v80.size.height = v56;
          MaxX = CGRectGetMinX(v80);
        }
        v85.size.height = v56;
        v17 = MaxX;
        v85.origin.x = v53;
        v85.origin.y = v54;
        v85.size.width = v55;
        v19 = CGRectGetMinY(v85);
        v71 = MinY;
        v69 = MinY;
        if (v25)
          goto LABEL_24;
LABEL_31:
        Mutable = CGPathCreateMutable();
        CGPathMoveToPoint(Mutable, 0, MinX, MinY);
        CGPathAddCurveToPoint(Mutable, 0, v70, v71, v68, v69, v17, v19);
        goto LABEL_32;
      }
    }
    else
    {
      v72.size.width = v17 - MinX;
      v72.size.height = v19 - MinY;
      v72.origin.x = MinX;
      v72.origin.y = MinY;
      v73 = CGRectStandardize(v72);
      v30 = v73.origin.x;
      v31 = v73.origin.y;
      v32 = v73.size.width;
      v33 = v73.size.height;
      objc_msgSend(v14, "strokeWidth");
      +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v15, a8, v14, v30, v31, v32, v33, v34);
      v35 = v74.origin.x;
      v36 = v74.origin.y;
      v37 = v74.size.height;
      v67 = v74.size.width;
      MinX = CGRectGetMinX(v74);
      v38 = v35;
      v39 = v36;
      v40 = v67;
      v41 = v37;
      if (MinY <= v19)
      {
        MinY = CGRectGetMinY(*(CGRect *)&v38);
        v81.origin.x = v35;
        v81.origin.y = v36;
        v81.size.width = v67;
        v81.size.height = v37;
        v58 = CGRectGetMinX(v81);
        v82.size.height = v37;
        v17 = v58;
        v82.origin.x = v35;
        v82.origin.y = v36;
        v82.size.width = v67;
        MaxY = CGRectGetMaxY(v82);
      }
      else
      {
        MinY = CGRectGetMaxY(*(CGRect *)&v38);
        v75.origin.x = v35;
        v75.origin.y = v36;
        v75.size.width = v67;
        v75.size.height = v37;
        v42 = CGRectGetMinX(v75);
        v76.size.height = v37;
        v17 = v42;
        v76.origin.x = v35;
        v76.origin.y = v36;
        v76.size.width = v67;
        MaxY = CGRectGetMinY(v76);
      }
      v19 = MaxY;
      v70 = MinX;
      v68 = MinX;
    }
  }
  if (!v25)
    goto LABEL_31;
LABEL_24:
  objc_msgSend(a1, "_cubicBezierPointForParameter:start:controlPt1:controlPt2:end:", a5, MinX, MinY, v70, v71, v68, v69, *(_QWORD *)&v17, *(_QWORD *)&v19);
  v60 = v59;
  v62 = v61;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v60, v62);
  v63 = a6 + 0.025;
  if (v63 < a5)
    goto LABEL_32;
  while (a5 < 1.0)
  {
    objc_msgSend(a1, "_cubicBezierPointForParameter:start:controlPt1:controlPt2:end:", a5, MinX, MinY, v70, v71, v68, v69, *(_QWORD *)&v17, *(_QWORD *)&v19);
    CGPathAddLineToPoint(Mutable, 0, v64, v65);
    a5 = a5 + 0.025;
    if (a5 > v63)
      goto LABEL_32;
  }
  objc_msgSend(a1, "_cubicBezierPointForParameter:start:controlPt1:controlPt2:end:", 0.99, MinX, MinY, v70, v71, v68, v69, *(_QWORD *)&v17, *(_QWORD *)&v19);
  v27 = Mutable;
LABEL_8:
  CGPathAddLineToPoint(v27, 0, v28, v29);
LABEL_32:

  return Mutable;
}

@end
