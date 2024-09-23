@implementation AVCaptureOutput

- (id)sinkID
{
  return self->_outputInternal->sinkID;
}

- (int)changeSeed
{
  return self->_outputInternal->changeSeed;
}

- (AVCaptureConnection)connectionWithMediaType:(AVMediaType)mediaType
{
  NSArray *v4;
  AVCaptureConnection *result;
  AVCaptureConnection *v6;
  uint64_t v7;
  AVCaptureConnection *i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = -[AVCaptureOutput connections](self, "connections");
  result = (AVCaptureConnection *)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; i = (AVCaptureConnection *)((char *)i + 1))
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v10 = (void *)objc_msgSend(v9, "inputPorts", 0);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          while (2)
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14), "mediaType"), "isEqual:", mediaType) & 1) != 0)return (AVCaptureConnection *)v9;
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            if (v12)
              continue;
            break;
          }
        }
      }
      v6 = (AVCaptureConnection *)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      result = 0;
    }
    while (v6);
  }
  return result;
}

- (NSArray)connections
{
  AVCaptureOutputInternal *outputInternal;
  NSArray *v4;

  outputInternal = self->_outputInternal;
  objc_sync_enter(outputInternal);
  v4 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_outputInternal->connections);
  objc_sync_exit(outputInternal);
  return v4;
}

- (BOOL)hasRequiredOutputFormatForConnection:(id)a3
{
  return 0;
}

- (void)performFigCaptureSessionOperationSafelyUsingBlock:(id)a3
{
  NSObject *figCaptureSessionSyncQueue;
  _QWORD v4[6];

  figCaptureSessionSyncQueue = self->_outputInternal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__AVCaptureOutput_performFigCaptureSessionOperationSafelyUsingBlock___block_invoke;
  v4[3] = &unk_1E4216940;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

- (void)bumpChangeSeed
{
  -[AVCaptureOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("changeSeed"));
  ++self->_outputInternal->changeSeed;
  -[AVCaptureOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("changeSeed"));
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  AVCaptureOutputInternal *outputInternal;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a4)
    *a4 = 0;
  -[AVCaptureOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("connections"));
  outputInternal = self->_outputInternal;
  objc_sync_enter(outputInternal);
  if ((-[NSMutableArray containsObject:](self->_outputInternal->connections, "containsObject:", a3) & 1) != 0)
  {
    a3 = 0;
    if (a4)
      *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, 0);
  }
  else
  {
    -[NSMutableArray addObject:](self->_outputInternal->connections, "addObject:", a3);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = (void *)objc_msgSend(a3, "inputPorts", 0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v18;
LABEL_8:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        objc_msgSend(v12, "input");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v9)
            goto LABEL_8;
          goto LABEL_21;
        }
      }
      v13 = (void *)objc_msgSend(v12, "mediaType");
      if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CF2B90]))
      {
        v14 = objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "activeFormat");
      }
      else
      {
        v15 = (void *)objc_msgSend(v12, "mediaType");
        if (!objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CF2B70]))
          goto LABEL_21;
        v14 = objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "activeDepthDataFormat");
      }
      -[AVCaptureOutput updateMetadataTransformForSourceFormat:](self, "updateMetadataTransformForSourceFormat:", v14);
    }
  }
LABEL_21:
  objc_sync_exit(outputInternal);
  -[AVCaptureOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("connections"));
  return a3;
}

- (void)setSession:(id)a3
{
  self->_outputInternal->session = (AVCaptureSession *)a3;
}

- (id)session
{
  return self->_outputInternal->session;
}

+ (id)allOutputSubclasses
{
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = objc_opt_class();
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 11);
}

uint64_t __45__AVCaptureOutput_attachToFigCaptureSession___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_QWORD *)(v1 + 16))
    __45__AVCaptureOutput_attachToFigCaptureSession___block_invoke_cold_1();
  v3 = *(const void **)(a1 + 40);
  *(_QWORD *)(v1 + 16) = v3;
  if (v3)
    CFRetain(v3);
  return objc_msgSend(*(id *)(a1 + 32), "attachSafelyToFigCaptureSession:", *(_QWORD *)(a1 + 40));
}

- (void)updateMetadataTransformForSourceFormat:(id)a3
{
  AVCaptureOutputInternal *outputInternal;
  uint64_t v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  _BOOL4 v11;
  _BOOL4 v12;
  double v13;
  double v14;
  void *v15;
  AVCaptureConnection *v16;
  AVCaptureConnection *v17;
  AVCaptureOutputInternal *v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  AVCaptureOutputInternal *v23;
  _BOOL4 physicallyMirrorsVideo;
  char v25;
  __int128 v26;
  _OWORD v27[3];

  outputInternal = self->_outputInternal;
  objc_sync_enter(outputInternal);
  v6 = objc_msgSend(a3, "sensorDimensions");
  -[AVCaptureOutput outputSizeForSourceFormat:](self, "outputSizeForSourceFormat:", a3);
  v9 = v7;
  v10 = v8;
  v11 = *MEMORY[0x1E0C9D820] == (double)(int)v6;
  v12 = *(double *)(MEMORY[0x1E0C9D820] + 8) == (double)SHIDWORD(v6);
  if (v11 && v12)
    v13 = v7;
  else
    v13 = (double)(int)v6;
  if (v11 && v12)
    v14 = v8;
  else
    v14 = (double)SHIDWORD(v6);
  v15 = (void *)objc_msgSend(a3, "vtScalingMode");
  if (a3)
    v16 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", objc_msgSend(a3, "mediaType"));
  else
    v16 = -[NSArray firstObject](-[AVCaptureOutput connections](self, "connections"), "firstObject");
  v17 = v16;
  self->_outputInternal->physicallyMirrorsVideo = -[AVCaptureOutput appliesMirroringWithPhysicalFlipForConnection:](self, "appliesMirroringWithPhysicalFlipForConnection:", v16);
  v18 = self->_outputInternal;
  v19 = -[AVCaptureConnection sourcesFromFrontFacingCamera](v17, "sourcesFromFrontFacingCamera");
  v20 = -[AVCaptureConnection sourcesFromExternalCamera](v17, "sourcesFromExternalCamera");
  v21 = -[AVCaptureOutput appliesOrientationWithPhysicalRotationForConnection:](self, "appliesOrientationWithPhysicalRotationForConnection:", v17);
  v22 = -[AVCaptureConnection _videoOrientation](v17, "_videoOrientation");
  v23 = self->_outputInternal;
  physicallyMirrorsVideo = v23->physicallyMirrorsVideo;
  v25 = -[AVCaptureConnection isVideoMirrored](v17, "isVideoMirrored");
  AVCaptureVideoTransformForCaptureDevice(v15, v19, v20, v21, v22, (uint64_t *)&v23->rollAdjustment, 0, 0, (uint64_t)v27, v13, v14, v9, v10, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(CGFloat *)(MEMORY[0x1E0C9D648] + 16), *(CGFloat *)(MEMORY[0x1E0C9D648] + 24), physicallyMirrorsVideo, v25);
  v26 = v27[1];
  *(_OWORD *)&v18->metadataTransform.a = v27[0];
  *(_OWORD *)&v18->metadataTransform.c = v26;
  *(_OWORD *)&v18->metadataTransform.tx = v27[2];
  objc_sync_exit(outputInternal);
}

