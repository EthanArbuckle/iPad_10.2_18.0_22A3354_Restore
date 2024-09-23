@implementation VCPMoFlowSingleEspresso

- (int)prepareWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 forceCPU:(BOOL)a5 sharedModel:(BOOL)a6 flushModel:(BOOL)a7
{
  _BOOL4 v10;
  void *v12;
  void *v13;
  NSURL *v14;
  NSURL *netFileUrl;
  NSString *resConfig;
  NSString *v17;
  int v18;
  NSArray *inputNames;
  VCPCNNModelEspresso *v20;
  NSURL *v21;
  NSArray *v22;
  void *v23;
  void *v24;
  void *v25;
  VCPCNNModelEspresso *v26;
  VCPCNNModelEspresso *v27;
  VCPCNNModelEspresso *v29;
  VCPCNNModelEspresso *modelEspresso;
  id v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v10 = a3;
  v33[2] = *MEMORY[0x1E0C80C00];
  v31 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resourceURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_moflow.espresso.net"), v13);
  v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
  netFileUrl = self->_netFileUrl;
  self->_netFileUrl = v14;

  resConfig = self->_resConfig;
  self->_resConfig = (NSString *)CFSTR("landscape_1024x448");

  self->super._cnnInputWidth = 1024;
  self->super._cnnInputHeight = 448;
  if (v10)
  {
    v17 = self->_resConfig;
    self->_resConfig = (NSString *)CFSTR("square_320x320");

    self->super._cnnInputWidth = 320;
    self->super._cnnInputHeight = 320;
  }
  else if (v31)
  {
    v18 = -[VCPMoFlowSingleEspresso configForAspectRatio:](self, "configForAspectRatio:", v31);
    if (v18)
      goto LABEL_11;
  }
  inputNames = self->_inputNames;
  self->_inputNames = (NSArray *)&unk_1E6B762A8;

  std::vector<void *>::resize((uint64_t)&self->_inputsData, -[NSArray count](self->_inputNames, "count"));
  self->_flow = 0;
  self->_forceCPU = a5;
  self->_sharedModel = a6;
  self->_flushModel = a7;
  if (DeviceHasANE() && !self->_forceCPU && self->_sharedModel)
  {
    objc_msgSend((id)objc_opt_class(), "sharedModel:inputNames:", self->_netFileUrl, self->_inputNames);
    v29 = (VCPCNNModelEspresso *)objc_claimAutoreleasedReturnValue();
    modelEspresso = self->_modelEspresso;
    self->_modelEspresso = v29;

  }
  else
  {
    v20 = [VCPCNNModelEspresso alloc];
    v21 = self->_netFileUrl;
    v22 = self->_inputNames;
    v32[0] = CFSTR("forceCPU");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_forceCPU);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = CFSTR("sharedContext");
    v33[0] = v23;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sharedModel);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:](v20, "initWithParameters:inputNames:outputNames:properties:", v21, v22, 0, v25);
    v27 = self->_modelEspresso;
    self->_modelEspresso = v26;

  }
  if (self->_modelEspresso)
    v18 = -[VCPMoFlowSingleEspresso prepareModel](self, "prepareModel");
  else
    v18 = -108;
LABEL_11:

  return v18;
}

