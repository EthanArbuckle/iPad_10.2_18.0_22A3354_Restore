@implementation AXMVisionFeature

+ (AXMVisionFeature)featureWithMetadata:(id)a3 interfaceOrientation:(int64_t)a4 isMirrored:(BOOL)a5 canvasSize:(CGSize)a6
{
  double height;
  double width;
  _BOOL4 v8;
  id v10;
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
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  AXMVisionFeatureFaceAttributes *v28;
  AXMVisionFeatureFaceDetectionResult *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  AXMVisionFeatureFaceDetectionResult *v41;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;

  height = a6.height;
  width = a6.width;
  v8 = a5;
  v10 = a3;
  objc_msgSend(v10, "bounds");
  v15 = AXMTransformedNormalizedFrame(a4, v8, v11, v12, v13, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v10;
    +[AXMVisionFeature _aspectFaceRectFromSquareFaceRect:sizeInPixels:](AXMVisionFeature, "_aspectFaceRectFromSquareFaceRect:sizeInPixels:", v15, v17, v19, v21, width, height);
    v45 = v24;
    v46 = v23;
    v43 = v26;
    v44 = v25;
    v27 = objc_msgSend(v22, "faceID");
    v28 = -[AXMVisionFeatureFaceAttributes initWithAVMetadataFaceObject:]([AXMVisionFeatureFaceAttributes alloc], "initWithAVMetadataFaceObject:", v22);
    if (v28)
    {
      v29 = objc_alloc_init(AXMVisionFeatureFaceDetectionResult);
      -[AXMVisionFeatureFaceDetectionResult setAttributes:](v29, "setAttributes:", v28);
    }
    else
    {
      v29 = 0;
    }

    v33 = 0;
    v32 = 0;
    v34 = 6;
    v47 = *(_QWORD *)&v19;
    v48 = *(_QWORD *)&v21;
    v30 = v17;
    v31 = v15;
    v21 = v43;
    v19 = v44;
    v17 = v45;
    v15 = v46;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = *((double *)&AXMRectNotApplicable + 1);
    v31 = *(double *)&AXMRectNotApplicable;
    v47 = qword_1EEEDC000;
    v48 = qword_1EEEDC008;
    objc_msgSend(v10, "stringValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "type");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v27 = 0;
    v34 = 11;
LABEL_11:
    v35 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
    v35[1] = v34;
    v36 = (void *)v35[15];
    v35[15] = v32;
    v37 = v32;

    *((double *)v35 + 42) = width;
    *((double *)v35 + 43) = height;
    *((double *)v35 + 7) = width * v15;
    *((double *)v35 + 8) = height * v17;
    *((double *)v35 + 9) = width * v19;
    *((double *)v35 + 10) = height * v21;
    *((double *)v35 + 11) = v15;
    *((double *)v35 + 12) = v17;
    *((double *)v35 + 13) = v19;
    *((double *)v35 + 14) = v21;
    *((double *)v35 + 68) = v31;
    *((double *)v35 + 69) = v30;
    v35[70] = v47;
    v35[71] = v48;
    v38 = (void *)v35[3];
    v35[3] = v33;
    v39 = v33;

    v40 = (void *)v35[32];
    v35[32] = v29;
    v35[33] = v27;
    v41 = v29;

LABEL_12:
    goto LABEL_13;
  }
  NSClassFromString(CFSTR("AVMetadataVideoPreviewHistogramObject"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      AXMediaLogCommon();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        +[AXMVisionFeature featureWithMetadata:interfaceOrientation:isMirrored:canvasSize:].cold.1();
      v35 = 0;
      goto LABEL_12;
    }
  }
  v35 = 0;
LABEL_13:

  return (AXMVisionFeature *)v35;
}

+ (AXMVisionFeature)featureWithFaceDetectionResult:(id)a3 canvasSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  uint64_t v7;
  uint64_t v8;
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
  _QWORD *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  objc_msgSend(v6, "frame");
  v26 = v8;
  v27 = v7;
  v10 = v9;
  v12 = 1.0 - v11 - v9;
  +[AXMVisionFeature _aspectFaceRectFromSquareFaceRect:sizeInPixels:](AXMVisionFeature, "_aspectFaceRectFromSquareFaceRect:sizeInPixels:");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v21[1] = 5;
  *((double *)v21 + 42) = width;
  *((double *)v21 + 43) = height;
  *((double *)v21 + 7) = width * v14;
  *((double *)v21 + 8) = height * v16;
  *((double *)v21 + 9) = width * v18;
  *((double *)v21 + 10) = height * v20;
  *((double *)v21 + 11) = v14;
  *((double *)v21 + 12) = v16;
  *((double *)v21 + 13) = v18;
  *((double *)v21 + 14) = v20;
  v21[68] = v27;
  *((double *)v21 + 69) = v12;
  v21[70] = v26;
  *((double *)v21 + 71) = v10;
  v22 = (void *)v21[32];
  v21[32] = v6;
  v23 = v6;

  v24 = objc_msgSend(v23, "faceId");
  v21[33] = v24;
  return (AXMVisionFeature *)v21;
}

+ (id)prominentObjectWithBoundingBox:(CGRect)a3 canvasSize:(CGSize)a4 confidence:(double)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double y;
  double x;
  _QWORD *v12;

  height = a4.height;
  width = a4.width;
  v8 = a3.size.height;
  v9 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v12[1] = 19;
  *((double *)v12 + 42) = width;
  *((double *)v12 + 43) = height;
  *((double *)v12 + 11) = x;
  *((double *)v12 + 12) = y;
  *((double *)v12 + 13) = v9;
  *((double *)v12 + 14) = v8;
  *((double *)v12 + 7) = x * width;
  *((double *)v12 + 8) = y * height;
  *((double *)v12 + 9) = v9 * width;
  *((double *)v12 + 10) = v8 * height;
  *((double *)v12 + 23) = a5;
  return v12;
}

+ (id)personWithBoundingBox:(CGRect)a3 confidence:(double)a4 canvasSize:(CGSize)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double y;
  double x;
  _QWORD *v12;

  height = a5.height;
  width = a5.width;
  v8 = a3.size.height;
  v9 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v12[1] = 7;
  *((double *)v12 + 23) = a4;
  *((double *)v12 + 42) = width;
  *((double *)v12 + 43) = height;
  *((double *)v12 + 7) = x * width;
  *((double *)v12 + 8) = y * height;
  *((double *)v12 + 9) = v9 * width;
  *((double *)v12 + 10) = v8 * height;
  *((double *)v12 + 11) = x;
  *((double *)v12 + 12) = y;
  *((double *)v12 + 13) = v9;
  *((double *)v12 + 14) = v8;
  return v12;
}

+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 blurValue:(float)a4 canvasSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  float v7;
  char *v8;
  __int128 v9;
  __int128 v10;

  height = a5.height;
  width = a5.width;
  v7 = fminf(fmaxf(a4, 0.0), 1.0);
  v8 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v8 + 1) = 2;
  *((_QWORD *)v8 + 23) = 0x3FF0000000000000;
  *((CGFloat *)v8 + 42) = width;
  *((CGFloat *)v8 + 43) = height;
  v9 = AXMRectNotApplicable;
  v10 = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v8 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v8 + 72) = v10;
  *(_OWORD *)(v8 + 88) = v9;
  *(_OWORD *)(v8 + 104) = v10;
  *((double *)v8 + 21) = v7;
  return (AXMVisionFeature *)v8;
}

+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 brightnessValue:(float)a4 canvasSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  char *v8;
  __int128 v9;
  __int128 v10;

  height = a5.height;
  width = a5.width;
  v8 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v8 + 1) = 1;
  *((_QWORD *)v8 + 23) = 0x3FF0000000000000;
  *((CGFloat *)v8 + 42) = width;
  *((CGFloat *)v8 + 43) = height;
  v9 = AXMRectNotApplicable;
  v10 = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v8 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v8 + 72) = v10;
  *(_OWORD *)(v8 + 88) = v9;
  *(_OWORD *)(v8 + 104) = v10;
  *((double *)v8 + 22) = a4;
  return (AXMVisionFeature *)v8;
}

+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 horizonResult:(id)a4 canvasSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v7;
  char *v8;
  float v9;
  __int128 v10;
  __int128 v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  height = a5.height;
  width = a5.width;
  v7 = a4;
  v8 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v8 + 1) = 3;
  objc_msgSend(v7, "confidence");
  *((double *)v8 + 23) = v9;
  *((CGFloat *)v8 + 42) = width;
  *((CGFloat *)v8 + 43) = height;
  v10 = AXMRectNotApplicable;
  v11 = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v8 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v8 + 72) = v11;
  *(_OWORD *)(v8 + 88) = v10;
  *(_OWORD *)(v8 + 104) = v11;
  if (v7)
  {
    objc_msgSend(v7, "transform");
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
  }
  *(_OWORD *)(v8 + 200) = v14;
  *(_OWORD *)(v8 + 216) = v15;
  *(_OWORD *)(v8 + 232) = v16;
  objc_msgSend(v7, "angle", v14, v15, v16);
  *(float *)&v12 = v12;
  *((_DWORD *)v8 + 62) = LODWORD(v12);

  return (AXMVisionFeature *)v8;
}

+ (id)objectClassificationWithLabel:(id)a3 localizedValue:(id)a4 boundingBox:(CGRect)a5 confidence:(float)a6 canvasSize:(CGSize)a7 sceneClassId:(id)a8
{
  double height;
  double width;
  double v12;
  double v13;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;

  height = a7.height;
  width = a7.width;
  v12 = a5.size.height;
  v13 = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v17 = a3;
  v18 = a4;
  v19 = a8;
  v20 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v20[1] = 10;
  v21 = (void *)v20[45];
  v20[45] = v17;
  v22 = v17;

  v23 = (void *)v20[46];
  v20[46] = v18;
  v24 = v18;

  *((double *)v20 + 23) = a6;
  *((double *)v20 + 42) = width;
  *((double *)v20 + 43) = height;
  *((double *)v20 + 11) = x;
  *((double *)v20 + 12) = y;
  *((double *)v20 + 13) = v13;
  *((double *)v20 + 14) = v12;
  *((double *)v20 + 7) = x * width;
  *((double *)v20 + 8) = y * height;
  *((double *)v20 + 9) = v13 * width;
  *((double *)v20 + 10) = v12 * height;
  v25 = (void *)v20[51];
  v20[51] = v19;

  return v20;
}

+ (id)sceneClassificationWithLabel:(id)a3 localizedValue:(id)a4 confidence:(float)a5 canvasSize:(CGSize)a6
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  char *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;

  height = a6.height;
  width = a6.width;
  v10 = a3;
  v11 = a4;
  v12 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v12 + 1) = 9;
  v13 = (void *)*((_QWORD *)v12 + 45);
  *((_QWORD *)v12 + 45) = v10;
  v14 = v10;

  v15 = (void *)*((_QWORD *)v12 + 46);
  *((_QWORD *)v12 + 46) = v11;

  *((double *)v12 + 23) = a5;
  *((CGFloat *)v12 + 42) = width;
  *((CGFloat *)v12 + 43) = height;
  v16 = AXMRectNotApplicable;
  v17 = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v12 + 88) = AXMRectNotApplicable;
  *(_OWORD *)(v12 + 104) = v17;
  *(_OWORD *)(v12 + 56) = v16;
  *(_OWORD *)(v12 + 72) = v17;
  return v12;
}

+ (id)nsfwClassificationWithCategory:(id)a3 confidence:(float)a4 canvasSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v8;
  char *v9;
  void *v10;
  __int128 v11;
  __int128 v12;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  v9 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v9 + 1) = 23;
  v10 = (void *)*((_QWORD *)v9 + 45);
  *((_QWORD *)v9 + 45) = v8;

  *((double *)v9 + 23) = a4;
  *((CGFloat *)v9 + 42) = width;
  *((CGFloat *)v9 + 43) = height;
  v11 = AXMRectNotApplicable;
  v12 = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v9 + 88) = AXMRectNotApplicable;
  *(_OWORD *)(v9 + 104) = v12;
  *(_OWORD *)(v9 + 56) = v11;
  *(_OWORD *)(v9 + 72) = v12;
  return v9;
}

+ (id)significantEventClassificationWithCategory:(id)a3 confidence:(float)a4 canvasSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v8;
  char *v9;
  void *v10;
  __int128 v11;
  __int128 v12;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  v9 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v9 + 1) = 24;
  v10 = (void *)*((_QWORD *)v9 + 45);
  *((_QWORD *)v9 + 45) = v8;

  *((double *)v9 + 23) = a4;
  *((CGFloat *)v9 + 42) = width;
  *((CGFloat *)v9 + 43) = height;
  v11 = AXMRectNotApplicable;
  v12 = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v9 + 88) = AXMRectNotApplicable;
  *(_OWORD *)(v9 + 104) = v12;
  *(_OWORD *)(v9 + 56) = v11;
  *(_OWORD *)(v9 + 72) = v12;
  return v9;
}

+ (AXMVisionFeature)featureWithTaxonomyNode:(id)a3 canvasSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v7 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v7 + 1) = 9;
  objc_msgSend(v6, "label");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)*((_QWORD *)v7 + 45);
  *((_QWORD *)v7 + 45) = v8;

  objc_msgSend(v6, "localizedName");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)*((_QWORD *)v7 + 46);
  *((_QWORD *)v7 + 46) = v10;

  objc_msgSend(v6, "confidence");
  *((_QWORD *)v7 + 23) = v12;
  *((CGFloat *)v7 + 42) = width;
  *((CGFloat *)v7 + 43) = height;
  v13 = AXMRectNotApplicable;
  v14 = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v7 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v7 + 72) = v14;
  *(_OWORD *)(v7 + 88) = v13;
  *(_OWORD *)(v7 + 104) = v14;
  objc_msgSend(v6, "detectorSceneClassIds");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)*((_QWORD *)v7 + 50);
  *((_QWORD *)v7 + 50) = v15;

  v17 = (void *)MEMORY[0x1E0CB37E8];
  v18 = objc_msgSend(v6, "sceneClassId");

  objc_msgSend(v17, "numberWithUnsignedInt:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringValue");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)*((_QWORD *)v7 + 51);
  *((_QWORD *)v7 + 51) = v20;

  return (AXMVisionFeature *)v7;
}

