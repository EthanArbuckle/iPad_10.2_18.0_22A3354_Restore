@implementation VCPModelR2D2

- (int)prepareWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 numLevels:(int)a5 startLevel:(int)a6 cancel:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  NSString *resConfig;
  NSString *v15;
  int v16;
  OS_dispatch_semaphore *v17;
  OS_dispatch_semaphore *flowDecoderSemaphore;

  v10 = a3;
  v12 = a4;
  v13 = a7;
  resConfig = self->_resConfig;
  self->_resConfig = (NSString *)CFSTR("landscape_1024x432");

  self->super._cnnInputWidth = 1024;
  self->super._cnnInputHeight = 432;
  if (v10)
  {
    v15 = self->_resConfig;
    self->_resConfig = (NSString *)CFSTR("square_320x320");

    self->super._cnnInputWidth = 320;
    self->super._cnnInputHeight = 320;
  }
  else if (v12)
  {
    v16 = -[VCPModelR2D2 configForAspectRatio:](self, "configForAspectRatio:", v12);
    if (v16)
      goto LABEL_7;
  }
  self->_numLevels = a5;
  self->_startLevel = a6;
  v16 = -[VCPModelR2D2 createModules:](self, "createModules:", v13);
  if (!v16)
  {
    v17 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    flowDecoderSemaphore = self->_flowDecoderSemaphore;
    self->_flowDecoderSemaphore = v17;

    v16 = -[VCPModelR2D2 allocateInputAndOutputBuffers](self, "allocateInputAndOutputBuffers");
  }
LABEL_7:

  return v16;
}

- (int)allocateInputAndOutputBuffers
{
  __CVBuffer *PixelBuffer;
  int result;
  BOOL v5;

  self->super._cnnOutputWidth = self->super._cnnInputWidth / 4;
  self->super._cnnOutputHeight = self->super._cnnInputHeight / 4;
  self->_firstBuffer = VCPFlowCreatePixelBuffer(self->super._cnnInputWidth, 3 * self->super._cnnInputHeight, 0x4C303068u, 32);
  self->_secondBuffer = VCPFlowCreatePixelBuffer(self->super._cnnInputWidth, 3 * self->super._cnnInputHeight, 0x4C303068u, 32);
  PixelBuffer = VCPFlowCreatePixelBuffer(self->super._cnnOutputWidth, 2 * self->super._cnnOutputHeight, 0x4C303068u, 32);
  self->_outputFlow = PixelBuffer;
  result = -108;
  if (self->_firstBuffer)
  {
    if (PixelBuffer)
      v5 = self->_secondBuffer == 0;
    else
      v5 = 1;
    if (v5)
      return -108;
    else
      return 0;
  }
  return result;
}

