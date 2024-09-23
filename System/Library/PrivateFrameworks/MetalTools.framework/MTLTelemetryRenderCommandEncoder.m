@implementation MTLTelemetryRenderCommandEncoder

- (void)initTelemetryWithDescriptor:(id)a3 commandBuffer:(id)a4
{
  MTLDevice *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t p_renderTargetMap;
  _QWORD *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  int v34;
  unsigned int v35;
  int v36;
  unsigned int v37;
  int v38;
  MTLTelemetryStatisticUIRec *attachmentCount;
  unsigned int v40;
  MTLTelemetryStatisticUIRec *renderTargetArrayLengthDistribution;
  uint64_t v42;
  MTLTelemetryRenderCommandEncoder *v43;
  unint64_t v44;
  uint64_t *v45;

  v7 = -[MTLToolsObject device](self, "device");
  v43 = self;
  self->_telemetryDevice = (MTLTelemetryDevice *)v7;
  if (!-[MTLDevice enableTelemetry](v7, "enableTelemetry"))
    return;
  -[MTLTelemetryDevice setGLMode:](self->_telemetryDevice, "setGLMode:", *(unsigned __int8 *)(objc_msgSend(a3, "_descriptorPrivate") + 43));
  self->_telemetryCommandBuffer = (MTLTelemetryCommandBuffer *)a4;
  self->_reDraws = 0;
  self->_anisoFragmentSamplers = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  self->_clippedMip2DFragmentTextures = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  self->_telemetryPipeline = 0;
  if (!a3)
    return;
  v8 = 0;
  v9 = 0;
  v10 = 3;
  do
  {
    if (v9 != 8)
    {
      v11 = (void *)(v9 == 9
                   ? objc_msgSend(a3, "stencilAttachment")
                   : objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "_descriptorAtIndex:", v9));
      v12 = v11;
      if (v11)
      {
        v13 = (void *)objc_msgSend(v11, "texture");
        if (v13)
        {
          v14 = v13;
          p_renderTargetMap = (uint64_t)&v43->_telemetryCommandBuffer->renderTargetMap;
          v44 = objc_msgSend(v13, "pixelFormat");
          v45 = (uint64_t *)&v44;
          v16 = std::__hash_table<std::__hash_value_type<MTLPixelFormat,MTLTelemetryRenderTargetDistribution>,std::__unordered_map_hasher<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryRenderTargetDistribution>,std::hash<unsigned long long>,std::equal_to<MTLPixelFormat>,true>,std::__unordered_map_equal<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryRenderTargetDistribution>,std::equal_to<MTLPixelFormat>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<MTLPixelFormat,MTLTelemetryRenderTargetDistribution>>>::__emplace_unique_key_args<MTLPixelFormat,std::piecewise_construct_t const&,std::tuple<MTLPixelFormat&&>,std::tuple<>>(p_renderTargetMap, &v44, (uint64_t)&std::piecewise_construct, &v45);
          if (v9 == 9)
          {
            v42 = objc_msgSend(v14, "textureType");
            v17 = objc_msgSend(v12, "loadAction");
            v18 = v8;
            v19 = objc_msgSend(v12, "storeAction");
            v20 = objc_msgSend(v12, "stencilResolveFilter");
            v21 = (uint64_t)&v16[792 * v42 + 264 * v17 + 44 * v19];
            v8 = v18;
            v22 = v21 + 176 * v20 + 228120;
          }
          else
          {
            v23 = objc_msgSend(v14, "textureType");
            v24 = objc_msgSend(v12, "loadAction");
            v22 = (uint64_t)&v16[396 * v23 + 132 * v24 + 22 * objc_msgSend(v12, "storeAction") + v10];
          }
          v25 = objc_msgSend(v14, "width");
          if (!v25)
          {
LABEL_22:
            v27 = objc_msgSend(v14, "height");
            if (!v27)
              goto LABEL_31;
            v28 = *(_DWORD *)(v22 + 48);
            if (v28)
            {
              if (*(_DWORD *)(v22 + 36) < v27)
                *(_DWORD *)(v22 + 36) = v27;
              if (*(_DWORD *)(v22 + 32) <= v27)
                goto LABEL_30;
            }
            else
            {
              *(_DWORD *)(v22 + 36) = v27;
            }
            *(_DWORD *)(v22 + 32) = v27;
LABEL_30:
            *(_QWORD *)(v22 + 40) += v27;
            *(_DWORD *)(v22 + 48) = v28 + 1;
LABEL_31:
            v29 = objc_msgSend(v14, "depth");
            if (!v29)
              goto LABEL_40;
            v30 = *(_DWORD *)(v22 + 72);
            if (v30)
            {
              if (*(_DWORD *)(v22 + 60) < v29)
                *(_DWORD *)(v22 + 60) = v29;
              if (*(_DWORD *)(v22 + 56) <= v29)
                goto LABEL_39;
            }
            else
            {
              *(_DWORD *)(v22 + 60) = v29;
            }
            *(_DWORD *)(v22 + 56) = v29;
LABEL_39:
            *(_QWORD *)(v22 + 64) += v29;
            *(_DWORD *)(v22 + 72) = v30 + 1;
LABEL_40:
            v31 = objc_msgSend(v14, "arrayLength");
            if (!v31)
              goto LABEL_49;
            v32 = *(_DWORD *)(v22 + 96);
            if (v32)
            {
              if (*(_DWORD *)(v22 + 84) < v31)
                *(_DWORD *)(v22 + 84) = v31;
              if (*(_DWORD *)(v22 + 80) <= v31)
                goto LABEL_48;
            }
            else
            {
              *(_DWORD *)(v22 + 84) = v31;
            }
            *(_DWORD *)(v22 + 80) = v31;
LABEL_48:
            *(_QWORD *)(v22 + 88) += v31;
            *(_DWORD *)(v22 + 96) = v32 + 1;
LABEL_49:
            v33 = objc_msgSend(v14, "sampleCount");
            if (!v33)
              goto LABEL_58;
            v34 = *(_DWORD *)(v22 + 120);
            if (v34)
            {
              if (*(_DWORD *)(v22 + 108) < v33)
                *(_DWORD *)(v22 + 108) = v33;
              if (*(_DWORD *)(v22 + 104) <= v33)
                goto LABEL_57;
            }
            else
            {
              *(_DWORD *)(v22 + 108) = v33;
            }
            *(_DWORD *)(v22 + 104) = v33;
LABEL_57:
            *(_QWORD *)(v22 + 112) += v33;
            *(_DWORD *)(v22 + 120) = v34 + 1;
LABEL_58:
            v35 = objc_msgSend(v12, "level");
            if (!v35)
              goto LABEL_67;
            v36 = *(_DWORD *)(v22 + 168);
            if (v36)
            {
              if (*(_DWORD *)(v22 + 156) < v35)
                *(_DWORD *)(v22 + 156) = v35;
              if (*(_DWORD *)(v22 + 152) <= v35)
                goto LABEL_66;
            }
            else
            {
              *(_DWORD *)(v22 + 156) = v35;
            }
            *(_DWORD *)(v22 + 152) = v35;
LABEL_66:
            *(_QWORD *)(v22 + 160) += v35;
            *(_DWORD *)(v22 + 168) = v36 + 1;
LABEL_67:
            v37 = objc_msgSend(v12, "slice");
            if (!v37)
            {
LABEL_76:
              ++*(_DWORD *)v22;
              ++v8;
              goto LABEL_77;
            }
            v38 = *(_DWORD *)(v22 + 144);
            if (v38)
            {
              if (*(_DWORD *)(v22 + 132) < v37)
                *(_DWORD *)(v22 + 132) = v37;
              if (*(_DWORD *)(v22 + 128) <= v37)
                goto LABEL_75;
            }
            else
            {
              *(_DWORD *)(v22 + 132) = v37;
            }
            *(_DWORD *)(v22 + 128) = v37;
LABEL_75:
            *(_QWORD *)(v22 + 136) += v37;
            *(_DWORD *)(v22 + 144) = v38 + 1;
            goto LABEL_76;
          }
          v26 = *(_DWORD *)(v22 + 24);
          if (v26)
          {
            if (*(_DWORD *)(v22 + 12) < v25)
              *(_DWORD *)(v22 + 12) = v25;
            if (*(_DWORD *)(v22 + 8) <= v25)
              goto LABEL_21;
          }
          else
          {
            *(_DWORD *)(v22 + 12) = v25;
          }
          *(_DWORD *)(v22 + 8) = v25;
LABEL_21:
          *(_QWORD *)(v22 + 16) += v25;
          *(_DWORD *)(v22 + 24) = v26 + 1;
          goto LABEL_22;
        }
      }
    }
LABEL_77:
    ++v9;
    v10 += 3168;
  }
  while (v9 != 10);
  if (!v8)
    goto LABEL_87;
  attachmentCount = v43->_telemetryCommandBuffer->attachmentCount;
  if (!attachmentCount->count)
  {
    attachmentCount->max = v8;
    attachmentCount = v43->_telemetryCommandBuffer->attachmentCount;
LABEL_85:
    attachmentCount->min = v8;
    goto LABEL_86;
  }
  if (v8 > attachmentCount->max)
  {
    attachmentCount->max = v8;
    attachmentCount = v43->_telemetryCommandBuffer->attachmentCount;
  }
  if (v8 < attachmentCount->min)
    goto LABEL_85;