+ (AXMVisionFeature)featureWithImageAestheticsObservation:(id)a3
{
  id v3;
  char *v4;
  AXMVisionFeatureAestheticsResult *v5;
  void *v6;
  __int128 v7;
  __int128 v8;

  if (a3)
  {
    v3 = a3;
    v4 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
    *((_QWORD *)v4 + 1) = 21;
    v5 = -[AXMVisionFeatureAestheticsResult initWithVisionAestheticsObservation:]([AXMVisionFeatureAestheticsResult alloc], "initWithVisionAestheticsObservation:", v3);

    v6 = (void *)*((_QWORD *)v4 + 59);
    *((_QWORD *)v4 + 59) = v5;

    *((_QWORD *)v4 + 23) = AXMConfidenceNotApplicable;
    v7 = AXMRectNotApplicable;
    v8 = *(_OWORD *)&qword_1EEEDC000;
    *(_OWORD *)(v4 + 56) = AXMRectNotApplicable;
    *(_OWORD *)(v4 + 72) = v8;
    *(_OWORD *)(v4 + 88) = v7;
    *(_OWORD *)(v4 + 104) = v8;
  }
  else
  {
    v4 = 0;
  }
  return (AXMVisionFeature *)v4;
}

+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 modelClassificationResult:(id)a4 modelIdentifier:(id)a5 canvasSize:(CGSize)a6
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  char *v11;
  uint64_t v12;
  void *v13;
  float v14;
  float v15;
  __int128 v16;
  __int128 v17;
  void *v18;

  height = a6.height;
  width = a6.width;
  v9 = a5;
  v10 = a4;
  v11 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v11 + 1) = 15;
  objc_msgSend(v10, "identifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)*((_QWORD *)v11 + 45);
  *((_QWORD *)v11 + 45) = v12;

  objc_msgSend(v10, "confidence");
  v15 = v14;

  *((double *)v11 + 23) = v15;
  *((CGFloat *)v11 + 42) = width;
  *((CGFloat *)v11 + 43) = height;
  v16 = AXMRectNotApplicable;
  v17 = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v11 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v11 + 72) = v17;
  *(_OWORD *)(v11 + 88) = v16;
  *(_OWORD *)(v11 + 104) = v17;
  v18 = (void *)*((_QWORD *)v11 + 44);
  *((_QWORD *)v11 + 44) = v9;

  return (AXMVisionFeature *)v11;
}

+ (AXMVisionFeature)featureWithCaptionResult:(id)a3 confidence:(double)a4 translatedCaption:(id)a5 modelIdentifier:(id)a6 canvasSize:(CGSize)a7 isLowConfidence:(BOOL)a8
{
  CGFloat height;
  CGFloat width;
  id v14;
  id v15;
  id v16;
  char *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  void *v24;

  height = a7.height;
  width = a7.width;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v17 + 1) = 16;
  v18 = (void *)*((_QWORD *)v17 + 47);
  *((_QWORD *)v17 + 47) = v14;
  v19 = v14;

  v20 = (void *)*((_QWORD *)v17 + 48);
  *((_QWORD *)v17 + 48) = v15;
  v21 = v15;

  *((double *)v17 + 23) = a4;
  *((CGFloat *)v17 + 42) = width;
  *((CGFloat *)v17 + 43) = height;
  v22 = AXMRectNotApplicable;
  v23 = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v17 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v17 + 72) = v23;
  *(_OWORD *)(v17 + 88) = v22;
  *(_OWORD *)(v17 + 104) = v23;
  v24 = (void *)*((_QWORD *)v17 + 44);
  *((_QWORD *)v17 + 44) = v16;

  v17[192] = a8;
  return (AXMVisionFeature *)v17;
}

+ (AXMVisionFeature)featureWithMediaAnalysisImageCaptionResult:(id)a3 confidence:(double)a4 translatedCaption:(id)a5
{
  id v7;
  id v8;
  char *v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;

  v7 = a3;
  v8 = a5;
  v9 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v9 + 1) = 25;
  v10 = (void *)*((_QWORD *)v9 + 52);
  *((_QWORD *)v9 + 52) = v7;
  v11 = v7;

  *((double *)v9 + 53) = a4;
  v12 = (void *)*((_QWORD *)v9 + 54);
  *((_QWORD *)v9 + 54) = v8;

  v13 = AXMRectNotApplicable;
  v14 = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v9 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v9 + 72) = v14;
  *(_OWORD *)(v9 + 88) = v13;
  *(_OWORD *)(v9 + 104) = v14;
  *((_OWORD *)v9 + 21) = *MEMORY[0x1E0C9D820];
  return (AXMVisionFeature *)v9;
}

+ (AXMVisionFeature)featureWithMediaAnalysisTaxonomyNode:(id)a3 canvasSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v7 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v7 + 1) = 26;
  objc_msgSend(v6, "label");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)*((_QWORD *)v7 + 45);
  *((_QWORD *)v7 + 45) = v8;

  objc_msgSend(v6, "localizedName");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)*((_QWORD *)v7 + 46);
  *((_QWORD *)v7 + 46) = v10;

  objc_msgSend(v6, "confidence");
  *((_QWORD *)v7 + 23) = v12;
  *((CGFloat *)v7 + 42) = width;
  *((CGFloat *)v7 + 43) = height;
  v13 = AXMRectNotApplicable;
  v14 = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v7 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v7 + 72) = v14;
  *(_OWORD *)(v7 + 88) = v13;
  *(_OWORD *)(v7 + 104) = v14;
  objc_msgSend(v6, "detectorSceneClassIds");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)*((_QWORD *)v7 + 50);
  *((_QWORD *)v7 + 50) = v15;

  v17 = (void *)MEMORY[0x1E0CB37E8];
  v18 = objc_msgSend(v6, "sceneClassId");

  objc_msgSend(v17, "numberWithUnsignedInt:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringValue");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)*((_QWORD *)v7 + 51);
  *((_QWORD *)v7 + 51) = v20;

  return (AXMVisionFeature *)v7;
}

+ (id)mediaAnalysisSceneClassificationWithLabel:(id)a3 localizedValue:(id)a4 confidence:(float)a5 canvasSize:(CGSize)a6
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  char *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;

  height = a6.height;
  width = a6.width;
  v10 = a3;
  v11 = a4;
  v12 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v12 + 1) = 26;
  v13 = (void *)*((_QWORD *)v12 + 45);
  *((_QWORD *)v12 + 45) = v10;
  v14 = v10;

  v15 = (void *)*((_QWORD *)v12 + 46);
  *((_QWORD *)v12 + 46) = v11;

  *((double *)v12 + 23) = a5;
  *((CGFloat *)v12 + 42) = width;
  *((CGFloat *)v12 + 43) = height;
  v16 = AXMRectNotApplicable;
  v17 = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v12 + 88) = AXMRectNotApplicable;
  *(_OWORD *)(v12 + 104) = v17;
  *(_OWORD *)(v12 + 56) = v16;
  *(_OWORD *)(v12 + 72) = v17;
  return v12;
}

+ (id)mediaAnalysisNSFWClassificationWithCategory:(id)a3 confidence:(float)a4 canvasSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v8;
  char *v9;
  void *v10;
  __int128 v11;
  __int128 v12;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  v9 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v9 + 1) = 29;
  v10 = (void *)*((_QWORD *)v9 + 45);
  *((_QWORD *)v9 + 45) = v8;

  *((double *)v9 + 23) = a4;
  *((CGFloat *)v9 + 42) = width;
  *((CGFloat *)v9 + 43) = height;
  v11 = AXMRectNotApplicable;
  v12 = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v9 + 88) = AXMRectNotApplicable;
  *(_OWORD *)(v9 + 104) = v12;
  *(_OWORD *)(v9 + 56) = v11;
  *(_OWORD *)(v9 + 72) = v12;
  return v9;
}

+ (id)mediaAnalysisSignificantEventClassificationWithCategory:(id)a3 confidence:(float)a4 canvasSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v8;
  char *v9;
  void *v10;
  __int128 v11;
  __int128 v12;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  v9 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v9 + 1) = 30;
  v10 = (void *)*((_QWORD *)v9 + 45);
  *((_QWORD *)v9 + 45) = v8;

  *((double *)v9 + 23) = a4;
  *((CGFloat *)v9 + 42) = width;
  *((CGFloat *)v9 + 43) = height;
  v11 = AXMRectNotApplicable;
  v12 = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v9 + 88) = AXMRectNotApplicable;
  *(_OWORD *)(v9 + 104) = v12;
  *(_OWORD *)(v9 + 56) = v11;
  *(_OWORD *)(v9 + 72) = v12;
  return v9;
}

+ (id)mediaAnalysisObjectClassificationWithLabel:(id)a3 localizedValue:(id)a4 boundingBox:(CGRect)a5 confidence:(float)a6 canvasSize:(CGSize)a7 sceneClassId:(id)a8
{
  double height;
  double width;
  double v12;
  double v13;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;

  height = a7.height;
  width = a7.width;
  v12 = a5.size.height;
  v13 = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v17 = a3;
  v18 = a4;
  v19 = a8;
  v20 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v20[1] = 27;
  v21 = (void *)v20[45];
  v20[45] = v17;
  v22 = v17;

  v23 = (void *)v20[46];
  v20[46] = v18;
  v24 = v18;

  *((double *)v20 + 23) = a6;
  *((double *)v20 + 42) = width;
  *((double *)v20 + 43) = height;
  *((double *)v20 + 11) = x;
  *((double *)v20 + 12) = y;
  *((double *)v20 + 13) = v13;
  *((double *)v20 + 14) = v12;
  *((double *)v20 + 7) = x * width;
  *((double *)v20 + 8) = y * height;
  *((double *)v20 + 9) = v13 * width;
  *((double *)v20 + 10) = v12 * height;
  v25 = (void *)v20[51];
  v20[51] = v19;

  return v20;
}

+ (id)mediaAnalysisProminentObjectWithBoundingBox:(CGRect)a3 canvasSize:(CGSize)a4 confidence:(double)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double y;
  double x;
  _QWORD *v12;

  height = a4.height;
  width = a4.width;
  v8 = a3.size.height;
  v9 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v12[1] = 28;
  *((double *)v12 + 42) = width;
  *((double *)v12 + 43) = height;
  *((double *)v12 + 11) = x;
  *((double *)v12 + 12) = y;
  *((double *)v12 + 13) = v9;
  *((double *)v12 + 14) = v8;
  *((double *)v12 + 7) = x * width;
  *((double *)v12 + 8) = y * height;
  *((double *)v12 + 9) = v9 * width;
  *((double *)v12 + 10) = v8 * height;
  *((double *)v12 + 23) = a5;
  return v12;
}

+ (AXMVisionFeature)featureWithMediaAnalysisFaceDetectionResult:(id)a3 canvasSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  uint64_t v7;
  uint64_t v8;
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
  _QWORD *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  objc_msgSend(v6, "frame");
  v26 = v8;
  v27 = v7;
  v10 = v9;
  v12 = 1.0 - v11 - v9;
  +[AXMVisionFeature _aspectFaceRectFromSquareFaceRect:sizeInPixels:](AXMVisionFeature, "_aspectFaceRectFromSquareFaceRect:sizeInPixels:");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v21[1] = 31;
  *((double *)v21 + 42) = width;
  *((double *)v21 + 43) = height;
  *((double *)v21 + 7) = width * v14;
  *((double *)v21 + 8) = height * v16;
  *((double *)v21 + 9) = width * v18;
  *((double *)v21 + 10) = height * v20;
  *((double *)v21 + 11) = v14;
  *((double *)v21 + 12) = v16;
  *((double *)v21 + 13) = v18;
  *((double *)v21 + 14) = v20;
  v21[68] = v27;
  *((double *)v21 + 69) = v12;
  v21[70] = v26;
  *((double *)v21 + 71) = v10;
  v22 = (void *)v21[55];
  v21[55] = v6;
  v23 = v6;

  v24 = objc_msgSend(v23, "faceId");
  v21[56] = v24;
  return (AXMVisionFeature *)v21;
}

+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 rectangleResult:(id)a4 canvasSize:(CGSize)a5
{
  double height;
  double width;
  id v7;
  _QWORD *v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;

  height = a5.height;
  width = a5.width;
  v7 = a4;
  v8 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v8[1] = 14;
  objc_msgSend(v7, "confidence");
  *((double *)v8 + 23) = v9;
  *((double *)v8 + 42) = width;
  *((double *)v8 + 43) = height;
  objc_msgSend(v7, "boundingBox");
  *((double *)v8 + 7) = width * v12;
  *((double *)v8 + 8) = height * (1.0 - v10 - v11);
  *((double *)v8 + 9) = width * v13;
  *((double *)v8 + 10) = height * v11;
  objc_msgSend(v7, "boundingBox");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v8[11] = v15;
  *((double *)v8 + 12) = 1.0 - v17 - v21;
  v8[13] = v19;
  *((double *)v8 + 14) = v21;
  return (AXMVisionFeature *)v8;
}

+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 axElementRect:(CGRect)a4 confidence:(double)a5 uiClass:(int64_t)a6 label:(id)a7 canvasSize:(CGSize)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat v12;
  CGFloat v13;
  CGFloat y;
  CGFloat x;
  id v16;
  _QWORD *v17;
  void *v18;

  height = a8.height;
  width = a8.width;
  v12 = a4.size.height;
  v13 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16 = a7;
  v17 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v17[1] = 22;
  *((double *)v17 + 23) = a5;
  *((CGFloat *)v17 + 42) = width;
  *((CGFloat *)v17 + 43) = height;
  *((CGFloat *)v17 + 7) = x;
  *((CGFloat *)v17 + 8) = y;
  *((CGFloat *)v17 + 9) = v13;
  *((CGFloat *)v17 + 10) = v12;
  v18 = (void *)v17[15];
  v17[15] = v16;

  v17[58] = a6;
  return (AXMVisionFeature *)v17;
}