- (int)releaseInputAndOutputBuffers
{
  __CVBuffer *firstBuffer;
  __CVBuffer *secondBuffer;
  __CVBuffer *outputFlow;

  firstBuffer = self->_firstBuffer;
  if (firstBuffer)
    CFRelease(firstBuffer);
  secondBuffer = self->_secondBuffer;
  if (secondBuffer)
    CFRelease(secondBuffer);
  outputFlow = self->_outputFlow;
  if (outputFlow)
    CFRelease(outputFlow);
  return 0;
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

- (int)createModules:(id)a3
{
  id v4;
  VCPFlowFeatureExtractor *v5;
  VCPFlowFeatureExtractor *featureExtractor;
  uint64_t startLevel;
  VCPFlowDecoder *v8;
  VCPFlowDecoder *v9;
  VCPCorrelation *v10;
  VCPCorrelation *correlation;
  VCPBackwarp *v12;
  VCPBackwarp *backwarp;
  int v14;

  v4 = a3;
  v5 = -[VCPFlowFeatureExtractor initModule:config:cancel:]([VCPFlowFeatureExtractor alloc], "initModule:config:cancel:", self->_numLevels, self->_resConfig, v4);
  featureExtractor = self->_featureExtractor;
  self->_featureExtractor = v5;

  if (!self->_featureExtractor)
    goto LABEL_9;
  startLevel = self->_startLevel;
  if (startLevel < self->_numLevels)
  {
    do
    {
      v8 = -[VCPFlowDecoder initModule:config:cancel:]([VCPFlowDecoder alloc], "initModule:config:cancel:", startLevel, self->_resConfig, v4);
      v9 = self->_flowDecoder[startLevel];
      self->_flowDecoder[startLevel] = v8;

      if (!self->_flowDecoder[startLevel])
        goto LABEL_9;
    }
    while (++startLevel < (unint64_t)self->_numLevels);
  }
  v10 = -[VCPCorrelation initWithDevice:]([VCPCorrelation alloc], "initWithDevice:", self->super._device);
  correlation = self->_correlation;
  self->_correlation = v10;

  if (!self->_correlation
    || (v12 = -[VCPBackwarp initWithDevice:]([VCPBackwarp alloc], "initWithDevice:", self->super._device), backwarp = self->_backwarp, self->_backwarp = v12, backwarp, !self->_backwarp))
  {
LABEL_9:
    v14 = -108;
    goto LABEL_10;
  }
  v14 = -[VCPModelR2D2 allocateFeatures](self, "allocateFeatures");
  if (!v14)
    v14 = -[VCPModelR2D2 allocateStorages](self, "allocateStorages");
LABEL_10:

  return v14;
}

- (int)updateModulesWithConfig:(id)a3
{
  id v4;
  VCPFlowFeatureExtractor *featureExtractor;
  BOOL v6;
  id v7;
  void *v8;
  unint64_t startLevel;
  VCPFlowDecoder *v10;
  BOOL v11;
  id v12;
  int v13;
  id v15;
  id v16;

  v4 = a3;
  featureExtractor = self->_featureExtractor;
  if (!featureExtractor)
  {
    v8 = 0;
    goto LABEL_9;
  }
  v16 = 0;
  v6 = -[VCPEspressoModel updateModelWithConfig:error:](featureExtractor, "updateModelWithConfig:error:", v4, &v16);
  v7 = v16;
  v8 = v7;
  if (!v6)
  {
LABEL_9:
    v13 = -18;
    goto LABEL_16;
  }
  startLevel = self->_startLevel;
  if (startLevel < self->_numLevels)
  {
    while (1)
    {
      v10 = self->_flowDecoder[startLevel];
      if (!v10)
        goto LABEL_9;
      v15 = v8;
      v11 = -[VCPEspressoModel updateModelWithConfig:error:](v10, "updateModelWithConfig:error:", v4, &v15);
      v12 = v15;

      if (!v11)
      {
        v13 = -18;
        goto LABEL_15;
      }
      ++startLevel;
      v8 = v12;
      if (startLevel >= self->_numLevels)
        goto LABEL_11;
    }
  }
  v12 = v7;
LABEL_11:
  -[VCPModelR2D2 releaseMemory](self, "releaseMemory");
  v13 = -[VCPModelR2D2 allocateFeatures](self, "allocateFeatures");
  if (!v13)
  {
    v13 = -[VCPModelR2D2 allocateStorages](self, "allocateStorages");
    if (!v13)
      v13 = -[VCPModelR2D2 allocateInputAndOutputBuffers](self, "allocateInputAndOutputBuffers");
  }
LABEL_15:
  v8 = v12;
LABEL_16:

  return v13;
}

- (int)allocateStorages
{
  unsigned int numLevels;
  __CVBuffer **upscaledFlows;
  uint64_t v5;
  uint64_t startLevel;
  __CVBuffer **i;
  int result;
  size_t v9;
  int v10;
  int v11;
  size_t v12;
  CVPixelBufferRef PixelBuffer;
  CVPixelBufferRef v14;
  int v15;
  int v16;
  int v17;

  numLevels = self->_numLevels;
  if (numLevels)
  {
    upscaledFlows = self->_storage.upscaledFlows;
    v5 = self->_numLevels;
    do
    {
      *(upscaledFlows - 7) = 0;
      *upscaledFlows = 0;
      upscaledFlows[7] = 0;
      *(upscaledFlows - 14) = 0;
      ++upscaledFlows;
      --v5;
    }
    while (v5);
  }
  startLevel = self->_startLevel;
  if (startLevel >= numLevels)
    return 0;
  for (i = &self->_storage.upscaledFlows[startLevel]; ; ++i)
  {
    result = -[VCPFlowFeatureExtractor setFeatureShape:height:width:level:](self->_featureExtractor, "setFeatureShape:height:width:level:", &v15, self->super._cnnInputHeight, self->super._cnnInputWidth, startLevel);
    if (result)
      break;
    v10 = v16;
    v9 = v17;
    v11 = v15;
    v12 = 2 * v16;
    *(i - 7) = VCPFlowCreatePixelBuffer(v17, v12, 0x4C303068u, 0);
    *i = VCPFlowCreatePixelBuffer(v9, v12, 0x4C303068u, 0);
    PixelBuffer = VCPFlowCreatePixelBuffer(v9, v11 * (uint64_t)v10, 0x4C303068u, 0);
    i[7] = PixelBuffer;
    if (!*(i - 7))
      return -108;
    v14 = PixelBuffer;
    result = -108;
    if (!*i || !v14)
      return result;
    if (++startLevel >= (unint64_t)self->_numLevels)
      return 0;
  }
  return result;
}

- (void)releaseStorages
{
  unint64_t startLevel;
  __CVBuffer **v4;
  const void *v5;
  __CVBuffer *v6;

  startLevel = self->_startLevel;
  if (startLevel < self->_numLevels)
  {
    v4 = &self->_storage.upscaledFlows[startLevel];
    do
    {
      v5 = *(v4 - 7);
      if (v5)
      {
        CFRelease(v5);
        *(v4 - 7) = 0;
      }
      if (*v4)
      {
        CFRelease(*v4);
        *v4 = 0;
      }
      v6 = v4[7];
      if (v6)
      {
        CFRelease(v6);
        v4[7] = 0;
      }
      ++startLevel;
      ++v4;
    }
    while (startLevel < self->_numLevels);
  }
}

- (int)allocateCorreleationBuffer:(__CVBuffer *)a3 forLevel:(unsigned int)a4
{
  __CVBuffer *PixelBuffer;

  PixelBuffer = VCPFlowCreatePixelBuffer(self->_imageFeature[0].featureShape[a4].width, (81 * self->_imageFeature[0].featureShape[a4].height), 0x4C303068u, 0);
  *a3 = PixelBuffer;
  if (PixelBuffer)
    return 0;
  else
    return -108;
}

- (int)allocateFeatures
{
  uint64_t v3;
  $647FD2A2BE972A74A0A59590BBB7B2E1 *imageFeature;
  unint64_t numLevels;
  $8C3D079E93B7A0AE96F774D6FFEE5E3C *v6;
  char v7;
  int *v8;
  char v9;
  $647FD2A2BE972A74A0A59590BBB7B2E1 *v10;
  uint64_t v11;
  uint64_t v12;
  $8C3D079E93B7A0AE96F774D6FFEE5E3C *v13;
  int result;
  CVPixelBufferRef PixelBuffer;
  unint64_t v16;
  $8C3D079E93B7A0AE96F774D6FFEE5E3C *v17;

  v3 = 0;
  imageFeature = self->_imageFeature;
  LODWORD(numLevels) = self->_numLevels;
  v6 = &self->_imageFeature[0].featureShape[1];
  v7 = 1;
  v8 = &OBJC_IVAR___VCPImageConverter__rgbColorSpace;
  v17 = &self->_imageFeature[0].featureShape[1];
  while (1)
  {
    v9 = v7;
    if (numLevels >= 2)
      break;
LABEL_8:
    v7 = 0;
    v3 = 1;
    if ((v9 & 1) == 0)
      return 0;
  }
  v10 = &imageFeature[v3];
  v11 = v8[589];
  v12 = 12;
  v13 = &v6[12 * v3];
  while (1)
  {
    result = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v11), "setFeatureShape:height:width:level:", v13, self->super._cnnInputHeight, self->super._cnnInputWidth, (v12 - 11));
    if (result)
      return result;
    PixelBuffer = VCPFlowCreatePixelBuffer(v13->width, v13->channels * (uint64_t)v13->height, 0x4C303068u, 0);
    *((_QWORD *)&v10->featureShape[0].channels + v12) = PixelBuffer;
    if (!PixelBuffer)
      return -108;
    numLevels = self->_numLevels;
    v16 = v12 - 10;
    ++v12;
    ++v13;
    if (v16 >= numLevels)
    {
      v6 = v17;
      v8 = &OBJC_IVAR___VCPImageConverter__rgbColorSpace;
      goto LABEL_8;
    }
  }
}