- (int)prepareModel
{
  unint64_t v3;
  float *v4;
  float *flow;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  const std::nothrow_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  size_t v13;
  char *__p;
  char *v16;
  char *v17;

  if (-[NSArray count](self->_inputNames, "count"))
  {
    v3 = 0;
    do
    {
      v4 = self->_inputsData.__begin_[v3];
      if (v4)
        MEMORY[0x1BCCA128C](v4, 0x1000C8052888210);
      ++v3;
    }
    while (-[NSArray count](self->_inputNames, "count") > v3);
  }
  flow = self->_flow;
  if (flow)
  {
    MEMORY[0x1BCCA128C](flow, 0x1000C8052888210);
    self->_flow = 0;
  }
  LODWORD(v6) = -[VCPCNNModelEspresso prepareModelWithConfig:](self->_modelEspresso, "prepareModelWithConfig:", self->_resConfig);
  if (!(_DWORD)v6)
  {
    v6 = -[NSArray count](self->_inputNames, "count");
    if (v6)
    {
      v7 = 0;
      v8 = 0;
      v9 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
      while (1)
      {
        -[VCPCNNModelEspresso inputBlobs](self->_modelEspresso, "inputBlobs");
        v10 = *(_QWORD *)&v17[v7 + 88];
        -[VCPCNNModelEspresso inputBlobs](self->_modelEspresso, "inputBlobs");
        v11 = *(_QWORD *)&v16[v7 + 80];
        -[VCPCNNModelEspresso inputBlobs](self->_modelEspresso, "inputBlobs");
        v12 = v11 * v10 * *(_QWORD *)&__p[v7 + 96];
        if (v12 >> 62)
          v13 = -1;
        else
          v13 = 4 * v12;
        self->_inputsData.__begin_[v8] = (float *)operator new[](v13, v9);
        if (__p)
          operator delete(__p);
        if (v16)
          operator delete(v16);
        if (v17)
          operator delete(v17);
        if (!self->_inputsData.__begin_[v8])
          break;
        ++v8;
        v7 += 168;
        if (-[NSArray count](self->_inputNames, "count") <= v8)
        {
          LODWORD(v6) = 0;
          return v6;
        }
      }
      LODWORD(v6) = -108;
    }
  }
  return v6;
}

- (int)reInitModel
{
  VCPCNNModelEspresso *v3;
  NSURL *netFileUrl;
  NSArray *inputNames;
  void *v6;
  void *v7;
  void *v8;
  VCPCNNModelEspresso *v9;
  VCPCNNModelEspresso *modelEspresso;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = [VCPCNNModelEspresso alloc];
  netFileUrl = self->_netFileUrl;
  inputNames = self->_inputNames;
  v12[0] = CFSTR("forceCPU");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_forceCPU);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v12[1] = CFSTR("sharedContext");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sharedModel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:](v3, "initWithParameters:inputNames:outputNames:properties:", netFileUrl, inputNames, 0, v8);
  modelEspresso = self->_modelEspresso;
  self->_modelEspresso = v9;

  if (self->_modelEspresso)
    return -[VCPMoFlowSingleEspresso prepareModel](self, "prepareModel");
  else
    return -108;
}

- (void)dealloc
{
  NSUInteger i;
  NSUInteger v4;
  float **begin;
  float *v6;
  float *flow;
  objc_super v8;

  for (i = 0; ; ++i)
  {
    v4 = -[NSArray count](self->_inputNames, "count");
    begin = self->_inputsData.__begin_;
    if (v4 <= i)
      break;
    v6 = begin[i];
    if (v6)
      MEMORY[0x1BCCA128C](v6, 0x1000C8052888210);
  }
  self->_inputsData.__begin_ = 0;
  self->_inputsData.__end_ = 0;
  self->_inputsData.__end_cap_.__value_ = 0;
  if (begin)
    operator delete(begin);
  flow = self->_flow;
  if (flow)
    MEMORY[0x1BCCA128C](flow, 0x1000C8052888210);
  v8.receiver = self;
  v8.super_class = (Class)VCPMoFlowSingleEspresso;
  -[VCPMoFlowSingleEspresso dealloc](&v8, sel_dealloc);
}

- (int)configForAspectRatio:(id)a3
{
  id v4;
  void *v5;
  float v6;
  NSString *resConfig;
  int v8;
  int v9;
  int v10;
  float v11;
  unsigned int computationAccuracy;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    if (v6 > 1.16)
    {
      switch(self->super._computationAccuracy)
      {
        case 0u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)CFSTR("landscape_384x256");
          v8 = 256;
          v9 = 384;
          goto LABEL_22;
        case 1u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)CFSTR("landscape_448x320");
          v8 = 320;
          v9 = 448;
          goto LABEL_22;
        case 2u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)CFSTR("landscape_640x512");
          v8 = 512;
          goto LABEL_18;
        case 3u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)CFSTR("landscape_896x640");
          v8 = 640;
          v9 = 896;
          goto LABEL_22;
        default:
          goto LABEL_11;
      }
    }
    objc_msgSend(v5, "floatValue");
    computationAccuracy = self->super._computationAccuracy;
    if (v11 < 0.86206899)
    {
      switch(computationAccuracy)
      {
        case 0u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)CFSTR("portrait_256x384");
          v8 = 384;
          v9 = 256;
          goto LABEL_22;
        case 1u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)CFSTR("portrait_320x448");
          v8 = 448;
          v9 = 320;
          goto LABEL_22;
        case 2u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)CFSTR("portrait_512x640");
          v8 = 640;
          v9 = 512;
          goto LABEL_22;
        case 3u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)CFSTR("portrait_640x896");
          v8 = 896;
