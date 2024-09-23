@implementation BWNodeOutputMediaProperties

- (void)setResolvedFormat:(id)a3
{
  BWFormat *resolvedFormat;

  resolvedFormat = self->_resolvedFormat;
  if (resolvedFormat != a3)
  {

    self->_resolvedFormat = (BWFormat *)a3;
    -[BWNode didSelectFormat:forOutput:forAttachedMediaKey:](-[BWNodeOutput node](self->_owningNodeOutput, "node"), "didSelectFormat:forOutput:forAttachedMediaKey:", a3, self->_owningNodeOutput, self->_associatedAttachedMediaKey);
  }
}

- (BWFormat)resolvedFormat
{
  return self->_resolvedFormat;
}

- (void)_setOwningNodeOutput:(id)a3 associatedAttachedMediaKey:(id)a4
{
  void *v4;
  uint64_t v5;
  const __CFString *v6;

  if (!a3)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99750];
    v6 = CFSTR("Owning BWNodeOutput must not be nil");
    goto LABEL_8;
  }
  if (self->_owningNodeOutput)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99750];
    v6 = CFSTR("Can only be owned by one BWNodeOutput");
    goto LABEL_8;
  }
  if (!a4)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    v6 = CFSTR("Associated attached media key must not be nil");
LABEL_8:
    objc_exception_throw((id)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0));
  }
  self->_owningNodeOutput = (BWNodeOutput *)a3;
  self->_associatedAttachedMediaKey = (NSString *)objc_msgSend(a4, "copy");
}

- (BWFormat)liveFormat
{
  return self->_liveFormat;
}

- (void)setPreparedPixelBufferPoolSize:(int)a3
{
  self->_preparedPixelBufferPoolSize = a3;
}

- (int)resolvedRetainedBufferCount
{
  return self->_resolvedRetainedBufferCount;
}

- (void)setPreparedPixelBufferPool:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (int)preparedPixelBufferPoolSize
{
  return self->_preparedPixelBufferPoolSize;
}

- (BWPixelBufferPool)preparedPixelBufferPool
{
  return self->_preparedPixelBufferPool;
}

- (void)setLiveFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setLivePixelBufferPoolSize:(int)a3
{
  self->_livePixelBufferPoolSize = a3;
}

- (void)setLivePixelBufferPool:(id)a3
{

  self->_livePixelBufferPool = (BWPixelBufferPool *)a3;
}

- (BWVideoFormat)resolvedVideoFormat
{
  if (-[BWNodeOutput mediaTypeIsVideo](self->_owningNodeOutput, "mediaTypeIsVideo"))
    return (BWVideoFormat *)self->_resolvedFormat;
  else
    return 0;
}

- (void)setResolvedRetainedBufferCount:(int)a3
{
  self->_resolvedRetainedBufferCount = a3;
}

- (BWPixelBufferPool)livePixelBufferPool
{
  if (objc_msgSend(-[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->_owningNodeOutput, "mediaConfigurationForAttachedMediaKey:", self->_associatedAttachedMediaKey), "providesPixelBufferPool")&& !self->_livePixelBufferPool&& !-[BWNodeOutput _passthroughModeForAttachedMediaKey:](self->_owningNodeOutput, "_passthroughModeForAttachedMediaKey:", self->_associatedAttachedMediaKey)&& self->_liveFormat&& -[BWNodeOutput mediaTypeIsVideo](self->_owningNodeOutput, "mediaTypeIsVideo"))
  {
    self->_livePixelBufferPool = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", self->_liveFormat, self->_livePixelBufferPoolSize, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ attached media key: %@"), -[BWNodeOutput _poolName]((id *)&self->_owningNodeOutput->super.isa), self->_associatedAttachedMediaKey), -[BWNodeOutput memoryPool](self->_owningNodeOutput, "memoryPool"));
  }
  return self->_livePixelBufferPool;
}

- (void)setNodePreparedPixelBufferPool:(id)a3
{
  void *v5;
  uint64_t v6;
  const __CFString *v7;

  if (!-[BWNodeOutput mediaTypeIsVideo](self->_owningNodeOutput, "mediaTypeIsVideo"))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Can only be called for video media type");
    goto LABEL_10;
  }
  if (objc_msgSend(-[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->_owningNodeOutput, "mediaConfigurationForAttachedMediaKey:", self->_associatedAttachedMediaKey), "providesPixelBufferPool"))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Can only be called when providesPixelBufferPool = NO");
    goto LABEL_10;
  }
  if (self->_preparedPixelBufferPool)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Already have prepared pixel buffer pool");
    goto LABEL_10;
  }
  if (!a3)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Pool must not be nil");
LABEL_10:
    objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0));
  }
  self->_preparedPixelBufferPool = (BWPixelBufferPool *)a3;
}

- (void)setPreparedSharedPixelBufferPool:(id)a3
{
  void *v5;
  uint64_t v6;
  const __CFString *v7;

  if (!-[BWNodeOutput mediaTypeIsVideo](self->_owningNodeOutput, "mediaTypeIsVideo"))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Can only be called for video media type");
    goto LABEL_12;
  }
  if ((objc_msgSend(-[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->_owningNodeOutput, "mediaConfigurationForAttachedMediaKey:", self->_associatedAttachedMediaKey), "providesPixelBufferPool") & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Shared pools are not supported for providesPixelBufferPool = NO");
    goto LABEL_12;
  }
  if (-[BWNodeOutput _passthroughModeForAttachedMediaKey:](self->_owningNodeOutput, "_passthroughModeForAttachedMediaKey:", self->_associatedAttachedMediaKey) != 2)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Only outputs where passthroughMode = BWNodeOutputPassthroughModeConditional have shared pools");
    goto LABEL_12;
  }
  if (self->_preparedPixelBufferPool)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Already have prepared pixel buffer pool");
    goto LABEL_12;
  }
  if (!a3)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Shared pool must not be nil");
