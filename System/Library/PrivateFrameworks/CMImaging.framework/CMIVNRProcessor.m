@implementation CMIVNRProcessor

- (CMIVNRProcessor)initWithCommandQueue:(id)a3
{
  id v4;
  CMIVNRProcessor *v5;
  FigMetalContext *v6;
  void *v7;
  uint64_t v8;
  FigMetalContext *metalContext;
  FigMetalContext *v10;
  uint64_t v11;
  MTLDevice *metalDevice;
  uint64_t v13;
  MTLCommandQueue *metalCommandQueue;
  VNRShaders *v15;
  VNRShaders *metalShaders;
  CMIVNRProcessor *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CMIVNRProcessor;
  v5 = -[CMIVNRProcessor init](&v19, sel_init);
  if (!v5)
    goto LABEL_7;
  v6 = [FigMetalContext alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:](v6, "initWithbundle:andOptionalCommandQueue:", v7, v4);
  metalContext = v5->_metalContext;
  v5->_metalContext = (FigMetalContext *)v8;

  v10 = v5->_metalContext;
  if (!v10)
    goto LABEL_7;
  -[FigMetalContext device](v10, "device");
  v11 = objc_claimAutoreleasedReturnValue();
  metalDevice = v5->_metalDevice;
  v5->_metalDevice = (MTLDevice *)v11;

  if (!v5->_metalDevice)
    goto LABEL_7;
  -[FigMetalContext commandQueue](v5->_metalContext, "commandQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  metalCommandQueue = v5->_metalCommandQueue;
  v5->_metalCommandQueue = (MTLCommandQueue *)v13;

  v15 = -[VNRShaders initWithMetalDevice:]([VNRShaders alloc], "initWithMetalDevice:", v5->_metalDevice);
  metalShaders = v5->_metalShaders;
  v5->_metalShaders = v15;

  if (v5->_metalShaders)
    v17 = v5;
  else
LABEL_7:
    v17 = 0;

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[CMIVNRProcessor purgeResources](self, "purgeResources");
  v3.receiver = self;
  v3.super_class = (Class)CMIVNRProcessor;
  -[CMIVNRProcessor dealloc](&v3, sel_dealloc);
}

- (int)prepareToProcess:(unsigned int)a3 prepareDescriptor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  VNRTuning *v12;
  void *tuning;
  VNRTuning *v14;
  void *v15;
  VNRTuning *v16;
  VNRTuning *v17;
  void *v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  VNRPyramid *v26;
  VNRPyramid *inputPyramid;
  VNRPyramid *v28;
  VNRPyramid *previousOutputPyramid;
  VNRPyramid *v30;
  VNRPyramid *deghostPyramid;
  VNRPyramid *v32;
  VNRPyramid *outputPyramid;
  void *v34;
  MTLTexture *v35;
  MTLTexture *previousLumaTex;
  MTLTexture *v37;
  MTLTexture *previousChromaTex;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  v9 = -12780;
  if (v6 && self->_tuningParameters)
  {
    if (objc_msgSend(v6, "inputWidth") && objc_msgSend(v7, "inputHeight"))
    {
      objc_storeStrong((id *)&self->_prepareDescriptor, a4);
      v10 = -[CMIVNRPrepareDescriptor inputWidth](self->_prepareDescriptor, "inputWidth");
      v11 = -[CMIVNRPrepareDescriptor inputHeight](self->_prepareDescriptor, "inputHeight");
      if (-[NSDictionary count](self->_tuningParameters, "count"))
      {
        v12 = -[VNRTuning initWithTuningParamsDict:]([VNRTuning alloc], "initWithTuningParamsDict:", self->_tuningParameters);
        tuning = self->_tuning;
        self->_tuning = v12;
      }
      else
      {
        +[CMIVNRProcessor getDefaultTuningParameters](CMIVNRProcessor, "getDefaultTuningParameters");
        tuning = (void *)objc_claimAutoreleasedReturnValue();
        v14 = [VNRTuning alloc];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", tuning);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[VNRTuning initWithTuningParamsDict:](v14, "initWithTuningParamsDict:", v15);
        v17 = self->_tuning;
        self->_tuning = v16;

      }
      if (self->_tuning)
      {
        -[CMIVNRProcessor tuning](self, "tuning");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNRTuning lumaBands](v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        -[CMIVNRProcessor tuning](self, "tuning");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNRTuning chromaBands](v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

        v26 = -[VNRPyramid initWithMetalDevice:isForDeghosting:width:height:nLumaLevels:nChromaLevels:lumaStartingLevel:chromaStartingLevel:]([VNRPyramid alloc], "initWithMetalDevice:isForDeghosting:width:height:nLumaLevels:nChromaLevels:lumaStartingLevel:chromaStartingLevel:", self->_metalDevice, 0, (unint64_t)v10 >> 1, (unint64_t)v11 >> 1, v21, v25, 0, 0);
        inputPyramid = self->_inputPyramid;
        self->_inputPyramid = v26;

        v28 = -[VNRPyramid initWithMetalDevice:isForDeghosting:width:height:nLumaLevels:nChromaLevels:lumaStartingLevel:chromaStartingLevel:]([VNRPyramid alloc], "initWithMetalDevice:isForDeghosting:width:height:nLumaLevels:nChromaLevels:lumaStartingLevel:chromaStartingLevel:", self->_metalDevice, 0, (unint64_t)v10 >> 1, (unint64_t)v11 >> 1, v21, v25, 0, 0);
        previousOutputPyramid = self->_previousOutputPyramid;
        self->_previousOutputPyramid = v28;

        v30 = -[VNRPyramid initWithMetalDevice:isForDeghosting:width:height:nLumaLevels:nChromaLevels:lumaStartingLevel:chromaStartingLevel:]([VNRPyramid alloc], "initWithMetalDevice:isForDeghosting:width:height:nLumaLevels:nChromaLevels:lumaStartingLevel:chromaStartingLevel:", self->_metalDevice, 1, (unint64_t)v10 >> 1, (unint64_t)v11 >> 1, v21, v25, 0, 0);
        deghostPyramid = self->_deghostPyramid;
        self->_deghostPyramid = v30;

        v32 = -[VNRPyramid initWithMetalDevice:isForDeghosting:width:height:nLumaLevels:nChromaLevels:lumaStartingLevel:chromaStartingLevel:]([VNRPyramid alloc], "initWithMetalDevice:isForDeghosting:width:height:nLumaLevels:nChromaLevels:lumaStartingLevel:chromaStartingLevel:", self->_metalDevice, 0, (unint64_t)v10 >> 1, (unint64_t)v11 >> 1, v21, v25, 0, 0);
        outputPyramid = self->_outputPyramid;
        self->_outputPyramid = v32;

        objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, v10, v11, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v34;
        if (!v34)
          goto LABEL_14;
        objc_msgSend(v34, "setUsage:", 3);
        v35 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_metalDevice, "newTextureWithDescriptor:", v8);
        previousLumaTex = self->_previousLumaTex;
        self->_previousLumaTex = v35;

        if (!self->_previousLumaTex)
          goto LABEL_14;
        objc_msgSend(v8, "setWidth:", (unint64_t)objc_msgSend(v8, "width") >> 1);
        objc_msgSend(v8, "setHeight:", (unint64_t)objc_msgSend(v8, "height") >> 1);
        objc_msgSend(v8, "setPixelFormat:", 30);
        v37 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_metalDevice, "newTextureWithDescriptor:", v8);
        previousChromaTex = self->_previousChromaTex;
        self->_previousChromaTex = v37;

        if (self->_previousChromaTex)
        {
          v9 = 0;
          self->_frameIndex = 0;
        }
        else
        {
LABEL_14:
          v9 = -12786;
        }
      }
      else
      {
        v8 = 0;
        v9 = -12780;
      }
    }
    else
    {
      v8 = 0;
    }
  }

  return v9;
}

