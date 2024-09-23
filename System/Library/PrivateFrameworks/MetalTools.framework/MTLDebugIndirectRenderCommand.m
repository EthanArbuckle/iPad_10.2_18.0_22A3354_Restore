@implementation MTLDebugIndirectRenderCommand

- (unint64_t)index
{
  return self->_index;
}

- (MTLIndirectCommandBuffer)indirectCommandBuffer
{
  return self->_iCB;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLDebugIndirectRenderCommand;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (MTLDebugIndirectRenderCommand)initWithBaseObject:(id)a3 descriptor:(id)a4 indexCount:(unint64_t)a5 indirectCommandBuffer:(id)a6
{
  MTLDebugIndirectRenderCommand *v9;
  MTLDebugIndirectRenderCommand *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTLDebugIndirectRenderCommand;
  v9 = -[MTLToolsObject initWithBaseObject:parent:](&v12, sel_initWithBaseObject_parent_, a3, a6);
  v10 = v9;
  if (v9)
  {
    v9->_desc = (MTLIndirectCommandBufferDescriptor *)a4;
    v9->_iCB = (MTLIndirectCommandBufferSPI *)a6;
    v10->_index = a5;
  }
  return v10;
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLDebugIndirectRenderCommand setVertexBuffer:offset:attributeStride:atIndex:](self, "setVertexBuffer:offset:attributeStride:atIndex:", a3, a4, -1, a5);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  unint64_t v11;
  NSUInteger v12;

  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (-[MTLIndirectCommandBufferDescriptor maxVertexBufferBindCount](self->_desc, "maxVertexBufferBindCount") <= a6)
  {
    v11 = a6;
    v12 = -[MTLIndirectCommandBufferDescriptor maxVertexBufferBindCount](self->_desc, "maxVertexBufferBindCount");
    _MTLMessageContextPush_();
  }
  if (-[MTLIndirectCommandBufferDescriptor inheritBuffers](self->_desc, "inheritBuffers", v11, v12))
    _MTLMessageContextPush_();
  if (a5 != -1
    && !-[MTLIndirectCommandBufferDescriptor supportDynamicAttributeStride](self->_desc, "supportDynamicAttributeStride"))
  {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBuffer:offset:attributeStride:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5, a6);
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unint64_t v9;
  NSUInteger v10;

  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (-[MTLIndirectCommandBufferDescriptor maxFragmentBufferBindCount](self->_desc, "maxFragmentBufferBindCount") <= a5)
  {
    v9 = a5;
    v10 = -[MTLIndirectCommandBufferDescriptor maxFragmentBufferBindCount](self->_desc, "maxFragmentBufferBindCount");
    _MTLMessageContextPush_();
  }
  if (-[MTLIndirectCommandBufferDescriptor inheritBuffers](self->_desc, "inheritBuffers", v9, v10))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((-[MTLIndirectCommandBufferDescriptor commandTypes](self->_desc, "commandTypes") & 1) == 0)
    _MTLMessageContextPush_();
  _MTLDebugValidateMTLPrimitiveTypeWithContext(a3, 0);
  if (!a6)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:", a3, a4, a5, a6, a7);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  _OWORD v17[3];
  uint64_t v18;

  v18 = 0;
  memset(v17, 0, sizeof(v17));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((-[MTLIndirectCommandBufferDescriptor commandTypes](self->_desc, "commandTypes") & 2) == 0)
    _MTLMessageContextPush_();
  _MTLDebugValidateIndexBufferWithContext((uint64_t)self->super.super._device, a5, a6, (uint64_t)"indexBuffer", a7, 1, a4, (uint64_t *)v17);
  _MTLDebugValidateMTLPrimitiveTypeWithContext(a3, 0);
  if (!a8)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, a8, a9, a10);
}

