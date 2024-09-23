@implementation JFXEffectEditingUtilities

+ (BOOL)isStreamingMode
{
  return s_isStreamingMode;
}

+ (void)setStreamingMode:(BOOL)a3
{
  s_isStreamingMode = a3;
}

+ (id)normalizedInsertionPoints
{
  if (normalizedInsertionPoints_onceToken != -1)
    dispatch_once(&normalizedInsertionPoints_onceToken, &__block_literal_global_48);
  return (id)normalizedInsertionPoints_s_normalizedInsertionPoints;
}

void __54__JFXEffectEditingUtilities_normalizedInsertionPoints__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", 0.6, 0.4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", 0.4, 0.55);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", 0.4, 0.4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", 0.6, 0.55);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)normalizedInsertionPoints_s_normalizedInsertionPoints;
  normalizedInsertionPoints_s_normalizedInsertionPoints = v4;

}

+ (id)trackedNormalizedInsertionPoints
{
  if (trackedNormalizedInsertionPoints_onceToken != -1)
    dispatch_once(&trackedNormalizedInsertionPoints_onceToken, &__block_literal_global_3);
  return (id)trackedNormalizedInsertionPoints_s_trackedNormalizedInsertionPoints;
}

void __61__JFXEffectEditingUtilities_trackedNormalizedInsertionPoints__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", 1.05, -0.05);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", -0.05, 1.05);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", -0.05, -0.05);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", 1.05, 1.05);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)trackedNormalizedInsertionPoints_s_trackedNormalizedInsertionPoints;
  trackedNormalizedInsertionPoints_s_trackedNormalizedInsertionPoints = v4;

}

+ (unint64_t)insertionPointIndex
{
  return s_insertionPointIndex;
}

