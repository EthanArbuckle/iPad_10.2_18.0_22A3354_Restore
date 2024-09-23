@implementation VCPMotionFlowSubtleMotionAnalyzer

- (VCPMotionFlowSubtleMotionAnalyzer)init
{
  VCPMotionFlowSubtleMotionAnalyzer *v2;
  VCPMotionFlowSubtleMotionAnalyzer *v3;
  VCPImageMotionFlowAnalyzer *motionFlowAnalyzer;
  VCPMotionFlowRequest *moflowRequest;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VCPMotionFlowSubtleMotionAnalyzer;
  v2 = -[VCPMotionFlowSubtleMotionAnalyzer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_frameArray.__end_ = v2->_frameArray.__begin_;
    v2->_flow = 0;
    v2->_block = 0;
    v2->_transferSession = 0;
    v2->_scale = 0;
    motionFlowAnalyzer = v2->_motionFlowAnalyzer;
    v2->_motionFlowAnalyzer = 0;

    moflowRequest = v3->_moflowRequest;
    v3->_moflowRequest = 0;

    v3->_subtleMotionScore = 0.0;
    v3->_frameWidth = 0;
    v3->_frameHeight = 0;
    v3->_downScaleWidth = 0;
    v3->_downScaleHeight = 0;
    v3->_blockSize = 0;
    v3->_flowWidth = 0;
    v3->_flowHeight = 0;
    v3->_frameNum = 0;
    v3->_sceneType = 0;
    v3->_initialized = 0;
    v3->_useR2D2 = objc_msgSend((id)objc_opt_class(), "enableR2D2");
  }
  return v3;
}

+ (BOOL)enableR2D2
{
  BOOL result;

  if ((DeviceHasANE() & 1) == 0)
    return +[VCPMotionFlowSubtleMotionAnalyzer enableR2D2]::enable;
  result = 1;
  +[VCPMotionFlowSubtleMotionAnalyzer enableR2D2]::enable = 1;
  return result;
}

- (void)dealloc
{
  vector<__CVBuffer *, std::allocator<__CVBuffer *>> *p_frameArray;
  __CVBuffer **end;
  __CVBuffer **begin;
  unint64_t v6;
  __CVBuffer *v7;
  OpaqueVTPixelTransferSession *transferSession;
  float *block;
  float *flow;
  objc_super v11;

  p_frameArray = &self->_frameArray;
  begin = self->_frameArray.__begin_;
  end = self->_frameArray.__end_;
  if (end != begin)
  {
    v6 = 0;
    do
    {
      v7 = begin[v6];
      if (v7)
      {
        CFRelease(v7);
        begin[v6] = 0;
        begin = p_frameArray->__begin_;
        end = p_frameArray->__end_;
      }
      ++v6;
    }
    while (v6 < end - begin);
  }
  transferSession = self->_transferSession;
  if (transferSession)
    CFRelease(transferSession);
  block = self->_block;
  if (block)
    MEMORY[0x1BCCA128C](block, 0x1000C8052888210);
  if (self->_useR2D2)
  {
    flow = self->_flow;
    if (flow)
      MEMORY[0x1BCCA128C](flow, 0x1000C8052888210);
  }
  v11.receiver = self;
  v11.super_class = (Class)VCPMotionFlowSubtleMotionAnalyzer;
  -[VCPMotionFlowSubtleMotionAnalyzer dealloc](&v11, sel_dealloc);
}

