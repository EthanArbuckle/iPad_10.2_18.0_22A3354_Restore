@implementation BWStillImageSmartStyleAttachmentTransferNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWStillImageSmartStyleAttachmentTransferNode)initWithNodeConfiguration:(id)a3
{
  BWStillImageSmartStyleAttachmentTransferNode *v4;
  BWNodeInput *v5;
  BWNodeOutput *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWStillImageSmartStyleAttachmentTransferNode;
  v4 = -[BWNode init](&v8, sel_init);
  if (v4)
  {
    v5 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v4);
    -[BWNodeInput setFormatRequirements:](v5, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInput setPassthroughMode:](v5, "setPassthroughMode:", 1);
    -[BWNode addInput:](v4, "addInput:", v5);

    v6 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v4);
    -[BWNodeOutput setFormatRequirements:](v6, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutput setPassthroughMode:](v6, "setPassthroughMode:", 1);
    -[BWNode addOutput:](v4, "addOutput:", v6);

    v4->_nodeConfiguration = (BWStillImageNodeConfiguration *)a3;
    v4->_inferencesFromUnstyledBuffers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_attachedMediaFromUnstyledBuffers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_attachmentsFromUnstyledBuffers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[BWStillImageSmartStyleAttachmentTransferNode _resetProcessingState]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageSmartStyleAttachmentTransferNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)_resetProcessingState
{
  const void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 104), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 112), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 120), "removeAllObjects");
    *(_BYTE *)(a1 + 128) = 0;
    v2 = *(const void **)(a1 + 136);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 136) = 0;
    }

    *(_QWORD *)(a1 + 144) = 0;
  }
}

- (id)nodeType
{
  return CFSTR("Muxer");
}

- (id)nodeSubType
{
  return CFSTR("StillImageSmartStyleAttachmentTransfer");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  _BOOL4 v11;
  _BOOL4 v12;
  char v13;
  int v14;
  void *v15;
  uint64_t v16;
  CFTypeRef v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  const __CFString *v25;
  CFTypeRef v26;
  BOOL v28;
  opaqueCMSampleBuffer *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (void *)CMGetAttachment(a3, CFSTR("StillSettings"), 0);
  if (!BWIsSmartStyleCapture(v6))
    goto LABEL_42;
  v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "requestedSettings"), "captureRequestIdentifier");
  if ((objc_msgSend(v7, "isEqual:", self->_lastCaptureRequestIdentifier) & 1) == 0)
  {
    if (!-[NSMutableDictionary count](self->_inferencesFromUnstyledBuffers, "count"))
      -[NSMutableDictionary count](self->_attachedMediaFromUnstyledBuffers, "count");
    -[BWStillImageSmartStyleAttachmentTransferNode _resetProcessingState]((uint64_t)self);
    self->_lastCaptureRequestIdentifier = (NSString *)v7;
  }
  v8 = BWStillImageProcessingFlagsForSampleBuffer(a3);
  if ((v8 & 0x2800000) != 0)
    goto LABEL_42;
  v9 = v8;
  v10 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("StillImageBufferFrameType"), 0), "unsignedIntValue");
  v11 = -[BWStillImageNodeConfiguration optimizedEnhancedResolutionDepthPipelineEnabled](self->_nodeConfiguration, "optimizedEnhancedResolutionDepthPipelineEnabled");
  v12 = v10 == 13 && v11;
  if ((v9 & 0x200000) != 0)
  {
    if (BWSampleBufferGetAttachedMedia(a3, 0x1E495B278))
    {
      v14 = v10 == 40 || v12;
      if (v14 != 1)
      {
        if (a3)
          v29 = (opaqueCMSampleBuffer *)CFRetain(a3);
        else
          v29 = 0;
        self->_styledBuffer = v29;
        goto LABEL_47;
      }
LABEL_21:
      v30 = v6;
      -[NSMutableDictionary addEntriesFromDictionary:](self->_inferencesFromUnstyledBuffers, "addEntriesFromDictionary:", CMGetAttachment(a3, CFSTR("Inferences"), 0));
      v15 = (void *)CMGetAttachment(a3, CFSTR("AttachedMedia"), 0);
      -[NSMutableDictionary addEntriesFromDictionary:](self->_attachedMediaFromUnstyledBuffers, "addEntriesFromDictionary:", v15);
      if (objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Depth")))
      {
        v16 = *MEMORY[0x1E0D086F0];
        v17 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D086F0], 0);
        if (v17)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attachmentsFromUnstyledBuffers, "setObject:forKeyedSubscript:", v17, v16);
      }
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v18 = *MEMORY[0x1E0D087B8];
      v35[0] = *MEMORY[0x1E0D08798];
      v35[1] = v18;
      v19 = *MEMORY[0x1E0D087C0];
      v35[2] = *MEMORY[0x1E0D087A0];
      v35[3] = v19;
      v20 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v32 != v23)
              objc_enumerationMutation(v20);
            v25 = *(const __CFString **)(*((_QWORD *)&v31 + 1) + 8 * i);
            v26 = CMGetAttachment(a3, v25, 0);
            if (v26)
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attachmentsFromUnstyledBuffers, "setObject:forKeyedSubscript:", v26, v25);
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v22);
      }
      v28 = self->_hasAttachmentsFromUnstyledBuffer || v10 == 40;
      self->_hasAttachmentsFromUnstyledBuffer = v28;
      if (-[BWStillImageNodeConfiguration filterRenderingEnabled](self->_nodeConfiguration, "filterRenderingEnabled")
        && BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend((id)objc_msgSend(v30, "requestedSettings"), "processedImageFilters")))
      {
        -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
      }
      goto LABEL_47;
    }
