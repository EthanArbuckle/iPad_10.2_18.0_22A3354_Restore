@implementation VCPMotionFlowRequest

- (VCPMotionFlowRequest)init
{
  uint8_t v4[16];

  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Not implemented, please use initWithOptions", v4, 2u);
  }

  return 0;
}

- (VCPMotionFlowRequest)initWithOptions:(id)a3
{
  id v4;
  VCPMotionFlowRequest *v5;
  double v6;
  VCPMotionFlowRequest *v7;
  int width;
  int height;
  void *v10;
  uint64_t v11;
  VCPImageMotionFlowAnalyzer *motionFlowAnalyzer;
  VCPMotionFlowRequest *v13;
  VCPMotionFlowRequest *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VCPMotionFlowRequest;
  v5 = -[VCPRequest initWithOptions:](&v16, sel_initWithOptions_, v4);
  v7 = v5;
  if (v5)
  {
    v5->_transferSession = 0;
    width = v5->super._width;
    if (width < 1 || (height = v5->super._height, height < 1))
    {
      v10 = 0;
    }
    else
    {
      *(float *)&v6 = (float)width / (float)height;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[VCPImageMotionFlowAnalyzer analyzeWithLightweightOption:aspectRatio:computationAccuracy:forceCPU:sharedModel:flushModel:cancel:](VCPImageMotionFlowAnalyzer, "analyzeWithLightweightOption:aspectRatio:computationAccuracy:forceCPU:sharedModel:flushModel:cancel:", 0, v10, v7->super._motionFlowComputationAccuracy, v7->super._useCPUOnly, 0, 0, &__block_literal_global_27);
    v11 = objc_claimAutoreleasedReturnValue();
    motionFlowAnalyzer = v7->_motionFlowAnalyzer;
    v7->_motionFlowAnalyzer = (VCPImageMotionFlowAnalyzer *)v11;

  }
  if (v7->_motionFlowAnalyzer)
    v13 = v7;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

uint64_t __40__VCPMotionFlowRequest_initWithOptions___block_invoke()
{
  return 0;
}

- (VCPMotionFlowRequest)initWithOptions:(id)a3 cancel:(id)a4
{
  id v6;
  id v7;
  VCPMotionFlowRequest *v8;
  double v9;
  VCPMotionFlowRequest *v10;
  int width;
  int height;
  void *v13;
  uint64_t v14;
  VCPImageMotionFlowAnalyzer *motionFlowAnalyzer;
  VCPMotionFlowRequest *v16;
  VCPMotionFlowRequest *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VCPMotionFlowRequest;
  v8 = -[VCPRequest initWithOptions:](&v19, sel_initWithOptions_, v6);
  v10 = v8;
  if (v8)
  {
    v8->_transferSession = 0;
    width = v8->super._width;
    if (width < 1 || (height = v8->super._height, height < 1))
    {
      v13 = 0;
    }
    else
    {
      *(float *)&v9 = (float)width / (float)height;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[VCPImageMotionFlowAnalyzer analyzeWithLightweightOption:aspectRatio:computationAccuracy:forceCPU:sharedModel:flushModel:cancel:](VCPImageMotionFlowAnalyzer, "analyzeWithLightweightOption:aspectRatio:computationAccuracy:forceCPU:sharedModel:flushModel:cancel:", 0, v13, v10->super._motionFlowComputationAccuracy, v10->super._useCPUOnly, 0, 0, v7);
    v14 = objc_claimAutoreleasedReturnValue();
    motionFlowAnalyzer = v10->_motionFlowAnalyzer;
    v10->_motionFlowAnalyzer = (VCPImageMotionFlowAnalyzer *)v14;

  }
  if (v10->_motionFlowAnalyzer)
    v16 = v10;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (int)createPixelBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(int)a5 pixelBuffer:(__CVBuffer *)a6
{
  const __CFDictionary *v10;
  CVReturn v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = *MEMORY[0x1E0CA8FF0];
  v14[0] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v11 = CVPixelBufferCreate(0, a3, a4, a5, v10, a6);
  if (v11 && *a6)
  {
    CFRelease(*a6);
    *a6 = 0;
  }

  return v11;
}

- (int)convertPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 withPixelFormat:(int)a5
{
  uint64_t v5;
  OpaqueVTPixelTransferSession **p_transferSession;
  size_t Width;
  int result;

  v5 = *(_QWORD *)&a5;
  p_transferSession = &self->_transferSession;
  if (self->_transferSession || (result = VTPixelTransferSessionCreate(0, p_transferSession)) == 0)
  {
    Width = CVPixelBufferGetWidth(a3);
    result = -[VCPMotionFlowRequest createPixelBufferWithWidth:height:pixelFormat:pixelBuffer:](self, "createPixelBufferWithWidth:height:pixelFormat:pixelBuffer:", Width, CVPixelBufferGetHeight(a3), v5, a4);
    if (!result)
      return VTPixelTransferSessionTransferImage(*p_transferSession, a3, *a4);
  }
  return result;
}

- (id)estimateMotionBetweenFirstImage:(__CVBuffer *)a3 andSecondImage:(__CVBuffer *)a4 error:(id *)a5
{
  int Width;
  int Height;
  VCPMotionFlowObservation *v11;
  VCPMotionFlowObservation *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 useCPUOnly;
  VCPImageMotionFlowAnalyzer *motionFlowAnalyzer;
  int v20;
  uint8_t v21[8];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v11 = objc_alloc_init(VCPMotionFlowObservation);
  v12 = v11;
  if (v11)
  {
    -[VCPMotionFlowObservation setRevision:](v11, "setRevision:", 1);
    if (self->super._width >= 1 && self->super._height > 0)
    {
      Height = self->super._height;
      Width = self->super._width;
    }
    v13 = -[VCPImageMotionFlowAnalyzer analyzeImages:secondImage:cancel:](self->_motionFlowAnalyzer, "analyzeImages:secondImage:cancel:", a3, a4, &__block_literal_global_21);
    if (v13)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Fail in generating motion flow", v21, 2u);
      }
    }
    else
    {
      if (self->super._useCPUOnly)
      {
        Height = -[VCPImageMotionFlowAnalyzer cnnOutputHeight](self->_motionFlowAnalyzer, "cnnOutputHeight");
        Width = -[VCPImageMotionFlowAnalyzer cnnOutputWidth](self->_motionFlowAnalyzer, "cnnOutputWidth");
      }
      -[VCPMotionFlowObservation setPixelBuffer:](v12, "setPixelBuffer:", VCPFlowCreatePixelBuffer(Width, Height, 0x32433068u, 32));
      if (-[VCPMotionFlowObservation pixelBuffer](v12, "pixelBuffer"))
      {
        useCPUOnly = self->super._useCPUOnly;
        motionFlowAnalyzer = self->_motionFlowAnalyzer;
        if (useCPUOnly)
          v20 = -[VCPImageMotionFlowAnalyzer getFlowToBuffer:](motionFlowAnalyzer, "getFlowToBuffer:", -[VCPMotionFlowObservation pixelBuffer](v12, "pixelBuffer"));
        else
          v20 = -[VCPImageMotionFlowAnalyzer scaleFlowTo:](motionFlowAnalyzer, "scaleFlowTo:", -[VCPMotionFlowObservation pixelBuffer](v12, "pixelBuffer"));
        v13 = v20;
        if (!v20)
        {
          a5 = v12;
          goto LABEL_12;
        }
      }
      else
      {
        v13 = -108;
      }
    }
  }
  else
  {
    v13 = -50;
  }
  if (a5)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: failed to analyze motion flow"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v13, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }
LABEL_12:

  return a5;
}

uint64_t __77__VCPMotionFlowRequest_estimateMotionBetweenFirstImage_andSecondImage_error___block_invoke()
{
  return 0;
}

- (id)estimateMotionBetweenFirstImage:(__CVBuffer *)a3 andSecondImage:(__CVBuffer *)a4 withUpsample:(BOOL)a5 withGuidedImage:(__CVBuffer *)a6 error:(id *)a7
{
  int Width;
  int Height;
  VCPMotionFlowObservation *v15;
  VCPMotionFlowObservation *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  VCPImageMotionFlowAnalyzer *motionFlowAnalyzer;
  uint64_t v24;
  OSType PixelFormatType;
  uint8_t buf[16];
  CFTypeRef cf;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  PixelFormatType = CVPixelBufferGetPixelFormatType(a6);
  cf = 0;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v15 = objc_alloc_init(VCPMotionFlowObservation);
  v16 = v15;
  if (!v15)
  {
    v17 = -50;
    goto LABEL_10;
  }
  -[VCPMotionFlowObservation setRevision:](v15, "setRevision:", 1);
  if (self->super._width >= 1 && self->super._height > 0)
  {
    Width = self->super._width;
    Height = self->super._height;
  }
  v17 = -[VCPImageMotionFlowAnalyzer analyzeImages:secondImage:cancel:](self->_motionFlowAnalyzer, "analyzeImages:secondImage:cancel:", a3, a4, &__block_literal_global_26);
  if (v17)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Fail in generating motion flow", buf, 2u);
    }
    goto LABEL_10;
  }
  if (self->super._useCPUOnly || !a5)
  {
    Height = -[VCPImageMotionFlowAnalyzer cnnOutputHeight](self->_motionFlowAnalyzer, "cnnOutputHeight");
    Width = -[VCPImageMotionFlowAnalyzer cnnOutputWidth](self->_motionFlowAnalyzer, "cnnOutputWidth");
  }
  -[VCPMotionFlowObservation setPixelBuffer:](v16, "setPixelBuffer:", VCPFlowCreatePixelBuffer(Width, Height, 0x32433068u, 32));
  if (!-[VCPMotionFlowObservation pixelBuffer](v16, "pixelBuffer"))
  {
    v17 = -108;
    goto LABEL_10;
  }
  if (self->super._useCPUOnly || !a5)
  {
    v22 = -[VCPImageMotionFlowAnalyzer getFlowToBuffer:](self->_motionFlowAnalyzer, "getFlowToBuffer:", -[VCPMotionFlowObservation pixelBuffer](v16, "pixelBuffer"));
  }
  else
  {
    if (a6)
    {
      if (PixelFormatType == 1111970369)
        cf = a6;
      else
        -[VCPMotionFlowRequest convertPixelBuffer:toPixelBuffer:withPixelFormat:](self, "convertPixelBuffer:toPixelBuffer:withPixelFormat:", a6, &cf, 1111970369);
      motionFlowAnalyzer = self->_motionFlowAnalyzer;
      v24 = -[VCPMotionFlowObservation pixelBuffer](v16, "pixelBuffer");
      v17 = -[VCPImageMotionFlowAnalyzer guidedUpsampling:inBGRA:](motionFlowAnalyzer, "guidedUpsampling:inBGRA:", v24, cf);
      if (!v17)
      {
        if (cf)
          CFRelease(cf);
        goto LABEL_31;
      }
      goto LABEL_10;
    }
    v22 = -[VCPImageMotionFlowAnalyzer scaleFlowTo:](self->_motionFlowAnalyzer, "scaleFlowTo:", -[VCPMotionFlowObservation pixelBuffer](v16, "pixelBuffer"));
  }
  v17 = v22;
  if (!v22)
  {
LABEL_31:
    a7 = v16;
    goto LABEL_12;
  }
LABEL_10:
  if (a7)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: failed to analyze motion flow"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v17, v20);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    a7 = 0;
  }
