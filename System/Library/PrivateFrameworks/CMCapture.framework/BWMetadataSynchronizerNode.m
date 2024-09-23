@implementation BWMetadataSynchronizerNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWMetadataSynchronizerNode)initWithMetadataInputs:(id)a3 propagateSampleBufferAttachmentKeys:(id)a4 propagateSampleBufferMetadataDictKeys:(id)a5 syncMetadataForPortTypes:(id)a6 syncOnlyIfMetadataEnabledForKeys:(id)a7
{
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v13)
  {
    v14 = v13;
    v20 = a4;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(a3);
          v25 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18);
          objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1));
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v16);
    }
    self = -[BWMetadataSynchronizerNode initWithArraysOfMetadataInputs:propagateSampleBufferAttachmentKeys:propagateSampleBufferMetadataDictKeys:syncMetadataForPortTypes:syncOnlyIfMetadataEnabledForKeys:](self, "initWithArraysOfMetadataInputs:propagateSampleBufferAttachmentKeys:propagateSampleBufferMetadataDictKeys:syncMetadataForPortTypes:syncOnlyIfMetadataEnabledForKeys:", v14, v20, a5, a6, a7);

  }
  return self;
}

- (BWMetadataSynchronizerNode)initWithArraysOfMetadataInputs:(id)a3 propagateSampleBufferAttachmentKeys:(id)a4 propagateSampleBufferMetadataDictKeys:(id)a5 syncMetadataForPortTypes:(id)a6 syncOnlyIfMetadataEnabledForKeys:(id)a7
{
  BWMetadataSynchronizerNode *v12;
  size_t v13;
  $FBF65B9B8C8A83F4AFD9BB74AB6298ED *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  BWNodeInput *v22;
  BWNodeInputMediaConfiguration *v23;
  unint64_t v24;
  BWNodeInputMediaConfiguration *v25;
  BWNodeOutput *v26;
  uint64_t v27;
  unint64_t v28;
  BWNodeOutputMediaConfiguration *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v33;
  __int128 v34;
  const __CFAllocator *allocator;
  size_t v36;
  objc_super v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)BWMetadataSynchronizerNode;
  v12 = -[BWNode init](&v37, sel_init);
  if (v12)
  {
    if (!a3)
      goto LABEL_30;
    v12->_syncMetadataForPortTypes = (NSArray *)a6;
    v12->_syncOnlyIfMetadataEnabledForKeys = (NSArray *)a7;
    v12->_propagateSampleBufferAttachmentKeys = (NSArray *)a4;
    v12->_propagateSampleBufferMetadataDictKeys = (NSArray *)a5;
    v12->_bufferServicingLock._os_unfair_lock_opaque = 0;
    v13 = objc_msgSend(a3, "count") + 1;
    v14 = ($FBF65B9B8C8A83F4AFD9BB74AB6298ED *)malloc_type_calloc(v13, 0x28uLL, 0x10A0040EE0660CCuLL);
    v12->_inputsStorage = v14;
    if (v14)
    {
      v36 = v13;
      if ((_DWORD)v13)
      {
        v15 = 0;
        v33 = *MEMORY[0x1E0D06730];
        allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v34 = *MEMORY[0x1E0CA2E28];
        v16 = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
        do
        {
          if (v15)
          {
            v17 = -[BWMetadataSynchronizerNode _attachedMediaKeysForMetadataInput:](v12, (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v15 - 1));
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v15 - 1), "objectAtIndexedSubscript:", 0), "isEqualToString:", v33))v18 = 1885564004;
            else
              v18 = 1986618469;
            v19 = 2;
          }
          else
          {
            v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
            v38[0] = CFSTR("PrimaryFormat");
            v19 = 1;
            v17 = (void *)objc_msgSend(v20, "initWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1));
            v18 = 1986618469;
          }
          if (CMSimpleQueueCreate(allocator, v19, &v12->_inputsStorage[v15].var1))
            FigSignalErrorAt();
          v21 = (uint64_t)&v12->_inputsStorage[v15];
          *(_OWORD *)(v21 + 16) = v34;
          *(_QWORD *)(v21 + 32) = v16;
          v12->_inputsStorage[v15].var0 = v17;
          v22 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", v18, v12, v15);
          -[BWNodeInputMediaConfiguration setFormatRequirements:](-[BWNodeInput primaryMediaConfiguration](v22, "primaryMediaConfiguration"), "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
          -[BWNodeInputMediaConfiguration setPassthroughMode:](-[BWNodeInput primaryMediaConfiguration](v22, "primaryMediaConfiguration"), "setPassthroughMode:", 1);
          -[BWNodeInputMediaConfiguration setDelayedBufferCount:](-[BWNodeInput primaryMediaConfiguration](v22, "primaryMediaConfiguration"), "setDelayedBufferCount:", v19);
          if (v15)
          {
            v23 = objc_alloc_init(BWNodeInputMediaConfiguration);
            -[BWNodeInputMediaConfiguration setPassthroughMode:](v23, "setPassthroughMode:", 0);
            -[BWNodeInput setUnspecifiedAttachedMediaConfiguration:](v22, "setUnspecifiedAttachedMediaConfiguration:", v23);
            if ((unint64_t)objc_msgSend(v17, "count") >= 2)
            {
              if (objc_msgSend(v17, "count"))
              {
                v24 = 0;
                do
                {
                  v25 = objc_alloc_init(BWNodeInputMediaConfiguration);
                  -[BWNodeInputMediaConfiguration setPassthroughMode:](v25, "setPassthroughMode:", 1);
                  -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v22, "setMediaConfiguration:forAttachedMediaKey:", v25, objc_msgSend(v17, "objectAtIndexedSubscript:", v24++));
                }
                while (objc_msgSend(v17, "count") > v24);
              }
            }
          }
          -[BWNode addInput:](v12, "addInput:", v22);

          ++v15;
          LODWORD(v13) = v36;
        }
        while (v15 != v36);
      }
      v26 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v12);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](-[BWNodeOutput primaryMediaConfiguration](v26, "primaryMediaConfiguration"), "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](-[BWNodeOutput primaryMediaConfiguration](v26, "primaryMediaConfiguration"), "setPassthroughMode:", 1);
      if (v13 >= 2)
      {
        v27 = 1;
        do
        {
          if (objc_msgSend(v12->_inputsStorage[v27].var0, "count"))
          {
            v28 = 0;
            do
            {
              v29 = objc_alloc_init(BWNodeOutputMediaConfiguration);
              -[BWNodeOutputMediaConfiguration setFormatRequirements:](v29, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
              -[BWNodeOutputMediaConfiguration setPassthroughMode:](v29, "setPassthroughMode:", 1);
              -[BWNodeOutputMediaConfiguration setIndexOfInputWhichDrivesThisOutput:](v29, "setIndexOfInputWhichDrivesThisOutput:", v27);
              v30 = objc_msgSend(v12->_inputsStorage[v27].var0, "count");
              v31 = CFSTR("PrimaryFormat");
              if (v30 != 1)
                v31 = (const __CFString *)objc_msgSend(v12->_inputsStorage[v27].var0, "objectAtIndexedSubscript:", v28);
              -[BWNodeOutputMediaConfiguration setAttachedMediaKeyOfInputWhichDrivesThisOutput:](v29, "setAttachedMediaKeyOfInputWhichDrivesThisOutput:", v31);
              -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v26, "setMediaConfiguration:forAttachedMediaKey:", v29, objc_msgSend(v12->_inputsStorage[v27].var0, "objectAtIndexedSubscript:", v28++));
            }
            while (objc_msgSend(v12->_inputsStorage[v27].var0, "count") > v28);
          }
          ++v27;
        }
        while (v27 != v36);
      }
      -[BWNode addOutput:](v12, "addOutput:", v26);

    }
    else
    {
LABEL_30:
      FigDebugAssert3();

      return 0;
    }
  }
  return v12;
}

