@implementation BWNodeOutput

- (void)setPixelBufferPoolProvidesBackPressure:(BOOL)a3
{
  -[BWNodeOutputMediaConfiguration setPixelBufferPoolProvidesBackPressure:](self->_primaryMediaConfiguration, "setPixelBufferPoolProvidesBackPressure:", a3);
}

- (id)mediaPropertiesForAttachedMediaKey:(id)a3
{
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot set media configuration for nil attachedMediaKey"), 0));
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PrimaryFormat")))
    return self->_primaryMediaProperties;
  else
    return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_attachedMediaProperties, "objectForKeyedSubscript:", a3);
}

- (int)_passthroughModeForAttachedMediaKey:(id)a3
{
  BWNodeOutputMediaConfiguration *primaryMediaConfiguration;

  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot get passthrough mode for nil attachedMediaKey"), 0));
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    primaryMediaConfiguration = self->_primaryMediaConfiguration;
    return -[BWNodeOutputMediaConfiguration passthroughMode](primaryMediaConfiguration, "passthroughMode");
  }
  primaryMediaConfiguration = (BWNodeOutputMediaConfiguration *)-[NSMutableDictionary objectForKeyedSubscript:](self->_attachedMediaConfigurations, "objectForKeyedSubscript:", a3);
  if (primaryMediaConfiguration)
    return -[BWNodeOutputMediaConfiguration passthroughMode](primaryMediaConfiguration, "passthroughMode");
  return -[BWNodeOutput _passthroughModeForUnspecifiedAttachedMedia](self, "_passthroughModeForUnspecifiedAttachedMedia");
}

- (id)attachedMediaKeyDrivenByInputAttachedMediaKey:(id)a3 inputIndex:(unint64_t)a4
{
  const __CFString *v7;
  _BOOL4 v8;
  const __CFString *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  int v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(-[BWNodeOutput _mediaConfigurationForPossiblyUnspecifiedAttachedMediaKey:](self, "_mediaConfigurationForPossiblyUnspecifiedAttachedMediaKey:"), "isDrivenByInputWithIndex:", a4))
  {
    v7 = CFSTR("PrimaryFormat");
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("PrimaryFormat")))
    {
      if (!-[BWNodeOutputMediaConfiguration performsAttachedMediaRemapping](self->_primaryMediaConfiguration, "performsAttachedMediaRemapping"))return (id)v7;
    }
    else if (-[NSArray containsObject:](-[BWNodeOutput specifiedAttachedMediaKeys](self, "specifiedAttachedMediaKeys"), "containsObject:", a3)&& !objc_msgSend(-[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self, "mediaConfigurationForAttachedMediaKey:", a3), "performsAttachedMediaRemapping"))
    {
      return a3;
    }
  }
  if (!-[BWNodeOutputMediaConfiguration isDrivenByInputWithIndex:](self->_primaryMediaConfiguration, "isDrivenByInputWithIndex:", a4))goto LABEL_11;
  v7 = CFSTR("PrimaryFormat");
  v8 = -[BWNodeOutputMediaConfiguration performsAttachedMediaRemapping](self->_primaryMediaConfiguration, "performsAttachedMediaRemapping");
  v9 = CFSTR("PrimaryFormat");
  if (v8)
    v9 = -[BWNodeOutputMediaConfiguration attachedMediaKeyOfInputWhichDrivesThisOutput](self->_primaryMediaConfiguration, "attachedMediaKeyOfInputWhichDrivesThisOutput", CFSTR("PrimaryFormat"));
  if ((objc_msgSend(a3, "isEqualToString:", v9) & 1) == 0)
  {
LABEL_11:
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = -[BWNodeOutput specifiedAttachedMediaKeys](self, "specifiedAttachedMediaKeys", 0);
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
LABEL_13:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v7 = *(const __CFString **)(*((_QWORD *)&v19 + 1) + 8 * v14);
        v15 = -[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self, "mediaConfigurationForAttachedMediaKey:", v7);
        if (objc_msgSend(v15, "isDrivenByInputWithIndex:", a4))
        {
          v16 = objc_msgSend(v15, "performsAttachedMediaRemapping");
          v17 = (uint64_t)v7;
          if (v16)
            v17 = objc_msgSend(v15, "attachedMediaKeyOfInputWhichDrivesThisOutput", v7);
          if ((objc_msgSend(a3, "isEqualToString:", v17) & 1) != 0)
            break;
        }
        if (v12 == ++v14)
        {
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v12)
            goto LABEL_13;
          goto LABEL_22;
        }
      }
    }
    else
    {
LABEL_22:
      if ((objc_msgSend(a3, "isEqualToString:", CFSTR("PrimaryFormat")) & 1) != 0
        || -[NSArray containsObject:](-[BWNodeOutput specifiedAttachedMediaKeys](self, "specifiedAttachedMediaKeys"), "containsObject:", a3)|| !-[BWNodeOutputMediaConfiguration isDrivenByInputWithIndex:](self->_primaryMediaConfiguration, "isDrivenByInputWithIndex:", a4))
      {
        return 0;
      }
      else if (-[BWNodeOutput _passthroughModeForUnspecifiedAttachedMedia](self, "_passthroughModeForUnspecifiedAttachedMedia"))
      {
        return a3;
      }
      else
      {
        return 0;
      }
    }
  }
  return (id)v7;
}

