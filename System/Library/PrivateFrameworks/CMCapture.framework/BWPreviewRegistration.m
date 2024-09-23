@implementation BWPreviewRegistration

- (CGPoint)computeApproximateCorrectionForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCameraPortType:(id)a4 narrowerPixelBufferDimensions:(id)a5 widerToNarrowerCameraScale:(double)a6
{
  double v10;
  double v11;
  CGPoint result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[BWPreviewRegistrationProvider computeApproximateCorrectionForWiderCamera:narrowerCameraPortType:narrowerPixelBufferDimensions:widerToNarrowerCameraScale:](self->_registrationProvider, "computeApproximateCorrectionForWiderCamera:narrowerCameraPortType:narrowerPixelBufferDimensions:widerToNarrowerCameraScale:", a3, *MEMORY[0x1E0D05A30], a5, a6);
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D538];
    v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.y = v11;
  result.x = v10;
  return result;
}

- (BWPreviewRegistration)initWithCameraInfoByPortType:(id)a3 sensorBinningFactor:(id)a4 registrationType:(int)a5 metalCommandQueue:(id)a6 excludeStaticComponentFromAlignmentShifts:(BOOL)a7
{
  BWPreviewRegistration *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  BWVisionPreviewRegistrationProvider *registrationProvider;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BWPreviewRegistration;
  v12 = -[BWPreviewRegistration init](&v17, sel_init);
  if (v12)
  {
    v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v14 = dispatch_queue_create("com.apple.bwgraph.preview.registration", v13);
    v12->_registrationQueue = (OS_dispatch_queue *)v14;
    if (!v14
      || (a5 != 1
        ? (BWVisionPreviewRegistrationProvider *)(registrationProvider = -[BWVisionPreviewRegistrationProvider initWithCameraInfoByPortType:sensorBinningFactor:]([BWVisionPreviewRegistrationProvider alloc], "initWithCameraInfoByPortType:sensorBinningFactor:", a3, a4), v12->_registrationProvider = (BWPreviewRegistrationProvider *)registrationProvider, v12->_previewRegistrationType = 0): (v12->_excludeStaticComponentFromAlignmentShifts = a7, v12->_registrationProvider = (BWPreviewRegistrationProvider *)-[BWAdaptiveCorrectionPreviewRegistrationProvider initWithCameraInfoByPortType:excludeStaticComponentFromAlignmentShifts:]([BWAdaptiveCorrectionPreviewRegistrationProvider alloc], "initWithCameraInfoByPortType:excludeStaticComponentFromAlignmentShifts:", a3, v12->_excludeStaticComponentFromAlignmentShifts), v12->_previewRegistrationType = 1, v12->_metalCommandQueue = (MTLCommandQueue *)a6, registrationProvider = (BWVisionPreviewRegistrationProvider *)v12->_registrationProvider), !registrationProvider))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v12;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWPreviewRegistration;
  -[BWPreviewRegistration dealloc](&v3, sel_dealloc);
}

- (void)allocateResourcesAsynchronouslyWithVideoFormat:(id)a3
{
  NSObject *registrationQueue;
  _QWORD v4[6];

  registrationQueue = self->_registrationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__BWPreviewRegistration_allocateResourcesAsynchronouslyWithVideoFormat___block_invoke;
  v4[3] = &unk_1E491E748;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(registrationQueue, v4);
}

void __72__BWPreviewRegistration_allocateResourcesAsynchronouslyWithVideoFormat___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B28]), "initWithbundle:andOptionalCommandQueue:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    if (!v4)
    {
      fig_log_get_emitter();
      v6 = v1;
      LODWORD(v5) = 0;
      FigDebugAssert3();
    }
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allocateResourcesWithVideoFormat:metalContext:", *(_QWORD *)(a1 + 40), v4, v5, v6);

  if (*v3 == 1)
    kdebug_trace();
}

- (void)cleanupResources
{
  NSObject *registrationQueue;
  _QWORD block[5];

  registrationQueue = self->_registrationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__BWPreviewRegistration_cleanupResources__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(registrationQueue, block);
}

uint64_t __41__BWPreviewRegistration_cleanupResources__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "cleanupResources");
}

