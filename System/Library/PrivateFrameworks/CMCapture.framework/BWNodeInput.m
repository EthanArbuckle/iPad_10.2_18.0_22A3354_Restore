@implementation BWNodeInput

- (unint64_t)index
{
  return self->_index;
}

- (int)_passthroughModeForAttachedMediaKey:(id)a3
{
  BWNodeInputMediaConfiguration *primaryMediaConfiguration;

  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot get passthrough mode for nil attachedMediaKey"), 0));
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    primaryMediaConfiguration = self->_primaryMediaConfiguration;
    return -[BWNodeInputMediaConfiguration passthroughMode](primaryMediaConfiguration, "passthroughMode");
  }
  primaryMediaConfiguration = (BWNodeInputMediaConfiguration *)-[NSMutableDictionary objectForKeyedSubscript:](self->_attachedMediaConfigurations, "objectForKeyedSubscript:", a3);
  if (primaryMediaConfiguration)
    return -[BWNodeInputMediaConfiguration passthroughMode](primaryMediaConfiguration, "passthroughMode");
  return -[BWNodeInput _passthroughModeForUnspecifiedAttachedMedia](self, "_passthroughModeForUnspecifiedAttachedMedia");
}

- (int)_passthroughModeForUnspecifiedAttachedMedia
{
  BWNodeInputMediaConfiguration *unspecifiedAttachedMediaConfiguration;

  unspecifiedAttachedMediaConfiguration = self->_unspecifiedAttachedMediaConfiguration;
  if (unspecifiedAttachedMediaConfiguration)
    return -[BWNodeInputMediaConfiguration passthroughMode](unspecifiedAttachedMediaConfiguration, "passthroughMode");
  else
    return 1;
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

- (BWNode)node
{
  return self->_node;
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

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (NSArray)specifiedAttachedMediaKeys
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_attachedMediaConfigurations, "allKeys");
}

- (BWNodeConnection)connection
{
  return self->_connection;
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
  objc_msgSend(a3, "_setOwningNodeInput:associatedAttachedMediaKey:", self, a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attachedMediaProperties, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)setFormat:(id)a3
{
  -[BWNodeInputMediaProperties setResolvedFormat:](self->_primaryMediaProperties, "setResolvedFormat:", a3);
}

- (void)setConnection:(id)a3
{
  self->_connection = (BWNodeConnection *)a3;
}

- (void)handleMessage:(id)a3
{
  int v5;
  int v6;
  opaqueCMSampleBuffer *v7;
  opaqueCMSampleBuffer *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = *((_DWORD *)a3 + 2);
  v6 = *((_DWORD *)a3 + 3);
  if (v5 == 1)
  {
    if (v6 == 4)
    {
      -[BWNodeInputMediaProperties setLiveFormat:](-[BWNodeInput primaryMediaProperties](self, "primaryMediaProperties"), "setLiveFormat:", 0);
    }
    else if (v6 == 3)
    {
      -[BWNodeInput _handleConfigurationLiveMessage:]((uint64_t)self, a3);
    }
    goto LABEL_15;
  }
  if (v5 != 2)
  {
LABEL_15:
    -[BWNode _handleMessage:fromInput:](self->_node, "_handleMessage:fromInput:", a3, self);
    return;
  }
  if (self->_enabled)
  {
    if (!self->_discardsSampleDataTaggedToBeDropped
      || v6 != 1
      || (v7 = (opaqueCMSampleBuffer *)objc_msgSend(a3, "sampleBuffer")) == 0
      || (v8 = v7, CMSampleBufferGetImageBuffer(v7))
      || CMSampleBufferGetDataBuffer(v8)
      || CMGetAttachment(v8, CFSTR("SampleDataToBeDropped"), 0) != (CFTypeRef)*MEMORY[0x1E0C9AE50])
    {
      ++self->_numberOfBuffersReceived;
      goto LABEL_15;
    }
    v9 = (void *)CMGetAttachment(v8, CFSTR("SampleDataToBeDroppedEmitSampleBufferSemaphores"), 0);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }
  }
  ++self->_numberOfBuffersDropped;
}

- (BWFormat)liveFormat
{
  return -[BWNodeInputMediaProperties liveFormat](self->_primaryMediaProperties, "liveFormat");
}

- (BOOL)mediaTypeIsVideo
{
  return self->_mediaTypeIsVideo;
}