LABEL_18:
          v9 = 640;
          goto LABEL_22;
        default:
          goto LABEL_11;
      }
    }
    switch(computationAccuracy)
    {
      case 0u:
        resConfig = self->_resConfig;
        self->_resConfig = (NSString *)CFSTR("square_256x256");
        v9 = 256;
        v8 = 256;
        goto LABEL_22;
      case 1u:
        resConfig = self->_resConfig;
        self->_resConfig = (NSString *)CFSTR("square_320x320");
        v9 = 320;
        v8 = 320;
        goto LABEL_22;
      case 2u:
        resConfig = self->_resConfig;
        self->_resConfig = (NSString *)CFSTR("square_512x512");
        v9 = 512;
        v8 = 512;
        goto LABEL_22;
      case 3u:
        resConfig = self->_resConfig;
        self->_resConfig = (NSString *)CFSTR("square_640x640");
        v9 = 640;
        v8 = 640;
LABEL_22:

        v10 = 0;
        self->super._cnnInputWidth = v9;
        self->super._cnnInputHeight = v8;
        break;
      default:
LABEL_11:
        v10 = -50;
        break;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)sharedModel:(id)a3 inputNames:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__VCPMoFlowSingleEspresso_sharedModel_inputNames___block_invoke;
  v12[3] = &unk_1E6B167C0;
  v8 = v5;
  v13 = v8;
  v9 = v6;
  v14 = v9;
  objc_msgSend(v7, "sharedInstanceWithIdentifier:andCreationBlock:", CFSTR("VCPMoflowEspresso"), v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

VCPCNNModelEspresso *__50__VCPMoFlowSingleEspresso_sharedModel_inputNames___block_invoke(uint64_t a1)
{
  return -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4 withChannels:(int)a5
{
  int Width;
  int Height;
  int v9;
  CVReturn v10;
  int v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *BaseAddress;
  int BytesPerRow;
  float v23;
  int v24;
  float *v25;
  float *v26;
  uint64_t v27;
  uint64_t i;
  unsigned int v29;
  unsigned int v30;
  CVReturn v31;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;

  if (a5 != 3 || CVPixelBufferGetPixelFormatType(a3) != 1111970369)
    return -50;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pixelBuffer = a3;
  unlockFlags = 1;
  if (!a3)
  {
    v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v12)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    return -50;
  }
  v9 = Height;
  v10 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  v31 = v10;
  if (v10)
  {
    v11 = v10;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.3();
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    bzero(a4, 3 * 4 * Width * v9);
    if (v9 >= 1)
    {
      v24 = 0;
      v25 = &a4[2 * v9 * Width];
      v26 = &a4[v9 * Width];
      v27 = 4 * Width;
      do
      {
        if (Width >= 1)
        {
          for (i = 0; i != Width; ++i)
          {
            LOBYTE(v23) = BaseAddress[(int)(i * 4) + 2];
            *(float *)&v29 = (float)LODWORD(v23) / 255.0;
            a4[i] = *(float *)&v29;
            LOBYTE(v29) = BaseAddress[(int)(i * 4) + 1];
            *(float *)&v30 = (float)v29 / 255.0;
            v26[i] = *(float *)&v30;
            LOBYTE(v30) = BaseAddress[(int)(i * 4)];
            v23 = (float)v30 / 255.0;
            v25[i] = v23;
          }
        }
        BaseAddress += BytesPerRow;
        ++v24;
        v25 = (float *)((char *)v25 + v27);
        v26 = (float *)((char *)v26 + v27);
        a4 = (float *)((char *)a4 + v27);
      }
      while (v24 != v9);
    }
    v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v31);
    if (pixelBuffer
      && !v31
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
    }
  }
  return v11;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  int Width;
  int Height;
  int v13;
  int v14;
  const void *v16;
  CFTypeRef cf;

  if (a3)
  {
    v6 = *(_QWORD *)&a6;
    v7 = *(_QWORD *)&a5;
    cf = 0;
    Width = CVPixelBufferGetWidth(a4);
    Height = CVPixelBufferGetHeight(a4);
    if (CVPixelBufferGetPixelFormatType(a4) == 1111970369 && Width == (_DWORD)v6 && Height == (_DWORD)v7)
    {
      v16 = 0;
      cf = CFRetain(a4);
      CF<opaqueCMSampleBuffer *>::~CF(&v16);
    }
    else
    {
      Scaler::Scale(&self->_scaler, a4, (__CVBuffer **)&cf, v6, v7, 1111970369);
      v13 = v14;
      if (v14)
      {
LABEL_9:
        CF<opaqueCMSampleBuffer *>::~CF(&cf);
        return v13;
      }
    }
    v13 = -[VCPMoFlowSingleEspresso copyImage:toData:withChannels:](self, "copyImage:toData:withChannels:", cf, a3, 3);
    goto LABEL_9;
  }
  return -108;
}