- (void)registerWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(double)a5 isMacroScene:(BOOL)a6 macroTransitionType:(int)a7 completionHandler:(id)a8
{
  NSObject *registrationQueue;
  _QWORD v15[9];
  int v16;
  BOOL v17;
  CMSampleBufferRef v18;
  CMSampleBufferRef sampleBufferOut;

  sampleBufferOut = 0;
  v18 = 0;
  BWCMSampleBufferCreateCopyIncludingMetadata(a3, &sampleBufferOut);
  BWCMSampleBufferCreateCopyIncludingMetadata(a4, &v18);
  registrationQueue = self->_registrationQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __138__BWPreviewRegistration_registerWiderCamera_narrowerCamera_widerToNarrowerCameraScale_isMacroScene_macroTransitionType_completionHandler___block_invoke;
  v15[3] = &unk_1E491F270;
  v15[6] = sampleBufferOut;
  v15[7] = v18;
  *(double *)&v15[8] = a5;
  v17 = a6;
  v16 = a7;
  v15[4] = self;
  v15[5] = a8;
  dispatch_async(registrationQueue, v15);
}

void __138__BWPreviewRegistration_registerWiderCamera_narrowerCamera_widerToNarrowerCameraScale_isMacroScene_macroTransitionType_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _DWORD *v3;
  uint64_t v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  int v9;
  double v10;
  __CVBuffer *ImageBuffer;
  size_t Width;
  uint64_t v13;
  double v14;
  double v15;
  const void *v16;
  const void *v17;
  uint64_t v18;
  void (*v19)(uint64_t, _OWORD *);
  _OWORD v20[4];
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v2 = (void *)MEMORY[0x1A858DD40]();
  v3 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v26 = 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  if (v5)
  {
    objc_msgSend(v5, "registerWiderCamera:narrowerCamera:widerToNarrowerCameraScale:isMacroScene:macroTransitionType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 76), *(unsigned int *)(a1 + 72), *(double *)(a1 + 64));
    v4 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_BYTE *)(v4 + 40))
  {
    v6 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]), "isEqualToString:", *MEMORY[0x1E0D05A28]);
    if (v6)
      v7 = 0.05;
    else
      v7 = 0.042;
    if (v6)
      v8 = 0.05;
    else
      v8 = 0.01;
    v9 = *(_DWORD *)(a1 + 72);
    if (*(_BYTE *)(a1 + 76))
    {
      if (!v9)
      {
        v10 = 1.5;
LABEL_18:
        v7 = v7 * v10;
        v8 = v8 * v10;
LABEL_19:
        ImageBuffer = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(a1 + 48));
        Width = CVPixelBufferGetWidth(ImageBuffer);
        v13 = 0;
        v14 = round(v7 * (double)Width);
        v15 = round(v8 * (double)Width);
        do
        {
          if (*((_BYTE *)&v22 + v13)
            && (fabs(*(double *)((char *)&v22 + v13 + 8)) > v14 || fabs(*(double *)((char *)&v22 + v13 + 16)) > v15))
          {
            *((_BYTE *)&v22 + v13) = 0;
          }
          v13 += 24;
        }
        while (v13 != 72);
        goto LABEL_25;
      }
    }
    else if (!v9)
    {
      goto LABEL_19;
    }
    v10 = 1.5;
    if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 24) == 1)
      v10 = 2.5;
    goto LABEL_18;
  }
LABEL_25:
  v16 = *(const void **)(a1 + 48);
  if (v16)
    CFRelease(v16);
  v17 = *(const void **)(a1 + 56);
  if (v17)
    CFRelease(v17);
  if (*v3 == 1)
    kdebug_trace();
  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
  {
    v19 = *(void (**)(uint64_t, _OWORD *))(v18 + 16);
    v20[2] = v24;
    v20[3] = v25;
    v21 = v26;
    v20[0] = v22;
    v20[1] = v23;
    v19(v18, v20);
  }
  objc_autoreleasePoolPop(v2);
}

- (void)waitForRegistrationToComplete
{
  dispatch_sync((dispatch_queue_t)self->_registrationQueue, &__block_literal_global_14);
}

- (CGPoint)computeCameraShiftForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(double)a5
{
  _DWORD *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  -[BWPreviewRegistrationProvider computeCameraShiftForWiderCamera:narrowerCamera:widerToNarrowerCameraScale:](self->_registrationProvider, "computeCameraShiftForWiderCamera:narrowerCamera:widerToNarrowerCameraScale:", a3, a4, a5);
  v11 = v10;
  v13 = v12;
  if (*v9 == 1)
    kdebug_trace();
  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (int)previewRegistrationType
{
  return self->_previewRegistrationType;
}

@end
