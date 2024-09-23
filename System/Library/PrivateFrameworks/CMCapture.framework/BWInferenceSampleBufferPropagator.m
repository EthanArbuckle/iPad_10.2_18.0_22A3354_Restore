@implementation BWInferenceSampleBufferPropagator

- (BWInferenceSampleBufferPropagator)initWithVideoRequirements:(id)a3 cloneRequirements:(id)a4 metadataRequirements:(id)a5
{
  BWInferenceSampleBufferPropagator *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWInferenceSampleBufferPropagator;
  v8 = -[BWInferenceSampleBufferPropagator init](&v10, sel_init);
  if (v8)
  {
    v8->_videoRequirements = (NSArray *)objc_msgSend(a3, "copy");
    v8->_cloneVideoRequirements = (NSArray *)objc_msgSend(a4, "copy");
    v8->_metadataRequirements = (NSArray *)objc_msgSend(a5, "copy");
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSampleBufferPropagator;
  -[BWInferenceSampleBufferPropagator dealloc](&v3, sel_dealloc);
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  NSArray *videoRequirements;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const void *v16;
  NSArray *cloneVideoRequirements;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  const void *v23;
  NSArray *metadataRequirements;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  videoRequirements = self->_videoRequirements;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](videoRequirements, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(videoRequirements);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v16 = (const void *)objc_msgSend(a4, "newSampleBufferSatisfyingRequirement:withPropagationSampleBuffer:", v15, a6);
        BWSampleBufferSetAttachedMedia(a6, objc_msgSend(v15, "attachedMediaKey"), (uint64_t)v16);
        if (v16)
          CFRelease(v16);
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](videoRequirements, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v12);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  cloneVideoRequirements = self->_cloneVideoRequirements;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](cloneVideoRequirements, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(cloneVideoRequirements);
        v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        v23 = (const void *)objc_msgSend(a4, "newSampleBufferSatisfyingCloneRequirement:", v22);
        BWSampleBufferSetAttachedMedia(a6, objc_msgSend(v22, "attachedMediaKey"), (uint64_t)v23);
        if (v23)
          CFRelease(v23);
      }
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](cloneVideoRequirements, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v19);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  metadataRequirements = self->_metadataRequirements;
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](metadataRequirements, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v31 != v27)
          objc_enumerationMutation(metadataRequirements);
        v29 = (void *)objc_msgSend(a4, "newMetadataDictionarySatisfyingRequirement:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k));
        objc_msgSend(a3, "addEntriesFromDictionary:", v29);

      }
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](metadataRequirements, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v26);
  }
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
}

- (BOOL)allowsAsyncPropagation
{
  return 0;
}

@end
