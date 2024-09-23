@implementation AKTextAnnotationRenderHelper

+ (void)getAnnotationRectangle:(CGRect *)a3 textBounds:(CGRect *)a4 containerSize:(CGSize *)a5 exclusionPaths:(id *)a6 isTextClipped:(BOOL *)a7 forAnnotation:(id)a8 onPageController:(id)a9 orInContext:(CGContext *)a10 shouldAlignToPixels:(BOOL)a11 optionalText:(id)a12 optionalCenter:(CGPoint)a13 optionalProposedRectangle:(CGRect)a14
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v22;
  double v23;
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  _BOOL4 v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  int v35;
  double *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _BOOL4 v51;
  double MidX;
  BOOL v53;
  int v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  _BOOL4 v64;
  BOOL v65;
  _BOOL4 v66;
  int v67;
  id v68;
  char v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  id v74;
  CGPath *v75;
  const CGPath *v76;
  void *v77;
  id *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  char v83;
  double v84;
  CGPath *Mutable;
  CGFloat v86;
  CGFloat MinY;
  CGFloat v88;
  char v89;
  double v90;
  id v91;
  double v92;
  double v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  int v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  void *v103;
  char v104;
  uint64_t v105;
  void *v106;
  double v107;
  double v108;
  double v109;
  int v110;
  double v111;
  unint64_t v112;
  void *v113;
  char v114;
  unint64_t v115;
  void *v116;
  double v117;
  char v118;
  double v119;
  double v120;
  double v121;
  double v122;
  void *v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  _BOOL4 v129;
  _BOOL4 v130;
  int v131;
  int v132;
  double v133;
  double v134;
  double v135;
  double v136;
  void *v137;
  int v138;
  id v139;
  id v140;
  _BOOL4 v141;
  id v142;
  double v143;
  int64_t v144;
  uint64_t v145;
  double v146;
  CGFloat rect1;
  int rect1a;
  id v149;
  BOOL *v150;
  char v152;
  void *v153;
  CGFloat v154;
  CGFloat v155;
  CGFloat v156;
  void *v157;
  CGFloat v158;
  id *v159;
  CGFloat v160;
  void *v161;
  double v162;
  CGFloat rect;
  CGRect *v164;
  CGSize *v165;
  double v166;
  CGRect *v167;
  double v168;
  CGFloat v169;
  int v170;
  double v171;
  double v172;
  double v173;
  uint64_t v174;
  double MidY;
  void *v176;
  double txa;
  double tx;
  double v179;
  double v180;
  double v181;
  CGFloat v182;
  double MinX;
  CGAffineTransform v184;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v187;
  CGAffineTransform v188;
  CGAffineTransform m;
  void *v190;
  _QWORD v191[3];
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;

  height = a14.size.height;
  width = a14.size.width;
  y = a14.origin.y;
  x = a14.origin.x;
  v22 = a13.y;
  v23 = a13.x;
  v191[1] = *MEMORY[0x24BDAC8D0];
  v25 = a8;
  v26 = a9;
  v27 = a12;
  v164 = a4;
  v165 = a5;
  v167 = a3;
  v28 = (unint64_t)a3 | (unint64_t)a4 | (unint64_t)a5;
  v29 = v28 != 0;
  if (!v28 && !a6 && !a7)
  {
    v30 = 0;
    goto LABEL_142;
  }
  v160 = x;
  v169 = y;
  v182 = width;
  v31 = *MEMORY[0x24BDBF090];
  v32 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v34 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v33 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v35 = objc_msgSend(v25, "conformsToAKRectangularAnnotationProtocol");
  v36 = (double *)MEMORY[0x24BDBEFB0];
  v154 = v33;
  v156 = v32;
  v179 = v33;
  v37 = v34;
  v158 = v31;
  rect1 = height;
  if (v35)
  {
    v211.origin.x = v31;
    v31 = v160;
    v192.origin.x = v160;
    v32 = y;
    v192.origin.y = y;
    v37 = v182;
    v192.size.width = v182;
    v192.size.height = height;
    v211.size.height = v154;
    v211.origin.y = v156;
    v211.size.width = v34;
    if (CGRectEqualToRect(v192, v211))
    {
      objc_msgSend(v25, "rectangle");
      v31 = v38;
      v32 = v39;
      v37 = v40;
      v179 = v41;
      if (v23 != *v36 || v22 != v36[1])
      {
        v180 = v22;
        v43 = v38;
        v44 = v39;
        v45 = v23 - CGRectGetWidth(*(CGRect *)&v38) * 0.5;
        v193.origin.x = v43;
        v193.origin.y = v44;
        v193.size.width = v37;
        v193.size.height = v179;
        v46 = v180 - CGRectGetHeight(v193) * 0.5;
        v194.origin.x = v43;
        v194.origin.y = v44;
        v194.size.width = v37;
        v194.size.height = v179;
        txa = CGRectGetWidth(v194);
        v195.origin.x = v43;
        v22 = v180;
        v195.origin.y = v44;
        v195.size.width = v37;
        v195.size.height = v179;
        v179 = CGRectGetHeight(v195);
        v37 = txa;
        v31 = v45;
        v32 = v46;
        +[AKAnnotationRenderer textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:](AKAnnotationRenderer, "textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", v25, v27, v31, v46, txa, v179);
        goto LABEL_14;
      }
    }
    else
    {
      v179 = height;
    }
  }
  +[AKAnnotationRenderer textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:](AKAnnotationRenderer, "textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", v25, v27, v31, v32, v37, v179);
