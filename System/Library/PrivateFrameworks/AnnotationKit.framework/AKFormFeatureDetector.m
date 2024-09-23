@implementation AKFormFeatureDetector

- (AKFormFeatureDetector)initWithDelegate:(id)a3
{
  id v4;
  AKFormFeatureDetector *v5;
  AKFormFeatureDetector *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKFormFeatureDetector;
  v5 = -[AKFormFeatureDetector init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  AKLog(CFSTR("%s"));
  v3.receiver = self;
  v3.super_class = (Class)AKFormFeatureDetector;
  -[AKFormFeatureDetector dealloc](&v3, sel_dealloc, "-[AKFormFeatureDetector dealloc]");
}

- (id)featureAtPoint:(CGPoint)a3 onPage:(id)a4 mode:(int64_t)a5
{
  return (id)MEMORY[0x24BEDD108](self, sel__featureAtPoint_onPage_mode_);
}

- (id)_featureAtPoint:(CGPoint)a3 onPage:(id)a4 mode:(int64_t)a5
{
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  uint64_t v18;
  CGContext *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  AKFormFeatureDetector *v27;
  double v28;
  double v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v35;
  CGRect v36;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  +[AKGeometryHelper rectWithSize:centeredAtPoint:](AKGeometryHelper, "rectWithSize:centeredAtPoint:", 400.0, 400.0, x, y);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = objc_msgSend((id)objc_opt_class(), "_newBitmapInRect:onPage:scale:", v9, v10, v12, v14, v16, 1.0);
  if (v18)
  {
    v19 = (CGContext *)v18;
    if ((unint64_t)(a5 - 1) <= 1)
    {
      -[AKFormFeatureDetector _checkboxAtPoint:onPage:pageBitmap:](self, "_checkboxAtPoint:onPage:pageBitmap:", v9, v18, 200.0, 200.0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        -[AKFormFeatureDetector _formFieldAtPoint:onPage:enforceMaxWidth:pageBitmap:](self, "_formFieldAtPoint:onPage:enforceMaxWidth:pageBitmap:", v9, 1, v19, 200.0, 200.0);
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)v21;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[AKFormFeatureDetector _snappedFormFieldForField:](self, "_snappedFormFieldForField:", v22);
            v23 = objc_claimAutoreleasedReturnValue();

            v22 = (void *)v23;
          }
          goto LABEL_11;
        }
        if (a5 == 2)
        {
          -[AKFormFeatureDetector _defaultFeatureForPoint:onPage:snapToVerticalEdges:](self, "_defaultFeatureForPoint:onPage:snapToVerticalEdges:", v9, 1, x, y);
          v32 = objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        }
        goto LABEL_13;
      }
      goto LABEL_10;
    }
    if ((unint64_t)(a5 - 3) > 1)
    {
      if (!a5)
      {
        -[AKFormFeatureDetector _lineAtPoint:onPage:useVerticalCenter:](self, "_lineAtPoint:onPage:useVerticalCenter:", v9, 1, x, y);
        v32 = objc_claimAutoreleasedReturnValue();
LABEL_21:
        v22 = (void *)v32;
        goto LABEL_29;
      }
LABEL_13:
      v22 = 0;
      goto LABEL_29;
    }
    -[AKFormFeatureDetector _checkboxAtPoint:onPage:pageBitmap:](self, "_checkboxAtPoint:onPage:pageBitmap:", v9, v18, x, y);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
LABEL_10:
      v22 = (void *)v20;
LABEL_11:
      -[AKFormFeatureDetector _translateFeature:toPageOrigin:](self, "_translateFeature:toPageOrigin:", v22, v11, v13);
      objc_msgSend(v22, "setRect:");
LABEL_29:
      CGContextRelease(v19);
      goto LABEL_30;
    }
    -[AKFormFeatureDetector _lineAtPoint:onPage:useVerticalCenter:](self, "_lineAtPoint:onPage:useVerticalCenter:", v9, 0, x, y);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      objc_msgSend(v24, "rect");
      if (v26 >= 18.0)
      {
        -[AKFormFeatureDetector _boxOnLine:atPoint:](self, "_boxOnLine:atPoint:", v25, x, y);
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      if (a5 == 4)
      {
        v27 = self;
        v28 = x;
        v29 = y;
        v30 = v9;
        v31 = 0;
LABEL_24:
        -[AKFormFeatureDetector _defaultFeatureForPoint:onPage:snapToVerticalEdges:](v27, "_defaultFeatureForPoint:onPage:snapToVerticalEdges:", v30, v31, v28, v29);
        v33 = objc_claimAutoreleasedReturnValue();
LABEL_27:
        v22 = (void *)v33;
        goto LABEL_28;
      }
    }
    else if (a5 == 4)
    {
      v27 = self;
      v28 = x;
      v29 = y;
      v30 = v9;
      v31 = 1;
      goto LABEL_24;
    }
    v22 = 0;
LABEL_28:

    goto LABEL_29;
  }
  v36.origin.x = v11;
  v36.origin.y = v13;
  v36.size.width = v15;
  v36.size.height = v17;
  j__NSStringFromCGRect(v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  AKLog(CFSTR("%@ unable to create bitmap of rect %@ from page controller: %@"));

  v22 = 0;
LABEL_30:

  return v22;
}

- (CGRect)_translateFeature:(id)a3 toPageOrigin:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  y = a4.y;
  x = a4.x;
  objc_msgSend(a3, "rect");
  v9 = x + v8;
  v11 = y + v10;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v11;
  result.origin.x = v9;
  return result;
}