- (id)mediaConfigurationForAttachedMediaKey:(id)a3
{
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot set media configuration for nil attachedMediaKey"), 0));
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PrimaryFormat")))
    return self->_primaryMediaConfiguration;
  else
    return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_attachedMediaConfigurations, "objectForKeyedSubscript:", a3);
}

- (NSArray)specifiedAttachedMediaKeys
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_attachedMediaConfigurations, "allKeys");
}

- (id)_mediaConfigurationForPossiblyUnspecifiedAttachedMediaKey:(id)a3
{
  id result;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("PrimaryFormat")) & 1) != 0)
    return self->_primaryMediaConfiguration;
  result = -[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self, "mediaConfigurationForAttachedMediaKey:", a3);
  if (!result)
  {
    result = self->_unspecifiedAttachedMediaConfiguration;
    if (!result)
      return self->_primaryMediaConfiguration;
  }
  return result;
}

- (int)_passthroughModeForUnspecifiedAttachedMedia
{
  BWNodeOutputMediaConfiguration *unspecifiedAttachedMediaConfiguration;

  unspecifiedAttachedMediaConfiguration = self->_unspecifiedAttachedMediaConfiguration;
  if (unspecifiedAttachedMediaConfiguration)
    return -[BWNodeOutputMediaConfiguration passthroughMode](unspecifiedAttachedMediaConfiguration, "passthroughMode");
  else
    return 1;
}

- (BWNode)node
{
  return self->_node;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (BWNodeConnection)connection
{
  if (self->_consumerIsANodeConnection)
    return (BWNodeConnection *)self->_consumer;
  else
    return 0;
}

- (BWNodeOutput)initWithMediaType:(unsigned int)a3 node:(id)a4
{
  char *v6;
  BWNodeOutput *v7;
  uint64_t v8;
  BWNodeOutputMediaConfiguration *v9;
  BWNodeOutputMediaProperties *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BWNodeOutput;
  v6 = -[BWNodeOutput init](&v12, sel_init);
  v7 = (BWNodeOutput *)v6;
  if (v6)
  {
    *((_DWORD *)v6 + 7) = a3;
    v6[25] = a3 == 1986618469;
    v6[26] = a3 == 1885564004;
    *((_QWORD *)v6 + 5) = a4;
    v8 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v6 + 100) = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(v6 + 116) = *(_QWORD *)(v8 + 16);
    *((_QWORD *)v6 + 17) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7->_poolPreallocationMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v9 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    v7->_primaryMediaConfiguration = v9;
    -[BWNodeOutputMediaConfiguration _setAssociatedAttachedMediaKey:](v9, "_setAssociatedAttachedMediaKey:", CFSTR("PrimaryFormat"));
    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v7->_primaryMediaConfiguration, "setProvidesPixelBufferPool:", v7->_mediaTypeIsVideo);
    -[BWNodeOutputMediaConfiguration setProvidesDataBufferPool:](v7->_primaryMediaConfiguration, "setProvidesDataBufferPool:", v7->_mediaTypeIsPointCloud);
    v10 = objc_alloc_init(BWNodeOutputMediaProperties);
    -[BWNodeOutputMediaProperties _setOwningNodeOutput:associatedAttachedMediaKey:](v10, "_setOwningNodeOutput:associatedAttachedMediaKey:", v7, CFSTR("PrimaryFormat"));
    v7->_primaryMediaProperties = v10;
  }
  return v7;
}

- (void)_setMediaProperties:(id)a3 forAttachedMediaKey:(id)a4
{
  NSMutableDictionary *attachedMediaProperties;
  void *v8;
  uint64_t v9;
  const __CFString *v10;

  if (!a4)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("Cannot set media properties for nil attachedMediaKey");
    goto LABEL_12;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("Cannot set media properties for primary media");
    goto LABEL_12;
  }
  if (!a3)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("Cannot set media properties to nil -- call _clearAllMediaProperties to clear all media property state");
LABEL_12:
    objc_exception_throw((id)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0));
  }
  attachedMediaProperties = self->_attachedMediaProperties;
  if (attachedMediaProperties)
  {
    if (-[NSMutableDictionary objectForKeyedSubscript:](attachedMediaProperties, "objectForKeyedSubscript:", a4))
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = CFSTR("Can only set media properties once -- call _clearAllMediaProperties to clear all media property state");
      goto LABEL_12;
    }
  }
  else
  {
    self->_attachedMediaProperties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  objc_msgSend(a3, "_setOwningNodeOutput:associatedAttachedMediaKey:", self, a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attachedMediaProperties, "setObject:forKeyedSubscript:", a3, a4);
}

- (BWPixelBufferPool)livePixelBufferPool
{
  return -[BWNodeOutputMediaProperties livePixelBufferPool](self->_primaryMediaProperties, "livePixelBufferPool");
}

- (void)setConsumer:(id)a3
{
  if (self->_consumer != a3)
  {
    self->_consumer = (BWNodeOutputConsumer *)a3;
    objc_opt_class();
    self->_consumerIsANodeConnection = objc_opt_isKindOfClass() & 1;
  }
}

- (BWNodeOutputConsumer)consumer
{
  return self->_consumer;
}