+ (void)setInsertionPointIndex:(unint64_t)a3
{
  void *v4;
  unint64_t v5;

  s_insertionPointIndex = a3;
  objc_msgSend(a1, "normalizedInsertionPoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 <= a3)
    s_insertionPointIndex = 0;
}

+ (unint64_t)nextInsertionPointIndex
{
  unint64_t v2;
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v2 = s_insertionPointIndex++;
  v3 = s_insertionPointIndex;
  objc_msgSend(a1, "normalizedInsertionPoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 >= v5)
    s_insertionPointIndex = 0;
  return v2;
}

+ (CGPoint)nextNormalizedInsertionPointForOverlay:(id)a3 scaleRelativeToCenterSquare:(double)a4 atTime:(id *)a5 applyTracking:(BOOL)a6 withARMetadata:(id)a7 transformAnimation:(id)a8 playableMediaContentMode:(int)a9 playableInterfaceOrientation:(int64_t)a10
{
  _BOOL4 v13;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  __int128 v31;
  int64_t var3;
  CGPoint result;

  v13 = a6;
  v17 = a3;
  v18 = a7;
  v19 = a8;
  if (v17)
  {
    v20 = objc_msgSend(a1, "nextInsertionPointIndex");
    objc_msgSend(v18, "faceAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && v21)
    {
      objc_msgSend(a1, "trackedNormalizedInsertionPoints");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *(_OWORD *)&a5->var0;
      var3 = a5->var3;
      LODWORD(v30) = a9;
      v20 = objc_msgSend(a1, "JFX_bestTrackedInsertionPointIndexForOverlay:atTime:insertionPoints:startingIndex:visibilityThreshold:scaleRelativeToCenterSquare:withARMetadata:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:", v17, &v31, v22, v20, v18, v19, 0.4, a4, v30, a10);
      objc_msgSend(a1, "setInsertionPointIndex:", v20 + 1);
    }
    else
    {
      objc_msgSend(a1, "normalizedInsertionPoints");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "objectAtIndexedSubscript:", v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "CGPointValue");
    v23 = v26;
    v24 = v27;

  }
  else
  {
    v23 = *MEMORY[0x24BDBEFB0];
    v24 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }

  v28 = v23;
  v29 = v24;
  result.y = v29;
  result.x = v28;
  return result;
}

+ (unint64_t)JFX_bestTrackedInsertionPointIndexForOverlay:(id)a3 atTime:(id *)a4 insertionPoints:(id)a5 startingIndex:(unint64_t)a6 visibilityThreshold:(double)a7 scaleRelativeToCenterSquare:(double)a8 withARMetadata:(id)a9 transformAnimation:(id)a10 playableMediaContentMode:(int)a11 playableInterfaceOrientation:(int64_t)a12
{
  id v18;
  id v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  unint64_t v27;
  double v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id v50;
  double v51;
  double v52;
  double v53;
  double v54;
  id v57;
  double v58;
  __int128 v59;
  int64_t var3;

  v18 = a3;
  v19 = a5;
  v20 = a9;
  v57 = a10;
  objc_msgSend(v20, "faceAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(a1, "JFX_compositionBounds");
    v53 = v23;
    v54 = v22;
    v51 = v25;
    v52 = v24;
    v26 = objc_msgSend(v19, "count");
    if (v26)
    {
      v27 = v26;
      v50 = a1;
      v28 = 0.0;
      v29 = v26;
      v30 = a6;
      while (1)
      {
        v58 = v28;
        v31 = v19;
        objc_msgSend(v19, "objectAtIndexedSubscript:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "CGPointValue");
        v34 = v33;
        v36 = v35;

        objc_msgSend(v20, "faceAnchor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v18, "playableAspectRatio");
        v39 = objc_msgSend(v18, "playableAspectRatioPreservationMode");
        v59 = *(_OWORD *)&a4->var0;
        var3 = a4->var3;
        objc_msgSend(v50, "JFX_rectAtNormalizedPointinCenteredSquareInFaceRect:faceAnchor:atTime:scaleRelativeToCenterSquare:relativeToBounds:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", v37, &v59, v57, a11, a12, v38, v34, v36, a8, v54, v53, v52, v51, v39);
        v41 = v40;
        v43 = v42;
        v45 = v44;
        v47 = v46;

        v48 = CGRectPercentOfRectThatIntersectsRect(v41, v43, v45, v47, v54, v53, v52, v51);
        if (v48 > a7)
          break;
        v28 = v58;
        if (v48 > v58)
        {
          v28 = v48;
          a6 = v30;
        }
        if (v30 + 1 < v27)
          ++v30;
        else
          v30 = 0;
        --v29;
        v19 = v31;
        if (!v29)
          goto LABEL_13;
      }
      a6 = v30;
      v19 = v31;
    }
  }
LABEL_13:

  return a6;
}

+ (CGRect)JFX_rectAtNormalizedPointinCenteredSquareInFaceRect:(CGPoint)a3 faceAnchor:(id)a4 atTime:(id *)a5 scaleRelativeToCenterSquare:(double)a6 relativeToBounds:(CGRect)a7 transformAnimation:(id)a8 playableMediaContentMode:(int)a9 playableInterfaceOrientation:(int64_t)a10 playableAspectRatio:(int64_t)a11 playableAspectRatioPreservationMode:(int64_t)a12
{
  double x;
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
  $3CC8671D27C23BF42ADDB32F2B5E48AE v26;
  CGRect result;

  x = a3.x;
  v26 = *a5;
  objc_msgSend(a1, "JFX_currentFaceRectRelativeToBounds:atTime:faceAnchor:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", &v26, a4, a8, *(_QWORD *)&a9, a10, a11, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height, a12);
  v17 = v16;
  v19 = v18;
  if (v14 > v15)
    x = (x + (v14 / v15 + -1.0) * 0.5) / (v14 / v15);
  v20 = fmin(v14, v15) * a6;
  v21 = v17 + CGRectMakeWithSizeAndCenterPoint(v20, v20, v14 * x);
  v25 = v19 + v24;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v25;
  result.origin.x = v21;
  return result;
}

+ (void)configureOverlayForInsertion:(id)a3 atNormalizedPoint:(CGPoint)a4 atTime:(id *)a5 isPositionRelativeToCenterSquare:(BOOL)a6 isPositionRelativeToFace:(BOOL)a7 scaleRelativeToCenterSquare:(double)a8 rotationAngle:(double)a9 applyTracking:(BOOL)a10 autoDetectTrackingType:(BOOL)a11 withARMetadata:(id)a12 previewViewCorrectionTransform:(CGAffineTransform *)a13 transformAnimation:(id)a14 playableMediaContentMode:(int)a15 playableInterfaceOrientation:(int64_t)a16 playableAspectRatio:(int64_t)a17 playableAspectRatioPreservationMode:(int64_t)a18
{
  _BOOL4 v18;
  _BOOL4 v21;
  double y;
  double x;
  id v27;
  id v28;
  id v29;
  double v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  int64_t v54;
  _BOOL8 v55;
  CGAffineTransform *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  _BOOL4 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  int64_t var3;

  v18 = a11;
  v66 = a10;
  v21 = a7;
  y = a4.y;
  x = a4.x;
  v27 = a3;
  v28 = a12;
  v29 = a14;
  if (v27)
  {
    objc_msgSend(v27, "setPlayableAspectRatio:", a17);
    objc_msgSend(v27, "setPlayableAspectRatioPreservationMode:", a18);
    objc_msgSend(v27, "setTransformAnimation:", v29);
    v30 = multiplierForAspectRatio(a17);
    objc_msgSend(v27, "transformAnimation");
    v31 = a1;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAspectRatio:", v30);

    objc_msgSend(v31, "JFX_compositionBounds");
    v36 = v35;
    v38 = v37;
    v39 = v33;
    v40 = v34;
    if (!a6)
    {
      if (v33 <= v34)
      {
        if (v34 > v33)
          y = y * (v34 / v33) + (v34 / v33 + -1.0) * -0.5;
      }
      else
      {
        x = x * (v33 / v34) + (v33 / v34 + -1.0) * -0.5;
      }
    }
    objc_msgSend(v28, "faceAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66 && v41 && v21)
    {
      v42 = v31;
      v43 = (void *)objc_opt_class();
      objc_msgSend(v28, "faceAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = *(_OWORD *)&a5->var0;
      *(_QWORD *)&v68 = a5->var3;
      v45 = a18;
      objc_msgSend(v43, "JFX_rectAtNormalizedPointinCenteredSquareInFaceRect:faceAnchor:atTime:scaleRelativeToCenterSquare:relativeToBounds:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", v44, &v67, v29, a15, a16, a17, x, y, a8, v36, v38, v39, v40, a18);
      v47 = v46;
      v49 = v48;
      v51 = v50;
      v53 = v52;

      v54 = a17;
      v55 = v18;
      v56 = a13;
    }
    else
    {
      objc_msgSend(v27, "playableRectInOutputSize:", v39, v40);
      v59 = fmin(v57, v58) * a8;
      if (v39 > v40)
        x = ((v39 / v40 + -1.0) * 0.5 + x) / (v39 / v40);
      v55 = v18;
      v42 = v31;
      v47 = CGRectMakeWithSizeAndCenterPoint(v59, v59, v39 * x);
      v49 = v60;
      v51 = v61;
      v53 = v62;
      v56 = a13;
      v45 = a18;
      v54 = a17;
    }
    v63 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    v64 = *(_OWORD *)&v56->c;
    v67 = *(_OWORD *)&v56->a;
    v68 = v64;
    v69 = *(_OWORD *)&v56->tx;
    v70 = v63;
    LODWORD(v65) = a15;
    objc_msgSend(v42, "configureOverlayForInsertion:inRect:atTime:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", v27, &v70, v66, v55, v28, &v67, v47, v49, v51, v53, a9, v29, v65, a16, v54,
      v45);
  }

}

+ (void)configureOverlayForInsertion:(id)a3 inRect:(CGRect)a4 atTime:(id *)a5 rotationAngle:(double)a6 applyTracking:(BOOL)a7 autoDetectTrackingType:(BOOL)a8 withARMetadata:(id)a9 previewViewCorrectionTransform:(CGAffineTransform *)a10 transformAnimation:(id)a11 playableMediaContentMode:(int)a12 playableInterfaceOrientation:(int64_t)a13 playableAspectRatio:(int64_t)a14 playableAspectRatioPreservationMode:(int64_t)a15
{
  _BOOL4 v17;
  _BOOL4 v18;
  double height;
  double width;
  double y;
  CGFloat x;
  id v26;
  id v27;
  id v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  double v43;
  void *v44;
  double CenterPoint;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  uint64_t v55;
  _BOOL4 v56;
  double v57;
  double v58;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v61;
  CGAffineTransform v62;
  _OWORD v63[4];

  v17 = a8;
  v18 = a7;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v26 = a3;
  v27 = a9;
  v28 = a11;
  if (v26)
  {
    v56 = v17;
    v58 = x;
    objc_msgSend(v26, "setTransformAnimation:", v28);
    v29 = multiplierForAspectRatio(a14);
    objc_msgSend(v26, "transformAnimation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAspectRatio:", v29);

    objc_msgSend(a1, "JFX_compositionBounds");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    objc_msgSend(v26, "setRenderSize:", v35, v37);
    objc_msgSend(v26, "setPlayableAspectRatio:", a14);
    objc_msgSend(v26, "setPlayableAspectRatioPreservationMode:", a15);
    objc_msgSend(v26, "enablePresentationState:", 1);
    objc_msgSend(v26, "renderEffect");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = kDefaultEffectPreviewAnimationRange;
    v63[1] = xmmword_226AB8860;
    v63[2] = xmmword_226AB8870;
    objc_msgSend(v39, "setEffectRange:", v63);

    v40 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v62.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v62.c = v40;
    *(_OWORD *)&v62.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    if (a6 != 0.0)
      CGAffineTransformMakeRotation(&v62, a6);
    v41 = *(_OWORD *)&a10->c;
    *(_OWORD *)&v61.a = *(_OWORD *)&a10->a;
    *(_OWORD *)&v61.c = v41;
    *(_OWORD *)&v61.tx = *(_OWORD *)&a10->tx;
    if (!CGAffineTransformIsIdentity(&v61))
    {
      t1 = v62;
      v42 = *(_OWORD *)&a10->c;
      *(_OWORD *)&t2.a = *(_OWORD *)&a10->a;
      *(_OWORD *)&t2.c = v42;
      *(_OWORD *)&t2.tx = *(_OWORD *)&a10->tx;
      CGAffineTransformConcat(&v61, &t1, &t2);
      v62 = v61;
    }
    v61 = v62;
    v43 = v58;
    if (!CGAffineTransformIsIdentity(&v61))
    {
      v61 = v62;
      *(_OWORD *)&t1.a = *(_OWORD *)&a5->var0;
      *(_QWORD *)&t1.c = a5->var3;
      objc_msgSend(a1, "addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:", v26, &v61, &t1, 0, v32, v34, v36, v38);
    }
    *(_OWORD *)&v61.a = *(_OWORD *)&a5->var0;
    *(_QWORD *)&v61.c = a5->var3;
    objc_msgSend(v26, "applyScaleToFitFrame:withComponentTime:relativeRect:restrictToBounds:", &v61, 1, v58, y, width, height, v32, v34, v36, v38);
    objc_msgSend(v27, "faceAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 && v44)
    {
      if (v56)
      {
        CenterPoint = CGRectGetCenterPoint(v58, y, width, height);
        v57 = v34;
        v46 = v32;
        v47 = y;
        v48 = width;
        v49 = height;
        v51 = v50;
        objc_msgSend(v27, "faceAnchor");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_OWORD *)&v61.a = *(_OWORD *)&a5->var0;
        *(_QWORD *)&v61.c = a5->var3;
        v53 = CenterPoint;
        v54 = v51;
        height = v49;
        width = v48;
        y = v47;
        v32 = v46;
        v34 = v57;
        v43 = v58;
        v55 = objc_msgSend(a1, "trackingTypeForOverlayPointIntersectionWithFaceRect:atTime:relativeTo:defaultTrackingType:faceAnchor:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", &v61, 2, v52, v28, a12, a13, v53, v54, v32, v57, v36, v38, a14, a15);

      }
      else
      {
        v55 = 2;
      }
      *(_OWORD *)&v61.a = *(_OWORD *)&a5->var0;
      *(_QWORD *)&v61.c = a5->var3;
      objc_msgSend(a1, "makeOverlayTrackedMaintainingAppearance:atTime:newTrackingType:arMetadata:playableInterfaceOrientation:", v26, &v61, v55, v27, a13);
      *(_OWORD *)&v61.a = *(_OWORD *)&a5->var0;
      *(_QWORD *)&v61.c = a5->var3;
      objc_msgSend(v26, "applyScaleToFitFrame:withComponentTime:relativeRect:restrictToBounds:", &v61, 1, v43, y, width, height, v32, v34, v36, v38);
    }
  }

}

+ (id)hitTestOverlays:(id)a3 atPoint:(CGPoint)a4 relativeToBounds:(CGRect)a5 atTime:(id *)a6 adjustForMinimumSize:(BOOL)a7 normalizedMinimumSize:(id)a8
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  v9 = *a6;
  objc_msgSend(a1, "JFX_hitTestOverlays:atNormalizedPoint:atTime:forcePosterFrame:adjustForMinimumSize:normalizedMinimumSize:", a3, &v9, 0, a7, a4.x / a5.size.width, a4.y / a5.size.height, a8.var0, a8.var1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hitTestOverlaysAtPosterFrame:(id)a3 atPoint:(CGPoint)a4 relativeToBounds:(CGRect)a5 atTime:(id *)a6 adjustForMinimumSize:(BOOL)a7 normalizedMinimumSize:(id)a8
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  v9 = *a6;
  objc_msgSend(a1, "JFX_hitTestOverlays:atNormalizedPoint:atTime:forcePosterFrame:adjustForMinimumSize:normalizedMinimumSize:", a3, &v9, 1, a7, a4.x / a5.size.width, a4.y / a5.size.height, a8.var0, a8.var1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hitTestOverlaysAtPosterFrame:(id)a3 atNormalizedPoint:(CGPoint)a4 atTime:(id *)a5 adjustForMinimumSize:(BOOL)a6 normalizedMinimumSize:(id)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v8 = *a5;
  objc_msgSend(a1, "JFX_hitTestOverlays:atNormalizedPoint:atTime:forcePosterFrame:adjustForMinimumSize:normalizedMinimumSize:", a3, &v8, 1, a6, a4.x, a4.y, a7.var0, a7.var1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)JFX_hitTestOverlays:(id)a3 atNormalizedPoint:(CGPoint)a4 atTime:(id *)a5 forcePosterFrame:(BOOL)a6 adjustForMinimumSize:(BOOL)a7 normalizedMinimumSize:(id)a8
{
  double var1;
  double var0;
  _BOOL8 v10;
  _BOOL8 v11;
  double y;
  double x;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  __int128 v29;
  int64_t var3;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  var1 = a8.var1;
  var0 = a8.var0;
  v10 = a7;
  v11 = a6;
  y = a4.y;
  x = a4.x;
  v36 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  if (objc_msgSend(v15, "count"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v15, "reverseObjectEnumerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v21, "renderEffect");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "outputSize");
          v24 = v23;
          v26 = v25;

          v29 = *(_OWORD *)&a5->var0;
          var3 = a5->var3;
          if ((objc_msgSend(v21, "hitTestPoint:atTime:forcePosterFrame:relativeTo:basisOrigin:adjustForMinimumSize:normalizedMinimumSize:", &v29, v11, 1, v10, x * v24, y * v26, 0.0, 0.0, v24, v26, var0, var1) & 1) != 0)
          {
            v27 = v21;
            goto LABEL_12;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v18)
          continue;
        break;
      }
    }
    v27 = 0;
LABEL_12:

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (void)suspendOverlayTrackingMaintainingAppearance:(id)a3 forViewBounds:(CGRect)a4 atTime:(id *)a5 arMetadata:(id)a6 playableInterfaceOrientation:(int64_t)a7
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  __int128 v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  _OWORD var40[5];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v15 = a6;
  if (objc_msgSend(v14, "isCurrentlyTracking"))
  {
    objc_msgSend(v14, "trackingProps");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "currentTrackingType");

    if (v17 == 1)
    {
      objc_msgSend(v15, "faceAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[JFXFaceTrackingUtilities rollAngleFromFaceAnchor:forInterfaceOrientation:](JFXFaceTrackingUtilities, "rollAngleFromFaceAnchor:forInterfaceOrientation:", v18, a7);

      objc_msgSend(v14, "renderEffect");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "origin");

      objc_msgSend(v14, "renderEffect");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "outputSize");

      v22 = CGRectMakeWithSize();
      v59 = *(_OWORD *)&a5->var0;
      *(_QWORD *)&v60 = a5->var3;
      objc_msgSend(v14, "effectCenterAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &v59, 1, 0, 0, v20, v22);
      v49 = v24;
      v50 = v23;
      objc_msgSend(v14, "faceTrackingTransform");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      JFXMakeFaceTrackedEffectTransformFaceCamera(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFaceTrackingTransform:", v26);

      v59 = *(_OWORD *)&a5->var0;
      *(_QWORD *)&v60 = a5->var3;
      objc_msgSend(v14, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v59, 1, 1, 1, x, y, width, height);
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      objc_msgSend(v14, "setFaceTrackingTransform:", v25);
      objc_msgSend(v14, "suspendTracking");
      v59 = *(_OWORD *)&a5->var0;
      *(_QWORD *)&v60 = a5->var3;
      objc_msgSend(v14, "applyScaleToFitFrame:withComponentTime:relativeRect:", &v59, v28, v30, v32, v34, x, y, width, height);
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      if (v14)
        objc_msgSend(v14, "topLevelTransform");
      __asm { FMOV            V0.2D, #1.0 }
      pv_simd_matrix_rotate();
      v66 = v58;
      v63 = v56;
      v64 = v57;
      v59 = v52;
      v60 = v53;
      *(_QWORD *)&v40 = v50;
      *((_QWORD *)&v40 + 1) = v49;
      v61 = v54;
      v62 = v55;
      v65 = v40;
      var40[4] = v56;
      var40[0] = v52;
      var40[1] = v53;
      var40[2] = v54;
      var40[3] = v55;
      objc_msgSend(v14, "setTopLevelTransform:", var40);

    }
    else
    {
      v59 = *(_OWORD *)&a5->var0;
      *(_QWORD *)&v60 = a5->var3;
      objc_msgSend(v14, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v59, 1, 1, 1, x, y, width, height);
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;
      objc_msgSend(v14, "suspendTracking");
      v59 = *(_OWORD *)&a5->var0;
      *(_QWORD *)&v60 = a5->var3;
      objc_msgSend(v14, "applyScaleToFitFrame:withComponentTime:relativeRect:", &v59, v42, v44, v46, v48, x, y, width, height);
    }
  }

}

+ (BOOL)makeOverlayTrackedMaintainingAppearance:(id)a3 atTime:(id *)a4 newTrackingType:(int64_t)a5 arMetadata:(id)a6 playableInterfaceOrientation:(int64_t)a7
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  void *v40;
  float64_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  double v45;
  double v47;
  double v48;
  double v50;
  BOOL v51;
  double v52;
  __int128 v53;
  double v54;
  double v55;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  void *v79;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  float32x2_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  float64x2_t v108;
  CGAffineTransform v109;
  __int128 t2;
  __int128 t2_16;
  __int128 t2_32;
  __int128 t1;
  __int128 t1_16;
  __int128 t1_32;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;

  v12 = a3;
  v13 = a6;
  objc_msgSend(v12, "trackingProps");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "currentTrackingType");

  if (a5)
    _ZF = v15 == a5;
  else
    _ZF = 1;
  v17 = !_ZF;
  if (!_ZF)
  {
    objc_msgSend(a1, "JFX_compositionBounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend(v13, "faceAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[JFXFaceTrackingUtilities rollAngleFromFaceAnchor:forInterfaceOrientation:](JFXFaceTrackingUtilities, "rollAngleFromFaceAnchor:forInterfaceOrientation:", v26, a7);
    v28 = v27;

    if (v15)
    {
      *(_OWORD *)&STACK[0x8C0] = *(_OWORD *)&a4->var0;
      STACK[0x8D0] = a4->var3;
      objc_msgSend(v12, "effectCenterAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &STACK[0x8C0], 1, 1, 1, 1, v19, v21, v23, v25);
      v30 = v29;
      v32 = v31;
      *(_OWORD *)&STACK[0x930] = 0u;
      *(_OWORD *)&STACK[0x920] = 0u;
      *(_OWORD *)&STACK[0x910] = 0u;
      *(_OWORD *)&STACK[0x900] = 0u;
      *(_OWORD *)&STACK[0x8F0] = 0u;
      *(_OWORD *)&STACK[0x8D0] = 0u;
      *(_OWORD *)&STACK[0x8E0] = 0u;
      *(_OWORD *)&STACK[0x8C0] = 0u;
      if (v12)
      {
        *(_OWORD *)&STACK[0x840] = *(_OWORD *)&a4->var0;
        STACK[0x850] = a4->var3;
        objc_msgSend(v12, "transformAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &STACK[0x840], 1, 0, 1, 1, v19, v21, v23, v25);
      }
      objc_msgSend(v12, "trackingProps");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTrackingType:", a5);

      objc_msgSend(v12, "faceTrackingTransform");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
        objc_msgSend(a1, "applyCameraTrackingTransformToOverlay:withARMetadata:playableInterfaceOrientation:", v12, v13, a7);
      v35 = 0uLL;
      *(_OWORD *)&STACK[0x8A0] = 0u;
      *(_OWORD *)&STACK[0x8B0] = 0u;
      *(_OWORD *)&STACK[0x880] = 0u;
      *(_OWORD *)&STACK[0x890] = 0u;
      *(_OWORD *)&STACK[0x860] = 0u;
      *(_OWORD *)&STACK[0x870] = 0u;
      v36 = 0uLL;
      *(_OWORD *)&STACK[0x840] = 0u;
      *(_OWORD *)&STACK[0x850] = 0u;
      if (v12)
      {
        *(_OWORD *)&STACK[0x7C0] = *(_OWORD *)&a4->var0;
        STACK[0x7D0] = a4->var3;
        objc_msgSend(v12, "transformAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &STACK[0x7C0], 1, 0, 1, 1, v19, v21, v23, v25);
        v36 = 0uLL;
        v37 = *(float64x2_t *)&STACK[0x870];
        v38 = *(float64x2_t *)&STACK[0x890];
        v35 = *(float64x2_t *)&STACK[0x8B0];
        v39 = vmulq_f64(*(float64x2_t *)&STACK[0x850], (float64x2_t)0);
      }
      else
      {
        v38 = 0uLL;
        v37 = 0uLL;
        v39 = 0uLL;
      }
      v43 = vaddq_f64(*(float64x2_t *)&STACK[0x930], vmlaq_f64(vmlaq_f64(vmulq_f64(*(float64x2_t *)&STACK[0x8D0], v36), v36, *(float64x2_t *)&STACK[0x8F0]), v36, *(float64x2_t *)&STACK[0x910]));
      v44 = vaddq_f64(v35, vmlaq_f64(vmlaq_f64(v39, v36, v37), v36, v38));
      v45 = v43.f64[1];
      if (v43.f64[1] < 0.0000001 && v43.f64[1] > -0.0000001)
        v45 = 1.0;
      v47 = v43.f64[0] / v45;
      v48 = v44.f64[1];
      if (v44.f64[1] < 0.0000001 && v44.f64[1] > -0.0000001)
        v48 = 1.0;
      v50 = v44.f64[0] / v48;
      v51 = v47 >= 0.0000001 || v47 <= -0.0000001;
      v52 = v50 / v47;
      if (!v51)
        v52 = 1.0;
      *(float64x2_t *)&STACK[0x7D0] = v36;
      *(float64x2_t *)&STACK[0x7E0] = v36;
      if (a5 == 2)
        v28 = -v28;
      *(float64x2_t *)&STACK[0x7C0] = v36;
      CGAffineTransformMakeScale((CGAffineTransform *)&STACK[0x7C0], v52, v52);
      v120 = 0u;
      v121 = 0u;
      v119 = 0u;
      CGAffineTransformMakeRotation((CGAffineTransform *)&v119, v28);
      v117 = 0u;
      v118 = 0u;
      v53 = *(_OWORD *)&STACK[0x7D0];
      t1 = *(_OWORD *)&STACK[0x7C0];
      t1_16 = v53;
      t1_32 = *(_OWORD *)&STACK[0x7E0];
      v116 = 0u;
      t2 = v119;
      t2_16 = v120;
      t2_32 = v121;
      CGAffineTransformConcat((CGAffineTransform *)&v116, (CGAffineTransform *)&t1, (CGAffineTransform *)&t2);
      t1 = v116;
      t1_16 = v117;
      t1_32 = v118;
      t2 = *(_OWORD *)&a4->var0;
      *(_QWORD *)&t2_16 = a4->var3;
      objc_msgSend(a1, "addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:", v12, &t1, &t2, 0, v19, v21, v23, v25);
      t1 = *(_OWORD *)&a4->var0;
      *(_QWORD *)&t1_16 = a4->var3;
      objc_msgSend(v12, "effectCenterAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &t1, 1, 1, 1, 1, v19, v21, v23, v25);
      CGAffineTransformMakeTranslation(&v109, v30 - v54, v32 - v55);
      t1 = *(_OWORD *)&a4->var0;
      *(_QWORD *)&t1_16 = a4->var3;
      objc_msgSend(a1, "addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:", v12, &v109, &t1, 0, v19, v21, v23, v25);
    }
    else
    {
      objc_msgSend(v12, "renderEffect");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "outputSize");
      v42.f64[1] = v41;
      v108 = v42;

      if (v12)
      {
        objc_msgSend(v12, "topLevelTransform");
      }
      else
      {
        *(_OWORD *)&STACK[0x9B0] = 0u;
        *(_OWORD *)&STACK[0x9A0] = 0u;
        *(_OWORD *)&STACK[0x990] = 0u;
        *(_OWORD *)&STACK[0x980] = 0u;
        *(_OWORD *)&STACK[0x970] = 0u;
        *(_OWORD *)&STACK[0x960] = 0u;
        *(_OWORD *)&STACK[0x950] = 0u;
        *(_OWORD *)&STACK[0x940] = 0u;
      }
      __asm { FMOV            V0.2D, #0.5 }
      *(_OWORD *)&STACK[0x8C0] = *(_OWORD *)&a4->var0;
      STACK[0x8D0] = a4->var3;
      objc_msgSend(v12, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &STACK[0x8C0], 1, 1, 1, v19, v21, v23, v25);
      v61 = v60;
      v63 = v62;
      v65 = v64;
      v67 = v66;
      objc_msgSend(v12, "trackingProps");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setTrackingType:", a5);

      objc_msgSend(v12, "faceTrackingTransform");
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v69)
        objc_msgSend(a1, "applyCameraTrackingTransformToOverlay:withARMetadata:playableInterfaceOrientation:", v12, v13, a7);
      objc_msgSend(v12, "faceTrackingTransform");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5 == 1)
      {
        objc_msgSend(v12, "faceTrackingTransform");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        JFXMakeFaceTrackedEffectTransformFaceCamera(v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setFaceTrackingTransform:", v72);

        *(_OWORD *)&STACK[0x8C0] = *(_OWORD *)&a4->var0;
        STACK[0x8D0] = a4->var3;
        objc_msgSend(v12, "applyScaleToFitFrame:withComponentTime:relativeRect:", &STACK[0x8C0], v61, v63, v65, v67, v19, v21, v23, v25);
        objc_msgSend(v12, "setFaceTrackingTransform:", v70);
      }
      else
      {
        *(_OWORD *)&STACK[0x8C0] = *(_OWORD *)&a4->var0;
        STACK[0x8D0] = a4->var3;
        objc_msgSend(v12, "applyScaleToFitFrame:withComponentTime:relativeRect:", &STACK[0x8C0], v61, v63, v65, v67, v19, v21, v23, v25);
      }
      DWORD2(v119) = 0;
      *(_QWORD *)&v119 = 0;
      objc_msgSend(v12, "faceTrackingTransform");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "transformForTrackingType:", a5);
      objc_msgSend(v12, "faceTrackingTransform");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "cameraTransform");
      v106 = v76;
      v107 = v75;
      v104 = v78;
      v105 = v77;
      objc_msgSend(v12, "faceTrackingTransform");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "cameraProjection");
      __asm { FMOV            V4.4S, #-1.0 }
      v103 = vcvt_f32_f64(v108);
      v101 = v81;
      v102 = v82;
      v99 = v83;
      v100 = v84;
      pv_simd_matrix_unproject_to_plane();

      *(_OWORD *)&STACK[0x930] = 0u;
      *(_OWORD *)&STACK[0x920] = 0u;
      *(_OWORD *)&STACK[0x910] = 0u;
      *(_OWORD *)&STACK[0x900] = 0u;
      *(_OWORD *)&STACK[0x8F0] = 0u;
      *(_OWORD *)&STACK[0x8D0] = 0u;
      *(_OWORD *)&STACK[0x8E0] = 0u;
      *(_OWORD *)&STACK[0x8C0] = 0u;
      if (v12)
        objc_msgSend(v12, "topLevelTransform");
      if (a5 == 1)
      {
        v85 = *(_OWORD *)&STACK[0x910];
        *(_OWORD *)&STACK[0x800] = *(_OWORD *)&STACK[0x900];
        *(_OWORD *)&STACK[0x810] = v85;
        v86 = *(_OWORD *)&STACK[0x930];
        *(_OWORD *)&STACK[0x820] = *(_OWORD *)&STACK[0x920];
        *(_OWORD *)&STACK[0x830] = v86;
        v87 = *(_OWORD *)&STACK[0x8D0];
        *(_OWORD *)&STACK[0x7C0] = *(_OWORD *)&STACK[0x8C0];
        *(_OWORD *)&STACK[0x7D0] = v87;
        v88 = *(_OWORD *)&STACK[0x8F0];
        *(_OWORD *)&STACK[0x7E0] = *(_OWORD *)&STACK[0x8E0];
        *(_OWORD *)&STACK[0x7F0] = v88;
        STACK[0x7A8] = 0;
        STACK[0x7A0] = 0;
        __asm { FMOV            V1.2D, #1.0 }
        *(_OWORD *)&STACK[0x7B0] = _Q1;
        pv_simd_matrix_rotate();
        v90 = *(_OWORD *)&STACK[0x890];
        *(_OWORD *)&STACK[0x900] = *(_OWORD *)&STACK[0x880];
        *(_OWORD *)&STACK[0x910] = v90;
        v91 = *(_OWORD *)&STACK[0x8B0];
        *(_OWORD *)&STACK[0x920] = *(_OWORD *)&STACK[0x8A0];
        *(_OWORD *)&STACK[0x930] = v91;
        v92 = *(_OWORD *)&STACK[0x850];
        *(_OWORD *)&STACK[0x8C0] = *(_OWORD *)&STACK[0x840];
        *(_OWORD *)&STACK[0x8D0] = v92;
        v93 = *(_OWORD *)&STACK[0x870];
        *(_OWORD *)&STACK[0x8E0] = *(_OWORD *)&STACK[0x860];
        *(_OWORD *)&STACK[0x8F0] = v93;
      }
      *(float64x2_t *)&STACK[0x920] = vcvtq_f64_f32(*(float32x2_t *)&v119);
      v94 = *(_OWORD *)&STACK[0x910];
      v126 = *(_OWORD *)&STACK[0x900];
      v127 = v94;
      v95 = *(_OWORD *)&STACK[0x8D0];
      v122 = *(_OWORD *)&STACK[0x8C0];
      v123 = v95;
      v96 = *(_OWORD *)&STACK[0x8F0];
      v124 = *(_OWORD *)&STACK[0x8E0];
      v125 = v96;
      v97 = *(_OWORD *)&STACK[0x930];
      *(_OWORD *)&STACK[0x780] = *(_OWORD *)&STACK[0x920];
      *(_OWORD *)&STACK[0x790] = v97;
      objc_msgSend(v12, "setTopLevelTransform:", &v122, v107, v106, v105, v104, v99, v100, v101, v102, *(_QWORD *)&v103);

    }
  }

  return v17;
}

+ (void)applyCameraTrackingTransformToOverlay:(id)a3 withARMetadata:(id)a4 playableInterfaceOrientation:(int64_t)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  JFXFaceTrackingTransformCalculator *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  objc_msgSend(v7, "faceAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[JFXMediaSettings compositionSize](JFXMediaSettings, "compositionSize");
    objc_msgSend(v13, "playableRectInOutputSize:");
    v11 = -[JFXFaceTrackingTransformCalculator initWithARMetaData:outputSize:playableInterfaceOrientation:]([JFXFaceTrackingTransformCalculator alloc], "initWithARMetaData:outputSize:playableInterfaceOrientation:", v7, a5, v9, v10);
    -[JFXFaceTrackingTransformCalculator calculateFaceTrackingTransform](v11, "calculateFaceTrackingTransform");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFaceTrackingTransform:", v12);

  }
}

+ (CGPoint)JFX_convertPoint:(CGPoint)a3 fromSize:(CGSize)a4 toSize:(CGSize)a5 invertY:(BOOL)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  v6 = a3.x / a4.width;
  v7 = a3.y / a4.height;
  if (a6)
    v7 = 1.0 - v7;
  v8 = v6 * a5.width;
  v9 = a5.height * v7;
  result.y = v9;
  result.x = v8;
  return result;
}

+ (int64_t)trackingTypeForOverlayPointIntersectionWithFaceRect:(CGPoint)a3 atTime:(id *)a4 relativeTo:(CGRect)a5 defaultTrackingType:(int64_t)a6 faceAnchor:(id)a7 transformAnimation:(id)a8 playableMediaContentMode:(int)a9 playableInterfaceOrientation:(int64_t)a10 playableAspectRatio:(int64_t)a11 playableAspectRatioPreservationMode:(int64_t)a12
{
  CGFloat y;
  CGFloat x;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;
  CGPoint v16;
  CGRect v17;

  if (!a7)
    return 0;
  y = a3.y;
  x = a3.x;
  v15 = *a4;
  objc_msgSend(a1, "JFX_currentFaceRectRelativeToBounds:atTime:faceAnchor:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", &v15, a7, a8, *(_QWORD *)&a9, a10, a11, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a12);
  v16.x = x;
  v16.y = y;
  if (CGRectContainsPoint(v17, v16))
    return 1;
  else
    return 2;
}

+ (CGPoint)JFX_closeButtonInsetForEffect:(id)a3 viewBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;
  CGRect v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(a3, "closeButtonInset");
  v9 = v8;
  v11 = v10;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v12 = v9 * CGRectGetWidth(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v13 = v11 * CGRectGetHeight(v17);
  v14 = v12;
  result.y = v13;
  result.x = v14;
  return result;
}

+ (CGPoint)removeButtonPositionForEffect:(id)a3 atTime:(id *)a4 atPosterFrameRelativeToBounds:(CGRect)a5 viewCorrectionTransform:(CGAffineTransform *)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  float64x2_t *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  float32x2_t v40;
  float64x2_t v41;
  int64x2_t v42;
  int64x2_t v43;
  float32x4_t v44;
  float64x2_t v45;
  float64x2_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  float64x2_t v51;
  float64x2_t v52;
  long double v53;
  double i;
  double MinX;
  CGFloat MaxX;
  double MinY;
  double v58;
  double v59;
  double v60;
  double v61;
  float64x2_t v62;
  CGAffineTransform v63;
  PVCGPointQuad v64;
  float64x2_t v65;
  __int128 v66;
  float64x2_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  float64x2_t v71;
  __int128 v72;
  CGAffineTransform v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  CGPoint result;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v13;
    v15 = objc_msgSend(v14, "includeDropShadowWhenPositioningCloseButton");
    if ((objc_msgSend(a1, "isFaceTrackingDataAvailable") & 1) == 0)
    {
      objc_msgSend(v14, "trackingProps");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "currentTrackingType");

      if (v17)
      {
        v18 = 1.79769313e308;
        v19 = 1.79769313e308;
LABEL_35:

        goto LABEL_36;
      }
    }
    v20 = (float64x2_t *)a6;
    +[JFXEffectEditingUtilities textForEffect:](JFXEffectEditingUtilities, "textForEffect:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v21;
    objc_msgSend(v21, "stringByTrimmingCharactersInSet:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (!v25)
      +[JFXEffectEditingUtilities updateEffectText:newText:](JFXEffectEditingUtilities, "updateEffectText:newText:", v14, CFSTR("!"));
    *(_OWORD *)&v73.a = *(_OWORD *)&a4->var0;
    *(_QWORD *)&v73.c = a4->var3;
    +[JFXOverlayEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXOverlayEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v14, 1, &v73, 1, v15, 0, width, height);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
      objc_msgSend(v26, "cornerPoints");
    else
      memset(&v64, 0, sizeof(v64));
    pv_bounding_CGRect(&v64);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    if (!v25)
      +[JFXEffectEditingUtilities updateEffectText:newText:](JFXEffectEditingUtilities, "updateEffectText:newText:", v14, v23);
    objc_msgSend(a1, "JFX_closeButtonInsetForEffect:viewBounds:", v14, x, y, width, height);
    v60 = v37;
    v61 = v36;
    objc_msgSend(v14, "topLevelTransformObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
    {
      objc_msgSend(v38, "SIMDFloat4x4");
      v41 = vcvtq_f64_f32(v40);
      v44 = (float32x4_t)vzip1q_s64(v43, v42);
      v45 = vcvt_hight_f64_f32(v44);
      v46 = vcvtq_f64_f32(*(float32x2_t *)v44.f32);
    }
    else
    {
      v41 = *(float64x2_t *)MEMORY[0x24BDBD8B8];
      v45 = *(float64x2_t *)(MEMORY[0x24BDBD8B8] + 16);
      v46 = *(float64x2_t *)(MEMORY[0x24BDBD8B8] + 32);
    }
    v47 = *(_OWORD *)(MEMORY[0x24BE79710] + 80);
    v75 = *(_OWORD *)(MEMORY[0x24BE79710] + 64);
    v76 = v47;
    v48 = *(_OWORD *)(MEMORY[0x24BE79710] + 112);
    v77 = *(_OWORD *)(MEMORY[0x24BE79710] + 96);
    v78 = v48;
    v49 = *(_OWORD *)(MEMORY[0x24BE79710] + 16);
    *(_OWORD *)&v73.a = *MEMORY[0x24BE79710];
    *(_OWORD *)&v73.c = v49;
    v50 = *(_OWORD *)(MEMORY[0x24BE79710] + 48);
    *(_OWORD *)&v73.tx = *(_OWORD *)(MEMORY[0x24BE79710] + 32);
    v74 = v50;
    v65 = v41;
    v66 = 0u;
    v67 = v45;
    v68 = 0u;
    v69 = 0u;
    v70 = xmmword_226AB71E0;
    v71 = v46;
    v72 = xmmword_226AB71D0;
    pv_transform_info_make();
    CGAffineTransformMakeScale(&v63, *(CGFloat *)&v75, *((CGFloat *)&v75 + 1));
    v62 = vaddq_f64(*(float64x2_t *)&v63.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v63.c, v60), *(float64x2_t *)&v63.a, v61));
    v51 = v20[1];
    *(float64x2_t *)&v73.a = *v20;
    *(float64x2_t *)&v73.c = v51;
    *(float64x2_t *)&v73.tx = v20[2];
    if (CGAffineTransformIsIdentity(&v73))
    {
      v52 = v62;
LABEL_34:
      v19 = v52.f64[0] + v29;
      v18 = v52.f64[1] + v31;

      goto LABEL_35;
    }
    v53 = atan2(v20->f64[1], v20->f64[0]);
    for (i = fmod(v53, 6.28318531); i < 0.0; i = i + 6.28318531)
      ;
    if (i >= 0.785398263)
    {
      if (i < 1.57079643 || i < 2.35619459)
      {
        v81.origin.x = v29;
        v81.origin.y = v31;
        v81.size.width = v33;
        v81.size.height = v35;
        MaxX = CGRectGetMaxX(v81);
        v82.origin.x = v29;
        v82.origin.y = v31;
        v82.size.width = v33;
        v82.size.height = v35;
        MinY = CGRectGetMinY(v82);
      }
      else
      {
        if (i < 3.14159275 || i < 3.92699092)
        {
          v83.origin.x = v29;
          v83.origin.y = v31;
          v83.size.width = v33;
          v83.size.height = v35;
          MinX = CGRectGetMaxX(v83);
        }
        else
        {
          if (i >= 4.71238908 && i >= 5.49778724)
            goto LABEL_33;
          v80.origin.x = v29;
          v80.origin.y = v31;
          v80.size.width = v33;
          v80.size.height = v35;
          MinX = CGRectGetMinX(v80);
        }
        MaxX = MinX;
        v84.origin.x = v29;
        v84.origin.y = v31;
        v84.size.width = v33;
        v84.size.height = v35;
        MinY = CGRectGetMaxY(v84);
      }
      v31 = MinY;
      v29 = MaxX;
    }
LABEL_33:
    v52 = vaddq_f64(v20[2], vmlaq_n_f64(vmulq_laneq_f64(v20[1], v62, 1), *v20, v62.f64[0]));
    goto LABEL_34;
  }
  v18 = 1.79769313e308;
  v19 = 1.79769313e308;
LABEL_36:

  v58 = v19;
  v59 = v18;
  result.y = v59;
  result.x = v58;
  return result;
}

+ (CGPoint)spacingBetweenCenterPointOfEffect:(id)a3 point:(CGPoint)a4 relativeToBounds:(CGRect)a5 atTime:(id *)a6
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  PVCGPointQuad v20[2];
  CGPoint result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4.y;
  v12 = a4.x;
  v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    memset(&v20[1], 0, sizeof(PVCGPointQuad));
    if (v13)
    {
      v20[0].a = *(CGPoint *)&a6->var0;
      *(_QWORD *)&v20[0].b.x = a6->var3;
      objc_msgSend(v13, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:", v20, 1, 1, 1, 1.0, 1.0, x, y, width, height);
    }
    v20[0] = v20[1];
    pv_CGPoint_get_quad_center(v20);
    v15 = v12 - v14;
    v17 = v11 - v16;
  }
  else
  {
    v15 = *MEMORY[0x24BDBEFB0];
    v17 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }

  v18 = v15;
  v19 = v17;
  result.y = v19;
  result.x = v18;
  return result;
}

+ (void)addTransformToEffect:(id)a3 transform:(CGAffineTransform *)a4 relativeToBounds:(CGRect)a5 time:(id *)a6 restrictToBounds:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  int64_t var3;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v7 = a7;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v15;
    v17 = v16;
    if (v16)
    {
      v25 = 0u;
      v26 = 0u;
      v18 = *(_OWORD *)&a4->c;
      v21 = *(_OWORD *)&a4->a;
      v22 = v18;
      v23 = *(_OWORD *)&a4->tx;
      v24 = 0u;
      v19 = *(_OWORD *)&a6->var0;
      var3 = a6->var3;
      objc_msgSend(v16, "addTransform:withComponentTime:relativeTo:basisOrigin:restrictToBounds:", &v21, &v19, 1, v7, x, y, width, height);
      v21 = v24;
      v22 = v25;
      v23 = v26;
      objc_msgSend(a1, "JFX_ApplyTextFlipIfNeeded:transform:", v17, &v21);
    }

  }
}

+ (void)JFX_ApplyTextFlipIfNeeded:(id)a3 transform:(CGAffineTransform *)a4
{
  double v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  double v13;
  double i;
  _BOOL8 v15;
  id v16;

  v16 = a3;
  v6 = atan2(a4->b, a4->a);
  v7 = objc_msgSend(v16, "supportsFlippingText");
  v8 = objc_msgSend(v16, "supportsFlippingTail");
  v9 = v8;
  if ((v7 & 1) == 0 && !v8)
    goto LABEL_29;
  if (objc_msgSend(a1, "isStreamingMode"))
  {
    objc_msgSend(v16, "trackingProps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "currentTrackingType");

    if (v11 != 1)
    {
      v12 = +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation");
      switch(v12)
      {
        case 1:
          v13 = 0.0;
          break;
        case 3:
          v13 = 1.57079633;
          break;
        case 4:
          v13 = -1.57079633;
          break;
        default:
          v13 = 3.14159265;
          if (v12 != 2)
            v13 = 0.0;
          break;
      }
      v6 = v6 + v13;
    }
  }
  for (i = fmod(v6, 6.28318531); i < 0.0; i = i + 6.28318531)
    ;
  v15 = i < 4.71238898 && i > 1.57079633;
  if (v15)
  {
    if (v7)
      objc_msgSend(v16, "setFlipText:", 1);
    if ((v9 & 1) == 0)
      goto LABEL_29;
LABEL_28:
    objc_msgSend(v16, "setFlipTail:", v15);
    goto LABEL_29;
  }
  if (v7)
    objc_msgSend(v16, "setFlipText:", 0);
  if (v9)
    goto LABEL_28;
LABEL_29:

}

+ (void)updateEffectText:(id)a3 newText:(id)a4
{
  __CFString *v5;
  id v6;
  id v7;

  v7 = a3;
  v5 = (__CFString *)a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v7;
    if (!v5 || !-[__CFString length](v5, "length"))
    {

      v5 = CFSTR(" ");
    }
    objc_msgSend(v6, "setString:atIndex:", v5, 0);

  }
}

+ (void)updateEffectToDefaultTextIfEmpty:(id)a3
{
  char isKindOfClass;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v15;
  if ((isKindOfClass & 1) != 0)
  {
    v5 = v15;
    objc_msgSend(v5, "strings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (!v11)
    {
      objc_msgSend(v5, "defaultAttributedString:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "string");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setString:atIndex:", v14, 0);

      }
    }

    v4 = v15;
  }

}

+ (id)textForEffect:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_opt_class();
  v4 = &stru_24EE5C428;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "strings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7)
      v4 = (__CFString *)v7;
  }

  return v4;
}

+ (void)JFX_setTextRenderingEnabledForEffect:(id)a3 value:(BOOL)a4
{
  _BOOL4 v4;
  id v5;

  v4 = a4;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4)
      objc_msgSend(v5, "endTextEditing");
    else
      objc_msgSend(v5, "beginTextEditing");
  }

}

