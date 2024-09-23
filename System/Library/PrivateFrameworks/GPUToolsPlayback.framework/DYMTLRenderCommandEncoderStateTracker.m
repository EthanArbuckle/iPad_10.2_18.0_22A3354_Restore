@implementation DYMTLRenderCommandEncoderStateTracker

- (DYMTLRenderCommandEncoderStateTracker)initWithEncoder:(id)a3 descriptor:(id)a4
{
  id v7;
  id v8;
  DYMTLRenderCommandEncoderStateTracker *v9;
  DYMTLRenderCommandEncoderStateTracker *v10;
  void *v11;
  DYMTLRenderCommandEncoderStateTracker *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)DYMTLRenderCommandEncoderStateTracker;
    v9 = -[DYMTLRenderCommandEncoderStateTracker init](&v14, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_renderEncoder, a3);
      objc_msgSend(v7, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYMTLRenderCommandEncoderStateTracker _setDefaultsWithDescriptor:device:](v10, "_setDefaultsWithDescriptor:device:", v8, v11);

      DYMTLSetAssociatedObject(v10, 0, v8);
    }
    self = v10;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (DYMTLRenderCommandEncoderStateTracker)initWithDevice:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  DYMTLRenderCommandEncoderStateTracker *v8;
  DYMTLRenderCommandEncoderStateTracker *v9;
  DYMTLRenderCommandEncoderStateTracker *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)DYMTLRenderCommandEncoderStateTracker;
    v8 = -[DYMTLRenderCommandEncoderStateTracker init](&v12, sel_init);
    v9 = v8;
    if (v8)
    {
      -[DYMTLRenderCommandEncoderStateTracker _setDefaultsWithDescriptor:device:](v8, "_setDefaultsWithDescriptor:device:", v7, v6);
      DYMTLSetAssociatedObject(v9, 0, v7);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((-[MTLRenderCommandEncoderSPI conformsToProtocol:](self->_renderEncoder, "conformsToProtocol:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DYMTLRenderCommandEncoderStateTracker;
    v5 = -[DYMTLRenderCommandEncoderStateTracker conformsToProtocol:](&v7, sel_conformsToProtocol_, v4);
  }

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_renderEncoder;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DYMTLRenderCommandEncoderStateTracker;
  if (-[DYMTLRenderCommandEncoderStateTracker respondsToSelector:](&v5, sel_respondsToSelector_))
    v3 = 1;
  else
    v3 = objc_opt_respondsToSelector();
  return v3 & 1;
}

- (void)_setDefaultsWithDescriptor:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  uint64x2_t *p_width;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _OWORD v13[2];
  __int128 v14[3];

  v6 = a3;
  v7 = a4;
  p_width = (uint64x2_t *)&self->_width;
  objc_msgSend(v6, "validate:width:height:", v7, &self->_width, &self->_height);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "rasterizationRateMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_9:

      goto LABEL_10;
    }
    v10 = objc_msgSend(v6, "renderTargetWidth");
    v11 = objc_msgSend(v6, "renderTargetHeight");
    v12 = v11;
    if (v10)
    {
      if (!v11)
        goto LABEL_7;
    }
    else
    {
      objc_msgSend(v9, "screenSize");
      v10 = *(_QWORD *)&v14[0];
      if (!v12)
      {
LABEL_7:
        objc_msgSend(v9, "screenSize");
        v12 = *((_QWORD *)&v14[0] + 1);
      }
    }
    p_width->i64[0] = v10;
    self->_height = v12;
    goto LABEL_9;
  }
LABEL_10:
  v14[0] = 0uLL;
  v14[1] = (__int128)vcvtq_f64_f32(vcvt_f32_f64(vcvtq_f64_u64(*p_width)));
  v14[2] = xmmword_23C7A49C0;
  std::vector<MTLViewport>::assign((char **)&self->_viewports, 1uLL, v14);
  self->_frontFacingWinding = 0;
  self->_cullMode = 0;
  self->_depthClipMode = 0;
  self->_lineWidth = 1.0;
  *(_QWORD *)&self->_depthBias = 0;
  self->_depthBiasClamp = 0.0;
  v13[0] = 0uLL;
  v13[1] = *p_width;
  std::vector<MTLScissorRect>::assign((char **)&self->_scissorRects, 1uLL, v13);
  self->_triangleFillMode = 0;
  self->_visibilityResultMode = 0;
  *(_OWORD *)&self->_amplificationMode = xmmword_23C7A49D0;
  self->_amplificationModeSet = 0;
  self->_frontStencilRef = 0;
  self->_backStencilRef = 0;
  *(_QWORD *)&self->_blendColorRed = 0;
  *(_QWORD *)&self->_blendColorBlue = 0;
  self->_visibilityResultOffset = 0;
  self->_tessellationFactorBufferOffset = 0;
  self->_tessellationFactorBufferInstanceStride = 0;
  self->_tessellationFactorBuffer = 0;
  self->_tessellationFactorScale = 1.0;
  self->_tessellationFactorSet = 0;

}

- (void)setRenderPipelineState:(id)a3
{
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *v5;
  void *v6;
  MTLRenderPipelineState *v7;

  v4 = (MTLRenderPipelineState *)a3;
  v5 = v4;
  v7 = v4;
  if (self->_amplificationCountSet)
  {
    DYMTLGetAssociatedObject(v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "maxVertexAmplificationCount") < self->_amplificationCount)
      self->_amplificationCountSet = 0;

    v5 = v7;
  }
  self->_renderPipelineState = v5;
  -[MTLRenderCommandEncoderSPI setRenderPipelineState:](self->_renderEncoder, "setRenderPipelineState:", v5);

}

- (id)renderPipelineState
{
  return self->_renderPipelineState;
}

- (id)descriptor
{
  return DYMTLGetAssociatedObject(self, 0);
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  DYMTLBoundBufferInfo v9;

  DYMTLBoundBufferInfo::DYMTLBoundBufferInfo(&v9, a3, a4);
  DYMTLBoundBufferInfo::operator=((id *)&self->_vertexBuffers[a5].m_buffer, (uint64_t)&v9);
  free(v9.m_bytes);

  -[MTLRenderCommandEncoderSPI setVertexBytes:length:atIndex:](self->_renderEncoder, "setVertexBytes:length:atIndex:", a3, a4, a5);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;

  v8 = a3;
  v9 = v8;
  v10 = 0;
  v11 = a4;
  DYMTLBoundBufferInfo::operator=((id *)&self->_vertexBuffers[a5].m_buffer, (uint64_t)&v9);
  free(v10);

  -[MTLRenderCommandEncoderSPI setVertexBuffer:offset:atIndex:](self->_renderEncoder, "setVertexBuffer:offset:atIndex:", v8, a4, a5);
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  self->_vertexBuffers[a4].m_offsetOrLength = a3;
  -[MTLRenderCommandEncoderSPI setVertexBufferOffset:atIndex:](self->_renderEncoder, "setVertexBufferOffset:atIndex:");
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  DYMTLBoundBufferInfo *v10;
  const void **v11;
  const unint64_t *v12;
  NSUInteger v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;

  length = a5.length;
  location = a5.location;
  if (a5.length)
  {
    v10 = &self->_vertexBuffers[a5.location];
    v11 = a3;
    v12 = a4;
    v13 = a5.length;
    do
    {
      v14 = *v12++;
      v15 = (id)*v11;
      v16 = 0;
      v17 = v14;
      DYMTLBoundBufferInfo::operator=((id *)&v10->m_buffer, (uint64_t)&v15);
      free(v16);

      ++v11;
      ++v10;
      --v13;
    }
    while (v13);
  }
  -[MTLRenderCommandEncoderSPI setVertexBuffers:offsets:withRange:](self->_renderEncoder, "setVertexBuffers:offsets:withRange:", a3, a4, location, length);
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  self->_vertexTextures[a4] = (MTLTexture *)a3;
  -[MTLRenderCommandEncoderSPI setVertexTexture:atIndex:](self->_renderEncoder, "setVertexTexture:atIndex:");
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  MTLTexture **v4;
  const void **v5;
  NSUInteger length;
  MTLTexture *v7;

  if (a4.length)
  {
    v4 = &self->_vertexTextures[a4.location];
    v5 = a3;
    length = a4.length;
    do
    {
      v7 = (MTLTexture *)*v5++;
      *v4++ = v7;
      --length;
    }
    while (length);
  }
  -[MTLRenderCommandEncoderSPI setVertexTextures:withRange:](self->_renderEncoder, "setVertexTextures:withRange:", a3, a4.location);
}

- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  char *v4;

  v4 = (char *)self + 16 * a4;
  *((_QWORD *)v4 + 250) = a3;
  *((_QWORD *)v4 + 251) = 0x447A000000000000;
  -[MTLRenderCommandEncoderSPI setVertexSamplerState:atIndex:](self->_renderEncoder, "setVertexSamplerState:atIndex:");
}

- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  float *p_minLOD;
  const void **v5;
  NSUInteger length;
  uint64_t v7;

  if (a4.length)
  {
    p_minLOD = &self->_vertexSamplers[a4.location].minLOD;
    v5 = a3;
    length = a4.length;
    do
    {
      v7 = (uint64_t)*v5++;
      *((_QWORD *)p_minLOD - 1) = v7;
      *(_QWORD *)p_minLOD = 0x447A000000000000;
      p_minLOD += 4;
      --length;
    }
    while (length);
  }
  -[MTLRenderCommandEncoderSPI setVertexSamplerStates:withRange:](self->_renderEncoder, "setVertexSamplerStates:withRange:", a3, a4.location);
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  char *v6;

  v6 = (char *)self + 16 * a6;
  *((_QWORD *)v6 + 250) = a3;
  *((float *)v6 + 502) = a4;
  *((float *)v6 + 503) = a5;
  -[MTLRenderCommandEncoderSPI setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:](self->_renderEncoder, "setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
}

- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  float *p_maxLOD;
  const void **v7;
  const float *v8;
  const float *v9;
  NSUInteger length;
  uint64_t v11;
  uint64_t v12;
  int v13;

  if (a6.length)
  {
    p_maxLOD = &self->_vertexSamplers[a6.location].maxLOD;
    v7 = a3;
    v8 = a4;
    v9 = a5;
    length = a6.length;
    do
    {
      v12 = (uint64_t)*v7++;
      v11 = v12;
      *(float *)&v12 = *v8++;
      v13 = v12;
      *(float *)&v12 = *v9++;
      *(_QWORD *)(p_maxLOD - 3) = v11;
      *((_DWORD *)p_maxLOD - 1) = v13;
      *(_DWORD *)p_maxLOD = v12;
      p_maxLOD += 4;
      --length;
    }
    while (length);
  }
  -[MTLRenderCommandEncoderSPI setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:](self->_renderEncoder, "setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, a6.location);
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  DYMTLBoundBufferInfo v9;

  DYMTLBoundBufferInfo::DYMTLBoundBufferInfo(&v9, a3, a4);
  DYMTLBoundBufferInfo::operator=((id *)&self->_fragmentBuffers[a5].m_buffer, (uint64_t)&v9);
  free(v9.m_bytes);

  -[MTLRenderCommandEncoderSPI setFragmentBytes:length:atIndex:](self->_renderEncoder, "setFragmentBytes:length:atIndex:", a3, a4, a5);
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;

  v8 = a3;
  v9 = v8;
  v10 = 0;
  v11 = a4;
  DYMTLBoundBufferInfo::operator=((id *)&self->_fragmentBuffers[a5].m_buffer, (uint64_t)&v9);
  free(v10);

  -[MTLRenderCommandEncoderSPI setFragmentBuffer:offset:atIndex:](self->_renderEncoder, "setFragmentBuffer:offset:atIndex:", v8, a4, a5);
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  self->_fragmentBuffers[a4].m_offsetOrLength = a3;
  -[MTLRenderCommandEncoderSPI setFragmentBufferOffset:atIndex:](self->_renderEncoder, "setFragmentBufferOffset:atIndex:");
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  DYMTLBoundBufferInfo *v10;
  const void **v11;
  const unint64_t *v12;
  NSUInteger v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;

  length = a5.length;
  location = a5.location;
  if (a5.length)
  {
    v10 = &self->_fragmentBuffers[a5.location];
    v11 = a3;
    v12 = a4;
    v13 = a5.length;
    do
    {
      v14 = *v12++;
      v15 = (id)*v11;
      v16 = 0;
      v17 = v14;
      DYMTLBoundBufferInfo::operator=((id *)&v10->m_buffer, (uint64_t)&v15);
      free(v16);

      ++v11;
      ++v10;
      --v13;
    }
    while (v13);
  }
  -[MTLRenderCommandEncoderSPI setFragmentBuffers:offsets:withRange:](self->_renderEncoder, "setFragmentBuffers:offsets:withRange:", a3, a4, location, length);
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  self->_fragmentTextures[a4] = (MTLTexture *)a3;
  -[MTLRenderCommandEncoderSPI setFragmentTexture:atIndex:](self->_renderEncoder, "setFragmentTexture:atIndex:");
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  MTLTexture **v4;
  const void **v5;
  NSUInteger length;
  MTLTexture *v7;

  if (a4.length)
  {
    v4 = &self->_fragmentTextures[a4.location];
    v5 = a3;
    length = a4.length;
    do
    {
      v7 = (MTLTexture *)*v5++;
      *v4++ = v7;
      --length;
    }
    while (length);
  }
  -[MTLRenderCommandEncoderSPI setFragmentTextures:withRange:](self->_renderEncoder, "setFragmentTextures:withRange:", a3, a4.location);
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  char *v4;

  v4 = (char *)self + 16 * a4;
  *((_QWORD *)v4 + 503) = a3;
  *((_QWORD *)v4 + 504) = 0x447A000000000000;
  -[MTLRenderCommandEncoderSPI setFragmentSamplerState:atIndex:](self->_renderEncoder, "setFragmentSamplerState:atIndex:");
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  float *p_minLOD;
  const void **v5;
  NSUInteger length;
  uint64_t v7;

  if (a4.length)
  {
    p_minLOD = &self->_fragmentSamplers[a4.location].minLOD;
    v5 = a3;
    length = a4.length;
    do
    {
      v7 = (uint64_t)*v5++;
      *((_QWORD *)p_minLOD - 1) = v7;
      *(_QWORD *)p_minLOD = 0x447A000000000000;
      p_minLOD += 4;
      --length;
    }
    while (length);
  }
  -[MTLRenderCommandEncoderSPI setFragmentSamplerStates:withRange:](self->_renderEncoder, "setFragmentSamplerStates:withRange:", a3, a4.location);
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  char *v6;

  v6 = (char *)self + 16 * a6;
  *((_QWORD *)v6 + 503) = a3;
  *((float *)v6 + 1008) = a4;
  *((float *)v6 + 1009) = a5;
  -[MTLRenderCommandEncoderSPI setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:](self->_renderEncoder, "setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  float *p_maxLOD;
  const void **v7;
  const float *v8;
  const float *v9;
  NSUInteger length;
  uint64_t v11;
  uint64_t v12;
  int v13;

  if (a6.length)
  {
    p_maxLOD = &self->_fragmentSamplers[a6.location].maxLOD;
    v7 = a3;
    v8 = a4;
    v9 = a5;
    length = a6.length;
    do
    {
      v12 = (uint64_t)*v7++;
      v11 = v12;
      *(float *)&v12 = *v8++;
      v13 = v12;
      *(float *)&v12 = *v9++;
      *(_QWORD *)(p_maxLOD - 3) = v11;
      *((_DWORD *)p_maxLOD - 1) = v13;
      *(_DWORD *)p_maxLOD = v12;
      p_maxLOD += 4;
      --length;
    }
    while (length);
  }
  -[MTLRenderCommandEncoderSPI setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:](self->_renderEncoder, "setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, a6.location);
}

- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6
{
  char *v6;

  self->_fragmentTextures[a4] = (MTLTexture *)a3;
  v6 = (char *)self + 16 * a6;
  *((_QWORD *)v6 + 503) = a5;
  *((_QWORD *)v6 + 504) = 0x447A000000000000;
  -[MTLRenderCommandEncoderSPI setFragmentTexture:atTextureIndex:samplerState:atSamplerIndex:](self->_renderEncoder, "setFragmentTexture:atTextureIndex:samplerState:atSamplerIndex:");
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  DYMTLBoundBufferInfo v9;

  DYMTLBoundBufferInfo::DYMTLBoundBufferInfo(&v9, a3, a4);
  DYMTLBoundBufferInfo::operator=((id *)&self->_tileBuffers[a5].m_buffer, (uint64_t)&v9);
  free(v9.m_bytes);

  -[MTLRenderCommandEncoderSPI setTileBytes:length:atIndex:](self->_renderEncoder, "setTileBytes:length:atIndex:", a3, a4, a5);
}

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;

  v8 = a3;
  v9 = v8;
  v10 = 0;
  v11 = a4;
  DYMTLBoundBufferInfo::operator=((id *)&self->_tileBuffers[a5].m_buffer, (uint64_t)&v9);
  free(v10);

  -[MTLRenderCommandEncoderSPI setTileBuffer:offset:atIndex:](self->_renderEncoder, "setTileBuffer:offset:atIndex:", v8, a4, a5);
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  self->_tileBuffers[a4].m_offsetOrLength = a3;
  -[MTLRenderCommandEncoderSPI setTileBufferOffset:atIndex:](self->_renderEncoder, "setTileBufferOffset:atIndex:");
}

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  DYMTLBoundBufferInfo *v10;
  const void **v11;
  const unint64_t *v12;
  NSUInteger v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;

  length = a5.length;
  location = a5.location;
  if (a5.length)
  {
    v10 = &self->_tileBuffers[a5.location];
    v11 = a3;
    v12 = a4;
    v13 = a5.length;
    do
    {
      v14 = *v12++;
      v15 = (id)*v11;
      v16 = 0;
      v17 = v14;
      DYMTLBoundBufferInfo::operator=((id *)&v10->m_buffer, (uint64_t)&v15);
      free(v16);

      ++v11;
      ++v10;
      --v13;
    }
    while (v13);
  }
  -[MTLRenderCommandEncoderSPI setTileBuffers:offsets:withRange:](self->_renderEncoder, "setTileBuffers:offsets:withRange:", a3, a4, location, length);
}

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
{
  self->_tileTextures[a4] = (MTLTexture *)a3;
  -[MTLRenderCommandEncoderSPI setTileTexture:atIndex:](self->_renderEncoder, "setTileTexture:atIndex:");
}

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
{
  MTLTexture **v4;
  const void **v5;
  NSUInteger length;
  MTLTexture *v7;

  if (a4.length)
  {
    v4 = &self->_tileTextures[a4.location];
    v5 = a3;
    length = a4.length;
    do
    {
      v7 = (MTLTexture *)*v5++;
      *v4++ = v7;
      --length;
    }
    while (length);
  }
  -[MTLRenderCommandEncoderSPI setTileTextures:withRange:](self->_renderEncoder, "setTileTextures:withRange:", a3, a4.location);
}

- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  char *v4;

  v4 = (char *)self + 16 * a4;
  *((_QWORD *)v4 + 756) = a3;
  *((_QWORD *)v4 + 757) = 0x447A000000000000;
  -[MTLRenderCommandEncoderSPI setTileSamplerState:atIndex:](self->_renderEncoder, "setTileSamplerState:atIndex:");
}

- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  float *p_minLOD;
  const void **v5;
  NSUInteger length;
  uint64_t v7;

  if (a4.length)
  {
    p_minLOD = &self->_tileSamplers[a4.location].minLOD;
    v5 = a3;
    length = a4.length;
    do
    {
      v7 = (uint64_t)*v5++;
      *((_QWORD *)p_minLOD - 1) = v7;
      *(_QWORD *)p_minLOD = 0x447A000000000000;
      p_minLOD += 4;
      --length;
    }
    while (length);
  }
  -[MTLRenderCommandEncoderSPI setTileSamplerStates:withRange:](self->_renderEncoder, "setTileSamplerStates:withRange:", a3, a4.location);
}

- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  char *v6;

  v6 = (char *)self + 16 * a6;
  *((_QWORD *)v6 + 756) = a3;
  *((float *)v6 + 1514) = a4;
  *((float *)v6 + 1515) = a5;
  -[MTLRenderCommandEncoderSPI setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:](self->_renderEncoder, "setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
}

- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  float *p_maxLOD;
  const void **v7;
  const float *v8;
  const float *v9;
  NSUInteger length;
  uint64_t v11;
  uint64_t v12;
  int v13;

  if (a6.length)
  {
    p_maxLOD = &self->_tileSamplers[a6.location].maxLOD;
    v7 = a3;
    v8 = a4;
    v9 = a5;
    length = a6.length;
    do
    {
      v12 = (uint64_t)*v7++;
      v11 = v12;
      *(float *)&v12 = *v8++;
      v13 = v12;
      *(float *)&v12 = *v9++;
      *(_QWORD *)(p_maxLOD - 3) = v11;
      *((_DWORD *)p_maxLOD - 1) = v13;
      *(_DWORD *)p_maxLOD = v12;
      p_maxLOD += 4;
      --length;
    }
    while (length);
  }
  -[MTLRenderCommandEncoderSPI setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:](self->_renderEncoder, "setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, a6.location);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  char *v5;

  v5 = (char *)self + 16 * a5;
  *((_QWORD *)v5 + 788) = a3;
  *((_QWORD *)v5 + 789) = a4;
  -[MTLRenderCommandEncoderSPI setThreadgroupMemoryLength:offset:atIndex:](self->_renderEncoder, "setThreadgroupMemoryLength:offset:atIndex:");
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  id v6;
  DYMTLUsedResourceInfo *value;
  DYMTLUsedResourceInfo *end;
  DYMTLUsedResourceInfo *v9;
  DYMTLUsedResourceInfo *begin;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  DYMTLUsedResourceInfo *v18;
  DYMTLUsedResourceInfo *v19;
  DYMTLUsedResourceInfo *v20;
  id v21;

  v6 = a3;
  value = self->_usedResources.__end_cap_.__value_;
  end = self->_usedResources.__end_;
  v21 = v6;
  if (end >= value)
  {
    begin = self->_usedResources.__begin_;
    v11 = (end - begin) >> 4;
    v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 60)
      std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
    v13 = value - begin;
    if (v13 >> 3 > v12)
      v12 = v13 >> 3;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0)
      v14 = 0xFFFFFFFFFFFFFFFLL;
    else
      v14 = v12;
    v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>((uint64_t)&self->_usedResources.__end_cap_, v14);
    v16 = &v15[16 * v11];
    v18 = (DYMTLUsedResourceInfo *)&v15[16 * v17];
    *(_QWORD *)v16 = v21;
    *((_QWORD *)v16 + 1) = a4;
    v9 = (DYMTLUsedResourceInfo *)(v16 + 16);
    v20 = self->_usedResources.__begin_;
    v19 = self->_usedResources.__end_;
    if (v19 != v20)
    {
      do
      {
        *((_OWORD *)v16 - 1) = *((_OWORD *)v19 - 1);
        v16 -= 16;
        v19 = (DYMTLUsedResourceInfo *)((char *)v19 - 16);
      }
      while (v19 != v20);
      v19 = self->_usedResources.__begin_;
    }
    self->_usedResources.__begin_ = (DYMTLUsedResourceInfo *)v16;
    self->_usedResources.__end_ = v9;
    self->_usedResources.__end_cap_.__value_ = v18;
    if (v19)
      operator delete(v19);
    v6 = v21;
  }
  else
  {
    *(_QWORD *)end = v6;
    *((_QWORD *)end + 1) = a4;
    v9 = (DYMTLUsedResourceInfo *)((char *)end + 16);
  }
  self->_usedResources.__end_ = v9;
  -[MTLRenderCommandEncoderSPI useResource:usage:](self->_renderEncoder, "useResource:usage:", v6, a4);

}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  uint64_t v9;
  vector<DYMTLUsedResourceInfo, std::allocator<DYMTLUsedResourceInfo>> *p_usedResources;
  __compressed_pair<DYMTLUsedResourceInfo *, std::allocator<DYMTLUsedResourceInfo>> *p_end_cap;
  DYMTLUsedResourceInfo *end;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  DYMTLUsedResourceInfo *v20;
  DYMTLUsedResourceInfo *begin;
  DYMTLUsedResourceInfo *v22;

  if (a4)
  {
    v9 = 0;
    p_usedResources = &self->_usedResources;
    p_end_cap = &self->_usedResources.__end_cap_;
    end = self->_usedResources.__end_;
    do
    {
      if (end >= p_end_cap->__value_)
      {
        v13 = (end - p_usedResources->__begin_) >> 4;
        if ((unint64_t)(v13 + 1) >> 60)
          std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
        v14 = p_end_cap->__value_ - p_usedResources->__begin_;
        v15 = v14 >> 3;
        if (v14 >> 3 <= (unint64_t)(v13 + 1))
          v15 = v13 + 1;
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
          v16 = 0xFFFFFFFFFFFFFFFLL;
        else
          v16 = v15;
        v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>((uint64_t)&self->_usedResources.__end_cap_, v16);
        v19 = &v17[16 * v13];
        *(_QWORD *)v19 = a3[v9];
        *((_QWORD *)v19 + 1) = a5;
        begin = self->_usedResources.__begin_;
        v20 = self->_usedResources.__end_;
        v22 = (DYMTLUsedResourceInfo *)v19;
        if (v20 != begin)
        {
          do
          {
            *((_OWORD *)v22 - 1) = *((_OWORD *)v20 - 1);
            v22 = (DYMTLUsedResourceInfo *)((char *)v22 - 16);
            v20 = (DYMTLUsedResourceInfo *)((char *)v20 - 16);
          }
          while (v20 != begin);
          v20 = p_usedResources->__begin_;
        }
        end = (DYMTLUsedResourceInfo *)(v19 + 16);
        self->_usedResources.__begin_ = v22;
        self->_usedResources.__end_ = (DYMTLUsedResourceInfo *)(v19 + 16);
        self->_usedResources.__end_cap_.__value_ = (DYMTLUsedResourceInfo *)&v17[16 * v18];
        if (v20)
          operator delete(v20);
      }
      else
      {
        *(_QWORD *)end = a3[v9];
        *((_QWORD *)end + 1) = a5;
        end = (DYMTLUsedResourceInfo *)((char *)end + 16);
      }
      self->_usedResources.__end_ = end;
      ++v9;
    }
    while (v9 != a4);
  }
  -[MTLRenderCommandEncoderSPI useResources:count:usage:](self->_renderEncoder, "useResources:count:usage:", a3, a4, a5);
}

- (void)useHeap:(id)a3
{
  __end_ *v4;
  id *value;
  __end_cap_ **var0;
  __end_cap_ **v7;
  __end_ **begin;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  __end_ **v14;
  id *v15;
  __end_cap_ **v16;
  __end_ **v17;
  __end_ *v18;
  __end_ *v19;

  v4 = (__end_ *)a3;
  value = self->_usedHeaps.var1.__value_;
  var0 = self->_usedHeaps.var0;
  v19 = v4;
  if (var0 >= (__end_cap_ **)value)
  {
    begin = self->_usedHeaps.__begin_;
    v9 = var0 - begin;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
    v10 = (char *)value - (char *)begin;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&self->_usedHeaps.var1, v12);
    else
      v13 = 0;
    v14 = (__end_ **)&v13[8 * v9];
    v15 = (id *)&v13[8 * v12];
    *v14 = v19;
    v7 = v14 + 1;
    v17 = self->_usedHeaps.__begin_;
    v16 = self->_usedHeaps.var0;
    if (v16 != v17)
    {
      do
      {
        v18 = *--v16;
        *--v14 = v18;
      }
      while (v16 != v17);
      v16 = self->_usedHeaps.__begin_;
    }
    self->_usedHeaps.__begin_ = v14;
    self->_usedHeaps.var0 = v7;
    self->_usedHeaps.var1.__value_ = v15;
    if (v16)
      operator delete(v16);
    v4 = v19;
  }
  else
  {
    *var0 = v4;
    v7 = var0 + 1;
  }
  self->_usedHeaps.var0 = v7;
  -[MTLRenderCommandEncoderSPI useHeap:](self->_renderEncoder, "useHeap:", v4);

}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  vector<__unsafe_unretained id<MTLHeap>, std::allocator<__unsafe_unretained id<MTLHeap>>> *p_usedHeaps;
  __compressed_pair<__unsafe_unretained id<MTLHeap> *, std::allocator<__unsafe_unretained id<MTLHeap>>> *p_var1;
  __end_cap_ **var0;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  __end_ **v16;
  __end_cap_ **v17;
  __end_ **begin;
  __end_ *v19;

  if (a4)
  {
    v7 = 0;
    p_usedHeaps = &self->_usedHeaps;
    p_var1 = &self->_usedHeaps.var1;
    var0 = self->_usedHeaps.var0;
    do
    {
      if ((id *)var0 >= p_var1->__value_)
      {
        v11 = var0 - p_usedHeaps->__begin_;
        if ((unint64_t)(v11 + 1) >> 61)
          std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
        v12 = (char *)p_var1->__value_ - (char *)p_usedHeaps->__begin_;
        v13 = v12 >> 2;
        if (v12 >> 2 <= (unint64_t)(v11 + 1))
          v13 = v11 + 1;
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
          v14 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v14 = v13;
        if (v14)
          v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&self->_usedHeaps.var1, v14);
        else
          v15 = 0;
        v16 = (__end_ **)&v15[8 * v11];
        *v16 = (__end_ *)a3[v7];
        var0 = v16 + 1;
        begin = self->_usedHeaps.__begin_;
        v17 = self->_usedHeaps.var0;
        if (v17 != begin)
        {
          do
          {
            v19 = *--v17;
            *--v16 = v19;
          }
          while (v17 != begin);
          v17 = p_usedHeaps->__begin_;
        }
        self->_usedHeaps.__begin_ = v16;
        self->_usedHeaps.var0 = var0;
        self->_usedHeaps.var1.__value_ = (id *)&v15[8 * v14];
        if (v17)
          operator delete(v17);
      }
      else
      {
        *var0++ = (__end_cap_ *)a3[v7];
      }
      self->_usedHeaps.var0 = var0;
      ++v7;
    }
    while (v7 != a4);
  }
  -[MTLRenderCommandEncoderSPI useHeaps:count:](self->_renderEncoder, "useHeaps:count:", a3, a4);
}