- (void)setMemoryPool:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (void)emitSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  _BOOL4 v7;
  const __CFDictionary *v8;
  float v9;
  id v10;
  BWNodeOutputConsumer *consumer;
  uint64_t v12;
  CMTime time;
  CMTime lhs;
  CMTime rhs;
  CMTime time1;
  CMTimeValue v17;
  CMTimeScale v18;
  int64_t value;
  CMTimeScale timescale;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  value = *MEMORY[0x1E0CA2E18];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v7 = !self->_discardsSampleData;
  if (!a3)
  {
LABEL_16:
    if (!v7)
      return;
    goto LABEL_17;
  }
  if (!self->_discardsSampleData)
  {
    if (!self->_dropsSampleBuffersWithUnexpectedPTS)
      goto LABEL_9;
    CMSampleBufferGetPresentationTimeStamp(&time1, a3);
    value = time1.value;
    flags = time1.flags;
    timescale = time1.timescale;
    epoch = time1.epoch;
    CMTimeMake(&rhs, 1, 600);
    lhs = *(CMTime *)(&self->_numberOfBuffersDropped + 1);
    CMTimeAdd(&time1, &lhs, &rhs);
    v17 = time1.value;
    v18 = time1.timescale;
    if ((time1.flags & 1) == 0
      || (time1.value = v17,
          time1.timescale = v18,
          lhs.value = value,
          lhs.timescale = timescale,
          lhs.flags = flags,
          lhs.epoch = epoch,
          CMTimeCompare(&time1, &lhs) < 0))
    {
      *(_QWORD *)(&self->_numberOfBuffersDropped + 1) = value;
      HIDWORD(self->_lastValidPTS.value) = timescale;
      self->_lastValidPTS.timescale = flags;
      *(_QWORD *)&self->_lastValidPTS.flags = epoch;
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
  }
  if (!v7)
    return;
LABEL_9:
  if (self->_maxSampleDataOutputRate > 0.0)
  {
    v8 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D00], 0);
    if (v8)
      CMTimeMakeFromDictionary(&time1, v8);
    else
      CMSampleBufferGetPresentationTimeStamp(&time1, a3);
    value = time1.value;
    flags = time1.flags;
    timescale = time1.timescale;
    epoch = time1.epoch;
    if ((self->_lastEmittedPTS.timescale & 1) != 0 && (time1.flags & 1) != 0)
    {
      time1.value = value;
      time1.timescale = timescale;
      lhs = *(CMTime *)((char *)&self->_lastValidPTS.epoch + 4);
      CMTimeSubtract(&time, &time1, &lhs);
      v9 = 0.95 / CMTimeGetSeconds(&time);
      v7 = self->_maxSampleDataOutputRate >= v9;
      goto LABEL_16;
    }
  }
LABEL_17:
  v10 = +[BWNodeSampleBufferMessage newMessageWithSampleBuffer:](BWNodeSampleBufferMessage, "newMessageWithSampleBuffer:", a3);
  consumer = self->_consumer;
  if (consumer)
  {
    -[BWNodeOutputConsumer consumeMessage:fromOutput:](consumer, "consumeMessage:fromOutput:", v10, self);
    v12 = 68;
  }
  else
  {
    v12 = 72;
  }

  ++*(_DWORD *)((char *)&self->super.isa + v12);
  *(int64_t *)((char *)&self->_lastValidPTS.epoch + 4) = value;
  HIDWORD(self->_lastEmittedPTS.value) = timescale;
  self->_lastEmittedPTS.timescale = flags;
  *(_QWORD *)&self->_lastEmittedPTS.flags = epoch;
}

- (void)makeConfiguredFormatLive
{
  char v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BWNode *node;
  BWNodeRenderDelegate *v10;
  int64_t liveConfigurationID;
  BWFormat *v12;
  id v13;
  BWNodeOutputConsumer *consumer;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = -[BWFormat isEqual:](-[BWNodeOutputMediaProperties resolvedFormat](self->_primaryMediaProperties, "resolvedFormat"), "isEqual:", -[BWNodeOutputMediaProperties liveFormat](self->_primaryMediaProperties, "liveFormat"));
  -[BWNodeOutput _makeConfiguredFormatLiveForAttachedMediaKey:](self, (uint64_t)CFSTR("PrimaryFormat"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = -[BWNodeOutput resolvedAttachedMediaKeys](self, "resolvedAttachedMediaKeys", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        -[BWNodeOutput _makeConfiguredFormatLiveForAttachedMediaKey:](self, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  node = self->_node;
  self->_liveConfigurationID = self->_configurationID;
  v10 = -[BWNode renderDelegate](node, "renderDelegate");
  if (v10)
    -[BWNodeRenderDelegate node:format:didBecomeLiveForOutput:](v10, "node:format:didBecomeLiveForOutput:", self->_node, -[BWNodeOutputMediaProperties liveFormat](self->_primaryMediaProperties, "liveFormat"), self);
  liveConfigurationID = self->_liveConfigurationID;
  if ((v3 & 1) != 0)
    v12 = 0;
  else
    v12 = -[BWNodeOutputMediaProperties liveFormat](self->_primaryMediaProperties, "liveFormat");
  v13 = +[BWNodeConfigurationLiveMessage newMessageWithConfigurationID:updatedFormat:](BWNodeConfigurationLiveMessage, "newMessageWithConfigurationID:updatedFormat:", liveConfigurationID, v12);
  consumer = self->_consumer;
  if (consumer)
    -[BWNodeOutputConsumer consumeMessage:fromOutput:](consumer, "consumeMessage:fromOutput:", v13, self);

}

- (NSArray)resolvedAttachedMediaKeys
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_attachedMediaProperties, "allKeys");
}

- (void)prepareForConfiguredFormatToBecomeLive
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_mediaTypeIsVideo || self->_mediaTypeIsPointCloud)
  {
    -[BWNodeOutput _prepareForConfiguredFormatToBecomeLiveForAttachedMediaKey:]((id *)&self->super.isa, (uint64_t)CFSTR("PrimaryFormat"));
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = -[BWNodeOutput resolvedAttachedMediaKeys](self, "resolvedAttachedMediaKeys", 0);
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          -[BWNodeOutput _prepareForConfiguredFormatToBecomeLiveForAttachedMediaKey:]((id *)&self->super.isa, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }
  }
}