+ (void)beginTextEditingForEffect:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "effectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "shouldRenderTextWithMotionWhileEditingTextForEffectID:", v4);

  if ((v5 & 1) == 0)
    objc_msgSend(a1, "JFX_setTextRenderingEnabledForEffect:value:", v6, 0);

}

+ (void)endTextEditingForEffect:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "effectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "shouldRenderTextWithMotionWhileEditingTextForEffectID:", v4);

  if ((v5 & 1) == 0)
    objc_msgSend(a1, "JFX_setTextRenderingEnabledForEffect:value:", v6, 1);

}

+ (BOOL)canEditTextForEffect:(id)a3
{
  id v3;
  id v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if ((objc_msgSend(v4, "textBakedIn") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v4, "defaultAttributedString:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "length") != 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldAutoEditTextForEffect:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v3, "isEmoji") & 1) == 0;

  return v4;
}

+ (unint64_t)maximumTextLengthForEffect:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "maxCharacters");
  else
    v4 = -1;

  return v4;
}

+ (id)newTextEditingPropertiesForEffect:(id)a3 relativeTo:(CGRect)a4 atTime:(id *)a5 withNewText:(id)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a5;
  return (id)objc_msgSend(a1, "newTextEditingPropertiesForEffect:relativeTo:atTime:withNewText:moveBeforeScalingToAvoidKeyboard:", a3, &v7, a6, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newTextEditingPropertiesForEffect:(id)a3 relativeTo:(CGRect)a4 atTime:(id *)a5 withNewText:(id)a6 moveBeforeScalingToAvoidKeyboard:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  void *v16;
  __int128 v18;
  int64_t var3;

  v7 = a7;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v15 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    +[JFXEffectTextEditingProperties textEditingPropertiesWithTextEffect:withText:relativeTo:atTime:index:moveBeforeScalingToAvoidKeyboard:](JFXEffectTextEditingProperties, "textEditingPropertiesWithTextEffect:withText:relativeTo:atTime:index:moveBeforeScalingToAvoidKeyboard:", v14, v15, &v18, 0, v7, x, y, width, height);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)shouldRenderTextWithMotionWhileEditingTextForEffectID:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE79440]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE79448]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE79538]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE79540]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE79518]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE79530]);
  }

  return v4;
}

