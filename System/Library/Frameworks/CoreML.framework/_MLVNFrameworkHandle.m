@implementation _MLVNFrameworkHandle

- (_MLVNFrameworkHandle)init
{
  _MLVNFrameworkHandle *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  Class VNImageBufferClass;
  void *scenePrintsFromPixelBuffersImpl;
  void *detectionPrintsFromPixelBuffersImpl;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_MLVNFrameworkHandle;
  v2 = -[_MLVNFrameworkHandle init](&v10, sel_init);
  if (v2)
  {
    v3 = dlopen("/System/Library/Frameworks/Vision.framework/Vision", 4);
    if (v3)
    {
      v4 = v3;
      v2->_scenePrintsFromPixelBuffersImpl = dlsym(v3, "VNScenePrintsFromPixelBuffers");
      v2->_scenePrintsFromPixelBuffersUsesCPUOnlyImpl = dlsym(v4, "VNScenePrintsFromPixelBuffersUsesCPUOnly");
      v2->_scenePrintElementCountImpl = dlsym(v4, "VNElementCountForScenePrintRequestRevision");
      v2->_scenePrintLengthImpl = dlsym(v4, "VNLengthInBytesForScenePrintRequestRevision");
      NSClassFromString(CFSTR("VNImageBuffer"));
      v5 = objc_claimAutoreleasedReturnValue();
      VNImageBufferClass = v2->_VNImageBufferClass;
      v2->_VNImageBufferClass = (Class)v5;

      v2->_detectionPrintsFromPixelBuffersImpl = dlsym(v4, "VNDetectionPrintsFromPixelBuffers");
      v2->_detectionPrintsFromPixelBuffersUsesCPUOnlyImpl = dlsym(v4, "VNDetectionPrintsFromPixelBuffersUsesCPUOnly");
      v2->_detectionPrintShapesImpl = dlsym(v4, "VNDetectionPrintShapes");
      v2->_detectionPrintSupportedRevisionsImpl = dlsym(v4, "VNDetectionPrintSupportedRevisions");
    }
    scenePrintsFromPixelBuffersImpl = v2->_scenePrintsFromPixelBuffersImpl;
    if (scenePrintsFromPixelBuffersImpl)
    {
      scenePrintsFromPixelBuffersImpl = v2->_scenePrintsFromPixelBuffersUsesCPUOnlyImpl;
      if (scenePrintsFromPixelBuffersImpl)
      {
        scenePrintsFromPixelBuffersImpl = v2->_scenePrintElementCountImpl;
        if (scenePrintsFromPixelBuffersImpl)
          LOBYTE(scenePrintsFromPixelBuffersImpl) = v2->_scenePrintLengthImpl != 0;
      }
    }
    v2->_validForSceneprint = (char)scenePrintsFromPixelBuffersImpl;
    detectionPrintsFromPixelBuffersImpl = v2->_detectionPrintsFromPixelBuffersImpl;
    if (detectionPrintsFromPixelBuffersImpl)
    {
      detectionPrintsFromPixelBuffersImpl = v2->_detectionPrintsFromPixelBuffersUsesCPUOnlyImpl;
      if (detectionPrintsFromPixelBuffersImpl)
      {
        detectionPrintsFromPixelBuffersImpl = v2->_detectionPrintShapesImpl;
        if (detectionPrintsFromPixelBuffersImpl)
          LOBYTE(detectionPrintsFromPixelBuffersImpl) = v2->_detectionPrintSupportedRevisionsImpl != 0;
      }
    }
    v2->_validForObjectprint = (char)detectionPrintsFromPixelBuffersImpl;
  }
  return v2;
}

