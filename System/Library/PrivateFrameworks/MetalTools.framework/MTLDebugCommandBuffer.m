@implementation MTLDebugCommandBuffer

- (void)dealloc
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  objc_super v7;
  _OWORD __src[28];

  if (-[MTLToolsCommandBuffer status](self, "status") - 1 <= 2)
    MTLReportFailure();
  std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);

  v3 = 0;
  self->_renderTargetAttachments = 0;
  memset(__src, 0, sizeof(__src));
  do
  {
    v4 = (char *)__src + v3;
    *((_OWORD *)v4 + 1) = 0uLL;
    *((_OWORD *)v4 + 2) = 0uLL;
    *(_OWORD *)v4 = 0uLL;
    *((_QWORD *)v4 + 6) = 4;
    v3 += 56;
  }
  while (v3 != 448);
  memcpy(&self->_prevAttachments, __src, sizeof(self->_prevAttachments));
  v5 = 0;
  memset(__src, 0, sizeof(__src));
  do
  {
    v6 = (char *)__src + v5;
    *((_OWORD *)v6 + 1) = 0uLL;
    *((_OWORD *)v6 + 2) = 0uLL;
    *(_OWORD *)v6 = 0uLL;
    *((_QWORD *)v6 + 6) = 4;
    v5 += 56;
  }
  while (v5 != 448);
  memcpy(&self->_currAttachments, __src, sizeof(self->_currAttachments));

  v7.receiver = self;
  v7.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer dealloc](&v7, sel_dealloc);
}

- (MTLDebugCommandBuffer)initWithCommandBuffer:(id)a3 commandQueue:(id)a4 descriptor:(id)a5
{
  MTLDebugCommandBuffer *v5;
  MTLDebugCommandBuffer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLDebugCommandBuffer;
  v5 = -[MTLToolsCommandBuffer initWithCommandBuffer:parent:descriptor:](&v8, sel_initWithCommandBuffer_parent_descriptor_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v5->_currentEncoder = 0;
    v5->_purgeableObjectsLock._os_unfair_lock_opaque = 0;
    v5->_retainedObjectsLock._os_unfair_lock_opaque = 0;
    v5->_renderTargetAttachmentLock._os_unfair_lock_opaque = 0;
    v5->_renderTargetAttachments = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    pthread_once(&initLifetimeOptions(void)::token, (void (*)(void))initLifetimeOptions(void)::$_0::__invoke);
    if (checkLifetimeOfExternallyReferencedObjects | checkLifetimeOfInternallyReferencedObjects)
      objc_msgSend(*(id *)&v6->MTLToolsCommandBuffer_opaque[24], "addReferenceTrackingCommandBuffer:", v6);
  }
  return v6;
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
  uint64_t v7;
  MTLDevice *v8;
  objc_super v9;

  v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    v8 = (MTLDevice *)objc_msgSend(a3, "device");
    if (v8 != -[MTLToolsObject device](self, "device"))
      MTLReportFailure();
  }
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self, "addObject:retained:purgeable:", a3, 1, 0);
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer encodeWaitForEvent:value:](&v9, sel_encodeWaitForEvent_value_, a3, a4);
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v9;
  MTLDevice *v10;
  objc_super v11;

  v5 = *(_QWORD *)&a5;
  v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    v10 = (MTLDevice *)objc_msgSend(a3, "device");
    if (v10 != -[MTLToolsObject device](self, "device"))
      MTLReportFailure();
  }
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self, "addObject:retained:purgeable:", a3, 1, 0);
  v11.receiver = self;
  v11.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer encodeWaitForEvent:value:timeout:](&v11, sel_encodeWaitForEvent_value_timeout_, a3, a4, v5);
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
{
  uint64_t v7;
  MTLDevice *v8;
  objc_super v9;

  v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    v8 = (MTLDevice *)objc_msgSend(a3, "device");
    if (v8 != -[MTLToolsObject device](self, "device"))
      MTLReportFailure();
  }
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self, "addObject:retained:purgeable:", a3, 1, 0);
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer encodeSignalEvent:value:](&v9, sel_encodeSignalEvent_value_, a3, a4);
}

- (void)waitUntilScheduled
{
  if ((objc_msgSend(-[MTLToolsObject originalObject](self, "originalObject"), "isCommitted") & 1) == 0)
    MTLReportFailure();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitUntilScheduled");
}

- (void)waitUntilCompleted
{
  if ((objc_msgSend(-[MTLToolsObject originalObject](self, "originalObject"), "isCommitted") & 1) == 0)
    MTLReportFailure();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitUntilCompleted");
}

- (id)blitCommandEncoder
{
  _MTLCommandEncoder *currentEncoder;
  void *v4;
  uint64_t v5;
  MTLDebugBlitCommandEncoder *v6;
  uint64_t v7;
  char *v8;
  _OWORD v10[28];

  currentEncoder = self->_currentEncoder;
  if (currentEncoder && -[_MTLCommandEncoder commandBuffer](currentEncoder, "commandBuffer"))
    MTLReportFailure();

  self->_currentEncoder = 0;
  v4 = (void *)MEMORY[0x22E309364]();
  v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "blitCommandEncoder");
  if (v5)
  {
    v6 = -[MTLDebugBlitCommandEncoder initWithBlitCommandEncoder:commandBuffer:descriptor:]([MTLDebugBlitCommandEncoder alloc], "initWithBlitCommandEncoder:commandBuffer:descriptor:", v5, self, 0);
    objc_autoreleasePoolPop(v4);
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    v7 = 0;
    memset(v10, 0, sizeof(v10));
    do
    {
      v8 = (char *)v10 + v7;
      *((_OWORD *)v8 + 1) = 0uLL;
      *((_OWORD *)v8 + 2) = 0uLL;
      *(_OWORD *)v8 = 0uLL;
      *((_QWORD *)v8 + 6) = 4;
      v7 += 56;
    }
    while (v7 != 448);
    memcpy(&self->_currAttachments, v10, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)-[MTLToolsObject originalObject](v6, "originalObject");
    return v6;
  }
  else
  {
    objc_autoreleasePoolPop(v4);
    return 0;
  }
}

- (id)resourceStateCommandEncoder
{
  _MTLCommandEncoder *currentEncoder;
  void *v4;
  uint64_t v5;
  MTLDebugResourceStateCommandEncoder *v6;
  uint64_t v7;
  char *v8;
  _OWORD v10[28];

  currentEncoder = self->_currentEncoder;
  if (currentEncoder && -[_MTLCommandEncoder commandBuffer](currentEncoder, "commandBuffer"))
    MTLReportFailure();

  self->_currentEncoder = 0;
  v4 = (void *)MEMORY[0x22E309364]();
  v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceStateCommandEncoder");
  if (v5)
  {
    v6 = -[MTLDebugResourceStateCommandEncoder initWithResourceStateCommandEncoder:commandBuffer:descriptor:]([MTLDebugResourceStateCommandEncoder alloc], "initWithResourceStateCommandEncoder:commandBuffer:descriptor:", v5, self, 0);
    objc_autoreleasePoolPop(v4);
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    v7 = 0;
    memset(v10, 0, sizeof(v10));
    do
    {
      v8 = (char *)v10 + v7;
      *((_OWORD *)v8 + 1) = 0uLL;
      *((_OWORD *)v8 + 2) = 0uLL;
      *(_OWORD *)v8 = 0uLL;
      *((_QWORD *)v8 + 6) = 4;
      v7 += 56;
    }
    while (v7 != 448);
    memcpy(&self->_currAttachments, v10, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)-[MTLToolsObject originalObject](v6, "originalObject");
    return v6;
  }
  else
  {
    objc_autoreleasePoolPop(v4);
    return 0;
  }
}