- (int)prepareAnalyzerWithCVPixelBuffer:(__CVBuffer *)a3 cancel:(id)a4
{
  id v6;
  int Width;
  int Height;
  double v9;
  int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  int v14;
  uint64_t frameWidth;
  size_t v16;
  float *v17;
  void *v18;
  void *v19;
  void *v20;
  VCPMotionFlowRequest *v21;
  VCPMotionFlowRequest *moflowRequest;
  int blockSize;
  void *v24;
  VCPImageMotionFlowAnalyzer *v25;
  VCPImageMotionFlowAnalyzer *motionFlowAnalyzer;
  int v27;
  size_t v28;
  float *v29;
  int v30;
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  self->_frameWidth = Width;
  self->_frameHeight = Height;
  if (Width <= Height)
    v10 = Height;
  else
    v10 = Width;
  if (v10 != 580)
  {
    self->_scale = 1;
    v11 = (vcvtps_s32_f32((float)((float)Width * 580.0) / (float)Height) + 1) & 0xFFFFFFFE;
    if (Width <= Height)
      v12 = v11;
    else
      v12 = 580;
    self->_downScaleWidth = v12;
    v13 = (vcvtps_s32_f32((float)((float)Height * 580.0) / (float)Width) + 1) & 0xFFFFFFFE;
    if (Width >= Height)
      v14 = v13;
    else
      v14 = 580;
    self->_downScaleHeight = v14;
  }
  if (self->_useR2D2)
  {
    frameWidth = self->_frameWidth;
    if ((((_DWORD)frameWidth * self->_frameHeight) & 0x40000000) != 0)
      v16 = -1;
    else
      v16 = 8 * (int)frameWidth * self->_frameHeight;
    v17 = (float *)operator new[](v16, MEMORY[0x1E0DE4E10]);
    self->_flow = v17;
    if (!v17)
      goto LABEL_24;
    v32[0] = CFSTR("frameWidth");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", frameWidth);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v18;
    v32[1] = CFSTR("frameHeight");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_frameHeight);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = CFSTR("motionFlowComputationAccuracy");
    v33[1] = v19;
    v33[2] = &unk_1E6B74828;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = -[VCPMotionFlowRequest initWithOptions:cancel:]([VCPMotionFlowRequest alloc], "initWithOptions:cancel:", v20, v6);
    moflowRequest = self->_moflowRequest;
    self->_moflowRequest = v21;

    self->_blockSize = 40;
    blockSize = self->_blockSize;
  }
  else
  {
    *(float *)&v9 = (float)self->_frameWidth / (float)self->_frameHeight;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPImageMotionFlowAnalyzer analyzeWithLightweightOption:aspectRatio:computationAccuracy:forceCPU:sharedModel:flushModel:cancel:](VCPImageMotionFlowAnalyzer, "analyzeWithLightweightOption:aspectRatio:computationAccuracy:forceCPU:sharedModel:flushModel:cancel:", 0, v24, 1, 0, 1, 1, v6);
    v25 = (VCPImageMotionFlowAnalyzer *)objc_claimAutoreleasedReturnValue();
    motionFlowAnalyzer = self->_motionFlowAnalyzer;
    self->_motionFlowAnalyzer = v25;

    blockSize = 8;
    self->_blockSize = 8;
  }
  v27 = 2 * blockSize * blockSize;
  if (v27 < 0)
    v28 = -1;
  else
    v28 = 4 * v27;
  v29 = (float *)operator new[](v28, MEMORY[0x1E0DE4E10]);
  self->_block = v29;
  if (!v29)
  {
LABEL_24:
    v30 = -108;
    goto LABEL_25;
  }
  v30 = 0;
  self->_initialized = 1;
LABEL_25:

  return v30;
}