+ (id)groupedFeatureWithElementRect:(CGRect)a3 uiClass:(int64_t)a4 confidence:(double)a5 label:(id)a6 canvasSize:(CGSize)a7 subElements:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat v13;
  CGFloat v14;
  CGFloat y;
  CGFloat x;
  id v17;
  id v18;
  _QWORD *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;

  height = a7.height;
  width = a7.width;
  v13 = a3.size.height;
  v14 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a6;
  v18 = a8;
  v19 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v19[1] = 22;
  *((CGFloat *)v19 + 42) = width;
  *((CGFloat *)v19 + 43) = height;
  *((CGFloat *)v19 + 7) = x;
  *((CGFloat *)v19 + 8) = y;
  *((CGFloat *)v19 + 9) = v14;
  *((CGFloat *)v19 + 10) = v13;
  v20 = (void *)v19[15];
  v19[15] = v17;
  v21 = v17;

  v19[58] = a4;
  *((double *)v19 + 23) = a5;
  v22 = objc_msgSend(v18, "copy");

  v23 = (void *)v19[2];
  v19[2] = v22;

  return v19;
}

+ (id)textDocumentWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 regions:(id)a6 canvasSize:(CGSize)a7
{
  double height;
  double width;
  double v10;
  double v11;
  double y;
  double x;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  id v19;
  void *v20;

  height = a7.height;
  width = a7.width;
  v10 = a5.size.height;
  v11 = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a3;
  v16 = a6;
  v17 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v17[4] = 1;
  v18 = (void *)v17[2];
  v17[1] = 8;
  v17[2] = v16;
  v19 = v16;

  v20 = (void *)v17[15];
  v17[15] = v15;

  *((_BYTE *)v17 + 136) = a4;
  *((double *)v17 + 42) = width;
  *((double *)v17 + 43) = height;
  *((double *)v17 + 7) = x * width;
  *((double *)v17 + 8) = y * height;
  *((double *)v17 + 9) = (x + v11) * width - x * width;
  *((double *)v17 + 10) = (y + v10) * height - y * height;
  *((double *)v17 + 11) = x;
  *((double *)v17 + 12) = y;
  *((double *)v17 + 13) = v11;
  *((double *)v17 + 14) = v10;
  return v17;
}

+ (id)textRegionWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 lines:(id)a6 canvasSize:(CGSize)a7
{
  double height;
  double width;
  double v10;
  double v11;
  double y;
  double x;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  id v19;
  void *v20;

  height = a7.height;
  width = a7.width;
  v10 = a5.size.height;
  v11 = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a3;
  v16 = a6;
  v17 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v17[1] = 8;
  v17[4] = 2;
  v18 = (void *)v17[15];
  v17[15] = v15;
  v19 = v15;

  *((_BYTE *)v17 + 136) = a4;
  v20 = (void *)v17[2];
  v17[2] = v16;

  *((double *)v17 + 42) = width;
  *((double *)v17 + 43) = height;
  *((double *)v17 + 7) = x * width;
  *((double *)v17 + 8) = y * height;
  *((double *)v17 + 9) = (x + v11) * width - x * width;
  *((double *)v17 + 10) = (y + v10) * height - y * height;
  *((double *)v17 + 11) = x;
  *((double *)v17 + 12) = y;
  *((double *)v17 + 13) = v11;
  *((double *)v17 + 14) = v10;
  return v17;
}

+ (id)textLineWithText:(id)a3 boundingBox:(CGRect)a4 recognizedTextFeatures:(id)a5 canvasSize:(CGSize)a6
{
  double height;
  double width;
  double v9;
  double v10;
  double y;
  double x;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  id v17;
  void *v18;

  height = a6.height;
  width = a6.width;
  v9 = a4.size.height;
  v10 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = a5;
  v15 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v15[1] = 8;
  v15[4] = 3;
  v16 = (void *)v15[15];
  v15[15] = v13;
  v17 = v13;

  v18 = (void *)v15[18];
  v15[18] = v14;

  *((double *)v15 + 42) = width;
  *((double *)v15 + 43) = height;
  *((double *)v15 + 7) = x * width;
  *((double *)v15 + 8) = y * height;
  *((double *)v15 + 9) = (x + v10) * width - x * width;
  *((double *)v15 + 10) = (y + v9) * height - y * height;
  *((double *)v15 + 11) = x;
  *((double *)v15 + 12) = y;
  *((double *)v15 + 13) = v10;
  *((double *)v15 + 14) = v9;
  return v15;
}

+ (id)textSequence:(id)a3 boundingBox:(CGRect)a4 recognizedTextFeatures:(id)a5 confidence:(double)a6 canvasSize:(CGSize)a7
{
  double height;
  double width;
  double v11;
  double v12;
  double y;
  double x;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;

  height = a7.height;
  width = a7.width;
  v11 = a4.size.height;
  v12 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3;
  v16 = a5;
  v17 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v17[1] = 8;
  v17[4] = 4;
  v18 = (void *)v17[15];
  v17[15] = v15;
  v19 = v15;

  v20 = (void *)v17[18];
  v17[18] = v16;

  *((double *)v17 + 42) = width;
  *((double *)v17 + 43) = height;
  v21 = 1.0 - y - v11;
  *((double *)v17 + 7) = x * width;
  *((double *)v17 + 8) = v21 * height;
  *((double *)v17 + 9) = v12 * width;
  *((double *)v17 + 10) = v11 * height;
  *((double *)v17 + 11) = x;
  *((double *)v17 + 12) = v21;
  *((double *)v17 + 13) = v12;
  *((double *)v17 + 14) = v11;
  *((double *)v17 + 23) = a6;
  return v17;
}

+ (id)nutritionLabelWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 rows:(id)a6 canvasSize:(CGSize)a7
{
  double height;
  double width;
  double v10;
  double v11;
  double y;
  double x;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  id v19;
  void *v20;

  height = a7.height;
  width = a7.width;
  v10 = a5.size.height;
  v11 = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a3;
  v16 = a6;
  v17 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v17[4] = 13;
  v18 = (void *)v17[2];
  v17[1] = 8;
  v17[2] = v16;
  v19 = v16;

  v20 = (void *)v17[15];
  v17[15] = v15;

  *((_BYTE *)v17 + 136) = a4;
  *((double *)v17 + 42) = width;
  *((double *)v17 + 43) = height;
  *((double *)v17 + 7) = x * width;
  *((double *)v17 + 8) = y * height;
  *((double *)v17 + 9) = (x + v11) * width - x * width;
  *((double *)v17 + 10) = (y + v10) * height - y * height;
  *((double *)v17 + 11) = x;
  *((double *)v17 + 12) = y;
  *((double *)v17 + 13) = v11;
  *((double *)v17 + 14) = v10;
  return v17;
}

+ (id)envelopeWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 regions:(id)a6 canvasSize:(CGSize)a7
{
  double height;
  double width;
  double v10;
  double v11;
  double y;
  double x;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  id v19;
  void *v20;

  height = a7.height;
  width = a7.width;
  v10 = a5.size.height;
  v11 = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a3;
  v16 = a6;
  v17 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v17[4] = 14;
  v18 = (void *)v17[2];
  v17[1] = 8;
  v17[2] = v16;
  v19 = v16;

  v20 = (void *)v17[16];
  v17[16] = v15;

  *((_BYTE *)v17 + 136) = a4;
  *((double *)v17 + 42) = width;
  *((double *)v17 + 43) = height;
  *((double *)v17 + 7) = x * width;
  *((double *)v17 + 8) = y * height;
  *((double *)v17 + 9) = (x + v11) * width - x * width;
  *((double *)v17 + 10) = (y + v10) * height - y * height;
  *((double *)v17 + 11) = x;
  *((double *)v17 + 12) = y;
  *((double *)v17 + 13) = v11;
  *((double *)v17 + 14) = v10;
  return v17;
}

+ (id)envelopeRegion:(id)a3 boundingBox:(CGRect)a4 confidence:(double)a5 canvasSize:(CGSize)a6
{
  double height;
  double width;
  double v9;
  double v10;
  double y;
  double x;
  id v13;
  _QWORD *v14;
  void *v15;

  height = a6.height;
  width = a6.width;
  v9 = a4.size.height;
  v10 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v14[1] = 8;
  v14[4] = 15;
  v15 = (void *)v14[15];
  v14[15] = v13;

  *((double *)v14 + 42) = width;
  *((double *)v14 + 43) = height;
  *((double *)v14 + 7) = x * width;
  *((double *)v14 + 8) = y * height;
  *((double *)v14 + 9) = (x + v10) * width - x * width;
  *((double *)v14 + 10) = (y + v9) * height - y * height;
  *((double *)v14 + 11) = x;
  *((double *)v14 + 12) = y;
  *((double *)v14 + 13) = v10;
  *((double *)v14 + 14) = v9;
  *((double *)v14 + 23) = a5;
  return v14;
}

+ (id)receiptWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 regions:(id)a6 canvasSize:(CGSize)a7
{
  double height;
  double width;
  double v10;
  double v11;
  double y;
  double x;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  id v19;
  void *v20;

  height = a7.height;
  width = a7.width;
  v10 = a5.size.height;
  v11 = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a3;
  v16 = a6;
  v17 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v17[4] = 16;
  v18 = (void *)v17[2];
  v17[1] = 8;
  v17[2] = v16;
  v19 = v16;

  v20 = (void *)v17[15];
  v17[15] = v15;

  *((_BYTE *)v17 + 136) = a4;
  *((double *)v17 + 42) = width;
  *((double *)v17 + 43) = height;
  *((double *)v17 + 7) = x * width;
  *((double *)v17 + 8) = y * height;
  *((double *)v17 + 9) = (x + v11) * width - x * width;
  *((double *)v17 + 10) = (y + v10) * height - y * height;
  *((double *)v17 + 11) = x;
  *((double *)v17 + 12) = y;
  *((double *)v17 + 13) = v11;
  *((double *)v17 + 14) = v10;
  return v17;
}

+ (id)tableWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 rows:(id)a6 columns:(id)a7 canvasSize:(CGSize)a8 isIncomplete:(BOOL)a9
{
  _BOOL4 v9;
  double height;
  double width;
  double v14;
  double v15;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;

  v9 = a9;
  height = a8.height;
  width = a8.width;
  v14 = a5.size.height;
  v15 = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v19 = a3;
  v20 = a7;
  v21 = a6;
  v22 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v23 = v22;
  v22[1] = 8;
  v24 = 7;
  if (v9)
    v24 = 8;
  v22[4] = v24;
  objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v20);
  v25 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)v23[2];
  v23[2] = v25;

  v27 = (void *)v23[15];
  v23[15] = v19;

  *((_BYTE *)v23 + 136) = a4;
  *((double *)v23 + 42) = width;
  *((double *)v23 + 43) = height;
  *((double *)v23 + 7) = x * width;
  *((double *)v23 + 8) = y * height;
  *((double *)v23 + 9) = (x + v15) * width - x * width;
  *((double *)v23 + 10) = (y + v14) * height - y * height;
  *((double *)v23 + 11) = x;
  *((double *)v23 + 12) = y;
  *((double *)v23 + 13) = v15;
  *((double *)v23 + 14) = v14;
  return v23;
}

+ (id)tableRowWithText:(id)a3 boundingBox:(CGRect)a4 cells:(id)a5 canvasSize:(CGSize)a6
{
  double height;
  double width;
  double v9;
  double v10;
  double y;
  double x;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  id v17;
  void *v18;

  height = a6.height;
  width = a6.width;
  v9 = a4.size.height;
  v10 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = a5;
  v15 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v15[4] = 9;
  v16 = (void *)v15[2];
  v15[1] = 8;
  v15[2] = v14;
  v17 = v14;

  v18 = (void *)v15[15];
  v15[15] = v13;

  *((double *)v15 + 42) = width;
  *((double *)v15 + 43) = height;
  *((double *)v15 + 7) = x * width;
  *((double *)v15 + 8) = y * height;
  *((double *)v15 + 9) = (x + v10) * width - x * width;
  *((double *)v15 + 10) = (y + v9) * height - y * height;
  *((double *)v15 + 11) = x;
  *((double *)v15 + 12) = y;
  *((double *)v15 + 13) = v10;
  *((double *)v15 + 14) = v9;
  return v15;
}

+ (id)tableColumnWithText:(id)a3 boundingBox:(CGRect)a4 cells:(id)a5 canvasSize:(CGSize)a6
{
  double height;
  double width;
  double v9;
  double v10;
  double y;
  double x;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  id v17;
  void *v18;

  height = a6.height;
  width = a6.width;
  v9 = a4.size.height;
  v10 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = a5;
  v15 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v15[4] = 10;
  v16 = (void *)v15[2];
  v15[1] = 8;
  v15[2] = v14;
  v17 = v14;

  v18 = (void *)v15[15];
  v15[15] = v13;

  *((double *)v15 + 42) = width;
  *((double *)v15 + 43) = height;
  *((double *)v15 + 7) = x * width;
  *((double *)v15 + 8) = y * height;
  *((double *)v15 + 9) = (x + v10) * width - x * width;
  *((double *)v15 + 10) = (y + v9) * height - y * height;
  *((double *)v15 + 11) = x;
  *((double *)v15 + 12) = y;
  *((double *)v15 + 13) = v10;
  *((double *)v15 + 14) = v9;
  return v15;
}

+ (id)tableCellWithText:(id)a3 boundingBox:(CGRect)a4 confidence:(double)a5 recognizedTextFeatures:(id)a6 canvasSize:(CGSize)a7 isHeader:(BOOL)a8
{
  _BOOL4 v8;
  double height;
  double width;
  double v13;
  double v14;
  double y;
  double x;
  id v17;
  id v18;
  _QWORD *v19;
  double *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  double v25;

  v8 = a8;
  height = a7.height;
  width = a7.width;
  v13 = a4.size.height;
  v14 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a3;
  v18 = a6;
  v19 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v20 = (double *)v19;
  v19[1] = 8;
  v21 = 11;
  if (v8)
    v21 = 12;
  v19[4] = v21;
  v22 = (void *)v19[15];
  v19[15] = v17;
  v23 = v17;

  v20[42] = width;
  v20[43] = height;
  v24 = (void *)*((_QWORD *)v20 + 18);
  *((_QWORD *)v20 + 18) = v18;

  v25 = 1.0 - y - v13;
  v20[7] = x * width;
  v20[8] = v25 * height;
  v20[9] = v14 * width;
  v20[10] = v13 * height;
  v20[11] = x;
  v20[12] = v25;
  v20[13] = v14;
  v20[14] = v13;
  v20[23] = a5;
  return v20;
}

