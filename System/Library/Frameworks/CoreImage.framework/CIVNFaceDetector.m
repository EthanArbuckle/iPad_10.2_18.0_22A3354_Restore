@implementation CIVNFaceDetector

- (CIVNFaceDetector)initWithContext:(id)a3 options:(id)a4
{
  CIContext *v4;
  CIVNFaceDetector *v5;
  CIContext *v6;
  objc_super v8;

  v4 = (CIContext *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CIVNFaceDetector;
  v5 = -[CIDetector init](&v8, sel_init, a3, a4);
  if (v5)
  {
    if (!v4)
      v4 = +[CIContext _singletonContext](CIContext, "_singletonContext");
    v5->context = v4;
    v6 = v4;
  }
  return v5;
}

- (id)featuresInImage:(id)a3 options:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int8x16_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float32x2_t v23;
  int32x2_t v24;
  void *v25;
  float v26;
  float v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  _QWORD *v34;
  void *v35;
  BOOL v36;
  float v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  void *v46;
  BOOL v47;
  float v48;
  CIFaceFeature *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  CIFaceFeature *v68;
  int v69;
  id v70;
  uint64_t v72;
  uint64_t v73;
  id obj;
  double v75;
  double v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  unsigned int v80;
  double v82;
  void *v83;
  BOOL v84;
  double v85;
  float v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t i;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  float v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[2];
  void (*v107)(uint64_t);
  void *v108;
  uint64_t *v109;
  CIVNFaceDetector *v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  int v114;
  _QWORD v115[5];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _QWORD v119[4];
  _QWORD v120[4];
  uint8_t buf[8];
  uint8_t *v122;
  uint64_t v123;
  void (*v124)(uint64_t, uint64_t);
  void (*v125)(uint64_t);
  uint64_t v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v111 = 0;
  v112 = &v111;
  v113 = 0x2020000000;
  v114 = 0;
  v6 = ci_signpost_log_detector();
  if ((unint64_t)&self->super.super.isa + 1 >= 2)
  {
    v7 = v6;
    if (os_signpost_enabled(v6))
    {
      v8 = *((_DWORD *)v112 + 6);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v8;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v7, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "CIVNFaceDetector", "count:%d", buf, 8u);
    }
  }
  v106[0] = MEMORY[0x1E0C809B0];
  v106[1] = 3221225472;
  v107 = __44__CIVNFaceDetector_featuresInImage_options___block_invoke;
  v108 = &unk_1E2EC36F0;
  v110 = self;
  v109 = &v111;
  if (a4)
  {
    v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorAccuracy")), "isEqual:", CFSTR("CIDetectorAccuracyLow"));
    if (objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorSmile")))
      v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorSmile")), "BOOLValue");
    else
      v10 = 0;
    if (objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorEyeBlink")))
      v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorEyeBlink")), "BOOLValue");
    else
      v13 = 0;
    if (objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorImageOrientation")))
      v80 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorImageOrientation")), "intValue");
    else
      v80 = 1;
    v11 = (id)objc_msgSend(a4, "mutableCopy");
    v12 = v10 | v13;
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = 0;
    v9 = 0;
    v80 = 1;
  }
  v14 = MEMORY[0x1E0C9AAB0];
  v120[0] = MEMORY[0x1E0C9AAB0];
  v119[0] = CFSTR("kCIVNDetectOptionRequestLandmarks");
  v119[1] = CFSTR("kCIVNDetectOptionRequestAttributes");
  v120[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v120[2] = v14;
  v119[2] = CFSTR("kCIVNDetectOptionRequestPose");
  v119[3] = CFSTR("kCIVNDetectOptionRequestFast");
  v120[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  objc_msgSend(v11, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, v119, 4));
  obj = (id)CIVNDetectFaces((uint64_t)a3, v80, (uint64_t)self->context, v11);

  if (!obj)
  {
    v70 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_65;
  }
  v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v118, 16);
  if (!v79)
    goto LABEL_63;
  v77 = *(_QWORD *)v103;
  do
  {
    for (i = 0; i != v79; ++i)
    {
      if (*(_QWORD *)v103 != v77)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
      v16 = (void *)CIVNDenormalizedLandmarks(a3, v80, v15);
      v88 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("allPoints"));
      v17 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("leftEye"));
      v89 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("outerLips"));
      v90 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("rightEye"));
      v101 = 0;
      v100 = 0.0;
      objc_msgSend(v15, "pose");
      v22 = *(double *)v18.i64;
      v87 = v16;
      if (*(float *)v18.i32 != 1.0
        || (v23.i32[1] = v18.i32[1],
            v23.i32[0] = vextq_s8(v18, v18, 8uLL).u32[0],
            v24 = vceqz_f32(v23),
            (v24.i8[4] & 1) == 0)
        || (v24.i8[0] & 1) == 0)
      {
        v75 = v21;
        v76 = v20;
        v82 = v19;
        v85 = v22;
        *(_QWORD *)buf = 0;
        v122 = buf;
        v123 = 0x3052000000;
        v124 = __Block_byref_object_copy__18;
        v125 = __Block_byref_object_dispose__18;
        v25 = (void *)getVNFaceObservationClass_softClass;
        v126 = getVNFaceObservationClass_softClass;
        if (!getVNFaceObservationClass_softClass)
        {
          v115[0] = MEMORY[0x1E0C809B0];
          v115[1] = 3221225472;
          v115[2] = __getVNFaceObservationClass_block_invoke;
          v115[3] = &unk_1E2EC2EB8;
          v115[4] = buf;
          __getVNFaceObservationClass_block_invoke((uint64_t)v115);
          v25 = (void *)*((_QWORD *)v122 + 5);
        }
        _Block_object_dispose(buf, 8);
        if (objc_msgSend(v25, "computeYawPitchRollFromPoseMatrix:outputYaw:outputPitch:outputRoll:", (char *)&v101 + 4, &v101, &v100, v85, v82, v76, v75))
        {
          v26 = v100;
LABEL_31:
          v27 = v26 * -57.296;
          goto LABEL_33;
        }
      }
      if (objc_msgSend(v15, "roll"))
      {
        objc_msgSend((id)objc_msgSend(v15, "roll"), "floatValue");
        goto LABEL_31;
      }
      v27 = 0.0;
LABEL_33:
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v28 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "faceAttributes"), "smilingCategory"), "allLabelsWithConfidences");
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v96, v117, 16);
      if (v29)
      {
        v83 = v17;
        v30 = *(_QWORD *)v97;
        while (2)
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v97 != v30)
              objc_enumerationMutation(v28);
            v32 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * j);
            v33 = (void *)objc_msgSend(v32, "identifier");
            *(_QWORD *)buf = 0;
            v122 = buf;
            v123 = 0x2020000000;
            v34 = (_QWORD *)getVNFaceAttributeSmilingSymbolLoc_ptr;
            v124 = (void (*)(uint64_t, uint64_t))getVNFaceAttributeSmilingSymbolLoc_ptr;
            if (!getVNFaceAttributeSmilingSymbolLoc_ptr)
            {
              v35 = (void *)VisionLibrary_1();
              v34 = dlsym(v35, "VNFaceAttributeSmiling");
              *((_QWORD *)v122 + 3) = v34;
              getVNFaceAttributeSmilingSymbolLoc_ptr = (uint64_t)v34;
            }
            _Block_object_dispose(buf, 8);
            if (!v34)
            {
              objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getVNFaceAttributeSmiling(void)"), CFSTR("CIVision.h"), 64, CFSTR("%s"), dlerror());
              goto LABEL_68;
            }
            if (objc_msgSend(v33, "isEqualToString:", *v34))
            {
              objc_msgSend(v32, "confidence");
              v17 = v83;
              v36 = v37 > 0.5;
              goto LABEL_47;
            }
          }
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v96, v117, 16);
          if (v29)
            continue;
          break;
        }
        v36 = 0;
        v17 = v83;
      }
      else
      {
        v36 = 0;
      }