- (CGSize)outputSizeForSourceFormat:(id)a3
{
  const opaqueCMFormatDescription *v3;
  CMVideoDimensions Dimensions;
  double width;
  double height;
  CGSize result;

  v3 = (const opaqueCMFormatDescription *)objc_msgSend(a3, "formatDescription");
  if (v3)
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions(v3);
    width = (double)Dimensions.width;
    height = (double)Dimensions.height;
  }
  else
  {
    width = 0.0;
    height = 0.0;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)appliesOrientationWithPhysicalRotationForConnection:(id)a3
{
  return 0;
}

- (BOOL)appliesMirroringWithPhysicalFlipForConnection:(id)a3
{
  return 0;
}

+ (id)availableVideoCodecTypesForSourceDevice:(id)a3 sourceFormat:(id)a4 outputDimensions:(id)a5 fileType:(id)a6 videoCodecTypesAllowList:(id)a7
{
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  unint64_t v21;
  unint64_t Dimensions;
  double v23;
  double v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  int v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = *MEMORY[0x1E0CF2B08];
  if ((objc_msgSend(a6, "isEqual:", *MEMORY[0x1E0CF2B08]) & 1) == 0
    && (objc_msgSend(a6, "isEqual:", *MEMORY[0x1E0CF2B00]) & 1) == 0
    && (objc_msgSend(a6, "isEqual:", *MEMORY[0x1E0CF2AD0]) & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v13;
  }
  if (a4 || (a4 = (id)objc_msgSend(a3, "activeFormat")) != 0)
  {
    objc_msgSend((id)objc_msgSend(a4, "figCaptureSourceVideoFormat"), "format");
    if (FigCapturePixelFormatIsTenBit() && (FigCapturePixelFormatIs422() & 1) != 0)
    {
      if (objc_msgSend(a3, "isProResSupported"))
      {
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v15 = (void *)objc_msgSend(a1, "supportedProResCodecTypes");
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v34 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              if (!a7 || objc_msgSend(a7, "containsObject:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i)))
                objc_msgSend(v13, "insertObject:atIndex:", v20, 0);
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          }
          while (v17);
        }
      }
      return v13;
    }
    if (!a5.var0 || (v21 = HIDWORD(*(unint64_t *)&a5), !a5.var1))
    {
      Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(a4, "formatDescription"));
      v21 = HIDWORD(Dimensions);
      a5.var0 = Dimensions;
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "videoSupportedFrameRateRanges"), "lastObject"), "maxFrameRate");
    v24 = v23;
    if (a5.var0 >= -15)
      v25 = a5.var0 + 15;
    else
      v25 = a5.var0 + 30;
    if ((int)v21 >= -15)
      v26 = v21 + 15;
    else
      v26 = v21 + 30;
    if (objc_msgSend(a3, "isHEVCSupported") && v24 * (double)((v25 >> 4) * (v26 >> 4)) > 1000000.0)
      goto LABEL_39;
    v27 = *MEMORY[0x1E0CF2C80];
    if (a7 && !objc_msgSend(a7, "containsObject:", *MEMORY[0x1E0CF2C80]))
    {
      if ((objc_msgSend(a6, "isEqual:", v14) & 1) == 0)
        goto LABEL_39;
    }
    else
    {
      objc_msgSend(v13, "addObject:", v27);
      if ((objc_msgSend(a6, "isEqual:", v14) & 1) == 0)
        goto LABEL_39;
      if (!a7)
      {
        v28 = *MEMORY[0x1E0CF2C90];
LABEL_38:
        objc_msgSend(v13, "addObject:", v28);
LABEL_39:
        if (objc_msgSend(a3, "isHEVCSupported"))
        {
          v29 = (uint64_t *)MEMORY[0x1E0CF2C88];
          if (!a7 || objc_msgSend(a7, "containsObject:", *MEMORY[0x1E0CF2C88]))
          {
            v30 = objc_msgSend(a3, "isHEVCPreferred");
            v31 = *v29;
            if (v30)
              objc_msgSend(v13, "insertObject:atIndex:", v31, 0);
            else
              objc_msgSend(v13, "addObject:", v31);
          }
        }
        objc_msgSend(a3, "isProResSupported");
        return v13;
      }
    }
    v28 = *MEMORY[0x1E0CF2C90];
    if (!objc_msgSend(a7, "containsObject:", *MEMORY[0x1E0CF2C90]))
      goto LABEL_39;
    goto LABEL_38;
  }
  return v13;
}

- (void)performBlockOnSessionNotifyingThread:(id)a3
{
  __CFRunLoop *Main;
  uint64_t FigRunLoopMode;
  uint64_t v6;
  __CFRunLoop *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(-[AVCaptureOutput session](self, "session"), "notifiesOnMainThread"))
  {
    Main = CFRunLoopGetMain();
    FigRunLoopMode = AVCaptureGetFigRunLoopMode();
    v6 = *MEMORY[0x1E0C9B270];
    v8[0] = FigRunLoopMode;
    v8[1] = v6;
    CFRunLoopPerformBlock(Main, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2), a3);
    v7 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v7);
  }
  else
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

uint64_t __69__AVCaptureOutput_performFigCaptureSessionOperationSafelyUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16));
}

- (void)attachToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  NSObject *figCaptureSessionSyncQueue;
  _QWORD v4[6];

  figCaptureSessionSyncQueue = self->_outputInternal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__AVCaptureOutput_attachToFigCaptureSession___block_invoke;
  v4[3] = &unk_1E4216650;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

+ (id)supportedProResCodecTypes
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CF2C70];
  v5[0] = *MEMORY[0x1E0CF2C78];
  v5[1] = v2;
  v3 = *MEMORY[0x1E0CF2C68];
  v5[2] = *MEMORY[0x1E0CF2C60];
  v5[3] = v3;
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
}

- (id)initSubclass
{
  AVCaptureOutput *v2;
  AVCaptureOutputInternal *v3;
  void *v4;
  objc_class *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCaptureOutput;
  v2 = -[AVCaptureOutput init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureOutputInternal);
    v2->_outputInternal = v3;
    if (!v3)
    {

      v2 = 0;
    }
    if (AVCaptureSessionIsLaunchPrewarmingEnabled())
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = (objc_class *)objc_opt_class();
      v6 = (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@>"), NSStringFromClass(v5));
    }
    else
    {
      v6 = AVIdentifierForObject((uint64_t)v2);
    }
    -[AVCaptureOutput setSinkID:](v2, "setSinkID:", v6);
  }
  return v2;
}