LABEL_86:
  v43->_telemetryCommandBuffer->attachmentCount->total += v8;
  ++v43->_telemetryCommandBuffer->attachmentCount->count;
LABEL_87:
  v40 = objc_msgSend(a3, "renderTargetArrayLength");
  if (v40)
  {
    renderTargetArrayLengthDistribution = v43->_telemetryCommandBuffer->renderTargetArrayLengthDistribution;
    if (renderTargetArrayLengthDistribution->count)
    {
      if (renderTargetArrayLengthDistribution->max < v40)
      {
        renderTargetArrayLengthDistribution->max = v40;
        renderTargetArrayLengthDistribution = v43->_telemetryCommandBuffer->renderTargetArrayLengthDistribution;
      }
      if (renderTargetArrayLengthDistribution->min <= v40)
      {
LABEL_95:
        v43->_telemetryCommandBuffer->renderTargetArrayLengthDistribution->total += v40;
        ++v43->_telemetryCommandBuffer->renderTargetArrayLengthDistribution->count;
        return;
      }
    }
    else
    {
      renderTargetArrayLengthDistribution->max = v40;
      renderTargetArrayLengthDistribution = v43->_telemetryCommandBuffer->renderTargetArrayLengthDistribution;
    }
    renderTargetArrayLengthDistribution->min = v40;
    goto LABEL_95;
  }
}