- (void)releaseFeatureBuffers
{
  uint64_t v3;
  unint64_t numLevels;
  $647FD2A2BE972A74A0A59590BBB7B2E1 *imageFeature;
  char v6;
  char v7;
  $647FD2A2BE972A74A0A59590BBB7B2E1 *v8;
  uint64_t v9;
  const void *v10;
  unint64_t v11;

  v3 = 0;
  numLevels = self->_numLevels;
  imageFeature = self->_imageFeature;
  v6 = 1;
  do
  {
    v7 = v6;
    if (numLevels >= 2)
    {
      v8 = &imageFeature[v3];
      v9 = 12;
      do
      {
        v10 = (const void *)*((_QWORD *)&v8->featureShape[0].channels + v9);
        if (v10)
        {
          CFRelease(v10);
          *((_QWORD *)&v8->featureShape[0].channels + v9) = 0;
          numLevels = self->_numLevels;
        }
        v11 = v9 - 10;
        ++v9;
      }
      while (v11 < numLevels);
    }
    v6 = 0;
    v3 = 1;
  }
  while ((v7 & 1) != 0);
}

- (int)extractFeaturesFromFirst:(__CVBuffer *)a3 andSecond:(__CVBuffer *)a4
{
  $647FD2A2BE972A74A0A59590BBB7B2E1 *imageFeature;
  int result;

  imageFeature = self->_imageFeature;
  result = -[VCPModelR2D2 extractFeatureFromImage:toFeature:](self, "extractFeatureFromImage:toFeature:", a3, self->_imageFeature);
  if (!result)
    return -[VCPModelR2D2 extractFeatureFromImage:toFeature:](self, "extractFeatureFromImage:toFeature:", a4, &imageFeature[1]);
  return result;
}