- (void)setViewport:(id *)a3
{
  MTLRenderCommandEncoderSPI *renderEncoder;
  __int128 v6;
  _OWORD v7[3];

  std::vector<MTLViewport>::assign((char **)&self->_viewports, 1uLL, (__int128 *)a3);
  renderEncoder = self->_renderEncoder;
  v6 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->var4;
  -[MTLRenderCommandEncoderSPI setViewport:](renderEncoder, "setViewport:", v7);
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  char *p_viewports;
  __int128 v8[2];
  uint64_t v9;
  uint64_t v10;

  p_viewports = (char *)&self->_viewports;
  if (a3 && a4)
  {
    std::vector<MTLViewport>::__assign_with_size[abi:ne180100]<MTLViewport const*,MTLViewport const*>(p_viewports, (char *)a3, (uint64_t)&a3[a4], a4);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v9 = 0;
    v10 = 0x3FF0000000000000;
    std::vector<MTLViewport>::assign((char **)p_viewports, 1uLL, v8);
  }
  -[MTLRenderCommandEncoderSPI setViewports:count:](self->_renderEncoder, "setViewports:count:", a3, a4);
}

- (void)setFrontFacingWinding:(unint64_t)a3
{
  self->_frontFacingWinding = a3;
  -[MTLRenderCommandEncoderSPI setFrontFacingWinding:](self->_renderEncoder, "setFrontFacingWinding:");
}

- (void)setCullMode:(unint64_t)a3
{
  self->_cullMode = a3;
  -[MTLRenderCommandEncoderSPI setCullMode:](self->_renderEncoder, "setCullMode:");
}

- (void)setDepthClipMode:(unint64_t)a3
{
  self->_depthClipMode = a3;
  -[MTLRenderCommandEncoderSPI setDepthClipModeSPI:](self->_renderEncoder, "setDepthClipModeSPI:");
}

- (unint64_t)depthClipMode
{
  return self->_depthClipMode;
}

- (void)setLineWidth:(float)a3
{
  self->_lineWidth = a3;
  -[MTLRenderCommandEncoderSPI setLineWidth:](self->_renderEncoder, "setLineWidth:");
}

- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5
{
  self->_depthBias = a3;
  self->_depthBiasSlopeScale = a4;
  self->_depthBiasClamp = a5;
  -[MTLRenderCommandEncoderSPI setDepthBias:slopeScale:clamp:](self->_renderEncoder, "setDepthBias:slopeScale:clamp:");
}

- (float)depthBias
{
  return self->_depthBias;
}

- (float)depthBiasSlopeScale
{
  return self->_depthBiasSlopeScale;
}

- (float)depthBiasClamp
{
  return self->_depthBiasClamp;
}

- (void)setScissorRect:(id *)a3
{
  MTLRenderCommandEncoderSPI *renderEncoder;
  __int128 v6;
  _OWORD v7[2];

  std::vector<MTLScissorRect>::assign((char **)&self->_scissorRects, 1uLL, a3);
  renderEncoder = self->_renderEncoder;
  v6 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v6;
  -[MTLRenderCommandEncoderSPI setScissorRect:](renderEncoder, "setScissorRect:", v7);
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
  char *p_scissorRects;
  _OWORD v8[2];

  p_scissorRects = (char *)&self->_scissorRects;
  if (a3 && a4)
  {
    std::vector<MTLScissorRect>::__assign_with_size[abi:ne180100]<MTLScissorRect const*,MTLScissorRect const*>(p_scissorRects, (char *)a3, (uint64_t)&a3[a4], a4);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    std::vector<MTLScissorRect>::assign((char **)p_scissorRects, 1uLL, v8);
  }
  -[MTLRenderCommandEncoderSPI setScissorRects:count:](self->_renderEncoder, "setScissorRects:count:", a3, a4);
}

- (void)setVertexAmplificationMode:(unint64_t)a3 value:(unint64_t)a4
{
  self->_amplificationMode = a3;
  self->_amplificationValue = a4;
  self->_amplificationModeSet = 1;
  -[MTLRenderCommandEncoderSPI setVertexAmplificationMode:value:](self->_renderEncoder, "setVertexAmplificationMode:value:");
}

- (void)setTriangleFillMode:(unint64_t)a3
{
  self->_triangleFillMode = a3;
  -[MTLRenderCommandEncoderSPI setTriangleFillMode:](self->_renderEncoder, "setTriangleFillMode:");
}

- (void)setDepthStencilState:(id)a3
{
  self->_depthStencilState = (MTLDepthStencilState *)a3;
  -[MTLRenderCommandEncoderSPI setDepthStencilState:](self->_renderEncoder, "setDepthStencilState:");
}

- (id)depthStencilState
{
  return self->_depthStencilState;
}

- (void)setStencilReferenceValue:(unsigned int)a3
{
  self->_frontStencilRef = a3;
  self->_backStencilRef = a3;
  -[MTLRenderCommandEncoderSPI setStencilReferenceValue:](self->_renderEncoder, "setStencilReferenceValue:");
}

- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4
{
  self->_frontStencilRef = a3;
  self->_backStencilRef = a4;
  -[MTLRenderCommandEncoderSPI setStencilFrontReferenceValue:backReferenceValue:](self->_renderEncoder, "setStencilFrontReferenceValue:backReferenceValue:");
}

- (unsigned)frontReferenceValue
{
  return self->_frontStencilRef;
}

- (unsigned)backReferenceValue
{
  return self->_backStencilRef;
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v6;
  unint64_t *v7;

  v6 = a4;
  v7 = &v6;
  std::__hash_table<std::__hash_value_type<unsigned long,DYMTLStoreInfo>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,DYMTLStoreInfo>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,DYMTLStoreInfo>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,DYMTLStoreInfo>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t)&self->_colorStoreInfos, &v6, (uint64_t)&std::piecewise_construct, &v7)[3] = a3;
  -[MTLRenderCommandEncoderSPI setColorStoreAction:atIndex:](self->_renderEncoder, "setColorStoreAction:atIndex:", a3, v6);
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  self->_depthStoreInfo.action = a3;
  -[MTLRenderCommandEncoderSPI setDepthStoreAction:](self->_renderEncoder, "setDepthStoreAction:");
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  self->_stencilStoreInfo.action = a3;
  -[MTLRenderCommandEncoderSPI setStencilStoreAction:](self->_renderEncoder, "setStencilStoreAction:");
}

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v6;
  unint64_t *v7;

  v6 = a4;
  v7 = &v6;
  std::__hash_table<std::__hash_value_type<unsigned long,DYMTLStoreInfo>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,DYMTLStoreInfo>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,DYMTLStoreInfo>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,DYMTLStoreInfo>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t)&self->_colorStoreInfos, &v6, (uint64_t)&std::piecewise_construct, &v7)[4] = a3;
  -[MTLRenderCommandEncoderSPI setColorStoreActionOptions:atIndex:](self->_renderEncoder, "setColorStoreActionOptions:atIndex:", a3, v6);
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
  self->_depthStoreInfo.options = a3;
  -[MTLRenderCommandEncoderSPI setDepthStoreActionOptions:](self->_renderEncoder, "setDepthStoreActionOptions:");
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
  self->_stencilStoreInfo.options = a3;
  -[MTLRenderCommandEncoderSPI setStencilStoreActionOptions:](self->_renderEncoder, "setStencilStoreActionOptions:");
}

- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4
{
  self->_visibilityResultMode = a3;
  self->_visibilityResultOffset = a4;
  -[MTLRenderCommandEncoderSPI setVisibilityResultMode:offset:](self->_renderEncoder, "setVisibilityResultMode:offset:");
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  self->_blendColorRed = a3;
  self->_blendColorGreen = a4;
  self->_blendColorBlue = a5;
  self->_blendColorAlpha = a6;
  -[MTLRenderCommandEncoderSPI setBlendColorRed:green:blue:alpha:](self->_renderEncoder, "setBlendColorRed:green:blue:alpha:");
}

- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5
{
  self->_tessellationFactorSet = 1;
  self->_tessellationFactorBuffer = (MTLBuffer *)a3;
  self->_tessellationFactorBufferOffset = a4;
  self->_tessellationFactorBufferInstanceStride = a5;
  -[MTLRenderCommandEncoderSPI setTessellationFactorBuffer:offset:instanceStride:](self->_renderEncoder, "setTessellationFactorBuffer:offset:instanceStride:");
}

- (void)setTessellationFactorScale:(float)a3
{
  self->_tessellationFactorSet = 1;
  self->_tessellationFactorScale = a3;
  -[MTLRenderCommandEncoderSPI setTessellationFactorScale:](self->_renderEncoder, "setTessellationFactorScale:");
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v8;
  vector<MTLVertexAmplificationViewMapping, std::allocator<MTLVertexAmplificationViewMapping>> *p_amplificationViewMappings;
  __compressed_pair<MTLVertexAmplificationViewMapping *, std::allocator<MTLVertexAmplificationViewMapping>> *p_end_cap;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v18;
  uint64_t v19;

  self->_amplificationCountSet = 1;
  self->_amplificationCount = a3;
  begin = self->_amplificationViewMappings.__begin_;
  self->_amplificationViewMappings.__end_ = begin;
  if (a4 && a3)
  {
    v8 = 0;
    p_amplificationViewMappings = &self->_amplificationViewMappings;
    p_end_cap = &self->_amplificationViewMappings.__end_cap_;
    do
    {
      if (begin >= p_end_cap->__value_)
      {
        v11 = (begin - p_amplificationViewMappings->__begin_) >> 3;
        if ((unint64_t)(v11 + 1) >> 61)
          std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
        v12 = p_end_cap->__value_ - p_amplificationViewMappings->__begin_;
        v13 = v12 >> 2;
        if (v12 >> 2 <= (unint64_t)(v11 + 1))
          v13 = v11 + 1;
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
          v14 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v14 = v13;
        if (v14)
          v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&self->_amplificationViewMappings.__end_cap_, v14);
        else
          v15 = 0;
        v16 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v15[8 * v11];
        *($85CD2974BE96D4886BB301820D1C36C2 *)v16 = a4[v8];
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v16 + 8);
        end = self->_amplificationViewMappings.__end_;
        v18 = self->_amplificationViewMappings.__begin_;
        if (end != v18)
        {
          do
          {
            v19 = *((_QWORD *)end - 1);
            end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 8);
            *((_QWORD *)v16 - 1) = v19;
            v16 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v16 - 8);
          }
          while (end != v18);
          end = p_amplificationViewMappings->__begin_;
        }
        self->_amplificationViewMappings.__begin_ = v16;
        self->_amplificationViewMappings.__end_ = begin;
        self->_amplificationViewMappings.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v15[8 * v14];
        if (end)
          operator delete(end);
      }
      else
      {
        *($85CD2974BE96D4886BB301820D1C36C2 *)begin = a4[v8];
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 8);
      }
      self->_amplificationViewMappings.__end_ = begin;
      ++v8;
    }
    while (v8 != a3);
  }
  -[MTLRenderCommandEncoderSPI setVertexAmplificationCount:viewMappings:](self->_renderEncoder, "setVertexAmplificationCount:viewMappings:", a3, a4);
}

- (void)_applyHeapsAndResourcesToEncoder:(id)a3
{
  __end_ **begin;
  __end_cap_ **var0;
  __end_ *v6;
  DYMTLUsedResourceInfo *end;
  DYMTLUsedResourceInfo *v8;
  id v9;

  v9 = a3;
  begin = self->_usedHeaps.__begin_;
  var0 = self->_usedHeaps.var0;
  while (begin != var0)
  {
    v6 = *begin;
    objc_msgSend(v9, "useHeap:", v6);

    ++begin;
  }
  v8 = self->_usedResources.__begin_;
  end = self->_usedResources.__end_;
  while (v8 != end)
  {
    objc_msgSend(v9, "useResource:usage:", *(_QWORD *)v8, *((_QWORD *)v8 + 1));
    v8 = (DYMTLUsedResourceInfo *)((char *)v8 + 16);
  }

}

- (void)_applyVertexStateToEncoder:(id)a3 rawBytesBlock:(id)a4
{
  id v6;
  id v7;
  double v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setViewports:count:");
  objc_msgSend(v6, "setScissorRects:count:");
  objc_msgSend(v6, "setFrontFacingWinding:", self->_frontFacingWinding);
  objc_msgSend(v6, "setCullMode:", self->_cullMode);
  if (self->_amplificationModeSet)
    objc_msgSend(v6, "setVertexAmplificationMode:value:", self->_amplificationMode, self->_amplificationValue);
  if (self->_amplificationCountSet)
  {
    if (self->_amplificationViewMappings.__begin_ == self->_amplificationViewMappings.__end_)
      begin = 0;
    else
      begin = self->_amplificationViewMappings.__begin_;
    objc_msgSend(v6, "setVertexAmplificationCount:viewMappings:", self->_amplificationCount, begin);
  }
  if (self->_tessellationFactorSet)
  {
    *(float *)&v8 = self->_tessellationFactorScale;
    objc_msgSend(v6, "setTessellationFactorScale:", v8);
    objc_msgSend(v6, "setTessellationFactorBuffer:offset:instanceStride:", self->_tessellationFactorBuffer, self->_tessellationFactorBufferOffset, self->_tessellationFactorBufferInstanceStride);
  }
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __82__DYMTLRenderCommandEncoderStateTracker__applyVertexStateToEncoder_rawBytesBlock___block_invoke;
  v19[3] = &unk_250D6FB28;
  v11 = v7;
  v21 = v11;
  v12 = v6;
  v20 = v12;
  -[DYMTLRenderCommandEncoderStateTracker enumerateVertexBuffersUsingBlock:](self, "enumerateVertexBuffersUsingBlock:", v19);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __82__DYMTLRenderCommandEncoderStateTracker__applyVertexStateToEncoder_rawBytesBlock___block_invoke_2;
  v17[3] = &unk_250D6F5C0;
  v13 = v12;
  v18 = v13;
  -[DYMTLRenderCommandEncoderStateTracker enumerateVertexTexturesUsingBlock:](self, "enumerateVertexTexturesUsingBlock:", v17);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __82__DYMTLRenderCommandEncoderStateTracker__applyVertexStateToEncoder_rawBytesBlock___block_invoke_3;
  v15[3] = &unk_250D6FB50;
  v14 = v13;
  v16 = v14;
  -[DYMTLRenderCommandEncoderStateTracker enumerateVertexSamplersUsingBlock:](self, "enumerateVertexSamplersUsingBlock:", v15);

}

void __82__DYMTLRenderCommandEncoderStateTracker__applyVertexStateToEncoder_rawBytesBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (*(_QWORD *)a2 || !*(_QWORD *)(a2 + 8))
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(id *)a2;
    if (*(_QWORD *)a2 && !*(_QWORD *)(a2 + 8))
      v8 = *(_QWORD *)(a2 + 16);
    else
      v8 = 0;
    v11 = v7;
    objc_msgSend(v6, "setVertexBuffer:offset:atIndex:", v7, v8, a3);

  }
  else
  {
    v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (*(_QWORD *)a2 || !*(_QWORD *)(a2 + 8))
      v10 = 0;
    else
      v10 = *(_QWORD *)(a2 + 16);
    objc_msgSend(*(id *)(a1 + 32), "setVertexBytes:length:atIndex:", v9, v10, a3);
  }
}