- (int)purgeResources
{
  VNRPyramid *inputPyramid;
  VNRPyramid *previousOutputPyramid;
  VNRPyramid *deghostPyramid;
  VNRPyramid *outputPyramid;
  MTLTexture *previousLumaTex;
  MTLTexture *previousChromaTex;

  inputPyramid = self->_inputPyramid;
  self->_inputPyramid = 0;

  previousOutputPyramid = self->_previousOutputPyramid;
  self->_previousOutputPyramid = 0;

  deghostPyramid = self->_deghostPyramid;
  self->_deghostPyramid = 0;

  outputPyramid = self->_outputPyramid;
  self->_outputPyramid = 0;

  previousLumaTex = self->_previousLumaTex;
  self->_previousLumaTex = 0;

  previousChromaTex = self->_previousChromaTex;
  self->_previousChromaTex = 0;

  return 0;
}

- (int)process
{
  __CVBuffer *inputPixelBuffer;
  size_t Width;
  size_t Height;
  float v6;
  void *v7;
  double v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFDictionary *v14;
  MTLTexture *previousLumaTex;
  MTLTexture *previousChromaTex;
  int v17;

  if (!self->_prepareDescriptor
    || (inputPixelBuffer = self->_inputPixelBuffer) == 0
    || !self->_inputMetadata
    || !self->_outputPixelBuffer
    || (Width = CVPixelBufferGetWidth(inputPixelBuffer),
        Height = CVPixelBufferGetHeight(self->_inputPixelBuffer),
        Width != CVPixelBufferGetWidth(self->_outputPixelBuffer))
    || Height != CVPixelBufferGetHeight(self->_outputPixelBuffer))
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v9 = 0;
    goto LABEL_21;
  }
  v6 = calculateTotalGain(self->_inputMetadata);
  -[CMIVNRProcessor tuning](self, "tuning");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = v6;
  v9 = objc_msgSend(v7, "updateWithGain:", v8);

  if (v9)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_21;
  }
  -[CMIVNRProcessor bindTextureToPixelBuffer:plane:metalPixelFormat:usage:](self, "bindTextureToPixelBuffer:plane:metalPixelFormat:usage:", self->_inputPixelBuffer, 0, 10, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = 0;
    goto LABEL_26;
  }
  -[CMIVNRProcessor bindTextureToPixelBuffer:plane:metalPixelFormat:usage:](self, "bindTextureToPixelBuffer:plane:metalPixelFormat:usage:", self->_inputPixelBuffer, 1, 30, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_26:
    v12 = 0;
    goto LABEL_27;
  }
  -[CMIVNRProcessor bindTextureToPixelBuffer:plane:metalPixelFormat:usage:](self, "bindTextureToPixelBuffer:plane:metalPixelFormat:usage:", self->_outputPixelBuffer, 0, 10, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_27:
    v13 = 0;
    goto LABEL_28;
  }
  -[CMIVNRProcessor bindTextureToPixelBuffer:plane:metalPixelFormat:usage:](self, "bindTextureToPixelBuffer:plane:metalPixelFormat:usage:", self->_outputPixelBuffer, 1, 30, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_28:
    v14 = 0;
    v9 = -12786;
    goto LABEL_21;
  }
  ++self->_frameIndex;
  v14 = CVBufferCopyAttachments(self->_inputPixelBuffer, kCVAttachmentMode_ShouldPropagate);
  if (v14)
    CVBufferSetAttachments(self->_outputPixelBuffer, v14, kCVAttachmentMode_ShouldPropagate);
  if (self->_frameIndex < 2)
  {
    previousLumaTex = 0;
    previousChromaTex = 0;
  }
  else
  {
    previousLumaTex = self->_previousLumaTex;
    previousChromaTex = self->_previousChromaTex;
  }
  v17 = -[CMIVNRProcessor fillInputPyramid:previousOutputPyramid:deghostPyramid:inputLuma:inputChroma:previousOutputLuma:previousOutputChroma:](self, "fillInputPyramid:previousOutputPyramid:deghostPyramid:inputLuma:inputChroma:previousOutputLuma:previousOutputChroma:", self->_inputPyramid, self->_previousOutputPyramid, self->_deghostPyramid, v10, v11, previousLumaTex, previousChromaTex);
  if (v17
    || (v17 = -[CMIVNRProcessor propagateDeghostingScoresDownPyramid:](self, "propagateDeghostingScoresDownPyramid:", self->_deghostPyramid)) != 0)
  {
    v9 = v17;
  }
  else
  {
    v9 = -[CMIVNRProcessor fuseWithInputPyramid:deghostPyramid:previousOutputPyramid:outputPyramid:inputLuma:inputChroma:previousOutputLuma:previousOutputChroma:outputLuma:outputChroma:frameIdx:](self, "fuseWithInputPyramid:deghostPyramid:previousOutputPyramid:outputPyramid:inputLuma:inputChroma:previousOutputLuma:previousOutputChroma:outputLuma:outputChroma:frameIdx:", self->_inputPyramid, self->_deghostPyramid, self->_previousOutputPyramid, self->_outputPyramid, v10, v11, self->_previousLumaTex, self->_previousChromaTex, v12, v13, self->_frameIndex);
    if (!v9)
      -[CMIVNRProcessor waitUntilScheduledWithWorkloadName:](self, "waitUntilScheduledWithWorkloadName:", "vnr");
  }
LABEL_21:

  return v9;
}

