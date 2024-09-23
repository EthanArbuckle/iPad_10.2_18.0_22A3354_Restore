@implementation SCNGeometryDeformerInstanceWrapper

- (_QWORD)initWithWrappedInstanceForStack:(void *)a3 deformer:(uint64_t)a4 node:(uint64_t)a5 outputs:(uint64_t)a6 computeVertexCount:(const void *)a7 stageInputOutputDescriptors:
{
  _QWORD *v13;
  _QWORD *v14;
  objc_super v16;

  if (!a1)
    return 0;
  v16.receiver = a1;
  v16.super_class = (Class)SCNGeometryDeformerInstanceWrapper;
  v13 = objc_msgSendSuper2(&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13[1] = a2;
    v13[2] = a3;
    memcpy(v13 + 4, a7, 0x180uLL);
    v14[3] = objc_msgSend(a3, "newDeformerInstanceForNode:outputs:computeVertexCount:context:", a4, a5, a6, v14);
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNGeometryDeformerInstanceWrapper;
  -[SCNGeometryDeformerInstanceWrapper dealloc](&v3, sel_dealloc);
}

- (MTLDevice)device
{
  return (MTLDevice *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_stack->_resourceManager);
}

- (MTLBlitCommandEncoder)currentBlitEncoder
{
  return -[SCNMTLDeformerStack currentBlitEncoder](self->_stack, "currentBlitEncoder");
}

- (void)configureStageInputOutputDescriptor:(id)a3 withDeformerFunction:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  $E2FBC665143C1AA598AEE16E33CBB2CF *p_dstNormals;
  $E2FBC665143C1AA598AEE16E33CBB2CF *p_srcNormals;
  $E2FBC665143C1AA598AEE16E33CBB2CF *p_dstPositions;
  $2FEF39B29A3F9EEA95DA676DA7C6A797 *p_stageInputOutputDescriptors;
  uint64_t i;
  void *v15;
  __int128 v16;
  _OWORD *v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  $E2FBC665143C1AA598AEE16E33CBB2CF *p_dstTangents;
  $E2FBC665143C1AA598AEE16E33CBB2CF *p_srcTangents;
  _OWORD v27[2];
  _OWORD v28[2];
  _OWORD v29[2];
  _OWORD v30[2];
  _OWORD v31[2];
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = (void *)objc_msgSend(a4, "stageInputAttributes");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v7)
  {
    v8 = v7;
    p_dstTangents = &self->_stageInputOutputDescriptors.dstTangents;
    p_srcTangents = &self->_stageInputOutputDescriptors.srcTangents;
    v9 = *(_QWORD *)v34;
    p_dstNormals = &self->_stageInputOutputDescriptors.dstNormals;
    p_srcNormals = &self->_stageInputOutputDescriptors.srcNormals;
    p_dstPositions = &self->_stageInputOutputDescriptors.dstPositions;
    p_stageInputOutputDescriptors = &self->_stageInputOutputDescriptors;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v15, "attributeIndex", p_dstTangents))
        {
          if (objc_msgSend(v15, "attributeIndex") == 3)
          {
            v16 = *(_OWORD *)&p_dstPositions->bufferAttributeOffset;
            v31[0] = *(_OWORD *)&p_dstPositions->isActive;
            v31[1] = v16;
            v17 = v31;
            v18 = a3;
            v19 = 3;
          }
          else if (objc_msgSend(v15, "attributeIndex") == 1)
          {
            v21 = *(_OWORD *)&p_srcNormals->bufferAttributeOffset;
            v30[0] = *(_OWORD *)&p_srcNormals->isActive;
            v30[1] = v21;
            v17 = v30;
            v18 = a3;
            v19 = 1;
          }
          else if (objc_msgSend(v15, "attributeIndex") == 4)
          {
            v22 = *(_OWORD *)&p_dstNormals->bufferAttributeOffset;
            v29[0] = *(_OWORD *)&p_dstNormals->isActive;
            v29[1] = v22;
            v17 = v29;
            v18 = a3;
            v19 = 4;
          }
          else if (objc_msgSend(v15, "attributeIndex") == 2)
          {
            v23 = *(_OWORD *)&p_srcTangents->bufferAttributeOffset;
            v28[0] = *(_OWORD *)&p_srcTangents->isActive;
            v28[1] = v23;
            v17 = v28;
            v18 = a3;
            v19 = 2;
          }
          else
          {
            if (objc_msgSend(v15, "attributeIndex") != 5)
              continue;
            v24 = *(_OWORD *)&p_dstTangents->bufferAttributeOffset;
            v27[0] = *(_OWORD *)&p_dstTangents->isActive;
            v27[1] = v24;
            v17 = v27;
            v18 = a3;
            v19 = 5;
          }
        }
        else
        {
          v20 = *(_OWORD *)&p_stageInputOutputDescriptors->srcPositions.bufferAttributeOffset;
          v32[0] = *(_OWORD *)&p_stageInputOutputDescriptors->srcPositions.isActive;
          v32[1] = v20;
          v17 = v32;
          v18 = a3;
          v19 = 0;
        }
        _configureStageInputOutputDescriptorWithDeformerFunction(v18, v19, (uint64_t)v17);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v8);
  }
}