LABEL_14:
  MidY = v48;
  tx = v47;
  v171 = v49;
  v173 = v50;
  v51 = +[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:");
  if (v51)
  {
    v196.origin.x = v31;
    v196.origin.y = v32;
    v196.size.width = v37;
    v196.size.height = v179;
    tx = CGRectGetMidX(v196);
    v197.origin.x = v31;
    v197.origin.y = v32;
    v197.size.width = v37;
    v197.size.height = v179;
    MidY = CGRectGetMidY(v197);
    v171 = 0.0;
    v173 = 0.0;
  }
  v153 = v26;
  MidX = v23;
  v53 = v22 != v36[1] || v23 != *v36;
  v166 = v37;
  v162 = v31;
  if (!v53)
  {
    v54 = objc_msgSend(v25, "conformsToAKRectangularAnnotationProtocol");
    if (v54)
      v55 = v31;
    else
      v55 = tx;
    v56 = v32;
    if (v54)
    {
      v57 = v166;
    }
    else
    {
      v32 = MidY;
      v57 = v171;
    }
    if (v54)
      v58 = v179;
    else
      v58 = v173;
    v198.origin.x = v55;
    v198.origin.y = v32;
    v198.size.width = v57;
    v198.size.height = v58;
    MidX = CGRectGetMidX(v198);
    v199.origin.x = v55;
    v199.origin.y = v32;
    v32 = v56;
    v37 = v166;
    v199.size.width = v57;
    v199.size.height = v58;
    v22 = CGRectGetMidY(v199);
  }
  v145 = objc_msgSend(v25, "originalExifOrientation");
  v144 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:");
  v146 = MidX;
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", tx, MidY, v171, v173, MidX, v22);
  v168 = v59;
  v181 = v60;
  rect = v61;
  v63 = v62;
  v212.origin.x = v158;
  v200.origin.x = v160;
  v200.origin.y = v169;
  v200.size.width = v182;
  v200.size.height = rect1;
  v212.size.height = v154;
  v212.origin.y = v156;
  v212.size.width = v34;
  v64 = CGRectEqualToRect(v200, v212);
  v65 = v53 && v64;
  if (v53 && v64)
  {
    v170 = 0;
    rect1a = 0;
  }
  else
  {
    v66 = v64;
    v170 = objc_msgSend(v25, "textIsFixedHeight");
    if (v66)
      v67 = objc_msgSend(v25, "textIsFixedWidth") | a11;
    else
      v67 = 1;
    rect1a = v67;
  }
  v159 = a6;
  if (v27)
  {
    v68 = v27;
  }
  else
  {
    +[AKTextAnnotationAttributeHelper actualOrPlaceholderTextOfAnnotation:](AKTextAnnotationAttributeHelper, "actualOrPlaceholderTextOfAnnotation:", v25);
    v68 = (id)objc_claimAutoreleasedReturnValue();
    if (!v68)
      goto LABEL_41;
  }
  if (objc_msgSend(v68, "length"))
  {
    v69 = 0;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v25, "typingAttributes");
  v70 = v25;
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:attributes:](AKTextAnnotationAttributeHelper, "newTextStorageOriginalFontSavvyWithString:attributes:", CFSTR("|"), v71);

  v25 = v70;
  v69 = 1;
  v68 = v72;