- (void)_attachedMediaKeysForMetadataInput:(void *)result
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  __CFString *v9;
  char v10;

  if (result)
  {
    v3 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (v3)
    {
      v4 = (void *)v3;
      if (objc_msgSend(a2, "count"))
      {
        v5 = 0;
        v6 = *MEMORY[0x1E0D06738];
        v7 = *MEMORY[0x1E0D06730];
        do
        {
          v8 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v5), "isEqualToString:", v6);
          v9 = CFSTR("LightSourceMask");
          if ((v8 & 1) == 0)
          {
            v10 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v5), "isEqualToString:", v7);
            v9 = CFSTR("KeypointDescriptorData");
            if ((v10 & 1) == 0)
              v9 = (__CFString *)objc_msgSend(a2, "objectAtIndexedSubscript:", v5);
          }
          objc_msgSend(v4, "addObject:", v9);
          ++v5;
        }
        while (objc_msgSend(a2, "count") > v5);
      }
      if (objc_msgSend(v4, "count"))
        return v4;
      else
        return 0;
    }
    else
    {
      FigDebugAssert3();
      return 0;
    }
  }
  return result;
}

- (void)dealloc
{
  uint64_t v3;
  unint64_t v4;
  $FBF65B9B8C8A83F4AFD9BB74AB6298ED *inputsStorage;
  opaqueCMSimpleQueue *var1;
  objc_super v7;

  if (self->_inputsStorage)
  {
    -[BWMetadataSynchronizerNode _purgeAllBuffers](self);
    if (-[NSArray count](-[BWNode inputs](self, "inputs"), "count"))
    {
      v3 = 0;
      v4 = 0;
      do
      {
        inputsStorage = self->_inputsStorage;
        var1 = inputsStorage[v3].var1;
        if (var1)
        {
          CFRelease(var1);
          inputsStorage = self->_inputsStorage;
        }

        ++v4;
        ++v3;
      }
      while (-[NSArray count](-[BWNode inputs](self, "inputs"), "count") > v4);
    }
    free(self->_inputsStorage);
  }

  v7.receiver = self;
  v7.super_class = (Class)BWMetadataSynchronizerNode;
  -[BWNode dealloc](&v7, sel_dealloc);
}

