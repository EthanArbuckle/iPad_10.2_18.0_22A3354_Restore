@implementation AKInkAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  CGRect v3;

  objc_msgSend(a3, "rectangle");
  return CGRectInset(v3, -1.0, -1.0);
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
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  uint64_t v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  int64_t v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  int Type;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  BOOL v51;
  double v52;
  double v53;
  void *v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  double v69;
  long double v70;
  double v71;
  double v72;
  double v73;
  long double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGInterpolationQuality v90;
  CGImage *v91;
  double v92;
  double v93;
  double rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGFloat rect_24a;
  CGFloat v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  double v102;
  CGFloat v103;
  CGFloat v104;
  double v105;
  CGFloat v106;
  double v107;
  double v108;
  CGFloat v109;
  double v110;
  double v111;
  double v112;
  double v113;
  CGAffineTransform v114;
  CGAffineTransform v115;
  CGAffineTransform v116;
  _QWORD v117[4];
  CGAffineTransform v118;
  CGAffineTransform transform;
  CGAffineTransform v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  CGContextSaveGState(a4);
  objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v10, v7, v11);

  objc_msgSend(v10, "drawing");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "strokes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      objc_msgSend(v13, "bounds");
      v108 = v17;
      v111 = v16;
      v105 = v18;
      v112 = v19;
      objc_msgSend(v10, "rectangle");
      x = v121.origin.x;
      y = v121.origin.y;
      width = v121.size.width;
      height = v121.size.height;
      MidX = CGRectGetMidX(v121);
      v122.origin.x = x;
      v122.origin.y = y;
      v122.size.width = width;
      v122.size.height = height;
      MidY = CGRectGetMidY(v122);
      v26 = objc_msgSend(v10, "originalExifOrientation");
      v27 = x;
      v28 = y;
      v29 = width;
      v30 = height;
      if (v26 != 1)
      {
        memset(&v120, 0, sizeof(v120));
        +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", v26), MidX, MidY);
        transform = v120;
        CGContextConcatCTM(a4, &transform);
        transform = v120;
        v123.origin.x = x;
        v123.origin.y = y;
        v123.size.width = width;
        v123.size.height = height;
        v124 = CGRectApplyAffineTransform(v123, &transform);
        *(CGRect *)(&v28 - 1) = CGRectStandardize(v124);
        v27 = v31;
      }
      v93 = MidX;
      rect_16 = v28;
      rect_24 = v29;
      v98 = v30;
      v92 = MidY;
      memset(&v120, 0, sizeof(v120));
      CGContextGetCTM(&v120, a4);
      v117[0] = MEMORY[0x24BDAC760];
      v117[1] = 3221225472;
      v117[2] = sub_22901BCE4;
      v117[3] = &unk_24F1A7CA8;
      v118 = v120;
      v32 = +[AKGeometryHelper exifOrientationWithConversionBlock:](AKGeometryHelper, "exifOrientationWithConversionBlock:", v117);
      transform = v120;
      v125.origin.x = x;
      v125.origin.y = y;
      v125.size.width = width;
      v125.size.height = height;
      v126 = CGRectApplyAffineTransform(v125, &transform);
      v127 = CGRectStandardize(v126);
      v128 = CGRectIntegral(v127);
      v100 = v128.size.height;
      v102 = v128.size.width;
      transform = v120;
      v128.origin.x = 0.0;
      v128.origin.y = 0.0;
      v128.size.width = 1.0;
      v128.size.height = 1.0;
      v129 = CGRectApplyAffineTransform(v128, &transform);
      v33 = v129.origin.x;
      v34 = v129.origin.y;
      v35 = v129.size.width;
      v36 = v129.size.height;
      v37 = CGRectGetWidth(v129);
      v130.origin.x = v33;
      v130.origin.y = v34;
      v130.size.width = v35;
      v130.size.height = v36;
      v38 = CGRectGetHeight(v130);
      if (v37 >= v38)
        v38 = v37;
      rect_8 = v38;
      v131.origin.x = v27;
      v131.origin.y = rect_16;
      v131.size.width = rect_24;
      v131.size.height = v98;
      v39 = CGRectGetWidth(v131);
      v132.origin.x = v111;
      v132.origin.y = v108;
      v132.size.width = v105;
      v132.size.height = v112;
      v40 = v39 / CGRectGetWidth(v132);
      v133.origin.x = v27;
      v133.origin.y = rect_16;
      v133.size.width = rect_24;
      v133.size.height = v98;
      v41 = CGRectGetHeight(v133);
      v134.origin.x = v111;
      v134.origin.y = v108;
      v134.size.width = v105;
      v134.size.height = v112;
      v42 = v41 / CGRectGetHeight(v134);
      if (v40 < v42)
        v42 = v40;
      v43 = rect_8 * v42;
      Type = CGContextGetType();
      if (Type == 6 || Type == 1)
      {
        v45 = v43 * 4.16666667;
        v46 = v102 * 4.16666667;
        v47 = v100 * 4.16666667;
      }
      else
      {
        v45 = v43;
        v47 = v100;
        v46 = v102;
      }
      if (v46 >= v47)
        v48 = v46;
      else
        v48 = v47;
      +[AKInkRendererHelper maxRenderingSize](AKInkRendererHelper, "maxRenderingSize");
      v50 = v49;
      v51 = v48 <= v49;
      v52 = v45 * (v49 / v48);
      if (v51)
        v53 = v45;
      else
        v53 = v52;
      +[AKInkRendererHelper renderDrawing:clippedToStrokeSpaceRect:scale:](AKInkRendererHelper, "renderDrawing:clippedToStrokeSpaceRect:scale:", v13, v111, v108, v105, v112, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54)
      {
        memset(&transform, 0, sizeof(transform));
        CGAffineTransformMakeScale(&transform, v43, v43);
        v116 = transform;
        v135.origin.x = v111;
        v135.origin.y = v108;
        v135.size.width = v105;
        v135.size.height = v112;
        v136 = CGRectApplyAffineTransform(v135, &v116);
        v55 = v136.origin.x;
        v113 = v48;
        v56 = v136.origin.y;
        v57 = v136.size.width;
        v58 = v136.size.height;
        v137 = CGRectIntegral(v136);
        v106 = v137.origin.y;
        v109 = v137.origin.x;
        v103 = v137.size.width;
        v59 = v137.size.height;
        memset(&v116, 0, sizeof(v116));
        +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v32, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
        v115 = v116;
        v138.origin.x = v55;
        v138.origin.y = v56;
        v138.size.width = v57;
        v138.size.height = v58;
        v139 = CGRectApplyAffineTransform(v138, &v115);
        v60 = v139.origin.x;
        v101 = v139.origin.y;
        v61 = v139.size.width;
        v62 = v139.size.height;
        v115 = v116;
        v139.origin.y = v106;
        v139.origin.x = v109;
        v139.size.width = v103;
        v139.size.height = v59;
        v140 = CGRectApplyAffineTransform(v139, &v115);
        rect_24a = v140.origin.x;
        v63 = v140.origin.y;
        v64 = v140.size.width;
        v65 = v140.size.height;
        v107 = round(v140.size.width);
        v110 = round(v140.size.height);
        v104 = v120.tx + v92 * v120.c + v120.a * v93;
        v99 = v120.ty + v92 * v120.d + v120.b * v93;
        v66 = CGRectGetMidX(v140);
        v141.origin.x = v60;
        v141.origin.y = v101;
        v141.size.width = v61;
        v141.size.height = v62;
        v67 = v66 - CGRectGetMidX(v141);
        v142.origin.x = rect_24a;
        v142.origin.y = v63;
        v142.size.width = v64;
        v142.size.height = v65;
        v68 = CGRectGetMidY(v142);
        v143.origin.x = v60;
        v143.origin.y = v101;
        v143.size.width = v61;
        v143.size.height = v62;
        v69 = v99 + v68 - CGRectGetMidY(v143);
        v70 = fmod(v107, 2.0);
        v71 = round(v104 + v67 + 0.5) + -0.5;
        v72 = round(v104 + v67);
        if (v70 == 0.0)
          v73 = v72;
        else
          v73 = v71;
        v74 = fmod(v110, 2.0);
        v75 = round(v69 + 0.5) + -0.5;
        v76 = round(v69);
        if (v74 == 0.0)
          v77 = v76;
        else
          v77 = v75;
        +[AKGeometryHelper rectWithSize:centeredAtPoint:](AKGeometryHelper, "rectWithSize:centeredAtPoint:", v107, v110, v73, v77);
        v79 = v78;
        v81 = v80;
        v83 = v82;
        v85 = v84;
        v114 = v120;
        memset(&v115, 0, sizeof(v115));
        CGAffineTransformInvert(&v115, &v114);
        v114 = v115;
        v144.origin.x = v79;
        v144.origin.y = v81;
        v144.size.width = v83;
        v144.size.height = v85;
        v145 = CGRectApplyAffineTransform(v144, &v114);
        v86 = v145.origin.x;
        v87 = v145.origin.y;
        v88 = v145.size.width;
        v89 = v145.size.height;
        if (v113 <= v50)
          v90 = kCGInterpolationNone;
        else
          v90 = kCGInterpolationHigh;
        CGContextSetInterpolationQuality(a4, v90);
        v91 = (CGImage *)objc_msgSend(v54, "akCGImage");
        v146.origin.x = v86;
        v146.origin.y = v87;
        v146.size.width = v88;
        v146.size.height = v89;
        CGContextDrawImage(a4, v146, v91);
      }

    }
  }
  CGContextRestoreGState(a4);

}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  return 0;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  return 0;
}

@end