+ (AXMVisionFeature)featureWithIconClass:(id)a3 confidence:(double)a4
{
  id v5;
  char *v6;
  void *v7;
  __int128 v8;
  __int128 v9;

  v5 = a3;
  v6 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v6 + 1) = 20;
  v7 = (void *)*((_QWORD *)v6 + 15);
  *((_QWORD *)v6 + 15) = v5;

  v9 = AXMRectNotApplicable;
  v8 = *(_OWORD *)&qword_1EEEDC000;
  *((_OWORD *)v6 + 21) = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v6 + 56) = v9;
  *(_OWORD *)(v6 + 72) = v8;
  *(_OWORD *)(v6 + 88) = v9;
  *(_OWORD *)(v6 + 104) = v8;
  *((double *)v6 + 23) = a4;
  return (AXMVisionFeature *)v6;
}

+ (AXMVisionFeature)featureWithMediaLegibility:(id)a3
{
  id v3;
  char *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;

  v3 = a3;
  v4 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v4 + 1) = 12;
  objc_msgSend(v3, "string");
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)*((_QWORD *)v4 + 15);
  *((_QWORD *)v4 + 15) = v5;

  *((_QWORD *)v4 + 23) = AXMConfidenceNotApplicable;
  v8 = AXMRectNotApplicable;
  v7 = *(_OWORD *)&qword_1EEEDC000;
  *((_OWORD *)v4 + 21) = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v4 + 56) = v8;
  *(_OWORD *)(v4 + 72) = v7;
  *(_OWORD *)(v4 + 88) = v8;
  *(_OWORD *)(v4 + 104) = v7;
  return (AXMVisionFeature *)v4;
}

+ (AXMVisionFeature)featureWithColorInfo:(id)a3 canvasSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v6;
  char *v7;
  __int128 v8;
  __int128 v9;
  void *v10;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v7 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v7 + 1) = 4;
  *((_QWORD *)v7 + 23) = AXMConfidenceNotApplicable;
  *((CGFloat *)v7 + 42) = width;
  *((CGFloat *)v7 + 43) = height;
  v8 = AXMRectNotApplicable;
  v9 = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v7 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v7 + 72) = v9;
  *(_OWORD *)(v7 + 88) = v8;
  *(_OWORD *)(v7 + 104) = v9;
  v10 = (void *)*((_QWORD *)v7 + 19);
  *((_QWORD *)v7 + 19) = v6;

  return (AXMVisionFeature *)v7;
}

+ (AXMVisionFeature)featureWithAssetMetadata:(id)a3
{
  id v3;
  char *v4;
  __int128 v5;
  __int128 v6;
  void *v7;

  v3 = a3;
  v4 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v4 + 1) = 13;
  *((_QWORD *)v4 + 23) = AXMConfidenceNotApplicable;
  v6 = AXMRectNotApplicable;
  v5 = *(_OWORD *)&qword_1EEEDC000;
  *((_OWORD *)v4 + 21) = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v4 + 56) = v6;
  *(_OWORD *)(v4 + 72) = v5;
  *(_OWORD *)(v4 + 88) = v6;
  *(_OWORD *)(v4 + 104) = v5;
  v7 = (void *)*((_QWORD *)v4 + 20);
  *((_QWORD *)v4 + 20) = v3;

  return (AXMVisionFeature *)v4;
}

+ (AXMVisionFeature)featureWithDeviceMotion:(id)a3 orientation:(int64_t)a4
{
  id v5;
  char *v6;
  __int128 v7;
  __int128 v8;
  void *v9;

  v5 = a3;
  v6 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v6 + 1) = 17;
  *((_QWORD *)v6 + 23) = AXMConfidenceNotApplicable;
  v8 = AXMRectNotApplicable;
  v7 = *(_OWORD *)&qword_1EEEDC000;
  *((_OWORD *)v6 + 21) = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v6 + 56) = v8;
  *(_OWORD *)(v6 + 72) = v7;
  *(_OWORD *)(v6 + 88) = v8;
  *(_OWORD *)(v6 + 104) = v7;
  v9 = (void *)*((_QWORD *)v6 + 60);
  *((_QWORD *)v6 + 60) = v5;

  *((_QWORD *)v6 + 61) = a4;
  return (AXMVisionFeature *)v6;
}

+ (AXMVisionFeature)featureWithCameraType:(int64_t)a3
{
  char *v4;
  __int128 v5;
  __int128 v6;

  v4 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v4 + 1) = 18;
  *((_QWORD *)v4 + 23) = AXMConfidenceNotApplicable;
  v6 = AXMRectNotApplicable;
  v5 = *(_OWORD *)&qword_1EEEDC000;
  *((_OWORD *)v4 + 21) = *(_OWORD *)&qword_1EEEDC000;
  *(_OWORD *)(v4 + 56) = v6;
  *(_OWORD *)(v4 + 72) = v5;
  *(_OWORD *)(v4 + 88) = v6;
  *(_OWORD *)(v4 + 104) = v5;
  *((_QWORD *)v4 + 62) = a3;
  return (AXMVisionFeature *)v4;
}

- (id)_init
{
  char *v2;
  _QWORD *v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXMVisionFeature;
  v2 = -[AXMVisionFeature init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    *((_QWORD *)v2 + 1) = 0;
    *((_QWORD *)v2 + 23) = AXMConfidenceNotApplicable;
    v4 = AXMRectNotApplicable;
    v5 = *(_OWORD *)&qword_1EEEDC000;
    *(_OWORD *)(v2 + 56) = AXMRectNotApplicable;
    *(_OWORD *)(v2 + 72) = v5;
    *(_OWORD *)(v2 + 88) = v4;
    *(_OWORD *)(v2 + 104) = v5;
    *((_OWORD *)v2 + 21) = v5;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v3[6] = v6;
    v3[4] = 0;
  }
  return v3;
}

+ (CGRect)_aspectFaceRectFromSquareFaceRect:(CGRect)a3 sizeInPixels:(CGSize)a4
{
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v4 = a3.size.height * a4.height;
  v5 = v4 * 1.6 * 0.8;
  v6 = (a3.origin.x * a4.width + (v5 - a3.size.width * a4.width) * -0.5) / a4.width;
  v7 = (a3.origin.y * a4.height - (v4 * 1.6 - v4) / 1.6) / a4.height;
  v8 = v5 / a4.width;
  v9 = v4 * 1.6 / a4.height;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionFeature)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  float v35;
  float v36;
  float v37;
  int v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  NSObject *v67;
  id v68;
  void *v69;
  __int128 v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  float v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  char *v81;
  id v83;
  id v84;
  uint8_t buf[16];
  __int128 v86;
  __int128 v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[AXMVisionFeature _init](self, "_init");
  if (v5)
  {
    *((_QWORD *)v5 + 1) = objc_msgSend(v4, "decodeIntegerForKey:", AXMVisionFeatureCodingKeyFeatureType);
    objc_msgSend(v4, "axmDecodeSizeForKey:", AXMVisionFeatureCodingKeyCanvasSize);
    *((_QWORD *)v5 + 42) = v6;
    *((_QWORD *)v5 + 43) = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureCodingKeyBarcodeType);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v8;

    *((_QWORD *)v5 + 4) = objc_msgSend(v4, "decodeIntegerForKey:", AXMVisionFeatureCodingKeyOCRFeatureType);
    AXMSecureCodingClasses();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("effectiveTextDetectionLocales"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v11;

    objc_msgSend(v4, "axmDecodeRectForKey:", AXMVisionFeatureCodingKeyFrame);
    *((_QWORD *)v5 + 7) = v13;
    *((_QWORD *)v5 + 8) = v14;
    *((_QWORD *)v5 + 9) = v15;
    *((_QWORD *)v5 + 10) = v16;
    objc_msgSend(v4, "axmDecodeRectForKey:", AXMVisionFeatureCodingKeyNormalizedFrame);
    *((_QWORD *)v5 + 11) = v17;
    *((_QWORD *)v5 + 12) = v18;
    *((_QWORD *)v5 + 13) = v19;
    *((_QWORD *)v5 + 14) = v20;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureCodingKeyValue);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v5 + 15);
    *((_QWORD *)v5 + 15) = v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classificationLocalizedValue"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)*((_QWORD *)v5 + 46);
    *((_QWORD *)v5 + 46) = v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classificationLabel"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)*((_QWORD *)v5 + 45);
    *((_QWORD *)v5 + 45) = v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("caption"));
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)*((_QWORD *)v5 + 47);
    *((_QWORD *)v5 + 47) = v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("translatedCaption"));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)*((_QWORD *)v5 + 48);
    *((_QWORD *)v5 + 48) = v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureCodingKeyColorInfo);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)*((_QWORD *)v5 + 19);
    *((_QWORD *)v5 + 19) = v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureCodingKeyAssetMetadata);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)*((_QWORD *)v5 + 20);
    *((_QWORD *)v5 + 20) = v33;

    objc_msgSend(v4, "decodeFloatForKey:", AXMVisionFeatureCodingKeyBlur);
    *((double *)v5 + 21) = v35;
    objc_msgSend(v4, "decodeFloatForKey:", AXMVisionFeatureCodingKeyBrightness);
    *((double *)v5 + 22) = v36;
    objc_msgSend(v4, "decodeFloatForKey:", AXMVisionFeatureCodingKeyConfidence);
    *((double *)v5 + 23) = v37;
    v5[192] = objc_msgSend(v4, "decodeBoolForKey:", AXMVisionFeatureCodingKeyIsLowConfidence);
    objc_msgSend(v4, "decodeFloatForKey:", AXMVisionFeatureCodingKeyHorizonAngle);
    *((_DWORD *)v5 + 62) = v38;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureCodingKeyFaceDetectionResult);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)*((_QWORD *)v5 + 32);
    *((_QWORD *)v5 + 32) = v39;

    *((_QWORD *)v5 + 33) = objc_msgSend(v4, "decodeIntegerForKey:", AXMVisionFeatureCodingKeyFaceID);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureCodingKeyModelID);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)*((_QWORD *)v5 + 44);
    *((_QWORD *)v5 + 44) = v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureCodingKeyAesthetics);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)*((_QWORD *)v5 + 59);
    *((_QWORD *)v5 + 59) = v43;

    AXMSecureCodingClasses();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, AXMVisionFeatureCodingKeyUserContext);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)*((_QWORD *)v5 + 63);
    *((_QWORD *)v5 + 63) = v46;

    *((_QWORD *)v5 + 58) = objc_msgSend(v4, "decodeIntegerForKey:", AXMVisionFeatureCodingKeyUIClass);
    v5[458] = objc_msgSend(v4, "decodeBoolForKey:", AXMVisionFeatureCodingKeyCaptionMayContainSensitiveContent);
    AXMSecureCodingClasses();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v48, AXMVisionFeatureCodingKeyDetectorSceneClassIds);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)*((_QWORD *)v5 + 50);
    *((_QWORD *)v5 + 50) = v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureCodingKeySceneClassId);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)*((_QWORD *)v5 + 51);
    *((_QWORD *)v5 + 51) = v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subfeatures"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      v54 = (void *)MEMORY[0x1E0CB3710];
      v55 = objc_opt_class();
      AXMSecureCodingClasses();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 0;
      objc_msgSend(v54, "axmSecurelyUnarchiveData:withExpectedClass:otherAllowedClasses:error:", v53, v55, v56, &v84);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v84;

      if (v58)
      {
        AXMediaLogCommon();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v58;
          _os_log_impl(&dword_1B0E3B000, v59, OS_LOG_TYPE_DEFAULT, "Error decoding subfeatures array: %@", buf, 0xCu);
        }
      }
      else
      {
        v60 = v57;
        v59 = *((_QWORD *)v5 + 2);
        *((_QWORD *)v5 + 2) = v60;
      }

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureCodingKeyRecognizedFeatures);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      v62 = (void *)MEMORY[0x1E0CB3710];
      v63 = objc_opt_class();
      AXMSecureCodingClasses();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = 0;
      objc_msgSend(v62, "axmSecurelyUnarchiveData:withExpectedClass:otherAllowedClasses:error:", v61, v63, v64, &v83);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v83;

      if (v66)
      {
        AXMediaLogCommon();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v66;
          _os_log_impl(&dword_1B0E3B000, v67, OS_LOG_TYPE_DEFAULT, "Error decoding recognizedTextFeatures array: %@", buf, 0xCu);
        }
      }
      else
      {
        v68 = v65;
        v67 = *((_QWORD *)v5 + 18);
        *((_QWORD *)v5 + 18) = v68;
      }

    }
    v86 = 0u;
    v87 = 0u;
    *(_OWORD *)buf = 0u;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureCodingKeyHorizonTransform);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "getBytes:length:", buf, 48);
    v70 = v86;
    *(_OWORD *)(v5 + 200) = *(_OWORD *)buf;
    *(_OWORD *)(v5 + 216) = v70;
    *(_OWORD *)(v5 + 232) = v87;
    *((_QWORD *)v5 + 61) = objc_msgSend(v4, "decodeIntegerForKey:", AXMVisionFeatureCodingKeyDeviceOrientation);
    *((_QWORD *)v5 + 62) = objc_msgSend(v4, "decodeIntegerForKey:", AXMVisionFeatureCodingKeyCameraType);
    AXMSecureCodingClasses();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v71, AXMVisionFeatureCodingKeyFeatureGates);
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = (void *)*((_QWORD *)v5 + 49);
    *((_QWORD *)v5 + 49) = v72;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMMediaAnalysisFeatureCodingKeyImageCaption);
    v74 = objc_claimAutoreleasedReturnValue();
    v75 = (void *)*((_QWORD *)v5 + 52);
    *((_QWORD *)v5 + 52) = v74;

    objc_msgSend(v4, "decodeFloatForKey:", AXMMediaAnalysisFeatureCodingKeyImageCaptionConfidence);
    *((double *)v5 + 53) = v76;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMMediaAnalysisFeatureCodingKeyTranslatedImageCaption);
    v77 = objc_claimAutoreleasedReturnValue();
    v78 = (void *)*((_QWORD *)v5 + 54);
    *((_QWORD *)v5 + 54) = v77;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMMediaAnalysisFeatureCodingKeyFaceDetectionResult);
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = (void *)*((_QWORD *)v5 + 55);
    *((_QWORD *)v5 + 55) = v79;

    *((_QWORD *)v5 + 56) = objc_msgSend(v4, "decodeIntegerForKey:", AXMMediaAnalysisFeatureCodingKeyFaceID);
    v81 = v5;

  }
  return (AXMVisionFeature *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  -[AXMVisionFeature _serializeWithCoder:orDictionary:](self, "_serializeWithCoder:orDictionary:", a3, 0);
}