- (_QWORD)_purgeAllBuffers
{
  _QWORD *v1;
  unint64_t i;
  const void *v3;

  if (result)
  {
    v1 = result;
    result = (_QWORD *)objc_msgSend((id)objc_msgSend(result, "inputs"), "count");
    if (result)
    {
      for (i = 0; i < (unint64_t)result; ++i)
      {
        while (1)
        {
          v3 = CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(v1[17] + 40 * i + 8));
          if (!v3)
            break;
          CFRelease(v3);
        }
        result = (_QWORD *)objc_msgSend((id)objc_msgSend(v1, "inputs"), "count");
      }
    }
  }
  return result;
}

- (id)nodeType
{
  return CFSTR("Muxer");
}

- (id)nodeSubType
{
  return CFSTR("MetadataSynchronizer");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BWNodeOutputMediaProperties *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = -[BWNode outputs](self, "outputs");
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, objc_msgSend(a4, "index"));
        if (v13)
        {
          v14 = (void *)v13;
          if (objc_msgSend(v12, "passthroughMode"))
          {
            v15 = (BWNodeOutputMediaProperties *)objc_msgSend(v12, "mediaPropertiesForAttachedMediaKey:", v14);
            v16 = objc_msgSend(v14, "isEqualToString:", CFSTR("PrimaryFormat"));
            if (v15)
            {
              if ((v16 & 1) == 0)
              {
                v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)"), self, v12, v14, a5);
                goto LABEL_18;
              }
            }
            else
            {
              if (v16)
              {
                v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output %@ has no media properties for the primary format (provided media key is %@)"), self, v12, a5, v18);
LABEL_18:
                objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0));
              }
              v15 = objc_alloc_init(BWNodeOutputMediaProperties);
              objc_msgSend(v12, "_setMediaProperties:forAttachedMediaKey:", v15, v14);
            }
            -[BWNodeOutputMediaProperties setResolvedFormat:](v15, "setResolvedFormat:", a3);
          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (!objc_msgSend(a5, "index", a3, a4))
  {
    os_unfair_lock_lock(&self->_bufferServicingLock);
    if (!-[BWNodeOutput liveFormat](self->super._output, "liveFormat"))
      -[BWNodeOutput makeConfiguredFormatLive](self->super._output, "makeConfiguredFormatLive");
    os_unfair_lock_unlock(&self->_bufferServicingLock);
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  int *p_numEODMessagesReceived;
  unsigned int v5;

  p_numEODMessagesReceived = &self->_numEODMessagesReceived;
  do
    v5 = __ldxr((unsigned int *)p_numEODMessagesReceived);
  while (__stxr(v5 + 1, (unsigned int *)p_numEODMessagesReceived));
  if (-[NSArray count](-[BWNode inputs](self, "inputs", a3), "count") == v5 + 1)
  {
    os_unfair_lock_lock(&self->_bufferServicingLock);
    -[BWMetadataSynchronizerNode _tryToEmitImageBufferWithAllMetadata:]((id *)&self->super.super.isa, 0);
    -[BWMetadataSynchronizerNode _purgeAllBuffers](self);
    -[BWNodeOutput markEndOfLiveOutput](self->super._output, "markEndOfLiveOutput");
    os_unfair_lock_unlock(&self->_bufferServicingLock);
    *p_numEODMessagesReceived = 0;
  }
}