- (int)finishProcessing
{
  -[FigMetalContext waitForIdle](self->_metalContext, "waitForIdle");
  -[CMIVNRProcessor setInputPixelBuffer:](self, "setInputPixelBuffer:", 0);
  -[CMIVNRProcessor setOutputPixelBuffer:](self, "setOutputPixelBuffer:", 0);
  return 0;
}

- (int)prewarm
{
  VNRShaders *v2;
  int v3;

  v2 = -[VNRShaders initWithMetalDevice:]([VNRShaders alloc], "initWithMetalDevice:", self->_metalDevice);
  if (v2)
    v3 = 0;
  else
    v3 = -12786;

  return v3;
}

- (int)resetState
{
  self->_frameIndex = 0;
  return 0;
}

- (int)setup
{
  return 0;
}

- (int)prepareToProcess:(unsigned int)a3
{
  return 0;
}

+ (id)getTuningParametersForCurrentDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a1, "_productTypeFromMGGetProductType:", MGGetProductType());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v6 = 0;
    v4 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("VNRTuning"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v6 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_5;
  }
  v7 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v5, "objectForKeyedSubscript:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  v10 = v9;

  return v10;
}

+ (id)getDefaultTuningParameters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("VNRTuning"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Default"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dictionaryWithDictionary:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
    v5 = 0;
  }

  return v8;
}

- (MTLCommandBuffer)metalCommandBuffer
{
  MTLCommandBuffer *metalCommandBuffer;
  MTLCommandBuffer *v4;
  MTLCommandBuffer *v5;

  metalCommandBuffer = self->_metalCommandBuffer;
  if (!metalCommandBuffer)
  {
    -[MTLCommandQueue commandBuffer](self->_metalCommandQueue, "commandBuffer");
    v4 = (MTLCommandBuffer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_metalCommandBuffer;
    self->_metalCommandBuffer = v4;

    metalCommandBuffer = self->_metalCommandBuffer;
  }
  return metalCommandBuffer;
}

- (void)waitUntilScheduledWithWorkloadName:(const char *)a3
{
  MTLCommandBuffer *metalCommandBuffer;
  MTLCommandBuffer *v5;

  metalCommandBuffer = self->_metalCommandBuffer;
  if (metalCommandBuffer)
  {
    -[MTLCommandBuffer commit](metalCommandBuffer, "commit", a3);
    -[MTLCommandBuffer waitUntilScheduled](self->_metalCommandBuffer, "waitUntilScheduled");
    v5 = self->_metalCommandBuffer;
    self->_metalCommandBuffer = 0;

  }
}

+ (id)_productTypeFromMGGetProductType:(int)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = CFSTR("0x48dc8346");
  if (a3 != 1222411078)
    v3 = 0;
  if (a3 == -219703988)
    v4 = CFSTR("0xf2e7954c");
  else
    v4 = v3;
  v5 = CFSTR("0xeba76c7a");
  if (a3 != -341349254)
    v5 = 0;
  if (a3 == -1484131828)
    v6 = CFSTR("0xa789f20c");
  else
    v6 = v5;
  if (a3 <= -219703989)
    return (id)v6;
  else
    return (id)v4;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->_metalCommandQueue, a3);
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->_tuningParameters, a3);
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_storeStrong((id *)&self->_cameraInfoByPortType, a3);
}

- (__CVBuffer)inputPixelBuffer
{
  return self->_inputPixelBuffer;
}

- (void)setInputPixelBuffer:(__CVBuffer *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSDictionary)inputMetadata
{
  return self->_inputMetadata;
}

- (void)setInputMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_inputMetadata, a3);
}

- (__CVBuffer)outputPixelBuffer
{
  return self->_outputPixelBuffer;
}