- (void)addCompletedHandler:(id)a3
{
  objc_super v5;

  if (!a3)
    MTLReportFailure();
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer addCompletedHandler:](&v5, sel_addCompletedHandler_, a3);
}

- (void)addScheduledHandler:(id)a3
{
  objc_super v5;

  if (!a3)
    MTLReportFailure();
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer addScheduledHandler:](&v5, sel_addScheduledHandler_, a3);
}

- (id)unwrapMTLRenderPassDescriptor:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLDebugCommandBuffer;
  v5 = -[MTLToolsCommandBuffer unwrapMTLRenderPassDescriptor:](&v10, sel_unwrapMTLRenderPassDescriptor_);
  v6 = 0;
  v7 = *(void **)objc_msgSend(a3, "_descriptorPrivate");
  do
  {
    if (objc_msgSend(v7, "_descriptorAtIndex:", v6, v9)
      && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "colorAttachments"), "objectAtIndexedSubscript:", v6), "loadAction")&& -[MTLDevice loadValidationEnabled](-[MTLToolsObject device](self, "device"), "loadValidationEnabled"))
    {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "colorAttachments"), "objectAtIndexedSubscript:", v6), "setLoadAction:", 2);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "colorAttachments"), "objectAtIndexedSubscript:", v6), "setClearColor:", 1.0, 0.0, 1.0, 1.0);
      v9 = v6;
      MTLReportFailure();
    }
    ++v6;
  }
  while (v6 != 8);
  if (objc_msgSend(v7, "_descriptorAtIndex:", 8)
    && !objc_msgSend((id)objc_msgSend(v5, "depthAttachment"), "loadAction")
    && -[MTLDevice loadValidationEnabled](-[MTLToolsObject device](self, "device"), "loadValidationEnabled"))
  {
    objc_msgSend((id)objc_msgSend(v5, "depthAttachment"), "setLoadAction:", 2);
    objc_msgSend((id)objc_msgSend(v5, "depthAttachment"), "setClearDepth:", 0.5);
    MTLReportFailure();
  }
  if (objc_msgSend(v7, "_descriptorAtIndex:", 9, v9)
    && !objc_msgSend((id)objc_msgSend(v5, "stencilAttachment"), "loadAction")
    && -[MTLDevice loadValidationEnabled](-[MTLToolsObject device](self, "device"), "loadValidationEnabled"))
  {
    objc_msgSend((id)objc_msgSend(v5, "stencilAttachment"), "setLoadAction:", 2);
    objc_msgSend((id)objc_msgSend(v5, "stencilAttachment"), "setClearStencil:", 2863311530);
    MTLReportFailure();
  }
  return v5;
}

- (id)renderCommandEncoderWithDescriptor:(id)a3
{
  _MTLCommandEncoder *currentEncoder;
  id v6;
  void *v7;
  uint64_t v8;
  MTLDebugRenderCommandEncoder *v9;

  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    _MTLMessageContextPush_();
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && -[_MTLCommandEncoder commandBuffer](currentEncoder, "commandBuffer"))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  if (MTLReportFailureTypeEnabled())
    validateRenderPassDescriptor(a3, -[MTLToolsObject device](self, "device"), &self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)&self->_prevAttachments, (uint64_t)&self->_currAttachments);
  v6 = -[MTLDebugCommandBuffer unwrapMTLRenderPassDescriptor:](self, "unwrapMTLRenderPassDescriptor:", a3);

  self->_currentEncoder = 0;
  v7 = (void *)MEMORY[0x22E309364]();
  v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "renderCommandEncoderWithDescriptor:", v6);
  if (v8)
  {
    v9 = -[MTLDebugRenderCommandEncoder initWithRenderCommandEncoder:parent:descriptor:]([MTLDebugRenderCommandEncoder alloc], "initWithRenderCommandEncoder:parent:descriptor:", v8, self, a3);
    objc_autoreleasePoolPop(v7);
    self->_currentEncoder = (_MTLCommandEncoder *)-[MTLToolsObject originalObject](v9, "originalObject");
    return v9;
  }
  else
  {
    objc_autoreleasePoolPop(v7);
    return 0;
  }
}