- (void)_serializeWithCoder:(id)a3 orDictionary:(id)a4
{
  id v6;
  id v7;
  NSArray *subfeatures;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSArray *recognizedTextFeatures;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  double confidence;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *classificationLocalizedValue;
  const __CFString *colorInfo;
  const __CFString *v33;
  double brightness;
  uint64_t v35;
  __int128 v36;
  void *v37;
  double v38;
  AXMVisionFeatureFaceDetectionResult *faceDetectionResult;
  unint64_t faceId;
  uint64_t v41;
  int64_t ocrFeatureType;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  AXMVisionFeatureAestheticsResult *aestheticsResult;
  NSString *mediaAnalysisImageCaption;
  double mediaAnalysisImageCaptionConfidence;
  AXMVisionFeatureFaceDetectionResult *mediaAnalysisFaceDetectionResult;
  void *v52;
  uint64_t v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  _OWORD v62[3];
  id v63;
  id v64;

  v6 = a3;
  v7 = a4;
  subfeatures = self->_subfeatures;
  if (subfeatures)
  {
    v64 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", subfeatures, 1, &v64);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v64;
    if (v10)
    {
      v11 = v10;
      AXMediaLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[AXMVisionFeature _serializeWithCoder:orDictionary:].cold.3();

    }
  }
  else
  {
    v9 = 0;
  }
  recognizedTextFeatures = self->_recognizedTextFeatures;
  if (recognizedTextFeatures)
  {
    v63 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", recognizedTextFeatures, 1, &v63);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v63;
    v60 = (void *)v14;
    if (v15)
    {
      v16 = v15;
      AXMediaLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[AXMVisionFeature _serializeWithCoder:orDictionary:].cold.2();

    }
  }
  else
  {
    v60 = 0;
  }
  if (v6)
  {
    confidence = self->_confidence;
    *(float *)&confidence = confidence;
    objc_msgSend(v6, "encodeFloat:forKey:", AXMVisionFeatureCodingKeyConfidence, confidence);
    objc_msgSend(v6, "encodeBool:forKey:", self->_isLowConfidence, AXMVisionFeatureCodingKeyIsLowConfidence);
    objc_msgSend(v6, "encodeInteger:forKey:", self->_featureType, AXMVisionFeatureCodingKeyFeatureType);
    objc_msgSend(v6, "axmEncodeRect:forKey:", AXMVisionFeatureCodingKeyFrame, self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
    objc_msgSend(v6, "axmEncodeRect:forKey:", AXMVisionFeatureCodingKeyNormalizedFrame, self->_normalizedFrame.origin.x, self->_normalizedFrame.origin.y, self->_normalizedFrame.size.width, self->_normalizedFrame.size.height);
    objc_msgSend(v6, "axmEncodeSize:forKey:", AXMVisionFeatureCodingKeyCanvasSize, self->_canvasSize.width, self->_canvasSize.height);
    objc_msgSend(v6, "encodeObject:forKey:", self->_value, AXMVisionFeatureCodingKeyValue);
    v19 = (void *)v9;
    objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("subfeatures"));
    v20 = v60;
    objc_msgSend(v6, "encodeObject:forKey:", v60, AXMVisionFeatureCodingKeyRecognizedFeatures);
    -[AXMVisionFeature userContext](self, "userContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v21, AXMVisionFeatureCodingKeyUserContext);

    objc_msgSend(v6, "encodeInteger:forKey:", self->_uiClass, AXMVisionFeatureCodingKeyUIClass);
    objc_msgSend(v6, "encodeObject:forKey:", self->_featureGates, AXMVisionFeatureCodingKeyFeatureGates);
    objc_msgSend(v6, "encodeBool:forKey:", self->_captionMayContainSensitiveContent, AXMVisionFeatureCodingKeyCaptionMayContainSensitiveContent);
    objc_msgSend(v6, "encodeObject:forKey:", self->_detectorSceneClassIds, AXMVisionFeatureCodingKeyDetectorSceneClassIds);
    objc_msgSend(v6, "encodeObject:forKey:", self->_sceneClassId, AXMVisionFeatureCodingKeySceneClassId);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, AXMVisionFeatureCodingKeyConfidence);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLowConfidence);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, AXMVisionFeatureCodingKeyIsLowConfidence);

    +[AXMVisionFeature nameForFeatureType:](AXMVisionFeature, "nameForFeatureType:", self->_featureType);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, AXMVisionFeatureCodingKeyFeatureType);

    AXMStringFromCGRect(self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, AXMVisionFeatureCodingKeyFrame);

    AXMStringFromCGRect(self->_normalizedFrame.origin.x, self->_normalizedFrame.origin.y, self->_normalizedFrame.size.width, self->_normalizedFrame.size.height);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, AXMVisionFeatureCodingKeyNormalizedFrame);

    AXMStringFromCGSize(self->_canvasSize.width, self->_canvasSize.height);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, AXMVisionFeatureCodingKeyCanvasSize);

    objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_value, AXMVisionFeatureCodingKeyValue);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_subfeatures, CFSTR("subfeatures"));
    -[AXMVisionFeature userContext](self, "userContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, AXMVisionFeatureCodingKeyUserContext);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_uiClass);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, AXMVisionFeatureCodingKeyUIClass);

    objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_featureGates, AXMVisionFeatureCodingKeyFeatureGates);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captionMayContainSensitiveContent);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, AXMVisionFeatureCodingKeyCaptionMayContainSensitiveContent);

    objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_detectorSceneClassIds, AXMVisionFeatureCodingKeyDetectorSceneClassIds);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_sceneClassId, AXMVisionFeatureCodingKeySceneClassId);
    v19 = (void *)v9;
    v20 = v60;
  }
  switch(-[AXMVisionFeature featureType](self, "featureType"))
  {
    case 1uLL:
      if (v6)
      {
        brightness = self->_brightness;
        *(float *)&brightness = brightness;
        v35 = AXMVisionFeatureCodingKeyBrightness;
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_brightness);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = AXMVisionFeatureCodingKeyBrightness;
      goto LABEL_74;
    case 2uLL:
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_blur);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = AXMVisionFeatureCodingKeyBlur;
        goto LABEL_74;
      }
      brightness = self->_blur;
      *(float *)&brightness = brightness;
      v35 = AXMVisionFeatureCodingKeyBlur;
LABEL_24:
      objc_msgSend(v6, "encodeFloat:forKey:", v35, brightness);
      goto LABEL_75;
    case 3uLL:
      v36 = *(_OWORD *)&self->_horizonTransform.c;
      v62[0] = *(_OWORD *)&self->_horizonTransform.a;
      v62[1] = v36;
      v62[2] = *(_OWORD *)&self->_horizonTransform.tx;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v62, 48);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v6, "encodeObject:forKey:", v37, AXMVisionFeatureCodingKeyHorizonTransform);
        *(float *)&v38 = self->_horizonAngle;
        objc_msgSend(v6, "encodeFloat:forKey:", AXMVisionFeatureCodingKeyHorizonAngle, v38);
      }
      else
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v37, AXMVisionFeatureCodingKeyHorizonTransform);
        *(float *)&v54 = self->_horizonAngle;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v55, AXMVisionFeatureCodingKeyHorizonAngle);

      }
      goto LABEL_75;
    case 4uLL:
      if (v6)
      {
        colorInfo = (const __CFString *)self->_colorInfo;
        v33 = (const __CFString *)AXMVisionFeatureCodingKeyColorInfo;
        goto LABEL_54;
      }
      v33 = (const __CFString *)AXMVisionFeatureCodingKeyColorInfo;
      colorInfo = CFSTR("color info");
      goto LABEL_72;
    case 5uLL:
      faceDetectionResult = self->_faceDetectionResult;
      if (v6)
      {
        objc_msgSend(v6, "encodeObject:forKey:", faceDetectionResult, AXMVisionFeatureCodingKeyFaceDetectionResult);
        faceId = self->_faceId;
        v41 = AXMVisionFeatureCodingKeyFaceID;
        goto LABEL_57;
      }
      objc_msgSend(v7, "setObject:forKeyedSubscript:", faceDetectionResult, AXMVisionFeatureCodingKeyFaceDetectionResult);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_faceId);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = AXMVisionFeatureCodingKeyFaceID;
      goto LABEL_74;
    case 8uLL:
      ocrFeatureType = self->_ocrFeatureType;
      if (v6)
      {
        objc_msgSend(v6, "encodeInteger:forKey:", ocrFeatureType, AXMVisionFeatureCodingKeyOCRFeatureType);
        colorInfo = (const __CFString *)self->_effectiveTextDetectionLocales;
        v33 = CFSTR("effectiveTextDetectionLocales");
        goto LABEL_54;
      }
      -[AXMVisionFeature _nameForOCRFeatureType:](self, "_nameForOCRFeatureType:", ocrFeatureType);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v56, AXMVisionFeatureCodingKeyOCRFeatureType);

      colorInfo = (const __CFString *)self->_effectiveTextDetectionLocales;
      v33 = CFSTR("effectiveTextDetectionLocales");
      goto LABEL_72;
    case 9uLL:
    case 10uLL:
    case 23uLL:
    case 24uLL:
    case 26uLL:
    case 27uLL:
    case 29uLL:
    case 30uLL:
      classificationLocalizedValue = self->_classificationLocalizedValue;
      if (v6)
      {
        objc_msgSend(v6, "encodeObject:forKey:", classificationLocalizedValue, CFSTR("classificationLocalizedValue"));
        colorInfo = (const __CFString *)self->_classificationLabel;
        v33 = CFSTR("classificationLabel");
        goto LABEL_54;
      }
      objc_msgSend(v7, "setObject:forKeyedSubscript:", classificationLocalizedValue, CFSTR("classificationLocalizedValue"));
      colorInfo = (const __CFString *)self->_classificationLabel;
      v33 = CFSTR("classificationLabel");
      goto LABEL_72;
    case 11uLL:
      colorInfo = (const __CFString *)self->_barcodeType;
      v33 = (const __CFString *)AXMVisionFeatureCodingKeyBarcodeType;
      if (!v6)
        goto LABEL_72;
      goto LABEL_54;
    case 13uLL:
      if (v6)
      {
        colorInfo = (const __CFString *)self->_assetMetadata;
        v33 = (const __CFString *)AXMVisionFeatureCodingKeyAssetMetadata;
        goto LABEL_54;
      }
      v33 = (const __CFString *)AXMVisionFeatureCodingKeyAssetMetadata;
      colorInfo = CFSTR("asset metadata");
      goto LABEL_72;
    case 15uLL:
      colorInfo = (const __CFString *)self->_modelID;
      v33 = (const __CFString *)AXMVisionFeatureCodingKeyModelID;
      if (!v6)
        goto LABEL_72;
      goto LABEL_54;
    case 16uLL:
      if (!v6)
        goto LABEL_70;
      goto LABEL_51;
    case 17uLL:
      v43 = (void *)MEMORY[0x1E0CB36F8];
      -[AXMVisionFeature deviceMotion](self, "deviceMotion");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      objc_msgSend(v43, "archivedDataWithRootObject:requiringSecureCoding:error:", v44, 1, &v61);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v61;

      if (v46)
      {
        AXMediaLogCommon();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          -[AXMVisionFeature _serializeWithCoder:orDictionary:].cold.1();

      }
      if (v6)
      {
        objc_msgSend(v6, "encodeObject:forKey:", v45, AXMVisionFeatureCodingKeyDeviceMotion);
        objc_msgSend(v6, "encodeInteger:forKey:", self->_deviceOrientation, AXMVisionFeatureCodingKeyDeviceOrientation);
        objc_msgSend(v6, "encodeInteger:forKey:", self->_cameraType, AXMVisionFeatureCodingKeyCameraType);
      }
      else
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v45, AXMVisionFeatureCodingKeyDeviceMotion);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceOrientation);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v57, AXMVisionFeatureCodingKeyDeviceOrientation);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_cameraType);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v58, AXMVisionFeatureCodingKeyCameraType);

      }
      goto LABEL_75;
    case 18uLL:
      if (v6)
      {
        faceId = self->_cameraType;
        v41 = AXMVisionFeatureCodingKeyCameraType;
        goto LABEL_57;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_cameraType);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = AXMVisionFeatureCodingKeyCameraType;
      goto LABEL_74;
    case 21uLL:
      aestheticsResult = self->_aestheticsResult;
      if (v6)
      {
        objc_msgSend(v6, "encodeObject:forKey:", aestheticsResult, AXMVisionFeatureCodingKeyAesthetics);
LABEL_51:
        objc_msgSend(v6, "encodeObject:forKey:", self->_caption, CFSTR("caption"));
        colorInfo = (const __CFString *)self->_translatedCaption;
        v33 = CFSTR("translatedCaption");
        goto LABEL_54;
      }
      objc_msgSend(v7, "setObject:forKeyedSubscript:", aestheticsResult, AXMVisionFeatureCodingKeyAesthetics);
LABEL_70:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_caption, CFSTR("caption"));
      colorInfo = (const __CFString *)self->_translatedCaption;
      v33 = CFSTR("translatedCaption");
      goto LABEL_72;
    case 25uLL:
      mediaAnalysisImageCaption = self->_mediaAnalysisImageCaption;
      if (v6)
      {
        objc_msgSend(v6, "encodeObject:forKey:", mediaAnalysisImageCaption, AXMMediaAnalysisFeatureCodingKeyImageCaption);
        mediaAnalysisImageCaptionConfidence = self->_mediaAnalysisImageCaptionConfidence;
        *(float *)&mediaAnalysisImageCaptionConfidence = mediaAnalysisImageCaptionConfidence;
        objc_msgSend(v6, "encodeFloat:forKey:", AXMMediaAnalysisFeatureCodingKeyImageCaptionConfidence, mediaAnalysisImageCaptionConfidence);
        colorInfo = (const __CFString *)self->_mediaAnalysisTranslatedImageCaption;
        v33 = (const __CFString *)AXMMediaAnalysisFeatureCodingKeyTranslatedImageCaption;
LABEL_54:
        objc_msgSend(v6, "encodeObject:forKey:", colorInfo, v33);
      }
      else
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", mediaAnalysisImageCaption, AXMMediaAnalysisFeatureCodingKeyImageCaption);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mediaAnalysisImageCaptionConfidence);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v59, AXMMediaAnalysisFeatureCodingKeyImageCaptionConfidence);

        colorInfo = (const __CFString *)self->_mediaAnalysisTranslatedImageCaption;
        v33 = (const __CFString *)AXMMediaAnalysisFeatureCodingKeyTranslatedImageCaption;
