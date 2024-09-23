@implementation CAMPanoramaProcessor

- (CAMPanoramaProcessor)initWithDelegate:(id)a3 encodingBehavior:(int64_t)a4
{
  id v6;
  CAMPanoramaProcessor *v7;
  CAMPanoramaProcessor *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *initialMetadataByRequestUUID;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  os_log_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  OpaqueFigSampleBufferProcessor **p_processor;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CAMPanoramaProcessor *v30;
  OpaqueFigSampleBufferProcessor *v32;
  void (*v33)(OpaqueFigSampleBufferProcessor *, _QWORD, CAMPanoramaProcessor *);
  uint64_t FigBaseObject;
  void (*v35)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  const __CFNumber *v36;
  uint64_t v37;
  void (*v38)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  const __CFNumber *v39;
  CGFloat v40;
  CAMPanoramaCaptureRequest *request;
  CFTypeRef v42;
  uint64_t v43;
  CFTypeRef cf;
  uint64_t valuePtr;
  objc_super v46;

  v6 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CAMPanoramaProcessor;
  v7 = -[CAMPanoramaProcessor init](&v46, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_photoEncodingBehavior = a4;
    v7->_direction = 1;
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    initialMetadataByRequestUUID = v8->__initialMetadataByRequestUUID;
    v8->__initialMetadataByRequestUUID = v9;

    v11 = (void *)ACT_CopyDefaultConfigurationForPanorama();
    if (v11)
    {
      +[CAMPanoramaUtilities bufferSize](CAMPanoramaUtilities, "bufferSize");
      v13 = v12;
      v15 = v14;
      v16 = (os_log_t)objc_msgSend(v11, "mutableCopy");
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15 * 0.25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v16, "setObject:forKey:", v17, *MEMORY[0x1E0CF12D8]);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13 * 0.25);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v16, "setObject:forKey:", v18, *MEMORY[0x1E0CF12E0]);

      }
      if (a4 == 1)
        -[NSObject setObject:forKey:](v16, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CF1300]);
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "scale");

      +[CAMPanoramaUtilities defaultPreviewSize](CAMPanoramaUtilities, "defaultPreviewSize");
      v20 = *MEMORY[0x1E0C9AE00];
      p_processor = &v8->__processor;
      v22 = ACT_FigSampleBufferProcessorCreateForPanoramaWithOptionsAndPreviewSize();
      if (!(_DWORD)v22)
      {
        v32 = *p_processor;
        if (*p_processor)
        {
          v33 = *(void (**)(OpaqueFigSampleBufferProcessor *, _QWORD, CAMPanoramaProcessor *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
          if (v33)
            v33(v32, __PanoramaProcessorOutputCallback, v8);
          cf = 0;
          valuePtr = 0;
          FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
          v35 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
          if (v35)
          {
            v35(FigBaseObject, *MEMORY[0x1E0CF12E8], v20, &cf);
            v36 = (const __CFNumber *)cf;
          }
          else
          {
            v36 = 0;
          }
          CFNumberGetValue(v36, kCFNumberNSIntegerType, &valuePtr);
          if (cf)
            CFRelease(cf);
          v42 = 0;
          v43 = 0;
          v37 = FigSampleBufferProcessorGetFigBaseObject();
          v38 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
          if (v38)
          {
            v38(v37, *MEMORY[0x1E0CF12C0], v20, &v42);
            v39 = (const __CFNumber *)v42;
          }
          else
          {
            v39 = 0;
          }
          CFNumberGetValue(v39, kCFNumberNSIntegerType, &v43);
          if (v42)
            CFRelease(v42);
          objc_storeWeak((id *)&v8->_delegate, v6);
          v40 = (double)v43;
          v8->_previewSize.width = (double)valuePtr;
          v8->_previewSize.height = v40;
          request = v8->_request;
          v8->_request = 0;

          v8->_capturingPanorama = 0;
          v8->__greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
          v30 = v8;
          goto LABEL_15;
        }
      }
      v23 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[CAMPanoramaProcessor initWithDelegate:encodingBehavior:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);

    }
    else
    {
      v16 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CAMPanoramaProcessor initWithDelegate:encodingBehavior:].cold.1(v16);
    }
    v30 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v30 = 0;
LABEL_16:

  return v30;
}