- (int)analyzeImages:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 cancel:(id)a5
{
  int Width;
  int Height;
  int v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  int v15;
  vector<float *, std::allocator<float *>> *p_inputsData;
  int v17;
  int v18;
  int v19;
  void **begin;
  VCPCNNModelEspresso *modelEspresso;
  float *flow;
  VCPCNNModelEspresso *v23;
  VCPCNNModelEspresso *v24;
  const void *v25;
  VCPCNNModelEspresso *v26;
  VCPCNNModelEspresso *v27;
  uint64_t v28;
  uint64_t v29;
  VCPCNNModelEspresso *v30;
  VCPCNNModelEspresso *v32;
  int v33;
  VCPCNNModelEspresso *v34;
  int v35;
  int v36;
  size_t v37;
  float *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _DWORD *__p;
  int v44;
  int v45;
  void *v46;
  void *v47;
  uint64_t v48;

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v10 = CVPixelBufferGetWidth(a4);
  v11 = CVPixelBufferGetHeight(a4);
  v12 = -50;
  if (Width != v10 || Height != v11)
    return v12;
  v13 = (void *)MEMORY[0x1BCCA1B2C]();
  v39 = 162;
  if (self->_flushModel && !self->_modelEspresso)
  {
    v19 = -[VCPMoFlowSingleEspresso reInitModel](self, "reInitModel");
    if (v19)
    {
      v12 = v19;
LABEL_15:
      v18 = 0;
      goto LABEL_16;
    }
  }
  -[VCPCNNModelEspresso inputBlobs](self->_modelEspresso, "inputBlobs", 162);
  v14 = __p[106];
  operator delete(__p);
  -[VCPCNNModelEspresso inputBlobs](self->_modelEspresso, "inputBlobs");
  v15 = __p[104];
  operator delete(__p);
  p_inputsData = &self->_inputsData;
  v17 = -[VCPMoFlowSingleEspresso createInput:withBuffer:cnnInputHeight:cnnInputWidth:](self, "createInput:withBuffer:cnnInputHeight:cnnInputWidth:", *self->_inputsData.__begin_, a3, self->super._cnnInputHeight, self->super._cnnInputWidth);
  if (v17
    || (v17 = -[VCPMoFlowSingleEspresso createInput:withBuffer:cnnInputHeight:cnnInputWidth:](self, "createInput:withBuffer:cnnInputHeight:cnnInputWidth:", *((_QWORD *)p_inputsData->__begin_ + 1), a4, self->super._cnnInputHeight, self->super._cnnInputWidth)) != 0)
  {
    v12 = v17;
    v18 = 0;
    goto LABEL_16;
  }
  begin = (void **)p_inputsData->__begin_;
  if (2 * v14 * v15 >= 1)
    bzero(begin[2], 4 * (2 * v14 * v15));
  modelEspresso = self->_modelEspresso;
  v47 = 0;
  v48 = 0;
  v46 = 0;
  std::vector<float *>::__init_with_size[abi:ne180100]<float **,float **>(&v46, begin, (uint64_t)self->_inputsData.__end_, ((char *)self->_inputsData.__end_ - (char *)begin) >> 3);
  v12 = -[VCPCNNModelEspresso espressoForwardInputs:](modelEspresso, "espressoForwardInputs:", &v46);
  if (v46)
  {
    v47 = v46;
    operator delete(v46);
  }
  if (v12)
    goto LABEL_15;
  v32 = self->_modelEspresso;
  if (v32)
  {
    -[VCPCNNModelEspresso outputBlob](v32, "outputBlob");
    v33 = v44;
  }
  else
  {
    v33 = 0;
  }
  self->super._cnnOutputWidth = v33;
  v34 = self->_modelEspresso;
  if (v34)
  {
    -[VCPCNNModelEspresso outputBlob](v34, "outputBlob");
    v35 = v45;
  }
  else
  {
    v35 = 0;
  }
  self->super._cnnOutputHeight = v35;
  if (self->_flow
    || ((v36 = 2 * self->super._cnnOutputWidth * v35, v36 < 0) ? (v37 = -1) : (v37 = 4 * v36),
        v38 = (float *)operator new[](v37, MEMORY[0x1E0DE4E10]),
        (self->_flow = v38) != 0))
  {
    v12 = 0;
    v18 = 1;
  }
  else
  {
    v18 = 0;
    v12 = -108;
  }
LABEL_16:
  objc_autoreleasePoolPop(v13);
  if (!v18)
    return v12;
  flow = self->_flow;
  v23 = self->_modelEspresso;
  if (!v23)
  {
    v25 = 0;
LABEL_23:
    v28 = 0;
    goto LABEL_24;
  }
  -[VCPCNNModelEspresso outputBlob](v23, "outputBlob");
  v24 = self->_modelEspresso;
  v25 = __p;
  if (!v24)
    goto LABEL_23;
  -[VCPCNNModelEspresso outputBlob](v24, "outputBlob");
  v26 = self->_modelEspresso;
  if (!v26)
    goto LABEL_23;
  -[VCPCNNModelEspresso outputBlob](v26, "outputBlob");
  v27 = self->_modelEspresso;
  v28 = v41 * 4 * v42;
  if (!v27)
  {
LABEL_24:
    v29 = 0;
    goto LABEL_25;
  }
  -[VCPCNNModelEspresso outputBlob](v27, "outputBlob");
  v29 = v40;
LABEL_25:
  memcpy(flow, v25, v29 * v28);
  if (*((_BYTE *)&self->super.super.super.isa + v39))
  {
    v30 = self->_modelEspresso;
    if (v30)
    {
      self->_modelEspresso = 0;

    }
  }
  return v12;
}