- (id)_prepareForConfiguredFormatToBecomeLiveForAttachedMediaKey:(id *)result
{
  id *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  BWPixelBufferPool *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  BWPixelBufferPool *v14;
  uint64_t v15;
  _QWORD v16[5];

  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(result, "mediaConfigurationForAttachedMediaKey:", a2);
    v5 = (void *)objc_msgSend(v3, "mediaPropertiesForAttachedMediaKey:", a2);
    if (objc_msgSend(v4, "providesPixelBufferPool"))
      objc_msgSend(v5, "setPreparedPixelBufferPool:", 0);
    if (objc_msgSend(v4, "providesDataBufferPool"))
      objc_msgSend(v5, "setPreparedDataBufferPool:", 0);
    result = (id *)objc_msgSend(v4, "passthroughMode");
    if (!(_DWORD)result)
    {
      result = (id *)objc_msgSend(v4, "providesPixelBufferPool");
      if ((_DWORD)result)
      {
        result = (id *)objc_msgSend(v5, "resolvedVideoFormat");
        if (result)
        {
          v6 = objc_msgSend(v5, "resolvedRetainedBufferCount");
          if (v6 <= (int)objc_msgSend(v4, "owningNodeRetainedBufferCount"))
            v7 = objc_msgSend(v4, "owningNodeRetainedBufferCount");
          else
            v7 = objc_msgSend(v5, "resolvedRetainedBufferCount");
          objc_msgSend(v5, "setPreparedPixelBufferPoolSize:", v7 + objc_msgSend(v4, "owningNodeIndefinitelyHeldBufferCount") + 1);
          v8 = [BWPixelBufferPool alloc];
          v9 = objc_msgSend(v5, "resolvedVideoFormat");
          v10 = (int)objc_msgSend(v5, "preparedPixelBufferPoolSize");
          v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), -[BWNodeOutput _poolName](v3), a2);
          v12 = v3[24];
          v13 = objc_msgSend(v4, "pixelBufferPoolProvidesBackPressure");
          LOBYTE(v15) = objc_msgSend(v4, "pixelBufferPoolReportSlowBackPressureAllocations");
          v14 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:](v8, "initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:", v9, v10, v11, 0, v12, v13, v15);
          objc_msgSend(v5, "setPreparedPixelBufferPool:", v14);
          result = (id *)objc_msgSend(v4, "owningNodeRetainedBufferCount");
          if ((int)result <= 0)
            result = (id *)objc_msgSend(v4, "owningNodeIndefinitelyHeldBufferCount");
          if (v14)
          {
            if (*((_BYTE *)v3 + 144) || (result = (id *)objc_msgSend(v3[17], "count")) != 0)
            {
              CFAbsoluteTimeGetCurrent();
              v16[0] = MEMORY[0x1E0C809B0];
              v16[1] = 3221225472;
              v16[2] = __75__BWNodeOutput__prepareForConfiguredFormatToBecomeLiveForAttachedMediaKey___block_invoke;
              v16[3] = &unk_1E491FB78;
              v16[4] = v3;
              return (id *)-[BWPixelBufferPool preallocateWithCompletionHandler:](v14, "preallocateWithCompletionHandler:", v16);
            }
          }
        }
      }
    }
  }
  return result;
}