- (void)dealloc
{
  OpaqueFigSampleBufferProcessor *processor;
  objc_super v4;

  processor = self->__processor;
  if (processor)
    CFRelease(processor);
  ct_green_tea_logger_destroy();
  v4.receiver = self;
  v4.super_class = (Class)CAMPanoramaProcessor;
  -[CAMPanoramaProcessor dealloc](&v4, sel_dealloc);
}

- (void)setDirection:(int64_t)a3
{
  uint64_t v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, uint64_t);

  if (self->_direction != a3)
  {
    self->_direction = a3;
    -[CAMPanoramaProcessor _processor](self, "_processor");
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    v6 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v6)
      v6(FigBaseObject, *MEMORY[0x1E0CF1268], v4);
  }
}

- (void)startPanoramaCaptureWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  if (-[CAMPanoramaProcessor isCapturingPanorama](self, "isCapturingPanorama"))
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "Ignored request to start capturing a new panorama, we are already capturing a panorama!", buf, 2u);
    }
  }
  else
  {
    v6 = objc_msgSend(v4, "photoEncodingBehavior");
    if (v6 == -[CAMPanoramaProcessor photoEncodingBehavior](self, "photoEncodingBehavior"))
    {
      -[CAMPanoramaProcessor _greenTeaLogger](self, "_greenTeaLogger");
      getCTGreenTeaOsLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_INFO, "Take a photo", v11, 2u);
      }

      -[CAMPanoramaProcessor _setRequest:](self, "_setRequest:", v4);
      +[CAMCaptureMetadataUtilities metadataFromPanoramaRequest:](CAMCaptureMetadataUtilities, "metadataFromPanoramaRequest:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      -[CAMPanoramaProcessor _initialMetadataByRequestUUID](self, "_initialMetadataByRequestUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "persistenceUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, v10);

      -[CAMPanoramaProcessor _processor](self, "_processor");
      if (-[CAMPanoramaProcessor photoEncodingBehavior](self, "photoEncodingBehavior") == 1)
        ACT_FigSampleBufferProcessorStartPanoramaCaptureWithMetadata();
      else
        ACT_FigSampleBufferProcessorStartPanoramaCapture();
      -[CAMPanoramaProcessor _setCapturingPanorama:](self, "_setCapturingPanorama:", 1);

    }
    else
    {
      v5 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[CAMPanoramaProcessor startPanoramaCaptureWithRequest:].cold.1((uint64_t)self, v5);
    }
  }

}

- (void)stopPanoramaCapture
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[CAMPanoramaProcessor isCapturingPanorama](self, "isCapturingPanorama"))
  {
    -[CAMPanoramaProcessor _setRequest:](self, "_setRequest:", 0);
    -[CAMPanoramaProcessor _processor](self, "_processor");
    ACT_FigSampleBufferProcessorStopPanoramaCapture();
    -[CAMPanoramaProcessor _setCapturingPanorama:](self, "_setCapturingPanorama:", 0);
  }
  else
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring request to stop capturing a panorama, we are not capturing a panorama!", v4, 2u);
    }

  }
}