- (id)_formFieldAtPoint:(CGPoint)a3 onPage:(id)a4 enforceMaxWidth:(BOOL)a5 pageBitmap:(CGContext *)a6
{
  _BOOL4 v7;
  double y;
  double x;
  id v11;
  id WeakRetained;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGContext *v24;
  size_t Width;
  int64_t Height;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  __int16 BitmapInfo;
  _BOOL4 v32;
  double v33;
  float *v34;
  float v35;
  float *v36;
  double v37;
  const float *v38;
  float *v39;
  uint64_t v40;
  BOOL v41;
  char v42;
  uint64_t v43;
  float v44;
  float *v46;
  char v47;
  uint64_t v48;
  char *v49;
  int64_t v50;
  char v51;
  size_t v52;
  int64_t v53;
  __int16 v54;
  int64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  int v66;
  double v67;
  uint64_t v68;
  char *v69;
  unint64_t v70;
  unint64_t v71;
  BOOL v72;
  int v73;
  BOOL v74;
  uint64_t v75;
  char v76;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  CGContext *v86;
  CGContext *v87;
  _BOOL4 v88;
  void *v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  int64_t v95;
  uint64_t v96;
  uint64_t v97;
  const float *v98;
  id v99;
  int64_t v100;
  float *Data;
  size_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t __C;
  _OWORD v110[3];
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;

  v7 = a5;
  y = a3.y;
  x = a3.x;
  v11 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_12;
  objc_msgSend(WeakRetained, "defaultFeatureSizeForPage:", v11);
  v14 = v13;
  objc_msgSend(v11, "overlayView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = a6;
  if (a6
    || (v24 = (CGContext *)objc_msgSend((id)objc_opt_class(), "_newBitmapInRect:onPage:scale:", v11, v17, v19, v21, v23, 1.0)) != 0)
  {
    Width = CGBitmapContextGetWidth(v24);
    Height = CGBitmapContextGetHeight(v24);
    v27 = vcvtmd_s64_f64(x);
    v28 = 0;
    if (v27 >= 8 && (uint64_t)(Width - 8) > v27)
    {
      v29 = floor(y);
      v30 = (double)Height - v29;
      if (((uint64_t)v30 & 0x8000000000000000) == 0 && Height > (uint64_t)v30)
      {
        v91 = v27 - 8;
        v100 = Height;
        v97 = (uint64_t)v30;
        memset(v110, 0, 32);
        BitmapInfo = CGBitmapContextGetBitmapInfo(v24);
        if ((BitmapInfo & 0x100) != 0)
        {
          Data = (float *)CGBitmapContextGetData(v24);
          v32 = 1;
        }
        else
        {
          v32 = -[AKFormFeatureDetector _floatPixelBufferForCGContext:imageBuffer:](self, "_floatPixelBufferForCGContext:imageBuffer:", v24, v110);
          v34 = *(float **)&v110[0];
          if (!v32)
            v34 = 0;
          Data = v34;
        }
        v28 = 0;
        if (v32)
        {
          if (Data)
          {
            v90 = BitmapInfo;
            v88 = v7;
            v35 = Data[Width * v97 + v27] + -0.01;
            v94 = 4 * Width * vcvtmd_s64_f64(v14);
            *(float *)&v33 = v35;
            v36 = -[AKFormFeatureDetector _thresholdPixelStripIn:withImageLenth:thresholdValue:startingPtr:withThresholdLength:](self, "_thresholdPixelStripIn:withImageLenth:thresholdValue:startingPtr:withThresholdLength:", v33);
            v38 = &Data[Width * v97 + v91];
            v98 = &Data[v100 * Width];
            if (v38 < v98)
            {
              v39 = v36;
              v89 = WeakRetained;
              v86 = v24;
              v87 = a6;
              v40 = 0;
              v41 = 0;
              v42 = 0;
              v43 = (uint64_t)v29;
              v102 = Width;
              v44 = 0.0;
              v93 = (uint64_t)&Data[Width * v97 + v91];
              while (1)
              {
                if (v38 + 17 > v39)
                {
                  *(float *)&v37 = v35;
                  v39 = -[AKFormFeatureDetector _thresholdPixelStripIn:withImageLenth:thresholdValue:startingPtr:withThresholdLength:](self, "_thresholdPixelStripIn:withImageLenth:thresholdValue:startingPtr:withThresholdLength:", Data, v100 * Width, v39, v94, v37);
                }
                LODWORD(__C) = 0;
                vDSP_sve(v38, 1, (float *)&__C, 0x11uLL);
                if ((v42 & 1) != 0)
                {
                  if (v40 >= 4)
                  {
                    if (v41)
                    {
LABEL_40:
                      v85 = v43;
                      v96 = v40;
                      v108 = 0x7FFFFFFFFFFFFFFFLL;
                      __C = 0;
                      v107 = 0x7FFFFFFFFFFFFFFFLL;
                      v105 = 0;
                      v106 = 0;
                      v104 = 0;
                      v99 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                      v47 = 0;
                      v103 = 0x7FFFFFFFFFFFFFFFLL;
                      v92 = (uint64_t)&Data[v97 * Width - 1 + Width];
                      v48 = 4;
                      v49 = (char *)&Data[v97 * Width];
                      do
                      {
                        v106 = 0x7FFFFFFFFFFFFFFFLL;
                        LOBYTE(v83) = 1;
                        v95 = -[AKFormFeatureDetector _scanToEdgeOfFormFieldStartingAtPoint:withBitmapData:width:height:bottomRowStartsAt:bottomRowEndsAt:withLineThickness:gapWidthForDottedLines:separatorHeights:andRegionHeight:trackAverageSpacingWidth:trackFarthestPossibleEdge:trackNumberOfSegments:trackNumberOfGapsForDottedLine:goingLeft:](self, "_scanToEdgeOfFormFieldStartingAtPoint:withBitmapData:width:height:bottomRowStartsAt:bottomRowEndsAt:withLineThickness:gapWidthForDottedLines:separatorHeights:andRegionHeight:trackAverageSpacingWidth:trackFarthestPossibleEdge:trackNumberOfSegments:trackNumberOfGapsForDottedLine:goingLeft:", Data, v102, v100, v49, v92, v40, x, y, v48, v99, &v106, &v103, &v108, &v105,
                                &__C,
                                v83);
                        LOBYTE(v84) = 0;
                        v50 = -[AKFormFeatureDetector _scanToEdgeOfFormFieldStartingAtPoint:withBitmapData:width:height:bottomRowStartsAt:bottomRowEndsAt:withLineThickness:gapWidthForDottedLines:separatorHeights:andRegionHeight:trackAverageSpacingWidth:trackFarthestPossibleEdge:trackNumberOfSegments:trackNumberOfGapsForDottedLine:goingLeft:](self, "_scanToEdgeOfFormFieldStartingAtPoint:withBitmapData:width:height:bottomRowStartsAt:bottomRowEndsAt:withLineThickness:gapWidthForDottedLines:separatorHeights:andRegionHeight:trackAverageSpacingWidth:trackFarthestPossibleEdge:trackNumberOfSegments:trackNumberOfGapsForDottedLine:goingLeft:", Data, v102, v100, v49, v92, v40, x, y, v48, v99, &v106, &v103, &v107, &v104,
                                &__C,
                                v84);
                        if ((v47 & 1) != 0)
                          break;
                        v47 = 1;
                        v48 = 6;
                      }
                      while (__C > 2);

                      WeakRetained = v89;
                      v51 = 0;
                      if (v103 == 0x7FFFFFFFFFFFFFFFLL)
                      {
                        v52 = v102;
                        v53 = v95;
                      }
                      else
                      {
                        v53 = v95;
                        v52 = v102;
                        if (v50 - v95 >= v103 - 2 && v50 - v95 <= v103 + 2)
                        {
                          if (v107 != 0x7FFFFFFFFFFFFFFFLL)
                            v50 = v107;
                          if (v108 != 0x7FFFFFFFFFFFFFFFLL)
                            v53 = v108;
                          v51 = 1;
                        }
                      }
                      if (v50 == 0x7FFFFFFFFFFFFFFFLL)
                        v55 = v52;
                      else
                        v55 = v50;
                      if (v53 == 0x7FFFFFFFFFFFFFFFLL)
                        v56 = v91;
                      else
                        v56 = v53;
                      v57 = v55 - v56;
                      if (v55 - v56 < 1)
                        goto LABEL_96;
                      v58 = (double)v56;
                      v59 = (double)v57;
                      v60 = (double)v106;
                      v111.origin.x = (double)v56;
                      v111.origin.y = (double)v85;
                      v111.size.width = (double)v57;
                      v111.size.height = (double)v106;
                      if (y > CGRectGetMaxY(v111) + 3.0)
                        goto LABEL_96;
                      v112.origin.x = (double)v56;
                      v112.origin.y = (double)v85;
                      v112.size.width = v59;
                      v112.size.height = v60;
                      if (y < CGRectGetMinY(v112) + -3.0)
                        goto LABEL_96;
                      if (v14 <= v60)
                        v61 = v14;
                      else
                        v61 = v60;
                      v62 = floor(v61);
                      if (v62 * 2.5 >= v60)
                        goto LABEL_73;
                      v113.origin.x = (double)v56;
                      v113.origin.y = (double)v85;
                      v113.size.width = v59;
                      v113.size.height = v60;
                      v63 = CGRectGetMaxY(v113) - v62 + -3.0;
                      v114.origin.x = (double)v56;
                      v114.origin.y = (double)v85;
                      v114.size.width = v59;
                      v114.size.height = v60;
                      v64 = v62 + CGRectGetMinY(v114) + 3.0;
                      if (y < v63 && y > v64)
                        goto LABEL_96;
                      if (y < v63)
                      {
LABEL_73:
                        v68 = 0;
                        v66 = 1;
                        v67 = (double)v85;
                        goto LABEL_74;
                      }
                      v115.origin.x = (double)v56;
                      v115.origin.y = (double)v85;
                      v115.size.width = v59;
                      v115.size.height = v60;
                      v66 = 0;
                      v67 = CGRectGetMaxY(v115) - v62;
                      v97 = v100 - (uint64_t)v67;
                      v68 = 2;
LABEL_74:
                      v106 = (uint64_t)v62;
                      v116.origin.x = (double)v56;
                      v116.origin.y = v67;
                      v116.size.width = v59;
                      v116.size.height = v62;
                      if (y > CGRectGetMaxY(v116) + 3.0)
                        goto LABEL_96;
                      v117.origin.x = (double)v56;
                      v117.origin.y = v67;
                      v117.size.width = v59;
                      v117.size.height = v62;
                      if (y < CGRectGetMinY(v117) + -3.0)
                        goto LABEL_96;
                      v69 = (char *)&Data[v97 * v102];
                      v70 = -[AKFormFeatureDetector _findLineEdgeTypeOnLeft:startingAt:withPageLeftEdge:withPageWidth:andFormHeight:](self, "_findLineEdgeTypeOnLeft:startingAt:withPageLeftEdge:withPageWidth:andFormHeight:", 1, &v69[4 * v56], v69, v102, v106);
                      v71 = -[AKFormFeatureDetector _findLineEdgeTypeOnLeft:startingAt:withPageLeftEdge:withPageWidth:andFormHeight:](self, "_findLineEdgeTypeOnLeft:startingAt:withPageLeftEdge:withPageWidth:andFormHeight:", 0, &v69[4 * v55], v69, v102, v106);
                      v72 = v70 == 2 && v71 == 2;
                      v73 = v72 ? 1 : v66;
                      if (v73 != 1)
                        goto LABEL_96;
                      v74 = v71 == 1 || v70 == 1;
                      v75 = 18;
                      if (v74)
                        v75 = 42;
                      if (v70 == 3)
                        v75 -= 2;
                      if (v71 == 3)
                        v75 -= 2;
                      v76 = v59 < (double)v75 ? 1 : v51;
                      if ((v76 & 1) != 0)
                      {
LABEL_96:
                        v28 = 0;
                        v24 = v86;
                        a6 = v87;
                        goto LABEL_97;
                      }
                      +[AKFormFeature featureWithRect:onPage:](AKFormFeatureLine, "featureWithRect:onPage:", v11, v58, v67 - (double)v96, v59);
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v88
                        && (objc_opt_respondsToSelector() & 1) != 0
                        && (objc_msgSend(v89, "maximumFeatureWidthForPage:", v11), v79 < v59))
                      {
                        objc_msgSend(v89, "defaultFeatureSizeForPage:", v11);
                        v81 = v80;
                        v82 = x + v80 * -0.0;
                        v68 |= 1uLL;
                      }
                      else
                      {
                        v82 = v58;
                        v81 = v59;
                      }
                      +[AKFormFeatureBox boxWithRect:onPage:flags:baseline:](AKFormFeatureBox, "boxWithRect:onPage:flags:baseline:", v11, v68, v78, v82, v67, v81, v62);
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v28, "setEnclosingRegionRect:", v58, (double)v85, v59, v60);

                    }
                    else
                    {
LABEL_45:
                      v28 = 0;
                    }
                    v24 = v86;
                    a6 = v87;
                    v54 = v90;
                    WeakRetained = v89;
                    goto LABEL_98;
                  }
                  if (*(float *)&__C >= 16.0)
                    goto LABEL_40;
                  if (v44 != *(float *)&__C)
                    goto LABEL_45;
                  v41 = *(float *)&__C == 0.0;
                  ++v40;
                  v42 = 1;
                  v44 = *(float *)&__C;
                }
                else
                {
                  LODWORD(v37) = __C;
                  if (*(float *)&__C <= 12.0)
                  {
                    if (v38 == (const float *)v93)
                    {
                      v46 = -[AKFormFeatureDetector _shiftScanAwayFromEdgeInPixels:](self, "_shiftScanAwayFromEdgeInPixels:", v93, v37);
                      if (v46)
                      {
                        v42 = 0;
                        v38 = &v46[-Width];
                        v27 += ((uint64_t)v46 - v93) >> 2;
                        goto LABEL_35;
                      }
                      LODWORD(v37) = __C;
                    }
                    v41 = *(float *)&v37 == 0.0;
                    v40 = 1;
                    v44 = *(float *)&v37;
                    v42 = 1;
                  }
                  else
                  {
                    if (*(float *)&__C > 17.0 || *(float *)&__C <= 12.0)
                      goto LABEL_45;
                    v42 = 0;
                    --v43;
                    ++v97;
                  }
                }
LABEL_35:
                v38 += Width;
                if (v38 >= v98)
                  goto LABEL_45;
              }
            }
            v28 = 0;
LABEL_97:
            v54 = v90;
LABEL_98:
            if ((v54 & 0x100) == 0)
              free(*(void **)&v110[0]);
          }
        }
      }
    }
    if (!a6)
      CGContextRelease(v24);
  }
  else
  {
LABEL_12:
    v28 = 0;
  }

  return v28;
}