- (id)_tryToEmitImageBufferWithAllMetadata:(id *)result
{
  id *v3;
  opaqueCMSimpleQueue *v4;
  id *v5;
  void *v6;
  const __CFString **v7;
  unint64_t v8;
  uint64_t v9;
  void *Head;
  uint64_t v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  id *v17;
  unint64_t v18;
  uint64_t AttachedMedia;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  const __CFString *v25;
  CFTypeRef v26;
  const void *v27;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int value;
  unsigned int v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  unsigned int v42;
  unsigned int v43;
  id *v44;
  uint64_t v45;
  id *v46;
  const void *v47;
  CMTime *p_time1;
  uint64_t v49;
  const __CFString *key;
  uint64_t v51;
  void *v52;
  id *v53;
  uint64_t v54;
  uint64_t v55;
  id *target;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  os_log_type_t type;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  CMTime time2;
  CMTime v75;
  _BYTE v76[128];
  _BYTE v77[128];
  CMTime v78[5];
  _BYTE v79[128];
  _BYTE v80[128];
  CMTime time1;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = result;
  v4 = (opaqueCMSimpleQueue *)*((_QWORD *)result[17] + 1);
  result = (id *)CMSimpleQueueGetHead(v4);
  if (!result)
    return result;
  v5 = result;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v3, "inputs"), "count"));
  memset(&v75, 0, sizeof(v75));
  target = v5;
  msn_getOriginalPTSForSampleBuffer(v5, (uint64_t)&v75);
  if (CMGetAttachment(v4, CFSTR("IsHarvestedStillFrame"), 0))
    goto LABEL_60;
  v7 = (const __CFString **)MEMORY[0x1E0D05CB0];
  if (v3[12])
  {
    if (!objc_msgSend(v3[12], "containsObject:", objc_msgSend((id)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00])))goto LABEL_60;
  }
  v8 = 1;
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v3, "inputs"), "count") >= 2)
  {
    v9 = 48;
    do
    {
      Head = (void *)CMSimpleQueueGetHead(*(CMSimpleQueueRef *)((char *)v3[17] + v9));
      memset(v78, 0, 24);
      msn_getOriginalPTSForSampleBuffer(Head, (uint64_t)v78);
      time1 = v78[0];
      time2 = v75;
      if (CMTimeCompare(&time1, &time2))
      {
        if (a2)
          break;
      }
      else
      {
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8));
      }
      ++v8;
      v9 += 40;
    }
    while (objc_msgSend((id)objc_msgSend(v3, "inputs"), "count") > v8);
  }
  result = (id *)objc_msgSend((id)objc_msgSend(v3, "inputs"), "count");
  if (result == (id *)v8)
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v54 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    if (v54)
    {
      key = *v7;
      v51 = *(_QWORD *)v71;
      v52 = v6;
      v53 = v3;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v71 != v51)
            objc_enumerationMutation(v6);
          v55 = v11;
          v12 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v11);
          v13 = CMSimpleQueueGetHead(*((CMSimpleQueueRef *)v3[17]
                                     + 5 * (int)objc_msgSend(v12, "intValue", p_time1, v49)
                                     + 1));
          v14 = objc_msgSend(*((id *)v3[17] + 5 * (int)objc_msgSend(v12, "intValue")), "count");
          v15 = v3[17];
          v16 = (void *)v15[5 * (int)objc_msgSend(v12, "intValue")];
          v17 = target;
          if (v14 == 1)
          {
            BWSampleBufferSetAttachedMedia(target, objc_msgSend(v16, "objectAtIndexedSubscript:", 0), (uint64_t)v13);
          }
          else if (objc_msgSend(v16, "count"))
          {
            v18 = 0;
            do
            {
              AttachedMedia = BWSampleBufferGetAttachedMedia(v13, objc_msgSend(*((id *)v3[17] + 5 * (int)objc_msgSend(v12, "intValue")), "objectAtIndexedSubscript:", v18));
              if (AttachedMedia)
                BWSampleBufferSetAttachedMedia(target, objc_msgSend(*((id *)v3[17] + 5 * (int)objc_msgSend(v12, "intValue")), "objectAtIndexedSubscript:", v18), AttachedMedia);
              ++v18;
            }
            while (objc_msgSend(*((id *)v3[17] + 5 * (int)objc_msgSend(v12, "intValue")), "count") > v18);
          }
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          v20 = v3[13];
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v67;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v67 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(const __CFString **)(*((_QWORD *)&v66 + 1) + 8 * i);
                v26 = CMGetAttachment(v13, v25, 0);
                if (v26)
                {
                  v27 = v26;
                  if (CMGetAttachment(v17, v25, 0))
                  {
                    LODWORD(time2.value) = 0;
                    type = OS_LOG_TYPE_DEFAULT;
                    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    value = time2.value;
                    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
                      v30 = value;
                    else
                      v30 = value & 0xFFFFFFFE;
                    if (v30)
                    {
                      LODWORD(time1.value) = 136315394;
                      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)"-[BWMetadataSynchronizerNode _tryToEmitI"
                                                                                "mageBufferWithAllMetadata:]";
                      LOWORD(time1.flags) = 2112;
                      *(_QWORD *)((char *)&time1.flags + 2) = v25;
                      LODWORD(v49) = 22;
                      p_time1 = &time1;
                      _os_log_send_and_compose_impl();
                    }
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                    v17 = target;
                  }
                  else
                  {
                    CMSetAttachment(v17, v25, v27, 1u);
                  }
                }
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
            }
            while (v22);
          }
          v31 = (void *)CMGetAttachment(v17, key, 0);
          v32 = (void *)CMGetAttachment(v13, key, 0);
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v33 = v3[14];
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v62;
            do
            {
              for (j = 0; j != v35; ++j)
              {
                if (*(_QWORD *)v62 != v36)
                  objc_enumerationMutation(v33);
                v38 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j);
                v39 = objc_msgSend(v32, "objectForKeyedSubscript:", v38, p_time1, v49);
                if (v32)
                {
                  v40 = v39;
                  if (objc_msgSend(v31, "objectForKeyedSubscript:", v38))
                  {
                    LODWORD(time2.value) = 0;
                    type = OS_LOG_TYPE_DEFAULT;
                    v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    v42 = time2.value;
                    if (os_log_type_enabled(v41, type))
                      v43 = v42;
                    else
                      v43 = v42 & 0xFFFFFFFE;
                    if (v43)
                    {
                      LODWORD(time1.value) = 136315394;
                      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)"-[BWMetadataSynchronizerNode _tryToEmitI"
                                                                                "mageBufferWithAllMetadata:]";
                      LOWORD(time1.flags) = 2112;
                      *(_QWORD *)((char *)&time1.flags + 2) = v38;
                      LODWORD(v49) = 22;
                      p_time1 = &time1;
                      _os_log_send_and_compose_impl();
                    }
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                  else
                  {
                    objc_msgSend(v31, "setObject:forKeyedSubscript:", v40, v38);
                  }
                }
              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
            }
            while (v35);
          }
          v11 = v55 + 1;
          v6 = v52;
          v3 = v53;
        }
        while (v55 + 1 != v54);
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
      }
      while (v54);
    }