- (void)setOutputPixelBuffer:(__CVBuffer *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (VNRTuning)tuning
{
  return (VNRTuning *)objc_getProperty(self, a2, 80, 1);
}

- (MTLDevice)metalDevice
{
  return self->_metalDevice;
}

- (void)setMetalDevice:(id)a3
{
  objc_storeStrong((id *)&self->_metalDevice, a3);
}

- (VNRShaders)metalShaders
{
  return self->_metalShaders;
}

- (void)setMetalShaders:(id)a3
{
  objc_storeStrong((id *)&self->_metalShaders, a3);
}

- (MTLTexture)previousLumaTex
{
  return self->_previousLumaTex;
}

- (void)setPreviousLumaTex:(id)a3
{
  objc_storeStrong((id *)&self->_previousLumaTex, a3);
}

- (MTLTexture)previousChromaTex
{
  return self->_previousChromaTex;
}

- (void)setPreviousChromaTex:(id)a3
{
  objc_storeStrong((id *)&self->_previousChromaTex, a3);
}

- (VNRPyramid)inputPyramid
{
  return self->_inputPyramid;
}

- (void)setInputPyramid:(id)a3
{
  objc_storeStrong((id *)&self->_inputPyramid, a3);
}

- (VNRPyramid)previousOutputPyramid
{
  return self->_previousOutputPyramid;
}

- (void)setPreviousOutputPyramid:(id)a3
{
  objc_storeStrong((id *)&self->_previousOutputPyramid, a3);
}

- (VNRPyramid)deghostPyramid
{
  return self->_deghostPyramid;
}

- (void)setDeghostPyramid:(id)a3
{
  objc_storeStrong((id *)&self->_deghostPyramid, a3);
}

- (VNRPyramid)outputPyramid
{
  return self->_outputPyramid;
}

- (void)setOutputPyramid:(id)a3
{
  objc_storeStrong((id *)&self->_outputPyramid, a3);
}

- (unint64_t)frameIndex
{
  return self->_frameIndex;
}

- (void)setFrameIndex:(unint64_t)a3
{
  self->_frameIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputPyramid, 0);
  objc_storeStrong((id *)&self->_deghostPyramid, 0);
  objc_storeStrong((id *)&self->_previousOutputPyramid, 0);
  objc_storeStrong((id *)&self->_inputPyramid, 0);
  objc_storeStrong((id *)&self->_previousChromaTex, 0);
  objc_storeStrong((id *)&self->_previousLumaTex, 0);
  objc_storeStrong((id *)&self->_metalShaders, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
  objc_storeStrong((id *)&self->_tuning, 0);
  objc_storeStrong((id *)&self->_inputMetadata, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_prepareDescriptor, 0);
  objc_storeStrong((id *)&self->_metalCommandBuffer, 0);
}

- (int)propagateDeghostingScoresDownPyramid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  float v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  void *v45;
  void *v46;
  float v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  void *v53;
  const char *v54;
  void *v55;
  float v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int64x2_t v63;
  int64x2_t v64;
  int64x2_t v65;
  uint64_t v66;
  _QWORD v67[3];
  int64x2_t v68;
  uint64_t v69;
  _QWORD v70[3];
  int64x2_t v71;
  uint64_t v72;
  _QWORD v73[3];
  float v74[3];

  v4 = a3;
  -[CMIVNRProcessor metalCommandBuffer](self, "metalCommandBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "computeCommandEncoder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "chromaLevels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "lumaLevels");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      v10 = objc_msgSend(v8, "count");
      objc_msgSend(v4, "chromaLevels");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count") + 1;

      if (v10 != v12)
      {
        v52 = -12782;
        goto LABEL_18;
      }
      objc_msgSend(v4, "lumaLevels");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "chromaLevels");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[CMIVNRProcessor metalShaders](self, "metalShaders");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "deghostPropagateLumaChroma");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setComputePipelineState:", v18);

      objc_msgSend(v4, "lumaLevels");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20 < 3)
      {
        v32 = v16;
        v29 = v14;
LABEL_15:
        -[CMIVNRProcessor tuning](self, "tuning");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNRTuning lumaBands](v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = -[VNRTuningBand deghostBoostFactorScaling]((uint64_t)v25);
        -[CMIVNRProcessor tuning](self, "tuning");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v74[0] = v56 * -[VNRTuning deghostBoostFactor]((uint64_t)v57);

        objc_msgSend(v4, "lumaLevels");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        -[CMIVNRProcessor metalShaders](self, "metalShaders");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "deghostPropagateLuma");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setComputePipelineState:", v61);

        objc_msgSend(v6, "setTexture:atIndex:", v29, 0);
        objc_msgSend(v6, "setTexture:atIndex:", v59, 1);
        objc_msgSend(v6, "setBytes:length:atIndex:", v74, 4, 0);
        v70[0] = objc_msgSend(v59, "width");
        v70[1] = objc_msgSend(v59, "height");
        v70[2] = 1;
        v68 = vdupq_n_s64(0x20uLL);
        v69 = 1;
        objc_msgSend(v6, "dispatchThreads:threadsPerThreadgroup:", v70, &v68);

        v52 = 0;
        v16 = v32;
        v14 = v29;
      }
      else
      {
        v21 = (v20 - 2);
        v63 = vdupq_n_s64(0x20uLL);
        while (1)
        {
          -[CMIVNRProcessor tuning](self, "tuning", *(_OWORD *)&v63);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNRTuning lumaBands](v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v74[0] = 0.0;
          v26 = -[VNRTuningBand deghostBoostFactorScaling]((uint64_t)v25);
          -[CMIVNRProcessor tuning](self, "tuning");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v74[0] = v26 * -[VNRTuning deghostBoostFactor]((uint64_t)v27);

          objc_msgSend(v4, "lumaLevels");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectAtIndexedSubscript:", v21);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = v4;
          objc_msgSend(v4, "chromaLevels");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectAtIndexedSubscript:", --v21);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = objc_msgSend(v29, "width");
          if (v33 != objc_msgSend(v32, "width"))
            break;
          v34 = objc_msgSend(v29, "height");
          if (v34 != objc_msgSend(v32, "height"))
            break;
          objc_msgSend(v6, "setTexture:atIndex:", v14, 0);
          objc_msgSend(v6, "setTexture:atIndex:", v29, 1);
          objc_msgSend(v6, "setTexture:atIndex:", v16, 2);
          objc_msgSend(v6, "setTexture:atIndex:", v32, 3);
          objc_msgSend(v6, "setBytes:length:atIndex:", v74, 4, 0);
          v35 = objc_msgSend(v29, "width");
          v36 = objc_msgSend(v29, "height");
          v73[0] = v35;
          v73[1] = v36;
          v73[2] = 1;
          v71 = v63;
          v72 = 1;
          objc_msgSend(v6, "dispatchThreads:threadsPerThreadgroup:", v73, &v71);

          v14 = v29;
          v16 = v32;
          v4 = v30;
          if ((unint64_t)(v21 + 1) <= 1)
            goto LABEL_15;
        }

        v52 = -12782;
        v4 = v30;
      }

    }
    else
    {
      objc_msgSend(v8, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[CMIVNRProcessor metalShaders](self, "metalShaders");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "deghostPropagateLuma");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setComputePipelineState:", v38);

      objc_msgSend(v4, "lumaLevels");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "count");

      if (v40 >= 2)
      {
        v41 = (v40 - 2);
        v64 = vdupq_n_s64(0x20uLL);
        do
        {
          v42 = v14;
          -[CMIVNRProcessor tuning](self, "tuning", *(_OWORD *)&v64);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNRTuning lumaBands](v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectAtIndexedSubscript:", v41);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v74[0] = 0.0;
          v47 = -[VNRTuningBand deghostBoostFactorScaling]((uint64_t)v46);
          -[CMIVNRProcessor tuning](self, "tuning");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v74[0] = v47 * -[VNRTuning deghostBoostFactor]((uint64_t)v48);

          objc_msgSend(v4, "lumaLevels");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectAtIndexedSubscript:", v41);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "setTexture:atIndex:", v42, 0);
          objc_msgSend(v6, "setTexture:atIndex:", v14, 1);
          objc_msgSend(v6, "setBytes:length:atIndex:", v74, 4, 0);
          v50 = objc_msgSend(v14, "width");
          v51 = objc_msgSend(v14, "height");
          v67[0] = v50;
          v67[1] = v51;
          v67[2] = 1;
          v65 = v64;
          v66 = 1;
          objc_msgSend(v6, "dispatchThreads:threadsPerThreadgroup:", v67, &v65);

          --v41;
        }
        while (v41 != -1);
      }
      v52 = 0;
    }

  }
  else
  {
    v52 = -12786;
  }
LABEL_18:
  objc_msgSend(v6, "endEncoding");

  return v52;
}