- (void)setSinkID:(id)a3
{

  self->_outputInternal->sinkID = (NSString *)objc_msgSend(a3, "copy");
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureOutput;
  -[AVCaptureOutput dealloc](&v3, sel_dealloc);
}

- (void)detachFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  NSObject *figCaptureSessionSyncQueue;
  _QWORD v4[6];

  figCaptureSessionSyncQueue = self->_outputInternal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__AVCaptureOutput_detachFromFigCaptureSession___block_invoke;
  v4[3] = &unk_1E4216650;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

uint64_t __47__AVCaptureOutput_detachFromFigCaptureSession___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + 32;
  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(const void **)(v4 + 8);
  if (v3 != *(const void **)(v2[1] + 16))
    __47__AVCaptureOutput_detachFromFigCaptureSession___block_invoke_cold_1();
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16) = 0;
    v2 = *(_QWORD **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v5 = 0;
  }
  return objc_msgSend(v2, "detachSafelyFromFigCaptureSession:", v5);
}

- (void)handleServerConnectionDeathForFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  NSObject *figCaptureSessionSyncQueue;
  _QWORD v4[6];

  figCaptureSessionSyncQueue = self->_outputInternal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__AVCaptureOutput_handleServerConnectionDeathForFigCaptureSession___block_invoke;
  v4[3] = &unk_1E4216650;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

uint64_t __67__AVCaptureOutput_handleServerConnectionDeathForFigCaptureSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safelyHandleServerConnectionDeathForFigCaptureSession:", *(_QWORD *)(a1 + 40));
}

- (unsigned)requiredOutputFormatForConnection:(id)a3
{
  if (!-[AVCaptureOutput hasRequiredOutputFormatForConnection:](self, "hasRequiredOutputFormatForConnection:", a3))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("requiredOutputFormatForConnection: failed since this output has no required output format for that connection."), 0));
  return 0;
}

- (id)connectionMediaTypes
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  return 1;
}

- (id)_inputForConnection:(id)a3
{
  id result;
  _OWORD v4[4];
  _BYTE v5[128];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, sizeof(v4));
  result = (id)objc_msgSend((id)objc_msgSend(a3, "inputPorts", 0), "countByEnumeratingWithState:objects:count:", v4, v5, 16);
  if (result)
    return (id)objc_msgSend(**((id **)&v4[0] + 1), "input");
  return result;
}

- (AVMetadataObject)transformedMetadataObjectForMetadataObject:(AVMetadataObject *)metadataObject connection:(AVCaptureConnection *)connection
{
  id v7;
  id v8;
  AVCaptureOutputInternal *outputInternal;
  AVCaptureOutputInternal *v10;
  __int128 v11;
  _BOOL4 v12;
  AVCaptureOutputInternal *v13;
  _BOOL8 v14;
  void *v15;
  double rollAdjustment;
  _OWORD v18[3];
  __int128 v19;
  __int128 v20;
  __int128 v21;

  if (!-[NSArray containsObject:](-[AVCaptureOutput connections](self, "connections"), "containsObject:", connection))
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v15);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v15);
    return 0;
  }
  v7 = -[AVMetadataObject input](metadataObject, "input");
  if (v7 != -[AVCaptureOutput _inputForConnection:](self, "_inputForConnection:", connection))
    return 0;
  v8 = -[AVMetadataObject originalMetadataObject](metadataObject, "originalMetadataObject");
  outputInternal = self->_outputInternal;
  objc_sync_enter(outputInternal);
  v10 = self->_outputInternal;
  v11 = *(_OWORD *)&v10->metadataTransform.c;
  v19 = *(_OWORD *)&v10->metadataTransform.a;
  v20 = v11;
  v21 = *(_OWORD *)&v10->metadataTransform.tx;
  v12 = -[AVCaptureConnection isVideoMirrored](connection, "isVideoMirrored");
  v13 = self->_outputInternal;
  v14 = v12 && v13->physicallyMirrorsVideo;
  rollAdjustment = v13->rollAdjustment;
  objc_sync_exit(outputInternal);
  v18[0] = v19;
  v18[1] = v20;
  v18[2] = v21;
  return (AVMetadataObject *)+[AVMetadataObject derivedMetadataObjectFromMetadataObject:withTransform:isVideoMirrored:rollAdjustment:](AVMetadataObject, "derivedMetadataObjectFromMetadataObject:withTransform:isVideoMirrored:rollAdjustment:", v8, v18, v14, rollAdjustment);
}

- (CGRect)metadataOutputRectOfInterestForRect:(CGRect)rectInOutputCoordinates
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  AVCaptureOutputInternal *outputInternal;
  AVCaptureOutputInternal *v9;
  __int128 v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGRect v13;

  height = rectInOutputCoordinates.size.height;
  width = rectInOutputCoordinates.size.width;
  y = rectInOutputCoordinates.origin.y;
  x = rectInOutputCoordinates.origin.x;
  outputInternal = self->_outputInternal;
  objc_sync_enter(outputInternal);
  v9 = self->_outputInternal;
  v10 = *(_OWORD *)&v9->metadataTransform.c;
  *(_OWORD *)&v12.a = *(_OWORD *)&v9->metadataTransform.a;
  *(_OWORD *)&v12.c = v10;
  *(_OWORD *)&v12.tx = *(_OWORD *)&v9->metadataTransform.tx;
  objc_sync_exit(outputInternal);
  v11 = v12;
  CGAffineTransformInvert(&v12, &v11);
  v11 = v12;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  return CGRectApplyAffineTransform(v13, &v11);
}

- (CGRect)rectForMetadataOutputRectOfInterest:(CGRect)rectInMetadataOutputCoordinates
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  AVCaptureOutputInternal *outputInternal;
  AVCaptureOutputInternal *v9;
  __int128 v10;
  CGAffineTransform v11;
  CGRect v12;

  height = rectInMetadataOutputCoordinates.size.height;
  width = rectInMetadataOutputCoordinates.size.width;
  y = rectInMetadataOutputCoordinates.origin.y;
  x = rectInMetadataOutputCoordinates.origin.x;
  outputInternal = self->_outputInternal;
  objc_sync_enter(outputInternal);
  v9 = self->_outputInternal;
  v10 = *(_OWORD *)&v9->metadataTransform.c;
  *(_OWORD *)&v11.a = *(_OWORD *)&v9->metadataTransform.a;
  *(_OWORD *)&v11.c = v10;
  *(_OWORD *)&v11.tx = *(_OWORD *)&v9->metadataTransform.tx;
  objc_sync_exit(outputInternal);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  return CGRectApplyAffineTransform(v12, &v11);
}

- (void)removeConnection:(id)a3
{
  AVCaptureOutputInternal *outputInternal;

  -[AVCaptureOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("connections"));
  outputInternal = self->_outputInternal;
  objc_sync_enter(outputInternal);
  if (-[NSMutableArray containsObject:](self->_outputInternal->connections, "containsObject:", a3))
    -[NSMutableArray removeObject:](self->_outputInternal->connections, "removeObject:", a3);
  objc_sync_exit(outputInternal);
  -[AVCaptureOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("connections"));
}