LABEL_60:
    objc_msgSend(v6, "addObject:", &unk_1E49F8430, p_time1, v49);
    objc_msgSend(v3[2], "emitSampleBuffer:", target);
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    result = (id *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
    if (result)
    {
      v44 = result;
      v45 = *(_QWORD *)v58;
      do
      {
        v46 = 0;
        do
        {
          if (*(_QWORD *)v58 != v45)
            objc_enumerationMutation(v6);
          v47 = CMSimpleQueueDequeue(*((CMSimpleQueueRef *)v3[17]
                                     + 5
                                     * (int)objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v46), "intValue")
                                     + 1));
          if (v47)
            CFRelease(v47);
          v46 = (id *)((char *)v46 + 1);
        }
        while (v44 != v46);
        result = (id *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
        v44 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v7;
  uint64_t v8;
  NSArray *syncMetadataForPortTypes;
  double OriginalPTSForSampleBuffer;
  $FBF65B9B8C8A83F4AFD9BB74AB6298ED *inputsStorage;
  $FBF65B9B8C8A83F4AFD9BB74AB6298ED *v12;
  $FBF65B9B8C8A83F4AFD9BB74AB6298ED *v13;
  $FBF65B9B8C8A83F4AFD9BB74AB6298ED *v14;
  opaqueCMSimpleQueue *var1;
  int32_t Count;
  const void *v17;
  unint64_t v18;
  CFTypeRef v19;
  NSArray *syncOnlyIfMetadataEnabledForKeys;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  unint64_t v25;
  unint64_t v26;
  CMTime time2;
  CMTime time1;
  CMTime var2;
  CMTime v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
    return;
  }
  v7 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v8 = objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  if (!objc_msgSend(a4, "index")
    || (syncMetadataForPortTypes = self->_syncMetadataForPortTypes) == 0
    || -[NSArray containsObject:](syncMetadataForPortTypes, "containsObject:", v8))
  {
    if (!objc_msgSend(a4, "index"))
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      syncOnlyIfMetadataEnabledForKeys = self->_syncOnlyIfMetadataEnabledForKeys;
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](syncOnlyIfMetadataEnabledForKeys, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v32;
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v32 != v23)
              objc_enumerationMutation(syncOnlyIfMetadataEnabledForKeys);
            if ((objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i)), "BOOLValue") & 1) == 0)
            {
              -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
              return;
            }
          }
          v22 = -[NSArray countByEnumeratingWithState:objects:count:](syncOnlyIfMetadataEnabledForKeys, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (v22)
            continue;
          break;
        }
      }
    }
    os_unfair_lock_lock(&self->_bufferServicingLock);
    memset(&v30, 0, sizeof(v30));
    OriginalPTSForSampleBuffer = msn_getOriginalPTSForSampleBuffer(a3, (uint64_t)&v30);
    inputsStorage = self->_inputsStorage;
    var2 = (CMTime)inputsStorage[objc_msgSend(a4, "index", OriginalPTSForSampleBuffer)].var2;
    time1 = v30;
    time2 = var2;
    if (CMTimeCompare(&time1, &time2) <= 0)
    {
      v25 = -1;
      do
        ++v25;
      while (objc_msgSend(self->_inputsStorage[objc_msgSend(a4, "index")].var0, "count") > v25);
      goto LABEL_36;
    }
    v12 = self->_inputsStorage;
    v13 = &v12[objc_msgSend(a4, "index")];
    v13->var2 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v30;
    v14 = self->_inputsStorage;
    var1 = v14[objc_msgSend(a4, "index")].var1;
    Count = CMSimpleQueueGetCount(var1);
    if (Count == CMSimpleQueueGetCapacity(var1))
    {
      if (!objc_msgSend(a4, "index"))
      {
        v26 = -1;
        do
          ++v26;
        while (objc_msgSend(self->_inputsStorage[objc_msgSend(a4, "index")].var0, "count") > v26);
        -[BWMetadataSynchronizerNode _tryToEmitImageBufferWithAllMetadata:]((id *)&self->super.super.isa, 0);
        if (a3)
          goto LABEL_16;
        goto LABEL_33;
      }
      v17 = CMSimpleQueueDequeue(var1);
      v18 = -1;
      do
        ++v18;
      while (objc_msgSend(self->_inputsStorage[objc_msgSend(a4, "index")].var0, "count") > v18);
      if (v17)
        CFRelease(v17);
      -[BWMetadataSynchronizerNode _printState]((unint64_t)self);
    }
    if (a3)
    {
LABEL_16:
      v19 = CFRetain(a3);
      goto LABEL_34;
    }