LABEL_42:
  v149 = v27;
  if (objc_msgSend(v68, "length"))
    objc_msgSend(v68, "attributesAtIndex:effectiveRange:", 0, 0);
  else
    objc_msgSend(v25, "typingAttributes");
  v73 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "originalModelBaseScaleFactor");
  v157 = (void *)v73;
  +[AKTextAnnotationAttributeHelper typingAttributes:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "typingAttributes:byApplyingScaleFactor:", v73);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "originalModelBaseScaleFactor");
  v74 = +[AKTextAnnotationAttributeHelper newTextStorage:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "newTextStorage:byApplyingScaleFactor:", v68);

  v75 = +[AKAnnotationRenderer newTextExclusionPathForAnnotation:withOptionalAnnotationRect:](AKAnnotationRenderer, "newTextExclusionPathForAnnotation:withOptionalAnnotationRect:", v25, v31, v32, v37, v179);
  v150 = a7;
  if (v75)
  {
    v76 = v75;
    if (CGPathIsEmpty(v75))
    {
      CGPathRelease(v76);
      v77 = 0;
      v78 = v159;
      goto LABEL_49;
    }
    Mutable = CGPathCreateMutable();
    memset(&m, 0, sizeof(m));
    +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v145, MidX, v22);
    CGPathAddPath(Mutable, &m, v76);
    v203.origin.x = v168;
    v203.origin.y = v181;
    v203.size.width = rect;
    v203.size.height = v63;
    v204 = CGRectInset(v203, -1000.0, -1000.0);
    CGPathAddRect(Mutable, 0, v204);
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", Mutable);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    CGPathRelease(Mutable);
    memset(&v188, 0, sizeof(v188));
    v205.origin.x = v168;
    v205.origin.y = v181;
    v205.size.width = rect;
    v205.size.height = v63;
    v86 = -CGRectGetMinX(v205);
    v206.origin.x = v168;
    v206.origin.y = v181;
    v206.size.width = rect;
    v206.size.height = v63;
    MinY = CGRectGetMinY(v206);
    CGAffineTransformMakeTranslation(&v188, v86, -MinY);
    CGAffineTransformMakeScale(&t2, 1.0, -1.0);
    t1 = v188;
    CGAffineTransformConcat(&v187, &t1, &t2);
    v188 = v187;
    v207.origin.x = v168;
    v207.origin.y = v181;
    v207.size.width = rect;
    v207.size.height = v63;
    v88 = CGRectGetHeight(v207);
    CGAffineTransformMakeTranslation(&v184, 0.0, v88);
    t1 = v188;
    CGAffineTransformConcat(&v187, &t1, &v184);
    v188 = v187;
    objc_msgSend(v77, "applyTransform:", &v187);
    objc_msgSend(v77, "setUsesEvenOddFillRule:", 1);
    CGPathRelease(v76);
    v78 = v159;
    if (!v51)
      goto LABEL_52;
LABEL_49:
    v201.origin.x = tx;
    v201.origin.y = MidY;
    v201.size.width = v171;
    v201.size.height = v173;
    MinX = CGRectGetMidX(v201);
    v202.origin.x = tx;
    v202.origin.y = MidY;
    v202.size.width = v171;
    v202.size.height = v173;
    v79 = CGRectGetMidY(v202);
    v30 = 0;
    v81 = *MEMORY[0x24BDBF148];
    v80 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v82 = 0.0;
    v83 = 1;
    v84 = 0.0;
    v26 = v153;
    if ((v69 & 1) == 0)
      goto LABEL_129;
    goto LABEL_130;
  }
  v77 = 0;
  v78 = v159;
  if (v51)
    goto LABEL_49;
