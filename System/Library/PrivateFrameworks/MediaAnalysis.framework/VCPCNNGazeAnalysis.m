@implementation VCPCNNGazeAnalysis

- (VCPCNNGazeAnalysis)init
{
  void *v3;
  void *v4;
  void *v5;
  VCPCNNGazeAnalysis *v6;
  VCPCNNModelEspresso *v7;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v9;
  VCPCNNGazeAnalysis *v10;
  VCPCNNGazeAnalysis *v11;
  VCPCNNModelEspresso *v13;
  VCPCNNModelEspresso *v14;
  VCPCNNModelEspresso *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  size_t v19;
  float *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;

  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_blink.espresso.net"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)VCPCNNGazeAnalysis;
  v6 = -[VCPCNNGazeAnalysis init](&v24, sel_init);
  if (!v6)
    goto LABEL_7;
  if (DeviceHasANE())
  {
    objc_msgSend((id)objc_opt_class(), "sharedModel:", v5);
    v7 = (VCPCNNModelEspresso *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", v5, 0, 0, 0);
  }
  modelEspresso = v6->_modelEspresso;
  v6->_modelEspresso = v7;

  v9 = v6->_modelEspresso;
  if (!v9 || -[VCPCNNModelEspresso prepareModelWithConfig:](v9, "prepareModelWithConfig:", &stru_1E6B1C190))
    goto LABEL_7;
  v13 = v6->_modelEspresso;
  if (v13 && (-[VCPCNNModelEspresso inputBlob](v13, "inputBlob"), (v14 = v6->_modelEspresso) != 0))
  {
    -[VCPCNNModelEspresso inputBlob](v14, "inputBlob");
    v15 = v6->_modelEspresso;
    v16 = v22 * v23;
    if (v15)
    {
      -[VCPCNNModelEspresso inputBlob](v15, "inputBlob");
      v17 = v21;
      goto LABEL_15;
    }
  }
  else
  {
    v16 = 0;
  }
  v17 = 0;
LABEL_15:
  v18 = v16 * v17;
  if (v18 >> 62)
    v19 = -1;
  else
    v19 = 4 * v18;
  v20 = (float *)operator new[](v19, MEMORY[0x1E0DE4E10]);
  v6->_inputData = v20;
  v10 = v6;
  if (!v20)
LABEL_7:
    v10 = 0;
  v11 = v10;

  return v11;
}

+ (id)sharedModel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__VCPCNNGazeAnalysis_sharedModel___block_invoke;
  v8[3] = &unk_1E6B168B8;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "sharedInstanceWithIdentifier:andCreationBlock:", CFSTR("VCPGazeEspresso"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

VCPCNNModelEspresso *__34__VCPCNNGazeAnalysis_sharedModel___block_invoke(uint64_t a1)
{
  return -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", *(_QWORD *)(a1 + 32), 0, 0, 0);
}

- (void)dealloc
{
  float *inputData;
  objc_super v4;

  inputData = self->_inputData;
  if (inputData)
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNGazeAnalysis;
  -[VCPCNNGazeAnalysis dealloc](&v4, sel_dealloc);
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4
{
  int Width;
  int Height;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *BaseAddress;
  int BytesPerRow;
  float v28;
  int v29;
  float *v30;
  float *v31;
  uint64_t v32;
  uint64_t i;
  unsigned int v34;
  unsigned int v35;
  int v36;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;

  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369)
  {
LABEL_8:
    LODWORD(v10) = -50;
    return v10;
  }
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pixelBuffer = a3;
  unlockFlags = 1;
  if (!a3)
  {
    v17 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v17)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_8;
  }
  v8 = Height;
  v9 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  v36 = v9;
  if ((_DWORD)v9)
  {
    v10 = v9;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[VCPImageConverter convertImage:yuvFrame:].cold.3((uint64_t)a3, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    bzero(a4, 3 * 4 * Width * v8);
    if (v8 >= 1)
    {
      v29 = 0;
      v30 = &a4[2 * v8 * Width];
      v31 = &a4[v8 * Width];
      v32 = 4 * Width;
      do
      {
        if (Width >= 1)
        {
          for (i = 0; i != Width; ++i)
          {
            LOBYTE(v28) = BaseAddress[(int)(i * 4) + 2];
            *(float *)&v34 = (float)((float)((float)LODWORD(v28) / 255.0) + -0.485) / 0.229;
            a4[i] = *(float *)&v34;
            LOBYTE(v34) = BaseAddress[(int)(i * 4) + 1];
            *(float *)&v35 = (float)((float)((float)v34 / 255.0) + -0.456) / 0.224;
            v31[i] = *(float *)&v35;
            LOBYTE(v35) = BaseAddress[(int)(i * 4)];
            v28 = (float)((float)((float)v35 / 255.0) + -0.406) / 0.225;
            v30[i] = v28;
          }
        }
        BaseAddress += BytesPerRow;
        ++v29;
        v30 = (float *)((char *)v30 + v32);
        v31 = (float *)((char *)v31 + v32);
        a4 = (float *)((char *)a4 + v32);
      }
      while (v29 != v8);
    }
    LODWORD(v10) = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v36);
    if (pixelBuffer
      && !v36
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
    }
  }
  return v10;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6 faceBounds:(CGRect)a7
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v11;
  uint64_t v12;
  int v16;
  int v17;
  double v18;
  double v19;
  int v20;
  float v21;
  double v22;
  float v23;
  float v24;
  double v25;
  float v26;
  int v27;
  CFTypeRef v28;
  int v29;
  CFTypeRef cf;
  CGRect v32;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v11 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a5;
  cf = 0;
  v16 = CVPixelBufferGetWidth(a4);
  v17 = CVPixelBufferGetHeight(a4);
  if (!a3)
    return -108;
  v18 = (double)(v16 - 1);
  if (x <= v18)
    v19 = x;
  else
    v19 = (double)(v16 - 1);
  v20 = v17 - 1;
  v21 = fmax(v19, 0.0);
  if (y <= (double)(v17 - 1))
    v22 = y;
  else
    v22 = (double)v20;
  v23 = fmax(v22, 0.0);
  if (x + width <= v18)
    v18 = x + width;
  v24 = fmax(v18, 0.0);
  v25 = y + height;
  if (y + height > (double)(v17 - 1))
    v25 = (double)v20;
  v26 = fmax(v25, 0.0);
  v32.origin.x = (float)(v21 / (float)v16);
  v32.origin.y = (float)(v23 / (float)v17);
  v32.size.width = (float)((float)(v24 - v21) / (float)v16);
  v32.size.height = (float)((float)(v26 - v23) / (float)v17);
  v27 = Scaler::ScaleCropped(&self->_scaler, v32, a4, (__CVBuffer **)&cf, v11, v12, 1111970369);
  v28 = cf;
  if (v27)
  {
    v29 = v27;
    if (!cf)
      return v29;
    goto LABEL_17;
  }
  v29 = -[VCPCNNGazeAnalysis copyImage:toData:](self, "copyImage:toData:", cf, a3);
  v28 = cf;
  if (cf)
LABEL_17:
    CFRelease(v28);
  return v29;
}

- (int)detectEyeOpennessForFace:(CGRect)a3 inBuffer:(__CVBuffer *)a4 eyeOpenness:(BOOL *)a5
{
  BOOL v7;
  int result;
  uint64_t v10;

  if (a3.size.width < 40.0 || a3.size.height < 40.0)
  {
    v7 = 1;
LABEL_7:
    result = 0;
    *a5 = v7;
    return result;
  }
  result = -[VCPCNNGazeAnalysis createInput:withBuffer:cnnInputHeight:cnnInputWidth:faceBounds:](self, "createInput:withBuffer:cnnInputHeight:cnnInputWidth:faceBounds:", self->_inputData, a4, 64, 64, a3.origin.x, a3.origin.y);
  if (!result)
  {
    result = -[VCPCNNModelEspresso espressoForward:](self->_modelEspresso, "espressoForward:", self->_inputData);
    if (!result)
    {
      result = -[VCPCNNModelEspresso softmax](self->_modelEspresso, "softmax");
      if (!result)
      {
        -[VCPCNNModelEspresso outputBlob](self->_modelEspresso, "outputBlob");
        v7 = *(float *)(v10 + 4) <= 0.6;
        goto LABEL_7;
      }
    }
  }
  return result;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_DWORD *)self + 10) = 0;
  return self;
}

@end