LABEL_33:
    v19 = 0;
LABEL_34:
    if (CMSimpleQueueEnqueue(var1, v19))
    {
      FigDebugAssert3();
      if (a3)
        CFRelease(a3);
    }
    else
    {
      -[BWMetadataSynchronizerNode _purgeAllPurgeableMetadataBuffers](self);
      -[BWMetadataSynchronizerNode _tryToEmitImageBufferWithAllMetadata:]((id *)&self->super.super.isa, 1);
    }
LABEL_36:
    os_unfair_lock_unlock(&self->_bufferServicingLock);
  }
}

- (unint64_t)_printState
{
  _QWORD *v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *Head;
  uint64_t Count;
  uint64_t Capacity;
  void *v9;
  const __CFString *key;
  CMTime time;

  if (result)
  {
    v1 = (_QWORD *)result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    result = objc_msgSend((id)objc_msgSend(v1, "inputs"), "count");
    if (result)
    {
      v3 = 0;
      key = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v4 = *MEMORY[0x1E0D06D00];
      v5 = 8;
      do
      {
        Head = (void *)CMSimpleQueueGetHead(*(CMSimpleQueueRef *)(v1[17] + v5));
        Count = CMSimpleQueueGetCount(*(CMSimpleQueueRef *)(v1[17] + v5));
        Capacity = CMSimpleQueueGetCapacity(*(CMSimpleQueueRef *)(v1[17] + v5));
        objc_msgSend(v2, "appendFormat:", CFSTR(" [%d] = {"), v3);
        if (Head)
        {
          v9 = (void *)CMGetAttachment(Head, key, 0);
          msn_getOriginalPTSForSampleBuffer(Head, (uint64_t)&time);
          objc_msgSend(v2, "appendFormat:", CFSTR(" %d/%d head: PTS %.4lf %@"), Count, Capacity, CMTimeGetSeconds(&time), objc_msgSend(v9, "objectForKeyedSubscript:", v4));
        }
        objc_msgSend(v2, "appendFormat:", CFSTR("}"));
        ++v3;
        result = objc_msgSend((id)objc_msgSend(v1, "inputs"), "count");
        v5 += 40;
      }
      while (result > v3);
    }
  }
  return result;
}

