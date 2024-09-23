@implementation AKLoupeAnnotationImageUpdaterHelper

+ (CGRect)magnifiedRectForUnmagnifiedRect:(CGRect)a3 ofLoupeAnnotation:(id)a4 onPageController:(id)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double MidX;
  CGFloat MidY;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a4, "magnification");
  v10 = v9;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MidX = CGRectGetMidX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MidY = CGRectGetMidY(v18);
  v13 = width / v10;
  v14 = height / v10;
  v15 = MidY - height / v10 * 0.5;
  v16 = MidX - width / v10 * 0.5;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v15;
  result.origin.x = v16;
  return result;
}

+ (CGRect)unmagnifiedRectForMagnifiedRect:(CGRect)a3 ofLoupeAnnotation:(id)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double MidX;
  CGFloat MidY;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a4, "magnification");
  v9 = v8;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MidX = CGRectGetMidX(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MidY = CGRectGetMidY(v17);
  v12 = width * v9;
  v13 = height * v9;
  v14 = MidY - height * v9 * 0.5;
  v15 = MidX - width * v9 * 0.5;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

+ (void)updateModelImageOnLoupeAnnotation:(id)a3 onPageController:(id)a4
{
  __CFString *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v6 = off_255A24928;
  v7 = a4;
  v8 = a3;
  objc_setAssociatedObject(v8, v6, 0, (void *)0x301);
  objc_msgSend(v8, "rectangle");
  v10 = v9;
  objc_msgSend(a1, "magnifiedRectForUnmagnifiedRect:ofLoupeAnnotation:onPageController:", v8, v7);
  v12 = v10 / v11;
  objc_msgSend(v7, "convertRectFromModelToOverlay:");
  v17 = (id)objc_msgSend(v7, "newContentSnapshotPDFDataAtScale:inRect:forLoupeAnnotation:", v8, v12, v13, v14, v15, v16);

  objc_msgSend(v8, "setImageData:", v17);
}

+ (void)updateFastPathImageOnLoupeAnnotation:(id)a3 withFastPathLayer:(id)a4 onPageController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  __int128 v62;
  CGImage *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  double MidX;
  double MidY;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  void *v119;
  void *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  const CGPath *v129;
  double v130;
  CGFloat v131;
  CGContext *CurrentContext;
  CGFloat v133;
  CGFloat v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t i;
  void *v140;
  CGFloat x;
  CGFloat y;
  void *v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  CGFloat v151;
  double v152;
  double v153;
  CGFloat v154;
  CGFloat v155;
  id v156;
  void *v157;
  double v158;
  double v159;
  double v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  CGAffineTransform v168;
  CGAffineTransform v169;
  CGAffineTransform v170;
  CGAffineTransform v171;
  CGAffineTransform v172;
  CGAffineTransform v173;
  CGAffineTransform v174;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v177;
  __int128 v178;
  __int128 v179;
  _BYTE v180[128];
  uint64_t v181;
  CGSize v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;

  v181 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = objc_msgSend(v10, "pageIndex");
    objc_msgSend(v10, "controller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layerContainingQuickBackgroundForLoupeOnOverlayAtPageIndex:forAnnotationController:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && v9)
    {
      objc_msgSend(v10, "overlayView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rectangle");
      v17 = v16;
      v159 = v19;
      v160 = v18;
      v158 = v20;
      objc_msgSend(a1, "magnifiedRectForUnmagnifiedRect:ofLoupeAnnotation:onPageController:", v8, v10);
      v22 = v21;
      v24 = v23;
      v149 = v26;
      v150 = v25;
      objc_msgSend(v10, "convertRectFromModelToOverlay:");
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      objc_msgSend(v15, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "convertRect:fromLayer:", v35, v28, v30, v32, v34);
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v43 = v42;

      +[AKGeometryHelper integralRect:withOptions:](AKGeometryHelper, "integralRect:withOptions:", 3840, v37, v39, v41, v43);
      v47 = v46;
      v49 = v48;
      v50 = v44;
      v152 = v24;
      v153 = v22;
      if (vabdd_f64(v22, v24) >= 0.0005)
        v51 = v45;
      else
        v51 = v44;
      objc_msgSend(v10, "currentModelToScreenScaleFactor");
      v147 = v52;
      objc_msgSend(v15, "window");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "screen");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (v54)
      {
        objc_msgSend(v15, "window");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "screen");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "scale");
        v146 = v57;

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "scale");
        v146 = v58;
      }

      objc_msgSend(v10, "geometryHelper");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = v17;
      objc_msgSend(v59, "screenPixelAlignedRectForRect:", v17, v160, v159, v158);
      v144 = v61;
      v145 = v60;

      v62 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
      v178 = *MEMORY[0x24BDBF070];
      v179 = v62;
      v63 = +[AKFastLayerSnapshotHelper newFastSnapshotFromLayer:withSourceRect:acutalSnapshotRect:](AKFastLayerSnapshotHelper, "newFastSnapshotFromLayer:withSourceRect:acutalSnapshotRect:", v14, &v178, v47, v49, v50, v51);
      v157 = v15;
      objc_msgSend(v15, "layer");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "convertRect:fromLayer:", v14, v178, v179);
      v66 = v65;
      v68 = v67;
      v70 = v69;
      v72 = v71;

      objc_msgSend(v10, "convertRectFromOverlayToModel:", v66, v68, v70, v72);
      v154 = v74;
      v155 = v73;
      v76 = v75;
      v78 = v77;
      objc_msgSend(v8, "rectangle");
      v80 = v79;
      v82 = v81;
      v84 = v83;
      v86 = v85;
      objc_msgSend(v8, "magnification");
      v88 = v87;
      v183.origin.x = v80;
      v183.origin.y = v82;
      v183.size.width = v84;
      v183.size.height = v86;
      MidX = CGRectGetMidX(v183);
      v184.origin.x = v80;
      v184.origin.y = v82;
      v184.size.width = v84;
      v184.size.height = v86;
      MidY = CGRectGetMidY(v184);
      v162 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&v177.a = *MEMORY[0x24BDBD8B8];
      v163 = *(_OWORD *)&v177.a;
      *(_OWORD *)&v177.c = v162;
      *(_OWORD *)&v177.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      v161 = *(_OWORD *)&v177.tx;
      CGAffineTransformMakeTranslation(&t2, -MidX, -MidY);
      *(_OWORD *)&t1.a = v163;
      *(_OWORD *)&t1.c = v162;
      *(_OWORD *)&t1.tx = v161;
      CGAffineTransformConcat(&v177, &t1, &t2);
      CGAffineTransformMakeScale(&v174, v88, v88);
      v173 = v177;
      CGAffineTransformConcat(&t1, &v173, &v174);
      v177 = t1;
      CGAffineTransformMakeTranslation(&v172, MidX, MidY);
      v173 = v177;
      CGAffineTransformConcat(&t1, &v173, &v172);
      v177 = t1;
      v185.origin.y = v154;
      v185.origin.x = v155;
      v185.size.width = v76;
      v185.size.height = v78;
      v186 = CGRectApplyAffineTransform(v185, &t1);
      objc_msgSend(v10, "convertRectFromModelToOverlay:", v186.origin.x, v186.origin.y, v186.size.width, v186.size.height);
      v92 = v91;
      v94 = v93;
      v96 = v95;
      v98 = v97;
      objc_msgSend(v10, "overlayView");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "layer");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "superlayer");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "convertRect:toLayer:", v101, v92, v94, v96, v98);
      v103 = v102;
      v105 = v104;
      v107 = v106;
      v109 = v108;

      objc_msgSend(v9, "setFrame:", v103, v105, v107, v109);
      objc_msgSend(v9, "mask");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      objc_msgSend(v110, "setFrame:");
      +[AKLoupeAnnotationRenderer innerClipRect:](AKLoupeAnnotationRenderer, "innerClipRect:", v8);
      objc_msgSend(v10, "convertRectFromModelToOverlay:");
      v112 = v111;
      v114 = v113;
      v116 = v115;
      v118 = v117;
      v119 = v157;
      objc_msgSend(v157, "layer");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "convertRect:toLayer:", v9, v112, v114, v116, v118);
      v122 = v121;
      v124 = v123;
      v126 = v125;
      v128 = v127;

      objc_msgSend(v9, "convertRect:toLayer:", v110, v122, v124, v126, v128);
      v129 = CGPathCreateWithEllipseInRect(v187, 0);
      objc_msgSend(v110, "setPath:", v129);
      CGPathRelease(v129);

      if (v63)
      {
        v156 = v9;
        v130 = v147 * v146 * v144;
        v148 = round(v147 * v146 * v145);
        v131 = round(v130);
        objc_msgSend(v9, "setContents:", v63);
        CGImageRelease(v63);
        v182.width = v148;
        v182.height = v131;
        UIGraphicsBeginImageContext(v182);
        CurrentContext = UIGraphicsGetCurrentContext();
        *(_OWORD *)&v177.a = v163;
        *(_OWORD *)&v177.c = v162;
        *(_OWORD *)&v177.tx = v161;
        +[AKGeometryHelper verticalFlipTransformForRect:](AKGeometryHelper, "verticalFlipTransformForRect:", v150, v149, v153, v152);
        *(_OWORD *)&t1.a = v163;
        *(_OWORD *)&t1.c = v162;
        *(_OWORD *)&t1.tx = v161;
        CGAffineTransformConcat(&v177, &t1, &v171);
        v188.origin.x = v151;
        v188.origin.y = v160;
        v188.size.width = v159;
        v188.size.height = v158;
        v133 = -CGRectGetMidX(v188);
        v189.origin.x = v151;
        v189.origin.y = v160;
        v189.size.width = v159;
        v189.size.height = v158;
        v134 = CGRectGetMidY(v189);
        CGAffineTransformMakeTranslation(&v170, v133, -v134);
        v173 = v177;
        CGAffineTransformConcat(&t1, &v173, &v170);
        v177 = t1;
        CGAffineTransformMakeScale(&v169, v148 / v153, v131 / v152);
        v173 = v177;
        CGAffineTransformConcat(&t1, &v173, &v169);
        v177 = t1;
        CGAffineTransformMakeTranslation(&v168, v148 * 0.5, v131 * 0.5);
        v173 = v177;
        CGAffineTransformConcat(&t1, &v173, &v168);
        v177 = t1;
        CGContextConcatCTM(CurrentContext, &t1);
        objc_msgSend(v10, "annotationsBeneathLoupe:", v8);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v164 = 0u;
        v165 = 0u;
        v166 = 0u;
        v167 = 0u;
        v136 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v164, v180, 16);
        if (v136)
        {
          v137 = v136;
          v138 = *(_QWORD *)v165;
          do
          {
            for (i = 0; i != v137; ++i)
            {
              if (*(_QWORD *)v165 != v138)
                objc_enumerationMutation(v135);
              v140 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * i);
              CGContextSaveGState(CurrentContext);
              objc_msgSend(v140, "integralDrawingBounds");
              x = v190.origin.x;
              y = v190.origin.y;
              if (!CGRectIsInfinite(v190))
                CGContextTranslateCTM(CurrentContext, x, y);
              +[AKController renderAnnotation:inContext:](AKController, "renderAnnotation:inContext:", v140, CurrentContext);
              CGContextRestoreGState(CurrentContext);
            }
            v137 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v164, v180, 16);
          }
          while (v137);
        }
        UIGraphicsGetImageFromCurrentImageContext();
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        objc_setAssociatedObject(v8, off_255A24928, v143, (void *)0x301);

        v9 = v156;
        v119 = v157;
      }
      else
      {
        objc_msgSend(a1, "updateModelImageOnLoupeAnnotation:onPageController:", v8, v10);
      }

    }
    else
    {
      objc_msgSend(a1, "updateModelImageOnLoupeAnnotation:onPageController:", v8, v10);
    }

  }
  else
  {
    objc_msgSend(a1, "updateModelImageOnLoupeAnnotation:onPageController:", v8, v10);
  }

}

+ (CGAffineTransform)transformForFastPathLayer:(SEL)a3 ofLoupeAnnotation:(id)a4 onPageController:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t v11;
  double MidX;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGAffineTransform *result;
  _QWORD v22[4];
  id v23;
  CGRect v24;
  CGRect v25;

  v8 = a6;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_229025E90;
  v22[3] = &unk_24F1A7D48;
  v23 = v8;
  v9 = v8;
  v10 = a4;
  v11 = +[AKGeometryHelper exifOrientationWithConversionBlock:](AKGeometryHelper, "exifOrientationWithConversionBlock:", v22);
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  objc_msgSend(v10, "frame");
  MidX = CGRectGetMidX(v24);
  objc_msgSend(v10, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v25.origin.x = v14;
  v25.origin.y = v16;
  v25.size.width = v18;
  v25.size.height = v20;
  +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v11, MidX, CGRectGetMidY(v25));

  return result;
}

@end