- (unint64_t)_findLineEdgeTypeOnLeft:(BOOL)a3 startingAt:(float *)a4 withPageLeftEdge:(float *)a5 withPageWidth:(int64_t)a6 andFormHeight:(unint64_t)a7
{
  _BOOL4 v11;
  int64_t v12;
  float v13;
  float v15;
  float v16;
  float *v17;
  unint64_t v18;
  float *v19;
  float *v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  float v24;
  BOOL v25;
  uint64_t v26;
  vDSP_Stride __I;
  float __C;

  v11 = a3;
  __C = 0.0;
  v12 = -a6;
  vDSP_sve(a4, -a6, &__C, a7);
  v13 = __C;
  if (__C == 0.0)
    return 2;
  __I = v12;
  v15 = (float)a7;
  v16 = (float)a7 * 0.5;
  v17 = &a5[a6];
  v18 = 2 * a7;
  v19 = a4 - 1;
  v20 = a4 + 1;
  v21 = -1;
  v22 = 1;
  v23 = __C;
  do
  {
    v24 = (float)v18;
    v25 = v19 > a5 && v11;
    if (v25 || v17 > v20)
    {
      if (v11)
        v26 = v21;
      else
        v26 = v22;
      vDSP_sve(&a4[v26], __I, &__C, a7);
      if ((__C == v15 || __C == 0.0) && (float)(v24 - v23) < v16)
        return 1;
      v23 = v23 + __C;
      if (__C == v15)
        break;
    }
    --v21;
    v18 += a7;
    --v19;
    ++v20;
    ++v22;
  }
  while (v21 != -4);
  if ((float)(v24 - v23) >= v16 && (float)(v24 - v23) < v15)
    return 3;
  else
    return v13 < (float)(a7 - 1);
}

