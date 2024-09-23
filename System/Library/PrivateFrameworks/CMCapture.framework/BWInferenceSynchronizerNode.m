@implementation BWInferenceSynchronizerNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  BWNodeOutputMediaProperties *v8;

  v8 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", a5, a4);
  if (!v8)
  {
    v8 = objc_alloc_init(BWNodeOutputMediaProperties);
    -[BWNodeOutput _setMediaProperties:forAttachedMediaKey:](self->super._output, "_setMediaProperties:forAttachedMediaKey:", v8, a5);
  }
  -[BWNodeOutputMediaProperties setResolvedFormat:](v8, "setResolvedFormat:", a3);
}

- (BWInferenceSynchronizerNode)initWithIndexOfInputProvidingOutputSampleBuffer:(int)a3 indexOfInputProvidingPreferredInferences:(int)a4 errorHandlingModel:(unsigned __int16)a5
{
  BWInferenceSynchronizerNode *v8;
  char v9;
  uint64_t v10;
  char v11;
  BWNodeInput *v12;
  BWNodeInputMediaConfiguration *v13;
  BWNodeInputMediaConfiguration *v14;
  $84F358D884199ADDE07D6A4FF383B9AA *v15;
  BWNodeOutput *v16;
  BWNodeOutputMediaConfiguration *v17;
  BWNodeOutputMediaConfiguration *v18;
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)BWInferenceSynchronizerNode;
  v8 = -[BWNode init](&v20, sel_init);
  if (v8)
  {
    v8->_mostRecentEmittedCaptureIdentifierByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8->_indexOfInputProvidingOutputSampleBuffer = a3;
    v8->_indexOfInputProvidingOnlyInferences = a3 == 0;
    v8->_indexOfInputProvidingPreferredInferences = a4;
    v8->_errorHandlingModel = a5;
    v9 = 1;
    -[BWNode setSupportsConcurrentLiveInputCallbacks:](v8, "setSupportsConcurrentLiveInputCallbacks:", 1);
    v8->_bufferServicingLock._os_unfair_lock_opaque = 0;
    v10 = 0;
    v8->_maximumNumberOfInflightBuffers = FigGetCFPreferenceNumberWithDefault();
    do
    {
      v11 = v9;
      v12 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v8, v10);
      v13 = -[BWNodeInput primaryMediaConfiguration](v12, "primaryMediaConfiguration");
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v13, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeInputMediaConfiguration setPassthroughMode:](v13, "setPassthroughMode:", v10 == v8->_indexOfInputProvidingOutputSampleBuffer);
      v14 = objc_alloc_init(BWNodeInputMediaConfiguration);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v14, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeInputMediaConfiguration setPassthroughMode:](v14, "setPassthroughMode:", 1);
      -[BWNodeInput setUnspecifiedAttachedMediaConfiguration:](v12, "setUnspecifiedAttachedMediaConfiguration:", v14);
      v15 = &v8->_contexts[v10];
      v15->bufferQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15->mostRecentCaptureIdentifierByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15->numberOfWraparoundsByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[BWNode addInput:](v8, "addInput:", v12);
      v9 = 0;
      v10 = 1;
    }
    while ((v11 & 1) != 0);
    v16 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v8);
    v17 = -[BWNodeOutput primaryMediaConfiguration](v16, "primaryMediaConfiguration");
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v17, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v17, "setPassthroughMode:", 1);
    v22[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8->_indexOfInputProvidingOutputSampleBuffer);
    v22[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8->_indexOfInputProvidingOnlyInferences);
    -[BWNodeOutputMediaConfiguration setIndexesOfInputsWhichDrivesThisOutput:](v17, "setIndexesOfInputsWhichDrivesThisOutput:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2));
    v18 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v18, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v18, "setPassthroughMode:", 1);
    v21[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8->_indexOfInputProvidingOutputSampleBuffer);
    v21[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8->_indexOfInputProvidingOnlyInferences);
    -[BWNodeOutputMediaConfiguration setIndexesOfInputsWhichDrivesThisOutput:](v18, "setIndexesOfInputsWhichDrivesThisOutput:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2));
    -[BWNodeOutputMediaConfiguration setAttachedMediaKeyOfInputWhichDrivesThisOutput:](v18, "setAttachedMediaKeyOfInputWhichDrivesThisOutput:", CFSTR("PrimaryFormat"));
    -[BWNode addOutput:](v8, "addOutput:", v16);
  }
  return v8;
}

