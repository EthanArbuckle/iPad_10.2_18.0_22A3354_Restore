@implementation BWRedEyeReducerNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWRedEyeReducerNode)initWithVersion:(int)a3 sensorConfigurationsByPortType:(id)a4
{
  BWRedEyeReducerNode *v6;
  NSDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BWNodeInput *v12;
  BWVideoFormatRequirements *v13;
  BWNodeOutput *v14;
  BWVideoFormatRequirements *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)BWRedEyeReducerNode;
  v6 = -[BWNode init](&v21, sel_init);
  if (v6)
  {
    v7 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a4, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(a4);
          -[NSDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11)), "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("RedEyeReductionParameters")), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v9);
    }
    v6->_redEyeReductionParametersByPortType = v7;
    v12 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v6);
    v13 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v13, "setSupportedPixelFormats:", &unk_1E4A00B30);
    -[BWNodeInput setFormatRequirements:](v12, "setFormatRequirements:", v13);
    -[BWNodeInput setPassthroughMode:](v12, "setPassthroughMode:", 1);

    -[BWNode addInput:](v6, "addInput:", v12);
    v14 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v6);
    v15 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v15, "setSupportedPixelFormats:", &unk_1E4A00B48);
    -[BWNodeOutput setFormatRequirements:](v14, "setFormatRequirements:", v15);
    -[BWNodeOutput setPassthroughMode:](v14, "setPassthroughMode:", 1);

    -[BWNode addOutput:](v6, "addOutput:", v14);
    v6->_ciContext = (CIContext *)objc_alloc_init(MEMORY[0x1E0C9DD90]);
    v6->_primaryImageSampleBuffer = 0;
    v6->_skipRepair = 0;
    v6->_redEyeReductionVersion = a3;
  }
  return v6;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  opaqueCMSampleBuffer *primaryImageSampleBuffer;
  objc_super v5;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  primaryImageSampleBuffer = self->_primaryImageSampleBuffer;
  if (primaryImageSampleBuffer)
    CFRelease(primaryImageSampleBuffer);

  v5.receiver = self;
  v5.super_class = (Class)BWRedEyeReducerNode;
  -[BWNode dealloc](&v5, sel_dealloc);
}

- (void)setInferenceType:(int)a3
{
  self->_inferenceType = a3;
}

- (int)inferenceType
{
  return self->_inferenceType;
}

- (void)setInferenceAttachmentKey:(id)a3
{
  self->_inferenceAttachmentKey = (NSString *)a3;
}

- (id)inferenceAttachmentKey
{
  return self->_inferenceAttachmentKey;
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("RedEyeReducer");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  CIDualRedEyeRepairSession *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BWRedEyeReducerNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v4, sel_prepareForCurrentConfigurationToBecomeLive);
  if (!self->_redEyeRepairSession)
  {
    v3 = (CIDualRedEyeRepairSession *)objc_alloc_init(MEMORY[0x1E0C9DDB0]);
    self->_redEyeRepairSession = v3;
    -[CIDualRedEyeRepairSession setContext:](v3, "setContext:", self->_ciContext);
    -[CIDualRedEyeRepairSession prepareRepair](self->_redEyeRepairSession, "prepareRepair");
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  opaqueCMFormatDescription *outputFormatDescription;
  objc_super v10;

  if (a4)
  {
    outputFormatDescription = self->_outputFormatDescription;
    if (outputFormatDescription)
    {
      CFRelease(outputFormatDescription);
      self->_outputFormatDescription = 0;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)BWRedEyeReducerNode;
  -[BWNode configurationWithID:updatedFormat:didBecomeLiveForInput:](&v10, sel_configurationWithID_updatedFormat_didBecomeLiveForInput_, a3, a4, a5);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  opaqueCMFormatDescription *outputFormatDescription;
  objc_super v6;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
  {
    CFRelease(outputFormatDescription);
    self->_outputFormatDescription = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)BWRedEyeReducerNode;
  -[BWNode didReachEndOfDataForInput:](&v6, sel_didReachEndOfDataForInput_, a3);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  int v10;
  opaqueCMSampleBuffer *primaryImageSampleBuffer;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v14;
  opaqueCMSampleBuffer *v15;
  uint64_t AttachedInference;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v7 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D60]), "BOOLValue");
  v8 = (void *)CMGetAttachment(a3, CFSTR("BWStillImageCaptureSettings"), 0);
  v9 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v10 = objc_msgSend((id)objc_msgSend(v8, "captureStreamSettingsForPortType:", v9), "captureFlags");
  if (objc_msgSend(v8, "captureType") != 2 || (*(_QWORD *)&v10 & 0x10000) == 0)
  {
    primaryImageSampleBuffer = self->_primaryImageSampleBuffer;
    if (primaryImageSampleBuffer)
    {
      CFRelease(primaryImageSampleBuffer);
      self->_primaryImageSampleBuffer = 0;
    }
LABEL_19:
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
    return;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  v14 = ImageBuffer;
  if ((v7 & 1) == 0)
  {
    if (!self->_primaryImageSampleBuffer && self->_inferenceType && self->_inferenceAttachmentKey)
    {
      AttachedInference = BWInferenceGetAttachedInference(a3, -[BWRedEyeReducerNode inferenceType](self, "inferenceType"), (uint64_t)-[BWRedEyeReducerNode inferenceAttachmentKey](self, "inferenceAttachmentKey"));
      v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = objc_msgSend(v8, "sceneFlags");
      v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v18 >> 5) & 1);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0C9DD58]);
      v20 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0C9DD38]);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C9DD48]);
      v21 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CD0]);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0C9DD40]);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", FigCaptureGetModelSpecificName(), *MEMORY[0x1E0C9DD30]);
      if (-[NSDictionary objectForKeyedSubscript:](self->_redEyeReductionParametersByPortType, "objectForKeyedSubscript:", v9))
      {
        v24 = v9;
        v25[0] = -[NSDictionary objectForKeyedSubscript:](self->_redEyeReductionParametersByPortType, "objectForKeyedSubscript:", v9);
        v22 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0C9DD50]);
      }
      v23 = -[CIDualRedEyeRepairSession setPrimary:observations:metadata:](self->_redEyeRepairSession, "setPrimary:observations:metadata:", v14, AttachedInference, v17);
      self->_skipRepair = v23 ^ 1;
      if ((v23 & 1) != 0)
      {
        self->_primaryImageSampleBuffer = (opaqueCMSampleBuffer *)CFRetain(a3);
        return;
      }
    }
    goto LABEL_19;
  }
  if (!self->_skipRepair)
  {
    -[CIDualRedEyeRepairSession repairPrimaryWithSecondary:](self->_redEyeRepairSession, "repairPrimaryWithSecondary:", ImageBuffer);
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", self->_primaryImageSampleBuffer);
    v15 = self->_primaryImageSampleBuffer;
    if (v15)
    {
      CFRelease(v15);
      self->_primaryImageSampleBuffer = 0;
    }
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  opaqueCMSampleBuffer *primaryImageSampleBuffer;

  if (self->_primaryImageSampleBuffer)
  {
    -[CIDualRedEyeRepairSession setPrimary:observations:metadata:](self->_redEyeRepairSession, "setPrimary:observations:metadata:", 0, 0, 0);
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", self->_primaryImageSampleBuffer);
    primaryImageSampleBuffer = self->_primaryImageSampleBuffer;
    if (primaryImageSampleBuffer)
    {
      CFRelease(primaryImageSampleBuffer);
      self->_primaryImageSampleBuffer = 0;
    }
  }
  else
  {
    -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3, a4);
  }
}

@end
