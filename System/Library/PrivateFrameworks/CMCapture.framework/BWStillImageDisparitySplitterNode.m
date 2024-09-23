@implementation BWStillImageDisparitySplitterNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWStillImageDisparitySplitterNode)init
{
  BWStillImageDisparitySplitterNode *v2;
  BWNodeInput *v3;
  BWNodeInputMediaConfiguration *v4;
  char v5;
  uint64_t v6;
  char v7;
  BWNodeOutput *v8;
  BWNodeOutputMediaConfiguration *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BWStillImageDisparitySplitterNode;
  v2 = -[BWNode init](&v11, sel_init);
  if (v2)
  {
    v3 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v2);
    v4 = -[BWNodeInput primaryMediaConfiguration](v3, "primaryMediaConfiguration");
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v4, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    v5 = 1;
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v4, "setPassthroughMode:", 1);
    -[BWNode addInput:](v2, "addInput:", v3);
    v6 = 0;
    v2->_outputs = (id *)malloc_type_malloc(0x10uLL, 0x80040B8603338uLL);
    v2->_numberOfOutputs = 2;
    do
    {
      v7 = v5;
      v8 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v2);
      v9 = -[BWNodeOutput primaryMediaConfiguration](v8, "primaryMediaConfiguration");
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v9, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](v9, "setPassthroughMode:", 1);
      -[BWNode addOutput:](v2, "addOutput:", v8);
      v5 = 0;
      v2->_outputs[v6] = v8;
      v6 = 1;
    }
    while ((v7 & 1) != 0);
    -[BWNodeOutput setName:](-[BWStillImageDisparitySplitterNode disparityOutput](v2, "disparityOutput"), "setName:", CFSTR("Disparity"));
    -[BWNodeOutput setName:](-[BWStillImageDisparitySplitterNode processedOutput](v2, "processedOutput"), "setName:", CFSTR("Processed"));
  }
  return v2;
}

