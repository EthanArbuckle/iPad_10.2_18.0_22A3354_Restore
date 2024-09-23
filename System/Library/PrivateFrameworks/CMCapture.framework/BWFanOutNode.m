@implementation BWFanOutNode

- (id)nodeType
{
  return CFSTR("Demuxer");
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  opaqueCMSampleBuffer *v4;
  uint64_t v6;
  CFTypeRef cf;

  if (self->_outputsCount >= 1)
  {
    v4 = a3;
    v6 = 0;
    do
    {
      if ((objc_msgSend(self->_outputsCArray[v6], "discardsSampleData", a3, a4) & 1) == 0)
      {
        cf = 0;
        if (v4)
        {
          if (v6 >= self->_outputsCount - 1)
            cf = CFRetain(v4);
          else
            BWCMSampleBufferCreateCopyIncludingMetadata(v4, (CMSampleBufferRef *)&cf);
          if (self->_outputsDiscardsAttachedMedia[v6])
          {
            BWSampleBufferRemoveAllAttachedMedia(cf);
          }
          else if (-[NSMutableDictionary objectForKeyedSubscript:](self->_outputsAllowedAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6)))
          {
            BWSampleBufferFilterWithAllowedAttachedMedia(cf, (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputsAllowedAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6)));
          }
          else if (-[NSMutableDictionary objectForKeyedSubscript:](self->_outputsDisallowedAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6)))
          {
            BWSampleBufferFilterWithDisallowedAttachedMedia(cf, (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputsDisallowedAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6)));
          }
          a3 = (opaqueCMSampleBuffer *)cf;
          if (cf)
          {
            objc_msgSend(self->_outputsCArray[v6], "emitSampleBuffer:");
            if (cf)
              CFRelease(cf);
          }
        }
      }
      ++v6;
    }
    while (v6 < self->_outputsCount);
  }
}

- (BWFanOutNode)initWithFanOutCount:(int)a3 mediaType:(unsigned int)a4
{
  uint64_t v4;
  BWFanOutNode *v6;
  BWNodeInput *v7;
  BWVideoFormatRequirements *v8;
  uint64_t v9;
  uint64_t v10;
  BWNodeOutput *v11;
  BWVideoFormatRequirements *v12;
  objc_super v14;

  if (a3 < 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Negative fan count"), 0));
  v4 = *(_QWORD *)&a4;
  v14.receiver = self;
  v14.super_class = (Class)BWFanOutNode;
  v6 = -[BWNode init](&v14, sel_init);
  if (v6)
  {
    v7 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", v4, v6);
    if ((_DWORD)v4 == 1986618469)
    {
      v8 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeInput setFormatRequirements:](v7, "setFormatRequirements:", v8);

    }
    -[BWNodeInput setPassthroughMode:](v7, "setPassthroughMode:", 1);
    -[BWNode addInput:](v6, "addInput:", v7);

    v9 = a3;
    v6->_outputsCArray = (id *)malloc_type_malloc(8 * a3, 0x80040B8603338uLL);
    v6->_outputsDiscardsAttachedMedia = (BOOL *)malloc_type_malloc(a3, 0x100004077774924uLL);
    v6->_outputsAllowedAttachedMediaKeys = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a3);
    v6->_outputsCount = a3;
    if (a3)
    {
      v10 = 0;
      do
      {
        v11 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", v4, v6);
        if ((_DWORD)v4 == 1986618469)
        {
          v12 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWNodeOutput setFormatRequirements:](v11, "setFormatRequirements:", v12);

        }
        -[BWNodeOutput setPassthroughMode:](v11, "setPassthroughMode:", 1);
        -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v11, "setIndexOfInputWhichDrivesThisOutput:", 0);
        -[BWNode addOutput:](v6, "addOutput:", v11);

        v6->_outputsCArray[v10] = v11;
        v6->_outputsDiscardsAttachedMedia[v10++] = 0;
      }
      while (v9 != v10);
    }
    -[BWNode setSupportsLiveReconfiguration:](v6, "setSupportsLiveReconfiguration:", 1);
  }
  return v6;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[BWNode outputs](self, "outputs", a3, a4, 0);
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setFormat:", a3);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  uint64_t v6;

  if (self->_outputsCount >= 1)
  {
    v6 = 0;
    do
      objc_msgSend(self->_outputsCArray[v6++], "emitDroppedSample:", a3, a4);
    while (v6 < self->_outputsCount);
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  uint64_t v6;

  if (self->_outputsCount >= 1)
  {
    v6 = 0;
    do
      objc_msgSend(self->_outputsCArray[v6++], "makeConfiguredFormatLive", a3, a4, a5);
    while (v6 < self->_outputsCount);
  }
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  free(self->_outputsCArray);
  free(self->_outputsDiscardsAttachedMedia);

  v3.receiver = self;
  v3.super_class = (Class)BWFanOutNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)setDiscardsAttachedMedia:(BOOL)a3 forOutputIndex:(int)a4
{
  _BOOL4 v5;
  id v7;
  void *v8;

  v5 = a3;
  v7 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", a4);
  v8 = v7;
  if (v5 && !objc_msgSend(v7, "unspecifiedAttachedMediaConfiguration"))
    objc_msgSend(v8, "setUnspecifiedAttachedMediaConfiguration:", objc_alloc_init(BWNodeOutputMediaConfiguration));
  self->_outputsDiscardsAttachedMedia[a4] = v5;
  objc_msgSend((id)objc_msgSend(v8, "unspecifiedAttachedMediaConfiguration"), "setPassthroughMode:", !v5);
}