- (MTLTelemetryRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4 commandBuffer:(id)a5 descriptor:(id)a6
{
  MTLTelemetryRenderCommandEncoder *v8;
  MTLTelemetryRenderCommandEncoder *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTLTelemetryRenderCommandEncoder;
  v8 = -[MTLToolsRenderCommandEncoder initWithRenderCommandEncoder:parent:](&v11, sel_initWithRenderCommandEncoder_parent_, a3, a4);
  v9 = v8;
  if (v8)
    -[MTLTelemetryRenderCommandEncoder initTelemetryWithDescriptor:commandBuffer:](v8, "initTelemetryWithDescriptor:commandBuffer:", a6, a5);
  return v9;
}

- (MTLTelemetryRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  MTLTelemetryRenderCommandEncoder *v7;
  MTLTelemetryRenderCommandEncoder *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLTelemetryRenderCommandEncoder;
  v7 = -[MTLToolsRenderCommandEncoder initWithRenderCommandEncoder:parent:descriptor:](&v10, sel_initWithRenderCommandEncoder_parent_descriptor_, a3);
  v8 = v7;
  if (v7)
    -[MTLTelemetryRenderCommandEncoder initTelemetryWithDescriptor:commandBuffer:](v7, "initTelemetryWithDescriptor:commandBuffer:", a5, a4);
  return v8;
}

- (void)setRenderPipelineState:(id)a3
{
  if (a3)
  {
    objc_msgSend(a3, "accumulateUsage");
    if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    {

      self->_telemetryPipeline = (MTLTelemetryRenderPipelineState *)a3;
    }
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setRenderPipelineState:", objc_msgSend(a3, "baseObject"));
}

- (void)setDepthStencilState:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthStencilState:", objc_msgSend(a3, "baseObject"));
}

- (void)setDepthClipMode:(unint64_t)a3
{
  MTLTelemetryCommandBuffer *telemetryCommandBuffer;
  unsigned int depthClipModeClampCount;

  telemetryCommandBuffer = self->_telemetryCommandBuffer;
  depthClipModeClampCount = telemetryCommandBuffer->depthClipModeClampCount;
  if (a3 == 1)
    ++depthClipModeClampCount;
  telemetryCommandBuffer->depthClipModeClampCount = depthClipModeClampCount;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthClipModeSPI:", a3);
}

- (void)accumDrawWithType:(unint64_t)a3 indexType:(unint64_t)a4 primitiveType:(unint64_t)a5 vertexCount:(unint64_t)a6 instanceCount:(unint64_t)a7
{
  MTLTelemetryCommandBuffer *telemetryCommandBuffer;
  MTLTelemetryDrawDistributionRec *drawDistribution;
  unint64_t v10;
  _DWORD *v11;
  int v12;
  int v13;
  _DWORD *v14;
  _DWORD *v15;
  unint64_t v16;
  unint64_t v17;
  _DWORD *v18;
  int v19;
  int v20;
  _DWORD *v21;
  _DWORD *v22;
  unint64_t v23;
  MTLTelemetryRenderPipelineState *telemetryPipeline;
  NSMutableDictionary *clippedMip2DFragmentTextures;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  MTLTelemetryAnisoClippedCountsRec *anisoClippedCounts;
  uint64_t v32;
  NSMutableSet *anisoFragmentSamplers;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  telemetryCommandBuffer = self->_telemetryCommandBuffer;
  drawDistribution = telemetryCommandBuffer->drawDistribution;
  ++telemetryCommandBuffer->cbDraws;
  ++self->_reDraws;
  if (a3 != 2)
  {
    if (!(_DWORD)a6)
      goto LABEL_11;
    v10 = (unint64_t)&drawDistribution->var0[a5][a4][a3];
    v13 = *(_DWORD *)(v10 + 24);
    v11 = (_DWORD *)(v10 + 24);
    v12 = v13;
    v14 = v11 - 4;
    v15 = v11 - 3;
    if (v13)
    {
      if (*v15 < a6)
        *v15 = a6;
      if (*v14 <= a6)
        goto LABEL_10;
    }
    else
    {
      *v15 = a6;
    }
    *v14 = a6;
LABEL_10:
    v16 = (unint64_t)&drawDistribution->var0[a5][a4][a3];
    *(_QWORD *)(v16 + 16) += a6;
    *v11 = v12 + 1;
LABEL_11:
    if (!(_DWORD)a7)
      goto LABEL_20;
    v17 = (unint64_t)&drawDistribution->var0[a5][a4][a3];
    v20 = *(_DWORD *)(v17 + 48);
    v18 = (_DWORD *)(v17 + 48);
    v19 = v20;
    v21 = v18 - 4;
    v22 = v18 - 3;
    if (v20)
    {
      if (*v22 < a7)
        *v22 = a7;
      if (*v21 <= a7)
        goto LABEL_19;
    }
    else
    {
      *v22 = a7;
    }
    *v21 = a7;
LABEL_19:
    v23 = (unint64_t)&drawDistribution->var0[a5][a4][a3];
    *(_QWORD *)(v23 + 40) += a7;
    *v18 = v19 + 1;
  }
LABEL_20:
  ++drawDistribution->var0[a5][a4][a3].var0;
  telemetryPipeline = self->_telemetryPipeline;
  if (!telemetryPipeline)
    return;
  if (!LOBYTE(telemetryPipeline->device))
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    anisoFragmentSamplers = self->_anisoFragmentSamplers;
    v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](anisoFragmentSamplers, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (!v34)
      return;
    v35 = v34;
    v36 = *(_QWORD *)v43;
LABEL_34:
    v37 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v36)
        objc_enumerationMutation(anisoFragmentSamplers);
      if ((objc_msgSend(*(id *)&self->_telemetryPipeline->hasAnisoConstantSampler, "containsObject:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v37)) & 1) != 0)break;
      if (v35 == ++v37)
      {
        v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:](anisoFragmentSamplers, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (v35)
          goto LABEL_34;
        return;
      }
    }
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  clippedMip2DFragmentTextures = self->_clippedMip2DFragmentTextures;
  v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](clippedMip2DFragmentTextures, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v39 != v28)
          objc_enumerationMutation(clippedMip2DFragmentTextures);
        v30 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (-[NSSet containsObject:](self->_telemetryPipeline->activeFragmentSamplers, "containsObject:", v30))
        {
          anisoClippedCounts = self->_telemetryCommandBuffer->anisoClippedCounts;
          v32 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_clippedMip2DFragmentTextures, "objectForKeyedSubscript:", v30), "unsignedIntegerValue");
          ++anisoClippedCounts->var0[v32];
        }
      }
      v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](clippedMip2DFragmentTextures, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v27);
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    -[MTLTelemetryRenderCommandEncoder accumDrawWithType:indexType:primitiveType:vertexCount:instanceCount:](self, "accumDrawWithType:indexType:primitiveType:vertexCount:instanceCount:", 1, a5, a3, a4, a8);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, a8);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    -[MTLTelemetryRenderCommandEncoder accumDrawWithType:indexType:primitiveType:vertexCount:instanceCount:](self, "accumDrawWithType:indexType:primitiveType:vertexCount:instanceCount:", 1, a5, a3, a4, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    -[MTLTelemetryRenderCommandEncoder accumDrawWithType:indexType:primitiveType:vertexCount:instanceCount:](self, "accumDrawWithType:indexType:primitiveType:vertexCount:instanceCount:", 0, 2, a3, a5, a6);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:", a3, a4, a5, a6, a7);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    -[MTLTelemetryRenderCommandEncoder accumDrawWithType:indexType:primitiveType:vertexCount:instanceCount:](self, "accumDrawWithType:indexType:primitiveType:vertexCount:instanceCount:", 0, 2, a3, a5, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:vertexStart:vertexCount:", a3, a4, a5);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    -[MTLTelemetryRenderCommandEncoder accumDrawWithType:indexType:primitiveType:vertexCount:instanceCount:](self, "accumDrawWithType:indexType:primitiveType:vertexCount:instanceCount:", 1, a5, a3, a4, a8);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, a8);
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    -[MTLTelemetryRenderCommandEncoder accumDrawWithType:indexType:primitiveType:vertexCount:instanceCount:](self, "accumDrawWithType:indexType:primitiveType:vertexCount:instanceCount:", 2, 2, a3, 0, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:indirectBuffer:indirectBufferOffset:", a3, objc_msgSend(a4, "baseObject"), a5);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    -[MTLTelemetryRenderCommandEncoder accumDrawWithType:indexType:primitiveType:vertexCount:instanceCount:](self, "accumDrawWithType:indexType:primitiveType:vertexCount:instanceCount:", 2, a4, a3, 0, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, objc_msgSend(a5, "baseObject"), a6, objc_msgSend(a7, "baseObject"), a8);
}