- (int)fuseWithInputPyramid:(id)a3 deghostPyramid:(id)a4 previousOutputPyramid:(id)a5 outputPyramid:(id)a6 inputLuma:(id)a7 inputChroma:(id)a8 previousOutputLuma:(id)a9 previousOutputChroma:(id)a10 outputLuma:(id)a11 outputChroma:(id)a12 frameIdx:(unint64_t)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  CMIVNRProcessor *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  const char *v48;
  void *v49;
  uint64_t v50;
  float v51;
  float v52;
  float v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  int v59;
  const char *v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  const char *v73;
  void *v74;
  float v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  float v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  CMIVNRProcessor *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  const char *v106;
  void *v107;
  uint64_t v108;
  float v109;
  float v110;
  float v111;
  id v112;
  id v113;
  id v114;
  id v115;
  void *v116;
  int v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  const char *v127;
  void *v128;
  float v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  void *v133;
  id v134;
  id v135;
  id v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  float v141;
  void *v142;
  unint64_t v144;
  unint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  CMIVNRProcessor *v150;
  void *v151;
  id v152;
  void *v153;
  void *v154;
  id v155;
  id v156;
  id v157;
  void *v158;
  int64x2_t v159;
  int64x2_t v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  id v173;
  id v174;
  void *v175;
  void *v176;
  int64x2_t v177;
  uint64_t v178;
  _QWORD v179[3];
  int64x2_t v180;
  uint64_t v181;
  _QWORD v182[3];
  int64x2_t v183;
  uint64_t v184;
  _QWORD v185[3];
  int64x2_t v186;
  uint64_t v187;
  _QWORD v188[3];
  int64x2_t v189;
  uint64_t v190;
  _QWORD v191[3];
  int64x2_t v192;
  uint64_t v193;
  _QWORD v194[3];
  int64x2_t v195;
  uint64_t v196;
  _QWORD v197[3];
  int64x2_t v198;
  uint64_t v199;
  _QWORD v200[3];
  float v201;
  float v202;
  float v203;

  v19 = a3;
  v20 = a4;
  v174 = a5;
  v173 = a6;
  v156 = a7;
  v157 = a8;
  v155 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v24 = self;
  -[CMIVNRProcessor metalCommandBuffer](self, "metalCommandBuffer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "computeCommandEncoder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v175 = v20;
    v152 = v21;
    v176 = v19;
    objc_msgSend(v19, "lumaLevels");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    v153 = v23;
    v154 = v22;
    v172 = v26;
    v144 = a13;
    if (v28)
    {
      -[CMIVNRProcessor metalShaders](self, "metalShaders");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (a13)
      {
        objc_msgSend(v29, "fusionTopLuma");
        v31 = objc_claimAutoreleasedReturnValue();

        -[CMIVNRProcessor metalShaders](self, "metalShaders");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "fusionMidLuma");
        v158 = (void *)objc_claimAutoreleasedReturnValue();

        -[CMIVNRProcessor metalShaders](self, "metalShaders");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "fusionBottomLuma");
      }
      else
      {
        objc_msgSend(v29, "fusionInitialTopLuma");
        v31 = objc_claimAutoreleasedReturnValue();

        -[CMIVNRProcessor metalShaders](self, "metalShaders");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "fusionInitialMidLuma");
        v158 = (void *)objc_claimAutoreleasedReturnValue();

        -[CMIVNRProcessor metalShaders](self, "metalShaders");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "fusionInitialBottomLuma");
      }
      v146 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v176, "lumaLevels");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "lastObject");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v174, "lumaLevels");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "lastObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v173, "lumaLevels");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "lastObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "lumaLevels");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "lastObject");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v150 = self;
      -[CMIVNRProcessor tuning](self, "tuning");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNRTuning lumaBands](v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "lastObject");
      v50 = objc_claimAutoreleasedReturnValue();

      v202 = 1.0 - -[VNRTuning ghostAttenuationLuma]((uint64_t)v47);
      v51 = -[VNRTuning ghostAttenuationBreakthroughSigmaLuma]((uint64_t)v47);
      v203 = -1.0 / (float)((float)(v51 * v51) + (float)(v51 * v51));
      v52 = (float)(-1.0 / (float)a13) + 1.0;
      v162 = v47;
      v53 = -[VNRTuning fusionStrengthLuma]((uint64_t)v47);
      v201 = fminf(v52, v53 * -[VNRTuningBand fusionStrengthScaling](v50));
      objc_msgSend(v26, "setBytes:length:atIndex:", &v201, 12, 0);
      v148 = (void *)v31;
      objc_msgSend(v26, "setComputePipelineState:", v31);
      objc_msgSend(v26, "setTexture:atIndex:", v40, 0);
      objc_msgSend(v26, "setTexture:atIndex:", v42, 1);
      objc_msgSend(v26, "setTexture:atIndex:", v44, 3);
      objc_msgSend(v26, "setTexture:atIndex:", v46, 7);
      v200[0] = objc_msgSend(v44, "width");
      v200[1] = objc_msgSend(v44, "height");
      v200[2] = 1;
      v198 = vdupq_n_s64(0x10uLL);
      v199 = 1;
      objc_msgSend(v26, "dispatchThreads:threadsPerThreadgroup:", v200, &v198);
      v54 = v40;
      v55 = v42;
      v56 = v44;
      v57 = v46;
      objc_msgSend(v26, "setComputePipelineState:", v158);
      objc_msgSend(v176, "lumaLevels");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "count");

      if (v59 < 2)
      {
        v80 = (void *)v50;
        v79 = v55;
        v81 = v57;
      }
      else
      {
        v61 = (v59 - 2);
        v160 = vdupq_n_s64(0x20uLL);
        v62 = v57;
        v63 = v54;
        v64 = v56;
        v65 = (void *)v50;
        do
        {
          v66 = v62;
          v164 = v62;
          objc_msgSend(v176, "lumaLevels", v144);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "objectAtIndexedSubscript:", v61);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v174, "lumaLevels");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "objectAtIndexedSubscript:", v61);
          v166 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v173, "lumaLevels");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "objectAtIndexedSubscript:", v61);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v175, "lumaLevels");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "objectAtIndexedSubscript:", v61);
          v169 = (void *)objc_claimAutoreleasedReturnValue();

          -[VNRTuning lumaBands](v162, v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "objectAtIndexedSubscript:", v61);
          v167 = objc_claimAutoreleasedReturnValue();

          v75 = -[VNRTuning fusionStrengthLuma]((uint64_t)v162);
          v201 = fminf(v52, v75 * -[VNRTuningBand fusionStrengthScaling](v167));
          objc_msgSend(v172, "setBytes:length:atIndex:", &v201, 12, 0);
          objc_msgSend(v172, "setTexture:atIndex:", v68, 0);
          objc_msgSend(v172, "setTexture:atIndex:", v166, 1);
          objc_msgSend(v172, "setTexture:atIndex:", v71, 3);
          objc_msgSend(v172, "setTexture:atIndex:", v63, 4);
          objc_msgSend(v172, "setTexture:atIndex:", v55, 5);
          objc_msgSend(v172, "setTexture:atIndex:", v64, 6);
          objc_msgSend(v172, "setTexture:atIndex:", v164, 7);
          v76 = objc_msgSend(v71, "width");
          v77 = objc_msgSend(v71, "height");
          v197[0] = v76;
          v197[1] = v77;
          v197[2] = 1;
          v195 = v160;
          v196 = 1;
          objc_msgSend(v172, "dispatchThreads:threadsPerThreadgroup:", v197, &v195);
          v78 = v68;

          v79 = v166;
          v56 = v71;

          v80 = (void *)v167;
          v81 = v169;

          --v61;
          v62 = v81;
          v64 = v56;
          v55 = v79;
          v54 = v78;
          v63 = v78;
          v65 = (void *)v167;
        }
        while (v61 != -1);
      }
      -[VNRTuning lumaBands](v162, v60);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "firstObject");
      v170 = (void *)objc_claimAutoreleasedReturnValue();

      v83 = -[VNRTuning fusionStrengthLuma]((uint64_t)v162);
      v201 = fminf(v52, v83 * -[VNRTuningBand fusionStrengthScaling]((uint64_t)v170));
      v26 = v172;
      objc_msgSend(v172, "setComputePipelineState:", v146);
      objc_msgSend(v172, "setBytes:length:atIndex:", &v201, 12, 0);
      objc_msgSend(v172, "setTexture:atIndex:", v156, 0);
      objc_msgSend(v172, "setTexture:atIndex:", v155, 2);
      v22 = v154;
      objc_msgSend(v172, "setTexture:atIndex:", v154, 3);
      objc_msgSend(v172, "setTexture:atIndex:", v54, 4);
      objc_msgSend(v172, "setTexture:atIndex:", v79, 5);
      objc_msgSend(v172, "setTexture:atIndex:", v56, 6);
      objc_msgSend(v172, "setTexture:atIndex:", v81, 7);
      v194[0] = objc_msgSend(v154, "width");
      v194[1] = objc_msgSend(v154, "height");
      v194[2] = 1;
      v192 = vdupq_n_s64(0x20uLL);
      v193 = 1;
      objc_msgSend(v172, "dispatchThreads:threadsPerThreadgroup:", v194, &v192);

      v20 = v175;
      v37 = v176;
      v36 = v157;
      v23 = v153;
      v24 = v150;
    }
    else
    {
      -[CMIVNRProcessor metalShaders](self, "metalShaders");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "simpleCopy");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setComputePipelineState:", v35);

      objc_msgSend(v26, "setTexture:atIndex:", v156, 0);
      objc_msgSend(v26, "setTexture:atIndex:", v22, 1);
      v191[0] = objc_msgSend(v22, "width");
      v191[1] = objc_msgSend(v22, "height");
      v191[2] = 1;
      v189 = vdupq_n_s64(0x20uLL);
      v190 = 1;
      objc_msgSend(v26, "dispatchThreads:threadsPerThreadgroup:", v191, &v189);
      v36 = v157;
      v37 = v19;
    }
    v19 = v37;
    objc_msgSend(v37, "chromaLevels", v144);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v84, "count");

    if (v85)
    {
      -[CMIVNRProcessor metalShaders](v24, "metalShaders");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v86;
      if (v145)
      {
        objc_msgSend(v86, "fusionTopChroma");
        v151 = (void *)objc_claimAutoreleasedReturnValue();

        -[CMIVNRProcessor metalShaders](v24, "metalShaders");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "fusionMidChroma");
        v149 = (void *)objc_claimAutoreleasedReturnValue();

        -[CMIVNRProcessor metalShaders](v24, "metalShaders");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "fusionBottomChroma");
      }
      else
      {
        objc_msgSend(v86, "fusionInitialTopChroma");
        v151 = (void *)objc_claimAutoreleasedReturnValue();

        -[CMIVNRProcessor metalShaders](v24, "metalShaders");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "fusionInitialMidChroma");
        v149 = (void *)objc_claimAutoreleasedReturnValue();

        -[CMIVNRProcessor metalShaders](v24, "metalShaders");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "fusionInitialBottomChroma");
      }
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = v24;

      v96 = v19;
      objc_msgSend(v19, "chromaLevels");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "lastObject");
      v98 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v174, "chromaLevels");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "lastObject");
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v173, "chromaLevels");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "lastObject");
      v102 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v175, "chromaLevels");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "lastObject");
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      -[CMIVNRProcessor tuning](v95, "tuning");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNRTuning chromaBands](v105, v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "lastObject");
      v108 = objc_claimAutoreleasedReturnValue();

      v202 = 1.0 - -[VNRTuning ghostAttenuationChroma]((uint64_t)v105);
      v109 = -[VNRTuning ghostAttenuationBreakthroughSigmaChroma]((uint64_t)v105);
      v203 = -1.0 / (float)((float)(v109 * v109) + (float)(v109 * v109));
      v110 = (float)(-1.0 / (float)v145) + 1.0;
      v161 = v105;
      v111 = -[VNRTuning fusionStrengthChroma]((uint64_t)v105);
      v171 = (void *)v108;
      v201 = fminf(v110, v111 * -[VNRTuningBand fusionStrengthScaling](v108));
      objc_msgSend(v26, "setBytes:length:atIndex:", &v201, 12, 0);
      objc_msgSend(v26, "setComputePipelineState:", v151);
      objc_msgSend(v26, "setTexture:atIndex:", v98, 0);
      objc_msgSend(v26, "setTexture:atIndex:", v100, 1);
      objc_msgSend(v26, "setTexture:atIndex:", v102, 3);
      objc_msgSend(v26, "setTexture:atIndex:", v104, 7);
      v188[0] = objc_msgSend(v102, "width");
      v188[1] = objc_msgSend(v102, "height");
      v188[2] = 1;
      v186 = vdupq_n_s64(0x10uLL);
      v187 = 1;
      objc_msgSend(v26, "dispatchThreads:threadsPerThreadgroup:", v188, &v186);
      v112 = v98;
      v113 = v100;
      v114 = v102;
      v115 = v104;
      objc_msgSend(v26, "setComputePipelineState:", v149);
      objc_msgSend(v96, "chromaLevels");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend(v116, "count");

      if (v117 < 2)
      {
        v137 = v171;
        v135 = v113;
        v136 = v114;
        v138 = v115;
      }
      else
      {
        v119 = (v117 - 2);
        v159 = vdupq_n_s64(0x20uLL);
        v120 = v112;
        do
        {
          objc_msgSend(v176, "chromaLevels");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "objectAtIndexedSubscript:", v119);
          v122 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v174, "chromaLevels");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "objectAtIndexedSubscript:", v119);
          v163 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v173, "chromaLevels");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "objectAtIndexedSubscript:", v119);
          v125 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v175, "chromaLevels");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "objectAtIndexedSubscript:", v119);
          v168 = (void *)objc_claimAutoreleasedReturnValue();

          -[VNRTuning chromaBands](v161, v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "objectAtIndexedSubscript:", v119);
          v165 = objc_claimAutoreleasedReturnValue();

          v129 = -[VNRTuning fusionStrengthChroma]((uint64_t)v161);
          v201 = fminf(v110, v129 * -[VNRTuningBand fusionStrengthScaling](v165));
          objc_msgSend(v172, "setBytes:length:atIndex:", &v201, 12, 0);
          objc_msgSend(v172, "setTexture:atIndex:", v122, 0);
          objc_msgSend(v172, "setTexture:atIndex:", v163, 1);
          objc_msgSend(v172, "setTexture:atIndex:", v125, 3);
          objc_msgSend(v172, "setTexture:atIndex:", v120, 4);
          objc_msgSend(v172, "setTexture:atIndex:", v113, 5);
          objc_msgSend(v172, "setTexture:atIndex:", v114, 6);
          objc_msgSend(v172, "setTexture:atIndex:", v115, 7);
          v130 = objc_msgSend(v125, "width");
          v131 = objc_msgSend(v125, "height");
          v185[0] = v130;
          v185[1] = v131;
          v185[2] = 1;
          v183 = v159;
          v184 = 1;
          objc_msgSend(v172, "dispatchThreads:threadsPerThreadgroup:", v185, &v183);
          v132 = v122;
          v133 = v115;
          v134 = v132;

          v135 = v163;
          v136 = v125;

          v137 = (void *)v165;
          v138 = v168;

          --v119;
          v114 = v136;
          v113 = v135;
          v112 = v134;
          v120 = v134;
          v115 = v138;
          v171 = (void *)v165;
        }
        while (v119 != -1);
      }
      -[VNRTuning chromaBands](v161, v118);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "firstObject");
      v140 = (void *)objc_claimAutoreleasedReturnValue();

      v141 = -[VNRTuning fusionStrengthChroma]((uint64_t)v161);
      v201 = fminf(v110, v141 * -[VNRTuningBand fusionStrengthScaling]((uint64_t)v140));
      objc_msgSend(v172, "setComputePipelineState:", v147);
      objc_msgSend(v172, "setBytes:length:atIndex:", &v201, 12, 0);
      objc_msgSend(v172, "setTexture:atIndex:", v157, 0);
      objc_msgSend(v172, "setTexture:atIndex:", v152, 2);
      objc_msgSend(v172, "setTexture:atIndex:", v153, 3);
      objc_msgSend(v172, "setTexture:atIndex:", v112, 4);
      objc_msgSend(v172, "setTexture:atIndex:", v135, 5);
      objc_msgSend(v172, "setTexture:atIndex:", v136, 6);
      objc_msgSend(v172, "setTexture:atIndex:", v138, 7);
      v182[0] = objc_msgSend(v153, "width");
      v182[1] = objc_msgSend(v153, "height");
      v23 = v153;
      v182[2] = 1;
      v180 = vdupq_n_s64(0x20uLL);
      v181 = 1;
      objc_msgSend(v172, "dispatchThreads:threadsPerThreadgroup:", v182, &v180);

      v21 = v152;
      v36 = v157;

      v92 = 0;
      v20 = v175;
      v19 = v176;
      v93 = v174;
      v22 = v154;
      v26 = v172;
    }
    else
    {
      -[CMIVNRProcessor metalShaders](v24, "metalShaders");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "simpleCopy");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setComputePipelineState:", v91);

      objc_msgSend(v26, "setTexture:atIndex:", v36, 0);
      objc_msgSend(v26, "setTexture:atIndex:", v23, 1);
      v179[0] = objc_msgSend(v23, "width");
      v179[1] = objc_msgSend(v23, "height");
      v179[2] = 1;
      v177 = vdupq_n_s64(0x20uLL);
      v178 = 1;
      objc_msgSend(v26, "dispatchThreads:threadsPerThreadgroup:", v179, &v177);
      v92 = 0;
      v21 = v152;
      v93 = v174;
    }
    v142 = v173;
  }
  else
  {
    v92 = -12786;
    v142 = v173;
    v93 = v174;
    v36 = v157;
  }
  objc_msgSend(v26, "endEncoding");

  return v92;
}