- (_BYTE)_makeConfiguredFormatLiveForAttachedMediaKey:(_BYTE *)result
{
  _BYTE *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;

  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(result, "mediaConfigurationForAttachedMediaKey:", a2);
    v5 = (void *)objc_msgSend(v3, "mediaPropertiesForAttachedMediaKey:", a2);
    result = (_BYTE *)objc_msgSend(v5, "setLiveFormat:", objc_msgSend(v5, "resolvedFormat"));
    if (v3[25])
    {
      objc_msgSend(v5, "setLivePixelBufferPool:", objc_msgSend(v5, "preparedPixelBufferPool"));
      objc_msgSend(v5, "setPreparedPixelBufferPool:", 0);
      if (objc_msgSend(v5, "preparedPixelBufferPoolSize"))
      {
        v6 = objc_msgSend(v5, "preparedPixelBufferPoolSize");
      }
      else
      {
        v8 = objc_msgSend(v5, "resolvedRetainedBufferCount");
        if (v8 <= (int)objc_msgSend(v4, "owningNodeRetainedBufferCount"))
          v9 = objc_msgSend(v4, "owningNodeRetainedBufferCount");
        else
          v9 = objc_msgSend(v5, "resolvedRetainedBufferCount");
        v6 = (v9 + 1);
      }
      objc_msgSend(v5, "setLivePixelBufferPoolSize:", v6);
      return (_BYTE *)objc_msgSend(v5, "setPreparedPixelBufferPoolSize:", 0);
    }
    else if (v3[26])
    {
      objc_msgSend(v5, "setLiveDataBufferPool:", objc_msgSend(v5, "preparedDataBufferPool"));
      objc_msgSend(v5, "setPreparedDataBufferPool:", 0);
      if (objc_msgSend(v5, "preparedDataBufferPoolSize"))
      {
        v7 = objc_msgSend(v5, "preparedDataBufferPoolSize");
      }
      else
      {
        v10 = objc_msgSend(v5, "resolvedRetainedBufferCount");
        if (v10 <= (int)objc_msgSend(v4, "owningNodeRetainedBufferCount"))
          v11 = objc_msgSend(v4, "owningNodeRetainedBufferCount");
        else
          v11 = objc_msgSend(v5, "resolvedRetainedBufferCount");
        v7 = (v11 + 1);
      }
      objc_msgSend(v5, "setLiveDataBufferPoolSize:", v7);
      return (_BYTE *)objc_msgSend(v5, "setPreparedDataBufferPoolSize:", 0);
    }
  }
  return result;
}

- (BOOL)mediaTypeIsVideo
{
  return self->_mediaTypeIsVideo;
}

- (BWNodeOutputMediaConfiguration)primaryMediaConfiguration
{
  return self->_primaryMediaConfiguration;
}

- (void)setMediaConfiguration:(id)a3 forAttachedMediaKey:(id)a4
{
  NSMutableDictionary *attachedMediaConfigurations;
  void *v8;
  uint64_t v9;
  const __CFString *v10;

  if (!a4)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("Cannot set media configuration for nil attachedMediaKey");
    goto LABEL_10;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("Cannot set media configuration for BWAttachedMediaKey_PrimaryFormat");
LABEL_10:
    objc_exception_throw((id)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0));
  }
  attachedMediaConfigurations = self->_attachedMediaConfigurations;
  if (a3)
  {
    if (!attachedMediaConfigurations)
      self->_attachedMediaConfigurations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(a3, "_setAssociatedAttachedMediaKey:", a4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attachedMediaConfigurations, "setObject:forKeyedSubscript:", a3, a4);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](attachedMediaConfigurations, "removeObjectForKey:", a4);
  }
}

- (void)setFormatRequirements:(id)a3
{
  -[BWNodeOutputMediaConfiguration setFormatRequirements:](self->_primaryMediaConfiguration, "setFormatRequirements:", a3);
}

- (void)setPassthroughMode:(int)a3
{
  -[BWNodeOutputMediaConfiguration setPassthroughMode:](self->_primaryMediaConfiguration, "setPassthroughMode:", *(_QWORD *)&a3);
}

- (void)setIndexOfInputWhichDrivesThisOutput:(int)a3
{
  -[BWNodeOutputMediaConfiguration setIndexOfInputWhichDrivesThisOutput:](self->_primaryMediaConfiguration, "setIndexOfInputWhichDrivesThisOutput:", *(_QWORD *)&a3);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setDropsSampleBuffersWithUnexpectedPTS:(BOOL)a3
{
  self->_dropsSampleBuffersWithUnexpectedPTS = a3;
}

- (void)setProvidesPixelBufferPool:(BOOL)a3
{
  -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](self->_primaryMediaConfiguration, "setProvidesPixelBufferPool:", a3);
}

- (id)_poolName
{
  id *v1;
  NSString *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  if (result)
  {
    v1 = result;
    if (objc_msgSend(result[5], "name"))
    {
      v2 = (NSString *)objc_msgSend(v1[5], "name");
    }
    else
    {
      v3 = (objc_class *)objc_opt_class();
      v2 = NSStringFromClass(v3);
    }
    v4 = (void *)-[NSString mutableCopy](v2, "mutableCopy");
    v5 = v4;
    if (v4)
    {
      if (v1[1])
        objc_msgSend(v4, "appendFormat:", CFSTR(" output: %@"), v1[1]);
    }
    return (id *)v5;
  }
  return result;
}

- (void)setFormat:(id)a3
{
  -[BWNodeOutputMediaProperties setResolvedFormat:](self->_primaryMediaProperties, "setResolvedFormat:", a3);
}

- (void)setProvidesDataBufferPool:(BOOL)a3
{
  -[BWNodeOutputMediaConfiguration setProvidesDataBufferPool:](self->_primaryMediaConfiguration, "setProvidesDataBufferPool:", a3);
}

- (BWFormatRequirements)formatRequirements
{
  return -[BWNodeOutputMediaConfiguration formatRequirements](self->_primaryMediaConfiguration, "formatRequirements");
}

- (int)passthroughMode
{
  return -[BWNodeOutputMediaConfiguration passthroughMode](self->_primaryMediaConfiguration, "passthroughMode");
}