- (int)convertFlow:(__CVBuffer *)a3
{
  int Width;
  int Height;
  int BytesPerRow;
  float *flow;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *BaseAddress;
  uint64_t v28;
  uint64_t v29;
  float *v30;
  uint64_t v31;
  char *v32;
  int v40;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  flow = self->_flow;
  pixelBuffer = a3;
  unlockFlags = 1;
  if (a3)
  {
    v9 = BytesPerRow;
    v10 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    v40 = v10;
    if ((_DWORD)v10)
    {
      v11 = v10;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[VCPImageConverter convertImage:yuvFrame:].cold.3((uint64_t)a3, v11, v12, v13, v14, v15, v16, v17);
    }
    else
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      if (Height >= 1)
      {
        v28 = 0;
        v29 = 0;
        v30 = &flow[Width * Height];
        do
        {
          if (Width >= 1)
          {
            v31 = 0;
            do
            {
              v32 = &BaseAddress[2 * v31 + (v28 & 0xFFFFFFFFFFFFFFFELL)];
              _H1 = *(_WORD *)v32;
              __asm { FCVT            S1, H1 }
              *flow++ = _S1 / 1.3;
              LOWORD(_S1) = *((_WORD *)v32 + 1);
              __asm { FCVT            S1, H1 }
              *v30++ = _S1 / 1.3;
              v31 += 2;
            }
            while (v31 < 2 * Width);
          }
          ++v29;
          v28 += v9;
        }
        while (v29 != Height);
      }
      LODWORD(v11) = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v40);
      if (pixelBuffer
        && !v40
        && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
      }
    }
  }
  else
  {
    v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v18)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    LODWORD(v11) = -50;
  }
  return v11;
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
    result = -[VCPMotionFlowSubtleMotionAnalyzer createPixelBufferWithWidth:height:pixelFormat:pixelBuffer:](self, "createPixelBufferWithWidth:height:pixelFormat:pixelBuffer:", Width, CVPixelBufferGetHeight(a3), v5, a4);
    if (!result)
      return VTPixelTransferSessionTransferImage(*p_transferSession, a3, *a4);
  }
  return result;
}

- (int)preProcessing:(__CVBuffer *)a3
{
  unsigned int Width;
  int result;
  vector<__CVBuffer *, std::allocator<__CVBuffer *>> *p_frameArray;
  CFTypeRef *begin;
  char *end;
  uint64_t v10;
  __CVBuffer **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  __CVBuffer **v17;
  uint64_t v18;
  __CVBuffer **v19;
  __CVBuffer **v20;
  __CVBuffer **v21;
  __CVBuffer **v22;
  __CVBuffer *v23;
  int64_t v24;
  __CVBuffer **value;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  __CVBuffer **v31;
  __CVBuffer *v32;
  __CVBuffer *v33;

  v33 = 0;
  Width = CVPixelBufferGetWidth(a3);
  if (*(_QWORD *)&self->_frameWidth != __PAIR64__(CVPixelBufferGetHeight(a3), Width))
    return -50;
  if (self->_scale)
  {
    Scaler::Scale(&self->_scaler, a3, &v33, self->_downScaleWidth, self->_downScaleHeight, 875704438);
    if (!result)
    {
LABEL_8:
      p_frameArray = &self->_frameArray;
      begin = (CFTypeRef *)p_frameArray->__begin_;
      end = (char *)p_frameArray->__end_;
      v10 = end - (char *)p_frameArray->__begin_;
      if ((unint64_t)v10 > 0xF)
      {
        if (*begin)
        {
          CFRelease(*begin);
          *begin = 0;
          begin = (CFTypeRef *)p_frameArray->__begin_;
          end = (char *)p_frameArray->__end_;
        }
        v24 = end - (char *)(begin + 1);
        if (end != (char *)(begin + 1))
          memmove(begin, begin + 1, end - (char *)(begin + 1));
        end -= 8;
        value = p_frameArray->__end_cap_.__value_;
        p_frameArray->__end_ = (__CVBuffer **)((char *)begin + v24);
        if ((char *)begin + v24 >= (char *)value)
        {
          v26 = (end - (char *)p_frameArray->__begin_) >> 3;
          if ((unint64_t)(v26 + 1) >> 61)
            std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
          v27 = (char *)value - (char *)p_frameArray->__begin_;
          v28 = v27 >> 2;
          if (v27 >> 2 <= (unint64_t)(v26 + 1))
            v28 = v26 + 1;
          if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8)
            v29 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v29 = v28;
          if (v29)
            v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<VCPProtoKeypoint>>>((uint64_t)&p_frameArray->__end_cap_, v29);
          else
            v30 = 0;
          v17 = (__CVBuffer **)&v30[8 * v26];
          v19 = (__CVBuffer **)&v30[8 * v29];
          *v17 = v33;
          v20 = v17 + 1;
          v31 = p_frameArray->__begin_;
          v21 = p_frameArray->__end_;
          if (v21 == p_frameArray->__begin_)
            goto LABEL_37;
          do
          {
            v32 = *--v21;
            *--v17 = v32;
          }
          while (v21 != v31);
          goto LABEL_36;
        }
      }
      else
      {
        v11 = p_frameArray->__end_cap_.__value_;
        if (end >= (char *)v11)
        {
          v12 = v10 >> 3;
          v13 = (char *)v11 - (char *)begin;
          if (v13 >> 2 <= (unint64_t)((v10 >> 3) + 1))
            v14 = v12 + 1;
          else
            v14 = v13 >> 2;
          if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
            v15 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v15 = v14;
          v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<VCPProtoKeypoint>>>((uint64_t)&p_frameArray->__end_cap_, v15);
          v17 = (__CVBuffer **)&v16[8 * v12];
          v19 = (__CVBuffer **)&v16[8 * v18];
          *v17 = v33;
          v20 = v17 + 1;
          v22 = p_frameArray->__begin_;
          v21 = p_frameArray->__end_;
          if (v21 == p_frameArray->__begin_)
            goto LABEL_37;
          do
          {
            v23 = *--v21;
            *--v17 = v23;
          }
          while (v21 != v22);
LABEL_36:
          v21 = p_frameArray->__begin_;
LABEL_37:
          p_frameArray->__begin_ = v17;
          p_frameArray->__end_ = v20;
          p_frameArray->__end_cap_.__value_ = v19;
          if (v21)
            operator delete(v21);
          goto LABEL_39;
        }
      }
      *(_QWORD *)end = v33;
      v20 = (__CVBuffer **)(end + 8);
LABEL_39:
      result = 0;
      p_frameArray->__end_ = v20;
    }
  }
  else
  {
    result = -[VCPMotionFlowSubtleMotionAnalyzer convertPixelBuffer:toPixelBuffer:withPixelFormat:](self, "convertPixelBuffer:toPixelBuffer:withPixelFormat:", a3, &v33, 875704438);
    if (!result)
      goto LABEL_8;
  }
  return result;
}