LABEL_52:
  v89 = rect1a ^ 1;
  if (!v153)
    v89 = 0;
  if ((v89 & 1) != 0)
  {
    objc_msgSend(v153, "maxPageRect");
    v172 = v90;
  }
  else
  {
    v208.origin.x = v168;
    v208.origin.y = v181;
    v208.size.width = rect;
    v208.size.height = v63;
    v172 = CGRectGetWidth(v208);
  }
  v91 = a1;
  if (!v77)
  {
    objc_msgSend(a1, "unconstrainedSizeForText:", v74);
    v93 = v172;
    if (v172 >= v92)
      v93 = v92;
    v172 = v93;
  }
  v152 = v69;
  v142 = v25;
  v143 = v32;
  v141 = v29;
  if (v65)
  {
    v174 = 1;
  }
  else
  {
    v94 = objc_msgSend(v74, "length");
    v95 = *MEMORY[0x24BDF6628];
    if (!v94
      || (objc_msgSend(v74, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BDF6628], 0, 0),
          (v96 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v161, "objectForKey:", v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v96)
      {
        objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v174 = objc_msgSend(v96, "alignment");

  }
  v97 = v170;
  v140 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:attributes:](AKTextAnnotationAttributeHelper, "newTextStorageOriginalFontSavvyWithString:attributes:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"), v161);
  objc_msgSend(v91, "unconstrainedSizeForText:");
  v99 = v98;
  v155 = v63;
  v100 = v98 * floor(v63 / v98);
  objc_msgSend(v91, "_sharedLayoutManager");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "textContainers");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "objectAtIndex:", 0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v103, "akSetContainerSize:", v172, 10000000.0);
  objc_msgSend(v103, "setExclusionPaths:", MEMORY[0x24BDBD1A8]);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0;
  v104 = 0;
  v105 = 9;
  v82 = v99;
  while (1)
  {
    v79 = v22 + v82 * -0.5;
    if (v77)
    {
      v30 = (void *)objc_msgSend(v77, "copy");
      memset(&m, 0, sizeof(m));
      CGAffineTransformMakeTranslation(&m, v168 - (v146 + v172 * -0.5), v181 - v79);
      v188 = m;
      objc_msgSend(v30, "applyTransform:", &v188);
      v191[0] = v30;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v191, 1);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "setExclusionPaths:", v106);

LABEL_71:
      MinX = v146 + v172 * -0.5;
      goto LABEL_72;
    }
    if (v174 == 2)
    {
      v210.origin.x = v168;
      v210.origin.y = v181;
      v210.size.width = rect;
      v210.size.height = v155;
      v30 = 0;
      MinX = CGRectGetMaxX(v210) - v172;
    }
    else
    {
      if (v174)
      {
        v30 = 0;
        goto LABEL_71;
      }
      v209.origin.x = v168;
      v209.origin.y = v181;
      v209.size.width = rect;
      v209.size.height = v155;
      MinX = CGRectGetMinX(v209);
      v30 = 0;
    }
LABEL_72:
    if ((v83 & 1) != 0)
      goto LABEL_101;
    v107 = v22;
    objc_msgSend(v74, "addLayoutManager:", v101);
    objc_msgSend(v101, "glyphRangeForTextContainer:", v103);
    objc_msgSend(v101, "usedRectForTextContainer:", v103);
    v109 = v108;
    objc_msgSend(v74, "removeLayoutManager:", v101);
    if (vabdd_f64(v82 / v99, ceil(v109 / v99)) < 0.0005)
    {
      v110 = 1;
      v111 = v82;
      goto LABEL_92;
    }
    if (v82 >= v109)
    {
      if ((v104 & 1) != 0)
      {
        v110 = 1;
        v111 = v82;
        v104 = 1;
        goto LABEL_92;
      }
      v104 = 0;
      v115 = vcvtpd_u64_f64((v82 - v109) / v99);
      if (v115 <= 1)
        v115 = 1;
      v111 = v82 - (double)v115 * v99;
LABEL_90:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v111);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "addObject:", v116);

      v110 = 0;
      goto LABEL_91;
    }
    v112 = vcvtpd_u64_f64((v109 - v82) / v99);
    if (v112 <= 1)
      v112 = 1;
    v111 = v82 + (double)v112 * v99;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v111);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v176, "containsObject:", v113);

    if ((v114 & 1) == 0)
      goto LABEL_90;
    v110 = 0;
    v104 = 1;
LABEL_91:
    v97 = v170;
LABEL_92:
    if ((v110 & v97 & (v111 > v100)) != 0)
      v83 = 1;
    if (!v105 || (v110 & !((v110 & v97) & (v111 > v100))) != 0)
      break;
    if ((v110 & v97 & (v111 > v100)) != 0)
      v82 = v100;
    else
      v82 = v111;

    --v105;
    v22 = v107;
  }
  v22 = v107;