- (int64_t)_scanToEdgeOfFormFieldStartingAtPoint:(CGPoint)a3 withBitmapData:(float *)a4 width:(int64_t)a5 height:(int64_t)a6 bottomRowStartsAt:(float *)a7 bottomRowEndsAt:(float *)a8 withLineThickness:(int64_t)a9 gapWidthForDottedLines:(int64_t)a10 separatorHeights:(id)a11 andRegionHeight:(int64_t *)a12 trackAverageSpacingWidth:(int64_t *)a13 trackFarthestPossibleEdge:(int64_t *)a14 trackNumberOfSegments:(int64_t *)a15 trackNumberOfGapsForDottedLine:(int64_t *)a16 goingLeft:(BOOL)a17
{
  double x;
  id v22;
  float *v23;
  _BOOL4 v24;
  int64_t v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  const float *v29;
  _BOOL4 v30;
  float *v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  uint64_t v38;
  vDSP_Stride v39;
  int64_t v40;
  uint64_t v41;
  int64_t v42;
  int64_t v43;
  int64_t v46;
  char v47;
  float *v48;
  uint64_t v49;
  int64_t v50;
  uint64_t v51;
  int64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  int64_t v57;
  int64_t v58;
  int64_t v59;
  uint64_t v60;
  void *v61;
  BOOL v62;
  uint64_t v63;
  void *v65;
  int v66;
  int64_t v67;
  int64_t v68;
  int64_t v69;
  void *v70;
  int v71;
  int64_t v72;
  int64_t v73;
  int64_t *v74;
  int64_t __N;
  uint64_t v76;
  int64_t v77;
  int64_t v78;
  id v79;
  float *v80;
  float *v81;
  int64_t v82;
  uint64_t v83;
  int64_t v84;
  int64_t v85;
  uint64_t v87;
  uint64_t v88;
  int64_t v89;
  float __C[3];

  x = a3.x;
  v22 = a11;
  v23 = a7;
  v24 = a17;
  v25 = vcvtmd_s64_f64(x);
  v26 = *a13;
  v27 = *a14;
  v78 = *a16;
  v79 = v22;
  v28 = *a12;
  v29 = &a7[v25];
  v30 = v25 >= 0;
  if (!a17)
    v30 = v29 <= a8;
  v74 = a15;
  if (!v30)
  {
    v89 = 0;
    v53 = 0;
    v42 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_59;
  }
  v31 = a8;
  v32 = 0;
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v89 = 0;
  __N = a9;
  v36 = (float)a9;
  v38 = -1;
  if (!a17)
    v38 = 1;
  v88 = v38;
  v87 = 4 * v38;
  v39 = a5;
  v40 = 4 * a5;
  v41 = 0x7FFFFFFFFFFFFFFFLL;
  v42 = 0x7FFFFFFFFFFFFFFFLL;
  v43 = (int64_t)&v23[v25 - a5];
  v80 = v23;
  v81 = v31;
  while (v29 < a4 || v28 <= 0)
  {
    v50 = 0;
LABEL_26:
    if (v24)
      v51 = v35;
    else
      v51 = -v35;
    v52 = v25 + v51;
    if ((v32 & 1) == 0)
      v42 = v52;
    v53 = v34 + 1;
    if (v34 > 2)
      goto LABEL_59;
    if (v34 <= 0)
    {
      if ((v32 & ((unint64_t)(v33 - 21) < 0xFFFFFFFFFFFFFFEFLL)) != 0
        || v26 != 0x7FFFFFFFFFFFFFFFLL && v33 < v26 - 2 && v33 > v26 + 2)
      {
        goto LABEL_59;
      }
      if ((v32 & (v26 == 0x7FFFFFFFFFFFFFFFLL)) == 1)
      {
        if (v24)
          v26 = v27 - v25;
        else
          v26 = v25 - v27;
      }
    }
    v89 += v32 & (v34 == 0);
    if (v41 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v83 = v35;
      v85 = v42;
      v58 = v26;
      v59 = v25;
      v60 = v34 + 1;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "addObject:", v61);

      v53 = v60;
      v40 = 4 * a5;
      v23 = v80;
      v39 = a5;
      v31 = v81;
      v25 = v59;
      v26 = v58;
      v35 = v83;
      v42 = v85;
      v24 = a17;
    }
    a10 = 0;
    v33 = 0;
    v32 = 1;
    v41 = v50;
    v27 = v25;
LABEL_54:
    v29 = (const float *)((char *)v29 + v87);
    v25 += v88;
    v62 = v29 <= v31;
    if (v24)
      v62 = v29 >= v23;
    v43 += v87;
    v34 = v53;
    if (!v62)
      goto LABEL_59;
  }
  v46 = 0;
  v47 = 1;
  v48 = (float *)v29;
  do
  {
    if ((v47 & 1) == 0 && *v48 <= 0.0)
      break;
    v48 -= a5;
    ++v46;
    if (v48 < a4)
      break;
    v47 = 0;
  }
  while (v46 < v28);
  if ((unint64_t)v46 <= 8)
  {
    v49 = 0;
    v50 = 0;
    do
    {
      if (*(const float *)((char *)v29 + v49) > 0.0)
        break;
      ++v50;
      if (v43 + v49 < (unint64_t)a4)
        break;
      v49 -= v40;
    }
    while (v50 < v28);
    goto LABEL_26;
  }
  v54 = v41;
  v76 = v33;
  v77 = v27;
  v55 = v35;
  v82 = v25;
  v84 = v26;
  if (v28 >= v46)
    v28 = v46;
  __C[0] = 0.0;
  vDSP_sve(v29, v39, __C, __N);
  *(float *)&v56 = __C[0];
  if (__C[0] < v36)
  {
    v57 = v78;
    if (v55 > 0)
      v57 = v78 + 1;
    v78 = v57;
    v24 = a17;
    v25 = v82;
    v26 = v84;
    v23 = v80;
    v31 = v81;
    v41 = v54;
    if ((v32 & (v76 > 19)) == 1)
    {
      v27 = v77;
      if (!a17)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v54, v56);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v79, "containsObject:", v65);

        v26 = v84;
        v24 = a17;
        if (v66)
          v67 = v84;
        else
          v67 = 0;
        v27 = v67 + v77;
      }
      goto LABEL_85;
    }
    v35 = 0;
    v33 = v76 + 1;
    goto LABEL_49;
  }
  v35 = v55 + 1;
  v24 = a17;
  v25 = v82;
  v26 = v84;
  v23 = v80;
  v31 = v81;
  v41 = v54;
  if (v55 + 1 < a10)
  {
    v33 = 0;
LABEL_49:
    v27 = v77;
    v53 = 0;
    v39 = a5;
    v40 = 4 * a5;
    goto LABEL_54;
  }
  if (a17)
    v68 = a10;
  else
    v68 = -a10;
  v69 = v68 + v82;
  if ((v32 & 1) == 0)
    v42 = v69;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v54, v56, a15);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v79, "containsObject:", v70);

  if (v71 && v76 >= 5)
  {
    v24 = a17;
    v26 = v84;
    if (a17)
      v72 = -v84;
    else
      v72 = v84;
    v27 = v77 + v72;
  }
  else
  {
    v73 = v82;
    v26 = v84;
    if ((v32 & (v76 > 4) & (v76 < 20)) == 0)
      v73 = v77;
    if (v84 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v26 = 0x7FFFFFFFFFFFFFFFLL;
      v27 = v73;
    }
    else
    {
      v27 = v77;
    }
    v24 = a17;
  }