- (id)nodeType
{
  return CFSTR("Muxer");
}

- (void)setSynchronizesTopLevelAttachments:(BOOL)a3
{
  self->_synchronizesTopLevelAttachments = a3;
}

- (void)setSynchronizeInferencesResolver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setAttachedMediaKeysToSkip:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (void)setAllowOutOfOrderInputs:(BOOL)a3
{
  self->_allowOutOfOrderInputs = a3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWInferenceSynchronizerNode)init
{
  return -[BWInferenceSynchronizerNode initWithIndexOfInputProvidingOutputSampleBuffer:indexOfInputProvidingPreferredInferences:errorHandlingModel:](self, "initWithIndexOfInputProvidingOutputSampleBuffer:indexOfInputProvidingPreferredInferences:errorHandlingModel:", 0, 1, 0);
}

- (void)dealloc
{
  uint64_t v3;
  char v4;
  char v5;
  $84F358D884199ADDE07D6A4FF383B9AA *v6;
  objc_super v7;

  v3 = 0;
  v4 = 1;
  do
  {
    v5 = v4;
    v6 = &self->_contexts[v3];

    v4 = 0;
    v3 = 1;
  }
  while ((v5 & 1) != 0);
  v7.receiver = self;
  v7.super_class = (Class)BWInferenceSynchronizerNode;
  -[BWNode dealloc](&v7, sel_dealloc);
}

- (BWNodeInput)inputProvidingOutputSampleBuffer
{
  return (BWNodeInput *)-[NSArray objectAtIndexedSubscript:](-[BWNode inputs](self, "inputs"), "objectAtIndexedSubscript:", self->_indexOfInputProvidingOutputSampleBuffer);
}

- (BWNodeInput)inputProvidingPreferredInferences
{
  return (BWNodeInput *)-[NSArray objectAtIndexedSubscript:](-[BWNode inputs](self, "inputs"), "objectAtIndexedSubscript:", self->_indexOfInputProvidingPreferredInferences);
}

- (BWNodeInput)inputProvidingOnlyInferences
{
  return (BWNodeInput *)-[NSArray objectAtIndexedSubscript:](-[BWNode inputs](self, "inputs"), "objectAtIndexedSubscript:", self->_indexOfInputProvidingOnlyInferences);
}

- (id)nodeSubType
{
  return CFSTR("InferenceSynchronizer");
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  os_unfair_lock_s *p_bufferServicingLock;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  v8 = objc_msgSend(a5, "index");
  v9 = 0;
  v10 = 1;
  self->_contexts[v8].inputIsLive = 1;
  while (self->_contexts[v9].inputIsLive)
  {
    v11 = v10;
    v10 = 0;
    v9 = 1;
    if ((v11 & 1) == 0)
    {
      -[BWNodeOutput makeConfiguredFormatLive](self->super._output, "makeConfiguredFormatLive");
      break;
    }
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  os_unfair_lock_s *p_bufferServicingLock;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  v6 = objc_msgSend(a3, "index");
  v7 = 0;
  self->_contexts[v6].inputIsLive = 0;
  v8 = 1;
  while (!self->_contexts[v7].inputIsLive)
  {
    v9 = v8;
    v8 = 0;
    v7 = 1;
    if ((v9 & 1) == 0)
    {
      -[BWNodeOutput markEndOfLiveOutput](self->super._output, "markEndOfLiveOutput");
      break;
    }
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t (**synchronizeInferencesResolver)(id, opaqueCMSampleBuffer *);
  $84F358D884199ADDE07D6A4FF383B9AA *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  synchronizeInferencesResolver = (uint64_t (**)(id, opaqueCMSampleBuffer *))self->_synchronizeInferencesResolver;
  if (synchronizeInferencesResolver && (synchronizeInferencesResolver[2](synchronizeInferencesResolver, a3) & 1) == 0)
  {
    if (dword_1ECFE9A70)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (objc_msgSend(a4, "index", v16, v17) == self->_indexOfInputProvidingOutputSampleBuffer)
      -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
  }
  else
  {
    v8 = &self->_contexts[objc_msgSend(a4, "index")];
    v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB0]), "intValue");
    v11 = objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    os_unfair_lock_lock(&self->_bufferServicingLock);
    LODWORD(v12) = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v8->numberOfWraparoundsByPortType, "objectForKeyedSubscript:", v11), "intValue");
    v13 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v8->mostRecentCaptureIdentifierByPortType, "objectForKeyedSubscript:", v11), "intValue");
    if (!self->_allowOutOfOrderInputs && (int)v10 < v13)
      v12 = (v12 + 1);
    else
      v12 = v12;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->numberOfWraparoundsByPortType, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12), v11);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->mostRecentCaptureIdentifierByPortType, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10), v11);
    CMSetAttachment(a3, CFSTR("ExtendedCaptureID"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10 | ((_DWORD)v12 << 12)), 0);
    -[NSMutableArray addObject:](v8->bufferQueue, "addObject:", a3);
    -[BWInferenceSynchronizerNode _attemptBufferOrErrorEmission]((id *)&self->super.super.isa);
    os_unfair_lock_unlock(&self->_bufferServicingLock);
  }
}

