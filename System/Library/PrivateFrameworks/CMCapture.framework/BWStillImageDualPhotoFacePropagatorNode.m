@implementation BWStillImageDualPhotoFacePropagatorNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWStillImageDualPhotoFacePropagatorNode)initWithBaseZoomFactors:(id)a3
{
  BWStillImageDualPhotoFacePropagatorNode *v4;
  BWStillImageDualPhotoFacePropagatorNode *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  BWNodeInput *v10;
  BWVideoFormatRequirements *v11;
  BWNodeOutput *v12;
  BWVideoFormatRequirements *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BWStillImageDualPhotoFacePropagatorNode;
  v4 = -[BWNode init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_currentSettingsID = -1;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", a3);
    v7 = 0;
    v5->_baseZoomFactors = (NSArray *)v6;
    v8 = 1;
    do
    {
      v9 = v8;
      v10 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v5, v7);
      v11 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeInput setFormatRequirements:](v10, "setFormatRequirements:", v11);

      -[BWNodeInput setPassthroughMode:](v10, "setPassthroughMode:", 1);
      -[BWNodeInput setRetainedBufferCount:](v10, "setRetainedBufferCount:", 1);
      -[BWNode addInput:](v5, "addInput:", v10);

      v12 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v5);
      v13 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeOutput setFormatRequirements:](v12, "setFormatRequirements:", v13);
      -[BWNodeOutput setPassthroughMode:](v12, "setPassthroughMode:", 1);
      -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v12, "setIndexOfInputWhichDrivesThisOutput:", v7);

      -[BWNode addOutput:](v5, "addOutput:", v12);
      v8 = 0;
      v7 = 1;
    }
    while ((v9 & 1) != 0);
    v5->_widerFOVInput = (BWNodeInput *)-[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v5, "inputs"), "objectAtIndexedSubscript:", 0);
    v5->_narrowerFOVInput = (BWNodeInput *)-[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v5, "inputs"), "objectAtIndexedSubscript:", 1);
    v5->_widerFOVOutput = (BWNodeOutput *)-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v5, "outputs"), "objectAtIndexedSubscript:", 0);
    v5->_narrowerFOVOutput = (BWNodeOutput *)-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v5, "outputs"), "objectAtIndexedSubscript:", 1);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[BWStillImageDualPhotoFacePropagatorNode _clearCaptureRequestState]((uint64_t)self);

  self->_baseZoomFactors = 0;
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageDualPhotoFacePropagatorNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)_clearCaptureRequestState
{
  const void *v2;
  const void *v3;

  if (a1)
  {
    v2 = *(const void **)(a1 + 112);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 112) = 0;
    }
    v3 = *(const void **)(a1 + 120);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 120) = 0;
    }

    *(_QWORD *)(a1 + 128) = 0;
    *(_QWORD *)(a1 + 136) = 0;
  }
}

- (id)nodeType
{
  return CFSTR("Synchronizer");
}

