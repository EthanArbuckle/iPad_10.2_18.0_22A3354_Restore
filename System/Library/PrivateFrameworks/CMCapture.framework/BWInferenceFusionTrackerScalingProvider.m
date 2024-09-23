@implementation BWInferenceFusionTrackerScalingProvider

- (_QWORD)initWithInputRequirement:(void *)a3 orderBufferRequirement:(void *)a4 descriptor:(void *)a5 resourceProvider:(void *)a6 meanPixelCalculator:(uint64_t)a7 operation:
{
  _QWORD *v13;
  BWInferenceVideoFormatRequirements *v14;
  double v15;
  double v16;
  uint64_t v17;
  objc_super v19;
  BWInferenceVideoFormatRequirements *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v19.receiver = a1;
  v19.super_class = (Class)BWInferenceFusionTrackerScalingProvider;
  v13 = objc_msgSendSuper2(&v19, sel_init);
  if (v13)
  {
    v13[1] = a2;
    v13[2] = a3;
    v13[6] = a7;
    v14 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    objc_msgSend(a4, "size");
    -[BWVideoFormatRequirements setWidth:](v14, "setWidth:", (unint64_t)v15);
    objc_msgSend(a4, "size");
    -[BWVideoFormatRequirements setHeight:](v14, "setHeight:", (unint64_t)v16);
    v21[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a4, "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v14, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1));
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v14, "setBytesPerRowAlignment:", 64);
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BWInferenceFusionTrackerNetworkInput_%lu_%@"), a7, objc_msgSend(a4, "name"));
    v20 = v14;
    v13[3] = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", v17, +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1)));
    v13[7] = objc_msgSend(objc_alloc((Class)getFTMSRScalerClass()), "init");
    v13[9] = a6;
    v13[8] = (id)objc_msgSend(a5, "defaultDeviceMetalContext");
  }
  return v13;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  objc_super v4;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);

  v4.receiver = self;
  v4.super_class = (Class)BWInferenceFusionTrackerScalingProvider;
  -[BWInferenceFusionTrackerScalingProvider dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  NSString *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWInferenceFusionTrackerScalingProvider;
  v3 = -[BWInferenceFusionTrackerScalingProvider description](&v5, sel_description);
  return -[NSString stringByAppendingString:](v3, "stringByAppendingString:", FTCinematicHighPriorityTrackerOpDescription(self->_operation));
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

- (int)type
{
  return 150;
}

- (int)executionTarget
{
  return 0;
}

- (NSSet)preventionReasons
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (NSArray)cloneVideoRequirements
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (NSArray)inputVideoRequirements
{
  BWInferenceVideoRequirement *orderBufferRequirement;
  void *v3;
  BWInferenceVideoRequirement **p_inputRequirement;
  uint64_t v5;
  BWInferenceVideoRequirement *v7;
  BWInferenceVideoRequirement *inputRequirement;
  BWInferenceVideoRequirement *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  orderBufferRequirement = self->_orderBufferRequirement;
  if (orderBufferRequirement)
  {
    inputRequirement = self->_inputRequirement;
    v9 = orderBufferRequirement;
    v3 = (void *)MEMORY[0x1E0C99D20];
    p_inputRequirement = &inputRequirement;
    v5 = 2;
  }
  else
  {
    v7 = self->_inputRequirement;
    v3 = (void *)MEMORY[0x1E0C99D20];
    p_inputRequirement = &v7;
    v5 = 1;
  }
  return (NSArray *)objc_msgSend(v3, "arrayWithObjects:count:", p_inputRequirement, v5, v7, inputRequirement, v9, v10);
}

- (NSArray)outputVideoRequirements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_outputRequirement;
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (NSArray)inputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)outputMetadataRequirements
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_outputMetadataRequirements, "copy");
}

- (BWInferenceExecutable)executable
{
  if (*((_QWORD *)self + 9))
    return 0;
  return self;
}

- (BWInferenceSubmittable)submittable
{
  if (!*((_QWORD *)self + 9))
    return 0;
  return self;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (id)newStorage
{
  BWInferenceProviderStorage *v3;
  uint64_t v4;
  BWInferenceVideoRequirement *outputRequirement;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = [BWInferenceProviderStorage alloc];
  v7[0] = self->_inputRequirement;
  v4 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  outputRequirement = self->_outputRequirement;
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](v3, "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", v4, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &outputRequirement, 1));
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  return 0;
}

- (BOOL)allowsAsyncPropagation
{
  return 0;
}