- (void)processPanoramaCaptureWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t FigBaseObject;
  void (*v9)(uint64_t, const __CFString *, _QWORD, void **);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __IOSurface *v22;
  void *v23;
  uint64_t v24;
  size_t AllocSize;
  size_t v26;
  __CVBuffer *v27;
  IOSurfaceRef IOSurface;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CAMCaptureCoordinationInfo *v33;
  CAMStillImageCaptureResult *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void (**v40)(_QWORD, _QWORD);
  void *v41;

  v6 = a4;
  objc_msgSend(a3, "persistenceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPanoramaProcessor _processor](self, "_processor");
  v41 = 0;
  FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
  v9 = *(void (**)(uint64_t, const __CFString *, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (v9)
  {
    v9(FigBaseObject, CFSTR("HighResPanorama"), *MEMORY[0x1E0C9AE00], &v41);
    v10 = v41;
  }
  else
  {
    v10 = 0;
  }
  -[CAMPanoramaProcessor _initialMetadataByRequestUUID](self, "_initialMetadataByRequestUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v11;
  objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v7);
  v38 = v12;
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v14 = *MEMORY[0x1E0CBCB50];
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CBCB50]);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    objc_msgSend(v17, "addEntriesFromDictionary:", v15);
    objc_msgSend(v13, "setObject:forKey:", v17, v14);

  }
  v18 = *MEMORY[0x1E0CBC770];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC770]);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v13, "setObject:forKey:", v19, v18);
  v36 = (void *)v19;
  v40 = (void (**)(_QWORD, _QWORD))v6;
  objc_msgSend(v10, "objectForKey:", CFSTR("iOS_Debug"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20 && objc_msgSend(v20, "length"))
    objc_msgSend(v13, "setObject:forKey:", v21, CFSTR("iOS_Debug"));
  v22 = (__IOSurface *)objc_msgSend(v10, "objectForKey:", CFSTR("JPEG"));
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CF1288]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "unsignedLongValue");

  AllocSize = IOSurfaceGetAllocSize(v22);
  if (v24 - 1 >= AllocSize)
    v26 = AllocSize;
  else
    v26 = v24;
  v27 = (__CVBuffer *)objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CF12D0]);
  if (v27)
    IOSurface = CVPixelBufferGetIOSurface(v27);
  else
    IOSurface = 0;
  v37 = (void *)v15;
  if (v22)
  {
    v29 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CAMPanoramaProcessorErrorDomain"), -17500, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setWithObject:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = -[CAMCaptureCoordinationInfo initWithIdentifier:allExpectedResultSpecifiers:resultSpecifiers:]([CAMCaptureCoordinationInfo alloc], "initWithIdentifier:allExpectedResultSpecifiers:resultSpecifiers:", v7, v32, 0);
  LOBYTE(v35) = 0;
  v34 = -[CAMStillImageCaptureResult initWithFullsizeSurface:size:unfilteredPreviewSurface:filteredPreviewSurface:metadata:expectingPairedVideo:shouldPersistAdjustmentSidecar:adjustmentFilters:persistenceUUID:coordinationInfo:error:]([CAMStillImageCaptureResult alloc], "initWithFullsizeSurface:size:unfilteredPreviewSurface:filteredPreviewSurface:metadata:expectingPairedVideo:shouldPersistAdjustmentSidecar:adjustmentFilters:persistenceUUID:coordinationInfo:error:", v22, v26, IOSurface, 0, v13, 0, v35, 0, v7, v33, v29);
  if (v40)
    ((void (**)(_QWORD, CAMStillImageCaptureResult *))v40)[2](v40, v34);

}

- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  OpaqueFigSampleBufferProcessor *v4;
  uint64_t (*v5)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *);
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = -[CAMPanoramaProcessor _processor](self, "_processor");
  v5 = *(uint64_t (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 16);
  if (v5)
  {
    v6 = v5(v4, a3);
    if (!(_DWORD)v6)
      return;
  }
  else
  {
    v6 = 4294954514;
  }
  v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[CAMPanoramaProcessor processSampleBuffer:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

}

- (void)invalidate
{
  uint64_t FigBaseObject;
  uint64_t v3;
  void (*v4)(uint64_t);

  -[CAMPanoramaProcessor _processor](self, "_processor");
  FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
  if (FigBaseObject)
  {
    v3 = FigBaseObject;
    v4 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
    if (v4)
      v4(v3);
  }
}

- (CAMPanoramaProcessorDelegate)delegate
{
  return (CAMPanoramaProcessorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CAMPanoramaCaptureRequest)request
{
  return self->_request;
}

- (void)_setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (int64_t)photoEncodingBehavior
{
  return self->_photoEncodingBehavior;
}

- (CGSize)previewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previewSize.width;
  height = self->_previewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)direction
{
  return self->_direction;
}

- (BOOL)isCapturingPanorama
{
  return self->_capturingPanorama;
}

- (void)_setCapturingPanorama:(BOOL)a3
{
  self->_capturingPanorama = a3;
}

- (NSMutableDictionary)_initialMetadataByRequestUUID
{
  return self->__initialMetadataByRequestUUID;
}

- (OpaqueFigSampleBufferProcessor)_processor
{
  return self->__processor;
}

- (ct_green_tea_logger_s)_greenTeaLogger
{
  return self->__greenTeaLogger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__initialMetadataByRequestUUID, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:(os_log_t)log encodingBehavior:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Unable to retrieve the default panorama configuration from ACT! Cannot continue panorama configuration!", v1, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:(uint64_t)a3 encodingBehavior:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB760000, a2, a3, "Failed to create panorama processor (%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)startPanoramaCaptureWithRequest:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Request specifies a different encoding behavior than processor %{public}@ was configured for, capture cannot proceed", (uint8_t *)&v2, 0xCu);
}

- (void)processSampleBuffer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB760000, a2, a3, "Failed to process panorama sample buffer! (%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

@end