- (uint64_t)_handleConfigurationLiveMessage:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(a2, "updatedFormat");
    if (v4)
    {
      v5 = (void *)v4;
      if (objc_msgSend((id)objc_msgSend((id)v3, "primaryMediaProperties"), "liveFormat"))
      {
        result = objc_msgSend(v5, "isEqual:", objc_msgSend((id)objc_msgSend((id)v3, "primaryMediaProperties"), "liveFormat"));
        if ((result & 1) != 0)
          return result;
      }
      if (*(_DWORD *)(v3 + 32) == 1936684398)
        objc_msgSend((id)v3, "setFormat:", v5);
      else
        objc_msgSend(v5, "isEqual:", objc_msgSend((id)v3, "format"));
      objc_msgSend((id)objc_msgSend((id)v3, "primaryMediaProperties"), "setLiveFormat:", v5);
    }
    *(_QWORD *)(v3 + 72) = objc_msgSend(a2, "configurationID");
    return objc_msgSend(*(id *)(v3 + 112), "liveFormat");
  }
  return result;
}

- (BWFormat)format
{
  return -[BWNodeInputMediaProperties resolvedFormat](self->_primaryMediaProperties, "resolvedFormat");
}

- (BWNodeInputMediaProperties)primaryMediaProperties
{
  return self->_primaryMediaProperties;
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

- (BWNodeInput)initWithMediaType:(unsigned int)a3 node:(id)a4 index:(unint64_t)a5
{
  BWNodeInput *v8;
  BWNodeInput *v9;
  BWNodeInputMediaConfiguration *v10;
  BWNodeInputMediaProperties *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BWNodeInput;
  v8 = -[BWNodeInput init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_mediaType = a3;
    v8->_mediaTypeIsVideo = a3 == 1986618469;
    v8->_mediaTypeIsPointCloud = a3 == 1885564004;
    v8->_node = (BWNode *)a4;
    v8->_enabled = 1;
    v8->_index = a5;
    v10 = objc_alloc_init(BWNodeInputMediaConfiguration);
    v9->_primaryMediaConfiguration = v10;
    -[BWNodeInputMediaConfiguration _setAssociatedAttachedMediaKey:](v10, "_setAssociatedAttachedMediaKey:", CFSTR("PrimaryFormat"));
    v11 = objc_alloc_init(BWNodeInputMediaProperties);
    -[BWNodeInputMediaProperties _setOwningNodeInput:associatedAttachedMediaKey:](v11, "_setOwningNodeInput:associatedAttachedMediaKey:", v9, CFSTR("PrimaryFormat"));
    v9->_primaryMediaProperties = v11;
  }
  return v9;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setRetainedBufferCount:(int)a3
{
  -[BWNodeInputMediaConfiguration setRetainedBufferCount:](self->_primaryMediaConfiguration, "setRetainedBufferCount:", *(_QWORD *)&a3);
}

- (void)setFormatRequirements:(id)a3
{
  -[BWNodeInputMediaConfiguration setFormatRequirements:](self->_primaryMediaConfiguration, "setFormatRequirements:", a3);
}

- (void)setPassthroughMode:(int)a3
{
  -[BWNodeInputMediaConfiguration setPassthroughMode:](self->_primaryMediaConfiguration, "setPassthroughMode:", *(_QWORD *)&a3);
}

- (BWNodeInput)initWithMediaType:(unsigned int)a3 node:(id)a4
{
  return -[BWNodeInput initWithMediaType:node:index:](self, "initWithMediaType:node:index:", *(_QWORD *)&a3, a4, 0);
}

- (BWNodeInputMediaConfiguration)primaryMediaConfiguration
{
  return self->_primaryMediaConfiguration;
}

- (void)setUnspecifiedAttachedMediaConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (void)setIndefinitelyHeldBufferCount:(int)a3
{
  -[BWNodeInputMediaConfiguration setIndefinitelyHeldBufferCount:](self->_primaryMediaConfiguration, "setIndefinitelyHeldBufferCount:", *(_QWORD *)&a3);
}

- (BWVideoFormat)videoFormat
{
  return -[BWNodeInputMediaProperties resolvedVideoFormat](self->_primaryMediaProperties, "resolvedVideoFormat");
}

- (void)setConfigurationID:(int64_t)a3
{
  self->_configurationID = a3;
}

- (void)setDelayedBufferCount:(int)a3
{
  -[BWNodeInputMediaConfiguration setDelayedBufferCount:](self->_primaryMediaConfiguration, "setDelayedBufferCount:", *(_QWORD *)&a3);
}

- (BWFormatRequirements)formatRequirements
{
  return -[BWNodeInputMediaConfiguration formatRequirements](self->_primaryMediaConfiguration, "formatRequirements");
}

- (void)setDiscardsSampleDataTaggedToBeDropped:(BOOL)a3
{
  self->_discardsSampleDataTaggedToBeDropped = a3;
}

- (int)passthroughMode
{
  return -[BWNodeInputMediaConfiguration passthroughMode](self->_primaryMediaConfiguration, "passthroughMode");
}

- (void)setConversionToPassthroughModeNeverAllowed:(BOOL)a3
{
  -[BWNodeInputMediaConfiguration setConversionToPassthroughModeNeverAllowed:](self->_primaryMediaConfiguration, "setConversionToPassthroughModeNeverAllowed:", a3);
}

- (NSArray)resolvedAttachedMediaKeys
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_attachedMediaProperties, "allKeys");
}