- (id)computeCommandEncoder
{
  _MTLCommandEncoder *currentEncoder;
  void *v4;
  uint64_t v5;
  MTLDebugComputeCommandEncoder *v6;
  uint64_t v7;
  char *v8;
  _OWORD v10[28];

  currentEncoder = self->_currentEncoder;
  if (currentEncoder && -[_MTLCommandEncoder commandBuffer](currentEncoder, "commandBuffer"))
    MTLReportFailure();

  self->_currentEncoder = 0;
  v4 = (void *)MEMORY[0x22E309364]();
  v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "computeCommandEncoder");
  if (v5)
  {
    v6 = -[MTLDebugComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:]([MTLDebugComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:", v5, self, 0);
    objc_autoreleasePoolPop(v4);
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    v7 = 0;
    memset(v10, 0, sizeof(v10));
    do
    {
      v8 = (char *)v10 + v7;
      *((_OWORD *)v8 + 1) = 0uLL;
      *((_OWORD *)v8 + 2) = 0uLL;
      *(_OWORD *)v8 = 0uLL;
      *((_QWORD *)v8 + 6) = 4;
      v7 += 56;
    }
    while (v7 != 448);
    memcpy(&self->_currAttachments, v10, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)-[MTLToolsObject originalObject](v6, "originalObject");
    return v6;
  }
  else
  {
    objc_autoreleasePoolPop(v4);
    return 0;
  }
}

- (id)computeCommandEncoderWithDescriptor:(id)a3
{
  _MTLCommandEncoder *currentEncoder;
  id v6;
  void *v7;
  uint64_t v8;
  MTLDebugComputeCommandEncoder *v9;
  uint64_t v10;
  char *v11;
  _OWORD v13[31];
  uint64_t v14;

  v14 = 0;
  memset(&v13[28], 0, 48);
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    _MTLMessageContextPush_();
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && -[_MTLCommandEncoder commandBuffer](currentEncoder, "commandBuffer"))
    _MTLMessageContextPush_();
  if (MTLReportFailureTypeEnabled())
    validateComputePassDescriptor(a3, -[MTLToolsObject device](self, "device"));
  _MTLMessageContextEnd();
  v6 = -[MTLToolsCommandBuffer unwrapMTLComputePassDescriptor:](self, "unwrapMTLComputePassDescriptor:", a3);

  self->_currentEncoder = 0;
  v7 = (void *)MEMORY[0x22E309364]();
  v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "computeCommandEncoderWithDescriptor:", v6);
  if (v8)
  {
    v9 = -[MTLDebugComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:]([MTLDebugComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:", v8, self, a3);
    objc_autoreleasePoolPop(v7);
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    v10 = 0;
    memset(v13, 0, 448);
    do
    {
      v11 = (char *)v13 + v10;
      *((_OWORD *)v11 + 1) = 0uLL;
      *((_OWORD *)v11 + 2) = 0uLL;
      *(_OWORD *)v11 = 0uLL;
      *((_QWORD *)v11 + 6) = 4;
      v10 += 56;
    }
    while (v10 != 448);
    memcpy(&self->_currAttachments, v13, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)-[MTLToolsObject originalObject](v9, "originalObject");
    return v9;
  }
  else
  {
    objc_autoreleasePoolPop(v7);
    return 0;
  }
}

- (id)blitCommandEncoderWithDescriptor:(id)a3
{
  _MTLCommandEncoder *currentEncoder;
  MTLDevice *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  MTLDebugBlitCommandEncoder *v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;
  uint64_t v18;
  _OWORD __src[31];
  uint64_t v20;

  v20 = 0;
  memset(&__src[28], 0, 48);
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    _MTLMessageContextPush_();
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && -[_MTLCommandEncoder commandBuffer](currentEncoder, "commandBuffer"))
    _MTLMessageContextPush_();
  if (MTLReportFailureTypeEnabled())
  {
    v6 = -[MTLToolsObject device](self, "device");
    for (i = 0; i != 4; ++i)
    {
      v8 = (void *)objc_msgSend((id)objc_msgSend(a3, "sampleBufferAttachments", v17, v18), "objectAtIndexedSubscript:", i);
      if (objc_msgSend(v8, "sampleBuffer"))
      {
        if (-[MTLDevice supportsCounterSampling:](v6, "supportsCounterSampling:", 0))
        {
          v9 = objc_msgSend((id)objc_msgSend(v8, "sampleBuffer"), "sampleCount");
          if (objc_msgSend(v8, "startOfEncoderSampleIndex") != -1
            && objc_msgSend(v8, "startOfEncoderSampleIndex") >= (unint64_t)v9)
          {
            v17 = objc_msgSend(v8, "startOfEncoderSampleIndex");
            v18 = v9;
            _MTLMessageContextPush_();
          }
          if (objc_msgSend(v8, "endOfEncoderSampleIndex", v17, v18) == -1
            || objc_msgSend(v8, "endOfEncoderSampleIndex") < (unint64_t)v9)
          {
            continue;
          }
          v17 = objc_msgSend(v8, "endOfEncoderSampleIndex");
          v18 = v9;
        }
        else
        {
          if (objc_msgSend(v8, "startOfEncoderSampleIndex") != -1)
            _MTLMessageContextPush_();
          if (objc_msgSend(v8, "endOfEncoderSampleIndex") == -1)
            continue;
        }
        _MTLMessageContextPush_();
      }
    }
  }
  _MTLMessageContextEnd();
  v10 = -[MTLToolsCommandBuffer unwrapMTLBlitPassDescriptor:](self, "unwrapMTLBlitPassDescriptor:", a3);

  self->_currentEncoder = 0;
  v11 = (void *)MEMORY[0x22E309364]();
  v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "blitCommandEncoderWithDescriptor:", v10);
  if (v12)
  {
    v13 = -[MTLDebugBlitCommandEncoder initWithBlitCommandEncoder:commandBuffer:descriptor:]([MTLDebugBlitCommandEncoder alloc], "initWithBlitCommandEncoder:commandBuffer:descriptor:", v12, self, a3);
    objc_autoreleasePoolPop(v11);
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    v14 = 0;
    memset(__src, 0, 448);
    do
    {
      v15 = (char *)__src + v14;
      *((_OWORD *)v15 + 1) = 0uLL;
      *((_OWORD *)v15 + 2) = 0uLL;
      *(_OWORD *)v15 = 0uLL;
      *((_QWORD *)v15 + 6) = 4;
      v14 += 56;
    }
    while (v14 != 448);
    memcpy(&self->_currAttachments, __src, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)-[MTLToolsObject originalObject](v13, "originalObject");
    return v13;
  }
  else
  {
    objc_autoreleasePoolPop(v11);
    return 0;
  }
}

- (id)resourceStateCommandEncoderWithDescriptor:(id)a3
{
  _MTLCommandEncoder *currentEncoder;
  MTLDevice *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  MTLDebugResourceStateCommandEncoder *v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;
  uint64_t v18;
  _OWORD __src[31];
  uint64_t v20;

  v20 = 0;
  memset(&__src[28], 0, 48);
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    _MTLMessageContextPush_();
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && -[_MTLCommandEncoder commandBuffer](currentEncoder, "commandBuffer"))
    _MTLMessageContextPush_();
  if (MTLReportFailureTypeEnabled())
  {
    v6 = -[MTLToolsObject device](self, "device");
    for (i = 0; i != 4; ++i)
    {
      v8 = (void *)objc_msgSend((id)objc_msgSend(a3, "sampleBufferAttachments", v17, v18), "objectAtIndexedSubscript:", i);
      if (objc_msgSend(v8, "sampleBuffer"))
      {
        if (-[MTLDevice supportsCounterSampling:](v6, "supportsCounterSampling:", 0))
        {
          v9 = objc_msgSend((id)objc_msgSend(v8, "sampleBuffer"), "sampleCount");
          if (objc_msgSend(v8, "startOfEncoderSampleIndex") != -1
            && objc_msgSend(v8, "startOfEncoderSampleIndex") >= (unint64_t)v9)
          {
            v17 = objc_msgSend(v8, "startOfEncoderSampleIndex");
            v18 = v9;
            _MTLMessageContextPush_();
          }
          if (objc_msgSend(v8, "endOfEncoderSampleIndex", v17, v18) == -1
            || objc_msgSend(v8, "endOfEncoderSampleIndex") < (unint64_t)v9)
          {
            continue;
          }
          v17 = objc_msgSend(v8, "endOfEncoderSampleIndex");
          v18 = v9;
        }
        else
        {
          if (objc_msgSend(v8, "startOfEncoderSampleIndex") != -1)
            _MTLMessageContextPush_();
          if (objc_msgSend(v8, "endOfEncoderSampleIndex") == -1)
            continue;
        }
        _MTLMessageContextPush_();
      }
    }
  }
  _MTLMessageContextEnd();
  v10 = -[MTLToolsCommandBuffer unwrapMTLResourceStatePassDescriptor:](self, "unwrapMTLResourceStatePassDescriptor:", a3);

  self->_currentEncoder = 0;
  v11 = (void *)MEMORY[0x22E309364]();
  v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceStateCommandEncoderWithDescriptor:", v10);
  if (v12)
  {
    v13 = -[MTLDebugResourceStateCommandEncoder initWithResourceStateCommandEncoder:commandBuffer:descriptor:]([MTLDebugResourceStateCommandEncoder alloc], "initWithResourceStateCommandEncoder:commandBuffer:descriptor:", v12, self, a3);
    objc_autoreleasePoolPop(v11);
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    v14 = 0;
    memset(__src, 0, 448);
    do
    {
      v15 = (char *)__src + v14;
      *((_OWORD *)v15 + 1) = 0uLL;
      *((_OWORD *)v15 + 2) = 0uLL;
      *(_OWORD *)v15 = 0uLL;
      *((_QWORD *)v15 + 6) = 4;
      v14 += 56;
    }
    while (v14 != 448);
    memcpy(&self->_currAttachments, __src, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)-[MTLToolsObject originalObject](v13, "originalObject");
    return v13;
  }
  else
  {
    objc_autoreleasePoolPop(v11);
    return 0;
  }
}

- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3
{
  _MTLCommandEncoder *currentEncoder;
  void *v6;
  uint64_t v7;
  MTLDebugComputeCommandEncoder *v8;
  uint64_t v9;
  char *v10;
  _OWORD v12[28];

  currentEncoder = self->_currentEncoder;
  if (currentEncoder && -[_MTLCommandEncoder commandBuffer](currentEncoder, "commandBuffer"))
    MTLReportFailure();

  self->_currentEncoder = 0;
  v6 = (void *)MEMORY[0x22E309364]();
  v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "computeCommandEncoderWithDispatchType:", a3);
  if (v7)
  {
    v8 = -[MTLDebugComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:]([MTLDebugComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:", v7, self, 0);
    objc_autoreleasePoolPop(v6);
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    v9 = 0;
    memset(v12, 0, sizeof(v12));
    do
    {
      v10 = (char *)v12 + v9;
      *((_OWORD *)v10 + 1) = 0uLL;
      *((_OWORD *)v10 + 2) = 0uLL;
      *(_OWORD *)v10 = 0uLL;
      *((_QWORD *)v10 + 6) = 4;
      v9 += 56;
    }
    while (v9 != 448);
    memcpy(&self->_currAttachments, v12, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)-[MTLToolsObject originalObject](v8, "originalObject");
    return v8;
  }
  else
  {
    objc_autoreleasePoolPop(v6);
    return 0;
  }
}

- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3
{
  _MTLCommandEncoder *currentEncoder;
  id v6;
  void *v7;
  uint64_t v8;
  MTLDebugParallelRenderCommandEncoder *v9;

  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    _MTLMessageContextPush_();
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && -[_MTLCommandEncoder commandBuffer](currentEncoder, "commandBuffer"))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  if (MTLReportFailureTypeEnabled())
    validateRenderPassDescriptor(a3, -[MTLToolsObject device](self, "device"), &self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)&self->_prevAttachments, (uint64_t)&self->_currAttachments);
  v6 = -[MTLDebugCommandBuffer unwrapMTLRenderPassDescriptor:](self, "unwrapMTLRenderPassDescriptor:", a3);

  self->_currentEncoder = 0;
  v7 = (void *)MEMORY[0x22E309364]();
  v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "parallelRenderCommandEncoderWithDescriptor:", v6);
  if (v8)
  {
    v9 = -[MTLDebugParallelRenderCommandEncoder initWithBaseRenderPass:commandBuffer:descriptor:]([MTLDebugParallelRenderCommandEncoder alloc], "initWithBaseRenderPass:commandBuffer:descriptor:", v8, self, a3);
    objc_autoreleasePoolPop(v7);
    self->_currentEncoder = (_MTLCommandEncoder *)-[MTLToolsObject originalObject](v9, "originalObject");
    return v9;
  }
  else
  {
    objc_autoreleasePoolPop(v7);
    return 0;
  }
}

- (void)validateStoreLoadTransition:(id)a3 atIndex:(unint64_t)a4 renderTargetArrayLength:(unint64_t)a5
{
  int v6;
  MTLRenderPassAttachmentDescriptorPrivate *v8;

  v6 = a4;
  v8 = (MTLRenderPassAttachmentDescriptorPrivate *)objc_msgSend(a3, "_descriptorPrivate");
  if (v8)
    validateStoreLoadTransition(v6, &self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_, v8, (uint64_t)&self->_prevAttachments, (uint64_t)&self->_currAttachments, a5);
}

- (void)addPurgeableObject:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    if (objc_msgSend(a3, "conformsToProtocol:", &unk_255C504F8))
    {
      v5 = (id)objc_msgSend(a3, "heap");
      if (v5)
        goto LABEL_11;
      if (objc_msgSend(a3, "conformsToProtocol:", &unk_255C6E6C0))
      {
        v5 = (id)objc_msgSend(a3, "buffer");
        if (!v5)
        {
          if (objc_msgSend(a3, "parentTexture"))
          {
            v5 = a3;
            do
              v5 = (id)objc_msgSend(v5, "parentTexture");
            while (objc_msgSend(v5, "parentTexture"));
            goto LABEL_11;
          }
          goto LABEL_10;
        }
LABEL_11:
        os_unfair_lock_lock(&self->_purgeableObjectsLock);
        v6 = v5;
        std::__hash_table<objc_object  {objcproto25MTLDebugResourcePurgeable}*,std::hash<objc_object  {objcproto25MTLDebugResourcePurgeable}>,std::equal_to<objc_object  {objcproto25MTLDebugResourcePurgeable}>,std::allocator<objc_object  {objcproto25MTLDebugResourcePurgeable}>>::__emplace_unique_key_args<objc_object  {objcproto25MTLDebugResourcePurgeable},objc_object  {objcproto25MTLDebugResourcePurgeable}>((uint64_t)&self->_referencedPurgeableObjects, &v6, &v6);
        os_unfair_lock_unlock(&self->_purgeableObjectsLock);
        return;
      }
    }
LABEL_10:
    v5 = a3;
    goto LABEL_11;
  }
}

- (void)addObject:(id)a3 retained:(BOOL)a4 purgeable:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v8;
  char *v9;
  char v10;

  if (a3)
  {
    v5 = a5;
    if (a4)
    {
      v8 = -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:", a3);
      v9 = &checkLifetimeOfInternallyReferencedObjects;
      if (!v8)
        v9 = &checkLifetimeOfExternallyReferencedObjects;
      v10 = *v9;
    }
    else
    {
      v8 = 0;
      v10 = checkLifetimeOfExternallyReferencedObjects;
    }
    if (v10)
      -[MTLDebugCommandBuffer addReferencedObject:internallyRetained:](self, "addReferencedObject:internallyRetained:", a3, v8);
    if (v5)
      -[MTLDebugCommandBuffer addPurgeableObject:](self, "addPurgeableObject:", a3);
  }
}