LABEL_85:
  v53 = 0;
LABEL_59:
  *v74 = v89;
  if (v24)
    v63 = v53;
  else
    v63 = -v53;
  *a14 = v63 + v27;
  *a13 = v26;
  *a16 = v78;
  *a12 = v28;

  return v42;
}

- (float)_thresholdPixelStripIn:(float *)a3 withImageLenth:(int64_t)a4 thresholdValue:(float)a5 startingPtr:(float *)a6 withThresholdLength:(int64_t)a7
{
  float *v7;
  float *v8;
  int64_t v9;
  vDSP_Length v10;
  float *v11;
  float __C;
  float __B;

  __B = a5;
  __C = 1.0;
  v7 = &a3[a4];
  if (v7 <= a6)
    return 0;
  if (a6 >= a3)
    v8 = a6;
  else
    v8 = a3;
  v9 = v7 - v8;
  if (v9 >= a7)
    v10 = a7;
  else
    v10 = v9;
  v11 = &v8[v10];
  vDSP_vthrsc(v8, 1, &__B, &__C, v8, 1, v10);
  vDSP_vthres(v8, 1, &__C, v8, 1, v10);
  return v11;
}

- (void)_drawThresholdedBitmapForTestForPageBitmap:(CGContext *)a3 withPixels:(float *)a4
{
  size_t Width;
  size_t Height;
  size_t BitsPerComponent;
  size_t BytesPerRow;
  CGColorSpace *ColorSpace;
  CGBitmapInfo BitmapInfo;
  CGContext *v12;
  CGImage *Image;
  id v14;

  Width = CGBitmapContextGetWidth(a3);
  Height = CGBitmapContextGetHeight(a3);
  BitsPerComponent = CGBitmapContextGetBitsPerComponent(a3);
  BytesPerRow = CGBitmapContextGetBytesPerRow(a3);
  ColorSpace = CGBitmapContextGetColorSpace(a3);
  BitmapInfo = CGBitmapContextGetBitmapInfo(a3);
  v12 = CGBitmapContextCreate(a4, Width, Height, BitsPerComponent, BytesPerRow, ColorSpace, BitmapInfo);
  Image = CGBitmapContextCreateImage(v12);
  objc_msgSend(CFSTR("~/Desktop/testImage.pdf"), "stringByExpandingTildeInPath");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "cStringUsingEncoding:", 4);
  CGImageWriteToFile();

  CGImageRelease(Image);
  CGContextRelease(v12);
}

- (float)_shiftScanAwayFromEdgeInPixels:(float *)a3
{
  float *v4;
  float v6;
  float __C;

  __C = 0.0;
  vDSP_sve(a3, 1, &__C, 8uLL);
  v6 = 0.0;
  v4 = a3 + 8;
  vDSP_sve(a3 + 8, 1, &v6, 8uLL);
  if (v6 < 6.0)
    return a3 - 9;
  if (__C >= 6.0)
    return 0;
  return v4;
}

- (id)_snappedFormFieldForField:(id)a3
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double MinX;
  CGFloat v25;
  double v26;
  double MaxX;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  CGFloat rect;
  CGFloat rect_8;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v28 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v3, "rect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "baseline");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "baseline");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rect");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    rect = v6;
    v36.origin.x = v6;
    v36.origin.y = v8;
    v36.size.width = v10;
    v36.size.height = v12;
    v23 = v8;
    MinX = CGRectGetMinX(v36);
    v37.origin.x = v16;
    rect_8 = v18;
    v37.origin.y = v18;
    v25 = v20;
    v37.size.width = v20;
    v37.size.height = v22;
    if (MinX <= CGRectGetMinX(v37) + 20.0)
    {
      v26 = v23;
      v29 = 4;
    }
    else
    {
      v38.origin.x = rect;
      v26 = v23;
      v38.origin.y = v23;
      v38.size.width = v10;
      v38.size.height = v12;
      MaxX = CGRectGetMaxX(v38);
      v39.origin.x = v16;
      v39.origin.y = rect_8;
      v39.size.width = v25;
      v39.size.height = v22;
      if (MaxX < CGRectGetMaxX(v39) + -20.0)
        goto LABEL_5;
      v40.origin.x = v16;
      v40.origin.y = rect_8;
      v40.size.width = v25;
      v40.size.height = v22;
      v16 = CGRectGetMaxX(v40) - v10;
      v29 = 8;
    }
    objc_msgSend(v4, "page", *(_QWORD *)&rect);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v4, "flags") | v29;
    objc_msgSend(v4, "baseline");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKFormFeatureBox boxWithRect:onPage:flags:baseline:](AKFormFeatureBox, "boxWithRect:onPage:flags:baseline:", v30, v31, v32, v16, v26, v10, v12);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "enclosingRegionRect");
    objc_msgSend(v28, "setEnclosingRegionRect:");
    goto LABEL_10;
  }
LABEL_5:
  v28 = v4;
LABEL_10:

  return v28;
}

