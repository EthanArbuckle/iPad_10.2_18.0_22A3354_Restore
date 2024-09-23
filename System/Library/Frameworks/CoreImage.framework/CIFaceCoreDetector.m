@implementation CIFaceCoreDetector

- (CIFaceCoreDetector)initWithContext:(id)a3 options:(id)a4
{
  CIFaceCoreDetector *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t v14;
  _BOOL4 v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  __int128 v22;
  void *v23;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  VNTrackLegacyFaceCoreObjectRequest *v28;
  id *p_visionTrackingRequest;
  double v30;
  objc_class *v32;
  VNDetectFaceRectanglesRequest *v33;
  __int128 v34;
  objc_super v35;
  uint64_t v36;
  uint64_t v37;
  Class (*v38)(uint64_t);
  void *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  uint64_t v46;

  v35.receiver = self;
  v35.super_class = (Class)CIFaceCoreDetector;
  v6 = -[CIDetector init](&v35, sel_init);
  if (!v6)
    return v6;
  if (!a3)
    a3 = +[CIContext _singletonContext](CIContext, "_singletonContext");
  -[CIFaceCoreDetector setContext:](v6, "setContext:", a3);
  v7 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorAccuracy"));
  v8 = objc_msgSend(v7, "isEqual:", CFSTR("CIDetectorAccuracyLow"));
  v9 = v8;
  if (v7 && (v8 & 1) == 0 && (objc_msgSend(v7, "isEqual:", CFSTR("CIDetectorAccuracyHigh")) & 1) == 0)
    NSLog(CFSTR("Unknown CIDetectorAccuracy specified. Ignoring."));
  v10 = objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorTracking"));
  v6->_tracking = 0;
  v11 = *MEMORY[0x1E0C9AE50];
  v12 = (_QWORD *)MEMORY[0x1E0C9AE40];
  if (v10 == *MEMORY[0x1E0C9AE50])
  {
    v6->_tracking = 1;
  }
  else
  {
    if (v10)
      v13 = v10 == *MEMORY[0x1E0C9AE40];
    else
      v13 = 1;
    if (!v13)
      NSLog(CFSTR("Unknown CIDetectorTracking specified. Ignoring."));
  }
  v14 = objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorBetterEyeLocs"));
  v15 = (v9 & 1) == 0 && !v6->_tracking;
  if (v14 == v11)
    v15 = 1;
  v16 = v14 != *v12 && v15;
  v17 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorMinFeatureSize"));
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "floatValue");
    v20 = v19;
  }
  else
  {
    v20 = 0.15;
  }
  if (v20 <= 0.0 || v20 > 1.0)
  {
    NSLog(CFSTR("Unknown CIDetectorMinFeatureSize specified. Ignoring."));
    v18 = 0;
  }
  v21 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorNumberOfAngles"));
  v23 = v21;
  if (v21)
    objc_msgSend(v21, "floatValue");
  else
    LODWORD(v22) = -1.0;
  v34 = v22;
  if (v23
    && *(float *)&v22 != 1.0
    && (vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v22, 0), (float32x4_t)xmmword_1924948C0), (int8x16_t)xmmword_1924948D0)) & 0xF) == 0&& *(float *)&v22 != 11.0)
  {
    NSLog(CFSTR("Unknown CIDetectorNumberOfAngles specified. Ignoring."));
    v23 = 0;
  }
  if (v6->_tracking)
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x3052000000;
    v44 = __Block_byref_object_copy__6;
    v45 = __Block_byref_object_dispose__6;
    v25 = (void *)getVNFaceObservationClass(void)::softClass;
    v46 = getVNFaceObservationClass(void)::softClass;
    if (!getVNFaceObservationClass(void)::softClass)
    {
      v36 = MEMORY[0x1E0C809B0];
      v37 = 3221225472;
      v38 = ___ZL25getVNFaceObservationClassv_block_invoke;
      v39 = &unk_1E2EC2EB8;
      v40 = &v41;
      ___ZL25getVNFaceObservationClassv_block_invoke((uint64_t)&v36);
      v25 = (void *)v42[5];
    }
    _Block_object_dispose(&v41, 8);
    v26 = objc_msgSend(v25, "faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:", 0, 0, 0, 0, 0.0, 0.0, 1.0, 1.0);
    v41 = 0;
    v42 = &v41;
    v43 = 0x3052000000;
    v44 = __Block_byref_object_copy__6;
    v45 = __Block_byref_object_dispose__6;
    v27 = (objc_class *)getVNTrackLegacyFaceCoreObjectRequestClass(void)::softClass;
    v46 = getVNTrackLegacyFaceCoreObjectRequestClass(void)::softClass;
    if (!getVNTrackLegacyFaceCoreObjectRequestClass(void)::softClass)
    {
      v36 = MEMORY[0x1E0C809B0];
      v37 = 3221225472;
      v38 = ___ZL42getVNTrackLegacyFaceCoreObjectRequestClassv_block_invoke;
      v39 = &unk_1E2EC2EB8;
      v40 = &v41;
      ___ZL42getVNTrackLegacyFaceCoreObjectRequestClassv_block_invoke((uint64_t)&v36);
      v27 = (objc_class *)v42[5];
    }
    _Block_object_dispose(&v41, 8);
    v28 = (VNTrackLegacyFaceCoreObjectRequest *)objc_msgSend([v27 alloc], "initWithDetectedObjectObservation:", v26);
    p_visionTrackingRequest = (id *)&v6->visionTrackingRequest;
    v6->visionTrackingRequest = v28;
    -[VNTrackLegacyFaceCoreObjectRequest setRevision:error:](v28, "setRevision:error:", 3737841664, 0);
    -[VNTrackLegacyFaceCoreObjectRequest setTrackingLevel:](v6->visionTrackingRequest, "setTrackingLevel:", v9);
    if (!v18)
      goto LABEL_46;
  }
  else
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x3052000000;
    v44 = __Block_byref_object_copy__6;
    v45 = __Block_byref_object_dispose__6;
    v32 = (objc_class *)getVNDetectFaceRectanglesRequestClass(void)::softClass;
    v46 = getVNDetectFaceRectanglesRequestClass(void)::softClass;
    if (!getVNDetectFaceRectanglesRequestClass(void)::softClass)
    {
      v36 = MEMORY[0x1E0C809B0];
      v37 = 3221225472;
      v38 = ___ZL37getVNDetectFaceRectanglesRequestClassv_block_invoke;
      v39 = &unk_1E2EC2EB8;
      v40 = &v41;
      ___ZL37getVNDetectFaceRectanglesRequestClassv_block_invoke((uint64_t)&v36);
      v32 = (objc_class *)v42[5];
    }
    _Block_object_dispose(&v41, 8);
    v33 = (VNDetectFaceRectanglesRequest *)objc_alloc_init(v32);
    p_visionTrackingRequest = (id *)&v6->visionRequest;
    v6->visionRequest = v33;
    -[VNDetectFaceRectanglesRequest setRevision:error:](v33, "setRevision:error:", 3737841665, 0);
    -[VNDetectFaceRectanglesRequest setFaceCoreType:](v6->visionRequest, "setFaceCoreType:", v9);
    if (!v18)
      goto LABEL_46;
  }
  *(float *)&v30 = v20;
  objc_msgSend(*p_visionTrackingRequest, "setFaceCoreMinFaceSize:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30, v34));
LABEL_46:
  if (v23)
    objc_msgSend(*p_visionTrackingRequest, "setFaceCoreNumberOfDetectionAngles:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&v34));
  objc_msgSend(*p_visionTrackingRequest, "setFaceCoreEnhanceEyesAndMouthLocalization:", v16, v34);
  objc_msgSend(*p_visionTrackingRequest, "setFaceCoreExtractBlink:", 1);
  objc_msgSend(*p_visionTrackingRequest, "setFaceCoreExtractSmile:", 1);
  return v6;
}

- (void)dealloc
{
  VNDetectFaceRectanglesRequest *visionRequest;
  VNTrackLegacyFaceCoreObjectRequest *visionTrackingRequest;
  objc_super v5;

  -[CIFaceCoreDetector setContext:](self, "setContext:", 0);
  visionRequest = self->visionRequest;
  if (visionRequest)

  visionTrackingRequest = self->visionTrackingRequest;
  if (visionTrackingRequest)

  v5.receiver = self;
  v5.super_class = (Class)CIFaceCoreDetector;
  -[CIFaceCoreDetector dealloc](&v5, sel_dealloc);
}

- (id)featuresInImage:(id)a3 options:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  id *p_visionRequest;
  id v10;
  void *v11;
  CIContext *context;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  NSObject *v19;
  int v20;
  VNTrackLegacyFaceCoreObjectRequest *visionTrackingRequest;
  CIFaceCoreDetector *v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  CIFaceFeature *v38;
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
  __int128 v52;
  double v53;
  double v54;
  VNTrackLegacyFaceCoreObjectRequest *v55;
  uint64_t v56;
  VNTrackLegacyFaceCoreObjectRequest *v57;
  int v58;
  char v59;
  float v60;
  CIFaceFeature *v61;
  int v62;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id obj;
  id v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  __int128 v73;
  double v74;
  double v75;
  double v76;
  double v77;
  __int128 v78;
  double tx;
  double c;
  double ty;
  double d;
  __int128 v83;
  double height;
  double width;
  double y;
  double x;
  CGAffineTransform v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  CGAffineTransform v93;
  uint64_t v94;
  _QWORD v95[2];
  void (*v96)(uint64_t);
  void *v97;
  uint64_t *v98;
  CIFaceCoreDetector *v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  int v103;
  _QWORD v104[5];
  _BYTE v105[128];
  id v106;
  id v107;
  uint8_t buf[8];
  uint8_t *v109;
  uint64_t v110;
  void (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  uint64_t v113;
  uint64_t v114;
  CGRect v115;
  CGRect v116;

  v114 = *MEMORY[0x1E0C80C00];
  v100 = 0;
  v101 = &v100;
  v102 = 0x2020000000;
  v103 = 0;
  v7 = ci_signpost_log_detector();
  if ((unint64_t)&self->super.super.isa + 1 >= 2)
  {
    v19 = v7;
    if (os_signpost_enabled(v7))
    {
      v20 = *((_DWORD *)v101 + 6);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v20;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v19, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "CIFaceCoreDetector", "count:%d", buf, 8u);
    }
  }
  v8 = MEMORY[0x1E0C809B0];
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v96 = __46__CIFaceCoreDetector_featuresInImage_options___block_invoke;
  v97 = &unk_1E2EC36F0;
  v98 = &v100;
  v99 = self;
  p_visionRequest = (id *)&self->visionRequest;
  if (!self->visionRequest && !self->visionTrackingRequest)
  {
    v68 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
    goto LABEL_47;
  }
  v94 = 0;
  v10 = -[CIFaceCoreDetector adjustedImageFromImage:orientation:inverseCTM:](self, "adjustedImageFromImage:orientation:inverseCTM:", a3, objc_msgSend((id)objc_msgSend(a4, "valueForKey:", CFSTR("CIDetectorImageOrientation")), "intValue"), &v93);
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  context = self->context;
  if (context)
  {
    *(_QWORD *)buf = 0;
    v109 = buf;
    v110 = 0x2020000000;
    v13 = (_QWORD *)getVNImageOptionCIContextSymbolLoc(void)::ptr;
    v111 = (void (*)(uint64_t, uint64_t))getVNImageOptionCIContextSymbolLoc(void)::ptr;
    if (!getVNImageOptionCIContextSymbolLoc(void)::ptr)
    {
      v14 = (void *)VisionLibrary();
      v13 = dlsym(v14, "VNImageOptionCIContext");
      *((_QWORD *)v109 + 3) = v13;
      getVNImageOptionCIContextSymbolLoc(void)::ptr = (uint64_t)v13;
    }
    _Block_object_dispose(buf, 8);
    if (!v13)
      goto LABEL_52;
    objc_msgSend(v11, "setObject:forKey:", context, *v13);
  }
  v15 = objc_msgSend((id)objc_msgSend(a4, "valueForKey:", CFSTR("CIDetectorEyeBlink")), "BOOLValue");
  v16 = objc_msgSend((id)objc_msgSend(a4, "valueForKey:", CFSTR("CIDetectorSmile")), "BOOLValue");
  *(_QWORD *)buf = 0;
  v109 = buf;
  v110 = 0x3052000000;
  v111 = __Block_byref_object_copy__6;
  v112 = __Block_byref_object_dispose__6;
  v17 = (objc_class *)getVNImageRequestHandlerClass(void)::softClass;
  v113 = getVNImageRequestHandlerClass(void)::softClass;
  if (!getVNImageRequestHandlerClass(void)::softClass)
  {
    v104[0] = v8;
    v104[1] = 3221225472;
    v104[2] = ___ZL29getVNImageRequestHandlerClassv_block_invoke;
    v104[3] = &unk_1E2EC2EB8;
    v104[4] = buf;
    ___ZL29getVNImageRequestHandlerClassv_block_invoke((uint64_t)v104);
    v17 = (objc_class *)*((_QWORD *)v109 + 5);
  }
  _Block_object_dispose(buf, 8);
  v18 = (void *)objc_msgSend([v17 alloc], "initWithCIImage:options:", v10, v11);
  if (*p_visionRequest)
  {
    objc_msgSend(*p_visionRequest, "setFaceCoreExtractBlink:", v15);
    objc_msgSend(*p_visionRequest, "setFaceCoreExtractSmile:", v16);
    v107 = *p_visionRequest;
    objc_msgSend(v18, "performRequests:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1), &v94);
  }
  else
  {
    p_visionRequest = (id *)&self->visionTrackingRequest;
    visionTrackingRequest = self->visionTrackingRequest;
    if (!visionTrackingRequest)
      goto LABEL_18;
    -[VNTrackLegacyFaceCoreObjectRequest setFaceCoreExtractBlink:](visionTrackingRequest, "setFaceCoreExtractBlink:", v15);
    objc_msgSend(*p_visionRequest, "setFaceCoreExtractSmile:", v16);
    v106 = *p_visionRequest;
    objc_msgSend(v18, "performRequests:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1), &v94);
  }
  if (!v94)
  {
    obj = (id)objc_msgSend(*p_visionRequest, "results");
    goto LABEL_20;
  }
LABEL_18:
  obj = 0;
LABEL_20:
  v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66 = v18;
  v22 = self;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v105, 16);
  if (v23)
  {
    v69 = *(_QWORD *)v90;
    do
    {
      v70 = v23;
      for (i = 0; i != v70; ++i)
      {
        if (*(_QWORD *)v90 != v69)
          objc_enumerationMutation(obj);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i), "legacyFaceCore");
        v26 = (void *)objc_msgSend(v25, "features");
        *(_QWORD *)buf = 0;
        v109 = buf;
        v110 = 0x2020000000;
        v27 = (_QWORD *)getVNFaceLegacyFaceCoreFeature_SmileScoreSymbolLoc(void)::ptr;
        v111 = (void (*)(uint64_t, uint64_t))getVNFaceLegacyFaceCoreFeature_SmileScoreSymbolLoc(void)::ptr;
        if (!getVNFaceLegacyFaceCoreFeature_SmileScoreSymbolLoc(void)::ptr)
        {
          v28 = (void *)VisionLibrary();
          v27 = dlsym(v28, "VNFaceLegacyFaceCoreFeature_SmileScore");
          *((_QWORD *)v109 + 3) = v27;
          getVNFaceLegacyFaceCoreFeature_SmileScoreSymbolLoc(void)::ptr = (uint64_t)v27;
        }
        _Block_object_dispose(buf, 8);
        if (!v27)
        {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getVNFaceLegacyFaceCoreFeature_SmileScore()"), CFSTR("CIVision.h"), 76, CFSTR("%s"), dlerror());
          goto LABEL_51;
        }
        v29 = (void *)objc_msgSend(v26, "valueForKey:", *v27);
        v30 = (void *)objc_msgSend(v25, "features");
        *(_QWORD *)buf = 0;
        v109 = buf;
        v110 = 0x2020000000;
        v31 = (_QWORD *)getVNFaceLegacyFaceCoreFeature_LeftEyeClosedScoreSymbolLoc(void)::ptr;
        v111 = (void (*)(uint64_t, uint64_t))getVNFaceLegacyFaceCoreFeature_LeftEyeClosedScoreSymbolLoc(void)::ptr;
        if (!getVNFaceLegacyFaceCoreFeature_LeftEyeClosedScoreSymbolLoc(void)::ptr)
        {
          v32 = (void *)VisionLibrary();
          v31 = dlsym(v32, "VNFaceLegacyFaceCoreFeature_LeftEyeClosedScore");
          *((_QWORD *)v109 + 3) = v31;
          getVNFaceLegacyFaceCoreFeature_LeftEyeClosedScoreSymbolLoc(void)::ptr = (uint64_t)v31;
        }
        _Block_object_dispose(buf, 8);
        if (!v31)
        {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getVNFaceLegacyFaceCoreFeature_LeftEyeClosedScore()"), CFSTR("CIVision.h"), 70, CFSTR("%s"), dlerror());
          goto LABEL_51;
        }
        v33 = (void *)objc_msgSend(v30, "valueForKey:", *v31);
        v34 = (void *)objc_msgSend(v25, "features");
        *(_QWORD *)buf = 0;
        v109 = buf;
        v110 = 0x2020000000;
        v35 = (_QWORD *)getVNFaceLegacyFaceCoreFeature_RightEyeClosedScoreSymbolLoc(void)::ptr;
        v111 = (void (*)(uint64_t, uint64_t))getVNFaceLegacyFaceCoreFeature_RightEyeClosedScoreSymbolLoc(void)::ptr;
        if (!getVNFaceLegacyFaceCoreFeature_RightEyeClosedScoreSymbolLoc(void)::ptr)
        {
          v36 = (void *)VisionLibrary();
          v35 = dlsym(v36, "VNFaceLegacyFaceCoreFeature_RightEyeClosedScore");
          *((_QWORD *)v109 + 3) = v35;
          getVNFaceLegacyFaceCoreFeature_RightEyeClosedScoreSymbolLoc(void)::ptr = (uint64_t)v35;
        }
        _Block_object_dispose(buf, 8);
        if (!v35)
        {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getVNFaceLegacyFaceCoreFeature_RightEyeClosedScore()"), CFSTR("CIVision.h"), 73, CFSTR("%s"), dlerror());
          while (1)
          {
LABEL_51:
            __break(1u);
LABEL_52:
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getVNImageOptionCIContext()"), CFSTR("CIVision.h"), 61, CFSTR("%s"), dlerror());
          }
        }
        v37 = (void *)objc_msgSend(v34, "valueForKey:", *v35);
        v38 = [CIFaceFeature alloc];
        objc_msgSend(v25, "faceBoundingBox");
        v88 = v93;
        v116 = CGRectApplyAffineTransform(v115, &v88);
        y = v116.origin.y;
        x = v116.origin.x;
        height = v116.size.height;
        width = v116.size.width;
        objc_msgSend(v25, "leftEye");
        v40 = v39;
        v42 = v41;
        v83 = *(_OWORD *)&v93.a;
        tx = v93.tx;
        c = v93.c;
        ty = v93.ty;
        d = v93.d;
        objc_msgSend(v25, "rightEye");
        v44 = v43;
        v46 = v45;
        v78 = *(_OWORD *)&v93.a;
        v74 = v93.tx;
        v75 = v93.c;
        v76 = v93.ty;
        v77 = v93.d;
        objc_msgSend(v25, "mouth");
        v48 = v47;
        v50 = v49;
        v51 = v93.c;
        v73 = *(_OWORD *)&v93.a;
        v52 = *(_OWORD *)&v93.tx;
        v71 = v93.ty;
        v72 = v93.d;
        objc_msgSend(v25, "faceAngle");
        v54 = v53;
        v55 = v22->visionTrackingRequest;
        v56 = objc_msgSend(v25, "trackID");
        v57 = v22->visionTrackingRequest;
        v58 = objc_msgSend(v25, "trackDuration");
        if (v29)
          LOBYTE(v29) = objc_msgSend(v29, "BOOLValue");
        if (v33)
          LOBYTE(v33) = objc_msgSend(v33, "BOOLValue");
        if (v37)
          v59 = objc_msgSend(v37, "BOOLValue");
        else
          v59 = 0;
        BYTE6(v65) = v59;
        BYTE5(v65) = (_BYTE)v33;
        BYTE4(v65) = (_BYTE)v29;
        LODWORD(v65) = v58;
        BYTE4(v64) = v57 != 0;
        v60 = v54;
        *(float *)&v64 = v60;
        v61 = -[CIFaceFeature initWithBounds:hasLeftEyePosition:leftEyePosition:hasRightEyePosition:rightEyePosition:hasMouthPosition:mouthPosition:hasFaceAngle:faceAngle:hasTrackingID:trackingID:hasTrackingFrameCount:trackingFrameCount:hasSmile:leftEyeClosed:rightEyeClosed:landmarks:](v38, "initWithBounds:hasLeftEyePosition:leftEyePosition:hasRightEyePosition:rightEyePosition:hasMouthPosition:mouthPosition:hasFaceAngle:faceAngle:hasTrackingID:trackingID:hasTrackingFrameCount:trackingFrameCount:hasSmile:leftEyeClosed:rightEyeClosed:landmarks:", 1, 1, 1, 1, v55 != 0, v56, x, y, width, height, tx + v42 * c + *(double *)&v83 * v40, ty + v42 * d + *((double *)&v83 + 1) * v40, v74 + v46 * v75 + *(double *)&v78 * v44, v76 + v46 * v77 + *((double *)&v78 + 1) * v44, *(double *)&v52 + v50 * v51 + *(double *)&v73 * v48,
                v71 + v50 * v72 + *((double *)&v73 + 1) * v48,
                v64,
                v65,
                0);
        if (v61)
          objc_msgSend(v68, "addObject:", v61);

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v105, 16);
    }
    while (v23);
  }

  v62 = objc_msgSend(v68, "count");
  *((_DWORD *)v101 + 6) = v62;