- (id)nodeSubType
{
  return CFSTR("GenericSynchronizer");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "setFormat:", a3);
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1, a4, a5))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = -[BWNode outputs](self, "outputs", 0);
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "makeConfiguredFormatLive");
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 0))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = -[BWNode outputs](self, "outputs", 0);
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "markEndOfLiveOutput");
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  objc_class *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = (void *)CMGetAttachment(a3, CFSTR("StillSettings"), 0);
  if (objc_msgSend(v7, "settingsID") != self->_currentSettingsID)
  {
    -[BWStillImageDualPhotoFacePropagatorNode _clearCaptureRequestState]((uint64_t)self);
    self->_currentSettingsID = objc_msgSend(v7, "settingsID");
  }
  if ((unint64_t)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count") >= 2)
  {
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = (void *)objc_msgSend((id)CMGetAttachment(a3, CFSTR("BWStillImageCaptureSettings"), 0), "captureStreamSettings", 0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v8);
          v11 += objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "hasValidFrames");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
      if (v11 > 1)
      {
        if (self->_widerFOVInput == a4)
        {
          v14 = 112;
          if (self->_widerFOVBuffer)
          {
            -[BWNodeOutput emitSampleBuffer:](self->_widerFOVOutput, "emitSampleBuffer:");
            CFRelease(self->_widerFOVBuffer);
          }
          if (!a3)
          {
LABEL_19:
            v15 = 0;
LABEL_24:
            *(Class *)((char *)&self->super.super.isa + v14) = v15;
            goto LABEL_25;
          }
        }
        else
        {
          if (self->_narrowerFOVInput != a4)
          {
LABEL_25:
            -[BWStillImageDualPhotoFacePropagatorNode _processWiderAndNarrowerFOVInput]((uint64_t)self);
            return;
          }
          v14 = 120;
          if (self->_narrowerFOVBuffer)
          {
            -[BWNodeOutput emitSampleBuffer:](self->_narrowerFOVOutput, "emitSampleBuffer:");
            CFRelease(self->_narrowerFOVBuffer);
          }
          if (!a3)
            goto LABEL_19;
        }
        v15 = (objc_class *)CFRetain(a3);
        goto LABEL_24;
      }
    }
  }
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "emitSampleBuffer:", a3);
}

- (void)_processWiderAndNarrowerFOVInput
{
  const void *v2;
  const void *v3;

  if (a1)
  {
    v2 = *(const void **)(a1 + 112);
    if (v2)
    {
      v3 = *(const void **)(a1 + 120);
      if (v3)
      {
        BWProcessWiderAndNarrowerFOVBuffersForFacePropagation(v2, v3, *(void **)(a1 + 104));
LABEL_8:
        -[BWStillImageDualPhotoFacePropagatorNode _emitBuffersAndErrorsToOutputs](a1);
        -[BWStillImageDualPhotoFacePropagatorNode _clearCaptureRequestState](a1);
        return;
      }
    }
    else
    {
      if (!*(_QWORD *)(a1 + 128))
        return;
      if (*(_QWORD *)(a1 + 120))
        goto LABEL_8;
    }
    if (!*(_QWORD *)(a1 + 136))
      return;
    goto LABEL_8;
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v7 = (void *)objc_msgSend(a3, "stillImageSettings");
  if (objc_msgSend(v7, "settingsID") != self->_currentSettingsID)
  {
    -[BWStillImageDualPhotoFacePropagatorNode _clearCaptureRequestState]((uint64_t)self);
    self->_currentSettingsID = objc_msgSend(v7, "settingsID");
  }
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count"))
  {
    if (self->_widerFOVInput == a4)
    {
      v8 = 128;
      if (self->_widerFOVError)
      {
        v9 = 160;
        goto LABEL_11;
      }
LABEL_12:
      *(Class *)((char *)&self->super.super.isa + v8) = (Class)a3;
      goto LABEL_13;
    }
    if (self->_narrowerFOVInput == a4)
    {
      v8 = 136;
      if (self->_narrowerFOVError)
      {
        v9 = 168;
LABEL_11:
        objc_msgSend(*(id *)((char *)&self->super.super.isa + v9), "emitNodeError:");

        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "emitNodeError:", a3);
  }
LABEL_13:
  -[BWStillImageDualPhotoFacePropagatorNode _processWiderAndNarrowerFOVInput]((uint64_t)self);
}

- (uint64_t)_emitBuffersAndErrorsToOutputs
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_QWORD *)(result + 112))
      result = objc_msgSend(*(id *)(result + 160), "emitSampleBuffer:");
    if (*(_QWORD *)(v1 + 128))
      result = objc_msgSend(*(id *)(v1 + 160), "emitNodeError:");
    if (*(_QWORD *)(v1 + 120))
      result = objc_msgSend(*(id *)(v1 + 168), "emitSampleBuffer:");
    if (*(_QWORD *)(v1 + 136))
      return objc_msgSend(*(id *)(v1 + 168), "emitNodeError:");
  }
  return result;
}

@end