- (void)endEncoding
{
  uint64_t reDraws;
  MTLTelemetryStatisticUIRec *renderEncoderDrawCallDistribution;

  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
  {
    reDraws = self->_reDraws;
    if (!(_DWORD)reDraws)
    {
LABEL_11:

      self->_anisoFragmentSamplers = 0;
      self->_clippedMip2DFragmentTextures = 0;

      self->_telemetryPipeline = 0;
      goto LABEL_12;
    }
    renderEncoderDrawCallDistribution = self->_telemetryCommandBuffer->renderEncoderDrawCallDistribution;
    if (renderEncoderDrawCallDistribution->count)
    {
      if (reDraws > renderEncoderDrawCallDistribution->max)
      {
        renderEncoderDrawCallDistribution->max = reDraws;
        renderEncoderDrawCallDistribution = self->_telemetryCommandBuffer->renderEncoderDrawCallDistribution;
      }
      if (reDraws >= renderEncoderDrawCallDistribution->min)
        goto LABEL_10;
    }
    else
    {
      renderEncoderDrawCallDistribution->max = reDraws;
      renderEncoderDrawCallDistribution = self->_telemetryCommandBuffer->renderEncoderDrawCallDistribution;
    }
    renderEncoderDrawCallDistribution->min = reDraws;
LABEL_10:
    self->_telemetryCommandBuffer->renderEncoderDrawCallDistribution->total += reDraws;
    ++self->_telemetryCommandBuffer->renderEncoderDrawCallDistribution->count;
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  unsigned int v7;
  MTLTelemetryStatisticUIRec *textureBindCount;
  uint64_t v9;
  objc_super v10;

  if (!-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    goto LABEL_17;
  v7 = a4 + 1;
  if ((_DWORD)a4 != -1)
  {
    textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
    if (textureBindCount->count)
    {
      if (v7 > textureBindCount->max)
      {
        textureBindCount->max = v7;
        textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
      }
      if (v7 >= textureBindCount->min)
        goto LABEL_10;
    }
    else
    {
      textureBindCount->max = v7;
      textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
    }
    textureBindCount->min = v7;
LABEL_10:
    self->_telemetryCommandBuffer->textureBindCount->total += v7;
    ++self->_telemetryCommandBuffer->textureBindCount->count;
  }
  if (a3 && *((_QWORD *)a3 + 9) && (objc_msgSend(a3, "textureType") == 2 || objc_msgSend(a3, "textureType") == 3))
  {
    v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *((_QWORD *)a3 + 9));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clippedMip2DFragmentTextures, "setObject:forKeyedSubscript:", v9, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4));
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_clippedMip2DFragmentTextures, "removeObjectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4));
  }