- (float)getFlowWithHeight:(int *)a3 andWidth:(int *)a4
{
  *a3 = self->super._cnnOutputHeight;
  *a4 = self->super._cnnOutputWidth;
  vDSP_vsmul(self->_flow, 1, &kMotionFlowGlobalMultiplier, self->_flow, 1, 2 * self->super._cnnOutputHeight * (uint64_t)self->super._cnnOutputWidth);
  return self->_flow;
}

- (int)getFlowToBuffer:(__CVBuffer *)a3
{
  int BytesPerRow;
  float *flow;
  int cnnOutputWidth;
  int cnnOutputHeight;
  CVReturn v9;
  int v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *BaseAddress;
  int v21;
  int v22;
  uint64_t v23;
  float *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  CVReturn v35;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;

  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  vDSP_vsmul(self->_flow, 1, kMotionFlowLocalMultiplier, self->_flow, 1, 2 * self->super._cnnOutputHeight * (uint64_t)self->super._cnnOutputWidth);
  flow = self->_flow;
  cnnOutputWidth = self->super._cnnOutputWidth;
  cnnOutputHeight = self->super._cnnOutputHeight;
  pixelBuffer = a3;
  unlockFlags = 0;
  if (a3)
  {
    v9 = CVPixelBufferLockBaseAddress(a3, 0);
    v35 = v9;
    if (v9)
    {
      v10 = v9;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.3();
    }
    else
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      v21 = self->super._cnnOutputHeight;
      if (v21 >= 1)
      {
        v22 = 0;
        v23 = self->super._cnnOutputWidth;
        v24 = &flow[cnnOutputHeight * cnnOutputWidth];
        v25 = 4 * (int)v23;
        do
        {
          if ((int)v23 >= 1)
          {
            v26 = 0;
            v27 = 0;
            v28 = 1;
            do
            {
              _S0 = flow[v26];
              __asm { FCVT            H0, S0 }
              *(_WORD *)&BaseAddress[v27 >> 31] = LOWORD(_S0);
              _S0 = v24[v26];
              __asm { FCVT            H0, S0 }
              *(_WORD *)&BaseAddress[2 * v28] = LOWORD(_S0);
              v28 += 2;
              v27 += 0x200000000;
              ++v26;
            }
            while (v23 != v26);
          }
          BaseAddress += 2 * ((uint64_t)BytesPerRow >> 1);
          ++v22;
          v24 = (float *)((char *)v24 + v25);
          flow = (float *)((char *)flow + v25);
        }
        while (v22 != v21);
      }
      v10 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v35);
      if (pixelBuffer
        && !v35
        && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
      }
    }
  }
  else
  {
    v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v11)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    return -50;
  }
  return v10;
}