LABEL_47:
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v38 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "faceAttributes"), "eyesCategory"), "allLabelsWithConfidences");
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v92, v116, 16);
      v86 = v27;
      if (v39)
      {
        v84 = v36;
        v40 = v17;
        v41 = *(_QWORD *)v93;
LABEL_49:
        v42 = 0;
        while (1)
        {
          if (*(_QWORD *)v93 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v42);
          v44 = (void *)objc_msgSend(v43, "identifier");
          *(_QWORD *)buf = 0;
          v122 = buf;
          v123 = 0x2020000000;
          v45 = (_QWORD *)getVNFaceAttributeEyesClosedSymbolLoc_ptr;
          v124 = (void (*)(uint64_t, uint64_t))getVNFaceAttributeEyesClosedSymbolLoc_ptr;
          if (!getVNFaceAttributeEyesClosedSymbolLoc_ptr)
          {
            v46 = (void *)VisionLibrary_1();
            v45 = dlsym(v46, "VNFaceAttributeEyesClosed");
            *((_QWORD *)v122 + 3) = v45;
            getVNFaceAttributeEyesClosedSymbolLoc_ptr = (uint64_t)v45;
          }
          _Block_object_dispose(buf, 8);
          if (!v45)
          {
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getVNFaceAttributeEyesClosed(void)"), CFSTR("CIVision.h"), 67, CFSTR("%s"), dlerror());
LABEL_68:
            __break(1u);
          }
          if (objc_msgSend(v44, "isEqualToString:", *v45))
            break;
          if (v39 == ++v42)
          {
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v92, v116, 16);
            if (!v39)
            {
              v47 = 0;
              v17 = v40;
              v36 = v84;
              goto LABEL_61;
            }
            goto LABEL_49;
          }
        }
        objc_msgSend(v43, "confidence");
        v36 = v84;
        v17 = v40;
        v47 = v48 > 0.5;
      }
      else
      {
        v47 = 0;
      }