+ (BOOL)shouldDisableTextOutlineWhileEditingTextForEffectID:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BE79520]);
}

+ (BOOL)shouldUseFullTransformWhileEditingTextForEffectID:(id)a3
{
  return 0;
}

+ (void)enableAnimationForEffects:(id)a3 animationStartTime:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  void *v14;
  _OWORD v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "enablePresentationState:", 0);
        if (objc_msgSend(v10, "type") == 2)
        {
          v20 = 0u;
          v21 = 0u;
          v19 = 0u;
          objc_msgSend(v10, "renderEffect");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "effectRange");
          }
          else
          {
            v20 = 0u;
            v21 = 0u;
            v19 = 0u;
          }

          *(_QWORD *)&v20 = a4->var3;
          v13 = *(_OWORD *)&a4->var0;
          v18 = v21;
          v19 = v13;
          v16 = v13;
          v17 = v20;
          objc_msgSend(v10, "renderEffect");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = v16;
          v15[1] = v17;
          v15[2] = v18;
          objc_msgSend(v14, "setEffectRange:", v15);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

}

+ (void)disableAnimationForEffects:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "enablePresentationState:", 1);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (BOOL)isFaceTrackingDataAvailable
{
  void *v2;
  char v3;

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasValidFaceData");

  return v3;
}