- (id)scenePrintsFromPixelBuffers:(__CVBuffer *)a3 version:(unint64_t)a4 augmentationOptions:(id)a5 useCPUOnly:(BOOL)a6 error:(id *)a7
{
  id v12;
  void *v13;
  CFTypeRef cf;

  v12 = a5;
  cf = 0;
  if (a4 == 3737841671)
    a4 = 4294967289;
  else
    a4 = a4;
  if (a6)
  {
LABEL_8:
    v13 = (void *)((uint64_t (*)(__CVBuffer *, unint64_t, id, CFTypeRef *))self->_scenePrintsFromPixelBuffersUsesCPUOnlyImpl)(a3, a4, v12, &cf);
    goto LABEL_9;
  }
  v13 = (void *)((uint64_t (*)(__CVBuffer *, unint64_t, id, CFTypeRef *))self->_scenePrintsFromPixelBuffersImpl)(a3, a4, v12, &cf);
  if (!v13)
  {
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    goto LABEL_8;
  }
LABEL_9:
  if (a7 && cf)
    *a7 = (id)(id)cf;

  return v13;
}

- (unint64_t)elementCountForScenePrintRequestRevision:(unint64_t)a3
{
  if (a3 == 3737841671)
    return 768;
  else
    return ((uint64_t (*)(unint64_t))self->_scenePrintElementCountImpl)(a3);
}

- (unint64_t)lengthInBytesForScenePrintRequestRevision:(unint64_t)a3
{
  return ((uint64_t (*)(unint64_t))self->_scenePrintLengthImpl)(a3);
}

- (__CVBuffer)createPixelBufferFromVNImageBuffer:(id)a3 constraint:(id)a4 cropRect:(CGRect)a5 cropAndScaleOption:(unint64_t)a6 options:(id)a7 error:(id *)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __CVBuffer *v25;
  id v26;
  void *v27;
  id v29;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = objc_msgSend(v17, "pixelsWide");
  v20 = objc_msgSend(v17, "pixelsHigh");
  v21 = objc_msgSend(v17, "pixelFormatType");
  if (width <= 1.0)
  {
    x = x * (double)(unint64_t)objc_msgSend(v16, "width");
    width = width * (double)(unint64_t)objc_msgSend(v16, "width");
    y = y * (double)(unint64_t)objc_msgSend(v16, "height");
    height = height * (double)(unint64_t)objc_msgSend(v16, "height");
  }
  objc_msgSend(v17, "sizeConstraint");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v17, "sizeConstraint");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allowedImageSizeClosestToPixelsWide:pixelsHigh:preferDownScaling:preferInputAspectRatio:", objc_msgSend(v16, "width"), objc_msgSend(v16, "height"), 1, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v24, "pixelsWide");
    v20 = objc_msgSend(v24, "pixelsHigh");

  }
  v29 = 0;
  v25 = (__CVBuffer *)objc_msgSend(v16, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:", v19, v20, v21, a6, v18, &v29, x, y, width, height, 0, 0, 0);
  v26 = v29;
  v27 = v26;
  if (a8 && !v25)
    *a8 = objc_retainAutorelease(v26);

  return v25;
}