- (id)firstEnabledConnectionForMediaType:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = -[AVCaptureOutput connections](self, "connections");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v21;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v21 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      if (objc_msgSend(v9, "isEnabled"))
      {
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v10 = (void *)objc_msgSend(v9, "inputPorts", 0);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v17;
LABEL_9:
          v14 = 0;
          while (1)
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v10);
            if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "mediaType"), "isEqual:", a3) & 1) != 0)
              return v9;
            if (v12 == ++v14)
            {
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
              if (v12)
                goto LABEL_9;
              break;
            }
          }
        }
      }
    }
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    v9 = 0;
    if (v6)
      continue;
    return v9;
  }
}

- (id)liveConnections
{
  NSArray *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = -[AVCaptureOutput connections](self, "connections");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v2, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "isLive"))
          objc_msgSend(v3, "addObject:", v8);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  return v3;
}

- (id)_recommendedVideoOutputSettingsForConnection:(id)a3 sourceSettings:(id)a4 videoCodec:(id)a5 isIris:(BOOL)a6 outputFileURL:(id)a7
{
  uint64_t v7;
  _BOOL4 v8;
  void *v12;
  void *v13;
  id *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t width;
  uint64_t height;
  int v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  BOOL v26;
  CMVideoDimensions Dimensions;
  double v28;
  uint64_t v29;
  float v30;
  _BOOL4 v31;
  BOOL v32;
  char v33;
  uint64_t v34;
  _BOOL4 v36;
  _BOOL4 v38;
  _BOOL4 v39;
  int v40;
  _BOOL4 v41;
  int v42;
  uint64_t i;
  float v45;
  float v46;
  float v47;
  double v48;
  AVCaptureOutput *v49;
  double v50;
  double v51;
  double v52;
  float v53;
  float v54;
  float v55;
  int v56;
  __int128 *v57;
  __int128 *v58;
  int v59;
  int v60;
  __int128 *v61;
  __int128 *v62;
  __int128 *v63;
  __int128 *v64;
  int v65;
  int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _BOOL8 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  double v85;
  uint64_t v86;
  void *v87;
  uint64_t *v88;
  float v89;
  unint64_t v90;
  void *v92;
  int v93;
  uint64_t v94;
  float v95;
  void *v96;
  int v97;
  uint64_t v98;
  float v99;
  uint64_t v100;
  int v101;
  uint64_t v102;
  uint64_t v103;
  double v104;
  uint64_t v105;
  int v106;
  unsigned int v107;
  int v108;
  unsigned int v109;
  uint64_t v110;
  double v111;
  uint64_t v112;
  _QWORD *v113;
  uint64_t v114;
  void *v115;
  char isKindOfClass;
  char v117;
  id v118;
  int IsFileOnExternalStorageDevice;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  double v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  float v128;
  float v129;
  double v130;
  double v131;
  float v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  int v138;
  uint64_t v139;
  char v140;
  _BOOL4 v141;
  _BOOL4 v142;
  uint64_t v143;
  uint64_t v145;
  int v146;
  int IsTenBit;
  int v149;
  AVCaptureOutput *v150;
  id v151;
  uint64_t v152;
  int v153;
  uint64_t v154;
  int v155;
  CMTime time2;
  CMTime time1;
  __int128 v158;
  uint64_t v159;
  __int128 v160;
  uint64_t v161;
  __int128 v162;
  int v163;
  __int128 v164;
  int v165;
  __int128 v166;
  int v167;
  uint64_t v168;
  CGSize v169;
  CGRect v170;
  CGRect v171;

  v8 = a6;
  v168 = *MEMORY[0x1E0C80C00];
  v12 = (void *)objc_msgSend(a3, "sourceDevice");
  v13 = (void *)objc_msgSend(v12, "activeFormat");
  v14 = (id *)MEMORY[0x1E0CF2C80];
  if (a5 && !objc_msgSend(a5, "isEqual:", *MEMORY[0x1E0CF2C80]))
    goto LABEL_10;
  v15 = objc_msgSend(v12, "AVVideoSettingsForSessionPreset:", objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"));
  if (!v15)
    goto LABEL_10;
  v16 = (void *)v15;
  v17 = objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset");
  if (v13)
  {
    objc_msgSend(v13, "defaultActiveMinFrameDurationForSessionPreset:", v17);
    if (v12)
    {
LABEL_6:
      objc_msgSend(v12, "activeVideoMinFrameDuration");
      goto LABEL_9;
    }
  }
  else
  {
    memset(&time1, 0, sizeof(time1));
    if (v12)
      goto LABEL_6;
  }
  memset(&time2, 0, sizeof(time2));
LABEL_9:
  if (!CMTimeCompare(&time1, &time2))
    return v16;
LABEL_10:
  v141 = v8;
  v18 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v151 = *v14;
  if (!a5)
    a5 = *v14;
  width = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]), "intValue");
  height = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]), "intValue");
  if (v12)
  {
    objc_msgSend(v12, "activeVideoMinFrameDuration");
    v21 = v155;
    objc_msgSend(v12, "activeVideoMinFrameDuration");
    v22 = v154;
  }
  else
  {
    v22 = 0;
    v21 = 0;
  }
  v23 = (double)v21;
  v24 = (double)v22;
  v143 = *MEMORY[0x1E0CF2CE8];
  v25 = objc_msgSend(a4, "objectForKeyedSubscript:");
  if ((_DWORD)width)
    v26 = (_DWORD)height == 0;
  else
    v26 = 1;
  if (v26)
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v13, "formatDescription"));
    if ((_DWORD)width)
      width = width;
    else
      width = Dimensions.width;
    if ((_DWORD)height)
      height = height;
    else
      height = Dimensions.height;
  }
  v28 = v23 / v24;
  if (objc_msgSend(v13, "isPhotoFormat"))
    v29 = objc_msgSend(v12, "maxH264PhotoDimensions");
  else
    v29 = objc_msgSend(v12, "maxH264VideoDimensions");
  v30 = v28;
  v150 = self;
  if ((int)width > (int)v29 || (int)height > SHIDWORD(v29))
  {
    v169.width = (double)(int)width;
    v169.height = (double)(int)height;
    v171.size.width = (double)(int)v29;
    v171.size.height = (double)SHIDWORD(v29);
    v171.origin.x = 0.0;
    v171.origin.y = 0.0;
    v170 = AVMakeRectWithAspectRatioInsideRect(v169, v171);
    width = vcvtmd_s64_f64(v170.size.width) & 0xFFFFFFFE;
    height = vcvtmd_s64_f64(v170.size.height) & 0xFFFFFFFE;
    v145 = *MEMORY[0x1E0CF2D00];
  }
  else
  {
    v145 = v25;
  }
  objc_msgSend((id)objc_msgSend(v13, "figCaptureSourceVideoFormat"), "format");
  IsTenBit = FigCapturePixelFormatIsTenBit();
  v31 = (int)FigCapturePlatformIdentifier() > 5;
  v149 = width * height;
  v32 = v30 <= 60.0 || (int)width * (int)height < 8294400;
  v33 = v32;
  v140 = v33;
  if (!v32)
    v31 = 0;
  v142 = v31;
  if ((objc_msgSend(a5, "isEqualToString:", v151) & 1) == 0)
  {
    v34 = *MEMORY[0x1E0CF2C88];
    if (!objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CF2C88]))
      goto LABEL_213;
  }
  v36 = (int)width > 1919 && (int)height > 1079;
  v38 = (int)width > 640 && (int)height > 480;
  v39 = v30 > 30.0 && v38;
  v146 = (((int)width + 15) >> 4) * (((int)height + 15) >> 4);
  if (objc_msgSend(v12, "minMacroblocksForHighProfileUpTo30fps")
    && objc_msgSend(v12, "minMacroblocksForHighProfileAbove30fps"))
  {
    if (v146 >= (int)objc_msgSend(v12, "minMacroblocksForHighProfileUpTo30fps") && v30 <= 30.0)
    {
      v40 = v36 || v39;
      v41 = 1;
      goto LABEL_72;
    }
    v42 = objc_msgSend(v12, "minMacroblocksForHighProfileAbove30fps");
    v41 = v30 > 30.0 && v146 >= v42;
  }
  else
  {
    v41 = 0;
  }
  v40 = v36 || v39;
  if ((v40 & 1) == 0 && !v41)
  {
LABEL_84:
    v53 = v30 * 11.3999996 / 30.0;
    if (v30 >= 120.0)
      v53 = 45.6;
    if (v30 <= 120.0)
    {
      v55 = v53;
    }
    else
    {
      v54 = v53 + (v30 + -120.0) * 0.0900000254;
      v55 = v54;
    }
    if (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CF2C88]))
    {
      v55 = v55 * 0.8;
      objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CF2C38]);
    }
    v49 = v150;
    objc_msgSend(v18, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CF2CC8], *MEMORY[0x1E0CF2CD8]);
    goto LABEL_130;
  }