- (void)addReferencedObject:(id)a3 internallyRetained:(BOOL)a4
{
  _BOOL4 v4;
  os_unfair_lock_s *p_retainedObjectsLock;
  int *v7;
  char v8;
  unsigned int *v9;
  unsigned int v10;
  char *v11;

  v4 = a4;
  v11 = (char *)a3;
  p_retainedObjectsLock = &self->_retainedObjectsLock;
  os_unfair_lock_lock(&self->_retainedObjectsLock);
  v7 = &OBJC_IVAR___MTLDebugCommandBuffer__externallyRetainedObjects;
  if (v4)
    v7 = &OBJC_IVAR___MTLDebugCommandBuffer__internallyRetainedObjects;
  std::__hash_table<MTLToolsObject *,std::hash<MTLToolsObject *>,std::equal_to<MTLToolsObject *>,std::allocator<MTLToolsObject *>>::__emplace_unique_key_args<MTLToolsObject *,MTLToolsObject * const&>((uint64_t)&self->MTLToolsCommandBuffer_opaque[*v7], &v11, &v11);
  if ((v8 & 1) != 0)
  {
    v9 = (unsigned int *)(v11 + 32);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 + 1, v9));
  }
  os_unfair_lock_unlock(p_retainedObjectsLock);
}

- (void)removeAllReferencedObjects:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_retainedObjectsLock;
  int *v6;
  _QWORD *i;
  unsigned int *v8;
  unsigned int v9;
  __int128 v10;
  __int128 v11;
  int v12;

  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 1065353216;
  p_retainedObjectsLock = &self->_retainedObjectsLock;
  os_unfair_lock_lock(&self->_retainedObjectsLock);
  v6 = &OBJC_IVAR___MTLDebugCommandBuffer__externallyRetainedObjects;
  if (v3)
    v6 = &OBJC_IVAR___MTLDebugCommandBuffer__internallyRetainedObjects;
  std::__hash_table<MTLToolsObject *,std::hash<MTLToolsObject *>,std::equal_to<MTLToolsObject *>,std::allocator<MTLToolsObject *>>::swap((uint64_t)&self->MTLToolsCommandBuffer_opaque[*v6], (uint64_t)&v10);
  for (i = (_QWORD *)v11; i; i = (_QWORD *)*i)
  {
    v8 = (unsigned int *)(i[2] + 32);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
  }
  os_unfair_lock_unlock(p_retainedObjectsLock);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&v10);
}

- (BOOL)testObjectReferenced:(id)a3 wasInternallyRetained:(BOOL *)a4
{
  os_unfair_lock_s *p_retainedObjectsLock;
  BOOL v7;
  MTLToolsObject *v9;
  MTLToolsObject *v10;

  v10 = (MTLToolsObject *)a3;
  p_retainedObjectsLock = &self->_retainedObjectsLock;
  os_unfair_lock_lock(&self->_retainedObjectsLock);
  *a4 = std::__hash_table<MTLToolsObject *,std::hash<MTLToolsObject *>,std::equal_to<MTLToolsObject *>,std::allocator<MTLToolsObject *>>::__erase_unique<MTLToolsObject *>(&self->_internallyRetainedObjects.__table_.__bucket_list_.__ptr_.__value_, &v10) != 0;
  if (std::__hash_table<MTLToolsObject *,std::hash<MTLToolsObject *>,std::equal_to<MTLToolsObject *>,std::allocator<MTLToolsObject *>>::__erase_unique<MTLToolsObject *>(&self->_externallyRetainedObjects.__table_.__bucket_list_.__ptr_.__value_, &v10))
  {
    if (*a4 | checkLifetimeBeforeCommit
      || self->_referencedDeadObject == (MTLToolsObject *)3735928559)
    {
      v7 = 1;
    }
    else
    {
      v7 = 0;
      self->_referencedDeadObject = v10;
    }
  }
  else
  {
    v7 = 0;
  }
  os_unfair_lock_unlock(p_retainedObjectsLock);
  os_unfair_lock_lock(&self->_purgeableObjectsLock);
  v9 = v10;
  std::__hash_table<MTLToolsObject *,std::hash<MTLToolsObject *>,std::equal_to<MTLToolsObject *>,std::allocator<MTLToolsObject *>>::__erase_unique<MTLToolsObject *>(&self->_referencedPurgeableObjects.__table_.__bucket_list_.__ptr_.__value_, &v9);
  os_unfair_lock_unlock(&self->_purgeableObjectsLock);
  -[MTLDebugCommandBuffer _removeUsedRenderTargetsExcept:](self, "_removeUsedRenderTargetsExcept:", v10);
  return *a4 || v7;
}

- (void)preCommit
{
  _MTLCommandEncoder *currentEncoder;
  MTLToolsObject *referencedDeadObject;
  BOOL v5;
  NSMutableSet *renderTargetAttachments;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  MTLToolsObject *v20;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && -[_MTLCommandEncoder commandBuffer](currentEncoder, "commandBuffer"))
    MTLReportFailure();
  os_unfair_lock_lock(&self->_retainedObjectsLock);
  referencedDeadObject = self->_referencedDeadObject;
  if (referencedDeadObject)
    v5 = referencedDeadObject == (MTLToolsObject *)3735928559;
  else
    v5 = 1;
  if (!v5)
  {
    v20 = self->_referencedDeadObject;
    MTLReportFailure();
  }
  self->_referencedDeadObject = (MTLToolsObject *)3735928559;
  os_unfair_lock_unlock(&self->_retainedObjectsLock);
  os_unfair_lock_lock(&self->_renderTargetAttachmentLock);
  self->_didAddRenderTargetAttachments = 1;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  renderTargetAttachments = self->_renderTargetAttachments;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](renderTargetAttachments, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(renderTargetAttachments);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(v11, "baseTexture", v20);
        v13 = objc_msgSend(v11, "baseLevelOffset");
        v14 = objc_msgSend(v11, "baseSliceRangeOffset");
        objc_msgSend(v12, "addUsedRenderTarget:slices:", v13, v14, v15);
        v16 = (void *)objc_msgSend(v11, "baseResolveTexture");
        v17 = objc_msgSend(v11, "resolveLevelOffset");
        v18 = objc_msgSend(v11, "resolveSliceRangeOffset");
        objc_msgSend(v16, "addUsedRenderTarget:slices:", v17, v18, v19);
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](renderTargetAttachments, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }
  os_unfair_lock_unlock(&self->_renderTargetAttachmentLock);
  objc_msgSend(*(id *)&self->MTLToolsCommandBuffer_opaque[8], "validateDeadlineAwareness:", self);
  -[MTLDebugCommandBuffer lockPurgeableObjects](self, "lockPurgeableObjects");
  v21.receiver = self;
  v21.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer preCommit](&v21, sel_preCommit);
}