- (unint64_t)_currentFrameHash
{
  uint64_t currentUpdateRenderContext;
  uint64_t v3;
  double SystemTime;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  currentUpdateRenderContext = (uint64_t)self->_stack->_currentUpdateRenderContext;
  v3 = -[SCNMTLRenderContext engineContext](currentUpdateRenderContext);
  SystemTime = C3DEngineContextGetSystemTime(v3);
  v5 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](currentUpdateRenderContext);
  v6 = 0x9DDFEA08EB382D69
     * (v5 ^ ((0x9DDFEA08EB382D69 * (v5 ^ currentUpdateRenderContext)) >> 47) ^ (0x9DDFEA08EB382D69
                                                                                 * (v5 ^ currentUpdateRenderContext)));
  v7 = 0xC6A4A7935BD1E995
     * ((0xC6A4A7935BD1E995
       * ((0xC6A4A7935BD1E995 * *(_QWORD *)&SystemTime) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)&SystemTime) >> 47))) ^ 0x35253C9ADE8F4CA8 ^ (0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47))));
  return (0xC6A4A7935BD1E995 * (v7 ^ (v7 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v7 ^ (v7 >> 47))) >> 47);
}

- (__n128)_currentTransforms
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_OWORD *)(v2 + 560);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(v2 + 544);
  *(_OWORD *)(a2 + 144) = v3;
  v4 = *(_OWORD *)(v2 + 592);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(v2 + 576);
  *(_OWORD *)(a2 + 176) = v4;
  v5 = *(_OWORD *)(v2 + 496);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(v2 + 480);
  *(_OWORD *)(a2 + 80) = v5;
  v6 = *(_OWORD *)(v2 + 528);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(v2 + 512);
  *(_OWORD *)(a2 + 112) = v6;
  v7 = *(_OWORD *)(v2 + 432);
  *(_OWORD *)a2 = *(_OWORD *)(v2 + 416);
  *(_OWORD *)(a2 + 16) = v7;
  result = *(__n128 *)(v2 + 448);
  v9 = *(_OWORD *)(v2 + 464);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v9;
  return result;
}

- (__n128)_currentFrustumInfo
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __n128 result;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_OWORD *)(v2 + 688);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(v2 + 672);
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(v2 + 704);
  v4 = *(_OWORD *)(v2 + 624);
  *(_OWORD *)a2 = *(_OWORD *)(v2 + 608);
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(v2 + 656);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v2 + 640);
  *(__n128 *)(a2 + 48) = result;
  return result;
}