LABEL_72:
  objc_msgSend(v18, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CF2CD0], *MEMORY[0x1E0CF2CD8]);
  objc_msgSend(v18, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CF2CA8], *MEMORY[0x1E0CF2CB0]);
  objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CF2C38]);
  if (v41)
  {
    LODWORD(v161) = 1110337126;
    v160 = xmmword_19EEEA5CC;
    v158 = xmmword_19EEEA5E0;
    LODWORD(v159) = 1109576909;
    v166 = xmmword_19EEEA5F4;
    v167 = 1106640896;
    if (objc_msgSend(v12, "usesQuantizationScalingMatrix_H264_Steep_16")
      && objc_msgSend(a5, "isEqualToString:", v151))
    {
      objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E424CAB0, *MEMORY[0x1E0CED198]);
      for (i = 0; i != 20; i += 4)
      {
        v45 = *(float *)((char *)&v160 + i) * 0.95;
        *(float *)((char *)&v160 + i) = v45;
        v46 = *(float *)((char *)&v158 + i) * 0.9;
        *(float *)((char *)&v158 + i) = v46;
        v47 = *(float *)((char *)&v166 + i) * 0.9;
        *(float *)((char *)&v166 + i) = v47;
      }
    }
    v165 = 1103961784;
    v164 = xmmword_19EEEA61C;
    v162 = xmmword_19EEEA630;
    v163 = 1100674499;
    v49 = v150;
    if ((int)objc_msgSend(v12, "hevcTurboModeVersion") < 1)
    {
      v50 = 959447.126;
      LODWORD(v48) = 1100166726;
    }
    else
    {
      v165 = 1103155219;
      *((_QWORD *)&v162 + 1) = 0x412B74BC40C2511ALL;
      v163 = 1100065171;
      v50 = 618764.626;
      LODWORD(v48) = 1099587864;
    }
    if (v142)
    {
      *((double *)&v162 + 1) = v50;
      v163 = LODWORD(v48);
    }
    v56 = objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CF2C88], v50, v48);
    v57 = (__int128 *)&unk_19EEEA608;
    if (v56)
    {
      v58 = &v164;
    }
    else
    {
      v57 = &v160;
      v58 = &v158;
    }
    if (v146 >= 3600)
    {
      v59 = 3600;
    }
    else
    {
      v58 = v57;
      v59 = 0;
    }
    if (v146 >= 3600)
      v60 = 8160;
    else
      v60 = 3600;
    if (v56)
      v61 = &v164;
    else
      v61 = &v158;
    v62 = &v162;
    if (!v56)
      v62 = &v166;
    if (v146 >= 8160)
      v63 = v61;
    else
      v63 = v57;
    if (v146 >= 8160)
      v64 = v62;
    else
      v64 = v58;
    if (v146 >= 8160)
      v65 = 8160;
    else
      v65 = v59;
    if (v146 >= 8160)
      v66 = 32400;
    else
      v66 = v60;
    v67 = (float)(v30 / 30.0);
    if (v67)
    {
      v68 = -1;
      do
      {
        ++v68;
        v32 = v67 > 1;
        v67 >>= 1;
      }
      while (v32);
      if (v68 > 2)
      {
        v73 = (float)(v30 / 240.0) * *((float *)v63 + 4);
        v74 = (float)(v30 / 240.0) * *((float *)v64 + 4);
        goto LABEL_129;
      }
      v69 = v68 + 1;
    }
    else
    {
      v69 = 0;
    }
    v70 = flt_19EEEA644[v69];
    v71 = flt_19EEEA644[v69 + 1] - v70;
    v72 = v30 - v70;
    v73 = *((float *)v63 + v69)
        + (float)((float)((float)(*((float *)v63 + v69 + 1) - *((float *)v63 + v69)) / v71) * v72);
    v74 = *((float *)v64 + v69)
        + (float)((float)((float)(*((float *)v64 + v69 + 1) - *((float *)v64 + v69)) / v71) * v72);