- (void)addPoolPreallocationCompletionHandler:(id)a3
{
  NSObject *global_queue;
  void *v6;
  _QWORD v7[6];

  pthread_mutex_lock((pthread_mutex_t *)self->_poolPreallocationMutex);
  if (!self->_receivedEOD)
  {
    if (self->_poolPreallocationDone)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __54__BWNodeOutput_addPoolPreallocationCompletionHandler___block_invoke;
      v7[3] = &unk_1E491F098;
      v7[4] = self;
      v7[5] = a3;
      dispatch_async(global_queue, v7);
    }
    else
    {
      v6 = (void *)objc_msgSend(a3, "copy");
      -[NSMutableArray addObject:](self->_poolPreallocationCompletionHandlers, "addObject:", v6);

    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_poolPreallocationMutex);
}

- (int)indexOfInputWhichDrivesThisOutput
{
  return -[BWNodeOutputMediaConfiguration indexOfInputWhichDrivesThisOutput](self->_primaryMediaConfiguration, "indexOfInputWhichDrivesThisOutput");
}

- (int)retainedBufferCount
{
  return -[BWNodeOutputMediaProperties resolvedRetainedBufferCount](self->_primaryMediaProperties, "resolvedRetainedBufferCount");
}

- (void)setConfigurationID:(int64_t)a3
{
  self->_configurationID = a3;
}

- (void)setRetainedBufferCount:(int)a3
{
  -[BWNodeOutputMediaProperties setResolvedRetainedBufferCount:](self->_primaryMediaProperties, "setResolvedRetainedBufferCount:", *(_QWORD *)&a3);
}

- (BWVideoFormat)videoFormat
{
  return -[BWNodeOutputMediaProperties resolvedVideoFormat](self->_primaryMediaProperties, "resolvedVideoFormat");
}

- (void)setUnspecifiedAttachedMediaConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (int)owningNodeRetainedBufferCount
{
  return -[BWNodeOutputMediaConfiguration owningNodeRetainedBufferCount](self->_primaryMediaConfiguration, "owningNodeRetainedBufferCount");
}

- (void)setOwningNodeRetainedBufferCount:(int)a3
{
  -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](self->_primaryMediaConfiguration, "setOwningNodeRetainedBufferCount:", *(_QWORD *)&a3);
}

- (void)setDiscardsSampleData:(BOOL)a3
{
  self->_discardsSampleData = a3;
}

- (BOOL)discardsSampleData
{
  return self->_discardsSampleData;
}

- (void)emitDroppedSample:(id)a3
{
  id v4;
  BWNodeOutputConsumer *consumer;
  id v6;

  if (!self->_discardsSampleData)
  {
    v4 = +[BWNodeDroppedSampleMessage newMessageWithDroppedSample:](BWNodeDroppedSampleMessage, "newMessageWithDroppedSample:", a3);
    consumer = self->_consumer;
    if (consumer)
    {
      v6 = v4;
      -[BWNodeOutputConsumer consumeMessage:fromOutput:](consumer, "consumeMessage:fromOutput:", v4, self);
      v4 = v6;
    }

  }
}

- (void)setNodePreparedPixelBufferPool:(id)a3
{
  -[BWNodeOutputMediaProperties setNodePreparedPixelBufferPool:](self->_primaryMediaProperties, "setNodePreparedPixelBufferPool:", a3);
}

- (BOOL)providesPixelBufferPool
{
  return -[BWNodeOutputMediaConfiguration providesPixelBufferPool](self->_primaryMediaConfiguration, "providesPixelBufferPool");
}

- (BWMemoryPool)memoryPool
{
  return self->_memoryPool;
}

- (BWPixelBufferPool)preparedPixelBufferPool
{
  return -[BWNodeOutputMediaProperties preparedPixelBufferPool](self->_primaryMediaProperties, "preparedPixelBufferPool");
}

- (BWFormat)liveFormat
{
  return -[BWNodeOutputMediaProperties liveFormat](self->_primaryMediaProperties, "liveFormat");
}

- (BWNodeOutputMediaProperties)primaryMediaProperties
{
  return self->_primaryMediaProperties;
}

- (void)setMaxSampleDataOutputRate:(float)a3
{
  self->_maxSampleDataOutputRate = a3;
}

- (BWFormat)format
{
  return -[BWNodeOutputMediaProperties resolvedFormat](self->_primaryMediaProperties, "resolvedFormat");
}

void __75__BWNodeOutput__prepareForConfiguredFormatToBecomeLiveForAttachedMediaKey___block_invoke(uint64_t a1)
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__BWNodeOutput__prepareForConfiguredFormatToBecomeLiveForAttachedMediaKey___block_invoke_2;
  block[3] = &unk_1E491E720;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)invalidate
{
  self->_node = 0;
}

- (void)dealloc
{
  objc_super v3;

  FigSimpleMutexDestroy();
  -[BWNodeOutput _clearAllMediaProperties](self, "_clearAllMediaProperties");
  v3.receiver = self;
  v3.super_class = (Class)BWNodeOutput;
  -[BWNodeOutput dealloc](&v3, sel_dealloc);
}

- (id)description
{
  NSUInteger v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;

  v3 = -[NSArray indexOfObject:](-[BWNode outputs](-[BWNodeOutput node](self, "node"), "outputs"), "indexOfObject:", self);
  if (self->_name)
    v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'  "), self->_name);
  else
    v4 = &stru_1E4928818;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p> %@('%@', idx: %u, owner: %@)"), v6, self, v4, BWStringForOSType(self->_mediaType), v3, -[BWNodeOutput node](self, "node"));
}