- (int)generateMotionFlow
{
  __CVBuffer **begin;
  unint64_t v4;
  __CVBuffer *v5;
  __CVBuffer *v6;
  VCPMotionFlowRequest *moflowRequest;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint32_t v12;
  VCPImageMotionFlowAnalyzer *motionFlowAnalyzer;
  int v14;
  int v15;
  NSObject *v16;
  const char *v17;
  float *v18;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  begin = self->_frameArray.__begin_;
  v4 = (unint64_t)((char *)self->_frameArray.__end_ - (char *)begin) >> 3;
  if ((int)v4 <= 1)
    LODWORD(v4) = 1;
  v5 = begin[(v4 - 1)];
  v6 = *begin;
  if (self->_useR2D2)
  {
    moflowRequest = self->_moflowRequest;
    v20 = 0;
    -[VCPMotionFlowRequest estimateMotionBetweenFirstImage:andSecondImage:withUpsample:withGuidedImage:error:](moflowRequest, "estimateMotionBetweenFirstImage:andSecondImage:withUpsample:withGuidedImage:error:", v6, v5, 1, 0, &v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v20;
    self->_flowWidth = self->_frameWidth;
    self->_flowHeight = self->_frameHeight;
    if (v9)
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      v10 = MEMORY[0x1E0C81028];
      v11 = "[MotionFlowSubtleMotionAnalyzer] Failed to request flow from VCPMotionFlowRequest: %@";
      v12 = 12;
LABEL_8:
      _os_log_impl(&dword_1B6C4A000, v10, OS_LOG_TYPE_ERROR, v11, buf, v12);
LABEL_25:

      return -18;
    }
    if (!objc_msgSend(v8, "pixelBuffer"))
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_WORD *)buf = 0;
      v10 = MEMORY[0x1E0C81028];
      v11 = "Motion flow is null";
      v12 = 2;
      goto LABEL_8;
    }
    -[VCPMotionFlowSubtleMotionAnalyzer convertFlow:](self, "convertFlow:", objc_msgSend(v8, "pixelBuffer"));

    return 0;
  }
  motionFlowAnalyzer = self->_motionFlowAnalyzer;
  if (!motionFlowAnalyzer)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return -18;
    *(_WORD *)buf = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "Fail to initialize motionFlowAnalyzer";
    goto LABEL_19;
  }
  v14 = -[VCPImageMotionFlowAnalyzer analyzeImages:secondImage:cancel:](motionFlowAnalyzer, "analyzeImages:secondImage:cancel:", v5, v6, &__block_literal_global_62);
  if (!v14)
  {
    v18 = -[VCPImageMotionFlowAnalyzer getFlowWithHeight:andWidth:](self->_motionFlowAnalyzer, "getFlowWithHeight:andWidth:", &self->_flowHeight, &self->_flowWidth);
    self->_flow = v18;
    if (v18)
      return 0;
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return -18;
    *(_WORD *)buf = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "Motion flow is null";
LABEL_19:
    _os_log_impl(&dword_1B6C4A000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    return -18;
  }
  v15 = v14;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Fail in generating motion flow", buf, 2u);
  }
  return v15;
}