LABEL_17:
  v10.receiver = self;
  v10.super_class = (Class)MTLTelemetryRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder setFragmentTexture:atIndex:](&v10, sel_setFragmentTexture_atIndex_, a3, a4);
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  unsigned int v6;
  MTLTelemetryStatisticUIRec *textureBindCount;
  id *v8;
  NSUInteger v9;
  NSUInteger v10;
  _QWORD *v11;
  uint64_t v12;
  NSUInteger location;
  objc_super v15;

  length = a4.length;
  location = a4.location;
  if (!-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    goto LABEL_20;
  v6 = location + length;
  if ((_DWORD)location + (_DWORD)length)
  {
    textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
    if (textureBindCount->count)
    {
      if (textureBindCount->max < v6)
      {
        textureBindCount->max = v6;
        textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
      }
      if (textureBindCount->min <= v6)
        goto LABEL_10;
    }
    else
    {
      textureBindCount->max = v6;
      textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
    }
    textureBindCount->min = v6;
LABEL_10:
    self->_telemetryCommandBuffer->textureBindCount->total += v6;
    ++self->_telemetryCommandBuffer->textureBindCount->count;
  }
  if (length)
  {
    v8 = (id *)a3;
    v9 = location;
    v10 = length;
    do
    {
      v11 = *v8;
      if (*v8 && v11[9] && (objc_msgSend(*v8, "textureType") == 2 || objc_msgSend(v11, "textureType") == 3))
      {
        v12 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11[9]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clippedMip2DFragmentTextures, "setObject:forKeyedSubscript:", v12, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9));
      }
      else
      {
        -[NSMutableDictionary removeObjectForKey:](self->_clippedMip2DFragmentTextures, "removeObjectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9));
      }
      ++v8;
      ++v9;
      --v10;
    }
    while (v10);
  }