LABEL_12:
    objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0));
  }
  self->_preparedPixelBufferPool = (BWPixelBufferPool *)a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNodeOutputMediaProperties;
  -[BWNodeOutputMediaProperties dealloc](&v3, sel_dealloc);
}

- (BWPointCloudFormat)resolvedPointCloudFormat
{
  if (-[BWNodeOutput mediaTypeIsPointCloud](self->_owningNodeOutput, "mediaTypeIsPointCloud"))
    return (BWPointCloudFormat *)self->_resolvedFormat;
  else
    return 0;
}

- (void)setNodePreparedDataBufferPool:(id)a3
{
  void *v5;
  uint64_t v6;
  const __CFString *v7;

  if (!-[BWNodeOutput mediaTypeIsPointCloud](self->_owningNodeOutput, "mediaTypeIsPointCloud"))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Can only be called for point cloud media type");
    goto LABEL_10;
  }
  if (objc_msgSend(-[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->_owningNodeOutput, "mediaConfigurationForAttachedMediaKey:", self->_associatedAttachedMediaKey), "providesDataBufferPool"))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Can only be called when providesDataBufferPool = NO");
    goto LABEL_10;
  }
  if (self->_preparedDataBufferPool)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Already have prepared data buffer pool");
    goto LABEL_10;
  }
  if (!a3)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Pool must not be nil");
LABEL_10:
    objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0));
  }
  self->_preparedDataBufferPool = (BWDataBufferPool *)a3;
}

- (void)setPreparedSharedDataBufferPool:(id)a3
{
  void *v5;
  uint64_t v6;
  const __CFString *v7;

  if (!-[BWNodeOutput mediaTypeIsPointCloud](self->_owningNodeOutput, "mediaTypeIsPointCloud"))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Can only be called for point cloud media type");
    goto LABEL_12;
  }
  if ((objc_msgSend(-[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->_owningNodeOutput, "mediaConfigurationForAttachedMediaKey:", self->_associatedAttachedMediaKey), "providesDataBufferPool") & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Shared pools are not supported for providesDataBufferPool = NO");
    goto LABEL_12;
  }
  if (-[BWNodeOutput _passthroughModeForAttachedMediaKey:](self->_owningNodeOutput, "_passthroughModeForAttachedMediaKey:", self->_associatedAttachedMediaKey) != 2)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Only outputs where passthroughMode = BWNodeOutputPassthroughModeConditional have shared pools");
    goto LABEL_12;
  }
  if (self->_preparedDataBufferPool)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Already have prepared data buffer pool");
    goto LABEL_12;
  }
  if (!a3)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = CFSTR("Shared pool must not be nil");
LABEL_12:
    objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0));
  }
  self->_preparedDataBufferPool = (BWDataBufferPool *)a3;
}

- (BWVideoFormat)liveVideoFormat
{
  if (-[BWNodeOutput mediaTypeIsVideo](self->_owningNodeOutput, "mediaTypeIsVideo"))
    return (BWVideoFormat *)self->_liveFormat;
  else
    return 0;
}

- (void)setLiveDataBufferPool:(id)a3
{

  self->_liveDataBufferPool = (BWDataBufferPool *)a3;
}

- (BWDataBufferPool)liveDataBufferPool
{
  if (objc_msgSend(-[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->_owningNodeOutput, "mediaConfigurationForAttachedMediaKey:", self->_associatedAttachedMediaKey), "providesDataBufferPool")&& !self->_liveDataBufferPool&& !-[BWNodeOutput _passthroughModeForAttachedMediaKey:](self->_owningNodeOutput, "_passthroughModeForAttachedMediaKey:", self->_associatedAttachedMediaKey)&& self->_liveFormat&& -[BWNodeOutput mediaTypeIsPointCloud](self->_owningNodeOutput, "mediaTypeIsPointCloud"))
  {
    self->_liveDataBufferPool = -[BWDataBufferPool initWithFormat:capacity:name:clientProvidesPool:]([BWDataBufferPool alloc], "initWithFormat:capacity:name:clientProvidesPool:", self->_liveFormat, self->_liveDataBufferPoolSize, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ attached media key: %@"), -[BWNodeOutput _poolName]((id *)&self->_owningNodeOutput->super.isa), self->_associatedAttachedMediaKey), 0);
  }
  return self->_liveDataBufferPool;
}

- (BWDataBufferPool)preparedDataBufferPool
{
  return self->_preparedDataBufferPool;
}

- (void)setPreparedDataBufferPool:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (int)preparedDataBufferPoolSize
{
  return self->_preparedDataBufferPoolSize;
}

- (void)setPreparedDataBufferPoolSize:(int)a3
{
  self->_preparedDataBufferPoolSize = a3;
}

- (int)livePixelBufferPoolSize
{
  return self->_livePixelBufferPoolSize;
}

- (int)liveDataBufferPoolSize
{
  return self->_liveDataBufferPoolSize;
}

- (void)setLiveDataBufferPoolSize:(int)a3
{
  self->_liveDataBufferPoolSize = a3;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

@end
