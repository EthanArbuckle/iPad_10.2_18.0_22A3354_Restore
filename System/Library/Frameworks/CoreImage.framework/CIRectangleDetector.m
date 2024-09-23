@implementation CIRectangleDetector

- (CIRectangleDetector)initWithContext:(id)a3 options:(id)a4
{
  CIRectangleDetector *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CIRectangleDetector;
  v6 = -[CIDetector init](&v15, sel_init);
  if (v6)
  {
    if (!a3)
      a3 = +[CIContext _singletonContext](CIContext, "_singletonContext");
    -[CIRectangleDetector setContext:](v6, "setContext:", a3);
    v6->featureOptions = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorAccuracy"));
    if (objc_msgSend(v7, "isEqual:", CFSTR("CIDetectorAccuracyHigh")))
    {
      -[NSMutableDictionary setObject:forKey:](v6->featureOptions, "setObject:forKey:", CFSTR("CIDetectorAccuracyHigh"), CFSTR("CIDetectorAccuracy"));
    }
    else if (v7 && (objc_msgSend(v7, "isEqual:", CFSTR("CIDetectorAccuracyLow")) & 1) == 0)
    {
      NSLog(CFSTR("Unknown CIDetectorAccuracy specified. Ignoring."));
    }
    v8 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorMinFeatureSize"));
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "floatValue");
      if (v10 >= 0.2 && (objc_msgSend(v9, "floatValue"), v11 <= 1.0))
        -[NSMutableDictionary setObject:forKey:](v6->featureOptions, "setObject:forKey:", v9, CFSTR("CIDetectorMinFeatureSize"));
      else
        NSLog(CFSTR("Invalid CIDetectorMinFeatureSize specified. Ignoring."));
    }
    v12 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorMaxFeatureCount"));
    if (v12)
    {
      v13 = v12;
      if ((int)objc_msgSend(v12, "intValue") <= 0)
        NSLog(CFSTR("Invalid optionMaxCount specified. Ignoring."));
      else
        -[NSMutableDictionary setObject:forKey:](v6->featureOptions, "setObject:forKey:", v13, CFSTR("CIDetectorMaxFeatureCount"));
    }
  }
  return v6;
}

- (void)releaseResources
{
  NSMutableDictionary *featureOptions;

  -[CIRectangleDetector setContext:](self, "setContext:", 0);
  featureOptions = self->featureOptions;
  if (featureOptions)

}

- (void)dealloc
{
  objc_super v3;

  -[CIRectangleDetector releaseResources](self, "releaseResources");
  v3.receiver = self;
  v3.super_class = (Class)CIRectangleDetector;
  -[CIRectangleDetector dealloc](&v3, sel_dealloc);
}

- (id)featuresInImage:(id)a3
{
  return -[CIRectangleDetector featuresInImage:options:](self, "featuresInImage:options:", a3, 0);
}