- (__CVBuffer)createPixelBufferFromImageAtURL:(id)a3 constraint:(id)a4 cropRect:(CGRect)a5 cropAndScaleOption:(unint64_t)a6 options:(id)a7 error:(id *)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  __CVBuffer *v24;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v17 = a3;
  v18 = a4;
  v19 = a7;
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("VNImageOptionImageOrientation"));
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
    v21 = (void *)v20;
  else
    v21 = &unk_1E3DA2140;
  v22 = (void *)objc_msgSend(objc_alloc(self->_VNImageBufferClass), "initWithURL:orientation:options:", v17, objc_msgSend(v21, "unsignedIntValue"), v19);
  v23 = v22;
  if (v22 && objc_msgSend(v22, "width") && objc_msgSend(v23, "height"))
  {
    v24 = -[_MLVNFrameworkHandle createPixelBufferFromVNImageBuffer:constraint:cropRect:cropAndScaleOption:options:error:](self, "createPixelBufferFromVNImageBuffer:constraint:cropRect:cropAndScaleOption:options:error:", v23, v18, a6, v19, a8, x, y, width, height);
  }
  else if (a8)
  {
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 3, 0, CFSTR("Failed to form pixel buffer from %@"), v17);
    v24 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (__CVBuffer)createPixelBufferFromCGImage:(CGImage *)a3 constraint:(id)a4 cropRect:(CGRect)a5 cropAndScaleOption:(unint64_t)a6 options:(id)a7 error:(id *)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __CVBuffer *v23;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v17 = a4;
  v18 = a7;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("VNImageOptionImageOrientation"));
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
    v20 = (void *)v19;
  else
    v20 = &unk_1E3DA2140;
  v21 = (void *)objc_msgSend(objc_alloc(self->_VNImageBufferClass), "initWithCGImage:orientation:options:", a3, objc_msgSend(v20, "unsignedIntValue"), v18);
  v22 = v21;
  if (v21 && objc_msgSend(v21, "width") && objc_msgSend(v22, "height"))
  {
    v23 = -[_MLVNFrameworkHandle createPixelBufferFromVNImageBuffer:constraint:cropRect:cropAndScaleOption:options:error:](self, "createPixelBufferFromVNImageBuffer:constraint:cropRect:cropAndScaleOption:options:error:", v22, v17, a6, v18, a8, x, y, width, height);
  }
  else if (a8)
  {
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 3, 0, CFSTR("Failed to form pixel buffer from CGImage"));
    v23 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)detectionPrintsFromPixelBuffers:(__CVBuffer *)a3 version:(unint64_t)a4 augmentationOptions:(id)a5 useCPUOnly:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v12;
  void *v13;
  CFTypeRef cf;

  v8 = a6;
  v12 = a5;
  cf = 0;
  if (v8)
  {
LABEL_5:
    v13 = (void *)((uint64_t (*)(__CVBuffer *, unint64_t, id, CFTypeRef *))self->_detectionPrintsFromPixelBuffersUsesCPUOnlyImpl)(a3, a4, v12, &cf);
    goto LABEL_6;
  }
  v13 = (void *)((uint64_t (*)(__CVBuffer *, unint64_t, id, CFTypeRef *))self->_detectionPrintsFromPixelBuffersImpl)(a3, a4, v12, &cf);
  if (!v13)
  {
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    goto LABEL_5;
  }
LABEL_6:
  if (a7 && cf)
    *a7 = (id)(id)cf;

  return v13;
}

- (id)detectionPrintShapes:(unint64_t)a3
{
  return (id)((uint64_t (*)(unint64_t, SEL))self->_detectionPrintShapesImpl)(a3, a2);
}

- (id)detectionPrintSupportedRevisions
{
  return (id)((uint64_t (*)(_MLVNFrameworkHandle *, SEL))self->_detectionPrintSupportedRevisionsImpl)(self, a2);
}

- (BOOL)isValid
{
  return self->_validForObjectprint;
}

- (void)scenePrintsFromPixelBuffersImpl
{
  return self->_scenePrintsFromPixelBuffersImpl;
}

- (void)scenePrintsFromPixelBuffersUsesCPUOnlyImpl
{
  return self->_scenePrintsFromPixelBuffersUsesCPUOnlyImpl;
}

- (void)scenePrintElementCountImpl
{
  return self->_scenePrintElementCountImpl;
}

- (void)scenePrintLengthImpl
{
  return self->_scenePrintLengthImpl;
}

- (Class)VNImageBufferClass
{
  return self->_VNImageBufferClass;
}

- (void)detectionPrintsFromPixelBuffersImpl
{
  return self->_detectionPrintsFromPixelBuffersImpl;
}

- (void)detectionPrintsFromPixelBuffersUsesCPUOnlyImpl
{
  return self->_detectionPrintsFromPixelBuffersUsesCPUOnlyImpl;
}

- (void)detectionPrintShapesImpl
{
  return self->_detectionPrintShapesImpl;
}

- (void)detectionPrintSupportedRevisionsImpl
{
  return self->_detectionPrintSupportedRevisionsImpl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_VNImageBufferClass, 0);
}

+ (id)sharedHandle
{
  if (sharedHandle_onceToken_9012 != -1)
    dispatch_once(&sharedHandle_onceToken_9012, &__block_literal_global_9013);
  return (id)sharedHandle_singleton_9014;
}

+ (id)addOrientation:(unsigned int)a3 toOptions:(id)a4
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v4 = *(_QWORD *)&a3;
  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "addEntriesFromDictionary:", v5);
  v11 = CFSTR("VNImageOptionImageOrientation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v9);

  return v7;
}

@end
