@implementation MTLDebugParallelRenderCommandEncoder

- (MTLDebugParallelRenderCommandEncoder)initWithBaseRenderPass:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  MTLDebugParallelRenderCommandEncoder *v6;
  MTLRenderPassDescriptor *v7;
  MTLRenderPassColorAttachmentDescriptorArray *v8;
  uint64_t i;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTLDebugParallelRenderCommandEncoder;
  v6 = -[MTLToolsParallelRenderCommandEncoder initWithParallelRenderCommandEncoder:parent:descriptor:](&v13, sel_initWithParallelRenderCommandEncoder_parent_descriptor_, a3, a4);
  if (v6)
  {
    v7 = (MTLRenderPassDescriptor *)objc_msgSend(a5, "copy");
    v6->_descriptor = v7;
    if (v7)
    {
      v8 = -[MTLRenderPassDescriptor colorAttachments](v7, "colorAttachments");
      for (i = 0; i != 10; ++i)
      {
        v10 = (void *)-[MTLRenderPassColorAttachmentDescriptorArray _descriptorAtIndex:](v8, "_descriptorAtIndex:", i);
        if (v10)
        {
          v11 = v10;
          if (objc_msgSend(v10, "texture"))
          {
            if (objc_msgSend(v11, "storeAction") == 4)
              *(&v6->_unknownStoreActions + 1) |= 1 << i;
          }
        }
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLDebugParallelRenderCommandEncoder;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (void)mergeAttachmentWriteMask:(unint64_t)a3
{
  atomic<unsigned long long> *p_attachmentWriteMask;
  unint64_t v4;

  p_attachmentWriteMask = &self->_attachmentWriteMask;
  do
    v4 = __ldaxr(&p_attachmentWriteMask->__a_.__a_value);
  while (__stlxr(v4 | a3, &p_attachmentWriteMask->__a_.__a_value));
}

- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  MTLDebugRenderCommandEncoder *v9;

  v7 = (void *)MEMORY[0x22E309364](self, a2);
  v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledRenderCommandEncoderWithProgramInfoBuffer:capacity:", a3, a4);
  if (v8)
  {
    v9 = -[MTLDebugRenderCommandEncoder initWithRenderCommandEncoder:parallelRenderCommandEncoder:descriptor:]([MTLDebugRenderCommandEncoder alloc], "initWithRenderCommandEncoder:parallelRenderCommandEncoder:descriptor:", v8, self, self->_descriptor);
    objc_autoreleasePoolPop(v7);
    return v9;
  }
  else
  {
    objc_autoreleasePoolPop(v7);
    return 0;
  }
}

- (id)renderCommandEncoder
{
  void *v3;
  uint64_t v4;
  MTLDebugRenderCommandEncoder *v5;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "renderCommandEncoder");
  if (v4)
  {
    v5 = -[MTLDebugRenderCommandEncoder initWithRenderCommandEncoder:parallelRenderCommandEncoder:descriptor:]([MTLDebugRenderCommandEncoder alloc], "initWithRenderCommandEncoder:parallelRenderCommandEncoder:descriptor:", v4, self, self->_descriptor);
    objc_autoreleasePoolPop(v3);
    return v5;
  }
  else
  {
    objc_autoreleasePoolPop(v3);
    return 0;
  }
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  void *v7;
  unint64_t v8;
  uint64_t v9;

  if (a4 >= 8)
  {
    v8 = a4;
    v9 = 8;
    MTLReportFailure();
  }
  v7 = (void *)-[MTLRenderPassColorAttachmentDescriptorArray _descriptorAtIndex:](-[MTLRenderPassDescriptor colorAttachments](self->_descriptor, "colorAttachments", v8, v9), "_descriptorAtIndex:", a4);
  _MTLDebugValidateDeferredStoreActionOnDevice(-[MTLToolsObject device](self, "device"), a3, v7, a4, *(&self->_unknownStoreActions + 1));
  objc_msgSend(v7, "setStoreAction:", a3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorStoreAction:atIndex:", a3, a4);
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  void *v5;

  v5 = (void *)-[MTLRenderPassColorAttachmentDescriptorArray _descriptorAtIndex:](-[MTLRenderPassDescriptor colorAttachments](self->_descriptor, "colorAttachments"), "_descriptorAtIndex:", 8);
  _MTLDebugValidateDeferredStoreActionOnDevice(-[MTLToolsObject device](self, "device"), a3, v5, 8uLL, *(&self->_unknownStoreActions + 1));
  objc_msgSend(v5, "setStoreAction:", a3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthStoreAction:", a3);
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  void *v5;

  v5 = (void *)-[MTLRenderPassColorAttachmentDescriptorArray _descriptorAtIndex:](-[MTLRenderPassDescriptor colorAttachments](self->_descriptor, "colorAttachments"), "_descriptorAtIndex:", 9);
  _MTLDebugValidateDeferredStoreActionOnDevice(-[MTLToolsObject device](self, "device"), a3, v5, 9uLL, *(&self->_unknownStoreActions + 1));
  objc_msgSend(v5, "setStoreAction:", a3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilStoreAction:", a3);
}

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
  void *v7;
  unint64_t v8;
  uint64_t v9;

  if (a4 >= 8)
  {
    v8 = a4;
    v9 = 8;
    MTLReportFailure();
  }
  v7 = (void *)-[MTLRenderPassColorAttachmentDescriptorArray _descriptorAtIndex:](-[MTLRenderPassDescriptor colorAttachments](self->_descriptor, "colorAttachments", v8, v9), "_descriptorAtIndex:", a4);
  _MTLDebugValidateDeferredStoreActionOptionsOnDevice(-[MTLToolsObject device](self, "device"), a3, v7, a4, *(&self->_unknownStoreActions + 1));
  objc_msgSend(v7, "setStoreActionOptions:", a3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorStoreActionOptions:atIndex:", a3, a4);
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
  void *v5;

  v5 = (void *)-[MTLRenderPassColorAttachmentDescriptorArray _descriptorAtIndex:](-[MTLRenderPassDescriptor colorAttachments](self->_descriptor, "colorAttachments"), "_descriptorAtIndex:", 8);
  _MTLDebugValidateDeferredStoreActionOptionsOnDevice(-[MTLToolsObject device](self, "device"), a3, v5, 8, *(&self->_unknownStoreActions + 1));
  objc_msgSend(v5, "setStoreActionOptions:", a3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthStoreActionOptions:", a3);
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
  void *v5;

  v5 = (void *)-[MTLRenderPassColorAttachmentDescriptorArray _descriptorAtIndex:](-[MTLRenderPassDescriptor colorAttachments](self->_descriptor, "colorAttachments"), "_descriptorAtIndex:", 9);
  _MTLDebugValidateDeferredStoreActionOptionsOnDevice(-[MTLToolsObject device](self, "device"), a3, v5, 9, *(&self->_unknownStoreActions + 1));
  objc_msgSend(v5, "setStoreActionOptions:", a3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilStoreActionOptions:", a3);
}

- (void)endEncoding_private
{
  MTLRenderPassDescriptor *descriptor;
  MTLRenderPassColorAttachmentDescriptorArray *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  id v17;
  MTLToolsDevice *device;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _OWORD v22[2];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  descriptor = self->_descriptor;
  if (descriptor)
  {
    v4 = -[MTLRenderPassDescriptor colorAttachments](descriptor, "colorAttachments");
    v5 = 0;
    v6 = 0;
    v21 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = (void *)-[MTLRenderPassColorAttachmentDescriptorArray _descriptorAtIndex:](v4, "_descriptorAtIndex:", v5);
      if (v10)
      {
        v11 = v10;
        v12 = objc_msgSend(v10, "texture");
        if (v12)
        {
          v13 = (void *)v12;
          if (v5 > 7)
          {
            v14 = objc_msgSend(v11, "storeAction");
            if (v5 == 8)
            {
              if (v14 == 4)
                MTLReportFailure();
              v7 = objc_msgSend(v11, "storeAction");
              v9 = 1;
            }
            else
            {
              if (v14 == 4)
                MTLReportFailure();
              v21 = objc_msgSend(v11, "storeAction");
              v6 = *(_QWORD *)(objc_msgSend(v11, "_descriptorPrivate") + 104);
              v8 = 1;
            }
          }
          else if (objc_msgSend(v11, "storeAction") == 4)
          {
            v20 = v5;
            MTLReportFailure();
          }
          if (objc_msgSend(v13, "storageMode", v20, v21) == 3
            && objc_msgSend(v11, "storeAction")
            && objc_msgSend(v11, "storeAction") != 2)
          {
            MTLReportFailure();
          }
          v15 = MTLReportFailureTypeEnabled();
          if (v5 <= 7 && v15 && ((*(&self->_unknownStoreActions + 1) >> v5) & 1) != 0)
            -[MTLToolsRetainingContainer validateStoreLoadTransition:atIndex:renderTargetArrayLength:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "validateStoreLoadTransition:atIndex:renderTargetArrayLength:", v11, v5, -[MTLRenderPassDescriptor renderTargetArrayLength](self->_descriptor, "renderTargetArrayLength"));
        }
      }
      ++v5;
    }
    while (v5 != 10);
    if ((v9 & v8 & 1) != 0)
      _MTLValidateDepthStencilStoreState(v7, v21, v6, 0);
    if (-[MTLToolsDevice storeValidationEnabled](self->super.super.super._device, "storeValidationEnabled"))
    {
      v16 = (void *)MEMORY[0x22E309364]();
      v17 = -[MTLDebugParallelRenderCommandEncoder renderCommandEncoder](self, "renderCommandEncoder");
      v22[0] = xmmword_22CEAB7C0;
      v22[1] = unk_22CEAB7D0;
      device = self->super.super.super._device;
      v19 = atomic_load(&self->_attachmentWriteMask.__a_.__a_value);
      -[MTLToolsDevice clearRenderEncoder:writeMask:withCheckerboard:](device, "clearRenderEncoder:writeMask:withCheckerboard:", v17, v19, v22);
      objc_msgSend(v17, "endEncoding");
      objc_autoreleasePoolPop(v16);
    }
  }
}

- (void)endEncoding
{
  objc_super v3;

  -[MTLDebugParallelRenderCommandEncoder endEncoding_private](self, "endEncoding_private");
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugParallelRenderCommandEncoder;
  -[MTLToolsParallelRenderCommandEncoder endEncoding](&v3, sel_endEncoding);
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  objc_super v4;

  -[MTLDebugParallelRenderCommandEncoder endEncoding_private](self, "endEncoding_private");
  v4.receiver = self;
  v4.super_class = (Class)MTLDebugParallelRenderCommandEncoder;
  return -[MTLToolsParallelRenderCommandEncoder endEncodingAndRetrieveProgramAddressTable](&v4, sel_endEncodingAndRetrieveProgramAddressTable);
}

- (id)formattedDescription:(unint64_t)a3
{
  void *v5;
  id v6;
  MTLRenderPassDescriptor *descriptor;
  const __CFString *v8;
  objc_super v10;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugParallelRenderCommandEncoder;
  v6 = -[MTLToolsObject description](&v10, sel_description);
  descriptor = self->_descriptor;
  if (descriptor)
    v8 = (const __CFString *)-[MTLRenderPassDescriptor formattedDescription:](descriptor, "formattedDescription:", a3 + 4);
  else
    v8 = CFSTR("<null>");
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, v8);
}

- (id)description
{
  return -[MTLDebugParallelRenderCommandEncoder formattedDescription:](self, "formattedDescription:", 0);
}

- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  MTLReportFailure();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "filterCounterRangeWithFirstBatch:lastBatch:filterIndex:", v7, v6, v5);
}

- (MTLRenderPassDescriptor)descriptor
{
  return self->_descriptor;
}

@end