- (id)featuresInImage:(id)a3 options:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSObject *v13;
  objc_class *v14;
  id v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  int v23;
  double v24;
  double v25;
  float v26;
  double v27;
  void *v28;
  CIContext *context;
  _QWORD *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
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
  double b;
  double a;
  __int128 v54;
  __int128 v55;
  CIRectangleFeature *v56;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGAffineTransform v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  _QWORD v70[2];
  void (*v71)(uint64_t);
  void *v72;
  CIRectangleDetector *v73;
  uint64_t v74;
  uint64_t v75;
  Class (*v76)(uint64_t);
  void *v77;
  CGAffineTransform *p_buf;
  CGAffineTransform buf;
  _BYTE v80[128];
  _QWORD v81[3];
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v81[1] = *MEMORY[0x1E0C80C00];
  v7 = ci_signpost_log_detector();
  if ((unint64_t)&self->super.super.isa + 1 >= 2)
  {
    v13 = v7;
    if (os_signpost_enabled(v7))
    {
      LOWORD(buf.a) = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v13, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "CIRectangleDetector", (const char *)&unk_192520C83, (uint8_t *)&buf, 2u);
    }
  }
  v8 = MEMORY[0x1E0C809B0];
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v71 = __47__CIRectangleDetector_featuresInImage_options___block_invoke;
  v72 = &__block_descriptor_40_e5_v8__0l;
  v73 = self;
  if (a3)
  {
    objc_msgSend(a3, "extent");
    x = v82.origin.x;
    y = v82.origin.y;
    width = v82.size.width;
    height = v82.size.height;
    if (CGRectIsEmpty(v82))
    {
LABEL_58:
      a3 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_59;
    }
    v83.origin.x = x;
    v83.origin.y = y;
    v83.size.width = width;
    v83.size.height = height;
    if (CGRectIsInfinite(v83))
    {
      NSLog(CFSTR("Cannot find features in an infinite image."));
      goto LABEL_58;
    }
    v69 = 0;
    buf.a = 0.0;
    *(_QWORD *)&buf.b = &buf;
    *(_QWORD *)&buf.c = 0x3052000000;
    *(_QWORD *)&buf.d = __Block_byref_object_copy__15;
    *(_QWORD *)&buf.tx = __Block_byref_object_dispose__15;
    v14 = (objc_class *)getVNDetectRectanglesRequestClass(void)::softClass;
    *(_QWORD *)&buf.ty = getVNDetectRectanglesRequestClass(void)::softClass;
    if (!getVNDetectRectanglesRequestClass(void)::softClass)
    {
      v74 = v8;
      v75 = 3221225472;
      v76 = ___ZL33getVNDetectRectanglesRequestClassv_block_invoke;
      v77 = &unk_1E2EC2EB8;
      p_buf = &buf;
      ___ZL33getVNDetectRectanglesRequestClassv_block_invoke((uint64_t)&v74);
      v14 = *(objc_class **)(*(_QWORD *)&buf.b + 40);
    }
    _Block_object_dispose(&buf, 8);
    v15 = objc_alloc_init(v14);
    if (!v15)
    {
      NSLog(CFSTR("Unable to create a VNDetectRectanglesRequest."));
      goto LABEL_58;
    }
    v16 = (__CFString *)objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorAccuracy"));
    if (!v16)
    {
      v17 = -[NSMutableDictionary objectForKey:](self->featureOptions, "objectForKey:", CFSTR("CIDetectorAccuracy"));
      if (v17)
        v16 = (__CFString *)v17;
      else
        v16 = CFSTR("CIDetectorAccuracyHigh");
    }
    v18 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorMinFeatureSize"));
    if (!v18)
      v18 = (void *)-[NSMutableDictionary objectForKey:](self->featureOptions, "objectForKey:", CFSTR("CIDetectorMinFeatureSize"));
    v19 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorMaxFeatureCount"));
    if (!v19)
      v19 = (void *)-[NSMutableDictionary objectForKey:](self->featureOptions, "objectForKey:", CFSTR("CIDetectorMaxFeatureCount"));
    v20 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorAspectRatio"));
    if (!v20)
      v20 = (void *)-[NSMutableDictionary objectForKey:](self->featureOptions, "objectForKey:", CFSTR("CIDetectorAspectRatio"));
    LODWORD(v21) = 0.5;
    objc_msgSend(v15, "setMinimumConfidence:", v21);
    LODWORD(v22) = 15.0;
    objc_msgSend(v15, "setQuadratureTolerance:", v22);
    if (v19)
      v23 = objc_msgSend(v19, "intValue");
    else
      v23 = 1;
    objc_msgSend(v15, "setMaximumObservations:", v23);
    if (v18)
      objc_msgSend(v18, "floatValue");
    else
      LODWORD(v24) = 1045220557;
    objc_msgSend(v15, "setMinimumSize:", v24);
    if (v20)
    {
      objc_msgSend(v20, "floatValue");
      if (*(float *)&v25 <= 1.0)
        v26 = *(float *)&v25;
      else
        v26 = 1.0 / *(float *)&v25;
      *(float *)&v25 = v26 * 0.93;
      if ((float)(v26 * 0.93) < 0.0)
        *(float *)&v25 = 0.0;
      objc_msgSend(v15, "setMinimumAspectRatio:", v25);
      *(float *)&v27 = v26 * 1.07;
      if ((float)(v26 * 1.07) > 1.0)
        *(float *)&v27 = 1.0;
      objc_msgSend(v15, "setMaximumAspectRatio:", v27);
    }
    v28 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    if (-[CIRectangleDetector context](self, "context"))
    {
      context = self->context;
      buf.a = 0.0;
      *(_QWORD *)&buf.b = &buf;
      *(_QWORD *)&buf.c = 0x2020000000;
      v30 = (_QWORD *)getVNImageOptionCIContextSymbolLoc(void)::ptr;
      *(_QWORD *)&buf.d = getVNImageOptionCIContextSymbolLoc(void)::ptr;
      if (!getVNImageOptionCIContextSymbolLoc(void)::ptr)
      {
        v31 = (void *)VisionLibrary();
        v30 = dlsym(v31, "VNImageOptionCIContext");
        *(_QWORD *)(*(_QWORD *)&buf.b + 24) = v30;
        getVNImageOptionCIContextSymbolLoc(void)::ptr = (uint64_t)v30;
      }
      _Block_object_dispose(&buf, 8);
      if (!v30)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getVNImageOptionCIContext()"), CFSTR("CIVision.h"), 61, CFSTR("%s"), dlerror());
        __break(1u);
      }
      objc_msgSend(v28, "setObject:forKey:", context, *v30);
    }
    if ((-[__CFString isEqual:](v16, "isEqual:", CFSTR("CIDetectorAccuracyHigh")) & 1) == 0)
      objc_msgSend(v28, "setObject:forKey:", CFSTR("VNRequestOptionDetectionLevel_Fast"), CFSTR("VNRequestOptionDetectionLevel"));
    buf.a = 0.0;
    *(_QWORD *)&buf.b = &buf;
    *(_QWORD *)&buf.c = 0x3052000000;
    *(_QWORD *)&buf.d = __Block_byref_object_copy__15;
    *(_QWORD *)&buf.tx = __Block_byref_object_dispose__15;
    v32 = (objc_class *)getVNImageRequestHandlerClass(void)::softClass;
    *(_QWORD *)&buf.ty = getVNImageRequestHandlerClass(void)::softClass;
    if (!getVNImageRequestHandlerClass(void)::softClass)
    {
      v74 = v8;
      v75 = 3221225472;
      v76 = ___ZL29getVNImageRequestHandlerClassv_block_invoke_0;
      v77 = &unk_1E2EC2EB8;
      p_buf = &buf;
      ___ZL29getVNImageRequestHandlerClassv_block_invoke_0((uint64_t)&v74);
      v32 = *(objc_class **)(*(_QWORD *)&buf.b + 40);
    }
    _Block_object_dispose(&buf, 8);
    v33 = (void *)objc_msgSend([v32 alloc], "initWithCIImage:options:", a3, v28);
    v34 = v33;
    v81[0] = v15;
    if ((objc_msgSend(v33, "performRequests:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1), &v69) & 1) == 0)goto LABEL_58;
    v35 = (void *)objc_msgSend(v15, "results");
    if (!objc_msgSend(v35, "count"))
      goto LABEL_58;
    a3 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v66;
      v58 = height;
      v59 = width;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v66 != v37)
            objc_enumerationMutation(v35);
          v39 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          objc_msgSend(v39, "topLeft");
          v41 = v40;
          v43 = v42;
          objc_msgSend(v39, "topRight");
          v45 = v44;
          v47 = v46;
          objc_msgSend(v39, "bottomLeft");
          v62 = v49;
          v63 = v48;
          objc_msgSend(v39, "bottomRight");
          v60 = v51;
          v61 = v50;
          memset(&buf, 0, sizeof(buf));
          CGAffineTransformMakeScale(&buf, width, height);
          a = buf.a;
          b = buf.b;
          v54 = *(_OWORD *)&buf.c;
          v55 = *(_OWORD *)&buf.tx;
          objc_msgSend(v39, "boundingBox");
          v64 = buf;
          v85 = CGRectApplyAffineTransform(v84, &v64);
          v56 = -[CIRectangleFeature initWithBounds:topLeft:topRight:bottomLeft:bottomRight:]([CIRectangleFeature alloc], "initWithBounds:topLeft:topRight:bottomLeft:bottomRight:", v85.origin.x, v85.origin.y, v85.size.width, v85.size.height, *(double *)&v55 + v43 * *(double *)&v54 + a * v41, *((double *)&v55 + 1) + v43 * *((double *)&v54 + 1) + b * v41, *(double *)&v55 + v47 * *(double *)&v54 + a * v45, *((double *)&v55 + 1) + v47 * *((double *)&v54 + 1) + b * v45, *(double *)&v55 + v62 * *(double *)&v54 + a * v63, *((double *)&v55 + 1) + v62 * *((double *)&v54 + 1) + b * v63, *(double *)&v55 + v60 * *(double *)&v54 + a * v61, *((double *)&v55 + 1) + v60 * *((double *)&v54 + 1) + b * v61);
          if (v56)
          {
            objc_msgSend(a3, "addObject:", v56);

          }
          height = v58;
          width = v59;
        }
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
      }
      while (v36);
    }
  }
LABEL_59:
  v71((uint64_t)v70);
  return a3;
}

void __47__CIRectangleDetector_featuresInImage_options___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = ci_signpost_log_detector();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v2;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v4, OS_SIGNPOST_INTERVAL_END, v3, "CIRectangleDetector", (const char *)&unk_192520C83, v5, 2u);
    }
  }
}

- (CIContext)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