LABEL_72:
        objc_msgSend(v7, "setObject:forKeyedSubscript:", colorInfo, v33);
      }
LABEL_75:

      return;
    case 31uLL:
      mediaAnalysisFaceDetectionResult = self->_mediaAnalysisFaceDetectionResult;
      if (v6)
      {
        objc_msgSend(v6, "encodeObject:forKey:", mediaAnalysisFaceDetectionResult, AXMMediaAnalysisFeatureCodingKeyFaceDetectionResult);
        faceId = self->_mediaAnalysisFaceId;
        v41 = AXMMediaAnalysisFeatureCodingKeyFaceID;
LABEL_57:
        objc_msgSend(v6, "encodeInteger:forKey:", faceId, v41);
      }
      else
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", mediaAnalysisFaceDetectionResult, AXMMediaAnalysisFeatureCodingKeyFaceDetectionResult);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_mediaAnalysisFaceId);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = AXMMediaAnalysisFeatureCodingKeyFaceID;
LABEL_74:
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v52, v53);

      }
      goto LABEL_75;
    default:
      goto LABEL_75;
  }
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionFeature _serializeWithCoder:orDictionary:](self, "_serializeWithCoder:orDictionary:", 0, v3);
  return (NSDictionary *)v3;
}

- (unint64_t)featureType
{
  return self->_featureType;
}

- (NSArray)subfeatures
{
  return self->_subfeatures;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (CGSize)canvasSize
{
  double width;
  double height;
  CGSize result;

  width = self->_canvasSize.width;
  height = self->_canvasSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)normalizedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedFrame.origin.x;
  y = self->_normalizedFrame.origin.y;
  width = self->_normalizedFrame.size.width;
  height = self->_normalizedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)isLowConfidence
{
  return self->_isLowConfidence;
}

- (NSString)barcodeType
{
  return self->_barcodeType;
}

- (int64_t)ocrFeatureType
{
  return self->_ocrFeatureType;
}

- (id)effectiveTextDetectionLocales
{
  return self->_effectiveTextDetectionLocales;
}

- (AXMVisionFeatureColorInfo)colorInfo
{
  return self->_colorInfo;
}

- (AXMVisionFeatureAssetMetadata)assetMetadata
{
  return self->_assetMetadata;
}

- (double)blur
{
  return self->_blur;
}

- (double)brightness
{
  return self->_brightness;
}

- (AXMVisionFeatureFaceDetectionResult)faceDetectionResult
{
  return self->_faceDetectionResult;
}

- (unint64_t)faceId
{
  return self->_faceId;
}

- (__n128)facePose
{
  return a1[17];
}

- (CGAffineTransform)horizonTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].ty;
  return self;
}

- (float)horizonAngle
{
  return self->_horizonAngle;
}

- (NSString)classificationLabel
{
  return self->_classificationLabel;
}

- (NSString)classificationLocalizedValue
{
  return self->_classificationLocalizedValue;
}

- (NSString)caption
{
  return self->_caption;
}

- (AXMTranslatedText)translatedCaption
{
  return self->_translatedCaption;
}

- (NSDictionary)featureGates
{
  return (NSDictionary *)self->_featureGates;
}

- (NSSet)detectorSceneClassIds
{
  return (NSSet *)self->_detectorSceneClassIds;
}

- (NSString)sceneClassId
{
  return self->_sceneClassId;
}

- (NSString)mediaAnalysisImageCaption
{
  return self->_mediaAnalysisImageCaption;
}

- (double)mediaAnalysisImageCaptionConfidence
{
  return self->_mediaAnalysisImageCaptionConfidence;
}

- (AXMTranslatedText)mediaAnalysisTranslatedImageCaption
{
  return self->_mediaAnalysisTranslatedImageCaption;
}

- (AXMVisionFeatureFaceDetectionResult)mediaAnalysisFaceDetectionResult
{
  return self->_mediaAnalysisFaceDetectionResult;
}

- (unint64_t)mediaAnalysisFaceId
{
  return self->_mediaAnalysisFaceId;
}

+ (id)nameForLocation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x10)
    return CFSTR("Unknown");
  else
    return *(&off_1E625F150 + a3 - 1);
}

+ (id)localizedStringForLocation:(int64_t)a3 isSubjectImplicit:(BOOL)a4
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 0x10)
  {
    v7 = 0;
  }
  else
  {
    v5 = *(&off_1E625F1D8 + v4);
    if (a4)
    {
      -[__CFString stringByAppendingString:](*(&off_1E625F1D8 + v4), "stringByAppendingString:", CFSTR(".implicit-subject"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_1E6260C18, CFSTR("Accessibility"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (int64_t)locationUsingThirds:(BOOL)a3 withFlippedYAxis:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a3;
  -[AXMVisionFeature normalizedFrame](self, "normalizedFrame");
  return +[AXMVisionFeature locationForNormalizedFrame:previousLocation:usingThirds:](AXMVisionFeature, "locationForNormalizedFrame:previousLocation:usingThirds:", 0, v4);
}

+ (int64_t)locationForNormalizedFrame:(CGRect)a3 previousLocation:(int64_t)a4 usingThirds:(BOOL)a5
{
  int64_t result;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  int v15;
  int v16;
  int v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double MidX;
  double MidY;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  double v29;
  double v30;
  double v31;
  int64_t v32;
  BOOL v33;
  int64_t v34;
  uint64_t v35;
  BOOL v36;
  int64_t v37;
  int64_t v38;
  double v39;
  double v40;
  double v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  result = 0;
  if (a3.size.width <= 0.0)
    return result;
  height = a3.size.height;
  if (a3.size.height <= 0.0)
    return result;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = 0;
  v11 = 1.0;
  *(double *)&v12 = 0.0;
  v13 = 0.0;
  v14 = 1.0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  switch(a4)
  {
    case 1:
      v15 = 0;
      v17 = 0;
      v10 = 1;
      goto LABEL_7;
    case 2:
      v10 = 0;
      v15 = 0;
      v17 = 0;
      goto LABEL_7;
    case 3:
      v10 = 0;
      v17 = 0;
      v15 = 1;
LABEL_7:
      v16 = 1;
      break;
    case 4:
      v10 = 0;
      v16 = 0;
      v17 = 0;
      v15 = 1;
      break;
    case 5:
      break;
    case 6:
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v10 = 1;
      break;
    case 7:
      v15 = 0;
      v16 = 0;
      v10 = 1;
      goto LABEL_13;
    case 8:
      v10 = 0;
      v15 = 0;
      v16 = 0;
      goto LABEL_13;
    case 9:
      v10 = 0;
      v16 = 0;
      v15 = 1;
LABEL_13:
      v17 = 1;
      break;
    case 10:
      v10 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v13 = 0.05;
      *(double *)&v12 = 0.05;
      break;
    case 11:
      v10 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      *(double *)&v12 = 0.05;
      break;
    case 12:
      v10 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      *(double *)&v12 = 0.05;
      goto LABEL_18;
    case 13:
      v10 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
LABEL_18:
      v14 = 0.95;
      break;
    case 14:
      v10 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      goto LABEL_21;
    case 15:
      v10 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v11 = 0.95;
LABEL_21:
      v13 = 0.05;
      break;
    case 16:
      v10 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v11 = 0.95;
      break;
    case 17:
      v10 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v14 = 0.95;
      v11 = 0.95;
      break;
    default:
      v13 = 0.0;
      v14 = 1.0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      break;
  }
  v39 = v14;
  v40 = v11;
  v41 = *(double *)&v12;
  if (a5)
    v18 = 0.333333333;
  else
    v18 = 0.4;
  if (a5)
    v19 = 0.333333333;
  else
    v19 = 0.2;
  v20 = x;
  v21 = y;
  v22 = height;
  MidX = CGRectGetMidX(a3);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  MidY = CGRectGetMidY(v42);
  v43.origin.x = v18;
  v43.origin.y = v18;
  v43.size.width = v19;
  v43.size.height = v19;
  MinX = CGRectGetMinX(v43);
  v44.origin.x = v18;
  v44.origin.y = v18;
  v44.size.width = v19;
  v44.size.height = v19;
  MaxX = CGRectGetMaxX(v44);
  v45.origin.x = v18;
  v45.origin.y = v18;
  v45.size.width = v19;
  v45.size.height = v19;
  MinY = CGRectGetMinY(v45);
  v46.origin.x = v18;
  v46.origin.y = v18;
  v46.size.width = v19;
  v46.size.height = v19;
  MaxY = CGRectGetMaxY(v46);
  v29 = MinX + 0.05;
  if (!v10)
    v29 = MinX;
  v30 = MaxX + -0.05;
  if (!v15)
    v30 = MaxX;
  v31 = MinY + 0.05;
  if (!v16)
    v31 = MinY;
  if (v17)
    MaxY = MaxY + -0.05;
  if (MidX < v13)
  {
    v32 = 10;
    v33 = MidY <= v40;
    v34 = 14;
    v35 = 15;
LABEL_43:
    if (!v33)
      v34 = v35;
    if (MidY >= v41)
      return v34;
    else
      return v32;
  }
  if (MidX > v39)
  {
    v32 = 12;
    v33 = MidY <= v40;
    v34 = 13;
    v35 = 17;
    goto LABEL_43;
  }
  if (MidY >= v41)
    result = 16;
  else
    result = 11;
  if (MidY >= v41 && MidY <= v40)
  {
    if (MidX >= v29)
    {
      if (MidX >= v30)
      {
        if (MidY <= v31)
          return 3;
        v36 = MidY < MaxY;
        v37 = 9;
        v38 = 4;
      }
      else
      {
        if (MidY <= v31)
          return 2;
        v36 = MidY < MaxY;
        v37 = 8;
        v38 = 5;
      }
    }
    else
    {
      if (MidY < v31)
        return 1;
      v36 = MidY < MaxY;
      v37 = 7;
      v38 = 6;
    }
    if (v36)
      return v38;
    else
      return v37;
  }
  return result;
}

- (NSString)value
{
  return self->_value;
}

- (BOOL)isValueSpeakable
{
  return self->_isValueSpeakable;
}

- (BOOL)isBarcode
{
  return self->_featureType == 11;
}

- (BOOL)isFace
{
  return self->_featureType == 5;
}

- (BOOL)isRealtimeFace
{
  return self->_featureType == 6;
}

- (BOOL)isPerson
{
  return self->_featureType == 7;
}

- (BOOL)isSceneClassification
{
  return self->_featureType == 9;
}

- (BOOL)isObjectClassification
{
  return self->_featureType == 10;
}

- (BOOL)isNSFWClassification
{
  return self->_featureType == 23;
}

- (BOOL)isSignificantEventClassification
{
  return self->_featureType == 24;
}

- (BOOL)isModelClassification
{
  return self->_featureType == 15;
}

- (BOOL)isCaption
{
  return self->_featureType == 16;
}

- (BOOL)isColor
{
  return self->_featureType == 4;
}

- (BOOL)isBrightness
{
  return self->_featureType == 1;
}

- (BOOL)isBlur
{
  return self->_featureType == 2;
}

- (BOOL)isHorizon
{
  return self->_featureType == 3;
}

- (BOOL)isMediaLegibility
{
  return self->_featureType == 12;
}

- (BOOL)isAssetMetadata
{
  return self->_featureType == 13;
}

- (BOOL)isRectangle
{
  return self->_featureType == 14;
}

- (BOOL)isOCR
{
  return self->_featureType == 8;
}

- (BOOL)isTextDocument
{
  return self->_featureType == 8 && self->_ocrFeatureType == 1;
}

- (BOOL)isTextRegion
{
  return self->_featureType == 8 && self->_ocrFeatureType == 2;
}

- (BOOL)isTextLine
{
  return self->_featureType == 8 && self->_ocrFeatureType == 3;
}

- (BOOL)isTextSequence
{
  return self->_featureType == 8 && self->_ocrFeatureType == 4;
}

- (BOOL)isTable
{
  return self->_featureType == 8 && (unint64_t)(self->_ocrFeatureType - 7) < 2;
}

- (BOOL)isTableRow
{
  return self->_featureType == 8 && self->_ocrFeatureType == 9;
}

- (BOOL)isTableColumn
{
  return self->_featureType == 8 && self->_ocrFeatureType == 10;
}

- (BOOL)isTableCell
{
  return self->_featureType == 8 && self->_ocrFeatureType == 11;
}

- (BOOL)isNutritionLabel
{
  return self->_featureType == 8 && self->_ocrFeatureType == 13;
}

- (BOOL)isEnvelope
{
  return self->_featureType == 8 && self->_ocrFeatureType == 14;
}

- (BOOL)isEnvelopeRegion
{
  return self->_featureType == 8 && self->_ocrFeatureType == 15;
}

- (BOOL)isReceipt
{
  return self->_featureType == 8 && self->_ocrFeatureType == 16;
}

- (BOOL)isTextCharacter
{
  return self->_featureType == 8 && self->_ocrFeatureType == 5;
}

- (BOOL)isTextDiacritic
{
  return self->_featureType == 8 && self->_ocrFeatureType == 6;
}

- (BOOL)isMotion
{
  return self->_featureType == 17;
}

- (BOOL)isCameraMetadata
{
  return self->_featureType == 18;
}

- (BOOL)isProminentObject
{
  return self->_featureType == 19;
}

- (BOOL)isIconClass
{
  return self->_featureType == 20;
}

- (BOOL)isImageAesthetics
{
  return self->_featureType == 21;
}

- (BOOL)isMediaAnalysisImageCaption
{
  return self->_featureType == 25;
}

- (BOOL)isMediaAnalysisSceneClassification
{
  return self->_featureType == 26;
}

- (BOOL)isMediaAnalysisObjectClassification
{
  return self->_featureType == 27;
}

- (BOOL)isMediaAnalysisNSFWClassification
{
  return self->_featureType == 29;
}

- (BOOL)isMediaAnalysisSignificantEventlassification
{
  return self->_featureType == 30;
}

- (BOOL)isMediaAnalysisFace
{
  return self->_featureType == 31;
}

- (id)_nameForOCRFeatureType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x10)
    return CFSTR("unknown");
  else
    return *(&off_1E625F260 + a3);
}

+ (id)nameForUIClass:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 0x13)
    return *(&off_1E625F2E8 + a3 - 1);
  objc_msgSend(a1, "nameForUIClass:", 19);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)uiClassForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AXMVisionFeature_uiClassForName___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (uiClassForName__onceToken != -1)
    dispatch_once(&uiClassForName__onceToken, block);
  objc_msgSend((id)uiClassForName___reverseLookup, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v7 = 19;

  return v7;
}