- (int)extractFeatureFromImage:(__CVBuffer *)a3 toFeature:(id *)a4
{
  dispatch_semaphore_t v7;
  VCPFlowFeatureExtractor *featureExtractor;
  NSObject *v9;
  _QWORD v11[4];
  dispatch_semaphore_t v12;

  v7 = dispatch_semaphore_create(0);
  featureExtractor = self->_featureExtractor;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__VCPModelR2D2_extractFeatureFromImage_toFeature___block_invoke;
  v11[3] = &unk_1E6B15468;
  v12 = v7;
  v9 = v7;
  LODWORD(a4) = -[VCPFlowFeatureExtractor extractFeatureFromImage:toFeature:callback:](featureExtractor, "extractFeatureFromImage:toFeature:callback:", a3, a4, v11);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  return (int)a4;
}

intptr_t __50__VCPModelR2D2_extractFeatureFromImage_toFeature___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)estimateMotionFlow:(__CVBuffer *)a3
{
  unsigned int numLevels;
  $193E72A2D28ECB5B9091D13A1168E0A0 *p_storage;
  uint64_t v7;
  CFTypeRef *v8;
  int result;
  __CVBuffer *v10;
  __CVBuffer *v11;

  numLevels = self->_numLevels;
  if (numLevels - 1 < self->_startLevel)
    return 0;
  p_storage = &self->_storage;
  while (1)
  {
    v7 = numLevels - 1;
    v8 = (CFTypeRef *)&p_storage->correlations[v7];
    result = -[VCPModelR2D2 allocateCorreleationBuffer:forLevel:](self, "allocateCorreleationBuffer:forLevel:", v8, v7);
    if (result)
      break;
    if ((_DWORD)v7 + 1 == self->_numLevels)
      v10 = 0;
    else
      v10 = p_storage->flows[numLevels];
    v11 = a3;
    if ((_DWORD)v7 != self->_startLevel)
      v11 = p_storage->flows[v7];
    result = -[VCPModelR2D2 estimateFlowForLevel:upperFlow:outputFlow:](self, "estimateFlowForLevel:upperFlow:outputFlow:", v7, v10, v11);
    if (result)
      break;
    if (*v8)
    {
      CFRelease(*v8);
      *v8 = 0;
    }
    numLevels = v7;
    if ((v7 - 1) < self->_startLevel)
      return 0;
  }
  return result;
}

- (int)estimateFlowForLevel:(int)a3 upperFlow:(__CVBuffer *)a4 outputFlow:(__CVBuffer *)a5
{
  $647FD2A2BE972A74A0A59590BBB7B2E1 *imageFeature;
  unint64_t channels;
  __CVBuffer **v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __CVBuffer **v23;
  uint64_t v24;
  BOOL v25;
  VCPFlowDecoder *v27;
  uint64_t v28;
  __CVBuffer **v29;
  __CVBuffer *v30;
  __CVBuffer *v31;
  __CVBuffer *v33;
  uint64_t *v34;
  void *v35;
  id v36;
  $193E72A2D28ECB5B9091D13A1168E0A0 *p_storage;
  void *v38;
  void *v39;
  _QWORD v40[5];

  imageFeature = self->_imageFeature;
  channels = self->_imageFeature[0].featureShape[a3].channels;
  -[MTLCommandQueue commandBuffer](self->super._commandQueue, "commandBuffer", *(_QWORD *)&a3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (__CVBuffer **)((char *)imageFeature + 8 * a3);
  createTextureFromBuffer(v11[11], self->super._device, 0, channels);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (uint64_t *)(v11 + 11);
  v12 = a3;
  createTextureFromBuffer(imageFeature[1].feature[a3], self->super._device, 0, channels);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  p_storage = &self->_storage;
  createTextureFromBuffer(self->_storage.correlations[a3], self->super._device, 0, 0x51uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v39)
    v16 = v13 == 0;
  else
    v16 = 1;
  v17 = v16 || v14 == 0;
  v33 = a5;
  if (v17)
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_10;
  }
  if (self->_numLevels - 1 != a3)
  {
    createTextureFromBuffer(a4, self->super._device, 0, 2uLL);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = &p_storage->correlations[a3];
    createTextureFromBuffer(v23[14], self->super._device, 0, 2uLL);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    createTextureFromBuffer(v23[21], self->super._device, 0, channels);
    v24 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v24;
    if (v19)
      v25 = v18 == 0;
    else
      v25 = 1;
    if (!v25 && v24 != 0)
    {
      v35 = v18;
      v36 = (id)v24;
      v22 = v19;
      -[VCPBackwarp encodeToCommandBuffer:input:output:flow:upscaledFlow:](self->_backwarp, "encodeToCommandBuffer:input:output:flow:upscaledFlow:", v38, v13, v24, v18, v19);
      -[VCPCorrelation encodeToCommandBuffer:firstInput:secondInput:correlation:](self->_correlation, "encodeToCommandBuffer:firstInput:secondInput:correlation:", v38, v39, v20, v15, v33);
      goto LABEL_21;
    }
LABEL_10:
    v21 = -108;
    goto LABEL_27;
  }
  v35 = 0;
  v36 = v13;
  v22 = 0;
  -[VCPCorrelation encodeToCommandBuffer:firstInput:secondInput:correlation:](self->_correlation, "encodeToCommandBuffer:firstInput:secondInput:correlation:", v38, v39, v36, v15, a5);
LABEL_21:
  objc_msgSend(v38, "commit");
  objc_msgSend(v38, "waitUntilCompleted");
  if (needDeepCopy(objc_msgSend(v15, "width"), objc_msgSend(v15, "arrayLength")))
    v21 = copyTextureToBuffer(v15, p_storage->correlations[v12]);
  else
    v21 = 0;
  if (needDeepCopy(objc_msgSend(v22, "width"), objc_msgSend(v22, "arrayLength")))
    v21 = copyTextureToBuffer(v22, p_storage->upscaledFlows[v12]);
  v18 = v35;
  v20 = v36;
  v19 = v22;
LABEL_27:

  if (!v21)
  {
    v27 = self->_flowDecoder[v12];
    v28 = *v34;
    v29 = &p_storage->correlations[v12];
    v30 = *v29;
    v31 = v29[14];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __58__VCPModelR2D2_estimateFlowForLevel_upperFlow_outputFlow___block_invoke;
    v40[3] = &unk_1E6B15468;
    v40[4] = self;
    v21 = -[VCPFlowDecoder estimateFlow:correlation:flow:outputFlow:callback:](v27, "estimateFlow:correlation:flow:outputFlow:callback:", v28, v30, v31, v33, v40);
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_flowDecoderSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  }

  return v21;
}