LABEL_47:
  v96((uint64_t)v95);
  _Block_object_dispose(&v100, 8);
  return v68;
}

void __46__CIFaceCoreDetector_featuresInImage_options___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = ci_signpost_log_detector();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v2;
    if (os_signpost_enabled(v2))
    {
      v5 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v4, OS_SIGNPOST_INTERVAL_END, v3, "CIFaceCoreDetector", "count:%d", (uint8_t *)v6, 8u);
    }
  }
}

- (id)featuresInImage:(id)a3
{
  return -[CIFaceCoreDetector featuresInImage:options:](self, "featuresInImage:options:", a3, 0);
}

- (CIContext)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (VNDetectFaceRectanglesRequest)visionRequest
{
  return (VNDetectFaceRectanglesRequest *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVisionRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (VNTrackLegacyFaceCoreObjectRequest)visionTrackingRequest
{
  return (VNTrackLegacyFaceCoreObjectRequest *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVisionTrackingRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CGAffineTransform)ctmForImageWithBounds:(SEL)a3 orientation:(CGRect)a4
{
  double v5;
  double v6;
  BOOL v7;
  double v8;
  CGFloat y;
  int v10;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  CGAffineTransform v15;
  CGAffineTransform t1;
  _QWORD v17[11];
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  double v28;
  __int128 v29;
  __int128 v30;
  double v31;
  double v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  double v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = fmax(a4.size.width, a4.size.height);
  t1.b = 0.0;
  t1.c = 0.0;
  v17[0] = 0x3FF0000000000000;
  v17[1] = 0;
  v17[2] = 0;
  v17[3] = 0x3FF0000000000000;
  v17[4] = 0;
  v17[5] = 0;
  v17[6] = 0xBFF0000000000000;
  v17[7] = 0;
  v17[8] = 0;
  v17[9] = 0x3FF0000000000000;
  v6 = 1024.0 / v5;
  v7 = v5 <= 1228.0;
  v8 = 1.0;
  if (!v7)
    v8 = v6;
  *(double *)&v17[10] = a4.size.width * v8;
  v18 = xmmword_1924948E0;
  v19 = 0;
  v20 = 0;
  v21 = 0xBFF0000000000000;
  v22 = a4.size.width * v8;
  v23 = a4.size.height * v8;
  v25 = 0;
  v26 = 0;
  v24 = 0x3FF0000000000000;
  v27 = xmmword_192493540;
  v29 = xmmword_1924948E0;
  v30 = xmmword_192493540;
  v28 = a4.size.height * v8;
  v31 = a4.size.height * v8;
  v32 = a4.size.width * v8;
  v33 = xmmword_1924948E0;
  v35 = 0;
  v36 = 0;
  v34 = 0x3FF0000000000000;
  v37 = a4.size.width * v8;
  v38 = xmmword_1924948F0;
  v41 = 0u;
  v40 = 0u;
  v39 = 0x3FF0000000000000;
  v42 = 0x3FF0000000000000;
  v43 = xmmword_192493540;
  v44 = a4.size.height * v8;
  v45 = 0;
  t1.a = v8;
  t1.d = v8;
  y = a4.origin.y;
  *(int8x16_t *)&t1.tx = vandq_s8((int8x16_t)vmulq_n_f64(vnegq_f64((float64x2_t)a4.origin), v8), (int8x16_t)vcgtq_f64(vabsq_f64((float64x2_t)a4.origin), (float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL)));
  if ((a5 - 9) >= 0xFFFFFFF8)
    v10 = a5 - 1;
  else
    v10 = 0;
  v11 = (__int128 *)&v17[6 * v10];
  v12 = *v11;
  v13 = v11[2];
  *(_OWORD *)&v15.c = v11[1];
  *(_OWORD *)&v15.tx = v13;
  *(_OWORD *)&v15.a = v12;
  return CGAffineTransformConcat(retstr, &t1, &v15);
}

- (id)adjustedImageFromImage:(id)a3 orientation:(int)a4 inverseCTM:(CGAffineTransform *)a5
{
  uint64_t v6;
  id v7;
  __int128 v9;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  memset(&v15, 0, sizeof(v15));
  objc_msgSend(a3, "extent");
  if (self)
    -[CIFaceCoreDetector ctmForImageWithBounds:orientation:](self, "ctmForImageWithBounds:orientation:", v6);
  else
    memset(&v15, 0, sizeof(v15));
  v13 = v15;
  CGAffineTransformInvert(&v14, &v13);
  v9 = *(_OWORD *)&v14.c;
  *(_OWORD *)&a5->a = *(_OWORD *)&v14.a;
  *(_OWORD *)&a5->c = v9;
  *(_OWORD *)&a5->tx = *(_OWORD *)&v14.tx;
  v12 = v15;
  if (!CGAffineTransformIsIdentity(&v12))
  {
    v11 = v15;
    return (id)objc_msgSend(v7, "imageByApplyingTransform:", &v11);
  }
  return v7;
}

- (id)createFaceCoreDataFromCIImage:(id)a3 width:(unint64_t *)a4 height:(unint64_t *)a5
{
  uint64_t v5;
  uint64_t v6;
  id result;
  double v12;
  double v13;
  double v14;
  double v15;
  CGColorSpace *DeviceRGB;
  char *v17;
  char *v18;
  uint64_t v19;
  _BYTE *v20;
  char *v21;
  uint64_t v22;
  _BYTE *v23;
  void *v24;
  CGRect v25;
  CGRect v26;

  result = -[CIFaceCoreDetector context](self, "context");
  if (result)
  {
    objc_msgSend(a3, "extent");
    LODWORD(v5) = vcvtmd_s64_f64(CGRectGetWidth(v25));
    objc_msgSend(a3, "extent");
    LODWORD(v6) = vcvtmd_s64_f64(CGRectGetHeight(v26));
    objc_msgSend(a3, "extent");
    v13 = v12;
    v15 = v14;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v17 = (char *)malloc_type_malloc(4 * (int)v5 * (int)v6, 0xD9115E3AuLL);
    if (v17)
    {
      v18 = v17;
      -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](-[CIFaceCoreDetector context](self, "context"), "render:toBitmap:rowBytes:bounds:format:colorSpace:", a3, v17, 4 * (int)v5, 264, DeviceRGB, v13, v15, (double)(int)v5, (double)(int)v6);
      if ((int)v6 >= 1)
      {
        v19 = 0;
        v20 = v18;
        do
        {
          if ((int)v5 >= 1)
          {
            v21 = &v18[4 * (int)v19 * (int)v5];
            v22 = v5;
            v23 = v20;
            do
            {
              *v23++ = (unsigned __int16)(77 * *v21
                                        + 151 * v21[1]
                                        + 28 * v21[2]) >> 8;
              v21 += 4;
              --v22;
            }
            while (v22);
          }
          ++v19;
          v20 += (int)v5;
        }
        while (v19 != v6);
      }
      v24 = malloc_type_realloc(v18, (int)v6 * (int)v5, 0xA59F83CEuLL);
      CGColorSpaceRelease(DeviceRGB);
      result = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v24, (int)v6 * (int)v5, 1);
      if (a4)
        *a4 = (int)v5;
      if (a5)
        *a5 = (int)v6;
    }
    else
    {
      CGColorSpaceRelease(DeviceRGB);
      return 0;
    }
  }
  return result;
}

@end