void __35__AXMVisionFeature_uiClassForName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)uiClassForName___reverseLookup;
  uiClassForName___reverseLookup = v2;

  for (i = 5; i != 19; ++i)
  {
    v5 = (void *)uiClassForName___reverseLookup;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "nameForUIClass:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v7);

  }
}

+ (id)nameForFeatureType:(unint64_t)a3
{
  if (a3 > 0x1F)
    return 0;
  else
    return *(&off_1E625F380 + a3);
}

+ (id)nameForOCRType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x10)
    return 0;
  else
    return *(&off_1E625F480 + a3);
}

+ (void)_append:(id)a3 toList:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "addObject:", v5);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v5, "subfeatures", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        +[AXMVisionFeature _append:toList:](AXMVisionFeature, "_append:toList:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

+ (id)flattenedFeatureList:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        +[AXMVisionFeature _append:toList:](AXMVisionFeature, "_append:toList:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), v4, (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

- (CGRect)boundingBoxForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  AXMVisionFeature *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSUInteger v15;
  AXMVisionFeature *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  __int128 v35;
  void *v36;
  NSArray *obj;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;
  NSRange v50;
  NSRange v51;
  NSRange v52;
  CGRect result;

  length = a3.length;
  location = a3.location;
  v5 = self;
  v49 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (-[AXMVisionFeature featureType](self, "featureType") == 8)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v5->_recognizedTextFeatures;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v10)
    {
      v12 = v10;
      v38 = *(_QWORD *)v41;
      *(_QWORD *)&v11 = 138412546;
      v35 = v11;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v41 != v38)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          v50.location = objc_msgSend(v14, "textRange", v35);
          v15 = v50.location;
          v52.location = location;
          v52.length = length;
          if (NSIntersectionRange(v50, v52).length)
          {
            v16 = v5;
            -[AXMVisionFeature value](v5, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "substringWithRange:", location, length);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "hasSuffix:", CFSTR(","));
            if (length == 1)
              v20 = 0;
            else
              v20 = v19;

            length -= v20;
            if (location)
              location -= v15;
            else
              location = 0;
            objc_msgSend(v14, "text");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = 0;
            objc_msgSend(v21, "boundingBoxForRange:error:", location, length, &v39);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v39;

            if (v23)
            {
              AXMediaLogCommon();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v14, "text");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "string");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v51.location = objc_msgSend(v14, "textRange");
                NSStringFromRange(v51);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v35;
                v45 = v29;
                v46 = 2112;
                v47 = v30;
                _os_log_error_impl(&dword_1B0E3B000, v24, OS_LOG_TYPE_ERROR, "Failed to find bounding box for text: %@ and range: %@", buf, 0x16u);

              }
            }
            else
            {
              objc_msgSend(v22, "boundingBox");
              v6 = v25;
              v7 = v26;
              v8 = v27;
              v9 = v28;
            }
            v5 = v16;

          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v12);
    }

  }
  v31 = v6;
  v32 = v7;
  v33 = v8;
  v34 = v9;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)addFeatureGate:(id)a3 userInfo:(id)a4
{
  id v6;
  NSMutableDictionary *featureGates;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  featureGates = self->_featureGates;
  if (!featureGates)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_featureGates;
    self->_featureGates = v8;

    featureGates = self->_featureGates;
  }
  if (v6)
    v10 = v6;
  else
    v10 = (id)MEMORY[0x1E0C9AA70];
  -[NSMutableDictionary setObject:forKeyedSubscript:](featureGates, "setObject:forKeyedSubscript:", v10, v11);

}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXMVisionFeature description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXMVisionFeature<%p> %@"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  float v19;
  uint64_t v20;
  NSString *modelID;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  CGRect v63;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  +[AXMVisionFeature nameForFeatureType:](AXMVisionFeature, "nameForFeatureType:", -[AXMVisionFeature featureType](self, "featureType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ "), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  switch(self->_featureType)
  {
    case 1uLL:
      -[AXMVisionFeature brightness](self, "brightness");
      goto LABEL_9;
    case 2uLL:
      -[AXMVisionFeature blur](self, "blur");
LABEL_9:
      objc_msgSend(v5, "appendFormat:", CFSTR("value:'%.2f' "), v18);
      break;
    case 3uLL:
      -[AXMVisionFeature horizonAngle](self, "horizonAngle");
      objc_msgSend(v5, "appendFormat:", CFSTR("horizon transform. angle: %f "), v19);
      break;
    case 5uLL:
    case 6uLL:
      -[AXMVisionFeature faceDetectionResult](self, "faceDetectionResult");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v61, "faceId");
      -[AXMVisionFeature faceDetectionResult](self, "faceDetectionResult");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "name");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeature faceDetectionResult](self, "faceDetectionResult");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "landmarks");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeature faceDetectionResult](self, "faceDetectionResult");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "landmarks3d");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeature faceDetectionResult](self, "faceDetectionResult");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "expressionsAndConfidence");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeature faceDetectionResult](self, "faceDetectionResult");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeature faceDetectionResult](self, "faceDetectionResult");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "descriptionForExpression:", objc_msgSend(v52, "likelyExpression"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeature faceDetectionResult](self, "faceDetectionResult");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeature faceDetectionResult](self, "faceDetectionResult");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "confidenceForExpression:", objc_msgSend(v7, "likelyExpression"));
      v9 = v8;
      -[AXMVisionFeature faceDetectionResult](self, "faceDetectionResult");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "accessibilityLabelForAttributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[AXMVisionFeature nameForLocation:](AXMVisionFeature, "nameForLocation:", -[AXMVisionFeature locationUsingThirds:withFlippedYAxis:](self, "locationUsingThirds:withFlippedYAxis:", 0, 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("face id: %lu \nName: %@ \n[faceLandmarks: %@ faceLandmarks3d: %@ faceExpressions: %@ likelyExpression: %@ likelyConfidence: %f] \nFace Attributes : %@\nFace location: %@\n"), v54, v53, v48, v50, v47, v6, v9, v12, v13);

      break;
    case 8uLL:
      -[AXMVisionFeature value](self, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeature _nameForOCRFeatureType:](self, "_nameForOCRFeatureType:", -[AXMVisionFeature ocrFeatureType](self, "ocrFeatureType"));
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 9uLL:
    case 0xAuLL:
      -[AXMVisionFeature classificationLabel](self, "classificationLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeature classificationLocalizedValue](self, "classificationLocalizedValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeature sceneClassId](self, "sceneClassId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeature detectorSceneClassIds](self, "detectorSceneClassIds");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("classificationLabel:'%@' localizedName:'%@' sceneClassID:'%@' detectorSceneClassIds:'%@' "), v14, v15, v16, v17);

      goto LABEL_24;
    case 0xBuLL:
      -[AXMVisionFeature value](self, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeature barcodeType](self, "barcodeType");
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_23:
      v15 = (void *)v20;
      objc_msgSend(v5, "appendFormat:", CFSTR("value:'%@' type:%@ "), v14, v20);
      goto LABEL_24;
    case 0xCuLL:
      -[AXMVisionFeature value](self, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("value:'%@' "), v14, v46);
      goto LABEL_29;
    case 0xDuLL:
      -[AXMVisionFeature assetMetadata](self, "assetMetadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("asset info [%@] "), v14, v46);
      goto LABEL_29;
    case 0xFuLL:
      modelID = self->_modelID;
      -[AXMVisionFeature classificationLabel](self, "classificationLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("ModelID: '%@' classificationLabel: '%@' "), modelID, v14);
      goto LABEL_29;
    case 0x10uLL:
      -[AXMVisionFeature caption](self, "caption");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeature translatedCaption](self, "translatedCaption");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("caption: '%@' translated: '%@' "), v14, v15);
      goto LABEL_24;
    case 0x11uLL:
      -[AXMVisionFeature deviceMotion](self, "deviceMotion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("deviceMotion: %@"), v14, v46);
      goto LABEL_29;
    case 0x12uLL:
      v22 = -[AXMVisionFeature cameraType](self, "cameraType");
      if (v22 > 2)
        v23 = 0;
      else
        v23 = (uint64_t)*(&off_1E625F508 + v22);
      objc_msgSend(v5, "appendFormat:", CFSTR("camera: %@"), v23);
      break;
    case 0x13uLL:
      +[AXMVisionFeature nameForLocation:](AXMVisionFeature, "nameForLocation:", -[AXMVisionFeature locationUsingThirds:withFlippedYAxis:](self, "locationUsingThirds:withFlippedYAxis:", 0, 0));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("location : %@"), v14, v46);
      goto LABEL_29;
    case 0x16uLL:
      +[AXMVisionFeature nameForUIClass:](AXMVisionFeature, "nameForUIClass:", -[AXMVisionFeature uiClass](self, "uiClass"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("uiClass:%@ "), v32);

      -[AXMVisionFeature value](self, "value");
      v33 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v33;
      if (v33)
        objc_msgSend(v5, "appendFormat:", CFSTR("value:%@ "), v33, v46);
      goto LABEL_29;
    case 0x17uLL:
    case 0x18uLL:
      -[AXMVisionFeature classificationLabel](self, "classificationLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("classificationLabel:'%@' "), v14, v46);
      goto LABEL_29;
    case 0x19uLL:
      if (self->_mediaAnalysisImageCaption)
      {
        objc_msgSend(v5, "appendFormat:", CFSTR("\nimage caption : %@"), self->_mediaAnalysisImageCaption);
        objc_msgSend(v5, "appendFormat:", CFSTR("\nimage caption translated : %@"), self->_mediaAnalysisTranslatedImageCaption);
        objc_msgSend(v5, "appendFormat:", CFSTR("\nimage caption confidence : %.2f\n"), *(_QWORD *)&self->_mediaAnalysisImageCaptionConfidence);
      }
      break;
    case 0x1AuLL:
    case 0x1BuLL:
      -[AXMVisionFeature classificationLabel](self, "classificationLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeature classificationLocalizedValue](self, "classificationLocalizedValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("classificationLabel:'%@' localizedName:'%@'"), v14, v15);
LABEL_24:

      goto LABEL_29;
    case 0x1CuLL:
      +[AXMVisionFeature nameForLocation:](AXMVisionFeature, "nameForLocation:", -[AXMVisionFeature locationUsingThirds:withFlippedYAxis:](self, "locationUsingThirds:withFlippedYAxis:", 0, 0));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("media analysis location : %@"), v14, v46);
      goto LABEL_29;
    case 0x1DuLL:
    case 0x1EuLL:
      -[AXMVisionFeature classificationLabel](self, "classificationLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("classificationLabel:'%@'"), v14, v46);
      goto LABEL_29;
    case 0x1FuLL:
      -[AXMVisionFeature mediaAnalysisFaceDetectionResult](self, "mediaAnalysisFaceDetectionResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v14, "faceId");
      objc_msgSend(v14, "name");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "landmarks");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "landmarks3d");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "expressionsAndConfidence");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "descriptionForExpression:", objc_msgSend(v14, "likelyExpression"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "confidenceForExpression:", objc_msgSend(v14, "likelyExpression"));
      v28 = v27;
      objc_msgSend(v14, "attributes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "accessibilityLabelForAttributes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[AXMVisionFeature nameForLocation:](AXMVisionFeature, "nameForLocation:", -[AXMVisionFeature locationUsingThirds:withFlippedYAxis:](self, "locationUsingThirds:withFlippedYAxis:", 0, 0));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("face id: %lu \nName: %@ \n[faceLandmarks: %@ faceLandmarks3d: %@ faceExpressions: %@ likelyExpression: %@ likelyConfidence: %f] \nFace Attributes : %@\nFace location: %@\n"), v62, v60, v58, v24, v25, v26, v28, v30, v31);

LABEL_29:
      break;
    default:
      break;
  }
  -[AXMVisionFeature frame](self, "frame");
  if (!CGRectIsEmpty(v63))
  {
    -[AXMVisionFeature frame](self, "frame");
    AXMStringFromCGRect(v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeature normalizedFrame](self, "normalizedFrame");
    AXMStringFromNormalizedCGRect(v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("frame:%@ (normalized:%@) "), v38, v43);

  }
  -[AXMVisionFeature confidence](self, "confidence");
  objc_msgSend(v5, "appendFormat:", CFSTR("confidence:%.2f lowConfidence:%ld "), v44, -[AXMVisionFeature isLowConfidence](self, "isLowConfidence"));
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  AXMVisionFeature *v4;
  BOOL v5;

  v4 = (AXMVisionFeature *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[AXMVisionFeature isEqualToAXMVisionFeature:](self, "isEqualToAXMVisionFeature:", v4);
  }

  return v5;
}

