@implementation VCPMotionFlowAnalyzer

- (VCPMotionFlowAnalyzer)init
{
  VCPMotionFlowAnalyzer *v2;
  VCPMotionFlowAnalyzer *v3;
  VCPMotionFlowRequest *moflowRequest;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VCPMotionFlowAnalyzer;
  v2 = -[VCPMotionFlowAnalyzer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_frameArray.__end_ = v2->_frameArray.__begin_;
    v2->_flow = 0;
    v2->_transferSession = 0;
    v2->_scale = 0;
    moflowRequest = v2->_moflowRequest;
    v2->_moflowRequest = 0;

    v3->_frameWidth = 0;
    v3->_frameHeight = 0;
    v3->_downScaleWidth = 0;
    v3->_downScaleHeight = 0;
    v3->_flowWidth = 0;
    v3->_flowHeight = 0;
    v3->_frameNum = 0;
    v3->_initialized = 0;
  }
  return v3;
}

- (void)dealloc
{
  vector<__CVBuffer *, std::allocator<__CVBuffer *>> *p_frameArray;
  __CVBuffer **end;
  __CVBuffer **begin;
  unint64_t v6;
  __CVBuffer *v7;
  OpaqueVTPixelTransferSession *transferSession;
  float *flow;
  objc_super v10;

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
  flow = self->_flow;
  if (flow)
    MEMORY[0x1BCCA128C](flow, 0x1000C8052888210);
  v10.receiver = self;
  v10.super_class = (Class)VCPMotionFlowAnalyzer;
  -[VCPMotionFlowAnalyzer dealloc](&v10, sel_dealloc);
}

- (int)prepareAnalyzerWithCVPixelBuffer:(__CVBuffer *)a3 cancel:(id)a4
{
  id v6;
  int Width;
  int Height;
  int v9;
  unsigned int v10;
  unsigned int v11;
  size_t v12;
  float *v13;
  void *v14;
  void *v15;
  void *v16;
  VCPMotionFlowRequest *v17;
  VCPMotionFlowRequest *moflowRequest;
  int v19;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  self->_frameWidth = Width;
  self->_frameHeight = Height;
  if (Width <= Height)
    v9 = Height;
  else
    v9 = Width;
  if (v9 != 580)
  {
    self->_scale = 1;
    if (Width <= Height)
      v10 = (vcvtps_s32_f32((float)((float)Width * 580.0) / (float)Height) + 1) & 0xFFFFFFFE;
    else
      v10 = 580;
    self->_downScaleWidth = v10;
    if (Width >= Height)
      v11 = (vcvtps_s32_f32((float)((float)Height * 580.0) / (float)Width) + 1) & 0xFFFFFFFE;
    else
      v11 = 580;
    self->_downScaleHeight = v11;
    Height = self->_frameHeight;
  }
  if (((self->_frameWidth * Height) & 0x40000000) != 0)
    v12 = -1;
  else
    v12 = 8 * self->_frameWidth * Height;
  v13 = (float *)operator new[](v12, MEMORY[0x1E0DE4E10]);
  self->_flow = v13;
  if (v13)
  {
    v21[0] = CFSTR("frameWidth");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_downScaleWidth);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    v21[1] = CFSTR("frameHeight");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_downScaleHeight);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = CFSTR("motionFlowComputationAccuracy");
    v22[1] = v15;
    v22[2] = &unk_1E6B74F60;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = -[VCPMotionFlowRequest initWithOptions:cancel:]([VCPMotionFlowRequest alloc], "initWithOptions:cancel:", v16, v6);
    moflowRequest = self->_moflowRequest;
    self->_moflowRequest = v17;

    self->_initialized = 1;
    v19 = 0;
  }
  else
  {
    v19 = -108;
  }

  return v19;
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
              _H0 = *(_WORD *)v32;
              __asm { FCVT            S0, H0 }
              *(_DWORD *)flow++ = _S0;
              LOWORD(_S0) = *((_WORD *)v32 + 1);
              __asm { FCVT            S0, H0 }
              *(_DWORD *)v30++ = _S0;
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
    result = -[VCPMotionFlowAnalyzer createPixelBufferWithWidth:height:pixelFormat:pixelBuffer:](self, "createPixelBufferWithWidth:height:pixelFormat:pixelBuffer:", Width, CVPixelBufferGetHeight(a3), v5, a4);
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
    result = -[VCPMotionFlowAnalyzer convertPixelBuffer:toPixelBuffer:withPixelFormat:](self, "convertPixelBuffer:toPixelBuffer:withPixelFormat:", a3, &v33, 875704438);
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
  int v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  begin = self->_frameArray.__begin_;
  v4 = (unint64_t)((char *)self->_frameArray.__end_ - (char *)begin) >> 3;
  if ((int)v4 <= 1)
    LODWORD(v4) = 1;
  v5 = begin[(v4 - 1)];
  v6 = *begin;
  moflowRequest = self->_moflowRequest;
  v15 = 0;
  -[VCPMotionFlowRequest estimateMotionBetweenFirstImage:andSecondImage:withUpsample:withGuidedImage:error:](moflowRequest, "estimateMotionBetweenFirstImage:andSecondImage:withUpsample:withGuidedImage:error:", v5, v6, 1, 0, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  self->_flowWidth = self->_frameWidth;
  self->_flowHeight = self->_frameHeight;
  if (v9)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    v10 = MEMORY[0x1E0C81028];
    v11 = "[MotionFlowAnalyzer] Failed to request flow from VCPMotionFlowRequest: %@";
    v12 = 12;
LABEL_7:
    _os_log_impl(&dword_1B6C4A000, v10, OS_LOG_TYPE_ERROR, v11, buf, v12);
LABEL_13:
    v13 = -18;
    goto LABEL_14;
  }
  if (!objc_msgSend(v8, "pixelBuffer"))
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v10 = MEMORY[0x1E0C81028];
    v11 = "Motion flow is null";
    v12 = 2;
    goto LABEL_7;
  }
  -[VCPMotionFlowAnalyzer convertFlow:](self, "convertFlow:", objc_msgSend(v8, "pixelBuffer"));
  v13 = 0;
LABEL_14:

  return v13;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 withFrame:(void *)a4 withTimestamp:(id *)a5 andDuration:(id *)a6 cancel:(id)a7
{
  id v10;
  int v11;

  v10 = a7;
  if (self->_initialized
    || (v11 = -[VCPMotionFlowAnalyzer prepareAnalyzerWithCVPixelBuffer:cancel:](self, "prepareAnalyzerWithCVPixelBuffer:cancel:", a3, v10)) == 0)
  {
    v11 = -[VCPMotionFlowAnalyzer preProcessing:](self, "preProcessing:", a3);
    if (!v11)
    {
      v11 = -[VCPMotionFlowAnalyzer generateMotionFlow](self, "generateMotionFlow");
      if (!v11)
      {
        *((_QWORD *)a4 + 42) = self->_flow;
        ++self->_frameNum;
      }
    }
  }

  return v11;
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
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_DWORD *)self + 10) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