LABEL_101:
  v117 = 0.0;
  v25 = v142;
  v118 = v152;
  v84 = v172;
  if (!v141)
  {
    v80 = 0.0;
    v81 = 0.0;
    v179 = 0.0;
    v143 = 0.0;
    v128 = 0.0;
LABEL_127:
    v137 = v140;
    goto LABEL_128;
  }
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v145, MinX, v79, v172, v82, v146, v22);
  v79 = v120;
  v84 = v121;
  v82 = v122;
  if (a11)
  {
    v123 = v142;
    +[AKGeometryHelper renderingAlignedTextRectForRect:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingAlignedTextRectForRect:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v153, a10, v142);
    MinX = v124;
    v79 = v125;
    v84 = v126;
    v82 = v127;
  }
  else
  {
    MinX = v119;
    v123 = v142;
  }
  v129 = +[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", v144);
  if (v129)
    v80 = v84;
  else
    v80 = v82;
  if (v129)
    v81 = v82;
  else
    v81 = v84;
  if (!v167)
  {
    v179 = 0.0;
    v143 = 0.0;
    v128 = 0.0;
LABEL_126:
    v25 = v123;
    v118 = v152;
    goto LABEL_127;
  }
  v130 = v129;
  v131 = v97 ^ 1;
  v132 = rect1a ^ 1;
  if ((v131 & 1) == 0 && !v132)
  {
    v117 = v166;
    goto LABEL_125;
  }
  +[AKAnnotationRenderer rectangleForAnnotation:withTextBounds:](AKAnnotationRenderer, "rectangleForAnnotation:withTextBounds:", v123, MinX, v79, v84, v82);
  if ((v130 | v132) != 1)
  {
    v179 = v136;
    v117 = v166;
    v143 = v134;
LABEL_125:
    v128 = v162;
    goto LABEL_126;
  }
  v137 = v140;
  if (v131 | !v130)
  {
    v128 = v133;
    v117 = v135;
    v138 = v130 | v131;
    v118 = v152;
    if (v138 == 1 && (!v130 || !rect1a))
    {
      v179 = v136;
      v143 = v134;
    }
    v25 = v123;
  }
  else
  {
    v179 = v136;
    v117 = v166;
    v143 = v134;
    v128 = v162;
    v25 = v123;
    v118 = v152;
  }
LABEL_128:

  v166 = v117;
  v162 = v128;
  v26 = v153;
  v78 = v159;
  v32 = v143;
  if ((v118 & 1) != 0)
  {
LABEL_130:
    v83 = 0;
    goto LABEL_131;
  }
LABEL_129:
  if (!objc_msgSend(v74, "length"))
    goto LABEL_130;
LABEL_131:

  if (v167)
  {
    v167->origin.x = v162;
    v167->origin.y = v32;
    v167->size.width = v166;
    v167->size.height = v179;
  }
  v27 = v149;
  if (v164)
  {
    v164->origin.x = MinX;
    v164->origin.y = v79;
    v164->size.width = v84;
    v164->size.height = v82;
  }
  if (v165)
  {
    v165->width = ceil(v81);
    v165->height = ceil(v80);
  }
  if (!v78)
  {
LABEL_140:
    if (!v150)
      goto LABEL_142;
LABEL_141:
    *v150 = v83 & 1;
    goto LABEL_142;
  }
  if (v30)
  {
    v190 = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v190, 1);
    v139 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *v78 = v139;

    goto LABEL_140;
  }
  *v78 = 0;
  if (v150)
    goto LABEL_141;
LABEL_142:

}

+ (BOOL)hitTestPoint:(CGPoint)a3 againstActualTextForAnnotation:(id)a4 onPageController:(id)a5
{
  return MEMORY[0x24BEDD108](a1, sel__hitTestPoint_againstActualTextForAnnotation_onPageController_contextForVisualDebugging_);
}