- (int)fillInputPyramid:(id)a3 previousOutputPyramid:(id)a4 deghostPyramid:(id)a5 inputLuma:(id)a6 inputChroma:(id)a7 previousOutputLuma:(id)a8 previousOutputChroma:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  CMIVNRProcessor *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  float v24;
  void *v25;
  float v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  unint64_t v46;
  BOOL v47;
  void *v48;
  void *v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  void *v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  unint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  const char *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  unint64_t v75;
  uint64_t v76;
  void *v77;
  unint64_t v78;
  int v79;
  void *v80;
  void *v81;
  uint64_t v82;
  unint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  unint64_t v87;
  uint64_t v88;
  void *v89;
  unint64_t v90;
  void *v92;
  id v93;
  int64x2_t v94;
  int64x2_t v95;
  int64x2_t v96;
  void *v97;
  CMIVNRProcessor *v98;
  int64x2_t v99;
  void *v100;
  id v101;
  int64x2_t v102;
  uint64_t v103;
  _QWORD v104[3];
  int64x2_t v105;
  uint64_t v106;
  _QWORD v107[3];
  int64x2_t v108;
  uint64_t v109;
  _QWORD v110[3];
  int64x2_t v111;
  uint64_t v112;
  _QWORD v113[3];
  float v114[3];

  v15 = a3;
  v16 = a4;
  v101 = a5;
  v17 = a6;
  v93 = a7;
  v18 = a8;
  v19 = self;
  v20 = a9;
  -[CMIVNRProcessor metalCommandBuffer](v19, "metalCommandBuffer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "computeCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    v79 = -12786;
    goto LABEL_28;
  }
  -[CMIVNRProcessor tuning](v19, "tuning");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[VNRTuning deghostPatchSigmaLuma]((uint64_t)v23);

  -[CMIVNRProcessor tuning](v19, "tuning");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[VNRTuning deghostPatchSigmaChroma]((uint64_t)v25);

  -[CMIVNRProcessor metalShaders](v19, "metalShaders");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  v97 = v15;
  v98 = v19;
  v100 = v16;
  if (v18)
  {
    objc_msgSend(v27, "lumaInOutDownsampleDeghost");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setComputePipelineState:", v29);

    objc_msgSend(v15, "lumaLevels");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v31)
    {
      v32 = 0;
      v94 = vdupq_n_s64(0x10uLL);
      do
      {
        -[CMIVNRProcessor tuning](v19, "tuning");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNRTuning lumaBands](v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndexedSubscript:", v32);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v114[0] = 0.0;
        v114[0] = v24 * -[VNRTuningBand deghostPatchSigmaScaling]((uint64_t)v36);
        objc_msgSend(v15, "lumaLevels");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", v32);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v100, "lumaLevels");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectAtIndexedSubscript:", v32);
        v40 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v101, "lumaLevels");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectAtIndexedSubscript:", v32);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "setTexture:atIndex:", v17, 0);
        objc_msgSend(v22, "setTexture:atIndex:", v38, 1);
        objc_msgSend(v22, "setTexture:atIndex:", v18, 2);
        objc_msgSend(v22, "setTexture:atIndex:", v40, 3);
        objc_msgSend(v22, "setTexture:atIndex:", v42, 4);
        objc_msgSend(v22, "setBytes:length:atIndex:", v114, 4, 0);
        v43 = (unint64_t)(objc_msgSend(v38, "width") + 1) >> 1;
        v44 = objc_msgSend(v38, "height");
        v113[0] = v43;
        v113[1] = (unint64_t)(v44 + 1) >> 1;
        v15 = v97;
        v113[2] = 1;
        v111 = v94;
        v112 = 1;
        objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v113, &v111);

        ++v32;
        objc_msgSend(v97, "lumaLevels");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "count");

        v17 = v38;
        v18 = (id)v40;
        v47 = v32 >= v46;
        v19 = v98;
      }
      while (!v47);
      goto LABEL_15;
    }
    v40 = (uint64_t)v18;
  }
  else
  {
    objc_msgSend(v27, "lumaInDownsample");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setComputePipelineState:", v48);

    objc_msgSend(v15, "lumaLevels");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "count");

    if (v50)
    {
      v51 = 0;
      v95 = vdupq_n_s64(0x10uLL);
      do
      {
        v52 = v17;
        objc_msgSend(v15, "lumaLevels");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectAtIndexedSubscript:", v51);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "setTexture:atIndex:", v52, 0);
        objc_msgSend(v22, "setTexture:atIndex:", v17, 1);
        v54 = (unint64_t)(objc_msgSend(v17, "width") + 1) >> 1;
        v55 = objc_msgSend(v17, "height");
        v110[0] = v54;
        v110[1] = (unint64_t)(v55 + 1) >> 1;
        v110[2] = 1;
        v108 = v95;
        v109 = 1;
        objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v110, &v108);

        ++v51;
        objc_msgSend(v15, "lumaLevels");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "count");

      }
      while (v51 < v57);
      v40 = 0;
      v38 = v17;
      goto LABEL_15;
    }
    v40 = 0;
  }
  v38 = v17;