uint64_t __75__BWNodeOutput__prepareForConfiguredFormatToBecomeLiveForAttachedMediaKey___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 128));
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 146))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = *(void **)(v2 + 136);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i) + 16))();
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 145) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "removeAllObjects");
  return pthread_mutex_unlock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 128));
}

- (void)emitNodeError:(id)a3
{
  id v4;
  BWNodeOutputConsumer *consumer;
  id v6;

  v4 = +[BWNodeErrorMessage newMessageWithNodeError:](BWNodeErrorMessage, "newMessageWithNodeError:", a3);
  consumer = self->_consumer;
  if (consumer)
  {
    v6 = v4;
    -[BWNodeOutputConsumer consumeMessage:fromOutput:](consumer, "consumeMessage:fromOutput:", v4, self);
    v4 = v6;
  }

}

- (void)emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:(int)a3
{
  id v4;
  BWNodeOutputConsumer *consumer;
  id v6;

  v4 = +[BWNodeStillImageReferenceFrameBracketedCaptureSequenceNumberMessage newMessageWithStillImageReferenceFrameBracketedCaptureSequenceNumber:](BWNodeStillImageReferenceFrameBracketedCaptureSequenceNumberMessage, "newMessageWithStillImageReferenceFrameBracketedCaptureSequenceNumber:", *(_QWORD *)&a3);
  consumer = self->_consumer;
  if (consumer)
  {
    v6 = v4;
    -[BWNodeOutputConsumer consumeMessage:fromOutput:](consumer, "consumeMessage:fromOutput:", v4, self);
    v4 = v6;
  }

}

- (void)emitStillImagePrewarmMessageWithSettings:(id)a3
{
  id v4;
  BWNodeOutputConsumer *consumer;
  id v6;

  v4 = +[BWNodeStillImagePrewarmMessage newMessageWithStillImageSettings:](BWNodeStillImagePrewarmMessage, "newMessageWithStillImageSettings:", a3);
  consumer = self->_consumer;
  if (consumer)
  {
    v6 = v4;
    -[BWNodeOutputConsumer consumeMessage:fromOutput:](consumer, "consumeMessage:fromOutput:", v4, self);
    v4 = v6;
  }

}

- (_BYTE)_markEndOfLiveOutputForAttachedMediaKey:(_BYTE *)result
{
  _BYTE *v2;
  void *v3;

  if (result)
  {
    v2 = result;
    v3 = (void *)objc_msgSend(result, "mediaPropertiesForAttachedMediaKey:", a2);
    result = (_BYTE *)objc_msgSend(v3, "setLiveFormat:", 0);
    if (v2[25])
    {
      objc_msgSend(v3, "setLivePixelBufferPool:", 0);
      objc_msgSend(v3, "setLivePixelBufferPoolSize:", 0);
      objc_msgSend(v3, "setPreparedPixelBufferPool:", 0);
      return (_BYTE *)objc_msgSend(v3, "setPreparedPixelBufferPoolSize:", 0);
    }
    else if (v2[26])
    {
      objc_msgSend(v3, "setLiveDataBufferPool:", 0);
      objc_msgSend(v3, "setLiveDataBufferPoolSize:", 0);
      objc_msgSend(v3, "setPreparedDataBufferPool:", 0);
      return (_BYTE *)objc_msgSend(v3, "setPreparedDataBufferPoolSize:", 0);
    }
  }
  return result;
}

- (void)markEndOfLiveOutput
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BWNodeRenderDelegate *v8;
  id v9;
  BWNodeOutputConsumer *consumer;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)self->_poolPreallocationMutex);
  self->_receivedEOD = 1;
  -[NSMutableArray removeAllObjects](self->_poolPreallocationCompletionHandlers, "removeAllObjects");
  pthread_mutex_unlock((pthread_mutex_t *)self->_poolPreallocationMutex);
  -[BWNodeOutput _markEndOfLiveOutputForAttachedMediaKey:](self, (uint64_t)CFSTR("PrimaryFormat"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[BWNodeOutput resolvedAttachedMediaKeys](self, "resolvedAttachedMediaKeys", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        -[BWNodeOutput _markEndOfLiveOutputForAttachedMediaKey:](self, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  v8 = -[BWNode renderDelegate](self->_node, "renderDelegate");
  if (v8)
    -[BWNodeRenderDelegate node:format:didBecomeLiveForOutput:](v8, "node:format:didBecomeLiveForOutput:", self->_node, 0, self);
  v9 = +[BWNodeEndOfDataMessage newMessage](BWNodeEndOfDataMessage, "newMessage");
  consumer = self->_consumer;
  if (consumer)
    -[BWNodeOutputConsumer consumeMessage:fromOutput:](consumer, "consumeMessage:fromOutput:", v9, self);

}

- (void)suspendResources
{
  id v3;
  BWNodeOutputConsumer *consumer;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = +[BWNodeSuspendResourcesMessage newMessage](BWNodeSuspendResourcesMessage, "newMessage");
  consumer = self->_consumer;
  if (consumer)
    -[BWNodeOutputConsumer consumeMessage:fromOutput:](consumer, "consumeMessage:fromOutput:", v3, self);

  -[BWPixelBufferPool flushToMinimumCapacity:](-[BWNodeOutputMediaProperties livePixelBufferPool](self->_primaryMediaProperties, "livePixelBufferPool"), "flushToMinimumCapacity:", 0);
  -[BWDataBufferPool flushToMinimumCapacity:](-[BWNodeOutputMediaProperties liveDataBufferPool](self->_primaryMediaProperties, "liveDataBufferPool"), "flushToMinimumCapacity:", 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)-[NSMutableDictionary allValues](self->_attachedMediaProperties, "allValues", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v10, "livePixelBufferPool"), "flushToMinimumCapacity:", 0);
        objc_msgSend((id)objc_msgSend(v10, "liveDataBufferPool"), "flushToMinimumCapacity:", 0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
}

uint64_t __54__BWNodeOutput_addPoolPreallocationCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 128));
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 146))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v2 = *(_QWORD *)(a1 + 32);
  }
  return pthread_mutex_unlock(*(pthread_mutex_t **)(v2 + 128));
}