intptr_t __58__VCPModelR2D2_estimateFlowForLevel_upperFlow_outputFlow___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 728));
}

- (int)copyImage:(__CVBuffer *)a3 toBuffer:(__CVBuffer *)a4 withChannels:(int)a5
{
  int Width;
  int Height;
  int v9;
  CVReturn v10;
  CVReturn v11;
  _BYTE *BaseAddress;
  int BytesPerRow;
  int v14;
  char *v15;
  int v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  int v23;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CVReturn v47;
  CVPixelBufferRef v48;
  CVPixelBufferLockFlags v49;
  uint8_t buf[4];
  _QWORD pixelBuffer[3];
  uint8_t v52[4];
  uint64_t v53;
  __int16 v54;
  CVReturn v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (a5 != 3 || CVPixelBufferGetPixelFormatType(a3) != 1111970369)
    return -50;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v47 = 0;
  v48 = a3;
  v49 = 1;
  if (!a3)
  {
    v30 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v30)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v30, v31, v32, v33, v34, v35, v36, v37);
    return -50;
  }
  v9 = Height;
  v10 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  v47 = v10;
  if (!v10
    || (v11 = v10, os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    && (*(_DWORD *)buf = 134218240,
        pixelBuffer[0] = a3,
        LOWORD(pixelBuffer[1]) = 1024,
        *(_DWORD *)((char *)&pixelBuffer[1] + 2) = v11,
        _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (v11 = v47) == 0))
  {
    *(_DWORD *)buf = 0;
    *(_OWORD *)((char *)pixelBuffer + 4) = (unint64_t)a4;
    if (a4)
    {
      v11 = CVPixelBufferLockBaseAddress(a4, 0);
      *(_DWORD *)buf = v11;
      if (!v11
        || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
        && (*(_DWORD *)v52 = 134218240,
            v53 = *(_QWORD *)((char *)pixelBuffer + 4),
            v54 = 1024,
            v55 = v11,
            _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v52, 0x12u), (v11 = *(_DWORD *)buf) == 0))
      {
        BaseAddress = CVPixelBufferGetBaseAddress(a3);
        BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
        v14 = CVPixelBufferGetBytesPerRow(a4);
        v15 = (char *)CVPixelBufferGetBaseAddress(a4);
        if (v9 >= 1)
        {
          v17 = 0;
          v18 = (unint64_t)v14 >> 1;
          v19 = &v15[4 * v9 * (int)v18];
          v20 = 2 * (int)v18;
          v21 = &v15[2 * (int)v18 * v9];
          do
          {
            if (Width >= 1)
            {
              v22 = 0;
              v23 = 1;
              do
              {
                LOBYTE(_S0) = BaseAddress[v23 + 1];
                *(float *)&_S0 = (float)LODWORD(_S0) / 255.0;
                __asm { FCVT            H0, S0 }
                *(_WORD *)&v15[v22] = _S0;
                LOBYTE(_S0) = BaseAddress[v23];
                *(float *)&_S0 = (float)_S0 / 255.0;
                __asm { FCVT            H0, S0 }
                *(_WORD *)&v21[v22] = _S0;
                LOBYTE(_S0) = BaseAddress[v23 - 1];
                _S0 = (float)_S0 / 255.0;
                __asm { FCVT            H0, S0 }
                *(_WORD *)&v19[v22] = LOWORD(_S0);
                v22 += 2;
                v23 += 4;
              }
              while (2 * Width != v22);
            }
            BaseAddress += BytesPerRow;
            ++v17;
            v19 += v20;
            v21 += v20;
            v15 += v20;
          }
          while (v17 != v9);
        }
        v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
        if (!v11)
          v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v47);
      }
    }
    else
    {
      v39 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v39)
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v39, v40, v41, v42, v43, v44, v45, v46);
      v11 = -50;
      *(_DWORD *)buf = -50;
    }
    if (*(_QWORD *)((char *)pixelBuffer + 4)
      && !*(_DWORD *)buf
      && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)((char *)pixelBuffer + 4), *(_QWORD *)((char *)&pixelBuffer[1] + 4))&& os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
    }
    if (v48
      && !v47
      && CVPixelBufferUnlockBaseAddress(v48, v49)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
    }
  }
  return v11;
}

