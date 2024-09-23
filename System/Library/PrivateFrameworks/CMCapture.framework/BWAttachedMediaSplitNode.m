@implementation BWAttachedMediaSplitNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  BWNodeOutputMediaProperties *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = -[BWNode outputs](self, "outputs");
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, objc_msgSend(a4, "index"));
        if (v14)
        {
          v15 = (void *)v14;
          v16 = objc_msgSend(v13, "mediaPropertiesForAttachedMediaKey:", v14);
          if (v16)
          {
            v17 = (BWNodeOutputMediaProperties *)v16;
            if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PrimaryFormat")) & 1) == 0)
            {
              v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)"), self, v13, v15, a5);
              objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0));
            }
          }
          else
          {
            v17 = objc_alloc_init(BWNodeOutputMediaProperties);
            objc_msgSend(v13, "_setMediaProperties:forAttachedMediaKey:", v17, v15);
          }
          -[BWNodeOutputMediaProperties setResolvedFormat:](v17, "setResolvedFormat:", a3);
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }
}

- (BWAttachedMediaSplitNode)initWithAttachedMediaKeys:(id)a3 attachedMediaToPropagateToPrimaryOutput:(id)a4
{
  uint64_t v6;
  BWAttachedMediaSplitNode *v7;
  BWNodeInputMediaConfiguration *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  BWNodeInputMediaConfiguration *v16;
  void *v17;
  BWNodeOutputMediaConfiguration *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  BWNodeInputMediaConfiguration *v25;
  BWNodeOutputMediaConfiguration *v26;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "count");
  if (!(_DWORD)v6)
  {
    v28 = (void *)MEMORY[0x1E0C99DA0];
    v29 = *MEMORY[0x1E0C99778];
    v30 = CFSTR("The attachedMediaKeys array needs to have at least one element");
    goto LABEL_29;
  }
  if (!objc_msgSend(a4, "count"))
    goto LABEL_5;
  if ((objc_msgSend(a3, "containsObject:", CFSTR("PrimaryFormat")) & 1) == 0)
  {
    v28 = (void *)MEMORY[0x1E0C99DA0];
    v29 = *MEMORY[0x1E0C99778];
    v30 = CFSTR("attachedMediaKeys does not specify Primary Media but attachedMediaToPropagateToPrimaryOutput has been provided");
    goto LABEL_29;
  }
  if (objc_msgSend(a4, "containsObject:", CFSTR("PrimaryFormat")))
  {
    v28 = (void *)MEMORY[0x1E0C99DA0];
    v29 = *MEMORY[0x1E0C99778];
    v30 = CFSTR("attachedMediaToPropagateToPrimaryOutput cannot specify primary media");
LABEL_29:
    objc_exception_throw((id)objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, v30, 0));
  }