- (void)dealloc
{
  id *outputs;
  objc_super v4;

  outputs = self->_outputs;
  if (outputs)
  {
    free(outputs);
    self->_outputs = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BWStillImageDisparitySplitterNode;
  -[BWNode dealloc](&v4, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Muxer");
}

- (id)nodeSubType
{
  return CFSTR("DisparityFusionSplitter");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  unint64_t v9;
  BWNodeOutput *v10;
  BWNodeOutputMediaProperties *v11;
  uint64_t v12;
  objc_super v13;

  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    if (self->_numberOfOutputs)
    {
      v9 = 0;
      do
        objc_msgSend(self->_outputs[v9++], "setFormat:", a3);
      while (v9 < self->_numberOfOutputs);
    }
  }
  else if ((objc_msgSend(a5, "isEqualToString:", 0x1E495AED8) & 1) != 0)
  {
    v10 = -[BWStillImageDisparitySplitterNode disparityOutput](self, "disparityOutput");
    if (!-[BWNodeOutput attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:](v10, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, objc_msgSend(a4, "index")))
    {
      if (-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](v10, "mediaPropertiesForAttachedMediaKey:", 0))
      {
        v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)"), self, v10, 0, a5);
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v12, 0));
      }
      v11 = objc_alloc_init(BWNodeOutputMediaProperties);
      -[BWNodeOutput _setMediaProperties:forAttachedMediaKey:](v10, "_setMediaProperties:forAttachedMediaKey:", v11, 0);
      -[BWNodeOutputMediaProperties setResolvedFormat:](v11, "setResolvedFormat:", a3);
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BWStillImageDisparitySplitterNode;
    -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v13, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  unint64_t v6;

  if (self->_numberOfOutputs)
  {
    v6 = 0;
    do
      objc_msgSend(self->_outputs[v6++], "makeConfiguredFormatLive", a3, a4, a5);
    while (v6 < self->_numberOfOutputs);
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  unint64_t v4;

  if (self->_numberOfOutputs)
  {
    v4 = 0;
    do
      objc_msgSend(self->_outputs[v4++], "markEndOfLiveOutput", a3);
    while (v4 < self->_numberOfOutputs);
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int16 v12;
  int v13;
  int v14;
  int v15;
  int v16;
  double v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v24;
  unint64_t numberOfOutputs;
  id *outputs;
  unint64_t v27;
  uint64_t v28;
  BWNodeOutput *v29;
  int v30;
  BWNodeOutput *v31;
  BWNodeOutput *v32;
  CMSampleBufferRef sampleBufferOut[2];

  sampleBufferOut[1] = *(CMSampleBufferRef *)MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = (void *)CMGetAttachment(a3, CFSTR("BWStillImageCaptureSettings"), 0);
    v7 = objc_msgSend(v6, "captureType");
    v8 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v9 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06038]);
    v10 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]);
    v11 = (void *)CMGetAttachment(a3, CFSTR("HasUnreliableBracketingMetadata"), 0);
    v12 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntegerValue");
    v13 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue");
    if ((v12 & 0x400) != 0)
      v14 = 0;
    else
      v14 = v13;
    v15 = objc_msgSend(v11, "BOOLValue");
    v16 = v15;
    if (v7 == 3)
    {
      v18 = v9 && (objc_msgSend(v9, "doubleValue"), v17 == 0.0) && (int)objc_msgSend(v10, "intValue") > 0;
    }
    else if ((v12 & 0x400) != 0)
    {
      v18 = 0;
    }
    else
    {
      v18 = (v7 == 10) & ~v15 & ~v14;
    }
    v19 = objc_msgSend(v6, "captureFlags");
    v24 = v7 != 3 && v7 != 10;
    if ((v19 & 0x20000) == 0)
      v24 = 1;
    if (((v24 | v14) & 1) == 0)
    {
      MEMORY[0x1E0C80A78](v19, v20, v21, v22);
      outputs = (id *)&v32;
      if (((v30 & ~v16 | v18) & 1) != 0)
        v31 = -[BWStillImageDisparitySplitterNode disparityOutput](self, "disparityOutput");
      else
        v31 = -[BWStillImageDisparitySplitterNode processedOutput](self, "processedOutput");
      v27 = 0;
      v32 = v31;
LABEL_36:
      objc_msgSend(outputs[v27], "emitSampleBuffer:", a3, v32);
      return;
    }
    if ((v18 & 1) == 0)
    {
      numberOfOutputs = self->_numberOfOutputs;
      if (numberOfOutputs)
      {
        outputs = self->_outputs;
        v27 = numberOfOutputs - 1;
        if (numberOfOutputs != 1)
        {
          v28 = 0;
          do
          {
            sampleBufferOut[0] = 0;
            BWCMSampleBufferCreateCopyIncludingMetadata(a3, sampleBufferOut);
            v29 = (BWNodeOutput *)outputs[v28];
            if (v29 != -[BWStillImageDisparitySplitterNode disparityOutput](self, "disparityOutput"))
              BWSampleBufferRemoveAttachedMedia(sampleBufferOut[0], 0x1E495AED8);
            objc_msgSend(outputs[v28], "emitSampleBuffer:", sampleBufferOut[0]);
            if (sampleBufferOut[0])
              CFRelease(sampleBufferOut[0]);
            ++v28;
          }
          while (v27 != v28);
        }
        goto LABEL_36;
      }
    }
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  unint64_t v6;

  if (self->_numberOfOutputs)
  {
    v6 = 0;
    do
      objc_msgSend(self->_outputs[v6++], "emitNodeError:", a3, a4);
    while (v6 < self->_numberOfOutputs);
  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  unint64_t v6;

  if (self->_numberOfOutputs)
  {
    v6 = 0;
    do
      objc_msgSend(self->_outputs[v6++], "emitDroppedSample:", a3, a4);
    while (v6 < self->_numberOfOutputs);
  }
}

- (BWNodeOutput)disparityOutput
{
  return (BWNodeOutput *)*self->_outputs;
}

- (BWNodeOutput)processedOutput
{
  return (BWNodeOutput *)*((_QWORD *)self->_outputs + 1);
}

@end