LABEL_20:
  v15.receiver = self;
  v15.super_class = (Class)MTLTelemetryRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder setFragmentTextures:withRange:](&v15, sel_setFragmentTextures_withRange_, a3, location, length);
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  objc_super v7;

  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
  {
    if (a3 && *((_BYTE *)a3 + 36))
      -[NSMutableSet addObject:](self->_anisoFragmentSamplers, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4));
    else
      -[NSMutableSet removeObject:](self->_anisoFragmentSamplers, "removeObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4));
  }
  v7.receiver = self;
  v7.super_class = (Class)MTLTelemetryRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder setFragmentSamplerState:atIndex:](&v7, sel_setFragmentSamplerState_atIndex_, a3, a4);
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  BOOL v7;
  NSUInteger v8;
  const void **v9;
  NSUInteger v10;
  NSUInteger location;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    v7 = length == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = location;
    v9 = a3;
    v10 = length;
    do
    {
      if (*v9 && *((_BYTE *)*v9 + 36))
        -[NSMutableSet addObject:](self->_anisoFragmentSamplers, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8));
      else
        -[NSMutableSet removeObject:](self->_anisoFragmentSamplers, "removeObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8));
      ++v9;
      ++v8;
      --v10;
    }
    while (v10);
  }
  v12.receiver = self;
  v12.super_class = (Class)MTLTelemetryRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder setFragmentSamplerStates:withRange:](&v12, sel_setFragmentSamplerStates_withRange_, a3, location, length);
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  double v11;
  double v12;
  objc_super v13;

  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
  {
    if (a3 && *((_BYTE *)a3 + 36))
      -[NSMutableSet addObject:](self->_anisoFragmentSamplers, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6));
    else
      -[NSMutableSet removeObject:](self->_anisoFragmentSamplers, "removeObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6));
  }
  v13.receiver = self;
  v13.super_class = (Class)MTLTelemetryRenderCommandEncoder;
  *(float *)&v11 = a4;
  *(float *)&v12 = a5;
  -[MTLToolsRenderCommandEncoder setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:](&v13, sel_setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_, a3, a6, v11, v12);
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  BOOL v9;
  NSUInteger v10;
  const void **v11;
  NSUInteger v12;
  NSUInteger location;
  objc_super v16;

  length = a6.length;
  location = a6.location;
  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    v9 = length == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v10 = location;
    v11 = a3;
    v12 = length;
    do
    {
      if (*v11 && *((_BYTE *)*v11 + 36))
        -[NSMutableSet addObject:](self->_anisoFragmentSamplers, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10));
      else
        -[NSMutableSet removeObject:](self->_anisoFragmentSamplers, "removeObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10));
      ++v11;
      ++v10;
      --v12;
    }
    while (v12);
  }
  v16.receiver = self;
  v16.super_class = (Class)MTLTelemetryRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:](&v16, sel_setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_, a3, a4, a5, location, length);
}