+ (void)initialize
{
  objc_opt_class();
}

+ (opaqueCMSampleBuffer)newSampleDataToBeDroppedMarkerBufferFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CFTypeRef v4;
  const void *v5;
  const opaqueCMFormatDescription *FormatDescription;
  __int128 v7;
  __int128 v8;
  OSStatus v9;
  opaqueCMSampleBuffer *result;
  CFTypeRef v11;
  CMSampleTimingInfo sampleTimingArray;
  CMSampleBufferRef v13;

  v13 = 0;
  v4 = CMGetAttachment(a3, CFSTR("SampleDataToBeDropped"), 0);
  if (v4 == (CFTypeRef)*MEMORY[0x1E0C9AE50])
  {
    v5 = v4;
    FormatDescription = CMSampleBufferGetFormatDescription(a3);
    v7 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
    *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v7;
    sampleTimingArray.decodeTimeStamp.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
    v8 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
    *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E90];
    *(_OWORD *)&sampleTimingArray.duration.epoch = v8;
    CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.presentationTimeStamp, a3);
    v9 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, FormatDescription, 1, 1, &sampleTimingArray, 0, 0, &v13);
    result = v13;
    if (!v9 && v13)
    {
      CMSetAttachment(v13, CFSTR("SampleDataToBeDropped"), v5, 1u);
      v11 = CMGetAttachment(a3, CFSTR("SampleDataToBeDroppedEmitSampleBufferSemaphores"), 0);
      result = v13;
      if (v11)
      {
        CMSetAttachment(v13, CFSTR("SampleDataToBeDroppedEmitSampleBufferSemaphores"), v11, 1u);
        return v13;
      }
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return result;
}

- (void)invalidate
{
  self->_node = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[BWNodeInput _clearAllMediaProperties](self, "_clearAllMediaProperties");
  v3.receiver = self;
  v3.super_class = (Class)BWNodeInput;
  -[BWNodeInput dealloc](&v3, sel_dealloc);
}

- (id)description
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;

  v3 = -[NSArray indexOfObject:](-[BWNode inputs](-[BWNodeInput node](self, "node"), "inputs"), "indexOfObject:", self);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p> '%@' (idx: %u, owner: %@)"), v5, self, BWStringForOSType(self->_mediaType), v3, -[BWNodeInput node](self, "node"));
}

- (void)_clearAllMediaProperties
{

  self->_primaryMediaProperties = 0;
  self->_attachedMediaProperties = 0;
}

- (id)mediaPropertiesByAttachedMediaKey
{
  return (id)-[NSMutableDictionary copy](self->_attachedMediaProperties, "copy");
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)mediaTypeIsPointCloud
{
  return self->_mediaTypeIsPointCloud;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)discardsSampleDataTaggedToBeDropped
{
  return self->_discardsSampleDataTaggedToBeDropped;
}

- (int64_t)configurationID
{
  return self->_configurationID;
}

- (BWNodeInputMediaConfiguration)unspecifiedAttachedMediaConfiguration
{
  return self->_unspecifiedAttachedMediaConfiguration;
}

- (int64_t)liveConfigurationID
{
  return self->_liveConfigurationID;
}

- (unsigned)numberOfBuffersReceived
{
  return self->_numberOfBuffersReceived;
}

- (unsigned)numberOfBuffersDropped
{
  return self->_numberOfBuffersDropped;
}

- (BOOL)conversionToPassthroughModeNeverAllowed
{
  return -[BWNodeInputMediaConfiguration conversionToPassthroughModeNeverAllowed](self->_primaryMediaConfiguration, "conversionToPassthroughModeNeverAllowed");
}

- (int)retainedBufferCount
{
  return -[BWNodeInputMediaConfiguration retainedBufferCount](self->_primaryMediaConfiguration, "retainedBufferCount");
}

- (int)delayedBufferCount
{
  return -[BWNodeInputMediaConfiguration delayedBufferCount](self->_primaryMediaConfiguration, "delayedBufferCount");
}

- (int)indefinitelyHeldBufferCount
{
  return -[BWNodeInputMediaConfiguration indefinitelyHeldBufferCount](self->_primaryMediaConfiguration, "indefinitelyHeldBufferCount");
}

@end