- (int)createInput:(__CVBuffer *)a3 withImage:(__CVBuffer *)a4 modelInputHeight:(int)a5 modelInputWidth:(int)a6
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
    v13 = -[VCPModelR2D2 copyImage:toBuffer:withChannels:](self, "copyImage:toBuffer:withChannels:", cf, a3, 3);
    goto LABEL_9;
  }
  return -108;
}

- (int)analyzeImages:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 cancel:(id)a5
{
  int result;

  result = -[VCPModelR2D2 createInput:withImage:modelInputHeight:modelInputWidth:](self, "createInput:withImage:modelInputHeight:modelInputWidth:", self->_firstBuffer, a3, self->super._cnnInputHeight, self->super._cnnInputWidth);
  if (!result)
  {
    result = -[VCPModelR2D2 createInput:withImage:modelInputHeight:modelInputWidth:](self, "createInput:withImage:modelInputHeight:modelInputWidth:", self->_secondBuffer, a4, self->super._cnnInputHeight, self->super._cnnInputWidth);
    if (!result)
    {
      result = -[VCPModelR2D2 extractFeaturesFromFirst:andSecond:](self, "extractFeaturesFromFirst:andSecond:", self->_firstBuffer, self->_secondBuffer);
      if (!result)
        return -[VCPModelR2D2 estimateMotionFlow:](self, "estimateMotionFlow:", self->_outputFlow);
    }
  }
  return result;
}

- (int)getFlowToBuffer:(__CVBuffer *)a3
{
  double v3;
  double v4;

  LODWORD(v3) = 1.0;
  LODWORD(v4) = 1.0;
  -[VCPModelR2D2 flowScalingTo:scalerX:scalerY:](self, "flowScalingTo:scalerX:scalerY:", a3, v3, v4);
  return 0;
}