LABEL_129:
    v55 = v73 + (float)((float)((float)(v74 - v73) / (float)(v66 - v65)) * (float)(v146 - v65));
    goto LABEL_130;
  }
  if (!v40)
    goto LABEL_84;
  if (v36)
  {
    v51 = v30;
    v49 = v150;
    if (v30 > 60.0)
    {
      v52 = (v51 + -60.0) * 0.193666681 + 12.5;
    }
    else
    {
      if (v30 <= 30.0)
      {
        v132 = v51 * 8.19999981 / 30.0;
        if (v30 >= 30.0)
          v132 = 8.2;
LABEL_257:
        v55 = (float)((float)((float)((float)v149 * -0.00000034899) + 8.9237) / 8.2) * v132;
        if (objc_msgSend(v12, "usesQuantizationScalingMatrix_H264_Steep_16")
          && objc_msgSend(a5, "isEqualToString:", v151))
        {
          objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E424CAB0, *MEMORY[0x1E0CED198]);
          v130 = v55;
          v131 = 0.9;
          goto LABEL_260;
        }
        goto LABEL_130;
      }
      v52 = (v51 + -30.0) * 0.14333334 + 8.19999981;
    }
    v132 = v52;
    goto LABEL_257;
  }
  v128 = v30 * 8.19999981 / 30.0;
  if (v30 >= 120.0)
    v128 = 32.8;
  if (v30 <= 120.0)
  {
    v55 = v128;
  }
  else
  {
    v129 = v128 + (v30 + -120.0) * 0.0899999936;
    v55 = v129;
  }
  v49 = v150;
  if (objc_msgSend(v12, "usesQuantizationScalingMatrix_H264_Steep_16")
    && objc_msgSend(a5, "isEqualToString:", v151))
  {
    objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E424CAB0, *MEMORY[0x1E0CED198]);
    v130 = v55;
    v131 = 0.95;
LABEL_260:
    v55 = v130 * v131;
  }
LABEL_130:
  if (IsTenBit)
  {
    v75 = v55 * 1.1;
    v55 = v75;
  }
  if (v12)
  {
    objc_msgSend(v12, "activeVideoMaxFrameDuration");
    v138 = v153;
    objc_msgSend(v12, "activeVideoMaxFrameDuration");
    v137 = v152;
  }
  else
  {
    v137 = 0;
    v138 = 0;
  }
  v76 = (int)(float)((float)(v55 * (float)(int)width) * (float)(int)height);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[AVCaptureOutput isSpatialVideoCaptureEnabled](v49, "isSpatialVideoCaptureEnabled"))
  {
    LODWORD(v76) = llround((double)(int)v76 + (double)(int)v76);
  }
  v77 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v76);
  v139 = *MEMORY[0x1E0CF2C48];
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v77);
  v78 = *MEMORY[0x1E0CF2CC0];
  objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E424CAC8, *MEMORY[0x1E0CF2CC0]);
  v34 = *MEMORY[0x1E0CF2C88];
  if (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CF2C88]))
  {
    if (!v142)
    {
      if (objc_msgSend(v12, "hevcAllowBFramesForHighCTUCount"))
      {
        v80 = v30 <= 30.0 || v149 < 2073601;
        v81 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v80);
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v81, *MEMORY[0x1E0CF2C38]);
        if (!v80)
          goto LABEL_155;
        goto LABEL_153;
      }
      if (v30 > 30.0 && (v30 > 120.0 || v149 >= 2073601))
      {
        v84 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
        v83 = *MEMORY[0x1E0CF2C38];
        goto LABEL_154;
      }
    }
    v82 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v82, *MEMORY[0x1E0CF2C38]);
LABEL_153:
    v83 = *MEMORY[0x1E0CECEB8];
    v84 = MEMORY[0x1E0C9AAB0];
LABEL_154:
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v84, v83);
LABEL_155:
    if ((int)FigCapturePlatformIdentifier() >= 6)
      objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CED0D8]);
    if (!objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]), "intValue"))
      objc_msgSend((id)objc_msgSend(v13, "figCaptureSourceVideoFormat"), "format");
    if (objc_msgSend(v12, "isMotionCompensatedTemporalFilteringSupported")
      && FigCapturePixelFormatIs420()
      && (float)(v30 * (float)v149) <= 290300000.0)
    {
      objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CED218]);
    }
  }
  objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E424CAE0, *MEMORY[0x1E0CED0C0]);
  objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E424CAF8, *MEMORY[0x1E0CED098]);
  if (!objc_msgSend(a5, "isEqualToString:", v34))
  {
    v88 = (uint64_t *)MEMORY[0x1E0CF2C50];
    if (v30 > 30.0)
      objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E424CB10, *MEMORY[0x1E0CF2C50]);
    if (v149 <= 2764800)
      goto LABEL_181;
    v89 = (double)v138 / (double)v137;
    v90 = llroundf(v30);
    v86 = *v88;
    if (vabds_f32(v30, v89) < 0.5 && v90 == 24)
      v87 = &unk_1E424CB28;
    else
      v87 = &unk_1E424CAE0;
    goto LABEL_180;
  }
  if (v30 > 30.0)
  {
    if ((v140 & 1) != 0)
    {
      v86 = *MEMORY[0x1E0CECF08];
      v87 = &unk_1E424CB10;
LABEL_180:
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v87, v86);
      goto LABEL_181;
    }
    v92 = (void *)MEMORY[0x1E0CB37E8];
    *(float *)&v85 = v30 * 0.25;
LABEL_178:
    v87 = (void *)objc_msgSend(v92, "numberWithFloat:", v85);
    v86 = *MEMORY[0x1E0CECF08];
    goto LABEL_180;
  }
  if (v149 > 2764800)
  {
    v92 = (void *)MEMORY[0x1E0CB37E8];
    *(float *)&v85 = v30;
    goto LABEL_178;
  }
LABEL_181:
  v160 = 0uLL;
  v161 = 0;
  if (v13)
  {
    objc_msgSend(v13, "lowestSupportedVideoFrameDuration");
    v93 = DWORD2(v160);
    v94 = v160;
  }
  else
  {
    v94 = 0;
    v93 = 0;
  }
  v95 = (float)v93 / (float)v94;
  if (v95 < v30)
  {
    fig_log_get_emitter();
    v135 = v7;
    LODWORD(v133) = 0;
    FigDebugAssert3();
  }
  *(float *)&v85 = v95;
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v85, v133, v135), CFSTR("MaximumRealTimeFrameRate"));
  v96 = (void *)objc_msgSend(a3, "output");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v141)
  {
    v158 = 0uLL;
    v159 = 0;
    if (v96)
    {
      objc_msgSend(v96, "livePhotoMovieVideoFrameDuration");
      v97 = DWORD2(v158);
      v98 = v158;
    }
    else
    {
      v98 = 0;
      v97 = 0;
    }
    v99 = (float)v97 / (float)v98;
    if (v99 < v30)
    {
      fig_log_get_emitter();
      v136 = v7;
      LODWORD(v134) = 0;
      FigDebugAssert3();
    }
    v100 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.6, v134, v136), v78);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CF2CD0], *MEMORY[0x1E0CF2CD8]);
    if (objc_msgSend(a5, "isEqualToString:", v34))
      objc_msgSend(v18, "removeObjectForKey:", *MEMORY[0x1E0CECEB8]);
    v101 = objc_msgSend(a5, "isEqualToString:", v34);
    v102 = MEMORY[0x1E0C9AAA0];
    if (v101)
      v103 = v100;
    else
      v103 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v103, *MEMORY[0x1E0CF2C38]);
    *(float *)&v104 = v99;
    v105 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v104);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v105, *MEMORY[0x1E0CF2CA0]);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v102, *MEMORY[0x1E0CF2C18]);
    if (objc_msgSend(v13, "isIrisVideoStabilizationSupported"))
      v106 = 1307;
    else
      v106 = 1388;
    if (objc_msgSend(a5, "isEqualToString:", v151))
      objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E424CAB0, *MEMORY[0x1E0CED198]);
    v107 = v106 * v146;
    v108 = objc_msgSend(a5, "isEqualToString:", v34);
    v109 = vcvtpd_u64_f64((double)v107 * 0.75);
    if (!v108)
      v109 = v107;
    if (v109 <= 0xF4240)
      v110 = 1000000;
    else
      v110 = v109;
    objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v110), v139);
  }
  if (objc_msgSend(v12, "isVariableFrameRateVideoCaptureEnabled"))
  {
    if (objc_msgSend(v13, "isVariableFrameRateVideoCaptureSupported"))
    {
      *(float *)&v111 = v30;
      v112 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v111);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v112, *MEMORY[0x1E0CECFF0]);
      if (v149 >= 8294400)
        objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CED170]);
    }
  }