- (BOOL)_floatPixelBufferForCGContext:(CGContext *)a3 imageBuffer:(vImage_Buffer *)a4
{
  CGImage *Image;
  CGColorSpace *ColorSpace;
  CGBitmapInfo BitmapInfo;
  uint32_t BitsPerPixel;
  uint32_t BitsPerComponent;
  size_t Width;
  size_t v12;
  void *v13;
  vImage_Error v14;
  BOOL v15;
  vImage_Error v16;
  __int128 v17;
  vImage_Buffer dest;
  vImage_Buffer buf;
  vImage_CGImageFormat format;

  Image = CGBitmapContextCreateImage(a3);
  ColorSpace = CGBitmapContextGetColorSpace(a3);
  BitmapInfo = CGBitmapContextGetBitmapInfo(a3);
  BitsPerPixel = CGBitmapContextGetBitsPerPixel(a3);
  BitsPerComponent = CGBitmapContextGetBitsPerComponent(a3);
  Width = CGBitmapContextGetWidth(a3);
  v12 = CGBitmapContextGetWidth(a3);
  format.bitsPerComponent = BitsPerComponent;
  format.bitsPerPixel = BitsPerPixel;
  format.colorSpace = ColorSpace;
  format.bitmapInfo = BitmapInfo;
  memset(&format.version, 0, 20);
  v13 = malloc_type_calloc(v12, 4 * Width, 0x11C3DB1DuLL);
  memset(&buf, 0, sizeof(buf));
  v14 = vImageBuffer_InitWithCGImage(&buf, &format, 0, Image, 0x100u);
  if (v14)
  {
    NSLog(CFSTR("In buffer creation error: %zd"), v14);
    free(v13);
    v15 = 0;
  }
  else
  {
    dest.data = v13;
    dest.height = buf.height;
    dest.width = buf.width;
    dest.rowBytes = 4 * buf.width;
    v16 = vImageConvert_Planar8toPlanarF(&buf, &dest, 1.0, 0.0, 0x100u);
    v15 = v16 == 0;
    if (v16)
    {
      NSLog(CFSTR("Out buffer conversion error: %zd"), v16);
    }
    else
    {
      v17 = *(_OWORD *)&dest.width;
      *(_OWORD *)&a4->data = *(_OWORD *)&dest.data;
      *(_OWORD *)&a4->width = v17;
    }
  }
  CGImageRelease(Image);
  return v15;
}

- (id)_checkboxAtPoint:(CGPoint)a3 onPage:(id)a4 pageBitmap:(CGContext *)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGContext *v19;
  size_t Width;
  int64_t Height;
  uint64_t v22;
  void *v23;
  int64_t v24;
  double v25;
  uint64_t v26;
  _BOOL4 v28;
  float *Data;
  double v31;
  float *v32;
  const float *v33;
  vDSP_Length v34;
  vDSP_Length v35;
  vDSP_Length v36;
  int64_t v37;
  uint64_t v38;
  vDSP_Length v39;
  const float *v40;
  float v41;
  const float *v42;
  const float *v43;
  vDSP_Length v44;
  uint64_t v45;
  __int16 BitmapInfo;
  float v47;
  float v48;
  void *v49[2];
  __int128 v50;
  float __A;
  float v52;
  float v53;
  float v54;
  vDSP_Length __I;
  vDSP_Length v56;
  vDSP_Length v57;
  vDSP_Length v58;
  float __C;
  float v60;
  float v61;
  float v62;
  uint64_t v63;

  y = a3.y;
  x = a3.x;
  v63 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  objc_msgSend(v9, "overlayView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = a5;
  if (!a5)
  {
    v19 = (CGContext *)objc_msgSend((id)objc_opt_class(), "_newBitmapInRect:onPage:scale:", v9, v12, v14, v16, v18, 1.0);
    if (!v19)
    {
      v23 = 0;
      goto LABEL_17;
    }
  }
  Width = CGBitmapContextGetWidth(v19);
  Height = CGBitmapContextGetHeight(v19);
  v22 = vcvtmd_s64_f64(x);
  if (v22 < 20)
  {
    v23 = 0;
  }
  else
  {
    v23 = 0;
    if ((uint64_t)(Width - 20) > v22)
    {
      v24 = Height;
      v25 = floor(y);
      v26 = (uint64_t)((double)Height - v25);
      if (v26 >= 20 && Height - 20 > v26)
      {
        *(_OWORD *)v49 = 0u;
        v50 = 0u;
        BitmapInfo = CGBitmapContextGetBitmapInfo(v19);
        if ((BitmapInfo & 0x100) != 0)
        {
          Data = (float *)CGBitmapContextGetData(v19);
          v28 = 1;
        }
        else
        {
          v28 = -[AKFormFeatureDetector _floatPixelBufferForCGContext:imageBuffer:](self, "_floatPixelBufferForCGContext:imageBuffer:", v19, v49);
          Data = v28 ? (float *)v49[0] : 0;
        }
        v23 = 0;
        if (v28)
        {
          if (Data)
          {
            v31 = Data[Width * v26 + v22] + -0.01;
            *(float *)&v31 = v31;
            v32 = &Data[Width * v26];
            -[AKFormFeatureDetector _thresholdPixelStripIn:withImageLenth:thresholdValue:startingPtr:withThresholdLength:](self, "_thresholdPixelStripIn:withImageLenth:thresholdValue:startingPtr:withThresholdLength:", Data, v24 * Width, &v32[-40 * Width], 80 * Width, v31);
            v33 = &v32[v22];
            vDSP_minvi(v33, -1, &__C, &__I, 0x15uLL);
            vDSP_minvi(v33, 1, &v60, &v56, 0x15uLL);
            vDSP_minvi(v33, -(uint64_t)Width, &v61, &v57, 0x15uLL);
            vDSP_minvi(v33, Width, &v62, &v58, 0x15uLL);
            v48 = 0.0;
            vDSP_sve(&__C, 1, &v48, 4uLL);
            if (v48 == 0.0)
            {
              v23 = 0;
              v34 = ~__I;
              v35 = ~v57 / Width;
              __I = v34;
              v36 = v58 / Width;
              v57 = v35;
              v58 /= Width;
              v37 = v56 + v34;
              if (v56 + v34 - 2 <= 0x12)
              {
                v38 = v36 + v35;
                if ((uint64_t)(v36 + v35) >= 2 && v38 <= 20 && v38 - v37 <= 2)
                {
                  v39 = v26 - v35;
                  v44 = v22 - v34;
                  v45 = v36 + v35;
                  v40 = &Data[v39 * Width + v22 - v34];
                  v41 = 0.0;
                  do
                  {
                    __A = 0.0;
                    vDSP_sve(v40, 1, &__A, v37);
                    v41 = v41 + __A;
                    v40 += Width;
                    --v38;
                  }
                  while (v38);
                  if (v37 * v45 != (uint64_t)v41)
                    goto LABEL_30;
                  v42 = &Data[(v39 - 1) * Width + v44];
                  v43 = v42 - 1;
                  v47 = 0.0;
                  vDSP_sve(v42, 1, &__A, v37);
                  vDSP_sve(&v43[Width + 1 + Width * v45], 1, &v52, v37);
                  vDSP_sve(v43, Width, &v53, v45 + 2);
                  vDSP_sve(&v43[v37 + 1], Width, &v54, v45 + 2);
                  vDSP_sve(&__A, 1, &v47, 4uLL);
                  if (v47 > 0.0)
                    goto LABEL_30;
                  +[AKFormFeatureCheckbox checkboxWithRect:onPage:](AKFormFeatureCheckbox, "checkboxWithRect:onPage:", v9, (double)(v22 - __I), v25 - (double)v58, (double)v37, (double)v45);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                }
              }
LABEL_31:
              if ((BitmapInfo & 0x100) == 0)
                free(v49[0]);
              goto LABEL_14;
            }
LABEL_30:
            v23 = 0;
            goto LABEL_31;
          }
        }
      }
    }
  }
LABEL_14:
  if (!a5)
    CGContextRelease(v19);
LABEL_17:

  return v23;
}