- (int)flowScalingTo:(__CVBuffer *)a3 scalerX:(float)a4 scalerY:(float)a5
{
  float *flow;
  int cnnOutputWidth;
  int cnnOutputHeight;
  int BytesPerRow;
  int v13;
  CVReturn v14;
  int v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *BaseAddress;
  int v26;
  int v27;
  float *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  CVReturn v44;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;

  vDSP_vsmul(self->_flow, 1, kMotionFlowLocalMultiplier, self->_flow, 1, 2 * self->super._cnnOutputHeight * (uint64_t)self->super._cnnOutputWidth);
  flow = self->_flow;
  cnnOutputWidth = self->super._cnnOutputWidth;
  cnnOutputHeight = self->super._cnnOutputHeight;
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  pixelBuffer = a3;
  unlockFlags = 0;
  if (a3)
  {
    v13 = BytesPerRow;
    v14 = CVPixelBufferLockBaseAddress(a3, 0);
    v44 = v14;
    if (v14)
    {
      v15 = v14;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.3();
    }
    else
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      v26 = self->super._cnnOutputHeight;
      if (v26 >= 1)
      {
        v27 = 0;
        v28 = &flow[cnnOutputHeight * cnnOutputWidth];
        v29 = self->super._cnnOutputWidth;
        v30 = 4 * (int)v29;
        do
        {
          if ((int)v29 >= 1)
          {
            v31 = 0;
            v32 = 0;
            v33 = 1;
            do
            {
              _S0 = flow[v31];
              __asm
              {
                FCVT            H0, S0
                FCVT            S0, H0
              }
              _S0 = _S0 * a4;
              __asm { FCVT            H0, S0 }
              *(_WORD *)&BaseAddress[v32 >> 31] = LOWORD(_S0);
              _S0 = v28[v31];
              __asm
              {
                FCVT            H0, S0
                FCVT            S0, H0
              }
              _S0 = _S0 * a5;
              __asm { FCVT            H0, S0 }
              *(_WORD *)&BaseAddress[2 * v33] = LOWORD(_S0);
              v33 += 2;
              v32 += 0x200000000;
              ++v31;
            }
            while (v29 != v31);
          }
          BaseAddress += 2 * ((uint64_t)v13 >> 1);
          ++v27;
          v28 = (float *)((char *)v28 + v30);
          flow = (float *)((char *)flow + v30);
        }
        while (v27 != v26);
      }
      v15 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v44);
      if (pixelBuffer
        && !v44
        && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
      }
    }
  }
  else
  {
    v16 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v16)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
    return -50;
  }
  return v15;
}