LABEL_12:

  return a7;
}

uint64_t __106__VCPMotionFlowRequest_estimateMotionBetweenFirstImage_andSecondImage_withUpsample_withGuidedImage_error___block_invoke()
{
  return 0;
}

- (BOOL)updateWithOptions:(id)a3 error:(id *)a4
{
  int width;
  int height;
  unsigned int motionFlowComputationAccuracy;
  double v8;
  int v9;
  VCPImageMotionFlowAnalyzer *motionFlowAnalyzer;
  void *v12;
  int v13;
  objc_super v15;

  width = self->super._width;
  height = self->super._height;
  motionFlowComputationAccuracy = self->super._motionFlowComputationAccuracy;
  v15.receiver = self;
  v15.super_class = (Class)VCPMotionFlowRequest;
  -[VCPRequest updateWithOptions:error:](&v15, sel_updateWithOptions_error_, a3, a4);
  v9 = self->super._width;
  if (__PAIR64__(height, width) == *(_QWORD *)&self->super._width)
  {
    if (width < 1 || motionFlowComputationAccuracy == self->super._motionFlowComputationAccuracy)
      return 1;
  }
  else
  {
    if (v9 < 1)
      return 1;
    height = self->super._height;
  }
  if (height >= 1)
  {
    motionFlowAnalyzer = self->_motionFlowAnalyzer;
    *(float *)&v8 = (float)v9 / (float)height;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[VCPImageMotionFlowAnalyzer updateModelForAspectRatio:computationAccuracy:](motionFlowAnalyzer, "updateModelForAspectRatio:computationAccuracy:", v12, self->super._motionFlowComputationAccuracy);

    return v13 == 0;
  }
  return 1;
}

- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4
{
  VCPImageMotionFlowAnalyzer *motionFlowAnalyzer;
  double preferredWidth;
  double preferredHeight;
  CGSize result;

  motionFlowAnalyzer = self->_motionFlowAnalyzer;
  if (motionFlowAnalyzer)
    -[VCPImageMotionFlowAnalyzer preferredInputFormat:height:format:](motionFlowAnalyzer, "preferredInputFormat:height:format:", &self->_preferredWidth, &self->_preferredHeight, &self->_preferredFormat);
  preferredWidth = (double)self->_preferredWidth;
  preferredHeight = (double)self->_preferredHeight;
  result.height = preferredHeight;
  result.width = preferredWidth;
  return result;
}

- (unsigned)preferredPixelFormat
{
  return self->_preferredFormat;
}

- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4
{
  VCPImageMotionFlowAnalyzer *motionFlowAnalyzer;

  motionFlowAnalyzer = self->_motionFlowAnalyzer;
  self->_motionFlowAnalyzer = 0;

  return 1;
}

- (void)dealloc
{
  OpaqueVTPixelTransferSession *transferSession;
  VCPImageMotionFlowAnalyzer *motionFlowAnalyzer;
  objc_super v5;

  transferSession = self->_transferSession;
  if (transferSession)
    CFRelease(transferSession);
  motionFlowAnalyzer = self->_motionFlowAnalyzer;
  self->_motionFlowAnalyzer = 0;

  v5.receiver = self;
  v5.super_class = (Class)VCPMotionFlowRequest;
  -[VCPMotionFlowRequest dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionFlowAnalyzer, 0);
}

@end