+ (BOOL)_hitTestPoint:(CGPoint)a3 againstActualTextForAnnotation:(id)a4 onPageController:(id)a5 contextForVisualDebugging:(CGContext *)a6
{
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  const CGPath *v18;
  uint64_t v19;
  int64_t v20;
  double MidY;
  CGFloat v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  __int128 v30;
  CGFloat Height;
  CGFloat MinX;
  CGFloat MinY;
  CGPath *Mutable;
  BOOL v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  CGPathRef v52;
  const CGPath *v53;
  id v54;
  id v55;
  uint64_t v57;
  double MidX;
  id v59;
  CGAffineTransform v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform t2;
  CGAffineTransform v65;
  CGAffineTransform t1;
  CGAffineTransform m;
  id v68;
  double v69;
  double v70;
  CGRect v71;
  CGPoint v72;
  CGPoint v73;
  CGPoint v74;
  CGPoint v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  y = a3.y;
  x = a3.x;
  v11 = a4;
  v12 = a5;
  +[AKTextAnnotationAttributeHelper actualOrPlaceholderTextOfAnnotation:](AKTextAnnotationAttributeHelper, "actualOrPlaceholderTextOfAnnotation:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "length"))
  {
    if (objc_msgSend(v11, "isMemberOfClass:", objc_opt_class()))
    {
      objc_msgSend(v11, "typingAttributes");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "originalModelBaseScaleFactor");
      +[AKTextAnnotationAttributeHelper typingAttributes:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "typingAttributes:byApplyingScaleFactor:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:attributes:](AKTextAnnotationAttributeHelper, "newTextStorageOriginalFontSavvyWithString:attributes:", CFSTR("AAAA"), v37);
      +[AKAnnotationRenderer textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:](AKAnnotationRenderer, "textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", v11, v38, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      v75.x = x;
      v75.y = y;
      v35 = CGRectContainsPoint(v78, v75);

      goto LABEL_23;
    }
LABEL_12:
    v35 = 0;
    goto LABEL_23;
  }
  memset(&v71, 0, sizeof(v71));
  v69 = 0.0;
  v70 = 0.0;
  v68 = 0;
  LOBYTE(v57) = 0;
  +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", 0, &v71, &v69, &v68, 0, v11, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), v12, 0, v57, v13);
  v14 = v68;
  if (objc_msgSend(v11, "conformsToAKRotatableAnnotationProtocol"))
  {
    memset(&m, 0, sizeof(m));
    objc_msgSend(v11, "rotationAngle");
    +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", *(_OWORD *)&v71.origin, *(_OWORD *)&v71.size, v15);
    v65 = m;
    CGAffineTransformInvert(&t1, &v65);
    m = t1;
    v16 = y * t1.d + t1.b * x;
    x = t1.tx + y * t1.c + t1.a * x;
    y = t1.ty + v16;
  }
  v74.x = x;
  v74.y = y;
  if (!CGRectContainsPoint(v71, v74))
  {

    goto LABEL_12;
  }
  if (objc_msgSend(v14, "count")
    && (objc_msgSend(v14, "firstObject"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = (const CGPath *)objc_msgSend(v17, "newCGPathForPlatformBezierPath"),
        v17,
        v18))
  {
    v19 = objc_msgSend(v11, "originalExifOrientation");
    v20 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", v19);
    MidX = CGRectGetMidX(v71);
    MidY = CGRectGetMidY(v71);
    +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v19, *(_OWORD *)&v71.origin, *(_OWORD *)&v71.size, MidX, MidY);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v30 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&m.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&m.c = v30;
    *(_OWORD *)&m.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    *(CGFloat *)&v30 = v25;
    Height = CGRectGetHeight(*(CGRect *)&v22);
    CGAffineTransformMakeTranslation(&t2, 0.0, -Height);
    t1 = m;
    CGAffineTransformConcat(&m, &t1, &t2);
    CGAffineTransformMakeScale(&v63, 1.0, -1.0);
    v65 = m;
    CGAffineTransformConcat(&t1, &v65, &v63);
    m = t1;
    memset(&t1, 0, sizeof(t1));
    v76.origin.x = v23;
    v76.origin.y = v25;
    v76.size.width = v27;
    v76.size.height = v29;
    MinX = CGRectGetMinX(v76);
    v77.origin.x = v23;
    v77.origin.y = v25;
    v77.size.width = v27;
    v77.size.height = v29;
    MinY = CGRectGetMinY(v77);
    CGAffineTransformMakeTranslation(&t1, MinX, MinY);
    v62 = m;
    v61 = t1;
    CGAffineTransformConcat(&v65, &v62, &v61);
    m = v65;
    memset(&v65, 0, sizeof(v65));
    +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v20, MidX, MidY);
    v61 = m;
    v60 = v65;
    CGAffineTransformConcat(&v62, &v61, &v60);
    m = v62;
    Mutable = CGPathCreateMutable();
    CGPathAddPath(Mutable, &m, v18);
    CGPathRelease(v18);
    v72.x = x;
    v72.y = y;
    if (CGPathContainsPoint(Mutable, 0, v72, 1))
    {
      CGPathRelease(Mutable);
      v35 = 0;
    }
    else
    {
      v40 = v13;
      objc_msgSend(a1, "_sharedLayoutManager");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "textContainers");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectAtIndex:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v43, "akSetContainerSize:", v69, v70);
      objc_msgSend(v43, "setExclusionPaths:", v14);
      objc_msgSend(v40, "addLayoutManager:", v41);
      objc_msgSend(v41, "glyphRangeForTextContainer:", v43);
      objc_msgSend(v41, "usedRectForTextContainer:", v43);
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;
      objc_msgSend(v40, "removeLayoutManager:", v41);
      v79.origin.x = v45;
      v79.origin.y = v47;
      v79.size.width = v49;
      v79.size.height = v51;
      v52 = CGPathCreateWithRect(v79, &m);
      if (v52)
      {
        v53 = v52;
        if (a6)
        {
          objc_msgSend(MEMORY[0x24BDF6950], "blueColor");
          v59 = v40;
          v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          CGContextSetFillColorWithColor(a6, (CGColorRef)objc_msgSend(v54, "CGColor"));

          CGContextAddPath(a6, v53);
          CGContextFillPath(a6);
          objc_msgSend(MEMORY[0x24BDF6950], "redColor");
          v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          CGContextSetFillColorWithColor(a6, (CGColorRef)objc_msgSend(v55, "CGColor"));

          v40 = v59;
          CGContextAddPath(a6, Mutable);
          CGContextEOFillPath(a6);
        }
        v73.x = x;
        v73.y = y;
        v35 = CGPathContainsPoint(v53, 0, v73, 0);
        CGPathRelease(v53);
      }
      else
      {
        v35 = 0;
      }
      CGPathRelease(Mutable);

    }
  }
  else
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blueColor");
      v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(a6, (CGColorRef)objc_msgSend(v39, "CGColor"));

      CGContextFillRect(a6, v71);
    }
    v35 = 1;
  }