- (int)flowScalingTo:(__CVBuffer *)a3 scalerX:(float)a4 scalerY:(float)a5
{
  int BytesPerRow;
  int v10;
  __CVBuffer *outputFlow;
  int v12;
  CVReturn v13;
  CVReturn v14;
  char *BaseAddress;
  char *v16;
  int cnnOutputHeight;
  int v18;
  unint64_t v19;
  uint64_t cnnOutputWidth;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL8 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  CVReturn v52;
  CVPixelBufferRef v53;
  CVPixelBufferLockFlags v54;
  uint8_t buf[4];
  _QWORD pixelBuffer[3];
  uint8_t v57[4];
  uint64_t v58;
  __int16 v59;
  CVReturn v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  BytesPerRow = CVPixelBufferGetBytesPerRow(self->_outputFlow);
  v10 = CVPixelBufferGetBytesPerRow(a3);
  outputFlow = self->_outputFlow;
  v52 = 0;
  v53 = outputFlow;
  v54 = 1;
  if (outputFlow)
  {
    v12 = v10;
    v13 = CVPixelBufferLockBaseAddress(outputFlow, 1uLL);
    v52 = v13;
    if (!v13
      || (v14 = v13, os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      && (*(_DWORD *)buf = 134218240,
          pixelBuffer[0] = outputFlow,
          LOWORD(pixelBuffer[1]) = 1024,
          *(_DWORD *)((char *)&pixelBuffer[1] + 2) = v14,
          _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (v14 = v52) == 0))
    {
      *(_OWORD *)((char *)pixelBuffer + 4) = (unint64_t)a3;
      if (a3)
      {
        v14 = CVPixelBufferLockBaseAddress(a3, 0);
        *(_DWORD *)buf = v14;
        if (!v14
          || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
          && (*(_DWORD *)v57 = 134218240,
              v58 = *(_QWORD *)((char *)pixelBuffer + 4),
              v59 = 1024,
              v60 = v14,
              _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v57, 0x12u), (v14 = *(_DWORD *)buf) == 0))
        {
          BaseAddress = (char *)CVPixelBufferGetBaseAddress(self->_outputFlow);
          v16 = (char *)CVPixelBufferGetBaseAddress(a3);
          cnnOutputHeight = self->super._cnnOutputHeight;
          if (cnnOutputHeight >= 1)
          {
            v18 = 0;
            v19 = (unint64_t)BytesPerRow >> 1;
            cnnOutputWidth = self->super._cnnOutputWidth;
            v21 = (int)v19;
            v22 = &BaseAddress[2 * cnnOutputHeight * (int)v19];
            v23 = 2 * v21;
            do
            {
              if ((int)cnnOutputWidth >= 1)
              {
                v24 = 0;
                v25 = 0;
                do
                {
                  _H0 = *(_WORD *)&BaseAddress[v25];
                  __asm { FCVT            S0, H0 }
                  _S0 = _S0 * a4;
                  __asm { FCVT            H0, S0 }
                  *(_WORD *)&v16[v24 >> 31] = LOWORD(_S0);
                  LOWORD(_S0) = *(_WORD *)&v22[v25];
                  __asm { FCVT            S0, H0 }
                  _S0 = _S0 * a5;
                  __asm { FCVT            H0, S0 }
                  *(_WORD *)&v16[2 * (int)v25 + 2] = LOWORD(_S0);
                  v25 += 2;
                  v24 += 0x200000000;
                }
                while (2 * cnnOutputWidth != v25);
              }
              v16 += 2 * ((uint64_t)v12 >> 1);
              ++v18;
              v22 += v23;
              BaseAddress += v23;
            }
            while (v18 != cnnOutputHeight);
          }
          v14 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
          if (!v14)
            v14 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v52);
        }
      }
      else
      {
        v44 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v44)
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v44, v45, v46, v47, v48, v49, v50, v51);
        v14 = -50;
        *(_DWORD *)buf = -50;
      }
      if (*(_QWORD *)((char *)pixelBuffer + 4)
        && !*(_DWORD *)buf
        && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)((char *)pixelBuffer + 4), *(_QWORD *)((char *)&pixelBuffer[1] + 4))&& os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
      }
      if (v53
        && !v52
        && CVPixelBufferUnlockBaseAddress(v53, v54)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
      }
    }
  }
  else
  {
    v35 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v35)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v35, v36, v37, v38, v39, v40, v41, v42);
    return -50;
  }
  return v14;
}