uint64_t __82__DYMTLRenderCommandEncoderStateTracker__applyVertexStateToEncoder_rawBytesBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVertexTexture:atIndex:", a2, a3);
}

uint64_t __82__DYMTLRenderCommandEncoderStateTracker__applyVertexStateToEncoder_rawBytesBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  LODWORD(a4) = *(_DWORD *)(a2 + 8);
  LODWORD(a5) = *(_DWORD *)(a2 + 12);
  return objc_msgSend(*(id *)(a1 + 32), "setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:", *(_QWORD *)a2, a3, a4, a5);
}

- (void)_applyFragmentStateToEncoder:(id)a3 rawBytesBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __84__DYMTLRenderCommandEncoderStateTracker__applyFragmentStateToEncoder_rawBytesBlock___block_invoke;
  v17[3] = &unk_250D6FB28;
  v9 = v7;
  v19 = v9;
  v10 = v6;
  v18 = v10;
  -[DYMTLRenderCommandEncoderStateTracker enumerateFragmentBuffersUsingBlock:](self, "enumerateFragmentBuffersUsingBlock:", v17);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __84__DYMTLRenderCommandEncoderStateTracker__applyFragmentStateToEncoder_rawBytesBlock___block_invoke_2;
  v15[3] = &unk_250D6F5C0;
  v11 = v10;
  v16 = v11;
  -[DYMTLRenderCommandEncoderStateTracker enumerateFragmentTexturesUsingBlock:](self, "enumerateFragmentTexturesUsingBlock:", v15);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __84__DYMTLRenderCommandEncoderStateTracker__applyFragmentStateToEncoder_rawBytesBlock___block_invoke_3;
  v13[3] = &unk_250D6FB50;
  v12 = v11;
  v14 = v12;
  -[DYMTLRenderCommandEncoderStateTracker enumerateFragmentSamplersUsingBlock:](self, "enumerateFragmentSamplersUsingBlock:", v13);

}

void __84__DYMTLRenderCommandEncoderStateTracker__applyFragmentStateToEncoder_rawBytesBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (*(_QWORD *)a2 || !*(_QWORD *)(a2 + 8))
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(id *)a2;
    if (*(_QWORD *)a2 && !*(_QWORD *)(a2 + 8))
      v8 = *(_QWORD *)(a2 + 16);
    else
      v8 = 0;
    v11 = v7;
    objc_msgSend(v6, "setFragmentBuffer:offset:atIndex:", v7, v8, a3);

  }
  else
  {
    v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (*(_QWORD *)a2 || !*(_QWORD *)(a2 + 8))
      v10 = 0;
    else
      v10 = *(_QWORD *)(a2 + 16);
    objc_msgSend(*(id *)(a1 + 32), "setFragmentBytes:length:atIndex:", v9, v10, a3);
  }
}

uint64_t __84__DYMTLRenderCommandEncoderStateTracker__applyFragmentStateToEncoder_rawBytesBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFragmentTexture:atIndex:", a2, a3);
}

uint64_t __84__DYMTLRenderCommandEncoderStateTracker__applyFragmentStateToEncoder_rawBytesBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  LODWORD(a4) = *(_DWORD *)(a2 + 8);
  LODWORD(a5) = *(_DWORD *)(a2 + 12);
  return objc_msgSend(*(id *)(a1 + 32), "setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:", *(_QWORD *)a2, a3, a4, a5);
}

- (void)applyVertexStateToEncoder:(id)a3 rawBytesBlock:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[DYMTLRenderCommandEncoderStateTracker _applyHeapsAndResourcesToEncoder:](self, "_applyHeapsAndResourcesToEncoder:", v7);
  -[DYMTLRenderCommandEncoderStateTracker _applyVertexStateToEncoder:rawBytesBlock:](self, "_applyVertexStateToEncoder:rawBytesBlock:", v7, v6);

}

- (void)applyVertexFragmentStateToEncoder:(id)a3 rawBytesBlock:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[DYMTLRenderCommandEncoderStateTracker _applyHeapsAndResourcesToEncoder:](self, "_applyHeapsAndResourcesToEncoder:", v7);
  -[DYMTLRenderCommandEncoderStateTracker _applyVertexStateToEncoder:rawBytesBlock:](self, "_applyVertexStateToEncoder:rawBytesBlock:", v7, v6);
  -[DYMTLRenderCommandEncoderStateTracker _applyFragmentStateToEncoder:rawBytesBlock:](self, "_applyFragmentStateToEncoder:rawBytesBlock:", v7, v6);

}

- (void)applyAllStateToEncoder:(id)a3 rawBytesBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  if (self->_renderPipelineState)
    objc_msgSend(v6, "setRenderPipelineState:");
  -[DYMTLRenderCommandEncoderStateTracker _applyHeapsAndResourcesToEncoder:](self, "_applyHeapsAndResourcesToEncoder:", v6);
  -[DYMTLRenderCommandEncoderStateTracker _applyVertexStateToEncoder:rawBytesBlock:](self, "_applyVertexStateToEncoder:rawBytesBlock:", v6, v7);
  -[DYMTLRenderCommandEncoderStateTracker _applyFragmentStateToEncoder:rawBytesBlock:](self, "_applyFragmentStateToEncoder:rawBytesBlock:", v6, v7);
  v8 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __78__DYMTLRenderCommandEncoderStateTracker_applyAllStateToEncoder_rawBytesBlock___block_invoke;
  v27[3] = &unk_250D6FB28;
  v9 = v7;
  v29 = v9;
  v10 = v6;
  v28 = v10;
  -[DYMTLRenderCommandEncoderStateTracker enumerateTileBuffersUsingBlock:](self, "enumerateTileBuffersUsingBlock:", v27);
  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __78__DYMTLRenderCommandEncoderStateTracker_applyAllStateToEncoder_rawBytesBlock___block_invoke_2;
  v25[3] = &unk_250D6F5C0;
  v11 = v10;
  v26 = v11;
  -[DYMTLRenderCommandEncoderStateTracker enumerateTileTexturesUsingBlock:](self, "enumerateTileTexturesUsingBlock:", v25);
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __78__DYMTLRenderCommandEncoderStateTracker_applyAllStateToEncoder_rawBytesBlock___block_invoke_3;
  v23[3] = &unk_250D6FB50;
  v12 = v11;
  v24 = v12;
  -[DYMTLRenderCommandEncoderStateTracker enumerateTileSamplersUsingBlock:](self, "enumerateTileSamplersUsingBlock:", v23);
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __78__DYMTLRenderCommandEncoderStateTracker_applyAllStateToEncoder_rawBytesBlock___block_invoke_4;
  v21[3] = &unk_250D6FBE8;
  v13 = v12;
  v22 = v13;
  -[DYMTLRenderCommandEncoderStateTracker enumerateThreadgroupMemoryUsingBlock:](self, "enumerateThreadgroupMemoryUsingBlock:", v21);
  if (self->_depthStencilState)
    objc_msgSend(v13, "setDepthStencilState:");
  *(float *)&v14 = self->_blendColorRed;
  *(float *)&v15 = self->_blendColorGreen;
  *(float *)&v16 = self->_blendColorBlue;
  *(float *)&v17 = self->_blendColorAlpha;
  objc_msgSend(v13, "setBlendColorRed:green:blue:alpha:", v14, v15, v16, v17);
  objc_msgSend(v13, "setDepthClipMode:", self->_depthClipMode);
  *(float *)&v18 = self->_depthBias;
  *(float *)&v19 = self->_depthBiasSlopeScale;
  *(float *)&v20 = self->_depthBiasClamp;
  objc_msgSend(v13, "setDepthBias:slopeScale:clamp:", v18, v19, v20);
  objc_msgSend(v13, "setStencilFrontReferenceValue:backReferenceValue:", self->_frontStencilRef, self->_backStencilRef);
  objc_msgSend(v13, "setTriangleFillMode:", self->_triangleFillMode);
  objc_msgSend(v13, "setVisibilityResultMode:offset:", self->_visibilityResultMode, self->_visibilityResultOffset);

}