- ($F0CD3428A0DA0A278EE56C24FA6A9B79)_findVerticalEdgesAtPoint:(SEL)a3 extent:(CGPoint)a4 onPage:(int64_t)a5
{
  double y;
  double x;
  double v10;
  vDSP_Length v11;
  id v12;
  double v13;
  CGContext *v14;
  $F0CD3428A0DA0A278EE56C24FA6A9B79 *result;
  __int16 BitmapInfo;
  _BOOL4 v17;
  char *Data;
  const float *v19;
  vDSP_Length v20;
  vDSP_Length __I;
  uint64_t __C;
  void *v23[2];
  __int128 v24;

  y = a4.y;
  x = a4.x;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  v10 = (double)a5 * 0.0 + 20.0;
  v11 = (uint64_t)(double)a5;
  v12 = a6;
  v13 = round(x);
  v14 = (CGContext *)objc_msgSend((id)objc_opt_class(), "_newBitmapInRect:onPage:scale:", v12, v13 - (double)(uint64_t)v10, round(y), (double)(uint64_t)(v11 + (uint64_t)v10 - 1), 1.0, 1.0);

  if (v14)
  {
    *(_OWORD *)v23 = 0u;
    v24 = 0u;
    BitmapInfo = CGBitmapContextGetBitmapInfo(v14);
    if ((BitmapInfo & 0x100) != 0)
    {
      Data = (char *)CGBitmapContextGetData(v14);
    }
    else
    {
      v17 = -[AKFormFeatureDetector _floatPixelBufferForCGContext:imageBuffer:](self, "_floatPixelBufferForCGContext:imageBuffer:", v14, v23);
      if (v17)
        Data = (char *)v23[0];
      else
        Data = 0;
      if (!v17)
      {
LABEL_16:
        CGContextRelease(v14);
        return result;
      }
    }
    if (Data)
    {
      __I = 0;
      __C = 0;
      v20 = 0;
      v19 = (const float *)&Data[4 * (uint64_t)v10 - 4];
      vDSP_minvi(v19, -1, (float *)&__C + 1, &__I, (uint64_t)v10);
      __I = -(uint64_t)__I;
      vDSP_minvi(v19, 1, (float *)&__C, &v20, v11);
      if (*((float *)&__C + 1) < 0.25)
      {
        retstr->var0 = 1;
        retstr->var1 = v13 - (double)__I;
      }
      if (*(float *)&__C < 0.25)
      {
        retstr->var2 = 1;
        retstr->var3 = v13 + (double)v20;
      }
      if ((BitmapInfo & 0x100) == 0)
        free(v23[0]);
    }
    goto LABEL_16;
  }
  return result;
}