- (BOOL)isEqualToAXMVisionFeature:(id)a3
{
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *classificationLabel;
  uint64_t v10;
  BOOL v11;
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
  double brightness;
  double v25;
  BOOL v26;
  float horizonAngle;
  float v28;
  AXMVisionFeatureAssetMetadata *assetMetadata;

  v4 = (char *)a3;
  v5 = v4;
  if (v4 && self->_featureType == *((_QWORD *)v4 + 1) && CGRectEqualToRect(self->_frame, *(CGRect *)(v4 + 56)))
  {
    switch(self->_featureType)
    {
      case 0uLL:
      case 4uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xEuLL:
      case 0x11uLL:
      case 0x12uLL:
      case 0x13uLL:
      case 0x14uLL:
      case 0x15uLL:
      case 0x16uLL:
        -[AXMVisionFeature value](self, "value");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(self) = objc_msgSend(v6, "isEqualToString:", v7);

        goto LABEL_11;
      case 1uLL:
        brightness = self->_brightness;
        objc_msgSend(v5, "brightness");
        goto LABEL_15;
      case 2uLL:
        brightness = self->_blur;
        objc_msgSend(v5, "blur");
LABEL_15:
        v26 = brightness == v25;
        goto LABEL_17;
      case 3uLL:
        horizonAngle = self->_horizonAngle;
        objc_msgSend(v5, "horizonAngle");
        v26 = horizonAngle == v28;
LABEL_17:
        LOBYTE(self) = v26;
        break;
      case 5uLL:
      case 0x1CuLL:
      case 0x1FuLL:
        -[AXMVisionFeature frame](self, "frame");
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;
        objc_msgSend(v5, "frame");
        LOBYTE(self) = AXMRectApproxEqual(v13, v15, v17, v19, v20, v21, v22, v23);
        break;
      case 9uLL:
      case 0xAuLL:
      case 0xFuLL:
      case 0x17uLL:
      case 0x18uLL:
      case 0x1AuLL:
      case 0x1BuLL:
      case 0x1DuLL:
      case 0x1EuLL:
        classificationLabel = self->_classificationLabel;
        objc_msgSend(v5, "classificationLabel");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 0xDuLL:
        assetMetadata = self->_assetMetadata;
        objc_msgSend(v5, "assetMetadata");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[AXMVisionFeatureAssetMetadata isEqual:](assetMetadata, "isEqual:", v6);
        goto LABEL_10;
      case 0x10uLL:
        classificationLabel = self->_caption;
        objc_msgSend(v5, "caption");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 0x19uLL:
        classificationLabel = self->_mediaAnalysisImageCaption;
        objc_msgSend(v5, "mediaAnalysisImageCaption");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v6 = (void *)v10;
        v11 = -[NSString isEqualToString:](classificationLabel, "isEqualToString:", v10);
LABEL_10:
        LOBYTE(self) = v11;
LABEL_11:

        break;
      default:
        break;
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return self & 1;
}

- (unint64_t)hash
{
  unint64_t featureType;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  int8x16_t v8;
  int8x16_t v10;
  int8x16_t v11;

  featureType = self->_featureType;
  v4 = -[NSString hash](self->_value, "hash");
  v5 = -[NSString hash](self->_classificationLabel, "hash");
  v6 = -[NSString hash](self->_caption, "hash");
  v10 = (int8x16_t)vcvtq_u64_f64((float64x2_t)self->_frame.origin);
  v11 = (int8x16_t)vcvtq_u64_f64((float64x2_t)self->_frame.size);
  v7 = -[NSString hash](self->_mediaAnalysisImageCaption, "hash");
  v8 = veorq_s8(v10, v11);
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v8.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)) ^ v7 ^ v6 ^ v5 ^ v4 ^ featureType;
}

+ (id)filterFeatureList:(id)a3 basedOnSceneClassIdsForFeature:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E20];
  v7 = a3;
  objc_msgSend(v6, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__AXMVisionFeature_filterFeatureList_basedOnSceneClassIdsForFeature___block_invoke;
  v14[3] = &unk_1E625F130;
  v15 = v5;
  v9 = v8;
  v16 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

void __69__AXMVisionFeature_filterFeatureList_basedOnSceneClassIdsForFeature___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "detectorSceneClassIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sceneClassId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (BOOL)isMediaAnalysisProminentObject
{
  return self->_isMediaAnalysisProminentObject;
}

- (BOOL)isMediaAnalysisSignificantEventClassification
{
  return self->_isMediaAnalysisSignificantEventClassification;
}

- (NSArray)recognizedTextFeatures
{
  return self->_recognizedTextFeatures;
}

- (NSArray)values
{
  return self->_values;
}

- (int64_t)uiClass
{
  return self->_uiClass;
}

- (void)setUiClass:(int64_t)a3
{
  self->_uiClass = a3;
}

- (CGRect)unpaddedDetectedFaceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_unpaddedDetectedFaceRect.origin.x;
  y = self->_unpaddedDetectedFaceRect.origin.y;
  width = self->_unpaddedDetectedFaceRect.size.width;
  height = self->_unpaddedDetectedFaceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (AXMVisionFeatureAestheticsResult)aestheticsResult
{
  return self->_aestheticsResult;
}

- (CMDeviceMotion)deviceMotion
{
  return self->_deviceMotion;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (int64_t)cameraType
{
  return self->_cameraType;
}

- (NSSecureCoding)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
  objc_storeStrong((id *)&self->_userContext, a3);
}

- (BOOL)captionMayContainSensitiveContent
{
  return self->_captionMayContainSensitiveContent;
}

- (void)setCaptionMayContainSensitiveContent:(BOOL)a3
{
  self->_captionMayContainSensitiveContent = a3;
}

- (CGPoint)activationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_activationPoint.x;
  y = self->_activationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setActivationPoint:(CGPoint)a3
{
  self->_activationPoint = a3;
}

- (NSDictionary)debugRectangles
{
  return self->_debugRectangles;
}

- (void)setDebugRectangles:(id)a3
{
  objc_storeStrong((id *)&self->_debugRectangles, a3);
}

- (NSString)overrideLabel
{
  return self->_overrideLabel;
}

- (void)setOverrideLabel:(id)a3
{
  objc_storeStrong((id *)&self->_overrideLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideLabel, 0);
  objc_storeStrong((id *)&self->_debugRectangles, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_deviceMotion, 0);
  objc_storeStrong((id *)&self->_aestheticsResult, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisFaceDetectionResult, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisTranslatedImageCaption, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisImageCaption, 0);
  objc_storeStrong((id *)&self->_sceneClassId, 0);
  objc_storeStrong((id *)&self->_detectorSceneClassIds, 0);
  objc_storeStrong((id *)&self->_featureGates, 0);
  objc_storeStrong((id *)&self->_translatedCaption, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_classificationLocalizedValue, 0);
  objc_storeStrong((id *)&self->_classificationLabel, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_faceDetectionResult, 0);
  objc_storeStrong((id *)&self->_assetMetadata, 0);
  objc_storeStrong((id *)&self->_colorInfo, 0);
  objc_storeStrong((id *)&self->_recognizedTextFeatures, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_effectiveTextDetectionLocales, 0);
  objc_storeStrong((id *)&self->_barcodeType, 0);
  objc_storeStrong((id *)&self->_subfeatures, 0);
}

+ (id)unitTestingFeatureWithType:(unint64_t)a3 canvasSize:(CGSize)a4 frame:(CGRect)a5 value:(id)a6 barcodeType:(id)a7 ocrFeatureType:(int64_t)a8 subFeatures:(id)a9
{
  return (id)objc_msgSend(a1, "unitTestingFeatureWithType:canvasSize:frame:value:valueIsSpeakable:barcodeType:ocrFeatureType:subFeatures:", a3, a6, 0, a7, a8, a9, a4.width, a4.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

+ (id)unitTestingTeatureWithType:(unint64_t)a3 axElementRect:(CGRect)a4 confidence:(double)a5 uiClass:(int64_t)a6 label:(id)a7 canvasSize:(CGSize)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat v12;
  CGFloat v13;
  CGFloat y;
  CGFloat x;
  id v17;
  _QWORD *v18;
  void *v19;

  height = a8.height;
  width = a8.width;
  v12 = a4.size.height;
  v13 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a7;
  v18 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v18[1] = a3;
  *((CGFloat *)v18 + 42) = width;
  *((CGFloat *)v18 + 43) = height;
  *((CGFloat *)v18 + 7) = x;
  *((CGFloat *)v18 + 8) = y;
  *((CGFloat *)v18 + 9) = v13;
  *((CGFloat *)v18 + 10) = v12;
  v19 = (void *)v18[15];
  v18[15] = v17;

  *((double *)v18 + 23) = a5;
  v18[58] = a6;
  return v18;
}

+ (id)unitTestingFeatureWithType:(unint64_t)a3 canvasSize:(CGSize)a4 frame:(CGRect)a5 value:(id)a6 valueIsSpeakable:(BOOL)a7 barcodeType:(id)a8 ocrFeatureType:(int64_t)a9 subFeatures:(id)a10
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v18;
  CGFloat v19;
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v18 = a4.height;
  v19 = a4.width;
  v21 = a6;
  v22 = a8;
  v23 = a10;
  v24 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v24[1] = a3;
  *((CGFloat *)v24 + 42) = v19;
  *((CGFloat *)v24 + 43) = v18;
  *((CGFloat *)v24 + 7) = x;
  *((CGFloat *)v24 + 8) = y;
  *((CGFloat *)v24 + 9) = width;
  *((CGFloat *)v24 + 10) = height;
  v25 = (void *)v24[15];
  v24[15] = v21;
  v26 = v21;

  *((_BYTE *)v24 + 136) = a7;
  v27 = (void *)v24[3];
  v24[3] = v22;
  v28 = v22;

  v24[4] = a9;
  v29 = (void *)v24[2];
  v24[2] = v23;

  return v24;
}

+ (id)unitTestingFeature
{
  char *v2;
  int64x2_t v3;

  v2 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v3 = vdupq_n_s64(0x406F400000000000uLL);
  *((_QWORD *)v2 + 1) = 0;
  *((int64x2_t *)v2 + 21) = v3;
  *((_QWORD *)v2 + 7) = 0;
  *((_QWORD *)v2 + 8) = 0;
  *(int64x2_t *)(v2 + 72) = v3;
  return v2;
}

+ (id)unitTestingFaceFeature
{
  return (id)objc_msgSend(a1, "unitTestingFaceFeatureWithSize:faceFrame:", 250.0, 250.0, 0.0, 0.0, 250.0, 250.0);
}

+ (id)unitTestingProminentObjectFeature
{
  char *v2;
  int64x2_t v3;
  int64x2_t v4;

  v2 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  *((_QWORD *)v2 + 1) = 19;
  *((int64x2_t *)v2 + 21) = vdupq_n_s64(0x406F400000000000uLL);
  v3 = vdupq_n_s64(0x3FA47AE147AE147BuLL);
  *(int64x2_t *)(v2 + 56) = v3;
  v4 = vdupq_n_s64(0x3FBEB851EB851EB8uLL);
  *(int64x2_t *)(v2 + 72) = v4;
  *(int64x2_t *)(v2 + 88) = v3;
  *(int64x2_t *)(v2 + 104) = v4;
  return v2;
}

+ (id)unitTestingFaceFeatureWithSize:(CGSize)a3 faceFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  _QWORD *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  AXMVisionFeatureFaceDetectionResult *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.height;
  v9 = a3.width;
  v10 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v10[1] = 5;
  *((double *)v10 + 42) = v9;
  *((double *)v10 + 43) = v8;
  v11 = x / v9;
  v12 = y / v8;
  v13 = width / v9;
  v14 = height / v8;
  v15 = objc_alloc_init(AXMVisionFeatureFaceDetectionResult);
  *((double *)v10 + 7) = v11;
  *((double *)v10 + 8) = v12;
  *((double *)v10 + 9) = v13;
  *((double *)v10 + 10) = v14;
  *((double *)v10 + 11) = v11;
  *((double *)v10 + 12) = v12;
  *((double *)v10 + 13) = v13;
  *((double *)v10 + 14) = v14;
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E6288D38, CFSTR("Smile"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E6288D48, CFSTR("Disgust"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E6288D58, CFSTR("Surprise"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E6288D68, CFSTR("Scream"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E6288D78, CFSTR("Neutral"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E6288D48, CFSTR("Suspicious"));
  -[AXMVisionFeatureFaceDetectionResult setExpressionsAndConfidence:](v15, "setExpressionsAndConfidence:", v16);
  +[AXMVisionFeatureFaceLandmarks unitTestingFaceLandmarksIs3D:](AXMVisionFeatureFaceLandmarks, "unitTestingFaceLandmarksIs3D:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionFeatureFaceDetectionResult setLandmarks:](v15, "setLandmarks:", v17);

  +[AXMVisionFeatureFaceLandmarks unitTestingFaceLandmarksIs3D:](AXMVisionFeatureFaceLandmarks, "unitTestingFaceLandmarksIs3D:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionFeatureFaceDetectionResult setLandmarks3d:](v15, "setLandmarks3d:", v18);

  +[AXMVisionFeatureFaceAttributes unitTestingFaceAttributesForAge:gender:eyes:smiling:facialHair:hairColor:baldness:glasses:eyeMakeup:lipMakeup:faceMask:ethnicity:expression:facialHairV2:hairType:headGear:pose:skinTone:excludeOptions:](AXMVisionFeatureFaceAttributes, "unitTestingFaceAttributesForAge:gender:eyes:smiling:facialHair:hairColor:baldness:glasses:eyeMakeup:lipMakeup:faceMask:ethnicity:expression:facialHairV2:hairType:headGear:pose:skinTone:excludeOptions:", 3, 1, 0, 0, 0, 3, 1, 1, 0, 0, 2, 5, 5, 3, 2, 0,
    2,
    3,
    1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionFeatureFaceDetectionResult setAttributes:](v15, "setAttributes:", v19);

  -[AXMVisionFeatureFaceDetectionResult setName:](v15, "setName:", CFSTR("Alex"));
  v20 = (void *)v10[32];
  v10[32] = v15;

  return v10;
}

+ (id)unitTestingHorizonFeature
{
  char *v2;
  int64x2_t v3;

  v2 = -[AXMVisionFeature _init]([AXMVisionFeature alloc], "_init");
  v3 = vdupq_n_s64(0x406F400000000000uLL);
  *((_QWORD *)v2 + 1) = 3;
  *((int64x2_t *)v2 + 21) = v3;
  *((_QWORD *)v2 + 7) = 0;
  *((_QWORD *)v2 + 8) = 0;
  *(int64x2_t *)(v2 + 72) = v3;
  *((_DWORD *)v2 + 62) = 1056964608;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(v2 + 200) = _Q0;
  *(_OWORD *)(v2 + 216) = _Q0;
  *(_OWORD *)(v2 + 232) = _Q0;
  return v2;
}

+ (void)featureWithMetadata:interfaceOrientation:isMirrored:canvasSize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Error: unhandled AVMetadataObject %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_serializeWithCoder:orDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_serializeWithCoder:orDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Failed to archive text recognition data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_serializeWithCoder:orDictionary:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Failed to archive subfeature data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