void __78__DYMTLRenderCommandEncoderStateTracker_applyAllStateToEncoder_rawBytesBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (*(_QWORD *)a2 || !*(_QWORD *)(a2 + 8))
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(id *)a2;
    if (*(_QWORD *)a2 && !*(_QWORD *)(a2 + 8))
      v8 = *(_QWORD *)(a2 + 16);
    else
      v8 = 0;
    v11 = v7;
    objc_msgSend(v6, "setTileBuffer:offset:atIndex:", v7, v8, a3);

  }
  else
  {
    v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (*(_QWORD *)a2 || !*(_QWORD *)(a2 + 8))
      v10 = 0;
    else
      v10 = *(_QWORD *)(a2 + 16);
    objc_msgSend(*(id *)(a1 + 32), "setTileBytes:length:atIndex:", v9, v10, a3);
  }
}

uint64_t __78__DYMTLRenderCommandEncoderStateTracker_applyAllStateToEncoder_rawBytesBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTileTexture:atIndex:", a2, a3);
}

uint64_t __78__DYMTLRenderCommandEncoderStateTracker_applyAllStateToEncoder_rawBytesBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  LODWORD(a4) = *(_DWORD *)(a2 + 8);
  LODWORD(a5) = *(_DWORD *)(a2 + 12);
  return objc_msgSend(*(id *)(a1 + 32), "setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:", *(_QWORD *)a2, a3, a4, a5);
}

uint64_t __78__DYMTLRenderCommandEncoderStateTracker_applyAllStateToEncoder_rawBytesBlock___block_invoke_4(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setThreadgroupMemoryLength:offset:atIndex:", *a2, a2[1], a3);
}

- (void)enumerateVertexBuffersUsingBlock:(id)a3
{
  enumerateObjects(&self->_vertexBuffers[0].m_buffer, a3);
}

- (void)enumerateVertexTexturesUsingBlock:(id)a3
{
  enumerateObjects((uint64_t)self->_vertexTextures, a3);
}

- (void)enumerateVertexSamplersUsingBlock:(id)a3
{
  enumerateObjects(&self->_vertexSamplers[0].sampler, a3);
}

- (void)enumerateFragmentBuffersUsingBlock:(id)a3
{
  enumerateObjects(&self->_fragmentBuffers[0].m_buffer, a3);
}

- (void)enumerateFragmentTexturesUsingBlock:(id)a3
{
  enumerateObjects((uint64_t)self->_fragmentTextures, a3);
}

- (void)enumerateFragmentSamplersUsingBlock:(id)a3
{
  enumerateObjects(&self->_fragmentSamplers[0].sampler, a3);
}

- (void)enumerateTileBuffersUsingBlock:(id)a3
{
  enumerateObjects(&self->_tileBuffers[0].m_buffer, a3);
}

- (void)enumerateTileTexturesUsingBlock:(id)a3
{
  enumerateObjects((uint64_t)self->_tileTextures, a3);
}

- (void)enumerateTileSamplersUsingBlock:(id)a3
{
  enumerateObjects(&self->_tileSamplers[0].sampler, a3);
}

- (void)enumerateThreadgroupMemoryUsingBlock:(id)a3
{
  void (**v4)(id, DYMTLThreadgroupMemoryInfo *, unint64_t, _BYTE *);
  unint64_t v5;
  DYMTLThreadgroupMemoryInfo *i;
  BOOL v7;
  char v8;

  v4 = (void (**)(id, DYMTLThreadgroupMemoryInfo *, unint64_t, _BYTE *))a3;
  v5 = 0;
  v8 = 0;
  for (i = self->_threadgroupMemories; !i->length; ++i)
  {
    if (v5 > 0x1D)
      goto LABEL_11;
LABEL_10:
    ++v5;
  }
  v4[2](v4, i, v5, &v8);
  if (v8)
    v7 = 1;
  else
    v7 = v5 >= 0x1E;
  if (!v7)
    goto LABEL_10;
LABEL_11:

}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (vector<MTLViewport,)viewports
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<MTLViewport, std::allocator<MTLViewport>> *)std::vector<MTLViewport>::__init_with_size[abi:ne180100]<MTLViewport*,MTLViewport*>(retstr, self->_viewports.__begin_, (uint64_t)self->_viewports.__end_, 0xAAAAAAAAAAAAAAABLL* ((self->_viewports.__end_ - self->_viewports.__begin_) >> 4));
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v4;
  unint64_t i;
  unint64_t j;
  uint64_t v7;
  DYMTLUsedResourceInfo *v8;
  __end_ **v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;

  begin = self->_viewports.__begin_;
  if (begin)
  {
    self->_viewports.__end_ = begin;
    operator delete(begin);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_colorStoreInfos);
  v4 = self->_amplificationViewMappings.__begin_;
  if (v4)
  {
    self->_amplificationViewMappings.__end_ = v4;
    operator delete(v4);
  }
  for (i = 0; i != -744; i -= 24)
  {
    free(self->_tileBuffers[i / 0x18 + 30].m_bytes);

  }
  for (j = 0; j != -744; j -= 24)
  {
    free(self->_fragmentBuffers[j / 0x18 + 30].m_bytes);

  }
  v7 = 744;
  do
  {
    free(*(void **)((char *)&self->_usedResources.__end_ + v7));

    v7 -= 24;
  }
  while (v7);
  v8 = self->_usedResources.__begin_;
  if (v8)
  {
    self->_usedResources.__end_ = v8;
    operator delete(v8);
  }
  v9 = self->_usedHeaps.__begin_;
  if (v9)
  {
    self->_usedHeaps.var0 = v9;
    operator delete(v9);
  }
  v10 = self->_scissorRects.__begin_;
  if (v10)
  {
    self->_scissorRects.__end_ = v10;
    operator delete(v10);
  }
  objc_storeStrong((id *)&self->_renderEncoder, 0);
}

- (id).cxx_construct
{
  vector<__unsafe_unretained id<MTLHeap>, std::allocator<__unsafe_unretained id<MTLHeap>>> *p_usedHeaps;

  self->_scissorRects.__end_cap_.__value_ = 0;
  *(_OWORD *)&self->_scissorRects.__begin_ = 0u;
  p_usedHeaps = &self->_usedHeaps;
  bzero(self->_fragmentBuffers, 0x2E8uLL);
  bzero(self->_tileBuffers, 0x2E8uLL);
  self->_amplificationViewMappings.__end_cap_.__value_ = 0;
  *(_OWORD *)&self->_amplificationViewMappings.__begin_ = 0u;
  self->_colorStoreInfos.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_colorStoreInfos.__table_.__p1_.__value_.__next_ = 0u;
  bzero(p_usedHeaps, 0x318uLL);
  self->_colorStoreInfos.__table_.__p3_.__value_ = 1.0;
  self->_viewports.__begin_ = 0;
  self->_viewports.__end_cap_.__value_ = 0;
  self->_viewports.__end_ = 0;
  return self;
}

@end