uint64_t __55__VCPMotionFlowSubtleMotionAnalyzer_generateMotionFlow__block_invoke()
{
  return 0;
}

- (int)generateSubleMotionScore:(void *)a3
{
  _BYTE *v3;
  int flowHeight;
  float *v6;
  int v7;
  float *flow;
  int flowWidth;
  float *v10;
  int blockSize;
  int v12;
  int v13;
  float *block;
  int v15;
  size_t v16;
  int v17;
  float *v18;
  float *v19;
  uint64_t v20;
  vDSP_Length v21;
  int v22;
  float v23;
  float *v24;
  float *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  float *v31;
  int v32;
  float *v33;
  unint64_t v34;
  uint64_t v35;
  float *v36;
  uint64_t v37;
  float v38;
  float v39;
  float v40;
  uint64_t v41;
  float32x4_t v42;
  int8x16_t v43;
  int8x16_t v44;
  float v45;
  float v46;
  BOOL v47;
  float v48;
  float *v51;
  float *v52;
  int v53;
  int v54;
  int v55;
  float *v56;
  uint64_t __Mean;
  uint64_t __StandardDeviation;
  void *__p;
  float *v60;
  float *v61;

  v3 = a3;
  __p = 0;
  v60 = 0;
  v61 = 0;
  flowHeight = self->_flowHeight;
  if (flowHeight < 1)
  {
    v6 = 0;
    v33 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    flow = self->_flow;
    flowWidth = self->_flowWidth;
    v10 = &flow[flowHeight * flowWidth];
    blockSize = self->_blockSize;
    do
    {
      if (blockSize >= flowHeight - v7)
        v12 = flowHeight - v7;
      else
        v12 = blockSize;
      if (flowWidth >= 1)
      {
        v13 = 0;
        v51 = v10;
        v52 = flow;
        v56 = v10;
        v53 = v12;
        v54 = v7;
        do
        {
          block = self->_block;
          __Mean = 0;
          __StandardDeviation = 0;
          v15 = flowWidth - v13;
          if (blockSize < v15)
            v15 = blockSize;
          v55 = v15;
          if (v12 >= 1)
          {
            v16 = 4 * v15;
            v17 = v12;
            v18 = v56;
            v19 = flow;
            do
            {
              memcpy(block, v19, v16);
              memcpy(&block[self->_blockSize * self->_blockSize], v18, v16);
              v20 = self->_flowWidth;
              v19 += v20;
              v18 += v20;
              block = (float *)((char *)block + v16);
              --v17;
            }
            while (v17);
            block = self->_block;
            v12 = v53;
            v7 = v54;
            v15 = v55;
          }
          v21 = v15 * v12;
          vDSP_normalize(block, 1, 0, 1, (float *)&__StandardDeviation, (float *)&__StandardDeviation + 1, v21);
          vDSP_normalize(&self->_block[self->_blockSize * self->_blockSize], 1, 0, 1, (float *)&__Mean, (float *)&__Mean + 1, v21);
          v22 = self->_blockSize;
          v23 = 0.0;
          if (v7 >= v22 && v13 >= v22 && v7 < self->_flowHeight - v22 && v13 < self->_flowWidth - v22)
            v23 = sqrtf((float)(*((float *)&__Mean + 1) * *((float *)&__Mean + 1))+ (float)(*((float *)&__StandardDeviation + 1) * *((float *)&__StandardDeviation + 1)));
          v24 = v60;
          if (v60 >= v61)
          {
            v25 = (float *)__p;
            v26 = ((char *)v60 - (_BYTE *)__p) >> 2;
            v27 = v26 + 1;
            if ((unint64_t)(v26 + 1) >> 62)
              std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
            v28 = (char *)v61 - (_BYTE *)__p;
            if (((char *)v61 - (_BYTE *)__p) >> 1 > v27)
              v27 = v28 >> 1;
            if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL)
              v29 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v29 = v27;
            if (v29)
            {
              v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v61, v29);
              v25 = (float *)__p;
              v24 = v60;
            }
            else
            {
              v30 = 0;
            }
            v31 = (float *)&v30[4 * v26];
            *v31 = v23;
            v6 = v31 + 1;
            while (v24 != v25)
            {
              v32 = *((_DWORD *)v24-- - 1);
              *((_DWORD *)v31-- - 1) = v32;
            }
            __p = v31;
            v60 = v6;
            v61 = (float *)&v30[4 * v29];
            if (v25)
              operator delete(v25);
          }
          else
          {
            *v60 = v23;
            v6 = v24 + 1;
          }
          v60 = v6;
          flow += v55;
          v56 += v55;
          blockSize = self->_blockSize;
          v13 += blockSize;
          flowWidth = self->_flowWidth;
        }
        while (v13 < flowWidth);
        flowHeight = self->_flowHeight;
        v10 = v51;
        flow = v52;
      }
      flow += flowWidth * v12;
      v10 += flowWidth * v12;
      v7 += blockSize;
    }
    while (v7 < flowHeight);
    v33 = (float *)__p;
    v3 = a3;
  }
  v34 = 126 - 2 * __clz(v6 - v33);
  if (v6 == v33)
    v35 = 0;
  else
    v35 = v34;
  std::__introsort<std::_ClassicAlgPolicy,std::greater<float> &,float *,false>(v33, v6, (uint64_t)&__StandardDeviation + 4, v35, 1);
  v36 = (float *)__p;
  if ((self->_sceneType & 0xFFFFFFFE) == 2)
  {
    v37 = 0;
    v38 = 0.0;
    do
    {
      v39 = *(float *)((char *)__p + v37);
      if (v39 <= 0.1)
        v39 = -0.0;
      v38 = v38 + v39;
      v37 += 4;
    }
    while (v37 != 12);
    v40 = 3.0;
  }
  else
  {
    v41 = 0;
    v38 = 0.0;
    v42 = (float32x4_t)vdupq_n_s32(0x3DCCCCCDu);
    v43.i64[0] = 0x8000000080000000;
    v43.i64[1] = 0x8000000080000000;
    do
    {
      v44 = vbslq_s8((int8x16_t)vcgtq_f32(*(float32x4_t *)((char *)__p + v41), v42), *(int8x16_t *)((char *)__p + v41), v43);
      v38 = (float)((float)((float)(v38 + *(float *)v44.i32) + *(float *)&v44.i32[1]) + *(float *)&v44.i32[2])
          + *(float *)&v44.i32[3];
      v41 += 16;
    }
    while (v41 != 48);
    v40 = 12.0;
  }
  v45 = v38 / v40;
  if (v3[196])
  {
    v46 = (float)((float)(v45 + -0.042) / 0.291) * 10.0;
    if (v45 >= 0.333)
      v46 = 10.0;
    v47 = v45 > 0.042;
    v48 = 0.0;
    if (v47)
      v48 = v46;
    self->_subtleMotionScore = v48;
  }
  v60 = v36;
  operator delete(v36);
  return 0;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 withFrame:(void *)a4 withTimestamp:(id *)a5 andDuration:(id *)a6 hasSubtleScene:(int)a7 cancel:(id)a8
{
  id v12;
  float subtleMotionScore;
  int frameNum;
  int v15;
  int v17;
  int v18;
  float v19;

  v12 = a8;
  self->_sceneType = a7;
  if (!a7)
    goto LABEL_10;
  if (!*((_BYTE *)a4 + 196))
    goto LABEL_6;
  if (*((float *)a4 + 44) > 5.0)
  {
    subtleMotionScore = self->_subtleMotionScore;
    if (*((float *)a4 + 48) < subtleMotionScore)
      *((float *)a4 + 48) = subtleMotionScore;
LABEL_6:
    a7 = 0;
    frameNum = self->_frameNum;
    if ((frameNum % 6) <= 1)
      v15 = -(frameNum % 6);
    else
      v15 = 1;
    self->_frameNum = v15 + frameNum;
    goto LABEL_10;
  }
  if (!self->_initialized)
  {
    a7 = -[VCPMotionFlowSubtleMotionAnalyzer prepareAnalyzerWithCVPixelBuffer:cancel:](self, "prepareAnalyzerWithCVPixelBuffer:cancel:", a3, v12);
    if (a7)
      goto LABEL_10;
  }
  v17 = self->_frameNum % 6;
  if (!v17)
  {
    v18 = -[VCPMotionFlowSubtleMotionAnalyzer preProcessing:](self, "preProcessing:", a3);
LABEL_20:
    a7 = v18;
    if (v18)
      goto LABEL_10;
    goto LABEL_21;
  }
  if (v17 == 1)
  {
    a7 = -[VCPMotionFlowSubtleMotionAnalyzer preProcessing:](self, "preProcessing:", a3);
    if (a7)
      goto LABEL_10;
    a7 = -[VCPMotionFlowSubtleMotionAnalyzer generateMotionFlow](self, "generateMotionFlow");
    if (a7)
      goto LABEL_10;
    v18 = -[VCPMotionFlowSubtleMotionAnalyzer generateSubleMotionScore:](self, "generateSubleMotionScore:", a4);
    goto LABEL_20;
  }
LABEL_21:
  v19 = self->_subtleMotionScore;
  if (*((float *)a4 + 48) < v19 && *((_BYTE *)a4 + 196))
    *((float *)a4 + 48) = v19;
  a7 = 0;
  ++self->_frameNum;
LABEL_10:

  return a7;
}

- (float)subtleMotionScore
{
  return self->_subtleMotionScore;
}

- (void).cxx_destruct
{
  vector<__CVBuffer *, std::allocator<__CVBuffer *>> *p_frameArray;
  __CVBuffer **begin;
  Scaler *p_scaler;

  p_frameArray = &self->_frameArray;
  begin = self->_frameArray.__begin_;
  if (begin)
  {
    p_frameArray->__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_moflowRequest, 0);
  objc_storeStrong((id *)&self->_motionFlowAnalyzer, 0);
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_DWORD *)self + 12) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

@end