- (void)preCompletionHandlers
{
  objc_super v3;

  -[MTLDebugCommandBuffer _removeUsedRenderTargetsExcept:](self, "_removeUsedRenderTargetsExcept:", 0);
  -[MTLDebugCommandBuffer unlockPurgeableObjects](self, "unlockPurgeableObjects");
  if (checkLifetimeOfExternallyReferencedObjects)
    -[MTLDebugCommandBuffer removeAllReferencedObjects:](self, "removeAllReferencedObjects:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer preCompletionHandlers](&v3, sel_preCompletionHandlers);
  *(_BYTE *)gInsideCompletionHandler() = 1;
}

- (void)postCompletionHandlers
{
  objc_super v3;

  *(_BYTE *)gInsideCompletionHandler() = 0;
  if (checkLifetimeOfExternallyReferencedObjects | checkLifetimeOfInternallyReferencedObjects)
  {
    -[MTLDebugCommandBuffer removeAllReferencedObjects:](self, "removeAllReferencedObjects:", 1);
    objc_msgSend(*(id *)&self->MTLToolsCommandBuffer_opaque[24], "removeReferenceTrackingCommandBuffer:", self);
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer postCompletionHandlers](&v3, sel_postCompletionHandlers);
}

- (void)_removeUsedRenderTargetsExcept:(id)a3
{
  os_unfair_lock_s *p_renderTargetAttachmentLock;
  NSMutableSet *renderTargetAttachments;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  p_renderTargetAttachmentLock = &self->_renderTargetAttachmentLock;
  os_unfair_lock_lock(&self->_renderTargetAttachmentLock);
  if (self->_didAddRenderTargetAttachments)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    renderTargetAttachments = self->_renderTargetAttachments;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](renderTargetAttachments, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(renderTargetAttachments);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v12 = (id)objc_msgSend(v11, "baseTexture");
          if (v12 != a3)
          {
            v13 = v12;
            v14 = objc_msgSend(v11, "baseLevelOffset");
            v15 = objc_msgSend(v11, "baseSliceRangeOffset");
            objc_msgSend(v13, "removeUsedRenderTarget:slices:", v14, v15, v16);
          }
          v17 = (id)objc_msgSend(v11, "baseResolveTexture");
          if (v17 != a3)
          {
            v18 = v17;
            v19 = objc_msgSend(v11, "resolveLevelOffset");
            v20 = objc_msgSend(v11, "resolveSliceRangeOffset");
            objc_msgSend(v18, "removeUsedRenderTarget:slices:", v19, v20, v21);
          }
        }
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](renderTargetAttachments, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }
  }
  -[NSMutableSet removeAllObjects](self->_renderTargetAttachments, "removeAllObjects");
  os_unfair_lock_unlock(p_renderTargetAttachmentLock);
}

- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  _MTLCommandEncoder *currentEncoder;
  id v10;
  void *v11;
  uint64_t v12;
  MTLDebugRenderCommandEncoder *v13;

  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    _MTLMessageContextPush_();
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && -[_MTLCommandEncoder commandBuffer](currentEncoder, "commandBuffer"))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  if (MTLReportFailureTypeEnabled())
    validateRenderPassDescriptor(a3, -[MTLToolsObject device](self, "device"), &self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)&self->_prevAttachments, (uint64_t)&self->_currAttachments);
  v10 = -[MTLDebugCommandBuffer unwrapMTLRenderPassDescriptor:](self, "unwrapMTLRenderPassDescriptor:", a3);

  self->_currentEncoder = 0;
  v11 = (void *)MEMORY[0x22E309364]();
  v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledRenderCommandEncoderWithDescriptor:programInfoBuffer:capacity:", v10, a4, a5);
  if (v12)
  {
    v13 = -[MTLDebugRenderCommandEncoder initWithRenderCommandEncoder:parent:descriptor:]([MTLDebugRenderCommandEncoder alloc], "initWithRenderCommandEncoder:parent:descriptor:", v12, self, a3);
    objc_autoreleasePoolPop(v11);
    self->_currentEncoder = (_MTLCommandEncoder *)-[MTLToolsObject originalObject](v13, "originalObject");
    return v13;
  }
  else
  {
    objc_autoreleasePoolPop(v11);
    return 0;
  }
}

- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  _MTLCommandEncoder *currentEncoder;
  id v10;
  void *v11;
  uint64_t v12;
  MTLDebugComputeCommandEncoder *v13;

  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    _MTLMessageContextPush_();
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && -[_MTLCommandEncoder commandBuffer](currentEncoder, "commandBuffer"))
    _MTLMessageContextPush_();
  if (MTLReportFailureTypeEnabled())
    validateComputePassDescriptor(a3, -[MTLToolsObject device](self, "device"));
  _MTLMessageContextEnd();
  v10 = -[MTLToolsCommandBuffer unwrapMTLComputePassDescriptor:](self, "unwrapMTLComputePassDescriptor:", a3);

  self->_currentEncoder = 0;
  v11 = (void *)MEMORY[0x22E309364]();
  v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledComputeCommandEncoderWithDescriptor:programInfoBuffer:capacity:", v10, a4, a5);
  if (v12)
  {
    v13 = -[MTLDebugComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:]([MTLDebugComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:", v12, self, a3);
    objc_autoreleasePoolPop(v11);
    self->_currentEncoder = (_MTLCommandEncoder *)-[MTLToolsObject originalObject](v13, "originalObject");
    return v13;
  }
  else
  {
    objc_autoreleasePoolPop(v11);
    return 0;
  }
}

- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  _MTLCommandEncoder *currentEncoder;
  void *v8;
  uint64_t v9;
  MTLDebugComputeCommandEncoder *v10;
  uint64_t v11;
  char *v12;
  _OWORD v14[28];

  currentEncoder = self->_currentEncoder;
  if (currentEncoder && -[_MTLCommandEncoder commandBuffer](currentEncoder, "commandBuffer"))
    MTLReportFailure();

  self->_currentEncoder = 0;
  v8 = (void *)MEMORY[0x22E309364]();
  v9 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledComputeCommandEncoderWithProgramInfoBuffer:capacity:", a3, a4);
  if (v9)
  {
    v10 = -[MTLDebugComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:]([MTLDebugComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:", v9, self, 0);
    objc_autoreleasePoolPop(v8);
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    v11 = 0;
    memset(v14, 0, sizeof(v14));
    do
    {
      v12 = (char *)v14 + v11;
      *((_OWORD *)v12 + 1) = 0uLL;
      *((_OWORD *)v12 + 2) = 0uLL;
      *(_OWORD *)v12 = 0uLL;
      *((_QWORD *)v12 + 6) = 4;
      v11 += 56;
    }
    while (v11 != 448);
    memcpy(&self->_currAttachments, v14, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)-[MTLToolsObject originalObject](v10, "originalObject");
    return v10;
  }
  else
  {
    objc_autoreleasePoolPop(v8);
    return 0;
  }
}

- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  _MTLCommandEncoder *currentEncoder;
  void *v10;
  uint64_t v11;
  MTLDebugComputeCommandEncoder *v12;
  uint64_t v13;
  char *v14;
  _OWORD v16[28];

  currentEncoder = self->_currentEncoder;
  if (currentEncoder && -[_MTLCommandEncoder commandBuffer](currentEncoder, "commandBuffer"))
    MTLReportFailure();

  self->_currentEncoder = 0;
  v10 = (void *)MEMORY[0x22E309364]();
  v11 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledComputeCommandEncoderWithDispatchType:programInfoBuffer:capacity:", a3, a4, a5);
  if (v11)
  {
    v12 = -[MTLDebugComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:]([MTLDebugComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:", v11, self, 0);
    objc_autoreleasePoolPop(v10);
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    v13 = 0;
    memset(v16, 0, sizeof(v16));
    do
    {
      v14 = (char *)v16 + v13;
      *((_OWORD *)v14 + 1) = 0uLL;
      *((_OWORD *)v14 + 2) = 0uLL;
      *(_OWORD *)v14 = 0uLL;
      *((_QWORD *)v14 + 6) = 4;
      v13 += 56;
    }
    while (v13 != 448);
    memcpy(&self->_currAttachments, v16, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)-[MTLToolsObject originalObject](v12, "originalObject");
    return v12;
  }
  else
  {
    objc_autoreleasePoolPop(v10);
    return 0;
  }
}

- (void)lockPurgeableObjects
{
  os_unfair_lock_s *p_purgeableObjectsLock;
  _QWORD *i;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  MTLDebugCommandBuffer *v9;
  NSString *v10;

  p_purgeableObjectsLock = &self->_purgeableObjectsLock;
  os_unfair_lock_lock(&self->_purgeableObjectsLock);
  for (i = self->_referencedPurgeableObjects.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    v5 = (void *)i[2];
    objc_msgSend(v5, "lockPurgeableState", v7, v8, v9, v10);
    if ((objc_msgSend(v5, "purgeableStateValidForRendering") & 1) == 0)
    {
      v6 = objc_msgSend(v5, "label");
      v9 = self;
      v10 = -[MTLToolsCommandBuffer label](self, "label");
      v7 = v5;
      v8 = v6;
      MTLReportFailure();
    }
  }
  os_unfair_lock_unlock(p_purgeableObjectsLock);
}

- (void)unlockPurgeableObjects
{
  os_unfair_lock_s *p_purgeableObjectsLock;
  id *i;

  p_purgeableObjectsLock = &self->_purgeableObjectsLock;
  os_unfair_lock_lock(&self->_purgeableObjectsLock);
  for (i = (id *)self->_referencedPurgeableObjects.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
    objc_msgSend(i[2], "unlockPurgeableState");
  os_unfair_lock_unlock(p_purgeableObjectsLock);
}

- (void)addSynchronizationNotification:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addSynchronizationNotification:", a3);
}

- (void)executeSynchronizationNotifications:(int)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "executeSynchronizationNotifications:", *(_QWORD *)&a3);
}

- (void)executeSynchronizationNotifications:(int)a3 scope:(unint64_t)a4 resources:(const void *)a5 count:(unint64_t)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "executeSynchronizationNotifications:scope:resources:count:", *(_QWORD *)&a3, a4, a5, a6);
}