+ (CGRect)currentFaceRectRelativeToBounds:(CGRect)a3 atTime:(id *)a4 transformAnimation:(id)a5 playableMediaContentMode:(int)a6 playableInterfaceOrientation:(int64_t)a7 playableAspectRatio:(int64_t)a8 playableAspectRatioPreservationMode:(int64_t)a9
{
  uint64_t v12;
  double height;
  double width;
  double y;
  double x;
  id v19;
  void *v20;
  void *v21;
  void *v22;
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
  $3CC8671D27C23BF42ADDB32F2B5E48AE v35;
  CGRect result;

  v12 = *(_QWORD *)&a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = a5;
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mostRecentARMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "faceAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = *a4;
  objc_msgSend(a1, "JFX_currentFaceRectRelativeToBounds:atTime:faceAnchor:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", &v35, v22, v19, v12, a7, a8, x, y, width, height, a9);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = v24;
  v32 = v26;
  v33 = v28;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

+ (CGRect)JFX_currentFaceRectRelativeToBounds:(CGRect)a3 atTime:(id *)a4 faceAnchor:(id)a5 transformAnimation:(id)a6 playableMediaContentMode:(int)a7 playableInterfaceOrientation:(int64_t)a8 playableAspectRatio:(int64_t)a9 playableAspectRatioPreservationMode:(int64_t)a10
{
  uint64_t v12;
  double height;
  double width;
  id v17;
  id v18;
  double v19;
  int v20;
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
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double x;
  double y;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  PVTransformAnimationInfo v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  PVTransformAnimationInfo v56;
  double v57;
  double v58;
  CGPoint v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect result;

  v12 = *(_QWORD *)&a7;
  height = a3.size.height;
  width = a3.size.width;
  v17 = a6;
  v18 = a5;
  v19 = multiplierForAspectRatio(a9);
  v20 = PVViewContentModeFromAspectRatioPreservationMode(a10);
  v21 = 1.0;
  v22 = width;
  v23 = height;
  switch(v20)
  {
    case 0:
      goto LABEL_13;
    case 1:
      if (width <= height)
      {
        v21 = height;
        if (height * v19 < width)
          v21 = width / v19;
      }
      else
      {
        v21 = width / v19;
        if (width / v19 < height)
          v21 = height;
      }
      goto LABEL_7;
    case 2:
      v21 = width / v19;
      if (width / v19 > height)
        v21 = height;
LABEL_7:
      v19 = v19 * v21;
      break;
    case 3:
      v21 = height;
      goto LABEL_11;
    case 13:
      v21 = width / v19;
LABEL_11:
      v19 = width;
      break;
    case 14:
      v19 = height * v19;
      v21 = height;
      break;
    default:
      break;
  }
  v22 = v19;
  v23 = v21;
LABEL_13:
  v57 = 0.0;
  v58 = 0.0;
  +[JFXFaceTrackingUtilities faceRectInImageWithFaceAnchor:invertY:interfaceOrientation:imageResolution:](JFXFaceTrackingUtilities, "faceRectInImageWithFaceAnchor:invertY:interfaceOrientation:imageResolution:", v18, 1, a8, &v57, v21);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  if ((v57 <= -0.0000001 || v57 >= 0.0000001) && (v58 <= -0.0000001 || v58 >= 0.0000001))
  {
    v36 = (width - v22) * 0.5;
    v37 = (height - v23) * 0.5;
    v38 = 1.0;
    v39 = v57 / v58;
    v40 = v22;
    v41 = v23;
    switch((int)v12)
    {
      case 0:
        goto LABEL_35;
      case 1:
        if (v22 <= v23)
        {
          v38 = v23;
          if (v23 * v39 < v22)
            v38 = v22 / v39;
        }
        else
        {
          v38 = v22 / v39;
          if (v22 / v39 < v23)
            v38 = v23;
        }
        goto LABEL_33;
      case 2:
        v38 = v22 / v39;
        if (v22 / v39 > v23)
          v38 = v23;
LABEL_33:
        v39 = v39 * v38;
        break;
      case 3:
        v38 = v23;
        goto LABEL_30;
      case 13:
        v38 = v22 / v39;
LABEL_30:
        v39 = v22;
        break;
      case 14:
        v39 = v23 * v39;
        v38 = v23;
        break;
      default:
        break;
    }
    v40 = v39;
    v41 = v38;
LABEL_35:
    v50 = v25;
    v51 = v31;
    v48 = v37 + 0.0;
    v49 = v36 + 0.0;
    x = (v22 - v40) * 0.5 + 0.0;
    y = (v23 - v41) * 0.5 + 0.0;
    memset(&v56, 0, sizeof(v56));
    PVTransformAnimationInfoIdentity();
    *(_OWORD *)&v52.time.value = *(_OWORD *)&a4->var0;
    v52.time.epoch = a4->var3;
    if (objc_msgSend(MEMORY[0x24BE790C8], "getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:", v17, &v52, v12, 0, &v56, v22, v23))
    {
      v54 = 0u;
      v55 = 0u;
      v53 = 0u;
      v59.x = v22 * 0.5;
      v59.y = v23 * 0.5;
      v52 = v56;
      CGAffineTransformFromPointWithPVAnimInfo(&v52, v59);
      *(_OWORD *)&v52.time.value = v53;
      *(_OWORD *)&v52.time.epoch = v54;
      *(_OWORD *)&v52.translation.y = v55;
      v60.origin.x = (v22 - v40) * 0.5 + 0.0;
      v60.origin.y = (v23 - v41) * 0.5 + 0.0;
      v60.size.width = v40;
      v60.size.height = v41;
      v61 = CGRectApplyAffineTransform(v60, (CGAffineTransform *)&v52);
      x = v61.origin.x;
      y = v61.origin.y;
      v40 = v61.size.width;
      v41 = v61.size.height;
    }
    v62.origin.x = v40 * (v50 / v57);
    v62.origin.y = v41 * (v27 / v58);
    v62.size.width = v40 * (v29 / v57);
    v62.size.height = v41 * (v51 / v58);
    v63 = CGRectOffset(v62, x, y);
    v64 = CGRectOffset(v63, v49, v48);
    v32 = v64.origin.x;
    v33 = v64.origin.y;
    v34 = v64.size.width;
    v35 = v64.size.height;
  }
  else
  {
    v32 = *MEMORY[0x24BDBF090];
    v33 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v34 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v35 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v44 = v32;
  v45 = v33;
  v46 = v34;
  v47 = v35;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

+ (CGRect)JFX_compositionBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  +[JFXMediaSettings compositionSize](JFXMediaSettings, "compositionSize");
  v2 = CGRectMakeWithSize();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

@end
