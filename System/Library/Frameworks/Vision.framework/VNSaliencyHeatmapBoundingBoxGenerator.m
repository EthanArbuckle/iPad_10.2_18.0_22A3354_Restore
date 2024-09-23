@implementation VNSaliencyHeatmapBoundingBoxGenerator

+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___VNSaliencyHeatmapBoundingBoxGenerator;
  objc_msgSendSuper2(&v5, sel_recordDefaultConfigurationOptionsInDictionary_, v4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E459E2B8, CFSTR("VNEspressoModelFileBasedDetectorOption_InputBlobNames"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E459E2D0, CFSTR("VNEspressoModelFileBasedDetectorOption_OutputBlobNames"));

}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__VNSaliencyHeatmapBoundingBoxGenerator_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNSaliencyHeatmapBoundingBoxGenerator configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNSaliencyHeatmapBoundingBoxGenerator configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNSaliencyHeatmapBoundingBoxGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return CFSTR("mask");
}

void __78__VNSaliencyHeatmapBoundingBoxGenerator_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNSaliencyHeatmapBoundingBoxGenerator;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "removeObject:", CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));
  objc_msgSend(v2, "removeObject:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNSaliencyHeatmapBoundingBoxGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNSaliencyHeatmapBoundingBoxGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

+ (id)calculateSaliencyBoundingBoxesForDetectorType:(id)a3 pixelBuffer:(__CVBuffer *)a4 configurationOptions:(id)a5 originatingRequestSpecifier:(id)a6 regionOfInterest:(CGRect)a7 qosClass:(unsigned int)a8 warningRecorder:(id)a9 error:(id *)a10
{
  uint64_t v11;
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  VNImageBuffer *v26;
  VNImageBuffer *v27;
  void *v28;
  void *v29;
  _QWORD v31[2];

  v11 = *(_QWORD *)&a8;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v31[1] = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = a5;
  v21 = a6;
  v22 = a9;
  +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", v20, a10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "detectorOfType:configuredWithOptions:error:", v19, v20, a10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = [VNImageBuffer alloc];
        v27 = -[VNImageBuffer initWithCVPixelBuffer:orientation:options:session:](v26, "initWithCVPixelBuffer:orientation:options:session:", a4, 1, MEMORY[0x1E0C9AA70], v24);
        v31[0] = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v28, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

        objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));
        objc_msgSend(v25, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v11, v20, v22, a10, 0, x, y, width, height);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
        goto LABEL_10;
      }
      if (a10)
      {
        +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", v19, CFSTR("detectorType"));
        v29 = 0;
        *a10 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    v29 = 0;
    goto LABEL_9;
  }
  v29 = 0;
LABEL_10:

  return v29;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 1278226534;
}

+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3
{
  return 0;
}