- (void)debugBufferContentsWithLength:(unint64_t *)a3
{
  return (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "debugBufferContentsWithLength:", a3);
}

- (id)accelerationStructureCommandEncoder
{
  _MTLCommandEncoder *currentEncoder;
  void *v4;
  uint64_t v5;
  MTLDebugAccelerationStructureCommandEncoder *v6;
  uint64_t v7;
  char *v8;
  _OWORD v10[28];

  currentEncoder = self->_currentEncoder;
  if (currentEncoder && -[_MTLCommandEncoder commandBuffer](currentEncoder, "commandBuffer"))
    MTLReportFailure();

  self->_currentEncoder = 0;
  v4 = (void *)MEMORY[0x22E309364]();
  v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "accelerationStructureCommandEncoder");
  if (v5)
  {
    v6 = -[MTLToolsCommandEncoder initWithBaseObject:parent:]([MTLDebugAccelerationStructureCommandEncoder alloc], "initWithBaseObject:parent:", v5, self);
    objc_autoreleasePoolPop(v4);
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    v7 = 0;
    memset(v10, 0, sizeof(v10));
    do
    {
      v8 = (char *)v10 + v7;
      *((_OWORD *)v8 + 1) = 0uLL;
      *((_OWORD *)v8 + 2) = 0uLL;
      *(_OWORD *)v8 = 0uLL;
      *((_QWORD *)v8 + 6) = 4;
      v7 += 56;
    }
    while (v7 != 448);
    memcpy(&self->_currAttachments, v10, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)-[MTLToolsObject originalObject](v6, "originalObject");
    return v6;
  }
  else
  {
    objc_autoreleasePoolPop(v4);
    return 0;
  }
}

- (id)accelerationStructureCommandEncoderWithDescriptor:(id)a3
{
  _MTLCommandEncoder *currentEncoder;
  MTLDevice *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  MTLDebugAccelerationStructureCommandEncoder *v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;
  uint64_t v18;
  _OWORD __src[31];
  uint64_t v20;

  v20 = 0;
  memset(&__src[28], 0, 48);
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    _MTLMessageContextPush_();
  currentEncoder = self->_currentEncoder;
  if (currentEncoder && -[_MTLCommandEncoder commandBuffer](currentEncoder, "commandBuffer"))
    _MTLMessageContextPush_();
  if (MTLReportFailureTypeEnabled())
  {
    v6 = -[MTLToolsObject device](self, "device");
    for (i = 0; i != 4; ++i)
    {
      v8 = (void *)objc_msgSend((id)objc_msgSend(a3, "sampleBufferAttachments", v17, v18), "objectAtIndexedSubscript:", i);
      if (objc_msgSend(v8, "sampleBuffer"))
      {
        if (-[MTLDevice supportsCounterSampling:](v6, "supportsCounterSampling:", 0))
        {
          v9 = objc_msgSend((id)objc_msgSend(v8, "sampleBuffer"), "sampleCount");
          if (objc_msgSend(v8, "startOfEncoderSampleIndex") != -1
            && objc_msgSend(v8, "startOfEncoderSampleIndex") >= (unint64_t)v9)
          {
            v17 = objc_msgSend(v8, "startOfEncoderSampleIndex");
            v18 = v9;
            _MTLMessageContextPush_();
          }
          if (objc_msgSend(v8, "endOfEncoderSampleIndex", v17, v18) == -1
            || objc_msgSend(v8, "endOfEncoderSampleIndex") < (unint64_t)v9)
          {
            continue;
          }
          v17 = objc_msgSend(v8, "endOfEncoderSampleIndex");
          v18 = v9;
        }
        else
        {
          if (objc_msgSend(v8, "startOfEncoderSampleIndex") != -1)
            _MTLMessageContextPush_();
          if (objc_msgSend(v8, "endOfEncoderSampleIndex") == -1)
            continue;
        }
        _MTLMessageContextPush_();
      }
    }
  }
  _MTLMessageContextEnd();
  v10 = -[MTLToolsCommandBuffer unwrapMTLAccelerationStructurePassDescriptor:](self, "unwrapMTLAccelerationStructurePassDescriptor:", a3);

  self->_currentEncoder = 0;
  v11 = (void *)MEMORY[0x22E309364]();
  v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "accelerationStructureCommandEncoderWithDescriptor:", v10);
  if (v12)
  {
    v13 = -[MTLToolsAccelerationStructureCommandEncoder initWithAccelerationStructureCommandEncoder:parent:descriptor:]([MTLDebugAccelerationStructureCommandEncoder alloc], "initWithAccelerationStructureCommandEncoder:parent:descriptor:", v12, self, a3);
    objc_autoreleasePoolPop(v11);
    std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear(&self->_attachmentSet.__table_.__bucket_list_.__ptr_.__value_);
    v14 = 0;
    memset(__src, 0, 448);
    do
    {
      v15 = (char *)__src + v14;
      *((_OWORD *)v15 + 1) = 0uLL;
      *((_OWORD *)v15 + 2) = 0uLL;
      *(_OWORD *)v15 = 0uLL;
      *((_QWORD *)v15 + 6) = 4;
      v14 += 56;
    }
    while (v14 != 448);
    memcpy(&self->_currAttachments, __src, sizeof(self->_currAttachments));
    self->_currentEncoder = (_MTLCommandEncoder *)-[MTLToolsObject originalObject](v13, "originalObject");
    return v13;
  }
  else
  {
    objc_autoreleasePoolPop(v11);
    return 0;
  }
}