- (void)setAllowedAttachedMediaKeys:(id)a3 forOutputIndex:(int)a4
{
  uint64_t v4;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BWNodeOutputMediaConfiguration *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "count"))
  {
    v7 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", (int)v4);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(a3);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
          v13 = objc_alloc_init(BWNodeOutputMediaConfiguration);
          -[BWNodeOutputMediaConfiguration setPassthroughMode:](v13, "setPassthroughMode:", 1);
          objc_msgSend(v7, "setMediaConfiguration:forAttachedMediaKey:", v13, v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
    if (!objc_msgSend(v7, "unspecifiedAttachedMediaConfiguration"))
      objc_msgSend(v7, "setUnspecifiedAttachedMediaConfiguration:", objc_alloc_init(BWNodeOutputMediaConfiguration));
    objc_msgSend((id)objc_msgSend(v7, "unspecifiedAttachedMediaConfiguration"), "setPassthroughMode:", 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outputsAllowedAttachedMediaKeys, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4));
  }
}

- (void)setDisallowedAttachedMediaKeys:(id)a3 forOutputIndex:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *outputsDisallowedAttachedMediaKeys;

  v4 = *(_QWORD *)&a4;
  if (objc_msgSend(a3, "count"))
  {
    outputsDisallowedAttachedMediaKeys = self->_outputsDisallowedAttachedMediaKeys;
    if (!outputsDisallowedAttachedMediaKeys)
    {
      outputsDisallowedAttachedMediaKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_outputsDisallowedAttachedMediaKeys = outputsDisallowedAttachedMediaKeys;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](outputsDisallowedAttachedMediaKeys, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4));
  }
}

- (id)nodeSubType
{
  return CFSTR("FanOut");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  NSArray *v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  BWNodeOutputMediaProperties *v14;

  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    -[BWFanOutNode didSelectFormat:forInput:](self, "didSelectFormat:forInput:", a3, a4);
  }
  else
  {
    v9 = -[BWNode outputs](self, "outputs");
    if (-[NSArray count](v9, "count"))
    {
      v10 = 0;
      do
      {
        v11 = -[NSArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", v10);
        v12 = objc_msgSend(v11, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, objc_msgSend(a4, "index"));
        if (v12)
        {
          v13 = v12;
          if ((!objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputsAllowedAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10)), "count")|| objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputsAllowedAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10)), "containsObject:", a5))&& (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputsDisallowedAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10)), "containsObject:", a5) & 1) == 0)
          {
            v14 = (BWNodeOutputMediaProperties *)objc_msgSend(v11, "mediaPropertiesForAttachedMediaKey:", v13);
            if (!v14)
            {
              v14 = objc_alloc_init(BWNodeOutputMediaProperties);
              objc_msgSend(v11, "_setMediaProperties:forAttachedMediaKey:", v14, v13);
            }
            -[BWNodeOutputMediaProperties setResolvedFormat:](v14, "setResolvedFormat:", a3);
          }
        }
        ++v10;
      }
      while (v10 < -[NSArray count](v9, "count"));
    }
  }
}

- (BOOL)hasNonLiveConfigurationChanges
{
  return 0;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v4;

  if (self->_outputsCount >= 1)
  {
    v4 = 0;
    do
      objc_msgSend(self->_outputsCArray[v4++], "markEndOfLiveOutput", a3);
    while (v4 < self->_outputsCount);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  uint64_t v6;

  if (self->_outputsCount >= 1)
  {
    v6 = 0;
    do
      objc_msgSend(self->_outputsCArray[v6++], "emitNodeError:", a3, a4);
    while (v6 < self->_outputsCount);
  }
}

@end