- (id)_currentRenderContext
{
  return self->_stack->_currentUpdateRenderContext;
}

- (void)setStageInputOutputBuffersToComputeEncoder:(SCNMTLComputeCommandEncoder *)a3
{
  MTLBuffer *srcPositions;
  MTLBuffer *dstPositions;
  MTLBuffer *srcNormals;
  MTLBuffer *dstNormals;
  MTLBuffer *srcTangents;
  MTLBuffer *dstTangents;

  if (self->_stageInputOutputDescriptors.srcPositions.isActive)
  {
    srcPositions = self->_currentUpdateBuffers.srcPositions;
    if (a3->_buffers[10] == srcPositions)
    {
      if (!a3->_offsets[10])
        goto LABEL_6;
    }
    else
    {
      a3->_buffers[10] = srcPositions;
    }
    a3->_offsets[10] = 0;
    a3->_buffersToBind[0] |= 0x400uLL;
  }
LABEL_6:
  if (!self->_stageInputOutputDescriptors.dstPositions.isActive)
    goto LABEL_11;
  dstPositions = self->_currentUpdateBuffers.dstPositions;
  if (a3->_buffers[13] == dstPositions)
  {
    if (!a3->_offsets[13])
      goto LABEL_11;
  }
  else
  {
    a3->_buffers[13] = dstPositions;
  }
  a3->_offsets[13] = 0;
  a3->_buffersToBind[0] |= 0x2000uLL;
LABEL_11:
  if (!self->_stageInputOutputDescriptors.srcNormals.isActive)
    goto LABEL_16;
  srcNormals = self->_currentUpdateBuffers.srcNormals;
  if (a3->_buffers[11] == srcNormals)
  {
    if (!a3->_offsets[11])
      goto LABEL_16;
  }
  else
  {
    a3->_buffers[11] = srcNormals;
  }
  a3->_offsets[11] = 0;
  a3->_buffersToBind[0] |= 0x800uLL;
LABEL_16:
  if (!self->_stageInputOutputDescriptors.dstNormals.isActive)
    goto LABEL_21;
  dstNormals = self->_currentUpdateBuffers.dstNormals;
  if (a3->_buffers[14] == dstNormals)
  {
    if (!a3->_offsets[14])
      goto LABEL_21;
  }
  else
  {
    a3->_buffers[14] = dstNormals;
  }
  a3->_offsets[14] = 0;
  a3->_buffersToBind[0] |= 0x4000uLL;
LABEL_21:
  if (!self->_stageInputOutputDescriptors.srcTangents.isActive)
    goto LABEL_26;
  srcTangents = self->_currentUpdateBuffers.srcTangents;
  if (a3->_buffers[12] == srcTangents)
  {
    if (!a3->_offsets[12])
      goto LABEL_26;
  }
  else
  {
    a3->_buffers[12] = srcTangents;
  }
  a3->_offsets[12] = 0;
  a3->_buffersToBind[0] |= 0x1000uLL;
LABEL_26:
  if (!self->_stageInputOutputDescriptors.dstTangents.isActive)
    return;
  dstTangents = self->_currentUpdateBuffers.dstTangents;
  if (a3->_buffers[15] == dstTangents)
  {
    if (!a3->_offsets[15])
      return;
  }
  else
  {
    a3->_buffers[15] = dstTangents;
  }
  a3->_offsets[15] = 0;
  a3->_buffersToBind[0] |= 0x8000uLL;
}

- (id)_currentResourceManager
{
  return self->_stack->_resourceManager;
}