LABEL_213:
  if (objc_msgSend(a5, "isEqualToString:", v34))
  {
    objc_msgSend(v18, "removeObjectForKey:", *MEMORY[0x1E0CF2CB0]);
    v113 = (_QWORD *)MEMORY[0x1E0CED9B0];
    if (IsTenBit)
      v113 = (_QWORD *)MEMORY[0x1E0CED988];
    objc_msgSend(v18, "setObject:forKeyedSubscript:", *v113, *MEMORY[0x1E0CF2CD8]);
    if (objc_msgSend(v12, "isHEVCRelaxedAverageBitRateTargetSupported"))
      objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CED1B0]);
  }
  if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedProResCodecTypes"), "containsObject:", a5))
  {
    v114 = (uint64_t)(float)((float)((float)(flt_19EEEA5A8[v149 > 2073600] * (float)(int)width) * (float)(int)height)
                          * v30);
    v115 = (void *)objc_msgSend(a3, "output");
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    v117 = objc_opt_isKindOfClass();
    v118 = a7;
    if ((isKindOfClass & 1) == 0 && (v117 & 1) == 0)
      goto LABEL_231;
    if ((isKindOfClass & 1) != 0)
      v118 = (id)objc_msgSend(v115, "outputFileURL");
    if (v118)
    {
      IsFileOnExternalStorageDevice = FigFileIsFileOnExternalStorageDevice();
      if (v114 >= 3040000000)
        v120 = 3040000000;
      else
        v120 = v114;
      v121 = 760000000;
      if (v114 < 760000000)
        v121 = v114;
      if (!IsFileOnExternalStorageDevice)
        v120 = v121;
    }
    else
    {
LABEL_231:
      if (v114 >= 760000000)
        v120 = 760000000;
      else
        v120 = v114;
    }
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CED158]);
    if (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CF2C68]))
    {
      objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CED170]);
      v122 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v120);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v122, *MEMORY[0x1E0CF2C48]);
    }
  }
  if ((objc_msgSend(a5, "isEqualToString:", v34) & 1) != 0 || objc_msgSend(a5, "isEqualToString:", v151))
    objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E424CB40, *MEMORY[0x1E0CED178]);
  objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CED1A0]);
  *(float *)&v123 = v30;
  v124 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v123);
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v124, *MEMORY[0x1E0CF2CA0]);
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", a5, *MEMORY[0x1E0CF2C58]);
  v125 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", width);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v125, *MEMORY[0x1E0CF2D08]);
  v126 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", height);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v126, *MEMORY[0x1E0CF2CB8]);
  if (v145)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v145, v143);
  if (objc_msgSend(v18, "count"))
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CF2C98]);
  return v16;
}

- (id)_recommendedAudioOutputSettingsForConnection:(id)a3 sourceSettings:(id)a4 fileType:(id)a5
{
  void *v8;
  const opaqueCMFormatDescription *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  const AudioStreamBasicDescription *StreamBasicDescription;
  const AudioStreamBasicDescription *v17;
  double mSampleRate;
  UInt32 mChannelsPerFrame;
  unsigned int v20;
  uint64_t mBitsPerChannel;
  void *v22;
  void *v23;
  int v24;
  int v25;
  const AudioChannelLayout *ChannelLayout;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  size_t sizeOut;

  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4);
  v9 = (const opaqueCMFormatDescription *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "inputPorts"), "firstObject"), "formatDescription");
  v10 = (void *)objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "figCaptureSourceAudioSettingsForSessionPreset:", objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"));
  objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D04970]), "doubleValue");
  v12 = v11;
  sizeOut = 0;
  objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D04988]), "doubleValue");
  v14 = v13;
  LODWORD(v15) = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D04980]), "intValue");
  if (v9)
  {
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v9);
    if (StreamBasicDescription)
    {
      v17 = StreamBasicDescription;
      mSampleRate = StreamBasicDescription->mSampleRate;
      mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
      if (objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "fallbackAudioCaptureModeIfApplicableForCurrentRoute:", objc_msgSend((id)objc_msgSend(a3, "sourceDeviceInput"), "audioCaptureMode")) == 2)v20 = 2;
      else
        v20 = mChannelsPerFrame;
      mBitsPerChannel = v17->mBitsPerChannel;
    }
    else
    {
      mBitsPerChannel = 16;
      v20 = 1;
      mSampleRate = v12;
    }
    ChannelLayout = CMAudioFormatDescriptionGetChannelLayout(v9, &sizeOut);
  }
  else
  {
    v22 = (void *)objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v23 = (void *)objc_msgSend(v22, "category");
    if ((objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0C89688]) & 1) != 0
      || objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0C896A0]))
    {
      v24 = objc_msgSend(v22, "inputNumberOfChannels");
      v25 = 0;
      if (v24 <= 1)
        v20 = 1;
      else
        v20 = v24;
    }
    else
    {
      v25 = 1;
      v20 = 1;
    }
    if (!objc_msgSend(-[AVCaptureOutput session](self, "session"), "usesApplicationAudioSession")
      || ((v25 | objc_msgSend(-[AVCaptureOutput session](self, "session"), "automaticallyConfiguresApplicationAudioSession")) & 1) != 0|| (objc_msgSend(v22, "sampleRate"), v27 == 0.0))
    {
      ChannelLayout = 0;
      mBitsPerChannel = 16;
      mSampleRate = v12;
    }
    else
    {
      objc_msgSend(v22, "sampleRate");
      mSampleRate = v28;
      ChannelLayout = 0;
      mBitsPerChannel = 16;
    }
  }
  if ((_DWORD)v15)
    v15 = v15;
  else
    v15 = v20;
  if (v14 == 0.0)
    v14 = mSampleRate;
  if ((objc_msgSend(-[AVCaptureOutput session](self, "session"), "likelyToRecordProResMovies") & 1) != 0)
  {
    v14 = 48000.0;
LABEL_28:
    v29 = 1819304813;
    v30 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", mBitsPerChannel);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0C898F0]);
    v31 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0C89900]);
    v32 = *MEMORY[0x1E0C89910];