- (void)accumViewportTelemetry:(id *)a3 count:(unint64_t)a4
{
  MTLTelemetryViewportDistributionRec *viewportDistribution;
  double *p_var5;
  unsigned int i;
  float v7;
  MTLTelemetryViewportDistributionRec *v8;
  MTLTelemetryStatisticFRec *p_var1;
  float var0;
  float v11;
  MTLTelemetryViewportDistributionRec *v12;
  MTLTelemetryStatisticFRec *p_var2;
  float v14;
  float v15;
  MTLTelemetryViewportDistributionRec *v16;
  MTLTelemetryStatisticFRec *p_var3;
  float v18;
  float v19;
  MTLTelemetryViewportDistributionRec *v20;
  MTLTelemetryStatisticFRec *p_var4;
  float v22;
  unint64_t v23;

  if ((_DWORD)a4)
  {
    viewportDistribution = self->_telemetryCommandBuffer->viewportDistribution;
    if (viewportDistribution->var0.count)
    {
      if (viewportDistribution->var0.max < a4)
      {
        viewportDistribution->var0.max = a4;
        viewportDistribution = self->_telemetryCommandBuffer->viewportDistribution;
      }
      if (viewportDistribution->var0.min <= a4)
        goto LABEL_11;
    }
    else
    {
      viewportDistribution->var0.max = a4;
      viewportDistribution = self->_telemetryCommandBuffer->viewportDistribution;
    }
    viewportDistribution->var0.min = a4;
LABEL_11:
    self->_telemetryCommandBuffer->viewportDistribution->var0.total += a4;
    ++self->_telemetryCommandBuffer->viewportDistribution->var0.count;
    goto LABEL_12;
  }
  if (a4)
  {
LABEL_12:
    p_var5 = &a3->var5;
    for (i = 1; ; ++i)
    {
      v7 = *(p_var5 - 3);
      v8 = self->_telemetryCommandBuffer->viewportDistribution;
      if (!v8->var1.var3)
        break;
      if (v8->var1.var1 < v7)
      {
        v8->var1.var1 = v7;
        v8 = self->_telemetryCommandBuffer->viewportDistribution;
      }
      var0 = v8->var1.var0;
      p_var1 = &v8->var1;
      if (var0 > v7)
        goto LABEL_19;
LABEL_20:
      self->_telemetryCommandBuffer->viewportDistribution->var1.var2 = self->_telemetryCommandBuffer->viewportDistribution->var1.var2
                                                                     + v7;
      ++self->_telemetryCommandBuffer->viewportDistribution->var1.var3;
      v11 = *(p_var5 - 2);
      v12 = self->_telemetryCommandBuffer->viewportDistribution;
      if (!v12->var2.var3)
      {
        v12->var2.var1 = v11;
        p_var2 = &self->_telemetryCommandBuffer->viewportDistribution->var2;
LABEL_26:
        p_var2->var0 = v11;
        goto LABEL_27;
      }
      if (v12->var2.var1 < v11)
      {
        v12->var2.var1 = v11;
        v12 = self->_telemetryCommandBuffer->viewportDistribution;
      }
      v14 = v12->var2.var0;
      p_var2 = &v12->var2;
      if (v14 > v11)
        goto LABEL_26;
LABEL_27:
      self->_telemetryCommandBuffer->viewportDistribution->var2.var2 = self->_telemetryCommandBuffer->viewportDistribution->var2.var2
                                                                     + v11;
      ++self->_telemetryCommandBuffer->viewportDistribution->var2.var3;
      v15 = *(p_var5 - 1);
      v16 = self->_telemetryCommandBuffer->viewportDistribution;
      if (!v16->var3.var3)
      {
        v16->var3.var1 = v15;
        p_var3 = &self->_telemetryCommandBuffer->viewportDistribution->var3;
LABEL_33:
        p_var3->var0 = v15;
        goto LABEL_34;
      }
      if (v16->var3.var1 < v15)
      {
        v16->var3.var1 = v15;
        v16 = self->_telemetryCommandBuffer->viewportDistribution;
      }
      v18 = v16->var3.var0;
      p_var3 = &v16->var3;
      if (v18 > v15)
        goto LABEL_33;
LABEL_34:
      self->_telemetryCommandBuffer->viewportDistribution->var3.var2 = self->_telemetryCommandBuffer->viewportDistribution->var3.var2
                                                                     + v15;
      ++self->_telemetryCommandBuffer->viewportDistribution->var3.var3;
      v19 = *p_var5;
      v20 = self->_telemetryCommandBuffer->viewportDistribution;
      if (v20->var4.var3)
      {
        if (v20->var4.var1 < v19)
        {
          v20->var4.var1 = v19;
          v20 = self->_telemetryCommandBuffer->viewportDistribution;
        }
        v22 = v20->var4.var0;
        p_var4 = &v20->var4;
        if (v22 <= v19)
          goto LABEL_41;
      }
      else
      {
        v20->var4.var1 = v19;
        p_var4 = &self->_telemetryCommandBuffer->viewportDistribution->var4;
      }
      p_var4->var0 = v19;
LABEL_41:
      self->_telemetryCommandBuffer->viewportDistribution->var4.var2 = self->_telemetryCommandBuffer->viewportDistribution->var4.var2
                                                                     + v19;
      ++self->_telemetryCommandBuffer->viewportDistribution->var4.var3;
      v23 = i;
      p_var5 += 6;
      if (v23 >= a4)
        return;
    }
    v8->var1.var1 = v7;
    p_var1 = &self->_telemetryCommandBuffer->viewportDistribution->var1;
LABEL_19:
    p_var1->var0 = v7;
    goto LABEL_20;
  }
}