LABEL_23:
  return v35;
}

+ (CGSize)unconstrainedSizeForText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "_sharedLayoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textContainers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "akSetContainerSize:", 10000000.0, 10000000.0);
    objc_msgSend(v7, "setExclusionPaths:", MEMORY[0x24BDBD1A8]);
    objc_msgSend(v4, "addLayoutManager:", v5);
    objc_msgSend(v5, "glyphRangeForTextContainer:", v7);
    objc_msgSend(v5, "usedRectForTextContainer:", v7);
    v9 = v8;
    v11 = v10;
    objc_msgSend(v4, "removeLayoutManager:", v5);

  }
  else
  {
    v9 = *MEMORY[0x24BDBF148];
    v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)renderAnnotationText:(id)a3 intoContext:(CGContext *)a4 isForScreen:(BOOL)a5 pageControllerOrNil:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  id v13;
  CGContext *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  double y;
  double x;
  CGFloat height;
  CGFloat width;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  int64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v42;
  id v43;
  double v44;
  double v45;
  __int128 v46;
  double v47[4];
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  if (!v7 || (objc_msgSend(v10, "isEditingText") & 1) == 0)
  {
    +[AKTextAnnotationAttributeHelper actualOrPlaceholderTextOfAnnotation:](AKTextAnnotationAttributeHelper, "actualOrPlaceholderTextOfAnnotation:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      if (v7)
        v13 = v11;
      else
        v13 = 0;
      if (v7)
        v14 = 0;
      else
        v14 = a4;
      v46 = 0u;
      *(_OWORD *)v47 = 0u;
      v44 = 0.0;
      v45 = 0.0;
      v43 = 0;
      LOBYTE(v31) = 1;
      +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", 0, &v46, &v44, &v43, 0, v10, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), v13, v14, v31, v12);
      v15 = v43;
      if (v44 > 0.5 && v45 > 0.5)
      {
        UIGraphicsPushContext(a4);
        CGContextSaveGState(a4);
        CGContextSetShouldSmoothFonts(a4, 0);
        CGContextSetShouldSubpixelPositionFonts(a4, 1);
        CGContextSetShouldSubpixelQuantizeFonts(a4, 1);
        objc_msgSend(a1, "_sharedLayoutManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "textContainers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "akSetContainerSize:", v44, v45);
        objc_msgSend(v18, "setExclusionPaths:", v15);
        objc_msgSend(v10, "originalModelBaseScaleFactor");
        v19 = +[AKTextAnnotationAttributeHelper newTextStorage:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "newTextStorage:byApplyingScaleFactor:", v12);
        objc_msgSend(v19, "addLayoutManager:", v16);
        v20 = objc_msgSend(v16, "glyphRangeForTextContainer:", v18);
        if (v21)
        {
          v35 = v21;
          v36 = v20;
          y = *((double *)&v46 + 1);
          x = *(double *)&v46;
          height = v47[1];
          width = v47[0];
          if (objc_msgSend(v10, "conformsToAKRectangularAnnotationProtocol"))
          {
            objc_msgSend(v10, "rectangle");
            v51.origin.x = v26;
            v51.origin.y = v27;
            v51.size.width = v28;
            v51.size.height = v29;
            v48.origin.x = x;
            v48.origin.y = y;
            v48.size.width = width;
            v48.size.height = height;
            v49 = CGRectIntersection(v48, v51);
            x = v49.origin.x;
            y = v49.origin.y;
            width = v49.size.width;
            height = v49.size.height;
          }
          v50.origin.x = x;
          v50.origin.y = y;
          v50.size.width = width;
          v50.size.height = height;
          CGContextClipToRect(a4, v50);
          v30 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", objc_msgSend(v10, "originalExifOrientation"));
          v34 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
          *(_OWORD *)&v42.a = *MEMORY[0x24BDBD8B8];
          v33 = *(_OWORD *)&v42.a;
          *(_OWORD *)&v42.c = v34;
          *(_OWORD *)&v42.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
          v32 = *(_OWORD *)&v42.tx;
          CGAffineTransformMakeTranslation(&t2, -*(double *)&v46, -*((double *)&v46 + 1));
          *(_OWORD *)&t1.a = v33;
          *(_OWORD *)&t1.c = v34;
          *(_OWORD *)&t1.tx = v32;
          CGAffineTransformConcat(&v42, &t1, &t2);
          +[AKGeometryHelper affineTransformRecenteringAboutOriginForExifOrientation:withOriginalSize:](AKGeometryHelper, "affineTransformRecenteringAboutOriginForExifOrientation:withOriginalSize:", v30, *(_OWORD *)v47);
          v38 = v42;
          CGAffineTransformConcat(&t1, &v38, &v39);
          v42 = t1;
          CGAffineTransformMakeTranslation(&v37, *(CGFloat *)&v46, *((CGFloat *)&v46 + 1));
          v38 = v42;
          CGAffineTransformConcat(&t1, &v38, &v37);
          v42 = t1;
          CGContextConcatCTM(a4, &t1);
          CGContextTranslateCTM(a4, 0.0, *((CGFloat *)&v46 + 1));
          CGContextTranslateCTM(a4, 0.0, v45);
          CGContextScaleCTM(a4, 1.0, -1.0);
          CGContextTranslateCTM(a4, 0.0, -*((double *)&v46 + 1));
          objc_msgSend(v16, "drawGlyphsForGlyphRange:atPoint:", v36, v35, x, y);
        }
        objc_msgSend(v19, "removeLayoutManager:", v16);
        CGContextRestoreGState(a4);
        UIGraphicsPopContext();

      }
    }

  }
}

+ (id)_sharedLayoutManager
{
  void *v2;
  void *v3;
  AKTextLayoutManager *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("com.apple.AnnotationKit.AKTextAnnotationRenderHelper.sharedLayoutManager"));
  v4 = (AKTextLayoutManager *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6770]), "initWithSize:", 10000000.0, 10000000.0);
    v4 = objc_alloc_init(AKTextLayoutManager);
    objc_msgSend(v5, "setWidthTracksTextView:", 0);
    objc_msgSend(v5, "setHeightTracksTextView:", 0);
    objc_msgSend(v5, "setLineFragmentPadding:", 0.0);
    -[AKTextLayoutManager addTextContainer:](v4, "addTextContainer:", v5);
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("com.apple.AnnotationKit.AKTextAnnotationRenderHelper.sharedLayoutManager"));

  }
  return v4;
}

@end