- (_QWORD)_purgeAllPurgeableMetadataBuffers
{
  _QWORD *v1;
  char v2;
  unint64_t i;
  opaqueCMSimpleQueue *v4;
  void *j;
  unint64_t v6;
  const void *v7;
  CMTime v8;
  CMTime time1;
  CMTime v10;
  CMTime v11;

  if (result)
  {
    v1 = result;
    result = CMSimpleQueueGetHead(*(CMSimpleQueueRef *)(result[17] + 8));
    if (result)
    {
      memset(&v11, 0, sizeof(v11));
      result = (_QWORD *)objc_msgSend((id)objc_msgSend(v1, "inputs", msn_getOriginalPTSForSampleBuffer(result, (uint64_t)&v11)), "count");
      if ((unint64_t)result >= 2)
      {
        v2 = 0;
        for (i = 1; i < (unint64_t)result; ++i)
        {
          v4 = *(opaqueCMSimpleQueue **)(v1[17] + 40 * i + 8);
          for (j = (void *)CMSimpleQueueGetHead(v4); j; v2 = 1)
          {
            memset(&v10, 0, sizeof(v10));
            msn_getOriginalPTSForSampleBuffer(j, (uint64_t)&v10);
            time1 = v10;
            v8 = v11;
            if ((CMTimeCompare(&time1, &v8) & 0x80000000) == 0)
              break;
            v6 = -1;
            do
              ++v6;
            while (objc_msgSend(*(id *)(v1[17] + 40 * i), "count") > v6);
            v7 = CMSimpleQueueDequeue(v4);
            if (v7)
              CFRelease(v7);
            j = (void *)CMSimpleQueueGetHead(v4);
          }
          result = (_QWORD *)objc_msgSend((id)objc_msgSend(v1, "inputs"), "count");
        }
        if ((v2 & 1) != 0)
          return (_QWORD *)-[BWMetadataSynchronizerNode _printState]((unint64_t)v1);
      }
    }
  }
  return result;
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  os_unfair_lock_s *p_bufferServicingLock;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if (!objc_msgSend(a4, "index"))
  {
    os_unfair_lock_lock(&self->_bufferServicingLock);
    -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", a3);
    os_unfair_lock_unlock(&self->_bufferServicingLock);
  }
}

@end