- (void)setViewport:(id *)a3
{
  id v5;
  __int128 v6;
  _OWORD v7[3];

  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    -[MTLTelemetryRenderCommandEncoder accumViewportTelemetry:count:](self, "accumViewportTelemetry:count:", a3, 1);
  v5 = -[MTLToolsObject baseObject](self, "baseObject");
  v6 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->var4;
  objc_msgSend(v5, "setViewport:", v7);
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    -[MTLTelemetryRenderCommandEncoder accumViewportTelemetry:count:](self, "accumViewportTelemetry:count:", a3, a4);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setViewports:count:", a3, a4);
}

- (void)accumScissorRectTelemetry:(id *)a3 count:(unint64_t)a4
{
  MTLTelemetryScissorRectDistributionRec *scissorRectDistribution;
  unint64_t *p_var3;
  unsigned int v6;
  float v7;
  MTLTelemetryScissorRectDistributionRec *v8;
  MTLTelemetryStatisticFRec *p_var1;
  float var0;
  float v11;
  MTLTelemetryScissorRectDistributionRec *v12;
  MTLTelemetryStatisticFRec *p_var2;
  float v14;
  unint64_t v15;

  if ((_DWORD)a4)
  {
    scissorRectDistribution = self->_telemetryCommandBuffer->scissorRectDistribution;
    if (scissorRectDistribution->var0.count)
    {
      if (scissorRectDistribution->var0.max < a4)
      {
        scissorRectDistribution->var0.max = a4;
        scissorRectDistribution = self->_telemetryCommandBuffer->scissorRectDistribution;
      }
      if (scissorRectDistribution->var0.min <= a4)
        goto LABEL_11;
    }
    else
    {
      scissorRectDistribution->var0.max = a4;
      scissorRectDistribution = self->_telemetryCommandBuffer->scissorRectDistribution;
    }
    scissorRectDistribution->var0.min = a4;
LABEL_11:
    self->_telemetryCommandBuffer->scissorRectDistribution->var0.total += a4;
    ++self->_telemetryCommandBuffer->scissorRectDistribution->var0.count;
    goto LABEL_12;
  }
  if (a4)
  {
LABEL_12:
    p_var3 = &a3->var3;
    v6 = 1;
    while (1)
    {
      v7 = (float)*(p_var3 - 1);
      v8 = self->_telemetryCommandBuffer->scissorRectDistribution;
      if (!v8->var1.var3)
        break;
      if (v8->var1.var1 < v7)
      {
        v8->var1.var1 = v7;
        v8 = self->_telemetryCommandBuffer->scissorRectDistribution;
      }
      var0 = v8->var1.var0;
      p_var1 = &v8->var1;
      if (var0 > v7)
        goto LABEL_19;
LABEL_20:
      self->_telemetryCommandBuffer->scissorRectDistribution->var1.var2 = self->_telemetryCommandBuffer->scissorRectDistribution->var1.var2
                                                                        + v7;
      v11 = (float)*p_var3;
      ++self->_telemetryCommandBuffer->scissorRectDistribution->var1.var3;
      v12 = self->_telemetryCommandBuffer->scissorRectDistribution;
      if (v12->var2.var3)
      {
        if (v12->var2.var1 < v11)
        {
          v12->var2.var1 = v11;
          v12 = self->_telemetryCommandBuffer->scissorRectDistribution;
        }
        v14 = v12->var2.var0;
        p_var2 = &v12->var2;
        if (v14 <= v11)
          goto LABEL_27;
      }
      else
      {
        v12->var2.var1 = v11;
        p_var2 = &self->_telemetryCommandBuffer->scissorRectDistribution->var2;
      }
      p_var2->var0 = v11;
LABEL_27:
      p_var3 += 4;
      self->_telemetryCommandBuffer->scissorRectDistribution->var2.var2 = self->_telemetryCommandBuffer->scissorRectDistribution->var2.var2
                                                                        + v11;
      ++self->_telemetryCommandBuffer->scissorRectDistribution->var2.var3;
      v15 = v6++;
      if (v15 >= a4)
        return;
    }
    v8->var1.var1 = v7;
    p_var1 = &self->_telemetryCommandBuffer->scissorRectDistribution->var1;
LABEL_19:
    p_var1->var0 = v7;
    goto LABEL_20;
  }
}

- (void)setScissorRect:(id *)a3
{
  id v5;
  __int128 v6;
  _OWORD v7[2];

  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    -[MTLTelemetryRenderCommandEncoder accumScissorRectTelemetry:count:](self, "accumScissorRectTelemetry:count:", a3, 1);
  v5 = -[MTLToolsObject baseObject](self, "baseObject");
  v6 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v6;
  objc_msgSend(v5, "setScissorRect:", v7);
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    -[MTLTelemetryRenderCommandEncoder accumScissorRectTelemetry:count:](self, "accumScissorRectTelemetry:count:", a3, a4);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setScissorRects:count:", a3, a4);
}

@end