- (uint64_t)_executeOnSampleBuffer:(void *)a3 usingStorage:(uint64_t)a4 meanPixel:(uint64_t)a5 withExecutionTime:(uint64_t)a6 completionHandler:
{
  void *v11;
  void *v12;
  uint64_t v13;
  __CVBuffer *v14;
  uint64_t v15;
  __CVBuffer *v16;
  uint64_t v17;
  char v18;
  void *v19;
  void *FTTapToBoxClass;
  char v21;
  uint64_t v22;

  if (!a1)
    return 0;
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v11 = (void *)CMGetAttachment(target, CFSTR("FusionTrackerInput"), 0);
  if (v11)
    v12 = (void *)objc_msgSend(v11, "highPriorityTrackerState");
  else
    v12 = 0;
  v13 = objc_msgSend(a3, "pixelBufferForRequirement:", a1[1]);
  if (!v13)
  {
    v22 = 4294935585;
    goto LABEL_21;
  }
  v14 = (__CVBuffer *)v13;
  v15 = objc_msgSend((id)objc_msgSend(a3, "pixelBufferPoolForRequirement:", a1[3]), "newPixelBuffer");
  if (!v15)
  {
    v22 = 4294935553;
    goto LABEL_21;
  }
  v16 = (__CVBuffer *)v15;
  objc_msgSend(a3, "setPixelBuffer:forRequirement:", v15, a1[3]);
  if ((objc_msgSend(v12, "completed") & 1) == 0)
  {
    CVPixelBufferLockBaseAddress(v16, 0);
    v17 = a1[6];
    if (v17 == 3)
    {
      v19 = (void *)CMGetAttachment(target, CFSTR("FusionTrackerInput"), 0);
      FTTapToBoxClass = (void *)getFTTapToBoxClass();
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v19, "input"), "tapRequest"), "tapPoint");
      v21 = objc_msgSend(FTTapToBoxClass, "renderTap:inBuffer:", v16);
    }
    else
    {
      if (v17 == 2)
      {
        CVPixelBufferLockBaseAddress(v14, 1uLL);
        v18 = objc_msgSend(v12, "preProcessInstanceInputFromSourceBuffer:toDestinationBuffer:meanPixel:scaler:", v14, v16, a4, a1[7]);
      }
      else
      {
        if (v17 != 1)
        {
          CVPixelBufferUnlockBaseAddress(v16, 0);
LABEL_20:
          CFRelease(v16);
          v22 = 4294935580;
LABEL_21:
          objc_msgSend(v12, "abort");
          goto LABEL_22;
        }
        CVPixelBufferLockBaseAddress(v14, 1uLL);
        targetRectForSampleBuffer(target);
        v18 = objc_msgSend(v12, "preProcessExemplarInputFromSourceBuffer:toDestinationBuffer:forTargetRect:meanPixel:scaler:", v14, v16, a4, a1[7]);
      }
      v21 = v18;
      CVPixelBufferUnlockBaseAddress(v14, 1uLL);
    }
    CVPixelBufferUnlockBaseAddress(v16, 0);
    if ((v21 & 1) != 0)
      goto LABEL_18;
    goto LABEL_20;
  }
LABEL_18:
  CFRelease(v16);
  v22 = 0;
LABEL_22:
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(a6 + 16))(a6, v22, a1);
  return v22;
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  return -[BWInferenceFusionTrackerScalingProvider _executeOnSampleBuffer:usingStorage:meanPixel:withExecutionTime:completionHandler:](self, a3, a4, 0, (uint64_t)a5, (uint64_t)a6);
}

- (int)prepareForExecution
{
  return 0;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  return 0;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  BWInferenceFusionTrackerMeanPixelCalculator *meanPixelCalculator;
  int v15;
  _QWORD v17[8];
  __int128 v18;
  int64_t var3;

  v12 = objc_msgSend(a4, "pixelBufferForRequirement:", self->_inputRequirement);
  if (v12)
  {
    v13 = v12;
    meanPixelCalculator = self->_meanPixelCalculator;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __125__BWInferenceFusionTrackerScalingProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
    v17[3] = &unk_1E4920720;
    v17[4] = self;
    v17[5] = a4;
    v18 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    v17[6] = a7;
    v17[7] = a3;
    -[BWInferenceFusionTrackerMeanPixelCalculator asyncMeanPixelForBuffer:completionHandler:](meanPixelCalculator, "asyncMeanPixelForBuffer:completionHandler:", v13, v17);
    return 0;
  }
  else
  {
    v15 = -31711;
    (*((void (**)(id, uint64_t, BWInferenceFusionTrackerScalingProvider *))a7 + 2))(a7, 4294935585, self);
  }
  return v15;
}

uint64_t __125__BWInferenceFusionTrackerScalingProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return -[BWInferenceFusionTrackerScalingProvider _executeOnSampleBuffer:usingStorage:meanPixel:withExecutionTime:completionHandler:](*(_QWORD **)(a1 + 32), *(CMAttachmentBearerRef *)(a1 + 56), *(void **)(a1 + 40), a2, a5, *(_QWORD *)(a1 + 48));
}

- (BOOL)mustExecuteWhenAllowed
{
  return 0;
}

- (id)preventionReasonWithSampleBuffer:(opaqueCMSampleBuffer *)a3 executionTime:(id *)a4
{
  return (id)preventionReasonWithSampleBuffer(a3, self->_operation);
}

@end