- (void)_clearAllMediaProperties
{

  self->_primaryMediaProperties = 0;
  self->_attachedMediaProperties = 0;
}

- (id)_mediaConfigurationForBufferCountOfPossiblyUnspecifiedAttachedMediaKey:(id)a3
{
  id result;

  result = -[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self, "mediaConfigurationForAttachedMediaKey:", a3);
  if (!result)
    return self->_primaryMediaConfiguration;
  return result;
}

- (id)_mediaPropertiesForPossiblyUnspecifiedAttachedMediaKey:(id)a3
{
  id result;

  result = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self, "mediaPropertiesForAttachedMediaKey:", a3);
  if (!result)
    return self->_primaryMediaProperties;
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)mediaTypeIsPointCloud
{
  return self->_mediaTypeIsPointCloud;
}

- (int64_t)configurationID
{
  return self->_configurationID;
}

- (BWNodeOutputMediaConfiguration)unspecifiedAttachedMediaConfiguration
{
  return self->_unspecifiedAttachedMediaConfiguration;
}

- (float)maxSampleDataOutputRate
{
  return self->_maxSampleDataOutputRate;
}

- (BOOL)dropsSampleBuffersWithUnexpectedPTS
{
  return self->_dropsSampleBuffersWithUnexpectedPTS;
}

- (int64_t)liveConfigurationID
{
  return self->_liveConfigurationID;
}

- (BOOL)poolPreallocationEnabled
{
  return self->_poolPreallocationEnabled;
}

- (void)setPoolPreallocationEnabled:(BOOL)a3
{
  self->_poolPreallocationEnabled = a3;
}

- (unsigned)numberOfBuffersEmitted
{
  return self->_numberOfBuffersEmitted;
}

- (unsigned)numberOfBuffersDropped
{
  return self->_numberOfBuffersDropped;
}

- (void)setPreparedSharedPixelBufferPool:(id)a3
{
  -[BWNodeOutputMediaProperties setPreparedSharedPixelBufferPool:](self->_primaryMediaProperties, "setPreparedSharedPixelBufferPool:", a3);
}

- (BOOL)providesDataBufferPool
{
  return -[BWNodeOutputMediaConfiguration providesDataBufferPool](self->_primaryMediaConfiguration, "providesDataBufferPool");
}

- (void)setNodePreparedDataBufferPool:(id)a3
{
  -[BWNodeOutputMediaProperties setNodePreparedDataBufferPool:](self->_primaryMediaProperties, "setNodePreparedDataBufferPool:", a3);
}

- (BWDataBufferPool)preparedDataBufferPool
{
  return -[BWNodeOutputMediaProperties preparedDataBufferPool](self->_primaryMediaProperties, "preparedDataBufferPool");
}

- (void)setPreparedSharedDataBufferPool:(id)a3
{
  -[BWNodeOutputMediaProperties setPreparedSharedDataBufferPool:](self->_primaryMediaProperties, "setPreparedSharedDataBufferPool:", a3);
}

- (BOOL)pixelBufferPoolProvidesBackPressure
{
  return -[BWNodeOutputMediaConfiguration pixelBufferPoolProvidesBackPressure](self->_primaryMediaConfiguration, "pixelBufferPoolProvidesBackPressure");
}

- (void)setPixelBufferPoolReportSlowBackPressureAllocations:(BOOL)a3
{
  -[BWNodeOutputMediaConfiguration setPixelBufferPoolReportSlowBackPressureAllocations:](self->_primaryMediaConfiguration, "setPixelBufferPoolReportSlowBackPressureAllocations:", a3);
}

- (BOOL)pixelBufferPoolReportSlowBackPressureAllocations
{
  return -[BWNodeOutputMediaConfiguration pixelBufferPoolReportSlowBackPressureAllocations](self->_primaryMediaConfiguration, "pixelBufferPoolReportSlowBackPressureAllocations");
}

- (BWPointCloudFormat)pointCloudFormat
{
  return -[BWNodeOutputMediaProperties resolvedPointCloudFormat](self->_primaryMediaProperties, "resolvedPointCloudFormat");
}

- (BWDataBufferPool)liveDataBufferPool
{
  return -[BWNodeOutputMediaProperties liveDataBufferPool](self->_primaryMediaProperties, "liveDataBufferPool");
}

@end