LABEL_5:
  v37.receiver = self;
  v37.super_class = (Class)BWAttachedMediaSplitNode;
  v7 = -[BWFanOutNode initWithFanOutCount:mediaType:](&v37, sel_initWithFanOutCount_mediaType_, v6, 1986618469);
  if (v7)
  {
    v8 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v8, "setPassthroughMode:", 0);
    -[BWNodeInput setUnspecifiedAttachedMediaConfiguration:](v7->super.super._input, "setUnspecifiedAttachedMediaConfiguration:", v8);
    v9 = a4;
    v31 = v6;
    if ((int)v6 < 1)
      goto LABEL_12;
    v10 = 0;
    v11 = 0;
    v12 = v6;
    do
    {
      v13 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v10, v31);
      v14 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v7, "outputs"), "objectAtIndexedSubscript:", v10);
      v15 = v14;
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PrimaryFormat")) & 1) == 0)
      {
        v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
        -[BWNodeInput formatRequirements](v7->super.super._input, "formatRequirements");
        -[BWNodeInputMediaConfiguration setFormatRequirements:](v16, "setFormatRequirements:", objc_alloc_init((Class)objc_opt_class()));
        -[BWNodeInputMediaConfiguration setPassthroughMode:](v16, "setPassthroughMode:", 1);
        -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v7->super.super._input, "setMediaConfiguration:forAttachedMediaKey:", v16, v13);
        v17 = (void *)objc_msgSend(v14, "primaryMediaConfiguration");
        objc_msgSend(v17, "setPassthroughMode:", 1);
        objc_msgSend(v17, "setAttachedMediaKeyOfInputWhichDrivesThisOutput:", v13);
        v15 = v11;
      }
      v18 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](v18, "setPassthroughMode:", 0);
      objc_msgSend(v14, "setUnspecifiedAttachedMediaConfiguration:", v18);
      ++v10;
      v11 = v15;
    }
    while (v12 != v10);
    LODWORD(v6) = v31;
    a4 = v9;
    if (!v15)
    {
LABEL_12:
      -[BWNodeInputMediaConfiguration setPassthroughMode:](-[BWNodeInput primaryMediaConfiguration](v7->super.super._input, "primaryMediaConfiguration", v31), "setPassthroughMode:", 0);
      v15 = 0;
    }
    v19 = 0x1E0C99000;
    if (objc_msgSend(a4, "count"))
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v20 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v34 != v22)
              objc_enumerationMutation(v9);
            v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            if (!-[BWNodeInput mediaConfigurationForAttachedMediaKey:](v7->super.super._input, "mediaConfigurationForAttachedMediaKey:", v24))
            {
              v25 = objc_alloc_init(BWNodeInputMediaConfiguration);
              -[BWNodeInput formatRequirements](v7->super.super._input, "formatRequirements");
              -[BWNodeInputMediaConfiguration setFormatRequirements:](v25, "setFormatRequirements:", objc_alloc_init((Class)objc_opt_class()));
              -[BWNodeInputMediaConfiguration setPassthroughMode:](v25, "setPassthroughMode:", 1);
              -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v7->super.super._input, "setMediaConfiguration:forAttachedMediaKey:", v25, v24);
            }
            v26 = objc_alloc_init(BWNodeOutputMediaConfiguration);
            -[BWNodeOutputMediaConfiguration setFormatRequirements:](v26, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
            -[BWNodeOutputMediaConfiguration setPassthroughMode:](v26, "setPassthroughMode:", 1);
            objc_msgSend(v15, "setMediaConfiguration:forAttachedMediaKey:", v26, v24);
          }
          a4 = v9;
          v21 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v21);
      }
      v19 = 0x1E0C99000uLL;
      v7->_attachedMediaToPropagateToPrimaryOutput = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", a4);
      LODWORD(v6) = v31;
    }
    v7->_attachedMediaKeys = (NSArray *)objc_msgSend(objc_alloc(*(Class *)(v19 + 3360)), "initWithArray:", a3);
    v7->_attachedMediaFormatDescriptions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7->_numOutputs = v6;
    v7->_disabledAttachedMediaKeys = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", (int)v6);
  }
  return v7;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v6;
  const __CFAllocator *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  opaqueCMSampleBuffer *v17;
  id v18;
  id v19;
  __CFString *v20;
  void *v21;
  CMTime v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CMSampleBufferRef sampleBufferOut;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!BWSampleBufferIsMarkerBuffer(a3))
  {
    v21 = (void *)BWSampleBufferCopyDictionaryOfAttachedMedia(a3);
    if (self->_numOutputs < 1)
    {
LABEL_35:

      return;
    }
    v9 = 0;
    v20 = CFSTR("AttachedMediaNotFound");
    while (1)
    {
      v10 = -[NSArray objectAtIndexedSubscript:](self->_attachedMediaKeys, "objectAtIndexedSubscript:", v9, v20);
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("PrimaryFormat")))
      {
        if (self->_attachedMediaToPropagateToPrimaryOutput)
        {
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v11 = (void *)objc_msgSend(v21, "allKeys");
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v24;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v24 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
                if (!-[NSArray containsObject:](self->_attachedMediaToPropagateToPrimaryOutput, "containsObject:", v16))
                  BWSampleBufferRemoveAttachedMedia(a3, v16);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
            }
            while (v13);
          }
        }
        else
        {
          BWSampleBufferRemoveAllAttachedMedia(a3);
        }
        v17 = a3;
        if (!a3)
          goto LABEL_34;
      }
      else
      {
        v17 = (opaqueCMSampleBuffer *)objc_msgSend(v21, "objectForKeyedSubscript:", v10);
        if (!v17)
        {
          if (self->_emitsNodeErrorsForMissingAttachedMedia)
          {
            v18 = +[BWNodeError newError:sourceNode:](BWNodeError, "newError:sourceNode:", 4294954513, self);
            objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", v9), "emitNodeError:", v18);

          }
          if (self->_emitsDroppedSampleForMissingAttachedMedia)
          {
            CMSampleBufferGetPresentationTimeStamp(&v22, a3);
            v19 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", v20, &v22);
            objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", v9), "emitDroppedSample:", v19);

          }
          goto LABEL_34;
        }
      }
      if ((-[NSMutableSet containsObject:](self->_disabledAttachedMediaKeys, "containsObject:", v10) & 1) == 0)
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", v9), "emitSampleBuffer:", v17);
LABEL_34:
      if (++v9 >= self->_numOutputs)
        goto LABEL_35;
    }
  }
  if (self->_numOutputs >= 1)
  {
    v6 = 0;
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      if ((-[NSMutableSet containsObject:](self->_disabledAttachedMediaKeys, "containsObject:", -[NSArray objectAtIndexedSubscript:](self->_attachedMediaKeys, "objectAtIndexedSubscript:", v6)) & 1) == 0)
      {
        sampleBufferOut = 0;
        if (!CMSampleBufferCreateCopy(v7, a3, &sampleBufferOut))
        {
          v8 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", v6);
          objc_msgSend(v8, "emitSampleBuffer:", sampleBufferOut);
        }
        if (sampleBufferOut)
          CFRelease(sampleBufferOut);
      }
      ++v6;
    }
    while (v6 < self->_numOutputs);
  }
}