- (void)_attemptBufferOrErrorEmission
{
  id *v1;
  uint64_t v2;
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  const void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  const void *v19;
  const void *v20;
  id v21;
  CFTypeRef v22;
  const void *v23;
  CFTypeRef v24;
  CFTypeRef v25;
  CFTypeRef v26;
  void *v27;
  CFTypeRef v28;
  CFTypeRef v29;
  CFTypeRef v30;
  CFTypeRef v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  CFDictionaryRef v38;
  CFDictionaryRef v39;
  CFDictionaryRef v40;
  CFDictionaryRef v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  __CFString *v50;
  CFTypeRef v51;
  _BOOL4 v52;
  int v53;
  int v54;
  unsigned int v55;
  BOOL v58;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  void *v65;
  const __CFString *v66;
  uint64_t v67;
  const void *v68;
  int v69;
  int v70;
  BOOL v71;
  int *v72;
  uint64_t v73;
  id *v74;
  id *v75;
  uint64_t v76;
  const __CFAllocator *allocator;
  CFDictionaryRef v78;
  _BOOL4 v79;
  id *v80;
  int v81;
  CFDictionaryRef v82;
  id *v83;
  id *v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  const __CFString *key;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unsigned int v96;
  _QWORD v97[6];
  os_log_type_t type[16];
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  int v106;
  const char *v107;
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  uint64_t v111;
  __int16 v112;
  unsigned int v113;
  __int16 v114;
  _BOOL4 v115;
  __int16 v116;
  _BOOL4 v117;
  __int16 v118;
  _BOOL4 v119;
  __int16 v120;
  int v121;
  _QWORD v122[5];
  unsigned int v123;
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    v89 = (void *)objc_msgSend(a1, "output");
    v2 = (uint64_t)&v1[5 * *((int *)v1 + 26) + 15];
    v3 = *(id *)v2;
    v75 = (id *)(v2 + 8);
    v76 = *(_QWORD *)(v2 + 8);
    v4 = *((_DWORD *)v1 + 27);
    v5 = (uint64_t)&v1[5 * v4 + 15];
    v6 = *(void **)v5;
    v7 = *(_QWORD *)(v5 + 8);
    v74 = (id *)(v5 + 8);
    v85 = v7;
    v8 = 0;
    if (objc_msgSend(*(id *)v2, "count"))
    {
      v79 = v7 != 0;
      key = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v9 = (uint64_t)&v1[5 * v4 + 15];
      v87 = *MEMORY[0x1E0D06D00];
      v83 = (id *)(v9 + 16);
      v84 = (id *)(v9 + 24);
      allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v91 = v6;
      v86 = v3;
      v80 = v1;
      do
      {
        v10 = (const void *)objc_msgSend(v3, "firstObject");
        v11 = (void *)CMGetAttachment(v10, key, 0);
        v12 = objc_msgSend((id)CMGetAttachment(v10, CFSTR("ExtendedCaptureID"), 0), "intValue");
        v13 = objc_msgSend(v11, "objectForKeyedSubscript:", v87);
        v14 = objc_msgSend(v3, "count");
        v94 = *((unsigned __int8 *)v1 + 204);
        v95 = v14;
        v122[0] = MEMORY[0x1E0C809B0];
        v122[1] = 3221225472;
        v122[2] = __87__BWInferenceSynchronizerNode__synchronizedBufferFromQueue_withIdentifier_andPortType___block_invoke;
        v122[3] = &unk_1E4920790;
        v96 = v12;
        v123 = v12;
        v122[4] = v13;
        v15 = objc_msgSend(v6, "indexOfObjectPassingTest:", v122);
        if (v15 == 0x7FFFFFFFFFFFFFFFLL || (v16 = objc_msgSend(v6, "objectAtIndexedSubscript:", v15)) == 0)
        {
          v54 = objc_msgSend((id)objc_msgSend(*v84, "objectForKeyedSubscript:", v13), "intValue");
          v55 = objc_msgSend((id)objc_msgSend(*v83, "objectForKeyedSubscript:", v13), "intValue") | (v54 << 12);
          v52 = v55 > v12;
          if (v95 < v94 && v85 == 0 && v55 <= v96)
            break;
          v90 = 0;
          v53 = 0;
        }
        else
        {
          v92 = v13;
          v17 = *((_DWORD *)v1 + 26);
          v18 = *((_DWORD *)v1 + 28);
          if (v17 == v18)
            v19 = v10;
          else
            v19 = (const void *)v16;
          v90 = v16;
          if (v17 == v18)
            v20 = (const void *)v16;
          else
            v20 = v10;
          v81 = objc_msgSend(v1, "synchronizesTopLevelAttachments");
          v21 = v1[27];
          v22 = CMGetAttachment(v19, CFSTR("Inferences"), 0);
          v23 = (const void *)MEMORY[0x1E0C9AA70];
          if (v22)
            v24 = v22;
          else
            v24 = (CFTypeRef)MEMORY[0x1E0C9AA70];
          v25 = CMGetAttachment(v20, CFSTR("Inferences"), 0);
          if (v25)
            v26 = v25;
          else
            v26 = v23;
          v27 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v26);
          objc_msgSend(v27, "addEntriesFromDictionary:", v24);
          CMSetAttachment(v10, CFSTR("Inferences"), v27, 1u);
          v28 = (id)BWSampleBufferCopyDictionaryOfAttachedMedia(v19);
          if (v28)
            v29 = v28;
          else
            v29 = v23;
          v30 = (id)BWSampleBufferCopyDictionaryOfAttachedMedia(v20);
          if (v30)
            v31 = v30;
          else
            v31 = v23;
          v32 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v31);
          objc_msgSend(v32, "addEntriesFromDictionary:", v29);
          v104 = 0u;
          v105 = 0u;
          v102 = 0u;
          v103 = 0u;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v102, v122, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v103;
            do
            {
              for (i = 0; i != v34; ++i)
              {
                if (*(_QWORD *)v103 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i);
                if ((objc_msgSend(v21, "containsObject:", v37) & 1) == 0)
                  BWSampleBufferSetAttachedMedia(v10, v37, objc_msgSend(v32, "objectForKeyedSubscript:", v37));
              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v102, v122, 16);
            }
            while (v34);
          }
          if (v10 != v19)
            BWSampleBufferRemoveAllAttachedMedia(v19);
          if (v10 != v20)
            BWSampleBufferRemoveAllAttachedMedia(v20);
          v1 = v80;
          if (v81)
          {
            v38 = CMCopyDictionaryOfAttachments(allocator, v19, 1u);
            v39 = CMCopyDictionaryOfAttachments(allocator, v20, 1u);
            v40 = v39;
            if (v10 == v19)
              v41 = v38;
            else
              v41 = v39;
            v82 = v38;
            v42 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[__CFDictionary allKeys](v38, "allKeys"));
            v78 = v40;
            v43 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[__CFDictionary allKeys](v40, "allKeys"));
            v44 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[__CFDictionary allKeys](v41, "allKeys"));
            v45 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v42);
            objc_msgSend(v45, "unionSet:", v43);
            objc_msgSend(v45, "minusSet:", v44);
            v100 = 0u;
            v101 = 0u;
            *(_OWORD *)type = 0u;
            v99 = 0u;
            v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", type, &v106, 16);
            if (v46)
            {
              v47 = v46;
              v48 = *(_QWORD *)v99;
              do
              {
                for (j = 0; j != v47; ++j)
                {
                  if (*(_QWORD *)v99 != v48)
                    objc_enumerationMutation(v45);
                  v50 = *(__CFString **)(*(_QWORD *)&type[8] + 8 * j);
                  if ((-[__CFString isEqualToString:](v50, "isEqualToString:", CFSTR("NonProcessedReferenceFrame")) & 1) == 0)
                  {
                    v51 = CMGetAttachment(v19, v50, 0);
                    if (!v51)
                      v51 = CMGetAttachment(v20, v50, 0);
                    CMSetAttachment(v10, v50, v51, 1u);
                  }
                }
                v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", type, &v106, 16);
              }
              while (v47);
            }

          }
          v52 = 0;
          v53 = 1;
          v3 = v86;
          v13 = v92;
        }
        if (*((_WORD *)v1 + 103))
          v58 = 1;
        else
          v58 = dword_1ECFE9A70 == 0;
        if (!v58)
        {
          v93 = v13;
          LODWORD(v102) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v60 = v102;
          if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type[0]))
            v61 = v60;
          else
            v61 = v60 & 0xFFFFFFFE;
          if (v61)
          {
            v62 = objc_msgSend(v1, "name");
            v63 = BWStillImageCaptureIDForSampleBuffer(v10);
            v106 = 136316931;
            v107 = "-[BWInferenceSynchronizerNode _attemptBufferOrErrorEmission]";
            v108 = 2113;
            v109 = v62;
            v110 = 2050;
            v111 = v63;
            v112 = 1026;
            v113 = v96;
            v114 = 1026;
            v115 = v95 >= v94;
            v116 = 1026;
            v117 = v79;
            v118 = 1026;
            v119 = v52;
            v120 = 1026;
            v121 = v53;
            LODWORD(v73) = 62;
            v72 = &v106;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v3 = v86;
          v13 = v93;
        }
        CMRemoveAttachment(v10, CFSTR("ExtendedCaptureID"));
        objc_msgSend(v89, "emitSampleBuffer:", v10);
        objc_msgSend(v3, "removeObject:", v10);
        if (v53)
          objc_msgSend(v91, "removeObject:", v90);
        objc_msgSend(v1[12], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v96, v72, v73), v13);
        v8 = 1;
        v6 = v91;
      }
      while (objc_msgSend(v3, "count"));
    }
    if (v76)
    {
      if (objc_msgSend(v6, "count") || v85 != 0)
      {
        objc_msgSend(v89, "emitNodeError:", v76);
        v97[0] = MEMORY[0x1E0C809B0];
        v97[1] = 3221225472;
        v97[2] = __60__BWInferenceSynchronizerNode__attemptBufferOrErrorEmission__block_invoke;
        v97[3] = &unk_1E49207B8;
        v97[4] = v76;
        v97[5] = v85;
        v65 = (void *)objc_msgSend(v6, "indexesOfObjectsPassingTest:", v97);
        if (objc_msgSend(v65, "count"))
          objc_msgSend(v6, "removeObjectsAtIndexes:", v65);
        v8 = 1;
      }
    }
    if (objc_msgSend(v6, "count"))
    {
      v66 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v67 = *MEMORY[0x1E0D06D00];
      do
      {
        v68 = (const void *)objc_msgSend(v6, "firstObject");
        v69 = objc_msgSend((id)objc_msgSend(v1[12], "objectForKeyedSubscript:", objc_msgSend((id)CMGetAttachment(v68, v66, 0), "objectForKeyedSubscript:", v67)), "intValue");
        v70 = objc_msgSend((id)CMGetAttachment(v68, CFSTR("ExtendedCaptureID"), 0), "intValue");
        if (*((_BYTE *)v1 + 224))
          v71 = 0;
        else
          v71 = v70 <= v69;
        if (!v71)
          break;
        objc_msgSend(v6, "removeObject:", v68);
      }
      while (objc_msgSend(v6, "count"));
    }
    if ((v8 & 1) != 0)
    {

      *v75 = 0;
      *v74 = 0;
    }
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  BWNodeOutput *v7;
  os_unfair_lock_s *p_bufferServicingLock;
  int v9;
  $84F358D884199ADDE07D6A4FF383B9AA *contexts;
  uint64_t v11;
  uint64_t v12;
  $84F358D884199ADDE07D6A4FF383B9AA *v13;
  $84F358D884199ADDE07D6A4FF383B9AA *v14;

  v7 = -[BWNode output](self, "output");
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  v9 = -[BWInferenceSynchronizerNode errorHandlingModel](self, "errorHandlingModel");
  if (v9 == 1)
    goto LABEL_9;
  if (!v9)
  {
    if (objc_msgSend(a3, "errorCode") == -16800
      || objc_msgSend(a3, "errorCode") == -16802
      || objc_msgSend(a3, "errorCode") == -16806)
    {
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "captureSettings"), "captureType") != 11|| objc_msgSend(a4, "index") == self->_indexOfInputProvidingOutputSampleBuffer)
      {
        contexts = self->_contexts;
        -[NSMutableArray removeAllObjects](contexts->bufferQueue, "removeAllObjects");

        contexts->mostRecentError = 0;
        -[NSMutableArray removeAllObjects](contexts[1].bufferQueue, "removeAllObjects");

        contexts[1].mostRecentError = 0;
LABEL_9:
        -[BWNodeOutput emitNodeError:](v7, "emitNodeError:", a3);
      }
    }
    else
    {
      v11 = objc_msgSend(a4, "index");
      v12 = v11;
      v13 = self->_contexts;
      if (v11 == self->_indexOfInputProvidingOutputSampleBuffer && v13[v11].mostRecentError)
        -[BWNodeOutput emitNodeError:](v7, "emitNodeError:");
      v14 = &v13[v12];

      v14->mostRecentError = (BWNodeError *)a3;
      -[BWInferenceSynchronizerNode _attemptBufferOrErrorEmission]((id *)&self->super.super.isa);
    }
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if (objc_msgSend(a4, "index") == self->_indexOfInputProvidingOutputSampleBuffer)
  {
    os_unfair_lock_lock(&self->_bufferServicingLock);
    -[BWNodeOutput emitDroppedSample:](-[BWNode output](self, "output"), "emitDroppedSample:", a3);
    os_unfair_lock_unlock(&self->_bufferServicingLock);
  }
}

- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a3;
  if (objc_msgSend(a4, "index") == self->_indexOfInputProvidingOutputSampleBuffer)
    -[BWNodeOutput emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:](-[BWNode output](self, "output"), "emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:", v4);
}

uint64_t __87__BWInferenceSynchronizerNode__synchronizedBufferFromQueue_withIdentifier_andPortType___block_invoke(uint64_t a1, CMAttachmentBearerRef target)
{
  if (objc_msgSend((id)CMGetAttachment(target, CFSTR("ExtendedCaptureID"), 0), "intValue") == *(_DWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
  else
    return 0;
}

BOOL __60__BWInferenceSynchronizerNode__attemptBufferOrErrorEmission__block_invoke(uint64_t a1, CMAttachmentBearerRef target)
{
  void *v3;
  uint64_t v4;
  uint64_t v6;

  v3 = (void *)CMGetAttachment(target, CFSTR("BWStillImageCaptureSettings"), 0);
  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "stillImageSettings"), "captureSettings"), "settingsID");
  if (v4 == objc_msgSend(v3, "settingsID"))
    return 1;
  v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "stillImageSettings"), "settingsID");
  return v6 == objc_msgSend(v3, "settingsID");
}

- (unsigned)errorHandlingModel
{
  return self->_errorHandlingModel;
}

- (BOOL)synchronizesTopLevelAttachments
{
  return self->_synchronizesTopLevelAttachments;
}

- (NSSet)attachedMediaKeysToSkip
{
  return self->_attachedMediaKeysToSkip;
}

- (BOOL)allowOutOfOrderInputs
{
  return self->_allowOutOfOrderInputs;
}

- (id)synchronizeInferencesResolver
{
  return self->_synchronizeInferencesResolver;
}

@end