LABEL_42:
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
    return;
  }
  v13 = v10 == 40 || v12;
  if ((v13 & 1) != 0)
    goto LABEL_21;
LABEL_47:
  if (self->_styledBuffer)
  {
    if (self->_hasAttachmentsFromUnstyledBuffer)
    {
      -[BWStillImageSmartStyleAttachmentTransferNode _transferAttachmentsToStyledBuffer]((uint64_t)self);
      -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", self->_styledBuffer);
      -[BWStillImageSmartStyleAttachmentTransferNode _resetProcessingState]((uint64_t)self);
    }
  }
}

- (uint64_t)_transferAttachmentsToStyledBuffer
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)(result + 136), CFSTR("Inferences"), 0);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v29 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (!objc_msgSend(*(id *)(v1 + 104), "objectForKeyedSubscript:", v7))
            objc_msgSend(*(id *)(v1 + 104), "setObject:forKeyedSubscript:", objc_msgSend(v2, "objectForKeyedSubscript:", v7), v7);
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v4);
    }
    v8 = (void *)objc_msgSend(*(id *)(v1 + 104), "copy");
    CMSetAttachment(*(CMAttachmentBearerRef *)(v1 + 136), CFSTR("Inferences"), v8, 1u);

    v9 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)(v1 + 136), CFSTR("AttachedMedia"), 0);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
          if (!objc_msgSend(*(id *)(v1 + 112), "objectForKeyedSubscript:", v14))
            objc_msgSend(*(id *)(v1 + 112), "setObject:forKeyedSubscript:", objc_msgSend(v9, "objectForKeyedSubscript:", v14), v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v11);
    }
    v15 = (void *)objc_msgSend(*(id *)(v1 + 112), "copy");
    CMSetAttachment(*(CMAttachmentBearerRef *)(v1 + 136), CFSTR("AttachedMedia"), v15, 1u);

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v16 = *(void **)(v1 + 120);
    result = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (result)
    {
      v17 = result;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v16);
          CMSetAttachment(*(CMAttachmentBearerRef *)(v1 + 136), *(CFStringRef *)(*((_QWORD *)&v20 + 1) + 8 * v19), (CFTypeRef)objc_msgSend(*(id *)(v1 + 120), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19)), 1u);
          ++v19;
        }
        while (v17 != v19);
        result = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
        v17 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  -[BWStillImageSmartStyleAttachmentTransferNode _resetProcessingState]((uint64_t)self);
  -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3);
}

@end