- (void)setStageInputOutputBuffersToCurrentComputeEncoder
{
  MTLComputeCommandEncoder *currentUpdateComputeEncoder;

  currentUpdateComputeEncoder = self->_currentUpdateComputeEncoder;
  if (!currentUpdateComputeEncoder)
  {
    currentUpdateComputeEncoder = (MTLComputeCommandEncoder *)(*((uint64_t (**)(void))self->_currentUpdateComputeEncoderProvider
                                                               + 2))();
    self->_currentUpdateComputeEncoder = currentUpdateComputeEncoder;
  }
  if (self->_stageInputOutputDescriptors.srcPositions.isActive)
    -[MTLComputeCommandEncoder setBuffer:offset:atIndex:](currentUpdateComputeEncoder, "setBuffer:offset:atIndex:", self->_currentUpdateBuffers.srcPositions, 0, 10);
  if (self->_stageInputOutputDescriptors.dstPositions.isActive)
    -[MTLComputeCommandEncoder setBuffer:offset:atIndex:](self->_currentUpdateComputeEncoder, "setBuffer:offset:atIndex:", self->_currentUpdateBuffers.dstPositions, 0, 13);
  if (self->_stageInputOutputDescriptors.srcNormals.isActive)
    -[MTLComputeCommandEncoder setBuffer:offset:atIndex:](self->_currentUpdateComputeEncoder, "setBuffer:offset:atIndex:", self->_currentUpdateBuffers.srcNormals, 0, 11);
  if (self->_stageInputOutputDescriptors.dstNormals.isActive)
    -[MTLComputeCommandEncoder setBuffer:offset:atIndex:](self->_currentUpdateComputeEncoder, "setBuffer:offset:atIndex:", self->_currentUpdateBuffers.dstNormals, 0, 14);
  if (self->_stageInputOutputDescriptors.srcTangents.isActive)
    -[MTLComputeCommandEncoder setBuffer:offset:atIndex:](self->_currentUpdateComputeEncoder, "setBuffer:offset:atIndex:", self->_currentUpdateBuffers.srcTangents, 0, 12);
  if (self->_stageInputOutputDescriptors.dstTangents.isActive)
    -[MTLComputeCommandEncoder setBuffer:offset:atIndex:](self->_currentUpdateComputeEncoder, "setBuffer:offset:atIndex:", self->_currentUpdateBuffers.dstTangents, 0, 15);
}

- (MTLComputeCommandEncoder)currentComputeEncoder
{
  MTLComputeCommandEncoder *result;

  result = self->_currentUpdateComputeEncoder;
  if (!result)
  {
    result = (MTLComputeCommandEncoder *)(*((uint64_t (**)(void))self->_currentUpdateComputeEncoderProvider + 2))();
    self->_currentUpdateComputeEncoder = result;
  }
  return result;
}

- (MTLBuffer)srcPositionBuffer
{
  return self->_currentUpdateBuffers.srcPositions;
}

- (MTLBuffer)dstPositionBuffer
{
  return self->_currentUpdateBuffers.dstPositions;
}

- (MTLBuffer)srcNormalBuffer
{
  return self->_currentUpdateBuffers.srcNormals;
}

- (MTLBuffer)dstNormalBuffer
{
  return self->_currentUpdateBuffers.dstNormals;
}

- (MTLBuffer)srcTangentBuffer
{
  return self->_currentUpdateBuffers.srcTangents;
}

- (MTLBuffer)dstTangentBuffer
{
  return self->_currentUpdateBuffers.dstTangents;
}

- (id)dependency0PositionBuffer
{
  return self->_currentUpdateBuffers.dependency0Positions;
}

- (id)dependency0NormalBuffer
{
  return self->_currentUpdateBuffers.dependency0Normals;
}

- (id)dependency0TangentBuffer
{
  return self->_currentUpdateBuffers.dependency0Tangents;
}

- (id)dependency1PositionBuffer
{
  return self->_currentUpdateBuffers.dependency1Positions;
}

- (id)dependency1NormalBuffer
{
  return self->_currentUpdateBuffers.dependency1Normals;
}

- (id)dependency1TangentBuffer
{
  return self->_currentUpdateBuffers.dependency1Tangents;
}

@end