LABEL_61:
      v49 = [CIFaceFeature alloc];
      v50 = CIVNBoundingRect(v88);
      v52 = v51;
      v54 = v53;
      v56 = v55;
      v57 = objc_msgSend(v17, "count");
      v58 = CIVNAverage(v17);
      v60 = v59;
      v61 = objc_msgSend(v90, "count");
      v62 = CIVNAverage(v90);
      v64 = v63;
      v65 = objc_msgSend(v89, "count");
      v66 = CIVNAverage(v89);
      BYTE6(v73) = v47;
      BYTE5(v73) = v47;
      BYTE4(v73) = v36;
      LODWORD(v73) = 0;
      BYTE4(v72) = 0;
      *(float *)&v72 = v86;
      v68 = -[CIFaceFeature initWithBounds:hasLeftEyePosition:leftEyePosition:hasRightEyePosition:rightEyePosition:hasMouthPosition:mouthPosition:hasFaceAngle:faceAngle:hasTrackingID:trackingID:hasTrackingFrameCount:trackingFrameCount:hasSmile:leftEyeClosed:rightEyeClosed:landmarks:](v49, "initWithBounds:hasLeftEyePosition:leftEyePosition:hasRightEyePosition:rightEyePosition:hasMouthPosition:mouthPosition:hasFaceAngle:faceAngle:hasTrackingID:trackingID:hasTrackingFrameCount:trackingFrameCount:hasSmile:leftEyeClosed:rightEyeClosed:landmarks:", v57 != 0, v61 != 0, v65 != 0, 1, 0, 0, v50, v52, v54, v56, v58, v60, v62, v64, *(_QWORD *)&v66,
              v67,
              v72,
              v73,
              v87);
      objc_msgSend(v78, "addObject:", v68);

    }
    v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v118, 16);
  }
  while (v79);
LABEL_63:
  v69 = objc_msgSend(v78, "count");
  *((_DWORD *)v112 + 6) = v69;
  v70 = v78;
LABEL_65:
  v107((uint64_t)v106);
  _Block_object_dispose(&v111, 8);
  return v70;
}

void __44__CIVNFaceDetector_featuresInImage_options___block_invoke(uint64_t a1)
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
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v4, OS_SIGNPOST_INTERVAL_END, v3, "CIVNFaceDetector", "count:%d", (uint8_t *)v6, 8u);
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  self->context = 0;
  v3.receiver = self;
  v3.super_class = (Class)CIVNFaceDetector;
  -[CIVNFaceDetector dealloc](&v3, sel_dealloc);
}

- (CIContext)context
{
  return (CIContext *)objc_getProperty(self, a2, 8, 1);
}

@end