- (int)flowScalingTo:(__CVBuffer *)a3 flowBufferY:(__CVBuffer *)a4 scalerX:(float)a5 scalerY:(float)a6
{
  int BytesPerRow;
  int v12;
  int v13;
  __CVBuffer *outputFlow;
  int v15;
  CVReturn v16;
  CVReturn v17;
  char *BaseAddress;
  char *v19;
  char *v20;
  int cnnOutputHeight;
  int v22;
  unint64_t v23;
  uint64_t cnnOutputWidth;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BOOL8 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _BOOL8 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  CVReturn v63;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  uint8_t v66[4];
  _QWORD v67[3];
  uint8_t buf[4];
  _QWORD v69[3];
  uint8_t v70[4];
  uint64_t v71;
  __int16 v72;
  CVReturn v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  BytesPerRow = CVPixelBufferGetBytesPerRow(self->_outputFlow);
  v12 = CVPixelBufferGetBytesPerRow(a3);
  v13 = CVPixelBufferGetBytesPerRow(a4);
  outputFlow = self->_outputFlow;
  v63 = 0;
  pixelBuffer = outputFlow;
  unlockFlags = 1;
  if (outputFlow)
  {
    v15 = v13;
    v16 = CVPixelBufferLockBaseAddress(outputFlow, 1uLL);
    v63 = v16;
    if (!v16
      || (v17 = v16, os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      && (*(_DWORD *)buf = 134218240,
          v69[0] = outputFlow,
          LOWORD(v69[1]) = 1024,
          *(_DWORD *)((char *)&v69[1] + 2) = v17,
          _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (v17 = v63) == 0))
    {
      *(_DWORD *)buf = 0;
      *(_OWORD *)((char *)v69 + 4) = (unint64_t)a3;
      if (a3)
      {
        v17 = CVPixelBufferLockBaseAddress(a3, 0);
        *(_DWORD *)buf = v17;
        if (!v17
          || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
          && (*(_DWORD *)v66 = 134218240,
              v67[0] = *(_QWORD *)((char *)v69 + 4),
              LOWORD(v67[1]) = 1024,
              *(_DWORD *)((char *)&v67[1] + 2) = v17,
              _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v66, 0x12u), (v17 = *(_DWORD *)buf) == 0))
        {
          *(_DWORD *)v66 = 0;
          *(_OWORD *)((char *)v67 + 4) = (unint64_t)a4;
          if (a4)
          {
            v17 = CVPixelBufferLockBaseAddress(a4, 0);
            *(_DWORD *)v66 = v17;
            if (!v17
              || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
              && (*(_DWORD *)v70 = 134218240,
                  v71 = *(_QWORD *)((char *)v67 + 4),
                  v72 = 1024,
                  v73 = v17,
                  _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v70, 0x12u), (v17 = *(_DWORD *)v66) == 0))
            {
              BaseAddress = (char *)CVPixelBufferGetBaseAddress(self->_outputFlow);
              v19 = (char *)CVPixelBufferGetBaseAddress(a3);
              v20 = (char *)CVPixelBufferGetBaseAddress(a4);
              cnnOutputHeight = self->super._cnnOutputHeight;
              if (cnnOutputHeight >= 1)
              {
                v22 = 0;
                v23 = (unint64_t)BytesPerRow >> 1;
                cnnOutputWidth = self->super._cnnOutputWidth;
                v25 = (int)v23;
                v26 = &BaseAddress[2 * cnnOutputHeight * (int)v23];
                v27 = 2 * v25;
                do
                {
                  if ((int)cnnOutputWidth >= 1)
                  {
                    v28 = 0;
                    do
                    {
                      _H0 = *(_WORD *)&BaseAddress[v28];
                      __asm { FCVT            S0, H0 }
                      _S0 = _S0 * a5;
                      __asm { FCVT            H0, S0 }
                      *(_WORD *)&v19[v28] = LOWORD(_S0);
                      LOWORD(_S0) = *(_WORD *)&v26[v28];
                      __asm { FCVT            S0, H0 }
                      _S0 = _S0 * a6;
                      __asm { FCVT            H0, S0 }
                      *(_WORD *)&v20[v28] = LOWORD(_S0);
                      v28 += 2;
                    }
                    while (2 * cnnOutputWidth != v28);
                  }
                  ++v22;
                  v26 += v27;
                  v20 += 2 * ((uint64_t)v15 >> 1);
                  v19 += 2 * ((uint64_t)v12 >> 1);
                  BaseAddress += v27;
                }
                while (v22 != cnnOutputHeight);
              }
              v17 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)v66);
              if (!v17)
              {
                v17 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
                if (!v17)
                  v17 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v63);
              }
            }
          }
          else
          {
            v55 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v55)
              -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v55, v56, v57, v58, v59, v60, v61, v62);
            v17 = -50;
            *(_DWORD *)v66 = -50;
          }
          if (*(_QWORD *)((char *)v67 + 4)
            && !*(_DWORD *)v66
            && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)((char *)v67 + 4), *(_QWORD *)((char *)&v67[1] + 4))
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
          }
          if (*(_QWORD *)((char *)v69 + 4)
            && !*(_DWORD *)buf
            && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)((char *)v69 + 4), *(_QWORD *)((char *)&v69[1] + 4))
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
          }
        }
      }
      else
      {
        v47 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v47)
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v47, v48, v49, v50, v51, v52, v53, v54);
        v17 = -50;
      }
      if (pixelBuffer
        && !v63
        && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
      }
    }
  }
  else
  {
    v38 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v38)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v38, v39, v40, v41, v42, v43, v44, v45);
    return -50;
  }
  return v17;
}

- (int)updateModelForAspectRatio:(id)a3 computationAccuracy:(unsigned int)a4
{
  NSString *v7;
  int v8;

  v7 = self->_resConfig;
  self->super._computationAccuracy = a4;
  v8 = -[VCPModelR2D2 configForAspectRatio:](self, "configForAspectRatio:", a3);
  if (!v8)
  {
    if (v7 == self->_resConfig)
      v8 = 0;
    else
      v8 = -[VCPModelR2D2 updateModulesWithConfig:](self, "updateModulesWithConfig:");
  }

  return v8;
}

- (void)releaseMemory
{
  -[VCPModelR2D2 releaseInputAndOutputBuffers](self, "releaseInputAndOutputBuffers");
  -[VCPModelR2D2 releaseFeatureBuffers](self, "releaseFeatureBuffers");
  -[VCPModelR2D2 releaseStorages](self, "releaseStorages");
}

- (void)dealloc
{
  objc_super v3;

  -[VCPModelR2D2 releaseMemory](self, "releaseMemory");
  v3.receiver = self;
  v3.super_class = (Class)VCPModelR2D2;
  -[VCPModelR2D2 dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  Scaler *p_scaler;
  uint64_t i;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_flowDecoderSemaphore, 0);
  objc_storeStrong((id *)&self->_backwarp, 0);
  objc_storeStrong((id *)&self->_correlation, 0);
  for (i = 6; i != -1; --i)
    objc_storeStrong((id *)&self->_flowDecoder[i], 0);
  objc_storeStrong((id *)&self->_featureExtractor, 0);
  objc_storeStrong((id *)&self->_resConfig, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 93) = 0;
  *((_DWORD *)self + 188) = 0;
  return self;
}

@end