- (id)_observationsForOneComponent32FloatPixelBuffer:(__CVBuffer *)a3 options:(id)a4 regionOfInterest:(CGRect)a5 error:(id *)a6
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  vDSP_Length v18;
  size_t v19;
  size_t BytesPerRow;
  void *v21;
  std::__shared_weak_count *v22;
  const float *BaseAddress;
  unsigned __int8 *v24;
  const float *v25;
  uint64_t v26;
  size_t v27;
  void *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  const __CFString *v32;
  unint64_t *p_shared_owners;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  uint64_t v39;
  uint64_t v40;
  float v41;
  uint64_t v42;
  float v43;
  float v44;
  float v45;
  float v46;
  BOOL v47;
  double v48;
  double v49;
  double v50;
  double v51;
  VNRectangleObservation *v52;
  double v53;
  id v54;
  double v55;
  float v56;
  double v57;
  id v58;
  double v59;
  id v60;
  int v61;
  unsigned __int8 *v62;
  std::__shared_weak_count *v63;
  float *__D;
  std::__shared_weak_count *v65;
  float v66;
  float __C;
  float __B;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a4;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_33;
  v15 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  if ((_DWORD)v15)
  {
    if (a6)
    {
      +[VNError errorForCVReturnCode:localizedDescription:](VNError, "errorForCVReturnCode:localizedDescription:", v15, CFSTR("unable to lock base address of pixelBuffer"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
      v17 = 0;
      *a6 = v16;
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  v79 = 0;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v54 = v13;
  v18 = CVPixelBufferGetWidth(a3);
  v19 = CVPixelBufferGetHeight(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  __C = 1.0;
  __B = 0.0;
  v66 = 255.0;
  v21 = malloc_type_malloc(4 * v18, 0x100004052888210uLL);
  std::shared_ptr<float>::shared_ptr[abi:ne180100]<float,void (*)(void *),void>(&__D, (uint64_t)v21);
  v62 = (unsigned __int8 *)malloc_type_malloc(v19 * v18, 0x100004077774924uLL);
  v22 = (std::__shared_weak_count *)operator new();
  v22->__vftable = (std::__shared_weak_count_vtbl *)&off_1E453C058;
  v22->__shared_owners_ = 0;
  v22->__shared_weak_owners_ = 0;
  v22[1].__vftable = (std::__shared_weak_count_vtbl *)v62;
  v22[1].__shared_owners_ = (uint64_t)MEMORY[0x1E0C834A8];
  v63 = v22;
  BaseAddress = (const float *)CVPixelBufferGetBaseAddress(a3);
  v24 = v62;
  if (v19)
  {
    v25 = BaseAddress;
    v26 = 4 * (BytesPerRow >> 2);
    v27 = v19;
    do
    {
      vDSP_vclip(v25, 1, &__B, &__C, __D, 1, v18);
      vDSP_vsmul(__D, 1, &v66, __D, 1, v18);
      vDSP_vfixru8(__D, 1, v24, 1, v18);
      v24 += v18;
      v25 = (const float *)((char *)v25 + v26);
      --v27;
    }
    while (v27);
  }
  v13 = v54;
  -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources", v54);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "network");
  v29 = espresso_network_bind_buffer();
  if (!(_DWORD)v29)
  {
    objc_msgSend((id)objc_opt_class(), "espressoModelInputImageDimensionsBlobNameForConfigurationOptions:", v13);
    v60 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "network");
    v58 = objc_retainAutorelease(v60);
    objc_msgSend(v58, "UTF8String");
    v31 = espresso_network_bind_input_vimagebuffer_planar8();
    if ((_DWORD)v31)
    {
      if (a6)
      {
        v32 = CFSTR("Model runtime error, Unable to bind input buffer");
LABEL_19:
        +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v31, v32);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(v28, "plan", v31);
      v31 = espresso_plan_execute_sync();
      if (!(_DWORD)v31)
      {
        v30 = 0;
        goto LABEL_21;
      }
      if (a6)
      {
        v32 = CFSTR("error occured when running model");
        goto LABEL_19;
      }
    }
    v30 = 1;
LABEL_21:

    goto LABEL_22;
  }
  if (a6)
  {
    +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v29, CFSTR("Model runtime error, Unable to bind output buffer"));
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v30 = 1;
LABEL_22:

  if (v63)
  {
    p_shared_owners = (unint64_t *)&v63->__shared_owners_;
    do
      v34 = __ldaxr(p_shared_owners);
    while (__stlxr(v34 - 1, p_shared_owners));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
      std::__shared_weak_count::__release_weak(v63);
    }
  }
  v35 = v65;
  if (v65)
  {
    v36 = (unint64_t *)&v65->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  if (v30)
    goto LABEL_33;
  if (*((_QWORD *)&v76 + 1) != 1 && *((_QWORD *)&v76 + 1) != (_QWORD)v77 && (_QWORD)v76 == 1)
  {
    if (a6)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("error occured when running model, unexpected output received"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
LABEL_33:
    v17 = 0;
    goto LABEL_34;
  }
  v57 = y;
  v59 = height;
  v39 = v69;
  if ((_QWORD)v78 == 5)
    v40 = 1;
  else
    v40 = 3;
  if ((_QWORD)v78 == 5)
    v41 = 0.25;
  else
    v41 = 0.3;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v40);
  v42 = v39 + 8;
  v55 = x;
  v56 = v41;
  do
  {
    if (*(float *)(v42 + 8) >= v41)
    {
      v61 = *(_DWORD *)(v42 + 8);
      v43 = *(float *)v42;
      v44 = *(float *)(v42 + 4);
      v46 = *(float *)(v42 - 8);
      v45 = *(float *)(v42 - 4);
      v82.origin.x = 0.0;
      v82.origin.y = 0.0;
      v82.size.width = 1.0;
      v82.size.height = 1.0;
      v80.origin.x = x;
      v80.origin.y = v57;
      v80.size.width = width;
      v80.size.height = v59;
      v47 = CGRectEqualToRect(v80, v82);
      v48 = x + width * v46;
      v49 = v57 + v59 * (float)(1.0 - v44);
      if (v47)
      {
        v48 = v46;
        v49 = (float)(1.0 - v44);
        v50 = (float)(v45 - v46);
      }
      else
      {
        v50 = width * (float)(v45 - v46);
      }
      if (v47)
        v51 = (float)((float)(1.0 - v43) - (float)(1.0 - v44));
      else
        v51 = v59 * (float)((float)(1.0 - v43) - (float)(1.0 - v44));
      v83.origin.x = 0.0;
      v83.origin.y = 0.0;
      v83.size.width = 1.0;
      v83.size.height = 1.0;
      v81 = CGRectIntersection(*(CGRect *)&v48, v83);
      v41 = v56;
      x = v55;
      v52 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:boundingBox:]([VNRectangleObservation alloc], "initWithOriginatingRequestSpecifier:boundingBox:", v14, v81.origin.x, v81.origin.y, v81.size.width, v81.size.height);
      LODWORD(v53) = v61;
      -[VNObservation setConfidence:](v52, "setConfidence:", v53);
      objc_msgSend(v17, "addObject:", v52);

    }
    v42 += 20;
    --v40;
  }
  while (v40);
LABEL_34:

  return v17;
}

- (__CVBuffer)_createPixelBufferOfWidth:(unint64_t)a3 height:(unint64_t)a4 fromImageBuffer:(id)a5 options:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  uint64_t v13;
  __CVBuffer *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  VNImageBuffer *v19;
  void *v21;
  id v22;

  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend((id)objc_opt_class(), "networkRequiredInputImagePixelFormatForConfigurationOptions:", v12);
  v22 = 0;
  v14 = (__CVBuffer *)objc_msgSend(v11, "bufferWithWidth:height:format:options:error:", a3, a4, v13, v12, &v22);
  v15 = v22;
  if (!v14)
  {
    v16 = objc_msgSend(v11, "originalPixelBuffer");
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", v12, a7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v21 = v17;
        v19 = -[VNImageBuffer initWithCIImage:orientation:options:session:]([VNImageBuffer alloc], "initWithCIImage:orientation:options:session:", v17, 1, v12, v18);
        v14 = -[VNImageBuffer bufferWithWidth:height:format:options:error:](v19, "bufferWithWidth:height:format:options:error:", a3, a4, v13, 0, a7);

        v17 = v21;
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
      if (a7)
        *a7 = objc_retainAutorelease(v15);
    }
  }

  return v14;
}

- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  __CVBuffer *v13;
  VNImageBuffer *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  VNWarningRecorder *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)VNSaliencyHeatmapBoundingBoxGenerator;
  if (-[VNDetector warmUpSession:withOptions:error:](&v21, sel_warmUpSession_withOptions_error_, v8, v9, a5))
  {
    v10 = -[VNEspressoModelFileBasedDetector networkRequiredInputImageWidth](self, "networkRequiredInputImageWidth");
    v11 = -[VNEspressoModelFileBasedDetector networkRequiredInputImageHeight](self, "networkRequiredInputImageHeight");
    v12 = objc_msgSend((id)objc_opt_class(), "networkRequiredInputImagePixelFormatForConfigurationOptions:", v9);
    v13 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, 8 * v10, 8 * v11, v12, a5);
    if (v13)
    {
      v14 = -[VNImageBuffer initWithCVPixelBuffer:orientation:options:session:]([VNImageBuffer alloc], "initWithCVPixelBuffer:orientation:options:session:", v13, 1, 0, v8);
      v15 = (void *)objc_msgSend(v9, "mutableCopy");
      v22[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      v17 = qos_class_self();
      v18 = objc_alloc_init(VNWarningRecorder);
      -[VNDetector processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](self, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v17, v15, v18, a5, 0, 0.0, 0.0, 1.0, 1.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      CVPixelBufferRelease(v13);
      LOBYTE(v13) = v19 != 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return (char)v13;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  __CVBuffer *v18;
  BOOL v19;

  v13 = a4;
  v14 = a6;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v13, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = -[VNEspressoModelFileBasedDetector networkRequiredInputImageWidth](self, "networkRequiredInputImageWidth");
    v17 = -[VNEspressoModelFileBasedDetector networkRequiredInputImageHeight](self, "networkRequiredInputImageHeight");
    if (objc_msgSend(v15, "width") < v16 || objc_msgSend(v15, "height") < v17)
      objc_msgSend(v14, "recordWarning:value:", CFSTR("VNRequestWarningImageTooSmall"), MEMORY[0x1E0C9AAB0]);
    v18 = -[VNSaliencyHeatmapBoundingBoxGenerator _createPixelBufferOfWidth:height:fromImageBuffer:options:error:](self, "_createPixelBufferOfWidth:height:fromImageBuffer:options:error:", v16, v17, v15, v13, a8);
    *a7 = v18;
    v19 = v18 != 0;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  -[VNSaliencyHeatmapBoundingBoxGenerator _observationsForOneComponent32FloatPixelBuffer:options:regionOfInterest:error:](self, "_observationsForOneComponent32FloatPixelBuffer:options:regionOfInterest:error:", a4, a5, a8, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