LABEL_15:
  -[CMIVNRProcessor metalShaders](v19, "metalShaders", v40);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (v20)
  {
    objc_msgSend(v58, "chromaInOutDownsampleDeghost");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setComputePipelineState:", v60);

    objc_msgSend(v15, "chromaLevels");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "count");

    if (v62)
    {
      v63 = 0;
      v96 = vdupq_n_s64(0x10uLL);
      v64 = v93;
      do
      {
        v65 = v20;
        v66 = v64;
        -[CMIVNRProcessor tuning](v19, "tuning");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNRTuning chromaBands](v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "objectAtIndexedSubscript:", v63);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        v114[0] = 0.0;
        v114[0] = v26 * -[VNRTuningBand deghostPatchSigmaScaling]((uint64_t)v70);
        objc_msgSend(v15, "chromaLevels");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectAtIndexedSubscript:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v100, "chromaLevels");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "objectAtIndexedSubscript:", v63);
        v20 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v101, "chromaLevels");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "objectAtIndexedSubscript:", v63);
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "setTexture:atIndex:", v66, 0);
        objc_msgSend(v22, "setTexture:atIndex:", v64, 1);
        objc_msgSend(v22, "setTexture:atIndex:", v65, 2);
        objc_msgSend(v22, "setTexture:atIndex:", v20, 3);
        objc_msgSend(v22, "setTexture:atIndex:", v74, 4);
        objc_msgSend(v22, "setBytes:length:atIndex:", v114, 4, 0);
        v75 = (unint64_t)(objc_msgSend(v64, "width") + 1) >> 1;
        v76 = objc_msgSend(v64, "height");
        v107[0] = v75;
        v107[1] = (unint64_t)(v76 + 1) >> 1;
        v15 = v97;
        v107[2] = 1;
        v105 = v96;
        v106 = 1;
        objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v107, &v105);

        ++v63;
        objc_msgSend(v97, "chromaLevels");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "count");

        v47 = v63 >= v78;
        v19 = v98;
      }
      while (!v47);
      v93 = v64;
    }
    v79 = 0;
    v18 = v92;
  }
  else
  {
    objc_msgSend(v58, "chromaInDownsample");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setComputePipelineState:", v80);

    objc_msgSend(v15, "chromaLevels");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "count");

    v18 = v92;
    if (v82)
    {
      v83 = 0;
      v99 = vdupq_n_s64(0x10uLL);
      v84 = v93;
      do
      {
        v85 = v84;
        objc_msgSend(v15, "chromaLevels");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "objectAtIndexedSubscript:", v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "setTexture:atIndex:", v85, 0);
        objc_msgSend(v22, "setTexture:atIndex:", v84, 1);
        v87 = (unint64_t)(objc_msgSend(v84, "width") + 1) >> 1;
        v88 = objc_msgSend(v84, "height");
        v104[0] = v87;
        v104[1] = (unint64_t)(v88 + 1) >> 1;
        v104[2] = 1;
        v102 = v99;
        v103 = 1;
        objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v104, &v102);

        ++v83;
        objc_msgSend(v15, "chromaLevels");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v89, "count");

      }
      while (v83 < v90);
      v93 = v84;
    }
    v79 = 0;
    v20 = 0;
  }
  v17 = v38;
  v16 = v100;
LABEL_28:
  objc_msgSend(v22, "endEncoding");

  return v79;
}

- (id)bindTextureToPixelBuffer:(__CVBuffer *)a3 plane:(unint64_t)a4 metalPixelFormat:(unint64_t)a5 usage:(unint64_t)a6
{
  size_t WidthOfPlane;
  size_t v12;
  size_t HeightOfPlane;
  void *v14;
  void *v15;
  IOSurfaceRef IOSurface;
  IOSurfaceRef v17;
  void *v18;
  void *v19;

  if (!a3
    || a4 && !CVPixelBufferIsPlanar(a3)
    || CVPixelBufferGetPlaneCount(a3) <= a4
    || (WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a4)) == 0
    || (v12 = WidthOfPlane, (HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a4)) == 0))
  {
    v15 = 0;
LABEL_12:
    v19 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a5, v12, HeightOfPlane, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
    goto LABEL_12;
  objc_msgSend(v14, "setUsage:", a6);
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (!IOSurface)
    goto LABEL_12;
  v17 = IOSurface;
  -[CMIVNRProcessor metalDevice](self, "metalDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "newTextureWithDescriptor:iosurface:plane:", v15, v17, a4);

LABEL_10:
  return v19;
}

@end