- (BWAttachedMediaSplitNode)initWithAttachedMediaKeys:(id)a3
{
  return -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:attachedMediaToPropagateToPrimaryOutput:](self, "initWithAttachedMediaKeys:attachedMediaToPropagateToPrimaryOutput:", a3, 0);
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWAttachedMediaSplitNode;
  -[BWFanOutNode dealloc](&v3, sel_dealloc);
}

- (void)setOutputRenderingEnabled:(BOOL)a3 forAttachedMediaKey:(id)a4
{
  NSMutableSet *disabledAttachedMediaKeys;

  disabledAttachedMediaKeys = self->_disabledAttachedMediaKeys;
  if (a3)
    -[NSMutableSet removeObject:](disabledAttachedMediaKeys, "removeObject:", a4);
  else
    -[NSMutableSet addObject:](disabledAttachedMediaKeys, "addObject:", a4);
}

- (BOOL)isOutputRenderingEnabledForAttachedMediaKey:(id)a3
{
  int v5;

  v5 = -[NSArray containsObject:](self->_attachedMediaKeys, "containsObject:");
  if (v5)
    LOBYTE(v5) = -[NSMutableSet containsObject:](self->_disabledAttachedMediaKeys, "containsObject:", a3) ^ 1;
  return v5;
}

- (id)nodeSubType
{
  return CFSTR("AttachedMediaSplitNode");
}

- (void)setEmitsNodeErrorsForMissingAttachedMedia:(BOOL)a3
{
  self->_emitsNodeErrorsForMissingAttachedMedia = a3;
}

- (BOOL)emitsNodeErrorsForMissingAttachedMedia
{
  return self->_emitsNodeErrorsForMissingAttachedMedia;
}

- (void)setEmitsDroppedSampleForMissingAttachedMedia:(BOOL)a3
{
  self->_emitsDroppedSampleForMissingAttachedMedia = a3;
}

- (BOOL)emitsDroppedSampleForMissingAttachedMedia
{
  return self->_emitsDroppedSampleForMissingAttachedMedia;
}

@end