- (void)setRenderPipelineState:(id)a3
{
  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (-[MTLIndirectCommandBufferDescriptor inheritPipelineState](self->_desc, "inheritPipelineState"))
    _MTLMessageContextPush_();
  if ((objc_msgSend((id)objc_msgSend(a3, "baseObject"), "supportIndirectCommandBuffers") & 1) == 0)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setRenderPipelineState:", objc_msgSend(a3, "baseObject"));
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12
{
  _OWORD v19[3];
  uint64_t v20;

  v20 = 0;
  memset(v19, 0, sizeof(v19));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((-[MTLIndirectCommandBufferDescriptor commandTypes](self->_desc, "commandTypes") & 4) == 0)
    _MTLMessageContextPush_();
  if (!a8)
    _MTLMessageContextPush_();
  if (a3 >= 0x21)
    _MTLMessageContextPush_();
  _MTLDebugValidatePatchIndexBufferWithContext((unint64_t)self->super.super._device, a6, (uint64_t)"patchIndexBuffer", a7, 1, a4, a5, a9, a8, (uint64_t *)v19);
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, a8, a9, objc_msgSend(a10, "baseObject"), a11, a12);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14
{
  _OWORD v21[3];
  uint64_t v22;

  v22 = 0;
  memset(v21, 0, sizeof(v21));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((-[MTLIndirectCommandBufferDescriptor commandTypes](self->_desc, "commandTypes") & 8) == 0)
    _MTLMessageContextPush_();
  if (!a10)
    _MTLMessageContextPush_();
  if (a3 >= 0x21)
    _MTLMessageContextPush_();
  _MTLDebugValidatePatchIndexBufferWithContext((unint64_t)self->super.super._device, a6, (uint64_t)"patchIndexBuffer", a7, 1, a4, a5, a11, a10, (uint64_t *)v21);
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, objc_msgSend(a8, "baseObject"), a9, a10, a11, objc_msgSend(a12, "baseObject"), a13, a14);
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unint64_t v9;
  NSUInteger v10;

  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (-[MTLIndirectCommandBufferDescriptor maxObjectBufferBindCount](self->_desc, "maxObjectBufferBindCount") <= a5)
  {
    v9 = a5;
    v10 = -[MTLIndirectCommandBufferDescriptor maxObjectBufferBindCount](self->_desc, "maxObjectBufferBindCount");
    _MTLMessageContextPush_();
  }
  if (-[MTLIndirectCommandBufferDescriptor inheritBuffers](self->_desc, "inheritBuffers", v9, v10))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unint64_t v9;
  NSUInteger v10;

  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (-[MTLIndirectCommandBufferDescriptor maxMeshBufferBindCount](self->_desc, "maxMeshBufferBindCount") <= a5)
  {
    v9 = a5;
    v10 = -[MTLIndirectCommandBufferDescriptor maxMeshBufferBindCount](self->_desc, "maxMeshBufferBindCount");
    _MTLMessageContextPush_();
  }
  if (-[MTLIndirectCommandBufferDescriptor inheritBuffers](self->_desc, "inheritBuffers", v9, v10))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setBarrier
{
  if ((-[MTLIndirectCommandBufferDescriptor commandTypes](self->_desc, "commandTypes") & 0x180) == 0)
    MTLReportFailure();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBarrier");
}

- (void)clearBarrier
{
  if ((-[MTLIndirectCommandBufferDescriptor commandTypes](self->_desc, "commandTypes") & 0x180) == 0)
    MTLReportFailure();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "clearBarrier");
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  id v9;
  __int128 v10;
  unint64_t v11;
  __int128 v12;
  unint64_t v13;
  __int128 v14;
  unint64_t var2;

  if ((-[MTLIndirectCommandBufferDescriptor commandTypes](self->_desc, "commandTypes") & 0x80) == 0)
    MTLReportFailure();
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  v14 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  v12 = *(_OWORD *)&a4->var0;
  v13 = a4->var2;
  v10 = *(_OWORD *)&a5->var0;
  v11 = a5->var2;
  objc_msgSend(v9, "drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", &v14, &v12, &v10);
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  id v9;
  __int128 v10;
  unint64_t v11;
  __int128 v12;
  unint64_t v13;
  __int128 v14;
  unint64_t var2;

  if ((-[MTLIndirectCommandBufferDescriptor commandTypes](self->_desc, "commandTypes") & 0x100) == 0)
    MTLReportFailure();
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  v14 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  v12 = *(_OWORD *)&a4->var0;
  v13 = a4->var2;
  v10 = *(_OWORD *)&a5->var0;
  v11 = a5->var2;
  objc_msgSend(v9, "drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", &v14, &v12, &v10);
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v7;
  NSUInteger v8;
  objc_super v9;

  if (-[MTLIndirectCommandBufferDescriptor maxObjectThreadgroupMemoryBindCount](self->_desc, "maxObjectThreadgroupMemoryBindCount") <= a4)
  {
    v7 = a4;
    v8 = -[MTLIndirectCommandBufferDescriptor maxObjectThreadgroupMemoryBindCount](self->_desc, "maxObjectThreadgroupMemoryBindCount");
    MTLReportFailure();
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugIndirectRenderCommand;
  -[MTLToolsIndirectRenderCommand setObjectThreadgroupMemoryLength:atIndex:](&v9, sel_setObjectThreadgroupMemoryLength_atIndex_, a3, a4, v7, v8);
}

@end
