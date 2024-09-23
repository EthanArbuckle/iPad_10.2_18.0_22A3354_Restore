@implementation MTLToolsIndirectRenderCommand

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:", a3, a4, a5, a6, a7);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, a8);
}

- (void)setRenderPipelineState:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setRenderPipelineState:", objc_msgSend(a3, "baseObject"));
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12
{
  id v17;
  uint64_t v18;

  v17 = -[MTLToolsObject baseObject](self, "baseObject");
  v18 = objc_msgSend(a6, "baseObject");
  objc_msgSend(a10, "baseObject");
  objc_msgSend(v17, "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:", a3, a4, a5, v18, a7, a8);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14
{
  id v17;
  uint64_t v18;
  uint64_t v19;

  v17 = -[MTLToolsObject baseObject](self, "baseObject");
  v18 = objc_msgSend(a6, "baseObject");
  v19 = objc_msgSend(a8, "baseObject");
  objc_msgSend(a12, "baseObject");
  objc_msgSend(v17, "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:", a3, a4, a5, v18, a7, v19);
}

- (void)reset
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "reset");
}

- (unint64_t)getPipelineStateUniqueIdentifier
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getPipelineStateUniqueIdentifier");
}

- (id)drawArguments
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawArguments");
}

- (id)drawIndexedArguments
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedArguments");
}

- (id)drawIndexedPatchesArguments
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPatchesArguments");
}

- (id)drawPatchesArguments
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPatchesArguments");
}

- (id)drawMeshThreadgroupsArguments
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawMeshThreadgroupsArguments");
}

- (id)drawMeshThreadsArguments
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawMeshThreadsArguments");
}

- (id)getTessellationFactorArguments
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getTessellationFactorArguments");
}

- (unint64_t)getCommandType
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getCommandType");
}

- (void)getFragmentBufferAtIndex:(unint64_t)a3
{
  return (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getFragmentBufferAtIndex:", a3);
}

- (void)getVertexBufferAtIndex:(unint64_t)a3
{
  return (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getVertexBufferAtIndex:", a3);
}

- (unint64_t)getFragmentBufferAddressAtIndex:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getFragmentBufferAddressAtIndex:", a3);
}

- (unint64_t)getVertexBufferAddressAtIndex:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getVertexBufferAddressAtIndex:", a3);
}

- (unint64_t)getObjectBufferAddressAtIndex:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getObjectBufferAddressAtIndex:", a3);
}

- (unint64_t)getMeshBufferAddressAtIndex:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getMeshBufferAddressAtIndex:", a3);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBuffer:offset:atIndex:", a3, a4, a5);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBuffer:offset:attributeStride:atIndex:", a3, a4, a5, a6);
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBuffer:offset:atIndex:", a3, a4, a5);
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectBuffer:offset:atIndex:", a3, a4, a5);
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshBuffer:offset:atIndex:", a3, a4, a5);
}

- (void)setBarrier
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBarrier");
}

- (void)clearBarrier
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "clearBarrier");
}

- (BOOL)hasBarrier
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "hasBarrier");
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  id v8;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;

  v8 = -[MTLToolsObject baseObject](self, "baseObject");
  v11 = *a3;
  v10 = *a4;
  v9 = *a5;
  objc_msgSend(v8, "drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", &v11, &v10, &v9);
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  id v8;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;

  v8 = -[MTLToolsObject baseObject](self, "baseObject");
  v11 = *a3;
  v10 = *a4;
  v9 = *a5;
  objc_msgSend(v8, "drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", &v11, &v10, &v9);
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectThreadgroupMemoryLength:atIndex:", a3, a4);
}

- (unint64_t)getObjectThreadgroupMemoryLengthAtIndex:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getObjectThreadgroupMemoryLengthAtIndex:", a3);
}

- (unint64_t)getOptimizedStatus
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getOptimizedStatus");
}

- (unint64_t)getVertexAttributeStrideAtIndex:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getVertexAttributeStrideAtIndex:", a3);
}

@end