- (int)flowScalingTo:(__CVBuffer *)a3 flowBufferY:(__CVBuffer *)a4 scalerX:(float)a5 scalerY:(float)a6
{
  float *flow;
  int cnnOutputWidth;
  int cnnOutputHeight;
  int BytesPerRow;
  int v15;
  int v16;
  CVReturn v17;
  CVReturn v18;
  char *BaseAddress;
  char *v20;
  int v21;
  int v22;
  float *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  _BOOL8 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL8 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  CVReturn v55;
  CVPixelBufferRef v56;
  CVPixelBufferLockFlags v57;
  uint8_t buf[4];
  _QWORD pixelBuffer[3];
  uint8_t v60[4];
  uint64_t v61;
  __int16 v62;
  CVReturn v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  vDSP_vsmul(self->_flow, 1, kMotionFlowLocalMultiplier, self->_flow, 1, 2 * self->super._cnnOutputHeight * (uint64_t)self->super._cnnOutputWidth);
  flow = self->_flow;
  cnnOutputWidth = self->super._cnnOutputWidth;
  cnnOutputHeight = self->super._cnnOutputHeight;
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  v15 = CVPixelBufferGetBytesPerRow(a4);
  v55 = 0;
  v56 = a3;
  v57 = 0;
  if (a3)
  {
    v16 = v15;
    v54 = cnnOutputWidth;
    v17 = CVPixelBufferLockBaseAddress(a3, 0);
    v55 = v17;
    if (!v17
      || (v18 = v17, os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      && (*(_DWORD *)buf = 134218240,
          pixelBuffer[0] = a3,
          LOWORD(pixelBuffer[1]) = 1024,
          *(_DWORD *)((char *)&pixelBuffer[1] + 2) = v18,
          _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (v18 = v55) == 0))
    {
      *(_OWORD *)((char *)pixelBuffer + 4) = (unint64_t)a4;
      if (a4)
      {
        v18 = CVPixelBufferLockBaseAddress(a4, 0);
        *(_DWORD *)buf = v18;
        if (!v18
          || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
          && (*(_DWORD *)v60 = 134218240,
              v61 = *(_QWORD *)((char *)pixelBuffer + 4),
              v62 = 1024,
              v63 = v18,
              _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v60, 0x12u), (v18 = *(_DWORD *)buf) == 0))
        {
          BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
          v20 = (char *)CVPixelBufferGetBaseAddress(a4);
          v21 = self->super._cnnOutputHeight;
          if (v21 >= 1)
          {
            v22 = 0;
            v23 = &flow[cnnOutputHeight * v54];
            v24 = self->super._cnnOutputWidth;
            v25 = 4 * (int)v24;
            do
            {
              if ((int)v24 >= 1)
              {
                for (i = 0; i != v24; ++i)
                {
                  _S0 = flow[i];
                  __asm
                  {
                    FCVT            H0, S0
                    FCVT            S0, H0
                  }
                  _S0 = _S0 * a5;
                  __asm { FCVT            H0, S0 }
                  *(_WORD *)&BaseAddress[2 * i] = LOWORD(_S0);
                  _S0 = v23[i];
                  __asm
                  {
                    FCVT            H0, S0
                    FCVT            S0, H0
                  }
                  _S0 = _S0 * a6;
                  __asm { FCVT            H0, S0 }
                  *(_WORD *)&v20[2 * i] = LOWORD(_S0);
                }
              }
              ++v22;
              v20 += 2 * ((uint64_t)v16 >> 1);
              v23 = (float *)((char *)v23 + v25);
              BaseAddress += 2 * ((uint64_t)BytesPerRow >> 1);
              flow = (float *)((char *)flow + v25);
            }
            while (v22 != v21);
          }
          v18 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
          if (!v18)
            v18 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v55);
        }
      }
      else
      {
        v46 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v46)
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v46, v47, v48, v49, v50, v51, v52, v53);
        v18 = -50;
        *(_DWORD *)buf = -50;
      }
      if (*(_QWORD *)((char *)pixelBuffer + 4)
        && !*(_DWORD *)buf
        && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)((char *)pixelBuffer + 4), *(_QWORD *)((char *)&pixelBuffer[1] + 4))&& os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
      }
      if (v56
        && !v55
        && CVPixelBufferUnlockBaseAddress(v56, v57)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
      }
    }
  }
  else
  {
    v37 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v37)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v37, v38, v39, v40, v41, v42, v43, v44);
    return -50;
  }
  return v18;
}

- (int)updateModelForAspectRatio:(id)a3 computationAccuracy:(unsigned int)a4
{
  NSString *v7;
  int v8;

  v7 = self->_resConfig;
  self->super._computationAccuracy = a4;
  v8 = -[VCPMoFlowSingleEspresso configForAspectRatio:](self, "configForAspectRatio:", a3);
  if (!v8)
  {
    if (v7 == self->_resConfig)
      goto LABEL_5;
    if (!self->_modelEspresso)
    {
      v8 = -108;
      goto LABEL_7;
    }
    v8 = -[VCPMoFlowSingleEspresso prepareModel](self, "prepareModel");
    if (!v8)
LABEL_5:
      v8 = 0;
  }
LABEL_7:

  return v8;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;
  float **begin;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_resConfig, 0);
  begin = self->_inputsData.__begin_;
  if (begin)
  {
    self->_inputsData.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_netFileUrl, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_DWORD *)self + 46) = 0;
  return self;
}

@end