LABEL_32:
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, v32);
    v34 = *MEMORY[0x1E0C89928];
    v35 = v8;
    v36 = v31;
LABEL_33:
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, v34);
    goto LABEL_34;
  }
  if (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CF2B18]))
    goto LABEL_28;
  if ((objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CF2AB0]) & 1) != 0
    || objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CF2AA8]))
  {
    v29 = 1819304813;
    v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", mBitsPerChannel);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0C898F0]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C89900]);
    v32 = *MEMORY[0x1E0C89910];
    v31 = MEMORY[0x1E0C9AAA0];
    goto LABEL_32;
  }
  v29 = 1633772320;
  if ((objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CF2B08]) & 1) == 0
    && (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CF2B00]) & 1) == 0
    && (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CF2AA0]) & 1) == 0
    && (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CF2AD0]) & 1) == 0
    && (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CF2AC8]) & 1) == 0
    && !objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CF2AD8]))
  {
    if (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CF2AB8]))
    {
      v15 = 1;
      v29 = 1935764850;
      v14 = 8000.0;
    }
    goto LABEL_34;
  }
  v42 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D04978]), "intValue");
  if ((int)v15 >= 2)
    v15 = 2;
  else
    v15 = v15;
  if ((_DWORD)v42)
  {
    v43 = v42;
    v44 = 0;
LABEL_49:
    v45 = 0xFFFFFFFFLL;
    goto LABEL_50;
  }
  if (v14 != v12)
    goto LABEL_34;
  v43 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D04960]), "intValue");
  v44 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D04968]);
  if (!objc_msgSend(v44, "isEqualToString:", *MEMORY[0x1E0C89640]))
    goto LABEL_49;
  v47 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D04990]);
  if (!v47)
    goto LABEL_49;
  v45 = objc_msgSend(v47, "intValue");
LABEL_50:
  if ((int)v43 >= 1)
  {
    v46 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v43);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v46, *MEMORY[0x1E0C898D0]);
  }
  if (v44)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v44, *MEMORY[0x1E0C898D8]);
  if ((_DWORD)v45 != -1)
  {
    v36 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v45);
    v34 = *MEMORY[0x1E0C898A8];
    v35 = v8;
    goto LABEL_33;
  }
LABEL_34:
  v37 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v29);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0C898E0]);
  v38 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0C89970]);
  v39 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0C89930]);
  if ((_DWORD)v15 == v20 && ChannelLayout)
  {
    v40 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", ChannelLayout, sizeOut);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0C898A0]);
  }
  return v8;
}

- (id)recommendedCinematicAudioOutputSettingsForConnection:(id)a3 fileType:(id)a4 isProResCapture:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  const opaqueCMFormatDescription *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;

  v5 = a5;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4);
  v8 = (const opaqueCMFormatDescription *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "inputPorts"), "firstObject"), "formatDescription");
  if (v5)
    v9 = 1819304813;
  else
    v9 = 1634754915;
  if (v8)
    CMAudioFormatDescriptionGetStreamBasicDescription(v8);
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C898E0]);
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0C89930]);
  if (v5)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0C89928]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C89910]);
  }
  v16 = 0;
  v15 = 0;
  v18 = 0;
  v17 = 0;
  v14 = 12451844;
  v12 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v14, 32);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0C898A0]);
  return v7;
}

- (id)recommendedOutputSettingsForConnection:(id)a3 sourceSettings:(id)a4 videoCodecType:(id)a5 fileType:(id)a6 isIris:(BOOL)a7 outputFileURL:(id)a8
{
  _BOOL8 v9;
  void *v15;
  void *v17;

  if (a3)
  {
    v9 = a7;
    v15 = (void *)objc_msgSend(a3, "mediaType");
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CF2B90]))
      return -[AVCaptureOutput _recommendedVideoOutputSettingsForConnection:sourceSettings:videoCodec:isIris:outputFileURL:](self, "_recommendedVideoOutputSettingsForConnection:sourceSettings:videoCodec:isIris:outputFileURL:", a3, a4, a5, v9, a8);
    v17 = (void *)objc_msgSend(a3, "mediaType");
    if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CF2B68]))
      return -[AVCaptureOutput _recommendedAudioOutputSettingsForConnection:sourceSettings:fileType:](self, "_recommendedAudioOutputSettingsForConnection:sourceSettings:fileType:", a3, a4, a6);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return 0;
}

+ (int64_t)dataDroppedReasonFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (!a3)
    return 0;
  CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA2660], 0);
  if (FigCFEqual())
    return 1;
  if (FigCFEqual())
    return 2;
  if (FigCFEqual())
    return 3;
  return 0;
}

- (BOOL)updateVideoSettingsForConnection:(id)a3
{
  return 0;
}

- (void)getTransform:(CGAffineTransform *)a3 mirroredOut:(BOOL *)a4 rollAdjustmentOut:(double *)a5 forConnection:(id)a6
{
  AVCaptureOutputInternal *outputInternal;
  AVCaptureOutputInternal *v12;
  __int128 v13;
  __int128 v14;
  BOOL physicallyMirrorsVideo;

  outputInternal = self->_outputInternal;
  objc_sync_enter(outputInternal);
  if (a3)
  {
    v12 = self->_outputInternal;
    v13 = *(_OWORD *)&v12->metadataTransform.a;
    v14 = *(_OWORD *)&v12->metadataTransform.tx;
    *(_OWORD *)&a3->c = *(_OWORD *)&v12->metadataTransform.c;
    *(_OWORD *)&a3->tx = v14;
    *(_OWORD *)&a3->a = v13;
  }
  if (a4)
  {
    if (objc_msgSend(a6, "isVideoMirrored"))
      physicallyMirrorsVideo = self->_outputInternal->physicallyMirrorsVideo;
    else
      physicallyMirrorsVideo = 0;
    *a4 = physicallyMirrorsVideo;
  }
  if (a5)
    *a5 = self->_outputInternal->rollAdjustment;
  objc_sync_exit(outputInternal);
}

void __45__AVCaptureOutput_attachToFigCaptureSession___block_invoke_cold_1()
{
  __assert_rtn("-[AVCaptureOutput attachToFigCaptureSession:]_block_invoke", "AVCaptureOutput.m", 364, "_outputInternal->figCaptureSession == NULL");
}

void __47__AVCaptureOutput_detachFromFigCaptureSession___block_invoke_cold_1()
{
  __assert_rtn("-[AVCaptureOutput detachFromFigCaptureSession:]_block_invoke", "AVCaptureOutput.m", 380, "figCaptureSession == _outputInternal->figCaptureSession");
}

@end