- (id)_lineAtPoint:(CGPoint)a3 onPage:(id)a4 useVerticalCenter:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  CGContext *v13;
  CGContext *v14;
  const float *Data;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  float v20;
  float v21;
  void *v24;
  int v26;
  float __B;
  float __D[64];
  float __A[64];
  uint64_t v30;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  if (v5)
    v10 = 8.0;
  else
    v10 = 16.0;
  v11 = round(x);
  v12 = round(y);
  v13 = (CGContext *)objc_msgSend((id)objc_opt_class(), "_newBitmapInRect:onPage:scale:", v9, v11 + -8.0, v12 - v10, 16.0, 16.0, 4.0);
  if (v13)
  {
    v14 = v13;
    Data = (const float *)CGBitmapContextGetData(v13);
    v16 = 0;
    do
    {
      vDSP_sve(Data, 1, &__A[v16], 0x40uLL);
      Data += 64;
      ++v16;
    }
    while ((_DWORD)(v16 * 4) != 256);
    v26 = 1065353216;
    __B = 16.0;
    v17 = 1;
    vDSP_vthrsc(__A, 1, &__B, (const float *)&v26, __D, 1, 0x40uLL);
    v19 = 0;
    v20 = __D[0];
    do
    {
      v21 = __D[v17];
      if (v21 < v20 && v19 == 0)
      {
        v19 = 1;
        v18 = v17;
      }
      else if (v21 > v20 && v19 == 1)
      {
        -[AKFormFeatureDetector _findExtentForLineTop:lineBottom:x:onPage:](self, "_findExtentForLineTop:lineBottom:x:onPage:", v9, v12 + 16.0 - v10 - (double)v18 * 0.25, v12 + 16.0 - v10 - (double)(int)v17 * 0.25, v11);
        +[AKFormFeature featureWithRect:onPage:](AKFormFeatureLine, "featureWithRect:onPage:", v9);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      ++v17;
      v20 = v21;
    }
    while (v17 != 64);
    v24 = 0;
LABEL_22:
    CGContextRelease(v14);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_defaultFeatureForPoint:(CGPoint)a3 onPage:(id)a4 snapToVerticalEdges:(BOOL)a5
{
  double y;
  double x;
  id v9;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v21;
  double v22;
  char v23;
  double v24;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(WeakRetained, "wantsDefaultFeatures")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "defaultFeatureSizeForPage:", v9);
    v12 = v11;
    v14 = v13;
    if (a5)
    {
      -[AKFormFeatureDetector _findVerticalEdgesAtPoint:extent:onPage:](self, "_findVerticalEdgesAtPoint:extent:onPage:", (uint64_t)v11, v9, x, y);
      v15 = v22;
      v16 = v24 - v12;
      if ((v23 & 1) != 0)
      {
        v17 = 11;
      }
      else
      {
        v16 = x + v12 * -0.0;
        v17 = 3;
      }
      if ((v21 & 1) != 0)
      {
        v18 = 7;
      }
      else
      {
        v15 = v16;
        v18 = v17;
      }
    }
    else
    {
      v15 = x + v11 * -0.0;
      v18 = 3;
    }
    +[AKFormFeatureBox boxWithRect:onPage:flags:baseline:](AKFormFeatureBox, "boxWithRect:onPage:flags:baseline:", v9, v18, 0, v15, y + v14 * -0.5, v12, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_boxOnLine:(id)a3 atPoint:(CGPoint)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  CGFloat x;
  CGFloat y;
  double width;
  CGFloat height;
  double MinX;
  void *v15;
  CGRect v17;
  CGRect v18;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "page");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "defaultFeatureSizeForPage:", v7);
    v9 = v8;
    objc_msgSend(v5, "rect");
    x = v17.origin.x;
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;
    MinX = CGRectGetMinX(v17);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    +[AKFormFeatureBox boxWithRect:onPage:flags:baseline:](AKFormFeatureBox, "boxWithRect:onPage:flags:baseline:", v7, 0, v5, MinX, CGRectGetMaxY(v18), width, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (CGRect)_findExtentForLineTop:(double)a3 lineBottom:(double)a4 x:(double)a5 onPage:(id)a6
{
  id v9;
  void *v10;
  double MinX;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  CGColorSpace *DeviceGray;
  size_t NumberOfComponents;
  CGContext *v25;
  size_t v26;
  double MaxX;
  char *Data;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  unint64_t v37;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  unint64_t v44;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGRect v51;
  CGRect v52;
  CGRect result;

  v9 = a6;
  v10 = v9;
  MinX = *MEMORY[0x24BDBF090];
  v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
  if (v9)
  {
    v50 = a5;
    v15 = a3 - a4;
    v16 = a3 - a4 + 2.0;
    objc_msgSend(v9, "overlayView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v18;

    v20 = vcvtpd_u64_f64(v19);
    v21 = vcvtpd_u64_f64(v16 * 4.0);
    if (v21 && v20 != 0)
    {
      DeviceGray = CGColorSpaceCreateDeviceGray();
      NumberOfComponents = CGColorSpaceGetNumberOfComponents(DeviceGray);
      v25 = (CGContext *)objc_msgSend((id)objc_opt_class(), "_newBitmapInRect:onPage:scale:", v10, 0.0, 0.0, (double)v20, (double)v21, 1.0);
      if (v25)
      {
        v26 = NumberOfComponents * v20;
        v51.origin.x = 0.0;
        v12 = a4;
        v51.origin.y = a4;
        v51.size.width = v19;
        v51.size.height = v16;
        MinX = CGRectGetMinX(v51);
        v52.origin.x = 0.0;
        v52.origin.y = a4;
        v52.size.width = v19;
        v52.size.height = v16;
        MaxX = CGRectGetMaxX(v52);
        Data = (char *)CGBitmapContextGetData(v25);
        v29 = vcvtmd_u64_f64(v50);
        v14 = v15;
        v30 = vcvtpd_u64_f64(v15 * 4.0);
        if (v29 < v20)
        {
          v31 = v29;
          while (1)
          {
            v32 = 0;
            v33 = Data;
            v34 = 8;
            do
            {
              if (v33[v31] < 0xABu)
                ++v32;
              v33 += v26;
              --v34;
            }
            while (v34);
            if (v21 < 9)
            {
              v35 = 0;
            }
            else
            {
              v35 = 0;
              v36 = &Data[8 * v26];
              v37 = v21 - 8;
              do
              {
                if (v36[v31] > 0xDBu)
                  ++v35;
                v36 += v26;
                --v37;
              }
              while (v37);
            }
            if (v35 == v30 || v32 > 2)
              break;
            if (++v31 == v20)
              goto LABEL_27;
          }
          MaxX = (double)v31;
        }
LABEL_27:
        if (v29)
        {
          while (1)
          {
            v39 = 0;
            v40 = Data;
            v41 = 8;
            do
            {
              if (v40[v29] < 0xABu)
                ++v39;
              v40 += v26;
              --v41;
            }
            while (v41);
            if (v21 < 9)
            {
              v42 = 0;
            }
            else
            {
              v42 = 0;
              v43 = &Data[8 * v26];
              v44 = v21 - 8;
              do
              {
                if (v43[v29] > 0xDBu)
                  ++v42;
                v43 += v26;
                --v44;
              }
              while (v44);
            }
            if (v42 == v30 || v39 > 2)
              break;
            if (!--v29)
              goto LABEL_46;
          }
          MinX = (double)v29 + 1.0;
        }
LABEL_46:
        v13 = MaxX - MinX;
      }
      if (DeviceGray)
        CGColorSpaceRelease(DeviceGray);
      if (v25)
        CGContextRelease(v25);
    }
  }

  v46 = MinX;
  v47 = v12;
  v48 = v13;
  v49 = v14;
  result.size.height = v49;
  result.size.width = v48;
  result.origin.y = v47;
  result.origin.x = v46;
  return result;
}

+ (CGContext)_newBitmapInRect:(CGRect)a3 onPage:(id)a4 scale:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  const __CFData *v22;
  const __CFData *v23;
  CGDataProvider *v24;
  CGDataProvider *v25;
  CGPDFDocumentRef v26;
  CGPDFDocument *v27;
  CGContext *v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  objc_msgSend(v10, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRectFromModelToOverlay:", x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = objc_msgSend(v10, "pageIndex");

  v22 = (const __CFData *)objc_msgSend(v12, "newContentSnapshotPDFDataIncludingAdornments:atScale:inRect:onOverlayAtPageIndex:forAnnotationController:", 0, v21, v11, a5, v14, v16, v18, v20);
  v23 = v22;
  if (v22 && (v24 = CGDataProviderCreateWithCFData(v22)) != 0)
  {
    v25 = v24;
    v26 = CGPDFDocumentCreateWithProvider(v24);
    if (v26)
    {
      v27 = v26;
      v28 = (CGContext *)objc_msgSend((id)objc_opt_class(), "_newBitmapFromCGPDFDocument:", v26);
      CGPDFDocumentRelease(v27);
    }
    else
    {
      v28 = 0;
    }
    CGDataProviderRelease(v25);
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

+ (CGContext)_newBitmapFromCGPDFDocument:(CGPDFDocument *)a3
{
  CGPDFPage *Page;
  CGPDFPage *v5;
  double x;
  double y;
  double width;
  double height;
  void *v10;
  size_t v11;
  size_t v12;
  CGContext *v14;
  CGColorSpace *DeviceGray;
  size_t NumberOfComponents;
  CGContext *v18;
  CGRect BoxRect;
  CGRect v20;

  if (!a3)
    return 0;
  if (!CGPDFDocumentGetNumberOfPages(a3))
    return 0;
  Page = CGPDFDocumentGetPage(a3, 1uLL);
  if (!Page)
    return 0;
  v5 = Page;
  BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
  x = BoxRect.origin.x;
  y = BoxRect.origin.y;
  width = BoxRect.size.width;
  height = BoxRect.size.height;
  j__NSStringFromCGRect(BoxRect);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Page bounds %@"), v10);

  v11 = vcvtpd_u64_f64(width);
  v12 = vcvtpd_u64_f64(height);
  if (!v11 || v12 == 0)
    return 0;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  NumberOfComponents = CGColorSpaceGetNumberOfComponents(DeviceGray);
  v18 = CGBitmapContextCreate(0, v11, v12, 8uLL, NumberOfComponents * v11, DeviceGray, 0);
  v14 = v18;
  if (v18)
  {
    CGContextSetInterpolationQuality(v18, kCGInterpolationNone);
    CGContextSetShouldAntialias(v14, 0);
    CGContextSetAllowsAntialiasing(v14, 0);
    CGContextSetGrayFillColor(v14, 1.0, 1.0);
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = (double)(unint64_t)ceil(width);
    v20.size.height = (double)(unint64_t)ceil(height);
    CGContextFillRect(v14, v20);
    CGContextSaveGState(v14);
    CGContextScaleCTM(v14, 1.0, 1.0);
    CGContextTranslateCTM(v14, -x, -y);
    CGContextDrawPDFPage(v14, v5);
    CGContextRestoreGState(v14);
  }
  if (DeviceGray)
    CGColorSpaceRelease(DeviceGray);
  return v14;
}

- (AKFormFeatureDetectorDelegate)delegate
{
  return (AKFormFeatureDetectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