- (void)encodeDashboardTagForResourceGroup:(id)a3
{
  objc_super v5[4];
  uint64_t v6;

  v6 = 0;
  memset(&v5[1], 0, 48);
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self, "addObject:retained:purgeable:", a3, 1, 0);
  v5[0].receiver = self;
  v5[0].super_class = (Class)MTLDebugCommandBuffer;
  -[objc_super encodeDashboardTagForResourceGroup:](v5, sel_encodeDashboardTagForResourceGroup_, a3);
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 value:(unint64_t)a5 forIndex:(unint64_t)a6
{
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = 0;
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  _MTLMessageContextBegin_();
  if (!a3)
  {
    _MTLMessageContextPush_();
    if (!a4)
      goto LABEL_3;
LABEL_5:
    _MTLMessageContextPush_();
    goto LABEL_3;
  }
  if (a4)
    goto LABEL_5;
LABEL_3:
  _MTLMessageContextEnd();
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self, "addObject:retained:purgeable:", a3, 1, 0);
  v11.receiver = self;
  v11.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer encodeDashboardFinalizeForResourceGroup:dashboard:value:forIndex:](&v11, sel_encodeDashboardFinalizeForResourceGroup_dashboard_value_forIndex_, a3, a4, a5, a6);
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 values:(const unint64_t *)a5 indices:(const unint64_t *)a6 count:(unint64_t)a7
{
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  _MTLMessageContextBegin_();
  if (!a3)
  {
    _MTLMessageContextPush_();
    if (!a4)
      goto LABEL_3;
LABEL_5:
    _MTLMessageContextPush_();
    goto LABEL_3;
  }
  if (a4)
    goto LABEL_5;
LABEL_3:
  _MTLMessageContextEnd();
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self, "addObject:retained:purgeable:", a3, 1, 0);
  v13.receiver = self;
  v13.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer encodeDashboardFinalizeForResourceGroup:dashboard:values:indices:count:](&v13, sel_encodeDashboardFinalizeForResourceGroup_dashboard_values_indices_count_, a3, a4, a5, a6, a7);
}

- (void)addActiveRenderTargets:(id)a3
{
  os_unfair_lock_s *p_renderTargetAttachmentLock;

  p_renderTargetAttachmentLock = &self->_renderTargetAttachmentLock;
  os_unfair_lock_lock(&self->_renderTargetAttachmentLock);
  -[NSMutableSet unionSet:](self->_renderTargetAttachments, "unionSet:", a3);
  os_unfair_lock_unlock(p_renderTargetAttachmentLock);
}

- (void)commitWithDeadline:(unint64_t)a3
{
  MTLDeadlineProfile *v5;
  objc_class *v6;
  const char *v7;
  objc_class *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  objc_super v13;

  v5 = -[MTLToolsCommandBuffer deadlineProfile](self, "deadlineProfile");
  if (!a3 || !v5)
  {
    v9 = "-[MTLDebugCommandBuffer commitWithDeadline:]";
    MTLReportFailure();
  }
  -[MTLToolsCommandBuffer deadlineProfile](self, "deadlineProfile", v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = -[NSString UTF8String](NSStringFromClass(v6), "UTF8String");
    -[MTLToolsCommandBuffer deadlineProfile](self, "deadlineProfile");
    v8 = (objc_class *)objc_opt_class();
    v11 = v7;
    v12 = -[NSString UTF8String](NSStringFromClass(v8), "UTF8String");
    v10 = "-[MTLDebugCommandBuffer commitWithDeadline:]";
    MTLReportFailure();
  }
  -[MTLDebugCommandBuffer preCommit](self, "preCommit", v10, v11, v12);
  v13.receiver = self;
  v13.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer commitWithDeadline:](&v13, sel_commitWithDeadline_, a3);
}

- (void)useResidencySet:(id)a3
{
  objc_super v5;

  if (!a3)
    MTLReportFailure();
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer useResidencySet:](&v5, sel_useResidencySet_, a3);
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  uint64_t i;
  uint64_t v8;
  objc_super v9;

  if (a4)
  {
    for (i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        v8 = i;
        MTLReportFailure();
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer useResidencySets:count:](&v9, sel_useResidencySets_count_, a3, a4, v8);
}

- (void)useInternalResidencySet:(id)a3
{
  objc_super v5;

  if (!a3)
    MTLReportFailure();
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer useInternalResidencySet:](&v5, sel_useInternalResidencySet_, a3);
}

- (void)useInternalResidencySets:(const void *)a3 count:(unint64_t)a4
{
  uint64_t i;
  uint64_t v8;
  objc_super v9;

  if (a4)
  {
    for (i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        v8 = i;
        MTLReportFailure();
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugCommandBuffer;
  -[MTLToolsCommandBuffer useInternalResidencySets:count:](&v9, sel_useInternalResidencySets_count_, a3, a4, v8);
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->_internallyRetainedObjects);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->_externallyRetainedObjects);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->_referencedPurgeableObjects);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->_attachmentSet);
}

- (id).cxx_construct
{
  uint64_t v2;
  char *v3;
  uint64_t i;
  char *v5;

  v2 = 0;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *((_DWORD *)self + 46) = 1065353216;
  do
  {
    v3 = (char *)self + v2 + 192;
    *((_OWORD *)v3 + 1) = 0uLL;
    *((_OWORD *)v3 + 2) = 0uLL;
    *(_OWORD *)v3 = 0uLL;
    *((_QWORD *)v3 + 6) = 4;
    v2 += 56;
  }
  while (v2 != 448);
  for (i = 0; i != 448; i += 56)
  {
    v5 = (char *)self + i + 640;
    *((_OWORD *)v5 + 1) = 0uLL;
    *((_OWORD *)v5 + 2) = 0uLL;
    *(_OWORD *)v5 = 0uLL;
    *((_QWORD *)v5 + 6) = 4;
  }
  *(_OWORD *)((char *)self + 1096) = 0u;
  *(_OWORD *)((char *)self + 1112) = 0u;
  *((_DWORD *)self + 282) = 1065353216;
  *(_OWORD *)((char *)self + 1144) = 0u;
  *(_OWORD *)((char *)self + 1160) = 0u;
  *((_DWORD *)self + 294) = 1065353216;
  *((_OWORD *)self + 74) = 0u;
  *((_OWORD *)self + 75) = 0u;
  *((_DWORD *)self + 304) = 1065353216;
  return self;
}

@end
